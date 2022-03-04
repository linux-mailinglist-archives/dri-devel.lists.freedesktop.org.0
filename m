Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E12D4CD1AF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 10:55:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A26210E481;
	Fri,  4 Mar 2022 09:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C4E10E48D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 09:55:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B18E11F46483
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646387703;
 bh=EfrLQeiJMUy4oMQI58UrAdjbGw+ADzKMI7I2grHoz4M=;
 h=From:To:Cc:Subject:Date:From;
 b=LJuRzerx/ge7QtwE1iuUcucq6QplNy5celhG3oIai0DzzGpXlLqI/R0DQlelkg3nz
 BnbC5PXT2XvUCdjrgyhE3M60uVU85X5rg6GSOLu7MXsCeqFs/QCY7rVhv7geTHc+GF
 c/+2NUH4XSyIeK+TwD8p9u/RWCYMN9246caOp5e1uyU0Oyisba04A5lm/ZFJbTpvXQ
 uWOF09ZcwSVxxoSSkMxgKq9q2oOocWInIhklbyR+S1KvHGntFoiYcEU2hd4kp8AxV/
 y+671YfAqPE5EnJlthsSaUSMnYcgcPZSQX/tw99UorcH1mcAEVOy8Crq9aneJjKxt0
 dj9rPtk84IMiQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 0/3] Fix MediaTek display dt-bindings issues
Date: Fri,  4 Mar 2022 10:54:55 +0100
Message-Id: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
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
Cc: devicetree@vger.kernel.org, jitao.shi@mediatek.com,
 krzysztof.kozlowski@canonical.com, airlied@linux.ie, jason-jh.lin@mediatek.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vdosys0 series carried a nice dt-bindings conversion of the old
txt documentation for the entire mediatek-drm driver, but some of
the issues in there weren't seen.

This series is fixing all of the issues pointed out by a
`dt_binding_check` run, followed by `dtbs_check`.

AngeloGioacchino Del Regno (3):
  dt-bindings: display: mediatek,mutex: Fix mediatek,gce-events type
  dt-bindings: display: mediatek,ovl: Fix 'iommu' required property typo
  dt-bindings: display: mediatek: Fix examples on new bindings

 .../display/mediatek/mediatek,aal.yaml        | 24 +++--
 .../display/mediatek/mediatek,ccorr.yaml      | 23 +++--
 .../display/mediatek/mediatek,color.yaml      | 23 +++--
 .../display/mediatek/mediatek,dither.yaml     | 23 +++--
 .../display/mediatek/mediatek,dpi.yaml        |  3 +-
 .../display/mediatek/mediatek,dsc.yaml        | 23 +++--
 .../display/mediatek/mediatek,ethdr.yaml      | 99 ++++++++++---------
 .../display/mediatek/mediatek,gamma.yaml      | 23 +++--
 .../display/mediatek/mediatek,merge.yaml      | 49 +++++----
 .../display/mediatek/mediatek,mutex.yaml      | 27 +++--
 .../display/mediatek/mediatek,od.yaml         | 14 ++-
 .../display/mediatek/mediatek,ovl-2l.yaml     | 26 +++--
 .../display/mediatek/mediatek,ovl.yaml        | 28 ++++--
 .../display/mediatek/mediatek,postmask.yaml   | 23 +++--
 .../display/mediatek/mediatek,rdma.yaml       | 28 ++++--
 .../display/mediatek/mediatek,split.yaml      | 17 +++-
 .../display/mediatek/mediatek,ufoe.yaml       | 19 ++--
 .../display/mediatek/mediatek,wdma.yaml       | 26 +++--
 18 files changed, 318 insertions(+), 180 deletions(-)

-- 
2.35.1

