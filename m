Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNpNLZ6fqWnGAwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:22:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA2621466C
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5681D10E127;
	Thu,  5 Mar 2026 15:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gulp+cRT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F85D10E127
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 15:22:02 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-48379a42f76so70219895e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 07:22:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772724120; cv=none;
 d=google.com; s=arc-20240605;
 b=BmFNLdBYfx5xJYoDUJR/mOecopUOOiDWhRSenyISEjlCkYFMS+P5RfNvPk+RrBHF2V
 SQ62UVwiTaVO8pfvNdee/YwoItpP1YhB2vN2Xl9Bc7WXcZJa1/IKgjUszMfpTSSReLFi
 wm7ctj4xzD8/5a1RbeFE64qHLg3g52so7H8WNy3F/JVI2pJ2KBO9IVB8vO9PTcu+tmhu
 /ByGAdkEpgWRmS51ygf5g2ezv1XvM5nXWE1Yqkwo+6Iqf2BIkMioGGjyMbA4WYowpbwi
 Crz0Z0XHjeNxjOgfW2KjEq4dUdAtRmrko6XYCnEOBDmSOnFEXc7J8eld82VsUSZlrJyn
 GPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=jqmiLxm1JEv5hCt6EVT4PE6zg6wsKVc3c6TB8BqOoK0=;
 fh=e0cJOoSpiXGHxhskGGpoAl8VZFFYuD/kVKU2vyNhjfM=;
 b=Webyg2e7WDz4XwkW1VnTavLmcf8zNG7r5awDkqsKuFwvpTNK4lHDlxNIVTIDxdNqV+
 i7FoYu+mhfScQQ1A9AOLQAggB8YZgbiVmKgyNjw9heW8fp0/qLI+FaCvEWYGYmbPhaT0
 2jenvBb8nEKUomhORDnQnnXCaZ64CMqhXQVVtyZI219LNG9vm0ufqXr9vpWxWVFRLNK+
 B29tXZD2pFnjDPl0aun82Tf5B/ns3YkePV22WowwGuIefttvK5jKlB6QbLtpV633T9ks
 zNDFWNjXrgSg3AkHz2Y3KPH4ThIqzZOFV7EXVZv0LEFJtfUvaIlYoyli5Q5+f3RCnwa+
 FMgw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772724120; x=1773328920; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jqmiLxm1JEv5hCt6EVT4PE6zg6wsKVc3c6TB8BqOoK0=;
 b=Gulp+cRTE4gqp7oWcqONXs5hmrsQwiBlgWQKnAU64zmwIdYLKdp9hoSZ+AopZItvr9
 6psl0AGQVAoDY3rskr1BoS9vDmw0GZGR5b4lKdK/lx/Jmf7y05FIzTTMjGkGswNV4d6G
 7k3BK1l5sL4Lg1pGmhA2NEMfacL7WJEHgtuYQX8jDoSjmXs3oGKbQ0uPz5E2VHXMMi2+
 wQz/+0aeWDY9H5BEkCmzBqiCh3Ca/nWSbmdW3lcJCcNWnuborPQiDy+KkMleUONmcxsy
 bAugscK3/9qyu0q9QYYx10m302w7Jv9HkQuHQtj5TGhAuDJuYtnbAQmndR0N2AuJVcVQ
 nV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772724120; x=1773328920;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jqmiLxm1JEv5hCt6EVT4PE6zg6wsKVc3c6TB8BqOoK0=;
 b=pZFneFC6k0QrTXK431Pe7JYHo7g7DR+Tgm07G7pDwnLyf8BnZKd6BKB0AfNpqYFMdR
 TEGb9tSYYEP/pKer2mrPRdKcxjJTtfM2qfHNGfjpjXJCQ7kal0+V4PUHyYMYrhYIuYrE
 Yqun0oORfRc+Q4EjKgaJCpJ/WTrpegClvop/NWm7FKOHJSiatwT/ne+o+DDHMZ55SqpT
 B45t0Pr/wF0eNo+EFn/RDo2rytzbAIOgbBT8viNnkTHIA5ZpBHFrRTERoPhxjZ56/PVe
 gKce/q59DF2lroSGpuHXYMtOI9I8Ln7lciATp8WtcDXmOi8jQxYSJPZat7S7rTJzSwyp
 eHSQ==
