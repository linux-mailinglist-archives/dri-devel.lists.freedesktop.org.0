Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA417A34108
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 14:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C1510EAB8;
	Thu, 13 Feb 2025 13:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PdQoq6tN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FD410EAB6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 13:59:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44471443C8;
 Thu, 13 Feb 2025 13:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1739455167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y3ZXg9PRTnu3UfqlDGfEApIodFauXcnVcL01mXWvfzY=;
 b=PdQoq6tNgltZ/H6eH8SWxAuEixjjl3Y6vqvqJ7bTKqHsIWxVkaDq4m/MUPDKyBTGz5O1c7
 gCIspLK4QMiK4sTYXriwlpOc5ig3GPIzRyrW94hEC34byTZiAxYOeByBpc0lONElpPMNF6
 NHAWUyUVftGp2VUGzDqhfDwBAdaBH2DAE/Z3YBa5EU3BSsmuy9Z+GiRrheHjECU0HIu85Q
 9zn/rTlq9nOHV4xhdN4/p8xUB2eu2oOGBtX2J7Y83MQknChm64cNRI6oa6hFRctMerIeq5
 cvmmmFHC+lsG9Qr4MlVE6LdgfF/7m9EgshBxZ+zIUTCA3ueak0yayxR233hsZg==
Date: Thu, 13 Feb 2025 14:59:25 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/15] drm/vkms: Allow to attach encoders and CRTCs
Message-ID: <Z636vUrKlPtPP3yq@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250211110912.15409-1-jose.exposito89@gmail.com>
 <20250211110912.15409-14-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211110912.15409-14-jose.exposito89@gmail.com>
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
> Add a list of possible CRTCs to the encoder configuration and helpers to
> attach and detach them.
> 
> Now that the default configuration has its encoder and CRTC correctly
> attached, configure the output following the configuration.
> 
> Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Build is broken when compiling VKMS as a module:

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index fdb535be912a..a5e77c752da3 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -497,6 +497,7 @@ int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *enc
        return xa_alloc(&encoder_cfg->possible_crtcs, &crtc_idx, crtc_cfg,
                        xa_limit_32b, GFP_KERNEL);
 }
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_encoder_attach_crtc);

 void vkms_config_encoder_detach_crtc(struct vkms_config_encoder *encoder_cfg,
                                     struct vkms_config_crtc *crtc_cfg)
@@ -509,3 +510,4 @@ void vkms_config_encoder_detach_crtc(struct vkms_config_encoder *encoder_cfg,
                        xa_erase(&encoder_cfg->possible_crtcs, idx);
        }
 }
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_encoder_detach_crtc);


