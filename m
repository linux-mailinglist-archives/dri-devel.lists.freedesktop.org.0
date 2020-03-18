Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12850189D49
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 14:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38ECD6E8F3;
	Wed, 18 Mar 2020 13:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4376E6E8F3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 13:49:13 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g62so3448846wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 06:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=nhjSzraoBOeWPVT3LQo7Ng/qwFROJg9Ku7xc0QPbKjI=;
 b=jJIEU+TNBKOQ4016fYVaddPzkMst3rQ/3p4Xx3wFIZf72OaeRdXqtmSGdKlWghdzNC
 VpteDO5ULaAuOLTMOG3h73tSIo+42mAS/8SC2fcV9B1nVUpFMsICMGHTsKjANBqMSymI
 vUdJNQpr3MUfg1nQcTUJV3WCigBgClEDXWlLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=nhjSzraoBOeWPVT3LQo7Ng/qwFROJg9Ku7xc0QPbKjI=;
 b=TGS+L2sdQodq9HgN8RRhWGf465YT8MClaPb2eIlgF2YrxkFJ/EakZz/H7b6wupEfeT
 AarqzfAFCkxlBQXzPysB+rODLOD5IMD6mz3UOJ3l6JPOaQ853vP8U3cBCe/9dVqPj4gA
 wWvfKj71F7NX5y1LXDQOtC7wq4A9PYx4V5fhOvIJbhXz2ZZ1KlivtBBKhk0NP9Y0vr7R
 H5qRAyE9TheBIbhtlOqGOiVYUWzLC2FGmqGYUrQS9X8u0syteMunhAF0gOtp5syf5UbJ
 1ozKI/KSO8Ko+1UvsnHSXW+W69ahBY+1VGvAoyR7x553PJEynSaEoVb65Pf/b0nA+QLl
 FwSQ==
X-Gm-Message-State: ANhLgQ0bnoyUDAptUhPYrEppzWH6GLLIeCQxdpPsEPvm099/5OTOgtRl
 3USFe2qPCuUksGvl4LAQp142yQ==
X-Google-Smtp-Source: ADFU+vs5ilQvxkbVvgYWAdqliMhxQa+MQFIS4q+2x/7fT0/rVzc8bp98oG9vOKtAIrgiSeNYnlDm7g==
X-Received: by 2002:a1c:a950:: with SMTP id s77mr5281804wme.176.1584539351962; 
 Wed, 18 Mar 2020 06:49:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t1sm9719981wrq.36.2020.03.18.06.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 06:49:10 -0700 (PDT)
Date: Wed, 18 Mar 2020 14:49:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 1/3] drm: drm_vm: Use fallthrough;
Message-ID: <20200318134909.GW2363188@phenom.ffwll.local>
Mail-Followup-To: Joe Perches <joe@perches.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <cover.1584040050.git.joe@perches.com>
 <398db73cdc8a584fd7f34f5013c04df13ba90f64.1584040050.git.joe@perches.com>
 <20200317164806.GO2363188@phenom.ffwll.local>
 <623eb1bc61951ed3c68a9224b9aa99a25e763913.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <623eb1bc61951ed3c68a9224b9aa99a25e763913.camel@perches.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 03:13:29PM -0700, Joe Perches wrote:
> On Tue, 2020-03-17 at 17:48 +0100, Daniel Vetter wrote:
> > On Thu, Mar 12, 2020 at 12:17:12PM -0700, Joe Perches wrote:
> > > Convert /* fallthrough */ style comments to fallthrough;
> > > 
> > > Convert the various uses of fallthrough comments to fallthrough;
> > > 
> > > Done via script
> > > Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe@perches.com/
> > > 
> > > And by hand:
> > > 
> > > This file has a fallthrough comment outside of an #ifdef block
> > > that causes gcc to emit a warning if converted in-place.
> > > 
> > > So move the new fallthrough; inside the containing #ifdef/#endif too.
> > > 
> > > Signed-off-by: Joe Perches <joe@perches.com>
> > 
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > I'm assuming this all lands through a special pull? Or should I apply
> > this?
> 
> Hi Daniel.
> 
> I think you should apply this.
> 
> The idea here is to allow a scripted conversion at some
> point and this patch is necessary to avoid new compiler
> warnings after running the script.

Ok, put into the queue but missed the 5.7 feature freeze for drm so 5.8
probably.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
