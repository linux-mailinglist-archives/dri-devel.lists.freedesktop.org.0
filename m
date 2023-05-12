Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C19857004C8
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 12:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5833310E66D;
	Fri, 12 May 2023 10:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF5410E65F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 10:07:02 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-64ab2a37812so3590181b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 03:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683886021; x=1686478021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4KIpv4WltxOX2Z/4nLCGiCrEW99+slO6rQFVOFj9jCM=;
 b=puurPWhhvbxp0nMkmfMrx/ZJHuGf+p4ENUA03qKwcBIg21G62RM+E50o8mmxp4Dtcp
 rwZnfW5sQsZM6Aa7m2ikwNxuOTuI0pdOyhq/34Xwxg8u8qMaudveTvPYJOqShCgA9WoR
 WS2XWB9fhgomedNGGzPhy8hZTQMbHUQVliNDqM17J3pzq/g9EAnLgEnw76cg0TfCJnAF
 L9gPf6m8KlLdzFEb4fyVngC139y4KIPF2x5Gf3iMN3rGanH99lXvA5HIh83AlmWkSQtD
 9haDzk3X+d2SEiwX0Uz+Xx7TDdIr8fs2+vdSXnS/WvXgv50dHpn25tYgJXhem2rkcRbH
 xJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683886021; x=1686478021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4KIpv4WltxOX2Z/4nLCGiCrEW99+slO6rQFVOFj9jCM=;
 b=Q9ck8ZmEIVS4pL+e/Xr1RZonv8XSpoW88CBkeDEeh9vEU//lglpR90dukTeIlMqcPj
 FGNuI1sLQwfZmW00ynaPcpv2zUAwnKOBpfN9CUZph6CQdNYtzSPGulpCjOCoZZc5T42i
 XJugdh3/y86GraSIEwPv6FNdLV0FZac0/BK+5JC08aVmergJwcSCWoxDyk8XxnVZ9yNu
 QS7AgGib/omlpYDE5H6zskd2YffIBF6ax/7UYO9Sptk2cEjldTRC3JvmrUzjbr0Lwz10
 STlXFe3QrnhP3GzjUgfvSsSIwxTzI1gSpaQSnw5628oC7V5/D8EtBLQV/dz0ugaGB9Y7
 v72g==
X-Gm-Message-State: AC+VfDzSPehliB2heJqlsu0eoqSrrkc6wIoFr56MDF8lfuusk+yPmfbh
 NfrNzegCRFPg599R81Wchrg=
X-Google-Smtp-Source: ACHHUZ4J/D/M6jg7AiPgJwjC+cB0O+qBsGQ6CE1m/1OAOemMhNrXsreGHuFd+auJae3YGNdT9NjvnQ==
X-Received: by 2002:a05:6a00:3318:b0:63d:368c:97c2 with SMTP id
 cq24-20020a056a00331800b0063d368c97c2mr34175864pfb.8.1683886021097; 
 Fri, 12 May 2023 03:07:01 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-58.three.co.id. [116.206.12.58])
 by smtp.gmail.com with ESMTPSA id
 u19-20020aa78393000000b006242f4a8945sm6703481pfm.182.2023.05.12.03.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 03:06:59 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 52FF2106B34; Fri, 12 May 2023 17:06:54 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>
Subject: [PATCH v2 04/10] net: ethernet: 8390: Replace GPL boilerplate with
 SPDX identifier
Date: Fri, 12 May 2023 17:06:15 +0700
Message-Id: <20230512100620.36807-5-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512100620.36807-1-bagasdotme@gmail.com>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12269; i=bagasdotme@gmail.com;
 h=from:subject; bh=InmDovYJY2agWe7gpR1Z4FTdo82Q9Yqm+WaEZzImljM=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDClx/NNtf7/4wPm06oxprKRPgf+K4gjFL6nv9aZHNHpzv
 Fyhr3aoo5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABPJesvI8PTEQiMG1m2W2+zP
 nne/KGBTcSxeaN5n8Ssbz0wVm3tu7gJGhml9UWwTy868WMF96fP8H8kvi6bMOxDiNdlHhbXlcIP
 QJn4A
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
 "David A . Hinds" <dahinds@users.sourceforge.net>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Greg Ungerer <gerg@linux-m68k.org>,
 Andy Gospodarek <andy@greyhouse.net>, Bruce Abbott <bhabbott@inhb.co.nz>,
 Topi Kanerva <topi@susanna.oulu.fi>, Peter De Schrijver <p2@mind.be>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, Sam Creasey <sammy@sammy.net>,
 Donald Becker <becker@scyld.com>, Alain Malek <Alain.Malek@cryogen.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, David Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Alan Cox <alan@linux.intel.com>,
 Karsten Keil <isdn@linux-pingi.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Diederik de Haas <didi.debian@cknow.org>, Jan Kara <jack@suse.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace GPL boilerplate notice on remaining files with appropriate SPDX
