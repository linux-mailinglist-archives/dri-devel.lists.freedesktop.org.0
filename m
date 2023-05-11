Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 283446FF2F4
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 15:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B129F10E251;
	Thu, 11 May 2023 13:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE14910E253
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 13:34:20 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-643aad3bc41so7690815b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 06:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683812060; x=1686404060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=asp/vJbfcfKZ1KP4iU5Ob02D7CKXrgn30P/YE4w9l30=;
 b=Ofro+aKEh9auyIE8HAKilO/Zp/oidJhNsM6hmJt92myPp1QZGjwMTLINfV/un/FG0Q
 80+n7G+kj/JcXbuGIx6EeVmK8+siwekMXkynLeos22fTkv1OrvyFxJ+Z2CfbZcQfqUg8
 PvmXScoOiu1ogAt8IDoM+e9kclxy/hpWFPk+C9iABhOxlsP9Mf/RKF/DypypQzvKRt6K
 Cj/FDJi27Y+dvzxK7XHfKcshBghaAD7CGso0rcP6sfOM6rSRAqDB2jlXHzUmcCsI5coe
 O6hSYcxnKJcykjfOow5HwxXEYb2s65igmajisqhNBTMcq154WfA87cEBGQa5GIVOrdKB
 xvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683812060; x=1686404060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=asp/vJbfcfKZ1KP4iU5Ob02D7CKXrgn30P/YE4w9l30=;
 b=Dko+o8NWSbIGjB1Yk+wLRzE9ppA9cUJtgQOEzneWXIYNK/T32fBGUtFramZ6AvwFKp
 hlWztJduD1HN5oLMHtqsuiovTLk1IwOpp4mPANaHgyYcXsBb2HXP1t0aAGsOMiKbn+k4
 mR6wCBDEj2k9xLgLAFLlb+0Pcp0MhO1/rwkg84h79UZ1ChuRrS5agokkfF6JvSBIj818
 8AI1xHPDFnfgkyb6AvA/EIbK2ActKB9ayjtCUkOfdF1IWWM3WvO+YqwkD3H3FX4VxZjV
 tBvf/dRYfSaGD9/wR7b3yDYp22TyENLOSFiAcIibLLOyiJmuA1VPf8MiecBBoXj87xfI
 9Mcw==
X-Gm-Message-State: AC+VfDwKue54VZONBFS4CEI28haBDwJM3tcHEM1wtiUxMLmDHwOlupp8
 thWkOGZPPs+m1l+K6CKxZ+w=
X-Google-Smtp-Source: ACHHUZ4uoj9J2IRQ34CmZMgCP6Y2+pCOERjo8R56YDhSIPA+rrUAAAQ6AHNT1OwHCd/Za6P23vIfeQ==
X-Received: by 2002:a05:6a21:6d8e:b0:100:916:d111 with SMTP id
 wl14-20020a056a216d8e00b001000916d111mr21359146pzb.24.1683812060252; 
 Thu, 11 May 2023 06:34:20 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-92.three.co.id. [180.214.232.92])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a056a00270f00b0063f1a27f2c9sm5312910pfv.70.2023.05.11.06.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 06:34:19 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id B02501067DB; Thu, 11 May 2023 20:34:10 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>
Subject: [PATCH 06/10] pcmcia: Add SPDX identifier
Date: Thu, 11 May 2023 20:34:02 +0700
Message-Id: <20230511133406.78155-7-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511133406.78155-1-bagasdotme@gmail.com>
References: <20230511133406.78155-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=28380; i=bagasdotme@gmail.com;
 h=from:subject; bh=Q0c6EIp02T5R/jcXdb0xGm7OvcmkESzHeVT6HavlIy8=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDCkx744rvnpvf7stR7H1sxWjvHoi+4MnaU3N65/1XRG6y
 tVqx97cUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgIm8EGFkuP9HcfHUl/ZL2uvV
 ZOT2zalbbWW5adcsn0pvHm8Xi5zTCxgZnm5asWbFL/2NolIh2s+37dr3bsYxfoFLL20iBPYLZut
 qsgAA
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
 Bagas Sanjaya <bagasdotme@gmail.com>,
 "David A . Hinds" <dahinds@users.sourceforge.net>,
 Maxime Bizon <mbizon@freebox.fr>, Robert Jarzmik <robert.jarzmik@free.fr>,
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
 "David S. Miller" <davem@davemloft.net>, "John G . Dorsey" <john+@cs.cmu.edu>,
 Diederik de Haas <didi.debian@cknow.org>, Jan Kara <jack@suse.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add SPDX identifier on remaining files untouched during previous
