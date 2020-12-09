Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3712D4640
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 17:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A696EAAF;
	Wed,  9 Dec 2020 16:02:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF326EAAF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 16:02:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r3so2318585wrt.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 08:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZKOe4AxfqejHccFNm4tLx3gKa6m89ZjEB1i4VwqxF4s=;
 b=hoGXoljlW/rLYRzkS991gVHj3AveO35nPMM6OR9UITeE6MRF6Iucg/XhH0/763HTEC
 c4e+3FIo+PRHugahPtn3W+7Vb/xV/ZzK09HPRyF31sane9nU1TDrd77Y8t+EOjlbe4WN
 POz9YamO+/Y0h2yUDh9PRyfDSkmnWLJ32SvwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZKOe4AxfqejHccFNm4tLx3gKa6m89ZjEB1i4VwqxF4s=;
 b=oAjh0ZE5unBi6jU/Z5mvGFkvg8TAgnkG6dXQ1VjRV5cuofS7PCRNFQUECIBELOIHsY
 78/zEMmNnwJdGSJEUHUcpuLY26YlSMqXsUg2TilyTDVHLtxCtnvPFhP18TSaoyphnAtt
 jWCXlG4wNCo/StOAgXidvba23Z3Zsrx/JFN9YwkTlGkovbBGQU/hBWrWR52Vouwo+L4S
 5+IoXo4I+2ONY0IfRpCscpnXvjY+e17eLRxzE7c4S3UEHIO8bflkkKANtd4Z7B1EF7Eq
 oFjDkD5qUCoeo7A2A/PZX33nL9RB7q6nk3vzoVB4o2cR/MlskD93DOpx3DbmrrSrXpkw
 PLiw==
X-Gm-Message-State: AOAM530RgGi9Bhv9dPPkXqOx89RfYVIk3c/2G9sJa53SR4qpf1spwalC
 6eU7njkQPVqGb5FsdCrP3C5eApMcecm0Fg==
X-Google-Smtp-Source: ABdhPJyC2PxoenSSNG4DBLyAtOVYkhmypizreMw+9v42t7Wxq04IIlYuYRa9dq6fyVCXmbCael7FXA==
X-Received: by 2002:adf:9144:: with SMTP id j62mr3451218wrj.419.1607529745992; 
 Wed, 09 Dec 2020 08:02:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c9sm4592073wrn.65.2020.12.09.08.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 08:02:25 -0800 (PST)
Date: Wed, 9 Dec 2020 17:02:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: rework description of primary and cursor planes
Message-ID: <20201209160223.GT401619@phenom.ffwll.local>
References: <wrDqxEGdxtotWKrfQH8W8tl2Z8JgdHzUs3wuTth4@cp4-web-027.plabs.ch>
 <20201209004223.GL401619@phenom.ffwll.local>
 <0zedd9O9Bp0DfEH26xBTGvZtqA5bdE2EJDN3z5TXiDIyiwfTnRapgDy69MjAlhMWrzqKTzoYwovpGANNhp1PmneSCrm-xzw9DIeauv1SkgM=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0zedd9O9Bp0DfEH26xBTGvZtqA5bdE2EJDN3z5TXiDIyiwfTnRapgDy69MjAlhMWrzqKTzoYwovpGANNhp1PmneSCrm-xzw9DIeauv1SkgM=@emersion.fr>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 09, 2020 at 03:58:17PM +0000, Simon Ser wrote:
> Thanks for the review!
> 
> On Wednesday, December 9th, 2020 at 1:42 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > I think maybe a follow up patch should document how userspace should
> > figure out how to line up the primary planes with the right crtcs (if it
> > wishes to know that information, it's not super useful aside from probably
> > good choice for a fullscreen fallback plane). See my reply on the old
> > thread.
> 
> Yeah, as I've already replied, I won't volunteer to document legacy bits,
> documenting atomic is already enough. :P

This is also somewhat useful as a hint for atomic userspace.

> > And that patch should also add the code to drm_mode_config_validate() to
> > validate the possible_crtc masks for these. Something like
> >
> > 	num_primary = 0; num_cursor = 0;
> >
> > 	for_each_plane(plane) {
> > 		if (plane->type == primary) {
> > 			WARN_ON(!(plane->possible_crtcs & BIT(num_primary)));
> > 			num_primary++;
> > 		}
> >
> > 		/* same for cursor */
> > 	}
> >
> > 	WARN_ON(num_primary != dev->mode_config.num_crtcs);
> > }
> 
> Thanks for the suggestion. However I don't see why a driver should ensure
> this. Isn't it perfectly fine for a driver to use primary plane 2 for CRTC 1,
> and primary plane 1 for CRTC 2, for the purposes of legacy uAPI?

Yeah but it's a mess. Messes don't make good uapi.

> If we're trying here to invent a new uAPI to let user-space discover the
> internal legacy primary/cursor pointers, I'm not signing up for this. The
> requirement you're describing seems like something current drivers ensure
> "by chance", not an established uAPI. In other words, writing a new driver
> that doesn't do the same wouldn't break uAPI contracts.

I'm more seeing this as general uapi lock-down. "Everything goes" doesn't
work great. And it's all the same topic really. Like if your userspace
really doesn't care about what the primary plane is (like you seem to
imply), then ofc none of this matters to you, but then also your doc patch
here doesn't matter.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
