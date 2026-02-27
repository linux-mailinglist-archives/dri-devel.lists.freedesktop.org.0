Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMLIBbqUoWl8ugQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:57:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744B21B7658
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7229910EB33;
	Fri, 27 Feb 2026 12:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="X7EQanc3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0E910EB33
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 12:57:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 371761A1B89;
 Fri, 27 Feb 2026 12:57:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0B4025FE46;
 Fri, 27 Feb 2026 12:57:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1B86C10369428; Fri, 27 Feb 2026 13:57:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1772197043; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=p+p0UUl562gyk3UrWxUblhbV8MmFN1GLY4UQgsyp6dk=;
 b=X7EQanc31Nk6ZDDCLs9MR0GMGEiYvqT7ODRxnq+FizLlEVOoVnKGze2osGI77Ae5xYgzIy
 sCDrRFZKwPs9kXCzb1HqKRU8fKELZb18LPrq1WciEHozVyRcM1MozRNx/QGMdcwrI6WU9S
 FwqycVZBR4aX9JxsyTf+d0SWj1qE+94Av6NVNlEl0ZeD4ThEHLter31QQbdZXPiRSGQozm
 fA3+S3qV7MMs1qRsg1dzDb89D5QGpP9bCWoFqKQwMnbJxkpQbIllgmw/OkRSb4XmI1Y7iA
 UAHiIyr5xVw1bMKkZILteFIrQnPXQmxQvBBaXD0srhw0s3w/A25Sa8pvcfCPbQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 13:57:17 +0100
Message-Id: <DGPRF3KPMHI8.1TDPMKMCB4VSB@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frieder Schrempf"
 <frieder.schrempf@kontron.de>, "Marek Vasut" <marex@denx.de>, "Linus
 Walleij" <linusw@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi83: add test pattern
 generation support
X-Mailer: aerc 0.20.1
References: <20260226-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v1-0-2e15f5a9a6a0@bootlin.com>
 <20260226-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v1-3-2e15f5a9a6a0@bootlin.com>
In-Reply-To: <20260226-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v1-3-2e15f5a9a6a0@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.petazzoni@bootlin.com,m:linux-kernel@vger.kernel.org,m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:frieder.schrempf@kontron.de,m:marex@denx.de,m:linusw@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,kontron.de,denx.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
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
	NEURAL_HAM(-0.00)[-0.984];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:dkim,bootlin.com:url,bootlin.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 744B21B7658
X-Rspamd-Action: no action

Hello,

On Thu Feb 26, 2026 at 5:16 PM CET, Luca Ceresoli wrote:
> Generation of a test pattern output is a useful tool for panel bringup an=
d
> debugging, and very simple to support with this chip.
>
> The value of REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW needs to be divided by tw=
o
> for the test pattern to work in dual LVDS mode. While not clearly stated =
in
> the datasheet, this is needed according to the DSI Tuner [0] output. And
> some dual-LVDS panels refuse to show any picture without this division by
> two.
>
> [0] https://www.ti.com/tool/DSI-TUNER
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I just noticed a small glitch in the implementation.

> +static bool sn65dsi83_test_pattern;
> +module_param_named(test_pattern, sn65dsi83_test_pattern, bool, 0644);
> +
>  enum sn65dsi83_channel {
>  	CHANNEL_A,
>  	CHANNEL_B
> @@ -645,7 +649,11 @@ static void sn65dsi83_atomic_pre_enable(struct drm_b=
ridge *bridge,
>  			  REG_LVDS_LANE_CHB_LVDS_TERM : 0));
>  	regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
>
> -	le16val =3D cpu_to_le16(mode->hdisplay);
> +	/*
> +	 * Active line length needs to be halved for test pattern
> +	 * generation in dual LVDS output.
> +	 */
> +	le16val =3D cpu_to_le16(mode->hdisplay / (sn65dsi83_test_pattern ? 2 : =
1));

In case sn65dsi83_test_pattern is changed from user space after this
cpu_to_le16()...

>  	regmap_bulk_write(ctx->regmap, REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW,
>  			  &le16val, 2);
>  	le16val =3D cpu_to_le16(mode->vdisplay);
> @@ -668,7 +676,8 @@ static void sn65dsi83_atomic_pre_enable(struct drm_br=
idge *bridge,
>  		     (mode->hsync_start - mode->hdisplay) / dual_factor);
>  	regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_FRONT_PORCH,
>  		     mode->vsync_start - mode->vdisplay);
> -	regmap_write(ctx->regmap, REG_VID_CHA_TEST_PATTERN, 0x00);
> +	regmap_write(ctx->regmap, REG_VID_CHA_TEST_PATTERN,
> +		     sn65dsi83_test_pattern ? REG_VID_CHA_TEST_PATTERN_EN : 0);

...but before this regmap_write(), the two registers affected by
sn65dsi83_test_pattern would be written with inconsistent values.

I'm resending with that fixed.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
