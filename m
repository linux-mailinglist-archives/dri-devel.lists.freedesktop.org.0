Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A8DB1DB10
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 17:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E210A10E176;
	Thu,  7 Aug 2025 15:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YXf51qwN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AB010E176
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 15:53:18 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3b780bdda21so872208f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 08:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754581997; x=1755186797; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WvII+zUDknqjS5JcimNsTY4Y4kklvPHkYjf+HM2R1gI=;
 b=YXf51qwNZFWRiubafEuqCGEByKYrRiM3++zh63rhn2q2CpbxbhWmiyqQCYNZJcugNT
 OSIvreZXANBkRSGzXKdQZgO7X43SiJRdlMJnWRF4Wn1fDwJ7tnznvHUoH2xGX8Brh+Jn
 pLPvGsX04u7OfHTHpWs0Ba7bzTpMKwrBPeaeqv+lSkS3pn5/+LS3DRKk9NC4taJC8iTB
 SNIEYRnRfLEQVwcNtz+IexwTBMTspg40K9uM14YouJO6cYTNVRLeRs26k3/sahAnth60
 BBcJrqZXKEe9sM4yNU8lNaHkwZf/sMgB2iWl9bAQXeByWzNeJbh2nDG753Cstql44yt6
 v20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754581997; x=1755186797;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WvII+zUDknqjS5JcimNsTY4Y4kklvPHkYjf+HM2R1gI=;
 b=wt4ABdaOA2own9E9wY2fL+rIBOlSJJuyl2XSzw3zvdQ4Nn8AfDUIGzbDI9vuYqZkBO
 vZAsV2CmojHwzn3En3Z/XWSPYQ7TISrNBAgCGQineuQ5paLBE5lzV3tyxagBW8xHOBz4
 eXNRGpqO16sLnQt+O/7PmS4JgR1gT1lX7dVdeYjr7o8C2wE9CpjWExXN5HaD3jSBgTRa
 XWmCCj/UrrSPjEly6LJ9ebK7OrJwVbQlU4y4KAu7vb5Zavem+nD1aU00hN489PFNbRqz
 dh2nN0LN+EBLO4SvpdmtUv5mYhygI2hnLHiG1Us20RjmUv1iNrYRoLq2RuophPtUDrmH
 UT0A==
X-Gm-Message-State: AOJu0YyGmKkAJ/TdqLxY/+nCeUDByi1+UOIGxXiweDyudHzVi0pPpMHH
 8B7CNIwF4yPsw9FIPHwANIsXAYlOIRyKvCj5Mw6C9zqwFIGdVPHpL8N/LAleMn3F+4o=
X-Gm-Gg: ASbGncvefeYN6dqq5AAqc9s2XwsrqjRxW+JGUE8IKKNZAlAhFrGUBGnf5FliL5wgBZW
 wa7x2XVxoxe1Lg507YbmrQy5Aj7Y++Z1z8IjM8EHxTO6T+yl9HYulihxIThYMoprzjC4D/1a6ey
 UrWM62DrpTzIhydzGB9VP7rOhSJCRZNDPAfGvuqF5QCDNapj5mTvUCUr+veOYwelXTOpTSe1Tnz
 w3FhlDmjjn805nNN9ZsdwzMcB3EVJqJyyCstUzw2R7IHk5PcMLxXmfz8npR8G6Y7PTmjirED0mO
 ojVjG6SAAloNkt+W8tuaSfVI9FPbeFyT5rf3KuSDTj4hQFGRS8px5aGdGo1JlIX91yUq1kkqOok
 tgppQOImxEL5pId4WB13Cu2U3T6I=
X-Google-Smtp-Source: AGHT+IFyGQuDQXqMc09cXvu/kKtkZkMqJRyMZtZFFdw2rc0z4iEZBZdCrOJdxbr5dbGAxHh0i/+V5w==
X-Received: by 2002:a05:6000:250a:b0:3b3:c4b1:a212 with SMTP id
 ffacd0b85a97d-3b8f48de6d4mr5448934f8f.7.1754581997162; 
 Thu, 07 Aug 2025 08:53:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459e5862fd9sm106961305e9.16.2025.08.07.08.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 08:53:16 -0700 (PDT)
Date: Thu, 7 Aug 2025 18:53:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm/vkms: Allow to configure multiple CRTCs
Message-ID: <aJTL6IFEBaI8gqtH@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Hello José Expósito,

Commit 600df32dac40 ("drm/vkms: Allow to configure multiple CRTCs")
from Feb 18, 2025 (linux-next), leads to the following Smatch static
checker warning:

