Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 919FBA387F7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 16:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545F210E509;
	Mon, 17 Feb 2025 15:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IYvR867f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6993010E4FF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 15:46:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A47A64433C;
 Mon, 17 Feb 2025 15:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1739807165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Tj16kwZxtEWw9EZU5vlglxOTNRN2gj1StzIZ3/fzQrU=;
 b=IYvR867fTix3qrrG9UfLhOlO354NfwrsUzIpWy/nuL/pq1Ozu92tr76HYKt95qHphpy3W+
 zYlqOnBCSEhRlyVd8781qWKx18KIX4TfyshlJ8J4Wum+VHs+Y1AhmF/sbGyDyZ6CuS9v2Y
 8uBUyQMGHM0C0ZAx2TS+hm662VZH/HyG3asqOc0rCyR3MrdVZleQkZdYjk+uXCfUsXYPff
 +C/zf1j7+Zha/98viSDPYba4I5geSXE7yYL2YeQfhEcwLBMEtqu6IbAg6qOlWzJON5Xflt
 gaLtp+tXQWqreCnckGHUV6M3Tmooi57cz0K3itwpwj0AgYyG50D0N56Fdimrbg==
Message-ID: <6e1496ac-892d-4267-a670-75e6eb50e936@bootlin.com>
Date: Mon, 17 Feb 2025 16:45:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/14] drm/vkms: Allow to configure multiple connectors
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250217100120.7620-1-jose.exposito89@gmail.com>
 <20250217100120.7620-14-jose.exposito89@gmail.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250217100120.7620-14-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkeejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeeivedtfeegtdekheethedttddtfefhhfegjeeljeejleduvdfhudegvdekheevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehmr
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



Le 17/02/2025 à 11:01, José Expósito a écrit :
> Add a list of connectors to vkms_config and helper functions to add and
> remove as many connectors as wanted.
> 
> For backwards compatibility, add one enabled connector to the default
> configuration.
> 
> A future patch will allow to attach connectors and encoders, but for the
> moment there are no changes in the way the output is configured.
> 
> Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>   .clang-format                                 |  1 +
>   drivers/gpu/drm/vkms/tests/vkms_config_test.c | 74 +++++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_config.c            | 54 ++++++++++++++
>   drivers/gpu/drm/vkms/vkms_config.h            | 44 +++++++++++
>   drivers/gpu/drm/vkms/vkms_connector.c         | 11 +++
>   5 files changed, 184 insertions(+)
> 
> diff --git a/.clang-format b/.clang-format
> index 5d21c0e4edbd..ca49832993c5 100644
> --- a/.clang-format
> +++ b/.clang-format
> @@ -690,6 +690,7 @@ ForEachMacros:
>     - 'v4l2_m2m_for_each_src_buf'
>     - 'v4l2_m2m_for_each_src_buf_safe'
>     - 'virtio_device_for_each_vq'
> +  - 'vkms_config_for_each_connector'
>     - 'vkms_config_for_each_crtc'
>     - 'vkms_config_for_each_encoder'
>     - 'vkms_config_for_each_plane'
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index 62fbcba4520f..0034f922713e 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -27,6 +27,7 @@ static void vkms_config_test_empty_config(struct kunit *test)
>   	KUNIT_EXPECT_TRUE(test, list_empty(&config->planes));
>   	KUNIT_EXPECT_TRUE(test, list_empty(&config->crtcs));
>   	KUNIT_EXPECT_TRUE(test, list_empty(&config->encoders));
> +	KUNIT_EXPECT_TRUE(test, list_empty(&config->connectors));

Ditto
With this modification:
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

