Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2CDA308EE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 11:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0871A10E647;
	Tue, 11 Feb 2025 10:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iLEFdi52";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1814F10E647
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 10:43:27 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-439554db49dso3372495e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 02:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739270605; x=1739875405; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ud812bVnrQvOr/WIad3dtJdC2j4RUwkBpvrDh5Q9SnQ=;
 b=iLEFdi520L6f91kIWQxhA7KWT1QYz42/kfAkZ1lkLmhCQ6evKpXA2K54WUD1FsLeZg
 3zGFnlbCB8FJ2IwTGc5T5QDPcG2xdcmt1hZYL3/hZq424r0H3Z01LvpMFkNjH49Rrl+V
 sTpA3/1p5lPOplMsTjUiFiAJCf92JLYA1dzLfMIMaEggntnEnKSHJViUPlokhCGae95K
 Vv8gJmswKes6JGV2mjYg0SchM+cogBl7yqKznOM3nxxmmZorL+hLaziJp03QvQYl3nct
 rWWmLG6iHPDcVwUL+/hf8CRODXz+9hcvX/EUjJZjIaxw4KkL7M6dLNx7pFyvXguM8jXO
 vLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739270605; x=1739875405;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ud812bVnrQvOr/WIad3dtJdC2j4RUwkBpvrDh5Q9SnQ=;
 b=rkrq2Q9KVmvI8zUG5G0Bg30WDXeBjIvmeshV9uihaDXcKlsjtyo2UO5YRGJbWI66lm
 l4RDeMVl6+7YLNaoQN9E54R/OsCdbCmvPHGm2WMxGgsHdSgkbv0RbkAuKoOqaUob67up
 Qr2+VyjlVzWhodOdbo5bEi8NvQStYOZZmGt8k9zEp1wyiVzgv6/Vmd44jqc1fqAdOpjT
 rKEzNkHlFIpKaMjch/JWhprDRAumNgvcNE6mF6dT4jhfeSL5bs4R+qUk8zvygZ/0aLLy
 V7xHSS1Y7py5HbqgiaYRIECRUcHyLfbELCD+rOn21EGhYhyqSLf/jastbn/cEicguEnU
 GhAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUgSSk/z/qoRBjAQx5+xoWkClUbtVXV5POZDnqKdYMguJvCF7PEEX2ZQqcvtldpsa4Ze664FICuys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOOwKqK14sIX2s6GvcafV8b81+9I9WP4bs5kl2M9WXr7jnCdMJ
 uii+H5UOCnjDzxICdtwvovXxBLTmk0HaFlD2pT94ELCP18gjpYP1
X-Gm-Gg: ASbGncuiIpG5f9kG2rKyPStolzFc7EfqOpyzJ10+eiz6Ute733zwr74AgMtuK/7/Z/D
 f2+eebY849bfGoWuALwG5oRV9mT4XQ54Kfj2fEVFQBe9xeptMr6pC6dCdzUKww0jHBlwIWIiFvO
 +maAYlCYzRqSbaSNATvxaed8TQNV/7pUYPaOoCcpun37OnyDLrCGv6QRzgubYq5NpXqVS22rHB4
 uce3k8f3SMbxxAVB6DEQoKf0dRQU2R1Dq09rabBHVSEyNoqi7MMQFzygcPyEn/CNtnDyVqwUfiS
 vmlB01WrsXaw0A==
X-Google-Smtp-Source: AGHT+IHwfkKHX/Cnt52TZJGgeJIa02ga1mr8Uoobeh5uPI1IJl0KZtd7Z5OucENotiuaP1CxwqWr/A==
X-Received: by 2002:a5d:64c2:0:b0:38d:df2d:7ac8 with SMTP id
 ffacd0b85a97d-38ddf2d7d5dmr7171740f8f.25.1739270605284; 
 Tue, 11 Feb 2025 02:43:25 -0800 (PST)
Received: from fedora ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc09fc2d9sm13653081f8f.6.2025.02.11.02.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 02:43:24 -0800 (PST)
Date: Tue, 11 Feb 2025 11:43:23 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/13] drm/vkms: Allow to configure multiple planes
Message-ID: <Z6spy81Xa-Aoz-HZ@fedora>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-8-jose.exposito89@gmail.com>
 <Z5uDI0QiP2UWGzI8@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5uDI0QiP2UWGzI8@louis-chauvet-laptop>
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