tag. For files mentioning COPYING, use GPL 2.0; otherwise GPL 1.0+.

Cc: David A. Hinds <dahinds@users.sourceforge.net>
Cc: Donald Becker <becker@scyld.com>
Cc: Peter De Schrijver <p2@mind.be>
Cc: Topi Kanerva <topi@susanna.oulu.fi>
Cc: Alain Malek <Alain.Malek@cryogen.com>
Cc: Bruce Abbott <bhabbott@inhb.co.nz>
Cc: Alan Cox <alan@linux.intel.com>
Acked-by: Greg Ungerer <gerg@linux-m68k.org>
Reviewed-by: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/net/ethernet/8390/8390.h      | 2 ++
 drivers/net/ethernet/8390/apne.c      | 7 +------
 drivers/net/ethernet/8390/axnet_cs.c  | 6 +++---
 drivers/net/ethernet/8390/hydra.c     | 6 ++----
 drivers/net/ethernet/8390/lib8390.c   | 5 ++---
 drivers/net/ethernet/8390/mac8390.c   | 6 ++----
 drivers/net/ethernet/8390/mcf8390.c   | 4 +---
 drivers/net/ethernet/8390/ne.c        | 4 +---
 drivers/net/ethernet/8390/ne2k-pci.c  | 8 +-------
 drivers/net/ethernet/8390/pcnet_cs.c  | 5 ++---
 drivers/net/ethernet/8390/smc-ultra.c | 4 +---
 drivers/net/ethernet/8390/stnic.c     | 5 +----
 drivers/net/ethernet/8390/wd.c        | 4 +---
 drivers/net/ethernet/8390/zorro8390.c | 7 +------
 14 files changed, 21 insertions(+), 52 deletions(-)

diff --git a/drivers/net/ethernet/8390/8390.h b/drivers/net/ethernet/8390/8390.h
index e5226446599884..f784a6e2ab0ed3 100644
--- a/drivers/net/ethernet/8390/8390.h
+++ b/drivers/net/ethernet/8390/8390.h
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-1.0+ */
+
 /* Generic NS8390 register definitions. */
 
 /* This file is part of Donald Becker's 8390 drivers, and is distributed
diff --git a/drivers/net/ethernet/8390/apne.c b/drivers/net/ethernet/8390/apne.c
index 991ad953aa7906..bf9a95875b0b20 100644
--- a/drivers/net/ethernet/8390/apne.c
+++ b/drivers/net/ethernet/8390/apne.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*
  * Amiga Linux/68k 8390 based PCMCIA Ethernet Driver for the Amiga 1200
  *
@@ -19,12 +20,6 @@
  *
  * ----------------------------------------------------------------------------
  *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file COPYING in the main directory of the Linux
- * distribution for more details.
- *
- * ----------------------------------------------------------------------------
- *
  */
 
 
diff --git a/drivers/net/ethernet/8390/axnet_cs.c b/drivers/net/ethernet/8390/axnet_cs.c
index 78f985885547ea..fea489af72fb0b 100644
--- a/drivers/net/ethernet/8390/axnet_cs.c
+++ b/drivers/net/ethernet/8390/axnet_cs.c
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: GPL-1.0+
+
 /*======================================================================
 
     A PCMCIA ethernet driver for Asix AX88190-based cards
@@ -17,9 +19,7 @@
 
     Written 1992,1993 by Donald Becker.
     Copyright 1993 United States Government as represented by the
-    Director, National Security Agency.  This software may be used and
-    distributed according to the terms of the GNU General Public License,
-    incorporated herein by reference.
+    Director, National Security Agency.
     Donald Becker may be reached at becker@scyld.com
 
 ======================================================================*/
diff --git a/drivers/net/ethernet/8390/hydra.c b/drivers/net/ethernet/8390/hydra.c
index 1df7601af86a40..1c3dd9a2847543 100644
--- a/drivers/net/ethernet/8390/hydra.c
+++ b/drivers/net/ethernet/8390/hydra.c
@@ -1,10 +1,8 @@
+// SPDX-License-Identifier: GPL-1.0+
+
 /* New Hydra driver using generic 8390 core */
 /* Based on old hydra driver by Topi Kanerva (topi@susanna.oulu.fi) */
 
