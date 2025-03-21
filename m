Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5642A6C643
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 00:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458FB10E845;
	Fri, 21 Mar 2025 23:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="0Wp+c2aR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BFB710E845
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 23:01:25 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5dccaaca646so4651470a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 16:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1742598084;
 x=1743202884; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sH2W37gz5JSCUCdBWPzPlpXu5pNqBdrWWXPAz4A12i0=;
 b=0Wp+c2aRLv5n87PBt4J2JatHgmKnxbzghZm5LKfOBVoAOc7THD3opjH56IWaCfGzai
 RXt+Weq5zuM+grcrWpBGa3XJg+7V5srxy4QXKU8VWpjbLbk81G5TnjEzTQ1xfLBVxMp8
 n19fUOaluuJjV35PceXzUbZgT6fgeeoeRApIwY22ZqDJxkQumrWjMb5UWVCgmhwqv5vx
 Us9R09BjXTXnMVbtKzN6N6JEVk4MJnL4kCgJslBQNqg62x6wfhqh+x1W6N3KhZZIXKCm
 KX3VNZhGbKEUzqUUmsj/B9zooQ1dlstwGYxTMcB78Yc37Gq5wBwNmzDXTQ5P3nw2dtZS
 X6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742598084; x=1743202884;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sH2W37gz5JSCUCdBWPzPlpXu5pNqBdrWWXPAz4A12i0=;
 b=hVlW9Zonc9kWNJMrASm+GtViKPdiohiiovpZ0QnHsXfp9M+jQWaReTsQHgGaLBbCHP
 y5o0b0igcWmH2NYOWcRI2mE0O7Ujy4rpSS8U5biIHeJ2vKNeiJpJ4lpMWPtgfkMwO4mQ
 628lYCrm9CjuZfRwx7Sqd4ro2WmYa/c2s0y7isJn0494FjKl4SHqNgwNjROHyygcttIB
 fgmSwwvmNsPeAI+zYZccEpA6+0YRZtZMbxEPo8q9V+yu07+XlidiWbszqHozhbD+xeKV
 6yJwBRuyOmTES1S+Knwj+xCwV1SHH936yN8ZnKM8U3tS11LYTbR1rO9BLMdaXDG5P060
 DV/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC6kxufhdcMuymEDPzo6cozrfNUPVuOUwftvAYNvmgVAKoZkN58DtBuMglAWt7EFlXRnOoF9VcI7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7eBqkcLGkEyTVy/Y99kwWsRhRPCaXjZ/hrkpEy+no0GR2CZDJ
 ojQ1gZVvRFJZZXh/8Nj5APas1P7RyN7C4ETJXJlSLL0HXNOftlExeLf6KH07aGNRmcrEquSM27E
 oeN3o1WrVFF4tfyydgxJiMMkIWruvNtm1P02+FA==
X-Gm-Gg: ASbGncsvJsIawz9hSUYqEl5LL+2I8U0KL1RK9W4i29xCve5xxJuO6AI5J+vioXnI9OS
 hKnaSmcpEVhi6LHZoLpH6n20SROulBU07qsNzK2NL/0Gm/ZlSU5dALBUEeezAYyhY5rPq3JLgAM
 xQ/XISIwMiBss7EnROliqJN4Gs7MlIVmM579qj3wkA/g0nsCfJ4i53oIvUce8QcbANg3Q8
X-Google-Smtp-Source: AGHT+IEgVTLqq03sZoIlc85e4pxje4Yd7ymNujGbmj6hYsnYZz+ZaZPnJdi1WIE/4jpnjz3bPQx/EbgEmWcNWmSiHfs=
X-Received: by 2002:a50:d586:0:b0:5e4:d52b:78a2 with SMTP id
 4fb4d7f45d1cf-5eb9a310491mr6431605a12.15.1742598083450; Fri, 21 Mar 2025
 16:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-3-mhenning@darkrefraction.com>
 <Z9xfoS89yimS1Sb3@pollux>
