Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33A4130DAD
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 07:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E8D89DF7;
	Mon,  6 Jan 2020 06:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id E1F2D89DF7
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 06:47:35 +0000 (UTC)
X-UUID: 3c523dba18a54c0bb9c23614c8d4a172-20200106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aYAZgI6ryqNleIeTmQWVE96vhfch+9yXx43Fz3GXDe0=; 
 b=Hbr1iiIwM5x+W94EmR46cxymgPfb+HIHweivpVQEJJZCEcrIrBzE+73oyEyn56Qh/CkstUDm8rnDdScizia4Z69tQOZxnI5xBM7ATIZFQrFs7mFrpjbWsWCJ8tSzTXRX6zeUnsTr3GcBEAeRqKEhi+3I3aJqGwilpPKk1jDl8LE=;
X-UUID: 3c523dba18a54c0bb9c23614c8d4a172-20200106
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 506341859; Mon, 06 Jan 2020 14:47:33 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 6 Jan 2020 14:47:41 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 6 Jan 2020 14:46:02 +0800
Message-ID: <1578293251.3044.1.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: fix indentation
From: CK Hu <ck.hu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>
Date: Mon, 6 Jan 2020 14:47:31 +0800
In-Reply-To: <20200103142445.55036-1-fparent@baylibre.com>
References: <20200103142445.55036-1-fparent@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Fabien:

On Fri, 2020-01-03 at 15:24 +0100, Fabien Parent wrote:
> Fix indentation in the Makefile by replacing spaces with tabs.
> 

Applied to mediatek-drm-next-5.6 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.6

Regards,
cK

> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index 8067a4be8311..b2b523913164 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -21,7 +21,7 @@ obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
>  mediatek-drm-hdmi-objs := mtk_cec.o \
>  			  mtk_hdmi.o \
>  			  mtk_hdmi_ddc.o \
> -                          mtk_mt2701_hdmi_phy.o \
> +			  mtk_mt2701_hdmi_phy.o \
>  			  mtk_mt8173_hdmi_phy.o \
>  			  mtk_hdmi_phy.o
>  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
