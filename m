Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ATKEF+0pmk7TAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 11:13:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1AB1EC7F3
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 11:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE6210E6C9;
	Tue,  3 Mar 2026 10:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B4510E6C9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 10:13:47 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1vxMkl-0001RA-VG; Tue, 03 Mar 2026 11:13:23 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1vxMkj-003Wua-0a;
 Tue, 03 Mar 2026 11:13:22 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
 (envelope-from <mfe@pengutronix.de>) id 1vxMkk-0000000G2Od-1b45;
 Tue, 03 Mar 2026 11:13:22 +0100
Date: Tue, 3 Mar 2026 11:13:22 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, luca.ceresoli@bootlin.com,
 devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, frank.li@nxp.com
Subject: Re: [PATCH v10 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Message-ID: <2mbaz4jixv3h5ofvaneoe7muwr7snvwzs6lulorj4yul6arglt@ac5kzsx7zw4c>
References: <20260302-v6-18-topic-imx93-parallel-display-v10-0-634fe2778c7a@pengutronix.de>
 <20260302-v6-18-topic-imx93-parallel-display-v10-2-634fe2778c7a@pengutronix.de>
 <d97a9c0c-bdda-466a-8131-73799cdb20cd@nxp.com>
 <jyawx2cllg2jecdvx6bdfv4qiinfiwb6cuuwdhditpr2g2evee@qiox37ahgczd>
 <edc74093-abe3-4782-8e81-afd87222c146@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edc74093-abe3-4782-8e81-afd87222c146@nxp.com>
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
X-Rspamd-Queue-Id: CA1AB1EC7F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:victor.liu@nxp.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:frank.li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.555];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:email,pengutronix.de:url,pengutronix.de:email]
X-Rspamd-Action: no action

On 26-03-03, Liu Ying wrote:
> On Tue, Mar 03, 2026 at 09:05:43AM +0100, Marco Felsch wrote:
> > On 26-03-03, Liu Ying wrote:
> >> On Mon, Mar 02, 2026 at 05:10:41PM +0100, Marco Felsch wrote:
> >>> From: Liu Ying <victor.liu@nxp.com>
> >>>
> >>> NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
> >>> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> >>> field. Add a DRM bridge driver to support the display format configuration.
> >>>
> >>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >>> [m.felsch@pengutronix.de: port to v7.0-rc1]
> >>> [m.felsch@pengutronix.de: add review feedback (Alexander)]
> >>> [m.felsch@pengutronix.de: fix to short Kconfig description (checkpath)]
> >>> [m.felsch@pengutronix.de: use "GPL" instead of "GPL v2" (checkpatch)]
> >>> [m.felsch@pengutronix.de: add bus-width support]
> >>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> >>> ---
> >>>  drivers/gpu/drm/bridge/imx/Kconfig      |  11 ++
> >>>  drivers/gpu/drm/bridge/imx/Makefile     |   1 +
> >>>  drivers/gpu/drm/bridge/imx/imx93-pdfc.c | 225 ++++++++++++++++++++++++++++++++
> >>>  3 files changed, 237 insertions(+)
> >>>
> >>
> >> [...]
> >>
> >>> +static bool imx93_pdfc_bus_output_fmt_supported(const  u32 fmt)
> >>
> >> As I mentioned in v9, can you drop const?
> >> I don't think const is needed.
> > 
> > It makes sense to spot failures early. Albeit this function is very
> > small, the fmt shouldn't be changed and therefore needs to be const.
> 
> If fmt is a pointer, then I think it makes sense to keep const.
> Otherwise, it looks a bit over engineered to have const, since this
> function is really small and no one would try to change fmt.

I'm aware that this is a copy of the output_cfg.format value. Would it
be a non const value you could mess with it and return the wrong value
afterwards. Keeping it const avoids this. Not sure why a 'const' is
worth the discussion :/

> > I forgot to add the double space fix though, thanks.
> > 
> >>> +{
> >>> +	int i;
> >>> +
> >>> +	for (i = 0; i < ARRAY_SIZE(imx93_pdfc_bus_output_fmts); i++) {
> >>> +		if (imx93_pdfc_bus_output_fmts[i] == fmt)
> >>> +			return true;
> >>> +	}
> >>> +
> >>> +	return false;
> >>> +}
> 
> [...]
> 
> >>> +static int imx93_pdfc_bridge_atomic_check(struct drm_bridge *bridge,
> >>> +					  struct drm_bridge_state *bridge_state,
> >>> +					  struct drm_crtc_state *crtc_state,
> >>> +					  struct drm_connector_state *conn_state)
> >>> +{
> >>> +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> >>> +	const u32 format = bridge_state->output_bus_cfg.format;
> >>
> >> Can you drop const?
> > 
> > No because this function is not supposed to change the format. The
> > function documentation says: this function can alter the bus_cfg.flags
> > bit _not_ the format.
> 
> The local variable format is not a pointer, so literally the value of
> bridge_state->output_bus_cfg.format cannot be changed through format,
> which follows the documentation.  So, I think const could be dropped.

Same here, I'm aware that this is not the pointer value but it holds a
copy of the value. Any adaptions made to the copy will fail, any
assignment of a const value to a non const value will prints at least a
warning to show that something is wrong within this function. Only a
direct bridge_state->output_bus_cfg.format assigned would cause no
compiler error/warning, fingers crossed that this will not happen.

I'm not sure why the 'const' is such a big problem in your oppinion.
Everything works just fine and we've done everything in our power to
avoid a wrong function behavior.

Regards,
  Marco


> 
> > 
> > Regards,
> >   Marco
> > 
> > 
> > 
> >>
> >> -- 
> >> Regards,
> >> Liu Ying
> >>
> > 
> 
> -- 
> Regards,
> Liu Ying
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
