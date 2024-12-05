Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8719E5B42
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 17:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8ABC10EF01;
	Thu,  5 Dec 2024 16:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Edmvgw4e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B65110EF01
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 16:24:59 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53e152731d0so1952335e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 08:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733415897; x=1734020697;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ItHEVA7I8S1EP8oyTKl1F93KEEHRVDFUauUtw/1Acb0=;
 b=Edmvgw4eyuFZnuLPZeRcMlwN3b953YCcVJ7vCFsnqazgUt2/dfvSqM2Nel0Ie8+T6W
 lQoFJGD5EO/sLCX8kEKsxEEELwH1NCpGdeXytMq73pdiUfvd3zU7bcUUPonTcpalzQuW
 6jXZaewFEKoAR71eU7EauNRhMAdzxVcFkGr61H9i/gvCQ9/akmk6QDTChOFGoYw7kRFj
 r1svX41qlJYHW08GBf38qy31LScITbkHf1Vp/wwf0SUiqZQCFQCs+n6IwpNQls72L3rv
 EVFWNk7izB+J2bP2sCrw9MquTf6SxJroqc720OpNPOWhI6GGRqi+dwEx2n9u8L/clLDw
 C//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733415897; x=1734020697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ItHEVA7I8S1EP8oyTKl1F93KEEHRVDFUauUtw/1Acb0=;
 b=ecCpWykWRE5Njxl0doGkdql5hBQXtiwLKELgK4xvSxDD2+7B0mNOR7EIerDT9Qpfsr
 1iRxflD1xwHFUiwXcuKciRGkxGBA3gqqI4uWD0rLNZvjC7L/zHg+8GyCV6Eyl9xRHwP9
 b3U3d02TjfLrB/0YWfCDzz/cDQQqGOh0yWwj+R70imiBaAVZF9XzfAdryHzDvM61EFWf
 2JAn5VdtMKPoF2fawY0fILP47iC84pV25zNuKIgcPkViwZrJYvPOP1DJMOxZNS0PPwzP
 vPeW4rqqbHF1Fw5leLgNzbXNdcsMWQrlTYSDrmIE9vCWXmHFxUGCD2/5SK91aH9rXbU5
 Kalw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn8dv73WVuSsc9Hib3Zcb3ZZVlD+S9jyyKmkoiipD36UBvL0C1ZtL4nSD95ytJQtk7xlfDUEHmD7Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfrwHIkz2cE+2TeFilUf4WcGtI1H0dzxt1FcaKbYXpiC+6GkKI
 l5ixC+afcpPKITRaTMzA/qkRRPoTvV11t8cMdJ0NGyPum1WwN8Ot9oDlkwHElRNwx3pZ+cK79mi
 MsxadlHOkpLOvQjkvO5Bkb5hto6/K9TUFFECdYA==
X-Gm-Gg: ASbGncu7KEsNRb8LnpT01CxmM6c0zed+DTOthG+VUI0FioyRjXn45y9Nfz+Hc9J+vcn
 iC/7LsERG4XReKNwx+/aoDU34cIfponfN6SlrwwFymuD/Z8XsS3arrmvsE6MJNw==
X-Google-Smtp-Source: AGHT+IErYJU9bnmgh/S4XgU0jcrMWfkUEiJSX94XfyJ1xliCjLlWQwaDM6P30GxT6teJ6fjjXCYzQKweIZQ1ynm3Yi8=
X-Received: by 2002:a05:6512:4006:b0:53d:f6bc:23ec with SMTP id
 2adb3069b0e04-53e216f74ecmr1077273e87.5.1733415897149; Thu, 05 Dec 2024
 08:24:57 -0800 (PST)
MIME-Version: 1.0
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-8-1611f1486b5a@quicinc.com>
In-Reply-To: <20241205-const_dfc_done-v3-8-1611f1486b5a@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 5 Dec 2024 17:24:46 +0100
Message-ID: <CAMRc=Mf--vRm15N2au-zvP89obcxRuk+3OOLqFtrjgg61_LotA@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] gpio: sim: Remove gpio_sim_dev_match_fwnode()
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
 James Bottomley <James.Bottomley@hansenpartnership.com>, 
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
 linux-sound@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org, 
 linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org, 
 linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com, 
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, 
 netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
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

On Thu, Dec 5, 2024 at 1:15=E2=80=AFAM Zijun Hu <zijun_hu@icloud.com> wrote=
:
>
> From: Zijun Hu <quic_zijuhu@quicinc.com>
>
> gpio_sim_dev_match_fwnode() is a simple wrapper of device_match_fwnode()
> Remvoe the unnecessary wrapper.
>
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>  drivers/gpio/gpio-sim.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 370b71513bdb529112e157fa22a5451e02502a17..b1f33cbaaaa78aca324f99c45=
a868e7e79a9d672 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -413,11 +413,6 @@ static int gpio_sim_setup_sysfs(struct gpio_sim_chip=
 *chip)
>         return devm_add_action_or_reset(dev, gpio_sim_sysfs_remove, chip)=
;
>  }
>
> -static int gpio_sim_dev_match_fwnode(struct device *dev, const void *dat=
a)
> -{
> -       return device_match_fwnode(dev, data);
> -}
> -
>  static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device=
 *dev)
>  {
>         struct gpio_sim_chip *chip;
> @@ -503,7 +498,7 @@ static int gpio_sim_add_bank(struct fwnode_handle *sw=
node, struct device *dev)
>         if (ret)
>                 return ret;
>
> -       chip->dev =3D device_find_child(dev, swnode, gpio_sim_dev_match_f=
wnode);
> +       chip->dev =3D device_find_child(dev, swnode, device_match_fwnode)=
;
>         if (!chip->dev)
>                 return -ENODEV;
>
>
> --
> 2.34.1
>
>

Please use get_maintainers.pl to get the complete list of addresses to Cc.

Bartosz
