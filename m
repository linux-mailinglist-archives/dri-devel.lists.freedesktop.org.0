Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9F688F2A8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 00:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB04710ED04;
	Wed, 27 Mar 2024 23:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ornCfieO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E807110ED04
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 23:15:30 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-430d3fcc511so66781cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 16:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1711581329; x=1712186129;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zL0pxl1ZeYttqRQTvgIv4r0vTY3Iq9/o2liSDPlmKoQ=;
 b=ornCfieODia5DbjZOqma7aBdAZIIqltz59mokvPyrm0wyyQHdbPFNig9F1Q5bjCJgZ
 u6koM7XMaCuARwjw5GYXzn4iBPMIK0onXik6BZhG7CFaVKD5skdIsdj1L4SB2exvD8QM
 ZrsrlAuZ8fGaHbGs7xsxqjSLk0b8yT4J+jUj7VmjZ+voZ9PNX8y3ghXcHXK05XYMcxu1
 dNm+uQA1kRDKxKDj3Xn+Ncc/rCSq3ea1p+2WMLYAo5JK7dvgQf8FHMCbczCqQPvCtARi
 CbhxAcmv23MNBBzuSVydgUFwWcDINBAIR7LKirnwtlZHgEjloJWy8p0xL+Q+ss/UEumI
 /SjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711581329; x=1712186129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zL0pxl1ZeYttqRQTvgIv4r0vTY3Iq9/o2liSDPlmKoQ=;
 b=pmaXniL/Q0LuYZbkTegJft16zHSYM0keKjlh3vpdEt/5/1o1yxudNjwRCLxqHC/7qr
 0/5t8AcjuzS1i5KT9W4KFR4VOaCSBs95PECzmufOLmSinnMWDxh5S1uim6X0MvRkaCRI
 tqxGY9f8J23RlOZXt1CuugATgH6m1HzDH+y12fFwbHLhRDr2tiVfDzMQ0vv1SVLEj4Ab
 HtrZjkBJAczTGhzjcP0ziU6QqyFvHQrPEO1/IGNXXLLQ55k4PLPOSQ9+rnvyvh31IVLc
 KnbYtossyFwOtCXNVt+mpC3IaPwWbHEwVhEoGLBjAmxirEMI977W9EQ4oqrhbkqk0Omb
 oObQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPDaPfCiV/vKpFz4ZZmAwVgFB8sMdBWEv5RmveqFwDeyfGJ15TJSo/ik0N3W0spyEODJVozSCgdp35qslBW/b/cm0BF8XvvBadLLZdAAjR
X-Gm-Message-State: AOJu0YybP55AA2CuxJg5QTWgRryXxoeGpiTuysEwC0eCLhpFxFVvDU0p
 N5W823kEVsk1K7x8DHRdFMNWa862m2Mxq7ei71FLM8QUkg5Z7Gi5fCxaNEid5Y5LXgsjln+4Z4s
 X7RRyYQ0umTyZXspxtF/0O4gC8kAMa+E89GdV
X-Google-Smtp-Source: AGHT+IEHULaSt2yDU1vRh+RDTO5EMUamnNYAAYP3E+spcC25hRmXtBGbEZWqmHKqDhaq8Z06M7w2aIPsiKX2nepTBV0=
X-Received: by 2002:a05:622a:608d:b0:431:ffb2:eb7c with SMTP id
 hf13-20020a05622a608d00b00431ffb2eb7cmr101515qtb.14.1711581329361; Wed, 27
 Mar 2024 16:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240322214801.319975-1-robdclark@gmail.com>
 <CABUrSUAykXUoX0y6jzCw1s=E=E08Z54Ygo1TvBm49_iT88oDFg@mail.gmail.com>
 <CAF6AEGvK7fBhh36rQyqiHf_qVvsCJhHZjoyOqGqxRPcMZ3dzjw@mail.gmail.com>
In-Reply-To: <CAF6AEGvK7fBhh36rQyqiHf_qVvsCJhHZjoyOqGqxRPcMZ3dzjw@mail.gmail.com>
From: Dominik Behr <dbehr@google.com>
Date: Wed, 27 Mar 2024 16:15:16 -0700
Message-ID: <CABUrSUAykWDFKjLdiL4KrLmY3ztKnZdNNaP7g4U1ZmSs0d1haA@mail.gmail.com>
Subject: Re: [PATCH] drm/prime: Unbreak virtgpu dma-buf export
To: Rob Clark <robdclark@gmail.com>
Cc: Dominik Behr <dbehr@chromium.org>, dri-devel@lists.freedesktop.org, 
 Rob Clark <robdclark@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simon Ser <contact@emersion.fr>, open list <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
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

It is mapped, via iommu interface (vfio-iommu) when map_dma is called.
--
Dominik

On Mon, Mar 25, 2024 at 7:38=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> This is actually a bit concerning.. importing a host page backed
> buffer without guest mapping into a passthru device probably doesn't
> work and should be rejected earlier.
>
> I do think we should relax the restriction (either taking my patch or
> reverting the commit it fixes) until we work this out properly
> (because the original patch is a regression), but importing a buffer
> without guest pages into a passthru device can't possibly work
> properly.  Maybe it works by chance if the host buffer is mapped to
> the guest, but that is not guaranteed.
>
> BR,
> -R
>
> On Mon, Mar 25, 2024 at 3:35=E2=80=AFPM Dominik Behr <dbehr@chromium.org>=
 wrote:
> >
> > It also fixes importing virtgpu blobs into real hardware, for instance =
amdgpu for DRI_PRIME rendering.
> >
> > On Fri, Mar 22, 2024 at 2:48=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> >>
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> virtgpu "vram" GEM objects do not implement obj->get_sg_table().  But
> >> they also don't use drm_gem_map_dma_buf().  In fact they may not even
> >> have guest visible pages.  But it is perfectly fine to export and shar=
e
> >> with other virtual devices.
> >>
> >> Reported-by: Dominik Behr <dbehr@chromium.org>
> >> Fixes: 207395da5a97 ("drm/prime: reject DMA-BUF attach when get_sg_tab=
le is missing")
> >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >> ---
> >>  drivers/gpu/drm/drm_prime.c | 7 ++++++-
> >>  1 file changed, 6 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> >> index 7352bde299d5..64dd6276e828 100644
> >> --- a/drivers/gpu/drm/drm_prime.c
> >> +++ b/drivers/gpu/drm/drm_prime.c
> >> @@ -582,7 +582,12 @@ int drm_gem_map_attach(struct dma_buf *dma_buf,
> >>  {
> >>         struct drm_gem_object *obj =3D dma_buf->priv;
> >>
> >> -       if (!obj->funcs->get_sg_table)
> >> +       /*
> >> +        * drm_gem_map_dma_buf() requires obj->get_sg_table(), but dri=
vers
> >> +        * that implement their own ->map_dma_buf() do not.
> >> +        */
> >> +       if ((dma_buf->ops->map_dma_buf =3D=3D drm_gem_map_dma_buf) &&
> >> +           !obj->funcs->get_sg_table)
> >>                 return -ENOSYS;
> >>
> >>         return drm_gem_pin(obj);
> >> --
> >> 2.44.0
> >>