On Thu, Jan 30, 2025 at 02:48:19PM +0100, Louis Chauvet wrote:
> On 29/01/25 - 12:00, José Expósito wrote:
> > Add a list of planes to vkms_config and create as many planes as
> > configured during output initialization.
> > 
> > For backwards compatibility, add one primary plane and, if configured,
> > one cursor plane and NUM_OVERLAY_PLANES planes to the default
> > configuration.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> 
> [...]
> 
> > +static void vkms_config_test_get_planes(struct kunit *test)
> > +{
> > +	struct vkms_config *config;
> > +	struct vkms_config_plane *plane_cfg1, *plane_cfg2;
> > +	struct vkms_config_plane **array;
> > +	size_t length;
> > +
> > +	config = vkms_config_create("test");
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> > +
> > +	array = vkms_config_get_planes(config, &length);
> > +	KUNIT_ASSERT_EQ(test, length, 0);
> > +	KUNIT_ASSERT_NULL(test, array);
> > +
> > +	plane_cfg1 = vkms_config_add_plane(config);
> > +	array = vkms_config_get_planes(config, &length);
> > +	KUNIT_ASSERT_EQ(test, length, 1);
> > +	KUNIT_ASSERT_PTR_EQ(test, array[0], plane_cfg1);
> > +	kfree(array);
> > +
> > +	plane_cfg2 = vkms_config_add_plane(config);
> > +	array = vkms_config_get_planes(config, &length);
> > +	KUNIT_ASSERT_EQ(test, length, 2);
> > +	KUNIT_ASSERT_PTR_EQ(test, array[0], plane_cfg1);
> > +	KUNIT_ASSERT_PTR_EQ(test, array[1], plane_cfg2);
> > +	kfree(array);
> > +
> > +	vkms_config_destroy_plane(plane_cfg1);
> > +	array = vkms_config_get_planes(config, &length);
> > +	KUNIT_ASSERT_EQ(test, length, 1);
> > +	KUNIT_ASSERT_PTR_EQ(test, array[0], plane_cfg2);
> > +	kfree(array);
> > +
> > +	vkms_config_destroy(config);
> > +}
> 
> In this test I have the feeling that vkms_config_get_planes always returns 
> a predictable order. It is maybe trivial here, but I would prefer to shows 
> that the order is not stable, for example:
> 
> 	bool plane_cfg1_found = false;
> 	bool plane_cfg2_found = false;
> 
> 	vkms_config_for_each_plane(config, plane_cfg) {
> 		if (plane_cfg == plane_cfg1)
> 			plane_cfg1_found = true;
> 		else if (plane_cfg == plane_cfg2)
> 			plane_cfg2_found = true;
> 		else
> 			KUNIT_FAILS("Unexpected plane");
> 	}
> 
> 	KUNIT_ASSERT(test, plane_cfg1_found);
> 	KUNIT_ASSERT(test, plane_cfg2_found);
> 
> [...]
> 
> > +static void vkms_config_test_valid_plane_number(struct kunit *test)
> > +{
> > +	struct vkms_config *config;
> > +	struct vkms_config_plane *plane_cfg;
> > +	int n;
> > +
> > +	config = vkms_config_default_create(false, false, false);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> > +
> > +	/* Invalid: No planes */
> > +	plane_cfg = list_first_entry(&config->planes, typeof(*plane_cfg), link);
> > +	vkms_config_destroy_plane(plane_cfg);
> > +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> > +
> > +	/* Invalid: Too many planes */
> > +	for (n = 0; n <= 32; n++)
> > +		vkms_config_add_plane(config);
> > +
> > +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> > +
> > +	vkms_config_destroy(config);
> > +}
> 
> For this function, the naming is a bit strange, it says 
> "valid_plane_number", but you test only invalid plane number.

The reason for this naming is that it tests the valid_plane_number()
function called by vkms_config_is_valid(). The applies for the other
valid_* tests.

However, I don't mind changing its name to so it reflects the test
rather than the tested function.

Changed in v2.

