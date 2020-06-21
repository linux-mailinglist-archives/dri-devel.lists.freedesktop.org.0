Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F225B203048
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CB76E5C0;
	Mon, 22 Jun 2020 07:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0587E6E06B
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 14:18:42 +0000 (UTC)
X-UUID: e9bb55b6b7d84314ad0597bc41818436-20200621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=qVgjYAF9HH+u1fTquUk95ZdNXJ4MuniYtTz3ClruoAk=; 
 b=gcC5RzbTjv+Bm5BBFFx+rNMzLyOxMip5MTahJAurRzn2rQVanAc2Iki5WwT2qjxLJDj5n7fPKR18Vhpqp8RFrirnGix99or82fyR1MfrQP5Xm/OqTF26ALt2dUqDHlAu0vhnpwriBHIhESLnVVPmH72P/PqW0y9WUuvoLGXnt7c=;
X-UUID: e9bb55b6b7d84314ad0597bc41818436-20200621
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1819669271; Sun, 21 Jun 2020 22:18:38 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 21 Jun 2020 22:18:28 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 21 Jun 2020 22:18:29 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Bibby Hsieh
 <bibby.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>
Subject: [PATCH v1 0/11] support cmdq helper function on mt6779 platform
Date: Sun, 21 Jun 2020 22:18:24 +0800
Message-ID: <1592749115-24158-1-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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

This patch support cmdq helper function on mt6779 platform,
based on "support gce on mt6779 platform" patchset.


Dennis YC Hsieh (11):
  soc: mediatek: cmdq: add address shift in jump
  soc: mediatek: cmdq: add assign function
  soc: mediatek: cmdq: add write_s function
  soc: mediatek: cmdq: add write_s_mask function
  soc: mediatek: cmdq: add read_s function
  soc: mediatek: cmdq: add write_s value function
  soc: mediatek: cmdq: add write_s_mask value function
  soc: mediatek: cmdq: export finalize function
  soc: mediatek: cmdq: add jump function
  soc: mediatek: cmdq: add clear option in cmdq_pkt_wfe api
  soc: mediatek: cmdq: add set event function

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |   3 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 159 +++++++++++++++++++++--
 include/linux/mailbox/mtk-cmdq-mailbox.h |   8 +-
 include/linux/soc/mediatek/mtk-cmdq.h    | 124 +++++++++++++++++-
 4 files changed, 280 insertions(+), 14 deletions(-)

-- 
2.18.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
