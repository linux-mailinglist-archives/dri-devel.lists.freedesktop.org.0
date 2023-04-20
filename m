Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 959D66E8742
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 03:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC1010E8BD;
	Thu, 20 Apr 2023 01:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E6A10E768
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 01:12:31 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id r9so984719ljp.9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 18:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681953149; x=1684545149;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=21nptXt3cg+q1Dc02GTtpl0ccYXLvq/yqLo2KDOgpRw=;
 b=fxkJnyU8icPIp/1qZzwMsW4MAEuaR6QIt7EytgE1TnnVWnDpUJ0PgBlPXKAm+cOBgf
 3GQPMpv71Q6pQBakCcemnzr7qLRagEBIA22W9DVCQMa62vwLf+hgaOV/7anvdrw+SKaw
 iLXGJsZyPZ+NPp4lApFtLxZhB2ibaxq2EvcNOY5H2O3HA8KsGpRq5jwDc+fC/iuMEne/
 WUnrsRrMFSphEu2RWxa8k7fH3eXutm4Kuudd8fLaAnEGtydGCtjf8ym3LgrX6cVxfsKX
 B/lPpxI0Ox6B8xv3ekLlr3ZHFCOJ5PeBoaU6VzSFLikDWcbYtEVWafmGq1zRfQKJaBW9
 98Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681953149; x=1684545149;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=21nptXt3cg+q1Dc02GTtpl0ccYXLvq/yqLo2KDOgpRw=;
 b=EMJ1RNaQkulrZUYAwSc/dTTYrPNMDVnoLuNAURRaIwdl2S6XzcgL3fWEg/xgYysl/U
 Lz+qarAO+Bbl71G2LwxOKTTE4CJBe6VZlF9yP2bHYE2ea6X7fj5WI5etH28OfleTivkK
 UQ1wTeglhStKt1kFV1BnZD5rVQ4y+6cBgeH4WhvDTa0ZIpl4SRIyeXRriLUSztuJQ85D
 X7S4rlQqIXsLCRLeuKHcNzQteFroF4TGwtqUKwebj+JoE69KQ/Nv/d49Tx0hWW6HaFL7
 XeYP8DIQbsGm+0JkzBdMG/iY4G9NxH75e4f4f6jnIPK3rd85HL2qeaG0HfPVgKJDP64w
 Zl8Q==
X-Gm-Message-State: AAQBX9eiHBEiDunf+nGidNZR9PPXA5TMaRKOy/uKzFigZl9XXZlDazsY
 hm6iIZ+cfHqVtZPz8qgbPjj/DQ==
X-Google-Smtp-Source: AKy350bhbY3KYzfzX6sqiAFhHWulaltqj9jFwTi0Bp7JHJbhJdLwQ3z61rWtdQrTn2JY3Vh6XjqsRg==
X-Received: by 2002:a2e:834c:0:b0:29b:6ead:6d92 with SMTP id
 l12-20020a2e834c000000b0029b6ead6d92mr2381880ljh.23.1681953149392; 
 Wed, 19 Apr 2023 18:12:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a05651c011500b002a8bc2fb3cesm27546ljb.115.2023.04.19.18.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 18:12:28 -0700 (PDT)
Message-ID: <8b3d3379-1217-9f48-b761-06bf13169d0f@linaro.org>
Date: Thu, 20 Apr 2023 04:12:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Freedreno] [PATCH v2 15/17] drm/msm/dpu: Merge setup_- and
 enable_tearcheck pingpong callbacks
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
 <20230411-dpu-intf-te-v2-15-ef76c877eb97@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-15-ef76c877eb97@somainline.org>
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
> These functions are always called consecutively and are best bundled
> together for simplicity, especially when the same structure of callbacks
> will be replicated later on the interface block for INTF TE support.
> The enable_tearcheck(false) case is now replaced with a more obvious
> disable_tearcheck(), encapsulating the original register write with 0.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 10 ++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c      | 10 ++++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h      | 11 +++++------
>   3 files changed, 15 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

