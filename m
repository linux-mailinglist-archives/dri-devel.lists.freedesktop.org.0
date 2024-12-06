Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2AD9E61A6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 01:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24A710EFE1;
	Fri,  6 Dec 2024 00:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ddQV5noL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06AD10EFE1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 00:05:34 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30020d33d05so12448701fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 16:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733443533; x=1734048333;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TOo5o1IkcWYIYeHg+0oB2U3HqNWFzIG3pPjklrK0UCc=;
 b=ddQV5noLwgT4CB4SPw4s44nv+dmVx6YnVVAmuvWEQQ0lqL2qay6RF74OyL4GoPcUjl
 kc2bgm9gCm+JWym0Y77q8noDyeXW3/pU3yXE5ZsjbM97yTkln8G5ynx8G9RkgHy/Onh8
 Qz5s7FXBQGxj2/15sG32PdVCLhv5lsV07uGfOs7rVXiJAXLSYeVygZnvt1nqJzRWQGqr
 WHdkmfI/kEEVva6+Mdzch1y3SORzcq5QXwVId+c6E3xHgR/IhGX6B2dblX2+uqB7XP0o
 ZSgl4tfIHTCs7vSCCXO9y5xq4AqRorFhCV7HjyUUVz9trMYRB/JE9AtAKZvrP7my2ouW
 7BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733443533; x=1734048333;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TOo5o1IkcWYIYeHg+0oB2U3HqNWFzIG3pPjklrK0UCc=;
 b=dZqpHpnzdOWpXR4F4cG8wImWvrUfaYGeyDfkxxv3JZaR/YCbH7bBSZKWEZx6EZmfF9
 W0j8NI/bZ7KoWQBE8tABgzEhfZmApLsTB8qjuz8KI4oXYmLLrhFczMTYRWnYtQCmSrBY
 HmI7ZG0XWS+9zd0niXdakqYxMF587uCe1RbvzmCGPj5eo/cGhBI2Mzyvh0O8nyEw88It
 1rhKOSCRSa3G6LMg9NNwf0vKyFQjep/4+HI4oyVOB44kMKqfktpWOEsit3QOzKdZiGDy
 bPFV6CN6KEsWClO73O7CiWtxC9s5vXL+JFxkIamGg7Tt3POgpWRtrloQ+E6CPXthUeQW
 tUpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHsuwNqpPgkZMT0DfatmHHoit4N6lvNrHdm0lhvwIoj/AFEkbOE8kVSl937m7tRfvBuXM1IQp407s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnrNMvD5svDvwm4v9kJSEsRR2LEm3FRXNvFD9l3izL+PLSoMKW
 4P54pCYwXcvM4/i6rFRGvBfVfSdbRJCwyiWQk/Jz8xeA3lORD/Oh1qs7oXeX3D1YtEiOQd/bi/L
 3XKJFcFMrg+AESilHo436FFQ6OvX4FhoZIthI
X-Gm-Gg: ASbGnctCSOySArpV1Uz2gR2bZcCrUtmbdlC6sm144javQxDE9RkcYRM7tdk1+RUaTdL
 oOZ0f2vbhlITOqvRkuYXp+C3gb6enhg==
X-Google-Smtp-Source: AGHT+IGyZ/TZMqzTp8+it+xJqPWDkQKwRdqrGP6nkAD/oOmQhsRauaZCXRwfpEP8IRWA2Z0RTrR2gBDTeLWDpYubwUw=
X-Received: by 2002:a05:6512:1189:b0:53e:18ac:b1fe with SMTP id
 2adb3069b0e04-53e2b6ba9abmr349123e87.1.1733443532699; Thu, 05 Dec 2024
 16:05:32 -0800 (PST)
MIME-Version: 1.0
References: <20241204221859.2248634-1-sashal@kernel.org>
 <20241204221859.2248634-4-sashal@kernel.org>
In-Reply-To: <20241204221859.2248634-4-sashal@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 5 Dec 2024 16:04:55 -0800
Message-ID: <CAGETcx-u9BuPLiJ+Hn_29xmR_W3d7jC=uPFsw70eC65CZ_9UtQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.1 4/8] drm: display: Set fwnode for aux bus
 devices
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Thierry Reding <treding@nvidia.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 matthias.bgg@gmail.com, sumit.garg@linaro.org, ricardo@marliere.net, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
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

On Wed, Dec 4, 2024 at 3:30=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> From: Saravana Kannan <saravanak@google.com>
>
> [ Upstream commit fe2e59aa5d7077c5c564d55b7e2997e83710c314 ]
>
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
>
> mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) wit=
h backlight-lcd0
>
> Reported-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@=
notapiano/
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
> Link: https://lore.kernel.org/r/20241024061347.1771063-2-saravanak@google=
.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

As mentioned in the original cover letter:

PSA: Do not pull any of these patches into stable kernels. fw_devlink
had a lot of changes that landed in the last year. It's hard to ensure
cherry-picks have picked up all the dependencies correctly. If any of
these really need to get cherry-picked into stable kernels, cc me and
wait for my explicit Ack.

Is there a pressing need for this in 4.19?

-Saravana

> ---
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/d=
isplay/drm_dp_aux_bus.c
> index f5741b45ca077..951170e1d5d14 100644
> --- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
> +++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> @@ -287,7 +287,7 @@ int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
>         aux_ep->dev.parent =3D aux->dev;
>         aux_ep->dev.bus =3D &dp_aux_bus_type;
>         aux_ep->dev.type =3D &dp_aux_device_type_type;
> -       aux_ep->dev.of_node =3D of_node_get(np);
> +       device_set_node(&aux_ep->dev, of_fwnode_handle(of_node_get(np)));
>         dev_set_name(&aux_ep->dev, "aux-%s", dev_name(aux->dev));
>
>         ret =3D device_register(&aux_ep->dev);
> --
> 2.43.0
>
