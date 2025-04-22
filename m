Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 387BBA97A03
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 00:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3550D10E3C7;
	Tue, 22 Apr 2025 22:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="inty0zDd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16FD10E3C7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 22:06:35 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so4851728f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 15:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745359594; x=1745964394; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YB1xGX6pFG9S33G4DkDnszbCcY9UyskbeFRbPxNa7a8=;
 b=inty0zDdeSXBqLg2rEKg3kX6qHo2RXlAxRN101jYL+/TiitHewyyP17ecCEFOHNo+z
 JC3fjxlI3bLuhtBDUXStXtoLLnGdShh6e3JUJspJjFlfBNH752uaUm3I6UziH50bjGIg
 BxvW30g4hYvUcKV4B9aszCXob+ITFq4wR+HlwazABqtk7nxlRZEGu5NEkG2lAtwrucgH
 Zi0KGOxaHfvQiOtvrUdsjbFXCJVcBp5MuePPh2z6dmL6XRumaO1Ax6rihifmbBJTBHzh
 sTlJsEE8BtdGdJ+I+ms5QswdacMqn6yp2OohVdKk3DGK90QprQToMyuvo+h2EOoZz0PC
 knhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745359594; x=1745964394;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YB1xGX6pFG9S33G4DkDnszbCcY9UyskbeFRbPxNa7a8=;
 b=d3F6atNfY/YPog86DTGBj1dj10m4YmSx61yFKtdppb3qwaIucPZFxRD2eLd2b4rYLY
 NI/Lxv+SuRDfx/lv0IAuzLDBQ6lXPQTvZaT/RL8K3jZTqwPcXVynpbEvsAtikbc+hktC
 J8BzUx3321CNmapuUoX3gh1oF/6y8tNqE9JWD7k1CEI5KNi0IRO0/OSqn8FylnpuuFRi
 WjFoZeP/DPCzTDwpzEItkwt/HlBIOF9zuskYSTmlwXEz0fAVN2gtSTiK7HzaIgWugs1M
 FRxAKZltMFm7SH7Zyj6s2solpD6qmkYdGuIBttsBJtXgjU9Q4Ukj0vNQjRhBStbErHuT
 ya3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmuQVHh7dfpjit+J9duLE0RabRvnmw94r/i0N8QaP3fEqe6RmHZCyAI9NjrF2YrVUytzynzlbLdfo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaweqFCH320NHk3JALVZWmynAaHRXDffurRq7Tko+CkZ6iTQpY
 W/B5dB93U5RssrL1MoNI47y0Y0HJ49DO2Ad5PBDTSzUwqCcdb3bsTjue6rQjmW2Fvg==
X-Gm-Gg: ASbGncur6FPmXwfuimPWMsBRrEUNiQSucOprbh4HBHfbT4OYvfmlk5XisOPpyHt1Zw/
 A4H8vrGULXyapUxujBlufaBSD5PukW6swxKlXmWcWm42NQaN4LfC9/p/3Uu55lfziwkFokuTPuE
 kVu6hpGkyVBWUfSd2JbOW+kFF6LsT+AYjoTrzBogAAFqXhvyNAztIjvSNrNw7+DAyNX5se3NueN
 APksJsgSfY66GsRbRfuiDTLb+iuMmCvsrqE59O6m4aGDmLcjp4pMGKwIBBdTPzn10Lh5QEM+wYe
 teGO5WLXK+1C6GG8Q1jQqwsIgeZADR3YBP55u8foAA==
X-Google-Smtp-Source: AGHT+IH2d7yNdQ11WUghNAhzaCdxOoKDBGRwo65j4Mt/Dnv6ia1u3FQoAdvO8VkKfmMezO5hiFWzuw==
X-Received: by 2002:a05:6000:2509:b0:39e:e75b:5cd with SMTP id
 ffacd0b85a97d-39efba2c98emr14484631f8f.3.1745359594331; 
 Tue, 22 Apr 2025 15:06:34 -0700 (PDT)
Received: from localhost ([194.120.133.58])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39efa4207afsm16716557f8f.12.2025.04.22.15.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 15:06:34 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] dma-buf/sw_sync: remove redundant error check on
 variable err
Date: Tue, 22 Apr 2025 23:06:27 +0100
Message-ID: <20250422220627.89077-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

The variable err is always zero at the point where it is being
non-zero checked for an error. The check and error return path
are redundant and can be removed. Issue detected by Coverity Scan
static analysis.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/dma-buf/sw_sync.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 4f27ee93a00c..ef3fda792749 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -437,9 +437,6 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 
 	dma_fence_put(fence);
 
-	if (ret)
-		return ret;
-
 	if (copy_to_user((void __user *)arg, &data, sizeof(data)))
 		return -EFAULT;
 
-- 
2.49.0

