Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FFCA308FC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 11:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B1410E645;
	Tue, 11 Feb 2025 10:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fqhxQnU6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD03810E645
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 10:44:40 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so15418255e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 02:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739270679; x=1739875479; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kJcFMQJvlRYWjrCqI8QX/Ukpl5nZX3icPZpoJRtpLMo=;
 b=fqhxQnU6/m9oWDQIuzZme32ofOW3esoa5YCnrzluyR6NyfDTcRcljI9vTr/2HCfvmK
 L5s4aajNw6v44ZUNJaD+5KHEpn0mw48WMJsdgN/K7ccbuD+cI5ICIKrh6VKIy703m6vA
 /pjbupXuuRpMljz09GNpqNhg8XrUZ9ZF95quvkSKP4t13X+YNirjHdfTRtvvMK6SZtlk
 +F4HIOaBZ6jSYxUjm7O8HVfxV/1I+rvCG6uVsCyS3kl4HxBBNHxR4KXFUqWq/O5adMAk
 j3IcWa0YWBliJu1IgzTZqxGF48qOEbtbS43sASUtCLCD6A0adkpeecFFINK6TdjrRVL4
 8bvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739270679; x=1739875479;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kJcFMQJvlRYWjrCqI8QX/Ukpl5nZX3icPZpoJRtpLMo=;
 b=wDLCPx66sGxaPp4BfNhWJt7TpU55LeNvmfmcnmOHwa+VAed3dm3U8uUt2m+d/1YaYp
 coGAzRMXRrRDeCkiDEosM1qvT2A9GuQleFiGee0NooLD04xC5zcm9x7+Uto2089IIeWo
 vxCMnYfrHNACcqnxodia9KaW7NKQnRPyUBVabypTc/uGj4g1u/VbV5M6xPS2nW12LzWT
 N67kNoJXYguHqv5XRYumRjY0LbDC3bRP1Mdvbe0ud9o/4UdEpwqhRKPE4b/ao8zd5ok1
 KLvtuKjRumgczu0qs/iGWcEGJWc+TWi8FpOhWwVyyOJSICIjGQg12G7+BCzq9gjIzhUN
 ao7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc3SCaYzhjErkKnHNV7nAdJ97/zDb4H9RDshpF4qqtHwnRUJ9lP2Jxl1aOBBb7ASObRIkPYxh7AzY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+a1WS/I4J+VsAH553S3oQgDXpcE52IrkSh8nwq7eb/O1HkdXW
 go38p6626qIWGyHKvGwxQnmy2O3ofAiI1tfc9pqsOmhdumuENCUk
X-Gm-Gg: ASbGncsZTp0jrRRt5f7qrlQnBEkVnZ6J7pbI1N2mHokaE5711O7wBRXKiNdq8S0E2y6
 w0J5udPClHhbYRymOdNPJBLMa8sU4FkPxZl2qEDEEG1uuUYEi8XdMeiZGmBvgg+sMqLSiwI6p51
 ok5YUZPsldFWRADiNHCtXmYw2wDjbtEUdRxvItQ2FgmyxjaETaZ40M9yHQoBD15KM1LvJZmqb1s
 V7owUoB5wDTkvpRCLhiB+8UR0uRx4Kjap7ORrhUkqbt8tcQv5iGvC5xisZWcoueJA6+/pEAdYqe
 VO6yNojEz/RMSA==
X-Google-Smtp-Source: AGHT+IG+NM23xq1Gg1pDDKGgZB+1gTyiM2grB+zK5t5NeWTG07g3GKXCcgUgvelC4ZDkV8YcysruPg==
X-Received: by 2002:a05:600c:4e13:b0:434:9499:9e87 with SMTP id
 5b1f17b1804b1-4394c8538fdmr25448345e9.25.1739270679131; 
 Tue, 11 Feb 2025 02:44:39 -0800 (PST)
Received: from fedora ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da965b3sm178045935e9.5.2025.02.11.02.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 02:44:38 -0800 (PST)
Date: Tue, 11 Feb 2025 11:44:37 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/13] drm/vkms: Allow to configure multiple CRTCs
Message-ID: <Z6sqFdvtwSxHD-FO@fedora>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-9-jose.exposito89@gmail.com>
 <Z5uDJFHnn1HzWOz4@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5uDJFHnn1HzWOz4@louis-chauvet-laptop>
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

