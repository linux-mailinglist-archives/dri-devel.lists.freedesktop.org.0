Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E73AA1C3E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 22:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A158010E05C;
	Tue, 29 Apr 2025 20:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Mbw8XXqN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5DB10E05C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 20:34:48 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-301e05b90caso7158558a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 13:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1745958887; x=1746563687;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y2BGR8r3hxAteDuDzrcwyL9kGTNOc27jjGhVFTFnJ6M=;
 b=Mbw8XXqNlcUmVeVHcozMNPQdyU6zTzy6J6TQmtoBFuR6tttqyorBsA8QFlB0WfUSXA
 wp98nMBh1d+eSWd6NgpcS4hsDCZWMVtvWA0ddEDZNo/HpZG7ZdFAt8H8u+xROngxgkzF
 ee7CEuk5hnOs5AU2v0RStSlJ2QHol8qsOkBOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745958887; x=1746563687;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y2BGR8r3hxAteDuDzrcwyL9kGTNOc27jjGhVFTFnJ6M=;
 b=GGgThf8zz2I6rgG7POzQip6kh6sUxAoK6Y1H9B1pqIaHaXtDe1bnSgLQpdJmFvspw+
 14IOHlEqpyocUN79sYdQkOtgA1RCXPHO1yDDJ7cXWyunOnDs++2CSDWv0hDagZK/E3DG
 /j+UxmnqNN4R/x4hIGRbrvET5BS1OtMmJa1KMlQtcLTLJXvVAMaedqTiUpgswkR80aGD
 JQOEzEbgFCp2928IQQ1WNGNTDnCMgbAhqCrRR8Q1HP6fHpXfJn/aUhie1CjqH6KkEs2r
 v1OKqrklV6tIsgsprcWkyBeOCX4bXTbRMzW+QxKXwhT2E0J2NEmfjeByCiVf/OEZ5mkb
 EfuQ==
X-Gm-Message-State: AOJu0Ywe4lsclsF69JVgnX3GATydwuVpb8Dp+bGKrYwHIPytq3jyrzzJ
 9CUhCzJDvfZj7MKBMbdVu+HWMZAxCf93e0iXHaIywHQV8RqzhjgQw5GiSm6HPsa7GUS1ewv8hUR
 VukcJHy7ahViOtWzPJ3n4oZTpZ/YKjgdAH326M5PFE614/x323wOx5iFexHqW82ExxgPznJLYn/
 BqMjAVO5F+6zlZhHEsS7MA+yAi9jy4gS6Zbo2pAMIU8Zpo9Bys7A==
X-Gm-Gg: ASbGnctjAk33WJMxE5d7vQ4TW5w3ckRb0xM3GxMzXDBekQv9MsCVOmBm2wNqAHm5TRn
 1F1U6CYBX7dOBu2ZvcNtmpFj6HOm8i7KCnWiCkB389PQX2zaPWbqQ+6CFE9nBPIwFozkFj/KUa/
 XTg+KXeE/zwNtm5KWygrKq4XlqDkE/bThGU+dIkjjitlYQZufTa44veKE+uMz7+a2wUBA3msAZW
 VVHgtl90Fxe6yujCVoK2Arotw01kDYUNbzbg1tWpyLSelHbl9IsR35mVBU2OkEmneQRBVLEiaya
 nto56sVwPIuiDUcJxciouQXERFvamuloRf0HOElPs5ddjdUwmfICXEGP7O71u2jWSwj4rHlWnyW
 GIOh1kttxGw==
X-Google-Smtp-Source: AGHT+IHlabKtHOP3U9f6RCoJIer621nmA/JMTJNfoB1aOlGDby6qMDzRPIk2O2kPw/fapLeuAflxRw==
X-Received: by 2002:a17:90b:5868:b0:2f5:88bb:12f with SMTP id
 98e67ed59e1d1-30a34422574mr91386a91.21.1745958887203; 
 Tue, 29 Apr 2025 13:34:47 -0700 (PDT)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15f76f4219sm9381339a12.6.2025.04.29.13.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 13:34:46 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Fix Host-Backed userspace on Guest-Backed kernel
Date: Tue, 29 Apr 2025 15:34:27 -0500
Message-ID: <20250429203427.1742331-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.49.0
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

Running 3D applications with SVGA_FORCE_HOST_BACKED=1 or using an
ancient version of mesa was broken because the buffer was pinned in
VMW_BO_DOMAIN_SYS and could not be moved to VMW_BO_DOMAIN_MOB during
validation.

The compat_shader buffer should not pinned.

Fixes: 668b206601c5 ("drm/vmwgfx: Stop using raw ttm_buffer_object's")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
index 7fb1c88bcc47..69dfe69ce0f8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
@@ -896,7 +896,7 @@ int vmw_compat_shader_add(struct vmw_private *dev_priv,
 		.busy_domain = VMW_BO_DOMAIN_SYS,
 		.bo_type = ttm_bo_type_device,
 		.size = size,
-		.pin = true,
+		.pin = false,
 		.keep_resv = true,
 	};
 
-- 
2.49.0

