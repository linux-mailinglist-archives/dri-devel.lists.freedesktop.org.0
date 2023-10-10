Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D79A07C0423
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 21:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6A410E3D4;
	Tue, 10 Oct 2023 19:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28ED10E3D2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 19:11:03 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40662119cd0so14745e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 12:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696965062; x=1697569862;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IpCceZmbnmWfyUfaN7Neh9lmGF2UPo2D6Q93y/7mO30=;
 b=wRMXVUVMCoT3U7yNbxdkTf3LV2O8OpCqA9lKSUhx3aSi1alAacGoJRp5lRk4q4hneA
 R1FOl6vlW8OXpwNfsE1hSkGmNrOLmeFhYybRbUD62WwJyFZFx+VAbZjSWRN2q99jsTG4
 Cd0XvtlNbkZXI7yC5GCR3U4hvl+ztnHWqEN8XHgKOJsP0ohKu1gCzYr7d+1mcl1u5uq0
 ZBIg555j8YCoGIBS6u+NwqTsaajK+JArt7OJ2jfbC4XMOjAgPMBqnQrVQEyVgAwBd04P
 P3ETdxfTh5nfQ870xy8kvoJnybdtmulO0xEyQK5QEP5poanyUJZa+p66JgQDyOasEn5Q
 m0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696965062; x=1697569862;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IpCceZmbnmWfyUfaN7Neh9lmGF2UPo2D6Q93y/7mO30=;
 b=IEUyeNm4sS5xGLYcny3Nh2sMwNKPmDWyiu3YHD68DHf7Eq5dgRqjh4v5Qv65G9mf/v
 lLUJchDT8BhOeO3FtpigPCYF+q9Xc0P8johK8L9Ui6fvWiQVxzYt+iYmmQ2VpRA0Fqh4
 BiWWQ1OSlQJeKV7TE8iAkxJw7xfd34EZjqWPCNhoi3P5OLB7uVwU+8oiqcu82haiTJMz
 rIbmbMOI667Qq45D4pzzD4hi7o9/m1a68jIZKeg6POZ5huX8WdGxnEGce9xeRtOtIVTz
 6VugIEH6oxkymK+Izs58RjSFJE6wsVInDQtGkoMuDikeQT9H6R+uvfEVLWw8p4zjMeAH
 FL2Q==
X-Gm-Message-State: AOJu0YwicDlHd/B66NzjpCKnjU0aqm1IZVFwkY+bT14E3gxHGg6IBZPq
 47vcIxAd0tijTO/uNil5/SnzteViRuXgG+x3mvq8+A==
X-Google-Smtp-Source: AGHT+IGyHcc065zalL/uMb2Rg27kWBnlQyHv0EoUM7psUnegw6ZMk2u3/+9u8kfQGzLaQsojexxvzbM0/ypCwMkEx8M=
X-Received: by 2002:a05:600c:1f8e:b0:400:fffe:edf6 with SMTP id
 je14-20020a05600c1f8e00b00400fffeedf6mr23995wmb.1.1696965061918; Tue, 10 Oct
 2023 12:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231010121402.3687948-1-yangcong5@huaqin.corp-partner.google.com>
 <20231010121402.3687948-2-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20231010121402.3687948-2-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Tue, 10 Oct 2023 12:10:45 -0700
Message-ID: <CAD=FV=VsjB-gsqXyAs+G8DpHJqHNTxeFXwbpgt20-Wgb757z1w@mail.gmail.com>
Subject: Re: [v2 1/3] drm/panel: ili9882t: Break out as separate driver
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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
Cc: neil.armstrong@linaro.org, will@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, catalin.marinas@arm.com, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Oct 10, 2023 at 5:14=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/=
drm/panel/panel-ilitek-ili9882t.c
> new file mode 100644
> index 000000000000..e095ad91c4bc
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> @@ -0,0 +1,762 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Panels based on the Ilitek ILI9882T display controller.
> + */
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>

nit: remove include of linux/of_device.h since you don't use any of
the functions declared there.


> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +
> +#include <video/mipi_display.h>
> +
> +/*
> + * Use this descriptor struct to describe different panels using the
> + * Ilitek ILI9882T display controller.
> + */
> +struct panel_desc {
> +       const struct drm_display_mode *modes;
> +       unsigned int bpc;
> +
> +       /**
> +        * @width_mm: width of the panel's active display area
> +        * @height_mm: height of the panel's active display area
> +        */
> +       struct {
> +               unsigned int width_mm;
> +               unsigned int height_mm;
> +       } size;
> +
> +       unsigned long mode_flags;
> +       enum mipi_dsi_pixel_format format;
> +       const struct panel_init_cmd *init_cmds;
> +       unsigned int init_cmd_length;

Remove "init_cmd_length" since it's now unused.


> +static void ili9882t_remove(struct mipi_dsi_device *dsi)
> +{
> +       struct ili9882t *ili =3D mipi_dsi_get_drvdata(dsi);
> +       int ret;
> +
> +
> +       ret =3D mipi_dsi_detach(dsi);

nit: remove extra blank line above.


Other than nits, this looks good to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
