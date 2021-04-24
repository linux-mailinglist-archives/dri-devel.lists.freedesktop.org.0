Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD4336A37A
	for <lists+dri-devel@lfdr.de>; Sun, 25 Apr 2021 00:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA956E321;
	Sat, 24 Apr 2021 22:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18406E321
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 22:19:06 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id l4so78814478ejc.10
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 15:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CNbQioG3qs9D9OD75FT58Wt8V8Q+f0usZXn7Mlw1T00=;
 b=dutWPL1lmY20INeIjwre/cBIbiaNwWZnrDZOcfBloksKj/qwutiAZNL/runJriVpvQ
 1oyKXw0RiPYWRssPOc3Rdkz9gDovIEqbNYw00DGxAaqyEWEMqu6fdS8JTdmHzyU7qSes
 kTh+UtHxXA/eUL1eXuS8FwlFte6ZU29/rdlll/rqlL7EHJA6LHaQY1vlo/9tRvdUG5Iu
 72rFCrU9udp5NrTluio2HGWK8V82umYCt1xqwG5aDbhnL5MVW6zVK2wPElhcuSdRRQZ3
 ZNsZL9519xvna0Pr6Ai57S9G6VtyWATF907vOSMs4ebUyxM1XQn4zkNF0slWexh7MjIG
 lmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CNbQioG3qs9D9OD75FT58Wt8V8Q+f0usZXn7Mlw1T00=;
 b=ZcYmBPdO04iEHe/wWN7zgSM8WnXmKaaCzjLcTemjPeQNgyCH60oekecPRE7CE10T3A
 njkKrJ935k2TLAZHfxnwd2ZndAS4xu4YvDqFtK7BrAjyKSjntm8kzQGxtSwmhyDnw0VD
 h51xDvT+eA0MBh2gghjqfn82JZ+T46SwbyT2E51SCKqB6WGRLe6x+3tjb+H/heGg69uS
 DGiNL9yCQrBqKccb1htYR8QXSfru2jLNHZosOeFAu2pMfEcPfTy1dThhdPgzOgEdMbGJ
 kSq/Gvncgh4Fry0iMDbhDbies/M2m1V5dx1B70MrO2txv1AEuF01dl9GJ9MLq/t5+XGY
 2pCA==
X-Gm-Message-State: AOAM530NPNqPfrM840NnUxfKr8t90mWh9S75uzRO8a318BuTfEet9mjm
 B+TFPlT9FOJKoILbsmf71Mc=
X-Google-Smtp-Source: ABdhPJxHRRNKyJYMP1wXxSZMdp57bDHTqGgcd7KZX+6Tok+M3UIGUHLV4fL3sVq7IbpAiYKobYkq8g==
X-Received: by 2002:a17:906:c099:: with SMTP id
 f25mr10653101ejz.499.1619302745368; 
 Sat, 24 Apr 2021 15:19:05 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id f19sm10034174edu.12.2021.04.24.15.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 15:19:04 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/amd/pm/powerplay/hwmgr: Fix kernel-doc syntax in
 documentation
Date: Sun, 25 Apr 2021 00:19:00 +0200
Message-Id: <20210424221900.9725-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixed kernel-doc syntax errors in documentation of functions.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v1: Reword both the subject and the log message

 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
index b1038d30c8dc..f503e61faa60 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
@@ -275,7 +275,7 @@ static const ATOM_VOLTAGE_OBJECT_V3 *atomctrl_lookup_voltage_type_v3(
 }
 
 /**
- * atomctrl_get_memory_pll_dividers_si().
+ * atomctrl_get_memory_pll_dividers_si
  *
  * @hwmgr:           input parameter: pointer to HwMgr
  * @clock_value:     input parameter: memory clock
@@ -328,7 +328,7 @@ int atomctrl_get_memory_pll_dividers_si(
 }
 
 /**
- * atomctrl_get_memory_pll_dividers_vi().
+ * atomctrl_get_memory_pll_dividers_vi
  *
  * @hwmgr:                 input parameter: pointer to HwMgr
  * @clock_value:           input parameter: memory clock
@@ -1104,7 +1104,7 @@ int atomctrl_calculate_voltage_evv_on_sclk(
 }
 
 /**
- * atomctrl_get_voltage_evv_on_sclk gets voltage via call to ATOM COMMAND table.
+ * atomctrl_get_voltage_evv_on_sclk: gets voltage via call to ATOM COMMAND table.
  * @hwmgr:              input: pointer to hwManager
  * @voltage_type:       input: type of EVV voltage VDDC or VDDGFX
  * @sclk:               input: in 10Khz unit. DPM state SCLK frequency
@@ -1144,7 +1144,7 @@ int atomctrl_get_voltage_evv_on_sclk(
 }
 
 /**
- * atomctrl_get_voltage_evv gets voltage via call to ATOM COMMAND table.
+ * atomctrl_get_voltage_evv: gets voltage via call to ATOM COMMAND table.
  * @hwmgr:              input: pointer to hwManager
  * @virtual_voltage_id: input: voltage id which match per voltage DPM state: 0xff01, 0xff02.. 0xff08
  * @voltage: 	       output: real voltage level in unit of mv
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
