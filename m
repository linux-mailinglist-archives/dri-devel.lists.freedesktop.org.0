Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEF78AB610
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 22:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6183B10E992;
	Fri, 19 Apr 2024 20:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="bdzVPYbD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C971110E992
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 20:41:52 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4348110e888so19801cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 13:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713559311; x=1714164111;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6K3dsqSlYNszsCn1h++dCBb6+hru/S0oFdAjebQTHM0=;
 b=bdzVPYbDTinwUlZCmou4fa+ni6hPA/cZnh0snxidS4IYDKdibzS2Yh0VjY/8JXwqdo
 v3MTzZBUq6nzCx5lcDCjYFlW4xSaMlR5Nlv+HvEg8BfUyGKktHk9rG+hSd5ZP0S/4tFq
 6zxmIbEVdAYW7Ze/YJI6pNtYaRV2IPAJNFUQzuOQAy8UQzzkNcvPVUnKMy/xHej00gvG
 +J4spUcUzCCqIwrVhU/Y4uSAQVn7a0XS5ZGCYZ5BNKeJ9MnyULFYj2OFoUkfHrwZ3T4c
 T0t6kQbN2rlcKMUqHxVayCwQwemfv+/3F8nwrwFe1LpT0WAXMZT6RMQmKelS3Dh3sPJ6
 p3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713559311; x=1714164111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6K3dsqSlYNszsCn1h++dCBb6+hru/S0oFdAjebQTHM0=;
 b=AKNS64quLCLPDHH2gXklELGPIa5scFDRgAiFLLfgJ8Mb7NXDHLe1HHRNbjMOKqcOCm
 bDhEwKdVvD4RWLQ/pngoR5UyEBnJmETsdykbjTAfJ3w38MYV+mkqKaejg/f4m6YX7sm2
 R+RVo2OWsqM9/sQu9Xv7Gsw224RLBTPJLhtqbq40fblHZ0zD41xRaHxhRlv/KhWmIXsU
 47r6fEixYq6l6HCU834N72W/XwFtVgpDktep3QG4eYnDWCV9oRvayPc7vlCCmWd8LQdF
 cANn09mU/qWRgcZOTgqsqICEL3Hv14euQp2HNuNCJgpzwb7qA4LHkx5GJ6DN2MVTaTnT
 TYXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWs0PdhcMpdat+d74itj1375EpXRgUwfndjo7DPikAUx75f+HrOmCndw3wXOV6qlKd4nfs7z8OaVh1ftfYdAHn49uqU892pyqN3YXm71yE
X-Gm-Message-State: AOJu0YybbdeWIrxYa7Fn6pZZACWM6MPl8JRUl3axtk8j1pIlwRcyBcvl
 kTMSoayBaKMIRGV8cBv3sLtV1NE7+xQcbUXG7g187Zf/1jxvDft3nQcItJWFp0hPvt0fHg5pZap
 Lno+BofqHGrePdzwY35FDBbwf6qkQ8AAIy+ma
X-Google-Smtp-Source: AGHT+IHZbGtaHsrDZJlMeCvL5n3nHY8v9RvCEAZmDRwJuRM5kQHZzdgDzoyAqJc7HDUdc4L091tykzPFVNpxeTYTWEk=
X-Received: by 2002:ac8:729a:0:b0:437:b99c:dbf7 with SMTP id
 v26-20020ac8729a000000b00437b99cdbf7mr9471qto.11.1713559311445; Fri, 19 Apr
 2024 13:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240418124815.31897-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240418124815.31897-3-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240418124815.31897-3-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 19 Apr 2024 13:41:34 -0700
Message-ID: <CAD=FV=X5tk0tCcDa+vLnu0aoas1TDWuqvkMzM-278dOCX8K1gw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] HID: i2c-hid: elan: Add ili2900 timing
To: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, hsinyi@google.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

Hi,

On Thu, Apr 18, 2024 at 5:48=E2=80=AFAM lvzhaoxiong
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> ILI2900 requires reset to pull down time greater than 10ms,
> so the configuration post_power_delay_ms is 10, and the chipset
> initial time is required to be greater than 100ms,
> so the post_gpio_reset_on_delay_ms is set to 100.
>
> Signed-off-by: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>

Please use a proper name instead of "lvzhaoxiong".


> ---
>  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-of-elan.c b/drivers/hid/i2c-hid/=
i2c-hid-of-elan.c
> index 5b91fb106cfc..3073620b2dec 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-of-elan.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
> @@ -137,10 +137,18 @@ static const struct elan_i2c_hid_chip_data ilitek_i=
li2901_chip_data =3D {
>         .main_supply_name =3D "vcc33",
>  };
>
> +static const struct elan_i2c_hid_chip_data ilitek_ili2900_chip_data =3D =
{
> +       .post_power_delay_ms =3D 10,
> +       .post_gpio_reset_on_delay_ms =3D 100,
> +       .hid_descriptor_address =3D 0x0001,
> +       .main_supply_name =3D NULL,

There's really no main power supply for this device? It feels likely
that there is one.

Also: other than the main power supply, there is no difference between
this and the ili2901. If you actually do have a main power supply,
then you probably don't need a new table. You probably don't even need
your own compatible string and in the device tree you could just
specify:

compatible =3D "ilitek,ili2900, "ilitek,ili2901";

...which says "I actually have an ILI 2900, but if you don't have any
special driver for the ILI 2900 it's likely that the driver for the
ILI 2901 will work because the hardware is almost the same."


> +};
> +
>  static const struct of_device_id elan_i2c_hid_of_match[] =3D {
>         { .compatible =3D "elan,ekth6915", .data =3D &elan_ekth6915_chip_=
data },
>         { .compatible =3D "ilitek,ili9882t", .data =3D &ilitek_ili9882t_c=
hip_data },
>         { .compatible =3D "ilitek,ili2901", .data =3D &ilitek_ili2901_chi=
p_data },
> +       { .compatible =3D "ilitek,ili2900", .data =3D &ilitek_ili2900_chi=
p_data },

If you do need this, these should be sorted. 2900 should come before 2901.


-Doug
