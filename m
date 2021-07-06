Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606D13BC7B1
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 10:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF9E89C17;
	Tue,  6 Jul 2021 08:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A56E89C17
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 08:16:26 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id g10so7101775wmh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 01:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iefDvsbc9UVH86VmJXvMuTUV4wJDdt6K7ZMf11X8tFA=;
 b=VKB5m9qwM+6gxU4Rd+AcXiSMWrVNwKtdpdZNO8VtbcamaAxHRshBBTJ8LDLU8sFfT1
 VQEW8K1q52knITeStzAYsZwxXtkQmiJ5iUgOWFF4BlMHfuJClrt6GClfCg5tukIjSzyv
 lSe1El/fkVl2+2weULorXN+HrTYd3OLUhQUvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iefDvsbc9UVH86VmJXvMuTUV4wJDdt6K7ZMf11X8tFA=;
 b=tpGdYBOd0AEGNtQHyOdooQ79Dm4dYgf6zCy1AZzVf9akMSMzsHr/SrdLaek4srADdp
 nFHq/aBIohAgD32lesaUuKmTJO0ffsO/un/4Z48xBFn54dPoAyykDWlQWd2faWmRNBdY
 hB3DqBUCMqL8+/h6bDxPkzGMuNF0JjX+g06b9l+UM+XrYUoLRgf6spkNvjUxqlcnsPd4
 V0ORrYRlVnfRCyuSPsHjG0dGC3sOf8Ov4rK/LD7aSbSwKxg9mMQhuL/mTusSsnGMUNoV
 aKpEOo0Awxo27hpqCTSfatZtV0UzAjwHZ6s9bCVG6y+k0QsQh6qLNIgMgYF2FUo0jZ6W
 KVTg==
X-Gm-Message-State: AOAM531u+s3xdd73W6fKXMaHkDF44WnqP02PHzkIIPm3tI1GRI+T/4SE
 3ImLcSgs773+9VFHFhggJJvXFNVyTMEWNw==
X-Google-Smtp-Source: ABdhPJxbS9mvdE76310kjXeJj/3S9JlPg9UMO/1BEifo5bXO01S85Irx0LTrFRsreLbGicLSCFBx4Q==
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr3439967wmq.153.1625559385152; 
 Tue, 06 Jul 2021 01:16:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c16sm14602638wmr.2.2021.07.06.01.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 01:16:24 -0700 (PDT)
Date: Tue, 6 Jul 2021 10:16:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/4] vkms: Switch to shadow-buffered plane state
Message-ID: <YOQRVu7MmZCfwPot@phenom.ffwll.local>
References: <20210705074633.9425-1-tzimmermann@suse.de>
 <YOLQbp7m7ggecg05@phenom.ffwll.local>
 <246a3772-b632-c7c1-c1ec-5ac1277f7525@suse.de>
 <YOMVFi3q/JSoZ+p9@phenom.ffwll.local>
 <38b8f733-7e76-a172-2d6c-c2e9bc192cb3@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38b8f733-7e76-a172-2d6c-c2e9bc192cb3@suse.de>
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

On Tue, Jul 06, 2021 at 06:59:07AM +0200, Thomas Zimmermann wrote:
> Am 05.07.21 um 16:20 schrieb Daniel Vetter:
> > On Mon, Jul 05, 2021 at 12:05:28PM +0200, Thomas Zimmermann wrote:
> > > Hi
> > > 
> > > Am 05.07.21 um 11:27 schrieb Daniel Vetter:
> > > > On Mon, Jul 05, 2021 at 09:46:29AM +0200, Thomas Zimmermann wrote:
> > > > > Vkms copies each plane's framebuffer into the output buffer; essentially
> > > > > using a shadow buffer. DRM provides struct drm_shadow_plane_state, which
> > > > > handles the details of mapping/unmapping shadow buffers into memory for
> > > > > active planes.
> > > > > 
> > > > > Convert vkms to the helpers. Makes vkms use shared code and gives more
> > > > > test exposure to shadow-plane helpers.
> > > > > 
> > > > > Thomas Zimmermann (4):
> > > > >     drm/gem: Export implementation of shadow-plane helpers
> > > > >     drm/vkms: Inherit plane state from struct drm_shadow_plane_state
> > > > >     drm/vkms: Let shadow-plane helpers prepare the plane's FB
> > > > >     drm/vkms: Use dma-buf mapping from shadow-plane state for composing
> > > > 
> > > > So I think right now this fits, but I think it'll mismit going forward: We
> > > > don't really have a shadow-plane that we then toss to the hw, it's a
> > > > shadow-crtc-area. Right now there's no difference, because we don't
> > > > support positioning/scaling the primary plane. But that's all kinda stuff
> > > > that's on the table.
> > > > 
> > > > But conceptually at least the compositioning buffer should bet part of the
> > > > crtc, not of the primary plane.
> > > > 
> > > > So not sure what to do, but also coffee hasn't kicked in yet, so maybe I'm
> > > > just confused.
> > > 
> > > I'm not sure if I understand your concern. Can you elaborate? The
> > > compositing output buffer is not affected by this patchset. Only the input
> > > frambuffers of the planes. Those are shadow buffers. AFAICT the composer
> > > code memcpy's the primary plane and then blends the other planes on top.
> > > Supporting transformation of the primary plane doesn't really change much
> > > wrt to the vmaping of input fbs.
> > 
> > Yeah that's the current implementation, because that's easier. But
> > fundamentally we don't need a copy of the input shadow plane, we need a
> > scratch area that's sized for the crtc.
> 
> I stll don't understand. Are you talking about the whole patchset or just
> patch 4? Because if you want to do anything with vkms planes, you have to
> vmap the framebuffer BOs into memory. (right?) That's all that shadow-buffer
> planes do. Patches 1 to 3 have nothing to do with memcpy. Admittedly, Patch
> 4 does some minor refactoring, but only because it became a low-hanging
> fruit.

Oh man I need to hand in my patch reading license last few days, this aint
the first one :-(

Yeah looks all good to me, and makes total sense. Maybe I'll leave
detailed review to Melissa since I got this all wrong this much.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
