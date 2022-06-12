Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4D6547AFA
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 18:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762C0112606;
	Sun, 12 Jun 2022 16:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2651125F4
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 16:12:59 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u8so4371674wrm.13
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 09:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D6qupUetHLQqhezVhUKvPbR6n4KY1jcWxKelwznf1ww=;
 b=kxr19WDGBFfWNpHhE2e6u07EqdHog+2JA9ok+pRs9H42utwqqSIywW9yvdSkwkC/S+
 Wzo3N+UYE4Ym1Ky3uBHJNFb9E8SKbWGS3QqVGrlQzWrr+mXPJVY9vJRLxSveA/Z6Kqqh
 4eRBFooIEjH5Cn/ESGzRVC8bC4ovWzFTEutXOA+2FkWjEs17hQdB8L7OZjVeHUd4oEnq
 9aS3T3nzA2YMjvSY5Lr4zrwl/pz630MBviSOcud/L75VivL4TC7vBYLIr4Lga/edvElx
 jHEnpFBUKCS5e1ueklLZbgAx53kjnKs3buplNwR54A9SyxC7aUPApp0Uem6pNhrinPl6
 8auw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D6qupUetHLQqhezVhUKvPbR6n4KY1jcWxKelwznf1ww=;
 b=k0UKJNyyq9BS1Tn34+jJJxBssjIoO2pe8T6z/6OFvbJMJB3P2zH5F8YpYpa+tRCgE9
 u4/6hgsYLTdCO9hv3htCzrbJtSsAs30SrxixkziGCfalpBnXzFniRf7tnGMz39bUMTLT
 wyh05uXZV6gyvJdgLWwa6iq2Rk5uuhob1HbWlbS2yJS1POUw9rvXhNHHVFIy9fGFffrs
 m7EMc8AwkqXUbw3ppR930wLh4Z4t16lK+vqYb2p7y91X469a6Cy7eb8982FiD/jJgETH
 R/Vy6ktQRc4MHC3CE30VEWvL6hayuCgANVpB6ZuoppBRRS6KrJ36dCac5UpPg8DigAWu
 FrGg==
X-Gm-Message-State: AOAM530F0hCEwbtoRmaHfq6cAK3iBZLZbe7TeSgLDWUGR8hQDljFyzNP
 +WMDi4hVF7OnZ78MqEMmZLI=
X-Google-Smtp-Source: ABdhPJxX1mft8P2RX7TPxZKoUa9mrJWuY00IutpNyOHZB7pwgN5RdKw5WQNPr0z3O5nkgteim0KHlg==
X-Received: by 2002:adf:d4c7:0:b0:213:ba6b:b017 with SMTP id
 w7-20020adfd4c7000000b00213ba6bb017mr49751881wrk.652.1655050377610; 
 Sun, 12 Jun 2022 09:12:57 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a5d6208000000b0020d0f111241sm6015925wru.24.2022.06.12.09.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 09:12:57 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v2 0/3] KUnit tests for drm_format_helper
Date: Sun, 12 Jun 2022 18:12:45 +0200
Message-Id: <20220612161248.271590-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: davidgow@google.com, airlied@linux.ie, dlatypov@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello everyone,

Here is the v2 of the series, including the documentation, previously
sent as a standalone patch [1], and changes suggested during review.

Thanks a lot,
José Expósito

RFC -> v1: https://lore.kernel.org/dri-devel/20220530102017.471865-1-jose.exposito89@gmail.com/T/

 - Add .kunitconfig (Maxime Ripard)
 - Fix memory leak (Daniel Latypov)
 - Make config option generic (Javier Martinez Canillas):
   DRM_FORMAR_HELPER_TEST -> DRM_KUNIT_TEST
 - Remove DISABLE_STRUCTLEAK_PLUGIN (Daniel Latypov)

v1 -> v2: https://lore.kernel.org/dri-devel/20220606095516.938934-1-jose.exposito89@gmail.com/T/

 Thomas Zimmermann:
 - Add DRM_RECT_INIT() macro
 - Move tests to drivers/gpu/drm/kunit
 - Improve test documentation

[1] https://lore.kernel.org/dri-devel/20220606180940.43371-1-jose.exposito89@gmail.com/T/

José Expósito (3):
  drm/rect: Add DRM_RECT_INIT() macro
  drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb332()
  drm/doc: Add KUnit documentation

 Documentation/gpu/drm-internals.rst           |  32 ++++
 drivers/gpu/drm/Kconfig                       |  16 ++
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/kunit/.kunitconfig            |   3 +
 drivers/gpu/drm/kunit/Makefile                |   3 +
 .../gpu/drm/kunit/drm_format_helper_test.c    | 169 ++++++++++++++++++
 include/drm/drm_rect.h                        |  12 ++
 7 files changed, 236 insertions(+)
 create mode 100644 drivers/gpu/drm/kunit/.kunitconfig
 create mode 100644 drivers/gpu/drm/kunit/Makefile
 create mode 100644 drivers/gpu/drm/kunit/drm_format_helper_test.c

-- 
2.25.1

