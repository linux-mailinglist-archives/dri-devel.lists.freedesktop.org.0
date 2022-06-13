Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D22345499A5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 19:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2424810E58C;
	Mon, 13 Jun 2022 17:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B95510E58C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:17:51 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id o16so7984218wra.4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 10:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6oCYTzwjrLnxnxwyKEfz2WikcR75QzF1FKToWqyNR9I=;
 b=F51NTLAyPWUJmIcreJGh+nbImazQe30mXy0M1R9WGuNAFL7yNxovOd0I4dYt9TkOYq
 /oWo/kycfvrF+HhazbbB+32J5kUXFxWTWp/vY4D+6IQnS9UxELCYAXpL0uCnmEooiYw/
 RCtD58rL8tsaqMP5UfwZUdlFSlRaB9l24wQpgSQ+Xd+tUM1XqhqgqJeaSqNNshdgc4Ew
 m+HeNbiKr42hrb2k0Oq0nOUcg8m1PZxxM1h5MHZym3iDUnG+K86b3vq7GltcAY4VNmaN
 6KonpQUB3bGRBVD64qQb6DeuxfGJiRDnatmTER/KaMJDN699w5hJ13owDQtQ7QpBqLQU
 Iazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6oCYTzwjrLnxnxwyKEfz2WikcR75QzF1FKToWqyNR9I=;
 b=BxRZtJQiIb4nUucTWmA9f6ThMlPV4ze0Bamz6PKv1kgrT/FHJFuV6HKSzTKrua22S2
 g3g5JtLz7IXgSsMlCWOh2GqRClpSroT6iGdxFV/HD1xQ6yUq9V5SbAXemVuw45lSDAeB
 E6OKyw9ozeWGQeqIxoycfxwovL/RuJB/Oz6uwRS0ZaAq7SJUKlUaWIdkY06ZsM9DxIVT
 cDMRTxwNbvs/DoBaBmHi7JhyRRZvBDlB2NaNzPgA74cV9Ua0LByHk7LFOVG4Htee/xQF
 KpOUQkDZaGC+TGplRl02ssTe/8IzXMSNiZLUx1UWKllCxT4wnzyDTHTboJx+HLDFEgZh
 3ODQ==
X-Gm-Message-State: AJIora/dKi4tiy1+3XTzy/5Stnf87TJ4D7QiJdA911itllnIRBCtmfTQ
 T0E3hEy3sVXMNrfG3c5Z48Q=
X-Google-Smtp-Source: AGRyM1ukqjdWNtJpNtXwbhf0Bf6agIHIexrRYS1P411Ex0OXC4BusGashejJsEd+0rc1FkF98C2bfg==
X-Received: by 2002:adf:f610:0:b0:213:b4e1:7276 with SMTP id
 t16-20020adff610000000b00213b4e17276mr808828wrp.712.1655140669679; 
 Mon, 13 Jun 2022 10:17:49 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a056000100a00b0020d106c0386sm9016129wrx.89.2022.06.13.10.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 10:17:49 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v3 3/3] drm/doc: Add KUnit documentation
Date: Mon, 13 Jun 2022 19:17:38 +0200
Message-Id: <20220613171738.111013-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613171738.111013-1-jose.exposito89@gmail.com>
References: <20220613171738.111013-1-jose.exposito89@gmail.com>
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
 Maxime Ripard <maxime@cerno.tech>, airlied@linux.ie, dlatypov@google.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Explain how to run the KUnit tests present in the DRM subsystem and
clarify why the UML-only options were not added to the configuration
file present in drivers/gpu/drm/.kunitconfig [1] [2].

[1] https://lore.kernel.org/dri-devel/CABVgOSn8i=LO5p7830h2XU1Jgg0KrN0qTnxkOMhf1oTgxjaKKw@mail.gmail.com/
[2] https://lore.kernel.org/dri-devel/CAGS_qxqpiCim_sy1LDK7PLwVgWf-LKW+uNFTGM=T7ydk-dYcEw@mail.gmail.com/

Reviewed-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/drm-internals.rst | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
index 38afed24a75c..f1d97e80ca29 100644
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
+in ``drivers/gpu/drm/kunit/.kunitconfig``. It can be used by ``kunit.py`` as
+follows:
+
+.. code-block:: bash
+
+	$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/kunit \
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

