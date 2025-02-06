Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74319A2ACA6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 16:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8B010E89F;
	Thu,  6 Feb 2025 15:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="CR5vPo+0";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="B+4cb1uf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2DC10E23A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 15:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1738856361; x=1770392361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nu8m4uOlFDA+u0T99iQf2bTuV73l/D8rZBvQ030okiA=;
 b=CR5vPo+0SZkQULEyDKRLVxtK82JcmyrvC5IICgj2L8edfmQt9XRwOnem
 yBozn2U/GZ410J1VC+/V2PDimxvCg/DLjlefIDKJSQfO9skY+CziliLt3
 dUJnq/mgqDUp307xl68OlEvlmQMn6/viSKwUJQ9wlO/3eEMi43yGfZEqi
 BxcHrgbBgSDylaRB+ePV7HYqXV1z9pBCRxqVu84ON7hX6lVaf1g7POW5D
 JTVFoPpZjPFRdE4FL49OTmiBSrAnlkgdlAm5iX5W6t7RCgLgZg7flaL23
 EeEeAP2DozQya8D5Y5x0dn2YG2ROZs5FUSK7XigGbi20GGHwKEUa4PAB7 w==;
X-CSE-ConnectionGUID: +s+pPf1WTB6lXyMwIveuSw==
X-CSE-MsgGUID: wlwIYNZKTfSIr6Idjo+bRA==
X-IronPort-AV: E=Sophos;i="6.13,264,1732575600"; d="scan'208";a="41612578"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 06 Feb 2025 16:39:17 +0100
X-CheckPoint: {67A4D7A5-10-8F72533B-EF5B5974}
X-MAIL-CPID: B9E342499AF175E572876BEB97C05D8D_1
X-Control-Analysis: str=0001.0A682F27.67A4D7A6.008D, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 25ABF165ECA; Thu,  6 Feb 2025 16:39:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1738856353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nu8m4uOlFDA+u0T99iQf2bTuV73l/D8rZBvQ030okiA=;
 b=B+4cb1uf7v9DiQf+qu4va01yy1IcqvGJ7kvoiQeuCCdGvCOobbBrnwmlfPcNwoYNBvMAEF
 i79WhgV4baWZYhM2qI4UteTdXDmrC3/CijnG6UbGAoTqcEhEE9ANoar/MTWIz7bCgydFfW
 Y+myR7pZ/nAcw9uFcm0sOp04ic+v/48Qo9i9B3wLLjVgUNMd8teAwIF/0p3o9dTe/Iu1lx
 7qB37GZ+rWIc3UtukzA5lZO/y0drb4q8qp65uSjzaasY4KwvqyztfdG/j9beX3xt3QSb0+
 nd/tGprUefNwllqhtIaYUwgfpvfnBVoZbx8jCOJcVct+4HbEL3GELBth7W+ecA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 4/4] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Date: Thu, 06 Feb 2025 16:39:09 +0100
Message-ID: <8756830.T7Z3S40VBb@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250206162048.1f159ba6@bootlin.com>
References: <20250203161607.223731-1-herve.codina@bootlin.com>
 <3605739.aeNJFYEL58@steina-w> <20250206162048.1f159ba6@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Hi Herve,

Am Donnerstag, 6. Februar 2025, 16:20:48 CET schrieb Herve Codina:
> Hi Alexander,
>=20
> On Thu, 06 Feb 2025 15:38:42 +0100
> Alexander Stein <alexander.stein@ew.tq-group.com> wrote:
>=20
> ...
> > With interrupt configured I got the following stack trace upon
> > reboot/poweroff:
> >=20
> > [   91.317264] sn65dsi83 2-002d: reset the pipe
> > [   91.344093] Unable to handle ke
> > ** replaying previous printk message **
> > [   91.344093] Unable to handle kernel NULL pointer dereference at virt=
ual address 0000000000000000
> ...
>=20
> Ouch :(
>=20
> One question to help me investigating:
> Do you have the issue at init/probe or when you start to display graphics?

This is during shutdown/poweroff. I assume that regmap_reg() in
sn65dsi83_handle_errors() fails and because of that reset_work is scheduled.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


