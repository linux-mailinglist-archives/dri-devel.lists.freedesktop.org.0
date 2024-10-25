Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904749B0A12
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 18:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE2E10EB1E;
	Fri, 25 Oct 2024 16:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vRvNwD4c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5330B10EB1E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 16:37:12 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-539fbe22ac0so2650508e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 09:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729874230; x=1730479030; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JOEn92bswQiIh6B0O753YjxjbgH7xEMK7FXjbHm+E6k=;
 b=vRvNwD4c/AV+nVUCrGOOtWdMs2kh8IbweDaBL+Hp1pO1+8jTevQJxHMxACiX6Bt45N
 PSq5HifoW24lV78nl3imdJDpRDvdnyzxCFbZhnvffhNYbe+sX+wTYLzD693CXBHQbxet
 Xb0Q6gXZdq0221dQOt1LIxRwf/f45ht4bBghtHpgO+jt0HcBn8SOJaE6hOT1afQZAsgd
 EmTP3egqTbpwBKk8wZDGzivzLdjXUaAsbMofgcovma32sVKnw4FC/RZ5g3GYAwo5yF8E
 2kwv6CAQaClYi+9XPYDubq8kbqAJabkQimM2a9fzgwGWxCbMdbmF+xO89a0hOFYzqRQY
 F9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729874230; x=1730479030;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JOEn92bswQiIh6B0O753YjxjbgH7xEMK7FXjbHm+E6k=;
 b=nRnLF9SkKstnZn+EmdzX00sb6VplL6oc3Wfd5KBJHnKFprhY5TyExHkY+15OvkmC3Z
 RVRAMszis5yV6xgCL0aXRAk0XHbpQaWO2c7VoOIF72eEeD+6bIokVYDYLpCDEj1nr8Gm
 maqVaD4S8/bZCnqp7uL1dLSxcNcEyTSu5Wqk+8KGAM13UiybVOvVQE60heyhPQ5YIY1E
 ARvUNwX4w+Is+PZZCMADkw+qyugUyRyEgORYrs8ISKsg0mE8+CW5WnUX17qdtdd8Kw9T
 Weeu2sgnl81Gs16UcpRQLr9QUXVHK0NP5Mh+mk9huTMrkbYoBJ1LwrZP39caHGVCFf47
 21rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaV75alws9wd6X4WXvcDF03uDyGC9YqvyxXuXA0pWx5Q1pVtNbHviyW//+8sbesCF38rWM/UQR9Pc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzChbdaldECg4Tyy7kYbEDwMEu0gvnHygHqcj5NPXLdSfkCFcAB
 F1TsKC7NYQacJu+MOtNJWVV24Ms9FveZ5qoEvE6hFGBzYHxo18EO2i/8rZkv8XMU792knnO85Se
 hAmVzcMIuRZZhppvjC0nVogCIU5ciujJ0Oj1mUg==
X-Google-Smtp-Source: AGHT+IHHe9pruRyF7p97JeWtRJklETd8ZL5WPfRry1VxSwNI6KCKvzhRBrSC7ttvxAMUZC3k8UOafWSQ0/P+03f3fPo=
X-Received: by 2002:a05:6512:689:b0:539:f995:5b00 with SMTP id
 2adb3069b0e04-53b23dcb17bmr3714961e87.7.1729874230297; Fri, 25 Oct 2024
 09:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729738189.git.jahau@rocketmail.com>
 <bef462116190c26e6339cd58240773f035efcca9.1729738189.git.jahau@rocketmail.com>
In-Reply-To: <bef462116190c26e6339cd58240773f035efcca9.1729738189.git.jahau@rocketmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Oct 2024 18:36:59 +0200
Message-ID: <CACRpkdY6w1LmKP+69TDRLJCszPpz_XAM_uoe8oC07MH-9ALAig@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] drm/panel: samsung-s6e88a0-ams427ap24: Add initial
 driver
To: Jakob Hauser <jahau@rocketmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
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

