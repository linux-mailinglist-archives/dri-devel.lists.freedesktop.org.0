Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6017884CB59
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 14:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0122210FD66;
	Wed,  7 Feb 2024 13:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 07 Feb 2024 13:20:18 UTC
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DF210E002
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 13:20:18 +0000 (UTC)
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
 by ni.piap.pl (Postfix) with ESMTPS id 9C86DC3F2A7D;
 Wed,  7 Feb 2024 14:14:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 9C86DC3F2A7D
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,  Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>,  "Lad, Prabhakar"
 <prabhakar.csengg@gmail.com>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Alexey Brodkin <abrodkin@synopsys.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,  Andrzej Hajda
 <andrzej.hajda@intel.com>,  Biju Das <biju.das.jz@bp.renesas.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Daniel Vetter <daniel@ffwll.ch>,  Dave
 Stevenson <dave.stevenson@raspberrypi.com>,  David Airlie
 <airlied@gmail.com>,  Eugen Hristev <eugen.hristev@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,  Helge Deller
 <deller@gmx.de>,  Hugues Fruchet <hugues.fruchet@foss.st.com>,  Jacopo
 Mondi <jacopo@jmondi.org>,  Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
 Russell King <linux@armlinux.org.uk>,  Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Sam Ravnborg <sam@ravnborg.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,  Thomas Zimmermann
 <tzimmermann@suse.de>,  Tim Harvey <tharvey@gateworks.com>,
 dri-devel@lists.freedesktop.org,  linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org,  linux-media@vger.kernel.org,
 linux-omap@vger.kernel.org,  linux-rpi-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/4] media: i2c: replace of_graph_get_next_endpoint()
In-Reply-To: <9d1e99b0-892d-4a72-a9b3-886b8ed094b0@xs4all.nl> (Hans Verkuil's
 message of "Tue, 6 Feb 2024 15:44:45 +0100")
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87r0hqnvxc.wl-kuninori.morimoto.gx@renesas.com>
 <20240206134155.GB2827@pendragon.ideasonboard.com>
 <9d1e99b0-892d-4a72-a9b3-886b8ed094b0@xs4all.nl>
Date: Wed, 07 Feb 2024 14:14:33 +0100
Message-ID: <m3eddoza9y.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 3
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, whitelist
X-KLMS-AntiPhishing: not scanned, whitelist
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30,
 not scanned, whitelist
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

Hans,

Hans Verkuil <hverkuil-cisco@xs4all.nl> writes:

> Ideally someone would have to actually test this, perhaps with one of tho=
se
> Renesas boards. While I do have one, it got bricked after I attempted a
> u-boot update :-(

May be reversible, though.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
