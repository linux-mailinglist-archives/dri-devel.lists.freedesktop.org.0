Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3256A3410C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 14:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CF810EABD;
	Thu, 13 Feb 2025 13:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CJUjIJhB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC71D10EABD
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 13:59:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2782E443E3;
 Thu, 13 Feb 2025 13:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1739455167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TSg0o8cbkji3l9FWxVcdCZFImXZKiymT2pgu795cxBI=;
 b=CJUjIJhB6iDekEMFGa9XSehykh31j26LJL6DRkduILf9OKpiFNCd26u1MKI6SJcUy5HQeX
 +8KfmrVs6MLuH5detNey/xf0P7uqRYoA3KzgplEwovx5a9hQRBk36aKBrbPPu5Pg2sU/qe
 jJut7FtVBXOQU226IGgNgwjBs0uClPaJZDQ9Mx4bgf2VGUueaYEunHqZk5iKDTRWxfatlk
 6q5H6jhPajv+vIQHFi9PylooV5KHC8wvyV9exrzR5rS8Wl8ylK+2ryw0TZwP18Kw1VO3PC
 D2PWRU8MnRMSi6ns8uN3KXYCtc1okfqgavv+mB8ZKnYna2ovKdfqhyIoR2DbtQ==
Date: Thu, 13 Feb 2025 14:59:25 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 15/15] drm/vkms: Allow to attach connectors and encoders
Message-ID: <Z636vXoYgNVwa8Qt@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250211110912.15409-1-jose.exposito89@gmail.com>
 <20250211110912.15409-16-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211110912.15409-16-jose.exposito89@gmail.com>
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
> Add a list of possible encoders to the connector configuration and
> helpers to attach and detach them.
> 
> Now that the default configuration has its connector and encoder
> correctly, configure the output following the configuration.
> 
> Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

The compilation is broken as module:

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 7f4e21e8ee0c..76f24bd463f6 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -610,6 +610,7 @@ int __must_check vkms_config_connector_attach_encoder(struct vkms_config_connect
        return xa_alloc(&connector_cfg->possible_encoders, &encoder_idx,
                        encoder_cfg, xa_limit_32b, GFP_KERNEL);
 }
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_connector_attach_encoder);

 void vkms_config_connector_detach_encoder(struct vkms_config_connector *connector_cfg,
                                          struct vkms_config_encoder *encoder_cfg)
@@ -623,3 +624,4 @@ void vkms_config_connector_detach_encoder(struct vkms_config_connector *connecto
                        xa_erase(&connector_cfg->possible_encoders, idx);
        }
 }
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_connector_detach_encoder);