Hi Jakob,

thanks for your patch!

On Thu, Oct 24, 2024 at 5:18=E2=80=AFAM Jakob Hauser <jahau@rocketmail.com>=
 wrote:

> This initial part of the panel driver was mostly generated by the
> "linux-mdss-dsi-panel-driver-generator" tool [1], reading downstream
> Android kernel file "dsi_panel_S6E88A0_AMS427AP24_qhd_octa_video.dtsi" [2=
].
>
> On top of the generic output of the tool, there were a couple of changes
> applied:
> - Added mipi_dsi_dcs_set_display_on() to function s6e88a0_ams427ap24_on()=
,
>   otherwise the display does not show up.
> - In functions s6e88a0_ams427ap24_on() and s6e88a0_ams427ap24_off()
>   changed DSI commands to multi context and used "accum_err" returns.
> - In functions s6e88a0_ams427ap24_on() and s6e88a0_ams427ap24_off() repla=
ced
>   msleep() by mipi_dsi_msleep().
> - The function s6e88a0_ams427ap24_get_modes() was changed to make use of
>   drm_connector_helper_get_modes_fixed(). This also required to include
>   drm/drm_probe_helper.h.
> - In function s6e88a0_ams427ap24_probe() registring the regulators was ch=
anged
>   to devm_regulator_bulk_get_const(). This required to change supplies in=
 struct
>   s6e88a0_ams427ap24 to a pointer.
> - Removed bool "prepared" from struct s6e88a0_ams427ap24 and according pa=
rts in
>   functions s6e88a0_ams427ap24_prepare() and s6e88a0_ams427ap24_unprepare=
().
>
> [1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-gener=
ator
> [2] https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/d=
rivers/video/msm/mdss/samsung/S6E88A0_AMS427AP24/dsi_panel_S6E88A0_AMS427AP=
24_qhd_octa_video.dtsi
>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>

Nice job on this driver so far!

> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>

Why do you need this include? .of_match_table is part of
<linux/driver.h>

> +static int s6e88a0_ams427ap24_on(struct s6e88a0_ams427ap24 *ctx)
> +{
> +       struct mipi_dsi_device *dsi =3D ctx->dsi;
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> +
> +       dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> +
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);

Can we provide #defines for at least some of this magic?
See other drivers for a very good idea of what some of them mean.
panel-samsung-s6d27a1.c:#define S6D27A1_PASSWD_L2       0xF0    /*
Password Command for Level 2 Control */
panel-samsung-s6d7aa0.c:#define MCS_PASSWD1             0xf0

> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0x5a, 0x5a);

panel-samsung-s6d7aa0.c:#define MCS_PASSWD3             0xfc

> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x11);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x11);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x13);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x18);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x02);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8, 0x30);
(...)
> +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +       mipi_dsi_msleep(&dsi_ctx, 20);
> +
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0x5a, 0x5a);

panel-samsung-s6d7aa0.c:#define MCS_PASSWD2             0xf1

> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcc, 0x4c);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x03, 0x0d);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0xa5, 0xa5);

panel-samsung-s6d7aa0.c:#define MCS_PASSWD2             0xf1
Send in the reverse password: disable access.

> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca,
> +                                    0x01, 0x00, 0x01, 0x00, 0x01, 0x00, =
0x80,
> +                                    0x80, 0x80, 0x80, 0x80, 0x80, 0x80, =
0x80,
> +                                    0x80, 0x80, 0x80, 0x80, 0x80, 0x80, =
0x80,
> +                                    0x80, 0x80, 0x80, 0x80, 0x80, 0x80, =
0x80,
> +                                    0x80, 0x80, 0x00, 0x00, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2,
> +                                    0x40, 0x08, 0x20, 0x00, 0x08);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x28, 0x0b);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf7, 0x03);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0xa5, 0xa5);

Send in the reverse password: disable access.

A bit of #defines and comments would make it much more clear what
is going on.

Yours,
Linus Walleij
