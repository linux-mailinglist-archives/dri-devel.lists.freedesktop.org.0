Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CD166AD78
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 20:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E1510E25D;
	Sat, 14 Jan 2023 19:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18E210E25D
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jan 2023 19:47:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB48460C08;
 Sat, 14 Jan 2023 19:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA54C433D2;
 Sat, 14 Jan 2023 19:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673725667;
 bh=gMU2qV2VgM+YENiKJhH+abvn4ddBqKL0P0RzB5p/M9M=;
 h=From:To:Cc:Subject:Date:From;
 b=J80B8qRk5QOTG8JqtnwvGlTRxhA2TlX3aGgUGykutFA28xkS1L79HoIMWUQtYDCTj
 dCd/689zlAuf5mMLONRyOIcLBGJAawuKZj0GNZM0DDyfIiv63g6cOGVUdPbGjzGOeK
 43nrrY1DnPSIiCsMQ1mdGBgd09ZbU7hmOt/yvu59q2hP3l8M/NAyQ9o/F9B/CQK0on
 fE3yWz8n685HzaXhQIOLWmaeEhVdi+exUo8YNDBbMl6cPP11Fb39GIRiU/kHrDNDvZ
 HNsfKIJOXgJf6U3sjs1605a6/2LOgx2m45e2P4jaM8tXl63pcbaHE+AD8eIJbaVA1T
 Q5DrM4P1UlMBg==
From: SeongJae Park <sj@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 1/2] Docs/subsystem-apis: Remove '[The ]Linux' prefixes from
 titles of listed documents
Date: Sat, 14 Jan 2023 19:47:40 +0000
Message-Id: <20230114194741.115855-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, linux-watchdog@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Iwona Winiarska <iwona.winiarska@intel.com>, openbmc@lists.ozlabs.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-hwmon@vger.kernel.org, SeongJae Park <sj@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some documents that listed on subsystem-apis have 'Linux' or 'The Linux'
title prefixes.  It's duplicated information, and makes finding the
document of interest with human eyes not easy.  Remove the prefixes from
the titles.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/PCI/index.rst        | 6 +++---
 Documentation/cpu-freq/index.rst   | 6 +++---
 Documentation/crypto/index.rst     | 6 +++---
 Documentation/driver-api/index.rst | 6 +++---
 Documentation/gpu/index.rst        | 6 +++---
 Documentation/hwmon/index.rst      | 6 +++---
 Documentation/input/index.rst      | 6 +++---
 Documentation/mm/index.rst         | 6 +++---
 Documentation/peci/index.rst       | 6 +++---
 Documentation/scheduler/index.rst  | 6 +++---
 Documentation/scsi/index.rst       | 6 +++---
 Documentation/sound/index.rst      | 6 +++---
 Documentation/virt/index.rst       | 6 +++---
 Documentation/watchdog/index.rst   | 6 +++---
 14 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/Documentation/PCI/index.rst b/Documentation/PCI/index.rst
index c17c87af1968..e73f84aebde3 100644
--- a/Documentation/PCI/index.rst
+++ b/Documentation/PCI/index.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-=======================
-Linux PCI Bus Subsystem
-=======================
+=================
+PCI Bus Subsystem
+=================
 
 .. toctree::
    :maxdepth: 2
diff --git a/Documentation/cpu-freq/index.rst b/Documentation/cpu-freq/index.rst
index 2fe32dad562a..de25740651f7 100644
--- a/Documentation/cpu-freq/index.rst
+++ b/Documentation/cpu-freq/index.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-==============================================================================
-Linux CPUFreq - CPU frequency and voltage scaling code in the Linux(TM) kernel
-==============================================================================
+========================================================================
+CPUFreq - CPU frequency and voltage scaling code in the Linux(TM) kernel
+========================================================================
 
 Author: Dominik Brodowski  <linux@brodo.de>
 
