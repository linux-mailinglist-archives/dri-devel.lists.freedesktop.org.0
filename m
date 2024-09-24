Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6D398449D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 13:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B73210E883;
	Tue, 24 Sep 2024 11:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QYgIkLQC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B29910E2AA;
 Tue, 24 Sep 2024 11:30:51 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so857350266b.1; 
 Tue, 24 Sep 2024 04:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727177449; x=1727782249; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ldGMJhYsL8c9rqqEBChMP49Ah6Uz0hcKz1Q6jQxPKuw=;
 b=QYgIkLQC7d6Qeipulif2MEJCGuFtyezilyLXQMk+9BJy42Mc+4VdKqDjX/EEYVayFc
 vkKs18bo0/4LGkG0ixidV2fjCiK1ERhyaddqLIGsxlbuvT2H3lmbji/LbLrkH17SwuqQ
 w7TPgtn7TBUVtU55+C1VtTTilcmmAxN4pkGdmoOkCQ3BeGKwpJQnXqBJxXquy6HHVtyK
 3T+Htnjuw5zJ+IVYaAE65HgwDr90VbmuE95+uIkMqrUkoUh8kHBGgr3K+YXmAUBvGIU6
 5AuPI0t7UKGweEhNnZ4zMXhAtlvDRVu8ma9zYDEOHiX34/LcTQShJNWIz7jM8xIUitfj
 Bfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727177449; x=1727782249;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ldGMJhYsL8c9rqqEBChMP49Ah6Uz0hcKz1Q6jQxPKuw=;
 b=DVjQBMcD0//1z8DlE9kZldkYs3D+PMwVNIkk6WbzWdj9KmjWjytuBcwbzvTqb4mnie
 xBeqUjW+xLAwND6kgfIzKnilOkznS5466vMUxC992upM9/XZ2jYm7r1PinGelg0OE+7T
 65T26qB+JXtrobsxEerg0Gir9KHH9j1Vvf8koyBbAJlCi9GE9SMUt3Vi90wqSlcNplxp
 I8U7y5AYi9O4Mqnq1dORlL5RdCO8CvQ3KTUuClp5FZFKMYfqmfmDYa7igR+qxqlsg7aQ
 UrTvs2lNUz40Mw7sUqcUXbK4kNNKzB+GQxNVEIPWlsb46Et0GNzW3zaGDp+ciVf+pgHK
 UawQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1Y1+eHZUgY2oWI16vt6P/7/BETxcx/wKxKcPFv0wM9l7Y7HIgIZ3K408jutIkdKVkQ1GE4gHGdZM=@lists.freedesktop.org,
 AJvYcCXVOPg0eSjeAqxHEiXJrUeOWW/F5mc2AgdMCxYtU+oercKp+3S8qOStHhroQudAyMTI7Rbnns2QDHJY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiDF+dwKix4E+ug1E46c6/KVEYZnSE2Seo+bpEQr+0BAW7rgmL
 lgsIOsmMEkf22lfxUzkfOqZHjr76QaK5K/xmmM9jVpkJWZb2lLaI
X-Google-Smtp-Source: AGHT+IErz9hD3HXcUZ8zsEDBlbSHEiXxhi3ARFvXu7Oa/zUPkedKDRb+Z2DdU3o8WeitShdAYKIs4w==
X-Received: by 2002:a17:906:c103:b0:a7a:be06:d8eb with SMTP id
 a640c23a62f3a-a90d5152147mr1813051566b.53.1727177449502; 
 Tue, 24 Sep 2024 04:30:49 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it.
 [87.7.171.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 04:30:49 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 24 Sep 2024 13:30:41 +0200
Subject: [PATCH v5 06/11] drm/msm/A6xx: Sync relevant adreno_pm4.xml
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-preemption-a750-t-v5-6-0be2bf81c187@gmail.com>
References: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
In-Reply-To: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=4033;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=+/10yM8zg55qjZOGGUuysVO4iKnvZxJ8Izq/9aSEglE=;
 b=aGLOObRVomwIrZzz/M89QJO0d+zNY0xCMeTM6HojEggtQw3SR2iF3NGT9x8vwrUUtcHSM3X/p
 K8kOV3FoEsdCnJnQKiWJO5/PFNv67OkMc8CvBfhiKbK5unkj7Y+nkfS
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

