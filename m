Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C34416B502F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 19:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C438910E313;
	Fri, 10 Mar 2023 18:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE4410E313
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 18:35:50 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id h8so6554712plf.10
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 10:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678473349;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GjDJnkJNNAJbXwdKnKmvqHOdy6ToT/pvrm8g38w5r54=;
 b=ZzMuF4kMHU+5smEmUAovshyGYjdBDGE0/WNbHZ5O3zVYz+h9qB2795ijzOpH6DMnRp
 pff9AiD2dm8suhUDbnjbeU+uaKZxs6ryaMOtMKBaVJzv3SSRf3X14xRM+fPelMDmzje7
 FFPBkrczl68cUgv2gbpg/NRUvn78IFkfDZe8cLFgjh4QokWlf5GmJlWoKGRn4fYoCzP/
 BwIBKD3LNAeRuSaobGQt+9p7a6szTpfpiqjyMFNc+xVOjbvBCGVN3nIDMyJmHc2w3lXh
 GEbzXRtwRghn3sW8BD0l5EEGSh7S4E/hyzvcbBBNYON1xJuxEhDZazVeoBaRe3EP/y5M
 /XhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678473349;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GjDJnkJNNAJbXwdKnKmvqHOdy6ToT/pvrm8g38w5r54=;
 b=WuM5GEzNih8CJwrtt8wIaldlfshZvDUtJjjqON2mx7+h78QALlM1x+ok3DBA82sirX
 H906gx+PEkgXfHPeL/j3PRPIZifXd6SwXrXGJNV4cQp6Q+U51s4w2QrDAgKleSJd1+JZ
 Ny2lDKmdFjcrqPgxLorQQrCbG05xlzdzZhnukFNjaxKTLUEIUgTsaWVyB8w461KiKsya
 jWAe7bnN2WVwTppexgQdiXdzN17M5hWgyz9UzhFTJBdsBvaMo8tIi4p3BBuGeio58BBq
 b0/tZCx0dJcowpCO593fDfKyW/vMBYfTPA98yDc02spjFIdLLCDFjVcEPjB1HmD/R2jU
 ZM/Q==
X-Gm-Message-State: AO0yUKWygYEPnQiACPh8Vi7yP+IrUCuS70+VEETOIPTiQyds104g8/Fi
 oJOXbJq9oo8614En4tSvSZg=
X-Google-Smtp-Source: AK7set8xICoqLIhqThDBYpzCx8RUPZU7gjm6qumv6hrox/SDbD0SidOLIsgxSU5eLDZt0s4WI+rknQ==
X-Received: by 2002:a17:902:cece:b0:19c:d316:309a with SMTP id
 d14-20020a170902cece00b0019cd316309amr33238099plg.4.1678473349574; 
 Fri, 10 Mar 2023 10:35:49 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a170902ed4400b0019aa5528a5csm315671plb.144.2023.03.10.10.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 10:35:49 -0800 (PST)
Date: Sat, 11 Mar 2023 02:35:41 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v4 2/2] drm/panel: Add driver for Novatek NT36523
Message-ID: <ZAt4fTNEnyLteaas@Gentoo>
References: <20230310132144.2241-1-lujianhua000@gmail.com>
 <20230310132144.2241-2-lujianhua000@gmail.com>
 <6539f132-c740-b9b6-8810-0affd6ab91ba@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6539f132-c740-b9b6-8810-0affd6ab91ba@linaro.org>
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

