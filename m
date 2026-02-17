Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGqwHhNylWn8RQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 09:02:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E1D153D73
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 09:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BBC10E577;
	Wed, 18 Feb 2026 08:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="Xl6v2xvn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BDD10E548
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 22:36:04 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so791117166b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 14:36:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771367762; cv=none;
 d=google.com; s=arc-20240605;
 b=WOco6+z7fGooS7pQRUDfmuLQwRaaqT3EgRDiHMR70jiOx8pf1R6RR8KcAfxBAuepOg
 wplIS7Fb3mvdJ0b4NelRyGyXR5cbbKksXNzNBdQIP58UPvaNCK4VeVRvTZ0M7QHt1dO1
 ZsTk5varxPbb9oa7qYuAyTfbWe3aWNhTH4K8PrXOkWw/niLwoat7FL22gEFbJnZoCYk5
 BVwcjZlEI6IK/nxYlnuDPS4ez8YVjQC9x1BdpYvJiFTA/E+DrTYxXzOzZ8qBc5ljUZNE
 w28h4RCL9Q73HLA1kLYuAvw99v1Hdbsv2kaH5+dZfTUY6xLrY8nNxnCdW0fNoKiat3Tr
 JcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=s97S9QYC27wvlPQAhSqz0+mo94ezXIoGg3PTwcdlXc0=;
 fh=MBGkcUej2nbLP5OHLY+8GeI524ooDoa7PItdvhnFINs=;
 b=T78hZdMuy1j/9EgnHTv6sIaGm8DCVcOteVyA8/9hazIhy9RcjfLl3mcgI69HGHUjhS
 KZdcjgHTteVHe2TTcgtZMbZ3RpJyxFKdFciHGr/u4D2hGB2OQn7g+AamtLKbpae/Qa3W
 VA1Lqz/hXpFS4D8VSMnSNRMbY6XpPFlJ1l5vkbK+EeCyEPBg+8nYlZX+F/phj1YyFWSB
 OI+KkY3tXTasOxkiW4UP0edLPedq7CPX9AUP3piK1f6by2TaC2dvgXNOxtjKtVn0C+/L
 ZX75KfjKor0YULNmKVjFkDgcPKf6HYCCgWEHmiHjMVvcsAoXLnp1ZOEmod1166YPkaJb
 Dgog==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1771367762; x=1771972562; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=s97S9QYC27wvlPQAhSqz0+mo94ezXIoGg3PTwcdlXc0=;
 b=Xl6v2xvnknJ8j9Mz/IKschqzYAZyPE2X05nh0Rc3OrqSCKjN6CQtrXwjMfBN2tIlrV
 ZyflDbFnd3vNTHkAFNlVIGwzXH2EwtMLQfGEJv00QAA8YJDWXs142ZrtRZHk4ntaYOIN
 Lzt7CjMv3v/13BDOSYRY0Dv0vn5wQ40FjLIfkgn4mhIgWSNtCpvC1vpYxgcrpwCaS3G+
 +USLRG6GWBNl08FeQ6+jy7YsqyVa9ircEKUEvz6jiXa9Gm8eUDdYD3tn8OGKfRqUJlJT
 dFd2m4mApb7pSWTOVI6z4YA5DKm8qlJCZhjVQy6TpCGucUDjPOvT+29ZfxLMsA2Z/tHU
 mLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771367762; x=1771972562;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s97S9QYC27wvlPQAhSqz0+mo94ezXIoGg3PTwcdlXc0=;
 b=Y2uPxpTqmctVoGxim2AzyGyUJaLWjgf7cGsFWOn1aDaGxiuKc+314lxF2DaqNnrLe6
 pfiew3UoC0vfY8qRvR1K1cFcuYUCIFzY9OCvJ1XTnB5P5GTUeMOyDP0HLXIvj9UxUqBf
 aXcsDXdMWYhHbiJav5VZ1jaGwbSZkT8nVTMD5nB6CkdGP/bwqDKmdbqQm7dTPJNOQUMj
 vJZ6qGxCYhov7aIdIzDpVxJe+qq7WE5mN32TE8Gqd9StZ+VGCa45xUUWwCk0fdFjfrQG
 cyp4LK8ywIFun09YnE+qJH4wJxg1QMTO7qnhRKxUTy70UNwQFqSMKS1jClI5AtB20fyk
 jxdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1vJQgtuwjhqPkw/m4vg5VyOJCRLDavpHwP6ZL5znTF0WSXcEmrnbJLy/En/12qgMalUyNEFfdxSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBPkoBDKoV+zcsr8bSvTDd1s+GsPM9XE4TBkIau3t/heAm6jzJ
 5JasnWQE/ZGVbHySc33bzHltfBMcwmK8lb9rqAGClbJepd//fgXUbkNgROrT1h0FBFd9wKjx3Yj
 FMaEUEZcc1JZq0Kc3+ntvKfTdpZyZ7BlZJC3LIt5HDg==
