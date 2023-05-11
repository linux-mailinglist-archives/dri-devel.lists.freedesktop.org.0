Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7BF6FF2F7
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 15:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4216F10E25A;
	Thu, 11 May 2023 13:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3085110E24A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 13:34:19 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6439d505274so5135134b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 06:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683812059; x=1686404059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TvQJn1ZYg8v6mzW/3fuRQrh0U5JZY6q45my8do7wZYs=;
 b=FR+lzS6ws1s4+0BrEjJOxT3QCZs1zlHFw3iwFQrRdE7KhykZ7Sp0+htFAd1PSSpalK
 mKR095SMhXajOz7nXdpXAV4iTrCmPghLd7jHkIlnJhAyKwcS9jlNiSxnsZ5zsKyoAZ0w
 Q+jD/SjjqThiD8VaYNFNqg3LHzly1stKY0Qtx7PIngeyD7udj7WpeighIV9ovfsPyRH3
 uQVMsDINQTkpGWe583FbNKG59vQRYyChe5Ytug1DzKUlyMAUZJh2xhRhA2Xtg8uOYyMb
 i9AsIm25FzQm3J9Q2zbEGteOfrDBkFsh7aXa8N/f9udABiEeROrBrYCdC6NJdS/MVUR3
 ROIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683812059; x=1686404059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TvQJn1ZYg8v6mzW/3fuRQrh0U5JZY6q45my8do7wZYs=;
 b=AnFNqkd5LYJY1DCeCq82791K1EpuZGyow9wpjuaReWKz/WUB55L7vdqcVe6v982H6G
 P+vs3vCtvRKWa2qQ4FrB9w19WdxIS0RpwRUbf4ArTTe1tdHus5vvDMZLZzvq3xu+IZuY
 mhYxduxTqsvl1f2MRrgIY8VvNQgJlQhpoI8bNN4URAYbLG84uw+2Y8gPa0dABY/rgKZ9
 jvVfZ7lKPmFWPZZhLfDepp7/Z2HyoxsAMnuCCkXl+R0R8YOq0nxI+ybA5gl5iKSFba8h
 NgyVa+BO0SKJ3pN/9dMr4ipWskn++Pz4CJrnsgaYJTP4oXcHSAo5XVoPEZaelKpIm///
 K17g==
X-Gm-Message-State: AC+VfDz5Z6TS3I3cJwUd6up0Vzmaal1qCDOXEdHpaA/YRGSB5X+ZKA5j
 5rRPiIH1IgIU2HlWkMiYzRI=
X-Google-Smtp-Source: ACHHUZ5NDjpLkh72vHHJby/leGVfGAdpd/rXrohEx64pMCXFR9O2axrH/afoz3S2ysKgGwKiIxuQKA==
X-Received: by 2002:a05:6a20:144b:b0:101:3c60:67b6 with SMTP id
 a11-20020a056a20144b00b001013c6067b6mr13479679pzi.12.1683812058680; 
 Thu, 11 May 2023 06:34:18 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-92.three.co.id. [180.214.232.92])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a634457000000b0051afa49e07asm4963031pgk.50.2023.05.11.06.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 06:34:18 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 99EC5106778; Thu, 11 May 2023 20:34:10 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>
Subject: [PATCH 05/10] net: ethernet: i825xx: Replace GPL boilerplate with
 SPDX identifier
Date: Thu, 11 May 2023 20:34:01 +0700
Message-Id: <20230511133406.78155-6-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511133406.78155-1-bagasdotme@gmail.com>
References: <20230511133406.78155-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4893; i=bagasdotme@gmail.com;
 h=from:subject; bh=GwswZdBixKoBuDzSlGkyZUlVCYOt8JMfPk9+Zwjys5g=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDCkx746n20wxN5ibc33GrsQ9MRt3hN341Lkzte7MBAGDh
 0cn1x4811HKwiDGxSArpsgyKZGv6fQuI5EL7WsdYeawMoEMYeDiFICJHHnG8L9q2uNAqbXrtkRf
 YmAKTJ9zmN12Ue462eNHZDvmKGwRKJnPyPBLMdJ7QUHKXY3pb94UCma26GYniZd7zNmq6ajdpnO
 xmREA
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
 Sam Creasey <sammy@sammy.net>, Donald Becker <becker@scyld.com>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Jay Vosburgh <j.vosburgh@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Yang Yingliang <yangyingliang@huawei.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Michael Hipp <hippm@informatik.uni-tuebingen.de>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Archana <craechal@gmail.com>,
 Karsten Keil <isdn@linux-pingi.de>, Deepak R Varma <drv@mailo.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Diederik de Haas <didi.debian@cknow.org>, Jan Kara <jack@suse.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace unversioned GPL boilerplate notice on remaining i825xx files
with appropriate SPDX identifier. For files that contains "extension to
Linux kernel", use GPL 2.0, otherwise GPL 1.0+.

