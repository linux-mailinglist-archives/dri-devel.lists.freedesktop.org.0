Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7CE3695A7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 17:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69CD6E106;
	Fri, 23 Apr 2021 15:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAE56E106
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 15:08:18 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id t17so21420636qkg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 08:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kMBt3oIwngeJeBnfmEyUsdAN7B1plm8CAX31M1jjWdw=;
 b=XOkKKQbXZMkWcDYshtTtl3Sh5yWiva3sTa0AFxXsmvrvXjZf/atJ/JoRYC3Xts8BlV
 x24uSpxfwlU+Iaiugh3ZBy6Em1Buzir/Ra1YhNj4PqxdGWvFFEglcbo0vRDdd+tlY+5t
 4jI98v069K+8dRH1yXwmoHbEyw74tXNy6N6ivCjatW08mku/mqGSVpniDXVEKNq/3LkK
 v+DhmSy9VbpjBKzTzcJXYZDhLzMSVASlrRfaIt0TQec3DTrCwa/jEmj3P3MFIHnQ9s3f
 ZIUQyYTom/Dc1nFC9c/dgHRF2oISmsLcG64q+2+6FowSxj17c6vHT5KADrUjwyt5SiJ8
 7/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kMBt3oIwngeJeBnfmEyUsdAN7B1plm8CAX31M1jjWdw=;
 b=uH5zAa7q3UiHZyVUNMd9pHEtZ81ohxgdhZS3ngS38dLZ7BKek/aLSmy6Z3MnZAAAX3
 f2dCs+Xjsoe6yvP/pC3SG5ab6rSSohCXSf6hcbY77G7e7PD+D6oLJk92O/eUDMmU5dwb
 E1N7tB7JJ+dqTznRqTReFOpN0czITc1HaQKMzYVkWpeBNABQlfn2mWNnFle97yCJWgA+
 LzD1MLtsTSMEV0jQICm6bjejbwVP90LnD3Y/f76eFKmBjDVg4SVTOvfsg76OL4J5fcQn
 H57m9/IFO5muDffR5iJb4ey+Dgay7F+vobYdWahZGnTKRtpKmjas3K1vhBNk0WtHNAe9
 dR/g==
X-Gm-Message-State: AOAM530WAJeOE9S5lR+fnNb41GmVXIo8JlzWSrdavxaO6aR6HAZCC7JC
 DmD7AnbiP0c8tCOXwIgZS5uGgzSyZ/T0GorBUWc=
X-Google-Smtp-Source: ABdhPJyTywhnJyaB9YRYFW07GHm65WRhqKgMqmwDxOTsEt8/ukIP8gBQYati/quG/amJc+aBgYA/wA==
X-Received: by 2002:a37:68d4:: with SMTP id d203mr4474732qkc.189.1619190497287; 
 Fri, 23 Apr 2021 08:08:17 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca.
 [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id y6sm4488489qkd.106.2021.04.23.08.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 08:08:16 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dsi: fix msm_dsi_phy_get_clk_provider return code
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20210412000158.2049066-1-dmitry.baryshkov@linaro.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <589a5a1c-cb90-72ce-38df-4f497fd36f16@marek.ca>
Date: Fri, 23 Apr 2021 11:05:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20210412000158.2049066-1-dmitry.baryshkov@linaro.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested-by: Jonathan Marek <jonathan@marek.ca>

On 4/11/21 8:01 PM, Dmitry Baryshkov wrote:
> msm_dsi_phy_get_clk_provider() always returns two provided clocks, so
> return 0 instead of returning incorrect -EINVAL error code.
> 
> Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into a generic code")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index f0a2ddf96a4b..ff7f2ec42030 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -843,7 +843,7 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
>   	if (pixel_clk_provider)
>   		*pixel_clk_provider = phy->provided_clocks->hws[DSI_PIXEL_PLL_CLK]->clk;
>   
> -	return -EINVAL;
> +	return 0;
>   }
>   
>   void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
