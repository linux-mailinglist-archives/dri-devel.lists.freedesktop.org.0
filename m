Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51585A3CEA
	for <lists+dri-devel@lfdr.de>; Sun, 28 Aug 2022 11:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8CB10EE4A;
	Sun, 28 Aug 2022 09:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F75F10EE4A
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 09:01:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id e13so5754783wrm.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 02:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=UYtdFnOEZEqfm5HH9C3uJEi/4LXalt7UYf8sjQmdups=;
 b=Rka/8601O/3M/lTmK6mxsL1ycOH930+Nwe+C1Csu9h93acxtNYx+ptNRT0vV/7iKXQ
 oZxLKLBjyudJf9980oOzgjj1AeWm7H35lO2YkzaKv0biegzca6EHj8AjIimWVG7ypcIA
 R1asA/2R/LPK93R3z99s6JnGxtWD8SjisoS9JBAv0PA9wjnXh6tXDo1euvxKzqz5Jcuw
 wRo22xH9/VaWK5i6LYwtftxupna/lJfC6zBXwlrZL3Jhq/00hvmZYLqii0g8aPMJH9ZP
 Kr9Y6gpdEK/TGaeJGUq5G7EPnyMj/KOuKPx6xXBNIaLYFb/1uGqr8bpgc2ZYpgZBQoVP
 c+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=UYtdFnOEZEqfm5HH9C3uJEi/4LXalt7UYf8sjQmdups=;
 b=sEWLigpIiskJW7QsAjAeLkaI2nvUDDDqELP6+OMP39hb0B/CSKKuwv0NfvICn9rphq
 uPQVeG6supyWZyAIcxtBrzE4xvmOcMOxnBp/C415HakV1L2xqR4vWtQlbDNQDVZ3zDXZ
 lF1QQ6fak8MFhcfvwIvy/gkWc1c9QtUscLGQdT3S2HZ1gt8c+K485ozv/F3rHixXW/l0
 Qk2HZjBPuV4ac21xfz5iS2/ZUgBUdJGC5gVqAVTIFPSJnXStxsYIwMD2LUaYq0s9n+Qr
 nnNm2R19vQooIINsJFlpNvSKzUKT3GzGXKfnkyF6Y22/ORg+Jn0bfWTS3fBGoo9JCFXk
 r3XQ==
X-Gm-Message-State: ACgBeo3uAxHg/dY2bUk1r6iW9hhZ1ammcsXczspnMtZrkvKTLrp+34wn
 bXHirl/Clau+rY+d/9gj2M0=
X-Google-Smtp-Source: AA6agR49R+q2KE0LxufaglaOfe9+ERfnrV6hlh5+z1fBEcEClz/Q/lt+DmrYoVIDYG2AUbiZI2HNyA==
X-Received: by 2002:a05:6000:1a42:b0:225:8b5e:e0f8 with SMTP id
 t2-20020a0560001a4200b002258b5ee0f8mr3910608wry.710.1661677288034; 
 Sun, 28 Aug 2022 02:01:28 -0700 (PDT)
Received: from localhost.localdomain ([94.73.32.249])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c351200b003a60ff7c082sm5733425wmq.15.2022.08.28.02.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 02:01:27 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v2 0/3] KUnit tests for RGB888, XRGB2101010 and grayscale
Date: Sun, 28 Aug 2022 11:01:18 +0200
Message-Id: <20220828090121.13243-1-jose.exposito89@gmail.com>
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

This series is a follow up on my work adding KUnit test to the XRGB8888
conversion functions. This time RGB888, XRGB2101010 and gray8 are added.

Best wishes,
Jose

v1 -> v2:

    Tested-by: Maíra Canal <mairacanal@riseup.net>
    Reviewed-by: David Gow <davidgow@google.com>

José Expósito (3):
  drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb888()
  drm/format-helper: Add KUnit tests for
    drm_fb_xrgb8888_to_xrgb2101010()
  drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_gray8()

 .../gpu/drm/tests/drm_format_helper_test.c    | 190 ++++++++++++++++++
 1 file changed, 190 insertions(+)


base-commit: 61a9fa154d217c13eea90aa5bc635bc4b1fcb66e
-- 
2.25.1

