Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8DA3BBE18
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 16:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7054289CCE;
	Mon,  5 Jul 2021 14:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9E589CCE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 14:20:10 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id f14so21931636wrs.6
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jul 2021 07:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=T63OsSTvv4MCqVjykBgp52RPqWWcO02zY+OmefcqPZk=;
 b=bZ/BoTQ0j7NdE7+1ucDydvc1uJLmn84D27HPnsKMMakSqe9kxQq/uYZhvo5cm4iID4
 yuRG8y6Wrpqq5m7WaKCd29OdwtwgF16TAzG3ckEQPcgnuYRQ5iq2r6gq2qpSK2K5P8PE
 siYP6vUE2U3xSLtIOwNGFbNZKR3RXWGwZDwZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T63OsSTvv4MCqVjykBgp52RPqWWcO02zY+OmefcqPZk=;
 b=c80bZxLZ++RA++Rrxq/BWKN4khaV3eO0AHen2c+29lFG2fc2iOSTE4QFTymwPPqJcl
 z5FbG6ngDv4x4Y5DVtJs1ziOGHq2K3OX6ho1/JuHdDQ40Euw7LbuUmvYfbFZK2K9pmu9
 PSHqmCiEZnerK+YnyJgZOPq4SOIMQUTo1yuD7VMOi3LUeUfopoVzuXf1sHcqYK3rdzE2
 Y+kd93uA8Cpg/fAx8W3bdcnSXOZESgx1p64VpbBXf+BalTaMcuFUgkM81yyL6tMabcGI
 jpKu1IXXhS/QNouHgwEoO/us4Ogq+l2LtWJQDY1o2oGFLIu68jjG16QLFhwfag8No+/o
 cHDA==
X-Gm-Message-State: AOAM530M6ssuFywYmFp4u/unj/EYCPfc4ioA9r/01NUVPjwHkJebQrmL
 9S4SeysqXv65amP0Gm5bw+ZpZ9Kt4l0b+g==
X-Google-Smtp-Source: ABdhPJzQLDIDRcO6zfbqg7jJf+k65uhmxrkE+HUKAFhVxh8K3xxEzdJqlmcvqgaPOrbR6hOmvU69ig==
X-Received: by 2002:adf:e385:: with SMTP id e5mr16056944wrm.264.1625494809374; 
 Mon, 05 Jul 2021 07:20:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i2sm6527659wmq.43.2021.07.05.07.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 07:20:08 -0700 (PDT)
Date: Mon, 5 Jul 2021 16:20:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/4] vkms: Switch to shadow-buffered plane state
Message-ID: <YOMVFi3q/JSoZ+p9@phenom.ffwll.local>
References: <20210705074633.9425-1-tzimmermann@suse.de>
 <YOLQbp7m7ggecg05@phenom.ffwll.local>
 <246a3772-b632-c7c1-c1ec-5ac1277f7525@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <246a3772-b632-c7c1-c1ec-5ac1277f7525@suse.de>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 05, 2021 at 12:05:28PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.07.21 um 11:27 schrieb Daniel Vetter:
> > On Mon, Jul 05, 2021 at 09:46:29AM +0200, Thomas Zimmermann wrote:
> > > Vkms copies each plane's framebuffer into the output buffer; essentially
> > > using a shadow buffer. DRM provides struct drm_shadow_plane_state, which
> > > handles the details of mapping/unmapping shadow buffers into memory for
> > > active planes.
> > > 
> > > Convert vkms to the helpers. Makes vkms use shared code and gives more
> > > test exposure to shadow-plane helpers.
> > > 
> > > Thomas Zimmermann (4):
> > >    drm/gem: Export implementation of shadow-plane helpers
> > >    drm/vkms: Inherit plane state from struct drm_shadow_plane_state
> > >    drm/vkms: Let shadow-plane helpers prepare the plane's FB
> > >    drm/vkms: Use dma-buf mapping from shadow-plane state for composing
> > 
> > So I think right now this fits, but I think it'll mismit going forward: We
> > don't really have a shadow-plane that we then toss to the hw, it's a
> > shadow-crtc-area. Right now there's no difference, because we don't
> > support positioning/scaling the primary plane. But that's all kinda stuff
> > that's on the table.
> > 
> > But conceptually at least the compositioning buffer should bet part of the
> > crtc, not of the primary plane.
> > 
> > So not sure what to do, but also coffee hasn't kicked in yet, so maybe I'm
> > just confused.
> 
> I'm not sure if I understand your concern. Can you elaborate? The
> compositing output buffer is not affected by this patchset. Only the input
> frambuffers of the planes. Those are shadow buffers. AFAICT the composer
> code memcpy's the primary plane and then blends the other planes on top.
> Supporting transformation of the primary plane doesn't really change much
> wrt to the vmaping of input fbs.

Yeah that's the current implementation, because that's easier. But
fundamentally we don't need a copy of the input shadow plane, we need a
scratch area that's sized for the crtc.

So if the primary plane is smaller than the crtc window (because we use
plane hw for compositing, or maybe primary plane shows a vidoe with black
borders or whatever), then the primary plane shadow isn't the right size.

And yes this means some surgery, vkms isn't there yet at all. But still it
would mean we're going right here, but then have to backtrack before we
can go left again. So a detour.

Also I don't think any other driver will ever need this, you really only
need it when you want to composite planes in software - which defeats the
purpose of planes. Except when the goal of your driver is to be a software
model.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