On Fri, Mar 10, 2023 at 07:10:21PM +0100, Konrad Dybcio wrote:
> 
> > +#define mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, cmd, seq...)        \
> > +		do {                                                 \
> > +			mipi_dsi_dcs_write_seq(dsi0, cmd, seq);      \
> > +			mipi_dsi_dcs_write_seq(dsi1, cmd, seq);      \
> > +		} while (0)
> This should be in the same file as mipi_dsi_dcs_write_seq, imo
I have sent a patch to do it, upstream don't think this wrapper is a proper
approach to deal with dual dsi and wrap all of mipi_dsi_* function is
useless.
https://lore.kernel.org/lkml/20230310110542.6649-1-lujianhua000@gmail.com/
> 
> [...]
> 
> > +static int elish_boe_init_sequence(struct panel_info *pinfo)
> > +{
> > +	struct mipi_dsi_device *dsi0 = pinfo->dsi[0];
> > +	struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
> > +	/* No datasheet, so write magic init sequence directly */
> > +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xFF, 0x10);
> > +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xFB, 0x01);
> > +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xB9, 0x05);
> Non-#defines should use lowercase hex
Acked
> 
> [...]
> 
> > +	msleep(70);
> > +	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29);
> > +	return 0;
> I think it's a general practice to add a newline before the return
> statement, but that's just a nit that triggered my OCD..
Acked
> 
> [...]
> 
> > +			       struct drm_connector *connector)
> > +{
> > +	struct panel_info *pinfo = to_panel_info(panel);
> > +	int i;
> > +
> > +	for (i =0; i < pinfo->desc->num_modes; i++) {
> missing space after =
Acked
> > +		const struct drm_display_mode *m = &pinfo->desc->modes[i];
> > +		struct drm_display_mode *mode;
> Missing newline between declarations and code
Acked
> 
> > +		mode = drm_mode_duplicate(connector->dev, m);
> > +		if (!mode) {
> > +			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> > +				m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
> > +			return -ENOMEM;
> > +		}
> > +		mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> DRM_MODE_TYPE_PREFERRED: Preferred mode, usually the native resolution of an LCD panel. There should only be one preferred mode per connector at any given time.
> 
> https://docs.kernel.org/gpu/drm-kms.html
> 
> I'd suggest adding something like:
> 
> if (i == 0)
> 	mode->type |= DRM_MODE_TYPE_PREFERRED
> 
Acked
> 
> I think I've ran out of things to complain about.. And that's
> a good thing! :D
> 
> Konrad
> > +		drm_mode_set_name(mode);
> > +		drm_mode_probed_add(connector, mode);
> > +	}
> > +
> > +	connector->display_info.width_mm = pinfo->desc->width_mm;
> > +	connector->display_info.height_mm = pinfo->desc->height_mm;
> > +	connector->display_info.bpc = pinfo->desc->bpc;
> > +
> > +	return pinfo->desc->num_modes;
> > +}
> > +
> > +static const struct drm_panel_funcs nt36523_panel_funcs = {
> > +	.disable = nt36523_disable,
> > +	.prepare = nt36523_prepare,
> > +	.unprepare = nt36523_unprepare,
> > +	.get_modes = nt36523_get_modes,
> > +};
> > +
> > +static int nt36523_probe(struct mipi_dsi_device *dsi)
> > +{
> > +	struct device *dev = &dsi->dev;
> > +	struct device_node *dsi1;
> > +	struct mipi_dsi_host *dsi1_host;
> > +	struct panel_info *pinfo;
> > +	const struct mipi_dsi_device_info *info;
> > +	int i, ret;
> > +
> > +	pinfo = devm_kzalloc(dev, sizeof(*pinfo), GFP_KERNEL);
> > +	if (!pinfo)
> > +		return -ENOMEM;
> > +
> > +	pinfo->vddio = devm_regulator_get(dev, "vddio");
> > +	if (IS_ERR(pinfo->vddio))
> > +		return dev_err_probe(dev, PTR_ERR(pinfo->vddio), "failed to get vddio regulator\n");
> > +
> > +	pinfo->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(pinfo->reset_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(pinfo->reset_gpio), "failed to get reset gpio\n");
> > +
> > +	pinfo->desc = of_device_get_match_data(dev);
> > +	if (!pinfo->desc)
> > +		return -ENODEV;
> > +
> > +	/* If the panel is dual dsi, register DSI1 */
> > +	if (pinfo->desc->is_dual_dsi) {
> > +		info = &pinfo->desc->dsi_info;
> > +
> > +		dsi1 = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
> > +		if (!dsi1) {
> > +			dev_err(dev, "cannot get secondary DSI node.\n");
> > +			return -ENODEV;
> > +		}
> > +
> > +		dsi1_host = of_find_mipi_dsi_host_by_node(dsi1);
> > +		of_node_put(dsi1);
> > +		if (!dsi1_host) {
> > +			return dev_err_probe(dev, -EPROBE_DEFER, "cannot get secondary DSI host\n");
> > +		}
> > +
> > +		pinfo->dsi[1] = mipi_dsi_device_register_full(dsi1_host, info);
> > +		if (!pinfo->dsi[1]) {
> > +			dev_err(dev, "cannot get secondary DSI device\n");
> > +			return -ENODEV;
> > +		}
> > +	}
> > +
> > +	pinfo->dsi[0] = dsi;
> > +	mipi_dsi_set_drvdata(dsi, pinfo);
> > +	drm_panel_init(&pinfo->panel, dev, &nt36523_panel_funcs, DRM_MODE_CONNECTOR_DSI);
> > +
> > +	ret = drm_panel_of_backlight(&pinfo->panel);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to get backlight\n");
> > +
> > +	drm_panel_add(&pinfo->panel);
> > +
> > +	for (i = 0; i < DSI_NUM_MIN + pinfo->desc->is_dual_dsi; i++) {
> > +		pinfo->dsi[i]->lanes = pinfo->desc->lanes;
> > +		pinfo->dsi[i]->format = pinfo->desc->format;
> > +		pinfo->dsi[i]->mode_flags = pinfo->desc->mode_flags;
> > +
> > +		ret = mipi_dsi_attach(pinfo->dsi[i]);
> > +		if (ret < 0)
> > +			return dev_err_probe(dev, ret, "cannot attach to DSI%d host.\n", i);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id nt36523_of_match[] = {
> > +	{
> > +		.compatible = "xiaomi,elish-boe-nt36523",
> > +		.data = &elish_boe_desc,
> > +	},
> > +	{
> > +		.compatible = "xiaomi,elish-csot-nt36523",
> > +		.data = &elish_csot_desc,
> > +	},
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, nt36523_of_match);
> > +
> > +static struct mipi_dsi_driver nt36523_driver = {
> > +	.probe = nt36523_probe,
> > +	.remove = nt36523_remove,
> > +	.driver = {
> > +		.name = "panel-novatek-nt36523",
> > +		.of_match_table = nt36523_of_match,
> > +	},
> > +};
> > +module_mipi_dsi_driver(nt36523_driver);
> > +
> > +MODULE_AUTHOR("Jianhua Lu <lujianhua000@gmail.com>");
> > +MODULE_DESCRIPTION("DRM driver for Novatek NT36523 based MIPI DSI panels");
> > +MODULE_LICENSE("GPL");
