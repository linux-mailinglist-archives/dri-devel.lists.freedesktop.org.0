Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163B484CB57
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 14:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DCF10E77B;
	Wed,  7 Feb 2024 13:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC6B10FD66
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 13:20:18 +0000 (UTC)
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
 by ni.piap.pl (Postfix) with ESMTPS id 2CA3FC3F2A57;
 Wed,  7 Feb 2024 14:13:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 2CA3FC3F2A57
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,  Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  "Lad, Prabhakar"
 <prabhakar.csengg@gmail.com>,  =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?=
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
In-Reply-To: <20240206134155.GB2827@pendragon.ideasonboard.com> (Laurent
 Pinchart's message of "Tue, 6 Feb 2024 15:41:55 +0200")
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87r0hqnvxc.wl-kuninori.morimoto.gx@renesas.com>
 <20240206134155.GB2827@pendragon.ideasonboard.com>
Date: Wed, 07 Feb 2024 14:13:05 +0100
Message-ID: <m3il30zace.fsf@t19.piap.pl>
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

Laurent,

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

>> +++ b/drivers/media/i2c/adv7604.c
>> @@ -3205,7 +3205,7 @@ static int adv76xx_parse_dt(struct adv76xx_state *=
state)
>>       np =3D state->i2c_clients[ADV76XX_PAGE_IO]->dev.of_node;
>>
>>       /* Parse the endpoint. */
>> -     endpoint =3D of_graph_get_next_endpoint(np, NULL);
>> +     endpoint =3D of_graph_get_endpoint_by_regs(np, 0, -1);
>
> I think this should be port 1 for the adv7611 and port2 for the adv7612.
> The adv7610 may need to use port 1 too, but the bindings likely need to
> be updated.

To be honest I have no idea about ADV7611 and 7612.
The 7610 I have on Tinyrex "mobo" seems to be single port.

ADV7611 seems to be mostly a 7610 in a different package (LQFP 64
instead of some BGA 76). The driver simply treats ADV7610 as a 7611.

ADV7612 is apparently dual port (only one port can be used at a time)
though:

[ADV7612] =3D {
        .type =3D ADV7612,
        .has_afe =3D false,
        .max_port =3D ADV76XX_PAD_HDMI_PORT_A,    /* B not supported */
        .num_dv_ports =3D 1,                      /* normally 2 */


All related in-tree DTS entries (as of v6.8.0-rc1) seem to be ADV7612.

To me it seems all known devices use the first port only.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
