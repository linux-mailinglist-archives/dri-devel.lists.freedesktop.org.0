Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGwgACBCjGnYkAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:47:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D669122601
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E2C10E07C;
	Wed, 11 Feb 2026 08:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gc0koEG5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A9610E07C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 08:47:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0DD114E40C52;
 Wed, 11 Feb 2026 08:47:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BB367606BE;
 Wed, 11 Feb 2026 08:47:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 21F7B11948BAF; Wed, 11 Feb 2026 09:47:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770799640; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tbYZJPtzfNeGa4KqfQcB7C9ai7mWnC80SXxCFDp2yBE=;
 b=gc0koEG5d4I+4+aKeG0lyb0aKeJGcOJn57j88++ThKOX92rUt7VF+mraTBEGGzkA0yfFft
 LYxOd154SeIqbQf84wbKvMqQsBBxcxQ7BSru9O/QNmowaRLBdj1iXD+Bqo9G1cwnYVQb2F
 3nU2S1CZg1vRB6CWYTWmHXSfc7xuuwZQzqQ519IBxPwAa/A6A1kIIokPI34dm+DGeYdVvq
 liq7NStumVbuS+enU3kolkGxbFLlrQgcVNq1dJMpuTH/Ri6CXiFz/6lPdWQKoF9PvpUgHH
 dnPC0d6sSdtHTq9k3hJ5OlGwrKajBX6y6wHhnB/3CD5HqFFfjbhIUuDvBkEpyA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
References: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
Subject: Re: [PATCH v5 00/25] Clean and update tilcdc driver to support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-Id: <177079962986.1196687.11987437266199565774.b4-ty@bootlin.com>
Date: Wed, 11 Feb 2026 09:47:09 +0100
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
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:brgl@bgdev.pl,m:tony@atomide.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:kory.maincent@bootlin.com,m:msp@baylibre.com,m:praneeth@ti.com,m:louis.chauvet@bootlin.com,m:thomas.petazzoni@bootlin.com,m:miguel.gazquez@bootlin.com,m:herve.codina@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-omap@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[iki.fi,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,armlinux.org.uk,bgdev.pl,atomide.com,intel.com,linaro.org,kwiboo.se,bootlin.com];
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
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:mid,bootlin.com:dkim,bootlin.com:email,ti.com:url]
X-Rspamd-Queue-Id: 5D669122601
X-Rspamd-Action: no action


On Fri, 23 Jan 2026 17:12:18 +0100, Kory Maincent (TI.com) wrote:
> The starting point for this work was adding support for the HDMI cape:
> https://www.seeedstudio.com/Seeed-Studio-BeagleBone-Green-HDMI-Cape.html
> This will be sent in a later series.
> 
> Initially, Miguel proposed modifying the ite-it66121 bridge to support
> the legacy behavior without the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag:
> https://lore.kernel.org/lkml/20250909-it66121-fix-v1-1-bc79ca83df17@bootlin.com/
> This patch was NAK'd as we don't want to add more legacy code. Maxime
> requested that the tilcdc driver be updated to use
> DRM_BRIDGE_ATTACH_NO_CONNECTOR instead.
> 
> [...]

Applied, thanks!

[01/25] dt-bindings: display: tilcdc: Convert to DT schema
        commit: e88bb45cf742177a18d63d306be345a294b4c1db
[02/25] dt-bindings: display: tilcdc: Mark panel binding as deprecated
        commit: bc3f1e36d12969060c9068b9c7c14407f869270e
[03/25] drm/tilcdc: Remove simulate_vesa_sync flag
        commit: 332146d21d1d4211520957458973f4316a6c2fa7
[04/25] drm/tilcdc: Add support for DRM bus flags and simplify panel config
        commit: ca062af436593d66ce2afa4cd00a4cb2fb775755
[05/25] drm/tilcdc: Convert legacy panel binding via DT overlay at boot time
        commit: 0ff223d991477fa4677dcb0f1fb00065847e2212
[06/25] drm/tilcdc: Remove tilcdc panel driver
        commit: 8f1e1ab9c794a6efa7ab2b076405b4984319efec
[07/25] drm/tilcdc: Remove component framework support
        commit: b8c3fd741f02b79dceb0489dec49692d447015f9
[08/25] drm/tilcdc: Remove tilcdc_panel_info structure
        commit: 1184e7785d0fafd3b111b0eaf1caeaeec32ba88d
[09/25] drm/tilcdc: Remove redundant #endif/#ifdef in debugfs code
        commit: da4837fb7513db5da6be7fd32e8d8efe8bff673b
[10/25] drm/tilcdc: Remove unused encoder and connector tracking arrays
        commit: e9946e3a869406ed743f64c9fdf8fb5c6af739ba
[11/25] drm/tilcdc: Rename external_encoder and external_connector to encoder and connector
        commit: 9a49c20f3360699439035e0d8543292e4b028f04
[12/25] drm/tilcdc: Rename tilcdc_external to tilcdc_encoder
        commit: cb18dbb74f46bd0aa612aaae144dd191c548739c
[13/25] drm/tilcdc: Remove the useless module list support
        commit: 8fcc0eb34d79d2733ce617073a4c52b42ffeb00f
[14/25] drm/tilcdc: Use drm_module_platform_driver() helper
        commit: 87e66f60f63a746094134bc3e0ffdb6bd87afcb1
[15/25] drm/tilcdc: Move tilcdc_init/fini closer to probe/remove
        commit: e41591e7474920187be7af0404ec9ed63b5f4614
[16/25] drm/tilcdc: Modernize driver initialization and cleanup paths
        commit: 3301302060da8c2034e5e10dc231023ec98051fb
[17/25] drm/tilcdc: Remove the use of drm_device private_data
        commit: 968fefee98d80bedbf1765e48201746880bf7277
[18/25] drm/tilcdc: Convert to DRM managed resources
        commit: 323401c9a166ea5faa300778f3ca336c01d8835a
[19/25] drm/tilcdc: Convert to drm_device-based logging helpers
        commit: 2c6f1b1fa78acd5f3bd80e3519b6b23907ea9c2f
[20/25] drm/tilcdc: Use devm_drm_of_get_bridge() helper
        commit: 1b47ea9fddcf89e4b65045d233bc5a2ee7775df7
[21/25] drm/bridge: tda998x: Remove component support
        commit: d700fd0ff100f4c301dafeb6b944c7229d0adda7
[22/25] drm/bridge: tda998x: Move tda998x_create/destroy into probe and remove
        commit: 22b88deb83af2b94f0441075e5528d16d5dcf5b2
[23/25] drm/bridge: tda998x: Remove useless tda998x_connector_destroy wrapper
        commit: 8ab51f56fd711cd9aa3960916cb0cc4bbc978eb5
[24/25] drm/bridge: tda998x: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR
        commit: c76a8be4feecebbb39095e3c012b67e0f939543d
[25/25] drm/tilcdc: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR
        commit: 400a84e1f7a3681ef24d58d49b5d07e81c14f4e9

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

