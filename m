Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940013E5897
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 12:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9FF89FF9;
	Tue, 10 Aug 2021 10:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49E989FF9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 10:50:59 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r6so3393660wrt.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 03:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=UjcQ833lT/aJptZfrw9hQKL4FPcGR8PiWebdUPXSJeU=;
 b=QLICahorFCqZb0nwa/xfPxgp+SwqjwsduDVvp68ONCB2q6tuwCIRyOGTql2Nk/jdXu
 cGzQbkIuCSFKMAt4wQMY8EJCFiX0yc7BbbCuEytkC1Du4B4JKGFLqwBQk1hkkxo9bPfT
 tHGsUQO7bOG8O/l4hizs6CK9uhwNwkobBYvbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=UjcQ833lT/aJptZfrw9hQKL4FPcGR8PiWebdUPXSJeU=;
 b=OzIC8Ol0pEBr2nbVw0R87LmdTs7E9/WoKAHQn6qKNdE5ETY5yYU45z1+DV+aer99Dw
 i3lEcFWt39Eel14VHaqYBE9YveM71elWkd2SFXZI8S5AEeK4g54ZmZ5ztFF1VdZY+qY4
 uVzEaMTJpyEyNm0S5nsDvqzu8CY1k5OShqWJv+xYzdfU6tSjxT10FB/LF8V3SmrBTWyL
 3Jw4bm2z7kgTZ16+EMnJ7r2bS/DRDAGgw7Rszio51+mKxTCXvbMEjGobamufzWk1noaJ
 EZqAF+py5g8Wslia42fc3emv6dp8oRA6TZTeyIlEo46TiqOn1bEe+yZe7A+T5EBsyoao
 ek7A==
X-Gm-Message-State: AOAM530vROBd0PoHvlfnVOLsX1idMFboFOAYe7h/hebWnro08EEHprq/
 6iwXxJI+3YNynoKqVy3rFGG/bQ==
X-Google-Smtp-Source: ABdhPJwadDDSepM4dFIctzwo2oVmdlLip3FAYIKQ7XOeRTJbsc/eSjnn053RxVvmreoH9uiYszl70Q==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr30300055wry.241.1628592658369; 
 Tue, 10 Aug 2021 03:50:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x9sm2432255wmj.41.2021.08.10.03.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 03:50:57 -0700 (PDT)
Date: Tue, 10 Aug 2021 12:50:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm tree
Message-ID: <YRJaD51xR8rQ2ga+@phenom.ffwll.local>
Mail-Followup-To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210603193242.1ce99344@canb.auug.org.au>
 <20210708122048.534c1c4d@canb.auug.org.au>
 <20210810192636.625220ae@canb.auug.org.au>
 <YRJRju/zo5YiF1EB@phenom.ffwll.local>
 <20210810203859.128649fc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810203859.128649fc@canb.auug.org.au>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 10, 2021 at 08:38:59PM +1000, Stephen Rothwell wrote:
> Hi Daniel,
> 
> On Tue, 10 Aug 2021 12:14:38 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > Matt Auld is on vacation, and the other issue is that the tree where this
> > is from isn't in linux-next. So will take a bit to get sorted in
> > linux-next.
> 
> Those warnings are now coming from Linus' tree (some time before
> v5.14-rc1).  I first mentioned them on June 3.

Uh that's not good, I missed that. I'll look into it.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
