Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C78846E86EF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 02:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B233610E248;
	Thu, 20 Apr 2023 00:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA13710E207
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 00:49:32 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id r9so939488ljp.9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 17:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681951771; x=1684543771;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nBTNgbwSnEqrTM/8Zo3F3tUjXoH2/yS/Mjd7eOQXnxA=;
 b=d4mVL2ra6uk1DxPznvuIlP+NohLtEcADu43dZmKn68AbF9I1zDQUZtYdsL9Ka0fhK3
 yBoz6Y7I3MnVwjpbhFc9Th4t+ZXspnyWt7Lc6y12HI5yaJ6oqi4MJEWpl1d7uYP8stbM
 LNKY3VIrY9nuQjCTDZIOnB5RGi61FRnWR7cQ4mUK/Zf7IQ/ucseIb93BUhbJqZoJKQ/m
 z7tRSVl+KOi6Rk5qzuPo+pDa1Dr99MX2uMLjhsgfGnfHbDtTrro1EULq4qpm9VahfKvA
 VpcozY7D8YtZNPLSSDC+bUNOOjPLdDTCgCy4RrCInmG9axwD2Gd/JZj5qr3K9X17LUen
 jbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681951771; x=1684543771;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nBTNgbwSnEqrTM/8Zo3F3tUjXoH2/yS/Mjd7eOQXnxA=;
 b=UH1fgmK651ULKBNOmJikULDk1I0AO9noRFatd1vPXqHLJVEUhIHcZJr83gibRGqVYi
 KyBthbh6GOzrgJc4sSCLBtFrUTs2K+BWTB3qVHfOD0tfMeVHxTseDgUU968qBqX3vy9v
 3Y9gltoVsW8ILgXJA4DBVmq9Voj/b/DgJKHhzYsE46epvVcbIkWVtAfoVSVZY6X02tAL
 R7ruCISA8JRgpn4X1SEBk3bGy7aYUfoLAqBXvy1vPJJeF+VAGjgbkpQMO6GjCiGK1826
 3vAlDjGFPP6/bVaybJQLNqcVRjYnUjZ31hd7Z80Cn3Tn7DBij06rT/oaPgHlcEQNUI4S
 jzfw==
X-Gm-Message-State: AAQBX9fAYUfrcAYmxbIZxDOQXMC1lb8Oq/Wzp/0999F1zX+7E6isOVwb
 RZBDPwfvgHFrkRPeFnMCzYW7eQ==
X-Google-Smtp-Source: AKy350a58zmn+YohNF/dZT6zaO4ejf273w1HbL0Zriw2gCHMn/70LvEy/Q0m9ouzpmYgb6kSJCE2QA==
X-Received: by 2002:a2e:6e0f:0:b0:2a8:bd3a:d418 with SMTP id
 j15-20020a2e6e0f000000b002a8bd3ad418mr2264178ljc.52.1681951771044; 
 Wed, 19 Apr 2023 17:49:31 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a2e9584000000b002a8bae7f9e8sm17599ljh.129.2023.04.19.17.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:49:30 -0700 (PDT)
Message-ID: <c4344301-2c89-3b8b-2a5c-e6523f078fd9@linaro.org>
Date: Thu, 20 Apr 2023 03:49:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 09/17] drm/msm/dpu: Move autorefresh disable from CMD
 encoder to pingpong
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Skladowski <a39.skl@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-9-ef76c877eb97@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-9-ef76c877eb97@somainline.org>
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/04/2023 23:21, Marijn Suijten wrote:
> This autorefresh disable logic in the physical command-mode encoder
> consumes three callbacks to the pingpong block, and will explode in
> unnecessary complexity when the same callbacks need to be called on the
> interface block instead to accommodate INTF TE support.  To clean this
> up, move the logic into the pingpong block under a disable_autorefresh
> callback, replacing the aforementioned three get_autorefresh,
> setup_autorefresh and get_vsync_info callbacks.
> 
> The same logic will have to be replicated to the interface block when it
> receives INTF TE support, but it is less complex than constantly
> switching on a "has_intf_te" boolean to choose a callback.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 60 ++--------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    | 47 +++++++++++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    | 25 ++-------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  4 ++
>   4 files changed, 57 insertions(+), 79 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

