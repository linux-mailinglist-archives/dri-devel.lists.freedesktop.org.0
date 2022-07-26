Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0199581C46
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 01:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC00CB20EF;
	Tue, 26 Jul 2022 23:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08474B20EF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 23:09:27 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id j7so120544wrh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 16:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YwFmvFCFnxG61X2FguLsSH/7rkf2ag01ypc985KcPmM=;
 b=WQsGl3Kr3A1qawTQ6Zz8L/BuT36RV9oznguzkv2sbKXOveo6XZdQIAItrn2m1d7zcm
 yACDU6OcXbJwZyN6HhH7crei0r/Wn/1+5uXU9FihvCG80QZf5Wosg82kTO0YYjQ8A/Av
 QywOfyEj0yq0JvtOADPC5TmMSrNQT9Q++ltI2+ZrK14y9lKUQCtIURTZY//IS/Yv22Nz
 dUVAYNAK0e16gwwdaz4tDSL5oQyz7+Xv9lzMeSRTBR2QqKxg1KcN8PufzpS7VBMKpm0p
 nsbJTJarlnfCchcCHodhaGU2dDD9zcMxqlqbr7dU4FFXYh4Wfcgqf0NdMlCaIpnuFXQC
 xCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YwFmvFCFnxG61X2FguLsSH/7rkf2ag01ypc985KcPmM=;
 b=nUBotTE/dMcC0ubqoWkroJIzcaEM1vNT0XVm6g28xUmn9G1sL8KfaDl7yqjE0UGxib
 HZVOCsJh1Dkm2moqqVQTl+uJ2Pg6qrdQ4gpTm+ZT/STpiU3Ncxq3cLhUQ//Ja0QsaDZ9
 8rPQQtMbD5i7GfzYs004wSc0TuJDbP5fsZFuVEt+75ZKk3M5ijbFKeKt9/8n0yKfzNm4
 jv5sslmbYOfI5bY12DaJLAgrBrGon3Imio0V/fR2OuOCboI3TCzL5rOQ32wW3W3W1VvT
 Vfswrp43N2F/D8oWL+3uVdV2adeCJG8i84fVSrv7p/zDV3nUWChS8dzx7yBkF9uP8arp
 /eqA==
X-Gm-Message-State: AJIora/YRTirze5bMHs+uPK9BqTv0ABFPSb11JzZYRvtbPGwHNrXVhXO
 5AK+fd3qnUuyvjakdPLfzUQ=
X-Google-Smtp-Source: AGRyM1tdcxy2N25R+h1wWjdtYIjcptfq6mjGu52yVm2VcIkYmpygzKzkyRTjVyNH47JCA++3lfeAxQ==
X-Received: by 2002:a5d:4f09:0:b0:21e:cc31:50b6 with SMTP id
 c9-20020a5d4f09000000b0021ecc3150b6mr245687wru.124.1658876965270; 
 Tue, 26 Jul 2022 16:09:25 -0700 (PDT)
Received: from localhost.localdomain ([94.73.33.57])
 by smtp.gmail.com with ESMTPSA id
 bn20-20020a056000061400b0021e86504736sm7278533wrb.16.2022.07.26.16.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 16:09:24 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v3 0/4] KUnit tests for RGB565 conversion
Date: Wed, 27 Jul 2022 01:09:12 +0200
Message-Id: <20220726230916.390575-1-jose.exposito89@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 magalilemes00@gmail.com, airlied@linux.ie, maira.canal@usp.br,
 dlatypov@google.com, linux-kernel@vger.kernel.org, geert@linux-m68k.org,
 tales.aparecida@gmail.com, davidgow@google.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 isabbasso@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello everyone,

This series is a follow up of the XRGB8888 to RGB332 conversion KUnit
tests.

As I mentioned in v2 [1] I suspected that the inconsistency handling
the endian might need to be fixed.
Fortunately, Geert Uytterhoeven fixed it in commit 4d9db10576ff
("drm/format-helper: Fix endianness in drm_fb_*_to_*() conversion
helpers"), so I updated the tests to reflect his change.

Changes since v1:

 - Fix a bug reported by David Gow in the XRGB8888 to RGB332 tests
 - Simplify the test structure as suggested by David Gow
 - Add Tested-by Tales L. Aparecida and Acked-by Thomas Zimmermann
 - Fix link in the last patch (Thomas Zimmermann)

Changes since v2:

 - Test endian as fixed in commit 4d9db10576ff ("drm/format-helper: Fix
   endianness in drm_fb_*_to_*() conversion helpers")
 - Fix Sparse warning reported by David Gow
 - Add Reviewed-by David Gow

[1] https://lore.kernel.org/dri-devel/20220709115837.560877-1-jose.exposito89@gmail.com/

José Expósito (4):
  drm/format-helper: Fix test on big endian architectures
  drm/format-helper: Rename test cases to make them more generic
  drm/format-helper: Support multiple target formats results
  drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb565()

 .../gpu/drm/tests/drm_format_helper_test.c    | 169 ++++++++++++++----
 1 file changed, 139 insertions(+), 30 deletions(-)

-- 
2.25.1

