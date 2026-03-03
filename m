Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHaPISxRp2nKggAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:22:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42861F7740
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606AB10E8D4;
	Tue,  3 Mar 2026 21:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FB710E8D4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 21:22:47 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1vxXBs-0000S8-Bq; Tue, 03 Mar 2026 22:22:04 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1vxXBo-003bpC-2q;
 Tue, 03 Mar 2026 22:22:02 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
 (envelope-from <mfe@pengutronix.de>) id 1vxXBq-0000000G9tJ-0Owv;
 Tue, 03 Mar 2026 22:22:02 +0100
Date: Tue, 3 Mar 2026 22:22:02 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 luca.ceresoli@bootlin.com, 
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v11 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Message-ID: <3dyb7wc7tg6hc4o4qocn4nft7bu3hbdpxcnv7cln2q6vkxo7bw@dtnswwyou5sp>
References: <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
 <20260303210131.2966214-2-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303210131.2966214-2-Frank.Li@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
X-Rspamd-Queue-Id: E42861F7740
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@nxp.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[m.felsch@pengutronix.de,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,nxp.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,bootlin.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[m.felsch@pengutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:email]
X-Rspamd-Action: no action

On 26-03-03, Frank Li wrote:
> From: Frank Li (AI-BOT) <frank.li@nxp.com>
> 
> AI bot review and may be useless.

Hi Frank,

albeit I'm very open to new technology, I would appreciate it if your
AI-BOT is used internally first till you're convinced that it reports
real issues instead of false-positives.

Regards,
  Marco

> > +static u32 *
> > +imx93_pdfc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > +					    struct drm_bridge_state *bridge_state,
> > +					    struct drm_crtc_state *crtc_state,
> > +					    struct drm_connector_state *conn_state,
> > +					    u32 output_fmt,
> > +					    unsigned int *num_input_fmts)
> > +{
> > +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> > +	u32 *input_fmts;
> > +
> > +	*num_input_fmts = 0;
> > +
> > +	input_fmts = kmalloc_obj(*input_fmts);
> > +	if (!input_fmts)
> > +		return NULL;
> 
> Missing kfree(input_fmts) in error path if the switch statement
> or subsequent logic fails. Consider allocating a fixed-size array
> or using devm_kzalloc() instead.
> 
> > +	*num_input_fmts = 1;
> > +
> > +	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt)) {
> > +		dev_dbg(pdfc->dev, "No valid output bus-fmt detected, fallback to MEDIA_BUS_FMT_RGB888_1X24\n");
> 
> Line exceeds 80 characters (97 chars). Break into two lines.
> 
> > +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> > +		return input_fmts;
> > +	}
> > +
> > +	switch (output_fmt) {
> > +	case MEDIA_BUS_FMT_RGB888_1X24:
> > +	case MEDIA_BUS_FMT_RGB565_1X16:
> > +		input_fmts[0] = output_fmt;
> > +		break;
> > +	case MEDIA_BUS_FMT_RGB666_1X18:
> > +	case MEDIA_BUS_FMT_FIXED:
> > +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> > +		break;
> > +	}
> 
> Switch statement lacks default case. Add default case to handle
> unexpected format values explicitly.
> 
> > +static int imx93_pdfc_bridge_atomic_enable(struct drm_bridge *bridge,
> > +					    struct drm_atomic_state *state)
> > +{
> > +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> > +	const struct drm_bridge_state *bridge_state;
> > +	unsigned int mask = PARALLEL_DISP_FORMAT;
> > +	unsigned int val;
> > +
> > +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> > +
> > +	switch (bridge_state->output_bus_cfg.format) {
> > +	case MEDIA_BUS_FMT_RGB888_1X24:
> > +	case MEDIA_BUS_FMT_FIXED:
> > +		val = FORMAT_RGB888_TO_RGB888;
> > +		if (pdfc->phy_bus_width == 18) {
> > +			/*
> > +			 * Can be valid if physical bus limitation exists,
> > +			 * therefore use dev_dbg().
> > +			 */
> > +			dev_dbg(pdfc->dev, "Truncate two LSBs from each color\n");
> > +			val = FORMAT_RGB888_TO_RGB666;
> > +		}
> > +		break;
> > +	case MEDIA_BUS_FMT_RGB666_1X18:
> > +		val = FORMAT_RGB888_TO_RGB666;
> > +		
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