rounds of SPDX conversion while replacing boilerplate notice if any.

Cc: Maxime Bizon <mbizon@freebox.fr>
Cc: David A. Hinds <dahinds@users.sourceforge.net>
Cc: John G. Dorsey <john+@cs.cmu.edu>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/pcmcia/bcm63xx_pcmcia.c |  5 +----
 drivers/pcmcia/cirrus.h         | 21 +--------------------
 drivers/pcmcia/i82365.c         | 22 +---------------------
 drivers/pcmcia/i82365.h         | 21 +--------------------
 drivers/pcmcia/o2micro.h        | 21 +--------------------
 drivers/pcmcia/pd6729.c         |  3 +--
 drivers/pcmcia/pxa2xx_base.h    |  1 +
 drivers/pcmcia/ricoh.h          | 21 +--------------------
 drivers/pcmcia/sa1100_generic.c | 22 +---------------------
 drivers/pcmcia/sa11xx_base.c    | 22 +---------------------
 drivers/pcmcia/sa11xx_base.h    | 22 +---------------------
 drivers/pcmcia/soc_common.c     | 22 +---------------------
 drivers/pcmcia/tcic.c           | 22 +---------------------
 drivers/pcmcia/tcic.h           | 21 +--------------------
 drivers/pcmcia/ti113x.h         | 21 +--------------------
 drivers/pcmcia/topic.h          | 23 +----------------------
 drivers/pcmcia/vg468.h          | 21 +--------------------
 17 files changed, 17 insertions(+), 294 deletions(-)

diff --git a/drivers/pcmcia/bcm63xx_pcmcia.c b/drivers/pcmcia/bcm63xx_pcmcia.c
index dd3c2609904877..a2808548d55088 100644
--- a/drivers/pcmcia/bcm63xx_pcmcia.c
+++ b/drivers/pcmcia/bcm63xx_pcmcia.c
@@ -1,8 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
  * Copyright (C) 2008 Maxime Bizon <mbizon@freebox.fr>
  */
 
diff --git a/drivers/pcmcia/cirrus.h b/drivers/pcmcia/cirrus.h
index 446a4576e73e6c..b43689337c4b34 100644
--- a/drivers/pcmcia/cirrus.h
+++ b/drivers/pcmcia/cirrus.h
@@ -1,30 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MPL 1.1 */
 /*
  * cirrus.h 1.4 1999/10/25 20:03:34
  *
- * The contents of this file are subject to the Mozilla Public License
- * Version 1.1 (the "License"); you may not use this file except in
- * compliance with the License. You may obtain a copy of the License
- * at http://www.mozilla.org/MPL/
- *
- * Software distributed under the License is distributed on an "AS IS"
- * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
- * the License for the specific language governing rights and
- * limitations under the License. 
- *
  * The initial developer of the original code is David A. Hinds
  * <dahinds@users.sourceforge.net>.  Portions created by David A. Hinds
  * are Copyright (C) 1999 David A. Hinds.  All Rights Reserved.
  *
- * Alternatively, the contents of this file may be used under the
- * terms of the GNU General Public License version 2 (the "GPL"), in which
- * case the provisions of the GPL are applicable instead of the
- * above.  If you wish to allow the use of your version of this file
- * only under the terms of the GPL and not to allow others to use
- * your version of this file under the MPL, indicate your decision by
- * deleting the provisions above and replace them with the notice and
- * other provisions required by the GPL.  If you do not delete the
- * provisions above, a recipient may use your version of this file
- * under either the MPL or the GPL.
  */
 
 #ifndef _LINUX_CIRRUS_H
