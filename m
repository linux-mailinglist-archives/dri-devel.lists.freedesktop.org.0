Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3E1743F9C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 18:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EE310E180;
	Fri, 30 Jun 2023 16:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3FE10E180;
 Fri, 30 Jun 2023 16:20:47 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1b7f223994fso15359525ad.3; 
 Fri, 30 Jun 2023 09:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688142046; x=1690734046;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MvQqSOwld0u4zK5BJ70Rav7WOEh2jpi5bzncu8VS9ac=;
 b=n0ntrjNOW5eEsntD99X/VD7B/V72JXV/DfIACX12iLR5if6dNtjiz3sq0kknAISiQ3
 fLSV94JrDhizxh5K+HqK3IOL1tZq+1fcVVkxWShI4QddBHkEwE77wCLP+T5gCvL28g12
 ZZGw/Oj1i6gPRUuy90uIRn9c/kHF49yl+fGJQ46393bJt29QBWLREKsAhM8eqxCHBQRe
 /E3/+B2AzLFrUCvTL/Rf+YcCqhAl4YAekp7Y0fos3f0ODUmAB0P4aac++0e581sU8Qgj
 aHFluOqWzrBcUnyiVOF2OXNMNIqM8WWGIldoQdZEOHqBQ7aRaWJM2sg9FhBFSFnG+VXv
 gVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688142046; x=1690734046;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MvQqSOwld0u4zK5BJ70Rav7WOEh2jpi5bzncu8VS9ac=;
 b=StPFvvCa9lPUp/Amf2bXjkYfNmB1mydQjSuUYS4d4sQiv4q3qNLFUToWtCjf8Zw3q4
 NjRWhlJhRPy4DoD3+vKKbq0oZwtnPVb2qwrhW1MbTsReJa5yKoRkXr2g0rBN0jXrU0/b
 s3kXO2UqE0jUMkmf9Q0+G+Y2PV0IbQXkAzICN51QKOXm3672RESOMXkL0lk8T+MXMjrb
 1Ptf2ZTR7WkrzVHJohLVamYorBuyVosLVYH9R1iRlopYWVuCKXANR/zpeR+mi6YT/tdR
 PSCf54q6yDaLUD/nlalmUTLap1+6my7/m4CtgaMwC8vRPJmSOz2KY7Z6N/7ZcsEGsNEF
 VTiA==
X-Gm-Message-State: ABy/qLZCg7Dy00c+g3SQ77krNY6xA4SZ5/hMjv1wPO/tOLyOBlbbkcf2
 S48Wzut1on522r/bWgR+1oEl3Q/CeqY=
X-Google-Smtp-Source: APBJJlFDvWDDFvnv0o5w7ozeVYf0kMQ00E73cWaaTcRb9xv5AvdkmVcIp8x2f0vsnut9Evl5WNX0OQ==
X-Received: by 2002:a17:902:d48c:b0:1b7:e49f:d with SMTP id
 c12-20020a170902d48c00b001b7e49f000dmr2881877plg.28.1688142046512; 
 Fri, 30 Jun 2023 09:20:46 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c08400b001b7fd4de08bsm9192350pld.129.2023.06.30.09.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 09:20:45 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: Fix misleading comment
Date: Fri, 30 Jun 2023 09:20:43 -0700
Message-ID: <20230630162043.79198-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The range is actually len+1.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index eea2e60ce3b7..edf76a4b16bd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -39,8 +39,8 @@ struct a6xx_gpu {
 
 /*
  * Given a register and a count, return a value to program into
- * REG_CP_PROTECT_REG(n) - this will block both reads and writes for _len
- * registers starting at _reg.
+ * REG_CP_PROTECT_REG(n) - this will block both reads and writes for
+ * _len + 1 registers starting at _reg.
  */
 #define A6XX_PROTECT_NORDWR(_reg, _len) \
 	((1 << 31) | \
-- 
2.41.0

