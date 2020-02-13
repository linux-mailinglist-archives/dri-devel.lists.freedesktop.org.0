Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA0F15BC8B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 11:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4C76F59F;
	Thu, 13 Feb 2020 10:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074436F59E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 10:17:00 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g3so5904156wrs.12
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 02:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=A7vpJUkiNYbnDNDfPAePFbB1d7aGKW4dVofnoCZdQb4=;
 b=Rdxdq7BcBfNSj0wWqFV5N0p0ieoXyxeOx05kDDxD75BQwOYsSpHnF2XlIe5qHV1LOy
 lvGlD/O+StSyIjxzzqMG31FSTy8i+jOw3pS+R0/b8CFz0LbNAvu0+CUugLB5kni4vA+n
 F9ZtZ2Id58frGGkU/kJZqtcVuJesSAkr+MIjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A7vpJUkiNYbnDNDfPAePFbB1d7aGKW4dVofnoCZdQb4=;
 b=ufgqzmXh80fB5OFrF8ejKbdc8ucUdlrwFfJeVvxfg7r82QB8SwiEjv/yfGxTce+U6/
 93cWv87s37nKfoKb5w3Q1etsnHaXMVYW24+65ESjwWAsy9ayF6sfzOvLYZnKf5ANDpwg
 bdxMDfzT/104Cm2w/T++5Wd85tkf8GAVmRTlEdij6jHdZqGvSAdD2dgfOA2gUE0fysfv
 yAON8iQ3Qu6DYYhcG6mbzqnRdfqf0vh+jkVlAUjIbDDUOvbaUSVfxAsb6CRnYwmE6krg
 qawgiP/qr/j9ljZdeOkhqSXNiHgUZpjiybP0JI3eT9UIEeXoYSet7B27ceJBXVvIiv3o
 iJLg==
X-Gm-Message-State: APjAAAVXkt3uVGMD+k1qHzv9k4ZJdBp5KWNCOLbrWRC2/a58wkf5gPTK
 5S3Le1iEzdxOtBqRpKN2Ampm/Q==
X-Google-Smtp-Source: APXvYqwU5j1U6PPMYauX20SdkyjsJYm+GG0dYRn/ED3KrM/Uf/P7l64zWxoMt4em5Rj9PHlJbYijcg==
X-Received: by 2002:adf:a453:: with SMTP id e19mr20361243wra.305.1581589018532; 
 Thu, 13 Feb 2020 02:16:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y8sm2292834wma.10.2020.02.13.02.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 02:16:57 -0800 (PST)
Date: Thu, 13 Feb 2020 11:16:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: backend-drm and scanning really large resolutions
Message-ID: <20200213101655.GT2363188@phenom.ffwll.local>
References: <20d5d2e0af60ca486fc31fb09e6f4aa4@codeaurora.org>
 <20200213113740.07af1263@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200213113740.07af1263@eldfell.localdomain>
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
Cc: Xiaowen Wu <wxiaowen@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 11:37:40AM +0200, Pekka Paalanen wrote:
> Adding Rob back in CC, I don't know if he is subscribed to
> wayland-devel@. You forgot to CC dri-devel@ too.
> 
> 
> On Tue, 11 Feb 2020 17:18:52 -0500
> Xiaowen Wu <wxiaowen@codeaurora.org> wrote:
> 
> > Hi Rob,
> > 
> > If the vendor driver doesn't have the hwpipe sub-object and kms plane is 
> > one-to-one mapped to hwpipe (sspp),
> > do you think if below approach is acceptable if we still want to 
> > virtualize the kms plane to support 4K/8K scanout?
> > 
> > 1. At kms atomic check before calling drm_atomic_helper_check, depending 
> > on scanout width of plane A in state, add idle planes B (C,D,...)
> > into the same atomic state, backup and then modify 
> > src_x/src_w/crtc_x/crtc_w of plane A and the affected planes B (C,D,...) 
> > to meet scanout
> > width limits, and set crtc/fb of the affected planes B (C,D,...) same as 
> > plane A.
> > 
> > 2. At plane's state duplicate function, check if plane's 
> > src_x/src_w/crtc_x/crtc_w are updated at step 1), if so revert the 
> > change to
> > plane A's backup value to allow plane A's scanout to update again. These 
> > value will again be updated in step 1) so nothing really changes
> > if plane A continues updating.
> > 
> > 3. If plane A's scanout is updated or detached from crtc, detach 
> > affected planes B (C,D,...) in the same atomic state in step 1) and then 
> > run step 1) again.
> > 
> > 4. If user want to commit plane B (C,D,...), the commit/test will fail 
> > if planes are already used as sister plane of plane A. This failure is 
> > same
> > as insufficient hwpipe from plane B (C,D,...).
> > 
> > With above change, any downstream driver can support virtualized plane. 
> > Also as the above approach is generic and not h/w specific, we can make
> > it a helper function and it's up to vendor to choose if they want to use 
> > or not, if they don't have logic like drm/msm/disp/mdp5/mdp5_plane in
> > their downstream driver.
> > 
> > Conceptional above changes didn't borrow hwpipe resources from other 
> > plane but borrow planes themselves directly, however from user point of 
> > view
> > they should not feel any difference.
> > 
> > What do you think?

