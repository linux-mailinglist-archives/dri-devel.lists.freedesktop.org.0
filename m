Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA28DC1CAD9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 19:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4968F10E81F;
	Wed, 29 Oct 2025 18:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oiwcaUpA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795F210E822
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 18:07:50 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso690185e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 11:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761761269; x=1762366069; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KNwV3kIKfmFe80QZSUe0lDX9k4qYiLpxE6LgR+ZybE0=;
 b=oiwcaUpAZ6Z2eblcYguNU9wtRerxNKz7iq9HlS6mR1I8tZb+wGumHXmmp8lvp2X/x1
 i6Dioe5LEjQfvoDJ/qIRKpvRdU4ZlF7/QD9AxPhcxHAIJ34qcFNJw15eElSzilP4PFy1
 cmNOMxb1s9bUZXuhr4J5Df6ONZoN65jKWyOE5LM11ubnD4sK1elNrKMMm9SoQtpnNlep
 07qiiRZBsIlEmyOZbSnUOJd/wH9o+PSNanXF58jRJLESx9cWGSYNEqUlsPTDeOnwKgm0
 0n9oU4TQGJ+KgTKzBhQrMCIbd2BjO7bIyWarj0Twhd1VPnaap3Brl+e/AfB1SEteV3qu
 lOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761761269; x=1762366069;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KNwV3kIKfmFe80QZSUe0lDX9k4qYiLpxE6LgR+ZybE0=;
 b=kG6b12YzJu29nzNDqZYF/HnmM494P9KchxmFj/hhDBUO5k+GSumWIIr8+75+pvCBsf
 p7e05ARHPrL5tVqIrmX2QVEe4FvAtSc+VzEX0hG/QCKR6sujqQ7ewyjcoo4kPxHPE2gb
 LbPbRUSLqOonRAb/I8qAMiUGZOk5SHiztZL9xBib4wfoOKt/E28pNiBIWQNrKmJ7P+1z
 WOxxCbRu8gjCK2pn4kGELdHPsXA4V4NmliprcYysXPkHJYrG9Xmcpr1AwYHaG6uPXyYr
 YUhK5pSLNuPx8GHUa4qLfLy0ZVddNex8d6zPlIW/bxkByAkxsMgfV0FEWWPE+yPp2SJC
 a8iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz2gnGsu1DR63Jdm3GrHeq6NtRT+GfDbBsHVTm1EEdlOhnzlkuY+ALAbbBbCxppQWis5HAxW3uDPs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC1nApTDYFjIQIVI8W3E96PLOngPzMQ0CCjNee9OuSsYojPaI8
 cbgQV5pKrblKK90Zkg24BK3prw515k6212M4q0Ka3/cMie2QT/lY45A60tLpRgequsU=
X-Gm-Gg: ASbGncviniMXls7lbWO5nXMDBqOG5BKWQVDkgiC2645L4F31m/bCwmwroZPCr+S0Rpu
 +LgLyK88usHlbvAoWAQpFEnzgtB1KH7ooD16G4LUCD4L3f80cCArl6kzUSyXMYpOjBk1OsNvR3q
 OjCjPLIVfBWdfS0yF8o5moqUfOXwl8lmIwrjsTMEgmNyth71QisdnoCg6MIRo0+am4B30QvIcbt
 e1DwcLrMm+E6E/TbZjw/snv3gfU9gIp7haruN/Fjk3dttR4V7WHJPK3yg9TU3qtAgEHkKfwcU3/
 TFjTAlGZXIsheDMDGGV6YCNKxZpqAtzxL8+AEgibhwJ83M8O8LcOe5/sPrlbxEw+MhAQScvutDy
 J6y5cTrR1uGHkXyf5H0ivBOKs2Q/YHjaSX4kR+0uDH/BuDxQNSpefD4I4Ptsk2tsUVYgGn0SKUe
 0SBlwp2ND0WCn7XBTL8bRe
X-Google-Smtp-Source: AGHT+IEtMPjVh9Zcm+7C9F/ERY97bz/iXjm8g8W+QKNDx62F94FG9cv5Huxi+liF2AyMpIvvFbv2hA==
X-Received: by 2002:a05:600c:4707:b0:475:dd04:128a with SMTP id
 5b1f17b1804b1-4771e1e10b2mr35660565e9.31.1761761268523; 
 Wed, 29 Oct 2025 11:07:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47718427409sm49662015e9.1.2025.10.29.11.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 11:07:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 29 Oct 2025 19:07:42 +0100
