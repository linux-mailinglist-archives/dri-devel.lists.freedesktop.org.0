Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5490F1554C6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 10:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E9E6FBE9;
	Fri,  7 Feb 2020 09:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0909D6FBE9
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 09:34:23 +0000 (UTC)
X-UUID: 806eec9a71c24019be45c0656c9f9297-20200207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=m74yjQkT2G8gL7JoqJhfpeZ6P0zLpKwVgqiwmutKy3g=; 
 b=PUFN4niIigJ5y4h9n6/8BFNCnIfv41AI2DNojRUrHJcG0/L3pCWJVbOa8n7ah4u0oGqJELS6wUtwpZQWf1NGfjjTsy4kQg9dIKuR64MEb5FOX+YyZevs/B0Q/QC9NtfU+b6tatMNH5cZ5nqCzjEYNmsXqs6rBH1gPQFSYLXZaYk=;
X-UUID: 806eec9a71c24019be45c0656c9f9297-20200207
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 638472475; Fri, 07 Feb 2020 17:34:19 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 7 Feb 2020 17:33:30 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 7 Feb 2020 17:31:40 +0800
Message-ID: <1581068057.28261.0.camel@mtksdaap41>
Subject: Re: [PATCH v2 1/3] drm/mediatek: exit earlier if failed to register
 audio driver
From: CK Hu <ck.hu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 7 Feb 2020 17:34:17 +0800
In-Reply-To: <20200206102509.1.Ieba8d422486264eb7aaa3aa257620a1b0c74c6db@changeid>
References: <20200206031752.193298-1-tzungbi@google.com>
 <20200206102509.1.Ieba8d422486264eb7aaa3aa257620a1b0c74c6db@changeid>
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
Cc: alsa-devel@alsa-project.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org, cychiang@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Tzung-Bi:

On Thu, 2020-02-06 at 11:17 +0800, Tzung-Bi Shih wrote:
> Exits earlier if register_audio_driver() returns errors.
> 

Acked-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index c79b1f855d89..23c2b0e8693d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1656,7 +1656,7 @@ static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
>  	.get_eld = mtk_hdmi_audio_get_eld,
>  };
>  
> -static void mtk_hdmi_register_audio_driver(struct device *dev)
> +static int mtk_hdmi_register_audio_driver(struct device *dev)
>  {
>  	struct hdmi_codec_pdata codec_data = {
>  		.ops = &mtk_hdmi_audio_codec_ops,
> @@ -1669,9 +1669,10 @@ static void mtk_hdmi_register_audio_driver(struct device *dev)
>  					     PLATFORM_DEVID_AUTO, &codec_data,
>  					     sizeof(codec_data));
>  	if (IS_ERR(pdev))
> -		return;
> +		return PTR_ERR(pdev);
>  
>  	DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
> +	return 0;
>  }
>  
>  static int mtk_drm_hdmi_probe(struct platform_device *pdev)
> @@ -1705,7 +1706,11 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	mtk_hdmi_register_audio_driver(dev);
> +	ret = mtk_hdmi_register_audio_driver(dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register audio driver: %d\n", ret);
> +		return ret;
> +	}
>  
>  	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
>  	hdmi->bridge.of_node = pdev->dev.of_node;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