diff --git a/drivers/pcmcia/i82365.c b/drivers/pcmcia/i82365.c
index 891ccea2cccb0a..c244734c91d227 100644
--- a/drivers/pcmcia/i82365.c
+++ b/drivers/pcmcia/i82365.c
@@ -1,34 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MPL-1.1 */
 /*======================================================================
 
     Device driver for Intel 82365 and compatible PC Card controllers.
 
     i82365.c 1.265 1999/11/10 18:36:21
 
-    The contents of this file are subject to the Mozilla Public
-    License Version 1.1 (the "License"); you may not use this file
-    except in compliance with the License. You may obtain a copy of
-    the License at http://www.mozilla.org/MPL/
-
-    Software distributed under the License is distributed on an "AS
-    IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
-    implied. See the License for the specific language governing
-    rights and limitations under the License.
-
     The initial developer of the original code is David A. Hinds
     <dahinds@users.sourceforge.net>.  Portions created by David A. Hinds
     are Copyright (C) 1999 David A. Hinds.  All Rights Reserved.
 
-    Alternatively, the contents of this file may be used under the
-    terms of the GNU General Public License version 2 (the "GPL"), in which
-    case the provisions of the GPL are applicable instead of the
-    above.  If you wish to allow the use of your version of this file
-    only under the terms of the GPL and not to allow others to use
-    your version of this file under the MPL, indicate your decision
-    by deleting the provisions above and replace them with the notice
-    and other provisions required by the GPL.  If you do not delete
-    the provisions above, a recipient may use your version of this
-    file under either the MPL or the GPL.
-    
 ======================================================================*/
 
 #include <linux/module.h>
diff --git a/drivers/pcmcia/i82365.h b/drivers/pcmcia/i82365.h
index 3f84d7a2dc84fa..5501001c7dd8ab 100644
--- a/drivers/pcmcia/i82365.h
+++ b/drivers/pcmcia/i82365.h
@@ -1,30 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MPL-1.1 */
 /*
  * i82365.h 1.15 1999/10/25 20:03:34
  *
- * The contents of this file are subject to the Mozilla Public License
- * Version 1.1 (the "License"); you may not use this file except in
- * compliance with the License. You may obtain a copy of the License
- * at http://www.mozilla.org/MPL/
- *
- * Software distributed under the License is distributed on an "AS IS"
- * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
- * the License for the specific language governing rights and
- * limitations under the License. 
- *
  * The initial developer of the original code is David A. Hinds
  * <dahinds@users.sourceforge.net>.  Portions created by David A. Hinds
  * are Copyright (C) 1999 David A. Hinds.  All Rights Reserved.
  *
- * Alternatively, the contents of this file may be used under the
- * terms of the GNU General Public License version 2 (the "GPL"), in which
- * case the provisions of the GPL are applicable instead of the
- * above.  If you wish to allow the use of your version of this file
- * only under the terms of the GPL and not to allow others to use
- * your version of this file under the MPL, indicate your decision by
- * deleting the provisions above and replace them with the notice and
- * other provisions required by the GPL.  If you do not delete the
- * provisions above, a recipient may use your version of this file
- * under either the MPL or the GPL.
  */
 
 #ifndef _LINUX_I82365_H
diff --git a/drivers/pcmcia/o2micro.h b/drivers/pcmcia/o2micro.h
index 5096e92c7a4cfb..8b828c0932950c 100644
--- a/drivers/pcmcia/o2micro.h
+++ b/drivers/pcmcia/o2micro.h
@@ -1,30 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MPL-1.1 */
 /*
  * o2micro.h 1.13 1999/10/25 20:03:34
  *
- * The contents of this file are subject to the Mozilla Public License
- * Version 1.1 (the "License"); you may not use this file except in
- * compliance with the License. You may obtain a copy of the License
- * at http://www.mozilla.org/MPL/
- *
- * Software distributed under the License is distributed on an "AS IS"
- * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
- * the License for the specific language governing rights and
- * limitations under the License. 
- *
  * The initial developer of the original code is David A. Hinds
  * <dahinds@users.sourceforge.net>.  Portions created by David A. Hinds
  * are Copyright (C) 1999 David A. Hinds.  All Rights Reserved.
  *
- * Alternatively, the contents of this file may be used under the
- * terms of the GNU General Public License version 2 (the "GPL"), in which
- * case the provisions of the GPL are applicable instead of the
- * above.  If you wish to allow the use of your version of this file
- * only under the terms of the GPL and not to allow others to use
- * your version of this file under the MPL, indicate your decision by
- * deleting the provisions above and replace them with the notice and
- * other provisions required by the GPL.  If you do not delete the
- * provisions above, a recipient may use your version of this file
- * under either the MPL or the GPL.
  */
 
 #ifndef _LINUX_O2MICRO_H
