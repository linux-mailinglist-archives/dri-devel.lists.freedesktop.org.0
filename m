Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DDCA3410F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 14:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9573110EAC2;
	Thu, 13 Feb 2025 13:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="aMs9kKOy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855DD10EAB6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 13:59:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D387C4418F;
 Thu, 13 Feb 2025 13:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1739455167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=raOvXPZQVNHt4cjWNSRP3pvTkcLINZB4oOLC/2LJjuI=;
 b=aMs9kKOyJW/2eMU81Fru+LsOX5Y5ay4w+H7kE3TDzBT0IV1rjeI3Ck/48dO/SgUAP+J8yd
 uROdBOCYQ2N1KIFCVftyUDizFjkfo0e9FXRAjrOJD6Gx37abQyjk0CSKS5QBpuhyrC36ps
 3BSc6ump2+4tsTPpIiElBN1wRVpO7m/ufttzgI1q1A0PC4ZfaJe++xNzp0I3CQexEFpKZd
 rT1dLRiJyDWb1gtZH3o7FQlXQpVw3frv1A3NwXkWcHcqOSjs5ZMSWykxji38JBgjaJDulI
 omrpEunQJFGkgj8b2i7ZhxPL0nOz9BIRH5VSi110rjLLYaZwxX3ANlXjOCf1WQ==
Date: Thu, 13 Feb 2025 14:59:24 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/15] drm/vkms: Allow to configure multiple CRTCs
Message-ID: <Z636vJUkFMkwE3oi@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250211110912.15409-1-jose.exposito89@gmail.com>
 <20250211110912.15409-11-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211110912.15409-11-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfejveetkedvleetudeuudegfeejheeujeefkefgtdeugfetfeeutdevieekvdeknecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrs
 hhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
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

On 11/02/25 - 12:09, José Expósito wrote:
> Add a list of CRTCs to vkms_config and helper functions to add and
> remove as many CRTCs as wanted.
> 
> For backwards compatibility, add one CRTC to the default configuration.
> 
> A future patch will allow to attach planes and CRTCs, but for the
> moment there are no changes in the way the output is configured.
> 
> Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Build broken as module:

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 0d0afc3047e0..63a3754b84a7 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -247,6 +247,7 @@ struct vkms_config_crtc *vkms_config_create_crtc(struct vkms_config *config)

        return crtc_cfg;
 }
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_crtc);

 void vkms_config_destroy_crtc(struct vkms_config *config,
                              struct vkms_config_crtc *crtc_cfg)
@@ -254,3 +255,4 @@ void vkms_config_destroy_crtc(struct vkms_config *config,
        list_del(&crtc_cfg->link);
        kfree(crtc_cfg);
 }
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy_crtc);


> ---
>  .clang-format                                 |  1 +
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c | 73 ++++++++++++++++-
>  drivers/gpu/drm/vkms/vkms_config.c            | 60 +++++++++++++-
>  drivers/gpu/drm/vkms/vkms_config.h            | 78 +++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_drv.c               |  3 +-
>  5 files changed, 209 insertions(+), 6 deletions(-)
> 
> diff --git a/.clang-format b/.clang-format
> index c585d2a5b395..e7a901c3617d 100644
> --- a/.clang-format
> +++ b/.clang-format
> @@ -690,6 +690,7 @@ ForEachMacros:
>    - 'v4l2_m2m_for_each_src_buf'
>    - 'v4l2_m2m_for_each_src_buf_safe'
>    - 'virtio_device_for_each_vq'
> +  - 'vkms_config_for_each_crtc'
>    - 'vkms_config_for_each_plane'
>    - 'while_for_each_ftrace_op'
>    - 'xa_for_each'
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index 38ec456d9610..59bd7baea923 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -25,6 +25,7 @@ static void vkms_config_test_empty_config(struct kunit *test)
>  	KUNIT_EXPECT_STREQ(test, vkms_config_get_device_name(config), "test");
>  
>  	KUNIT_EXPECT_TRUE(test, list_empty(&config->planes));
> +	KUNIT_EXPECT_TRUE(test, list_empty(&config->crtcs));
>  
>  	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
>  
> @@ -49,6 +50,7 @@ static void vkms_config_test_default_config(struct kunit *test)
>  	const struct default_config_case *params = test->param_value;
>  	struct vkms_config *config;
>  	struct vkms_config_plane *plane_cfg;
> +	struct vkms_config_crtc *crtc_cfg;
>  	int n_primaries = 0;
>  	int n_cursors = 0;
>  	int n_overlays = 0;
> @@ -58,8 +60,6 @@ static void vkms_config_test_default_config(struct kunit *test)
>  					    params->enable_overlay);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
>  
> -	KUNIT_EXPECT_EQ(test, config->writeback, params->enable_writeback);
> -
>  	/* Planes */
>  	list_for_each_entry(plane_cfg, &config->planes, link) {
>  		switch (vkms_config_plane_get_type(plane_cfg)) {
> @@ -80,6 +80,13 @@ static void vkms_config_test_default_config(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, n_cursors, params->enable_cursor ? 1 : 0);
>  	KUNIT_EXPECT_EQ(test, n_overlays, params->enable_overlay ? 8 : 0);
>  
> +	/* CRTCs */
> +	crtc_cfg = list_first_entry(&config->crtcs, typeof(*crtc_cfg), link);
> +
> +	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->crtcs), 1);

