Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1424E96DC71
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 16:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E953310E0AE;
	Thu,  5 Sep 2024 14:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aedR2340";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC6310E0AE;
 Thu,  5 Sep 2024 14:51:36 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so94076266b.0; 
 Thu, 05 Sep 2024 07:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725547895; x=1726152695; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f0kNTx+9AsOZWf/8yH7sCZ+xqB2wOOoaQ6wZ/cu7hDA=;
 b=aedR23400/gDMiLbmrZ5BVElZ1wgkSUedeef0FJnvpuXEsIPN341gWkUiCgta7svg6
 Ev7L7RWcoFF4IN7OSP3jjbPFyPGUCVk80UFUI3bxHOb89ZEPsdLMXSLECapJR42tC54t
 fGjqPJg70XuFKrn90IA5FBtYDHaUlk3pX7j7JN1amPXQDuB3IC1SP4GdqBvQ6mzDIGiZ
 IoQq1YyP9pVCHvJryvs+QfGWKdwzqZj5YNqkCH3j7EOCQb407Nw/6dqNY5jBiArMT5A8
 huRE17adEz//qI9T1qsKWjx2u+wlKI8+RwDG6Ab3FTujLb/U5tUWcsQnz+VIITwHYhab
 4wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725547895; x=1726152695;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f0kNTx+9AsOZWf/8yH7sCZ+xqB2wOOoaQ6wZ/cu7hDA=;
 b=ul/x0Zh90KFx7TAdLKPVt+OMXk016Qc55VbeF8vQP+et/adZoo6rNWIGNfDGp1zdt5
 ckHjeXAS7hyGI0sqwst+GQ2V2l6aSwCuKX9G6FOZMesfXH7mRcZxbRI90CUodIahSl/f
 1DuosHlArxJ3yTXbLZf6mKzRBF3jwmXrhECXrDGdeX6bcJcr4KoWVSTUsDt4K+wB6AgA
 AZsfQ5Bfzh9HP8cFYOG183lTiOsxyGtSwG9JwV773gp93FVDZ0CM5UtJkGHkCkD5yORH
 5nVUYAy7BtyIiPNpcPWjLjq7lrXqJ4TIbeep8Hz2EEXioOV0z7HDcCDt4l1By3TUa6WK
 zdyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqMPtFO8X0Wkk34zwvNsL7vfiG+SqwnKW/baL16BsilomLf0KiCvcRmWPIzZ1MyXK15lfzgUR2XMk=@lists.freedesktop.org,
 AJvYcCXqEcXTZa3hxlzE01nHssN0sDZHLJt9F6487wMoZbGdM/9vjzK011dfhIb1NjO+cgOXJRxE/k88R5ll@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy+vqEolCkqqVA7hDGPqkIAlz/koFAz16vxx9BBdT3C7vCsdU8
 /2NXRLyPxWAiDE9+T18XLHxrnBWhRdcFq2RmPgsZdJsesEw9fHvp
X-Google-Smtp-Source: AGHT+IE5UQSl+WtlgnpxePBQvDH47cv/J7+XI+eIwVmdijVNuH5dElK67nTmbEB4l9EcGraswn7mNg==
X-Received: by 2002:a17:906:ef09:b0:a77:ab9e:9202 with SMTP id
 a640c23a62f3a-a8a42f8af0amr597545866b.4.1725547894568; 
 Thu, 05 Sep 2024 07:51:34 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it.
 [87.16.167.153]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc52b376sm1320732a12.7.2024.09.05.07.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 07:51:34 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 05 Sep 2024 16:51:23 +0200
