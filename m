Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF8098A608
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7594210E512;
	Mon, 30 Sep 2024 13:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VDakuKNY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A2E10E500;
 Mon, 30 Sep 2024 13:52:54 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5c89f3f28b6so610886a12.2; 
 Mon, 30 Sep 2024 06:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727704372; x=1728309172; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=U8vL189vTh8iXNA4lYnscfArOlPBvDZ3K4+HECdKLUM=;
 b=VDakuKNYAEsSLIr+BTCw723upD+0FhNLJm6+/wK3nKZzDh4Tv+GYdiIkZZEwNv5zHP
 Je/bExUsZd1zkXOwnFD5Qo6wKGLpPiY9TRDpHu0pG1//delH3emqMw8lPVIWHxaTrBOC
 zbGz4kzuHsrbxuscQEL/b3jTREt0UPmj0yvxqFVrS6t50D5f0B9nRCfPW0Fj07vgOpc/
 eqen9YQT3mRPyHbzjA53XZqsB8fw5Yusr8IpBazZEhsqIvIKyWzgSNX1Ji9Msd9ebnmI
 VKgihdxWqW/oVk1cycH2/dRQdXhGHqyt8y22Wi7UW8z4gYTrhZWKPKp+9J0cByyrSeOo
 9UGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727704372; x=1728309172;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U8vL189vTh8iXNA4lYnscfArOlPBvDZ3K4+HECdKLUM=;
 b=echoLFwkS1afb1Sbj7NxBFuIWAxZSV4dzYEgEzDQCvcScZ1GIFPc9XUR/PcslIitqA
 F+vGwx82RXI8szQYHAbxkayjztFPj2+5t3FqB5wXT3fxqtxtopD3C2obT9rKW2N0ds+y
 BRc9aDRNg1mH9ezAU2smBiPvBGiIZEiwLR3AtbOM3ztdsSJSouPE9mTb1tMTkFt25e6+
 Tqr0e5XsUTwurfg2XjvASflftDsOEAD/crrCv9YlEtvQVVZxtAAstwqDrovWzadBbIOp
 ftB0q+ZP02YlDadR6BnNzRsZqk9g4h23dSW3gW+fPP+xrnJNMAmSZyE66JiweoadkUgq
 g7jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU98+DCkb/MZk1wNS331y00pe6Ivzc/rz6umZdYrSKuBYGqAx4NZZC84lRiWZ0Mp01wYp31JS5tcD0=@lists.freedesktop.org,
 AJvYcCWNcwjYhiHM4ox1BYdFrlmkUuIOEYCs4XfUW/S4EU7weZmg7/tVWjKEfxB0+349PxOnuNU0em5Kg5FU@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8S2XWSijV1VTvzaiqugSjHIkuhR/bIxBlGfHqKukI3jPtC2ht
 Mejwnh90ibJylGVVKXfrHIL5gZqYdE4pZIkB2d8ppLCFMwISEd8K
X-Google-Smtp-Source: AGHT+IEtEHvA++ACAq3+/Xn8PG90rxIADGbdFhcm0asOS75rHEmMB3MrcHbNxTrRQNa66Fn864KPBg==
X-Received: by 2002:a05:6402:34c4:b0:5c8:8381:c1bf with SMTP id
 4fb4d7f45d1cf-5c88381c226mr8680369a12.3.1727704372364; 
 Mon, 30 Sep 2024 06:52:52 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it.
 [95.250.55.22]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 06:52:52 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:42 +0200
Subject: [PATCH v7 07/12] drm/msm/a6xx: Sync relevant adreno_pm4.xml
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-7-47803c7a5a64@gmail.com>
References: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
In-Reply-To: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=4077;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=/wWoq9phTQOtf3DbnY9akGSVrFARm8V71ASGyLN3bu4=;
 b=47iWK2j17SvgYMevDnKcX9MYYXBX8tLf6jqCulkRTmMTXG4gLjA4OKUlyksvgteyBIqChCyvv
 TepYYJSTT2TCq5ZNoJBtZx1Pm0264bU1fTYjgGm5b0/lLy7oPBXaaWw
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

