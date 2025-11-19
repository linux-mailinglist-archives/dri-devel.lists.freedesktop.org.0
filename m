Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B286C6F4A5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 15:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8525C10E642;
	Wed, 19 Nov 2025 14:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="va03Afus";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0CB10E642
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 14:29:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1E389C11189;
 Wed, 19 Nov 2025 14:29:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4EBDA60699;
 Wed, 19 Nov 2025 14:29:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 47D9A10371A62; Wed, 19 Nov 2025 15:29:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1763562595; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=aNWIMTkg7carQ7ceMaLkx51XDav1UOHz9uWadTfuDGE=;
 b=va03Afusn2H4yyrQf+VLVDWCgnp+7P85I5wMNM1SsdqWvvK0O+9nBTgh1jq8sVzJlnF4hw
 YjIUEWbej3jIPnCjZQewihe/jOj41J6/80am0kQ4uTdRaSd2WJkxlPawpmA5X+wsFLDRVo
 JuHZpuZEMpRYC2Cbbzqh90ViTsFZ/Oj3NiCao2Zznyn6tTRP8iPhC1ok3lmlA5yZ5DeE+q
 zDD2yi6ejRlVxJ0cf6eDN/ZhkrDcnX5pn4Saod8WNoTXZQmU89Ysrs5PtHZgxsN0zMPevf
 PxFRxHYzTFuCoGm+y2E8UWjWpMVWyiPHkDt4Vta67Gcr7d8wW61R+ta1RdnmkQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 15:29:43 +0100
Message-Id: <DECQREI2GFCG.27I1BBCKPJMFG@bootlin.com>
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
Subject: Re: [PATCH 01/26] drm/bridge: add drm_of_find_bridge()
X-Mailer: aerc 0.20.1
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-1-0db98a7fe474@bootlin.com>
 <35bda203-8c15-4219-a231-1379f909229f@bootlin.com>
In-Reply-To: <35bda203-8c15-4219-a231-1379f909229f@bootlin.com>
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

Hi Louis,

On Wed Nov 19, 2025 at 3:22 PM CET, Louis Chauvet wrote:
>
>
> On 11/19/25 13:05, Luca Ceresoli wrote:
>> of_drm_find_bridge() does not increment the refcount for the returned
>> bridge, but that is required now. However converting it and all its user=
s
>> is not realistically doable at once given the large amount of (direct an=
d
>> indirect) callers and the complexity of some. Also, "of_drm_find_bridge =
is
>> oddly named according to our convention and it would make more sense to =
be
>> called drm_of_find_bridge()" (quoted from Link: below).
>>
>> Solve both issues by creating a new drm_of_find_bridge() that is identic=
al
>> to of_drm_find_bridge() except it takes a reference. Then
>> of_drm_find_bridge() will be deprecated to be eventually removed.
>>
>> Suggested-by: Maxime Ripard <mripard@kernel.org>
>> Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0=
a18ad@houat/
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

...

>> +struct drm_bridge *drm_of_find_bridge(struct device_node *np)
>> +{
>> +	struct drm_bridge *bridge;
>> +
>> +	mutex_lock(&bridge_lock);
>> +
>> +	list_for_each_entry(bridge, &bridge_list, list) {
>> +		if (bridge->of_node =3D=3D np) {
>> +			mutex_unlock(&bridge_lock);
>
> It seems a bit strange to unlock the mutex just before the
> drm_bridge_get, is it expected?

Ouch. No, it's not expected, it is a very silly mistake. Thanks for
noticing.

> If no, I think you can use scoped_guard(mutex, &bridge_lock) to avoid
> messing with mutex_unlock, IIRC, scoped_guard will unlock the mutex just
> after the return, so in your case, just after the drm_bridge_get.
>
>> +			return drm_bridge_get(bridge);
>> +		}
>> +	}

My intent was to keep the function as similar as possible to the original
one, thus I just added a drm_bridge_get(), but that is of course wrong.

So these lines should instead have been:

	if (bridge->of_node =3D=3D np) {
		drm_bridge_get(bridge);
		mutex_unlock(&bridge_lock);
		return bridge;
	}

But indeed scoped_guard() is much cleaner and less error-prone, so I'm
probably going to use it in v2.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
