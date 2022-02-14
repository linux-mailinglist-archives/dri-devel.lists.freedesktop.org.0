Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E433C4B3F8E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 03:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF5110E1A5;
	Mon, 14 Feb 2022 02:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C91510E1A5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 02:32:15 +0000 (UTC)
X-UUID: 5634885e033f4b2ba8bad653b3e2e193-20220214
X-UUID: 5634885e033f4b2ba8bad653b3e2e193-20220214
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1241168833; Mon, 14 Feb 2022 10:32:09 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 14 Feb 2022 10:32:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 10:32:09 +0800
Message-ID: <9295cbd918d1303f5cc2bbb7defb94d5e338606d.camel@mediatek.com>
Subject: Re: [0/3] Cooperate with DSI RX devices to modify dsi funcs and
 delay mipi high to cooperate with panel sequence
From: CK Hu <ck.hu@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
Date: Mon, 14 Feb 2022 10:32:09 +0800
In-Reply-To: <1644589818-13066-1-git-send-email-xinlei.lee@mediatek.com>
References: <1644589818-13066-1-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Xinlei:

On Fri, 2022-02-11 at 22:30 +0800, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> In order to match the changes of DSI RX devices (for example,
> anx7625), 
> the poweron/poweroff of dsi is extracted from enable/disable and 
> defined as new funcs (pre_enable/post_disable).
> 
> The delayed MIPI signal is pulled high from LP00 to LP11, 
> in order to match the power-on sequence of the panel.

This is series a bug-fix or new feature (If anx7625 has never work in
upstream and this series would make support anx7625, this is new
feature) If this is a bug-fix, add Fixes tag [1] in patches.

[1] 
https://www.kernel.org/doc/html/v5.16/process/submitting-patches.html

Regards,
CK

> 
> Jitao Shi (3):
>   drm/mediatek: dsi fine tune the dsi poweron flow
>   drm/mediatek: dsi bridge implement pre_enable and post_disable
>   drm/mediatek: keep dsi as LP00 before dcs cmds transfer
> 
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 73 +++++++++++++++++++++++++---
> ----------
>  1 file changed, 49 insertions(+), 24 deletions(-)
> 

