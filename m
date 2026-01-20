Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIxyIFKpb2kZEwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:12:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 177A44728F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD6210E5EF;
	Tue, 20 Jan 2026 14:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jWxVCnbC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9753610E5EF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 14:16:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 601E2C214EF;
 Tue, 20 Jan 2026 14:15:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 75FC1606AB;
 Tue, 20 Jan 2026 14:16:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C5B5010B698AE; Tue, 20 Jan 2026 15:15:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768918562; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+sjV4jKZbmaCgDV+GkMaLzLnPZD2hmO2N+9AYVVEwgo=;
 b=jWxVCnbCkzG1ahCUoIe6zWU7LBpBHB9DhliiM0lM8yu2Jq6FBVXrGVmvXCS3nMRLdeGeyC
 dhWRn6K1Rh+vjBnUoWUnJXUf4WRGtEXrsg7JshFYDmafpl8SIJdpySEakihoFFiDEqMngi
 iAmQzHGDrXCnxIn0Kyr75uMDpgbg2kBSbohOpxxCRM7qunkgrmR88S1QiUrDxqGpQDNc0/
 8Kr47qQmMW4s++eN70Y8Bug/+6qGCFfEInYJEtufQPtVVPjSs8Eio488J11LDjS0NqdlI+
 oyxbmSmIfSAnD2FxMebS1yS4b5RWHr5imr2k3tGt+6EBj/9wi2F6EtA93teD7Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 stable@vger.kernel.org
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
Subject: Re: [PATCH v2 00/12] drm/bridge: convert users of
 of_drm_find_bridge(), part 2
Message-Id: <176891855295.598401.9824700731247929118.b4-ty@bootlin.com>
Date: Tue, 20 Jan 2026 15:15:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:philippe.cornu@st.com,m:benjamin.gaignard@linaro.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:adrien.grassein@gmail.com,m:victor.liu@nxp.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:m.szyprowski@samsung.com,m:luca.ceresoli@bootlin.com,m:Hui.Pu@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:stable@vger.kernel.org,m:jernejskrabec@gmail.com,m:adriengrassein@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,st.com,linaro.org,intel.com,ideasonboard.com,kwiboo.se,nxp.com,pengutronix.de,samsung.com,amarulasolutions.com,bootlin.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: 177A44728F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 09 Jan 2026 08:31:31 +0100, Luca Ceresoli wrote:
> This series converts all DRM bridge drivers (*) from the now deprecated
> of_drm_find_bridge() to its replacement of_drm_find_and_get_bridge() which
> allows correct bridge refcounting. It also converts per-driver
> "next_bridge" pointers to the unified drm_bridge::next_bridge which puts
> the reference automatically on bridge deallocation.
> 
> This is part of the work to support hotplug of DRM bridges. The grand plan
> was discussed in [0].
> 
> [...]

Applied, thanks!

[01/12] drm: of: drm_of_panel_bridge_remove(): fix device_node leak
        commit: a4b4385d0523e39a7c058cb5a6c8269e513126ca
[02/12] drm: of: drm_of_panel_bridge_remove(): convert to of_drm_find_and_get_bridge()
        commit: f675a276b84488e78287dd22c2e9461e4c008c66
[03/12] drm/bridge: sii902x: convert to of_drm_find_and_get_bridge()
        commit: d07490fb23958006bcecd6f2ba411571c099d104
[04/12] drm/bridge: thc63lvd1024: convert to of_drm_find_and_get_bridge()
        commit: 9d34e1a8cf7b643bca058a65f3441d90099b297f
[05/12] drm/bridge: tfp410: convert to of_drm_find_and_get_bridge()
        commit: 35dd5e1c089b6fd9f503bb15ebc1138d5a3f887e
[06/12] drm/bridge: tpd12s015: convert to of_drm_find_and_get_bridge()
        commit: 0bbca46cd50a527bded903ffe7f32e3761e825bd
[07/12] drm/bridge: lt8912b: convert to of_drm_find_and_get_bridge()
        commit: 31cb3cd7e7149983e279f3d6da3ae5757a965ea5
[08/12] drm/bridge: imx8mp-hdmi-pvi: convert to of_drm_find_and_get_bridge()
        commit: 7654c807f20701ebd1dc7e967270d017dcc36730
[09/12] drm/bridge: imx8qxp-ldb: convert to of_drm_find_and_get_bridge()
        commit: 32529d384cea3a9b939ff1b56aa30a13f8370129
[10/12] drm/bridge: samsung-dsim: samsung_dsim_host_attach: use a temporary variable for the next bridge
        commit: e5e1a0000746ded4d9fa16fceda0748aec2b6e6a
[11/12] drm/bridge: samsung-dsim: samsung_dsim_host_attach: don't use the bridge pointer as an error indicator
        commit: 33f86ac63031d0593e48eb0a738f2d1b1ee29879
[12/12] drm/bridge: samsung-dsim: samsung_dsim_host_attach: convert to of_drm_find_and_get_bridge()
        commit: 685d0dfc37d081e56374852165afc8ab3b3e8d5b

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