-/* This file is subject to the terms and conditions of the GNU General      */
-/* Public License.  See the file COPYING in the main directory of the       */
-/* Linux distribution for more details.                                     */
-
 /* Peter De Schrijver (p2@mind.be) */
 /* Oldenburg 2000 */
 
diff --git a/drivers/net/ethernet/8390/lib8390.c b/drivers/net/ethernet/8390/lib8390.c
index e84021282edf30..84aeb8054304f9 100644
--- a/drivers/net/ethernet/8390/lib8390.c
+++ b/drivers/net/ethernet/8390/lib8390.c
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: GPL-1.0+
+
 /* 8390.c: A general NS8390 ethernet driver core for linux. */
 /*
 	Written 1992-94 by Donald Becker.
@@ -5,9 +7,6 @@
 	Copyright 1993 United States Government as represented by the
 	Director, National Security Agency.
 
-	This software may be used and distributed according to the terms
-	of the GNU General Public License, incorporated herein by reference.
-
 	The author may be reached as becker@scyld.com, or C/O
 	Scyld Computing Corporation
 	410 Severn Ave., Suite 210
diff --git a/drivers/net/ethernet/8390/mac8390.c b/drivers/net/ethernet/8390/mac8390.c
index 7fb819b9b89a5b..4a0a095a1a8a0a 100644
--- a/drivers/net/ethernet/8390/mac8390.c
+++ b/drivers/net/ethernet/8390/mac8390.c
@@ -1,11 +1,9 @@
+// SPDX-License-Identifier: GPL-1.0+
 /* mac8390.c: New driver for 8390-based Nubus (or Nubus-alike)
    Ethernet cards on Linux */
 /* Based on the former daynaport.c driver, by Alan Cox.  Some code
    taken from or inspired by skeleton.c by Donald Becker, acenic.c by
-   Jes Sorensen, and ne2k-pci.c by Donald Becker and Paul Gortmaker.
-
-   This software may be used and distributed according to the terms of
-   the GNU Public License, incorporated herein by reference.  */
+   Jes Sorensen, and ne2k-pci.c by Donald Becker and Paul Gortmaker. */
 
 /* 2000-02-28: support added for Dayna and Kinetics cards by
    A.G.deWijn@phys.uu.nl */
diff --git a/drivers/net/ethernet/8390/mcf8390.c b/drivers/net/ethernet/8390/mcf8390.c
index 8a7918d3341965..217838b2822025 100644
--- a/drivers/net/ethernet/8390/mcf8390.c
+++ b/drivers/net/ethernet/8390/mcf8390.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  *  Support for ColdFire CPU based boards using a NS8390 Ethernet device.
  *
@@ -5,9 +6,6 @@
  *
  *  (C) Copyright 2012,  Greg Ungerer <gerg@uclinux.org>
  *
- *  This file is subject to the terms and conditions of the GNU General Public
- *  License.  See the file COPYING in the main directory of the Linux
- *  distribution for more details.
  */
 
 #include <linux/module.h>
