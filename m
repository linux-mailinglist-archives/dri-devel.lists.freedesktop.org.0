Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A03F5B7E4F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 03:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA1810E7BA;
	Wed, 14 Sep 2022 01:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EC410E7BA
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 01:29:57 +0000 (UTC)
X-UUID: c6ca5fa26f4e4fe591cb2329e7507898-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jtf0pV6OTBxyNK49AbgnpY+uE7h7WetWSrNYxrsJuHU=; 
 b=f2fXZzjNKtadxACtMHBlNa47yRiQYPEXfl4BnWZyx9c11gaLPIndbgGaHmNcMD9BwCV64De28DfEL3MGobbowAgp+MTRD5EviwDRnuXsizF+mNf4ao57s7/bRc9B57Oef9XyjiRyGvwrDlMd8919s002+W5WqaUVwOlTn8I13bk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:091bb838-caae-45b3-9e76-6e1821553bae, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.11, REQID:091bb838-caae-45b3-9e76-6e1821553bae, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:39a5ff1, CLOUDID:67dc4bf6-6e85-48d9-afd8-0504bbfe04cb,
 B
 ulkID:220914092955TAL2S8R3,BulkQuantity:0,Recheck:0,SF:28|17|19|48,TC:nil,
 Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c6ca5fa26f4e4fe591cb2329e7507898-20220914
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1562391006; Wed, 14 Sep 2022 09:29:53 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 14 Sep 2022 09:29:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 14 Sep 2022 09:29:51 +0800
Message-ID: <dccaa8ce9e3a494afb165d4b8ff02b7589241451.camel@mediatek.com>
Subject: Re: [PATCH v3 3/9] drm/mediatek: Adjust mtk_drm_gamma_set_common
 parameters
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Wed, 14 Sep 2022 09:29:51 +0800
In-Reply-To: <90908764-b5aa-34a0-74c8-9f9215dcb89b@collabora.com>
References: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
 <20220911153734.24243-4-jason-jh.lin@mediatek.com>
 <90908764-b5aa-34a0-74c8-9f9215dcb89b@collabora.com>
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
Cc: devicetree@vger.kernel.org, Singo
 Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

Thanks for the reviews.

On Mon, 2022-09-12 at 12:12 +0200, AngeloGioacchino Del Regno wrote:
> Il 11/09/22 17:37, Jason-JH.Lin ha scritto:
> > Adjust the parameters in mtk_drm_gamma_set_common()
> >    - add (struct device *dev) to get lut_diff from gamma's driver
> > data
> >    - remove (bool lut_diff) and use false as default value in the
> > function
> > 
> > Fixes: 051524cbe62d ("FROMGIT: drm/mediatek: Add lut diff flag for
> > new gamma hardware support")
> 
> This Fixes tag contains a commit from a downstream kernel, which is
> useless
> fo upstream. Please fix it.
> 
> Regards,
> Angelo

OK, I'll fix this.

Regards,
Jason-JH.Lin

-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

