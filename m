Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA39C8BB24E
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 20:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835B31131A6;
	Fri,  3 May 2024 18:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z3f8cfW8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D8C1127C2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 18:15:08 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2e20f2db068so19398781fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 11:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714760106; x=1715364906; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=skHQQr6/l6kfvwJ0x7uA/O7xeOEy9Dekh3cEjjcSscA=;
 b=z3f8cfW8X3hTtGhFRODDCzMFNSbjLnFljvuWsVu3NjkkScnlFO9R/FBIK5CMmEXQcU
 0t+TvfSWcMcOM10vouoIcWLq7633Mio9abNSwb11WGAe5u/mYFFMG2nklrrCRZ1tqIsY
 sZsKcNtC5fZh7qXWZ24JCeZCdY9PO/ZXbG3WNgu/NUv6oG+g88zHlXENh9jYE9iuRtKT
 Qw0NCAJbK+h4uZRBXl3KYORN522h7C4vLylbTzjBhMicFhycVRaX1KcG9I6kE1dOKswc
 jNnIN138ePPFYplvoF+xq+jnewnobzz5sfP/NI9GrSP9Mw13ZJsnyqkIMrqN/fjmnz1w
 Qg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714760106; x=1715364906;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=skHQQr6/l6kfvwJ0x7uA/O7xeOEy9Dekh3cEjjcSscA=;
 b=jyrrdZjXURR221HUDDLVX4dFN9JWHB8MQrA0IST/AYNAcyTqAqp9y3Msm08z392nP8
 LQnwU2IoUMfe32XqaWe03tiPYfIX29sg1LJr5CWNsO4sW0H9N8SrLHTtl12lmkj7va/b
 C98anfma9ZJWKuSGDnEm+XkG66/Dp999EbpAo5I3OygYlCwbZWo9JAmTUUMZAgBzbm6q
 PcjWvKw22nZmaBOMUTG+ilefVwWHDEW/6sdTUhZC/duXky7fhaCabvl2agAvnw0iWWN7
 K9CKq6+OsI6cpTDTfke4wIPoQB9ZiQRfvfXaNAkAalvVhObf7ar5/j/DlRMd3rD8HjWj
 sz4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUjQtV8EV6QXrRDB5EKfjC0k5dG827NLV5DfLpQgp0v3GeEJ3b/pozsd753ZkDSoC8OYzZHU9vaqQSwExl9sUT8ttCspBEIysjn2R2YdLt
X-Gm-Message-State: AOJu0YyNK29tW2Y4R877RVz1KaUlJEqXs7+vMuyhLMCb57kddJAl5EKb
 eAGBsmnwI/jaby311wgK6sRmRdsJLNjG02MPSrAZL5GYSmoJzOjCUlCGbhypCc0=
X-Google-Smtp-Source: AGHT+IErLUvCTp3mZM1tRLp0DEFt22pumkf6pfZD/UceDRcKf1yCaB01xmYu/WOUEodg5n3tjuKMxg==
X-Received: by 2002:a2e:9b0e:0:b0:2e2:1bbd:4ffb with SMTP id
 u14-20020a2e9b0e000000b002e21bbd4ffbmr2103527lji.22.1714760106046; 
 Fri, 03 May 2024 11:15:06 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 s7-20020a2e9c07000000b002de118decbbsm605548lji.53.2024.05.03.11.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 11:15:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 03 May 2024 21:15:03 +0300
Subject: [PATCH v2 1/2] drm/msm/gen_header: allow skipping the validation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-fd-fix-lxml-v2-1-f80a60ce21a1@linaro.org>
References: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
In-Reply-To: <20240503-fd-fix-lxml-v2-0-f80a60ce21a1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4120;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Nc9hNE58BK51xhK8ILsD1cIi3UtQvYLTsi34vGY1x6w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmNSmozOG/joa4cqDUWD1VjN9wTEAvsB5eq+xk7
 QAdsumPRPmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZjUpqAAKCRCLPIo+Aiko
 1Q9xB/4iDrSSvTmfXNCsFiLTo2477qXgJzXMHzCiAUJ9v03lU5+MFosDd5wVJErlvq797qkByIr
 Nv7ifu0ag+lYSh86wjxBD5xwxH2ZSgBEwVMsnQFj+1e9MZq8/peQGsVndUnWKI61SSmVvp9Z5A1
 ywoG0u0V3fMcnx79xqJo2VgZGzHgQPusIQDG0E48uVgh8e2MBAFj/9DGrkFIoHy/ai5xXNKFz5X
 0yQq0Jt/7ZrNf4Yq4WBM0FiwlxnSjr9N7Ikl4USl2QeNe8UGBSEF5hB6Ycz84We1Py7A89I5grd
 BARXj1ORVR0Ce0H4u3/ZLZXonu5IvO/scRi5LnPu8VhwP1N2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