X-Gm-Message-State: AOJu0Yzc8Ae2P2V03WN/OOEVeBgU7IUHrLa4MiyZiUEq75548JwyXNIR
 gfkYrlzeL4Oetg8o1b5Z5PtT09laYEqLylet7e2qJpHioka51J99CScnaPriYlpvBbVBBdaQ3xX
 QgCcuCi/xy0mfR472/Md9in/p716/gmw=
X-Gm-Gg: ATEYQzyIBK1WiLQcHYguKm6zdZRxx0GGwBBta0PP7c/YFdjwjLsVMLDC4a2nINhcYp3
 umxl7uZ1jiajzEL+tpFTsJguI4bhskbdT2tTHexMCURfIl4H14Aew2RELlwTZiG/hD8uo9szuBw
 l1qGHMCgsERFXW7dOzkswNgYSU6u2EYBWYFA8pwbyqkvgFAzIAYpiaJ29h2DE0HFaETMGLirfLU
 X8wPoSmklwAQco7y1OiNjHOhcsGjBg8dpeFyF37PQzNdsbZrgSZXvOLO4WtPJeH6ST+K1m8+W8V
 1pUKSimE85qzvwgXDss=
X-Received: by 2002:a05:600c:190e:b0:482:dbd7:a1c1 with SMTP id
 5b1f17b1804b1-485198bb11bmr103389455e9.34.1772724120195; Thu, 05 Mar 2026
 07:22:00 -0800 (PST)
MIME-Version: 1.0
References: <20260125131323.45108-1-clamor95@gmail.com>
 <20260125131323.45108-2-clamor95@gmail.com>
In-Reply-To: <20260125131323.45108-2-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 5 Mar 2026 17:21:49 +0200
X-Gm-Features: AaiRm51HVWO42gd_jxtRlV9XjrCMIr_S_GY-8XlvGM5fAb-cXCbobJINkWBCLb0
Message-ID: <CAPVz0n3FXMZOEhJCw_ajQudWfHMcg9-y32pFiejgphH5_Q7nug@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpu/drm: tegra: dsi: add support for
 Tegra20/Tegra30
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
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
X-Rspamd-Queue-Id: 0FA2621466C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:diogo.ivo@tecnico.ulisboa.pt,m:clamor95@gmail.com,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,tecnico.ulisboa.pt];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

