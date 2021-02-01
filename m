Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC5C30A08F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 04:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113D56E3E3;
	Mon,  1 Feb 2021 03:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 61A026E3E3
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 03:36:14 +0000 (UTC)
X-UUID: e206aecf62d047ebb74b72eeed204d99-20210201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=X9UJf+Dfvvey3eOlYKu/5iaho5HJZbcdIR3EG1y2gAM=; 
 b=b2wkwloe7K7YdrqgvCSes+mw5t1vQ+ZQsigdHfB0JFHljKp3UGDBtNHubOPRRdXg/p8barA0SO1ss9Ry+tPQnF3tTQ4JzS3eozTXr1Pch3tB+IWRiipolBF4LntWBUcMs0fshllFkWIOS0obB081xe9/k6sWJ5Wdw3kbQyhf2nI=;
X-UUID: e206aecf62d047ebb74b72eeed204d99-20210201
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2066249804; Mon, 01 Feb 2021 11:36:08 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 1 Feb 2021 11:36:06 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 1 Feb 2021 11:36:05 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] Fix EoTp flag
Date: Mon, 1 Feb 2021 11:36:01 +0800
Message-ID: <20210201033603.12616-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9A769A91630558C31E795C4AC43FDD8B316D8CB066EF2D651DAB3736ADEA3FFD2000:8
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes since v1:
 - Seperate the line time as single patch.

Jitao Shi (2):
  drm/mediatek: dsi: Fix EoTp flag
  drm/mediatek: dsi: fine tune the line time cause by EOTp

 drivers/gpu/drm/mediatek/mtk_dsi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.12.5
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