diff --git a/drivers/pcmcia/pd6729.c b/drivers/pcmcia/pd6729.c
index a0a2e7f18356c5..88be64cc9f5dde 100644
--- a/drivers/pcmcia/pd6729.c
+++ b/drivers/pcmcia/pd6729.c
@@ -1,10 +1,9 @@
+/* SPDX-License-Identifier: GPL-1.0-or-later */
 /*
  * Driver for the Cirrus PD6729 PCI-PCMCIA bridge.
  *
  * Based on the i82092.c driver.
  *
- * This software may be used and distributed according to the terms of
- * the GNU General Public License, incorporated herein by reference.
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/pcmcia/pxa2xx_base.h b/drivers/pcmcia/pxa2xx_base.h
index e58c7a41541880..9583d08983f5cd 100644
--- a/drivers/pcmcia/pxa2xx_base.h
+++ b/drivers/pcmcia/pxa2xx_base.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 int pxa2xx_drv_pcmcia_add_one(struct soc_pcmcia_socket *skt);
 void pxa2xx_drv_pcmcia_ops(struct pcmcia_low_level *ops);
 void pxa2xx_configure_sockets(struct device *dev, struct pcmcia_low_level *ops);
diff --git a/drivers/pcmcia/ricoh.h b/drivers/pcmcia/ricoh.h
index 8ac7b138c09486..f037169f6108f7 100644
--- a/drivers/pcmcia/ricoh.h
+++ b/drivers/pcmcia/ricoh.h
@@ -1,30 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MPL-1.1 */
 /*
  * ricoh.h 1.9 1999/10/25 20:03:34
  *
- * The contents of this file are subject to the Mozilla Public License
- * Version 1.1 (the "License"); you may not use this file except in
- * compliance with the License. You may obtain a copy of the License
- * at http://www.mozilla.org/MPL/
- *
- * Software distributed under the License is distributed on an "AS IS"
- * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
- * the License for the specific language governing rights and
- * limitations under the License. 
- *
  * The initial developer of the original code is David A. Hinds
  * <dahinds@users.sourceforge.net>.  Portions created by David A. Hinds
  * are Copyright (C) 1999 David A. Hinds.  All Rights Reserved.
  *
- * Alternatively, the contents of this file may be used under the
- * terms of the GNU General Public License version 2 (the "GPL"), in which
- * case the provisions of the GPL are applicable instead of the
- * above.  If you wish to allow the use of your version of this file
- * only under the terms of the GPL and not to allow others to use
- * your version of this file under the MPL, indicate your decision by
- * deleting the provisions above and replace them with the notice and
- * other provisions required by the GPL.  If you do not delete the
- * provisions above, a recipient may use your version of this file
- * under either the MPL or the GPL.
  */
 
 #ifndef _LINUX_RICOH_H
diff --git a/drivers/pcmcia/sa1100_generic.c b/drivers/pcmcia/sa1100_generic.c
index 89d4ba58c89135..5f3cf7229505dd 100644
--- a/drivers/pcmcia/sa1100_generic.c
+++ b/drivers/pcmcia/sa1100_generic.c
@@ -1,33 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MPL-1.1 */
 /*======================================================================
 
     Device driver for the PCMCIA control functionality of StrongARM
     SA-1100 microprocessors.
 
-    The contents of this file are subject to the Mozilla Public
-    License Version 1.1 (the "License"); you may not use this file
-    except in compliance with the License. You may obtain a copy of
-    the License at http://www.mozilla.org/MPL/
-
-    Software distributed under the License is distributed on an "AS
-    IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
-    implied. See the License for the specific language governing
-    rights and limitations under the License.
-
     The initial developer of the original code is John G. Dorsey
     <john+@cs.cmu.edu>.  Portions created by John G. Dorsey are
     Copyright (C) 1999 John G. Dorsey.  All Rights Reserved.
 
-    Alternatively, the contents of this file may be used under the
-    terms of the GNU Public License version 2 (the "GPL"), in which
-    case the provisions of the GPL are applicable instead of the
-    above.  If you wish to allow the use of your version of this file
-    only under the terms of the GPL and not to allow others to use
-    your version of this file under the MPL, indicate your decision
-    by deleting the provisions above and replace them with the notice
-    and other provisions required by the GPL.  If you do not delete
-    the provisions above, a recipient may use your version of this
-    file under either the MPL or the GPL.
-    
 ======================================================================*/
 
 #include <linux/module.h>
