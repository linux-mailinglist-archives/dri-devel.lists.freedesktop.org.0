Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D713D6B0663
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 12:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFF210E097;
	Wed,  8 Mar 2023 11:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCD510E097
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 11:53:29 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 fr5-20020a17090ae2c500b0023af8a036d2so1209441pjb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 03:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678276409;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2Vj24eZaGsqAjYr4sP0gslIio7aH6ugMTgwkDBRsU18=;
 b=VXH3SA8b1U9e3CJ37OWVuPaHy4IdZVCpO7caEmSCMriN3yPHWEtYJxrxv31ce82qh5
 epd19iy1fddh/mZZZsm5qkA+F5Druqh5ZkKDN2QmDBOVlQ/TB9FVoDrRMBXIJvdhrm/r
 dgJPzzVHOWzYe5CR1JTLK4ThkEbRG6OROW4j4qpOt7GW9buFuRiA5SMDEJ033/FjWz/b
 WZ1MPDQ8NQQdnw+tHP6wy2B10vnLL21fCi4MulyEoFOWKsBVJkXE+jg9pvbkjutb+pv8
 Il84J5edsysbV32qkSXRVZf7B7/VyX37phbVBJzdURBoIkosotGAetagsP+HhvxRKL1D
 cRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678276409;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Vj24eZaGsqAjYr4sP0gslIio7aH6ugMTgwkDBRsU18=;
 b=O/ZxTno335Q6F2Pa5YemQwB0AjrftZucIPWvr+eqprBNJss1exDxy0gAOth6sYJRyC
 GEnS3Th8UiV30dYtAqxM88eWnn0liVs8YmXMvPvePULY6p3UBr/cT4p2sdjaYNhIjGQk
 PgGppcPpRGU5H+35UxyiByFrQqTteOkVUxNH4SBsYnXM3bkwQ5qv/Ot3Q8+EzYvlhdJ3
 V23BllkADfsRoJUugRnN2y8b16NiueOu2JiW8OAl66rb59IgZcjqjFGsPC+8XC7APKvi
 w8w1dnrWi5oGeL7/IRD34bohbBM5CKwxmIDB1sABpeAmNGVfWXS/UrmJY+OkS+bGH1ZB
 8AAg==
X-Gm-Message-State: AO0yUKV4Dh7c+ShN8w415dP5UQr3jYsAqhCb6ijN7fbqx/ZlDW0jOfwV
 79nE39Ur5b/eUDSjD1johjE=
X-Google-Smtp-Source: AK7set/dfmC6kYdQhlgkAkhfYlYdPwpyBeTjunHGXTNwJ9uFFNX1eyDEQc2zNVtDi/vXIg7yaraeXw==
X-Received: by 2002:a17:90a:de94:b0:234:881b:2e8b with SMTP id
 n20-20020a17090ade9400b00234881b2e8bmr18843695pjv.49.1678276409123; 
 Wed, 08 Mar 2023 03:53:29 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a17090a2f8e00b00230da56ddecsm8911479pjd.27.2023.03.08.03.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 03:53:28 -0800 (PST)
Date: Wed, 8 Mar 2023 19:53:21 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v3 2/2] drm/panel: Add driver for Novatek NT36523
Message-ID: <ZAh3MSpQ30YyPAVe@Gentoo>
References: <20230308043706.16318-1-lujianhua000@gmail.com>
 <20230308043706.16318-2-lujianhua000@gmail.com>
 <66d293a8-f850-cb80-0c83-2ebf7e29d0c2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66d293a8-f850-cb80-0c83-2ebf7e29d0c2@linaro.org>
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

