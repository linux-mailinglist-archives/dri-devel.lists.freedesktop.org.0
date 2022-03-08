Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD86B4D1482
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 11:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6A710E209;
	Tue,  8 Mar 2022 10:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A600710E1CB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 10:14:33 +0000 (UTC)
X-UUID: c5853019733c4ed0bf304fe0ce6cdf1c-20220308
X-UUID: c5853019733c4ed0bf304fe0ce6cdf1c-20220308
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1002038922; Tue, 08 Mar 2022 18:14:27 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Mar 2022 18:14:26 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Mar 2022 18:14:25 +0800
Message-ID: <9e3cd215a2f771236855bdb2f5faa172dcbd1aec.camel@mediatek.com>
Subject: Re: [PATCH v2, 0/4] Cooperate with DSI RX devices to modify dsi
 funcs and delay mipi high to cooperate with panel sequence
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
Date: Tue, 8 Mar 2022 18:14:40 +0800
In-Reply-To: <87lexq2aw4.fsf@intel.com>
References: <1646388956-8033-1-git-send-email-xinlei.lee@mediatek.com>
 <87lexq2aw4.fsf@intel.com>
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
Cc: jitao.shi@mediatek.com, allen-kh.cheng@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-03-04 at 13:51 +0200, Jani Nikula wrote:
> Please also prefix cover letters with drm/mediatek if that's the only
> place you're touching.
> 
> BR,
> Jani.
> 
> 
> On Fri, 04 Mar 2022, <xinlei.lee@mediatek.com> wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > In upstream-v5.8, dsi_enable will operate panel_enable, but this
> > modification has been moved in v5.9. In order to ensure the timing
> > of
> > dsi_power_on/off and the timing of pulling up/down the MIPI signal,
> > the modification of v5.9 is synchronized in this series of patches.
> > 
> > Changes since v1:
> > 1. Dsi sequence marked with patch adjustment
> > 2. Fixes: mtk_dsi: Use the drm_panel_bridge
> > 
> > Jitao Shi (3):
> >   drm/mediatek: Adjust the timing of mipi signal from LP00 to LP11
> >   drm/mediatek: Separate poweron/poweroff from enable/disable and
> > define
> >     new funcs
> >   drm/mediatek: keep dsi as LP00 before dcs cmds transfer
> > 
> > Xinlei Lee (1):
> >   drm/mediatek: Add pull-down MIPI operation in mtk_dsi_poweroff
> >     function
> > 
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 73 ++++++++++++++++++++----
> > ------
> >  1 file changed, 49 insertions(+), 24 deletions(-)
> 
> 

Hi Jani:

Thanks for your review.
Is your suggestion for me to put the fix id on the cover ?

Best Regards!
xinlei



