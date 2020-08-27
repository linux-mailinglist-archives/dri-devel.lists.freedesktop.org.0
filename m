Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCF325406C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 10:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAEE6E48E;
	Thu, 27 Aug 2020 08:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E676E48E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 08:15:49 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y8so3193103wma.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 01:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CRrN+bnESVw3xySjOS/D2tb7BK/BCO+kOmldSTBWoSw=;
 b=r1f2itQK1htdCqLiCgehW3FWfm1h4HuAWXjYf8QoF8itADn/zs0+iM7JnI+bUKhjDJ
 9q8o8tM/h9KIjAJkmPiIY1u5I0e69YY+7WLAVZ1dgv8rA19u7Tuejto8giSdCdATv9eR
 JNVx8tO2iR+tY5RTIyFUv3gV2EOBhgVxJADAAPZ3Fi4YAOqSAH+tGalZkeXB/ZFUG9kg
 YWIXLhpzgMWL3ZAx8la+eNzkPRwKgJ+NsD+k915EacOLtW/fpaUrFdKk0w71ynmWZt0R
 lsi84YQMYM+vOrGJFjE9IAj2tEwp5yODvRG8OJpFCr48Jz4HZ+vfM4MzR07CqATUcVok
 c4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CRrN+bnESVw3xySjOS/D2tb7BK/BCO+kOmldSTBWoSw=;
 b=UCM2AfD2T8DCPrWQZgm4GcEZMkWYzVj3Ff4zJgHQvCCitGqSfnoPcLOUTmcrtmzUdq
 f98N1fcl1fLaLat+8g2NIj+Ld8XNkvIZsXCdO2uZkU5M9O1SCMgfmq2q8nd+NEt8xBgZ
 UAIzWrnZUXFypaeujQygr3D0dT7ERw9o/9L/ePF5JJedv1rQ+oeDxsXroOcTvewZ5Qon
 bQ+xvH7kzKdzeXUweg2W9kE7HUxNULk6YnuOrVtw5avtIpmEMQOy4NMxasmon/HF5n8i
 hoZdfBDkeJ++6rKDMV52FOvsUhpxuc4gDrCZut3dMTvLU1IIQRcn3bHR9QCrvS84NQdW
 rciw==
X-Gm-Message-State: AOAM533m8yU/tyPxdmvBfCBhPTqnbAYuXTjJl6IBu10CJJK8wUfIbB8X
 rZXE4vCLU/ASlKUU0XVaHk0=
X-Google-Smtp-Source: ABdhPJxAzbZ/JUyfG5E0ziVgDM2CoiNZGp8g0x4g8d4WyFCF1tmqYS4Y/5PBF0el+XD/ICqZ0ubpXA==
X-Received: by 2002:a1c:39c4:: with SMTP id
 g187mr10335779wma.126.1598516148283; 
 Thu, 27 Aug 2020 01:15:48 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.187])
 by smtp.gmail.com with ESMTPSA id c8sm4252871wrm.62.2020.08.27.01.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 01:15:47 -0700 (PDT)
Subject: Re: Aw: [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
To: Frank Wunderlich <frank-w@public-files.de>,
 Frank Wunderlich <linux@fw-web.de>, chunkuang Hu <chunkuang.hu@kernel.org>
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
 <trinity-14a1b182-38ab-4f84-bb72-94d448b05fd5-1597994235320@3c-app-gmx-bs37>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <81276d4c-8883-8bfd-d7d0-9b9ac025ed97@gmail.com>
Date: Thu, 27 Aug 2020 10:15:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <trinity-14a1b182-38ab-4f84-bb72-94d448b05fd5-1597994235320@3c-app-gmx-bs37>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21/08/2020 09:17, Frank Wunderlich wrote:
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
>> index 5223498502c4..edadb7a700f1 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
>> @@ -184,6 +184,9 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
>>   		return PTR_ERR(phy_provider);
>>   	}
>>
>> +	if (hdmi_phy->conf->pll_default_off)
>> +		hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
>> +
>>   	return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
>>   				   hdmi_phy->pll);
>>   }
> 
> tried modifying mtk_hdmi_phy_power_on using the new flag to not enable tmds instead of enabling and later disabling it, but this does not work...
> 
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> @@ -62,7 +62,8 @@ static int mtk_hdmi_phy_power_on(struct phy *phy)
>          if (ret < 0)
>                  return ret;
> 
> -       hdmi_phy->conf->hdmi_phy_enable_tmds(hdmi_phy);
> +       if (!hdmi_phy->conf->pll_default_off)
> +               hdmi_phy->conf->hdmi_phy_enable_tmds(hdmi_phy);
>          return 0;
>   }
> 
> @@ -184,8 +185,8 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
>                  return PTR_ERR(phy_provider);
>          }
> 
> -       if (hdmi_phy->conf->pll_default_off)
> -               hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
> +       //if (hdmi_phy->conf->pll_default_off)
> +       //      hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
> 
>          return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
>                                     hdmi_phy->pll);
> 
> 
> same problem as without this Patch (horizontally distorted image flickering on 1280x1024)
> 
> any idea CK Hu?
> 

I'll leave it to CK to decide how to go forward with this. Would be interesting 
to understand why we need to disable the phy. Someone would need to verify that 
this holds for mt2701 as well, and not only for mt7623, otherwise we would break 
mt2701.

Regards,
Matthias
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
