Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16F2A3984E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 11:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F24110E33F;
	Tue, 18 Feb 2025 10:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IPeM9Iw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5069410E33F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 10:11:25 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-38f488f3161so822398f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 02:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739873484; x=1740478284; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jOdZKesqfoNZ275Br6kZa4W41E5z6vETxGP2OEN0Wac=;
 b=IPeM9Iw+zoACw9zk6g9ANSJfS4Wjz3ycAcAiyzklyihlaHetka8c3iwKeL860ek+jK
 81RiIPjVZAX9B3c8VG/rz9XA5uKNITfhbz5GLTc1QCW3jMQwmbu+BWa40q6cnc9s573T
 5/7UsQ+rCrrZpNQKw+8Noo2XR5f8OrTKeIB1J6JiPD4pkH8HJmbWPZQ36Z6361ISBSFZ
 0/jVI7Uc07IEatP52Dvj8j0uEIiBJqAxGWaax8e7XQoj+Hdtj69S2/ZFgV2/Lq4FobQ2
 /dLIeadTsoS+EpB6vhW2twRzD6S1+pKci4eqs2QlbO+Ne8DRNnFqZIVaNimmChsM1PJg
 1KXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739873484; x=1740478284;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jOdZKesqfoNZ275Br6kZa4W41E5z6vETxGP2OEN0Wac=;
 b=etFUkL6ld3vuwDf5yFIOgeRuSSqyDePz80Z/FgNJCYs52jvlTQ6YVZY2QKgFSLlo8O
 mMtnMbvLFgM+pPX/oOO+NZKTl0A/+dc29doHtPah+10l/pfaCEBaf+42HNx87oywXiAC
 6wBqrspHRNIqh8HOR3YKENxpqS++GVMsCqnNW8PwXX4mtzvX9t5q5Mfu9v6ZiRnIr+Xi
 nYqg6LzbwZ7JMePwHhTy1DbGwQmQEfUJqSmCcbswL/+ttPmYzx3BlvfgeBXQojDc7Ngo
 y/Jp0zlFJlS0i+BUU+nRyH6u1R92HySSIGjLMDdDfvWe/DdpPYrGAmjUGkVcSaWIg78l
 pE6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp+iPhkiJaJ14sgwPORHZatBFhh3RQLodGaFzJV7ax1Xi3JNLHxna1DvhRX9XTOd1F52iYQLlFPn4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNwpXi1MWun4JcrQb3rHWxO0b5FKYfoFXmBow0bOGyJ7udkhp7
 R/bAi70thQYSMuzLsr0XN0Ua7LUcJt8A+p7c0/ipP4mBKNCjdQYp
X-Gm-Gg: ASbGnctJn458Jt7kGOBHUv1Bs3zYdpSMs8HrzfYi+ywZC0MAUF3CFxbjcl95p9dUk8T
 GHaiW6fBGiz9Nb6kTIzCuQd0As03IR47QeTvRNdEc3MPO5MUofDrmaeC/psBmxRtgh/UxvdGDBV
 LF3mMucbyzdx8agujZSKbvbf7+XayXSDNNFLgeKZcY5SanoeO2tjR1oWIaDVMCYjKhihStJtpwh
 8/3rEpc/jlY6zmDfRSzZc3on8HMpLSj/QG7PMOTt+ML3j4/Oe6XIxy3tV3113oH4XEaQ3N9C0UK
 xLHrTspk2Z6Ab2I=
X-Google-Smtp-Source: AGHT+IGHXFUbjp01RiSXmJkE4aiTN+foCRp8wQgEPKHUD8tza4Sms4UvvdjkHTMla5PSEfeakRhI7A==
X-Received: by 2002:a05:6000:1aca:b0:38f:37f3:5ca9 with SMTP id
 ffacd0b85a97d-38f37f36159mr10474463f8f.50.1739873483348; 
 Tue, 18 Feb 2025 02:11:23 -0800 (PST)
Received: from fedora ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258eb141sm14292940f8f.41.2025.02.18.02.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 02:11:22 -0800 (PST)
Date: Tue, 18 Feb 2025 11:11:21 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 13/14] drm/vkms: Allow to configure multiple connectors
Message-ID: <Z7RcyT2XEVYiNZ70@fedora>
References: <20250217100120.7620-1-jose.exposito89@gmail.com>
 <20250217100120.7620-14-jose.exposito89@gmail.com>
 <6e1496ac-892d-4267-a670-75e6eb50e936@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e1496ac-892d-4267-a670-75e6eb50e936@bootlin.com>
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

