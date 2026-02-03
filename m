Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALIWKAsogmnPPgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 17:53:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294A8DC512
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 17:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E2E10E715;
	Tue,  3 Feb 2026 16:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ngK5+YA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A70F10E715
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 16:53:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2D9331A2BC2;
 Tue,  3 Feb 2026 16:53:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E421360728;
 Tue,  3 Feb 2026 16:53:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4C51D119A8888; Tue,  3 Feb 2026 17:53:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770137604; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ibDtmuQVA6j42GniTwjElTySRXx2PReTUkYFO0TEtzU=;
 b=ngK5+YA89MEKf5Lyg9woI6zPXYK9jjhjeZMvfbGl3WkeDkJoKZn+MQsoOBUBLX3nGbPaPJ
 0ZuOnvRYmiH/E0y0mLOUrs1zcE8NQKeT4fEn7E8OYOMtf0amDNRuU/WNJoGWYxNRnzgXpp
 B8GD9ZGDIA4PleR9M3jPMfUnIfH6LrYDQPt4A1wQLvWAi7yhnyyOpnhJ9aUOHgrGqX+P9M
 zCT8cMcPOK8i3EBk2JeWQrGkdgobXxUsbTxsanIa9dI6EIClTz/6xlGkG7qHBdD4reiC0+
 ddP8UeAQ1v7TZ5K/stnV0oGgeG1ukjAlHqqd6lXftbS6farrYxI6Ofk5JqVavA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
Subject: Re: [PATCH 0/3] drm/bridge: imx: A few fixes
Message-Id: <177013759713.1993107.17429169659147772176.b4-ty@bootlin.com>
Date: Tue, 03 Feb 2026 17:53:17 +0100
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
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:victor.liu@nxp.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de,nxp.com];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 294A8DC512
X-Rspamd-Action: no action


On Fri, 23 Jan 2026 17:22:14 +0800, Liu Ying wrote:
> This patch series contains 3 bug fixes for i.MX8QXP DRM bridges.
> Each patch fixes a NULL pointer dereference issue and stands alone.
> 
> 

Applied, thanks!

[1/3] drm/bridge: imx8qxp-ldb: Fix NULL pointer dereference in imx8qxp_ldb_bridge_destroy()
      (no commit info)
[2/3] drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer dereference in imx8qxp_pxl2dpi_bridge_destroy()
      (no commit info)
[3/3] drm/bridge: imx8qxp-pixel-combiner: Fix bailout for imx8qxp_pc_bridge_probe()
      commit: fe6d29b082d49df336ebb92226a3c004ae9e3222

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