diff --git a/drivers/pcmcia/sa11xx_base.c b/drivers/pcmcia/sa11xx_base.c
index 48140ac73ed632..eb52de8a153df5 100644
--- a/drivers/pcmcia/sa11xx_base.c
+++ b/drivers/pcmcia/sa11xx_base.c
@@ -1,33 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MPL-1.1 */
 /*======================================================================
 
     Device driver for the PCMCIA control functionality of StrongARM
     SA-1100 microprocessors.
 
-    The contents of this file are subject to the Mozilla Public
-    License Version 1.1 (the "License"); you may not use this file
-    except in compliance with the License. You may obtain a copy of
-    the License at http://www.mozilla.org/MPL/
-
-    Software distributed under the License is distributed on an "AS
-    IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
-    implied. See the License for the specific language governing
-    rights and limitations under the License.
-
     The initial developer of the original code is John G. Dorsey
     <john+@cs.cmu.edu>.  Portions created by John G. Dorsey are
     Copyright (C) 1999 John G. Dorsey.  All Rights Reserved.
 
-    Alternatively, the contents of this file may be used under the
-    terms of the GNU Public License version 2 (the "GPL"), in which
-    case the provisions of the GPL are applicable instead of the
-    above.  If you wish to allow the use of your version of this file
-    only under the terms of the GPL and not to allow others to use
-    your version of this file under the MPL, indicate your decision
-    by deleting the provisions above and replace them with the notice
-    and other provisions required by the GPL.  If you do not delete
-    the provisions above, a recipient may use your version of this
-    file under either the MPL or the GPL.
-
 ======================================================================*/
 
 #include <linux/module.h>
diff --git a/drivers/pcmcia/sa11xx_base.h b/drivers/pcmcia/sa11xx_base.h
index 3d76d720f463de..c2dbdc5495f78e 100644
--- a/drivers/pcmcia/sa11xx_base.h
+++ b/drivers/pcmcia/sa11xx_base.h
@@ -1,33 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MPL-1.1 */
 /*======================================================================
 
     Device driver for the PCMCIA control functionality of StrongARM
     SA-1100 microprocessors.
 
-    The contents of this file are subject to the Mozilla Public
-    License Version 1.1 (the "License"); you may not use this file
-    except in compliance with the License. You may obtain a copy of
-    the License at http://www.mozilla.org/MPL/
-
-    Software distributed under the License is distributed on an "AS
-    IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
-    implied. See the License for the specific language governing
-    rights and limitations under the License.
-
     The initial developer of the original code is John G. Dorsey
     <john+@cs.cmu.edu>.  Portions created by John G. Dorsey are
     Copyright (C) 1999 John G. Dorsey.  All Rights Reserved.
 
-    Alternatively, the contents of this file may be used under the
-    terms of the GNU Public License version 2 (the "GPL"), in which
-    case the provisions of the GPL are applicable instead of the
-    above.  If you wish to allow the use of your version of this file
-    only under the terms of the GPL and not to allow others to use
-    your version of this file under the MPL, indicate your decision
-    by deleting the provisions above and replace them with the notice
-    and other provisions required by the GPL.  If you do not delete
-    the provisions above, a recipient may use your version of this
-    file under either the MPL or the GPL.
-
 ======================================================================*/
 
 #if !defined(_PCMCIA_SA1100_H)
diff --git a/drivers/pcmcia/soc_common.c b/drivers/pcmcia/soc_common.c
index 61b0c8952bb5e0..00363df3e41602 100644
--- a/drivers/pcmcia/soc_common.c
+++ b/drivers/pcmcia/soc_common.c
@@ -1,33 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MPL-1.1 */
 /*======================================================================
 
     Common support code for the PCMCIA control functionality of
     integrated SOCs like the SA-11x0 and PXA2xx microprocessors.
 
-    The contents of this file are subject to the Mozilla Public
-    License Version 1.1 (the "License"); you may not use this file
-    except in compliance with the License. You may obtain a copy of
-    the License at http://www.mozilla.org/MPL/
-
-    Software distributed under the License is distributed on an "AS
-    IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
-    implied. See the License for the specific language governing
-    rights and limitations under the License.
-
     The initial developer of the original code is John G. Dorsey
     <john+@cs.cmu.edu>.  Portions created by John G. Dorsey are
     Copyright (C) 1999 John G. Dorsey.  All Rights Reserved.
 
-    Alternatively, the contents of this file may be used under the
-    terms of the GNU Public License version 2 (the "GPL"), in which
-    case the provisions of the GPL are applicable instead of the
-    above.  If you wish to allow the use of your version of this file
-    only under the terms of the GPL and not to allow others to use
-    your version of this file under the MPL, indicate your decision
-    by deleting the provisions above and replace them with the notice
-    and other provisions required by the GPL.  If you do not delete
-    the provisions above, a recipient may use your version of this
-    file under either the MPL or the GPL.
-
 ======================================================================*/
 
 