On Wed, Mar 08, 2023 at 12:13:53PM +0100, Konrad Dybcio wrote:
> 
> 
> On 8.03.2023 05:37, Jianhua Lu wrote:
> > Add a driver for panels using the Novatek NT36523 display driver IC.
> > 
> > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> > ---
> > Changes in v3:
> >   - Refactor source code
> > 
> > Changes in v2:
> >   - Refactor and clean up source code
> This is a veeery vague changelog, akin to "change patch", please
> be more specific the next time around.
> 
Acked, thanks
> 
> [...]
> 
> > +#define DSI_NUM_MIN 1
> > +
> > +/* Macro modified from mipi_dual_dsi_dcs_write_seq */
> > +#define mipi_dual_dsi_dcs_write_seq(dsi, cmd, seq...)           	   \
> > +	do {                                                               \
> > +		static const u8 d[] = { cmd, seq };                        \
> > +		int i, ret;                                                \
> > +		for (i = 0; i < ARRAY_SIZE(dsi); i++) {                    \
> > +			ret = mipi_dsi_dcs_write_buffer(dsi[i], d, ARRAY_SIZE(d));    \
> > +			if (ret < 0) {                                             \
> > +				dev_err_ratelimited(                               \
> > +					&dsi[i]->dev, "sending command %#02x failed: %d\n", \
> > +					cmd, ret);                                 \
> > +				return ret;                                        \
> > +			}                                                          \
> > +		}                                                                  \
> > +	} while (0)
> > +
> This should definitely be put in a common file..
Acked.
> 
> 
> > +static const struct drm_display_mode elish_boe_mode = {
> > +	/* Current max freqency is 104HZ, TODO 120HZ */
> Is it a DPU issue, or does the panel not work correctly when you
> jack up the clocks? Did you use the correct init sequence and porches
> for the 120Hz mode, including the mode switch command set?
> 
panel will turn into bluescreen when freqency overs 104HZ, downstream
seems use a dsi-cphy enhance feature to make it working. Init sequence
and porches are right

> Could you also implement a 60 (or whatever other value is also
> implemented downstream) Hz mode?
I will try to implement it.
> 
> > +	.clock = (1600 + 60 + 8 + 60) * (2560 + 26 + 4 + 168) * 104 / 1000,
> > +	.hdisplay = 1600,
> > +	.hsync_start = 1600 + 60,
> > +	.hsync_end = 1600 + 60 + 8,
> > +	.htotal = 1600 + 60 + 8 + 60,
> > +	.vdisplay = 2560,
> > +	.vsync_start = 2560 + 26,
> > +	.vsync_end = 2560 + 26 + 4,
> > +	.vtotal = 2560 + 26 + 4 + 168,
> > +};
> > +
> > +static const struct drm_display_mode elish_csot_mode = {
> > +	/* Current max freqency is 104HZ, TODO 120HZ */
> > +	.clock = (1600 + 200 + 40 + 52) * (2560 + 26 + 4 + 168) * 104 / 1000,
> > +	.hdisplay = 1600,
> > +	.hsync_start = 1600 + 200,
> > +	.hsync_end = 1600 + 200 + 40,
> > +	.htotal = 1600 + 200 + 40 + 52,
> > +	.vdisplay = 2560,
> > +	.vsync_start = 2560 + 26,
> > +	.vsync_end = 2560 + 26 + 4,
> > +	.vtotal = 2560 + 26 + 4 + 168,
> > +};
> > +
> > +static const struct panel_desc elish_boe_desc = {
> > +	.modes = &elish_boe_mode,
> > +	.dsi_info = {
> > +		.type = "NT36523",
> That's a bit vague, the driver IC is not very telling about the
> panel itself. Since we're not able to determine much more information,
> this could contain the panel manufacturer and the device name.
Acked.
> 
> > +		.channel = 0,
> > +		.node = NULL,
> > +	},
> > +	.width_mm = 127,
> > +	.height_mm = 203,
> > +	.bpc = 8,
> > +	.lanes = 3,
> > +	.format = MIPI_DSI_FMT_RGB888,
> > +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
> > +	.init_sequence = elish_boe_init_sequence,
> > +	.is_dual_dsi = true,
> > +};
> > +
> [...]
> 
> > +static int nt36523_probe(struct mipi_dsi_device *dsi)
> > +{
> [...]
> 
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
> Shouldn't you put the reference only if it's found?
thanks for spot it.
> 
> > +		if (!dsi1_host) {
> > +			dev_err(dev, "cannot get secondary DSI host\n");
> > +			return -EPROBE_DEFER;
> dev_err_probe, here and in neighbouring exit return paths?
Acked.
> 
> 
> Konrad
