Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F28A89DF3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 14:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0689B10E766;
	Tue, 15 Apr 2025 12:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Wr3wov3q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5B610E766
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 12:26:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3099439A2;
 Tue, 15 Apr 2025 12:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744719990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=48hAWvtDlXq5Osg7MyAgCuPtgoxWC7X4hIYB/TMq83s=;
 b=Wr3wov3qVVg06wQgYQPUtA08CcNkCDOUQxQCuHTLmiHUCIKeNumyZBwxbekBgTkobcLvOv
 pXtPYfFaCIy/LirZ1fuBPz9HcecfY7JQaD5QXqjKGIHo8QO32Yi93FsET9CEMdpyu/pR8o
 eh0vvOevMNnfSS5WCIicDI4G5Dagc4CJOHMSnqqFfq0inKWicKHdJPeEc02U93n81/r60E
 aPxXRHFGovYjWg/qzzY5jL8N++UPf8pmSOp7XQJZD3dcG7dkeGtNX6swFX+yK3XSn7uXbf
 JXHccJwUjQP3VwmJTcEcdXcIlTP40SuI6UTrq1Qr2xpAr+mPIsYQoKN1kh5tuA==
Message-ID: <3a7176f3-ddf2-4845-9b94-7a413c27a1c7@bootlin.com>
Date: Tue, 15 Apr 2025 14:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/16] drm/vkms: Allow to attach encoders and CRTCs via
 configfs
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250407081425.6420-1-jose.exposito89@gmail.com>
 <20250407081425.6420-10-jose.exposito89@gmail.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250407081425.6420-10-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekieevtdefgedtkeehteehtddttdefhffhgeejleejjeeluddvhfdugedvkeehveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepm
 hgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
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



Le 07/04/2025 à 10:14, José Expósito a écrit :
> From: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> Create a default subgroup at
> /config/vkms/encoders/encoder/possible_crtcs that will contain symbolic
> links to the possible CRTCs for the encoder.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Co-developed-by: José Expósito <jose.exposito89@gmail.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>   Documentation/gpu/vkms.rst           |  2 +
>   drivers/gpu/drm/vkms/vkms_configfs.c | 58 ++++++++++++++++++++++++++++
>   2 files changed, 60 insertions(+)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index e24767448775..650dbfa76f59 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -106,6 +106,7 @@ Next, create one or more encoders::
>   To finish the configuration, link the different pipeline items::
>   
>     sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
> +  sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/encoders/encoder0/possible_crtcs
>   
>   Since at least one primary plane is required, make sure to set the right type::
>   
> @@ -122,6 +123,7 @@ Finally, you can remove the VKMS instance disabling it::
>   And removing the top level directory and its subdirectories::
>   
>     sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
> +  sudo rm /config/vkms/my-vkms/encoders/*/possible_crtcs/*
>     sudo rmdir /config/vkms/my-vkms/planes/*
>     sudo rmdir /config/vkms/my-vkms/crtcs/*
>     sudo rmdir /config/vkms/my-vkms/encoders/*
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 0df86e63570a..7de601e39d2b 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -70,11 +70,13 @@ struct vkms_configfs_crtc {
>    *
>    * @group: Top level configuration group that represents a encoder.
>    * Initialized when a new directory is created under "/config/vkms/encoders"
> + * @possible_crtcs_group: Default subgroup of @group at "encoder/possible_crtcs"
>    * @dev: The vkms_configfs_device this encoder belongs to
>    * @config: Configuration of the VKMS encoder
>    */
>   struct vkms_configfs_encoder {
>   	struct config_group group;
> +	struct config_group possible_crtcs_group;
>   	struct vkms_configfs_device *dev;
>   	struct vkms_config_encoder *config;
>   };
> @@ -100,6 +102,10 @@ struct vkms_configfs_encoder {
>   	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
>   		     group)
>   
> +#define encoder_possible_crtcs_item_to_vkms_configfs_encoder(item) \
> +	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
> +		     possible_crtcs_group)
> +
>   static ssize_t crtc_writeback_show(struct config_item *item, char *page)
>   {
>   	struct vkms_configfs_crtc *crtc;
> @@ -364,6 +370,52 @@ static const struct config_item_type plane_group_type = {
>   	.ct_owner	= THIS_MODULE,
>   };
>   
> +static int encoder_possible_crtcs_allow_link(struct config_item *src,
> +					     struct config_item *target)
> +{
> +	struct vkms_configfs_encoder *encoder;
> +	struct vkms_configfs_crtc *crtc;
> +	int ret;
> +
> +	if (target->ci_type != &crtc_item_type)
> +		return -EINVAL;
> +
> +	encoder = encoder_possible_crtcs_item_to_vkms_configfs_encoder(src);
> +	crtc = crtc_item_to_vkms_configfs_crtc(target);
> +
> +	scoped_guard(mutex, &encoder->dev->lock) {
> +		if (encoder->dev->enabled)
> +			return -EBUSY;
> +
> +		ret = vkms_config_encoder_attach_crtc(encoder->config, crtc->config);
> +	}
> +
> +	return ret;
> +}
> +
> +static void encoder_possible_crtcs_drop_link(struct config_item *src,
> +					     struct config_item *target)
> +{
> +	struct vkms_configfs_encoder *encoder;
> +	struct vkms_configfs_crtc *crtc;
> +
> +	encoder = encoder_possible_crtcs_item_to_vkms_configfs_encoder(src);
> +	crtc = crtc_item_to_vkms_configfs_crtc(target);
> +
> +	scoped_guard(mutex, &encoder->dev->lock)
> +		vkms_config_encoder_detach_crtc(encoder->config, crtc->config);
> +}
> +
> +static struct configfs_item_operations encoder_possible_crtcs_item_operations = {
> +	.allow_link	= encoder_possible_crtcs_allow_link,
> +	.drop_link	= encoder_possible_crtcs_drop_link,
> +};
> +
> +static const struct config_item_type encoder_possible_crtcs_group_type = {
> +	.ct_item_ops	= &encoder_possible_crtcs_item_operations,
> +	.ct_owner	= THIS_MODULE,
> +};
> +
>   static void encoder_release(struct config_item *item)
>   {
>   	struct vkms_configfs_encoder *encoder;
> @@ -413,6 +465,12 @@ static struct config_group *make_encoder_group(struct config_group *group,
>   
>   		config_group_init_type_name(&encoder->group, name,
>   					    &encoder_item_type);
> +
> +		config_group_init_type_name(&encoder->possible_crtcs_group,
> +					    "possible_crtcs",
> +					    &encoder_possible_crtcs_group_type);
> +		configfs_add_default_group(&encoder->possible_crtcs_group,
> +					   &encoder->group);
>   	}
>   
>   	return &encoder->group;

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