Subject: [PATCH v3 05/10] drm/msm/A6xx: Sync relevant adreno_pm4.xml
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-preemption-a750-t-v3-5-fd947699f7bc@gmail.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
In-Reply-To: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725547882; l=3764;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=uXlziadan9hJzafa2UxEKSmDxQDugnNERdYxm6GapoY=;
 b=K5z6+gJ9F0BUwR3UCDyC7rv+AaTI7U2htDGXQBbB6BnTM0gnx0WfMyXwNGBhrHavVE0Iqoznh
 YCwKNM9d3zWA1YpbZcQ+DXZU8cmXrIJ/oOtvGUTOpGxobVaiDiLk++c
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

In mesa CP_SET_CTXSWITCH_IB is renamed to CP_SET_AMBLE and some other
names are changed to match KGSL. Import those changes.

The changes have not been merged yet in mesa but are necessary for this
series.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    | 39 ++++++++++------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
index cab01af55d22..55a35182858c 100644
--- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
@@ -581,8 +581,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
                 and forcibly switch to the indicated context.
 	</doc>
 	<value name="CP_CONTEXT_SWITCH" value="0x54" variants="A6XX"/>
-	<!-- Note, kgsl calls this CP_SET_AMBLE: -->
-	<value name="CP_SET_CTXSWITCH_IB" value="0x55" variants="A6XX-"/>
+	<value name="CP_SET_AMBLE" value="0x55" variants="A6XX-"/>
 
 	<!--
 	Seems to always have the payload:
@@ -2013,42 +2012,38 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	</reg32>
 </domain>
 
-<domain name="CP_SET_CTXSWITCH_IB" width="32">
+<domain name="CP_SET_AMBLE" width="32">
 	<doc>
-                Used by the userspace driver to set various IB's which are
-                executed during context save/restore for handling
-                state that isn't restored by the
-                context switch routine itself.
-	</doc>
-	<enum name="ctxswitch_ib">
-		<value name="RESTORE_IB" value="0">
+                Used by the userspace and kernel drivers to set various IB's
+                which are executed during context save/restore for handling
+                state that isn't restored by the context switch routine itself.
+  </doc>
+	<enum name="amble_type">
+		<value name="PREAMBLE_AMBLE_TYPE" value="0">
 			<doc>Executed unconditionally when switching back to the context.</doc>
 		</value>
-		<value name="YIELD_RESTORE_IB" value="1">
+		<value name="BIN_PREAMBLE_AMBLE_TYPE" value="1">
                         <doc>
 				Executed when switching back after switching
 				away during execution of
-				a CP_SET_MARKER packet with RM6_YIELD as the
-				payload *and* the normal save routine was
-				bypassed for a shorter one. I think this is
-				connected to the "skipsaverestore" bit set by
-				the kernel when preempting.
+				a CP_SET_MARKER packet with RM6_BIN_RENDER_END as the
+				payload *and* skipsaverestore is set. This is
+				expected to restore static register values not
+				saved when skipsaverestore is set.
 			</doc>
 		</value>
-		<value name="SAVE_IB" value="2">
+		<value name="POSTAMBLE_AMBLE_TYPE" value="2">
                         <doc>
 				Executed when switching away from the context,
 				except for context switches initiated via
 				CP_YIELD.
                         </doc>
 		</value>
-		<value name="RB_SAVE_IB" value="3">
+		<value name="KMD_AMBLE_TYPE" value="3">
 			<doc>
 				This can only be set by the RB (i.e. the kernel)
 				and executes with protected mode off, but
-				is otherwise similar to SAVE_IB.
-
-				Note, kgsl calls this CP_KMD_AMBLE_TYPE
+				is otherwise similar to POSTAMBLE_AMBLE_TYPE.
 			</doc>
 		</value>
 	</enum>
@@ -2060,7 +2055,7 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	</reg32>
 	<reg32 offset="2" name="2">
 		<bitfield name="DWORDS" low="0" high="19" type="uint"/>
-		<bitfield name="TYPE" low="20" high="21" type="ctxswitch_ib"/>
+		<bitfield name="TYPE" low="20" high="21" type="amble_type"/>
 	</reg32>
 </domain>
 

-- 
2.46.0

