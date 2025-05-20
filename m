Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6898ABE734
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 00:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE58110E59C;
	Tue, 20 May 2025 22:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J6nb0gpj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5C310E576;
 Tue, 20 May 2025 22:28:28 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7c55d853b54so66733385a.0; 
 Tue, 20 May 2025 15:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747780107; x=1748384907; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PWFKF59SFWdM/wiMmJ8++2h8NAOWZzrqbxkSzmUD59Y=;
 b=J6nb0gpjVDMfeR0Z2d1437KuSQMf58m3UeKONLpA2dXAyUCPFJhlSdizax80ofilW5
 HtFcFU8o3e68/8gk3ARH8TehDMZqy74MAbPCq0QYPWh3KXC0wcyip/gDhNC7T6H+h0mi
 +XZMQ1jTUnGTBG7kY2/CoG0yydds4x86Q51EGYOpXUGa2/DONYRAPvZUDZRR5xu0sCmN
 iYHcRl/iMVJBHgisqcF3DPi3+kVShEru7On11WmlBnON/5ok1qBf22sGY003XpnogL+C
 pSa9uGT7kxCQ2fBG6WMcBVudaHGcs1OZy1jchqmQ14D3P/HKXKSeKxRdNiWc9zjeEkBe
 I+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747780107; x=1748384907;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PWFKF59SFWdM/wiMmJ8++2h8NAOWZzrqbxkSzmUD59Y=;
 b=kRB5O/dxZLz52lvTnClo/52xEIwM2ersqNpYlgdO18LwQeR2NTJQykohS9YFf9+HEK
 dX+cZAIFepC8iRek0saWpLUpCcrJb9lCCahPmXfDKCxLD6Bhigt28mWRyWUnpvf99ocD
 DV5j2B4COkSnjQqhxSHFyUvF3tJpf1UReNVh8ocHm4SytbZRyttNgUxhw/3zH9H0x66G
 CCNqB/WH7h+qXFecqIn/LnezFtPsUd6v7b/p713tQQwt6SbOTO0A1RdcFD5CLfKjtOzh
 uB49JxILjsc3sMzgChMu0fpN1Mgh55gQ97rhLTRwtqX7CeASgVLa1/vI8Can7zijNWhB
 fLjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLItWBMMOmoT4+/vNaYY5ERL/V0JpJA+IDme5UuCjfdRHFPQZnaxiD2aUCtvquJTVzrxjL90skF6A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzn02Vo9Q9Fp81QQ1Ct7tc6F3CHcVVXXDGXFtJxHrjDYfSPM5o8
 7vyW0lbIvM71tQQxoSKwxPvr4RT+Gu8OapuAY/caJDlhpB4144fyDUMs/a12R2Om
X-Gm-Gg: ASbGncsuX3WfwYFGSJBIA6ptRKi/xU6KpOXsHdBi5BKaGYSDcCwH63lIcW5vARzztjg
 kd19jWXnpPglJZYwWKjCzVzoS1r3Jjo0hS/IM5KHfIyYxGTm1WelvO46Sa0T4A0rTyWF3bAXizc
 FwoEXSiUAVfA8mZTQH+3c6qxZ7pxHnWPdOZ2n5yQfvrgfiwqqNnpkJOPe9/cJBf/ej+JYaaUlo9
 nBrgx4xManksGo+X87BF9sERfx7rve8pV2lSZmzJQQFrMu6GpsRsqv/mOulSyw0ZfJRJAxBo3rx
 RwRISETkm5kIFcp/xP+JiK5lNmFhldt7BhuPBQP7mJ1AAT/oexUIrdHEarwK46qoDzDQbofcgry
 AycZODVA68uIMUZUfa0pV7U2vt/gdnA==
X-Google-Smtp-Source: AGHT+IFwCggZVnq0+BMjPcmOZrNovZdFLw9nc5EPMNuZ2eI9ZwccEx3KQINjF2sPNSYjOr3fwEv1jg==
X-Received: by 2002:a05:620a:852f:b0:7ce:b3e2:3831 with SMTP id
 af79cd13be357-7ceb3e23b24mr593443585a.0.1747780107440; 
 Tue, 20 May 2025 15:28:27 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cd467d7eddsm789957885a.34.2025.05.20.15.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 15:28:27 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 18:28:06 -0400
Subject: [PATCH 2/2] drm/msm/a7xx: Call CP_RESET_CONTEXT_STATE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-reset-context-state-v1-2-b738c8b7d0b8@gmail.com>
References: <20250520-msm-reset-context-state-v1-0-b738c8b7d0b8@gmail.com>
In-Reply-To: <20250520-msm-reset-context-state-v1-0-b738c8b7d0b8@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747780104; l=1772;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=rNtIbenOHZo6cAXvN8QM8siHt6w4YTDKArQ0feo3U34=;
 b=HC6vghXLmF/DQrcKuwKJFx4KIt9weVWX+fJMYLd+RBqroXr7I6aY4Hvah9cEra6FMcYeP+0C9
 pO63+OekHpWDcwPEg8F+tflQTPR0zYcgToCdvaMgAGkcfBwjx2o/afI
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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

Calling this packet is necessary when we switch contexts because there
are various pieces of state used by userspace to synchronize between BR
and BV that are persistent across submits and we need to make sure that
they are in a "safe" state when switching contexts. Otherwise a
userspace submission in one context could cause another context to
function incorrectly and hang, effectively a denial of service (although
without leaking data). This was missed during initial a7xx bringup.

Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..f776e9ce43a7cdbb4ef769606ec851909b0c4cdd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -130,6 +130,20 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
 		OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
 		OUT_RING(ring, submit->seqno - 1);
+
+		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+		OUT_RING(ring, CP_SET_THREAD_BOTH);
+
+		/* Reset state used to synchronize BR and BV */
+		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
+		OUT_RING(ring,
+			 CP_RESET_CONTEXT_STATE_0_CLEAR_ON_CHIP_TS |
+			 CP_RESET_CONTEXT_STATE_0_CLEAR_RESOURCE_TABLE |
+			 CP_RESET_CONTEXT_STATE_0_CLEAR_BV_BR_COUNTER |
+			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
+
+		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+		OUT_RING(ring, CP_SET_THREAD_BR);
 	}
 
 	if (!sysprof) {

-- 
2.47.1

