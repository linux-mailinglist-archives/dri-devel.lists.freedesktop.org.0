Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6106D721427
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 04:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B0010E0D2;
	Sun,  4 Jun 2023 02:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F33E10E099
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 02:39:15 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f61735676fso1879502e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jun 2023 19:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685846353; x=1688438353;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oMukeZsIPK9VY+jN6lO5nE+HniRt3DWSTDLIp8k6jQc=;
 b=jtROz0fXdfiIHIOYlEGo1RqI57Xt9Eh7ZYyQddwsfunow3aWsMu+/HxczEcLuRPp4Z
 dKNJIgsMVM+VI9k3As1NYL/xM04D0fuv5WSC60Osribmnui3GsuILV5nN7UdslLRJOr4
 GTgyMtPEEn9aI5eHz3iisjsZ2bfqOL6povcl77pSnghRPbZVb4BoDtq/QDjEmBNZmgU2
 Atsa6su2/AssHHBu/bWGpBELJ1aj3i046yFYYR6rwNaF/4Lt6eBARlYFG0VqxSjOciIT
 yRbwGjO6oWfFV+za0yY6Wfz7P7JcI7raZvcOfx4x8MZ/FdPqu+kJOZpK46YhRY8rZ3TX
 u2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685846353; x=1688438353;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oMukeZsIPK9VY+jN6lO5nE+HniRt3DWSTDLIp8k6jQc=;
 b=B8hfx7dx71FxS5tuBPP2PKjKW0Joq55IcQps7azCXRcXpmunJSaRoPHu6Cz6SvHTon
 9zXUqOhdNxRN/aox/U16lg22HzWs2bYMlXPPi81Gnf/5lcSxoYXkXYwF0N96cfR3xmtg
 /zRuBWzy2iwwnQECmDc9pE/POiakYntFbsfTC/N4018ySNe3ejLdOqLJfUQ6ejrIORjs
 boadCfwERh+RoYR4jjX5sszeTCneJFuCHnu68fEJ0voEhhsEtp5JCdGo6dfXcH0w5N3G
 +nxcVgn8kRb2sS8MWkNn0YiXKSAsP9UVK8GoYcxvfLpK7EUnhl+/YUvUI+TowhMH7+8Q
 XxGw==
X-Gm-Message-State: AC+VfDw+jSQWmXF48d5Qu4Jsn+ktIOPhdprPAlgwAjjy5UTcesAAulcD
 4E1bNHiCuGj+hdCIBpuPCEun2g==
X-Google-Smtp-Source: ACHHUZ5D9QfTFJ7LYIjyZ34kZ1xnm+FM48ToTGYMYOaQS6D5GlphlJ2LfDuS/Lo1Qo+BuGyfh75rVw==
X-Received: by 2002:a2e:6a18:0:b0:2b1:af36:93d9 with SMTP id
 f24-20020a2e6a18000000b002b1af3693d9mr1987200ljc.26.1685846353479; 
 Sat, 03 Jun 2023 19:39:13 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d9-20020ac244c9000000b004f24db9248dsm210750lfm.141.2023.06.03.19.39.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 19:39:12 -0700 (PDT)
Message-ID: <b038052c-c8e2-9aa1-2b80-792563d219ba@linaro.org>
Date: Sun, 4 Jun 2023 05:39:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 6/7] drm/msm/dsi: Add phy configuration for MSM8226
Content-Language: en-GB
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
 <20230308-msm8226-mdp-v3-6-b6284145d67a@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230308-msm8226-mdp-v3-6-b6284145d67a@z3ntu.xyz>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/06/2023 20:00, Luca Weiss wrote:
> MSM8226 uses a modified PLL lock sequence compared to MSM8974, which is
> based on the function dsi_pll_enable_seq_m in the msm-3.10 kernel.
> 
> Worth noting that the msm-3.10 downstream kernel also will try other
> sequences in case this one doesn't work, but during testing it has shown
> that the _m sequence succeeds first time also:
> 
>    .pll_enable_seqs[0] = dsi_pll_enable_seq_m,
>    .pll_enable_seqs[1] = dsi_pll_enable_seq_m,
>    .pll_enable_seqs[2] = dsi_pll_enable_seq_d,
>    .pll_enable_seqs[3] = dsi_pll_enable_seq_d,
>    .pll_enable_seqs[4] = dsi_pll_enable_seq_f1,
>    .pll_enable_seqs[5] = dsi_pll_enable_seq_c,
>    .pll_enable_seqs[6] = dsi_pll_enable_seq_e,
> 
> We may need to expand this in the future.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  3 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 97 ++++++++++++++++++++++++++++++
>   3 files changed, 101 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

