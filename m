Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D809E61AC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 01:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE5110EFE6;
	Fri,  6 Dec 2024 00:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="tW2coqxF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2487B10EFE6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 00:06:15 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53ded167ae3so1498579e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 16:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733443573; x=1734048373;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d3TPBP6t+GJK9sLABw7iuDGZ/6x8FUIQxd10a+gfRfo=;
 b=tW2coqxFxu9R5cIIpG9LBhJg91zCUjaMuBS2ZCr22EHeFTD8zA89JSWBxR+984WyEe
 Km3K+oAMSJsaogHBd6BpJo+KyXgHMa6FA9DfqVDwNaBXAaxHZV28f8Q4ipb1xFNdQSRf
 QDzazNDiQIIHmLo+yQTkakM+3/p4Kh7bhOaMJA4IBVgueTtZnaTbHppS+OcSx7bXqUKR
 izH6zbHe3ed1sCs3SJyWhHOeIs10yKk5scwTCkpOFHr9wL3BB61JEQfEQhunTqfhrRye
 5MOcVsVshEsNIYoOy5doZbJr81bNHD7NRKxy4E2a3O/DSKMlzk2cfcI4NSVgR9lELwmr
 3L9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733443573; x=1734048373;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d3TPBP6t+GJK9sLABw7iuDGZ/6x8FUIQxd10a+gfRfo=;
 b=CoEUj/FRZPLW6CtljOg4ZZ2Hh7mNrV+7TKFV6Fu0xHhJ2i2ySFVQ8PiFZG2fpahg70
 981pArlWCfUGjrdLIpYsXnNxTIRuDcRAOWYGIRSkK2yLZaewvhxkEy+Bi8YSNf6WmHyx
 4OcOFZ5ab+pCkXgr9T33wkOhwtQoruEchUmZX2vPPIsmG69srvWSsEYd5gRHN7FY9KLQ
 9W5a5RCHfgwhmy1lXp4NpJ0yTvskXSbBowJPhsko2RWvcXDHhyWLWJaHSTYGdlHB7hiY
 OrBq+XRT2ahSBvl4HbL6pWo/53qMAKjDu4MCrJL+uRU2Itx/jzDcAT0mVEf/Fl7rtp5b
 QUWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVMw7T4BucvWAwoWGS3hhmVExaVYzJmrMzZ4Oxd1Z8P0jPQTaUvukMiRySGyFimCrWA6ztJB9mLVE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7obL8nU8tPARoYiAluOamfrUmAWxEEl6oha9lIA1zOT1NwSwc
 soU/Hx4cbkgI8wxVZF+eSj6v+HO4Dkw3QooIRPaYqxEqM2xF6cfqDB58K5LgcoL2wcCOuXKOfVu
 JMFrvgvyH5xl5xmQXJ8GtxJTFfAj4DLoaxH1d
X-Gm-Gg: ASbGncuCztHD/EHz2DpitiQmGux0utBh4Bnx3FTJq/Gt1g96qhmLUanD8mLwSMHVjCO
 5LSNKR5cuaKfCvr75ywWa8fMLPbPrVA==
X-Google-Smtp-Source: AGHT+IENUCJT3jmuSq+uuBSoJsgvgSBDBHg4ob0uMlJQb0PpgFG3hX9cyDh1XGO4hDnpY6OiQOw6us+nrtPgXeARTyM=
X-Received: by 2002:a05:6512:104e:b0:53e:2116:fd2f with SMTP id
 2adb3069b0e04-53e2c2ba477mr238894e87.24.1733443573131; Thu, 05 Dec 2024
 16:06:13 -0800 (PST)
MIME-Version: 1.0
References: <20241204221820.2248367-1-sashal@kernel.org>
 <20241204221820.2248367-4-sashal@kernel.org>
In-Reply-To: <20241204221820.2248367-4-sashal@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 5 Dec 2024 16:05:35 -0800
Message-ID: <CAGETcx9RpUz0hR-X+rO6yKRxOmrMLveU7EMSACF49kMTMqdaRg@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.6 04/10] drm: display: Set fwnode for aux bus
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
 matthias.bgg@gmail.com, elder@kernel.org, sumit.garg@linaro.org, 
 ricardo@marliere.net, dri-devel@lists.freedesktop.org, 
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
> index 8a165be1a8214..d15c0f184983b 100644
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
