Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484DCA34109
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 14:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871DC10EAB6;
	Thu, 13 Feb 2025 13:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fbNKJ/a0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8CF10EABB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 13:59:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B62C543208;
 Thu, 13 Feb 2025 13:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1739455167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+cJ9rfTc09MX/4ojFCsibpG+pRpDmKq5OjRj4QSixI=;
 b=fbNKJ/a0btdNoN/zLSU8HfwgNLtcIl5Yv/A9mXfrpBDo4Uww558uBZ++oKk/fdkD6rAgF7
 r3AdfB5wuUeq+9VkVbr2lKRjJgoH6Jr2elXxOg1kgyvjg1V3BS53OMY4FwyYkT8R7ZBBbB
 UyB1/QI9r5AraA22L5ioFNYg52Og43LiQN6yHvvgi1mlKa95BL5oQxzBFinWlFg9D8Z6w5
 z1WjZ1OqrIIT5sUQJ5rQzq1xJAAhrsAOe5JFRWlft5gS44sFCXgL92Y8FIGvJlSnypJthN
 vGKvdk4FgUfVaAcxebcXU+8YgSFX3qm2zy29nk+sdcIqFp7F+ZskEBQmXof7Mg==
Date: Thu, 13 Feb 2025 14:59:25 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/15] drm/vkms: Allow to configure multiple encoders
Message-ID: <Z636vfBnIGS9lRDm@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250211110912.15409-1-jose.exposito89@gmail.com>
 <20250211110912.15409-13-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211110912.15409-13-jose.exposito89@gmail.com>
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
> Add a list of encoders to vkms_config and helper functions to add and
> remove as many encoders as wanted.
> 
> For backwards compatibility, add one encoder to the default
> configuration.
> 
> A future patch will allow to attach encoders and CRTCs, but for the
> moment there are no changes in the way the output is configured.
> 
> Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

The module build is broken:

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index c31d3ee1a733..b9d564882cbd 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -423,6 +423,7 @@ struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *confi

        return encoder_cfg;
 }
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_encoder);

 void vkms_config_destroy_encoder(struct vkms_config *config,
                                 struct vkms_config_encoder *encoder_cfg)
@@ -430,3 +431,4 @@ void vkms_config_destroy_encoder(struct vkms_config *config,
        list_del(&encoder_cfg->link);
        kfree(encoder_cfg);
 }
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy_encoder);


