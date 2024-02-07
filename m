Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AFC84CC16
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 14:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A035D11326F;
	Wed,  7 Feb 2024 13:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F9211326F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 13:55:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D6A561782;
 Wed,  7 Feb 2024 13:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07488C433F1;
 Wed,  7 Feb 2024 13:54:58 +0000 (UTC)
Message-ID: <9bc65445-8f50-4227-ad3c-04dd32832419@xs4all.nl>
Date: Wed, 7 Feb 2024 14:54:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: i2c: replace of_graph_get_next_endpoint()
Content-Language: en-US, nl
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Eugen Hristev
 <eugen.hristev@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Helge Deller <deller@gmx.de>, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Russell King <linux@armlinux.org.uk>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Sam Ravnborg
 <sam@ravnborg.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tim Harvey <tharvey@gateworks.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87r0hqnvxc.wl-kuninori.morimoto.gx@renesas.com>
 <20240206134155.GB2827@pendragon.ideasonboard.com>
 <9d1e99b0-892d-4a72-a9b3-886b8ed094b0@xs4all.nl> <m3eddoza9y.fsf@t19.piap.pl>
 <20240207135152.GG2827@pendragon.ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240207135152.GG2827@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 07/02/2024 14:51, Laurent Pinchart wrote:
> On Wed, Feb 07, 2024 at 02:14:33PM +0100, Krzysztof Hałasa wrote:
>> Hans,
>>
>> Hans Verkuil <hverkuil-cisco@xs4all.nl> writes:
>>
>>> Ideally someone would have to actually test this, perhaps with one of those
>>> Renesas boards. While I do have one, it got bricked after I attempted a
>>> u-boot update :-(
>>
>> May be reversible, though.
> 
> Maybe Morimoto-san could help ? :-) What board did you use Hans ?
> 

I have a Koelsch. I tried to update uboot at one time, but bricked it and was
unable to get a different uboot installed.

It would be nice if it can be revived.

Regards,

	Hans
