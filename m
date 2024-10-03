Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D7298F3CA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 18:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8559B10E8BD;
	Thu,  3 Oct 2024 16:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yx6JDlVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1867410E8AC;
 Thu,  3 Oct 2024 16:13:11 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5c89f3f28b6so1525937a12.2; 
 Thu, 03 Oct 2024 09:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727971989; x=1728576789; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=U8vL189vTh8iXNA4lYnscfArOlPBvDZ3K4+HECdKLUM=;
 b=Yx6JDlVttO3dyl5UpyofCxSvDPDi5Zeh22MtNU1wJ2EPj/EvWPVwAYurRgBa/I2rIV
 6DrWTn/V9ppbb+QNTHioOHkyx6XAtraR9/Kf+6leIrHJLP2Naf7vQjFf34UwLDw4lW9O
 jS/WTtAunX3xFfTb9rYB5hdI4zFo/Ci6ysiGJG5sBusKJB+z17cjgVAK0ZcxpNVGpYgN
 bR0YUJ7/oQUT++ys7KDENwjnJZxPxQFcmtPVSsw1UZcYxuyljlN2/Co0ZTr6wY8GC4UP
 nQWhpWjijH02Ukx5zZlwwUmZpCXkO6lvEygvVDgjbJipRBZ8c59vqO253LzWBpe1GOt7
 4b2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727971989; x=1728576789;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U8vL189vTh8iXNA4lYnscfArOlPBvDZ3K4+HECdKLUM=;
 b=Esi4oRY1YBoI7rqsPixME6Q/djNHjAFjwTNe8FpNuZRYdX1oi9y86sx+bbbI4kRkMK
 jUYskV4nqHRZqePgefnUsWo54NLW4J62rDQdKcVrxwDwTEuxArnteZxYuDv3F9OSCymZ
 vpBgcDSlqRcVOe3KtecgNkTDff3IKElS/xKDjfBT57ybwBsqf2n8v8M0z8wOJeFrIUud
 9V6zTWTa8a+Kvp/yz82owL5V3xp8Y5NNO7960VlXQQztJ066EBJW1Hrrmv9Qjt/UNa3j
 aGA5FdszKIhzft3UPf4aEYiD1MkdTttR66Yr/vAuhhywK1dOdZ/mvwYH/CPF/8J3iVr2
 jQew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrJdgReeHzuwsmkg5gUusIRlj4rJlMUA35mPykxlWpj2sf9p8/2FgbEOdw+gRTwmWT2oq5B4pLZ9a8@lists.freedesktop.org,
 AJvYcCWOkhvT/58afXtSeY2iOgQEWIUP+kCyWzgUBDAZvt/VsfYIfu6/3eGt8PIQnACmErHkQ+AKaoKjmEo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWSr7fmtmmu6iGkKiPw7vRCtAVuIHeQaja4g7X+zHaiPYjheQZ
 QB8LNjJhHMvuZVZPMFbihGGq3u7AEdSBQ6m2ftqftqmVk13G5RwyrtfWKTu3zHSgJw==
X-Google-Smtp-Source: AGHT+IGg/TDD/UYldRFd8ivNHm2MIlLo9pvXM/gzWhUsgFDb2pAQT6s+UHg74nIw8fWIUyKnZdcvcA==
X-Received: by 2002:a17:907:97c7:b0:a8b:6ee7:ba2c with SMTP id
 a640c23a62f3a-a98f824db49mr738159766b.16.1727971989285; 
 Thu, 03 Oct 2024 09:13:09 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it.
 [79.12.161.203]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 09:13:08 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:12:56 +0200
Subject: [PATCH v8 07/12] drm/msm/a6xx: Sync relevant adreno_pm4.xml
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-7-5c6cb9f256e0@gmail.com>
References: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
In-Reply-To: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
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
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=4077;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=/wWoq9phTQOtf3DbnY9akGSVrFARm8V71ASGyLN3bu4=;
 b=5854X32F856DjAwSnBjK85C7m0P/bTPK8DLJl9ecjF/Dxr1LQ433uDvWULajpwG9UmztXaDfi
 p9alhQFBtD8DhF7RkhdiORt79G5Rllz6wp2f91q4f5ZFdXMksUrDJOk
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

Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    | 39 ++++++++++------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
index cab01af55d22268ccf88f1a5032b6081d8e4e475..55a35182858ccac3292849faaf12727257e053c7 100644
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
2.46.1

