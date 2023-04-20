Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402B76E870C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 02:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FFE10E207;
	Thu, 20 Apr 2023 00:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E35310E1CF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 00:55:55 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id k15so1006930ljq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 17:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681952154; x=1684544154;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mj/IZ8/q3LWYaJuZh+m8gKrrpGLIcx9rD0SuhtK3tA0=;
 b=wKv2MHhswPxaQN1cvJymcq+PHFU2en0Au7w8Jlszz54MzG8ur11HQ1j14KwjUWi0WR
 sXqW8pubQhjY7cNDvhgNa/JeBQAHY/7Bctniz5vtabJGRW06+Vem9xbxOOY8yX5c7mdX
 sDaP+2BtiDlNzGe7uyFEYyXw97yB8igo4TggW0NikQWyehzbuqaG/llskyNC0VodlkW8
 kn7z26NUfdRo6h7E9o14ZBbT9fb816KEbifHA1LBJSz+vt3W7dmxCS2QpSxE0+Yx7idY
 B0Q2skq9z1kOdMTExgJUJA82nKI+mhWVaYd0SKHjHXC6TzvJ1GcWRiiZnGtP5q88trSP
 r0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681952154; x=1684544154;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mj/IZ8/q3LWYaJuZh+m8gKrrpGLIcx9rD0SuhtK3tA0=;
 b=JsdqUIlzTnnu5yqXNn1VeULOzT1oqaCQU6lYjwAbZ2RTricIsaIKGXntjQz9xxgxXs
 dejPuYoXhkstpdJNyRI4OOqoWn3HMBgrxSMs9GSqo6dttRMgbk7RcyhOpYHI4nV4NNIy
 JzOV67JL3JSGdUxUpm7LCj8ALQIOn6sRKxKr8QBlJwUwLonkKPOh3hknkI6WvD6Yds7F
 xUj6zRgzhulUAZA3HYZM/+Mt9dLKZI94472wfihAlJasEXJGciH7qb8JpLpAhNQL1Avv
 Bzs5ltbhCUPGodaF5fSSYJwx66tUJwFCpBH/trwufh/UrD3Nxzx0lNFg8pJal9P3VmnV
 UwDA==
X-Gm-Message-State: AAQBX9eHgcwztvH/Muj100K6B5/r7MJJvFL6NnlmqQ2RuOgiUL5eOkrV
 aoO5R7RH/kGHsQkAYwHzgndRCg==
X-Google-Smtp-Source: AKy350aBjbBI2fnSI78CYPlvQ6MQ6S6ZIkXziORI8Lxrfejc+O5akyG1vq476JVPJqKUPfd4c0EzpQ==
X-Received: by 2002:a2e:8217:0:b0:2a8:b7e6:b622 with SMTP id
 w23-20020a2e8217000000b002a8b7e6b622mr2067402ljg.46.1681952153810; 
 Wed, 19 Apr 2023 17:55:53 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a2e7812000000b002a77e01c3a0sm21056ljc.23.2023.04.19.17.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:55:53 -0700 (PDT)
Message-ID: <4bba553e-8fd0-6727-695b-452fbd69ea61@linaro.org>
Date: Thu, 20 Apr 2023 03:55:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 10/17] drm/msm/dpu: Disable pingpong TE on DPU 5.0.0
 and above
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
 <20230411-dpu-intf-te-v2-10-ef76c877eb97@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-10-ef76c877eb97@somainline.org>
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
> Since hardware revision 5.0.0 the TE configuration moved out of the
> PINGPONG block into the INTF block.  Writing these registers has no
> effect, and is omitted downstream via the DPU/SDE_PINGPONG_TE feature
> flag.  This flag is only added to PINGPONG blocks used by hardware prior
> to 5.0.0.
> 
> The existing PP_BLK_TE macro has been removed in favour of directly
> passing this feature flag, which has thus far been the only difference
> with PP_BLK.  PP_BLK_DITHER has been left in place as its embedded
> feature flag already excludes this DPU_PINGPONG_TE bit and differs by
> setting the block length to zero, as it only contains a DITHER subblock.
> 
> The code that writes to these registers in the INTF block will follow in
> subsequent patches.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  8 +++----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  8 +++----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 12 +++++------
>   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 12 +++++------
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 12 +++++------
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  4 ++--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  2 +-
>   .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  2 +-
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 12 +++++------
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  8 +++----
>   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 24 ++++++++++-----------
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 16 +++++++-------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 25 ++++++++++------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    | 12 ++++++-----
>   14 files changed, 78 insertions(+), 79 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

