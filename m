Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8F2839E09
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 02:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E542F10F4BC;
	Wed, 24 Jan 2024 01:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CAF10F4BC
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 01:15:07 +0000 (UTC)
X-UUID: ffbfa9e6ba5511ee9e680517dc993faa-20240124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RMIo1guccMFVDfkHmK7frFW/6/qfxStJTqou8qVMu6o=; 
 b=g2+v/KPHws3QB5H5WYltqUzOAP9CiTse+XwvpmG1taYDPuyf+ZQ2rJJTOucluDF36ItrNifqfrp5RcQtUFi+2U1zfE0gkd/IifoAfoyDzGV7xwXSOOGyIk2eR3empAOcH5EcAUvFNpuEpuUpghW7VoT5FKXM/R2GvkENUob89RU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36, REQID:3a12a735-c1c4-4498-99bb-8fa85966b2e8, IP:0,
 U
 RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:6e16cf4, CLOUDID:a17813fe-c16b-4159-a099-3b9d0558e447,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ffbfa9e6ba5511ee9e680517dc993faa-20240124
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 940778163; Wed, 24 Jan 2024 09:15:02 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 24 Jan 2024 09:15:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 24 Jan 2024 09:15:00 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
Subject: [PATCH v4 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
Date: Wed, 24 Jan 2024 09:14:57 +0800
Message-ID: <20240124011459.12204-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
References: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fei Shao <fshao@chromium.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add mediatek,gce-props.yaml for common GCE properties that is used for
both mailbox providers and consumers. We place the common property
"mediatek,gce-events" in this binding currently.

The property "mediatek,gce-events" is used for GCE event ID corresponding
to a hardware event signal sent by the hardware or a software driver.
If the mailbox providers or consumers want to manipulate the value of
the event ID, they need to know the specific event ID.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/mailbox/mediatek,gce-props.yaml  | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
new file mode 100644
index 000000000000..c25eed4606fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/mediatek,gce-props.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Global Command Engine Common Properties
+
+maintainers:
+  - Houlong Wei <houlong.wei@mediatek.com>
+
+description:
+  The Global Command Engine (GCE) is an instruction based, multi-threaded,
+  single-core command dispatcher for MediaTek hardware. The Command Queue
+  (CMDQ) mailbox driver is a driver for GCE, implemented using the Linux
+  mailbox framework. It is used to receive messages from mailbox consumers
+  and configure GCE to execute the specified instruction set in the message.
+  We use mediatek,gce-mailbox.yaml to define the properties for CMDQ mailbox
+  driver. A device driver that uses the CMDQ driver to configure its hardware
+  registers is a mailbox consumer. The mailbox consumer can request a mailbox
+  channel corresponding to a GCE hardware thread to send a message, specifying
+  that the GCE thread to configure its hardware. The mailbox provider can also
+  reserve a mailbox channel to configure GCE hardware register by the specific
+  GCE thread. This binding defines the common GCE properties for both mailbox
+  provider and consumers.
+
+properties:
+  mediatek,gce-events:
+    description:
+      GCE has an event table in SRAM, consisting of 1024 event IDs (0~1023).
+      Each event ID has a boolean event value with the default value 0.
+      The property mediatek,gce-events is used to obtain the event IDs.
+      Some gce-events are hardware-bound and cannot be changed by software.
+      For instance, in MT8195, when VDO0_MUTEX is stream done, VDO_MUTEX will
+      send an event signal to GCE, setting the value of event ID 597 to 1.
+      Similarly, in MT8188, the value of event ID 574 will be set to 1 when
+      VOD0_MUTEX is stream done.
+      On the other hand, some gce-events are not hardware-bound and can be
+      changed by software. For example, in MT8188, we can set the value of
+      event ID 855, which is not bound to any hardware, to 1 when the driver
+      in the secure world completes a task. However, in MT8195, event ID 855
+      is already bound to VDEC_LAT1, so we need to select another event ID to
+      achieve the same purpose. This event ID can be any ID that is not bound
+      to any hardware and is not yet used in any software driver.
+      To determine if the event ID is bound to the hardware or used by a
+      software driver, refer to the GCE header
+      include/dt-bindings/gce/<chip>-gce.h of each chip.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 32
+
+additionalProperties: true
-- 
2.18.0

