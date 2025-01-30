Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D1AA22E28
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D970D10E972;
	Thu, 30 Jan 2025 13:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pn1OW3pr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F12E10E982
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 13:48:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F19F442FB;
 Thu, 30 Jan 2025 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738244902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fMKFvNBkVO0/MDUp8nOqVPyZY6wGb4ZRt5EIDceuMt4=;
 b=pn1OW3prdAy82FX1W+4aGunB/VxlV3pBMmAZyPK/BULx+fba+KWh0aDrjYYGbGA7uqLrvE
 c+53KLSRUUur3B7gL2FVMUhSSqpYvKq0i6i8HX21ZeroTJM0o+y8sdWExKlt7Fe1gfpY5I
 F/G7Lqk0Xdt6RspOKvczgy4ZoqhFxuLVokJr5wDiMpt1jn8w72dYWvbFobNyN9fcHb4Tt4
 F5AbpPC6Oyw5HKK9lO3zKUx+ova6voW9MvCSuOAZ3U3A51bvVWR4expVY+4tHC4rxjfe1i
 skhGoFd4NP1/K9Zx7BMWSoyMMNnXMrRscjS/Jp3MqWvNgKQE5oZeI/wOgd4UTA==
Date: Thu, 30 Jan 2025 14:48:20 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/13] drm/vkms: Allow to configure multiple CRTCs
Message-ID: <Z5uDJFHnn1HzWOz4@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-9-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129110059.12199-9-jose.exposito89@gmail.com>
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
> Add a list of CRTCs to vkms_config and helper functions to add and
> remove as many CRTCs as wanted.
> 
> For backwards compatibility, add one CRTC to the default configuration.
> 
> A future patch will allow to attach planes and CRTCs, but for the
> moment there are no changes in the way the output is configured.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>

[...]

> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c

[...]

> +static void vkms_config_test_valid_crtc_number(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	struct vkms_config_crtc *crtc_cfg;
> +	int n;
> +
> +	config = vkms_config_default_create(false, false, false);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	/* Invalid: No CRTCs */
> +	crtc_cfg = list_first_entry(&config->crtcs, typeof(*crtc_cfg), link);
> +	vkms_config_destroy_crtc(config, crtc_cfg);
> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> +
> +	/* Invalid: Too many CRTCs */
> +	for (n = 0; n <= 32; n++)
> +		vkms_config_add_crtc(config);
> +
> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> +
> +	vkms_config_destroy(config);
> +}

Same as before, can you rename the fonction to 
vkms_config_test_invalid_crtc_number

[...]

> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c

[...]

> +struct vkms_config_crtc **vkms_config_get_crtcs(const struct vkms_config *config,
> +						size_t *out_length)
> +{
> +	struct vkms_config_crtc **array;
> +	struct vkms_config_crtc *crtc_cfg;
> +	size_t length;
> +	int n = 0;
> +
> +	length = list_count_nodes((struct list_head *)&config->crtcs);
> +	if (length == 0) {
> +		*out_length = length;
> +		return NULL;
> +	}
> +
> +	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
> +	if (!array)
> +		return ERR_PTR(-ENOMEM);
> +
> +	list_for_each_entry(crtc_cfg, &config->crtcs, link) {
> +		array[n] = crtc_cfg;
> +		n++;
> +	}
> +
> +	*out_length = length;
> +	return array;
> +}

Same as before, can't we use an iterator?

[...]

> +static bool valid_crtc_number(struct vkms_config *config)
> +{
> +	size_t n_crtcs;
> +
> +	n_crtcs = list_count_nodes(&config->crtcs);
> +	if (n_crtcs <= 0 || n_crtcs >= 32) {
> +		pr_err("The number of CRTCs must be between 1 and 31\n");

I agree we need some logs, but I think pr_err is too agressive (i.e may 
be considered as an error by some test tools).

I think we should at least:
- lower to warn/notice/info
- use drm variants of the macro

> +		return false;
> +	}
> +
> +	return true;
> +}
> +

[...]

> +struct vkms_config_crtc *vkms_config_add_crtc(struct vkms_config *config)
> +{
> +	struct vkms_config_crtc *crtc_cfg;
> +
> +	crtc_cfg = kzalloc(sizeof(*crtc_cfg), GFP_KERNEL);
> +	if (!crtc_cfg)
> +		return ERR_PTR(-ENOMEM);
> +
> +	vkms_config_crtc_set_writeback(crtc_cfg, false);
> +
> +	list_add_tail(&crtc_cfg->link, &config->crtcs);
> +
> +	return crtc_cfg;
> +}
> +
> +void vkms_config_destroy_crtc(struct vkms_config *config,
> +			      struct vkms_config_crtc *crtc_cfg)
> +{
> +	list_del(&crtc_cfg->link);
> +	kfree(crtc_cfg);
> +}

Same as before, the pair add/destroy seems strange.

> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -181,7 +181,8 @@ static int vkms_create(struct vkms_config *config)
>  		goto out_devres;
>  	}
>  
> -	ret = drm_vblank_init(&vkms_device->drm, 1);
> +	ret = drm_vblank_init(&vkms_device->drm,
> +			      vkms_config_get_num_crtcs(config));

At this point we only create one crtc, can you move this change in the 
commit where you create multiple crtc?

>  	if (ret) {
>  		DRM_ERROR("Failed to vblank\n");
>  		goto out_devres;
> -- 
> 2.48.1
> 
