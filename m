Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAySLN1OoGmIiAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:47:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151271A6E64
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2DC10E936;
	Thu, 26 Feb 2026 13:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFFF10E934
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 13:47:03 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6231F202549;
 Thu, 26 Feb 2026 14:41:00 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 28BDC202C27;
 Thu, 26 Feb 2026 14:41:00 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com
 [10.162.246.145])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 6EDD020376;
 Thu, 26 Feb 2026 14:40:58 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Thu, 26 Feb 2026 15:40:41 +0200
Subject: [PATCH 2/9] accel/neutron: Add documentation for NXP Neutron
 accelerator driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-neutron-v1-2-46eccb3bb50a@nxp.com>
References: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
In-Reply-To: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772113256; l=7020;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=70OP0Dj1Z9Nhg2uTfcWxmjST7VKQFl9/cXvxpjdBVks=;
 b=8snYNlqD0ArdowhVMHi4fky8m1s3uu2Sgmh8z+MCPxBpHYyxaM/jPPavdv2oTxe3/SS+vrOs2
 KGH+5xMQ5zNDdOXXUoc9yvcYl3RvMBDTlrafP7LIw3aSly+FkLo3DO5
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP
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
X-Spamd-Result: default: False [0.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:jiwei.fu@nxp.com,m:xuelin.shi@nxp.com,m:alexandru.taran@nxp.com,m:ruxandra.radulescu@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ruxandra.radulescu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ruxandra.radulescu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-0.981];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:url,nxp.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,i.mx:url]
X-Rspamd-Queue-Id: 151271A6E64
X-Rspamd-Action: no action

Neutron is NXP's Neural Processing Unit (NPU) and it's integrated on
the i.MX95 SoC. It is capable of running inferences on a large range
of ML models and targets edge AI applications.

Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
 Documentation/accel/index.rst           |   1 +
 Documentation/accel/neutron/index.rst   |  12 +++
 Documentation/accel/neutron/neutron.rst | 131 ++++++++++++++++++++++++++++++++
 3 files changed, 144 insertions(+)

diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
index cbc7d4c3876a..dbe177074739 100644
--- a/Documentation/accel/index.rst
+++ b/Documentation/accel/index.rst
@@ -9,5 +9,6 @@ Compute Accelerators
 
    introduction
    amdxdna/index
+   neutron/index
    qaic/index
    rocket/index
