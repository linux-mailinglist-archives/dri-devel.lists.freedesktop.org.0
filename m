Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D69588B782
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 03:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AEE810EA91;
	Tue, 26 Mar 2024 02:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jKVzI5yy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E6A10EA91
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 02:38:48 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a465ddc2c09so278568766b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 19:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711420727; x=1712025527; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xvuTO++gksCL8fZc9rnTMteYbv8VDF4X35FDvigGhis=;
 b=jKVzI5yyQsQRKH8P1hRCKIIlq78gqCH5S75yfGxSNSPFcRf4K+70wLmeK2cnRTGrP1
 wnUHCtVPwVaFe3O0LlKSsBwHWxu6U1hdJyAx2oIMe2HBNwcFB8siq5LrdTtiXsNy040g
 lFaz+6BN+eddLTDrJ523iKULxXRh3lAbWhMY26FXRAajcHVsi+B10YEy55uDDOcwJiHs
 xEkmgHn4d+uqOk/QXAabbflbEgAcUz4O1XYm81vQQuuHTnfr2Owh8vygqTD7z2ou+8hb
 r4Tfcj/iglAXPrdz6zaV3wDvDTASKdM8stWCvcOc7HcfLwRVbFBO8aXIQ80X7KxH7r2a
 +VlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711420727; x=1712025527;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xvuTO++gksCL8fZc9rnTMteYbv8VDF4X35FDvigGhis=;
 b=W9KnQK/mtyE3ZUz2hrJXWE/xszLkXhYtmOLEOAenk4xybBCAwaQ5A8dX9YyXyZN31C
 MPQzaY1SY98eTxztdMLKkzar34Oc+kaYmbnky9inisuyN42eXn1Fu4GAXwHV4/S0RGpM
 K/+EiM3RyMU8gHuHxC/r6PPPUQer0AhQL9557yCnDgMWM1vqiC9UdB4hMnobiRKA3HAx
 HDLFf9XPJxJSytNvrUBAaGJn+TBm4z2++B9OrOWyY1ZNtGhTq3E8diALLJ7bIgueaoSG
 /usLD8rfqLPU979aqsRTNLRsT/3Ip6euIGvc/tJ5v0km3Q4teC85LJIT971Oda+8Cn3i
 s6XA==
X-Gm-Message-State: AOJu0Yz5qKpZcsGcznqg030bkQxOQu3tXNHmRrkVClw1bM0H+eu6yTgd
 GCtec9Q8dPCU+Je+xXqfH1NcXV66Py8hMMRU9FQxrieZtaznQX9/x4o+HX128561PU0o9IToECd
 wZaLmhyNBZyUG2e5+x6j6+gQNu3g=
X-Google-Smtp-Source: AGHT+IHOdLWyBfukeIVQCzdbwxRaGW3vVBOom0CaCVMlu32t8AKYWeJCkDsVov9mGGSIhvtfIDAySQLVgGHxvqfS2+Q=
X-Received: by 2002:a05:6402:520a:b0:56c:d21:d919 with SMTP id
 s10-20020a056402520a00b0056c0d21d919mr5364774edd.34.1711420726461; Mon, 25
 Mar 2024 19:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240322214801.319975-1-robdclark@gmail.com>
 <CABUrSUAykXUoX0y6jzCw1s=E=E08Z54Ygo1TvBm49_iT88oDFg@mail.gmail.com>
In-Reply-To: <CABUrSUAykXUoX0y6jzCw1s=E=E08Z54Ygo1TvBm49_iT88oDFg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 25 Mar 2024 19:38:34 -0700
Message-ID: <CAF6AEGvK7fBhh36rQyqiHf_qVvsCJhHZjoyOqGqxRPcMZ3dzjw@mail.gmail.com>
Subject: Re: [PATCH] drm/prime: Unbreak virtgpu dma-buf export
To: Dominik Behr <dbehr@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
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

This is actually a bit concerning.. importing a host page backed
buffer without guest mapping into a passthru device probably doesn't
work and should be rejected earlier.

I do think we should relax the restriction (either taking my patch or
reverting the commit it fixes) until we work this out properly
(because the original patch is a regression), but importing a buffer
without guest pages into a passthru device can't possibly work
properly.  Maybe it works by chance if the host buffer is mapped to
the guest, but that is not guaranteed.

BR,
-R

On Mon, Mar 25, 2024 at 3:35=E2=80=AFPM Dominik Behr <dbehr@chromium.org> w=
rote:
>
> It also fixes importing virtgpu blobs into real hardware, for instance am=
dgpu for DRI_PRIME rendering.
>
> On Fri, Mar 22, 2024 at 2:48=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
>>
>> From: Rob Clark <robdclark@chromium.org>
>>
>> virtgpu "vram" GEM objects do not implement obj->get_sg_table().  But
>> they also don't use drm_gem_map_dma_buf().  In fact they may not even
>> have guest visible pages.  But it is perfectly fine to export and share
>> with other virtual devices.
>>
>> Reported-by: Dominik Behr <dbehr@chromium.org>
>> Fixes: 207395da5a97 ("drm/prime: reject DMA-BUF attach when get_sg_table=
 is missing")
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>>  drivers/gpu/drm/drm_prime.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index 7352bde299d5..64dd6276e828 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -582,7 +582,12 @@ int drm_gem_map_attach(struct dma_buf *dma_buf,
>>  {
>>         struct drm_gem_object *obj =3D dma_buf->priv;
>>
>> -       if (!obj->funcs->get_sg_table)
>> +       /*
>> +        * drm_gem_map_dma_buf() requires obj->get_sg_table(), but drive=
rs
>> +        * that implement their own ->map_dma_buf() do not.
>> +        */
>> +       if ((dma_buf->ops->map_dma_buf =3D=3D drm_gem_map_dma_buf) &&
>> +           !obj->funcs->get_sg_table)
>>                 return -ENOSYS;
>>
>>         return drm_gem_pin(obj);
>> --
>> 2.44.0
>>
