Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODO5CGoYgmmZPAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:46:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CFCDB7B9
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E1910E6E8;
	Tue,  3 Feb 2026 15:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kYEpmhUg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com
 [74.125.82.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13ADC10E6DF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 15:46:46 +0000 (UTC)
Received: by mail-dy1-f201.google.com with SMTP id
 5a478bee46e88-2b7a28264c1so9165599eec.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 07:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770133605; x=1770738405;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=5nsWBVPQvmR7GWncR53fb87wMVZ+bXZsmZ3b67gn7JA=;
 b=kYEpmhUgmIm77Laf6ktIQqqZ+8wxdeCU1OwBorIRXKrxXkHKmFCN0DoPjrNPX6mJgr
 vgbYF725Gf+5BTTXXwGG1dFcThq8XJQDJxKaSF5VDNJAl+EjbIUmy7OZwnbm3omuOwMm
 UV4sPKPrx4Dqi1+cSEBCXPW2Pood+SV0sw1Wu4i90kDyQtVguB3VPUjZCrXbbNMW+p7a
 Hm5+fvEQc8JYLjgg27umfuPHevqgTSglbyKvu/FGslV3Z1IMIQ0uYChcV4ZWOApgR5LL
 s9VgHHTZ8Ytgz0kd74So0h1z8yn4+gApy0zlA9aaMn2A1OiSoKK3FxT0Wjz3ulHQ3qBo
 Ed7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770133605; x=1770738405;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5nsWBVPQvmR7GWncR53fb87wMVZ+bXZsmZ3b67gn7JA=;
 b=oq7ZxcNVkVYEIew6vH7MN88/eAOBlgzK1xq199/4E4wkD0D2TK6q4rsNgMBILXBUYg
 caZdHco9Fzcn2QmpCJhZKRslbxDHMPtyVO9Duqj6VolPQbFiSmjtocTI+83f4JbL15xC
 O34YjRNfVPB87yDxEcM/Er8Wjs9jxB9tzM6KpSIymQoVBTl9415eU+Kzbjdu8NT5zdp1
 ScIeIVyphtShwZHdfaiMScTgpZdQSenI8/pzu9QGNv8osmgUIuL6OGOtBCsmhgMbMF/b
 u1DjMgG9bh8Hgr7C8fT3UiHGcRDNQpZOjVt0Y+YCcZ7Til0idW4fTCyQRgp4cRn1nPHB
 rTlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2YtKSIto45mUis0llwehskrCHDGdrllWBQPx6swBD1UTZArP7eGP9z5z1sQx9+r1TFIclP2pLUik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9bZAV7XxxHJUxDr8F5S0hV5+AL87il0xKQ+DOLflqonspMFxT
 WJzS9XL2FXI+M3Kvnpg4wPsaUCFdDAtkDfIuB23rhnU1zZBB9Og5kojrs6AB5dqiE+Fgz8pBZQy
 qXziOzpoGag==
X-Received: from dycnm10.prod.google.com
 ([2002:a05:7300:d18a:b0:2b8:1ff8:292f])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:ed0d:b0:2ae:55f0:f2be
 with SMTP id 5a478bee46e88-2b7c88eaa7amr8617987eec.31.1770133605342; Tue, 03
 Feb 2026 07:46:45 -0800 (PST)
Date: Tue, 03 Feb 2026 15:46:35 +0000
In-Reply-To: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
Mime-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519;
 pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770133593; l=65293;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=tpkxutsskHxPVxS/OMjEWZr4mFHsomHylGbKna6UNf8=;
 b=/qIdKOrWZl0pksxB94j31YjJA+qeONPlUeCbwUZqaRutMf3EcIbmC1jjdq2uByBH2zi88NnNe
 e3tuWwiXDdUDtw4V0Bl2mwj6Qe75CYORC+RxJ9547LyNVjpAjAuGrE/
X-Mailer: b4 0.14.2
Message-ID: <20260203-qcom-socinfo-v2-6-d6719db85637@google.com>
Subject: [PATCH v2 6/6] soc: qcom: socinfo: Convert to Rust
From: Matthew Maurer <mmaurer@google.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Satya Durga Srinivasu Prabhala <satyap@quicinc.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Dave Ertman <david.m.ertman@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>
Cc: Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-pwm@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:satyap@quicinc.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:m.wilczynski@samsung.com,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:tsoni@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-pwm@vger.kernel.org,m:mmaurer@google.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mmaurer@google.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_TO(0.00)[kernel.org,quicinc.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,linuxfoundation.org,ffwll.ch,samsung.com,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mmaurer@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,soc.id:url,soc_info.id:url]
X-Rspamd-Queue-Id: 57CFCDB7B9
X-Rspamd-Action: no action

Convert the socinfo driver to Rust for a number of improvements:
* Accessing IO mapped regions through the IO subsystem, rather than
  through regular memory accesses.
* Binds the device as an auxiliary device rather than a platform device,
  ensuring the mapped IO regions cannot be accessed after the smem
  device is removed.
* Adds bounds-checking to all accesses, hardening against a repeat of
  CVE-2024-58007

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 drivers/soc/qcom/Kconfig             |   1 +
 drivers/soc/qcom/Makefile            |   2 +-
 drivers/soc/qcom/smem.c              |  42 +-
 drivers/soc/qcom/socinfo.c           | 931 -----------------------------------
 drivers/soc/qcom/socinfo/Makefile    |   2 +
 drivers/soc/qcom/socinfo/bindings.rs | 123 +++++
 drivers/soc/qcom/socinfo/data.rs     | 438 ++++++++++++++++
 drivers/soc/qcom/socinfo/socinfo.rs  | 446 +++++++++++++++++
 include/linux/soc/qcom/smem.h        |   4 +
 rust/bindgen_parameters              |   1 +
 rust/bindings/bindings_helper.h      |   6 +
 11 files changed, 1056 insertions(+), 940 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2caadbbcf8307ff94f5afbdd1481e5e5e291749f..16d553f66f0cf1101d3a8c7d401d7c4d6a65dac7 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -222,6 +222,7 @@ config QCOM_SMSM
 config QCOM_SOCINFO
 	tristate "Qualcomm socinfo driver"
 	depends on QCOM_SMEM
+	depends on RUST
 	select SOC_BUS
 	help
 	 Say yes here to support the Qualcomm socinfo driver, providing
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index b7f1d2a5736748b8772c090fd24462fa91f321c6..6f6688c76a00a91ce99600f298a8e6e0fefed806 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -28,7 +28,7 @@ obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
 CFLAGS_smp2p.o := -I$(src)
 obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
 obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
-obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
+obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo/
 obj-$(CONFIG_QCOM_SPM)		+= spm.o
 obj-$(CONFIG_QCOM_STATS)	+= qcom_stats.o
 obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index fef840b5457407a85051ded0e835430dbebfe8bb..dcea2d7f37067b0b6f801b3d2b457422ad9f342c 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/hwspinlock.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -279,7 +280,6 @@ struct qcom_smem {
 	struct hwspinlock *hwlock;
 
 	u32 item_count;
-	struct platform_device *socinfo;
 	struct smem_ptable *ptable;
 	struct smem_partition global_partition;
 	struct smem_partition partitions[SMEM_HOST_COUNT];
@@ -675,6 +675,32 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
 	return ERR_PTR(-EINVAL);
 }
 
+/**
+ * qcom_smem_get_aux() - resolve ptr of size of a smem item
+ * @aux:        an aux device that should be our child
+ * @host:	the remote processor, or -1
+ * @item:	smem item handle
+ * @size:	pointer to be filled out with size of the item
+ *
+ * Looks up smem item and returns pointer to it. Size of smem
+ * item is returned in @size.
+ *
+ * The caller may take the loaded state of the provided aux device as
+ * an acceptable proxy for this memory being valid.
+ *
+ * Return: a pointer to an SMEM item on success, ERR_PTR() on failure.
+ */
+void *qcom_smem_get_aux(struct auxiliary_device *aux, unsigned int host,
+		unsigned int item, size_t *size)
+{
+	if (IS_ERR(__smem))
+		return __smem;
+	if (aux->dev.parent != __smem->dev)
+		return ERR_PTR(-EINVAL);
+	return qcom_smem_get(host, item, size);
+}
+EXPORT_SYMBOL_GPL(qcom_smem_get_aux);
+
 /**
  * qcom_smem_get() - resolve ptr of size of a smem item
  * @host:	the remote processor, or -1
@@ -684,6 +710,9 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
  * Looks up smem item and returns pointer to it. Size of smem
  * item is returned in @size.
  *
+ * It is up to the caller to ensure that the qcom_smem device remains
+ * loaded by some mechanism when accessing returned memory.
+ *
  * Return: a pointer to an SMEM item on success, ERR_PTR() on failure.
  */
 void *qcom_smem_get(unsigned host, unsigned item, size_t *size)
@@ -1127,6 +1156,7 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	struct smem_header *header;
 	struct reserved_mem *rmem;
 	struct qcom_smem *smem;
+	struct auxiliary_device *socinfo;
 	unsigned long flags;
 	int num_regions;
 	int hwlock_id;
@@ -1234,19 +1264,15 @@ static int qcom_smem_probe(struct platform_device *pdev)
 
 	__smem = smem;
 
-	smem->socinfo = platform_device_register_data(&pdev->dev, "qcom-socinfo",
-						      PLATFORM_DEVID_NONE, NULL,
-						      0);
-	if (IS_ERR(smem->socinfo))
-		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
+	socinfo = devm_auxiliary_device_create(&pdev->dev, "qcom-socinfo", NULL);
+	if (IS_ERR(socinfo))
+		dev_dbg(&pdev->dev, "failed to create socinfo device\n");
 
 	return 0;
 }
 
 static void qcom_smem_remove(struct platform_device *pdev)
 {
-	platform_device_unregister(__smem->socinfo);
-
 	__smem = NULL;
 }
 
diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
deleted file mode 100644
index 003a2304d535c2655db566c644342dbc387e24a9..0000000000000000000000000000000000000000
--- a/drivers/soc/qcom/socinfo.c
+++ /dev/null
@@ -1,931 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (c) 2009-2017, The Linux Foundation. All rights reserved.
- * Copyright (c) 2017-2019, Linaro Ltd.
- */
-
-#include <linux/debugfs.h>
-#include <linux/err.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/random.h>
-#include <linux/slab.h>
-#include <linux/soc/qcom/smem.h>
-#include <linux/soc/qcom/socinfo.h>
-#include <linux/string.h>
-#include <linux/stringify.h>
-#include <linux/sys_soc.h>
-#include <linux/types.h>
-
-#include <linux/unaligned.h>
-
-#include <dt-bindings/arm/qcom,ids.h>
-
-/* Helper macros to create soc_id table */
-#define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
-#define qcom_board_id_named(id, name) QCOM_ID_ ## id, (name)
-
-#ifdef CONFIG_DEBUG_FS
-#define SMEM_IMAGE_VERSION_BLOCKS_COUNT        32
-#define SMEM_IMAGE_VERSION_SIZE                4096
-#define SMEM_IMAGE_VERSION_NAME_SIZE           75
-#define SMEM_IMAGE_VERSION_VARIANT_SIZE        20
-#define SMEM_IMAGE_VERSION_OEM_SIZE            32
-
-/*
- * SMEM Image table indices
- */
-#define SMEM_IMAGE_TABLE_BOOT_INDEX     0
-#define SMEM_IMAGE_TABLE_TZ_INDEX       1
-#define SMEM_IMAGE_TABLE_TZSECAPP_INDEX	2
-#define SMEM_IMAGE_TABLE_RPM_INDEX      3
-#define SMEM_IMAGE_TABLE_SDI_INDEX      4
-#define SMEM_IMAGE_TABLE_HYP_INDEX      5
-#define SMEM_IMAGE_TABLE_ADSP1_INDEX	6
-#define SMEM_IMAGE_TABLE_ADSP2_INDEX	7
-#define SMEM_IMAGE_TABLE_CDSP2_INDEX	8
-#define SMEM_IMAGE_TABLE_APPSBL_INDEX	9
-#define SMEM_IMAGE_TABLE_APPS_INDEX     10
-#define SMEM_IMAGE_TABLE_MPSS_INDEX     11
-#define SMEM_IMAGE_TABLE_ADSP_INDEX     12
-#define SMEM_IMAGE_TABLE_CNSS_INDEX     13
-#define SMEM_IMAGE_TABLE_VIDEO_INDEX    14
-#define SMEM_IMAGE_TABLE_DSPS_INDEX     15
-#define SMEM_IMAGE_TABLE_CDSP_INDEX     16
-#define SMEM_IMAGE_TABLE_NPU_INDEX	17
-#define SMEM_IMAGE_TABLE_WPSS_INDEX     18
-#define SMEM_IMAGE_TABLE_CDSP1_INDEX    19
-#define SMEM_IMAGE_TABLE_GPDSP_INDEX    20
-#define SMEM_IMAGE_TABLE_GPDSP1_INDEX   21
-#define SMEM_IMAGE_TABLE_SENSORPD_INDEX	22
-#define SMEM_IMAGE_TABLE_AUDIOPD_INDEX	23
-#define SMEM_IMAGE_TABLE_OEMPD_INDEX	24
-#define SMEM_IMAGE_TABLE_CHARGERPD_INDEX	25
-#define SMEM_IMAGE_TABLE_OISPD_INDEX	26
-#define SMEM_IMAGE_TABLE_SOCCP_INDEX	27
-#define SMEM_IMAGE_TABLE_TME_INDEX	28
-#define SMEM_IMAGE_TABLE_GEARVM_INDEX	29
-#define SMEM_IMAGE_TABLE_UEFI_INDEX	30
-#define SMEM_IMAGE_TABLE_CDSP3_INDEX	31
-#define SMEM_IMAGE_TABLE_AUDIOPD_ADSP1_INDEX	32
-#define SMEM_IMAGE_TABLE_AUDIOPD_ADSP2_INDEX	33
-#define SMEM_IMAGE_TABLE_DCP_INDEX	34
-#define SMEM_IMAGE_TABLE_OOBS_INDEX	35
-#define SMEM_IMAGE_TABLE_OOBNS_INDEX	36
-#define SMEM_IMAGE_TABLE_DEVCFG_INDEX	37
-#define SMEM_IMAGE_TABLE_BTPD_INDEX	38
-#define SMEM_IMAGE_TABLE_QECP_INDEX	39
-
-#define SMEM_IMAGE_VERSION_TABLE       469
-#define SMEM_IMAGE_VERSION_TABLE_2	667
-
-/*
- * SMEM Image table names
- */
-static const char *const socinfo_image_names[] = {
-	[SMEM_IMAGE_TABLE_ADSP1_INDEX] = "adsp1",
-	[SMEM_IMAGE_TABLE_ADSP2_INDEX] = "adsp2",
-	[SMEM_IMAGE_TABLE_ADSP_INDEX] = "adsp",
-	[SMEM_IMAGE_TABLE_APPSBL_INDEX] = "appsbl",
-	[SMEM_IMAGE_TABLE_APPS_INDEX] = "apps",
-	[SMEM_IMAGE_TABLE_AUDIOPD_INDEX] = "audiopd",
-	[SMEM_IMAGE_TABLE_AUDIOPD_ADSP1_INDEX] = "audiopd_adsp1",
-	[SMEM_IMAGE_TABLE_AUDIOPD_ADSP2_INDEX] = "audiopd_adsp2",
-	[SMEM_IMAGE_TABLE_BOOT_INDEX] = "boot",
-	[SMEM_IMAGE_TABLE_BTPD_INDEX] = "btpd",
-	[SMEM_IMAGE_TABLE_CDSP1_INDEX] = "cdsp1",
-	[SMEM_IMAGE_TABLE_CDSP2_INDEX] = "cdsp2",
-	[SMEM_IMAGE_TABLE_CDSP3_INDEX] = "cdsp3",
-	[SMEM_IMAGE_TABLE_CDSP_INDEX] = "cdsp",
-	[SMEM_IMAGE_TABLE_CHARGERPD_INDEX] = "chargerpd",
-	[SMEM_IMAGE_TABLE_CNSS_INDEX] = "cnss",
-	[SMEM_IMAGE_TABLE_DCP_INDEX] = "dcp",
-	[SMEM_IMAGE_TABLE_DEVCFG_INDEX] = "devcfg",
-	[SMEM_IMAGE_TABLE_DSPS_INDEX] = "dsps",
-	[SMEM_IMAGE_TABLE_GEARVM_INDEX] = "gearvm",
-	[SMEM_IMAGE_TABLE_GPDSP1_INDEX] = "gpdsp1",
-	[SMEM_IMAGE_TABLE_GPDSP_INDEX] = "gpdsp",
-	[SMEM_IMAGE_TABLE_HYP_INDEX] = "hyp",
-	[SMEM_IMAGE_TABLE_MPSS_INDEX] = "mpss",
-	[SMEM_IMAGE_TABLE_NPU_INDEX] = "npu",
-	[SMEM_IMAGE_TABLE_OEMPD_INDEX] = "oempd",
-	[SMEM_IMAGE_TABLE_OISPD_INDEX] = "oispd",
-	[SMEM_IMAGE_TABLE_OOBNS_INDEX] = "oobns",
-	[SMEM_IMAGE_TABLE_OOBS_INDEX] = "oobs",
-	[SMEM_IMAGE_TABLE_QECP_INDEX] = "qecp",
-	[SMEM_IMAGE_TABLE_RPM_INDEX] = "rpm",
-	[SMEM_IMAGE_TABLE_SDI_INDEX] = "sdi",
-	[SMEM_IMAGE_TABLE_SENSORPD_INDEX] = "sensorpd",
-	[SMEM_IMAGE_TABLE_SOCCP_INDEX] = "soccp",
-	[SMEM_IMAGE_TABLE_TME_INDEX] = "tme",
-	[SMEM_IMAGE_TABLE_TZ_INDEX] = "tz",
-	[SMEM_IMAGE_TABLE_TZSECAPP_INDEX] = "tzsecapp",
-	[SMEM_IMAGE_TABLE_UEFI_INDEX] = "uefi",
-	[SMEM_IMAGE_TABLE_VIDEO_INDEX] = "video",
-	[SMEM_IMAGE_TABLE_WPSS_INDEX] = "wpss",
-};
-
-static const char *const pmic_models[] = {
-	[0]  = "Unknown PMIC model",
-	[1]  = "PM8941",
-	[2]  = "PM8841",
-	[3]  = "PM8019",
-	[4]  = "PM8226",
-	[5]  = "PM8110",
-	[6]  = "PMA8084",
-	[7]  = "PMI8962",
-	[8]  = "PMD9635",
-	[9]  = "PM8994",
-	[10] = "PMI8994",
-	[11] = "PM8916",
-	[12] = "PM8004",
-	[13] = "PM8909/PM8058",
-	[14] = "PM8028",
-	[15] = "PM8901",
-	[16] = "PM8950/PM8027",
-	[17] = "PMI8950/ISL9519",
-	[18] = "PMK8001/PM8921",
-	[19] = "PMI8996/PM8018",
-	[20] = "PM8998/PM8015",
-	[21] = "PMI8998/PM8014",
-	[22] = "PM8821",
-	[23] = "PM8038",
-	[24] = "PM8005/PM8922",
-	[25] = "PM8917/PM8937",
-	[26] = "PM660L",
-	[27] = "PM660",
-	[30] = "PM8150",
-	[31] = "PM8150L",
-	[32] = "PM8150B",
-	[33] = "PMK8002",
-	[36] = "PM8009",
-	[37] = "PMI632",
-	[38] = "PM8150C",
-	[40] = "PM6150",
-	[41] = "SMB2351",
-	[44] = "PM8008",
-	[45] = "PM6125",
-	[46] = "PM7250B",
-	[47] = "PMK8350",
-	[48] = "PM8350",
-	[49] = "PM8350C",
-	[50] = "PM8350B",
-	[51] = "PMR735A",
-	[52] = "PMR735B",
-	[54] = "PM6350",
-	[55] = "PM4125",
-	[58] = "PM8450",
-	[65] = "PM8010",
-	[69] = "PM8550VS",
-	[70] = "PM8550VE",
-	[71] = "PM8550B",
-	[72] = "PMR735D",
-	[73] = "PM8550",
-	[74] = "PMK8550",
-	[78] = "PMM8650AU",
-	[79] = "PMM8650AU_PSAIL",
-	[80] = "PM7550",
-	[82] = "PMC8380",
-	[83] = "SMB2360",
-	[91] = "PMIV0108",
-};
-
-struct socinfo_params {
-	u32 raw_device_family;
-	u32 hw_plat_subtype;
-	u32 accessory_chip;
-	u32 raw_device_num;
-	u32 chip_family;
-	u32 foundry_id;
-	u32 plat_ver;
-	u32 raw_ver;
-	u32 hw_plat;
-	u32 fmt;
-	u32 nproduct_id;
-	u32 num_clusters;
-	u32 ncluster_array_offset;
-	u32 num_subset_parts;
-	u32 nsubset_parts_array_offset;
-	u32 nmodem_supported;
-	u32 feature_code;
-	u32 pcode;
-	u32 oem_variant;
-	u32 num_func_clusters;
-	u32 boot_cluster;
-	u32 boot_core;
-	u32 raw_package_type;
-};
-
-struct smem_image_version {
-	char name[SMEM_IMAGE_VERSION_NAME_SIZE];
-	char variant[SMEM_IMAGE_VERSION_VARIANT_SIZE];
-	char pad;
-	char oem[SMEM_IMAGE_VERSION_OEM_SIZE];
-};
-#endif /* CONFIG_DEBUG_FS */
-
-struct qcom_socinfo {
-	struct soc_device *soc_dev;
-	struct soc_device_attribute attr;
-#ifdef CONFIG_DEBUG_FS
-	struct dentry *dbg_root;
-	struct socinfo_params info;
-#endif /* CONFIG_DEBUG_FS */
-};
-
-struct soc_id {
-	unsigned int id;
-	const char *name;
-};
-
-static const struct soc_id soc_id[] = {
-	{ qcom_board_id(MSM8260) },
-	{ qcom_board_id(MSM8660) },
-	{ qcom_board_id(APQ8060) },
-	{ qcom_board_id(MSM8960) },
-	{ qcom_board_id(APQ8064) },
-	{ qcom_board_id(MSM8930) },
-	{ qcom_board_id(MSM8630) },
-	{ qcom_board_id(MSM8230) },
-	{ qcom_board_id(APQ8030) },
-	{ qcom_board_id(MSM8627) },
-	{ qcom_board_id(MSM8227) },
-	{ qcom_board_id(MSM8660A) },
-	{ qcom_board_id(MSM8260A) },
-	{ qcom_board_id(APQ8060A) },
-	{ qcom_board_id(MSM8974) },
-	{ qcom_board_id(MSM8225) },
-	{ qcom_board_id(MSM8625) },
-	{ qcom_board_id(MPQ8064) },
-	{ qcom_board_id(MSM8960AB) },
-	{ qcom_board_id(APQ8060AB) },
-	{ qcom_board_id(MSM8260AB) },
-	{ qcom_board_id(MSM8660AB) },
-	{ qcom_board_id(MSM8930AA) },
-	{ qcom_board_id(MSM8630AA) },
-	{ qcom_board_id(MSM8230AA) },
-	{ qcom_board_id(MSM8626) },
-	{ qcom_board_id(MSM8610) },
-	{ qcom_board_id(APQ8064AB) },
-	{ qcom_board_id(MSM8930AB) },
-	{ qcom_board_id(MSM8630AB) },
-	{ qcom_board_id(MSM8230AB) },
-	{ qcom_board_id(APQ8030AB) },
-	{ qcom_board_id(MSM8226) },
-	{ qcom_board_id(MSM8526) },
-	{ qcom_board_id(APQ8030AA) },
-	{ qcom_board_id(MSM8110) },
-	{ qcom_board_id(MSM8210) },
-	{ qcom_board_id(MSM8810) },
-	{ qcom_board_id(MSM8212) },
-	{ qcom_board_id(MSM8612) },
-	{ qcom_board_id(MSM8112) },
-	{ qcom_board_id(MSM8125) },
-	{ qcom_board_id(MSM8225Q) },
-	{ qcom_board_id(MSM8625Q) },
-	{ qcom_board_id(MSM8125Q) },
-	{ qcom_board_id(APQ8064AA) },
-	{ qcom_board_id(APQ8084) },
-	{ qcom_board_id(MSM8130) },
-	{ qcom_board_id(MSM8130AA) },
-	{ qcom_board_id(MSM8130AB) },
-	{ qcom_board_id(MSM8627AA) },
-	{ qcom_board_id(MSM8227AA) },
-	{ qcom_board_id(APQ8074) },
-	{ qcom_board_id(MSM8274) },
-	{ qcom_board_id(MSM8674) },
-	{ qcom_board_id(MDM9635) },
-	{ qcom_board_id_named(MSM8974PRO_AC, "MSM8974PRO-AC") },
-	{ qcom_board_id(MSM8126) },
-	{ qcom_board_id(APQ8026) },
-	{ qcom_board_id(MSM8926) },
-	{ qcom_board_id(IPQ8062) },
-	{ qcom_board_id(IPQ8064) },
-	{ qcom_board_id(IPQ8066) },
-	{ qcom_board_id(IPQ8068) },
-	{ qcom_board_id(MSM8326) },
-	{ qcom_board_id(MSM8916) },
-	{ qcom_board_id(MSM8994) },
-	{ qcom_board_id_named(APQ8074PRO_AA, "APQ8074PRO-AA") },
-	{ qcom_board_id_named(APQ8074PRO_AB, "APQ8074PRO-AB") },
-	{ qcom_board_id_named(APQ8074PRO_AC, "APQ8074PRO-AC") },
-	{ qcom_board_id_named(MSM8274PRO_AA, "MSM8274PRO-AA") },
-	{ qcom_board_id_named(MSM8274PRO_AB, "MSM8274PRO-AB") },
-	{ qcom_board_id_named(MSM8274PRO_AC, "MSM8274PRO-AC") },
-	{ qcom_board_id_named(MSM8674PRO_AA, "MSM8674PRO-AA") },
-	{ qcom_board_id_named(MSM8674PRO_AB, "MSM8674PRO-AB") },
-	{ qcom_board_id_named(MSM8674PRO_AC, "MSM8674PRO-AC") },
-	{ qcom_board_id_named(MSM8974PRO_AA, "MSM8974PRO-AA") },
-	{ qcom_board_id_named(MSM8974PRO_AB, "MSM8974PRO-AB") },
-	{ qcom_board_id(APQ8028) },
-	{ qcom_board_id(MSM8128) },
-	{ qcom_board_id(MSM8228) },
-	{ qcom_board_id(MSM8528) },
-	{ qcom_board_id(MSM8628) },
-	{ qcom_board_id(MSM8928) },
-	{ qcom_board_id(MSM8510) },
-	{ qcom_board_id(MSM8512) },
-	{ qcom_board_id(MSM8936) },
-	{ qcom_board_id(MDM9640) },
-	{ qcom_board_id(MSM8939) },
-	{ qcom_board_id(APQ8036) },
-	{ qcom_board_id(APQ8039) },
-	{ qcom_board_id(MSM8236) },
-	{ qcom_board_id(MSM8636) },
-	{ qcom_board_id(MSM8909) },
-	{ qcom_board_id(MSM8996) },
-	{ qcom_board_id(APQ8016) },
-	{ qcom_board_id(MSM8216) },
-	{ qcom_board_id(MSM8116) },
-	{ qcom_board_id(MSM8616) },
-	{ qcom_board_id(MSM8992) },
-	{ qcom_board_id(APQ8092) },
-	{ qcom_board_id(APQ8094) },
-	{ qcom_board_id(MSM8209) },
-	{ qcom_board_id(MSM8208) },
-	{ qcom_board_id(MDM9209) },
-	{ qcom_board_id(MDM9309) },
-	{ qcom_board_id(MDM9609) },
-	{ qcom_board_id(MSM8239) },
-	{ qcom_board_id(MSM8952) },
-	{ qcom_board_id(APQ8009) },
-	{ qcom_board_id(MSM8956) },
-	{ qcom_board_id(MSM8929) },
-	{ qcom_board_id(MSM8629) },
-	{ qcom_board_id(MSM8229) },
-	{ qcom_board_id(APQ8029) },
-	{ qcom_board_id(APQ8056) },
-	{ qcom_board_id(MSM8609) },
-	{ qcom_board_id(APQ8076) },
-	{ qcom_board_id(MSM8976) },
-	{ qcom_board_id(IPQ8065) },
-	{ qcom_board_id(IPQ8069) },
-	{ qcom_board_id(MDM9650) },
-	{ qcom_board_id(MDM9655) },
-	{ qcom_board_id(MDM9250) },
-	{ qcom_board_id(MDM9255) },
-	{ qcom_board_id(MDM9350) },
-	{ qcom_board_id(APQ8052) },
-	{ qcom_board_id(MDM9607) },
-	{ qcom_board_id(APQ8096) },
-	{ qcom_board_id(MSM8998) },
-	{ qcom_board_id(MSM8953) },
-	{ qcom_board_id(MSM8937) },
-	{ qcom_board_id(APQ8037) },
-	{ qcom_board_id(MDM8207) },
-	{ qcom_board_id(MDM9207) },
-	{ qcom_board_id(MDM9307) },
-	{ qcom_board_id(MDM9628) },
-	{ qcom_board_id(MSM8909W) },
-	{ qcom_board_id(APQ8009W) },
-	{ qcom_board_id(MSM8996L) },
-	{ qcom_board_id(MSM8917) },
-	{ qcom_board_id(APQ8053) },
-	{ qcom_board_id(MSM8996SG) },
-	{ qcom_board_id(APQ8017) },
-	{ qcom_board_id(MSM8217) },
-	{ qcom_board_id(MSM8617) },
-	{ qcom_board_id(MSM8996AU) },
-	{ qcom_board_id(APQ8096AU) },
-	{ qcom_board_id(APQ8096SG) },
-	{ qcom_board_id(MSM8940) },
-	{ qcom_board_id(SDX201) },
-	{ qcom_board_id(SDM660) },
-	{ qcom_board_id(SDM630) },
-	{ qcom_board_id(APQ8098) },
-	{ qcom_board_id(MSM8920) },
-	{ qcom_board_id(SDM845) },
-	{ qcom_board_id(MDM9206) },
-	{ qcom_board_id(IPQ8074) },
-	{ qcom_board_id(SDA660) },
-	{ qcom_board_id(SDM658) },
-	{ qcom_board_id(SDA658) },
-	{ qcom_board_id(SDA630) },
-	{ qcom_board_id(MSM8905) },
-	{ qcom_board_id(SDX202) },
-	{ qcom_board_id(SDM670) },
-	{ qcom_board_id(SDM450) },
-	{ qcom_board_id(SM8150) },
-	{ qcom_board_id(SDA845) },
-	{ qcom_board_id(IPQ8072) },
-	{ qcom_board_id(IPQ8076) },
-	{ qcom_board_id(IPQ8078) },
-	{ qcom_board_id(SDM636) },
-	{ qcom_board_id(SDA636) },
-	{ qcom_board_id(SDM632) },
-	{ qcom_board_id(SDA632) },
-	{ qcom_board_id(SDA450) },
-	{ qcom_board_id(SDM439) },
-	{ qcom_board_id(SDM429) },
-	{ qcom_board_id(SM8250) },
-	{ qcom_board_id(SA8155) },
-	{ qcom_board_id(SDA439) },
-	{ qcom_board_id(SDA429) },
-	{ qcom_board_id(SM7150) },
-	{ qcom_board_id(SM7150P) },
-	{ qcom_board_id(IPQ8070) },
-	{ qcom_board_id(IPQ8071) },
-	{ qcom_board_id(QM215) },
-	{ qcom_board_id(IPQ8072A) },
-	{ qcom_board_id(IPQ8074A) },
-	{ qcom_board_id(IPQ8076A) },
-	{ qcom_board_id(IPQ8078A) },
-	{ qcom_board_id(SM6125) },
-	{ qcom_board_id(IPQ8070A) },
-	{ qcom_board_id(IPQ8071A) },
-	{ qcom_board_id(IPQ8172) },
-	{ qcom_board_id(IPQ8173) },
-	{ qcom_board_id(IPQ8174) },
-	{ qcom_board_id(IPQ6018) },
-	{ qcom_board_id(IPQ6028) },
-	{ qcom_board_id(SDM429W) },
-	{ qcom_board_id(SM4250) },
-	{ qcom_board_id(IPQ6000) },
-	{ qcom_board_id(IPQ6010) },
-	{ qcom_board_id(SC7180) },
-	{ qcom_board_id(SM6350) },
-	{ qcom_board_id(QCM2150) },
-	{ qcom_board_id(SDA429W) },
-	{ qcom_board_id(SM8350) },
-	{ qcom_board_id(QCM2290) },
-	{ qcom_board_id(SM7125) },
-	{ qcom_board_id(SM6115) },
-	{ qcom_board_id(IPQ5010) },
-	{ qcom_board_id(IPQ5018) },
-	{ qcom_board_id(IPQ5028) },
-	{ qcom_board_id(SC8280XP) },
-	{ qcom_board_id(IPQ6005) },
-	{ qcom_board_id(QRB5165) },
-	{ qcom_board_id(SM8450) },
-	{ qcom_board_id(SM7225) },
-	{ qcom_board_id(SA8295P) },
-	{ qcom_board_id(SA8540P) },
-	{ qcom_board_id(QCM4290) },
-	{ qcom_board_id(QCS4290) },
-	{ qcom_board_id(SM7325) },
-	{ qcom_board_id_named(SM8450_2, "SM8450") },
-	{ qcom_board_id_named(SM8450_3, "SM8450") },
-	{ qcom_board_id(SC7280) },
-	{ qcom_board_id(SC7180P) },
-	{ qcom_board_id(QCM6490) },
-	{ qcom_board_id(QCS6490) },
-	{ qcom_board_id(SM7325P) },
-	{ qcom_board_id(IPQ5000) },
-	{ qcom_board_id(IPQ0509) },
-	{ qcom_board_id(IPQ0518) },
-	{ qcom_board_id(SM6375) },
-	{ qcom_board_id(IPQ9514) },
-	{ qcom_board_id(IPQ9550) },
-	{ qcom_board_id(IPQ9554) },
-	{ qcom_board_id(IPQ9570) },
-	{ qcom_board_id(IPQ9574) },
-	{ qcom_board_id(SM8550) },
-	{ qcom_board_id(IPQ5016) },
-	{ qcom_board_id(IPQ9510) },
-	{ qcom_board_id(QRB4210) },
-	{ qcom_board_id(QRB2210) },
-	{ qcom_board_id(SAR2130P) },
-	{ qcom_board_id(SM8475) },
-	{ qcom_board_id(SM8475P) },
-	{ qcom_board_id(SA8255P) },
-	{ qcom_board_id(SA8775P) },
-	{ qcom_board_id(QRU1000) },
-	{ qcom_board_id(SM8475_2) },
-	{ qcom_board_id(QDU1000) },
-	{ qcom_board_id(X1E80100) },
-	{ qcom_board_id(SM8650) },
-	{ qcom_board_id(SM4450) },
-	{ qcom_board_id(SAR1130P) },
-	{ qcom_board_id(QDU1010) },
-	{ qcom_board_id(QRU1032) },
-	{ qcom_board_id(QRU1052) },
-	{ qcom_board_id(QRU1062) },
-	{ qcom_board_id(IPQ5332) },
-	{ qcom_board_id(IPQ5322) },
-	{ qcom_board_id(IPQ5312) },
-	{ qcom_board_id(IPQ5302) },
-	{ qcom_board_id(QCS8550) },
-	{ qcom_board_id(QCM8550) },
-	{ qcom_board_id(SM8750)  },
-	{ qcom_board_id(IPQ5300) },
-	{ qcom_board_id(SM7635) },
-	{ qcom_board_id(SM6650) },
-	{ qcom_board_id(SM6650P) },
-	{ qcom_board_id(IPQ5321) },
-	{ qcom_board_id(IPQ5424) },
-	{ qcom_board_id(QCM6690) },
-	{ qcom_board_id(QCS6690) },
-	{ qcom_board_id(SM8850) },
-	{ qcom_board_id(IPQ5404) },
-	{ qcom_board_id(QCS9100) },
-	{ qcom_board_id(QCS8300) },
-	{ qcom_board_id(QCS8275) },
-	{ qcom_board_id(QCS9075) },
-	{ qcom_board_id(QCS615) },
-};
-
-static const char *socinfo_machine(struct device *dev, unsigned int id)
-{
-	int idx;
-
-	for (idx = 0; idx < ARRAY_SIZE(soc_id); idx++) {
-		if (soc_id[idx].id == id)
-			return soc_id[idx].name;
-	}
-
-	return NULL;
-}
-
-#ifdef CONFIG_DEBUG_FS
-
-#define QCOM_OPEN(name, _func)						\
-static int qcom_open_##name(struct inode *inode, struct file *file)	\
-{									\
-	return single_open(file, _func, inode->i_private);		\
-}									\
-									\
-static const struct file_operations qcom_ ##name## _ops = {		\
-	.open = qcom_open_##name,					\
-	.read = seq_read,						\
-	.llseek = seq_lseek,						\
-	.release = single_release,					\
-}
-
-#define DEBUGFS_ADD(info, name)						\
-	debugfs_create_file(__stringify(name), 0444,			\
-			    qcom_socinfo->dbg_root,			\
-			    info, &qcom_ ##name## _ops)
-
-
-static int qcom_show_build_id(struct seq_file *seq, void *p)
-{
-	struct socinfo *socinfo = seq->private;
-
-	seq_printf(seq, "%s\n", socinfo->build_id);
-
-	return 0;
-}
-
-static int qcom_show_pmic_model(struct seq_file *seq, void *p)
-{
-	struct socinfo *socinfo = seq->private;
-	int model = SOCINFO_MINOR(le32_to_cpu(socinfo->pmic_model));
-
-	if (model < 0)
-		return -EINVAL;
-
-	if (model < ARRAY_SIZE(pmic_models) && pmic_models[model])
-		seq_printf(seq, "%s\n", pmic_models[model]);
-	else
-		seq_printf(seq, "unknown (%d)\n", model);
-
-	return 0;
-}
-
-static int qcom_show_pmic_model_array(struct seq_file *seq, void *p)
-{
-	struct socinfo *socinfo = seq->private;
-	unsigned int num_pmics = le32_to_cpu(socinfo->num_pmics);
-	unsigned int pmic_array_offset = le32_to_cpu(socinfo->pmic_array_offset);
-	int i;
-	void *ptr = socinfo;
-
-	ptr += pmic_array_offset;
-
-	/* No need for bounds checking, it happened at socinfo_debugfs_init */
-	for (i = 0; i < num_pmics; i++) {
-		unsigned int model = SOCINFO_MINOR(get_unaligned_le32(ptr + 2 * i * sizeof(u32)));
-		unsigned int die_rev = get_unaligned_le32(ptr + (2 * i + 1) * sizeof(u32));
-
-		if (model < ARRAY_SIZE(pmic_models) && pmic_models[model])
-			seq_printf(seq, "%s %u.%u\n", pmic_models[model],
-				   SOCINFO_MAJOR(die_rev),
-				   SOCINFO_MINOR(die_rev));
-		else
-			seq_printf(seq, "unknown (%d)\n", model);
-	}
-
-	return 0;
-}
-
-static int qcom_show_pmic_die_revision(struct seq_file *seq, void *p)
-{
-	struct socinfo *socinfo = seq->private;
-
-	seq_printf(seq, "%u.%u\n",
-		   SOCINFO_MAJOR(le32_to_cpu(socinfo->pmic_die_rev)),
-		   SOCINFO_MINOR(le32_to_cpu(socinfo->pmic_die_rev)));
-
-	return 0;
-}
-
-static int qcom_show_chip_id(struct seq_file *seq, void *p)
-{
-	struct socinfo *socinfo = seq->private;
-
-	seq_printf(seq, "%s\n", socinfo->chip_id);
-
-	return 0;
-}
-
-QCOM_OPEN(build_id, qcom_show_build_id);
-QCOM_OPEN(pmic_model, qcom_show_pmic_model);
-QCOM_OPEN(pmic_model_array, qcom_show_pmic_model_array);
-QCOM_OPEN(pmic_die_rev, qcom_show_pmic_die_revision);
-QCOM_OPEN(chip_id, qcom_show_chip_id);
-
-#define DEFINE_IMAGE_OPS(type)					\
-static int show_image_##type(struct seq_file *seq, void *p)		  \
-{								  \
-	struct smem_image_version *image_version = seq->private;  \
-	if (image_version->type[0] != '\0')			  \
-		seq_printf(seq, "%s\n", image_version->type);	  \
-	return 0;						  \
-}								  \
-static int open_image_##type(struct inode *inode, struct file *file)	  \
-{									  \
-	return single_open(file, show_image_##type, inode->i_private); \
-}									  \
-									  \
-static const struct file_operations qcom_image_##type##_ops = {	  \
-	.open = open_image_##type,					  \
-	.read = seq_read,						  \
-	.llseek = seq_lseek,						  \
-	.release = single_release,					  \
-}
-
-DEFINE_IMAGE_OPS(name);
-DEFINE_IMAGE_OPS(variant);
-DEFINE_IMAGE_OPS(oem);
-
-static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
-				 struct socinfo *info, size_t info_size)
-{
-	struct smem_image_version *versions;
-	struct dentry *dentry;
-	size_t size;
-	int i, j;
-	unsigned int num_pmics;
-	unsigned int pmic_array_offset;
-
-	qcom_socinfo->dbg_root = debugfs_create_dir("qcom_socinfo", NULL);
-
-	qcom_socinfo->info.fmt = __le32_to_cpu(info->fmt);
-
-	debugfs_create_x32("info_fmt", 0444, qcom_socinfo->dbg_root,
-			   &qcom_socinfo->info.fmt);
-
-	switch (qcom_socinfo->info.fmt) {
-	case SOCINFO_VERSION(0, 23):
-	case SOCINFO_VERSION(0, 22):
-	case SOCINFO_VERSION(0, 21):
-	case SOCINFO_VERSION(0, 20):
-		qcom_socinfo->info.raw_package_type = __le32_to_cpu(info->raw_package_type);
-		debugfs_create_u32("raw_package_type", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.raw_package_type);
-		fallthrough;
-	case SOCINFO_VERSION(0, 19):
-		qcom_socinfo->info.num_func_clusters = __le32_to_cpu(info->num_func_clusters);
-		qcom_socinfo->info.boot_cluster = __le32_to_cpu(info->boot_cluster);
-		qcom_socinfo->info.boot_core = __le32_to_cpu(info->boot_core);
-
-		debugfs_create_u32("num_func_clusters", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.num_func_clusters);
-		debugfs_create_u32("boot_cluster", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.boot_cluster);
-		debugfs_create_u32("boot_core", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.boot_core);
-		fallthrough;
-	case SOCINFO_VERSION(0, 18):
-	case SOCINFO_VERSION(0, 17):
-		qcom_socinfo->info.oem_variant = __le32_to_cpu(info->oem_variant);
-		debugfs_create_u32("oem_variant", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.oem_variant);
-		fallthrough;
-	case SOCINFO_VERSION(0, 16):
-		qcom_socinfo->info.feature_code = __le32_to_cpu(info->feature_code);
-		qcom_socinfo->info.pcode = __le32_to_cpu(info->pcode);
-
-		debugfs_create_u32("feature_code", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.feature_code);
-		debugfs_create_u32("pcode", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.pcode);
-		fallthrough;
-	case SOCINFO_VERSION(0, 15):
-		qcom_socinfo->info.nmodem_supported = __le32_to_cpu(info->nmodem_supported);
-
-		debugfs_create_u32("nmodem_supported", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.nmodem_supported);
-		fallthrough;
-	case SOCINFO_VERSION(0, 14):
-		qcom_socinfo->info.num_clusters = __le32_to_cpu(info->num_clusters);
-		qcom_socinfo->info.ncluster_array_offset = __le32_to_cpu(info->ncluster_array_offset);
-		qcom_socinfo->info.num_subset_parts = __le32_to_cpu(info->num_subset_parts);
-		qcom_socinfo->info.nsubset_parts_array_offset =
-			__le32_to_cpu(info->nsubset_parts_array_offset);
-
-		debugfs_create_u32("num_clusters", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.num_clusters);
-		debugfs_create_u32("ncluster_array_offset", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.ncluster_array_offset);
-		debugfs_create_u32("num_subset_parts", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.num_subset_parts);
-		debugfs_create_u32("nsubset_parts_array_offset", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.nsubset_parts_array_offset);
-		fallthrough;
-	case SOCINFO_VERSION(0, 13):
-		qcom_socinfo->info.nproduct_id = __le32_to_cpu(info->nproduct_id);
-
-		debugfs_create_u32("nproduct_id", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.nproduct_id);
-		DEBUGFS_ADD(info, chip_id);
-		fallthrough;
-	case SOCINFO_VERSION(0, 12):
-		qcom_socinfo->info.chip_family =
-			__le32_to_cpu(info->chip_family);
-		qcom_socinfo->info.raw_device_family =
-			__le32_to_cpu(info->raw_device_family);
-		qcom_socinfo->info.raw_device_num =
-			__le32_to_cpu(info->raw_device_num);
-
-		debugfs_create_x32("chip_family", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.chip_family);
-		debugfs_create_x32("raw_device_family", 0444,
-				   qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.raw_device_family);
-		debugfs_create_x32("raw_device_number", 0444,
-				   qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.raw_device_num);
-		fallthrough;
-	case SOCINFO_VERSION(0, 11):
-		num_pmics = le32_to_cpu(info->num_pmics);
-		pmic_array_offset = le32_to_cpu(info->pmic_array_offset);
-		if (pmic_array_offset + 2 * num_pmics * sizeof(u32) <= info_size)
-			DEBUGFS_ADD(info, pmic_model_array);
-		fallthrough;
-	case SOCINFO_VERSION(0, 10):
-	case SOCINFO_VERSION(0, 9):
-		qcom_socinfo->info.foundry_id = __le32_to_cpu(info->foundry_id);
-
-		debugfs_create_u32("foundry_id", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.foundry_id);
-		fallthrough;
-	case SOCINFO_VERSION(0, 8):
-	case SOCINFO_VERSION(0, 7):
-		DEBUGFS_ADD(info, pmic_model);
-		DEBUGFS_ADD(info, pmic_die_rev);
-		fallthrough;
-	case SOCINFO_VERSION(0, 6):
-		qcom_socinfo->info.hw_plat_subtype =
-			__le32_to_cpu(info->hw_plat_subtype);
-
-		debugfs_create_u32("hardware_platform_subtype", 0444,
-				   qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.hw_plat_subtype);
-		fallthrough;
-	case SOCINFO_VERSION(0, 5):
-		qcom_socinfo->info.accessory_chip =
-			__le32_to_cpu(info->accessory_chip);
-
-		debugfs_create_u32("accessory_chip", 0444,
-				   qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.accessory_chip);
-		fallthrough;
-	case SOCINFO_VERSION(0, 4):
-		qcom_socinfo->info.plat_ver = __le32_to_cpu(info->plat_ver);
-
-		debugfs_create_u32("platform_version", 0444,
-				   qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.plat_ver);
-		fallthrough;
-	case SOCINFO_VERSION(0, 3):
-		qcom_socinfo->info.hw_plat = __le32_to_cpu(info->hw_plat);
-
-		debugfs_create_u32("hardware_platform", 0444,
-				   qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.hw_plat);
-		fallthrough;
-	case SOCINFO_VERSION(0, 2):
-		qcom_socinfo->info.raw_ver  = __le32_to_cpu(info->raw_ver);
-
-		debugfs_create_u32("raw_version", 0444, qcom_socinfo->dbg_root,
-				   &qcom_socinfo->info.raw_ver);
-		fallthrough;
-	case SOCINFO_VERSION(0, 1):
-		DEBUGFS_ADD(info, build_id);
-		break;
-	}
-
-	for (i = 0, j = 0; i < ARRAY_SIZE(socinfo_image_names); i++, j++) {
-		if (!socinfo_image_names[i])
-			continue;
-
-		if (i == 0) {
-			versions = qcom_smem_get(QCOM_SMEM_HOST_ANY,
-						 SMEM_IMAGE_VERSION_TABLE,
-						 &size);
-		} else if (i == 32) {
-			versions = qcom_smem_get(QCOM_SMEM_HOST_ANY,
-						 SMEM_IMAGE_VERSION_TABLE_2,
-						 &size);
-			if (IS_ERR(versions))
-				break;
-
-			j = 0;
-		}
-
-		dentry = debugfs_create_dir(socinfo_image_names[i],
-					    qcom_socinfo->dbg_root);
-		debugfs_create_file("name", 0444, dentry, &versions[j],
-				    &qcom_image_name_ops);
-		debugfs_create_file("variant", 0444, dentry, &versions[j],
-				    &qcom_image_variant_ops);
-		debugfs_create_file("oem", 0444, dentry, &versions[j],
-				    &qcom_image_oem_ops);
-	}
-}
-
-static void socinfo_debugfs_exit(struct qcom_socinfo *qcom_socinfo)
-{
-	debugfs_remove_recursive(qcom_socinfo->dbg_root);
-}
-#else
-static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
-				 struct socinfo *info, size_t info_size)
-{
-}
-static void socinfo_debugfs_exit(struct qcom_socinfo *qcom_socinfo) {  }
-#endif /* CONFIG_DEBUG_FS */
-
-static int qcom_socinfo_probe(struct platform_device *pdev)
-{
-	struct qcom_socinfo *qs;
-	struct socinfo *info;
-	size_t item_size;
-
-	info = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID,
-			      &item_size);
-	if (IS_ERR(info)) {
-		dev_err(&pdev->dev, "Couldn't find socinfo\n");
-		return PTR_ERR(info);
-	}
-
-	qs = devm_kzalloc(&pdev->dev, sizeof(*qs), GFP_KERNEL);
-	if (!qs)
-		return -ENOMEM;
-
-	qs->attr.family = "Snapdragon";
-	qs->attr.machine = socinfo_machine(&pdev->dev,
-					   le32_to_cpu(info->id));
-	qs->attr.soc_id = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%u",
-					 le32_to_cpu(info->id));
-	qs->attr.revision = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%u.%u",
-					   SOCINFO_MAJOR(le32_to_cpu(info->ver)),
-					   SOCINFO_MINOR(le32_to_cpu(info->ver)));
-	if (!qs->attr.soc_id || !qs->attr.revision)
-		return -ENOMEM;
-
-	if (offsetofend(struct socinfo, serial_num) <= item_size) {
-		qs->attr.serial_number = devm_kasprintf(&pdev->dev, GFP_KERNEL,
-							"%u",
-							le32_to_cpu(info->serial_num));
-		if (!qs->attr.serial_number)
-			return -ENOMEM;
-	}
-
-	qs->soc_dev = soc_device_register(&qs->attr);
-	if (IS_ERR(qs->soc_dev))
-		return PTR_ERR(qs->soc_dev);
-
-	socinfo_debugfs_init(qs, info, item_size);
-
-	/* Feed the soc specific unique data into entropy pool */
-	add_device_randomness(info, item_size);
-
-	platform_set_drvdata(pdev, qs);
-
-	return 0;
-}
-
-static void qcom_socinfo_remove(struct platform_device *pdev)
-{
-	struct qcom_socinfo *qs = platform_get_drvdata(pdev);
-
-	soc_device_unregister(qs->soc_dev);
-
-	socinfo_debugfs_exit(qs);
-}
-
-static struct platform_driver qcom_socinfo_driver = {
-	.probe = qcom_socinfo_probe,
-	.remove = qcom_socinfo_remove,
-	.driver  = {
-		.name = "qcom-socinfo",
-	},
-};
-
-module_platform_driver(qcom_socinfo_driver);
-
-MODULE_DESCRIPTION("Qualcomm SoCinfo driver");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:qcom-socinfo");
diff --git a/drivers/soc/qcom/socinfo/Makefile b/drivers/soc/qcom/socinfo/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..8cdd77f46a22aeb97bcf1eeb90418db8f6352d3b
--- /dev/null
+++ b/drivers/soc/qcom/socinfo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_QCOM_SOCINFO) += socinfo.o
diff --git a/drivers/soc/qcom/socinfo/bindings.rs b/drivers/soc/qcom/socinfo/bindings.rs
new file mode 100644
index 0000000000000000000000000000000000000000..243fd2adf26ccf417166a08465b2b791030a2364
--- /dev/null
+++ b/drivers/soc/qcom/socinfo/bindings.rs
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+use kernel::{
+    auxiliary,
+    bindings,
+    device::{
+        Bound,
+        Device, //
+    },
+    error::from_err_ptr,
+    ffi::c_char,
+    io::{
+        Io,
+        Mmio,
+        MmioRaw, //
+    },
+    macros::{
+        AsBytes,
+        FromBytes, //
+    },
+    prelude::*,
+    transmute::AsBytes,
+    types::ARef, //
+};
+
+// INVARIANT: raw is a region or subregion returned by get_smem_aux when presented with
+// the auxdev in dev.
+pub(crate) struct Smem {
+    dev: ARef<Device>,
+    raw: MmioRaw,
+}
+
+impl Smem {
+    pub(crate) fn access<'a>(&'a self, dev: &'a Device<Bound>) -> Option<&'a Mmio> {
+        if *dev != *self.dev {
+            return None;
+        }
+
+        // SAFETY: By our invariant, this was a subrange of what was returned by smem_aux_get, for
+        // self.dev, and by our above check, that auxdev is still available.
+        Some(unsafe { Mmio::from_raw(&self.raw) })
+    }
+
+    pub(crate) fn subrange(&self, offset: usize, len: usize) -> Option<Self> {
+        let remaining_len: usize = self.raw.maxsize().checked_sub(offset)?;
+        remaining_len.checked_sub(len)?;
+        // INVARIANT: Maintained because offset is positive, and the length fits.
+        Some(Self {
+            dev: self.dev.clone(),
+            raw: MmioRaw::new(self.raw.addr() + offset, len).ok()?,
+        })
+    }
+
+    pub(crate) fn maxsize(&self) -> usize {
+        self.raw.maxsize()
+    }
+
+    pub(crate) fn get(dev: &auxiliary::Device<Bound>, host: i32, item: u32) -> Result<Self> {
+        let mut size = 0;
+        // SAFETY: qcom_smem_get_aux only requires that the size pointer be a writable size_t,
+        // and that aux be an aux device.
+        let err_ptr =
+            unsafe { bindings::qcom_smem_get_aux(dev.as_raw(), host as u32, item, &mut size) };
+        let ptr = from_err_ptr(err_ptr)?;
+        let base_dev: &Device<Bound> = dev.as_ref();
+        // INVARIANT: If qcom_smem_get_aux does not return an error, the returned pointer points to
+        // a readable IO region that qcom-smem will keep mapped while our provided aux device is
+        // loaded.
+        Ok(Self {
+            dev: base_dev.into(),
+            raw: MmioRaw::new(ptr as usize, size)?,
+        })
+    }
+}
+
+pub(crate) const SMEM_IMAGE_VERSION_TABLE: u32 = 469;
+pub(crate) const SMEM_IMAGE_VERSION_TABLE_2: u32 = 667;
+
+pub(crate) use bindings::socinfo;
+
+/// Produce `socinfo` by initializing from a byte buffer that may be too small.
+/// Code using the resulting value is expected to use the info_fmt field to determine
+/// which fields have meaningful values.
+pub(crate) fn socinfo_from_partial_bytes(soc_info_mem: &Mmio) -> Result<socinfo> {
+    let mut soc_info = socinfo::default();
+    let byte_view: &mut [u8] = soc_info.as_bytes_mut();
+    let len = core::cmp::min(soc_info_mem.maxsize(), byte_view.len());
+    soc_info_mem.try_copy_to(&mut byte_view[..len], 0)?;
+    Ok(soc_info)
+}
+
+#[derive(AsBytes, FromBytes, Default, Copy, Clone)]
+#[repr(C)]
+pub(crate) struct PmicEntry {
+    pub(crate) model: u32,
+    pub(crate) die_rev: u32,
+}
+
+const SMEM_IMAGE_VERSION_NAME_SIZE: usize = 75;
+const SMEM_IMAGE_VERSION_VARIANT_SIZE: usize = 20;
+const SMEM_IMAGE_VERSION_OEM_SIZE: usize = 32;
+
+#[derive(AsBytes, FromBytes)]
+#[repr(C)]
+pub(crate) struct ImageVersion {
+    pub(crate) name: [c_char; SMEM_IMAGE_VERSION_NAME_SIZE],
+    pub(crate) variant: [c_char; SMEM_IMAGE_VERSION_VARIANT_SIZE],
+    pub(crate) pad: c_char,
+    pub(crate) oem: [c_char; SMEM_IMAGE_VERSION_OEM_SIZE],
+}
+
+impl Default for ImageVersion {
+    fn default() -> Self {
+        ImageVersion {
+            name: [0; SMEM_IMAGE_VERSION_NAME_SIZE],
+            variant: [0; SMEM_IMAGE_VERSION_VARIANT_SIZE],
+            pad: 0,
+            oem: [0; SMEM_IMAGE_VERSION_OEM_SIZE],
+        }
+    }
+}
diff --git a/drivers/soc/qcom/socinfo/data.rs b/drivers/soc/qcom/socinfo/data.rs
new file mode 100644
index 0000000000000000000000000000000000000000..e33e040ae34ddfd2acd1e1e64f5e35cc78e85483
--- /dev/null
+++ b/drivers/soc/qcom/socinfo/data.rs
@@ -0,0 +1,438 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! Data tables for QCom SocInfo driver
+use kernel::{
+    c_str,
+    prelude::*,
+    sparse_array, //
+};
+
+macro_rules! soc_ids {
+    { $( $entry:tt ),* $(,)? } => {
+        pub(crate) static SOC_IDS: &[SocId] = &[
+            $(
+                soc_id_entry!($entry)
+            ),*
+        ];
+    }
+}
+
+macro_rules! soc_id_entry {
+    ($id:ident) => {
+        kernel::macros::paste! {
+            SocId {
+                id: kernel::bindings::[<QCOM_ID_ $id>],
+                name: c_str!(stringify!($id)),
+            }
+        }
+    };
+    (($id:ident, $name:literal)) => {
+        kernel::macros::paste! {
+            SocId {
+                id: kernel::bindings::[<QCOM_ID_ $id>],
+                name: c_str!($name),
+            }
+        }
+    };
+}
+
+pub(crate) struct SocId {
+    pub(crate) id: u32,
+    pub(crate) name: &'static CStr,
+}
+
+soc_ids! {
+    MSM8260,
+    MSM8660,
+    APQ8060,
+    MSM8960,
+    APQ8064,
+    MSM8930,
+    MSM8630,
+    MSM8230,
+    APQ8030,
+    MSM8627,
+    MSM8227,
+    MSM8660A,
+    MSM8260A,
+    APQ8060A,
+    MSM8974,
+    MSM8225,
+    MSM8625,
+    MPQ8064,
+    MSM8960AB,
+    APQ8060AB,
+    MSM8260AB,
+    MSM8660AB,
+    MSM8930AA,
+    MSM8630AA,
+    MSM8230AA,
+    MSM8626,
+    MSM8610,
+    APQ8064AB,
+    MSM8930AB,
+    MSM8630AB,
+    MSM8230AB,
+    APQ8030AB,
+    MSM8226,
+    MSM8526,
+    APQ8030AA,
+    MSM8110,
+    MSM8210,
+    MSM8810,
+    MSM8212,
+    MSM8612,
+    MSM8112,
+    MSM8125,
+    MSM8225Q,
+    MSM8625Q,
+    MSM8125Q,
+    APQ8064AA,
+    APQ8084,
+    MSM8130,
+    MSM8130AA,
+    MSM8130AB,
+    MSM8627AA,
+    MSM8227AA,
+    APQ8074,
+    MSM8274,
+    MSM8674,
+    MDM9635,
+    (MSM8974PRO_AC, "MSM8974PRO-AC"),
+    MSM8126,
+    APQ8026,
+    MSM8926,
+    IPQ8062,
+    IPQ8064,
+    IPQ8066,
+    IPQ8068,
+    MSM8326,
+    MSM8916,
+    MSM8994,
+    (APQ8074PRO_AA, "APQ8074PRO-AA"),
+    (APQ8074PRO_AB, "APQ8074PRO-AB"),
+    (APQ8074PRO_AC, "APQ8074PRO-AC"),
+    (MSM8274PRO_AA, "MSM8274PRO-AA"),
+    (MSM8274PRO_AB, "MSM8274PRO-AB"),
+    (MSM8274PRO_AC, "MSM8274PRO-AC"),
+    (MSM8674PRO_AA, "MSM8674PRO-AA"),
+    (MSM8674PRO_AB, "MSM8674PRO-AB"),
+    (MSM8674PRO_AC, "MSM8674PRO-AC"),
+    (MSM8974PRO_AA, "MSM8974PRO-AA"),
+    (MSM8974PRO_AB, "MSM8974PRO-AB"),
+    APQ8028,
+    MSM8128,
+    MSM8228,
+    MSM8528,
+    MSM8628,
+    MSM8928,
+    MSM8510,
+    MSM8512,
+    MSM8936,
+    MDM9640,
+    MSM8939,
+    APQ8036,
+    APQ8039,
+    MSM8236,
+    MSM8636,
+    MSM8909,
+    MSM8996,
+    APQ8016,
+    MSM8216,
+    MSM8116,
+    MSM8616,
+    MSM8992,
+    APQ8092,
+    APQ8094,
+    MSM8209,
+    MSM8208,
+    MDM9209,
+    MDM9309,
+    MDM9609,
+    MSM8239,
+    MSM8952,
+    APQ8009,
+    MSM8956,
+    MSM8929,
+    MSM8629,
+    MSM8229,
+    APQ8029,
+    APQ8056,
+    MSM8609,
+    APQ8076,
+    MSM8976,
+    IPQ8065,
+    IPQ8069,
+    MDM9650,
+    MDM9655,
+    MDM9250,
+    MDM9255,
+    MDM9350,
+    APQ8052,
+    MDM9607,
+    APQ8096,
+    MSM8998,
+    MSM8953,
+    MSM8937,
+    APQ8037,
+    MDM8207,
+    MDM9207,
+    MDM9307,
+    MDM9628,
+    MSM8909W,
+    APQ8009W,
+    MSM8996L,
+    MSM8917,
+    APQ8053,
+    MSM8996SG,
+    APQ8017,
+    MSM8217,
+    MSM8617,
+    MSM8996AU,
+    APQ8096AU,
+    APQ8096SG,
+    MSM8940,
+    SDX201,
+    SDM660,
+    SDM630,
+    APQ8098,
+    MSM8920,
+    SDM845,
+    MDM9206,
+    IPQ8074,
+    SDA660,
+    SDM658,
+    SDA658,
+    SDA630,
+    MSM8905,
+    SDX202,
+    SDM670,
+    SDM450,
+    SM8150,
+    SDA845,
+    IPQ8072,
+    IPQ8076,
+    IPQ8078,
+    SDM636,
+    SDA636,
+    SDM632,
+    SDA632,
+    SDA450,
+    SDM439,
+    SDM429,
+    SM8250,
+    SA8155,
+    SDA439,
+    SDA429,
+    SM7150,
+    SM7150P,
+    IPQ8070,
+    IPQ8071,
+    QM215,
+    IPQ8072A,
+    IPQ8074A,
+    IPQ8076A,
+    IPQ8078A,
+    SM6125,
+    IPQ8070A,
+    IPQ8071A,
+    IPQ8172,
+    IPQ8173,
+    IPQ8174,
+    IPQ6018,
+    IPQ6028,
+    SDM429W,
+    SM4250,
+    IPQ6000,
+    IPQ6010,
+    SC7180,
+    SM6350,
+    QCM2150,
+    SDA429W,
+    SM8350,
+    QCM2290,
+    SM7125,
+    SM6115,
+    IPQ5010,
+    IPQ5018,
+    IPQ5028,
+    SC8280XP,
+    IPQ6005,
+    QRB5165,
+    SM8450,
+    SM7225,
+    SA8295P,
+    SA8540P,
+    QCM4290,
+    QCS4290,
+    SM7325,
+    (SM8450_2, "SM8450"),
+    (SM8450_3, "SM8450"),
+    SC7280,
+    SC7180P,
+    QCM6490,
+    QCS6490,
+    SM7325P,
+    IPQ5000,
+    IPQ0509,
+    IPQ0518,
+    SM6375,
+    IPQ9514,
+    IPQ9550,
+    IPQ9554,
+    IPQ9570,
+    IPQ9574,
+    SM8550,
+    IPQ5016,
+    IPQ9510,
+    QRB4210,
+    QRB2210,
+    SAR2130P,
+    SM8475,
+    SM8475P,
+    SA8255P,
+    SA8775P,
+    QRU1000,
+    SM8475_2,
+    QDU1000,
+    X1E80100,
+    SM8650,
+    SM4450,
+    SAR1130P,
+    QDU1010,
+    QRU1032,
+    QRU1052,
+    QRU1062,
+    IPQ5332,
+    IPQ5322,
+    IPQ5312,
+    IPQ5302,
+    QCS8550,
+    QCM8550,
+    SM8750,
+    IPQ5300,
+    SM7635,
+    SM6650,
+    SM6650P,
+    IPQ5321,
+    IPQ5424,
+    QCM6690,
+    QCS6690,
+    SM8850,
+    IPQ5404,
+    QCS9100,
+    QCS8300,
+    QCS8275,
+    QCS9075,
+    QCS615,
+}
+
+pub(crate) const PMIC_MODELS: &[Option<&str>] = &sparse_array! {
+    0: "Unknown PMIC model",
+    1: "PM8941",
+    2: "PM8841",
+    3: "PM8019",
+    4: "PM8226",
+    5: "PM8110",
+    6: "PMA8084",
+    7: "PMI8962",
+    8: "PMD9635",
+    9: "PM8994",
+    10: "PMI8994",
+    11: "PM8916",
+    12: "PM8004",
+    13: "PM8909/PM8058",
+    14: "PM8028",
+    15: "PM8901",
+    16: "PM8950/PM8027",
+    17: "PMI8950/ISL9519",
+    18: "PMK8001/PM8921",
+    19: "PMI8996/PM8018",
+    20: "PM8998/PM8015",
+    21: "PMI8998/PM8014",
+    22: "PM8821",
+    23: "PM8038",
+    24: "PM8005/PM8922",
+    25: "PM8917/PM8937",
+    26: "PM660L",
+    27: "PM660",
+    30: "PM8150",
+    31: "PM8150L",
+    32: "PM8150B",
+    33: "PMK8002",
+    36: "PM8009",
+    37: "PMI632",
+    38: "PM8150C",
+    40: "PM6150",
+    41: "SMB2351",
+    44: "PM8008",
+    45: "PM6125",
+    46: "PM7250B",
+    47: "PMK8350",
+    48: "PM8350",
+    49: "PM8350C",
+    50: "PM8350B",
+    51: "PMR735A",
+    52: "PMR735B",
+    54: "PM6350",
+    55: "PM4125",
+    58: "PM8450",
+    65: "PM8010",
+    69: "PM8550VS",
+    70: "PM8550VE",
+    71: "PM8550B",
+    72: "PMR735D",
+    73: "PM8550",
+    74: "PMK8550",
+    78: "PMM8650AU",
+    79: "PMM8650AU_PSAIL",
+    80: "PM7550",
+    82: "PMC8380",
+    83: "SMB2360",
+    91: "PMIV0108"
+};
+
+pub(crate) const IMAGE_NAMES: &[&CStr] = &[
+    c"boot",
+    c"tz",
+    c"tzsecapp",
+    c"rpm",
+    c"sdi",
+    c"hyp",
+    c"adsp1",
+    c"adsp2",
+    c"cdsp2",
+    c"appsbl",
+    c"apps",
+    c"mpss",
+    c"adsp",
+    c"cnss",
+    c"video",
+    c"dsps",
+    c"cdsp",
+    c"npu",
+    c"wpss",
+    c"cdsp1",
+    c"gpdsp",
+    c"gpdsp1",
+    c"sensorpd",
+    c"audiopd",
+    c"oempd",
+    c"chargerpd",
+    c"oispd",
+    c"soccp",
+    c"tme",
+    c"gearvm",
+    c"uefi",
+    c"cdsp3",
+    c"audiopd",
+    c"audiopd",
+    c"dcp",
+    c"oobs",
+    c"oobns",
+    c"devcfg",
+    c"btpd",
+    c"qecp",
+];
diff --git a/drivers/soc/qcom/socinfo/socinfo.rs b/drivers/soc/qcom/socinfo/socinfo.rs
new file mode 100644
index 0000000000000000000000000000000000000000..c0791b33232eed9aef01c4db9e2031961fca783f
--- /dev/null
+++ b/drivers/soc/qcom/socinfo/socinfo.rs
@@ -0,0 +1,446 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! socinfo driver for Qualcomm SoCs.
+
+use core::fmt::{
+    self,
+    Formatter, //
+};
+
+use kernel::{
+    auxiliary,
+    c_str,
+    debugfs::{
+        Scope,
+        ScopedDir, //
+    },
+    device::{
+        Bound,
+        Core,
+        Device, //
+    },
+    devres::Devres,
+    error,
+    io::{
+        Io,
+        Mmio, //
+    },
+    module_auxiliary_driver,
+    pr_warn,
+    prelude::*,
+    soc,
+    str::{
+        CStr,
+        CStrExt,
+        CString, //
+    },
+    transmute::AsBytes,
+    try_pin_init, //
+};
+use pin_init::pin_init_scope;
+
+mod bindings;
+mod data;
+
+use bindings::*;
+use data::{
+    IMAGE_NAMES,
+    PMIC_MODELS,
+    SOC_IDS, //
+};
+
+module_auxiliary_driver! {
+    type: QcomSocInfo,
+    name: "qcom-socinfo",
+    authors: ["Matthew Maurer"],
+    description: "Qualcomm SoCinfo driver",
+    license: "GPL",
+    alias: ["platform:qcom-socinfo"],
+}
+
+#[pin_data]
+struct QcomSocInfo {
+    #[pin]
+    registration: soc::Registration,
+    #[pin]
+    params: Devres<Scope<Params>>,
+}
+
+fn pmic_name(model: u32) -> Option<&'static str> {
+    let idx = SocInfo::version_split(model).1 as usize;
+    PMIC_MODELS.get(idx).copied().flatten()
+}
+
+fn fmt_pmic_model(model: &u32, f: &mut Formatter<'_>) -> fmt::Result {
+    if let Some(model) = pmic_name(*model) {
+        writeln!(f, "{model}")
+    } else {
+        writeln!(f, "unknown ({})", SocInfo::version_split(*model).1)
+    }
+}
+
+fn fmt_pmic_die_rev(rev: &u32, f: &mut Formatter<'_>) -> fmt::Result {
+    let (major, minor) = SocInfo::version_split(*rev);
+    writeln!(f, "{major}.{minor}")
+}
+
+fn fmt_pmic_model_array(array: &KVec<PmicEntry>, f: &mut Formatter<'_>) -> fmt::Result {
+    for pmic_entry in array {
+        let (die_rev_major, die_rev_minor) =
+            SocInfo::version_split(u32::from_le(pmic_entry.die_rev));
+        if let Some(model) = pmic_name(pmic_entry.model) {
+            writeln!(f, "{model} {die_rev_major}.{die_rev_minor}")?
+        } else {
+            writeln!(f, "unknown ({})", pmic_entry.model)?
+        }
+    }
+    Ok(())
+}
+
+#[derive(Default)]
+struct Params {
+    info_fmt: u32,
+    build_id: [u8; 32],
+    raw_version: Option<u32>,
+    hardware_platform: Option<u32>,
+    platform_version: Option<u32>,
+    accessory_chip: Option<u32>,
+    hardware_platform_subtype: Option<u32>,
+    pmic_model: Option<u32>,
+    pmic_die_rev: Option<u32>,
+    foundry_id: Option<u32>,
+    pmic_model_array: Option<KVec<PmicEntry>>,
+    chip_family: Option<u32>,
+    raw_device_family: Option<u32>,
+    raw_device_number: Option<u32>,
+    nproduct_id: Option<u32>,
+    chip_id: Option<[u8; 32]>,
+    num_clusters: Option<u32>,
+    ncluster_array_offset: Option<u32>,
+    num_subset_parts: Option<u32>,
+    nsubset_parts_array_offset: Option<u32>,
+    nmodem_supported: Option<u32>,
+    feature_code: Option<u32>,
+    pcode: Option<u32>,
+    oem_variant: Option<u32>,
+    boot_core: Option<u32>,
+    boot_cluster: Option<u32>,
+    num_func_clusters: Option<u32>,
+    raw_package_type: Option<u32>,
+    versions: KVec<Smem>,
+}
+
+struct SocInfo {
+    soc_info: socinfo,
+    soc_info_mem: Smem,
+    version_mem: Smem,
+    version_mem2: Option<Smem>,
+}
+
+impl SocInfo {
+    fn from_mem(
+        soc_info_mem: Smem,
+        version_mem: Smem,
+        version_mem2: Option<Smem>,
+        dev: &Device<Bound>,
+    ) -> Result<Self> {
+        Ok(Self {
+            soc_info: socinfo_from_partial_bytes(
+                soc_info_mem.access(dev).ok_or(error::code::EINVAL)?,
+            )?,
+            soc_info_mem,
+            version_mem,
+            version_mem2,
+        })
+    }
+    fn id(&self) -> u32 {
+        u32::from_le(self.soc_info.id)
+    }
+    fn version_split(ver: u32) -> (u16, u16) {
+        let major = (ver >> 16) as u16;
+        let minor = (ver & 0xFFFF) as u16;
+        (major, minor)
+    }
+    fn version_fuse(major: u16, minor: u16) -> u32 {
+        (u32::from(major) << 16) | u32::from(minor)
+    }
+    fn version(&self) -> (u16, u16) {
+        Self::version_split(self.soc_info.ver)
+    }
+    fn serial(&self) -> u32 {
+        u32::from_le(self.soc_info.serial_num)
+    }
+    fn machine(&self) -> Result<Option<CString>> {
+        for soc in SOC_IDS {
+            if soc.id == self.id() {
+                return Ok(Some(soc.name.to_cstring()?));
+            }
+        }
+        Ok(None)
+    }
+    fn soc_attributes(&self) -> Result<soc::Attributes> {
+        Ok(soc::Attributes {
+            family: Some(c_str!("Snapdragon").to_cstring()?),
+            machine: self.machine()?,
+            revision: Some(CString::try_from_fmt(fmt!(
+                "{}.{}",
+                self.version().0,
+                self.version().1
+            ))?),
+            serial_number: Some(CString::try_from_fmt(fmt!("{}", self.serial()))?),
+            soc_id: Some(CString::try_from_fmt(fmt!("{}", self.id()))?),
+        })
+    }
+}
+
+macro_rules! u32_le_versioned {
+    { $params:expr, $self:ident,
+        [ $( { $major:expr, $minor:expr, { $( $dst:ident: $src:ident ),* } } ),*  ] } => {$(
+        if $params.info_fmt >= SocInfo::version_fuse($major, $minor) {
+            $( $params.$dst = Some(u32::from_le($self.soc_info.$src).into()) );*
+        }
+    )*}
+}
+
+impl SocInfo {
+    fn build_params(self, dev: &Device<Bound>) -> Result<Params> {
+        let mut params = Params {
+            build_id: self.soc_info.build_id,
+            info_fmt: u32::from_le(self.soc_info.fmt),
+            ..Default::default()
+        };
+        u32_le_versioned! { params, self, [
+            {0, 2, { raw_version: raw_ver }},
+            {0, 3, { hardware_platform: hw_plat }},
+            {0, 4, { platform_version: plat_ver }},
+            {0, 5, { accessory_chip: accessory_chip }},
+            {0, 6, { hardware_platform_subtype: hw_plat_subtype }},
+            {0, 7, { pmic_model: pmic_model, pmic_die_rev: pmic_die_rev }},
+            {0, 9, { foundry_id: foundry_id }},
+            {0, 12, {
+                chip_family: chip_family,
+                raw_device_family: raw_device_family,
+                raw_device_number: raw_device_num
+            }},
+            {0, 13, { nproduct_id: nproduct_id }},
+            {0, 14, {
+                num_clusters: num_clusters,
+                ncluster_array_offset: ncluster_array_offset,
+                num_subset_parts: num_subset_parts,
+                nsubset_parts_array_offset: nsubset_parts_array_offset
+            }},
+            {0, 15, { nmodem_supported: nmodem_supported }},
+            {0, 16, { feature_code: feature_code, pcode: pcode }},
+            {0, 17, { oem_variant: oem_variant }},
+            {0, 19, {
+                boot_core: boot_core,
+                boot_cluster: boot_cluster,
+                num_func_clusters: num_func_clusters
+            }},
+            {0, 20, { raw_package_type: raw_package_type }}
+        ]};
+        if params.info_fmt >= SocInfo::version_fuse(0, 11) {
+            let offset = u32::from_le(self.soc_info.pmic_array_offset) as usize;
+            let num_pmics = u32::from_le(self.soc_info.num_pmics) as usize;
+            let mut pmic_model_array =
+                KVec::from_elem(PmicEntry::default(), num_pmics, GFP_KERNEL)?;
+            self.soc_info_mem
+                .access(dev)
+                .ok_or(error::code::EINVAL)?
+                .try_copy_to(pmic_model_array.as_bytes_mut(), offset)?;
+            params.pmic_model_array = Some(pmic_model_array);
+        }
+        if params.info_fmt >= SocInfo::version_fuse(0, 13) {
+            params.chip_id = Some(self.soc_info.chip_id);
+        }
+        load_versions(&mut params.versions, &self.version_mem)?;
+        if let Some(versions) = self.version_mem2.as_ref() {
+            load_versions(&mut params.versions, versions)?;
+        }
+        Ok(params)
+    }
+}
+
+fn load_versions(versions: &mut KVec<Smem>, mem: &Smem) -> Result<()> {
+    const IMAGE_SIZE: usize = core::mem::size_of::<ImageVersion>();
+    for offset in (0..mem.maxsize()).step_by(IMAGE_SIZE) {
+        if let Some(subrange) = mem.subrange(offset, IMAGE_SIZE) {
+            versions.push(subrange, GFP_KERNEL)?;
+        }
+    }
+    Ok(())
+}
+
+macro_rules! value_attrs {
+    ($builder:ident, $params:ident, @) => {};
+    ($builder:ident, $params:ident, @ $s:ident $($rest:tt)*) => {
+        if let Some(v) = $params.$s.as_ref() {
+            $builder.read_only_file(c_str!(stringify!($s)), v);
+        }
+        value_attrs!($builder, $params, @ $($rest)*)
+    };
+    ($builder:ident, $params:ident, @ {$s:ident, $cb:expr} $($rest:tt)*) => {
+        if let Some(v) = $params.$s.as_ref() {
+            $builder.read_callback_file(c_str!(stringify!($s)), v, $cb);
+        }
+        value_attrs!($builder, $params, @ $($rest)*)
+    };
+    ($builder:ident, $params:ident, {$($items:tt),*}) => {
+        value_attrs!($builder, $params, @ $($items)*)
+    };
+}
+
+fn no_quirk<const SIZE: usize>(buf: &[u8; SIZE], f: &mut Formatter<'_>) -> fmt::Result {
+    if buf[0] == 0 {
+        writeln!(f)
+    } else {
+        nul_array(buf, f)
+    }
+}
+
+fn nul_array<const SIZE: usize>(buf: &[u8; SIZE], f: &mut Formatter<'_>) -> fmt::Result {
+    if let Some(end) = buf.iter().position(|x| *x == 0) {
+        if end == 0 {
+            // Match original driver quirk - empty strings don't have a trailing newline
+            return Ok(());
+        }
+        let Ok(c_str) = CStr::from_bytes_with_nul(&buf[0..=end]) else {
+            pr_warn!("Creating CStr from bytes with known first NUL failed?");
+            return Ok(());
+        };
+        let Ok(str) = c_str.to_str() else {
+            pr_warn!("Non-unicode-compatible character in string");
+            return Ok(());
+        };
+        writeln!(f, "{str}")
+    } else {
+        writeln!(f, "Missing NUL: {buf:?}")
+    }
+}
+
+fn build_image_debugfs<'a>(dir: &ScopedDir<'a, '_>, image_name: &CStr, mem: &'a Mmio) {
+    let subdir = dir.dir(image_name);
+    subdir.read_callback_file(c_str!("name"), mem, &debug_name);
+    subdir.read_callback_file(c_str!("variant"), mem, &debug_variant);
+    subdir.read_callback_file(c_str!("oem"), mem, &debug_oem);
+}
+
+fn debug_name(mem: &Mmio, f: &mut Formatter<'_>) -> fmt::Result {
+    let mut iv = ImageVersion::default();
+    mem.try_copy_to(iv.as_bytes_mut(), 0)
+        .map_err(|_| fmt::Error)?;
+    nul_array(&iv.name, f)
+}
+
+fn debug_variant(mem: &Mmio, f: &mut Formatter<'_>) -> fmt::Result {
+    let mut iv = ImageVersion::default();
+    mem.try_copy_to(iv.as_bytes_mut(), 0)
+        .map_err(|_| fmt::Error)?;
+    nul_array(&iv.variant, f)
+}
+
+fn debug_oem(mem: &Mmio, f: &mut Formatter<'_>) -> fmt::Result {
+    let mut iv = ImageVersion::default();
+    mem.try_copy_to(iv.as_bytes_mut(), 0)
+        .map_err(|_| fmt::Error)?;
+    nul_array(&iv.oem, f)
+}
+
+fn hex(x: &u32, f: &mut Formatter<'_>) -> fmt::Result {
+    writeln!(f, "{x:#010x}")
+}
+
+impl Params {
+    fn build_debugfs<'data>(&'data self, dev: &'data Device<Bound>, dir: &ScopedDir<'data, '_>) {
+        dir.read_callback_file(c_str!("info_fmt"), &self.info_fmt, &hex);
+        dir.read_callback_file(c_str!("build_id"), &self.build_id, &no_quirk);
+        value_attrs!(dir, self, {
+            raw_version,
+            hardware_platform,
+            platform_version,
+            accessory_chip,
+            hardware_platform_subtype,
+            {raw_device_number, &hex},
+            {raw_device_family, &hex},
+            {chip_family, &hex},
+            {chip_id, &nul_array},
+            nproduct_id,
+            nsubset_parts_array_offset,
+            num_subset_parts,
+            ncluster_array_offset,
+            num_clusters,
+            nmodem_supported,
+            pcode,
+            feature_code,
+            oem_variant,
+            boot_core,
+            boot_cluster,
+            num_func_clusters,
+            foundry_id,
+            raw_package_type,
+            {pmic_model, &fmt_pmic_model},
+            {pmic_die_rev, &fmt_pmic_die_rev},
+            {pmic_model_array, &fmt_pmic_model_array}
+        });
+        for (version, name) in self.versions.iter().zip(IMAGE_NAMES.iter()) {
+            if let Some(version_mem) = version.access(dev) {
+                build_image_debugfs(dir, name, version_mem);
+            }
+        }
+    }
+}
+
+kernel::auxiliary_device_table! {
+    AUX_TABLE,
+    MODULE_AUX_TABLE,
+    <QcomSocInfo as auxiliary::Driver>::IdInfo,
+    [(auxiliary::DeviceId::new(c_str!("smem"), c_str!("qcom-socinfo")), ())]
+}
+
+impl auxiliary::Driver for QcomSocInfo {
+    type IdInfo = ();
+    const ID_TABLE: auxiliary::IdTable<Self::IdInfo> = &AUX_TABLE;
+    fn probe(dev: &auxiliary::Device<Core>, _id_info: &Self::IdInfo) -> impl PinInit<Self, Error> {
+        pin_init_scope(move || {
+            let soc_info_mem = Smem::get(
+                dev,
+                kernel::bindings::QCOM_SMEM_HOST_ANY,
+                kernel::bindings::SMEM_HW_SW_BUILD_ID,
+            )?;
+            let version_mem = Smem::get(
+                dev,
+                kernel::bindings::QCOM_SMEM_HOST_ANY,
+                bindings::SMEM_IMAGE_VERSION_TABLE,
+            )?;
+            let version_mem2 = Smem::get(
+                dev,
+                kernel::bindings::QCOM_SMEM_HOST_ANY,
+                bindings::SMEM_IMAGE_VERSION_TABLE_2,
+            )
+            .ok();
+            let base_dev = dev.as_ref();
+            let mem = soc_info_mem.access(base_dev).ok_or(error::code::EINVAL)?;
+
+            rand_from_mmio(mem)?;
+
+            let info = SocInfo::from_mem(soc_info_mem, version_mem, version_mem2, base_dev)?;
+            let attributes = info.soc_attributes()?;
+            let backing = info.build_params(base_dev)?;
+
+            Ok(try_pin_init!(Self {
+                registration <- soc::Registration::new(attributes),
+                params <- Devres::dir(base_dev, backing, c_str!("qcom_socinfo"),
+                                      Params::build_debugfs),
+            }? Error))
+        })
+    }
+}
+
+fn rand_from_mmio(mmio: &Mmio) -> Result<()> {
+    let mut buf: KVec<u8> = KVec::from_elem(0, mmio.maxsize(), GFP_KERNEL)?;
+    mmio.try_copy_to(&mut buf, 0)?;
+    kernel::random::add_device_randomness(&buf);
+    Ok(())
+}
diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
index f946e3beca215548ac56dbf779138d05479712f5..1c26f258be1fc1bf34bf3b0112c4a8472e676ed8 100644
--- a/include/linux/soc/qcom/smem.h
+++ b/include/linux/soc/qcom/smem.h
@@ -4,8 +4,12 @@
 
 #define QCOM_SMEM_HOST_ANY -1
 
