Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFF63BBA28
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 11:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7862689B29;
	Mon,  5 Jul 2021 09:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43D989B29
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 09:27:14 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 i2-20020a05600c3542b02902058529ea07so3106060wmq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jul 2021 02:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uVicueVP1pnL9PsVfO1wH0yVMtf3GKlKt9m/epQPcew=;
 b=lcqPjWfhErfFz9d3EuQFXcHOJPNq2xcYWEqNvuBTrpyAKfb61oqwY6rA9TY3wWH/Uz
 g/197MCxeRbYdsSdX2EdHemGc+2sH6wSO1sgUMGmDBVAUJLSg0IvReqtdM1ct0g3c6yA
 mdn2eXhvAP2IIhpojLS6cxfQkgD8iinSGWqKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uVicueVP1pnL9PsVfO1wH0yVMtf3GKlKt9m/epQPcew=;
 b=jOuGq2oc9zaMC3f0/FR+g4oIcI0B7R7+ZSMtc0j7NfYttqE3R2LY7wpyfzujKhi2Af
 BBOOzDfWJcytGHFWfD5ovYgsZzA/vhCO9lUy/ne7MbpxCieAwX92xJFwHf34i+Gt4Sw3
 v1hdgcY4I+N4qKI4trIc6nJeATU5t9+j3814WCBd6MyKlaIHfsS50shL2xP34vM3Fq99
 zVkgdAJ9+3v/zSEiyYF9ns6KsOV7ThTO7ZhBlvESxdM/1hRi8+854Ra3Q6rzIogt9b6j
 y/Put4g0BrRCyK/uhi4TTejc4Ab10S0Ysw+QpQTte+L/lolo0Nwiuw5Ib084/k1Pqxxe
 MGCg==
X-Gm-Message-State: AOAM53295Exi78ycTGZTX+uBERIM405inwEcmJLUhCz/WnqqZk2c7Mex
 26M5mtNvPlDIFXbGkzTg7qcgAye16bv3rA==
X-Google-Smtp-Source: ABdhPJzFpYwK9kFJsd39FVneyNM3buxB8Ur5UvKxq5vVAHTJuD6Cq5QSyzwk795MzmYGy/gwxhBtDA==
X-Received: by 2002:a1c:9884:: with SMTP id a126mr14086800wme.59.1625477233025; 
 Mon, 05 Jul 2021 02:27:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p3sm20345391wmq.17.2021.07.05.02.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 02:27:12 -0700 (PDT)
Date: Mon, 5 Jul 2021 11:27:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/4] vkms: Switch to shadow-buffered plane state
Message-ID: <YOLQbp7m7ggecg05@phenom.ffwll.local>
References: <20210705074633.9425-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210705074633.9425-1-tzimmermann@suse.de>
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
 melissa.srw@gmail.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 05, 2021 at 09:46:29AM +0200, Thomas Zimmermann wrote:
> Vkms copies each plane's framebuffer into the output buffer; essentially
> using a shadow buffer. DRM provides struct drm_shadow_plane_state, which
> handles the details of mapping/unmapping shadow buffers into memory for
> active planes.
> 
> Convert vkms to the helpers. Makes vkms use shared code and gives more
> test exposure to shadow-plane helpers.
> 
> Thomas Zimmermann (4):
>   drm/gem: Export implementation of shadow-plane helpers
>   drm/vkms: Inherit plane state from struct drm_shadow_plane_state
>   drm/vkms: Let shadow-plane helpers prepare the plane's FB
>   drm/vkms: Use dma-buf mapping from shadow-plane state for composing

So I think right now this fits, but I think it'll mismit going forward: We
don't really have a shadow-plane that we then toss to the hw, it's a
shadow-crtc-area. Right now there's no difference, because we don't
support positioning/scaling the primary plane. But that's all kinda stuff
that's on the table.

But conceptually at least the compositioning buffer should bet part of the
crtc, not of the primary plane.

So not sure what to do, but also coffee hasn't kicked in yet, so maybe I'm
just confused.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
