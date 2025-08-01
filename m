Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9A8B18341
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 16:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568C810E874;
	Fri,  1 Aug 2025 14:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="eo+bwKOK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A3510E869
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 14:08:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1731844424;
 Fri,  1 Aug 2025 14:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1754057284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4ZPE0arVZrZCWGCYC1cLTGI6rUOm9sk79v79dZdP6wY=;
 b=eo+bwKOKbwnW5hxg3HVFwA+Be46TNSR2ST+HIA7Pij2mTxwriCXqVf89gOyjjfP+Sk6TQr
 QilxgdP5sWxghrofEv9kq4BPGEsu0ZJ1ehRvFFO0J8nCFUHb0LnQ5yF2xWnrtxrKxe7IFu
 v/IzaSudUrY1CY0Y5LtsBxQK1X/d36m44TqPth3ILe30ufwCnDUtjsHbDhOdOnoWmRQXPp
 WUVNX0pNVIu462bmdpo3eYhCVB3MshWzmGBhJVKQcFmm3qxkhLNwteft4HCIxNVxbOseov
 sPBYGMPu/5QMJJ/yulTvuZTRaKJjs/VK4hui6ND1AzXezJQWa90NKH8vxPM3Gw==
Message-ID: <3c522dd8-0e56-4ab3-84da-d9193137d4fe@bootlin.com>
Date: Fri, 1 Aug 2025 16:07:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-8-824646042f7d@oss.qualcomm.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250801-wb-drop-encoder-v1-8-824646042f7d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdefkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekieevtdefgedtkeehteehtddttdefhffhgeejleejjeeluddvhfdugedvkeehveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeegpdhrtghpthhtohepughmihhtrhihrdgsrghrhihshhhkohhvsehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopehjrghnihdrnhhikhhulhgrsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepshhurhgrjhdrkhgrnhguphgrlhesihhnthgvlhdrtghomhdprhgtphhtthhopehhrghrrhihrdifvghnt
 hhlrghnugesrghmugdrtghomhdprhgtphhtthhopehsuhhnphgvnhhgrdhlihesrghmugdrtghomhdprhgtphhtthhopehsihhquhgvihhrrgesihhgrghlihgrrdgtohhmpdhrtghpthhtoheprghlvgigrghnuggvrhdruggvuhgthhgvrhesrghmugdrtghomhdprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 01/08/2025 à 15:51, Dmitry Baryshkov a écrit :
> Rename drm_writeback_connector_init_with_encoder() to
> drm_writeback_connector_init() and adapt its interface to follow
> drmm_writeback_connector_init().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/drm_writeback.c | 14 +++++++-------
>   include/drm/drm_writeback.h     | 10 +++++-----
>   2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index 1a01df91b2c5868e158d489b782f4c57c61a272c..ec2575c4c21b7449707b0595322e2202a0cf9865 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -235,7 +235,7 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
>   }
>   
>   /**
> - * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
> + * drm_writeback_connector_init - Initialize a writeback connector with
>    * a custom encoder

If I understood correctly your series you want to reduce the usage of 
non-drmm writeback, so maybe we can add a comment to direct poeple to 
drmm variant to avoid new usage of this API?

With or without this:

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

>    *
>    * @dev: DRM device
> @@ -263,11 +263,11 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
>    *
>    * Returns: 0 on success, or a negative error code
>    */
> -int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
> -					      struct drm_writeback_connector *wb_connector,
> -					      struct drm_encoder *enc,
> -					      const struct drm_connector_funcs *con_funcs,
> -					      const u32 *formats, int n_formats)
> +int drm_writeback_connector_init(struct drm_device *dev,
> +				 struct drm_writeback_connector *wb_connector,
> +				 const struct drm_connector_funcs *con_funcs,
> +				 struct drm_encoder *enc,
> +				 const u32 *formats, int n_formats)
>   {
>   	struct drm_connector *connector = &wb_connector->base;
>   	int ret;
> @@ -284,7 +284,7 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
>   
>   	return ret;
>   }
> -EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
> +EXPORT_SYMBOL(drm_writeback_connector_init);
>   
>   /**
>    * drm_writeback_connector_cleanup - Cleanup the writeback connector
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index 879ca103320cc225ffb3687419088361315535fc..958466a05e604b387722610fc11f9e841316d21b 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -137,11 +137,11 @@ drm_connector_to_writeback(struct drm_connector *connector)
>   	return container_of(connector, struct drm_writeback_connector, base);
>   }
>   
> -int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
> -				struct drm_writeback_connector *wb_connector,
> -				struct drm_encoder *enc,
> -				const struct drm_connector_funcs *con_funcs, const u32 *formats,
> -				int n_formats);
> +int drm_writeback_connector_init(struct drm_device *dev,
> +				 struct drm_writeback_connector *wb_connector,
> +				 const struct drm_connector_funcs *con_funcs,
> +				 struct drm_encoder *enc,
> +				 const u32 *formats, int n_formats);
>   
>   int drmm_writeback_connector_init(struct drm_device *dev,
>   				  struct drm_writeback_connector *wb_connector,
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

