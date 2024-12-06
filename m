Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7ED9E61B2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 01:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720F510EFE7;
	Fri,  6 Dec 2024 00:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="x3izjmvN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDEA10EFE7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 00:06:41 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53e29c00ff2so540093e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 16:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733443600; x=1734048400;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GqZWstnvS5M7KlsauJVlhYbS8zK4ZfCAjPX+o2siRvQ=;
 b=x3izjmvNVH+qz/VmxNNi9WqfNAI05vxblSqfwvT4KsZ8pE42Ysz8yzjJ/B6FleUoNK
 JSNOgNkQOWHtZ1N9UnFqdcXTyumaO7i6J9Aj+LnZXKKgVxr76vn4JCqH0kAdb4VAD0gY
 yF+22tcODaiaLePtOvO4nkAcs73UtMz517dskj0jR9FDWPrAzQcHD2bwyZ7rZnzBnxvt
 +jeadwtlZDSyBEWz+MPs77Jr/QImj2UikG2stFnwdiT0mG9sfnfbDPx1d52t0EIR87vI
 SroPoN93l4zhMBiDGGwSCUoVIJKliV984ElBBEMqOFWw4LRTY8aLyzCNpgxTOaC8OT3a
 EOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733443600; x=1734048400;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GqZWstnvS5M7KlsauJVlhYbS8zK4ZfCAjPX+o2siRvQ=;
 b=J3dN7aIeeCPRwdJqOn2zfVAMtZVe8lLeiu4yepCDh0702OoK3AF/nq58JaSbO3zgk/
 i8iP6fUHs24mBRi+HMdGR64adSZ2nnwk+5AyMfWJjaGNVj7Co6JZFktTNoLmoyuGGrNm
 pi5R8pZ4srNTYxmy2LjgTAg/glNp435HVztbEn6tTjX6AEzD9iKraV7wROuCW/qns5ms
 mXaOUl0o7ZEJ+jr55+Ia5M3jvHjZ1l9s07ulBLskVyALkeElP618p5q6Aw17WYRpMmu8
 yVddlytgGScRkzOTaI0m9I4OCZaf6EkBnvcLq2kzoGrcRRGfzlzyubLa+ux/d196U6pq
 25Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyhq/oRl2PYn5Xxq+DLawZLyG2zuFYrces8H/h5YQ+7fm4pL3I6YeZfNaWpoVDxyZF8uDKcUk0VUE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwM0fa3V/zuvsPhE/fuaUzVfClSbumh7aUxQl10uJEVn9UOgmZy
 Oql9uyUDB49lLDZfgPgv1jclvynuqYznEsDrDA5pmA/t/LUaaJz5LEYFcPvibOJ9+zE1RparCqz
 l8TfwsZJ2zSkVPKMBPKdi6IfJqpjMgP/CLRmF
X-Gm-Gg: ASbGncss/XUzumKpi4xnmBf9msF4GB/xRN6hoxwSuJsw1fPB8KK8ALHlA9ryKgk/5qr
 mfNSULDSa1iwgCfetiK4PWE9aN4X3Mw==
X-Google-Smtp-Source: AGHT+IFMKCgNjf7EuTIfzy1U+mxlTHH4A6RijBLU54vNTWXHVXJQWJqIB/kHPOOCzpMc5RVjG0prBUt0JknyJqn08+E=
X-Received: by 2002:a05:6512:4024:b0:52f:ca2b:1d33 with SMTP id
 2adb3069b0e04-53e2c2b8f76mr213110e87.20.1733443599437; Thu, 05 Dec 2024
 16:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20241204221726.2247988-1-sashal@kernel.org>
 <20241204221726.2247988-8-sashal@kernel.org>
In-Reply-To: <20241204221726.2247988-8-sashal@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 5 Dec 2024 16:06:02 -0800
Message-ID: <CAGETcx8bhzGZKge4qfpNR8FaTWqbo0-5J9c7whc3pn-RECJs3Q@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.11 08/15] drm: display: Set fwnode for aux bus
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
 matthias.bgg@gmail.com, elder@kernel.org, ricardo@marliere.net, 
 sumit.garg@linaro.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

On Wed, Dec 4, 2024 at 3:29=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
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
> index d810529ebfb6e..ec7eac6b595f7 100644
> --- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
> +++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> @@ -292,7 +292,7 @@ int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
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