>   
>   	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
>   
> @@ -103,6 +104,9 @@ static void vkms_config_test_default_config(struct kunit *test)
>   	/* Encoders */
>   	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->encoders), 1);
>   
> +	/* Connectors */
> +	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->connectors), 1);
> +
>   	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
>   
>   	vkms_config_destroy(config);
> @@ -232,6 +236,51 @@ static void vkms_config_test_get_encoders(struct kunit *test)
>   	vkms_config_destroy(config);
>   }
>   
> +static void vkms_config_test_get_connectors(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	struct vkms_config_connector *connector_cfg;
> +	struct vkms_config_connector *connector_cfg1, *connector_cfg2;
> +	int n_connectors = 0;
> +
> +	config = vkms_config_create("test");
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	vkms_config_for_each_connector(config, connector_cfg)
> +		n_connectors++;
> +	KUNIT_ASSERT_EQ(test, n_connectors, 0);
> +
> +	connector_cfg1 = vkms_config_create_connector(config);
> +	vkms_config_for_each_connector(config, connector_cfg) {
> +		n_connectors++;
> +		if (connector_cfg != connector_cfg1)
> +			KUNIT_FAIL(test, "Unexpected connector");
> +	}
> +	KUNIT_ASSERT_EQ(test, n_connectors, 1);
> +	n_connectors = 0;
> +
> +	connector_cfg2 = vkms_config_create_connector(config);
> +	vkms_config_for_each_connector(config, connector_cfg) {
> +		n_connectors++;
> +		if (connector_cfg != connector_cfg1 &&
> +		    connector_cfg != connector_cfg2)
> +			KUNIT_FAIL(test, "Unexpected connector");
> +	}
> +	KUNIT_ASSERT_EQ(test, n_connectors, 2);
> +	n_connectors = 0;
> +
> +	vkms_config_destroy_connector(connector_cfg2);
> +	vkms_config_for_each_connector(config, connector_cfg) {
> +		n_connectors++;
> +		if (connector_cfg != connector_cfg1)
> +			KUNIT_FAIL(test, "Unexpected connector");
> +	}
> +	KUNIT_ASSERT_EQ(test, n_connectors, 1);
> +	n_connectors = 0;
> +
> +	vkms_config_destroy(config);
> +}
> +
>   static void vkms_config_test_invalid_plane_number(struct kunit *test)
>   {
>   	struct vkms_config *config;
> @@ -439,6 +488,29 @@ static void vkms_config_test_valid_encoder_possible_crtcs(struct kunit *test)
>   	vkms_config_destroy(config);
>   }
>   
> +static void vkms_config_test_invalid_connector_number(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	struct vkms_config_connector *connector_cfg;
> +	int n;
> +
> +	config = vkms_config_default_create(false, false, false);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	/* Invalid: No connectors */
> +	connector_cfg = list_first_entry(&config->connectors, typeof(*connector_cfg), link);
> +	vkms_config_destroy_connector(connector_cfg);
> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> +
> +	/* Invalid: Too many connectors */
> +	for (n = 0; n <= 32; n++)
> +		connector_cfg = vkms_config_create_connector(config);
> +
> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> +
> +	vkms_config_destroy(config);
> +}
> +
>   static void vkms_config_test_attach_different_configs(struct kunit *test)
>   {
>   	struct vkms_config *config1, *config2;
> @@ -678,12 +750,14 @@ static struct kunit_case vkms_config_test_cases[] = {
>   	KUNIT_CASE(vkms_config_test_get_planes),
>   	KUNIT_CASE(vkms_config_test_get_crtcs),
>   	KUNIT_CASE(vkms_config_test_get_encoders),
> +	KUNIT_CASE(vkms_config_test_get_connectors),
>   	KUNIT_CASE(vkms_config_test_invalid_plane_number),
>   	KUNIT_CASE(vkms_config_test_valid_plane_type),
>   	KUNIT_CASE(vkms_config_test_valid_plane_possible_crtcs),
>   	KUNIT_CASE(vkms_config_test_invalid_crtc_number),
>   	KUNIT_CASE(vkms_config_test_invalid_encoder_number),
>   	KUNIT_CASE(vkms_config_test_valid_encoder_possible_crtcs),
> +	KUNIT_CASE(vkms_config_test_invalid_connector_number),
>   	KUNIT_CASE(vkms_config_test_attach_different_configs),
>   	KUNIT_CASE(vkms_config_test_plane_attach_crtc),
>   	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 17262a9c2567..fbbdee6068ce 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -25,6 +25,7 @@ struct vkms_config *vkms_config_create(const char *dev_name)
>   	INIT_LIST_HEAD(&config->planes);
>   	INIT_LIST_HEAD(&config->crtcs);
>   	INIT_LIST_HEAD(&config->encoders);
> +	INIT_LIST_HEAD(&config->connectors);
>   
>   	return config;
>   }
> @@ -38,6 +39,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>   	struct vkms_config_plane *plane_cfg;
>   	struct vkms_config_crtc *crtc_cfg;
>   	struct vkms_config_encoder *encoder_cfg;
> +	struct vkms_config_connector *connector_cfg;
>   	int n;
>   
>   	config = vkms_config_create(DEFAULT_DEVICE_NAME);
> @@ -89,6 +91,10 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>   	if (vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg))
>   		goto err_alloc;
>   
> +	connector_cfg = vkms_config_create_connector(config);
> +	if (IS_ERR(connector_cfg))
> +		goto err_alloc;
> +
>   	return config;
>   
>   err_alloc:
> @@ -102,6 +108,7 @@ void vkms_config_destroy(struct vkms_config *config)
>   	struct vkms_config_plane *plane_cfg, *plane_tmp;
>   	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
>   	struct vkms_config_encoder *encoder_cfg, *encoder_tmp;
> +	struct vkms_config_connector *connector_cfg, *connector_tmp;
>   
>   	list_for_each_entry_safe(plane_cfg, plane_tmp, &config->planes, link)
>   		vkms_config_destroy_plane(plane_cfg);
> @@ -112,6 +119,9 @@ void vkms_config_destroy(struct vkms_config *config)
>   	list_for_each_entry_safe(encoder_cfg, encoder_tmp, &config->encoders, link)
>   		vkms_config_destroy_encoder(config, encoder_cfg);
>   
> +	list_for_each_entry_safe(connector_cfg, connector_tmp, &config->connectors, link)
> +		vkms_config_destroy_connector(connector_cfg);
> +
>   	kfree_const(config->dev_name);
>   	kfree(config);
>   }
> @@ -255,6 +265,20 @@ static bool valid_encoder_possible_crtcs(const struct vkms_config *config)
>   	return true;
>   }
>   
> +static bool valid_connector_number(const struct vkms_config *config)
> +{
> +	struct drm_device *dev = config->dev ? &config->dev->drm : NULL;
> +	size_t n_connectors;
> +
> +	n_connectors = list_count_nodes((struct list_head *)&config->connectors);
> +	if (n_connectors <= 0 || n_connectors >= 32) {
> +		drm_info(dev, "The number of connectors must be between 1 and 31\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   bool vkms_config_is_valid(const struct vkms_config *config)
>   {
>   	struct vkms_config_crtc *crtc_cfg;
> @@ -268,6 +292,9 @@ bool vkms_config_is_valid(const struct vkms_config *config)
>   	if (!valid_encoder_number(config))
>   		return false;
>   
> +	if (!valid_connector_number(config))
> +		return false;
> +
>   	if (!valid_plane_possible_crtcs(config))
>   		return false;
>   
> @@ -292,6 +319,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
>   	struct vkms_config_plane *plane_cfg;
>   	struct vkms_config_crtc *crtc_cfg;
>   	struct vkms_config_encoder *encoder_cfg;
> +	struct vkms_config_connector *connector_cfg;
>   
>   	dev_name = vkms_config_get_device_name((struct vkms_config *)vkmsdev->config);
>   	seq_printf(m, "dev_name=%s\n", dev_name);
> @@ -311,6 +339,9 @@ static int vkms_config_show(struct seq_file *m, void *data)
>   	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)
>   		seq_puts(m, "encoder\n");
>   
> +	vkms_config_for_each_connector(vkmsdev->config, connector_cfg)
> +		seq_puts(m, "connector\n");
> +
>   	return 0;
>   }
>   
> @@ -520,3 +551,26 @@ void vkms_config_encoder_detach_crtc(struct vkms_config_encoder *encoder_cfg,
>   	}
>   }
>   EXPORT_SYMBOL_IF_KUNIT(vkms_config_encoder_detach_crtc);
> +
> +struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *config)
> +{
> +	struct vkms_config_connector *connector_cfg;
> +
> +	connector_cfg = kzalloc(sizeof(*connector_cfg), GFP_KERNEL);
> +	if (!connector_cfg)
> +		return ERR_PTR(-ENOMEM);
> +
> +	connector_cfg->config = config;
> +
> +	list_add_tail(&connector_cfg->link, &config->connectors);
> +
> +	return connector_cfg;
> +}
> +EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_connector);
> +
> +void vkms_config_destroy_connector(struct vkms_config_connector *connector_cfg)
> +{
> +	list_del(&connector_cfg->link);
> +	kfree(connector_cfg);
> +}
> +EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy_connector);
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 3e5b2e407378..73562c894102 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -16,6 +16,7 @@
>    * @planes: List of planes configured for the device
>    * @crtcs: List of CRTCs configured for the device
>    * @encoders: List of encoders configured for the device
> + * @connectors: List of connectors configured for the device
>    * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
>    */
>   struct vkms_config {
> @@ -23,6 +24,7 @@ struct vkms_config {
>   	struct list_head planes;
>   	struct list_head crtcs;
>   	struct list_head encoders;
> +	struct list_head connectors;
>   	struct vkms_device *dev;
>   };
>   
> @@ -92,6 +94,24 @@ struct vkms_config_encoder {
>   	struct drm_encoder *encoder;
>   };
>   
> +/**
> + * struct vkms_config_connector
> + *
> + * @link: Link to the others connector in vkms_config
> + * @config: The vkms_config this connector belongs to
> + * @connector: Internal usage. This pointer should never be considered as valid.
> + *             It can be used to store a temporary reference to a VKMS connector
> + *             during device creation. This pointer is not managed by the
> + *             configuration and must be managed by other means.
> + */
> +struct vkms_config_connector {
> +	struct list_head link;
> +	struct vkms_config *config;
> +
> +	/* Internal usage */
> +	struct vkms_connector *connector;
> +};
> +
>   /**
>    * vkms_config_for_each_plane - Iterate over the vkms_config planes
>    * @config: &struct vkms_config pointer
> @@ -116,6 +136,14 @@ struct vkms_config_encoder {
>   #define vkms_config_for_each_encoder(config, encoder_cfg) \
>   	list_for_each_entry((encoder_cfg), &(config)->encoders, link)
>   
> +/**
> + * vkms_config_for_each_connector - Iterate over the vkms_config connectors
> + * @config: &struct vkms_config pointer
> + * @connector_cfg: &struct vkms_config_connector pointer used as cursor
> + */
> +#define vkms_config_for_each_connector(config, connector_cfg) \
> +	list_for_each_entry((connector_cfg), &(config)->connectors, link)
> +
>   /**
>    * vkms_config_plane_for_each_possible_crtc - Iterate over the vkms_config_plane
>    * possible CRTCs
> @@ -361,4 +389,20 @@ int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *enc
>   void vkms_config_encoder_detach_crtc(struct vkms_config_encoder *encoder_cfg,
>   				     struct vkms_config_crtc *crtc_cfg);
>   
> +/**
> + * vkms_config_create_connector() - Add a new connector configuration
> + * @config: Configuration to add the connector to
> + *
> + * Returns:
> + * The new connector configuration or an error. Call
> + * vkms_config_destroy_connector() to free the returned connector configuration.
> + */
> +struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *config);
> +
> +/**
> + * vkms_config_destroy_connector() - Remove and free a connector configuration
> + * @connector_cfg: Connector configuration to destroy
> + */
> +void vkms_config_destroy_connector(struct vkms_config_connector *connector_cfg);
> +
>   #endif /* _VKMS_CONFIG_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> index ab8b52a84151..48b10cba322a 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -25,8 +25,19 @@ static int vkms_conn_get_modes(struct drm_connector *connector)
>   	return count;
>   }
>   
> +static struct drm_encoder *vkms_conn_best_encoder(struct drm_connector *connector)
> +{
> +	struct drm_encoder *encoder;
> +
> +	drm_connector_for_each_possible_encoder(connector, encoder)
> +		return encoder;
> +
> +	return NULL;
> +}
> +

Not for this series, but does it make sense to make the "best_encoder" 
configurable?

Thanks,
Louis Chauvet

>   static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
>   	.get_modes    = vkms_conn_get_modes,
> +	.best_encoder = vkms_conn_best_encoder,
>   };
>   
>   struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