Cc: Donald Becker <becker@scyld.com>
Cc: Michael Hipp <hippm@informatik.uni-tuebingen.de>
Cc: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/net/ethernet/i825xx/82596.c      | 5 ++---
 drivers/net/ethernet/i825xx/lasi_82596.c | 5 ++---
 drivers/net/ethernet/i825xx/lib82596.c   | 5 ++---
 drivers/net/ethernet/i825xx/sun3_82586.c | 4 +---
 drivers/net/ethernet/i825xx/sun3_82586.h | 4 +---
 5 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/i825xx/82596.c b/drivers/net/ethernet/i825xx/82596.c
index 3ee89ae496d0ca..cfca25a6c5c03e 100644
--- a/drivers/net/ethernet/i825xx/82596.c
+++ b/drivers/net/ethernet/i825xx/82596.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-1.0-or-later */
 /* 82596.c: A generic 82596 ethernet driver for linux. */
 /*
    Based on Apricot.c
@@ -31,9 +32,7 @@
    Driver skeleton
    Written 1993 by Donald Becker.
    Copyright 1993 United States Government as represented by the Director,
-   National Security Agency. This software may only be used and distributed
-   according to the terms of the GNU General Public License as modified by SRC,
-   incorporated herein by reference.
+   National Security Agency.
 
    The author may be reached as becker@scyld.com, or C/O
    Scyld Computing Corporation, 410 Severn Ave., Suite 210, Annapolis MD 21403
diff --git a/drivers/net/ethernet/i825xx/lasi_82596.c b/drivers/net/ethernet/i825xx/lasi_82596.c
index 0af70094aba341..a5bb26d101bc97 100644
--- a/drivers/net/ethernet/i825xx/lasi_82596.c
+++ b/drivers/net/ethernet/i825xx/lasi_82596.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-1.0-or-later */
 /* lasi_82596.c -- driver for the intel 82596 ethernet controller, as
    munged into HPPA boxen .
 
@@ -59,9 +60,7 @@
    Driver skeleton
    Written 1993 by Donald Becker.
    Copyright 1993 United States Government as represented by the Director,
-   National Security Agency. This software may only be used and distributed
-   according to the terms of the GNU General Public License as modified by SRC,
-   incorporated herein by reference.
+   National Security Agency.
 
    The author may be reached as becker@scyld.com, or C/O
    Scyld Computing Corporation, 410 Severn Ave., Suite 210, Annapolis MD 21403
diff --git a/drivers/net/ethernet/i825xx/lib82596.c b/drivers/net/ethernet/i825xx/lib82596.c
index ca2fb303fcc6f6..f158484c82dd86 100644
--- a/drivers/net/ethernet/i825xx/lib82596.c
+++ b/drivers/net/ethernet/i825xx/lib82596.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-1.0-or-later */
 /* lasi_82596.c -- driver for the intel 82596 ethernet controller, as
    munged into HPPA boxen .
 
@@ -59,9 +60,7 @@
    Driver skeleton
    Written 1993 by Donald Becker.
    Copyright 1993 United States Government as represented by the Director,
-   National Security Agency. This software may only be used and distributed
-   according to the terms of the GNU General Public License as modified by SRC,
-   incorporated herein by reference.
+   National Security Agency.
 
    The author may be reached as becker@scyld.com, or C/O
    Scyld Computing Corporation, 410 Severn Ave., Suite 210, Annapolis MD 21403
diff --git a/drivers/net/ethernet/i825xx/sun3_82586.c b/drivers/net/ethernet/i825xx/sun3_82586.c
index 3909c6a0af89f9..c64bf2d8ae8add 100644
--- a/drivers/net/ethernet/i825xx/sun3_82586.c
+++ b/drivers/net/ethernet/i825xx/sun3_82586.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Sun3 i82586 Ethernet driver
  *
@@ -8,9 +9,6 @@
  *
  * net-3-driver for the NI5210 card (i82586 Ethernet chip)
  *
- * This is an extension to the Linux operating system, and is covered by the
- * same Gnu Public License that covers that work.
- *
  * Alphacode 0.82 (96/09/29) for Linux 2.0.0 (or later)
  * Copyrights (c) 1994,1995,1996 by M.Hipp (hippm@informatik.uni-tuebingen.de)
  * --------------------------
diff --git a/drivers/net/ethernet/i825xx/sun3_82586.h b/drivers/net/ethernet/i825xx/sun3_82586.h
index d82eca563266a1..82702b32c61fec 100644
--- a/drivers/net/ethernet/i825xx/sun3_82586.h
+++ b/drivers/net/ethernet/i825xx/sun3_82586.h
@@ -1,9 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Intel i82586 Ethernet definitions
  *
- * This is an extension to the Linux operating system, and is covered by the
- * same Gnu Public License that covers that work.
- *
  * copyrights (c) 1994 by Michael Hipp (hippm@informatik.uni-tuebingen.de)
  *
  * I have done a look in the following sources:
-- 
An old man doll... just what I always wanted! - Clara

