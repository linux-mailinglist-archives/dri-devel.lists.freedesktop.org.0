Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 741A244AA63
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 10:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D8789ECD;
	Tue,  9 Nov 2021 09:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4C989ECD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 09:16:30 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so1725688wme.4
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 01:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yjma5mRrb82FaHeqwEGkttg2XiFg5zhxGRY3Wmkbjxk=;
 b=fKFTVCySyPMePSh7mhupGnzSoJoGvjq1KyxBEzABecEN+XHEN+WMQOhWsEzkGtRmid
 9iqVwP//G3abSfqk+rIgkTn5yXuk0Mo3f5OlFYwtq9LaFWTjU8N9nNL55Cz3Nf/+UZuI
 ZcQxS2ta7waGRCAMMNIigaBfF2L2we8y7YaxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Yjma5mRrb82FaHeqwEGkttg2XiFg5zhxGRY3Wmkbjxk=;
 b=PFuCUja8QVvuC4mVmj7PXB9iAN2ebjwHlMMWIR58NAs18CRWJQRkgCosPp/qViQMjS
 4frBLqPU+dosiI1tildGu/DHALsYSc/oxBUGuLs7r3jeHMI2vOYC9NVr4okxbn4h19FJ
 LWEp7MtFpT/58GdTTjez9dwS0TyuUppf8Qezvc57jEosSzRlsUKESSdExvnHeOJrZ/E8
 +KpijAlUqsuugwxLQzk/TbsaWtbEnxJvwtITMozSGyZljvMI2CN6KpqLCWbUDvwHhz+H
 rNXuGgEXi4nPwXy8HB7XY6zD37MMY7QwkIUpVCZLW27L3pzHuAW+AL6Gd87irdk/MzaG
 h2+A==
X-Gm-Message-State: AOAM530DpatrU5qFfyawWDSji02W2PyflPstNS9T295gTsBNLT66whaU
 w8rjl3TOI7j/sEmmUfKaJEGahg==
X-Google-Smtp-Source: ABdhPJz7q+uhfnvfEH4DwVgZJaCEKFC1hKgEx5TjbsATOUhrI19DS7lgDXeUqtwj6dIwUW3QWcXnJA==
X-Received: by 2002:a05:600c:3b83:: with SMTP id
 n3mr5338933wms.116.1636449389206; 
 Tue, 09 Nov 2021 01:16:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h13sm19842564wrx.82.2021.11.09.01.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:16:28 -0800 (PST)
Date: Tue, 9 Nov 2021 10:16:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <YYo8axRhW/zFQUgW@phenom.ffwll.local>
Mail-Followup-To: Jani Nikula <jani.nikula@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Dave Airlie <airlied@linux.ie>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20211015202648.258445ef@canb.auug.org.au>
 <20211101194223.749197c5@canb.auug.org.au>
 <20211105171517.287de894@canb.auug.org.au>
 <874k8qampc.fsf@intel.com>
 <20211106133314.42e3e308@canb.auug.org.au>
 <87zgqd6alj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zgqd6alj.fsf@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 09, 2021 at 09:40:08AM +0200, Jani Nikula wrote:
> On Sat, 06 Nov 2021, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi Jani,
> >
> > On Fri, 05 Nov 2021 13:03:43 +0200 Jani Nikula <jani.nikula@intel.com> wrote:
> >>
> >> I probably should have pushed c4f08d7246a5 ("drm/locking: fix
> >> __stack_depot_* name conflict") to drm-misc-next-fixes.
> >
> > Please do so as builds will start failing otherwise :-(
> 
> Thomas/Maxime/Maarten, okay to cherry-pick that to drm-misc-next-fixes?

Yeah just do, for drm-misc this is considered in committer purview. I
think we should add a section to the docs about "What if a patch is in the
wrong branch" which tells you to just cherry-pick -x or whatever.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
