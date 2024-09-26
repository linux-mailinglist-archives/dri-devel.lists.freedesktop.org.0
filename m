Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9AD987A6C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 23:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D4D10EBE1;
	Thu, 26 Sep 2024 21:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m5uXZUfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A8810EB73;
 Thu, 26 Sep 2024 21:17:06 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a8b155b5e9eso208893766b.1; 
 Thu, 26 Sep 2024 14:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727385425; x=1727990225; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ldGMJhYsL8c9rqqEBChMP49Ah6Uz0hcKz1Q6jQxPKuw=;
 b=m5uXZUfhxpn6Z2jSQNaj2/CQKn1xAx22qzb05w6sJ3apOJJPhBfR0tuHybkXibJMbK
 RoVnFm54J0f9Xtx0hDNTocd0pe4NVFeQKIGFrGJ73g3L26n9xlAHSNYyL64q90I/3vHh
 LhZY5SrQ1j6jS6qVPBRYwWeIRMm26rhPdrjRjelvtAyD5JHIYYSPan6lPvU+I203qmJo
 EbZpEcF/QsxWCExZU6+pAUhQs9Njf9SfW6Pk/nm09X4h+Brx4XVY4edp0bcwHMqs17Vy
 y+t9VsZYa4sxLfBVIfK7zO6NrZWod4qR5BqYN0wYN5iuN4zZQsyscNIXhvhlNVtQlXzQ
 y6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727385425; x=1727990225;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ldGMJhYsL8c9rqqEBChMP49Ah6Uz0hcKz1Q6jQxPKuw=;
 b=ZY/nWhOB2397tLPHKby5cHAYZ5Tkk1TSpmV8ot9r4/MjwVDudojcMTF+1qSrsjS9AD
 0DdGZxgk5sIdU9cgWRRp2Sx2ezI+R/DIrvBfE5I9ZdAR0Pgprh3eMogaVIEM31KA6m7u
 1+EIj43IBYQ36gW7sc9wQfDKIhHB+bW6XFGtl7FhwOOvlF1S7oHZxULFpv2jQVoLbZQe
 7k9XXgOWEBSUWOgOnm9C5HRBh5VQO/yOmjxcWa89vR41uUz/rW0NbmIC6vUZF45L+qbv
 xogAbF0Uv+wpRFyVnyRm74W9nH+IxEoFzFbQD+FSQZSg5KcjpR8370fn7ia4as1EM9N6
 oM4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTTaBRAHDPfAgD1i0JN3hsGHZqt2RDZ1+I6isbVZwpeNgi7wpRI8H1OQ6lkLieBDg2jwv/knOd2hz3@lists.freedesktop.org,
 AJvYcCWizFH9DOgneiW74EPPi6qBJIXnFxDB52JMW39P9suKILkbvKl/S5jP1ynsBw11FvouMC8meRW7JLY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFmTBqf2k/AcPMJsFquRSO3qbP18viRxitzMuJGoZr0tga2euG
 VhI7Cvgoq1tMHDiC2ovQ/3GR++Udn6Q1k8rqpJU1wpc6pfcG5pEy
X-Google-Smtp-Source: AGHT+IGJuQv7YVMS3b76MEqSfxuMWDwIlk6D91pEby+w1aoMgw03XSMhXb0YzT7F1DU6/Zg7342Zkw==
X-Received: by 2002:a17:907:944e:b0:a86:743a:a716 with SMTP id
 a640c23a62f3a-a93c4c2791fmr66290166b.53.1727385425193; 
 Thu, 26 Sep 2024 14:17:05 -0700 (PDT)
Received: from [192.168.1.17] (a-lu6-5.tin.it. [212.216.221.196])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297b7d6sm38862166b.162.2024.09.26.14.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 14:17:04 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 26 Sep 2024 23:16:48 +0200
Subject: [PATCH v6 06/11] drm/msm/a6xx: Sync relevant adreno_pm4.xml
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-preemption-a750-t-v6-6-7b6e1ef3648f@gmail.com>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727385413; l=4033;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=+/10yM8zg55qjZOGGUuysVO4iKnvZxJ8Izq/9aSEglE=;
 b=gv6nI52xnz/kVdnR4lknsl1zvWz6DMg5CLSswnLhy7uzKDs/Q0RBB+cyObaTHSc4WqCXO2BUp
 lTFtVlekgn/ADxnw+Pk2C5DRcgYrJP+SIPr0vWGcEUNSiFA8mQaz0Wn
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

