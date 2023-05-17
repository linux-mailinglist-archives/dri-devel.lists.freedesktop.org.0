Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D66ED706387
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 11:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70C810E143;
	Wed, 17 May 2023 09:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F97410E3D7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 09:04:25 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1ae54b623c2so3212895ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 02:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684314264; x=1686906264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bem8jDoswsIx3LqKUeWVXu4IOKeZhVI23DjbNiD86cQ=;
 b=bUa21sxL/qPG8OAtSx9823NQZPoNYqheY8NBeZQ+0TXftu+KMZgzltcRAYVbzvB3R+
 PqoiFe5C3UVlU2BuwjIZqDlQo+HtmtXh14Cb4oilLOzrhbT9XLKM3jdx5nmRNm53bntN
 OvCQI+1YWTGcd2xzzAJk0nbUb9mOHcEjkU3YGUbUySbX50pZRIr/LscMVSriBoSdFFUN
 57AmvQSGr1e7HS7HHMy7UHyRDSzL3kqWrwG1E3aV25uiaeqdWn/94Xxjdm4BQVrgzAX8
 OtHSQXIFUQ+3GvfTscxk6d7P45QeK+5+BbWgnk7CrdeE/XUNxJ85+dqN1+zsPwhRWIgm
 /PWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684314264; x=1686906264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bem8jDoswsIx3LqKUeWVXu4IOKeZhVI23DjbNiD86cQ=;
 b=h0/RN/Lw/BsNLbp0WG8/SIDqMCQBnxEEcUIEpy20so+/CiCRRTDUIKIsiw93eB5Zdz
 LUHlCexhIcQCGxWCdh1ZtOSiZ+HCWLUJD1XAHPEBm5zWuMscxODq7tqUhNQgAJPMR/MK
 vpOy8Gw2P67MsStahKpYA1pGJmhCuIY3QPPwnI3M/c5HTmgpgiqSpbFiJVDYdNnWV93i
 DQqUVWNvwJ8pW0HOE288KO5VqdTNE0g08JTxPe52sOd3K103J1l1pzYgx1iCrkJA/HUO
 JKdZmknTHrU7HfEHuyTsSpKpwJo7N/aGDpDxs/ZGnXhU+fFOJfwDVUjyfQ8P0RZ57xAq
 Wupg==
X-Gm-Message-State: AC+VfDw1aPFT6xqoiGA/IEQeWhsFE6AH6AOg58NopNaEJCX30BZiT4JX
 qALoh1bPF0Evi6EI7NM2yCE=
X-Google-Smtp-Source: ACHHUZ6xoj43Bwqdpvz0E5AkpQupPNWLxh+qwyX5sE4ek7dlhw7M0aBe7ay5Q5MYoWDeaWB9z8zIdg==
X-Received: by 2002:a17:903:32cb:b0:1ac:94a9:941a with SMTP id
 i11-20020a17090332cb00b001ac94a9941amr36129877plr.30.1684314264373; 
 Wed, 17 May 2023 02:04:24 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-22.three.co.id. [180.214.233.22])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a1709028bcb00b001a064282b11sm16977290plo.151.2023.05.17.02.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 02:04:23 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id D1CE810621C; Wed, 17 May 2023 16:04:20 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>
Subject: [PATCH v3 2/4] mISDN: Replace GPL notice boilerplate with SPDX
 identifier
Date: Wed, 17 May 2023 16:04:16 +0700
Message-Id: <20230517090418.1093091-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517090418.1093091-1-bagasdotme@gmail.com>
References: <20230517090418.1093091-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4211; i=bagasdotme@gmail.com;
 h=from:subject; bh=gDeWnuEEVweZ2+OADiOaGpHECUxDBZJJ7rTKBKg4aRc=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDCkpMyZ2MQZtTw8QFrhwOub0mS9JDT988h6yblxqKfTwM
 8/dbXJWHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZjIE32Gf1aNT3vVv/vcTU97
 LBj5fbqJO2PW+/RZG+o2pwQGPOJqj2Rk2D+zgSU2ylHj1iWdVXOlPDa6bH1ZahtkcWDdX8ezNxc
 JMwMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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
Cc: Karsten Keil <isdn@linux-pingi.de>, Davidlohr Bueso <dave@stgolabs.net>,
 Dan Carpenter <error27@gmail.com>, Karsten Keil <keil@isdn4linux.de>,
 Deepak R Varma <drv@mailo.com>, Simon Horman <simon.horman@corigine.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Andreas Eversberg <jolly@eversberg.eu>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jacob Keller <jacob.e.keller@intel.com>, David Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Gaosheng Cui <cuigaosheng1@huawei.com>, Archana <craechal@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace unversioned GPL notice boilerplate on dsp_* with SPDX identifier
for GPL 1.0+. These files missed previous SPDX conversion batches
due to not specifying GPL version.