> ---
>  .clang-format                                 |  1 +
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c | 94 +++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.c            | 60 ++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.h            | 29 ++++++
>  drivers/gpu/drm/vkms/vkms_output.c            | 33 ++++---
>  5 files changed, 204 insertions(+), 13 deletions(-)
> 
> diff --git a/.clang-format b/.clang-format
> index ca49832993c5..7630990aa07a 100644
> --- a/.clang-format
> +++ b/.clang-format
> @@ -694,6 +694,7 @@ ForEachMacros:
>    - 'vkms_config_for_each_crtc'
>    - 'vkms_config_for_each_encoder'
>    - 'vkms_config_for_each_plane'
> +  - 'vkms_config_connector_for_each_possible_encoder'
>    - 'vkms_config_encoder_for_each_possible_crtc'
>    - 'vkms_config_plane_for_each_possible_crtc'
>    - 'while_for_each_ftrace_op'
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index cba7e9d2fcad..2d104ecfde3b 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -511,6 +511,27 @@ static void vkms_config_test_invalid_connector_number(struct kunit *test)
>  	vkms_config_destroy(config);
>  }
>  
> +static void vkms_config_test_valid_connector_possible_encoders(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	struct vkms_config_encoder *encoder_cfg;
> +	struct vkms_config_connector *connector_cfg;
> +
> +	config = vkms_config_default_create(false, false, false);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	encoder_cfg = list_first_entry(&config->encoders,
> +				       typeof(*encoder_cfg), link);
> +	connector_cfg = list_first_entry(&config->connectors,
> +					 typeof(*connector_cfg), link);
> +
> +	/* Invalid: Connector without a possible encoder */
> +	vkms_config_connector_detach_encoder(connector_cfg, encoder_cfg);
> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> +
> +	vkms_config_destroy(config);
> +}
> +
>  static void vkms_config_test_plane_attach_crtc(struct kunit *test)
>  {
>  	struct vkms_config *config;
> @@ -700,6 +721,77 @@ static void vkms_config_test_encoder_get_possible_crtcs(struct kunit *test)
>  	vkms_config_destroy(config);
>  }
>  
> +static void vkms_config_test_connector_get_possible_encoders(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	struct vkms_config_connector *connector_cfg1, *connector_cfg2;
> +	struct vkms_config_encoder *encoder_cfg1, *encoder_cfg2;
> +	struct vkms_config_encoder *possible_encoder;
> +	unsigned long idx = 0;
> +	int n_encoders = 0;
> +	int err;
> +
> +	config = vkms_config_create("test");
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	connector_cfg1 = vkms_config_create_connector(config);
> +	connector_cfg2 = vkms_config_create_connector(config);
> +	encoder_cfg1 = vkms_config_create_encoder(config);
> +	encoder_cfg2 = vkms_config_create_encoder(config);
> +
> +	/* No possible encoders */
> +	vkms_config_connector_for_each_possible_encoder(connector_cfg1, idx,
> +							possible_encoder)
> +		KUNIT_FAIL(test, "Unexpected possible encoder");
> +
> +	vkms_config_connector_for_each_possible_encoder(connector_cfg2, idx,
> +							possible_encoder)
> +		KUNIT_FAIL(test, "Unexpected possible encoder");
> +
> +	/* Connector 1 attached to encoders 1 and 2 */
> +	err = vkms_config_connector_attach_encoder(connector_cfg1, encoder_cfg1);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	err = vkms_config_connector_attach_encoder(connector_cfg1, encoder_cfg2);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +
> +	vkms_config_connector_for_each_possible_encoder(connector_cfg1, idx,
> +							possible_encoder) {
> +		n_encoders++;
> +		if (possible_encoder != encoder_cfg1 &&
> +		    possible_encoder != encoder_cfg2)
> +			KUNIT_FAIL(test, "Unexpected possible encoder");
> +	}
> +	KUNIT_ASSERT_EQ(test, n_encoders, 2);
> +	n_encoders = 0;
> +
> +	vkms_config_connector_for_each_possible_encoder(connector_cfg2, idx,
> +							possible_encoder)
> +		KUNIT_FAIL(test, "Unexpected possible encoder");
> +
> +	/* Connector 1 attached to encoder 1 and connector 2 to encoder 2 */
> +	vkms_config_connector_detach_encoder(connector_cfg1, encoder_cfg2);
> +	vkms_config_connector_for_each_possible_encoder(connector_cfg1, idx,
> +							possible_encoder) {
> +		n_encoders++;
> +		if (possible_encoder != encoder_cfg1)
> +			KUNIT_FAIL(test, "Unexpected possible encoder");
> +	}
> +	KUNIT_ASSERT_EQ(test, n_encoders, 1);
> +	n_encoders = 0;
> +
> +	err = vkms_config_connector_attach_encoder(connector_cfg2, encoder_cfg2);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	vkms_config_connector_for_each_possible_encoder(connector_cfg2, idx,
> +							possible_encoder) {
> +		n_encoders++;
> +		if (possible_encoder != encoder_cfg2)
> +			KUNIT_FAIL(test, "Unexpected possible encoder");
> +	}
> +	KUNIT_ASSERT_EQ(test, n_encoders, 1);
> +
> +	vkms_config_destroy(config);
> +}
> +
>  static struct kunit_case vkms_config_test_cases[] = {
>  	KUNIT_CASE(vkms_config_test_empty_config),
>  	KUNIT_CASE_PARAM(vkms_config_test_default_config,
> @@ -715,9 +807,11 @@ static struct kunit_case vkms_config_test_cases[] = {
>  	KUNIT_CASE(vkms_config_test_invalid_encoder_number),
>  	KUNIT_CASE(vkms_config_test_valid_encoder_possible_crtcs),
>  	KUNIT_CASE(vkms_config_test_invalid_connector_number),
> +	KUNIT_CASE(vkms_config_test_valid_connector_possible_encoders),
>  	KUNIT_CASE(vkms_config_test_plane_attach_crtc),
>  	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
>  	KUNIT_CASE(vkms_config_test_encoder_get_possible_crtcs),
> +	KUNIT_CASE(vkms_config_test_connector_get_possible_encoders),
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index d52280d3bbee..3d95dc713151 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -93,6 +93,9 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  	if (IS_ERR(connector_cfg))
>  		goto err_alloc;
>  
> +	if (vkms_config_connector_attach_encoder(connector_cfg, encoder_cfg))
> +		goto err_alloc;
> +
>  	return config;
>  
>  err_alloc:
> @@ -275,6 +278,22 @@ static bool valid_connector_number(struct vkms_config *config)
>  	return true;
>  }
>  
> +static bool valid_connector_possible_encoders(struct vkms_config *config)
> +{
> +	struct drm_device *dev = &config->dev->drm;
> +	struct vkms_config_connector *connector_cfg;
> +
> +	vkms_config_for_each_connector(config, connector_cfg) {
> +		if (xa_empty(&connector_cfg->possible_encoders)) {
> +			drm_info(dev,
> +				 "All connectors must have at least one possible encoder\n");
> +			return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
>  bool vkms_config_is_valid(struct vkms_config *config)
>  {
>  	struct vkms_config_crtc *crtc_cfg;
> @@ -302,6 +321,9 @@ bool vkms_config_is_valid(struct vkms_config *config)
>  	if (!valid_encoder_possible_crtcs(config))
>  		return false;
>  
> +	if (!valid_connector_possible_encoders(config))
> +		return false;
> +
>  	return true;
>  }
>  
> @@ -493,6 +515,11 @@ struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *confi
>  void vkms_config_destroy_encoder(struct vkms_config *config,
>  				 struct vkms_config_encoder *encoder_cfg)
>  {
> +	struct vkms_config_connector *connector_cfg;
> +
> +	vkms_config_for_each_connector(config, connector_cfg)
> +		vkms_config_connector_detach_encoder(connector_cfg, encoder_cfg);
> +
>  	xa_destroy(&encoder_cfg->possible_crtcs);
>  	list_del(&encoder_cfg->link);
>  	kfree(encoder_cfg);
> @@ -534,6 +561,8 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
>  	if (!connector_cfg)
>  		return ERR_PTR(-ENOMEM);
>  
> +	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
> +
>  	list_add_tail(&connector_cfg->link, &config->connectors);
>  
>  	return connector_cfg;
> @@ -541,6 +570,37 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
>  
>  void vkms_config_destroy_connector(struct vkms_config_connector *connector_cfg)
>  {
> +	xa_destroy(&connector_cfg->possible_encoders);
>  	list_del(&connector_cfg->link);
>  	kfree(connector_cfg);
>  }
> +
> +int __must_check vkms_config_connector_attach_encoder(struct vkms_config_connector *connector_cfg,
> +						      struct vkms_config_encoder *encoder_cfg)
> +{
> +	struct vkms_config_encoder *possible_encoder;
> +	unsigned long idx = 0;
> +	u32 encoder_idx = 0;
> +
> +	vkms_config_connector_for_each_possible_encoder(connector_cfg, idx,
> +							possible_encoder) {
> +		if (possible_encoder == encoder_cfg)
> +			return -EINVAL;
> +	}
> +
> +	return xa_alloc(&connector_cfg->possible_encoders, &encoder_idx,
> +			encoder_cfg, xa_limit_32b, GFP_KERNEL);
> +}
> +
> +void vkms_config_connector_detach_encoder(struct vkms_config_connector *connector_cfg,
> +					  struct vkms_config_encoder *encoder_cfg)
> +{
> +	struct vkms_config_encoder *possible_encoder;
> +	unsigned long idx = 0;
> +
> +	vkms_config_connector_for_each_possible_encoder(connector_cfg, idx,
> +							possible_encoder) {
> +		if (possible_encoder == encoder_cfg)
> +			xa_erase(&connector_cfg->possible_encoders, idx);
> +	}
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 8451c2f127b6..c87513d174f2 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -92,6 +92,7 @@ struct vkms_config_encoder {
>   * struct vkms_config_connector
>   *
>   * @link: Link to the others connector in vkms_config
> + * @possible_encoders: Array of encoders that can be used with this connector
>   * @connector: Internal usage. This pointer should never be considered as valid.
>   *             It can be used to store a temporary reference to a VKMS connector
>   *             during device creation. This pointer is not managed by the
> @@ -100,6 +101,8 @@ struct vkms_config_encoder {
>  struct vkms_config_connector {
>  	struct list_head link;
>  
> +	struct xarray possible_encoders;
> +
>  	/* Internal usage */
>  	struct vkms_connector *connector;
>  };
> @@ -156,6 +159,16 @@ struct vkms_config_connector {
>  #define vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx, possible_crtc) \
>  	xa_for_each(&(encoder_cfg)->possible_crtcs, idx, (possible_crtc))
>  
> +/**
> + * vkms_config_connector_for_each_possible_encoder - Iterate over the
> + * vkms_config_connector possible encoders
> + * @connector_cfg: &struct vkms_config_connector pointer
> + * @idx: Index of the cursor
> + * @possible_encoder: &struct vkms_config_encoder pointer used as cursor
> + */
> +#define vkms_config_connector_for_each_possible_encoder(connector_cfg, idx, possible_encoder) \
> +	xa_for_each(&(connector_cfg)->possible_encoders, idx, (possible_encoder))
> +
>  /**
>   * vkms_config_create() - Create a new VKMS configuration
>   * @dev_name: Name of the device
> @@ -397,4 +410,20 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
>   */
>  void vkms_config_destroy_connector(struct vkms_config_connector *connector_cfg);
>  
> +/**
> + * vkms_config_connector_attach_encoder - Attach a connector to an encoder
> + * @connector_cfg: Connector to attach
> + * @encoder_cfg: Encoder to attach @connector_cfg to
> + */
> +int __must_check vkms_config_connector_attach_encoder(struct vkms_config_connector *connector_cfg,
> +						      struct vkms_config_encoder *encoder_cfg);
> +
> +/**
> + * vkms_config_connector_detach_encoder - Detach a connector from an encoder
> + * @connector_cfg: Connector to detach
> + * @encoder_cfg: Encoder to detach @connector_cfg from
> + */
> +void vkms_config_connector_detach_encoder(struct vkms_config_connector *connector_cfg,
> +					  struct vkms_config_encoder *encoder_cfg);
> +
>  #endif /* _VKMS_CONFIG_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 8920d6b5d105..8d7ca0cdd79f 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -8,10 +8,10 @@
>  int vkms_output_init(struct vkms_device *vkmsdev)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
> -	struct vkms_connector *connector;
>  	struct vkms_config_plane *plane_cfg;
>  	struct vkms_config_crtc *crtc_cfg;
>  	struct vkms_config_encoder *encoder_cfg;
> +	struct vkms_config_connector *connector_cfg;
>  	int ret;
>  	int writeback;
>  
> @@ -83,22 +83,29 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  		}
>  	}
>  
> -	connector = vkms_connector_init(vkmsdev);
> -	if (IS_ERR(connector)) {
> -		DRM_ERROR("Failed to init connector\n");
> -		return PTR_ERR(connector);
> -	}
> +	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
> +		struct vkms_config_encoder *possible_encoder;
> +		unsigned long idx = 0;
>  
> -	/* Attach the encoder and the connector */
> -	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg) {
> -		ret = drm_connector_attach_encoder(&connector->base, encoder_cfg->encoder);
> -		if (ret) {
> -			DRM_ERROR("Failed to attach connector to encoder\n");
> -			return ret;
> +		connector_cfg->connector = vkms_connector_init(vkmsdev);
> +		if (IS_ERR(connector_cfg->connector)) {
> +			DRM_ERROR("Failed to init connector\n");
> +			return PTR_ERR(connector_cfg->connector);
> +		}
> +
> +		vkms_config_connector_for_each_possible_encoder(connector_cfg,
> +								idx,
> +								possible_encoder) {
> +			ret = drm_connector_attach_encoder(&connector_cfg->connector->base,
> +							   possible_encoder->encoder);
> +			if (ret) {
> +				DRM_ERROR("Failed to attach connector to encoder\n");
> +				return ret;
> +			}
>  		}
>  	}
>  
>  	drm_mode_config_reset(dev);
>  
> -	return ret;
> +	return 0;
>  }
> -- 
> 2.48.1
> 
