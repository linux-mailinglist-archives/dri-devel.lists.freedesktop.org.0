Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C744918AAB4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 03:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831916E0B7;
	Thu, 19 Mar 2020 02:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Thu, 19 Mar 2020 02:33:24 UTC
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 944F46E0B7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 02:33:23 +0000 (UTC)
X-UUID: 0ffedd1dfcee46b48654710ba4286530-20200319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID;
 bh=ZjMX+7xVGwyxaN8g3c7u6vzV75JbHB1dkDLFcT9779A=; 
 b=V+Z7V3jmkIcDrqYwHlaH/0VUwIhntFNWs5QixLkcePUzOgPZVS80dujXDfpaIOCyq4e08cW5NC72T5nKWuvUtBMJFaz0k1MnBm4w+Xm9zrHbTAPnXi9FCESX2alSebsKVb2WC4FRa+H4PKVTkdSJsPeo+8HGmK8VvGjzWwGSuuU=;
X-UUID: 0ffedd1dfcee46b48654710ba4286530-20200319
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1306139929; Thu, 19 Mar 2020 09:18:05 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS33DR.mediatek.inc (172.27.6.106) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Mar 2020 09:17:23 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 19 Mar 2020 09:17:23 +0800
Message-ID: <1584580683.29614.5.camel@mtksdaap41>
Subject: [GIT PULL] mediatek drm next for 5.7
From: CK Hu <ck.hu@mediatek.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, 
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 19 Mar 2020 09:18:03 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0D2F63A9CFFBB744500B527E47EF66C1D04286D5F7550FC4B2C7A35BED8356EA2000:8
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
Cc: Jitao Shi <jitao.shi@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This include MT8183 DPI support.
And I change my email address to "Chun-Kuang Hu
<chunkuang.hu@kernel.org>", so I would use it afterward.

Regards,
CK


The following changes since commit
bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  https://github.com/ckhu-mediatek/linux.git-tags.git
tags/mediatek-drm-next-5.7

for you to fetch changes up to 93e97f715b24114169d18654e09c646fd9e14979:

  MAINTAINERS: Update Chun-Kuang Hu's email address (2020-03-09 09:23:47
+0800)

----------------------------------------------------------------
Mediatek DRM Next for Linux 5.7

----------------------------------------------------------------
Chun-Kuang Hu (1):
      MAINTAINERS: Update Chun-Kuang Hu's email address

Jitao Shi (2):
      dt-bindings: display: mediatek: update dpi supported chips
      drm/mediatek: add mt8183 dpi clock factor

 .../bindings/display/mediatek/mediatek,dpi.txt         |  1 +
 MAINTAINERS                                            |  2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                     | 18
++++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