Cc: Stephen Hemminger <stephen@networkplumber.org>
Cc: Andreas Eversberg <jolly@eversberg.eu>
Cc: Karsten Keil <keil@isdn4linux.de>
Reviewed-by: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/isdn/mISDN/dsp_audio.c    | 4 +---
 drivers/isdn/mISDN/dsp_blowfish.c | 4 +---
 drivers/isdn/mISDN/dsp_cmx.c      | 4 +---
 drivers/isdn/mISDN/dsp_core.c     | 3 +--
 drivers/isdn/mISDN/dsp_dtmf.c     | 4 +---
 drivers/isdn/mISDN/dsp_tones.c    | 4 +---
 6 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/isdn/mISDN/dsp_audio.c b/drivers/isdn/mISDN/dsp_audio.c
index bbef98e7a16efb..df86c0ce9cd8d1 100644
--- a/drivers/isdn/mISDN/dsp_audio.c
+++ b/drivers/isdn/mISDN/dsp_audio.c
@@ -1,12 +1,10 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * Audio support data for mISDN_dsp.
  *
  * Copyright 2002/2003 by Andreas Eversberg (jolly@eversberg.eu)
  * Rewritten by Peter
  *
- * This software may be used and distributed according to the terms
- * of the GNU General Public License, incorporated herein by reference.
- *
  */
 
 #include <linux/delay.h>
diff --git a/drivers/isdn/mISDN/dsp_blowfish.c b/drivers/isdn/mISDN/dsp_blowfish.c
index 0aa572f3858da7..e161c092012653 100644
--- a/drivers/isdn/mISDN/dsp_blowfish.c
+++ b/drivers/isdn/mISDN/dsp_blowfish.c
@@ -1,11 +1,9 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * Blowfish encryption/decryption for mISDN_dsp.
  *
  * Copyright Andreas Eversberg (jolly@eversberg.eu)
  *
- * This software may be used and distributed according to the terms
- * of the GNU General Public License, incorporated herein by reference.
- *
  */
 
 #include <linux/mISDNif.h>
diff --git a/drivers/isdn/mISDN/dsp_cmx.c b/drivers/isdn/mISDN/dsp_cmx.c
index 357b87592eb48c..c2b24fdf234523 100644
--- a/drivers/isdn/mISDN/dsp_cmx.c
+++ b/drivers/isdn/mISDN/dsp_cmx.c
@@ -1,11 +1,9 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * Audio crossconnecting/conferrencing (hardware level).
  *
  * Copyright 2002 by Andreas Eversberg (jolly@eversberg.eu)
  *
- * This software may be used and distributed according to the terms
- * of the GNU General Public License, incorporated herein by reference.
- *
  */
 
 /*
diff --git a/drivers/isdn/mISDN/dsp_core.c b/drivers/isdn/mISDN/dsp_core.c
index 386084530c2f85..b9ec8489e690a0 100644
--- a/drivers/isdn/mISDN/dsp_core.c
+++ b/drivers/isdn/mISDN/dsp_core.c
@@ -1,10 +1,9 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * Author       Andreas Eversberg (jolly@eversberg.eu)
  * Based on source code structure by
  *		Karsten Keil (keil@isdn4linux.de)
  *
- *		This file is (c) under GNU PUBLIC LICENSE
- *
  * Thanks to    Karsten Keil (great drivers)
  *              Cologne Chip (great chips)
  *
diff --git a/drivers/isdn/mISDN/dsp_dtmf.c b/drivers/isdn/mISDN/dsp_dtmf.c
index 642f30be5ce249..746c210a6d2495 100644
--- a/drivers/isdn/mISDN/dsp_dtmf.c
+++ b/drivers/isdn/mISDN/dsp_dtmf.c
@@ -1,12 +1,10 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * DTMF decoder.
  *
  * Copyright            by Andreas Eversberg (jolly@eversberg.eu)
  *			based on different decoders such as ISDN4Linux
  *
- * This software may be used and distributed according to the terms
- * of the GNU General Public License, incorporated herein by reference.
- *
  */
 
 #include <linux/mISDNif.h>
diff --git a/drivers/isdn/mISDN/dsp_tones.c b/drivers/isdn/mISDN/dsp_tones.c
index 8389e2105cdcf6..16a47cc910c585 100644
--- a/drivers/isdn/mISDN/dsp_tones.c
+++ b/drivers/isdn/mISDN/dsp_tones.c
@@ -1,11 +1,9 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * Audio support data for ISDN4Linux.
  *
  * Copyright Andreas Eversberg (jolly@eversberg.eu)
  *
- * This software may be used and distributed according to the terms
- * of the GNU General Public License, incorporated herein by reference.
- *
  */
 
 #include <linux/gfp.h>
-- 
An old man doll... just what I always wanted! - Clara

