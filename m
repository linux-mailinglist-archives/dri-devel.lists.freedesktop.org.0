Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E335887C3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 09:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194C910F6A8;
	Wed,  3 Aug 2022 07:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8870A10FC67
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 07:12:10 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id z4so3319658ljn.8
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 00:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=0Fo2XHCIpIewEvDK99RTZIfzJY9zqyN0VWEsmGYej3Y=;
 b=Xy7x+gaZtMuI1ao7NWqrDdUvTmM88Uk3ewEK7zXfGKbmoHBt9j+Et1Lc/wXGf6UmWw
 OGz9/M/r1ahxJSkrz4Px8TsrtmxbVq3ggySM+DDAfYkA2nwX5ZlI1MhYjUH6dzJ9kl09
 1ASgFjAho0iSQqjyzU+y5xqhrTwI9cuOsPRXLtFkkhBl4+D3feRNTHnNCU+cTTXci55D
 3KA5JHW26DlDcU7tTG64OzIj6lWzIKpJC08CZqrLQLZBdd/dEPsfmTyWePcjsv3vK+oG
 06RJxWV+0VNtbK3MX2wgnUcvGoie9dEYm79f5CttQyKVaIVhpFzPiX4sk44hguQRoWRT
 ve3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=0Fo2XHCIpIewEvDK99RTZIfzJY9zqyN0VWEsmGYej3Y=;
 b=x6qDb7IYr6iXo9EcWZpXHo4x3WzIVvl3BK6i+Wf2rWc55U3HdsEw8RIUD3ykEti+jN
 fhoR/H9LOOhEYTyv6bTCz1JgeBmqQWcjols3Dq8ssi5QSF4VxkmpKdovU45qWoJkJssw
 LGVc3dalgLgZLmis5HqE/KRXu4HzPXcGKAM/dzO5s09q1SnZewwCTexOscJhG/eeAGkI
 OFkMwthUzraDdE49awLjCw2pDZoNqWGpMBid6OB58aGVZSF22RCHWZODNEcwF5qZ/jzZ
 3pFlmL/Wm+buyNT5uIPxEXuIP/Oa/17UuMgl7VRahFjAWgYLUFWc2ZI2wmJ1lLIxAohE
 BPVA==
X-Gm-Message-State: AJIora8SP1vmeoDDyB/xlDaI54kdLnXE0a5PnXWWWt5omtsIfM1LiLqh
 /SJrPfEHAw53z68F9cpymI194A==
X-Google-Smtp-Source: AGRyM1tjB2tDEdtAeSnQi3Avkc4q8rJ4woFi26RkXjkXb9lmDTz30A1703e5s4FE9svZAJ/hyvOahA==
X-Received: by 2002:a05:651c:1250:b0:25e:954:97b8 with SMTP id
 h16-20020a05651c125000b0025e095497b8mr7777824ljh.215.1659510728914; 
 Wed, 03 Aug 2022 00:12:08 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a2eb743000000b0025e346e03e3sm1993427ljo.7.2022.08.03.00.12.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 00:12:08 -0700 (PDT)
Message-ID: <232f875a-4986-300a-f1e8-18f2da3a8fc6@linaro.org>
Date: Wed, 3 Aug 2022 10:12:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 4/6] drm/msm/dsi: Use the new regulator bulk feature to
 specify the load
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220802223738.898592-1-dianders@chromium.org>
 <20220802153434.v3.4.I7b3c72949883846badb073cfeae985c55239da1d@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220802153434.v3.4.I7b3c72949883846badb073cfeae985c55239da1d@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/08/2022 01:37, Douglas Anderson wrote:
> As of commit 6eabfc018e8d ("regulator: core: Allow specifying an
> initial load w/ the bulk API") we can now specify the initial load in
> the bulk data rather than having to manually call regulator_set_load()
> on each regulator. Let's use it.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

It might have been better, if the previous patch had only removed the 
load_setting on disable and inlined the dsi_host_regulator_disable(). 
Then this patch would drop the regulator_set_load() from 
dsi_host_regulator_enable() path and inline it. Then it would have been 
more obvious that after these two changes the time when we set loads is 
not changed.

> ---
> 
> Changes in v3:
> - Update commit message to point at the git hash of the regulator change.
> 
> Changes in v2:
> - ("Use the new regulator bulk feature to specify the load") new for v2.
> 
>   drivers/gpu/drm/msm/dsi/dsi_host.c    | 13 +++----------
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 13 +++----------
>   2 files changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 9df278d39559..a0a1b6d61d05 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -260,8 +260,10 @@ static int dsi_regulator_init(struct msm_dsi_host *msm_host)
>   	int num = msm_host->cfg_hnd->cfg->reg_cfg.num;
>   	int i, ret;
>   
> -	for (i = 0; i < num; i++)
> +	for (i = 0; i < num; i++) {
>   		s[i].supply = regs[i].name;
> +		s[i].init_load_uA = regs[i].enable_load;
> +	}
>   
>   	ret = devm_regulator_bulk_get(&msm_host->pdev->dev, num, s);
>   	if (ret < 0) {
> @@ -270,15 +272,6 @@ static int dsi_regulator_init(struct msm_dsi_host *msm_host)
>   		return ret;
>   	}
>   
> -	for (i = 0; i < num; i++) {
> -		if (regs[i].enable_load >= 0) {
> -			ret = regulator_set_load(s[i].consumer,
> -						 regs[i].enable_load);
> -			if (ret < 0)
> -				return ret;
> -		}
> -	}
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 7c105120d73e..efb6b1726cdb 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -515,8 +515,10 @@ static int dsi_phy_regulator_init(struct msm_dsi_phy *phy)
>   	int num = phy->cfg->reg_cfg.num;
>   	int i, ret;
>   
> -	for (i = 0; i < num; i++)
> +	for (i = 0; i < num; i++) {
>   		s[i].supply = regs[i].name;
> +		s[i].init_load_uA = regs[i].enable_load;
> +	}
>   
>   	ret = devm_regulator_bulk_get(dev, num, s);
>   	if (ret < 0) {
> @@ -529,15 +531,6 @@ static int dsi_phy_regulator_init(struct msm_dsi_phy *phy)
>   		return ret;
>   	}
>   
> -	for (i = 0; i < num; i++) {
> -		if (regs[i].enable_load >= 0) {
> -			ret = regulator_set_load(s[i].consumer,
> -							regs[i].enable_load);
> -			if (ret < 0)
> -				return ret;
> -		}
> -	}
> -
>   	return 0;
>   }
>   


-- 
With best wishes
Dmitry
