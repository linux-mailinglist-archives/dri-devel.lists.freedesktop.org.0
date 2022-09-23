Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A63C85E76F8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 11:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D1B10E7E0;
	Fri, 23 Sep 2022 09:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DD910E7EC
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 09:27:19 +0000 (UTC)
X-UUID: 058723b74c7c4d35b6c0f857b630860b-20220923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=v/qG9fxATKm3vUoRKPm9Tz2iucvTSL2B8IYNIBhPiA4=; 
 b=uM1Rk9KD8gHjoRtSpCyXAib+HYf0uoSYKY+M/ea+bpx+Pp8rQMZ9yr7PUJeKV5vyixrPBRylgI23hdlat1O1kFbkulxDp/p8Ss9Bfbs7NwY9iBMH9IbLVFwaKXiKF19g9vO3N9MwBjqQpXh+9Qtp3UeFKkPpHNeeX01VoNYdXKQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:b31b0cdd-0fae-427d-9d9e-01526a4440ea, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:fb6bcc06-1cee-4c38-b21b-a45f9682fdc0,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 058723b74c7c4d35b6c0f857b630860b-20220923
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 438802110; Fri, 23 Sep 2022 17:27:15 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 23 Sep 2022 17:27:13 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 23 Sep 2022 17:27:13 +0800
Message-ID: <95bcba12c6dbcffdcf5256f8836eeb16425dd1c5.camel@mediatek.com>
Subject: Re: [PATCH v9,0/3] Add dpi output format control for MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <matthias.bgg@gmail.com>, <jason-jh.lin@mediatek.com>,
 <rex-bc.chen@mediatek.com>, <ck.hu@mediatek.com>, <p.zabel@pengutronix.de>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
Date: Fri, 23 Sep 2022 17:27:13 +0800
In-Reply-To: <b11fec5e-0725-be3c-4b4b-0e68bf00c10d@collabora.com>
References: <1663922440-20242-1-git-send-email-xinlei.lee@mediatek.com>
 <b11fec5e-0725-be3c-4b4b-0e68bf00c10d@collabora.com>
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-09-23 at 11:19 +0200, AngeloGioacchino Del Regno wrote:
> Il 23/09/22 10:40, xinlei.lee@mediatek.com ha scritto:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Base on the branch of ck-linux-next/mediatek-drm-fixes.
> > 
> 
> Hello Xinlei,
> 
> I've reviewed v8 just some minutes before you pushed this v9.
> 
> Can you please make the requested changes from v8 on patch [2/3] and
> push a v10 retaining the Reviewed-by tags that I released on v8?
> 
> Thanks,
> Angelo
> 
> 
Hi Angelo:

Thanks for your review.

I will add your Reviewed-by tag in v10 and move the position of the
member variable.

Best Regards!
Xinlei

