Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C588E5A73E9
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 04:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4EE10E16B;
	Wed, 31 Aug 2022 02:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8F710E16B
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 02:29:24 +0000 (UTC)
X-UUID: 1ccf1da0346b4dec970b17bb42eb9f6c-20220831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uZlIvUYoUOUIVtQR817mktZPUPe5qU/Ka/DPqDje8IM=; 
 b=L2vrZnZHemiioyZWmWct44W+Rkj9vnXPYgMhUQusIDeRunTyehka4NJyvrqAcW6o+Mygk9ZHWRcv8LWE+Cxa8BJAngZYO9SXyFIYazML5QhqVcvnHwhX8uJkennig44DiRpb9Wtexs3rJcabqblXQD8st1aZZaO+yfuE8uknal8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:91a08f0a-aa43-4f52-9659-0e4aec1956e8, OB:20,
 LOB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:28,RULE:Relea
 se_Ham,ACTION:release,TS:79
X-CID-INFO: VERSION:1.1.10, REQID:91a08f0a-aa43-4f52-9659-0e4aec1956e8, OB:20,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:28,RULE:Spam_GS
 981B3D,ACTION:quarantine,TS:79
X-CID-META: VersionHash:84eae18, CLOUDID:a91c9e20-1c20-48a5-82a0-25f9c331906d,
 C
 OID:18bfa2323c78,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:40|20,QS:nil,BEC:nil,COL:0
X-UUID: 1ccf1da0346b4dec970b17bb42eb9f6c-20220831
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <zheng-yan.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1349726615; Wed, 31 Aug 2022 10:29:20 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 31 Aug 2022 10:29:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 31 Aug 2022 10:29:18 +0800
Message-ID: <b61776761eb0ab9a0b1dcf29d908e4bfd789d2ac.camel@mediatek.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: Modify gamma compatible for mt8195
From: zheng-yan.chen <zheng-yan.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Wed, 31 Aug 2022 10:29:18 +0800
In-Reply-To: <bf2b277e-8b02-6a44-e463-6b7c4a697ce7@linaro.org>
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
 <20220830063929.13390-4-zheng-yan.chen@mediatek.com>
 <a209aea3-bf23-4670-91d0-e7f41ac57833@collabora.com>
 <bf2b277e-8b02-6a44-e463-6b7c4a697ce7@linaro.org>
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
Cc: devicetree@vger.kernel.org, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-08-30 at 12:14 +0300, Krzysztof Kozlowski wrote:
> On 30/08/2022 10:49, AngeloGioacchino Del Regno wrote:
> > Il 30/08/22 08:39, zheng-yan.chen ha scritto:
> > > Modify gamma compatible for mt8195.
> > > 
> > > Fixes: 16590e634f1d ("arm64: dts: mt8195: Add display node for
> > > vdosys0")
> > > Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> > 
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> 
> Please also perform review on the commit msg and backport status.
> 
> Best regards,
> Krzysztof
Hello Krzysztof, 
Thanks for the review,
I will fix it at the next version.

Best Regards,
Zheng-Yan Chen.

