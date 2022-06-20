Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B73C5521D8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 18:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11AB10E0D8;
	Mon, 20 Jun 2022 16:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBB710E0D8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 16:06:55 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q9so15326205wrd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/TPehAEJHEHlrkHOvcoYy5pHwjMYobws3cEljVGCCv4=;
 b=BCSuOE12OhP9mTHrQ71bY0c6dF+TNJEyuAAzb9DF9CpKL9f99Q05BPSHQMNU9lGV+f
 kbG+AXp1B8zxKOlqE4t2B8EGzK9l5zJXHJ6aC64Nydnl8i6kR1apyv5/9vOMUCye9jrd
 ixTS0t5AUr5yy7GZ4qXa9CdtaQFBtW60qgccslYepVEEcqem0wMtIwrp92jD9cEU/sPA
 NoRAqpfrhN/hsd35AKhWVN1CJxBdmu/lDeQbj1NM1o96ppgKT8+03xxhVfA6Qf+nrJA6
 XCnla7Q+zbo//QOGIcgGPkRIVpXsocQYdvOAKpXecTnqdfLiRsCU8dMo5qH8maeCjx7J
 t9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/TPehAEJHEHlrkHOvcoYy5pHwjMYobws3cEljVGCCv4=;
 b=PQXnoK1npZxata17pUPIC/ezxtYhQdPdGGM9fPiYypEUQOdIL4mF0UumLPh+38uJaP
 +sygNs9/ictlfSCrBGHQ0vFjtXnvC7G9ouuYiu25vzSqtt/L2Sw5ldZ4IIcm6Zxwt4/Y
 qRRJ+BadMOACbZPI2U7+6Ca9VEEDuHnsh+IWap6epAXtPM+i8iluJdzQCXFJtoPv7gio
 LfIjIsPvnLAqr5KXnhhv1XzZMaZq7wGqchCrb6F6dgpXmCXS95J8I+UkcFaeGfV9zKK+
 eARqmNc7Zzikx0c8IPtlSN1xqzn9j8iPRRhOUPPb0TEPcd62jPQQJ6XgRJdtpuZBbg/i
 OboQ==
X-Gm-Message-State: AJIora8NeU2BhZgct5gSlfULZ/Ow2GHni1/akIgcOYBjiReK9ha84DTw
 IV50kUZzacHEMRK40ROWZoITZo+OX/wXkw==
X-Google-Smtp-Source: AGRyM1uG8UV4dMYLoidsr7Hd4yy2qf09uau+6C6r3lbUcAXOfVd7XmAndQ/+Bbnw3uSgY7ukvZgPKw==
X-Received: by 2002:a5d:4246:0:b0:21b:8ed0:51c with SMTP id
 s6-20020a5d4246000000b0021b8ed0051cmr6132380wrr.62.1655741214061; 
 Mon, 20 Jun 2022 09:06:54 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a5d430e000000b0021b90cc66a1sm2986096wrq.2.2022.06.20.09.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 09:06:53 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v4 3/3] drm/doc: Add KUnit documentation
Date: Mon, 20 Jun 2022 18:06:40 +0200
Message-Id: <20220620160640.3790-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620160640.3790-1-jose.exposito89@gmail.com>
References: <20220620160640.3790-1-jose.exposito89@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, davidgow@google.com,
 Maxime Ripard <maxime@cerno.tech>, magalilemes00@gmail.com, airlied@linux.ie,
 maira.canal@usp.br, dlatypov@google.com, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 tzimmermann@suse.de, tales.aparecida@gmail.com, isabbasso@riseup.net,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Explain how to run the KUnit tests present in the DRM subsystem and
clarify why the UML-only options were not added to the configuration
file present in drivers/gpu/drm/.kunitconfig [1] [2].

[1] https://lore.kernel.org/dri-devel/CABVgOSn8i=LO5p7830h2XU1Jgg0KrN0qTnxkOMhf1oTgxjaKKw@mail.gmail.com/
[2] https://lore.kernel.org/dri-devel/CAGS_qxqpiCim_sy1LDK7PLwVgWf-LKW+uNFTGM=T7ydk-dYcEw@mail.gmail.com/

Reviewed-by: Maxime Ripard <maxime@cerno.tech>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/drm-internals.rst | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
index 38afed24a75c..5fd20a306718 100644
--- a/Documentation/gpu/drm-internals.rst
+++ b/Documentation/gpu/drm-internals.rst
@@ -207,6 +207,38 @@ Utilities
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
+in ``drivers/gpu/drm/tests/.kunitconfig``. It can be used by ``kunit.py`` as
+follows:
+
+.. code-block:: bash
+
+	$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/tests \
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