diff --git a/drivers/pcmcia/tcic.c b/drivers/pcmcia/tcic.c
index 1a0e3f0987599d..d93848e0b6e30e 100644
--- a/drivers/pcmcia/tcic.c
+++ b/drivers/pcmcia/tcic.c
@@ -1,34 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MPL-1.1 */
 /*======================================================================
 
     Device driver for Databook TCIC-2 PCMCIA controller
 
     tcic.c 1.111 2000/02/15 04:13:12
 
-    The contents of this file are subject to the Mozilla Public
-    License Version 1.1 (the "License"); you may not use this file
-    except in compliance with the License. You may obtain a copy of
-    the License at http://www.mozilla.org/MPL/
-
-    Software distributed under the License is distributed on an "AS
-    IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
-    implied. See the License for the specific language governing
-    rights and limitations under the License.
-
     The initial developer of the original code is David A. Hinds
     <dahinds@users.sourceforge.net>.  Portions created by David A. Hinds
     are Copyright (C) 1999 David A. Hinds.  All Rights Reserved.
 
-    Alternatively, the contents of this file may be used under the
-    terms of the GNU General Public License version 2 (the "GPL"), in which
-    case the provisions of the GPL are applicable instead of the
-    above.  If you wish to allow the use of your version of this file
-    only under the terms of the GPL and not to allow others to use
-    your version of this file under the MPL, indicate your decision
-    by deleting the provisions above and replace them with the notice
-    and other provisions required by the GPL.  If you do not delete
-    the provisions above, a recipient may use your version of this
-    file under either the MPL or the GPL.
-    
 ======================================================================*/
 
 #include <linux/module.h>
diff --git a/drivers/pcmcia/tcic.h b/drivers/pcmcia/tcic.h
index 2c0b8f65ad6c6f..aff1e65fc69032 100644
--- a/drivers/pcmcia/tcic.h
+++ b/drivers/pcmcia/tcic.h
@@ -1,30 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MPL-1.1 */
 /*
  * tcic.h 1.13 1999/10/25 20:03:34
  *
- * The contents of this file are subject to the Mozilla Public License
- * Version 1.1 (the "License"); you may not use this file except in
- * compliance with the License. You may obtain a copy of the License
- * at http://www.mozilla.org/MPL/
- *
- * Software distributed under the License is distributed on an "AS IS"
- * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
- * the License for the specific language governing rights and
- * limitations under the License. 
- *
  * The initial developer of the original code is David A. Hinds
  * <dahinds@users.sourceforge.net>.  Portions created by David A. Hinds
  * are Copyright (C) 1999 David A. Hinds.  All Rights Reserved.
  *
- * Alternatively, the contents of this file may be used under the
- * terms of the GNU General Public License version 2 (the "GPL"), in which
- * case the provisions of the GPL are applicable instead of the
- * above.  If you wish to allow the use of your version of this file
- * only under the terms of the GPL and not to allow others to use
- * your version of this file under the MPL, indicate your decision by
- * deleting the provisions above and replace them with the notice and
- * other provisions required by the GPL.  If you do not delete the
- * provisions above, a recipient may use your version of this file
- * under either the MPL or the GPL.
  */
 
 #ifndef _LINUX_TCIC_H
