Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFpJJG1dpWlc+QUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:50:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C091D5C33
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C21710E473;
	Mon,  2 Mar 2026 09:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="yy9nuxvi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB43A10E473
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 09:50:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 43B26C40F86;
 Mon,  2 Mar 2026 09:50:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EFC905FE89;
 Mon,  2 Mar 2026 09:50:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ADF7B10369541; Mon,  2 Mar 2026 10:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1772445030; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NyMfMtRhobnbhhTa8wxHG744/QHuGG5OUzKRNx7qLZs=;
 b=yy9nuxvixIDkfdT6D+bnnZJLkfisrqHiiN9ObFZNYi8zyLqZIbNFiGVAYCX1Ut/dpDCuk7
 sUfHqMKMg8/sstMsgtB4MeOVqPWHw9nAF57/niUYYK9qmQDrr9fEPUfTrvDy0YyVGdXINX
 iPqeHF7ANoUv0COIn4C6sDSuadT5NOMVjyo4Q7F1l2V+t6NhxUI+aJAUuw6Ug5isqa8+UQ
 QRgfwtQ57T33DhKSnhkTZ/Ei82FoU4v3wxCBBHWOcM0QrzoAGI9LMMje78O+iitxOOcvSR
 NQZze6x4HJIYYvfj/oIBCVBs9tsS7wPCMSV99WQZ5u4vAEnGaDNtFxVrQUKrhw==
Date: Mon, 2 Mar 2026 10:50:21 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Bajjuri Praneeth <praneeth@ti.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Louis Chauvet
 <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v2 0/3] Add support for Seeed Studio BeagleBone HDMI
 cape overlay
Message-ID: <20260302105021.400b9621@kmaincent-XPS-13-7390>
In-Reply-To: <20260216-feature_bbge-v2-0-22805cfdbf62@bootlin.com>
References: <20260216-feature_bbge-v2-0-22805cfdbf62@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:thomas.petazzoni@bootlin.com,m:linux-omap@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:luca.ceresoli@bootlin.com,m:praneeth@ti.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:louis.chauvet@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 25C091D5C33
X-Rspamd-Action: no action

Hello,

On Mon, 16 Feb 2026 17:55:51 +0100
"Kory Maincent (TI)" <kory.maincent@bootlin.com> wrote:

> Add devicetree overlay for the Seeed Studio BeagleBone HDMI cape, which
> provides HDMI output via an ITE IT66121 HDMI bridge and audio support
> through McASP.
>=20
> https://www.seeedstudio.com/Seeed-Studio-BeagleBoner-Green-HDMI-Cape.html
>=20
> This overlay requires the recent tilcdc cleanup patch series that was mer=
ged
> to drm-misc-next to function properly:
> https://lore.kernel.org/lkml/20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bo=
otlin.com/
>=20
> With this DRM tree dependency I don't know if this series should land in
> DRM tree or in OMAP tree.

Any new on this patch series? After a few internal discussions I think it s=
hould
land in OMAP tree.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
