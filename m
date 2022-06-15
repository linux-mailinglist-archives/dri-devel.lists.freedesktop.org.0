Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B44654C889
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 14:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC11110E445;
	Wed, 15 Jun 2022 12:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6489610E415
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 12:30:14 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id l20so6315353lji.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 05:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5vGAXTFss+xRVWCjnDcb7Q0fDyWMmYQS1IlIisRz3kA=;
 b=EOkJnIDxrEFF+7/lL50921cC8xj04yIhzL/gjXZ2b99hFK2rWxyrK9CAGQMtFmvcvf
 ktSx+aJ1aXXVzZYdHssvQ+iY9tweS2bkxIJDvynoAHbIP+KiqZ+o+VFZnQHlHMaeWh1H
 FopnjxWrPoqGWx0EgSR1oqfam4d36/hYw+7+qwSw8dojx8NTc4+Plcq0bv7m90zRwFb8
 sL7i915LBomiiZ1YP7udhS3T1xO330Iy9eXS26A9J5Sms7GMlxoRiQ6d0aHFwZO1VAMr
 zakJ7NDnHlnsXmcm4DGdaX+lY6lgKOFJ2SZQ33FeaUKD6OTMZIFTsnw4ohSUPk+hQii+
 F4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5vGAXTFss+xRVWCjnDcb7Q0fDyWMmYQS1IlIisRz3kA=;
 b=5J0DZMXbmJurx0+td/FLypZ4hrKUPOGvpuPLbKPTIy6gA/Kqb2dKPniPaa0GXffCdV
 dCgymwCBiFPcKxEBnO+h+bicrHTVS/GNg8LI6ibCDsLU215rQSO9GqBFsI63R8IuKWiC
 M+tvZrPi8eH7PzguVG1YVd1DWyvhEW0Z/P1JvL7Gnuf8wsfxAQSICbxWYR1P8gY1z5QS
 8zCem8x5ejlcifgKSQDALVeArBlOKHIY8rA3DdtXiTVVEK6WydhXKb3Qod85zUsiK8nB
 ENU09LyMXYz9ULeF4wgmGsfvLcJ/jhhC6rLeLn8Ghp+8SlEy28j+r2DiMQ4EK7cabL6M
 thgQ==
X-Gm-Message-State: AJIora+ay1QObUQ0pTmzGWY3SdSYYEaLKlzQzAI/gF561qA7F9TgxefZ
 QZHooA0oXWrp6+JNku2Tj7nQSQ==
X-Google-Smtp-Source: AGRyM1stEKOa97MHGOwvfFGeoSt3FuS+Eu5m4yHonr0NYFdvsXzMyJYZLHDcfQQpysoq8eIb4KKNAg==
X-Received: by 2002:a05:651c:50b:b0:259:957:f2c6 with SMTP id
 o11-20020a05651c050b00b002590957f2c6mr4985704ljp.26.1655296212733; 
 Wed, 15 Jun 2022 05:30:12 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 f27-20020a19381b000000b00479050b8260sm1782521lfa.104.2022.06.15.05.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 05:30:12 -0700 (PDT)
Message-ID: <3f595dba-36e7-59ed-04d6-af1f1259b3ba@linaro.org>
Date: Wed, 15 Jun 2022 15:30:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] drm/msm/dsi: Use single function for reset
Content-Language: en-GB
To: Luca Weiss <luca@z3ntu.xyz>, dri-devel@lists.freedesktop.org
References: <20220610220259.220622-1-luca@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220610220259.220622-1-luca@z3ntu.xyz>
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
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/06/2022 01:02, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> There is currently two function for performing reset: dsi_sw_reset and
> dsi_sw_reset_restore. Only difference betwean those is that latter one
> assumes that DSI controller is enabled. In contrary former one assumes
> that controller is disabled and executed during power-on. However this
> assumtion is not true mobile devices which have boot splash set up by
> boot-loader.
> 
> This patch removes dsi_sw_reset_restore and makes dsi_sw_reset disable
> DSI controller during reset sequence if it's enabled.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 48 +++++++++++++-----------------
>   1 file changed, 21 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index a95d5df52653..bab2634ebd11 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1080,12 +1080,32 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   
>   static void dsi_sw_reset(struct msm_dsi_host *msm_host)
>   {
> +	u32 ctrl;
> +
> +	ctrl = dsi_read(msm_host, REG_DSI_CTRL);
> +
> +	if (ctrl & DSI_CTRL_ENABLE) {
> +		dsi_write(msm_host, REG_DSI_CTRL, ctrl & ~DSI_CTRL_ENABLE);
> +		/*
> +		 * dsi controller need to be disabled before
> +		 * clocks turned on
> +		 */
> +		wmb();
> +	}
> +
>   	dsi_write(msm_host, REG_DSI_CLK_CTRL, DSI_CLK_CTRL_ENABLE_CLKS);
>   	wmb(); /* clocks need to be enabled before reset */
>   
> +	/* dsi controller can only be reset while clocks are running */
>   	dsi_write(msm_host, REG_DSI_RESET, 1);
>   	msleep(DSI_RESET_TOGGLE_DELAY_MS); /* make sure reset happen */
>   	dsi_write(msm_host, REG_DSI_RESET, 0);
> +	wmb(); /* controller out of reset */
> +
> +	if (ctrl & DSI_CTRL_ENABLE) {
> +		dsi_write(msm_host, REG_DSI_CTRL, ctrl);
> +		wmb();	/* make sure dsi controller enabled again */
> +	}
>   }
>   
>   static void dsi_op_mode_config(struct msm_dsi_host *msm_host,
> @@ -1478,32 +1498,6 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
>   	return len;
>   }
>   
> -static void dsi_sw_reset_restore(struct msm_dsi_host *msm_host)
> -{
> -	u32 data0, data1;
> -
> -	data0 = dsi_read(msm_host, REG_DSI_CTRL);
> -	data1 = data0;
> -	data1 &= ~DSI_CTRL_ENABLE;
> -	dsi_write(msm_host, REG_DSI_CTRL, data1);
> -	/*
> -	 * dsi controller need to be disabled before
> -	 * clocks turned on
> -	 */
> -	wmb();
> -
> -	dsi_write(msm_host, REG_DSI_CLK_CTRL, DSI_CLK_CTRL_ENABLE_CLKS);
> -	wmb();	/* make sure clocks enabled */
> -
> -	/* dsi controller can only be reset while clocks are running */
> -	dsi_write(msm_host, REG_DSI_RESET, 1);
> -	msleep(DSI_RESET_TOGGLE_DELAY_MS); /* make sure reset happen */
> -	dsi_write(msm_host, REG_DSI_RESET, 0);
> -	wmb();	/* controller out of reset */
> -	dsi_write(msm_host, REG_DSI_CTRL, data0);
> -	wmb();	/* make sure dsi controller enabled again */
> -}
> -
>   static void dsi_hpd_worker(struct work_struct *work)
>   {
>   	struct msm_dsi_host *msm_host =
> @@ -1520,7 +1514,7 @@ static void dsi_err_worker(struct work_struct *work)
>   
>   	pr_err_ratelimited("%s: status=%x\n", __func__, status);
>   	if (status & DSI_ERR_STATE_MDP_FIFO_UNDERFLOW)
> -		dsi_sw_reset_restore(msm_host);
> +		dsi_sw_reset(msm_host);
>   
>   	/* It is safe to clear here because error irq is disabled. */
>   	msm_host->err_work_state = 0;


-- 
With best wishes
Dmitry