Can you switch the two lines? First test we only have one crtc, then get 
it.

> +	KUNIT_EXPECT_EQ(test, vkms_config_crtc_get_writeback(crtc_cfg),
> +			params->enable_writeback);
> +
>  	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
>  
>  	vkms_config_destroy(config);
> @@ -128,6 +135,43 @@ static void vkms_config_test_get_planes(struct kunit *test)
>  	vkms_config_destroy(config);
>  }
>  
> +static void vkms_config_test_get_crtcs(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	struct vkms_config_crtc *crtc_cfg;
> +	struct vkms_config_crtc *crtc_cfg1, *crtc_cfg2;
> +
> +	config = vkms_config_create("test");
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 0);
> +	vkms_config_for_each_crtc(config, crtc_cfg)
> +		KUNIT_FAIL(test, "Unexpected CRTC");
> +
> +	crtc_cfg1 = vkms_config_create_crtc(config);
> +	KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 1);
> +	vkms_config_for_each_crtc(config, crtc_cfg) {
> +		if (crtc_cfg != crtc_cfg1)
> +			KUNIT_FAIL(test, "Unexpected CRTC");
> +	}
> +
> +	crtc_cfg2 = vkms_config_create_crtc(config);
> +	KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 2);
> +	vkms_config_for_each_crtc(config, crtc_cfg) {
> +		if (crtc_cfg != crtc_cfg1 && crtc_cfg != crtc_cfg2)
> +			KUNIT_FAIL(test, "Unexpected CRTC");
> +	}
> +
> +	vkms_config_destroy_crtc(config, crtc_cfg2);
> +	KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 1);
> +	vkms_config_for_each_crtc(config, crtc_cfg) {
> +		if (crtc_cfg != crtc_cfg1)
> +			KUNIT_FAIL(test, "Unexpected CRTC");
> +	}
> +
> +	vkms_config_destroy(config);
> +}
> +
>  static void vkms_config_test_invalid_plane_number(struct kunit *test)
>  {
>  	struct vkms_config *config;
> @@ -192,13 +236,38 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
>  	vkms_config_destroy(config);
>  }
>  
> +static void vkms_config_test_invalid_crtc_number(struct kunit *test)
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
> +		vkms_config_create_crtc(config);
> +
> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> +
> +	vkms_config_destroy(config);
> +}
> +
>  static struct kunit_case vkms_config_test_cases[] = {
>  	KUNIT_CASE(vkms_config_test_empty_config),
>  	KUNIT_CASE_PARAM(vkms_config_test_default_config,
>  			 default_config_gen_params),
>  	KUNIT_CASE(vkms_config_test_get_planes),
> +	KUNIT_CASE(vkms_config_test_get_crtcs),
>  	KUNIT_CASE(vkms_config_test_invalid_plane_number),
>  	KUNIT_CASE(vkms_config_test_valid_plane_type),
> +	KUNIT_CASE(vkms_config_test_invalid_crtc_number),
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 8feacfc155be..b08021e62c9f 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -22,6 +22,7 @@ struct vkms_config *vkms_config_create(const char *dev_name)
>  	}
>  
>  	INIT_LIST_HEAD(&config->planes);
> +	INIT_LIST_HEAD(&config->crtcs);
>  
>  	return config;
>  }
> @@ -32,19 +33,23 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  {
>  	struct vkms_config *config;
>  	struct vkms_config_plane *plane_cfg;
> +	struct vkms_config_crtc *crtc_cfg;
>  	int n;
>  
>  	config = vkms_config_create(DEFAULT_DEVICE_NAME);
>  	if (IS_ERR(config))
>  		return config;
>  
> -	config->writeback = enable_writeback;
> -
>  	plane_cfg = vkms_config_create_plane(config);
>  	if (IS_ERR(plane_cfg))
>  		goto err_alloc;
>  	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
>  
> +	crtc_cfg = vkms_config_create_crtc(config);
> +	if (IS_ERR(crtc_cfg))
> +		goto err_alloc;
> +	vkms_config_crtc_set_writeback(crtc_cfg, enable_writeback);
> +
>  	if (enable_overlay) {
>  		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
>  			plane_cfg = vkms_config_create_plane(config);
> @@ -72,10 +77,14 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  void vkms_config_destroy(struct vkms_config *config)
>  {
>  	struct vkms_config_plane *plane_cfg, *plane_tmp;
> +	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
>  
>  	list_for_each_entry_safe(plane_cfg, plane_tmp, &config->planes, link)
>  		vkms_config_destroy_plane(plane_cfg);
>  
> +	list_for_each_entry_safe(crtc_cfg, crtc_tmp, &config->crtcs, link)
> +		vkms_config_destroy_crtc(config, crtc_cfg);
> +
>  	kfree_const(config->dev_name);
>  	kfree(config);
>  }
> @@ -131,11 +140,28 @@ static bool valid_plane_type(struct vkms_config *config)
>  	return true;
>  }
>  
> +static bool valid_crtc_number(struct vkms_config *config)
> +{
> +	struct drm_device *dev = &config->dev->drm;
> +	size_t n_crtcs;
> +
> +	n_crtcs = list_count_nodes(&config->crtcs);
> +	if (n_crtcs <= 0 || n_crtcs >= 32) {
> +		drm_info(dev, "The number of CRTCs must be between 1 and 31\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  bool vkms_config_is_valid(struct vkms_config *config)
>  {
>  	if (!valid_plane_number(config))
>  		return false;
>  
> +	if (!valid_crtc_number(config))
> +		return false;
> +
>  	if (!valid_plane_type(config))
>  		return false;
>  
> @@ -149,10 +175,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
>  	const char *dev_name;
>  	struct vkms_config_plane *plane_cfg;
> +	struct vkms_config_crtc *crtc_cfg;
>  
>  	dev_name = vkms_config_get_device_name((struct vkms_config *)vkmsdev->config);
>  	seq_printf(m, "dev_name=%s\n", dev_name);
> -	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
>  
>  	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
>  		seq_puts(m, "plane:\n");
> @@ -160,6 +186,12 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  			   vkms_config_plane_get_type(plane_cfg));
>  	}
>  
> +	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
> +		seq_puts(m, "crtc:\n");
> +		seq_printf(m, "\twriteback=%d\n",
> +			   vkms_config_crtc_get_writeback(crtc_cfg));
> +	}
> +
>  	return 0;
>  }
>  
> @@ -193,3 +225,25 @@ void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg)
>  	list_del(&plane_cfg->link);
>  	kfree(plane_cfg);
>  }
> +
> +struct vkms_config_crtc *vkms_config_create_crtc(struct vkms_config *config)
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
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 1c7ffc27f2a8..0f5937b44948 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -14,12 +14,14 @@
>   * @dev_name: Name of the device
>   * @writeback: If true, a writeback buffer can be attached to the CRTC
>   * @planes: List of planes configured for the device
> + * @crtcs: List of CRTCs configured for the device
>   * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
>   */
>  struct vkms_config {
>  	const char *dev_name;
>  	bool writeback;
>  	struct list_head planes;
> +	struct list_head crtcs;
>  	struct vkms_device *dev;
>  };
>  
> @@ -43,6 +45,25 @@ struct vkms_config_plane {
>  	struct vkms_plane *plane;
>  };
>  
> +/**
> + * struct vkms_config_crtc
> + *
> + * @link: Link to the others CRTCs in vkms_config
> + * @writeback: If true, a writeback buffer can be attached to the CRTC
> + * @crtc: Internal usage. This pointer should never be considered as valid.
> + *        It can be used to store a temporary reference to a VKMS CRTC during
> + *        device creation. This pointer is not managed by the configuration and
> + *        must be managed by other means.
> + */
> +struct vkms_config_crtc {
> +	struct list_head link;
> +
> +	bool writeback;
> +
> +	/* Internal usage */
> +	struct vkms_output *crtc;
> +};
> +
>  /**
>   * vkms_config_for_each_plane - Iterate over the vkms_config planes
>   * @config: &struct vkms_config pointer
> @@ -51,6 +72,14 @@ struct vkms_config_plane {
>  #define vkms_config_for_each_plane(config, plane_cfg) \
>  	list_for_each_entry((plane_cfg), &(config)->planes, link)
>  
> +/**
> + * vkms_config_for_each_crtc - Iterate over the vkms_config CRTCs
> + * @config: &struct vkms_config pointer
> + * @crtc_cfg: &struct vkms_config_crtc pointer used as cursor
> + */
> +#define vkms_config_for_each_crtc(config, crtc_cfg) \
> +	list_for_each_entry((crtc_cfg), &(config)->crtcs, link)
> +
>  /**
>   * vkms_config_create() - Create a new VKMS configuration
>   * @dev_name: Name of the device
> @@ -94,6 +123,15 @@ vkms_config_get_device_name(struct vkms_config *config)
>  	return config->dev_name;
>  }
>  
> +/**
> + * vkms_config_get_num_crtcs() - Return the number of CRTCs in the configuration
> + * @config: Configuration to get the number of CRTCs from
> + */
> +static inline size_t vkms_config_get_num_crtcs(struct vkms_config *config)
> +{
> +	return list_count_nodes(&config->crtcs);
> +}
> +
>  /**
>   * vkms_config_is_valid() - Validate a configuration
>   * @config: Configuration to validate
> @@ -149,4 +187,44 @@ vkms_config_plane_set_type(struct vkms_config_plane *plane_cfg,
>  	plane_cfg->type = type;
>  }
>  
> +/**
> + * vkms_config_create_crtc() - Add a new CRTC configuration
> + * @config: Configuration to add the CRTC to
> + *
> + * Returns:
> + * The new CRTC configuration or an error. Call vkms_config_destroy_crtc() to
> + * free the returned CRTC configuration.
> + */
> +struct vkms_config_crtc *vkms_config_create_crtc(struct vkms_config *config);
> +
> +/**
> + * vkms_config_destroy_crtc() - Remove and free a CRTC configuration
> + * @config: Configuration to remove the CRTC from
> + * @crtc_cfg: CRTC configuration to destroy
> + */
> +void vkms_config_destroy_crtc(struct vkms_config *config,
> +			      struct vkms_config_crtc *crtc_cfg);
> +
> +/**
> + * vkms_config_crtc_get_writeback() - If a writeback connector will be created
> + * @crtc_cfg: CRTC with or without a writeback connector
> + */
> +static inline bool
> +vkms_config_crtc_get_writeback(struct vkms_config_crtc *crtc_cfg)
> +{
> +	return crtc_cfg->writeback;
> +}
> +
> +/**
> + * vkms_config_crtc_set_writeback() - If a writeback connector will be created
> + * @crtc_cfg: Target CRTC
> + * @writeback: Enable or disable the writeback connector
> + */
> +static inline void
> +vkms_config_crtc_set_writeback(struct vkms_config_crtc *crtc_cfg,
> +			       bool writeback)
> +{
> +	crtc_cfg->writeback = writeback;
> +}
> +
>  #endif /* _VKMS_CONFIG_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index ba977ef09b2b..a24d1655f7b8 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -181,7 +181,8 @@ static int vkms_create(struct vkms_config *config)
>  		goto out_devres;
>  	}
>  
> -	ret = drm_vblank_init(&vkms_device->drm, 1);
> +	ret = drm_vblank_init(&vkms_device->drm,
> +			      vkms_config_get_num_crtcs(config));

See my comment on v2, I think we should keep 1 at this point.

>  	if (ret) {
>  		DRM_ERROR("Failed to vblank\n");
>  		goto out_devres;
> -- 
> 2.48.1
> 
