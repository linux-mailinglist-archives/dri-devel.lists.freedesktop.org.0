Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA85D13E9C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 17:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF93510E414;
	Mon, 12 Jan 2026 16:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Cfju3nAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B9910E06D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 09:17:09 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id
 4fb4d7f45d1cf-64daeb28c56so10044690a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 01:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768209428; x=1768814228; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zd0BPdweYbYZbQyn2qW1okTKg1KegiW0299KXASGYXY=;
 b=Cfju3nAFTNwIngM7purt4IOAMAEuKmJLMjEILER7kDN5DqovI3TcT6uaZLrJdB09Sp
 Q4ut9+/ReQkkRQt4tzGi25D6o6ZgOwKVDQrrbBLjAQR+BnMB892pnjhyP9NvtYe4XiAY
 dD/6rECV8mBeER4LSVomM+E+CZQNi2YZA5uKoKoHfSW4JyzrwNCIcde6R0TRvekZeIPi
 D8K8WO1gccK0KfNO2ZBs1U6c+QNm0wx2asyenaxs759Jly45E3i9Bkhyaz+VzEHi718X
 OFdDv0DO0eErLWAYlhpA9D10y2epgvgyZ5yqdUc6IzdawbbNliHKtcRNsiJpvNuhAoBY
 Pdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768209428; x=1768814228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zd0BPdweYbYZbQyn2qW1okTKg1KegiW0299KXASGYXY=;
 b=pdwiVPGGmatL9hGxVxeYOFTeHt/RBqNq5J98HgO4hZ0/xkCUAoyLU/qabdtF+NTMxn
 MPe9tSQkAoXrwOGVYChVO/e+akjSLYvKM9/Ymf6OtPVI6awTmUZXXxtSXhh8TJDSvhRg
 B2aVDV3st3C/cac0LcsJLFI0jinzHBrj7qkvGS7sHQGrqf+GEzh7HzJqHFL89dFPxqj6
 j24IMXvceKq5zZynxZIoTO2YSQyscCjZzw2GbwnlCEzYPHxoApkvwaZZt+wxw2T3tMfd
 IhLj5X8SNI/Qf91eeRfbSAUl4e9smGWC/SjOo2vS6/uMi9QEwLRMFuf5s3LpG/AryIEo
 ZsvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI+27arXwFQHDmQu5hG7tkFsmuawAufnqp8Xe5Iea2rTTfsEXh81VezSsp9aX0PH+UEo+9vMNn6lk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvpqGUeTYrTaFoqzFvMc3VQlZK+jR6s8nakPeUjGsvDikyPPpb
 BRF/6+XzitXcWaM5HvlurSfLxcvWYg0RIh4xPy0mGx5wibKTamYOjJVa
X-Gm-Gg: AY/fxX6HwrYMnTm03ynqlg600/GvtqBdOH5F/IMm2mCqcAvjM4f02VB1Pwg52Ef1X1G
 WKKkohUO2q4QqVu8dG8NZpw4s5zSuE8pvssbTYCNl2auMEIE9l2AHSiXTC77i4r0uxKwmpE6vQ/
 IH3tT3ZS0wIO4kK1OR+vKLF2e8bYCSvSt2Uoq5zTvr3jQFG87Djv6ivuQ1E207Qthc6K1WfdE6+
 W8s8V+NblEVFppu3RL/ik3z2vS1wGC9NArrBimX5G8yuM3Nn9mKtG52XKAfpavaurjDvPdYqM3I
 3gLTvGPdUN9ilXDqIc1I2TF/Xzj2qPXko2xYs3H4cnqeu0H4DsAfCkGqNc5PH8F2ACbOLWEl5aO
 MbzP+K0ByIWljIvAYoO2mefY7AKEtksssizKOfQTlp5OaGtmCcJmBea9Z1NJX3HWmagSnBET6BH
 3E8KWbqXMD8cKPHY7q0V7WbPDxyO+ugLlVKj7JEQVuNi4=
X-Google-Smtp-Source: AGHT+IEVkFHwWdARDiOC3T5oubH1b0HSoQYmd/NAnJNXQ0ysw0Xt1Fgn+FqRVmFL8guwSSYOYkTxEQ==
X-Received: by 2002:a17:907:7202:b0:b87:efa:8786 with SMTP id
 a640c23a62f3a-b870efae612mr369083166b.55.1768209427070; 
 Mon, 12 Jan 2026 01:17:07 -0800 (PST)
