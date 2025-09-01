Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666F2B3ECB0
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 18:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3963B10E161;
	Mon,  1 Sep 2025 16:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mlahX8tV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9C710E161
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 16:52:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE0E0439A1;
 Mon,  1 Sep 2025 16:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1756745534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QCTr3085Xa6hBKg6QXgP66qPB7i84eR07oEHAnEHSXQ=;
 b=mlahX8tV7/LXhSxxVsp63cubPC3xzgt2qkiUyKjidpy+LUSv8iuoYPjbQO+o2rNtS986m2
 IvBWBpDn1xt4Fimz8IMvijR7avZ5oImvLc2bECeC7rE4tw01mwzsvWWG4aEfP6XNW2YJZ0
 SYRrn+w/1Bry0X6s8aMlrbz5H/WRv8fndqC85XWibkQ42Hmq1Xm6G9PjMCRbBrp1hn9IIt
 dNQX3RGdOmQ1hPLmDpWf6q3xXaUFH2t3tQnPCzmtn2XfOD4IYLZORJwoWsPs+wI39bltyb
 yoIIbgF9sZMfr/gl8J96KFvetpa0TxBglLyNPSol2Q00y9cq592wzSIq0WlfJw==
Date: Mon, 1 Sep 2025 18:52:08 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, victor.liu@nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, l.stach@pengutronix.de,
 shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API
 dw_hdmi_set_sample_iec958() for iec958 format
Message-ID: <20250901185208.394cd162@booty>
In-Reply-To: <20250821073131.2550798-5-shengjiu.wang@nxp.com>
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
 <20250821073131.2550798-5-shengjiu.wang@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduledvieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeegpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesnhigphdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehli
 hhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello Shengjiu,

On Thu, 21 Aug 2025 15:31:28 +0800
Shengjiu Wang <shengjiu.wang@nxp.com> wrote:

> Add API dw_hdmi_set_sample_iec958() for IEC958 format because audio device
> driver needs IEC958 information to configure this specific setting.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Acked-by: Liu Ying <victor.liu@nxp.com>

[...]

> +void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned int iec958)
> +{
> +	mutex_lock(&hdmi->audio_mutex);
> +	hdmi->sample_iec958 = iec958;
> +	mutex_unlock(&hdmi->audio_mutex);
> +}

Apologies for jumping in the discussion as late as in v5, but I noticed
this patch and I was wondering whether this mutex_lock/unlock() is
really needed, as you're copying an int.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