In-Reply-To: <Z9xfoS89yimS1Sb3@pollux>
From: M Henning <mhenning@darkrefraction.com>
Date: Fri, 21 Mar 2025 19:00:57 -0400
X-Gm-Features: AQ5f1JosjHpUxkL36DODONjh8EuMIFPu3fhSSXFGrywJK3z2Ey2y3VvLkXNpaUQ
Message-ID: <CAAgWFh2RtCwaKNinX9X4BjwNiaBj5BF_ypzbqoqV4LJgN4cPvg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau: DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER
To: Danilo Krummrich <dakr@kernel.org>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

This is a pointer in the gpu's virtual address space. It must be
aligned according to ctxsw_align and be at least ctxsw_size bytes
(where those values come from the nouveau_abi16_ioctl_get_zcull_info
structure). I'll change the description to say that much.

Yes, this is GEM-backed. I'm actually not entirely sure what the
requirements are here, since this part is reverse-engineered. I think
NOUVEAU_GEM_DOMAIN_VRAM and NOUVEAU_GEM_DOMAIN_GART are both okay. The
proprietary driver allocates this buffer using
NV_ESC_RM_VID_HEAP_CONTROL and sets attr =3D NVOS32_ATTR_LOCATION_ANY |
NVOS32_ATTR_PAGE_SIZE_BIG | NVOS32_ATTR_PHYSICALITY_CONTIGUOUS, attr2
=3D NVOS32_ATTR2_GPU_CACHEABLE_YES | NVOS32_ATTR2_ZBC_PREFER_NO_ZBC.

On Thu, Mar 20, 2025 at 2:34=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed, Mar 12, 2025 at 05:36:15PM -0400, Mel Henning wrote:
> > diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_=
drm.h
>
> Same here, please split the uAPI change in a separate commit.
>
> > index 33361784eb4e..e9638f4dd7e6 100644
> > --- a/include/uapi/drm/nouveau_drm.h
> > +++ b/include/uapi/drm/nouveau_drm.h
> > @@ -448,6 +448,20 @@ struct drm_nouveau_get_zcull_info {
> >       __u32 ctxsw_align;
> >  };
> >
> > +struct drm_nouveau_set_zcull_ctxsw_buffer {
> > +     /**
> > +      * @ptr: The virtual address for the buffer, or null to bind noth=
ing
> > +      */
> > +     __u64 addr;
>
> What is this buffer? Is this a GEM object backed buffer? How is it mapped=
?
>
> > +
> > +     /**
> > +      * @channel: the channel to set the buffer on
> > +      */
> > +     __u32 channel;
> > +
> > +     __u32 pad;
> > +};
> > +
> >  #define DRM_NOUVEAU_GETPARAM           0x00
> >  #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
> >  #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
> > @@ -462,6 +476,7 @@ struct drm_nouveau_get_zcull_info {
> >  #define DRM_NOUVEAU_VM_BIND            0x11
> >  #define DRM_NOUVEAU_EXEC               0x12
> >  #define DRM_NOUVEAU_GET_ZCULL_INFO     0x13
> > +#define DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER 0x14
> >  #define DRM_NOUVEAU_GEM_NEW            0x40
> >  #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
> >  #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
> > @@ -532,6 +547,7 @@ struct drm_nouveau_svm_bind {
> >  #define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE=
 + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
> >
> >  #define DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO     DRM_IOR (DRM_COMMAND_BASE=
 + DRM_NOUVEAU_GET_ZCULL_INFO, struct drm_nouveau_get_zcull_info)
> > +#define DRM_IOCTL_NOUVEAU_SET_ZCULL_CTXSW_BUFFER  DRM_IOW (DRM_COMMAND=
_BASE + DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER, struct drm_nouveau_set_zcull_ct=
xsw_buffer)
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> > --
> > 2.48.1
> >