On Mon, Feb 17, 2025 at 04:45:41PM +0100, Louis Chauvet wrote:
> 
> 
> Le 17/02/2025 � 11:01, Jos� Exp�sito a �crit�:
> > Add a list of connectors to vkms_config and helper functions to add and
> > remove as many connectors as wanted.
> > 
> > For backwards compatibility, add one enabled connector to the default
> > configuration.
> > 
> > A future patch will allow to attach connectors and encoders, but for the
> > moment there are no changes in the way the output is configured.
> > 
> > Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Signed-off-by: Jos� Exp�sito <jose.exposito89@gmail.com>
> > ---
> >   .clang-format                                 |  1 +
> >   drivers/gpu/drm/vkms/tests/vkms_config_test.c | 74 +++++++++++++++++++
> >   drivers/gpu/drm/vkms/vkms_config.c            | 54 ++++++++++++++
> >   drivers/gpu/drm/vkms/vkms_config.h            | 44 +++++++++++
> >   drivers/gpu/drm/vkms/vkms_connector.c         | 11 +++
> >   5 files changed, 184 insertions(+)
> > 
> > diff --git a/.clang-format b/.clang-format
> > index 5d21c0e4edbd..ca49832993c5 100644
> > --- a/.clang-format
> > +++ b/.clang-format
> > @@ -690,6 +690,7 @@ ForEachMacros:
> >     - 'v4l2_m2m_for_each_src_buf'
> >     - 'v4l2_m2m_for_each_src_buf_safe'
> >     - 'virtio_device_for_each_vq'
> > +  - 'vkms_config_for_each_connector'
> >     - 'vkms_config_for_each_crtc'
> >     - 'vkms_config_for_each_encoder'
> >     - 'vkms_config_for_each_plane'
> > diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> > index 62fbcba4520f..0034f922713e 100644
> > --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> > +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> > @@ -27,6 +27,7 @@ static void vkms_config_test_empty_config(struct kunit *test)
> >   	KUNIT_EXPECT_TRUE(test, list_empty(&config->planes));
> >   	KUNIT_EXPECT_TRUE(test, list_empty(&config->crtcs));
> >   	KUNIT_EXPECT_TRUE(test, list_empty(&config->encoders));
> > +	KUNIT_EXPECT_TRUE(test, list_empty(&config->connectors));
> 
> Ditto
> With this modification:
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> >   	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> > @@ -103,6 +104,9 @@ static void vkms_config_test_default_config(struct kunit *test)
> >   	/* Encoders */
> >   	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->encoders), 1);
> > +	/* Connectors */
> > +	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->connectors), 1);
> > +
> >   	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
> >   	vkms_config_destroy(config);
> > @@ -232,6 +236,51 @@ static void vkms_config_test_get_encoders(struct kunit *test)
> >   	vkms_config_destroy(config);
> >   }
> > +static void vkms_config_test_get_connectors(struct kunit *test)
> > +{
> > +	struct vkms_config *config;
> > +	struct vkms_config_connector *connector_cfg;
> > +	struct vkms_config_connector *connector_cfg1, *connector_cfg2;
> > +	int n_connectors = 0;
> > +
> > +	config = vkms_config_create("test");
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> > +
> > +	vkms_config_for_each_connector(config, connector_cfg)
> > +		n_connectors++;
> > +	KUNIT_ASSERT_EQ(test, n_connectors, 0);
> > +
> > +	connector_cfg1 = vkms_config_create_connector(config);
> > +	vkms_config_for_each_connector(config, connector_cfg) {
> > +		n_connectors++;
> > +		if (connector_cfg != connector_cfg1)
> > +			KUNIT_FAIL(test, "Unexpected connector");
> > +	}
> > +	KUNIT_ASSERT_EQ(test, n_connectors, 1);
> > +	n_connectors = 0;
> > +
> > +	connector_cfg2 = vkms_config_create_connector(config);
> > +	vkms_config_for_each_connector(config, connector_cfg) {
> > +		n_connectors++;
> > +		if (connector_cfg != connector_cfg1 &&
> > +		    connector_cfg != connector_cfg2)
> > +			KUNIT_FAIL(test, "Unexpected connector");
> > +	}
> > +	KUNIT_ASSERT_EQ(test, n_connectors, 2);
> > +	n_connectors = 0;
> > +
> > +	vkms_config_destroy_connector(connector_cfg2);
> > +	vkms_config_for_each_connector(config, connector_cfg) {
> > +		n_connectors++;
> > +		if (connector_cfg != connector_cfg1)
> > +			KUNIT_FAIL(test, "Unexpected connector");
> > +	}
> > +	KUNIT_ASSERT_EQ(test, n_connectors, 1);
> > +	n_connectors = 0;
> > +
> > +	vkms_config_destroy(config);
> > +}
> > +
> >   static void vkms_config_test_invalid_plane_number(struct kunit *test)
> >   {
> >   	struct vkms_config *config;
> > @@ -439,6 +488,29 @@ static void vkms_config_test_valid_encoder_possible_crtcs(struct kunit *test)
> >   	vkms_config_destroy(config);
> >   }
> > +static void vkms_config_test_invalid_connector_number(struct kunit *test)
> > +{
> > +	struct vkms_config *config;
> > +	struct vkms_config_connector *connector_cfg;
> > +	int n;
> > +
> > +	config = vkms_config_default_create(false, false, false);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> > +
> > +	/* Invalid: No connectors */
> > +	connector_cfg = list_first_entry(&config->connectors, typeof(*connector_cfg), link);
> > +	vkms_config_destroy_connector(connector_cfg);
> > +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> > +
> > +	/* Invalid: Too many connectors */
> > +	for (n = 0; n <= 32; n++)
> > +		connector_cfg = vkms_config_create_connector(config);
> > +
> > +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> > +
> > +	vkms_config_destroy(config);
> > +}
> > +
> >   static void vkms_config_test_attach_different_configs(struct kunit *test)
> >   {
> >   	struct vkms_config *config1, *config2;
> > @@ -678,12 +750,14 @@ static struct kunit_case vkms_config_test_cases[] = {
> >   	KUNIT_CASE(vkms_config_test_get_planes),
> >   	KUNIT_CASE(vkms_config_test_get_crtcs),
> >   	KUNIT_CASE(vkms_config_test_get_encoders),
> > +	KUNIT_CASE(vkms_config_test_get_connectors),
> >   	KUNIT_CASE(vkms_config_test_invalid_plane_number),
> >   	KUNIT_CASE(vkms_config_test_valid_plane_type),
> >   	KUNIT_CASE(vkms_config_test_valid_plane_possible_crtcs),
> >   	KUNIT_CASE(vkms_config_test_invalid_crtc_number),
> >   	KUNIT_CASE(vkms_config_test_invalid_encoder_number),
> >   	KUNIT_CASE(vkms_config_test_valid_encoder_possible_crtcs),
> > +	KUNIT_CASE(vkms_config_test_invalid_connector_number),
> >   	KUNIT_CASE(vkms_config_test_attach_different_configs),
> >   	KUNIT_CASE(vkms_config_test_plane_attach_crtc),
> >   	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
> > diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> > index 17262a9c2567..fbbdee6068ce 100644
> > --- a/drivers/gpu/drm/vkms/vkms_config.c
> > +++ b/drivers/gpu/drm/vkms/vkms_config.c
> > @@ -25,6 +25,7 @@ struct vkms_config *vkms_config_create(const char *dev_name)
> >   	INIT_LIST_HEAD(&config->planes);
> >   	INIT_LIST_HEAD(&config->crtcs);
> >   	INIT_LIST_HEAD(&config->encoders);
> > +	INIT_LIST_HEAD(&config->connectors);
> >   	return config;
> >   }
> > @@ -38,6 +39,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
> >   	struct vkms_config_plane *plane_cfg;
> >   	struct vkms_config_crtc *crtc_cfg;
> >   	struct vkms_config_encoder *encoder_cfg;
> > +	struct vkms_config_connector *connector_cfg;
> >   	int n;
> >   	config = vkms_config_create(DEFAULT_DEVICE_NAME);
> > @@ -89,6 +91,10 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
> >   	if (vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg))
> >   		goto err_alloc;
> > +	connector_cfg = vkms_config_create_connector(config);
> > +	if (IS_ERR(connector_cfg))
> > +		goto err_alloc;
> > +
> >   	return config;
> >   err_alloc:
> > @@ -102,6 +108,7 @@ void vkms_config_destroy(struct vkms_config *config)
> >   	struct vkms_config_plane *plane_cfg, *plane_tmp;
> >   	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
> >   	struct vkms_config_encoder *encoder_cfg, *encoder_tmp;
> > +	struct vkms_config_connector *connector_cfg, *connector_tmp;
> >   	list_for_each_entry_safe(plane_cfg, plane_tmp, &config->planes, link)
> >   		vkms_config_destroy_plane(plane_cfg);
> > @@ -112,6 +119,9 @@ void vkms_config_destroy(struct vkms_config *config)
> >   	list_for_each_entry_safe(encoder_cfg, encoder_tmp, &config->encoders, link)
> >   		vkms_config_destroy_encoder(config, encoder_cfg);
> > +	list_for_each_entry_safe(connector_cfg, connector_tmp, &config->connectors, link)
> > +		vkms_config_destroy_connector(connector_cfg);
> > +
> >   	kfree_const(config->dev_name);
> >   	kfree(config);
> >   }
> > @@ -255,6 +265,20 @@ static bool valid_encoder_possible_crtcs(const struct vkms_config *config)
> >   	return true;
> >   }
> > +static bool valid_connector_number(const struct vkms_config *config)
> > +{
> > +	struct drm_device *dev = config->dev ? &config->dev->drm : NULL;
> > +	size_t n_connectors;
> > +
> > +	n_connectors = list_count_nodes((struct list_head *)&config->connectors);
> > +	if (n_connectors <= 0 || n_connectors >= 32) {
> > +		drm_info(dev, "The number of connectors must be between 1 and 31\n");
> > +		return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> >   bool vkms_config_is_valid(const struct vkms_config *config)
> >   {
> >   	struct vkms_config_crtc *crtc_cfg;
> > @@ -268,6 +292,9 @@ bool vkms_config_is_valid(const struct vkms_config *config)
> >   	if (!valid_encoder_number(config))
> >   		return false;
> > +	if (!valid_connector_number(config))
> > +		return false;
> > +
> >   	if (!valid_plane_possible_crtcs(config))
> >   		return false;
> > @@ -292,6 +319,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
> >   	struct vkms_config_plane *plane_cfg;
> >   	struct vkms_config_crtc *crtc_cfg;
> >   	struct vkms_config_encoder *encoder_cfg;
> > +	struct vkms_config_connector *connector_cfg;
> >   	dev_name = vkms_config_get_device_name((struct vkms_config *)vkmsdev->config);
> >   	seq_printf(m, "dev_name=%s\n", dev_name);
> > @@ -311,6 +339,9 @@ static int vkms_config_show(struct seq_file *m, void *data)
> >   	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)
> >   		seq_puts(m, "encoder\n");
> > +	vkms_config_for_each_connector(vkmsdev->config, connector_cfg)
> > +		seq_puts(m, "connector\n");
> > +
> >   	return 0;
> >   }
> > @@ -520,3 +551,26 @@ void vkms_config_encoder_detach_crtc(struct vkms_config_encoder *encoder_cfg,
> >   	}
> >   }
> >   EXPORT_SYMBOL_IF_KUNIT(vkms_config_encoder_detach_crtc);
> > +
> > +struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *config)
> > +{
> > +	struct vkms_config_connector *connector_cfg;
> > +
> > +	connector_cfg = kzalloc(sizeof(*connector_cfg), GFP_KERNEL);
> > +	if (!connector_cfg)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	connector_cfg->config = config;
> > +
> > +	list_add_tail(&connector_cfg->link, &config->connectors);
> > +
> > +	return connector_cfg;
> > +}
> > +EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_connector);
> > +
> > +void vkms_config_destroy_connector(struct vkms_config_connector *connector_cfg)
> > +{
> > +	list_del(&connector_cfg->link);
> > +	kfree(connector_cfg);
> > +}
> > +EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy_connector);
> > diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> > index 3e5b2e407378..73562c894102 100644
> > --- a/drivers/gpu/drm/vkms/vkms_config.h
> > +++ b/drivers/gpu/drm/vkms/vkms_config.h
> > @@ -16,6 +16,7 @@
> >    * @planes: List of planes configured for the device
> >    * @crtcs: List of CRTCs configured for the device
> >    * @encoders: List of encoders configured for the device
> > + * @connectors: List of connectors configured for the device
> >    * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
> >    */
> >   struct vkms_config {
> > @@ -23,6 +24,7 @@ struct vkms_config {
> >   	struct list_head planes;
> >   	struct list_head crtcs;
> >   	struct list_head encoders;
> > +	struct list_head connectors;
> >   	struct vkms_device *dev;
> >   };
> > @@ -92,6 +94,24 @@ struct vkms_config_encoder {
> >   	struct drm_encoder *encoder;
> >   };
> > +/**
> > + * struct vkms_config_connector
> > + *
> > + * @link: Link to the others connector in vkms_config
> > + * @config: The vkms_config this connector belongs to
> > + * @connector: Internal usage. This pointer should never be considered as valid.
> > + *             It can be used to store a temporary reference to a VKMS connector
> > + *             during device creation. This pointer is not managed by the
> > + *             configuration and must be managed by other means.
> > + */
> > +struct vkms_config_connector {
> > +	struct list_head link;
> > +	struct vkms_config *config;
> > +
> > +	/* Internal usage */
> > +	struct vkms_connector *connector;
> > +};
> > +
> >   /**
> >    * vkms_config_for_each_plane - Iterate over the vkms_config planes
> >    * @config: &struct vkms_config pointer
> > @@ -116,6 +136,14 @@ struct vkms_config_encoder {
> >   #define vkms_config_for_each_encoder(config, encoder_cfg) \
> >   	list_for_each_entry((encoder_cfg), &(config)->encoders, link)
> > +/**
> > + * vkms_config_for_each_connector - Iterate over the vkms_config connectors
> > + * @config: &struct vkms_config pointer
> > + * @connector_cfg: &struct vkms_config_connector pointer used as cursor
> > + */
> > +#define vkms_config_for_each_connector(config, connector_cfg) \
> > +	list_for_each_entry((connector_cfg), &(config)->connectors, link)
> > +
> >   /**
> >    * vkms_config_plane_for_each_possible_crtc - Iterate over the vkms_config_plane
> >    * possible CRTCs
> > @@ -361,4 +389,20 @@ int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *enc
> >   void vkms_config_encoder_detach_crtc(struct vkms_config_encoder *encoder_cfg,
> >   				     struct vkms_config_crtc *crtc_cfg);
> > +/**
> > + * vkms_config_create_connector() - Add a new connector configuration
> > + * @config: Configuration to add the connector to
> > + *
> > + * Returns:
> > + * The new connector configuration or an error. Call
> > + * vkms_config_destroy_connector() to free the returned connector configuration.
> > + */
> > +struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *config);
> > +
> > +/**
> > + * vkms_config_destroy_connector() - Remove and free a connector configuration
> > + * @connector_cfg: Connector configuration to destroy
> > + */
> > +void vkms_config_destroy_connector(struct vkms_config_connector *connector_cfg);
> > +
> >   #endif /* _VKMS_CONFIG_H_ */
> > diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> > index ab8b52a84151..48b10cba322a 100644
> > --- a/drivers/gpu/drm/vkms/vkms_connector.c
> > +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> > @@ -25,8 +25,19 @@ static int vkms_conn_get_modes(struct drm_connector *connector)
> >   	return count;
> >   }
> > +static struct drm_encoder *vkms_conn_best_encoder(struct drm_connector *connector)
> > +{
> > +	struct drm_encoder *encoder;
> > +
> > +	drm_connector_for_each_possible_encoder(connector, encoder)
> > +		return encoder;
> > +
> > +	return NULL;
> > +}
> > +
> 
> Not for this series, but does it make sense to make the "best_encoder"
> configurable?

Yes, definitely something we can configure in the future. The "pick the
first one" algorithm leaves room for improvement.

Sending v4 with the requested changes :)

Jose

> Thanks,
> Louis Chauvet
> 
> >   static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
> >   	.get_modes    = vkms_conn_get_modes,
> > +	.best_encoder = vkms_conn_best_encoder,
> >   };
> >   struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