> ---
>  .clang-format                                 |   1 +
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c | 115 ++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.c            |  77 ++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.h            |  29 +++++
>  drivers/gpu/drm/vkms/vkms_output.c            |  49 +++++---
>  5 files changed, 251 insertions(+), 20 deletions(-)
> 
> diff --git a/.clang-format b/.clang-format
> index c355a2f58eed..5d21c0e4edbd 100644
> --- a/.clang-format
> +++ b/.clang-format
> @@ -693,6 +693,7 @@ ForEachMacros:
>    - 'vkms_config_for_each_crtc'
>    - 'vkms_config_for_each_encoder'
>    - 'vkms_config_for_each_plane'
> +  - 'vkms_config_encoder_for_each_possible_crtc'
>    - 'vkms_config_plane_for_each_possible_crtc'
>    - 'while_for_each_ftrace_op'
>    - 'xa_for_each'
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index 0bb76a1e6c79..7458d175acb6 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -260,6 +260,7 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
>  	struct vkms_config *config;
>  	struct vkms_config_plane *plane_cfg;
>  	struct vkms_config_crtc *crtc_cfg;
> +	struct vkms_config_encoder *encoder_cfg;
>  	int err;
>  
>  	config = vkms_config_default_create(false, false, false);
> @@ -313,6 +314,9 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
>  
>  	/* Invalid: Second CRTC without primary plane */
>  	crtc_cfg = vkms_config_create_crtc(config);
> +	encoder_cfg = vkms_config_create_encoder(config);
> +	err = vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg);
> +	KUNIT_EXPECT_EQ(test, err, 0);
>  	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
>  
>  	/* Valid: Second CRTC with a primary plane */
> @@ -390,6 +394,51 @@ static void vkms_config_test_invalid_encoder_number(struct kunit *test)
>  	vkms_config_destroy(config);
>  }
>  
> +static void vkms_config_test_valid_encoder_possible_crtcs(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	struct vkms_config_plane *plane_cfg;
> +	struct vkms_config_crtc *crtc_cfg1, *crtc_cfg2;
> +	struct vkms_config_encoder *encoder_cfg;
> +	int err;
> +
> +	config = vkms_config_default_create(false, false, false);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	crtc_cfg1 = list_first_entry(&config->crtcs, typeof(*crtc_cfg1), link);
> +
> +	/* Invalid: Encoder without a possible CRTC */
> +	encoder_cfg = vkms_config_create_encoder(config);
> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> +
> +	/* Valid: Second CRTC with shared encoder */
> +	crtc_cfg2 = vkms_config_create_crtc(config);
> +
> +	plane_cfg = vkms_config_create_plane(config);
> +	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
> +	err = vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg2);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +
> +	err = vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg1);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +
> +	err = vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg2);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +
> +	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
> +
> +	/* Invalid: Second CRTC without encoders */
> +	vkms_config_encoder_detach_crtc(encoder_cfg, crtc_cfg2);
> +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> +
> +	/* Valid: First CRTC with 2 possible encoder */
> +	vkms_config_destroy_plane(plane_cfg);
> +	vkms_config_destroy_crtc(config, crtc_cfg2);
> +	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
> +
> +	vkms_config_destroy(config);
> +}
> +
>  static void vkms_config_test_plane_attach_crtc(struct kunit *test)
>  {
>  	struct vkms_config *config;
> @@ -515,6 +564,70 @@ static void vkms_config_test_plane_get_possible_crtcs(struct kunit *test)
>  	vkms_config_destroy(config);
>  }
>  
> +static void vkms_config_test_encoder_get_possible_crtcs(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	struct vkms_config_encoder *encoder_cfg1, *encoder_cfg2;
> +	struct vkms_config_crtc *crtc_cfg1, *crtc_cfg2;
> +	struct vkms_config_crtc *possible_crtc;
> +	unsigned long idx = 0;
> +	int n_crtcs = 0;
> +	int err;
> +
> +	config = vkms_config_create("test");
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	encoder_cfg1 = vkms_config_create_encoder(config);
> +	encoder_cfg2 = vkms_config_create_encoder(config);
> +	crtc_cfg1 = vkms_config_create_crtc(config);
> +	crtc_cfg2 = vkms_config_create_crtc(config);
> +
> +	/* No possible CRTCs */
> +	vkms_config_encoder_for_each_possible_crtc(encoder_cfg1, idx, possible_crtc)
> +		KUNIT_FAIL(test, "Unexpected possible CRTC");
> +
> +	vkms_config_encoder_for_each_possible_crtc(encoder_cfg2, idx, possible_crtc)
> +		KUNIT_FAIL(test, "Unexpected possible CRTC");
> +
> +	/* Encoder 1 attached to CRTC 1 and 2 */
> +	err = vkms_config_encoder_attach_crtc(encoder_cfg1, crtc_cfg1);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	err = vkms_config_encoder_attach_crtc(encoder_cfg1, crtc_cfg2);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +
> +	vkms_config_encoder_for_each_possible_crtc(encoder_cfg1, idx, possible_crtc) {
> +		n_crtcs++;
> +		if (possible_crtc != crtc_cfg1 && possible_crtc != crtc_cfg2)
> +			KUNIT_FAIL(test, "Unexpected possible CRTC");
> +	}
> +	KUNIT_ASSERT_EQ(test, n_crtcs, 2);
> +	n_crtcs = 0;
> +
> +	vkms_config_encoder_for_each_possible_crtc(encoder_cfg2, idx, possible_crtc)
> +		KUNIT_FAIL(test, "Unexpected possible CRTC");
> +
> +	/* Encoder 1 attached to CRTC 1 and encoder 2 to CRTC 2 */
> +	vkms_config_encoder_detach_crtc(encoder_cfg1, crtc_cfg2);
> +	vkms_config_encoder_for_each_possible_crtc(encoder_cfg1, idx, possible_crtc) {
> +		n_crtcs++;
> +		if (possible_crtc != crtc_cfg1)
> +			KUNIT_FAIL(test, "Unexpected possible CRTC");
> +	}
> +	KUNIT_ASSERT_EQ(test, n_crtcs, 1);
> +	n_crtcs = 0;
> +
> +	err = vkms_config_encoder_attach_crtc(encoder_cfg2, crtc_cfg2);
> +	KUNIT_EXPECT_EQ(test, err, 0);
> +	vkms_config_encoder_for_each_possible_crtc(encoder_cfg2, idx, possible_crtc) {
> +		n_crtcs++;
> +		if (possible_crtc != crtc_cfg2)
> +			KUNIT_FAIL(test, "Unexpected possible CRTC");
> +	}
> +	KUNIT_ASSERT_EQ(test, n_crtcs, 1);
> +
> +	vkms_config_destroy(config);
> +}
> +
>  static struct kunit_case vkms_config_test_cases[] = {
>  	KUNIT_CASE(vkms_config_test_empty_config),
>  	KUNIT_CASE_PARAM(vkms_config_test_default_config,
> @@ -527,8 +640,10 @@ static struct kunit_case vkms_config_test_cases[] = {
>  	KUNIT_CASE(vkms_config_test_valid_plane_possible_crtcs),
>  	KUNIT_CASE(vkms_config_test_invalid_crtc_number),
>  	KUNIT_CASE(vkms_config_test_invalid_encoder_number),
> +	KUNIT_CASE(vkms_config_test_valid_encoder_possible_crtcs),
>  	KUNIT_CASE(vkms_config_test_plane_attach_crtc),
>  	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
> +	KUNIT_CASE(vkms_config_test_encoder_get_possible_crtcs),
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 0cf6105fe743..f727c0009489 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -84,6 +84,9 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  	if (IS_ERR(encoder_cfg))
>  		goto err_alloc;
>  
> +	if (vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg))
> +		goto err_alloc;
> +
>  	return config;
>  
>  err_alloc:
> @@ -212,6 +215,42 @@ static bool valid_encoder_number(struct vkms_config *config)
>  	return true;
>  }
>  
> +static bool valid_encoder_possible_crtcs(struct vkms_config *config)
> +{
> +	struct drm_device *dev = &config->dev->drm;

Ditto

> +	struct vkms_config_crtc *crtc_cfg;
> +	struct vkms_config_encoder *encoder_cfg;
> +
> +	vkms_config_for_each_encoder(config, encoder_cfg) {
> +		if (xa_empty(&encoder_cfg->possible_crtcs)) {
> +			drm_info(dev, "All encoders must have at least one possible CRTC\n");
> +			return false;
> +		}
> +	}
> +
> +	vkms_config_for_each_crtc(config, crtc_cfg) {
> +		bool crtc_has_encoder = false;
> +
> +		vkms_config_for_each_encoder(config, encoder_cfg) {
> +			struct vkms_config_crtc *possible_crtc;
> +			unsigned long idx = 0;
> +
> +			vkms_config_encoder_for_each_possible_crtc(encoder_cfg,
> +								   idx, possible_crtc) {
> +				if (possible_crtc == crtc_cfg)
> +					crtc_has_encoder = true;
> +			}
> +		}
> +
> +		if (!crtc_has_encoder) {
> +			drm_info(dev, "All CRTCs must have at least one possible encoder\n");
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
> @@ -233,6 +272,9 @@ bool vkms_config_is_valid(struct vkms_config *config)
>  			return false;
>  	}
>  
> +	if (!valid_encoder_possible_crtcs(config))
> +		return false;
> +
>  	return true;
>  }
>  
> @@ -347,10 +389,14 @@ void vkms_config_destroy_crtc(struct vkms_config *config,
>  			      struct vkms_config_crtc *crtc_cfg)
>  {
>  	struct vkms_config_plane *plane_cfg;
> +	struct vkms_config_encoder *encoder_cfg;
>  
>  	vkms_config_for_each_plane(config, plane_cfg)
>  		vkms_config_plane_detach_crtc(plane_cfg, crtc_cfg);
>  
> +	vkms_config_for_each_encoder(config, encoder_cfg)
> +		vkms_config_encoder_detach_crtc(encoder_cfg, crtc_cfg);
> +
>  	list_del(&crtc_cfg->link);
>  	kfree(crtc_cfg);
>  }
> @@ -406,6 +452,8 @@ struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *confi
>  	if (!encoder_cfg)
>  		return ERR_PTR(-ENOMEM);
>  
> +	xa_init_flags(&encoder_cfg->possible_crtcs, XA_FLAGS_ALLOC);
> +
>  	list_add_tail(&encoder_cfg->link, &config->encoders);
>  
>  	return encoder_cfg;
> @@ -414,6 +462,35 @@ struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *confi
>  void vkms_config_destroy_encoder(struct vkms_config *config,
>  				 struct vkms_config_encoder *encoder_cfg)
>  {
> +	xa_destroy(&encoder_cfg->possible_crtcs);
>  	list_del(&encoder_cfg->link);
>  	kfree(encoder_cfg);
>  }
> +
> +int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *encoder_cfg,
> +						 struct vkms_config_crtc *crtc_cfg)
> +{
> +	struct vkms_config_crtc *possible_crtc;
> +	unsigned long idx = 0;
> +	u32 crtc_idx = 0;
> +
> +	vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx, possible_crtc) {
> +		if (possible_crtc == crtc_cfg)
> +			return -EINVAL;
> +	}
> +
> +	return xa_alloc(&encoder_cfg->possible_crtcs, &crtc_idx, crtc_cfg,
> +			xa_limit_32b, GFP_KERNEL);
> +}
> +
> +void vkms_config_encoder_detach_crtc(struct vkms_config_encoder *encoder_cfg,
> +				     struct vkms_config_crtc *crtc_cfg)
> +{
> +	struct vkms_config_crtc *possible_crtc;
> +	unsigned long idx = 0;
> +
> +	vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx, possible_crtc) {
> +		if (possible_crtc == crtc_cfg)
> +			xa_erase(&encoder_cfg->possible_crtcs, idx);
> +	}
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 2ba80c4c9ce5..28c24afebe1e 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -71,6 +71,7 @@ struct vkms_config_crtc {
>   * struct vkms_config_encoder
>   *
>   * @link: Link to the others encoders in vkms_config
> + * @possible_crtcs: Array of CRTCs that can be used with this encoder
>   * @encoder: Internal usage. This pointer should never be considered as valid.
>   *           It can be used to store a temporary reference to a VKMS encoder
>   *           during device creation. This pointer is not managed by the
> @@ -79,6 +80,8 @@ struct vkms_config_crtc {
>  struct vkms_config_encoder {
>  	struct list_head link;
>  
> +	struct xarray possible_crtcs;
> +
>  	/* Internal usage */
>  	struct drm_encoder *encoder;
>  };
> @@ -117,6 +120,16 @@ struct vkms_config_encoder {
>  #define vkms_config_plane_for_each_possible_crtc(plane_cfg, idx, possible_crtc) \
>  	xa_for_each(&(plane_cfg)->possible_crtcs, idx, (possible_crtc))
>  
> +/**
> + * vkms_config_encoder_for_each_possible_crtc - Iterate over the
> + * vkms_config_encoder possible CRTCs
> + * @encoder_cfg: &struct vkms_config_encoder pointer
> + * @idx: Index of the cursor
> + * @possible_crtc: &struct vkms_config_crtc pointer used as cursor
> + */
> +#define vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx, possible_crtc) \
> +	xa_for_each(&(encoder_cfg)->possible_crtcs, idx, (possible_crtc))
> +
>  /**
>   * vkms_config_create() - Create a new VKMS configuration
>   * @dev_name: Name of the device
> @@ -326,4 +339,20 @@ struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *confi
>  void vkms_config_destroy_encoder(struct vkms_config *config,
>  				 struct vkms_config_encoder *encoder_cfg);
>  
> +/**
> + * vkms_config_encoder_attach_crtc - Attach a encoder to a CRTC
> + * @encoder_cfg: Encoder to attach
> + * @crtc_cfg: CRTC to attach @encoder_cfg to
> + */
> +int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *encoder_cfg,
> +						 struct vkms_config_crtc *crtc_cfg);
> +
> +/**
> + * vkms_config_encoder_detach_crtc - Detach a encoder from a CRTC
> + * @encoder_cfg: Encoder to detach
> + * @crtc_cfg: CRTC to detach @encoder_cfg from
> + */
> +void vkms_config_encoder_detach_crtc(struct vkms_config_encoder *encoder_cfg,
> +				     struct vkms_config_crtc *crtc_cfg);
> +
>  #endif /* _VKMS_CONFIG_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index f63bc8e3014b..8920d6b5d105 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -9,9 +9,9 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct vkms_connector *connector;
> -	struct drm_encoder *encoder;
>  	struct vkms_config_plane *plane_cfg;
>  	struct vkms_config_crtc *crtc_cfg;
> +	struct vkms_config_encoder *encoder_cfg;
>  	int ret;
>  	int writeback;
>  
> @@ -61,32 +61,41 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  		}
>  	}
>  
> +	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg) {
> +		struct vkms_config_crtc *possible_crtc;
> +		unsigned long idx = 0;
> +
> +		encoder_cfg->encoder = drmm_kzalloc(dev, sizeof(*encoder_cfg->encoder), GFP_KERNEL);
> +		if (!encoder_cfg->encoder) {
> +			DRM_ERROR("Failed to allocate encoder\n");
> +			return -ENOMEM;
> +		}
> +		ret = drmm_encoder_init(dev, encoder_cfg->encoder, NULL,
> +					DRM_MODE_ENCODER_VIRTUAL, NULL);
> +		if (ret) {
> +			DRM_ERROR("Failed to init encoder\n");
> +			return ret;
> +		}
> +
> +		vkms_config_encoder_for_each_possible_crtc(encoder_cfg, idx, possible_crtc) {
> +			encoder_cfg->encoder->possible_crtcs |=
> +				drm_crtc_mask(&possible_crtc->crtc->crtc);
> +		}
> +	}
> +
>  	connector = vkms_connector_init(vkmsdev);
>  	if (IS_ERR(connector)) {
>  		DRM_ERROR("Failed to init connector\n");
>  		return PTR_ERR(connector);
>  	}
>  
> -	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
> -	if (!encoder) {
> -		DRM_ERROR("Failed to allocate encoder\n");
> -		return -ENOMEM;
> -	}
> -	ret = drmm_encoder_init(dev, encoder, NULL,
> -				DRM_MODE_ENCODER_VIRTUAL, NULL);
> -	if (ret) {
> -		DRM_ERROR("Failed to init encoder\n");
> -		return ret;
> -	}
> -
> -	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg)
> -		encoder->possible_crtcs = drm_crtc_mask(&crtc_cfg->crtc->crtc);
> -
>  	/* Attach the encoder and the connector */
> -	ret = drm_connector_attach_encoder(&connector->base, encoder);
> -	if (ret) {
> -		DRM_ERROR("Failed to attach connector to encoder\n");
> -		return ret;
> +	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg) {
> +		ret = drm_connector_attach_encoder(&connector->base, encoder_cfg->encoder);
> +		if (ret) {
> +			DRM_ERROR("Failed to attach connector to encoder\n");
> +			return ret;
> +		}
>  	}
>  
>  	drm_mode_config_reset(dev);
> -- 
> 2.48.1
> 
