Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0EE7004D8
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 12:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3456810E672;
	Fri, 12 May 2023 10:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804CE10E666
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 10:07:04 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1ab0c697c2bso90162425ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 03:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683886024; x=1686478024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tj5pvaj+seJWIFkPLpPbpI3AoWtV11yrHHOkjZ8TRTs=;
 b=CPlFWwVzgvH09bCD5772CzEgDVuK9gZFTHaiM6PQz7et0YoNQptXIZaC3mDK6qPZKP
 ZAZAq1x5VREGypxgGq4mny/Ron8FyX/l4nDYDBASWpLxMWZwl0Y54RorXBLm8LOqAfFo
 gLDXfOpSL3MBbOI49R28WSFB6iW2f71z0YzQyniYGJsERgb6qNsGwsw4NQ9nQyBtdRt5
 GzTORH9onjhLH+rD/FtfRgUjcoCuXxpmmHdLuvrM2JMA6SuD3sKzMqYR3dqIFcnf0SAT
 RoGOLWcX3R7Jo+EzNTLcw1uJ0VEvunSel2N7HBXEW4/6Mk13FZfJpPoYRMPHlLejxhao
 5Inw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683886024; x=1686478024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tj5pvaj+seJWIFkPLpPbpI3AoWtV11yrHHOkjZ8TRTs=;
 b=bVmFdEL776Owuw/4hh/52mwRmxwXQr+tQbIwAx3uGZ1nd3QMqwydJ4J7BN/w1il3/p
 sayz067w+8WFpptBCCN7IolIVS6qjE9AOJnPEcH/WAXkMUuraE+K0fJqiX3BDijZq/wy
 LDz3hxd5aTVKYDi6KI7h25PnVeGbUersp3oaTebfe5qAVEZavzsxZtRvAkl+AwwYFtXy
 j++YkzJ3Fu5/SaGLV+lsjafep2p/q9EXJbCKMfIiAfp4GInTCDnSCs0edwLSlATKcXir
 57fUkYqI3+1Qt/GmMMVIxNJeW2847F+9rmn+Xnj/VkTFC4ZYQFJUgeOm17i3xcJj77aN
 S0Eg==
X-Gm-Message-State: AC+VfDyT68pm+5gRWaMS0MVyQFxaE57KX8ZEho85H18RU+ItM5YeZ1zA
 JO5JiPPJENTVladVQHNDjVo=
X-Google-Smtp-Source: ACHHUZ5ijikUeX5GwZUYlw3Q/RZIQz5YL14h8fHBe+rFuJgp07FdlF342StUR5NutJfWnEJUxb3Rxw==
X-Received: by 2002:a17:902:724b:b0:1ad:e758:867d with SMTP id
 c11-20020a170902724b00b001ade758867dmr1112221pll.39.1683886023853; 
 Fri, 12 May 2023 03:07:03 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-58.three.co.id. [116.206.12.58])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a1709026b8a00b001acaf7e22bdsm5626813plk.14.2023.05.12.03.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 03:07:03 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 0C62D106B3F; Fri, 12 May 2023 17:06:55 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>
Subject: [PATCH v2 05/10] net: ethernet: i825xx: Replace GPL boilerplate with
 SPDX identifier
Date: Fri, 12 May 2023 17:06:16 +0700
Message-Id: <20230512100620.36807-6-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512100620.36807-1-bagasdotme@gmail.com>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4950; i=bagasdotme@gmail.com;
 h=from:subject; bh=eaiYhx2iYyl2JvyXlLz+A/gr8AwbyYRGGW56d/Gf174=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDClx/DMeV5ic3teQduL03i+NJhM1qheYMuSev/3kGEOLg
 0/65ObtHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZhIz0KGvyKPS5pqt9ss5115
 8WrmoiV/bJReizw7wnpQY2+nhUiD4zZGhuXau2bY29+OkV2b/mZlq+Bjz5+TmY9pdkipPxWo6Bc
 JZQcA
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Simon Horman <simon.horman@corigine.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Dumazet <edumazet@google.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Andy Gospodarek <andy@greyhouse.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, Sam Creasey <sammy@sammy.net>,
 Donald Becker <becker@scyld.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Jay Vosburgh <j.vosburgh@gmail.com>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Michael Hipp <hippm@informatik.uni-tuebingen.de>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Karsten Keil <isdn@linux-pingi.de>,
 Richard Hirst <richard@sleepie.demon.co.uk>,
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
Cc: Richard Hirst <richard@sleepie.demon.co.uk>
Cc: Sam Creasey <sammy@sammy.net>
Reviewed-by: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/net/ethernet/i825xx/82596.c      | 5 ++---
 drivers/net/ethernet/i825xx/lasi_82596.c | 5 ++---
 drivers/net/ethernet/i825xx/lib82596.c   | 5 ++---
 drivers/net/ethernet/i825xx/sun3_82586.c | 4 +---
 drivers/net/ethernet/i825xx/sun3_82586.h | 4 +---
 5 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/i825xx/82596.c b/drivers/net/ethernet/i825xx/82596.c
index 3ee89ae496d0ca..773d7aa29ef5fc 100644
--- a/drivers/net/ethernet/i825xx/82596.c
+++ b/drivers/net/ethernet/i825xx/82596.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-1.0+
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
index 0af70094aba341..3e53e0c243ba04 100644
--- a/drivers/net/ethernet/i825xx/lasi_82596.c
+++ b/drivers/net/ethernet/i825xx/lasi_82596.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-1.0+
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
index ca2fb303fcc6f6..67d248a7a6f49e 100644
--- a/drivers/net/ethernet/i825xx/lib82596.c
+++ b/drivers/net/ethernet/i825xx/lib82596.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-1.0+
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
index 3909c6a0af89f9..f05f016cb3b0ea 100644
--- a/drivers/net/ethernet/i825xx/sun3_82586.c
+++ b/drivers/net/ethernet/i825xx/sun3_82586.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
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

