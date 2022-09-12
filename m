Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7229F5B52B6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 04:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B56110E059;
	Mon, 12 Sep 2022 02:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB9C10E059
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 02:52:46 +0000 (UTC)
X-UUID: c5330deb367146d3bf4327e8d57c20ab-20220912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9iQvNSCdIGu6UTVgz7Ig2p0RKCQGqQ3bI7wc8ozG05w=; 
 b=eS14lgERbfazx0EJ/IX03eKDpG/nbcEiqebhl6SJ0nXpVeVk0wUjynSkBEPT30UyRpMh7PPAvPGn3L7Vb+Z5XTI3kFVCfaEFUgETW8QOu93VC9H5aT4ZWR5qW4zg7zVgEcGhevqbG6ttaTTXtkGuLvmscO/ix2FW1eoGvShTwRM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:42fd265f-293b-4e61-9a9e-641637606e13, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:51
X-CID-INFO: VERSION:1.1.10, REQID:42fd265f-293b-4e61-9a9e-641637606e13, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:0,RULE:Release_H
 am,ACTION:release,TS:51
X-CID-META: VersionHash:84eae18, CLOUDID:672309f6-6e85-48d9-afd8-0504bbfe04cb,
 C
 OID:affc5e72d426,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c5330deb367146d3bf4327e8d57c20ab-20220912
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <nathan.lu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 791623106; Mon, 12 Sep 2022 10:52:39 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 12 Sep 2022 10:52:38 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 12 Sep 2022 10:52:38 +0800
Message-ID: <3b0dd4bf01400641a6b622f2c5344c9ded8b5995.camel@mediatek.com>
Subject: Re: [PATCH v2 0/6] Add first version mt8188 vdosys0 driver
From: Nathan Lu <nathan.lu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Mon, 12 Sep 2022 10:52:37 +0800
In-Reply-To: <cd896ff3-47b7-43eb-c821-8c5fb53c6ae6@linaro.org>
References: <20220906084449.20124-1-nathan.lu@mediatek.com>
 <cd896ff3-47b7-43eb-c821-8c5fb53c6ae6@linaro.org>
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
Cc: devicetree@vger.kernel.org, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC
 Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, lancelot.wu@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

Apologize for the incovenience.
I will remove it.

Best regards,

On Thu, 2022-09-08 at 15:14 +0200, Krzysztof Kozlowski wrote:
> On 06/09/2022 10:44, nathan.lu wrote:
> > From: Nathan Lu <nathan.lu@mediatek.com>
> > 
> > This path is based on [1] and [2]
> > [1] Add MediaTek SoC(vdosys1) support for mt8195
> >     - 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=658416__;!!CTRNKA9wMg0ARbw!zuOwDY1dopRZLeZe36Ate1lspoWzDaM06Gj2x8zf9OprwhIMON5dJOlixUGivOIU$
> >  
> > [2] Add MediaTek SoC DRM (vdosys1) support for mt8195
> >     - 
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=665269__;!!CTRNKA9wMg0ARbw!zuOwDY1dopRZLeZe36Ate1lspoWzDaM06Gj2x8zf9OprwhIMON5dJOlixX9HBrk2$
> >  
> > 
> 
> Can you stop ccing internal/fake/non-existing email addresses?
> 
> Your message couldn't be delivered to wsd_upstream@mediatek.com
> because
> the remote server is misconfigured. See the technical details below
> for
> more information.
> 
> 
> Best regards,
> Krzysztof