Subject: [PATCH] i2c: qcom-geni: make sure I2C hub controllers can't use SE DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-topic-sm8x50-geni-i2c-hub-no-dma-v1-1-5e264258a5bd@linaro.org>
X-B4-Tracking: v=1; b=H4sIAO1XAmkC/x3NQQqDMBBG4avIrPtDMhBNe5XSRYyjzsJEkrYI4
 t0buvw2751UpahUenQnFflq1Zwa7K2juIa0CHRqJjbsrOE73nnXiLr5wxkskhTKEetnRMqYtgD
 vLbuhD72LI7XMXmTW4794vq7rB/dzaxxyAAAA
X-Change-ID: 20251029-topic-sm8x50-geni-i2c-hub-no-dma-8812576a65cb
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wolfram Sang <wsa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2132;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UJ2DT1Tiu56DrBbBEh0/iWktyI9wRry2MbdlaBokZTE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpAlfz8LKSj8+mAZ1QksgODZDbo1w7yGU4iVg2tYA9
 VBEcFOKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaQJX8wAKCRB33NvayMhJ0S2wD/
 sFxj0QkeV/duZgx4BgvFB456VI+EtWZMBJ3QVO9ZgwzJOGzQJplBMPxpyNBxWiRt1hSl5e/nOBUmXE
 R/tv8d5Na4+kXHgxezaH2dDB9hBVX8+7mKi6KJtH4KQChVQ5fsEwqPVeO6/dg5DTELvu6mDm+O3OF9
 Kzn2e3FgP2wbPrGCao5up8PR/wRUCP6zAbdYCWgf+D54nNkdZqLW90pRZxk8FGSPIW4AmSOs15Cc2R
 Te996h007PCHLoEEfRf0bAt5lweueUCL/vnRMNIArrJ2noAoclVA7YJ5NyRaJtJ1+p3DDzVAVbCgPT
 QxLDlvYyzc10fmx9aGlhqpRKmmrFjrI4RSO0swEpScsFdOGdnplAWs2lOKxKRhu3V65e5gIu0jNlBW
 keYbmpfQZ+vvPBlPwzL6AK3KDHuAEaRniwekbixKVm62NNXHPwyz3sBPnoNnsfI5qIP31l3I9/3cLR
 m/ywztQaFH3AWrdoSzWJrQkJueG2NgK7JveuZjlM4W0efx0ps8OIMbRnBcCg0k436Yt8tUspx8KZzw
 qVetRqhHG/LSK4XVa5fceQfGqVhLkJ+/8INRV4Mxji7EqSg63no5xELxabQZTg2RHF4edYk1rOSQrZ
 LmS4OPAo0UyyWqA3ZZ1hx2RX6tFe5s7yybh4qXJjkw0WzLOo2OswA6dki/aQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The I2C Hub controller is a simpler GENI I2C variant that doesn't
support DMA at all, add a no_dma flag to make sure it nevers selects
the SE DMA mode with mappable 32bytes long transfers.

Fixes: cacd9643eca7 ("i2c: qcom-geni: add support for I2C Master Hub variant")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 43fdd89b8beb..bfb352b04902 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -97,6 +97,7 @@ struct geni_i2c_dev {
 	dma_addr_t dma_addr;
 	struct dma_chan *tx_c;
 	struct dma_chan *rx_c;
+	bool no_dma;
 	bool gpi_mode;
 	bool abort_done;
 };
@@ -425,7 +426,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	size_t len = msg->len;
 	struct i2c_msg *cur;
 
-	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
+	dma_buf = gi2c->no_dma ? NULL : i2c_get_dma_safe_msg_buf(msg, 32);
 	if (dma_buf)
 		geni_se_select_mode(se, GENI_SE_DMA);
 	else
@@ -464,7 +465,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	size_t len = msg->len;
 	struct i2c_msg *cur;
 
-	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
+	dma_buf = gi2c->no_dma ? NULL : i2c_get_dma_safe_msg_buf(msg, 32);
 	if (dma_buf)
 		geni_se_select_mode(se, GENI_SE_DMA);
 	else
@@ -880,10 +881,12 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		goto err_resources;
 	}
 
-	if (desc && desc->no_dma_support)
+	if (desc && desc->no_dma_support) {
 		fifo_disable = false;
-	else
+		gi2c->no_dma = true;
+	} else {
 		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
+	}
 
 	if (fifo_disable) {
 		/* FIFO is disabled, so we can only use GPI DMA */

---
base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
change-id: 20251029-topic-sm8x50-geni-i2c-hub-no-dma-8812576a65cb

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