drivers/gpu/drm/vkms/tests/vkms_config_test.c:220 vkms_config_test_get_planes() error: 'plane_cfg1' dereferencing possible ERR_PTR()
drivers/gpu/drm/vkms/tests/vkms_config_test.c:258 vkms_config_test_get_crtcs() error: 'crtc_cfg2' dereferencing possible ERR_PTR()
drivers/gpu/drm/vkms/tests/vkms_config_test.c:300 vkms_config_test_get_encoders() error: 'encoder_cfg2' dereferencing possible ERR_PTR()
drivers/gpu/drm/vkms/tests/vkms_config_test.c:345 vkms_config_test_get_connectors() error: 'connector_cfg2' dereferencing possible ERR_PTR()
drivers/gpu/drm/vkms/tests/vkms_config_test.c:672 vkms_config_test_plane_attach_crtc() error: 'overlay_cfg' dereferencing possible ERR_PTR()
drivers/gpu/drm/vkms/tests/vkms_config_test.c:674 vkms_config_test_plane_attach_crtc() error: 'primary_cfg' dereferencing possible ERR_PTR()
drivers/gpu/drm/vkms/tests/vkms_config_test.c:676 vkms_config_test_plane_attach_crtc() error: 'cursor_cfg' dereferencing possible ERR_PTR()
drivers/gpu/drm/vkms/tests/vkms_config_test.c:685 vkms_config_test_plane_attach_crtc() error: 'crtc_cfg' dereferencing possible ERR_PTR()
drivers/gpu/drm/vkms/tests/vkms_config_test.c:746 vkms_config_test_plane_get_possible_crtcs() error: 'crtc_cfg1' dereferencing possible ERR_PTR()
drivers/gpu/drm/vkms/tests/vkms_config_test.c:746 vkms_config_test_plane_get_possible_crtcs() error: 'plane_cfg1' dereferencing possible ERR_PTR()
drivers/gpu/drm/vkms/tests/vkms_config_test.c:748 vkms_config_test_plane_get_possible_crtcs() error: 'crtc_cfg2' dereferencing possible ERR_PTR()
drivers/gpu/drm/vkms/tests/vkms_config_test.c:810 vkms_config_test_encoder_get_possible_crtcs() error: 'crtc_cfg1' dereferencing possible ERR_PTR()
drivers/gpu/drm/vkms/tests/vkms_config_test.c:810 vkms_config_test_encoder_get_possible_crtcs() error: 'encoder_cfg1' dereferencing possible ERR_PTR()
drivers/gpu/drm/vkms/tests/vkms_config_test.c:812 vkms_config_test_encoder_get_possible_crtcs() error: 'crtc_cfg2' dereferencing possible ERR_PTR()
drivers/gpu/drm/vkms/tests/vkms_config_test.c:876 vkms_config_test_connector_get_possible_encoders() error: 'connector_cfg1' dereferencing possible ERR_PTR()
drivers/gpu/drm/vkms/tests/vkms_config_test.c:876 vkms_config_test_connector_get_possible_encoders() error: 'encoder_cfg1' dereferencing possible ERR_PTR()
drivers/gpu/drm/vkms/tests/vkms_config_test.c:878 vkms_config_test_connector_get_possible_encoders() error: 'encoder_cfg2' dereferencing possible ERR_PTR()

drivers/gpu/drm/vkms/tests/vkms_config_test.c
    231 static void vkms_config_test_get_crtcs(struct kunit *test)
    232 {
    233         struct vkms_config *config;
    234         struct vkms_config_crtc *crtc_cfg;
    235         struct vkms_config_crtc *crtc_cfg1, *crtc_cfg2;
    236 
    237         config = vkms_config_create("test");
    238         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
    239 
    240         KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 0);
    241         vkms_config_for_each_crtc(config, crtc_cfg)
    242                 KUNIT_FAIL(test, "Unexpected CRTC");
    243 
    244         crtc_cfg1 = vkms_config_create_crtc(config);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This file has no error checking.

I didn't send an email about it at first because this is just test code so
who cares, but I was recently burned by ignoring errors so now I'm going
through a bunch of old warnings to say that, "Hey, if the author ignores the
error checking that's fine, but I'm in the clear."

    245         KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 1);
    246         vkms_config_for_each_crtc(config, crtc_cfg) {
    247                 if (crtc_cfg != crtc_cfg1)
    248                         KUNIT_FAIL(test, "Unexpected CRTC");
    249         }
    250 
    251         crtc_cfg2 = vkms_config_create_crtc(config);
    252         KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 2);
    253         vkms_config_for_each_crtc(config, crtc_cfg) {
    254                 if (crtc_cfg != crtc_cfg1 && crtc_cfg != crtc_cfg2)
    255                         KUNIT_FAIL(test, "Unexpected CRTC");
    256         }
    257 
--> 258         vkms_config_destroy_crtc(config, crtc_cfg2);
    259         KUNIT_ASSERT_EQ(test, vkms_config_get_num_crtcs(config), 1);
    260         vkms_config_for_each_crtc(config, crtc_cfg) {
    261                 if (crtc_cfg != crtc_cfg1)
    262                         KUNIT_FAIL(test, "Unexpected CRTC");
    263         }
    264 
    265         vkms_config_destroy(config);
    266 }

regards,
dan carpenter
