Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E016A5EBB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 19:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839B310E4EF;
	Tue, 28 Feb 2023 18:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF2810E4F3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 18:26:56 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id n2so14377901lfb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 10:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oeTqNJz+wlwStd3akJO6gZ1qy6VhdHZAOZjVTjq8Ths=;
 b=Hg303GL4P5Q2pdSN9pUyE1WywQFRKlLyQo6KYVr9Mu/xlV3i7uJRW1lj0VpgRxGJkD
 hTkQgY+xkkFxoqMaS4Lyfb41a8HJ3jHlc3udXm1O/bq0R1p7t9bEwhwna2k4KBHwyjap
 IRWuIC0ygcPQlsczqypuN6JiOkQiKSA1pLtSECv47HVme91A7K6bdx+gVw+lWNoN5FgN
 2oH0gSOJvFII3PBDbfnKkMCa1kwYlZwAVTPjnf5i+3K8CwkItAwH13tJM9wbBTz2RYpc
 0lovVIKHM4ergXahJguy9+XePKMKZR7NVzjvkBZjHPd6Oy3u9RhHb7oyDykO0VBUvQ8x
 IPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oeTqNJz+wlwStd3akJO6gZ1qy6VhdHZAOZjVTjq8Ths=;
 b=VWTM5i2I7bQd2yyNwKS76ngoriNktT+j18k/dlTapFoWDi6P0BYUn6jQqBv+w6QWcg
 9tgxdg2CuiPYrc6s01VH8DXs9tIT1STenibf7KsmhGBFCBmZnxwDNFVKAiLUR8m34Wzn
 PMb+KqFlg/0L0/MIAY5oqITxV2sldeS+G7i6JkYgycVsPyxEMGbzAzSr7Fv/D3h2KPXv
 hVqo8k3gzzWfBL0Wgi1oxeJVdZ/D98fF0NuuFEnJUDkWbDhm3z6hSG7iSmiLCW6TwykC
 OUBg5uuBXvo46MbsAnP/l8t4atjg1ZxDkF38qLa2JufNhrJsuhCFxrEDfJ7BVAhGbaf2
 ZE/w==
X-Gm-Message-State: AO0yUKUW5i6iYvhamYZsnS6vIqdCmkrsv2mgtoBij/whQv4Zl4+QUepE
 6+siEfxMSez9Jdb17ljVhkaJIg==
X-Google-Smtp-Source: AK7set8ibk/owvLCNHo66A+Nyj9jA4S4dqpTehR9707ManX49TtuMEUwwMN0vBPr18saVuIdlRgI9Q==
X-Received: by 2002:ac2:532f:0:b0:4e1:1bfe:38f7 with SMTP id
 f15-20020ac2532f000000b004e11bfe38f7mr849063lfh.27.1677608814434; 
 Tue, 28 Feb 2023 10:26:54 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 1-20020ac25681000000b004dda9e8233asm1419865lfr.42.2023.02.28.10.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 10:26:54 -0800 (PST)
Message-ID: <25b0283b-3d87-6b08-22a9-50c470c3d32f@linaro.org>
Date: Tue, 28 Feb 2023 20:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2] drm/msm/disp/dpu: fix sc7280_pp base offset
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
 andersson@kernel.org
References: <1677533800-3125-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1677533800-3125-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/02/2023 23:36, Kuogee Hsieh wrote:
> At sc7280, pingpong block is used to management the dither effects
> to reduce distortion at panel. Currently pingpong-0 base offset is
> wrongly set at 0x59000. This mistake will not cause system to crash.
> However it will make dither not work. This patch correct sc7280 ping
> pong-0 block base offset.
> 
> Changes in v2:
> -- add more details info n regrading of pingpong block at commit text
> 
> Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

