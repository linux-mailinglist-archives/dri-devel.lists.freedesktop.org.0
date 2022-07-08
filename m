Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEAE56BB64
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 16:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D1B10E4FB;
	Fri,  8 Jul 2022 14:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C92810E3CE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 14:00:45 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-10c0d96953fso15730033fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 07:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3UgR/HhVj1nXX1EG1+ucD5+Xft2U61MRwnSffpbm57E=;
 b=lfQ2xnjxFk2BmGYL9HJ2uskGjN0vb1GClE6YoTrhI87XrDqNdRrmAnqv9Ry4john35
 JrGWiiJu3kXO9O5TEgRw+Symb8D3+03hG3hviLPRgH/sglLiL1+PeA7HoNEdHlkS/DT8
 DUNk7rP7GVGPiVOte4TDGqG1JOLm/HxQLX3SwdM+r3+TwsHYv32WDXoLF0ujAnGxmrz0
 /JIxhOo/jomrMYDNd6pVseIWP2mcXiWmZAdrlcByF/bwfwOhNDim9TfradmFiodycyjR
 1eB+qFW+B7zt0xxkcoh4lViAeqQu4SP6fWL3ZgYY841AMPpJSOJcsINIqb26XDd4t2BR
 nwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3UgR/HhVj1nXX1EG1+ucD5+Xft2U61MRwnSffpbm57E=;
 b=A25lkoftO1IXsQmDXxUDaG5V3A2D7ppoGCo4Cmt6CvP6oSs2JBr4H+aM75XNH7N2dH
 3dV7+HZhy5lqQKQSCLiT6obMJvNdNimr4Lxzb5NPC9PmI6MrFe7vV56IbnmkCq4Z+Fag
 ZZU2hxuJUOBKlMvKzdLhfKTAEpeujHl2qHQwsOz+sQIpzoQz8tFeFSYyAfjtC8ht/7At
 pEYQr+sKZJiPVgcxtIbFyrDMklcKrgIwobbq6oeoJTlJN1E4aII5751MXf/+yYbUiVEK
 /FeJsa0xCZVoteRHofsJStgbWhf6kiYaGSZMz2ayMpwJjK8eZxTUaVzN15tOJR88U49L
 O8VA==
X-Gm-Message-State: AJIora87jhR3Dn4EphbJA7WXHs2qA1TMYOhg1dq4slpQ+TKa536Hd7Vn
 5d1M1MHssJRrBfW64P0MNcM=
X-Google-Smtp-Source: AGRyM1s0u5oMdr1BuxvX7R0I4sYWfZwUaSkd8Kg7mRjUyHvGJecAJmQc1gYJbV9XEl2Hel+GKmLAHQ==
X-Received: by 2002:a05:6870:479a:b0:fe:3958:813e with SMTP id
 c26-20020a056870479a00b000fe3958813emr6454788oaq.279.1657288844655; 
 Fri, 08 Jul 2022 07:00:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:d9ab:f839:6ca8:15fa])
 by smtp.gmail.com with ESMTPSA id
 x31-20020a4a97e2000000b00425beedad70sm11412782ooi.32.2022.07.08.07.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 07:00:44 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robert.foss@linaro.org
Subject: [PATCH] drm/bridge: ti-sn65dsi83: Add a sysfs entry for the pattern
 generator
Date: Fri,  8 Jul 2022 11:00:09 -0300
Message-Id: <20220708140009.1665714-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: marex@denx.de, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

The sn65dsi83 chip has a test pattern generator capability.

Add a sysfs entry to allow enabling and disabling it in runtime.

This is helpful during the MIPI DSI/LVDS bringup.

To enable the test pattern generator:

echo 1 >  /sys/bus/i2c/devices/0-002c/pattern_generator

To disable the test pattern generator:

echo 0 >  /sys/bus/i2c/devices/0-002c/pattern_generator

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 42 +++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 14e7aa77e758..bb94b3fe9b17 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -731,6 +731,47 @@ static const struct of_device_id sn65dsi83_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, sn65dsi83_match_table);
 
+static ssize_t pattern_generator_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t len)
+{
+	struct sn65dsi83 *ctx = dev_get_drvdata(dev);
+	bool arg;
+	int ret;
+
+	ret  = kstrtobool(buf, &arg);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(ctx->regmap, REG_VID_CHA_TEST_PATTERN, arg ? 0x10 : 0x00);
+	if (ret < 0)
+		return ret;
+
+	return len;
+}
+
+static ssize_t pattern_generator_show(struct device *dev,
+				       struct device_attribute *attr, char *buf)
+{
+	struct sn65dsi83 *ctx = dev_get_drvdata(dev);
+	int ret, test_pattern;
+
+	ret = regmap_read(ctx->regmap, REG_VID_CHA_TEST_PATTERN, &test_pattern);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%d\n", !!test_pattern);
+}
+
+static DEVICE_ATTR_RW(pattern_generator);
+
+static struct attribute *sn65dsi83_attrs[] = {
+	&dev_attr_pattern_generator.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(sn65dsi83);
+
 static struct i2c_driver sn65dsi83_driver = {
 	.probe = sn65dsi83_probe,
 	.remove = sn65dsi83_remove,
@@ -738,6 +779,7 @@ static struct i2c_driver sn65dsi83_driver = {
 	.driver = {
 		.name = "sn65dsi83",
 		.of_match_table = sn65dsi83_match_table,
+		.dev_groups = sn65dsi83_groups,
 	},
 };
 module_i2c_driver(sn65dsi83_driver);
-- 
2.25.1

