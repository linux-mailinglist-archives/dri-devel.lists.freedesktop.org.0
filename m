Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D232939770
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 02:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035DA10E15F;
	Tue, 23 Jul 2024 00:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ebB1JwQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B979F10E15F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 00:22:38 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a77d876273dso4979566b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 17:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721694157; x=1722298957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1IDnbLkQQtMQ6kQyTxGOcLjUBXyXI0SK/keZnMNe+rY=;
 b=ebB1JwQ+bMOj5ROM/TzeAwpljJS1FwJzS3ipLAMY0svhWiMIL3DlX8OV6hvnmnuvNy
 miSpmpUir3aR6/8GIoMLje3lTSGtOpBGyMnqLyBrqrBPtOoJOJF1eo0C/b5uQY8IEiq1
 VdWQmz4NY6fISFXNtfXqGWXdmcOXZ7Ne9tGnjGrpz0vN1jauwd5V27tO4Ud2Ld03NzJn
 eaRqx6tpdiqGCa2w/kh+y/rM+DvBwtKhjPccOVkbHLwxPAxVc12CTqVt0RfiiLhekZ/4
 dI614Xnh7DorXLworgGdfm4b0SMN3gonIpzOPj9Oxh8xXsW0f2AlWsTRs/yjDb3yjWR9
 I3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721694157; x=1722298957;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1IDnbLkQQtMQ6kQyTxGOcLjUBXyXI0SK/keZnMNe+rY=;
 b=oXJDUjOlmFjqL7B1kkiV7t5mBSk/2o9Xrr+Hfmu3eW1wY/a9x0+j66bXV7WhCwxcWy
 1PQfgjbQq38asn075t3C8CC8sjVNKCmYZP3sPi9Arid2N0puZ3sPEdhZ1M3FWiqxtxTI
 bxXRaDVTpBuyrBXhLU0hLqB6lxydmaaTm0l0JYJyKxxX3SNhwY8gKkuDC94iGfzUMyir
 JdXUbt64rHPFgepTu26RCRtxBGAjP0MaPsgOjcXDD9gkBtjslpkzBBcvdhW8oyXex2+H
 t457+2uZXLYVNXnggos9yrYVjTl18URqQ9qVMplg6Ae72RPot+zmbSDSe6qUSiwbA7MQ
 NrCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTKMc2gtf8pm7mJGGs7zCGSisfE4IqhJiGELn5pkhLQ21QwmkQFVHv7yWtszPncW4Vnp3PR5FXavRGh0fRGKcwikMpkFY8ZmhxWTDpPCvW
X-Gm-Message-State: AOJu0Yw6YZvx5zItNM/g4zQVMLBJJWS645uCnoD1MjAO+u4DgAX4tVf8
 uhE4Ilek4xPm5KJPseaEkh94o00Nl/Gw1oF4da0TJgcwRUgijv6GcJ1qe/T+E5SZrWHgUs/EQcf
 O6yX9lMgf0A2iPgYu4L21Eb9Yq+c=
X-Google-Smtp-Source: AGHT+IHRrV30Umrj2invF+QgSSaiARUTcgai0f2Y+fcs8EmS40cP4uj1AShQIHt7CW3NCZhxGUnRtzIoM7WD9qX3i4I=
X-Received: by 2002:a05:6402:3553:b0:5a0:d004:60c6 with SMTP id
 4fb4d7f45d1cf-5a479b6fdd6mr6010217a12.18.1721694156778; Mon, 22 Jul 2024
 17:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240714205502.3409718-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20240714205502.3409718-1-dmitry.osipenko@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 22 Jul 2024 17:22:24 -0700
Message-ID: <CAF6AEGtcfUUBwYy29y2_mZ=Ej_hTRyY-9w5ApEJKkUumeNuZ7g@mail.gmail.com>
Subject: Re: [PATCH v1] drm/virtio: Add DRM capset definition
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

On Sun, Jul 14, 2024 at 1:55=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Define DRM native context capset in the VirtIO-GPU protocol header.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  include/uapi/linux/virtio_gpu.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_=
gpu.h
> index 0e21f3998108..bf2c9cabd207 100644
> --- a/include/uapi/linux/virtio_gpu.h
> +++ b/include/uapi/linux/virtio_gpu.h
> @@ -311,6 +311,7 @@ struct virtio_gpu_cmd_submit {
>  #define VIRTIO_GPU_CAPSET_VIRGL2 2
>  /* 3 is reserved for gfxstream */
>  #define VIRTIO_GPU_CAPSET_VENUS 4
> +#define VIRTIO_GPU_CAPSET_DRM 6
>
>  /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
>  struct virtio_gpu_get_capset_info {
> --
> 2.45.2
>