diff --git a/Documentation/crypto/index.rst b/Documentation/crypto/index.rst
index 21338fa92642..da5d5ad2bdf3 100644
--- a/Documentation/crypto/index.rst
+++ b/Documentation/crypto/index.rst
@@ -1,6 +1,6 @@
-=======================
-Linux Kernel Crypto API
-=======================
+==========
+Crypto API
+==========
 
 :Author: Stephan Mueller
 :Author: Marek Vasut
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index d3a58f77328e..b208e0dac3a0 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -1,6 +1,6 @@
-========================================
-The Linux driver implementer's API guide
-========================================
+==============================
+Driver implementer's API guide
+==============================
 
 The kernel offers a wide variety of interfaces to support the development
 of device drivers.  This document is an only somewhat organized collection
diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index b99dede9a5b1..eee5996acf2c 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -1,6 +1,6 @@
-==================================
-Linux GPU Driver Developer's Guide
-==================================
+============================
+GPU Driver Developer's Guide
+============================
 
 .. toctree::
 
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index fe2cc6b73634..c2b3c1a822dd 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -1,6 +1,6 @@
-=========================
-Linux Hardware Monitoring
-=========================
+===================
+Hardware Monitoring
+===================
 
 .. toctree::
    :maxdepth: 1
diff --git a/Documentation/input/index.rst b/Documentation/input/index.rst
index 9888f5cbf6d5..35581cd18e91 100644
--- a/Documentation/input/index.rst
+++ b/Documentation/input/index.rst
@@ -1,6 +1,6 @@
-=============================
-The Linux Input Documentation
-=============================
+===================
+Input Documentation
+===================
 
 Contents:
 
diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
index 4aa12b8be278..5a94a921ea40 100644
--- a/Documentation/mm/index.rst
+++ b/Documentation/mm/index.rst
@@ -1,6 +1,6 @@
-=====================================
-Linux Memory Management Documentation
-=====================================
+===============================
+Memory Management Documentation
+===============================
 
 Memory Management Guide
 =======================
diff --git a/Documentation/peci/index.rst b/Documentation/peci/index.rst
index 989de10416e7..930e75217c33 100644
--- a/Documentation/peci/index.rst
+++ b/Documentation/peci/index.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0-only
 
-====================
-Linux PECI Subsystem
-====================
+==============
+PECI Subsystem
+==============
 
 .. toctree::
 
diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index b430d856056a..1aac972a652f 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -1,6 +1,6 @@
-===============
-Linux Scheduler
-===============
+=========
+Scheduler
+=========
 
 .. toctree::
     :maxdepth: 1
diff --git a/Documentation/scsi/index.rst b/Documentation/scsi/index.rst
index 7c5f5f8f614e..919f3edfe1bf 100644
--- a/Documentation/scsi/index.rst
+++ b/Documentation/scsi/index.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-====================
-Linux SCSI Subsystem
-====================
+==============
+SCSI Subsystem
+==============
 
 .. toctree::
    :maxdepth: 1
diff --git a/Documentation/sound/index.rst b/Documentation/sound/index.rst
index 4d7d42acf6df..5abed5fc6485 100644
--- a/Documentation/sound/index.rst
+++ b/Documentation/sound/index.rst
@@ -1,6 +1,6 @@
-===================================
-Linux Sound Subsystem Documentation
-===================================
+=============================
+Sound Subsystem Documentation
+=============================
 
 .. toctree::
    :maxdepth: 2
diff --git a/Documentation/virt/index.rst b/Documentation/virt/index.rst
index 56e003ff28ff..7fb55ae08598 100644
--- a/Documentation/virt/index.rst
+++ b/Documentation/virt/index.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-============================
-Linux Virtualization Support
-============================
+======================
+Virtualization Support
+======================
 
 .. toctree::
    :maxdepth: 2
diff --git a/Documentation/watchdog/index.rst b/Documentation/watchdog/index.rst
index c177645081d8..4603f2511f58 100644
--- a/Documentation/watchdog/index.rst
+++ b/Documentation/watchdog/index.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-======================
-Linux Watchdog Support
-======================
+================
+Watchdog Support
+================
 
 .. toctree::
     :maxdepth: 1
-- 
2.25.1

