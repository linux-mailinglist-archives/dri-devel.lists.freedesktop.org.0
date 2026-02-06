Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKn4De/7hWmzIwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:34:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9171FF028
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11E010E7F8;
	Fri,  6 Feb 2026 14:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="O4/OYyMQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E159210E7F8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 14:34:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DBD98C25080;
 Fri,  6 Feb 2026 14:34:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5448260729;
 Fri,  6 Feb 2026 14:34:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A5C85119D1E5B; Fri,  6 Feb 2026 15:34:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770388457; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pWehA4hT35e5zQo3sOZ6upZVBGc9CyStGxGRYaeYtv4=;
 b=O4/OYyMQs02b9A3liRCnH3WTzei8KU+iCKdrKk5eipa++AiDshSrEqUyFzNNbXDKI0ZZGq
 1e2EuX5PmCNKwzTqs3tbZNBFvsMZ03KLxOsqGsKtJ/OUPB1RlMs9bjNVryF5VpjnSHK2tZ
 mfhuskJp2qkd+bNOhAq4HgTjs5q9hN1Zkf7JLk0CN+nNBkgTxiol6Af3NCj5hFIID5V+ds
 iDVmHhE4xma9LQNUy67QLosUJDLSolsJZC15dtK6D17uBdyYW2bkJ/yZxV5eYO31BNr31C
 1rTR8qFBMunDKrtPzj19GOeU5eWz+ig5f8L+jEkZkxHYSXm/Jpqfklq58MRz8A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 15:34:13 +0100
Message-Id: <DG7YBVU2COFT.2JP8PKR4ZAKFT@bootlin.com>
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "David Airlie"
 <airlied@gmail.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>,
 <dri-devel@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2] drm/bridge: waveshare-dsi: Register and attach our
 DSI device at probe
X-Mailer: aerc 0.20.1
References: <20260206125801.78705-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260206125801.78705-1-marek.vasut+renesas@mailbox.org>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:airlied@gmail.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:Laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:jernejskrabec@gmail.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:url,bootlin.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:email]
X-Rspamd-Queue-Id: D9171FF028
X-Rspamd-Action: no action

Hi Marek,

On Fri Feb 6, 2026 at 1:57 PM CET, Marek Vasut wrote:
> In order to avoid any probe ordering issue, the best practice is to move
> the secondary MIPI-DSI device registration and attachment to the
> MIPI-DSI host at probe time.
>
> Besides solving the probe ordering problems, this makes the bridge work
> with R-Car DU. The R-Car DU will attempt to locate the DSI host bridge in
> its own rcar_du_probe()->rcar_du_modeset_init()->rcar_du_encoder_init()
> by calling of_drm_find_bridge() which calls of_drm_find_and_get_bridge()
> and iterates over bridge_list to locate the DSI host bridge.
>
> However, unless the WS driver calls mipi_dsi_attach() in probe(), the
> DSI host bridge .attach callback rcar_mipi_dsi_host_attach() is not
> called and the DSI host bridge is not added into bridge_list. Therefore
> the of_drm_find_and_get_bridge() called from du_probe() will never find
> the DSI host bridge and probe will indefinitelly fail with -EPROBE_DEFER.
>
> The circular dependency here is, that if rcar_du_encoder_init() would
> manage to find the DSI host bridge, it would call the WS driver .attach
> callback ws_bridge_bridge_attach(), but this is too late and can never
> happen. This change avoids the circular dependency.
>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for the very clear description! R-by confirmed.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
