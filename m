Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BECFF1733A6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 10:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94186EE95;
	Fri, 28 Feb 2020 09:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id EAAFC6EE95
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 09:19:51 +0000 (UTC)
X-UUID: caab609a429849368284e83c25abd92c-20200228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6zeC4yb1VQBu7ApncTTy8tf7CnDnABwjHUo57+LSsO8=; 
 b=sObfravm74/bA6AytUYIAQBeFbeGeZ/0otXn+fYlZbbNA/h7vjLnFFHE7HrlJws4/KInkSIrQHMWoxXX7xuCHPJ/FPk09vAQxu/YO3qUxNp07A16o/21nq2HBHHMcmiUoLhC08rKtTmYQ++TTeaB44x2pmPVg4JXFfha1GoyLPA=;
X-UUID: caab609a429849368284e83c25abd92c-20200228
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1234426427; Fri, 28 Feb 2020 17:19:47 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 17:18:48 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 28 Feb 2020 17:19:44 +0800
Message-ID: <1582881585.22475.0.camel@mtksdaap41>
Subject: Re: [PATCH v10 2/5] dt-bindings: mediatek: Update mmsys binding to
 reflect it is a system controller
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Fri, 28 Feb 2020 17:19:45 +0800
In-Reply-To: <20200227180858.1514157-3-enric.balletbo@collabora.com>
References: <20200227180858.1514157-1-enric.balletbo@collabora.com>
 <20200227180858.1514157-3-enric.balletbo@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FC89D009C6FEBE11B57038010837F5A87B7460971BF352976EDF9382E63247B12000:8
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
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora
 Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya
 Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
 Houlong Wei <houlong.wei@mediatek.com>, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Allison Randal <allison@lohutok.net>,
 Matthias Brugger <mbrugger@suse.com>, sboyd@kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Enric:

On Thu, 2020-02-27 at 19:08 +0100, Enric Balletbo i Serra wrote:
> The mmsys system controller is not only a pure clock controller, so
> update the binding documentation to reflect that apart from providing
> clocks, it also provides routing and miscellaneous control registers.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v10:
> - Update the binding documentation for the mmsys system controller.
> 
> Changes in v9: None
> Changes in v8: None
> Changes in v7: None
> 
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt    | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> index 301eefbe1618..8d6a9d98e7a6 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> @@ -1,7 +1,8 @@
>  Mediatek mmsys controller
>  ============================
>  
> -The Mediatek mmsys controller provides various clocks to the system.
> +The Mediatek mmsys system controller provides clock control, routing control,
> +and miscellaneous control in mmsys partition.
>  
>  Required Properties:
>  
> @@ -15,13 +16,13 @@ Required Properties:
>  	- "mediatek,mt8183-mmsys", "syscon"
>  - #clock-cells: Must be 1
>  
> -The mmsys controller uses the common clk binding from
> +For the clock control, the mmsys controller uses the common clk binding from
>  Documentation/devicetree/bindings/clock/clock-bindings.txt
>  The available clocks are defined in dt-bindings/clock/mt*-clk.h.
>  
>  Example:
>  
> -mmsys: clock-controller@14000000 {
> +mmsys: syscon@14000000 {
>  	compatible = "mediatek,mt8173-mmsys", "syscon";
>  	reg = <0 0x14000000 0 0x1000>;
>  	#clock-cells = <1>;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
