Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE83336A22C
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 18:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3E06E2BC;
	Sat, 24 Apr 2021 16:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3AA6E2BC
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 16:42:24 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id d21so40730999edv.9
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 09:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X3nB2B4pvvUsFa8wxAgDFnWASBskzgD5/+De7g7TAR0=;
 b=ENq3lkKvA2pKrgNcT0EXOqs0N3MQ+JnUK0T4J29tl7pg5XTwHWx0+0CIyT2QOKj5uj
 mm3rA+yXyzsNfFaexj6jBhz8VdZaJO2v2eaHbOFnDetX2C6vnXb/gctIlldtR9ffnxv4
 MMf5aX3kxabScetyRbdq6APTOECqG8q3wmharE8zHMwTPLu99Vwoj5G1gASOS3AJCs1n
 M5Q3Gavi3lPau3yKiLZDpCRE7U0kq/ErztrvwfwZw6+lnxA7+csFKpiYnfxe58I0M3jP
 XZZy5XbUH8PIltOGQZxLKh6plNsn7Y4SbibUVIiQ3aZPw+sAFgB+PUZ92hBhlCHVwIxB
 L3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X3nB2B4pvvUsFa8wxAgDFnWASBskzgD5/+De7g7TAR0=;
 b=ldwdwXw83PDb2ijBAuvp+QpwR64Bz+1D8az0yxhFAFko8fv5QVtnymk7nYIcxFtDc8
 v3cn0nFOEGTj0LeDVUJXv7CznF0ip04QYkbgkgb7H5BwoT+xBEslE6FtcHWn0QgWcrIu
 T7bcW+JesC0xr8FioZtJEdn79vr1km0MoQkpTat8voz4CA+eAjqs9ljNefXPSux+u/YL
 1viQoWNv4jYxWfTjCYUtH45UjtMu+kKrsIIiToZrO4U7NtXisXTz1aM1n/GGDmz1c+up
 u13xVwtpm2q58xrg//ukc7yCp4q70kNMwHoTAF9BPJqdOv1jpJmQCF0axQm4pYIA1Y2L
 xosA==
X-Gm-Message-State: AOAM530FHsTJbPO40gwpBYwXivVWZtzOwB6vA0PXF8KONr1vZiSLnjJE
 zHuBoXDbw8FcklVPjFk2YyE=
X-Google-Smtp-Source: ABdhPJzgaGNTgE9oYzQ204CikhFHcQ8Cpcflvw+7yYA6EcD6BObSXoWvi2yqTPzQfj37qxcT7mkSuA==
X-Received: by 2002:a50:c44f:: with SMTP id w15mr11178118edf.79.1619282543675; 
 Sat, 24 Apr 2021 09:42:23 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id he35sm7251831ejc.2.2021.04.24.09.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 09:42:23 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/pm/powerplay/hwmgr/ppatomctrl.c: Fix kerne-doc syntax
 in comments
Date: Sat, 24 Apr 2021 18:42:18 +0200
Message-Id: <20210424164218.18445-1-fmdefrancesco@gmail.com>
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

In the documentation of functions, fixed kernel-doc syntax errors.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
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
