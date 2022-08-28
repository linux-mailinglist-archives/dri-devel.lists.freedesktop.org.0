Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0015A3E9D
	for <lists+dri-devel@lfdr.de>; Sun, 28 Aug 2022 18:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DD210E187;
	Sun, 28 Aug 2022 16:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63B010E187
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 16:45:31 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id m16so7479621wru.9
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 09:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=c6/vSF9S8NKWJSMSnwvul76XPlLqVxRis9zbs5khOBw=;
 b=MuZVZknB4CIlYavTxchdpdvUYHKuMvZpbo5YGWw/pIWFRwWmNIP7CxvD39IduL/tF0
 QowctCeEEHPVQc+ik0j6t4umkdo/tjTzvXjbxJrHrOyguxBDftyUv81WM2GGIP4Ci/wQ
 mV9EX/6O2/lYwqxExYYRKkM/RXdqHGnBiyTI+hC3+HDp+x8kfh+4QmLTM5df86Lb26B+
 kp4oSSyOFDtjgjIEy01CbVkOHYfPbfx90Pb6e2f0v1APcZsbswHc48sK/dA91cgtRlVy
 29Ayx/2g5Q8232PDUUQzt586eUKI1gYeZHpFArlj9bVKxU7/7rkX5qVzIwUFZqyNn5ue
 HSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=c6/vSF9S8NKWJSMSnwvul76XPlLqVxRis9zbs5khOBw=;
 b=OwjMV68oDL6JwCZ5L3x70l6pPyBZEz+bQxncdF0u5MJiUpat9IM0JpdZIqmQsN6/Sc
 UwMf2oUHUmpHVS6FIW1uIlqPy//X12yRdSWElYkrK1sPyE46aQUPmKmEAN5lGKAEKjFA
 DUGIwZhhTU8dCUxcVbmDp/qgsi5G7jhVcBXk6k8YINGiln3NhP8HV3RzXsIAr0SrUz0+
 Nqq+0G8xzMHSFNty7cCWYJVYmAJzGjJmJN9vuY7WjX5HO3OirIKz66wDm/4GgvRn81Tn
 eV5l/5WhvvJVOSeY34S3FOcgScVGrCaJVjH4JzzwJ1zOGCiqDfH2TKaIJkapcx2eygWS
 RiAw==
X-Gm-Message-State: ACgBeo3A53SUDuWKbvoY/0FadkV98/EZ4PS/LO2PgXYb5aslhyEw+AvJ
 5Z9dMz7/CsWYnuzuMJopTeE=
X-Google-Smtp-Source: AA6agR5iLmJqY7oqKbuCwfjD+Umb9mpPns3Bz3rShsNhUlEaMupPw23l6e5Z+i7LuXXFu6NotxZhSw==
X-Received: by 2002:a5d:6d88:0:b0:222:c8e2:f5fb with SMTP id
 l8-20020a5d6d88000000b00222c8e2f5fbmr4609958wrs.35.1661705130349; 
 Sun, 28 Aug 2022 09:45:30 -0700 (PDT)
Received: from localhost.localdomain ([94.73.32.249])
 by smtp.gmail.com with ESMTPSA id
 e14-20020adfef0e000000b0021d6924b777sm399926wro.115.2022.08.28.09.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 09:45:29 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v3 0/3] KUnit tests for RGB888, XRGB2101010 and grayscale
Date: Sun, 28 Aug 2022 18:45:14 +0200
Message-Id: <20220828164517.185092-1-jose.exposito89@gmail.com>
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

v2 -> v3:

    Export symbol drm_fb_xrgb8888_to_xrgb2101010()

José Expósito (3):
  drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_rgb888()
  drm/format-helper: Add KUnit tests for
    drm_fb_xrgb8888_to_xrgb2101010()
  drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_gray8()

 drivers/gpu/drm/drm_format_helper.c           |   1 +
 .../gpu/drm/tests/drm_format_helper_test.c    | 190 ++++++++++++++++++
 2 files changed, 191 insertions(+)


base-commit: 61a9fa154d217c13eea90aa5bc635bc4b1fcb66e
-- 
2.25.1

