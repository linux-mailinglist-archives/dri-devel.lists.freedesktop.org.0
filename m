Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7A56F30ED
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 14:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF07B10E04A;
	Mon,  1 May 2023 12:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE2C10E04A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 12:38:03 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2a8dc00ade2so23770161fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 05:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682944680; x=1685536680;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/IbVhpk+6YPf6UP0JUxSgmpnmuOZSagBqkf05LKlAxI=;
 b=t+luffE6T+59qh3ntjYNcC3D1SBpx/+RpIpcCQ85pY/H9DOvzmmPnASP8r052HqmLS
 +kzRdc3ATuzCgKbT1UAlQts5r3DdvAAEhgbDYC6F5dACbOvATDkkZUiDDpUo7eUC9tsZ
 F0gQLIJCzriXoyvmlMMBEx4XB3nYgeF7r1DIIQMqzdeTyJifaEFf2z555o9DUFyHy6ad
 e5W7QSlbtoj7qEf3xMe4ENjjMdEtYWNPsyxjUrY1Sp7N/l4iCnIVBRoRU8UqI4spwpST
 vpTpKVb69D56fnwKY+0ANtVg9wg7pQ1tuSS075AEKWW7Sq/miTHoN1s3Qe6J3PPIjhHI
 0yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682944680; x=1685536680;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/IbVhpk+6YPf6UP0JUxSgmpnmuOZSagBqkf05LKlAxI=;
 b=O2oU2LQQkyUmDFi/ciN4N9OOyKQag3baAq3JuIjjGPnV2T86vq+YlWNPmlzod1NzaA
 uUDAGeOP9q7ARw58yQ8b1sievXQXvHsR0IX0QXjOmor3dxOW1C+IC8mIHf9oeCfLM/4Z
 1CwKCxfxQC0eiSjn3patS66WOg82oACA+Rw9r/9A8TSlZXiARnjDqC4+vvv1yVu0I9kC
 AuPtNftLURIcjTgJEm/ZYWbbTuG1JpynIuA0HzvLjAF0tTmn2ekt/caqlvx5V99FKc+A
 8IIfXIvqJyH1VzMlbnYcyJE1a4j9D4hdjB6DShT3k/QGvC+pISbCzEm+ZeWiQp831hRh
 HLnA==
X-Gm-Message-State: AC+VfDwxzy0Vklk60JVuTKRET1kS8e1r38MBO5081RMqmmh4W+e87PJ1
 d65tXiAbNtkrxNe/cvcMxbe+eQ==
X-Google-Smtp-Source: ACHHUZ4JrEAVZU7gK3ZcuZgwQYC6Wox623r/U+ysIg9R1y1XMRn7lrpbRiifYov8TJDnd2uPAthOdg==
X-Received: by 2002:a2e:9658:0:b0:2a8:bce4:c712 with SMTP id
 z24-20020a2e9658000000b002a8bce4c712mr3814440ljh.43.1682944680000; 
 Mon, 01 May 2023 05:38:00 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05651238c300b004ec5229092dsm4722852lft.34.2023.05.01.05.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 05:37:59 -0700 (PDT)
Message-ID: <7cf248ee-d966-3aa5-91f1-3d93ab71cd4b@linaro.org>
Date: Mon, 1 May 2023 14:37:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] drm/msm/dsi: don't allow enabling 14nm VCO with
 unprogrammed rate
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230501011257.3460103-1-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230501011257.3460103-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1.05.2023 03:12, Dmitry Baryshkov wrote:
> If the dispcc uses CLK_OPS_PARENT_ENABLE (e.g. on QCM2290), CCF can try
> enabling VCO before the rate has been programmed. This can cause clock
> lockups and/or other boot issues. Program the VCO to the minimal PLL
> rate if the read rate is 0 Hz.
> 
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>

I think this should also be implemented on other PLL gens.

>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 9f488adea7f5..3ce45b023e63 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -539,6 +539,9 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
>  	if (unlikely(pll_14nm->phy->pll_on))
>  		return 0;
>  
> +	if (dsi_pll_14nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
> +		dsi_pll_14nm_vco_set_rate(hw, pll_14nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
VCO_REF_CLK_RATE ---> phy->cfg->min_pll_rate (VCO_MIN_RATE)?

Konrad
> +
>  	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
>  	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 1);
>  
