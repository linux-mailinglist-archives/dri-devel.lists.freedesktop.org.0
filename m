Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EAA53EDA1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 20:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14A510F73F;
	Mon,  6 Jun 2022 18:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F86B10F179
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 18:09:46 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u3so20923967wrg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 11:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tCYZwzCVdZ6wVDocKg/5gFZzksm/d5GDUpBKZN9UWJM=;
 b=hJTRzt5eI6lwU2NYGJNW7/inkfglbXLnSlLWurfAAJspK66rpNis2ApDm8VMTUKtCl
 291daY3KHI3tuYIRQUXJOyV8JgvvCNr+m79efaLJplCT6nsjVLK1P4Cw2o1WUee+g7Ij
 hL+kYkccEt800lzno5Lphehcg2RjKNstaCTxlGZ4luTnRCfItlezvVC23dt3briQNFmZ
 gF0HY5Y/chuBKF69KtC+o4vVyYsjmV6/QYpUnJb5qsNcQTH+bjqhYGnjhgjx/8x0iv5w
 UKvnTglYP7jWFW4zPzrZyCarncHvrHFEwfZU1GRKDPPuCLTfSAdD8eVvF/KEdwCaPFck
 PopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tCYZwzCVdZ6wVDocKg/5gFZzksm/d5GDUpBKZN9UWJM=;
 b=cnjy1Xhse12G9lUMT6rdQyHTd29xyO5q52YS6nCZ2oum+x8tdi1kjhMKvKLDaDkAmo
 5U2aqNgFWaVP/kxueZ8n7h5sRQf4+uu81fRQvPnDl93Adzj4UPrhTpJV1UCjJZncF2jq
 4RStK6W0+dNY4EsQ5D3hV7/DjF2ZDjOkDOPaIJ3yGfw3S6tpa2abcY34Ueb+r9MB8j+g
 ttS6GY4JUi0FRM6YrBj+7W8j0MW51AU5YGn0oqPLcg9uWwG8E0tStf2rYGxW68MEcE4S
 55xqvpAgt3eWUFiGIKiBOu4jHTzBo66Bpj6Wia97ALPok0ZfuUKg2xKNAk+JidBcJNr3
 SOow==
X-Gm-Message-State: AOAM532jkDvEAiXH7AhSkTqYBax6498+vC9auvxO3SDN4rAwxM0l62n1
 C/3Bj+URrkDPWVm3ic8zwos=
X-Google-Smtp-Source: ABdhPJzGMHflGxxR8RN7X7m0FPxaI+9qGxcVDUq0BaJwRW9ffdAtkUO4v+/00+b/FOSmS988We2rvA==
X-Received: by 2002:a5d:4811:0:b0:213:bab0:64f3 with SMTP id
 l17-20020a5d4811000000b00213bab064f3mr19222823wrq.499.1654538984919; 
 Mon, 06 Jun 2022 11:09:44 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a05600c2cad00b00397623ff335sm19785050wmc.10.2022.06.06.11.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 11:09:44 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH] drm/doc: Add KUnit documentation
Date: Mon,  6 Jun 2022 20:09:40 +0200
Message-Id: <20220606180940.43371-1-jose.exposito89@gmail.com>
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

Explain how to run the KUnit tests present in the DRM subsystem and
clarify why the UML-only options were not added to the configuration
file present in drivers/gpu/drm/.kunitconfig [1] [2].

[1] https://lore.kernel.org/dri-devel/CABVgOSn8i=LO5p7830h2XU1Jgg0KrN0qTnxkOMhf1oTgxjaKKw@mail.gmail.com/
[2] https://lore.kernel.org/dri-devel/CAGS_qxqpiCim_sy1LDK7PLwVgWf-LKW+uNFTGM=T7ydk-dYcEw@mail.gmail.com/

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/drm-internals.rst | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
index 38afed24a75c..08f115417381 100644
--- a/Documentation/gpu/drm-internals.rst
+++ b/Documentation/gpu/drm-internals.rst
@@ -207,6 +207,37 @@ Utilities
    :internal:
 
 
+Unit testing
+============
+
+KUnit
+-----
+
+KUnit (Kernel unit testing framework) provides a common framework for unit tests
+within the Linux kernel.
+
+This section covers the specifics for the DRM subsystem. For general information
+about KUnit, please refer to Documentation/dev-tools/kunit/start.rst.
+
+How to run the tests?
+~~~~~~~~~~~~~~~~~~~~~
+
+In order to facilitate running the test suite, a configuration file is present
+in ``drivers/gpu/drm/.kunitconfig``. It can be used by ``kunit.py`` as follows:
+
+.. code-block:: bash
+
+	$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm \
+		--kconfig_add CONFIG_VIRTIO_UML=y \
+		--kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=y
+
+.. note::
+	The configuration included in ``.kunitconfig`` should be as generic as
+	possible.
+	``CONFIG_VIRTIO_UML`` and ``CONFIG_UML_PCI_OVER_VIRTIO`` are not
+	included in it because they are only required for User Mode Linux.
+
+
 Legacy Support Code
 ===================
 
-- 
2.25.1

