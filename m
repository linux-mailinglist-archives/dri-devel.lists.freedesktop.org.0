Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C6BA32814
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 15:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E521410E8B3;
	Wed, 12 Feb 2025 14:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="a5vAHc5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E4210E8B1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 14:10:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57D0A433E8;
 Wed, 12 Feb 2025 14:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1739369420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DUw0XWN1GMPB5g/z9XibVq5IQF5Xco6sVutovHTbMUM=;
 b=a5vAHc5TR/WLydS8wJmzveL/SLVR0zlH+uGlL2LjzSuPAbWlsEKuJRiT53UW+azu5uWsAp
 P+Mjm0q0d0yhco5MFBRO5vGYhd0jT9BWa8FhoSUF0hKvf7DQWFT4/NP389Bfpm/Bl3mWaZ
 Wvicb3LnSWs1F5Baq2/9kibSSgGjVt2BxjqXv6MkoIu4YSiySd2O9yVSdWbU/gZtpZ6BBn
 Q7YPRzo6QHboWP5tEvNhfokIHzMUO8Mz/Q6WP9dBYK+ueVBBMTR0lR6z1kl2TmtWVB7ft5
 zONA6avCMeOBkhFMIq9sQq/IzskSt0CWs4M0Rj3N6mcF2iLHpKOWEOhA4fm/Ug==
Message-ID: <9685aaeb-a131-4cea-bdba-fbd2d4a396d8@bootlin.com>
Date: Wed, 12 Feb 2025 15:10:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] drm/vkms: Allow to configure multiple planes
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-8-jose.exposito89@gmail.com>
 <Z5uDI0QiP2UWGzI8@louis-chauvet-laptop> <Z6spy81Xa-Aoz-HZ@fedora>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <Z6spy81Xa-Aoz-HZ@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggedtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeivedtfeegtdekheethedttddtfefhhfegjeeljeejleduvdfhudegvdekheevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehmr
 ggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
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



