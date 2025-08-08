Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49538B1E702
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 13:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CD510E934;
	Fri,  8 Aug 2025 11:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PQwWyevB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A3110E4EE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 11:15:07 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3b7961cf660so1643884f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 04:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754651706; x=1755256506; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Oyvm7P1ZFtjq65zarOKjNFSIARzaJMWgtQP6P25+KRY=;
 b=PQwWyevBwekh3U1hi/Rq/9M/YxaiaHmmsqjwxBPzE0RXeVK/a/JSANI1E59GrOj0/S
 cFfG2qpclXjlKU+WnBIsKVcRJRLa/U/L/qtV0CCyJkkHhqb9f62oQCR8v+c2s1J/6dcO
 gyvB/TFCBmNhbQ2IZSE2L5udMROZI0Ul8MdNGWtKyS6RyExsKg1pi9Um9NBhFc4IvVft
 V0/KFJ9lnPT5lR95UURK6+0TG4T3A11zHZX1tXgD5mafGSvAHZzsZvhis7Gx99C0Qjux
 0kDTa1FsbQheQsV3nr8sGHTag4/QNAAX0Sl5k7J0YvCk/WOZbDuYT76yHhjrtN+FMAtq
 AVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754651706; x=1755256506;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oyvm7P1ZFtjq65zarOKjNFSIARzaJMWgtQP6P25+KRY=;
 b=wu2q/CXvT0usnPZtfBFtYgQEoi8cgbS6Wroyq12Q1C7sxXl0ACAvu/921R3Gjh95tR
 IegUJjws8mQSnQo61EQnotxiPGeuLRRMBC6YfJbjZr82VpRgA9qgox9iXInZE+MHbOvY
 P461l7qjPv6rm6ZuP8bgfGhUPY4PWABWC3HMzGzFkQvzVpFJstqntfg2VB+yn5Kkm2AM
 amgiKkg9dheSRPvn7shggaL+/bGqLA1Z6xWtWdGNHVJjYaI/H0nKhUvpDbEphvxHyzKY
 88qtZFmi7hmqjfXM6XT6ecPA3hCfSCtOiOw2s7Nz1qzOXXxYH7Dm25SGPAAlO+kcNjJc
 XsMw==
X-Gm-Message-State: AOJu0YyHyN4DvNLgcXYaa2AQV46Ud01Rp0ybQxk5WGaQQ6arLTdJZGwU
 YFJxo5j1og22eKRGECsYQchjWb1g4mhJQhncuipU61X3YKKq8n2uVn2G
X-Gm-Gg: ASbGncsPL1mUhCq/I/Gln3EubMeKvRLssqyRTMwHdSahK2/UmjIMDMbrs2YFWv49v/n
 YWBckcno+PsVUXP7Upi7QTWtTDA0BdpduBvBWVEwwSvWej76lsv+z41prro1XWSgwAnxubeurq/
 I/gmJtxeQZG2wM6B3BipjDIe/gQr3Ebb7MaXfb0rVdlHCZTrAvnNcy7A7NL+1i4DOuPQ7VATeBU
 4X4MsbK23BVhqBhJJtjZNWzbMDinh/1Snt+Ac54sokMIvC6nr7sAgKOTPWzaZFWf4KeEoeDyLum
 iAy+hr9snf1o7wKnErFi4KnokPm0sve5w3fJxQCvci9XDJEiHOT3+DOsq3lzC+dSM/HI5WEM1sC
 K1hslAcJdDSRDhbD7dbQ=
X-Google-Smtp-Source: AGHT+IG/Ot6FcqqmWuBdlR2E7+hSE5miXRfaymk/6wxBokP0u7PU/w3dBqRglLlzQ3f5dgK8UPRV2A==
X-Received: by 2002:a05:6000:2485:b0:3b4:9721:2b2d with SMTP id
 ffacd0b85a97d-3b900b47149mr2294843f8f.9.1754651705538; 
 Fri, 08 Aug 2025 04:15:05 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e78a35cdsm56864995e9.3.2025.08.08.04.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 04:15:04 -0700 (PDT)
Date: Fri, 8 Aug 2025 13:15:03 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm/vkms: Allow to configure multiple CRTCs
Message-ID: <aJXcN52fxSF3XLeE@fedora>
References: <aJTL6IFEBaI8gqtH@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJTL6IFEBaI8gqtH@stanley.mountain>
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

Hi Dan,

Thanks for sharing these warnings.

