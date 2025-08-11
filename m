Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89701B21307
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 19:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A70210E099;
	Mon, 11 Aug 2025 17:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="E8pQ3f29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6B810E099
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 17:21:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE0DF444F2;
 Mon, 11 Aug 2025 17:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1754932879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=H8GMHIrqX4TxRkHyehtl4R9d7Hr/8wjeAuL1EnaaFdA=;
 b=E8pQ3f29PYXRjIleRv+G9imEvmmhm7YbupcQ43svAPdkVRZ8GLGkdA7kUARKH+MjR/EGXL
 tL2hGlxeCd+ZW2XpCqv8ha6+274FYd81voSe6ty4vpWuccgsYmx6Bn847hPadIaYnvVVNh
 nUc5snv8kkWzf3frmci3zlryLRuBjwVeCa/p6lPCXdDOiKD/Lp5ftdp+brENAkzL/H1SSc
 jN5VHB6X/ftAWkm/jjWvrRvm5UIsjXI9jOYroYFTF76AVweUqqlxEqXvL+Zl9LKJeoghSd
 GsJHsynzIRlzl1xf3puAePBtkrCNbVSNaBVq97D9pY+4wUnavidi2WNVRbJwhA==
Message-ID: <91587a35-f884-46ad-9869-126d3efbfc61@bootlin.com>
Date: Mon, 11 Aug 2025 19:21:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vkms: Assert if vkms_config_create_*() fails
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250811101529.150716-1-jose.exposito89@gmail.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250811101529.150716-1-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeeftdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejgeejgedutdekhfffgfegudeutdetgfeuveegteeftddtfeevueffgfevgfevkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhegnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghom
 hdprhgtphhtthhopegurghnrdgtrghrphgvnhhtvghrsehlihhnrghrohdrohhrghdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggv
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



Le 11/08/2025 à 12:15, José Expósito a écrit :
> Check that the value returned by the vkms_config_create_*() functions is
> valid. Otherwise, assert and finish the KUnit test.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/dri-devel/aJTL6IFEBaI8gqtH@stanley.mountain/
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

I am not sure on how to use smach, I don't have any warning at all for 
the whole kernel, so I will wait for Dan Carpenter review before applying.

Side question: should we use __must_check in this case to warn at 
compile time?