+struct auxiliary_device;
+
 bool qcom_smem_is_available(void);
 int qcom_smem_alloc(unsigned host, unsigned item, size_t size);
+void *qcom_smem_get_aux(struct auxiliary_device *aux, unsigned int host,
+		unsigned int item, size_t *size);
 void *qcom_smem_get(unsigned host, unsigned item, size_t *size);
 
 int qcom_smem_get_free_space(unsigned host);
diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index d56343ca03979e345f8adb7eb8fd7f2b9d4be6ee..3398a8eff517b71c062fd3e52a4a7895526f64a1 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -72,3 +72,4 @@
 # We can't auto-derive AsBytes, as we need a const-time check to see if there
 # is padding involved. Add it explicitly when you expect no padding.
 --with-derive-custom-struct cpumask=AsBytesFfi
+--with-derive-custom-struct socinfo=AsBytesFfi
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 9fdf76ca630e00715503e2a3a809bedc895697fd..b076b847731d97cf345d8ef80df9c315a79c8fab 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -95,6 +95,12 @@
  */
 #include <../../drivers/base/base.h>
 
+#if IS_ENABLED(CONFIG_QCOM_SOCINFO)
+#include <dt-bindings/arm/qcom,ids.h>
+#include <linux/soc/qcom/smem.h>
+#include <linux/soc/qcom/socinfo.h>
+#endif
+
 #if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
 // Used by `#[export]` in `drivers/gpu/drm/drm_panic_qr.rs`.
 #include <drm/drm_panic.h>

-- 
2.53.0.rc2.204.g2597b5adb4-goog