diff --git a/drivers/net/ethernet/8390/ne.c b/drivers/net/ethernet/8390/ne.c
index 0a9118b8be0c64..cb04a3071f92d4 100644
--- a/drivers/net/ethernet/8390/ne.c
+++ b/drivers/net/ethernet/8390/ne.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-1.0+
 /* ne.c: A general non-shared-memory NS8390 ethernet driver for linux. */
 /*
     Written 1992-94 by Donald Becker.
@@ -5,9 +6,6 @@
     Copyright 1993 United States Government as represented by the
     Director, National Security Agency.
 
-    This software may be used and distributed according to the terms
-    of the GNU General Public License, incorporated herein by reference.
-
     The author may be reached as becker@scyld.com, or C/O
     Scyld Computing Corporation, 410 Severn Ave., Suite 210, Annapolis MD 21403
 
diff --git a/drivers/net/ethernet/8390/ne2k-pci.c b/drivers/net/ethernet/8390/ne2k-pci.c
index 6a0a2039600a0a..ea3488e81c5f3c 100644
--- a/drivers/net/ethernet/8390/ne2k-pci.c
+++ b/drivers/net/ethernet/8390/ne2k-pci.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-1.0+
 /* A Linux device driver for PCI NE2000 clones.
  *
  * Authors and other copyright holders:
@@ -6,13 +7,6 @@
  * Copyright 1993 assigned to the United States Government as represented
  * by the Director, National Security Agency.
  *
- * This software may be used and distributed according to the terms of
- * the GNU General Public License (GPL), incorporated herein by reference.
- * Drivers based on or derived from this code fall under the GPL and must
- * retain the authorship, copyright and license notice.  This file is not
- * a complete program and may only be used when the entire operating
- * system is licensed under the GPL.
- *
  * The author may be reached as becker@scyld.com, or C/O
  * Scyld Computing Corporation
  * 410 Severn Ave., Suite 210
diff --git a/drivers/net/ethernet/8390/pcnet_cs.c b/drivers/net/ethernet/8390/pcnet_cs.c
index 0f07fe03da98c8..9bd5e991f1e52b 100644
--- a/drivers/net/ethernet/8390/pcnet_cs.c
+++ b/drivers/net/ethernet/8390/pcnet_cs.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-1.0+
 /*======================================================================
 
     A PCMCIA ethernet driver for NS8390-based cards
@@ -17,9 +18,7 @@
 
     Written 1992,1993 by Donald Becker.
     Copyright 1993 United States Government as represented by the
-    Director, National Security Agency.  This software may be used and
-    distributed according to the terms of the GNU General Public License,
-    incorporated herein by reference.
+    Director, National Security Agency.
     Donald Becker may be reached at becker@scyld.com
 
     Based also on Keith Moore's changes to Don Becker's code, for IBM
diff --git a/drivers/net/ethernet/8390/smc-ultra.c b/drivers/net/ethernet/8390/smc-ultra.c
index 6e62c37c940056..ae10b7de41e8f1 100644
--- a/drivers/net/ethernet/8390/smc-ultra.c
+++ b/drivers/net/ethernet/8390/smc-ultra.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-1.0+
 /* smc-ultra.c: A SMC Ultra ethernet driver for linux. */
 /*
 	This is a driver for the SMC Ultra and SMC EtherEZ ISA ethercards.
@@ -7,9 +8,6 @@
 	Copyright 1993 United States Government as represented by the
 	Director, National Security Agency.
 
-	This software may be used and distributed according to the terms
-	of the GNU General Public License, incorporated herein by reference.
-
 	The author may be reached as becker@scyld.com, or C/O
 	Scyld Computing Corporation
 	410 Severn Ave., Suite 210
diff --git a/drivers/net/ethernet/8390/stnic.c b/drivers/net/ethernet/8390/stnic.c
index bd89ca8a92dfbc..265976e3b64ab2 100644
--- a/drivers/net/ethernet/8390/stnic.c
+++ b/drivers/net/ethernet/8390/stnic.c
@@ -1,8 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /* stnic.c : A SH7750 specific part of driver for NS DP83902A ST-NIC.
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
  *
  * Copyright (C) 1999 kaz Kojima
  */
diff --git a/drivers/net/ethernet/8390/wd.c b/drivers/net/ethernet/8390/wd.c
index 5b00c452bede64..9a36667d00b65c 100644
--- a/drivers/net/ethernet/8390/wd.c
+++ b/drivers/net/ethernet/8390/wd.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-1.0+
 /* wd.c: A WD80x3 ethernet driver for linux. */
 /*
 	Written 1993-94 by Donald Becker.
@@ -5,9 +6,6 @@
 	Copyright 1993 United States Government as represented by the
 	Director, National Security Agency.
 
-	This software may be used and distributed according to the terms
-	of the GNU General Public License, incorporated herein by reference.
-
 	The author may be reached as becker@scyld.com, or C/O
 	Scyld Computing Corporation
 	410 Severn Ave., Suite 210
diff --git a/drivers/net/ethernet/8390/zorro8390.c b/drivers/net/ethernet/8390/zorro8390.c
index e8b4fe813a0828..d70390e9d03d9b 100644
--- a/drivers/net/ethernet/8390/zorro8390.c
+++ b/drivers/net/ethernet/8390/zorro8390.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  *  Amiga Linux/m68k and Linux/PPC Zorro NS8390 Ethernet Driver
  *
@@ -9,12 +10,6 @@
  *
  *  ---------------------------------------------------------------------------
  *
- *  This file is subject to the terms and conditions of the GNU General Public
- *  License.  See the file COPYING in the main directory of the Linux
- *  distribution for more details.
- *
- *  ---------------------------------------------------------------------------
- *
  *  The Ariadne II and X-Surf are Zorro-II boards containing Realtek RTL8019AS
  *  Ethernet Controllers.
  */
-- 
An old man doll... just what I always wanted! - Clara