> ---
>   drivers/gpu/drm/vkms/tests/vkms_config_test.c | 51 +++++++++++++++++--
>   1 file changed, 46 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index ff4566cf9925..b0d78a81d2df 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -200,6 +200,7 @@ static void vkms_config_test_get_planes(struct kunit *test)
>   	KUNIT_ASSERT_EQ(test, n_planes, 0);
>   
>   	plane_cfg1 = vkms_config_create_plane(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg1);
>   	vkms_config_for_each_plane(config, plane_cfg) {
>   		n_planes++;
>   		if (plane_cfg != plane_cfg1)
> @@ -209,6 +210,7 @@ static void vkms_config_test_get_planes(struct kunit *test)
>   	n_planes = 0;
>   
>   	plane_cfg2 = vkms_config_create_plane(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg2);
>   	vkms_config_for_each_plane(config, plane_cfg) {
>   		n_planes++;
>   		if (plane_cfg != plane_cfg1 && plane_cfg != plane_cfg2)
> @@ -242,6 +244,7 @@ static void vkms_config_test_get_crtcs(struct kunit *test)
>   		KUNIT_FAIL(test, "Unexpected CRTC");
>   
>   	crtc_cfg1 = vkms_config_create_crtc(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg1);
>   	KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 1);
>   	vkms_config_for_each_crtc(config, crtc_cfg) {
>   		if (crtc_cfg != crtc_cfg1)
> @@ -249,6 +252,7 @@ static void vkms_config_test_get_crtcs(struct kunit *test)
>   	}
>   
>   	crtc_cfg2 = vkms_config_create_crtc(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg2);
>   	KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 2);
>   	vkms_config_for_each_crtc(config, crtc_cfg) {
>   		if (crtc_cfg != crtc_cfg1 && crtc_cfg != crtc_cfg2)
> @@ -280,6 +284,7 @@ static void vkms_config_test_get_encoders(struct kunit *test)
>   	KUNIT_ASSERT_EQ(test, n_encoders, 0);
>   
>   	encoder_cfg1 = vkms_config_create_encoder(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg1);
>   	vkms_config_for_each_encoder(config, encoder_cfg) {
>   		n_encoders++;
>   		if (encoder_cfg != encoder_cfg1)
> @@ -289,6 +294,7 @@ static void vkms_config_test_get_encoders(struct kunit *test)
>   	n_encoders = 0;
>   
>   	encoder_cfg2 = vkms_config_create_encoder(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg2);
>   	vkms_config_for_each_encoder(config, encoder_cfg) {
>   		n_encoders++;
>   		if (encoder_cfg != encoder_cfg1 && encoder_cfg != encoder_cfg2)
> @@ -324,6 +330,7 @@ static void vkms_config_test_get_connectors(struct kunit *test)
>   	KUNIT_ASSERT_EQ(test, n_connectors, 0);
>   
>   	connector_cfg1 = vkms_config_create_connector(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, connector_cfg1);
>   	vkms_config_for_each_connector(config, connector_cfg) {
>   		n_connectors++;
>   		if (connector_cfg != connector_cfg1)
> @@ -333,6 +340,7 @@ static void vkms_config_test_get_connectors(struct kunit *test)
>   	n_connectors = 0;
>   
>   	connector_cfg2 = vkms_config_create_connector(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, connector_cfg2);
>   	vkms_config_for_each_connector(config, connector_cfg) {
>   		n_connectors++;
>   		if (connector_cfg != connector_cfg1 &&
> @@ -370,7 +378,7 @@ static void vkms_config_test_invalid_plane_number(struct kunit *test)
>   
>   	/* Invalid: Too many planes */
>   	for (n = 0; n <= 32; n++)
> -		vkms_config_create_plane(config);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vkms_config_create_plane(config));
>   
>   	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
>   
> @@ -395,6 +403,7 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
>   
>   	/* Invalid: No primary plane */
>   	plane_cfg = vkms_config_create_plane(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg);
>   	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
>   	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
>   	KUNIT_EXPECT_EQ(test, err, 0);
> @@ -402,11 +411,13 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
>   
>   	/* Invalid: Multiple primary planes */
>   	plane_cfg = vkms_config_create_plane(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg);
>   	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
>   	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
>   	KUNIT_EXPECT_EQ(test, err, 0);
>   
>   	plane_cfg = vkms_config_create_plane(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg);
>   	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
>   	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
>   	KUNIT_EXPECT_EQ(test, err, 0);
> @@ -419,11 +430,13 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
>   
>   	/* Invalid: Multiple cursor planes */
>   	plane_cfg = vkms_config_create_plane(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg);
>   	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
>   	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
>   	KUNIT_EXPECT_EQ(test, err, 0);
>   
>   	plane_cfg = vkms_config_create_plane(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg);
>   	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
>   	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
>   	KUNIT_EXPECT_EQ(test, err, 0);
> @@ -437,12 +450,16 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
>   	/* Invalid: Second CRTC without primary plane */
>   	crtc_cfg = vkms_config_create_crtc(config);
>   	encoder_cfg = vkms_config_create_encoder(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg);
> +
>   	err = vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg);
>   	KUNIT_EXPECT_EQ(test, err, 0);
>   	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
>   
>   	/* Valid: Second CRTC with a primary plane */
>   	plane_cfg = vkms_config_create_plane(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg);
>   	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
>   	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg);
>   	KUNIT_EXPECT_EQ(test, err, 0);
> @@ -486,7 +503,7 @@ static void vkms_config_test_invalid_crtc_number(struct kunit *test)
>   
>   	/* Invalid: Too many CRTCs */
>   	for (n = 0; n <= 32; n++)
> -		vkms_config_create_crtc(config);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vkms_config_create_crtc(config));
>   
>   	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
>   
> @@ -509,7 +526,7 @@ static void vkms_config_test_invalid_encoder_number(struct kunit *test)
>   
>   	/* Invalid: Too many encoders */
>   	for (n = 0; n <= 32; n++)
> -		vkms_config_create_encoder(config);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vkms_config_create_encoder(config));
>   
>   	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
>   
> @@ -531,12 +548,15 @@ static void vkms_config_test_valid_encoder_possible_crtcs(struct kunit *test)
>   
>   	/* Invalid: Encoder without a possible CRTC */
>   	encoder_cfg = vkms_config_create_encoder(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg);
>   	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
>   
>   	/* Valid: Second CRTC with shared encoder */
>   	crtc_cfg2 = vkms_config_create_crtc(config);
> -
>   	plane_cfg = vkms_config_create_plane(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg2);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg);
> +
>   	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
>   	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg2);
>   	KUNIT_EXPECT_EQ(test, err, 0);
> @@ -577,7 +597,7 @@ static void vkms_config_test_invalid_connector_number(struct kunit *test)
>   
>   	/* Invalid: Too many connectors */
>   	for (n = 0; n <= 32; n++)
> -		connector_cfg = vkms_config_create_connector(config);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vkms_config_create_connector(config));
>   
>   	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
>   
> @@ -669,13 +689,19 @@ static void vkms_config_test_plane_attach_crtc(struct kunit *test)
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
>   
>   	overlay_cfg = vkms_config_create_plane(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, overlay_cfg);
>   	vkms_config_plane_set_type(overlay_cfg, DRM_PLANE_TYPE_OVERLAY);
> +
>   	primary_cfg = vkms_config_create_plane(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, primary_cfg);
>   	vkms_config_plane_set_type(primary_cfg, DRM_PLANE_TYPE_PRIMARY);
> +
>   	cursor_cfg = vkms_config_create_plane(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cursor_cfg);
>   	vkms_config_plane_set_type(cursor_cfg, DRM_PLANE_TYPE_CURSOR);
>   
>   	crtc_cfg = vkms_config_create_crtc(config);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg);
>   
>   	/* No primary or cursor planes */
>   	KUNIT_EXPECT_NULL(test, vkms_config_crtc_primary_plane(config, crtc_cfg));
> @@ -735,6 +761,11 @@ static void vkms_config_test_plane_get_possible_crtcs(struct kunit *test)
>   	crtc_cfg1 = vkms_config_create_crtc(config);
>   	crtc_cfg2 = vkms_config_create_crtc(config);
>   
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg1);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane_cfg2);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg1);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg2);
> +
>   	/* No possible CRTCs */
>   	vkms_config_plane_for_each_possible_crtc(plane_cfg1, idx, possible_crtc)
>   		KUNIT_FAIL(test, "Unexpected possible CRTC");
> @@ -799,6 +830,11 @@ static void vkms_config_test_encoder_get_possible_crtcs(struct kunit *test)
>   	crtc_cfg1 = vkms_config_create_crtc(config);
>   	crtc_cfg2 = vkms_config_create_crtc(config);
>   
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg1);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg2);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg1);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_cfg2);
> +
>   	/* No possible CRTCs */
>   	vkms_config_encoder_for_each_possible_crtc(encoder_cfg1, idx, possible_crtc)
>   		KUNIT_FAIL(test, "Unexpected possible CRTC");
> @@ -863,6 +899,11 @@ static void vkms_config_test_connector_get_possible_encoders(struct kunit *test)
>   	encoder_cfg1 = vkms_config_create_encoder(config);
>   	encoder_cfg2 = vkms_config_create_encoder(config);
>   
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, connector_cfg1);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, connector_cfg2);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg1);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, encoder_cfg2);
> +
>   	/* No possible encoders */
>   	vkms_config_connector_for_each_possible_encoder(connector_cfg1, idx,
>   							possible_encoder)

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