diff --git a/Documentation/accel/neutron/index.rst b/Documentation/accel/neutron/index.rst
new file mode 100644
index 000000000000..8f15346d16c7
--- /dev/null
+++ b/Documentation/accel/neutron/index.rst
@@ -0,0 +1,12 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+==========================
+ accel/neutron NPU driver
+==========================
+
+The accel/neutron driver supports the Neutron NPU (Neural Processing Unit)
+from NXP.
+
+.. toctree::
+
+   neutron
diff --git a/Documentation/accel/neutron/neutron.rst b/Documentation/accel/neutron/neutron.rst
new file mode 100644
index 000000000000..c5066d53ce69
--- /dev/null
+++ b/Documentation/accel/neutron/neutron.rst
@@ -0,0 +1,131 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+.. include:: <isonum.txt>
+
+====================
+ Neutron NPU Driver
+====================
+
+:Copyright: |copy| 2026 NXP
+
+Overview
+========
+
+Neutron is NXP's eIQ Neutron Neural Processing Unit (NPU). It is a highly
+scalable, power-efficient machine learning accelerator targeting quantized
+ML models for edge AI applications. Neutron is integrated into i.MX95 and
+other NXP platforms.
+
+A more detailed description of Neutron NPU and usage scenarios can be
+found at [1]_.
+
+Hardware Description
+====================
+
+Neutron has the following hardware components:
+
+- RISC-V core: this is the "brain" of the Neutron NPU. It runs a proprietary
+  firmware responsible for programming registers, processing commands and
+  managing the other hardware components
+- one or more Neutron cores: the main computation engine performing Machine
+  Learning (ML) operations
+- TCM: a dedicated fast memory
+- Data Mover: a DMA engine that handles data transfers between system memory
+  and Neutron's internal memory
+
+Software Stack
+==============
+
+The following software components are required for running an inference
+on the Neutron accelerator:
+
+- Neutron converter [2]_, [3]_: this is an offline tool that converts models
+  from standard TFLite (LiteRT) format to a custom format for execution on the
+  Neutron NPU;
+- An inference engine, e.g. LiteRT's XNNPack, which in turn uses
+- A LiteRT custom delegate [4]_ to dispatch custom operators to Neutron NPU;
+- A userspace library [5]_ that the delegate links to, which wraps IOCTLs
+  to the kernel driver in a higher-level API. It handles microcode, weights
+  and kernels preparation and base address computations needed by the NPU for
+  job execution. It also triggers cache syncs when required;
+- The Neutron kernel driver, which handles device initialization and
+  communicates directly with the Neutron firmware;
+- Neutron firmware [5]_, a proprietary firmware that executes on the RISC-V
+  core and directly drives the execution of the NPU hardware.
+
+Usage Flow
+==========
+
+This section describes the steps required to run an inference job on the
+Neutron NPU.
+
+Offline Conversion
+------------------
+
+The first step is to convert a standard TFLite model using the Neutron
+converter. Supported standard operators are extracted together and mapped
+to one or multiple **NeutronGraph** custom operators in the converted model.
+Standard operators that are not supported by the NPU are left unchanged and
+will be executed on the CPU.
+
+Runtime Flow
+------------
+
+On the platform's Cortex-A cores running Linux, the LiteRT inference engine
+is responsible for loading the ML model, pre-processing the input data and
+handing over the tensor computation to the NPU via the custom delegate.
+
+The inference engine can be exercised via one of the standard TFLite tools
+(e.g. benchmark_model, label_image, etc) or via any custom application that
+uses the LiteRT runtime API.
+
+When preparing to run an inference job, userspace requests a memory buffer
+from the kernel driver. It loads both the model and the input data in the
+buffer, while also reserving a section for the inference output. It then
+issues a job submission command with the prepared buffer and waits for
+completion.
+
+The kernel driver sends the inference job details to the Neutron firmware
+via mailbox registers. The NPU executes the inference and issues an interrupt
+to the Linux core once it is finished. The driver in return marks the job
+as complete so userspace can access and post-process the output.
+
+Boot Sequence
+=============
+
+The Neutron driver is responsible for loading the firmware image and
+initiating the NPU boot sequence. The device is powered down during suspend
+and each resume operation implies running the firmware load and boot sequence
+again.
+
+Hardware Constraints
+====================
+
+Cache Coherency
+---------------
+
+Some of the NXP platforms that Neutron is integrated on, including i.MX95,
+do not ensure Neutron memory coherency at hardware level, generating the
+need for explicit DMA sync operations. Given that only parts of the memory
+buffer may require syncing at any given time (e.g. multiple inferences using
+the same model but different input data) and that the kernel driver is unaware
+of the buffer partitioning, the sync operations are driven from userspace.
+
+Buffer alignment
+----------------
+
+The Neutron DMA engine requires the inference buffers to be aligned to 1MB
+boundary. We allocate buffers for Neutron NPU from a reserved CMA pool that
+satisfies this alignment requirement.
+
+References
+==========
+
+.. [1] i.MX Machine Learning User's Guide: https://www.nxp.com/docs/en/user-guide/UG10166.pdf
+.. [2] Neutron Converter binary and User Guide available for download here:
+       https://www.nxp.com/design/design-center/software/eiq-ai-development-environment/eiq-toolkit-for-end-to-end-model-development-and-deployment:EIQ-TOOLKIT
+.. [3] NXP's eIQ PyPi repository: https://eiq.nxp.com/repository/eiq-neutron-sdk/
+.. [4] TFLite delegate source code: https://github.com/nxp-imx/tflite-neutron-delegate
+.. [5] Neutron firmware, library and TFLite delegate available here as binaries:
+       https://github.com/nxp-upstream/neutron/tree/upstream
+

-- 
2.34.1

