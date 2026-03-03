Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPq+Ki/hpmnFYQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:25:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4431F026A
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2199410E043;
	Tue,  3 Mar 2026 13:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ooLRfBca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C4110E043
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 13:24:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0C1C8C40FA8;
 Tue,  3 Mar 2026 13:25:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 50D485FF29;
 Tue,  3 Mar 2026 13:24:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 22F32103696DB; Tue,  3 Mar 2026 14:24:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1772544294; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5STwc6cUJfY8nE7pmW+Lf4c/Xiu43vKMcApjGm70axo=;
 b=ooLRfBcajd9cL6yYEnGnl1Gd8OAE3AX4PMSf0W8JSAn9x19kM0is3wHX5ap9LCPF7SUnxp
 thW6p7BWWWB0LDA1Um7FuB5dvRAnCas3bCgUZeeoBNwPtroDZ/4Jx82tWiBptwJuROjyuf
 8lb5qCcuS3hl4hKxyqSKWIDYHn4ji3TGZQXDQH74zjL23HBiWAr3QJiRi53IGL+9nshmXj
 vPi1kUtULaSCr6K2kxsWiro/IflKdaOuOrfIAZX2Nom7qhngI4BspHzrV/wfp67ZYDYfOB
 fXTnVzLODhWAZlA2ahoryCa+8JI4vfhNRJnH99Pj7zj8FfxoXrSpvAq0eB7xcw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 14:24:32 +0100
Message-Id: <DGT6I5G4ETM3.2T5C2XO2XHDAW@bootlin.com>
Cc: "Joseph Guo" <qijian.guo@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Conor Dooley" <conor+dt@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Robert Foss" <rfoss@kernel.org>, "Simona Vetter"
 <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>,
 <dri-devel@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: waveshare-dsi: Add support for 1..4
 DSI data lanes
X-Mailer: aerc 0.20.1
References: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
 <20260115024004.660986-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260115024004.660986-2-marek.vasut+renesas@mailbox.org>
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
X-Rspamd-Queue-Id: BC4431F026A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qijian.guo@nxp.com,m:andrzej.hajda@intel.com,m:conor+dt@kernel.org,m:airlied@gmail.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:krzk+dt@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:rfoss@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[nxp.com,intel.com,kernel.org,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org];
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
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:email,mailbox.org:email,bootlin.com:dkim,bootlin.com:email,bootlin.com:url,bootlin.com:mid]
X-Rspamd-Action: no action

On Thu Jan 15, 2026 at 3:39 AM CET, Marek Vasut wrote:
> Parse the data lane count out of DT. Limit the supported data lanes
> to 1..4 which is the maximum available DSI pairs on the connector of
> any known panels which may use this bridge. Internally, this bridge
> is an ChipOne ICN6211 which loads its register configuration from a
> dedicated storage and its I2C does not seem to be accessible. The
> ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.
>
> To avoid any breakage on old DTs where the parsing of data lanes from
> DT may fail, fall back to the original hard-coded value of 2 lanes and
> warn user.
>
> The lane configuration is preconfigured in the bridge for each of the
> WaveShare panels. The 13.3" DSI panel works with 4-lane configuration,
> others seem to use 2-lane configuration. This is a hardware property,
> so the actual count should come from DT.
>
> Reviewed-by: Joseph Guo <qijian.guo@nxp.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
