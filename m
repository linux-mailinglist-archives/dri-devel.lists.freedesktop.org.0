Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD3E117D21
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 02:24:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC776E5A2;
	Tue, 10 Dec 2019 01:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F6986E5A2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 01:24:42 +0000 (UTC)
X-UUID: fbdde645f9ff44fdae3a6e96192052c8-20191210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uS+vnIodKcC3nYeOH364CYiGDOfQNtI3mPSCouI1v0o=; 
 b=gcPpE+/50n18No5AZmiEkd3C3cSllzyT7fYi6K8YFsPoZyqwFQ8VQr1H2plHvwffV2EGBag/Cckd/SwXSWTBqGaote7w/Hq4JfhE4QZKBaowDBMJh227YsKXJyFTZK0F1urZXGKKCvxMLNQOL8qPlpg9/UyM1RanJjrOPlNzus4=;
X-UUID: fbdde645f9ff44fdae3a6e96192052c8-20191210
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1852598995; Tue, 10 Dec 2019 09:24:36 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 09:23:39 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 10 Dec 2019 09:24:16 +0800
Message-ID: <1575941074.9782.0.camel@mtksdaap41>
Subject: Re: [PATCH v2 24/28] drm/mediatek: hdmi: Use drm_bridge_init()
From: CK Hu <ck.hu@mediatek.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Date: Tue, 10 Dec 2019 09:24:34 +0800
In-Reply-To: <20191204114732.28514-25-mihail.atanassov@arm.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
 <20191204114732.28514-25-mihail.atanassov@arm.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C2053D4113A1F6C2D03FB17F90EEE848F312EC60C58E129E95C51A71E518A3AF2000:8
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nd <nd@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Mihail:

On Wed, 2019-12-04 at 11:48 +0000, Mihail Atanassov wrote:
> No functional change.
> 

Acked-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index f684947c5243..9761a80674d9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1708,8 +1708,8 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
>  
>  	mtk_hdmi_register_audio_driver(dev);
>  
> -	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
> -	hdmi->bridge.of_node = pdev->dev.of_node;
> +	drm_bridge_init(&hdmi->bridge, &pdev->dev, &mtk_hdmi_bridge_funcs,
> +			NULL, NULL);
>  	drm_bridge_add(&hdmi->bridge);
>  
>  	ret = mtk_hdmi_clk_enable_audio(hdmi);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