> ---
>  .clang-format                                 |  1 +
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c | 73 +++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.c            | 51 +++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.h            | 44 +++++++++++
>  4 files changed, 169 insertions(+)
> 
> diff --git a/.clang-format b/.clang-format
> index 6f944fa39841..c355a2f58eed 100644
> --- a/.clang-format
> +++ b/.clang-format
> @@ -691,6 +691,7 @@ ForEachMacros:
>    - 'v4l2_m2m_for_each_src_buf_safe'
>    - 'virtio_device_for_each_vq'
>    - 'vkms_config_for_each_crtc'
> +  - 'vkms_config_for_each_encoder'
>    - 'vkms_config_for_each_plane'
>    - 'vkms_config_plane_for_each_possible_crtc'
>    - 'while_for_each_ftrace_op'
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index 505eebb07a52..0bb76a1e6c79 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -26,6 +26,7 @@ static void vkms_config_test_empty_config(struct kunit *test)
>  
>  	KUNIT_EXPECT_TRUE(test, list_empty(&config->planes));
>  	KUNIT_EXPECT_TRUE(test, list_empty(&config->crtcs));
> +	KUNIT_EXPECT_TRUE(test, list_empty(&config->encoders));
>  
>  	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
>  
> @@ -99,6 +100,9 @@ static void vkms_config_test_default_config(struct kunit *test)
>  		KUNIT_EXPECT_EQ(test, n_possible_crtcs, 1);
>  	}
>  
> +	/* Encoders */
> +	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->encoders), 1);
> +
>  	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
>  
>  	vkms_config_destroy(config);
> @@ -184,6 +188,50 @@ static void vkms_config_test_get_crtcs(struct kunit *test)
>  	vkms_config_destroy(config);
>  }
>  
> +static void vkms_config_test_get_encoders(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	struct vkms_config_encoder *encoder_cfg;
> +	struct vkms_config_encoder *encoder_cfg1, *encoder_cfg2;
> +	int n_encoders = 0;
> +
> +	config = vkms_config_create("test");
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	vkms_config_for_each_encoder(config, encoder_cfg)
> +		n_encoders++;
> +	KUNIT_ASSERT_EQ(test, n_encoders, 0);
> +
> +	encoder_cfg1 = vkms_config_create_encoder(config);
> +	vkms_config_for_each_encoder(config, encoder_cfg) {
> +		n_encoders++;
> +		if (encoder_cfg != encoder_cfg1)
> +			KUNIT_FAIL(test, "Unexpected encoder");
> +	}
> +	KUNIT_ASSERT_EQ(test, n_encoders, 1);
> +	n_encoders = 0;
> +
> +	encoder_cfg2 = vkms_config_create_encoder(config);
> +	vkms_config_for_each_encoder(config, encoder_cfg) {
> +		n_encoders++;
> +		if (encoder_cfg != encoder_cfg1 && encoder_cfg != encoder_cfg2)
> +			KUNIT_FAIL(test, "Unexpected encoder");
> +	}
> +	KUNIT_ASSERT_EQ(test, n_encoders, 2);
> +	n_encoders = 0;
> +
> +	vkms_config_destroy_encoder(config, encoder_cfg2);
> +	vkms_config_for_each_encoder(config, encoder_cfg) {
> +		n_encoders++;
> +		if (encoder_cfg != encoder_cfg1)
> +			KUNIT_FAIL(test, "Unexpected encoder");
> +	}
> +	KUNIT_ASSERT_EQ(test, n_encoders, 1);
> +	n_encoders = 0;
> +
> +	vkms_config_destroy(config);
> +}
> +
>  static void vkms_config_test_invalid_plane_number(struct kunit *test)
>  {
>  	struct vkms_config *config;
> @@ -319,6 +367,29 @@ static void vkms_config_test_invalid_crtc_number(struct kunit *test)
>  	vkms_config_destroy(config);
>  }
>  
> +static void vkms_config_test_invalid_encoder_number(struct kunit *test)
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
> +		vkms_config_create_encoder(config);
> +
> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> +
> +	vkms_config_destroy(config);
> +}
> +
>  static void vkms_config_test_plane_attach_crtc(struct kunit *test)
>  {
>  	struct vkms_config *config;
> @@ -450,10 +521,12 @@ static struct kunit_case vkms_config_test_cases[] = {
>  			 default_config_gen_params),
>  	KUNIT_CASE(vkms_config_test_get_planes),
>  	KUNIT_CASE(vkms_config_test_get_crtcs),
> +	KUNIT_CASE(vkms_config_test_get_encoders),
>  	KUNIT_CASE(vkms_config_test_invalid_plane_number),
>  	KUNIT_CASE(vkms_config_test_valid_plane_type),
>  	KUNIT_CASE(vkms_config_test_valid_plane_possible_crtcs),
>  	KUNIT_CASE(vkms_config_test_invalid_crtc_number),
> +	KUNIT_CASE(vkms_config_test_invalid_encoder_number),
>  	KUNIT_CASE(vkms_config_test_plane_attach_crtc),
>  	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
>  	{}
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index d96f9e5f9b72..0cf6105fe743 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -23,6 +23,7 @@ struct vkms_config *vkms_config_create(const char *dev_name)
>  
>  	INIT_LIST_HEAD(&config->planes);
>  	INIT_LIST_HEAD(&config->crtcs);
> +	INIT_LIST_HEAD(&config->encoders);
>  
>  	return config;
>  }
> @@ -34,6 +35,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  	struct vkms_config *config;
>  	struct vkms_config_plane *plane_cfg;
>  	struct vkms_config_crtc *crtc_cfg;
> +	struct vkms_config_encoder *encoder_cfg;
>  	int n;
>  
>  	config = vkms_config_create(DEFAULT_DEVICE_NAME);
> @@ -78,6 +80,10 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  			goto err_alloc;
>  	}
>  
> +	encoder_cfg = vkms_config_create_encoder(config);
> +	if (IS_ERR(encoder_cfg))
> +		goto err_alloc;
> +
>  	return config;
>  
>  err_alloc:
> @@ -89,6 +95,7 @@ void vkms_config_destroy(struct vkms_config *config)
>  {
>  	struct vkms_config_plane *plane_cfg, *plane_tmp;
>  	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
> +	struct vkms_config_encoder *encoder_cfg, *encoder_tmp;
>  
>  	list_for_each_entry_safe(plane_cfg, plane_tmp, &config->planes, link)
>  		vkms_config_destroy_plane(plane_cfg);
> @@ -96,6 +103,9 @@ void vkms_config_destroy(struct vkms_config *config)
>  	list_for_each_entry_safe(crtc_cfg, crtc_tmp, &config->crtcs, link)
>  		vkms_config_destroy_crtc(config, crtc_cfg);
>  
> +	list_for_each_entry_safe(encoder_cfg, encoder_tmp, &config->encoders, link)
> +		vkms_config_destroy_encoder(config, encoder_cfg);
> +
>  	kfree_const(config->dev_name);
>  	kfree(config);
>  }
> @@ -188,6 +198,20 @@ static bool valid_crtc_number(struct vkms_config *config)
>  	return true;
>  }
>  
> +static bool valid_encoder_number(struct vkms_config *config)
> +{
> +	struct drm_device *dev = &config->dev->drm;

Ditto, dev may not be set yet.

> +	size_t n_encoders;
> +
> +	n_encoders = list_count_nodes(&config->encoders);
> +	if (n_encoders <= 0 || n_encoders >= 32) {
> +		drm_info(dev, "The number of encoders must be between 1 and 31\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  bool vkms_config_is_valid(struct vkms_config *config)
>  {
>  	struct vkms_config_crtc *crtc_cfg;
> @@ -198,6 +222,9 @@ bool vkms_config_is_valid(struct vkms_config *config)
>  	if (!valid_crtc_number(config))
>  		return false;
>  
> +	if (!valid_encoder_number(config))
> +		return false;
> +
>  	if (!valid_plane_possible_crtcs(config))
>  		return false;
>  
> @@ -217,6 +244,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  	const char *dev_name;
>  	struct vkms_config_plane *plane_cfg;
>  	struct vkms_config_crtc *crtc_cfg;
> +	struct vkms_config_encoder *encoder_cfg;
>  
>  	dev_name = vkms_config_get_device_name((struct vkms_config *)vkmsdev->config);
>  	seq_printf(m, "dev_name=%s\n", dev_name);
> @@ -233,6 +261,9 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  			   vkms_config_crtc_get_writeback(crtc_cfg));
>  	}
>  
> +	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)
> +		seq_puts(m, "encoder\n");
> +
>  	return 0;
>  }
>  
> @@ -366,3 +397,23 @@ struct vkms_config_plane *vkms_config_crtc_cursor_plane(const struct vkms_config
>  {
>  	return vkms_config_crtc_get_plane(config, crtc_cfg, DRM_PLANE_TYPE_CURSOR);
>  }
> +
> +struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *config)
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
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 0fe0ded1d8e4..2ba80c4c9ce5 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -15,12 +15,14 @@
>   * @dev_name: Name of the device
>   * @planes: List of planes configured for the device
>   * @crtcs: List of CRTCs configured for the device
> + * @encoders: List of encoders configured for the device
>   * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
>   */
>  struct vkms_config {
>  	const char *dev_name;
>  	struct list_head planes;
>  	struct list_head crtcs;
> +	struct list_head encoders;
>  	struct vkms_device *dev;
>  };
>  
> @@ -65,6 +67,22 @@ struct vkms_config_crtc {
>  	struct vkms_output *crtc;
>  };
>  
> +/**
> + * struct vkms_config_encoder
> + *
> + * @link: Link to the others encoders in vkms_config
> + * @encoder: Internal usage. This pointer should never be considered as valid.
> + *           It can be used to store a temporary reference to a VKMS encoder
> + *           during device creation. This pointer is not managed by the
> + *           configuration and must be managed by other means.
> + */
> +struct vkms_config_encoder {
> +	struct list_head link;
> +
> +	/* Internal usage */
> +	struct drm_encoder *encoder;
> +};
> +
>  /**
>   * vkms_config_for_each_plane - Iterate over the vkms_config planes
>   * @config: &struct vkms_config pointer
> @@ -81,6 +99,14 @@ struct vkms_config_crtc {
>  #define vkms_config_for_each_crtc(config, crtc_cfg) \
>  	list_for_each_entry((crtc_cfg), &(config)->crtcs, link)
>  
> +/**
> + * vkms_config_for_each_encoder - Iterate over the vkms_config encoders
> + * @config: &struct vkms_config pointer
> + * @encoder_cfg: &struct vkms_config_encoder pointer used as cursor
> + */
> +#define vkms_config_for_each_encoder(config, encoder_cfg) \
> +	list_for_each_entry((encoder_cfg), &(config)->encoders, link)
> +
>  /**
>   * vkms_config_plane_for_each_possible_crtc - Iterate over the vkms_config_plane
>   * possible CRTCs
> @@ -282,4 +308,22 @@ struct vkms_config_plane *vkms_config_crtc_primary_plane(const struct vkms_confi
>  struct vkms_config_plane *vkms_config_crtc_cursor_plane(const struct vkms_config *config,
>  							struct vkms_config_crtc *crtc_cfg);
>  
> +/**
> + * vkms_config_create_encoder() - Add a new encoder configuration
> + * @config: Configuration to add the encoder to
> + *
> + * Returns:
> + * The new encoder configuration or an error. Call vkms_config_destroy_encoder()
> + * to free the returned encoder configuration.
> + */
> +struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *config);
> +
> +/**
> + * vkms_config_destroy_encoder() - Remove and free a encoder configuration
> + * @config: Configuration to remove the encoder from
> + * @encoder_cfg: Encoder configuration to destroy
> + */
> +void vkms_config_destroy_encoder(struct vkms_config *config,
> +				 struct vkms_config_encoder *encoder_cfg);
> +
>  #endif /* _VKMS_CONFIG_H_ */
> -- 
> 2.48.1
> 