diff --git a/drivers/pcmcia/ti113x.h b/drivers/pcmcia/ti113x.h
index 5cb670e037a0c6..a65ab56551ee93 100644
--- a/drivers/pcmcia/ti113x.h
+++ b/drivers/pcmcia/ti113x.h
@@ -1,30 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MPL-1.1 */
 /*
  * ti113x.h 1.16 1999/10/25 20:03:34
  *
- * The contents of this file are subject to the Mozilla Public License
- * Version 1.1 (the "License"); you may not use this file except in
- * compliance with the License. You may obtain a copy of the License
- * at http://www.mozilla.org/MPL/
- *
- * Software distributed under the License is distributed on an "AS IS"
- * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
- * the License for the specific language governing rights and
- * limitations under the License. 
- *
  * The initial developer of the original code is David A. Hinds
  * <dahinds@users.sourceforge.net>.  Portions created by David A. Hinds
  * are Copyright (C) 1999 David A. Hinds.  All Rights Reserved.
  *
- * Alternatively, the contents of this file may be used under the
- * terms of the GNU General Public License version 2 (the "GPL"), in which
- * case the provisions of the GPL are applicable instead of the
- * above.  If you wish to allow the use of your version of this file
- * only under the terms of the GPL and not to allow others to use
- * your version of this file under the MPL, indicate your decision by
- * deleting the provisions above and replace them with the notice and
- * other provisions required by the GPL.  If you do not delete the
- * provisions above, a recipient may use your version of this file
- * under either the MPL or the GPL.
  */
 
 #ifndef _LINUX_TI113X_H
diff --git a/drivers/pcmcia/topic.h b/drivers/pcmcia/topic.h
index 582688fe750540..d1ad01abab13f4 100644
--- a/drivers/pcmcia/topic.h
+++ b/drivers/pcmcia/topic.h
@@ -1,31 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MPL-1.1 */
 /*
  * topic.h 1.8 1999/08/28 04:01:47
  *
- * The contents of this file are subject to the Mozilla Public License
- * Version 1.1 (the "License"); you may not use this file except in
- * compliance with the License. You may obtain a copy of the License
- * at http://www.mozilla.org/MPL/
- *
- * Software distributed under the License is distributed on an "AS IS"
- * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
- * the License for the specific language governing rights and
- * limitations under the License. 
- *
  * The initial developer of the original code is David A. Hinds
  * <dahinds@users.sourceforge.net>.  Portions created by David A. Hinds
  * are Copyright (C) 1999 David A. Hinds.  All Rights Reserved.
- *
- * Alternatively, the contents of this file may be used under the
- * terms of the GNU General Public License version 2 (the "GPL"), in which
- * case the provisions of the GPL are applicable instead of the
- * above.  If you wish to allow the use of your version of this file
- * only under the terms of the GPL and not to allow others to use
- * your version of this file under the MPL, indicate your decision by
- * deleting the provisions above and replace them with the notice and
- * other provisions required by the GPL.  If you do not delete the
- * provisions above, a recipient may use your version of this file
- * under either the MPL or the GPL.
- * topic.h $Release$ 1999/08/28 04:01:47
  */
 
 #ifndef _LINUX_TOPIC_H
diff --git a/drivers/pcmcia/vg468.h b/drivers/pcmcia/vg468.h
index 88c2b487f675fc..c582fc8086c26d 100644
--- a/drivers/pcmcia/vg468.h
+++ b/drivers/pcmcia/vg468.h
@@ -1,30 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MPL-1.1 */
 /*
  * vg468.h 1.11 1999/10/25 20:03:34
  *
- * The contents of this file are subject to the Mozilla Public License
- * Version 1.1 (the "License"); you may not use this file except in
- * compliance with the License. You may obtain a copy of the License
- * at http://www.mozilla.org/MPL/
- *
- * Software distributed under the License is distributed on an "AS IS"
- * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
- * the License for the specific language governing rights and
- * limitations under the License. 
- *
  * The initial developer of the original code is David A. Hinds
  * <dahinds@users.sourceforge.net>.  Portions created by David A. Hinds
  * are Copyright (C) 1999 David A. Hinds.  All Rights Reserved.
  *
- * Alternatively, the contents of this file may be used under the
- * terms of the GNU General Public License version 2 (the "GPL"), in which
- * case the provisions of the GPL are applicable instead of the
- * above.  If you wish to allow the use of your version of this file
- * only under the terms of the GPL and not to allow others to use
- * your version of this file under the MPL, indicate your decision by
- * deleting the provisions above and replace them with the notice and
- * other provisions required by the GPL.  If you do not delete the
- * provisions above, a recipient may use your version of this file
- * under either the MPL or the GPL.
  */
 
 #ifndef _LINUX_VG468_H
-- 
An old man doll... just what I always wanted! - Clara