The trouble with modifying the real plane states (instead of a 2nd layer
of hw objects) is that changes the userspace visible state. Which could
confuse the heck out of userspace. That's why in all these cases where the
hw needs 2 things in gang mode (we have other examples where you need to
double up clocks or crtcs or whatever in other drivers/hw) we've made a
driver specific layer - that way you can store the stuff you exactly need,
and not something generic.

Maybe there is some room for generic helpers, but you'd need to prove your
case by converting a few drivers over to this model. There's a lot
already which virtualize planes in one way or another, but they're all
slightly different. Thus far simply rolling your own in each driver
proved to be quicker.
-Daniel

> > 
> > BR,
> > Xiaowen Wu
> > 
> > 
> > On Tue Jan 21, 2020 at 4:12 PM Rob Clark <robdclark at gmail.com> wrote:
> > > On Fri, Jan 17, 2020 at 8:52 AM Matt Hoosier <matt.hoosier at   
> > > gmail.com> wrote:
> > >> 
> > >> Hi all,
> > >> 
> > >> I'm confronting a situation where the hardware with which I work is 
> > >> capable of driving connectors at 4K or 8K, but doing so requires 
> > >> bonding the scanning of multiple planes together.
> > >> 
> > >> The scenario is that you'd have a big primary framebuffer whose size 
> > >> is too large for an individual hardware scanning pipeline on the 
> > >> display controller to traverse within its maximum allowed clock rate.
> > >> 
> > >> The hardware supplier's approach is to assign multiple planes, which 
> > >> in the KMS driver map to hardware scanning pipelines, to each be 
> > >> responsible for scanning a smaller section of the framebuffer. The 
> > >> planes are all assigned to the same CRTC, and in concert with each 
> > >> other they cover the whole area of the framebuffer and CRTC.
> > >> 
> > >> This sounds a little bit wild to me. I hadn't been aware it's even 
> > >> legal to have more than one plane treated a the source of scanout for 
> > >> a single framebuffer. Maybe that distinction isn't really relevant 
> > >> nowadays with universal plane support.
> > >>   
> > > 
> > > fwiw, have a look at drm/msm/disp/mdp5/mdp5_plane, which will allocate
> > > one or two hwpipe's from the devices global atomic state, depending on
> > > scanout width.. the hwpipe (sspp) is the physical resource behind a
> > > plane, so essentially the kms planes are virtualized.  At some point
> > > if you have too many wide layers, the atomic test step will fail due
> > > to insufficient hwpipe's.  But this sort of scenario is the reason for
> > > the test step.
> > > 
> > > BR,
> > > -R
> > >   
> > >> I'm wondering if anybody here knows whether this a legit approach for 
> > >> a compositor's DRM backend to take?
> > >>   
> > _______________________________________________
> > wayland-devel mailing list
> > wayland-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/wayland-devel
> 



> _______________________________________________
> wayland-devel mailing list
> wayland-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/wayland-devel


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
