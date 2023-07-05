Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0419074888F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 17:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF02B10E39F;
	Wed,  5 Jul 2023 15:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C5410E392
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 15:55:06 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fb960b7c9dso10748748e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 08:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1688572504; x=1691164504;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzOBrr/al5X33JSAEKsRQuxl5E5IcnA1lAlycYyforo=;
 b=Vm1Z7ycv4B7tVxRXoETYTU2yYFzPlDhDeWr5yXZeD9TDjOvCApr/YZuya5fDdv9Q3p
 ikisOpSKR0iybSVcSEyd8WY9Qx0UseyHBJQVcB3pYsopMg+CV17v09sou1bcrz0H0cSR
 GFwTp7AF0r3W1RqRYOAocgOCQGuAu8jV6dBwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688572504; x=1691164504;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kzOBrr/al5X33JSAEKsRQuxl5E5IcnA1lAlycYyforo=;
 b=IhaOeIKLaYFv9lOc9INqEDB0IbeHdT1ULIj1Yt4AobOlmE6XjQMYeYY+nEp64DXfZw
 kGYtw5ON90kszLVfRPeiCB8KMTu502tbKXjuJVw7vnWM1C5OCmzUZ7d585zFDUwQrqu+
 xUIEawIY706z40xyHxT9I14kkD6XKKt8ft9uy1XXvNcCkgREyeco1huYAI2bePX8dyyL
 SAqQnzLRO09KYJHJGPwLlXw6njD5kjuitdLHnw5iR/Aokyas86CVO7cMDT7QAYMf1ZKj
 J5lTEj67ZApfpAKx55XlGOtA87GcLskgr3I5sut92oAc017f2+pLEQqO2g5xZBLivaMS
 7Vvg==
X-Gm-Message-State: ABy/qLb/UpaJQzj5EV9hUiMVpJtjqrxwc7b9rQeF52u+xZMZlYwghY7x
 5+S7FjNaqJaOOY5Q+UogRfa5maOzxxrYsoxRxSVyKQ==
X-Google-Smtp-Source: APBJJlH4mDyVCuzhpXpkYJAgADQ+ukE8y9PB51BRk4ETJOT9D+DBqGIQdt1XJGXj4ZA5zmxVcZzkUw==
X-Received: by 2002:ac2:4f0e:0:b0:4f8:67aa:4f03 with SMTP id
 k14-20020ac24f0e000000b004f867aa4f03mr13713077lfr.1.1688572503751; 
 Wed, 05 Jul 2023 08:55:03 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com.
 [209.85.208.47]) by smtp.gmail.com with ESMTPSA id
 d5-20020aa7d685000000b0051e0fc8254asm3954043edr.28.2023.07.05.08.55.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:55:03 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-51ddbf83ff9so29886a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 08:55:03 -0700 (PDT)
X-Received: by 2002:a50:8e58:0:b0:51e:27ac:8f9a with SMTP id
 24-20020a508e58000000b0051e27ac8f9amr61460edx.1.1688572502742; Wed, 05 Jul
 2023 08:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230628155838.589-1-gurchetansingh@chromium.org>
In-Reply-To: <20230628155838.589-1-gurchetansingh@chromium.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 5 Jul 2023 08:54:50 -0700
X-Gmail-Original-Message-ID: <CAAfnVB=zei+ci2xsEEcJpD+APi7kkWo_e4M+zytSsKV8mryBaw@mail.gmail.com>
Message-ID: <CAAfnVB=zei+ci2xsEEcJpD+APi7kkWo_e4M+zytSsKV8mryBaw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: conditionally allocate virtio_gpu_fence
To: dri-devel@lists.freedesktop.org
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
Cc: acourbot@chromium.org, dmitry.osipenko@collabora.com, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 28, 2023 at 8:58=E2=80=AFAM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> We don't want to create a fence for every command submission.  It's
> only necessary when userspace provides a waitable token for submission.
> This could be:
>
> 1) bo_handles, to be used with VIRTGPU_WAIT
> 2) out_fence_fd, to be used with dma_fence apis
> 3) a ring_idx provided with VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK
>    + DRM event API
> 4) syncobjs in the future
>
> The use case for just submitting a command to the host, and expected
> no response.  For example, gfxstream has GFXSTREAM_CONTEXT_PING that
> just wakes up the host side worker threads.  There's also
> CROSS_DOMAIN_CMD_SEND which just sends data to the Wayland server.
>
> This prevents the need to signal the automatically created
> virtio_gpu_fence.
>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> Reviewed-by: <dmitry.osipenko@collabora.com>
> ---
>  v2: Fix indent (Dmitry)
>
>  drivers/gpu/drm/virtio/virtgpu_submit.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/vi=
rtio/virtgpu_submit.c
> index cf3c04b16a7a..8c7e15c31164 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_submit.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
> @@ -168,9 +168,13 @@ static int virtio_gpu_init_submit(struct virtio_gpu_=
submit *submit,
>
>         memset(submit, 0, sizeof(*submit));
>
> -       out_fence =3D virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
> -       if (!out_fence)
> -               return -ENOMEM;
> +       if ((exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) ||
> +           ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX) &&
> +           (vfpriv->ring_idx_mask & BIT_ULL(ring_idx))) ||
> +           exbuf->num_bo_handles)
> +               out_fence =3D virtio_gpu_fence_alloc(vgdev, fence_ctx, ri=
ng_idx);
> +       else
> +               out_fence =3D NULL;
>
>         err =3D virtio_gpu_fence_event_create(dev, file, out_fence, ring_=
idx);
>         if (err) {
> --

Ping for additional reviews or merge.

> 2.41.0.162.gfafddb0af9-goog
>
