Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBlgM3PWqmn3XQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:28:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856CB221972
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A4D10ED3B;
	Fri,  6 Mar 2026 13:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AED10ED39
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 13:28:15 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2805820010A;
 Fri,  6 Mar 2026 14:28:14 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0A3CB2000F2;
 Fri,  6 Mar 2026 14:28:14 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com
 [10.162.246.145])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 932C520270;
 Fri,  6 Mar 2026 14:28:12 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Fri, 06 Mar 2026 15:27:26 +0200
Subject: [PATCH v2 9/9] arm64: dts: imx95: Add Neutron node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-neutron-v2-9-3019bd8c91ef@nxp.com>
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
In-Reply-To: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772803681; l=1721;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=5zOyy+AMeXBPkio/p9NoYrjyHvyyen4DLCE4ay6mQVI=;
 b=19SjmLRX/9Q516pJ+/gR8uJNtcM+iHTVCL+RnzhTJedKl/ISz9Jw+WnRgi8WmfTiH85LemNGZ
 yWz8j+uOTBFDdlgpFRf5eQCHSpHMIpfNu7FS56FxJG24iNwnrjqyKLs
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
X-Rspamd-Queue-Id: 856CB221972
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:Frank.Li@nxp.com,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:jiwei.fu@nxp.com,m:xuelin.shi@nxp.com,m:alexandru.taran@nxp.com,m:daniel.baluta@nxp.com,m:ruxandra.radulescu@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
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
	NEURAL_HAM(-0.00)[-0.959];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4ab00000:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:mid,nxp.com:email,204c0000:email,4e090dc0:email]
X-Rspamd-Action: no action

Add the node for Neutron NPU. Also add a reserved memory region
for allocating Neutron buffers, which have a 1MB alignment
constraint.

Signed-off-by: Jiwei Fu <jiwei.fu@nxp.com>
Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
v2: Match changes in dt bindings
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 55e2da094c88..1c6865a8d482 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -336,6 +336,19 @@ sram1: sram@204c0000 {
 		#size-cells = <1>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		neutron_pool: neutron-pool {
+			compatible = "shared-dma-pool";
+			size = <0x0 0x8000000>;
+			alignment = <0x0 0x100000>;
+			reusable;
+		};
+	};
+
 	firmware {
 		scmi {
 			compatible = "arm,scmi";
@@ -2181,5 +2194,20 @@ ddr-pmu@4e090dc0 {
 			reg = <0x0 0x4e090dc0 0x0 0x200>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		neutron: npu@4ab00000 {
+			compatible = "nxp,imx95-neutron";
+			reg = <0x0 0x4ab00000 0x0 0x00000400>,
+			      <0x0 0x4ab10000 0x0 0x00010000>,
+			      <0x0 0x4ab08000 0x0 0x00008000>;
+			reg-names = "regs", "itcm", "dtcm";
+			memory-region = <&neutron_pool>;
+			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX95_CLK_NPU>,
+				 <&scmi_clk IMX95_CLK_NPUAPB>;
+			clock-names = "core", "apb";
+			power-domains = <&scmi_devpd IMX95_PD_NPU>;
+			iommus = <&smmu 0xd>;
+		};
 	};
 };

-- 
2.34.1