> 
> Can you rename it to vkms_config_test_invalid_plane_number?
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> 
> [...]
> 
> > +struct vkms_config_plane **vkms_config_get_planes(const struct vkms_config *config,
> > +						  size_t *out_length)
> > +{
> > +	struct vkms_config_plane **array;
> > +	struct vkms_config_plane *plane_cfg;
> > +	size_t length;
> > +	int n = 0;
> > +
> > +	length = list_count_nodes((struct list_head *)&config->planes);
> > +	if (length == 0) {
> > +		*out_length = length;
> > +		return NULL;
> > +	}
> > +
> > +	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
> > +	if (!array)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	list_for_each_entry(plane_cfg, &config->planes, link) {
> > +		array[n] = plane_cfg;
> > +		n++;
> > +	}
> > +
> > +	*out_length = length;
> > +	return array;
> > +}
> 
> To join the comment on the test, I am not a big fan of creating a new list 
> to return to the caller, for three reasons:
> - the caller needs to manage an other pointer;
> - the caller needs to understand that the content of the array is only 
>   valid if: the config is not freed, nobody else removed anything from the 
>   planes;
> - the caller may think this list always have the same order if he looks at 
>   the tests.
> 
> I would prefer a simple macro to do an iteration over the config->planes 
> list: (I did not test this macro, but you have this idea)
> 
> 	#define vkms_config_iter_plane(config, plane_cfg) \
> 		list_for_each_entry((plane_cfg), &(config).planes, link)
> 
> This way:
> - no new pointer to manage;
> - if one day we have concurency issue, we just have to protect config, not 
>   config+all the planes;
> - there is no expected order.
> 
> [...]
> 
> >  bool vkms_config_is_valid(struct vkms_config *config)
> >  {
> > +	if (!valid_plane_number(config))
> > +		return false;
> > +
> > +	if (!valid_plane_type(config))
> > +		return false;
> > +
> >  	return true;
> >  }
> 
> I really like the idea to split the validation function, way simpler!
> 
> [...]
> 
> > +void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg)
> > +{
> > +	list_del(&plane_cfg->link);
> > +	kfree(plane_cfg);
> > +}
> 
> I would prefer a "standard" function pair, i.e.: add/remove or 
> create/destroy, not add/destroy.
> 
> For me it should be create/destroy, you create the plane by using a 
> config, so it is clear it will be attached to it.
> 
> If you choose add/remove, you should explains in the documentation that 
> remove is also doing kfree.
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> 
> [...]
> 
> > @@ -11,61 +11,63 @@ int vkms_output_init(struct vkms_device *vkmsdev)
> >  	struct vkms_connector *connector;
> >  	struct drm_encoder *encoder;
> >  	struct vkms_output *output;
> > -	struct vkms_plane *primary, *overlay, *cursor = NULL;
> > -	int ret;
> > +	struct vkms_plane *primary = NULL, *cursor = NULL;
> > +	struct vkms_config_plane **plane_cfgs = NULL;
> > +	size_t n_planes;
> > +	int ret = 0;
> >  	int writeback;
> >  	unsigned int n;
> 
> I think it could be interesting to have a vkms_config_is_valid call here. 
> It will avoid raising DRM errors or create unexpected devices.
> 
> It will also garantee in a later patch that 
> vkms_config_crtc_get_primary_plane is a valid pointer.
> 
> > -	/*
> > -	 * Initialize used plane. One primary plane is required to perform the composition.
> > -	 *
> > -	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
> > -	 * composition.
> > -	 */
> > -	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
> > -	if (IS_ERR(primary))
> > -		return PTR_ERR(primary);
> > +	plane_cfgs = vkms_config_get_planes(vkmsdev->config, &n_planes);
> > +	if (IS_ERR(plane_cfgs))
> > +		return PTR_ERR(plane_cfgs);
> 
> If you agree on the iterator implementation, this code could be simplified 
> a lot.
> 
> > -	if (vkmsdev->config->cursor) {
> > -		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
> > -		if (IS_ERR(cursor))
> > -			return PTR_ERR(cursor);
> > +	for (n = 0; n < n_planes; n++) {
> > +		struct vkms_config_plane *plane_cfg;
> > +		enum drm_plane_type type;
> > +
> > +		plane_cfg = plane_cfgs[n];
> > +		type = vkms_config_plane_get_type(plane_cfg);
> > +
> > +		plane_cfg->plane = vkms_plane_init(vkmsdev, type);
> 
> Can we pass plane_cfg in vkms_plane_init? This way we don't have to 
> touch vkms_output_init when adding new vkms_config_plane members.

While it'll be required once we allow to configure more parameters, I don't
think we need it right now. To keep things as simple as possible, I'd prefer to
delay it until required.

Thanks,
Jose

> > +		if (IS_ERR(plane_cfg->plane)) {
> > +			DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
> > +			ret = PTR_ERR(plane_cfg->plane);
> > +			goto err_free;
> > +		}
> > +
> > +		if (type == DRM_PLANE_TYPE_PRIMARY)
> > +			primary = plane_cfg->plane;
> > +		else if (type == DRM_PLANE_TYPE_CURSOR)
> > +			cursor = plane_cfg->plane;
> >  	}
> 
> [...]