On Thu, Aug 07, 2025 at 06:53:12PM +0300, Dan Carpenter wrote:
> Hello José Expósito,
> 
> Commit 600df32dac40 ("drm/vkms: Allow to configure multiple CRTCs")
> from Feb 18, 2025 (linux-next), leads to the following Smatch static
> checker warning:
> 
> drivers/gpu/drm/vkms/tests/vkms_config_test.c:220 vkms_config_test_get_planes() error: 'plane_cfg1' dereferencing possible ERR_PTR()
> drivers/gpu/drm/vkms/tests/vkms_config_test.c:258 vkms_config_test_get_crtcs() error: 'crtc_cfg2' dereferencing possible ERR_PTR()
> drivers/gpu/drm/vkms/tests/vkms_config_test.c:300 vkms_config_test_get_encoders() error: 'encoder_cfg2' dereferencing possible ERR_PTR()
> drivers/gpu/drm/vkms/tests/vkms_config_test.c:345 vkms_config_test_get_connectors() error: 'connector_cfg2' dereferencing possible ERR_PTR()
> drivers/gpu/drm/vkms/tests/vkms_config_test.c:672 vkms_config_test_plane_attach_crtc() error: 'overlay_cfg' dereferencing possible ERR_PTR()
> drivers/gpu/drm/vkms/tests/vkms_config_test.c:674 vkms_config_test_plane_attach_crtc() error: 'primary_cfg' dereferencing possible ERR_PTR()
> drivers/gpu/drm/vkms/tests/vkms_config_test.c:676 vkms_config_test_plane_attach_crtc() error: 'cursor_cfg' dereferencing possible ERR_PTR()
> drivers/gpu/drm/vkms/tests/vkms_config_test.c:685 vkms_config_test_plane_attach_crtc() error: 'crtc_cfg' dereferencing possible ERR_PTR()
> drivers/gpu/drm/vkms/tests/vkms_config_test.c:746 vkms_config_test_plane_get_possible_crtcs() error: 'crtc_cfg1' dereferencing possible ERR_PTR()
> drivers/gpu/drm/vkms/tests/vkms_config_test.c:746 vkms_config_test_plane_get_possible_crtcs() error: 'plane_cfg1' dereferencing possible ERR_PTR()
> drivers/gpu/drm/vkms/tests/vkms_config_test.c:748 vkms_config_test_plane_get_possible_crtcs() error: 'crtc_cfg2' dereferencing possible ERR_PTR()
> drivers/gpu/drm/vkms/tests/vkms_config_test.c:810 vkms_config_test_encoder_get_possible_crtcs() error: 'crtc_cfg1' dereferencing possible ERR_PTR()
> drivers/gpu/drm/vkms/tests/vkms_config_test.c:810 vkms_config_test_encoder_get_possible_crtcs() error: 'encoder_cfg1' dereferencing possible ERR_PTR()
> drivers/gpu/drm/vkms/tests/vkms_config_test.c:812 vkms_config_test_encoder_get_possible_crtcs() error: 'crtc_cfg2' dereferencing possible ERR_PTR()
> drivers/gpu/drm/vkms/tests/vkms_config_test.c:876 vkms_config_test_connector_get_possible_encoders() error: 'connector_cfg1' dereferencing possible ERR_PTR()
> drivers/gpu/drm/vkms/tests/vkms_config_test.c:876 vkms_config_test_connector_get_possible_encoders() error: 'encoder_cfg1' dereferencing possible ERR_PTR()
> drivers/gpu/drm/vkms/tests/vkms_config_test.c:878 vkms_config_test_connector_get_possible_encoders() error: 'encoder_cfg2' dereferencing possible ERR_PTR()
> 
> drivers/gpu/drm/vkms/tests/vkms_config_test.c
>     231 static void vkms_config_test_get_crtcs(struct kunit *test)
>     232 {
>     233         struct vkms_config *config;
>     234         struct vkms_config_crtc *crtc_cfg;
>     235         struct vkms_config_crtc *crtc_cfg1, *crtc_cfg2;
>     236 
>     237         config = vkms_config_create("test");
>     238         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
>     239 
>     240         KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 0);
>     241         vkms_config_for_each_crtc(config, crtc_cfg)
>     242                 KUNIT_FAIL(test, "Unexpected CRTC");
>     243 
>     244         crtc_cfg1 = vkms_config_create_crtc(config);
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This file has no error checking.
> 
> I didn't send an email about it at first because this is just test code so
> who cares, but I was recently burned by ignoring errors so now I'm going
> through a bunch of old warnings to say that, "Hey, if the author ignores the
> error checking that's fine, but I'm in the clear."
> 
>     245         KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 1);

While the "crtc_cfg1" pointer is not checked, we check that the	number 
of CRTCs matches the expected value and...

>     246         vkms_config_for_each_crtc(config, crtc_cfg) {
>     247                 if (crtc_cfg != crtc_cfg1)
>     248                         KUNIT_FAIL(test, "Unexpected CRTC");
>     249         }

...that the stored CRTC matches the one returned by vkms_config_create_crtc().

By program logic, vkms_config_create_crtc() returns an error if allocation
fails:

```
struct vkms_config_crtc *vkms_config_create_crtc(struct vkms_config *config)
{
	struct vkms_config_crtc *crtc_cfg;

	crtc_cfg = kzalloc(sizeof(*crtc_cfg), GFP_KERNEL);
	if (!crtc_cfg)
		return ERR_PTR(-ENOMEM);
```

Therefore, the current validations make sure that the pointer is valid.

In other places, for example vkms_config_test_connector_get_possible_encoders(),
the return value of vkms_config_create_connector/encoder() is indeed not
checked. It is not a big deal, since it is test code, but anyways, I'll send a
patch checking for return values.

Not because I think it can be problematic, but because test code can be used to
learn how the API works and I prefer to be explicit about its usage.

Best wishes,
Jose

>     250 
>     251         crtc_cfg2 = vkms_config_create_crtc(config);
>     252         KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 2);
>     253         vkms_config_for_each_crtc(config, crtc_cfg) {
>     254                 if (crtc_cfg != crtc_cfg1 && crtc_cfg != crtc_cfg2)
>     255                         KUNIT_FAIL(test, "Unexpected CRTC");
>     256         }
>     257 
> --> 258         vkms_config_destroy_crtc(config, crtc_cfg2);
>     259         KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 1);
>     260         vkms_config_for_each_crtc(config, crtc_cfg) {
>     261                 if (crtc_cfg != crtc_cfg1)
>     262                         KUNIT_FAIL(test, "Unexpected CRTC");
>     263         }
>     264 
>     265         vkms_config_destroy(config);
>     266 }
> 
> regards,
> dan carpenter
