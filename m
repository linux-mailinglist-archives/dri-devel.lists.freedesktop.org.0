Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A72A9E3F97
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 17:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7C510E4FF;
	Wed,  4 Dec 2024 16:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="c4KADI1t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8C010E4F5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 16:27:03 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4349ea54db7so61775e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 08:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733329622; x=1733934422;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ndPjCiEchgmhN558RiQyP0Yt1FLq3iHOnb50r5toGHE=;
 b=c4KADI1tUAhwA1Esf+qE5w0jEwBdOhcsrmG61gMzcXVSIlpQ5YszfP2WZfFFz2+1w6
 dWBq+Q5xUOl//umEeMeQHtfT0ApSnPwFW/My5BwsHj+woVNYh7PQ261iXNOgaV2h/xJu
 dz8RQuSKeiNqbU6jesNTFSxHdoWG9DUm0XZqBXj+dJhZ335FiypYU5X9QeKHFIw2IZxV
 h+/FP6KiATdWTwbs46opQsRgsUHiVT/URgheNVGNz8e9FWpWlihoq6aZDkk6kalnPXGA
 8I99M2ox+j2qwhMz7v7vzFckMeS4RQFOfB93BwMqENmqJ43f41ZkS5WeaDP12f50oAWG
 gSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733329622; x=1733934422;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ndPjCiEchgmhN558RiQyP0Yt1FLq3iHOnb50r5toGHE=;
 b=M2SoYDuaj8EncFoz/W6RTRFiKKUpyjRKvCwy9LPNpgzqzBbzq9ANzuUfp3Xc5jN5Cd
 wRzw69JOOgbePrYmbQKOaH4FY8mp/UM4MLhK+omwotOc28cmhxfx/jjG7gPGPwJIz5ex
 B1l31C/aNcGPI8f5OKtqsSxhAQk5v5RYDhunvPBCC1/nRDbwEnpSyEXtQfnLkr2NAlcz
 hMX8pHIszP4lfReJt7hs473QeHtDj5kmXJcLmkcSfO2QjW+28LRlIEL92icIIrfco4oT
 FitlKyfICJUG6Fy3/GYLsu9uALOXxKPujL6b9C1CnI8eKJFba/F6jX6kylG0zJOQdktV
 BcwA==
X-Gm-Message-State: AOJu0Yxi5clI/QktrJcvtu+crV9oZga/3DtbnnwhfOCUFtrO4bXkQw64
 CA5ulRMtu7LGR1fV+MAgeMsNykhBq+avuDmSJ4aXNpRk8Ufoqdv+OZgAD2c4Gw==
X-Gm-Gg: ASbGncs+szA40lu9P7QQ+oRid+GtX7PsBUFL68dwOdJByq3vVflnTKOHYVo1gbp+X3p
 3BeQ/5DuTpgSYRzzKhaGscudSJIDwl3KpW9ENESartjSRxIoEEl1OVz+PkmQznHy7ZrR3yCVvru
 xEuJsKr92CwYSdnaK3zAOMY2JNvB/TiiKBvOzxpikVlbr0eXglvuLHkOnWr6iRDHV11Q3XwM8Px
 kCIcpRYG9AYtDD3quJXkA+DQWNKniM6V6+lxw==
X-Google-Smtp-Source: AGHT+IHRNnKQuL0FzYJ9sRykYWh8jH2cm3zF2nEbZZRSS5rqUEb9oxCGR02zINfXQfHQRF/jLblOew==
X-Received: by 2002:a05:600c:3ac8:b0:42c:9e35:cde6 with SMTP id
 5b1f17b1804b1-434d4a5d4a4mr1384465e9.2.1733329621419; 
 Wed, 04 Dec 2024 08:27:01 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:4606:5fa1:8ade:6950])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385dec66e0esm16298133f8f.43.2024.12.04.08.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 08:27:00 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Wed, 04 Dec 2024 17:26:20 +0100
Subject: [PATCH v2 2/3] udmabuf: also check for F_SEAL_FUTURE_WRITE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-udmabuf-fixes-v2-2-23887289de1c@google.com>
References: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
In-Reply-To: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
To: Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, John Stultz <jstultz@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733329589; l=1031;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=fJkw2rLMTtXSXhulM8gnhffaFfLiI1f0yAZSjHGcIX0=;
 b=NhY0leWwseGXjAz22badChvpbfQCiGr6eextWw4sxPskRjjjSOJH/wPzPkPy4s/BHbCWwcM7p
 LC618vgQbjWCzsNvNI9+Z53VJP06p8zJnx97CEnj6l4JcYpay7agU4B
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=
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

When F_SEAL_FUTURE_WRITE was introduced, it was overlooked that udmabuf
must reject memfds with this flag, just like ones with F_SEAL_WRITE.
Fix it by adding F_SEAL_FUTURE_WRITE to SEALS_DENIED.

Fixes: ab3948f58ff8 ("mm/memfd: add an F_SEAL_FUTURE_WRITE seal to memfd")
Cc: stable@vger.kernel.org
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Jann Horn <jannh@google.com>
---
 drivers/dma-buf/udmabuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index c1d8c2766d6d36fc5fe1b3d73057f6e01ec6678f..b330b99fcc7619a05bb7dc2aeeb9c82faf9a387b 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -297,7 +297,7 @@ static const struct dma_buf_ops udmabuf_ops = {
 };
 
 #define SEALS_WANTED (F_SEAL_SHRINK)
-#define SEALS_DENIED (F_SEAL_WRITE)
+#define SEALS_DENIED (F_SEAL_WRITE|F_SEAL_FUTURE_WRITE)
 
 static int check_memfd_seals(struct file *memfd)
 {

-- 
2.47.0.338.g60cca15819-goog

