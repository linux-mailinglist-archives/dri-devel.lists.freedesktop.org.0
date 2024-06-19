Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852A590F258
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 17:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE90D10ED09;
	Wed, 19 Jun 2024 15:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="gHunp2jC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f98.google.com (mail-lf1-f98.google.com
 [209.85.167.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7F110ED08
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 15:39:29 +0000 (UTC)
Received: by mail-lf1-f98.google.com with SMTP id
 2adb3069b0e04-52c82101407so11198672e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 08:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718811568; x=1719416368;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8yjHA+Dz21oGxLTTw1+MaSmisNoKH6+F4MAoaYVDSUo=;
 b=gHunp2jC29ah1skNQY4UeciWyXjiP0hceBb6XXYUUMgpyh6pEkMYYUsDHcw3KB4uFD
 GHTHlEsnjOtB6krkJA2vwphq9ULcafPaBOmFf+nhR0Y6Snpp/XTEIgisW9sJdpZNEVtM
 TwmII1MLVDUlS3QDwmDl/buUiPM+HRwD3xipx/rWMvIo2STYv41ilqjUFsVfueVLaroE
 wXnRNb4Y5Ssb5lud8vDgzxZZk1TFtd339R+6+JtC9WsGbJwHWoaK/stG9GT/tJPyn5kM
 8MaU7d5YXZBWKl1pDRM7ZHQY0++DSKweWB6D1InDFYKF701OkD4Av0CG6SN6pxIKHpgF
 ZtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718811568; x=1719416368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8yjHA+Dz21oGxLTTw1+MaSmisNoKH6+F4MAoaYVDSUo=;
 b=QYRzxSmoIVQvMS1g88ATRqnAcWxqyDDBTkDy8x4xuCRaVvVMMxwZextfaXVhpR608+
 xQx/XZb2vanRkpxQiZg9bW11LW+/X1r98rVIEeLmSONQyB/4S4qwMQu1uCYjFHAojNHz
 NZB3zdaWVETQcLV/Cyrpi0cqP7La2v9h/IHo2bgT+mIaH95NDq0Ie10dCk0synvyAgoW
 MtBe48h6Wa6LidjOV/rfa4/ZjVAh3J04ZYy2d/lxGazqI2Nq9pFR4UOWWHKYF9NivVoc
 gfesiqZUvos/9PUTFEQRMjebW1o04qXGbVen/Y/wpyuemywMEYoz/Xm3qyIO2vhJzrXI
 y7Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYhxn/4fU+u4ldp03Xhd0aKeqQMbwneFHmkgqbxXt++jJS6nHpI3sth8iC8fBxfcC3kQ3YbAYuseJDjGzVR/4pEyLp/pvUjRG+4QV7bbkm
X-Gm-Message-State: AOJu0YxOsApLSLty+juueP6FyuI//fdXNm8LiwefYqN+/Mhs2BfqoVvx
 AqMGvFKMoofCzKs+Fc1eMzXCYshMdNKaDC4JDC1qreT+9DJOY8DTTW2tcOF29B9LkDuxwEMgbcr
 QNa+VyzI4LopGJSK750Wn2pietUNKVtct
X-Google-Smtp-Source: AGHT+IFyRRvDhFgZPO7zmMeWu2BE3j9VVtt/FIb/NFfaevifYSyJEPxymwSVQjv2XHvHamzk8N2Cv9grZpxx
X-Received: by 2002:a19:f707:0:b0:52c:8a11:cb4a with SMTP id
 2adb3069b0e04-52ccaa525ecmr1985513e87.46.1718811567671; 
 Wed, 19 Jun 2024 08:39:27 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6f56f209b1sm22841666b.260.2024.06.19.08.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 08:39:27 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 0/3] vc4 VEC (analogue video) updates - margins and
 monochrome
Date: Wed, 19 Jun 2024 16:39:10 +0100
Message-Id: <20240619153913.2804051-1-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Changes since v1:

- (Patch adding DRM_MODE_TV_MODE_MONOCHROME has already been merged)
- Added kunit tests as requested by Maxime
- Fixed error in vc4_vec_connector_get_property which was returning the value
  rather than setting *val.
- The legacy driver property has to be updated with the new value as returning 
  an error from get_property will crash modetest (or similar) when it queries
  the value.
- Added Maxime's R-b on patch 3.

Hi All

A couple of patches to vc4, including adding a new "TV mode" enum for monochrome
output (yes we have some users who wish for monochrome).

Adding mono has raised a query here as to whether the the TV_MODE is meant to
describe the timing, or just the colour encoding.

The description for NTSC references "CCIR System M (aka 525-lines)", and PAL
references "CCIR System B" which is the 625 line standard.

PAL-60 is absent from the enum, but support has been added to vc4 by selecting 
DRM_MODE_TV_MODE_PAL but with the NTSC (CCIR System M) timings. Is that the
correct implementation? In which case the description for PAL should drop the
CCIR System B reference as selecting the "TV mode" doesn't dictate the timing.

Monochrome is in the same boat as it can adopt either 525 or 625 line timing,
or indeed anything else. Pi5 can support System A 405-line and the French
819-line mono modes as well.

If "TV mode" does dictate the timing as well as the colour encoding, then we
need to add PAL-60, and 2 modes for mono (extending to 4 for 405 and 819 line
modes later). If not, we ought to update the description.

Thoughts?

Thanks
  Dave

Dave Stevenson (3):
  drm/tests: Add tests for the new Monochrome value of tv_mode
  drm/vc4: Add monochrome mode to the VEC.
  drm/vc4: vec: Add the margin properties to the connector

 .../gpu/drm/tests/drm_cmdline_parser_test.c   | 20 ++++++------
 drivers/gpu/drm/tests/drm_connector_test.c    |  1 +
 drivers/gpu/drm/tests/drm_modes_test.c        | 31 +++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_vec.c                 | 31 ++++++++++++++++++-
 4 files changed, 73 insertions(+), 10 deletions(-)

-- 
2.34.1

