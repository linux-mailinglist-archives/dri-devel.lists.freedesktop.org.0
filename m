Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DB4C6F942
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 16:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F7C10E650;
	Wed, 19 Nov 2025 15:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="m7vF4ll1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F16C10E650
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 15:13:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id F0D2E1A1BC0;
 Wed, 19 Nov 2025 15:13:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B484260699;
 Wed, 19 Nov 2025 15:13:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8CF7910371A8A; Wed, 19 Nov 2025 16:13:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1763565233; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7NujdOdzUvG8wdCZQfUnNhZngIGWDfpoPw7syCRBlyU=;
 b=m7vF4ll1ceXLHQ7SOaiZpgd4CxFPgYohzfJ0NlZ0aTzSJaXD9VTyQ0b6Nca2vIQ/wrWegN
 X7lT/+WK9S++6avBgiOXY9NP7+MI1jjWHWI7RBsLQX6wfWReUJ54QYX3K53QOZ6/y8dBoc
 rwTJVJ7c+G9WaXQ8N7tTqpG6uDWPHNfn1xUUQJ6LI4Em7jpXR+JjigURq762sngel+VEcW
 YeNbzw3ktmsl5OOmcChfp5qJ6/9qH6bPrQk2TgiRq9mOSsRfXE2q6j3dzq+QEA4YtrRHS0
 cD5J70cFAFYr33yZY126C/B2axcVbx4hl6oArAJtX+b6b2pfPjSYBIGdWMXGmQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 16:13:41 +0100
Message-Id: <DECRP2E0HI3I.APSIIQR4TVWK@bootlin.com>
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet"
 <corbet@lwn.net>, "Alexey Brodkin" <abrodkin@synopsys.com>, "Phong LE"
 <ple@baylibre.com>, "Liu Ying" <victor.liu@nxp.com>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Adrien Grassein" <adrien.grassein@gmail.com>,
 "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Tomi
 Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Anitha Chrisanthus"
 <anitha.chrisanthus@intel.com>, "Edmund Dea" <edmund.j.dea@intel.com>,
 "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo Kim"
 <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 02/26] drm/bridge: deprecate of_drm_find_bridge()
X-Mailer: aerc 0.20.1
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-2-0db98a7fe474@bootlin.com>
 <66cdbe39-d065-4aa4-86e4-84a38b49c09c@bootlin.com>
In-Reply-To: <66cdbe39-d065-4aa4-86e4-84a38b49c09c@bootlin.com>
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

On Wed Nov 19, 2025 at 3:28 PM CET, Louis Chauvet wrote:
>
>
> On 11/19/25 13:05, Luca Ceresoli wrote:
>> of_drm_find_bridge() does not increment the returned bridge
>> refcount. drm_of_find_bridge() is to be used as a replacement.
>>
>> Suggested-by: Maxime Ripard <mripard@kernel.org>
>> Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0=
a18ad@houat/
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

...

>> @@ -1452,6 +1452,9 @@ EXPORT_SYMBOL(drm_of_find_bridge);
>>    *
>>    * @np: device node
>>    *
>> + * This function is deprecated. Use drm_of_find_bridge() instead for pr=
oper
>> + * refcounting.
>> + *
>
> I think it should be more explicit that the refcounting is not done by
> this function, like:
>
> 	This function is deprecated. The returned bridge is not refcounted, you
> should not use drm_bridge_put(). Use drm_of_find_bridge() instead for
> proper refcounting.

OK.

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
