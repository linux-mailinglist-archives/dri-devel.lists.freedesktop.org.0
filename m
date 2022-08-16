Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E357A595837
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 12:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42ABE10F35F;
	Tue, 16 Aug 2022 10:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684BA112656
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 10:29:13 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so339139wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 03:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=KFNiCUdXTrEiAGiz+4FQbAw1rF3AEPapoVwJtLEaQ9g=;
 b=pLl9wgCJPBpAaPBgmBmy0+7N5b3VHGocJ9PLCcmKSttmVZMVQMA5WEaSWLumu+44oQ
 mIaFuoENpibdoIIOWFTJEvv3PHvNH7ng5VyzcEOQwCKZhBmVAi/dl/jk4KDnnOhKxB+5
 1AXE6MpJlQCPXESMuDi62G56fRHhixGcGytm+pfQ9pgKtn3uMNUS/SPP8zWvOe3uZxEW
 6QfssBudlzVoxaGqyDMDtDgy10rr7/x5bbf7/KelB9YqpRCrAdCxFPzLSEedDw04gv+r
 fNA77mgsIn+V630dzHDimwD7rbNsa0J2GO8gFyImcLba2r/Y9w9hZZotQGtIPu9Ojvh9
 Dniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=KFNiCUdXTrEiAGiz+4FQbAw1rF3AEPapoVwJtLEaQ9g=;
 b=OeBrZYGSjz4+Axc4Po2UERQz5k9IK7FdDrBD4VuAngJ6tV+L0q9l/DsyLREs/J0gqh
 b8CfZiBpewyIMVCjP7w7YqwStjIUU2+Hih4UU3JkYfJHXIZa8c1Mq6kfu074td43OtOQ
 yhc+SAxLCkQUyqjCcIcOJQFKpORDFKMNk3urDgcKH+D++iOqsjlfCBeI5+oHbkdBESYh
 zd28J7ZbUwTl9GPQUbqGGVtjSPI8u71OplUowLsgx7AH/yyCCHLwlBfX1wheMSLMOyju
 js2PPpVC83iH6vzPVS5Ew1qn7PvActMbZxGey1JFfIXYaW3a4vUDWd7KcZkQEeaoBfjr
 KCyA==
X-Gm-Message-State: ACgBeo0awpqEsyc8G2riTJ9xjATvLiMGyM1BNO90DHM9B/2duKUYzNZM
 BVNcni1n85B9RfbFdRm4P/U=
X-Google-Smtp-Source: AA6agR6qUGwb4CpPib/vdpS1BwS6mngZO3z+s86OwgGv9ciLUEA6YtJkII4a18RqRQ/RwCj9Z4CMhQ==
X-Received: by 2002:a05:600c:4f02:b0:3a5:fc0f:9566 with SMTP id
 l2-20020a05600c4f0200b003a5fc0f9566mr4261092wmq.107.1660645751897; 
 Tue, 16 Aug 2022 03:29:11 -0700 (PDT)
Received: from localhost.localdomain ([94.73.32.249])
 by smtp.gmail.com with ESMTPSA id
 m9-20020adffe49000000b002251639bfd0sm1668407wrs.59.2022.08.16.03.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 03:29:11 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH 0/3] KUnit tests for RGB888, XRGB2101010 and grayscale
Date: Tue, 16 Aug 2022 12:29:00 +0200
Message-Id: <20220816102903.276879-1-jose.exposito89@gmail.com>
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

José Expósito (3):
  drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb888()
  drm/format-helper: Add KUnit tests for
    drm_fb_xrgb8888_to_xrgb2101010()
  drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_gray8()

 .../gpu/drm/tests/drm_format_helper_test.c    | 190 ++++++++++++++++++
 1 file changed, 190 insertions(+)

-- 
2.25.1