X-Gm-Gg: AZuq6aJrARzfRBpk5HBbFJ/+5sugNzOTvrWW5k+cXhqn6gdzPT1UpE8zE4iYAbK5m7N
 TjdxNYMBA7siM33rFOunGuPXBVn5/lCQbdF4aEZ2T7HolmTbcgso2n2tSfkDobpuB82bz4n9nAb
 LTSosaOPp/2+yTUSQdAhg/ZqBYWDtBqgRWNiNfwbhqx6ClOMzFcP/ee/C0Ti5C+dSrBT+igQYre
 R89eJgVsAp3YnyP2f8EeBUFLEbF80pjihl4Mo7d1lH4ifkeDPkkiZtQhsKHhnVQW8v819pBiN6I
 i659ADTTxSgNTudydyh9V+OntMnM/9T0XhfsAUFW23vroJKfadci/5CkHNedVtUhQxzVCguQJj+
 UeHCD52iTUAxdIetRSW00l4I=
X-Received: by 2002:a17:906:c10d:b0:b7a:2d:71af with SMTP id
 a640c23a62f3a-b8fb4462eb2mr863091166b.38.1771367762496; Tue, 17 Feb 2026
 14:36:02 -0800 (PST)
MIME-Version: 1.0
From: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
Date: Tue, 17 Feb 2026 19:35:51 -0300
X-Gm-Features: AaiRm50eWXdylCtKwCo4zH2z-fDALcCZF8JGW4FEyAH0tN9-aIjmLRR0XFK8Iww
Message-ID: <CAJgF-xs=3fbKQO5Mj=coPMXq0ecWmV0bJDNFN44coEHV3WS=wg@mail.gmail.com>
Subject: [PATCH] drm/amd/display: Deduplicate DCN DDC register assignment
To: harry.wentland@amd.com, sunpeng.li@amd.com
Cc: siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Guilherme Ivo Bozi <guilherme.bozi@usp.br>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 18 Feb 2026 08:02:15 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[usp.br,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[usp.br:s=usp-google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[igalia.com,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,usp.br];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[guilherme.bozi@usp.br,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:guilherme.bozi@usp.br,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guilherme.bozi@usp.br,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[usp.br:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 20E1D153D73
X-Rspamd-Action: no action

From b61fa578ecb3800b4b0391c8d86f6d67c48a7cd9 Mon Sep 17 00:00:00 2001
From: Guilherme Bozi <guilherme.bozi@usp.br>
Date: Tue, 17 Feb 2026 17:49:26 -0300
Subject: [PATCH] drm/amd/display: Deduplicate DCN DDC register assignment

Several DCN generations implement identical define_ddc_registers()
functions to assign DDC register, shift and mask pointers based on
GPIO ID.

Introduce a shared inline helper,
dcn_define_ddc_registers_common(), and convert all DCN
implementations to use it.

This reduces duplication and improves maintainability without
changing behavior.

No functional changes intended.

Signed-off-by: Guilherme Bozi <guilherme.bozi@usp.br>
---
 .../display/dc/gpio/dcn20/hw_factory_dcn20.c  | 27 ++++---------
 .../display/dc/gpio/dcn21/hw_factory_dcn21.c  | 27 ++++---------
 .../display/dc/gpio/dcn30/hw_factory_dcn30.c  | 27 ++++---------
 .../dc/gpio/dcn315/hw_factory_dcn315.c        | 27 ++++---------
 .../display/dc/gpio/dcn32/hw_factory_dcn32.c  | 27 ++++---------
 .../dc/gpio/dcn401/hw_factory_dcn401.c        | 26 ++++---------
 .../amd/display/dc/gpio/hw_factory_dcn_ddc.h  | 39 +++++++++++++++++++
 7 files changed, 86 insertions(+), 114 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/gpio/hw_factory_dcn_ddc.h

diff --git a/drivers/gpu/drm/amd/display/dc/gpio/dcn20/hw_factory_dcn20.c
b/drivers/gpu/drm/amd/display/dc/gpio/dcn20/hw_factory_dcn20.c
index e0bd0c722e00..905d14079b91 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/dcn20/hw_factory_dcn20.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/dcn20/hw_factory_dcn20.c
@@ -32,6 +32,8 @@
 #include "../hw_hpd.h"
 #include "../hw_generic.h"

+#include "../hw_factory_dcn_ddc.h"
+
 #include "hw_factory_dcn20.h"


@@ -182,25 +184,12 @@ static void define_ddc_registers(
         struct hw_gpio_pin *pin,
         uint32_t en)
 {
-    struct hw_ddc *ddc = HW_DDC_FROM_BASE(pin);
-
-    switch (pin->id) {
-    case GPIO_ID_DDC_DATA:
-        ddc->regs = &ddc_data_regs_dcn[en];
-        ddc->base.regs = &ddc_data_regs_dcn[en].gpio;
-        break;
-    case GPIO_ID_DDC_CLOCK:
-        ddc->regs = &ddc_clk_regs_dcn[en];
-        ddc->base.regs = &ddc_clk_regs_dcn[en].gpio;
-        break;
-    default:
-        ASSERT_CRITICAL(false);
-        return;
-    }
-
-    ddc->shifts = &ddc_shift[en];
-    ddc->masks = &ddc_mask[en];
-
+    dcn_define_ddc_registers_common(
+        pin, en,
+        ddc_data_regs_dcn,
+        ddc_clk_regs_dcn,
+        ddc_shift,
+        ddc_mask);
 }

 static void define_hpd_registers(struct hw_gpio_pin *pin, uint32_t en)
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/dcn21/hw_factory_dcn21.c
b/drivers/gpu/drm/amd/display/dc/gpio/dcn21/hw_factory_dcn21.c
index 2f57ee6deabc..f347b8c7e2b6 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/dcn21/hw_factory_dcn21.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/dcn21/hw_factory_dcn21.c
@@ -32,6 +32,8 @@
 #include "../hw_hpd.h"
 #include "../hw_generic.h"

+#include "../hw_factory_dcn_ddc.h"
+
 #include "hw_factory_dcn21.h"

 #include "dcn/dcn_2_1_0_offset.h"
@@ -170,25 +172,12 @@ static void define_ddc_registers(
         struct hw_gpio_pin *pin,
         uint32_t en)
 {
-    struct hw_ddc *ddc = HW_DDC_FROM_BASE(pin);
-
-    switch (pin->id) {
-    case GPIO_ID_DDC_DATA:
-        ddc->regs = &ddc_data_regs_dcn[en];
-        ddc->base.regs = &ddc_data_regs_dcn[en].gpio;
-        break;
-    case GPIO_ID_DDC_CLOCK:
-        ddc->regs = &ddc_clk_regs_dcn[en];
-        ddc->base.regs = &ddc_clk_regs_dcn[en].gpio;
-        break;
-    default:
-        ASSERT_CRITICAL(false);
-        return;
-    }
-
-    ddc->shifts = &ddc_shift[en];
-    ddc->masks = &ddc_mask[en];
-
+    dcn_define_ddc_registers_common(
+        pin, en,
+        ddc_data_regs_dcn,
+        ddc_clk_regs_dcn,
+        ddc_shift,
+        ddc_mask);
 }

 static void define_hpd_registers(struct hw_gpio_pin *pin, uint32_t en)
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c
b/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c
index 36a5736c58c9..25eef1ee10fe 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c
@@ -32,6 +32,8 @@
 #include "../hw_hpd.h"
 #include "../hw_generic.h"

+#include "../hw_factory_dcn_ddc.h"
+
 #include "hw_factory_dcn30.h"


@@ -199,25 +201,12 @@ static void define_ddc_registers(
         struct hw_gpio_pin *pin,
         uint32_t en)
 {
-    struct hw_ddc *ddc = HW_DDC_FROM_BASE(pin);
-
-    switch (pin->id) {
-    case GPIO_ID_DDC_DATA:
-        ddc->regs = &ddc_data_regs_dcn[en];
-        ddc->base.regs = &ddc_data_regs_dcn[en].gpio;
-        break;
-    case GPIO_ID_DDC_CLOCK:
-        ddc->regs = &ddc_clk_regs_dcn[en];
-        ddc->base.regs = &ddc_clk_regs_dcn[en].gpio;
-        break;
-    default:
-        ASSERT_CRITICAL(false);
-        return;
-    }
-
-    ddc->shifts = &ddc_shift[en];
-    ddc->masks = &ddc_mask[en];
-
+    dcn_define_ddc_registers_common(
+        pin, en,
+        ddc_data_regs_dcn,
+        ddc_clk_regs_dcn,
+        ddc_shift,
+        ddc_mask);
 }

 static void define_hpd_registers(struct hw_gpio_pin *pin, uint32_t en)
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/dcn315/hw_factory_dcn315.c
b/drivers/gpu/drm/amd/display/dc/gpio/dcn315/hw_factory_dcn315.c
index 5feebb3b95ca..571a6f1b0cf9 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/dcn315/hw_factory_dcn315.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/dcn315/hw_factory_dcn315.c
@@ -32,6 +32,8 @@
 #include "../hw_hpd.h"
 #include "../hw_generic.h"

+#include "../hw_factory_dcn_ddc.h"
+
 #include "hw_factory_dcn315.h"

 #include "dcn/dcn_3_1_5_offset.h"
@@ -191,25 +193,12 @@ static void define_ddc_registers(
         struct hw_gpio_pin *pin,
         uint32_t en)
 {
-    struct hw_ddc *ddc = HW_DDC_FROM_BASE(pin);
-
-    switch (pin->id) {
-    case GPIO_ID_DDC_DATA:
-        ddc->regs = &ddc_data_regs_dcn[en];
-        ddc->base.regs = &ddc_data_regs_dcn[en].gpio;
-        break;
-    case GPIO_ID_DDC_CLOCK:
-        ddc->regs = &ddc_clk_regs_dcn[en];
-        ddc->base.regs = &ddc_clk_regs_dcn[en].gpio;
-        break;
-    default:
-        ASSERT_CRITICAL(false);
-        return;
-    }
-
-    ddc->shifts = &ddc_shift[en];
-    ddc->masks = &ddc_mask[en];
-
+    dcn_define_ddc_registers_common(
+        pin, en,
+        ddc_data_regs_dcn,
+        ddc_clk_regs_dcn,
+        ddc_shift,
+        ddc_mask);
 }

 static void define_hpd_registers(struct hw_gpio_pin *pin, uint32_t en)
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/dcn32/hw_factory_dcn32.c
b/drivers/gpu/drm/amd/display/dc/gpio/dcn32/hw_factory_dcn32.c
index 985f10b39750..d6e97b246bae 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/dcn32/hw_factory_dcn32.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/dcn32/hw_factory_dcn32.c
@@ -32,6 +32,8 @@
 #include "../hw_hpd.h"
 #include "../hw_generic.h"

+#include "../hw_factory_dcn_ddc.h"
+
 #include "hw_factory_dcn32.h"

 #include "dcn/dcn_3_2_0_offset.h"
@@ -203,25 +205,12 @@ static void define_ddc_registers(
         struct hw_gpio_pin *pin,
         uint32_t en)
 {
-    struct hw_ddc *ddc = HW_DDC_FROM_BASE(pin);
-
-    switch (pin->id) {
-    case GPIO_ID_DDC_DATA:
-        ddc->regs = &ddc_data_regs_dcn[en];
-        ddc->base.regs = &ddc_data_regs_dcn[en].gpio;
-        break;
-    case GPIO_ID_DDC_CLOCK:
-        ddc->regs = &ddc_clk_regs_dcn[en];
-        ddc->base.regs = &ddc_clk_regs_dcn[en].gpio;
-        break;
-    default:
-        ASSERT_CRITICAL(false);
-        return;
-    }
-
-    ddc->shifts = &ddc_shift[en];
-    ddc->masks = &ddc_mask[en];
-
+    dcn_define_ddc_registers_common(
+        pin, en,
+        ddc_data_regs_dcn,
+        ddc_clk_regs_dcn,
+        ddc_shift,
+        ddc_mask);
 }

 static void define_hpd_registers(struct hw_gpio_pin *pin, uint32_t en)
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/dcn401/hw_factory_dcn401.c
b/drivers/gpu/drm/amd/display/dc/gpio/dcn401/hw_factory_dcn401.c
index 928abca18a18..06a4d7a8a1ac 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/dcn401/hw_factory_dcn401.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/dcn401/hw_factory_dcn401.c
@@ -12,6 +12,7 @@
 #include "../hw_hpd.h"
 #include "../hw_generic.h"

+#include "../hw_factory_dcn_ddc.h"

 #include "dcn/dcn_4_1_0_offset.h"
 #include "dcn/dcn_4_1_0_sh_mask.h"
@@ -195,25 +196,12 @@ static void define_ddc_registers(
         struct hw_gpio_pin *pin,
         uint32_t en)
 {
-    struct hw_ddc *ddc = HW_DDC_FROM_BASE(pin);
-
-    switch (pin->id) {
-    case GPIO_ID_DDC_DATA:
-        ddc->regs = &ddc_data_regs_dcn[en];
-        ddc->base.regs = &ddc_data_regs_dcn[en].gpio;
-        break;
-    case GPIO_ID_DDC_CLOCK:
-        ddc->regs = &ddc_clk_regs_dcn[en];
-        ddc->base.regs = &ddc_clk_regs_dcn[en].gpio;
-        break;
-    default:
-        ASSERT_CRITICAL(false);
-        return;
-    }
-
-    ddc->shifts = &ddc_shift[en];
-    ddc->masks = &ddc_mask[en];
-
+    dcn_define_ddc_registers_common(
+        pin, en,
+        ddc_data_regs_dcn,
+        ddc_clk_regs_dcn,
+        ddc_shift,
+        ddc_mask);
 }

 static void define_hpd_registers(struct hw_gpio_pin *pin, uint32_t en)
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_factory_dcn_ddc.h
b/drivers/gpu/drm/amd/display/dc/gpio/hw_factory_dcn_ddc.h
new file mode 100644
index 000000000000..1f2bc7eea82e
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_factory_dcn_ddc.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#ifndef __DAL_HW_FACTORY_DCN_DDC_H__
+#define __DAL_HW_FACTORY_DCN_DDC_H__
+
+static inline void dcn_define_ddc_registers_common(
+        struct hw_gpio_pin *pin,
+        uint32_t en,
+        const struct ddc_registers *data_regs,
+        const struct ddc_registers *clk_regs,
+        const struct ddc_shift *shift,
+        const struct ddc_mask *mask)
+{
+    struct hw_ddc *ddc = HW_DDC_FROM_BASE(pin);
+
+    switch (pin->id) {
+    case GPIO_ID_DDC_DATA:
+        ddc->regs = &data_regs[en];
+        ddc->base.regs = &data_regs[en].gpio;
+        break;
+
+    case GPIO_ID_DDC_CLOCK:
+        ddc->regs = &clk_regs[en];
+        ddc->base.regs = &clk_regs[en].gpio;
+        break;
+
+    default:
+        ASSERT_CRITICAL(false);
+        return;
+    }
+
+    ddc->shifts = &shift[en];
+    ddc->masks = &mask[en];
+}
+
+#endif /* __DAL_HW_FACTORY_DCN_DDC_H__ */
-- 
2.47.3
