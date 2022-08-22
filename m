Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3A259C4D7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 19:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2948D9A943;
	Mon, 22 Aug 2022 17:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0D39A882
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 17:14:59 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id n24so9213760ljc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 10:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=HmHJ7gWp7BcjLsSi8xEcBSYmwusbbPRlOVnswlXqR1k=;
 b=dJEvqYTyJl/xn/Peu0pFOu8cZDjSK4xFCOlOQoiNkojf2DkVuDQ1U9riuuj2M4RHCL
 X33SRW81AGp5A0CRW+kF7qE+qoTMDEn1fnnfcYnGl0jEh6t0dfubjrAAnwZCxncFUS1E
 1zDXGXOZSUt8LYF37ZcEkWhkKfS90u4/LvSUUVU8jxdK4JhGwsw9LVRED2es7b0WYfG5
 TRqGSvAWerpZZGf8Jjg8rpmq0QyGk7kmHb8Y5HbpkB9S7rCQsXvZE0DJTCQjB0Esv4Lv
 bumV6AJI7sJE91RGZc7ke5milB+ovDohahBWeJoox2hL4ezVje45qcHqoq62FAUd2dSc
 +vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=HmHJ7gWp7BcjLsSi8xEcBSYmwusbbPRlOVnswlXqR1k=;
 b=EXniLlGbzDGovYgmxMuTBRBE6Q4kMg2lofiKle55pM/P8INkQnhsna3ESetWApjfv6
 0AlGEJyLBzHLYA6wrbhTJHGIPtnRIKRUCWq6ecNrUSZlz0/6XUmL+akzehtzoNJ6oyzD
 JpkFJcgT1Upn9KRF0aON3cJWR95rBjP9+zQT97T+rM/rdjEs2OrvkcyooS7Qq73V6q7K
 VrMyDA3aqIICCBIIbRmzcnDhTO2bVHCSP2nj3IKEsri1NTB62A1+Co4WeURzRov/JGSs
 yHTXGuXPcFBMCbwMQoBIYd1gb8tVNyEgOc0wvI8apfiArITGoGX6gHTyhSBQbP385bqp
 OMUw==
X-Gm-Message-State: ACgBeo2Xx8l39wHCT5EdY6R0QmPOnRaobZL0OVkXhnRekyUkYlG8B26E
 0w7YFbK2L6yl+MPS+OmRiMemug==
X-Google-Smtp-Source: AA6agR58v6ldgC0ZLyOtTHI0ZuRbH59+jLuimO/JwRR1MpmFwzDJ54ATiXx5WOlvwYQsTXqdo+c7GQ==
X-Received: by 2002:a2e:9d02:0:b0:25d:d6b9:b753 with SMTP id
 t2-20020a2e9d02000000b0025dd6b9b753mr5728079lji.344.1661188497895; 
 Mon, 22 Aug 2022 10:14:57 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a2e3204000000b0025e15fe421bsm1910334ljy.17.2022.08.22.10.14.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 10:14:57 -0700 (PDT)
Message-ID: <c4f5290d-8151-ab90-05d9-bce321719d4c@linaro.org>
Date: Mon, 22 Aug 2022 20:14:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v4 4/6] clk: qcom: gpucc-sc7280: Add cx collapse reset
 support
Content-Language: en-GB
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>
References: <1660927246-11327-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220819221017.v4.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220819221017.v4.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, Andy Gross <agross@kernel.org>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/08/2022 19:40, Akhil P Oommen wrote:
> Allow a consumer driver to poll for cx gdsc collapse through Reset
> framework.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Convert 'struct qcom_reset_ops cx_gdsc_reset' to 'static const' (Krzysztof)
> 
> Changes in v2:
> - Minor update to use the updated custom reset ops implementation
> 
>   drivers/clk/qcom/gpucc-sc7280.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