Le 11/02/2025 à 11:43, José Expósito a écrit :
> On Thu, Jan 30, 2025 at 02:48:19PM +0100, Louis Chauvet wrote:
>> On 29/01/25 - 12:00, José Expósito wrote:
>>> Add a list of planes to vkms_config and create as many planes as
>>> configured during output initialization.
>>>
>>> For backwards compatibility, add one primary plane and, if configured,
>>> one cursor plane and NUM_OVERLAY_PLANES planes to the default
>>> configuration.
>>>
>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
>>
>> Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
>>
>> [...]
>>
>>> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
>>
>> [...]
>>
>>> +static void vkms_config_test_get_planes(struct kunit *test)
>>> +{
>>> +	struct vkms_config *config;
>>> +	struct vkms_config_plane *plane_cfg1, *plane_cfg2;
>>> +	struct vkms_config_plane **array;
>>> +	size_t length;
>>> +
>>> +	config = vkms_config_create("test");
>>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
>>> +
>>> +	array = vkms_config_get_planes(config, &length);
>>> +	KUNIT_ASSERT_EQ(test, length, 0);
>>> +	KUNIT_ASSERT_NULL(test, array);
>>> +
>>> +	plane_cfg1 = vkms_config_add_plane(config);
>>> +	array = vkms_config_get_planes(config, &length);
>>> +	KUNIT_ASSERT_EQ(test, length, 1);
>>> +	KUNIT_ASSERT_PTR_EQ(test, array[0], plane_cfg1);
>>> +	kfree(array);
>>> +
>>> +	plane_cfg2 = vkms_config_add_plane(config);
>>> +	array = vkms_config_get_planes(config, &length);
>>> +	KUNIT_ASSERT_EQ(test, length, 2);
>>> +	KUNIT_ASSERT_PTR_EQ(test, array[0], plane_cfg1);
>>> +	KUNIT_ASSERT_PTR_EQ(test, array[1], plane_cfg2);
>>> +	kfree(array);
>>> +
>>> +	vkms_config_destroy_plane(plane_cfg1);
>>> +	array = vkms_config_get_planes(config, &length);
>>> +	KUNIT_ASSERT_EQ(test, length, 1);
>>> +	KUNIT_ASSERT_PTR_EQ(test, array[0], plane_cfg2);
>>> +	kfree(array);
>>> +
>>> +	vkms_config_destroy(config);
>>> +}
>>
>> In this test I have the feeling that vkms_config_get_planes always returns
>> a predictable order. It is maybe trivial here, but I would prefer to shows
>> that the order is not stable, for example:
>>
>> 	bool plane_cfg1_found = false;
>> 	bool plane_cfg2_found = false;
>>
>> 	vkms_config_for_each_plane(config, plane_cfg) {
>> 		if (plane_cfg == plane_cfg1)
>> 			plane_cfg1_found = true;
>> 		else if (plane_cfg == plane_cfg2)
>> 			plane_cfg2_found = true;
>> 		else
>> 			KUNIT_FAILS("Unexpected plane");
>> 	}
>>
>> 	KUNIT_ASSERT(test, plane_cfg1_found);
>> 	KUNIT_ASSERT(test, plane_cfg2_found);
>>
>> [...]
>>
>>> +static void vkms_config_test_valid_plane_number(struct kunit *test)
>>> +{
>>> +	struct vkms_config *config;
>>> +	struct vkms_config_plane *plane_cfg;
>>> +	int n;
>>> +
>>> +	config = vkms_config_default_create(false, false, false);
>>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
>>> +
>>> +	/* Invalid: No planes */
>>> +	plane_cfg = list_first_entry(&config->planes, typeof(*plane_cfg), link);
>>> +	vkms_config_destroy_plane(plane_cfg);
>>> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
>>> +
>>> +	/* Invalid: Too many planes */
>>> +	for (n = 0; n <= 32; n++)
>>> +		vkms_config_add_plane(config);
>>> +
>>> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
>>> +
>>> +	vkms_config_destroy(config);
>>> +}
>>
>> For this function, the naming is a bit strange, it says
>> "valid_plane_number", but you test only invalid plane number.
> 
> The reason for this naming is that it tests the valid_plane_number()
> function called by vkms_config_is_valid(). The applies for the other
> valid_* tests.

Hoo, I see, okk!

> However, I don't mind changing its name to so it reflects the test
> rather than the tested function.

I prefer an "implementation independent" name, as the content of 
vkms_config_is_valid may change over time.

> Changed in v2.

Perfect!

