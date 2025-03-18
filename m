Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1863A67C49
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 19:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC3610E219;
	Tue, 18 Mar 2025 18:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SL5G1Upk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CCB10E219;
 Tue, 18 Mar 2025 18:53:41 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ac34257295dso262483666b.2; 
 Tue, 18 Mar 2025 11:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742324020; x=1742928820; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kSmaS9SiczKcQtf09ulZT+5WIK4YMWt6OMaokGfRCsg=;
 b=SL5G1UpkaDRCUNDbbWTiEWLH+ogUOG5luXINozJRleNTvnwFBGQSfBCoeDwT9OwbD3
 DCusNuX6n5jCrtov7qL/oJmH8MU2ylnjY0Z8bVYPW6ok5nbixbe2ooyPC27zydIlPfRo
 1HUNwEh8JaPkGFIkZb5sGb/ZFOwK6jV+3jDUY0XT8fQ5X0T6jM/VfaaxY5hvJD55ikAX
 JUNpLnbGYlDjeRIqib/eWEJCtyC9rwiUA4DlugVesMsVXGa1qRJDI5kALcmQLinFHsmQ
 l9Nuod1AiVoySCmKyaX4vQoMgmUyAg8aqIy6aaVvegD6fFSYxUbN8K/hGm0c43Y73V4o
 KhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742324020; x=1742928820;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kSmaS9SiczKcQtf09ulZT+5WIK4YMWt6OMaokGfRCsg=;
 b=jKNta47TDeZG8FoguZWrrcHMZeUF7YO1LnDU0pQuzSWH1Kx7w8lT71Id+q4DCiSIag
 GX0UUUNhl3fb+fAoiWMSIDDl8YqQNOksEpAPGAdTAuEYfkGSMjctGfE7l2NT+7UrI4mv
 FhLqPa9AOSIY6JhtgxUbltcT/TWFHBzdj1zrAYBM6LeGwXFz0HxQUGxR5S+SqWJ0zi3M
 Nr1rWSvZpqklpA3sTwEln3cIMLpAyevIoxnP6aL2Dr/tbe8RxD43zNNhPG3nBoirvCoa
 w5F6CElgguKanFz7V46FWwryt4ew+MLNeiM1fnvqnPgxnwhe1kCtnjPXXqq0laN+Se2H
 pq/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZDLexRbct7AawhVGa2gKLDjxIvU8hmUYTrahkTMZhXsTJszwZW2CZPNJ79m4QOjBYaOKb6QB9@lists.freedesktop.org,
 AJvYcCWgFj+BW+69qYJ3z8op2PeyvH6jviroVGhafe6inToaQj+IObBsEGXVsGFGw2dTti7weLyMoT+J/B1V@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw70MDiaKEvsHWsMwV9DSmAcMDZ34oR9j1wiPM3ve9+UU6f5HKA
 hrs2a9gfyW7qXzeRyytFKiB+lGuXCqlP+wBk0Wkv5xKrAyNhG/mMDHXOU9agguEE+mBWtFWN4Bi
 TvXtpuvMUg0iOYVmigsRpkJNpu9U=
X-Gm-Gg: ASbGncvCzpCjB8t8/Ns+TRzy8I+jDX4pbV2ymcWvJJG5GA/H/JchPmyywckJKSgZacN
 hqP/pzm4wQW2VFcBNthvKBd3dQuG9Hqf2axskL6GYp6gaJ3/RThNXFBXSU/cujf0OQ5r5AYtP+x
 ALO/10XlIQYhtkHfkVCREfq15J5Ig=
X-Google-Smtp-Source: AGHT+IHy0byJnCuVMXrI6AJh5ocZ8SngCGKvQOgZlVqfox+lUeg50TwL+nwFYQw3i7wWPHJ8oVgwl+RCo/bDzBfxPsI=
X-Received: by 2002:a17:907:6093:b0:ac3:17b6:737 with SMTP id
 a640c23a62f3a-ac330489663mr2006657366b.45.1742324019491; Tue, 18 Mar 2025
 11:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250314085858.39328-1-vignesh.raman@collabora.com>
 <20250314085858.39328-4-vignesh.raman@collabora.com>
In-Reply-To: <20250314085858.39328-4-vignesh.raman@collabora.com>
From: Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
Date: Tue, 18 Mar 2025 15:53:27 -0300
X-Gm-Features: AQ5f1Jqexkq1v060b1nOUslkHnhYmXG2PP3WoUMn-4HQvHnlhFu6oru5qnG3QTk
Message-ID: <CAPW4XYb6zci74=maL8bCPDXMV=WZG=M9sFnpNxMX3auELvzUSQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] drm/ci: arm64.config: mediatek: enable PHY drivers
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
 lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org, 
 jani.nikula@linux.intel.com, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
 linux-kernel@vger.kernel.org
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

Em sex., 14 de mar. de 2025 =C3=A0s 05:59, Vignesh Raman
<vignesh.raman@collabora.com> escreveu:
>
> The mediatek display driver fails to probe on mt8173-elm-hana and
> mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
> configurations.
>
> Enable the following PHY drivers for MediaTek platforms:
> - CONFIG_PHY_MTK_HDMI=3Dy for HDMI display
> - CONFIG_PHY_MTK_MIPI_DSI=3Dy for DSI display
>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.fornazier@gmail.com>

Thanks,
Helen

> ---
>  drivers/gpu/drm/ci/arm64.config | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.c=
onfig
> index a8fca079921b..fddfbd4d2493 100644
> --- a/drivers/gpu/drm/ci/arm64.config
> +++ b/drivers/gpu/drm/ci/arm64.config
> @@ -193,6 +193,8 @@ CONFIG_PWM_MTK_DISP=3Dy
>  CONFIG_MTK_CMDQ=3Dy
>  CONFIG_REGULATOR_DA9211=3Dy
>  CONFIG_DRM_ANALOGIX_ANX7625=3Dy
> +CONFIG_PHY_MTK_HDMI=3Dy
> +CONFIG_PHY_MTK_MIPI_DSI=3Dy
>
>  # For nouveau.  Note that DRM must be a module so that it's loaded after=
 NFS is up to provide the firmware.
>  CONFIG_ARCH_TEGRA=3Dy
> --
> 2.47.2
>


--=20
Helen Koike
