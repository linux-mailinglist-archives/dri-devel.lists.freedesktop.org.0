Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34613218066
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142086E884;
	Wed,  8 Jul 2020 07:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id B4EF16E225
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 15:46:35 +0000 (UTC)
X-UUID: 74bb7f4f8a944a41bdd876d7a55ca644-20200707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=KMWcgcPL1XjMD/Va1W+LCp1J+xXGTJ5bSqx6Wn/nPUA=; 
 b=cXHGGEDqx59+r2LSl0F5kJuTyeyqdu1jsUIwwX3006c2f6SqatMaXkkcaSuKEJBYt8d4vrPqXo0thCVIqBLFGCLR7/SSOafx1kCcgrXSLVIwMP4MmQ8zb8J/rfgCxdL+fxrGiZqa2E9r5Jdrw+c1++UP8jw61aR+cQzZvU2bm2c=;
X-UUID: 74bb7f4f8a944a41bdd876d7a55ca644-20200707
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1677902217; Tue, 07 Jul 2020 23:46:28 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 23:46:23 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 7 Jul 2020 23:46:23 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Bibby Hsieh
 <bibby.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>
Subject: [PATCH v3 0/9] support cmdq helper function on mt6779 platform
Date: Tue, 7 Jul 2020 23:45:05 +0800
Message-ID: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch support more gce helper function on mt6779 platform.

depends on patch: support gce on mt6779 platform

and depends on following applied patches
soc: mediatek: cmdq: add set event function
soc: mediatek: cmdq: export finalize function
soc: mediatek: cmdq: add assign function

Change since v2:
- Keep behavior in drm crtc driver and
  separate bug fix code into another patch.

Change since v1:
- Rename cmdq_mbox_shift() to cmdq_get_shift_pa().


Dennis YC Hsieh (9):
  soc: mediatek: cmdq: add address shift in jump
  soc: mediatek: cmdq: add write_s function
  soc: mediatek: cmdq: add write_s_mask function
  soc: mediatek: cmdq: add read_s function
  soc: mediatek: cmdq: add write_s value function
  soc: mediatek: cmdq: add write_s_mask value function
  soc: mediatek: cmdq: add jump function
  soc: mediatek: cmdq: add clear option in cmdq_pkt_wfe api
  drm/mediatek: reduce clear event

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |   2 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 113 ++++++++++++++++++++++-
 include/linux/mailbox/mtk-cmdq-mailbox.h |   6 +-
 include/linux/soc/mediatek/mtk-cmdq.h    |  93 ++++++++++++++++++-
 4 files changed, 206 insertions(+), 8 deletions(-)

-- 
2.18.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