>>
>> Can you rename it to vkms_config_test_invalid_plane_number?
>>
>> [...]
>>
>>> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
>>
>> [...]
>>
>>> +struct vkms_config_plane **vkms_config_get_planes(const struct vkms_config *config,
>>> +						  size_t *out_length)
>>> +{
>>> +	struct vkms_config_plane **array;
>>> +	struct vkms_config_plane *plane_cfg;
>>> +	size_t length;
>>> +	int n = 0;
>>> +
>>> +	length = list_count_nodes((struct list_head *)&config->planes);
>>> +	if (length == 0) {
>>> +		*out_length = length;
>>> +		return NULL;
>>> +	}
>>> +
>>> +	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
>>> +	if (!array)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	list_for_each_entry(plane_cfg, &config->planes, link) {
>>> +		array[n] = plane_cfg;
>>> +		n++;
>>> +	}
>>> +
>>> +	*out_length = length;
>>> +	return array;
>>> +}
>>
>> To join the comment on the test, I am not a big fan of creating a new list
>> to return to the caller, for three reasons:
>> - the caller needs to manage an other pointer;
>> - the caller needs to understand that the content of the array is only
>>    valid if: the config is not freed, nobody else removed anything from the
>>    planes;
>> - the caller may think this list always have the same order if he looks at
>>    the tests.
>>
>> I would prefer a simple macro to do an iteration over the config->planes
>> list: (I did not test this macro, but you have this idea)
>>
>> 	#define vkms_config_iter_plane(config, plane_cfg) \
>> 		list_for_each_entry((plane_cfg), &(config).planes, link)
>>
>> This way:
>> - no new pointer to manage;
>> - if one day we have concurency issue, we just have to protect config, not
>>    config+all the planes;
>> - there is no expected order.
>>
>> [...]
>>
>>>   bool vkms_config_is_valid(struct vkms_config *config)
>>>   {
>>> +	if (!valid_plane_number(config))
>>> +		return false;
>>> +
>>> +	if (!valid_plane_type(config))
>>> +		return false;
>>> +
>>>   	return true;
>>>   }
>>
>> I really like the idea to split the validation function, way simpler!
>>
>> [...]
>>
>>> +void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg)
>>> +{
>>> +	list_del(&plane_cfg->link);
>>> +	kfree(plane_cfg);
>>> +}
>>
>> I would prefer a "standard" function pair, i.e.: add/remove or
>> create/destroy, not add/destroy.
>>
>> For me it should be create/destroy, you create the plane by using a
>> config, so it is clear it will be attached to it.
>>
>> If you choose add/remove, you should explains in the documentation that
>> remove is also doing kfree.
>>
>> [...]
>>
>>> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
>>
>> [...]
>>
>>> @@ -11,61 +11,63 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>>>   	struct vkms_connector *connector;
>>>   	struct drm_encoder *encoder;
>>>   	struct vkms_output *output;
>>> -	struct vkms_plane *primary, *overlay, *cursor = NULL;
>>> -	int ret;
>>> +	struct vkms_plane *primary = NULL, *cursor = NULL;
>>> +	struct vkms_config_plane **plane_cfgs = NULL;
>>> +	size_t n_planes;
>>> +	int ret = 0;
>>>   	int writeback;
>>>   	unsigned int n;
>>
>> I think it could be interesting to have a vkms_config_is_valid call here.
>> It will avoid raising DRM errors or create unexpected devices.
>>
>> It will also garantee in a later patch that
>> vkms_config_crtc_get_primary_plane is a valid pointer.
>>
>>> -	/*
>>> -	 * Initialize used plane. One primary plane is required to perform the composition.
>>> -	 *
>>> -	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
>>> -	 * composition.
>>> -	 */
>>> -	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
>>> -	if (IS_ERR(primary))
>>> -		return PTR_ERR(primary);
>>> +	plane_cfgs = vkms_config_get_planes(vkmsdev->config, &n_planes);
>>> +	if (IS_ERR(plane_cfgs))
>>> +		return PTR_ERR(plane_cfgs);
>>
>> If you agree on the iterator implementation, this code could be simplified
>> a lot.
>>
>>> -	if (vkmsdev->config->cursor) {
>>> -		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
>>> -		if (IS_ERR(cursor))
>>> -			return PTR_ERR(cursor);
>>> +	for (n = 0; n < n_planes; n++) {
>>> +		struct vkms_config_plane *plane_cfg;
>>> +		enum drm_plane_type type;
>>> +
>>> +		plane_cfg = plane_cfgs[n];
>>> +		type = vkms_config_plane_get_type(plane_cfg);
>>> +
>>> +		plane_cfg->plane = vkms_plane_init(vkmsdev, type);
>>
>> Can we pass plane_cfg in vkms_plane_init? This way we don't have to
>> touch vkms_output_init when adding new vkms_config_plane members.
> 
> While it'll be required once we allow to configure more parameters, I don't
> think we need it right now. To keep things as simple as possible, I'd prefer to
> delay it until required.

I understand your point, especially since your patch don't add new 
parameters to vkms_plane_init.

Thanks!

> Thanks,
> Jose
> 
>>> +		if (IS_ERR(plane_cfg->plane)) {
>>> +			DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
>>> +			ret = PTR_ERR(plane_cfg->plane);
>>> +			goto err_free;
>>> +		}
>>> +
>>> +		if (type == DRM_PLANE_TYPE_PRIMARY)
>>> +			primary = plane_cfg->plane;
>>> +		else if (type == DRM_PLANE_TYPE_CURSOR)
>>> +			cursor = plane_cfg->plane;
>>>   	}
>>
>> [...]

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

