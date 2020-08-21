Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF62024E684
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7926E425;
	Sat, 22 Aug 2020 09:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5660E6EAB2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 07:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1597994235;
 bh=RKUSb1KT1trkVNW36+e3JD1DffRwh/W1OBUG1JuN6uA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Du1CQaH46NlFDLMN9jR6t/blbrxAsycfJD7PVFmhiAvbD7PkD+ALRoHx41tSGfSMP
 LDOAmyzW3owGagiMj5tUoF3S/V+iDjQfgVtIO7eA1o5pQmDFFELCeoLyRmm32PiSJB
 zxvsgnbJCtv1TPT94r1HEf2CoqMwVs2NqnbKCVK0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.76.97.101] ([185.76.97.101]) by web-mail.gmx.net
 (3c-app-gmx-bs37.server.lan [172.19.170.89]) (via HTTP); Fri, 21 Aug 2020
 09:17:15 +0200
MIME-Version: 1.0
Message-ID: <trinity-14a1b182-38ab-4f84-bb72-94d448b05fd5-1597994235320@3c-app-gmx-bs37>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>, chunkuang Hu <chunkuang.hu@kernel.org>
Subject: Aw: [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
Date: Fri, 21 Aug 2020 09:17:15 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200819081752.4805-4-linux@fw-web.de>
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:G4xmr717AcDMw6ju9c+MTAh1ENstXifUuqwYk2JTQndtKaX+h68KJhQwkJXqNtEhaI343
 d6puxE4NpPUj+poBeraf/qvlP8/zlGCK6Ny4BEOvyctzZ6JW5GK5gYOA2ouK05E3eS6AHof6QCyR
 HijgcCsdNhWCwFIt+hfPGBLFffWcDTSIulRfvsWGY+CqWp0ly5ETHWIjQTDnzwrGYlwUfeRHfoMe
 f2h68lhCDY3XrUEzaxP1W7UIznEzCAiQbhQklhh1HMZwjtEfuIwnkveAyPmmdHcUXfhatuW1pNPz
 ko=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:a4waYzz4wCU=:gsH0HcXlOmeTEMQJH6qFnw
 2B5Agpzwt2lMiyybMkfwqV60xc/z77OmHqLxf+eBzcynq9L3eql47J6pq1EvIkdJnQK/2JuOv
 JP8cFeofPY8CRuZK8IU4IrUlm9QdK1niSER2o2FYBf0JK7cnawKqthp8iC08AgRWYin1d0BA+
 GvbScPsMLd0k1cYNzTo/nDYPS6hljc8kA8ZjBiTJbHdzazxc54z/fze5nY44sac6q2rCPhQ7A
 FLWFJ0RGu5BhNjN9tKeB1sMK9sIAOG6T+nVyab+yR2og0c2rFaZbcfNQ+R2u6ns4c6JXfzxwx
 SOe/3Qx1VWxdb8GamJlzfYDwqP4KrGDrLataQsoqE0npBQif1xcumugDVcWbXNx21ofIfT2VJ
 oXn2hTLUokeEH0bcEMAi+9UsJ9G/KcREV1mldENwtZ4fgfzdseceAj992+7YTs99ZfV4Sp/mw
 31XugyOCcadzqiK1hF9Wi/9CqcC7T67VOqAJ2zsHV2BxJb86wropyHWptiaaOUtKAN5KVbgZs
 gdlADlYiySR2HATQ8k00EyBF9I4azYOzL+tlP9/7+S8tqcAXpHTFUEJp/XlNT8x8A9A3rAPkN
 0CQeo/MUasS9iQTL/HxxT4Un7N0wgdTsCs5MiNEfiSgPww02psJp4buhymvc4yUG4QYXeylgG
 3x5df/W92rMCR40vACtcG+y2oRRcyVD/KVb47hgka2aMQt560E4/FkF+9KocyBUJ8AoQ=
X-Mailman-Approved-At: Sat, 22 Aug 2020 09:02:00 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> index 5223498502c4..edadb7a700f1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> @@ -184,6 +184,9 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
>  		return PTR_ERR(phy_provider);
>  	}
>
> +	if (hdmi_phy->conf->pll_default_off)
> +		hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
> +
>  	return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
>  				   hdmi_phy->pll);
>  }

tried modifying mtk_hdmi_phy_power_on using the new flag to not enable tmds instead of enabling and later disabling it, but this does not work...

--- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
@@ -62,7 +62,8 @@ static int mtk_hdmi_phy_power_on(struct phy *phy)
        if (ret < 0)
                return ret;

-       hdmi_phy->conf->hdmi_phy_enable_tmds(hdmi_phy);
+       if (!hdmi_phy->conf->pll_default_off)
+               hdmi_phy->conf->hdmi_phy_enable_tmds(hdmi_phy);
        return 0;
 }

@@ -184,8 +185,8 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
                return PTR_ERR(phy_provider);
        }

-       if (hdmi_phy->conf->pll_default_off)
-               hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
+       //if (hdmi_phy->conf->pll_default_off)
+       //      hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);

        return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
                                   hdmi_phy->pll);


same problem as without this Patch (horizontally distorted image flickering on 1280x1024)

any idea CK Hu?

regards Frank
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
