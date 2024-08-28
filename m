Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B0F9631A9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 22:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C24E10E5CE;
	Wed, 28 Aug 2024 20:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eGYWzTkI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2A110E5CE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 20:20:55 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2f4f2cda058so9588191fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 13:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724876453; x=1725481253; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nwUxJc2b8AqTNYoiX9A0Lmc4awHUA406R4myUy6OJFo=;
 b=eGYWzTkIDQ42sJ79OqH0Uxg9F+jTQvVU9lvXsEjoNrvzmczsDVGiRLpCV1VHZ963HV
 EmlBSQYsvh0BW5GeiFZb3zT11jfBgov+596dAmlTRJi9aQ3fvvURGPhtD9gtXYuT+JHo
 gm35ZEnC8oD0q5NL7tIdM9PxTKPCUveArguwJswwB8ospUPfp5mhFHW7OAlMccADVsku
 5he++07JeQ/1xIDyu76HYOC5t42q8/fGnzg+F8/DoIAuHIZ5mJhc2hNUNg90fD2ydcxy
 Ec95loe0GP8k5IjHPDkMehmTl/HPjZ6Bd1923J9KP1TNHkfz+pN3LmzgxhldJoj8gQZG
 qOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724876453; x=1725481253;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nwUxJc2b8AqTNYoiX9A0Lmc4awHUA406R4myUy6OJFo=;
 b=F2EgGoQl8axNya39z2lXTbVqJ+uNWRoO+RgaKkkNB1qsetqd+8INp8B3stWV8nq+jH
 eqDJcOuAUqDzP7VWbtATuREV2ERTzbEmBPmUVHWhZIyQD2kjcdxWckSh4lILIuqwBO9r
 czLgL08RN5yROdP6PvQ5rib968FGwPOth93h8kyJmFBpqsPqGY8O8jJyGNbwNNQQbAIK
 pSCLJYnj7Q2b0f9isTydYk3I3o+t+V4paQwiHbEXqkX89GGC56qcSZMSQ2OSq6nfHfWa
 XKb8rLOVcw0tDKP/FvbiLrrb0r3I6M+oLt2d39+kqjGMPi83UFBwXQVnxN0gAU/VEpAZ
 Ufkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvQSkx0gwhJvX9bBis26+cbKVm84Pl27lkhsPUHhy80GzJgEcvDkzQ4e7JwvDwWU74vgkcQLcYHLs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiYkfeBTfhF5jVGpud3vFXd4XPAXiZolyMEDewKWVDJl4o9Hsx
 2/3MemcJHGtyLS5dnR+lpbMmB4+TmTwGGLYfFFl5ztNzl0h3KTCsvLYB26DheZL/WNP8JpsFyFT
 HwuHSQzzBV1afK7o3VWSkWqR8MQtPEQ==
X-Google-Smtp-Source: AGHT+IHC7eWAn1aEXwu8rZpFPCvfOG4SgTdp/J5GwH/NSUhZQiAJEu+VQZsMDlLkNBO0v8lPCyj2UJ9YaKo14gcLToI=
X-Received: by 2002:a05:6512:234a:b0:534:53d7:c97f with SMTP id
 2adb3069b0e04-5353ebdb303mr75928e87.23.1724876452895; Wed, 28 Aug 2024
 13:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240626230704.708234-1-festevam@gmail.com>
In-Reply-To: <20240626230704.708234-1-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 28 Aug 2024 17:20:41 -0300
Message-ID: <CAOMZO5AN3aL8QPTFsjZ5MFhd9Qn1ZPfAFZCx8ncs94=6toWqkw@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/bridge: imx8mp-hdmi-tx: Switch to
 SYSTEM_SLEEP_PM_OPS()
To: rfoss@kernel.org
Cc: neil.armstrong@linaro.org, victor.liu@nxp.com, 
 dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@denx.de>, 
 Marek Vasut <marex@denx.de>
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

A gentle ping on this series.

Thanks

On Wed, Jun 26, 2024 at 8:07=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> Replace SET_SYSTEM_SLEEP_PM_OPS with its modern SYSTEM_SLEEP_PM_OPS()
> alternative.
>
> The combined usage of pm_ptr() and SYSTEM_SLEEP_PM_OPS()
> allows the compiler to evaluate if the runtime suspend/resume() functions
> are used at build time or are simply dead code.
>
> This allows removing the __maybe_unused notation from the runtime
> suspend/resume() functions.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/dr=
m/bridge/imx/imx8mp-hdmi-tx.c
> index 13bc570c5473..4a3a8a3ce250 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -111,12 +111,12 @@ static void imx8mp_dw_hdmi_remove(struct platform_d=
evice *pdev)
>         dw_hdmi_remove(hdmi->dw_hdmi);
>  }
>
> -static int __maybe_unused imx8mp_dw_hdmi_pm_suspend(struct device *dev)
> +static int imx8mp_dw_hdmi_pm_suspend(struct device *dev)
>  {
>         return 0;
>  }
>
> -static int __maybe_unused imx8mp_dw_hdmi_pm_resume(struct device *dev)
> +static int imx8mp_dw_hdmi_pm_resume(struct device *dev)
>  {
>         struct imx8mp_hdmi *hdmi =3D dev_get_drvdata(dev);
>
> @@ -126,8 +126,7 @@ static int __maybe_unused imx8mp_dw_hdmi_pm_resume(st=
ruct device *dev)
>  }
>
>  static const struct dev_pm_ops imx8mp_dw_hdmi_pm_ops =3D {
> -       SET_SYSTEM_SLEEP_PM_OPS(imx8mp_dw_hdmi_pm_suspend,
> -                               imx8mp_dw_hdmi_pm_resume)
> +       SYSTEM_SLEEP_PM_OPS(imx8mp_dw_hdmi_pm_suspend, imx8mp_dw_hdmi_pm_=
resume)
>  };
>
>  static const struct of_device_id imx8mp_dw_hdmi_of_table[] =3D {
> @@ -142,7 +141,7 @@ static struct platform_driver imx8mp_dw_hdmi_platform=
_driver =3D {
>         .driver         =3D {
>                 .name   =3D "imx8mp-dw-hdmi-tx",
>                 .of_match_table =3D imx8mp_dw_hdmi_of_table,
> -               .pm =3D &imx8mp_dw_hdmi_pm_ops,
> +               .pm =3D pm_ptr(&imx8mp_dw_hdmi_pm_ops),
>         },
>  };
>
> --
> 2.34.1
>
