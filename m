Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12546FF2F0
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 15:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BC210E243;
	Thu, 11 May 2023 13:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F3710E240
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 13:34:16 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-64115eef620so57910709b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 06:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683812056; x=1686404056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XPQCkH64CNFAQt/WeXCfUvrIoglaGTPj4GtDmz/dzcQ=;
 b=afwzm1NJKhY/AGMm4Ukn8Imuqv9CCQxXBvXEUTCs/qMHxCAIFSog6kU+C4CeaJtk1d
 FkLcNbqx2GplOXyzHHJaY+ER1f/PJOy6Fg4EHIHb5OPxQTfL2HV08JF8B2wpaCu03/SE
 8jF6K0FVmX9SDxcY7WmQaqOo/BwIYVijsAheX7ZBNYfAM43CnSh6pyFBbhRsYRJNmNhY
 oSg1PXZ3TgpG4sorx/zMULZ9WhUr3Zd0Specs8gaJyWoi4MWQlbldF6ljQudY4c/VxSF
 yBi6cjqRmp53+v0keU1WhJ1snXq1qJmW3cPOBixJYCcl44ZdHxz0fS0+s840C4O/weyb
 qDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683812056; x=1686404056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XPQCkH64CNFAQt/WeXCfUvrIoglaGTPj4GtDmz/dzcQ=;
 b=BWLQiOws3iHgn6IGL7/VfdF9CvXDXksg4+mJE7W/Cai1fd32YujcK9ieW8h/8NNz7C
 PUthzUA+4UFMP8ZLNlFIu9R0OT0t/MDN3DxpWrjRVlFzvW37urnwXpwzhd9yEVUtZDyF
 Ovq3gdec4qGA5qY/aXD4gSfmRrZsYrh6uSrGDQilBecf54JSnVellfPRvOaj5HGG3WIi
 QVq+uskTGx01B2n03SV6Mq1g6REcQ8W7+u1wArMU3P8HDJU6ohDrWO2mmVTRQ8UEjEyI
 zS75vl4/y1tl9xBey9PVP6KdI1f2O4k3GBlNXwr/WXKz3hEVKSj79T0pbdPHY4JQpPQX
 PfHg==
X-Gm-Message-State: AC+VfDxpWgoxGaWRwh4K6JnPT8a0fejFy0w/HQCxdKkyFyonfI24TCDJ
 CsBhiWes4WBvyPkMej0YlrQ=
X-Google-Smtp-Source: ACHHUZ4O1Jat5CJArv133r+VpyuY8MQSaAtCOvha77FamvBMtlmldVdj4KXYHlWxeZOFjIPmFy4Zqw==
X-Received: by 2002:a05:6a20:3ca9:b0:f3:3ea5:5185 with SMTP id
 b41-20020a056a203ca900b000f33ea55185mr25359361pzj.10.1683812055664; 
 Thu, 11 May 2023 06:34:15 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-92.three.co.id. [180.214.232.92])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b00640e01dfba0sm5468631pfm.175.2023.05.11.06.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 06:34:15 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id E58141067A9; Thu, 11 May 2023 20:34:09 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>
Subject: [PATCH 02/10] mISDN: Replace GPL notice boilerplate with SPDX
 identifier
Date: Thu, 11 May 2023 20:33:58 +0700
Message-Id: <20230511133406.78155-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511133406.78155-1-bagasdotme@gmail.com>
References: <20230511133406.78155-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4139; i=bagasdotme@gmail.com;
 h=from:subject; bh=cJS8ef+qojTtJfUCqsZFkSaB82TgDOnvwkt3EGdvflA=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDCkx747Fz56X8GZ15aRzh97mM8+U03ALmneF+dT5Zxb3L
 by5b3+S6ShlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBEWDwY/nCc93sU6xFW5SS2
 dSGr18XStuYJxZMfz1gS9iRGYZrrczuGfzrtmVY9x9cIby/a/8Sdf0rADrNJqZ+mJkuee7Kw6rn
 BZX4A
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Pavel Machek <pavel@ucw.cz>,
 Tom Rix <trix@redhat.com>, Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Dumazet <edumazet@google.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Gaosheng Cui <cuigaosheng1@huawei.com>, Andy Gospodarek <andy@greyhouse.net>,
 Dan Carpenter <error27@gmail.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Minghao Chi <chi.minghao@zte.com.cn>, Simon Horman <simon.horman@corigine.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Sam Creasey <sammy@sammy.net>, Arnd Bergmann <arnd@arndb.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Kalle Valo <kvalo@kernel.org>, Yang Yingliang <yangyingliang@huawei.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Archana <craechal@gmail.com>,
 Karsten Keil <isdn@linux-pingi.de>, Deepak R Varma <drv@mailo.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Diederik de Haas <didi.debian@cknow.org>, Jan Kara <jack@suse.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace unversioned GPL notice boilerplate on dsp_* with SPDX identifier
for GPL 1.0+. These files missed previous SPDX conversion batches
due to not specifying GPL version.

Cc: Stephen Hemminger <stephen@networkplumber.org>
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
index bbef98e7a16efb..869c3a7d92a981 100644
--- a/drivers/isdn/mISDN/dsp_audio.c
+++ b/drivers/isdn/mISDN/dsp_audio.c
@@ -1,12 +1,10 @@
+/* SPDX-License-Identifier: GPL-1.0-or-later */
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
index 0aa572f3858da7..bd83aacf9ffd96 100644
--- a/drivers/isdn/mISDN/dsp_blowfish.c
+++ b/drivers/isdn/mISDN/dsp_blowfish.c
@@ -1,11 +1,9 @@
+/* SPDX-License-Identifier: GPL-1.0-or-later */
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
index 357b87592eb48c..b9b3fbb5791121 100644
--- a/drivers/isdn/mISDN/dsp_cmx.c
+++ b/drivers/isdn/mISDN/dsp_cmx.c
@@ -1,11 +1,9 @@
+/* SPDX-License-Identifier: GPL-1.0-or-later */
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
index 386084530c2f85..800ad56d21285e 100644
--- a/drivers/isdn/mISDN/dsp_core.c
+++ b/drivers/isdn/mISDN/dsp_core.c
@@ -1,10 +1,9 @@
+/* SPDX-License-Identifier: GPL-1.0-or-later */
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
index 642f30be5ce249..baf69d585afe00 100644
--- a/drivers/isdn/mISDN/dsp_dtmf.c
+++ b/drivers/isdn/mISDN/dsp_dtmf.c
@@ -1,12 +1,10 @@
+/* SPDX-License-Identifier: GPL-1.0-or-later */
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
index 8389e2105cdcf6..becfb1dd60d631 100644
--- a/drivers/isdn/mISDN/dsp_tones.c
+++ b/drivers/isdn/mISDN/dsp_tones.c
@@ -1,11 +1,9 @@
+/* SPDX-License-Identifier: GPL-1.0-or-later */
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

