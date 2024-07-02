Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2913F9246A8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 19:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0245410E21B;
	Tue,  2 Jul 2024 17:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="at/nAmT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF0410E610
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 14:48:52 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-5ba33b08550so2204816eaf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 07:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719931732; x=1720536532; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lbzSX2jm/CLVUUZ3qU6O92SO48UCb5doHo+EGGpsX5s=;
 b=at/nAmT1imxYnbvL2yBDKZc9c4AWBTgX/rW/jyAVIYtfkaItNwsPzZuelwws6skOCH
 Igv5DILsm8iGLMlBsFz27eBJes6sOGvl0ipYQ8jbAQ9MTvPtxtO1UmVDJG5HZXnqe1JO
 0IkmlabDwf3dS+N5+Nk1hNUFQbWWl0ti0iiLJgKWcHJstqPuVh7GPyn8mQPg/FyUHW6D
 xRLGFBHzynSyR9CyJD7hcBKvI8mngC3lv0WP/JVeB/Q9J0wizM59XOnr0vTzQDGGM2As
 +QaS2FrhXx4q7ifPWF1S+KZnFxcdKJI84rHZ4OosLRBgXqljv8k9XIOKYSf2fKuS3OAc
 1lEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719931732; x=1720536532;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lbzSX2jm/CLVUUZ3qU6O92SO48UCb5doHo+EGGpsX5s=;
 b=s4245MJbSXU4DSpyBbeUZVoDqjdrzeOz1v2k88FIw7pPUtFSBtzRfYD5L+fWuQoZ1g
 vfpy0IYSvSuYhraSLjN+iyn6NVOF15E8++ASY4/xf54N4VerqwdJwVqQRL1CUjuyNtmJ
 vm/Zx6dDNBFeL5RdiHsK6Ow3fszOwl8aCy1quLeku4ykQi7K3ClsqfH0QV0nl9WoeIuD
 4E2p4fHW6a/EuPCLamEyYXeoqfagx0KrCTI1E6ZU/U/ZOOlpdBru+bRYU/VWDm4u0HDx
 UROw8tfkX7/f8w6gDbZtV5LtALkNLUxiCZnw02oeKS2qxwFmCePDliPd6Q9hWTpoGG7W
 2jAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgu96Rwz6fc2GjgzIWveAv+m5zfIJAvCjVru3tGivokcJ3d6G6NLNUiHWT7lEqsUCEYo+BsiIYEFWh9VUDcehBMgiVA1FUEXWvk9BL5FSa
X-Gm-Message-State: AOJu0Yzkea5kOm+Yjy38cjqfwOO+SrCNH6sQdaFT/qLGErD+i2uBs8O/
 s4TvITTlW/jhikNeu/pYmb3OUe3wbICDUuDlgImJeHXnKA4H5lki
X-Google-Smtp-Source: AGHT+IEoKjeHNdhrVeltAR3pigvzckm+881yE7i+H5fpSRXSBafQKcZfdKbF9Ig4QexHTY4SMiyIBg==
X-Received: by 2002:a05:6358:9486:b0:19f:346d:d1d1 with SMTP id
 e5c5f4694b2df-1a6acdc06e4mr879562355d.16.1719931731801; 
 Tue, 02 Jul 2024 07:48:51 -0700 (PDT)
Received: from dev0.. ([49.43.162.163]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-72c6b48e198sm5687831a12.51.2024.07.02.07.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 07:48:50 -0700 (PDT)
From: Abhinav Jain <jain.abhinav177@gmail.com>
To: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com,
 jain.abhinav177@gmail.com
Subject: [PATCH] gpu: ipu-v3: Removal of of_node_put with __free for auto
 cleanup
Date: Tue,  2 Jul 2024 14:48:36 +0000
Message-Id: <20240702144836.1001916-1-jain.abhinav177@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 02 Jul 2024 17:49:15 +0000
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

Remove of_node_put from device node of_node.
Move declaration to initialization for ensuring scope sanity.

Signed-off-by: Abhinav Jain <jain.abhinav177@gmail.com>
---
 drivers/gpu/ipu-v3/ipu-common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index 71ec1e7f657a..f8cc3f721d2a 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -1150,10 +1150,10 @@ static int ipu_add_client_devices(struct ipu_soc *ipu, unsigned long ipu_base)
 	for (i = 0; i < ARRAY_SIZE(client_reg); i++) {
 		struct ipu_platform_reg *reg = &client_reg[i];
 		struct platform_device *pdev;
-		struct device_node *of_node;
-
 		/* Associate subdevice with the corresponding port node */
-		of_node = of_graph_get_port_by_id(dev->of_node, i);
+		struct device_node *of_node __free(device_node) =
+			of_graph_get_port_by_id(dev->of_node, i);
+
 		if (!of_node) {
 			dev_info(dev,
 				 "no port@%d node in %pOF, not using %s%d\n",
-- 
2.34.1

