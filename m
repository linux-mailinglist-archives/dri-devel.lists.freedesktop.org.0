Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B22547AFC
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 18:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E951112615;
	Sun, 12 Jun 2022 16:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D411125F4
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 16:13:02 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k16so4399439wrg.7
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 09:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6oCYTzwjrLnxnxwyKEfz2WikcR75QzF1FKToWqyNR9I=;
 b=EhGLCkTkonmCMTQ167DXhA1weWmaXnTSuHbeSYgX94Bbnt8e/zuyEaBLQCXuOeqGwQ
 ljluV5fPNJ4XJuR94rWf/pVYkcKS8/FQCfSNil9UILvam9R84Q1db9f0oeTUhDtWSGYw
 VC+Hm8xmx3gUMWVhqhj3Ewzw92irbBXqKmjG0fjRdyRQN2iU7PfmXb1VpWFK4+a/iABo
 vwLhdBeB0k+F0ISucP0eWTEJnjCvXtZy1rFdBrrM8XlB1N+Uop5m/DCVzyks4qAeAsGC
 b4J30utrAbopEdfxenAjg0KQbPMPI/0bSl9+l4j9P8SZlGBE/4Z7/iFQC9Zum6G4NLXJ
 5ZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6oCYTzwjrLnxnxwyKEfz2WikcR75QzF1FKToWqyNR9I=;
 b=8HHsz4kY8LpcPNStH912S90ztrtsrfiU+V8ruH/V8ti/zfflvTTqWLn3wwv5FQpDMy
 mv4s0NgE+NjFiWnUG2U7zTEfiXf4Melg7XYCX+QlB0NW0/ttjpllpfAmuBkrTRlGcwP6
 veG8d1x7mY/bCxyAMtPVACLLpK9nERDYlaie7yMp33aC3QnFyL60c0tfTQLbGWT9/5CJ
 a+ysJwhFGe2/eMC54X27Na3ftrmS6uN/glpj6IE0oASXMlWwatfkt0zKR9XWFncwHgsw
 IHtEBOYhwedw0AxcMRxV6/8QzvBhfVLya0CCKHNkiqSp69YLeq665fK5gV2/tW4T3hov
 VR9A==
X-Gm-Message-State: AOAM530YUY7qmnakRNeuXbsDrw9uUzy7QXNObqUAWLMUnbN0TLFpyX7r
 XBGLacRPiOduTOFmzJESTVU=
X-Google-Smtp-Source: ABdhPJz4mnmDUV4NLZknyHhTuGTurRoWbSWWgj8MlotV/lRDkKmaHLhTFIcWx+peDflYV5kyeC4q7w==
X-Received: by 2002:a05:6000:1849:b0:219:be72:177e with SMTP id
 c9-20020a056000184900b00219be72177emr16450441wri.150.1655050381282; 
 Sun, 12 Jun 2022 09:13:01 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a5d6208000000b0020d0f111241sm6015925wru.24.2022.06.12.09.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 09:13:00 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v2 3/3] drm/doc: Add KUnit documentation
Date: Sun, 12 Jun 2022 18:12:48 +0200
Message-Id: <20220612161248.271590-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220612161248.271590-1-jose.exposito89@gmail.com>
References: <20220612161248.271590-1-jose.exposito89@gmail.com>
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
Cc: davidgow@google.com, Maxime Ripard <maxime@cerno.tech>, airlied@linux.ie,
 dlatypov@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
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