On Thu, Jan 30, 2025 at 02:48:20PM +0100, Louis Chauvet wrote:
> On 29/01/25 - 12:00, José Expósito wrote:
> > Add a list of CRTCs to vkms_config and helper functions to add and
> > remove as many CRTCs as wanted.
> > 
> > For backwards compatibility, add one CRTC to the default configuration.
> > 
> > A future patch will allow to attach planes and CRTCs, but for the
> > moment there are no changes in the way the output is configured.
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
> > +static void vkms_config_test_valid_crtc_number(struct kunit *test)
> > +{
> > +	struct vkms_config *config;
> > +	struct vkms_config_crtc *crtc_cfg;
> > +	int n;
> > +
> > +	config = vkms_config_default_create(false, false, false);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> > +
> > +	/* Invalid: No CRTCs */
> > +	crtc_cfg = list_first_entry(&config->crtcs, typeof(*crtc_cfg), link);
> > +	vkms_config_destroy_crtc(config, crtc_cfg);
> > +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> > +
> > +	/* Invalid: Too many CRTCs */
> > +	for (n = 0; n <= 32; n++)
> > +		vkms_config_add_crtc(config);
> > +
> > +	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
> > +
> > +	vkms_config_destroy(config);
> > +}
> 
> Same as before, can you rename the fonction to 
> vkms_config_test_invalid_crtc_number
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> 
> [...]
> 
> > +struct vkms_config_crtc **vkms_config_get_crtcs(const struct vkms_config *config,
> > +						size_t *out_length)
> > +{
> > +	struct vkms_config_crtc **array;
> > +	struct vkms_config_crtc *crtc_cfg;
> > +	size_t length;
> > +	int n = 0;
> > +
> > +	length = list_count_nodes((struct list_head *)&config->crtcs);
> > +	if (length == 0) {
> > +		*out_length = length;
> > +		return NULL;
> > +	}
> > +
> > +	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
> > +	if (!array)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	list_for_each_entry(crtc_cfg, &config->crtcs, link) {
> > +		array[n] = crtc_cfg;
> > +		n++;
> > +	}
> > +
> > +	*out_length = length;
> > +	return array;
> > +}
> 
> Same as before, can't we use an iterator?
> 
> [...]
> 
> > +static bool valid_crtc_number(struct vkms_config *config)
> > +{
> > +	size_t n_crtcs;
> > +
> > +	n_crtcs = list_count_nodes(&config->crtcs);
> > +	if (n_crtcs <= 0 || n_crtcs >= 32) {
> > +		pr_err("The number of CRTCs must be between 1 and 31\n");
> 
> I agree we need some logs, but I think pr_err is too agressive (i.e may 
> be considered as an error by some test tools).
> 
> I think we should at least:
> - lower to warn/notice/info
> - use drm variants of the macro
> 
> > +		return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> 
> [...]
> 
> > +struct vkms_config_crtc *vkms_config_add_crtc(struct vkms_config *config)
> > +{
> > +	struct vkms_config_crtc *crtc_cfg;
> > +
> > +	crtc_cfg = kzalloc(sizeof(*crtc_cfg), GFP_KERNEL);
> > +	if (!crtc_cfg)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	vkms_config_crtc_set_writeback(crtc_cfg, false);
> > +
> > +	list_add_tail(&crtc_cfg->link, &config->crtcs);
> > +
> > +	return crtc_cfg;
> > +}
> > +
> > +void vkms_config_destroy_crtc(struct vkms_config *config,
> > +			      struct vkms_config_crtc *crtc_cfg)
> > +{
> > +	list_del(&crtc_cfg->link);
> > +	kfree(crtc_cfg);
> > +}
> 
> Same as before, the pair add/destroy seems strange.
> 
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -181,7 +181,8 @@ static int vkms_create(struct vkms_config *config)
> >  		goto out_devres;
> >  	}
> >  
> > -	ret = drm_vblank_init(&vkms_device->drm, 1);
> > +	ret = drm_vblank_init(&vkms_device->drm,
> > +			      vkms_config_get_num_crtcs(config));
> 
> At this point we only create one crtc, can you move this change in the 
> commit where you create multiple crtc?

Since the code to add more than one CRTCs is unused but technically present, I
think that this is the right patch to use this function.

Anyway, at the moment it'll always return 1, so it is a no-op.

I didn't change it in v2, let me know if it works for you.

Thanks,
Jose

> >  	if (ret) {
> >  		DRM_ERROR("Failed to vblank\n");
> >  		goto out_devres;
> > -- 
> > 2.48.1
> > 
