Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30FDA22E23
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3BC10E983;
	Thu, 30 Jan 2025 13:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="X5vC5MBr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B2910E981
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 13:48:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67980442F8;
 Thu, 30 Jan 2025 13:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738244901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PUaEcvOqojO5KkZeiqdnobiTzfbr0lXwcEOXB0Nb2a0=;
 b=X5vC5MBr60Wm7RxL1IJ66VdaK5BV8KbRRI23QmJQipyiZLhyQ8j765zjKaLLlPXY1EYvDP
 yJj08dKuzxZC1O4uXP8OvLBeQ9WuRH2edJXIr6T4pYeQ52KwoiwU8HRkX5gWi5bWDDky2L
 eiKzU4dHnzhqX9hx5bYTwhOK6mRttbMr2P4R5YnhP9P4DwgXfnYutgDUvIxSa+EKB/L8+M
 qYSlGWbTq5oYJUN8hsevZe30JJHi967Vs644G7gg5O7w7Wu5qS5KWnf9Immmg5cFRZ1YPr
 plYwLrmGnbLwxkP6magg/fZKyhSsJlJjXY/DQ7sVIvyF76NggKiVnMV8Jktf3w==
Date: Thu, 30 Jan 2025 14:48:19 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/13] drm/vkms: Allow to configure multiple planes
Message-ID: <Z5uDI0QiP2UWGzI8@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-8-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129110059.12199-8-jose.exposito89@gmail.com>
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
> Add a list of planes to vkms_config and create as many planes as
> configured during output initialization.
> 
> For backwards compatibility, add one primary plane and, if configured,
> one cursor plane and NUM_OVERLAY_PLANES planes to the default
> configuration.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>

[...]

> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c

[...]

> +static void vkms_config_test_get_planes(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	struct vkms_config_plane *plane_cfg1, *plane_cfg2;
> +	struct vkms_config_plane **array;
> +	size_t length;
> +
> +	config = vkms_config_create("test");
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	array = vkms_config_get_planes(config, &length);
> +	KUNIT_ASSERT_EQ(test, length, 0);
> +	KUNIT_ASSERT_NULL(test, array);
> +
> +	plane_cfg1 = vkms_config_add_plane(config);
> +	array = vkms_config_get_planes(config, &length);
> +	KUNIT_ASSERT_EQ(test, length, 1);
> +	KUNIT_ASSERT_PTR_EQ(test, array[0], plane_cfg1);
> +	kfree(array);
> +
> +	plane_cfg2 = vkms_config_add_plane(config);
> +	array = vkms_config_get_planes(config, &length);
> +	KUNIT_ASSERT_EQ(test, length, 2);
> +	KUNIT_ASSERT_PTR_EQ(test, array[0], plane_cfg1);
> +	KUNIT_ASSERT_PTR_EQ(test, array[1], plane_cfg2);
> +	kfree(array);
> +
> +	vkms_config_destroy_plane(plane_cfg1);
> +	array = vkms_config_get_planes(config, &length);
> +	KUNIT_ASSERT_EQ(test, length, 1);
> +	KUNIT_ASSERT_PTR_EQ(test, array[0], plane_cfg2);
> +	kfree(array);
> +
> +	vkms_config_destroy(config);
> +}

In this test I have the feeling that vkms_config_get_planes always returns 
a predictable order. It is maybe trivial here, but I would prefer to shows 
that the order is not stable, for example:

	bool plane_cfg1_found = false;
	bool plane_cfg2_found = false;

	vkms_config_for_each_plane(config, plane_cfg) {
		if (plane_cfg == plane_cfg1)
			plane_cfg1_found = true;
		else if (plane_cfg == plane_cfg2)
			plane_cfg2_found = true;
		else
			KUNIT_FAILS("Unexpected plane");
	}

	KUNIT_ASSERT(test, plane_cfg1_found);
	KUNIT_ASSERT(test, plane_cfg2_found);

[...]

> +static void vkms_config_test_valid_plane_number(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	struct vkms_config_plane *plane_cfg;
> +	int n;
> +
> +	config = vkms_config_default_create(false, false, false);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	/* Invalid: No planes */
> +	plane_cfg = list_first_entry(&config->planes, typeof(*plane_cfg), link);
> +	vkms_config_destroy_plane(plane_cfg);
> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> +
> +	/* Invalid: Too many planes */
> +	for (n = 0; n <= 32; n++)
> +		vkms_config_add_plane(config);
> +
> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> +
> +	vkms_config_destroy(config);
> +}

For this function, the naming is a bit strange, it says 
"valid_plane_number", but you test only invalid plane number.