We don't need to run the validation of the XML files if we are just
compiling the kernel. Skip the validation unless the user enables
corresponding Kconfig option. This removes a warning from gen_header.py
about lxml being not installed.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20240409120108.2303d0bd@canb.auug.org.au/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig                 |  8 ++++++++
 drivers/gpu/drm/msm/Makefile                |  9 ++++++++-
 drivers/gpu/drm/msm/registers/gen_header.py | 14 +++++++++++---
 3 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index f202f26adab2..4c9bf237d4a2 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -54,6 +54,14 @@ config DRM_MSM_GPU_SUDO
 	  Only use this if you are a driver developer.  This should *not*
 	  be enabled for production kernels.  If unsure, say N.
 
+config DRM_MSM_VALIDATE_XML
+	bool "Validate XML register files against schema"
+	depends on DRM_MSM && EXPERT
+	depends on $(success,$(PYTHON3) -c "import lxml")
+	help
+	  Validate XML files with register definitions against rules-fd schema.
+	  This option is mostly targeting DRM MSM developers. If unsure, say N.
+
 config DRM_MSM_MDSS
 	bool
 	depends on DRM_MSM
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index c861de58286c..718968717ad5 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -156,8 +156,15 @@ msm-y += $(adreno-y) $(msm-display-y)
 
 obj-$(CONFIG_DRM_MSM)	+= msm.o
 
+ifeq (y,$(CONFIG_DRM_MSM_VALIDATE_XML))
+	headergen-opts += --validate
+else
+	headergen-opts += --no-validate
+endif
+
 quiet_cmd_headergen = GENHDR  $@
-      cmd_headergen = mkdir -p $(obj)/generated && $(PYTHON3) $(srctree)/$(src)/registers/gen_header.py --rnn $(srctree)/$(src)/registers --xml $< c-defines > $@
+      cmd_headergen = mkdir -p $(obj)/generated && $(PYTHON3) $(srctree)/$(src)/registers/gen_header.py \
+		      $(headergen-opts) --rnn $(srctree)/$(src)/registers --xml $< c-defines > $@
 
 $(obj)/generated/%.xml.h: $(src)/registers/adreno/%.xml \
 		$(src)/registers/adreno/adreno_common.xml \
diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 90d5c2991d05..fc3bfdc991d2 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -538,6 +538,9 @@ class Parser(object):
 		self.variants.add(reg.domain)
 
 	def do_validate(self, schemafile):
+		if self.validate == False:
+			return
+
 		try:
 			from lxml import etree
 
@@ -567,7 +570,10 @@ class Parser(object):
 			if not xmlschema.validate(xml_doc):
 				error_str = str(xmlschema.error_log.filter_from_errors()[0])
 				raise self.error("Schema validation failed for: " + filename + "\n" + error_str)
-		except ImportError:
+		except ImportError as e:
+			if self.validate:
+				raise e
+
 			print("lxml not found, skipping validation", file=sys.stderr)
 
 	def do_parse(self, filename):
@@ -586,9 +592,10 @@ class Parser(object):
 		self.stack.pop()
 		file.close()
 
-	def parse(self, rnn_path, filename):
+	def parse(self, rnn_path, filename, validate):
 		self.path = rnn_path
 		self.stack = []
+		self.validate = validate
 		self.do_parse(filename)
 
 	def parse_reg(self, attrs, bit_size):
@@ -853,7 +860,7 @@ def dump_c(args, guard, func):
 	p = Parser()
 
 	try:
-		p.parse(args.rnn, args.xml)
+		p.parse(args.rnn, args.xml, args.validate)
 	except Error as e:
 		print(e, file=sys.stderr)
 		exit(1)
@@ -941,6 +948,7 @@ def main():
 	parser = argparse.ArgumentParser()
 	parser.add_argument('--rnn', type=str, required=True)
 	parser.add_argument('--xml', type=str, required=True)
+	parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
 
 	subparsers = parser.add_subparsers()
 	subparsers.required = True

-- 
2.39.2

