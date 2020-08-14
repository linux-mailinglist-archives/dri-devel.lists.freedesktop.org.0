Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89291245D18
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4D16E44D;
	Mon, 17 Aug 2020 07:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF2C6EB90
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 17:12:14 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id h8so5180496lfp.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 10:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oTnqLQcun1oAd2jUgg7+f/faki/0xT/2c6vC8h9xpbw=;
 b=N3zwz4kQcVvMDiCWrRIXQz2rRp6Dmu6TWX489BnbDLouEXbPNNxetAQAHQn7vcfPdu
 D9dcGIwxDz5vTquvaVCKu8GwUZ6SxBY5udXv80hJnLBc4vR2jd3e4cGFahp67Xp6XZWE
 mxNwn2EuMvR6D0c6CP82qtNyRQrf2d8koRH03SsRhkmFhZqZWBxAlMQtIJMenvRsPp79
 9bea1KRn3PBOL0pvZXzkH2XhjfiP90TOPxtXA0XCDKHhIlzkJ+CPggG27aaCShGiNEC1
 RnhRYAG3Nx4KQ15TPkWH5lpOwxRJoFnFcRUEEF0+RctAWC1tIcMCmdR4DKvdpiyvkLPf
 VQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oTnqLQcun1oAd2jUgg7+f/faki/0xT/2c6vC8h9xpbw=;
 b=i1B9+2NlgEd7/TfKtXv5xysF4tnmsc1Ku8UiwixUPfhADobSjsg7Ri3YeRaKqqHyV2
 eY5QKmTjWJaLUC1CmlFS5tIK3GWSHsVGLbfLnnPC1PsgwxabgPHsmfAcDhaSffqpu73c
 2gvwi1spRGjrOTLAUvHTyAfTkuhRhL6uSCKsmc8d/eqp8IeAMSaL/hJstSyeNpkVieQ6
 YpaSSNfBgNY6jAp0iaG0m4brWGWocp2e0JSRkZJHfAux0O3SJvw/rGes/fzy93S1c6bL
 Jzu++6aAGrS9FJ77GYLytHZRG3O1O1i1iEBPQe1G5oVpUHIQ4q6NiWCzWHZu+zmFMQ0b
 /ZnQ==
X-Gm-Message-State: AOAM5312uR7DciMMGVYuw7947wU+KDx0PZOzkVf+tKycCs/o1ZVDuxO7
 AGptHEv79tH+zMwa+CtvHgeXfg==
X-Google-Smtp-Source: ABdhPJwthnbVLKpJB0/hPo/55RCT2z4Bd1DEwwzsboqMb6G7MLrh7IK+1wUoKkMpH/2PdYyI/Fnvuw==
X-Received: by 2002:ac2:5468:: with SMTP id e8mr1656731lfn.83.1597425132894;
 Fri, 14 Aug 2020 10:12:12 -0700 (PDT)
Received: from [192.168.43.7] ([188.162.64.200])
 by smtp.gmail.com with ESMTPSA id q10sm1874788ljh.110.2020.08.14.10.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 10:12:12 -0700 (PDT)
Subject: Re: [PATCH v10 2/5] drm/msm/dp: add displayPort driver support
To: Tanmay Shah <tanmay@codeaurora.org>, swboyd@chromium.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com
References: <20200812044223.19279-1-tanmay@codeaurora.org>
 <20200812044223.19279-3-tanmay@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <324d61b6-fc26-03ea-f8af-ff74a9767da2@linaro.org>
Date: Fri, 14 Aug 2020 20:12:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200812044223.19279-3-tanmay@codeaurora.org>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 khsieh@codeaurora.org, seanpaul@chromium.org,
 Guenter Roeck <groeck@chromium.org>, Vara Reddy <varar@codeaurora.org>,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On 12/08/2020 07:42, Tanmay Shah wrote:
> From: Chandan Uddaraju <chandanu@codeaurora.org>

[skipped]

> +		} else if ((dp_parser_check_prefix("ctrl", clk_name) ||
> +			   dp_parser_check_prefix("stream", clk_name))  &&
> +			   ctrl_clk_index < ctrl_clk_count) {
> +			struct dss_clk *clk =
> +				&ctrl_power->clk_config[ctrl_clk_index];
> +			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
> +			ctrl_clk_index++;
> +
> +			if (!strncmp(clk_name, "ctrl_link",
> +					strlen("ctrl_link")) ||
> +					!strncmp(clk_name, "stream_pixel",
> +					strlen("ctrl_pixel")))

This should be "stream_pixel", I believe. I don't like macros, but most 
probably it would help here. Also function/brace alignment could be 
better (sorry, it really hides the issue here).


> +				clk->type = DSS_CLK_PCLK;
> +			else
> +				clk->type = DSS_CLK_AHB;
> +		}
> +	}


-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