Can you rename it to vkms_config_test_invalid_plane_number?

[...]

> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c

[...]

> +struct vkms_config_plane **vkms_config_get_planes(const struct vkms_config *config,
> +						  size_t *out_length)
> +{
> +	struct vkms_config_plane **array;
> +	struct vkms_config_plane *plane_cfg;
> +	size_t length;
> +	int n = 0;
> +
> +	length = list_count_nodes((struct list_head *)&config->planes);
> +	if (length == 0) {
> +		*out_length = length;
> +		return NULL;
> +	}
> +
> +	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
> +	if (!array)
> +		return ERR_PTR(-ENOMEM);
> +
> +	list_for_each_entry(plane_cfg, &config->planes, link) {
> +		array[n] = plane_cfg;
> +		n++;
> +	}
> +
> +	*out_length = length;
> +	return array;
> +}

To join the comment on the test, I am not a big fan of creating a new list 
to return to the caller, for three reasons:
- the caller needs to manage an other pointer;
- the caller needs to understand that the content of the array is only 
  valid if: the config is not freed, nobody else removed anything from the 
  planes;
- the caller may think this list always have the same order if he looks at 
  the tests.

I would prefer a simple macro to do an iteration over the config->planes 
list: (I did not test this macro, but you have this idea)

	#define vkms_config_iter_plane(config, plane_cfg) \
		list_for_each_entry((plane_cfg), &(config).planes, link)

This way:
- no new pointer to manage;
- if one day we have concurency issue, we just have to protect config, not 
  config+all the planes;
- there is no expected order.

[...]

>  bool vkms_config_is_valid(struct vkms_config *config)
>  {
> +	if (!valid_plane_number(config))
> +		return false;
> +
> +	if (!valid_plane_type(config))
> +		return false;
> +
>  	return true;
>  }

I really like the idea to split the validation function, way simpler!

[...]

> +void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg)
> +{
> +	list_del(&plane_cfg->link);
> +	kfree(plane_cfg);
> +}

I would prefer a "standard" function pair, i.e.: add/remove or 
create/destroy, not add/destroy.

For me it should be create/destroy, you create the plane by using a 
config, so it is clear it will be attached to it.

If you choose add/remove, you should explains in the documentation that 
remove is also doing kfree.

[...]

> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c

[...]

> @@ -11,61 +11,63 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  	struct vkms_connector *connector;
>  	struct drm_encoder *encoder;
>  	struct vkms_output *output;
> -	struct vkms_plane *primary, *overlay, *cursor = NULL;
> -	int ret;
> +	struct vkms_plane *primary = NULL, *cursor = NULL;
> +	struct vkms_config_plane **plane_cfgs = NULL;
> +	size_t n_planes;
> +	int ret = 0;
>  	int writeback;
>  	unsigned int n;

I think it could be interesting to have a vkms_config_is_valid call here. 
It will avoid raising DRM errors or create unexpected devices.

It will also garantee in a later patch that 
vkms_config_crtc_get_primary_plane is a valid pointer.

> -	/*
> -	 * Initialize used plane. One primary plane is required to perform the composition.
> -	 *
> -	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
> -	 * composition.
> -	 */
> -	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
> -	if (IS_ERR(primary))
> -		return PTR_ERR(primary);
> +	plane_cfgs = vkms_config_get_planes(vkmsdev->config, &n_planes);
> +	if (IS_ERR(plane_cfgs))
> +		return PTR_ERR(plane_cfgs);

If you agree on the iterator implementation, this code could be simplified 
a lot.

> -	if (vkmsdev->config->cursor) {
> -		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
> -		if (IS_ERR(cursor))
> -			return PTR_ERR(cursor);
> +	for (n = 0; n < n_planes; n++) {
> +		struct vkms_config_plane *plane_cfg;
> +		enum drm_plane_type type;
> +
> +		plane_cfg = plane_cfgs[n];
> +		type = vkms_config_plane_get_type(plane_cfg);
> +
> +		plane_cfg->plane = vkms_plane_init(vkmsdev, type);

Can we pass plane_cfg in vkms_plane_init? This way we don't have to 
touch vkms_output_init when adding new vkms_config_plane members.

> +		if (IS_ERR(plane_cfg->plane)) {
> +			DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
> +			ret = PTR_ERR(plane_cfg->plane);
> +			goto err_free;
> +		}
> +
> +		if (type == DRM_PLANE_TYPE_PRIMARY)
> +			primary = plane_cfg->plane;
> +		else if (type == DRM_PLANE_TYPE_CURSOR)
> +			cursor = plane_cfg->plane;
>  	}

[...]
