Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D756B0968
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 14:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FFB10E5D3;
	Wed,  8 Mar 2023 13:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0329610E5D3
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 13:38:08 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id i10so17634385plr.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 05:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678282687;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GEoW7Edk44DGWc4GB3PWBqttLOpuxjyKXvitXj1SBNA=;
 b=WPZmR06RJjaBgYuthIiHCOGVm22ZUKax0GCCS1OoDD2LO7Fr+b4Dpmsm71txU4PjFu
 vByAePacf8e2mGFRSXX4EvVo/iQcO57+8R+s3m9Cz+iaNSxWgy6YoRfpquPChgobmlUS
 uiuT/CyD/8W8VUFLNBSZ6hFhuLBUs5+7OINgeMzAPW4vsF4Oaz7ZzDvyxsM3DWP2Dn6P
 f6AfMQ3c02pZkLXQ6hi429wOf0UQtAoqGztMVeD8zMjSqOujbM4cCk4oXlHOiDnjQhD2
 aAi83zB60CKa9AiKLWkY6Tl7Lq8QTARs2ft5Fwv/EL10Mv9eqMECfAAAyoJVFctZq9z6
 WapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678282687;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GEoW7Edk44DGWc4GB3PWBqttLOpuxjyKXvitXj1SBNA=;
 b=LKjs3BhpEVeoF2IClBcMNUWXRHl+SUljVPm3EGV3bvpBhbDkZXL9z5/7hit39Q6bEV
 znLpcUi6qxh+juCEL+6rhhQVcaN9Vh11FHLuYxnQjuFF9/N/6oSVK/nfyFafm721udze
 eHWn7fAJPuRiyxd9f/MNHAlaiTn8yTMp/F9fWVfOBxQ/iaiY0NlOdbAlxXjHSD8pBIIl
 Amvo4A+t5nTfsHpb5ACUPZcp7F47SRpAqAhVXOR45PAr5p3Pf1a0xMyS/IUL1YQCtxvG
 rbGfLMDcB6umGt8kmzeRu6EVsW3Vj8cA7xFYeVPZSZfvKkMHIqlieyPb7ZzU20ZH8QZ7
 Vnpg==
X-Gm-Message-State: AO0yUKVS2f/flHLhYZ0D6k/gHsQ/tMoh+T5iewdmaQy7LyumF+SFSwhs
 KYEpSTQznTV6Jw0sIA2EHgY=
X-Google-Smtp-Source: AK7set/0r12xxZn37DfmlBs5S3EQxFWTEtKllSI2HMgFh3/2TjUn5CNF8v1MNVCn8BMZo2S3AXSw2Q==
X-Received: by 2002:a17:90b:1a8b:b0:234:2007:1ff6 with SMTP id
 ng11-20020a17090b1a8b00b0023420071ff6mr22771976pjb.14.1678282687514; 
 Wed, 08 Mar 2023 05:38:07 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 j24-20020a17090a589800b002369e16b276sm10709273pji.32.2023.03.08.05.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 05:38:07 -0800 (PST)
Date: Wed, 8 Mar 2023 21:37:59 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v3 2/2] drm/panel: Add driver for Novatek NT36523
Message-ID: <ZAiPTat/kmLyaJmA@Gentoo>
References: <20230308043706.16318-1-lujianhua000@gmail.com>
 <20230308043706.16318-2-lujianhua000@gmail.com>
 <66d293a8-f850-cb80-0c83-2ebf7e29d0c2@linaro.org>
 <ZAh3MSpQ30YyPAVe@Gentoo>
 <1cbe9e29-13a4-574e-6d8c-b2506e7a36b3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cbe9e29-13a4-574e-6d8c-b2506e7a36b3@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 08, 2023 at 01:33:39PM +0100, Konrad Dybcio wrote:
