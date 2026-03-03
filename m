Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP4dAkHlpmlkZAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:42:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6DA1F082D
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A06810E813;
	Tue,  3 Mar 2026 13:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="K4vsT1tK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8227810E813
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 13:42:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 788FBC40FAA;
 Tue,  3 Mar 2026 13:42:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BD0D95FF29;
 Tue,  3 Mar 2026 13:42:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DC32A103685C9; Tue,  3 Mar 2026 14:42:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1772545332; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=t6FnL1nGnOp3nQgTM5xZBDRFoD8EHpB/OxobjHHyrxA=;
 b=K4vsT1tK7wybbNAPe8tmCAogUGJOJbR+cUwZuB329VCiTkq0OJw40wUKgds69zvDmCo/hg
 as9j/05T4ZJFfMCjXfS9B+YjG9H6s0KF57maGUPNIf2i6SqHzR4P8Qo2xkg6avTtrscNJM
 nCIldUB1haMOCmyA4ZwjF0YsOXoppXtoCmsj6dhU9E3no6Myay1WxZ+iKW9De4/4YLILZc
 G7elJE+td/pcfDwOErWr6Nu8Pk0eG7Nxyp5sqyZvs+3mV7S/TRUfu4oHJrumIB2Q6jADxP
 0UPte8rL2CauGhdLcYpxsd9oFATYweHAqmw03Of+x25+nV7Z2p5omU1YhBmlkA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: dri-devel@lists.freedesktop.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Joseph Guo <qijian.guo@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
References: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge:
 waveshare,dsi2dpi: Document 1..4 DSI lane support
Message-Id: <177254532764.177236.18347134827363909064.b4-ty@bootlin.com>
Date: Tue, 03 Mar 2026 14:42:07 +0100
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
X-Rspamd-Queue-Id: 7F6DA1F082D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,gmail.com,kwiboo.se,nxp.com,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


On Thu, 15 Jan 2026 03:39:42 +0100, Marek Vasut wrote:
> Describe 1..4 DSI lanes as supported. Internally, this bridge is
> an ChipOne ICN6211 which loads its register configuration from a
> dedicated storage and its I2C does not seem to be accessible. The
> ICN6211 supports up to 4 DSI lanes, so this is a hard limit for
> this bridge. The lane configuration is preconfigured in the bridge
> for each of the WaveShare panels.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: display: bridge: waveshare,dsi2dpi: Document 1..4 DSI lane support
      commit: 2befa6407d5c8b543be32c2276d396db395d9d02
[2/2] drm/bridge: waveshare-dsi: Add support for 1..4 DSI data lanes
      commit: fca11428425e92bf21d4a7f5865708c5e64430e4

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

