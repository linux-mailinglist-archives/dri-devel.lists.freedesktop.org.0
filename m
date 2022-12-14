Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C53064C0FE
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 01:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6951310E1CC;
	Wed, 14 Dec 2022 00:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9348310E1F3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 00:02:19 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id p8so7686431lfu.11
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 16:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F4wzLNz6dwbsx5heN6y8ApOHwBgCymyPsBRS4COOYFM=;
 b=cz6w9iekOtz1phgLx4mKtqjxhJ5PKY8yopabUl8Vl8TR8IfUTFb1WeZ/L9L6vt30wV
 bbDs6rV5b9mkcsN3I6ndGH+zrjdGdYMSBxtI0XeuO1yOBOIuKodL2cA3wihjs1eUCADn
 9XNmnQlcqiKmpcJ3dmLNz8axo2Qiz8zgFSLKCKSGfpnVE7gK9iz9emddeREw1pX1G5zr
 f0Wu2tsrSLrn9Mx2f9qmlO0KgakSX1ZY35ZIApdiFLC2YRYj2tlzfMaSUj0xqxEQ4wu7
 4Cltns0mpYlYlXejav8yiWL/maxSPolVjgPeJWK0LTI7sytbYE8EzjdKIPoWHgks1XSJ
 I+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F4wzLNz6dwbsx5heN6y8ApOHwBgCymyPsBRS4COOYFM=;
 b=S0CObkSw/NacWWMMM11MCUNiCtHpCVObSvEH/tYAmumiZxnJkICRS8FV9kxixhuuqe
 1pjmwfnNY6BT98RfOVUIlSTwx8nEJD4sb9lQQYSHmuIllhTBWKW7cG0Otw33dY3DwviX
 On84WYOgwx7OdTTDD4P+R/wMra5du0f9TuNtjQEmw/W7GjYW+GLR4XCIF1ufF3lqrfRd
 elTpxc8k5X7ynUbn0fkfoO4eRQOe02KQNQ7ZNor4Kvh+jQZ9H/JS+6tdKC/EamhKo1BN
 yjiiCEtqrWH3byRTnSE36Q+sTmwcDaHlWfDGdl2r6rdxGI6sOurc6N2zg2501Ot9V47Z
 Ptqg==
X-Gm-Message-State: ANoB5pmmaoQWvmsHMvyGFiKrzhCBi7o36v7qBNLSln/gv4FgWxcK/pN/
 GYSJrsSIYwBXJVFk/rACxcrVrg==
X-Google-Smtp-Source: AA0mqf4OPQ41A6YQWwi4U9K/lp0Wdyo5nPJOWKYHo+40cNenTg2e7rXr3g3txA7AaybzmQI7F4YIJw==
X-Received: by 2002:a05:6512:15a6:b0:4b4:b5bf:3ce6 with SMTP id
 bp38-20020a05651215a600b004b4b5bf3ce6mr9902578lfb.38.1670976137948; 
 Tue, 13 Dec 2022 16:02:17 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
 by smtp.gmail.com with ESMTPSA id
 p17-20020ac246d1000000b0049e9122bd0esm558261lfo.114.2022.12.13.16.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 16:02:17 -0800 (PST)
Message-ID: <c5e33d9f-0dc4-fdd2-244a-3d463be1c4e8@linaro.org>
Date: Wed, 14 Dec 2022 01:02:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 5/6] drm/msm/dsi: Flip greater-than check for
 slice_count and slice_per_intf
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
 <20221213232207.113607-6-marijn.suijten@somainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221213232207.113607-6-marijn.suijten@somainline.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Haowen Bai <baihaowen@meizu.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, sunliming <sunliming@kylinos.cn>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14.12.2022 00:22, Marijn Suijten wrote:
> According to downstream /and the comment copied from it/ this comparison
> should be the other way around.  In other words, when the panel driver
> requests to use more slices per packet than what could be sent over this
> interface, it is bumped down to only use a single slice per packet (and
> strangely not the number of slices that could fit on the interface).
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> ---
Missing s-o-b

>  drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 0686c35a6fd4..9bdfa0864cdf 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -855,11 +855,11 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>  	 */
>  	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
>  
> -	/* If slice_per_pkt is greater than slice_per_intf
> +	/* If slice_count is greater than slice_per_intf
>  	 * then default to 1. This can happen during partial
>  	 * update.
>  	 */
> -	if (slice_per_intf > dsc->slice_count)
> +	if (dsc->slice_count > slice_per_intf)
>  		dsc->slice_count = 1;
>  
>  	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
