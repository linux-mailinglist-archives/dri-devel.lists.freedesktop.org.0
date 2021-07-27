Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B700B3D7235
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 11:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0AE89996;
	Tue, 27 Jul 2021 09:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB8F89996
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 09:42:59 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id b9so13564205wrx.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 02:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mAiGBsHFPrgbLncrANHZGczGO6OGfS1Vk2oR08FoCVM=;
 b=YAUXfLCeTB/ZmzZLBPHtvU/NNjTKxIVLAa5/9trBpJzvN9I05arFoaoE0vJI4Hzhzb
 MFnMxDBgyj8OQSY9BEytuleklsweXa8VYBa5soB3SEdaKm3qBbbr98Qvku6bEMyMCz5I
 YbqZ426ntnDzG9kiKMr7hA2Xf4M9WxhsFTbO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mAiGBsHFPrgbLncrANHZGczGO6OGfS1Vk2oR08FoCVM=;
 b=OPStNkOxryScqusztArUfNwX6uA/v9Rhhso4QTpWF0yCSMtEeykw2EJZDX8eiO6vUt
 CiXyycS5K/gu4sKKUshAIww0e3djtL9oS3CaX0zDeR0SFWpsMuvsJlYNkOr2dUI+vAuI
 1MIuKwgdodjpxto9qVw1Z50jvcZ1kDGiDuIRdIpzxyTb5XRs+2IKX9XWwWR4kpolr4rS
 wsEHJiDsb8o+egO01U97owXogppAqqDE3ycfNfzxFVDHPKV38jsyscItzHav2geUHDGy
 oOMoraKh1ojaPOGRZwNdvQUqYh7ee7Sav6OrJ4w4RN+uk4+Yh7w0qBbITFevfxDERg0i
 HhTQ==
X-Gm-Message-State: AOAM5317QSQhVFxYRE++qdSuGmMSmjhjN1coHsr0UE2Oj11Y+UwgLrRG
 xSq3RVDtDt2hwEbU262LhlGI+w==
X-Google-Smtp-Source: ABdhPJzTA3gC8yuyL2XwiOA92lDvK8KU5L+7DpE8TWdDIyBy5Ws49fuK6U/JhOPTu8h9SuZ0fM2ZzQ==
X-Received: by 2002:a5d:6489:: with SMTP id o9mr23403881wri.397.1627378978114; 
 Tue, 27 Jul 2021 02:42:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u11sm2561948wrp.26.2021.07.27.02.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 02:42:57 -0700 (PDT)
Date: Tue, 27 Jul 2021 11:42:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm: document DRM_IOCTL_MODE_RMFB
Message-ID: <YP/VH+yxY6MF/DNx@phenom.ffwll.local>
References: <ephVkof3uGu2RpOdBbrHE3qF98zBfIBRzXe4Vyoboh0@cp4-web-034.plabs.ch>
 <20210727110913.29159b48@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727110913.29159b48@eldfell>
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
Cc: Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 11:09:13AM +0300, Pekka Paalanen wrote:
> On Mon, 26 Jul 2021 07:50:32 +0000
> Simon Ser <contact@emersion.fr> wrote:
> 
> > Since there's no struct to attach the docs to, document the IOCTL
> > definition.
> > 
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Cc: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> > ---
> >  include/uapi/drm/drm.h | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > index e1f49dd241f7..283d61d5a243 100644
> > --- a/include/uapi/drm/drm.h
> > +++ b/include/uapi/drm/drm.h
> > @@ -1050,6 +1050,16 @@ extern "C" {
> >  #define DRM_IOCTL_MODE_GETPROPBLOB	DRM_IOWR(0xAC, struct drm_mode_get_blob)
> >  #define DRM_IOCTL_MODE_GETFB		DRM_IOWR(0xAD, struct drm_mode_fb_cmd)
> >  #define DRM_IOCTL_MODE_ADDFB		DRM_IOWR(0xAE, struct drm_mode_fb_cmd)
> > +/**
> > + * DRM_IOCTL_MODE_RMFB - Remove a framebuffer.
> > + *
> > + * This removes a framebuffer previously added via ADDFB/ADDFB2. The IOCTL
> > + * argument is a framebuffer object ID.
> > + *
> > + * Warning: removing a framebuffer currently in-use on an enabled plane will
> > + * disable that plane. If the plane is primary, the CRTC may also be disabled
> > + * (depending on driver capabilities).
> 
> Hi,
> 
> I recall some discussions around having a CRTC running with only a
> non-primary plane active. Maybe we should just drop the "If the plane
> is primary," part to leave it more open.

Yeah this wording is only correct for legacy drivers, for atomic ones we
can nuke the CRTC in any case if the plane disable fails to connect.
Legacy drivers just shrug (but there's none left with universal planes
anyway I think).

Also the atomic here isn't the userspace visible part, this is about
whether the driver is internally considered atomic.

tldr; Drop the primary plane qualifier like Pekka suggests, with that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

-Daniel

> 
> I believe no-one should take advantage of RmFB turning a CRTC off. It's
> just something that can happen, so userspace needs to be aware to avoid
> it.
> 
> With or without that change:
> 
> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> 
> 
> Thanks,
> pq
> 
> > + */
> >  #define DRM_IOCTL_MODE_RMFB		DRM_IOWR(0xAF, unsigned int)
> >  #define DRM_IOCTL_MODE_PAGE_FLIP	DRM_IOWR(0xB0, struct drm_mode_crtc_page_flip)
> >  #define DRM_IOCTL_MODE_DIRTYFB		DRM_IOWR(0xB1, struct drm_mode_fb_dirty_cmd)
> 



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