=D0=BD=D0=B4, 25 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 15:13 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Tegra20 and Tegra30 are fully compatible with existing Tegra DSI driver
> apart from clock configuration and pad calibration which are addressed by
> this patch.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/tegra/drm.c |   2 +
>  drivers/gpu/drm/tegra/dsi.c | 107 +++++++++++++++++++++++++-----------
>  drivers/gpu/drm/tegra/dsi.h |  10 ++++
>  3 files changed, 88 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 4596073fe28f..5d64cd57e764 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1359,10 +1359,12 @@ static SIMPLE_DEV_PM_OPS(host1x_drm_pm_ops, host1=
x_drm_suspend,
>
>  static const struct of_device_id host1x_drm_subdevs[] =3D {
>         { .compatible =3D "nvidia,tegra20-dc", },
> +       { .compatible =3D "nvidia,tegra20-dsi", },
>         { .compatible =3D "nvidia,tegra20-hdmi", },
>         { .compatible =3D "nvidia,tegra20-gr2d", },
>         { .compatible =3D "nvidia,tegra20-gr3d", },
>         { .compatible =3D "nvidia,tegra30-dc", },
> +       { .compatible =3D "nvidia,tegra30-dsi", },
>         { .compatible =3D "nvidia,tegra30-hdmi", },
>         { .compatible =3D "nvidia,tegra30-gr2d", },
>         { .compatible =3D "nvidia,tegra30-gr3d", },
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 02a661d86751..ebc78dceaee6 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -53,6 +53,11 @@ to_dsi_state(struct drm_connector_state *state)
>         return container_of(state, struct tegra_dsi_state, base);
>  }
>
> +struct tegra_dsi_config {
> +       bool has_multiple_pad_controls;
> +       bool has_mux_parent_clk;
> +};
> +
>  struct tegra_dsi {
>         struct host1x_client client;
>         struct tegra_output output;
> @@ -82,6 +87,8 @@ struct tegra_dsi {
>         /* for ganged-mode support */
>         struct tegra_dsi *master;
>         struct tegra_dsi *slave;
> +
> +       const struct tegra_dsi_config *config;
>  };
>
>  static inline struct tegra_dsi *
> @@ -663,39 +670,46 @@ static int tegra_dsi_pad_enable(struct tegra_dsi *d=
si)
>  {
>         u32 value;
>
> -       value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL_VS1_PDI=
O(0);
> -       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> +       if (dsi->config->has_multiple_pad_controls) {
> +               /*
> +                * XXX Is this still needed? The module reset is deassert=
ed right
> +                * before this function is called.
> +                */
> +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
> +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
> +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
> +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
> +
> +               value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL=
_VS1_PDIO(0);
> +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> +
> +               value =3D DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
> +                       DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
> +                       DSI_PAD_OUT_CLK(0x0);
> +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
> +
> +               value =3D DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_=
CLK(0x3) |
> +                       DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
> +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> +       } else {
> +               value =3D DSI_PAD_CONTROL_LPUPADJ(0x1) | DSI_PAD_CONTROL_=
LPDNADJ(0x1) |
> +                       DSI_PAD_CONTROL_PREEMP_EN(0x1) | DSI_PAD_CONTROL_=
SLEWDNADJ(0x6) |
> +                       DSI_PAD_CONTROL_SLEWUPADJ(0x6) | DSI_PAD_CONTROL_=
PDIO(0) |
> +                       DSI_PAD_CONTROL_PDIO_CLK(0) | DSI_PAD_CONTROL_PUL=
LDN_ENAB(0);
> +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> +       }
>
>         return 0;
>  }
>
>  static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
>  {
> -       u32 value;
>         int err;
>
> -       /*
> -        * XXX Is this still needed? The module reset is deasserted right
> -        * before this function is called.
> -        */
> -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
> -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
> -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
> -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
> -
>         /* start calibration */
>         tegra_dsi_pad_enable(dsi);
>
> -       value =3D DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
> -               DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
> -               DSI_PAD_OUT_CLK(0x0);
> -       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
> -
> -       value =3D DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_CLK(0x3)=
 |
> -               DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
> -       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> -
>         err =3D tegra_mipi_start_calibration(dsi->mipi);
>         if (err < 0)
>                 return err;
> @@ -1568,6 +1582,7 @@ static int tegra_dsi_probe(struct platform_device *=
pdev)
>         if (!dsi)
>                 return -ENOMEM;
>
> +       dsi->config =3D of_device_get_match_data(&pdev->dev);
>         dsi->output.dev =3D dsi->dev =3D &pdev->dev;
>         dsi->video_fifo_depth =3D 1920;
>         dsi->host_fifo_depth =3D 64;
> @@ -1606,7 +1621,7 @@ static int tegra_dsi_probe(struct platform_device *=
pdev)
>                 goto remove;
>         }
>
> -       dsi->clk_lp =3D devm_clk_get(&pdev->dev, "lp");
> +       dsi->clk_lp =3D devm_clk_get_optional(&pdev->dev, "lp");
>         if (IS_ERR(dsi->clk_lp)) {
>                 err =3D dev_err_probe(&pdev->dev, PTR_ERR(dsi->clk_lp),
>                                     "cannot get low-power clock\n");
> @@ -1627,10 +1642,12 @@ static int tegra_dsi_probe(struct platform_device=
 *pdev)
>                 goto remove;
>         }
>
> -       err =3D tegra_dsi_setup_clocks(dsi);
> -       if (err < 0) {
> -               dev_err(&pdev->dev, "cannot setup clocks\n");
> -               goto remove;
> +       if (dsi->config->has_mux_parent_clk) {
> +               err =3D tegra_dsi_setup_clocks(dsi);
> +               if (err < 0) {
> +                       dev_err(&pdev->dev, "cannot setup clocks\n");
> +                       goto remove;
> +               }
>         }
>
>         dsi->regs =3D devm_platform_ioremap_resource(pdev, 0);
> @@ -1694,11 +1711,39 @@ static void tegra_dsi_remove(struct platform_devi=
ce *pdev)
>         tegra_mipi_free(dsi->mipi);
>  }
>
> +static const struct tegra_dsi_config tegra20_dsi_config =3D {
> +       .has_multiple_pad_controls =3D false,
> +       .has_mux_parent_clk =3D false,
> +};
> +
> +/*
> + * Tegra30 allows DSIA/DSIB to be muxed to either PLL_D or PLL_D2; this =
is
> + * simply not modeled in the clock driver yet. If this functionality is
> + * required, the has_mux_parent_clk flag can be set to true once the clo=
ck
> + * driver is patched.
> + */
> +static const struct tegra_dsi_config tegra30_dsi_config =3D {
> +       .has_multiple_pad_controls =3D false,
> +       .has_mux_parent_clk =3D false,
> +};
> +
> +static const struct tegra_dsi_config tegra114_dsi_config =3D {
> +       .has_multiple_pad_controls =3D true,
> +       .has_mux_parent_clk =3D true,
> +};
> +
> +static const struct tegra_dsi_config tegra124_dsi_config =3D {
> +       .has_multiple_pad_controls =3D true,
> +       .has_mux_parent_clk =3D false,
> +};

Mikko, I have an update regarding Tegra124 config. If
tegra_dsi_setup_clocks is not called for Tegra124 (has_mux_parent_clk
=3D false) DSI will not work. I cannot say for sure what is going on
with clocks since my tegra124 device has broken usb in mainline Linux
and without panel is no go. I would like to address this before this
series is picked.

> +
>  static const struct of_device_id tegra_dsi_of_match[] =3D {
> -       { .compatible =3D "nvidia,tegra210-dsi", },
> -       { .compatible =3D "nvidia,tegra132-dsi", },
> -       { .compatible =3D "nvidia,tegra124-dsi", },
> -       { .compatible =3D "nvidia,tegra114-dsi", },
> +       { .compatible =3D "nvidia,tegra210-dsi", .data =3D &tegra124_dsi_=
config },
> +       { .compatible =3D "nvidia,tegra132-dsi", .data =3D &tegra124_dsi_=
config },
> +       { .compatible =3D "nvidia,tegra124-dsi", .data =3D &tegra124_dsi_=
config },
> +       { .compatible =3D "nvidia,tegra114-dsi", .data =3D &tegra114_dsi_=
config },
> +       { .compatible =3D "nvidia,tegra30-dsi", .data =3D &tegra30_dsi_co=
nfig },
> +       { .compatible =3D "nvidia,tegra20-dsi", .data =3D &tegra20_dsi_co=
nfig },
>         { },
>  };
>  MODULE_DEVICE_TABLE(of, tegra_dsi_of_match);
> diff --git a/drivers/gpu/drm/tegra/dsi.h b/drivers/gpu/drm/tegra/dsi.h
> index f39594e65e97..d834ac0c47ab 100644
> --- a/drivers/gpu/drm/tegra/dsi.h
> +++ b/drivers/gpu/drm/tegra/dsi.h
> @@ -95,6 +95,16 @@
>  #define DSI_TALLY_LRX(x)               (((x) & 0xff) <<  8)
>  #define DSI_TALLY_HTX(x)               (((x) & 0xff) <<  0)
>  #define DSI_PAD_CONTROL_0              0x4b
> +/* Tegra20/Tegra30 */
> +#define DSI_PAD_CONTROL_PULLDN_ENAB(x) (((x) & 0x1) << 28)
> +#define DSI_PAD_CONTROL_SLEWUPADJ(x)   (((x) & 0x7) << 24)
> +#define DSI_PAD_CONTROL_SLEWDNADJ(x)   (((x) & 0x7) << 20)
> +#define DSI_PAD_CONTROL_PREEMP_EN(x)   (((x) & 0x1) << 19)
> +#define DSI_PAD_CONTROL_PDIO_CLK(x)    (((x) & 0x1) << 18)
> +#define DSI_PAD_CONTROL_PDIO(x)                (((x) & 0x3) << 16)
> +#define DSI_PAD_CONTROL_LPUPADJ(x)     (((x) & 0x3) << 14)
> +#define DSI_PAD_CONTROL_LPDNADJ(x)     (((x) & 0x3) << 12)
> +/* Tegra114+ */
>  #define DSI_PAD_CONTROL_VS1_PDIO(x)    (((x) & 0xf) <<  0)
>  #define DSI_PAD_CONTROL_VS1_PDIO_CLK   (1 <<  8)
>  #define DSI_PAD_CONTROL_VS1_PULLDN(x)  (((x) & 0xf) << 16)
> --
> 2.51.0
>
