Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A5283249D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 07:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D271010E972;
	Fri, 19 Jan 2024 06:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972B610E991
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 06:32:37 +0000 (UTC)
X-UUID: 8305655eb69411ee9e680517dc993faa-20240119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=z+415aCyhS8IhkpchW7BlN5Xto1S5/mHPUleRxDgbFY=; 
 b=Lz9Sm4/729cjYehzy8BCXyZWLxQ64p5jTxtTxYpSJDkPaCY/FvhgeQ1YsT9AZHSryJdX/ezdvyJyOlwv2d0jyeKfEC1LwODPj2emZPQPDXceMILl1e+bNpUx7PvwAkNjur56QkHitvHUmGmHq6a+y9cD0664cg19u+v7IXQ0W4U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36, REQID:e2db8d5c-b6a1-481f-8a7d-5b29a50585a8, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6e16cf4, CLOUDID:bc1c572f-1ab8-4133-9780-81938111c800,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8305655eb69411ee9e680517dc993faa-20240119
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 102036836; Fri, 19 Jan 2024 14:32:26 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 19 Jan 2024 14:32:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 19 Jan 2024 14:32:25 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
Subject: [PATCH v3 0/3] Add mediatek,
 gce-props.yaml for other bindings reference
Date: Fri, 19 Jan 2024 14:32:21 +0800
Message-ID: <20240119063224.29671-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
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
 Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

The property "mediatek,gce-events" is used for GCE event ID corresponding
to a hardware event signal sent by the hardware or a sofware driver.
If the mailbox providers or consumers want to manipulate the value of
the event ID, they need to know the specific event ID.

Since mediatek,gce-events property is used for both mailbox producers
and consumers, we add a mediatek,gce-props.yaml to place the common GCE
properties like mediatek,gce-events.

Change in v3:
1. Add more description and fix typo and grammar.
2. Fix $ref as full path.

Change in v2:
1. Add mediatek,gce-props.yaml for other binding reference.

Jason-JH.Lin (3):
  dt-bindings: mailbox: Add mediatek,gce-props.yaml
  dt-bindings: media: mediatek: mdp: Change mediatek,gce-events to
    reference
  dt-bindings: soc: mediatek: Change mediatek,gce-events to refernece

 .../bindings/mailbox/mediatek,gce-props.yaml  | 52 +++++++++++++++++++
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 11 ++--
 .../bindings/media/mediatek,mdp3-rsz.yaml     | 12 ++---
 .../bindings/media/mediatek,mdp3-wrot.yaml    | 12 ++---
 .../bindings/soc/mediatek/mediatek,ccorr.yaml | 12 ++---
 .../bindings/soc/mediatek/mediatek,mutex.yaml | 11 ++--
 .../bindings/soc/mediatek/mediatek,wdma.yaml  | 12 ++---
 7 files changed, 74 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml

-- 
2.18.0