Received: from MacBookPro ([2a02:8071:2186:3703:6de9:eb98:99c8:7af2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b870b0dba4esm411401466b.17.2026.01.12.01.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 01:17:06 -0800 (PST)
From: Nauman Sabir <officialnaumansabir@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Nauman Sabir <officialnaumansabir@gmail.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Gao Xiang <xiang@kernel.org>,
 Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>,
 Chunhai Guo <guochunhai@vivo.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao shi <jitao.shi@mediatek.com>, linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
 workflows@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] Documentation: Fix typos and grammatical errors
Date: Mon, 12 Jan 2026 10:16:56 +0100
Message-ID: <20260112091659.12316-1-officialnaumansabir@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 12 Jan 2026 16:13:39 +0000
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

Fix various typos and grammatical errors across multiple documentation
files to improve clarity and consistency.

Changes include:
- Fix missing preposition 'in' in process/changes.rst
- Correct 'result by' to 'result from' in admin-guide/README.rst
- Fix 'before hand' to 'beforehand' (3 instances) in cgroup-v1/hugetlb.rst
- Correct 'allows to limit' to 'allows limiting' in cgroup-v1/hugetlb.rst,
  cgroup-v2.rst, and kconfig-language.rst
- Fix 'needs precisely know' to 'needs to precisely know' in
  cgroup-v1/hugetlb.rst
- Correct 'overcommited' to 'overcommitted' in cgroup-v1/hugetlb.rst
- Fix subject-verb agreement: 'never causes' to 'never cause' (2 instances)
  in cgroup-v1/hugetlb.rst
- Fix subject-verb agreement: 'there is enough' to 'there are enough' in
  cgroup-v1/hugetlb.rst
- Remove incorrect plural from uncountable nouns: 'metadatas' to 'metadata'
  in filesystems/erofs.rst, and 'hardwares' to 'hardware' in
  devicetree/bindings/.../mediatek,dp.yaml, userspace-api/.../legacy_dvb_audio.rst,
  and scsi/ChangeLog.sym53c8xx

Note: British spelling 'recognised' retained per maintainer feedback.

These corrections improve the overall quality and readability of the
kernel documentation.

Signed-off-by: Nauman Sabir <officialnaumansabir@gmail.com>
---
 Documentation/admin-guide/README.rst           |  2 +-
 .../admin-guide/cgroup-v1/hugetlb.rst          | 18 +++++++++---------
 Documentation/admin-guide/cgroup-v2.rst        |  2 +-
 .../bindings/display/mediatek/mediatek,dp.yaml |  2 +-
 Documentation/filesystems/erofs.rst            |  2 +-
 Documentation/kbuild/kconfig-language.rst      |  2 +-
 Documentation/process/changes.rst              |  2 +-
 Documentation/scsi/ChangeLog.sym53c8xx         |  2 +-
 .../media/dvb/legacy_dvb_audio.rst             |  2 +-
 9 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index 05301f03b..77fec1de6 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -53,7 +53,7 @@ Documentation
    these typically contain kernel-specific installation notes for some
    drivers for example. Please read the
    :ref:`Documentation/process/changes.rst <changes>` file, as it
-   contains information about the problems, which may result by upgrading
+   contains information about the problems which may result from upgrading
    your kernel.
 
 Installing the kernel source
diff --git a/Documentation/admin-guide/cgroup-v1/hugetlb.rst b/Documentation/admin-guide/cgroup-v1/hugetlb.rst
index 493a8e386..b5f3873b7 100644
--- a/Documentation/admin-guide/cgroup-v1/hugetlb.rst
+++ b/Documentation/admin-guide/cgroup-v1/hugetlb.rst
@@ -77,7 +77,7 @@ control group and enforces the limit during page fault. Since HugeTLB
 doesn't support page reclaim, enforcing the limit at page fault time implies
 that, the application will get SIGBUS signal if it tries to fault in HugeTLB
 pages beyond its limit. Therefore the application needs to know exactly how many
-HugeTLB pages it uses before hand, and the sysadmin needs to make sure that
+HugeTLB pages it uses beforehand, and the sysadmin needs to make sure that
 there are enough available on the machine for all the users to avoid processes
 getting SIGBUS.
 
@@ -91,23 +91,23 @@ getting SIGBUS.
   hugetlb.<hugepagesize>.rsvd.usage_in_bytes
   hugetlb.<hugepagesize>.rsvd.failcnt
 
-The HugeTLB controller allows to limit the HugeTLB reservations per control
+The HugeTLB controller allows limiting the HugeTLB reservations per control
 group and enforces the controller limit at reservation time and at the fault of
 HugeTLB memory for which no reservation exists. Since reservation limits are
-enforced at reservation time (on mmap or shget), reservation limits never causes
-the application to get SIGBUS signal if the memory was reserved before hand. For
+enforced at reservation time (on mmap or shget), reservation limits never cause
+the application to get SIGBUS signal if the memory was reserved beforehand. For
 MAP_NORESERVE allocations, the reservation limit behaves the same as the fault
 limit, enforcing memory usage at fault time and causing the application to
 receive a SIGBUS if it's crossing its limit.
 
 Reservation limits are superior to page fault limits described above, since
 reservation limits are enforced at reservation time (on mmap or shget), and
-never causes the application to get SIGBUS signal if the memory was reserved
-before hand. This allows for easier fallback to alternatives such as
+never cause the application to get SIGBUS signal if the memory was reserved
+beforehand. This allows for easier fallback to alternatives such as
 non-HugeTLB memory for example. In the case of page fault accounting, it's very
-hard to avoid processes getting SIGBUS since the sysadmin needs precisely know
-the HugeTLB usage of all the tasks in the system and make sure there is enough
-pages to satisfy all requests. Avoiding tasks getting SIGBUS on overcommited
+hard to avoid processes getting SIGBUS since the sysadmin needs to precisely know
+the HugeTLB usage of all the tasks in the system and make sure there are enough
+pages to satisfy all requests. Avoiding tasks getting SIGBUS on overcommitted
 systems is practically impossible with page fault accounting.
 
 
diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 7f5b59d95..098d6831b 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2816,7 +2816,7 @@ DMEM Interface Files
 HugeTLB
 -------
 
-The HugeTLB controller allows to limit the HugeTLB usage per control group and
+The HugeTLB controller allows limiting the HugeTLB usage per control group and
 enforces the controller limit during page fault.
 
 HugeTLB Interface Files
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 274f59080..8f4bd9fb5 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Jitao shi <jitao.shi@mediatek.com>
 
 description: |
-  MediaTek DP and eDP are different hardwares and there are some features
+  MediaTek DP and eDP are different hardware and there are some features
   which are not supported for eDP. For example, audio is not supported for
   eDP. Therefore, we need to use two different compatibles to describe them.
   In addition, We just need to enable the power domain of DP, so the clock
diff --git a/Documentation/filesystems/erofs.rst b/Documentation/filesystems/erofs.rst
index 08194f194..e61db115e 100644
--- a/Documentation/filesystems/erofs.rst
+++ b/Documentation/filesystems/erofs.rst
@@ -154,7 +154,7 @@ to be as simple as possible::
   0 +1K
 
 All data areas should be aligned with the block size, but metadata areas
-may not. All metadatas can be now observed in two different spaces (views):
+may not. All metadata can be now observed in two different spaces (views):
 
  1. Inode metadata space
 
diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index abce88f15..7067ec3f0 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -216,7 +216,7 @@ applicable everywhere (see syntax).
 
 - numerical ranges: "range" <symbol> <symbol> ["if" <expr>]
 
-  This allows to limit the range of possible input values for int
+  This allows limiting the range of possible input values for int
   and hex symbols. The user can only input a value which is larger than
   or equal to the first symbol and smaller than or equal to the second
   symbol.
diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 62951cdb1..0cf97dbab 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -218,7 +218,7 @@ DevFS has been obsoleted in favour of udev
 Linux documentation for functions is transitioning to inline
 documentation via specially-formatted comments near their
 definitions in the source.  These comments can be combined with ReST
-files the Documentation/ directory to make enriched documentation, which can
+files in the Documentation/ directory to make enriched documentation, which can
 then be converted to PostScript, HTML, LaTex, ePUB and PDF files.
 In order to convert from ReST format to a format of your choice, you'll need
 Sphinx.
diff --git a/Documentation/scsi/ChangeLog.sym53c8xx b/Documentation/scsi/ChangeLog.sym53c8xx
index 3435227a2..6bca91e03 100644
--- a/Documentation/scsi/ChangeLog.sym53c8xx
+++ b/Documentation/scsi/ChangeLog.sym53c8xx
@@ -3,7 +3,7 @@ Sat May 12 12:00 2001 Gerard Roudier (groudier@club-internet.fr)
 	- Ensure LEDC bit in GPCNTL is cleared when reading the NVRAM.
 	  Fix sent by Stig Telfer <stig@api-networks.com>.
 	- Backport from SYM-2 the work-around that allows to support 
-	  hardwares that fail PCI parity checking.
+	  hardware that fails PCI parity checking.
 	- Check that we received at least 8 bytes of INQUIRY response 
 	  for byte 7, that contains device capabilities, to be valid.
 	- Define scsi_set_pci_device() as nil for kernel < 2.4.4.
diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
index 81b762ef1..99ffda355 100644
--- a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
@@ -444,7 +444,7 @@ Description
 ~~~~~~~~~~~
 
 A call to `AUDIO_GET_CAPABILITIES`_ returns an unsigned integer with the
-following bits set according to the hardwares capabilities.
+following bits set according to the hardware's capabilities.
 
 
 -----
-- 
2.52.0

