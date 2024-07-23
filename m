Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDB993976C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 02:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AA810E140;
	Tue, 23 Jul 2024 00:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AZOJKWfM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5D810E140
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 00:21:53 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5a1c49632deso4382178a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 17:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721694112; x=1722298912; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WxdDwCRz7ozxZHtp57qu+Ykoq2klaLRa7AGSsUAt4yM=;
 b=AZOJKWfM9Vbh6bqdiesYScXynYINEEWW2F8YGDE2aS6HVnS+pFmrQv7Pxw+y3iGy1G
 WI9WeHtzziX6yidx/1t1hYFajN9sOkh2VXxN8rfey1nU1b+hIgRjdmSbHhtp+NB/2C9J
 HJvLcupFdrygebGVQKCJ53rzKSIbJCO+sFLD5ngapCvtTyCyWGZI8m8Mwfy96h+QhkSp
 hiGkxKXWNfpBhE3Pv2cokTH3z3tBLaXn0npG6FQoH3trdShmicfu6xHZ3djln1oSvaFi
 n5JYUw8hvAfBVkMR7U4tXfAcZvXtETR3elieBapPCyTpRXNr7yXh/jwu0/7SNHWLu/uz
 NZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721694112; x=1722298912;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WxdDwCRz7ozxZHtp57qu+Ykoq2klaLRa7AGSsUAt4yM=;
 b=eC1Pcg+j+6aDV1ijBLOJBy0g7fVgdN3aYsGt0G+Cf2iqBJW++LkiPmUN0UitOoo+VV
 CNfanppNR4nlA66xnjtfZ+sUqP8ApmChJfuwzfSPIO7BuaRx6vvE/sBca9N7mOpgqLWP
 Lkg++y4utxTeBymAzg8qsMob8f7cwciHA50LWWqsf9CCfTQpBuT39PvR9SPRTymVEQaF
 ArpcbiKKw66FTGGkPYcs4+ACO0i3OHqECR08GHCFFRKiTvCODGKBvbymS/wv+kYtP4JJ
 Llo0sUHmkpqS4x2FAL6reyOIZDodlI+6VXfQJacKm35QbxsWUXOlfwQHA6qKvESDZjSm
 1e6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqEV2vYGf2QtZ8FvpjdAv947MxVdOtrejehDOXMfqKNop8flPXVCY0JlKOlmvQivy2GhB0XE9xBwIJ/7BgC/SC6YqxtHdTnpg2x46CVX9q
X-Gm-Message-State: AOJu0Yx86NBiLPVZDzXjdtqq6MZZfKuhMbD4LBIy+2Fqlcdovv+n3NRo
 UphPhS31K4Bt+Xwx0v/yfhJdNmrcc1CTy1y+VoAH1gmieniyjX1bHYSpAzxw+efvYmPSX/EO6uh
 HdUMfD6Q1s+9NEEexyWpABt1TPWE=
X-Google-Smtp-Source: AGHT+IEZvdBDCMwaoXYKZpcMa7a8A6QNTz7LHwDIsJw9zi/h7TsyJ/jr09fN3E4nOwt5sRiLXagUkoZieuL/S32CgrU=
X-Received: by 2002:a50:a6ce:0:b0:5a1:bda1:3e23 with SMTP id
 4fb4d7f45d1cf-5a477e833e7mr5028885a12.14.1721694111704; Mon, 22 Jul 2024
 17:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240714205009.3408298-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20240714205009.3408298-1-dmitry.osipenko@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 22 Jul 2024 17:21:39 -0700
Message-ID: <CAF6AEGutuf_B7fHH-SzBSWC0=tUbCk2MtRo7qWbvGCrqMVTLYg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/virtio: Fix type of dma-fence context variable
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com
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

On Sun, Jul 14, 2024 at 1:50=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Type of DMA fence context is u64. Fence-waiting code uses u32 for the
> context variable, fix it.
>
> Fixes: e4812ab8e6b1 ("drm/virtio: Refactor and optimize job submission co=
de path")
> Cc: <stable@vger.kernel.org> # v6.4+
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/virtio/virtgpu_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/vi=
rtio/virtgpu_submit.c
> index 1c7c7f61a222..7d34cf83f5f2 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_submit.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
> @@ -48,7 +48,7 @@ struct virtio_gpu_submit {
>  static int virtio_gpu_do_fence_wait(struct virtio_gpu_submit *submit,
>                                     struct dma_fence *in_fence)
>  {
> -       u32 context =3D submit->fence_ctx + submit->ring_idx;
> +       u64 context =3D submit->fence_ctx + submit->ring_idx;
>
>         if (dma_fence_match_context(in_fence, context))
>                 return 0;
> --
> 2.45.2
>
