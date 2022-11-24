Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D66E637E87
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 18:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF3410E26B;
	Thu, 24 Nov 2022 17:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B41410E6B6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 08:54:55 +0000 (UTC)
X-UUID: e1b7fc8b92984f0fa217638546b67cf1-20221124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=81wfVrFGa0F5KGBMwUe92UrzpoG4Khjj+9dv7Pe3cgc=; 
 b=kB4Qv7ibiO9k/frbhoqa7DgVCF89awdOxRkSP2zROwQ2WicpCMu7e7TUfqHthkWqjsM+Kxw8awRbNs7YKMbS4UQpsI10ArRoJmotb+HXn+Z5kEp8f2HoBxLy/wwFVRF/fZuRl6+KKtn5EnLmrNl2UOnQLSAe2vcL4sSGeVxC5tU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:1fedf52b-3988-48a4-9aba-8a4b487942be, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:dcaaed0, CLOUDID:4df031f9-3a34-4838-abcf-dfedf9dd068e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e1b7fc8b92984f0fa217638546b67cf1-20221124
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 12059189; Thu, 24 Nov 2022 16:54:40 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 24 Nov 2022 16:54:38 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Thu, 24 Nov 2022 16:54:37 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <robert.foss@linaro.org>,
 <Laurent.pinchart@ideasonboard.com>, <kuninori.morimoto.gx@renesas.com>,
 <angelogioacchino.delregno@collabora.com>, <nfraprado@collabora.com>
Subject: [PATCH 0/3] ASoC: mediatek:mt8186: fix both the speaker and hdmi
Date: Thu, 24 Nov 2022 16:54:33 +0800
Message-ID: <20221124085436.24900-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Thu, 24 Nov 2022 17:47:02 +0000
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
Cc: alsa-devel@alsa-project.org, chunxu.li@mediatek.com,
 allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 ajye_huang@compal.corp-partner.google.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The speaker and hdmi of mt8186 platform are shared the same port of I2S,
when connect the external display, use build-in speakers to play audio,
they both playback at the same time. So we want to manage the playback
device through DAPM events.

Jiaxin Yu (3):
  drm: bridge: it6505: bridge to hdmi-codec
  ASoC: hdmi-codec: Add event handler for hdmi TX
  ASoC: mediatek: mt8186: correct the HDMI widgets

 drivers/gpu/drm/bridge/ite-it6505.c           | 36 +++++++++++++++---
 include/sound/hdmi-codec.h                    |  6 +++
 sound/soc/codecs/hdmi-codec.c                 | 37 +++++++++++++++++--
 .../mt8186/mt8186-mt6366-da7219-max98357.c    |  2 +-
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     |  2 +-
 5 files changed, 71 insertions(+), 12 deletions(-)

-- 
2.18.0