> 
> phy-type:
>     description: D-PHY (default) or C-PHY mode
>     enum: [ 10, 11 ]
>     default: 10
> 
> try setting that to 11 under your DSI PHYs (or one? not sure).
I already used phy-type = <PHY_TYPE_CPHY> before, this equate to qcom,panel-cphy-mode in
downstream panel device tree, but there is qcom,mdss-dsi-cphy-strength isn't
implemented.
> Konrad
> > 
> >> Could you also implement a 60 (or whatever other value is also
> >> implemented downstream) Hz mode?
> > I will try to implement it.
> >>
> >>> +	.clock = (1600 + 60 + 8 + 60) * (2560 + 26 + 4 + 168) * 104 / 1000,
> >>> +	.hdisplay = 1600,
> >>> +	.hsync_start = 1600 + 60,
> >>> +	.hsync_end = 1600 + 60 + 8,
> >>> +	.htotal = 1600 + 60 + 8 + 60,
> >>> +	.vdisplay = 2560,
> >>> +	.vsync_start = 2560 + 26,
> >>> +	.vsync_end = 2560 + 26 + 4,
> >>> +	.vtotal = 2560 + 26 + 4 + 168,
> >>> +};
> >>> +
> >>> +static const struct drm_display_mode elish_csot_mode = {
> >>> +	/* Current max freqency is 104HZ, TODO 120HZ */
> >>> +	.clock = (1600 + 200 + 40 + 52) * (2560 + 26 + 4 + 168) * 104 / 1000,
> >>> +	.hdisplay = 1600,
> >>> +	.hsync_start = 1600 + 200,
> >>> +	.hsync_end = 1600 + 200 + 40,
> >>> +	.htotal = 1600 + 200 + 40 + 52,
> >>> +	.vdisplay = 2560,
> >>> +	.vsync_start = 2560 + 26,
> >>> +	.vsync_end = 2560 + 26 + 4,
> >>> +	.vtotal = 2560 + 26 + 4 + 168,
> >>> +};
> >>> +
> >>> +static const struct panel_desc elish_boe_desc = {
> >>> +	.modes = &elish_boe_mode,
> >>> +	.dsi_info = {
> >>> +		.type = "NT36523",
> >> That's a bit vague, the driver IC is not very telling about the
> >> panel itself. Since we're not able to determine much more information,
> >> this could contain the panel manufacturer and the device name.
> > Acked.
> >>
> >>> +		.channel = 0,
> >>> +		.node = NULL,
> >>> +	},
> >>> +	.width_mm = 127,
> >>> +	.height_mm = 203,
> >>> +	.bpc = 8,
> >>> +	.lanes = 3,
> >>> +	.format = MIPI_DSI_FMT_RGB888,
> >>> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
> >>> +	.init_sequence = elish_boe_init_sequence,
> >>> +	.is_dual_dsi = true,
> >>> +};
> >>> +
> >> [...]
> >>
> >>> +static int nt36523_probe(struct mipi_dsi_device *dsi)
> >>> +{
> >> [...]
> >>
> >>> +	/* If the panel is dual dsi, register DSI1 */
> >>> +	if (pinfo->desc->is_dual_dsi) {
> >>> +		info = &pinfo->desc->dsi_info;
> >>> +
> >>> +		dsi1 = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
> >>> +		if (!dsi1) {
> >>> +			dev_err(dev, "cannot get secondary DSI node.\n");
> >>> +			return -ENODEV;
> >>> +		}
> >>> +
> >>> +		dsi1_host = of_find_mipi_dsi_host_by_node(dsi1);
> >>> +		of_node_put(dsi1);
> >> Shouldn't you put the reference only if it's found?
> > thanks for spot it.
> >>
> >>> +		if (!dsi1_host) {
> >>> +			dev_err(dev, "cannot get secondary DSI host\n");
> >>> +			return -EPROBE_DEFER;
> >> dev_err_probe, here and in neighbouring exit return paths?
> > Acked.
> >>
> >>
> >> Konrad
