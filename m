Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AE9A22E24
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E707010E985;
	Thu, 30 Jan 2025 13:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kpvlUAoe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1E410E981
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 13:48:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9CD044296;
 Thu, 30 Jan 2025 13:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738244905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0uQmB25EJhB+8/HLFAr4UH4azwGCGo+vs6Zi+bry4J4=;
 b=kpvlUAoexrm8muR1mbmhp/JeCUEtGZOeeOL08ScXyfKp+0vLRMoMmUyuc34CYCPuZIcxZg
 V0p42CTAgYw44P7i5I3eFuAuC1msuxa29wM1pF+z06mglTnljKS000qFaI0XJVprrmomII
 Mlbj83hS6vwuMrK2XZiW3H1rORW5UmjSeaMPRgALrIKWTaWsO9G6jUnhosKdsUWxfkUUo2
 FT72iO0VuZ1tCx6k87BUixhp3E1n+D8PEKMwAdgx+6ieie90p+lkTyP++fo5IKGH/X3Ug4
 uNL6iLpKNCDWjj5E4Y6dRiA1sMXI1JQUvIlQeKaEEjZcqUPeoJ3PoVTtg1gx9g==
Date: Thu, 30 Jan 2025 14:48:23 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/13] drm/vkms: Allow to configure multiple encoders
Message-ID: <Z5uDJ00o6Hqm6i9a@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-11-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129110059.12199-11-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgjeevteekvdelteduuedugeefjeehueejfeekgfdtuefgteefuedtveeikedvkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhst
 heslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
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

On 29/01/25 - 12:00, José Expósito wrote:
> Add a list of encoders to vkms_config and helper functions to add and
> remove as many encoders as wanted.
> 
> For backwards compatibility, add one encoder to the default
> configuration.
> 
> A future patch will allow to attach encoders and CRTCs, but for the
> moment there are no changes in the way the output is configured.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>

[...]

> +static void vkms_config_test_valid_encoder_number(struct kunit *test)

Same as before, can you rename to vkms_config_test_invalid_encoder_number

> +{
> +	struct vkms_config *config;
> +	struct vkms_config_encoder *encoder_cfg;
> +	int n;
> +
> +	config = vkms_config_default_create(false, false, false);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	/* Invalid: No encoders */
> +	encoder_cfg = list_first_entry(&config->encoders, typeof(*encoder_cfg), link);
> +	vkms_config_destroy_encoder(config, encoder_cfg);
> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> +
> +	/* Invalid: Too many encoders */
> +	for (n = 0; n <= 32; n++)
> +		vkms_config_add_encoder(config);
> +
> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> +
> +	vkms_config_destroy(config);
> +}
> +

[...]

> +struct vkms_config_encoder **vkms_config_get_encoders(const struct vkms_config *config,
> +						      size_t *out_length)
> +{
> +	struct vkms_config_encoder **array;
> +	struct vkms_config_encoder *encoder_cfg;
> +	size_t length;
> +	int n = 0;
> +
> +	length = list_count_nodes((struct list_head *)&config->encoders);
> +	if (length == 0) {
> +		*out_length = length;
> +		return NULL;
> +	}
> +
> +	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
> +	if (!array)
> +		return ERR_PTR(-ENOMEM);
> +
> +	list_for_each_entry(encoder_cfg, &config->encoders, link) {
> +		array[n] = encoder_cfg;
> +		n++;
> +	}
> +
> +	*out_length = length;
> +	return array;
> +}

Same as before, can we use an iterator?

> +struct vkms_config_encoder *vkms_config_add_encoder(struct vkms_config *config)
> +{
> +	struct vkms_config_encoder *encoder_cfg;
> +
> +	encoder_cfg = kzalloc(sizeof(*encoder_cfg), GFP_KERNEL);
> +	if (!encoder_cfg)
> +		return ERR_PTR(-ENOMEM);
> +
> +	list_add_tail(&encoder_cfg->link, &config->encoders);
> +
> +	return encoder_cfg;
> +}
> +
> +void vkms_config_destroy_encoder(struct vkms_config *config,
> +				 struct vkms_config_encoder *encoder_cfg)
> +{
> +	list_del(&encoder_cfg->link);
> +	kfree(encoder_cfg);
> +}

Same as before, can we change the add/destroy naming?

