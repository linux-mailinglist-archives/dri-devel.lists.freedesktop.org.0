Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF5FA6EB3A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 09:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1332D10E502;
	Tue, 25 Mar 2025 08:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="c/OhzHQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2830110E502
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 08:14:21 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-227a8cdd241so26020425ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 01:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742890460; x=1743495260;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kNYXBQpFyPKAPrC63ak+6Lghv9itCVCrzkPP9piyvFo=;
 b=c/OhzHQRVjytVCoyp9qgpbtRnf52LdkYKlL8JrrXZDbbv0rQ4PJ6qh5vSUJQGDG3hR
 IMevotmRQhx8+tMno8OTFt/UYhVyIMcm/L2WSrnnc3yfLlk+Ou4ghvyh+OG1vOec0/sK
 hbMjDhawyTcGbVqezZj3niLD1PUeBhdSpAJSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742890460; x=1743495260;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kNYXBQpFyPKAPrC63ak+6Lghv9itCVCrzkPP9piyvFo=;
 b=fNo316VYjg/yuH6RmU2dyS8brM7qztMd5FAMEC7U8JVpqrCfO5uBZ9YcH5Cgjn2UPS
 oPznkA5O/zlgV82aOSSUIimesZdFgxDiFy6PCAnQmPRRVzIdXFqrFlBe5A3aSMNxyCBQ
 spDkQ/1FRVhtwh5JOm22y51rOuIp4YnShGznDFaebhhItjhra9aFM/FU3BagEV3aXuvO
 1UpxBhj48Xr5deX+udWq7SNLbi13DcfjUapDUmzU0LEJX5RhmIBxDbMKa+ImFcWx9BlB
 Mm2kvc2HmQWbnlwObyO/am61cmN2iPsF6FuvrcyMC2/XI9OozytgIA+tjPYdPZlKvtHL
 dtag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhAxO4B0FNL9B+Prya7+AxOAkVe+Q6kbceF711ZMHaGGQg3gfIS3XdIkfeg/nYDQMhrqo+bMd9PPc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyo6EGtDiP/zsPaeAPU/8pL34gEwpVGnD3Vm5I/dJ5J+UF+Mflv
 sw1nMJDZqaOvoiDbq3WIkPfvroluxxVlsQS61hJtPDgQz6jvprU25DFFDbrM9w==
X-Gm-Gg: ASbGnctx3F7ICLA5cHEuaS3E+qCYx/EM7hMibmt/ce7Qor0CXEhePuNsmNzSkmAzHN4
 Ez6ZM4M0ysSXfHOB2m6JZ4rU9UhbbX0Cz/LYo2Vs4lGwSvNA6YAfwvz4jQ9qRHnr2KCUFA+x8jl
 n92CLFa2Wi1RexGHdUEf3WKJ5LANGb2DXWr0e99YdN+wAQaxX9l9latRBKhqf0/SMUywmiR0ijL
 6Upqgq9k1LmvcD4+Plb/UMuVXmqtNTTj71C9IIPQDSGThVtIX6TCYsozu5qxeVLMiqV4TLJQ2cy
 8y7PIRrGDyPJE5auVgXc0ZD3hVmCayWY1ZgI7nLtoxwgeRskT5QZBEtkQK+4OMyw
X-Google-Smtp-Source: AGHT+IGDbB2izvu+t9h4n+6kBg4rcIhVYj9jR1WRlX4F5kfsit9jrFvvckdmOs5NpmzKyk+jgcasxQ==
X-Received: by 2002:a05:6a00:3c95:b0:736:eb7e:df39 with SMTP id
 d2e1a72fcca58-73905a54b96mr28430513b3a.24.1742890460358; 
 Tue, 25 Mar 2025 01:14:20 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com
 ([2401:fa00:1:10:d83e:63a8:42b9:7425])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7390618c056sm9457156b3a.163.2025.03.25.01.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 01:14:19 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Cc: Xin Ji <xji@analogixsemi.com>, Fei Shao <fshao@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: anx7625: Simplify INTERFACE_CHANGE_INT reg clear
 write
Date: Tue, 25 Mar 2025 13:54:43 +0800
Message-ID: <20250325081331.1965917-1-fshao@chromium.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simply clear the INTERFACE_CHANGE_INT register with 0 and replace the
indirect `x & (~x)` pattern, since they are logically the same.
No functional change.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/gpu/drm/bridge/analogix/anx7625.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 0b97b66de577..df2d1dd95d01 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1586,8 +1586,7 @@ static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
 	}
 	DRM_DEV_DEBUG_DRIVER(dev, "0x7e:0x44=%x\n", intr_vector);
 	status = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
-				   INTERFACE_CHANGE_INT,
-				   intr_vector & (~intr_vector));
+				   INTERFACE_CHANGE_INT, 0);
 	if (status < 0) {
 		DRM_DEV_ERROR(dev, "cannot clear interrupt change reg.\n");
 		return status;
-- 
2.49.0.395.g12beb8f557-goog

