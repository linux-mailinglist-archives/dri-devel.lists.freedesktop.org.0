Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD56C6E6456
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 14:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9916310E2DE;
	Tue, 18 Apr 2023 12:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A618944A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 12:48:19 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2a8b1b51dbdso18829911fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 05:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681822097; x=1684414097;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rqkVwolejCdv7/LNkbu+t+btGlUG3iVPjdNQQHw5yQY=;
 b=oQ+qFLCEG9J9a5jrSb8sD+YsmkMFiFkIttLtlCdvsshEIEnZtWZRmYJ966M7RFkLMw
 9o4I3aC9Pycxsq5aEfYTULz84exswFJ+oTWCM3tWnPNSXj6M/qrGiUY1dNQeQV9eiTss
 8pDGVYkhDPBGa3i4W7tMKRfMMDRbF4BfU5UKlkef6zPQItgy4zsYuLrKAo3lFnPFXGxc
 E9uuC3vi4yvpDlm4fK5JwX6EjrLhnPoEgc3cxE7unYCNSH77Sk9d+sTEs2IV8RRrp17e
 ZHVXSyi7V4lFgQ+pfJJXUwrh/Ou0G3woSDpAn980VLMI80GQpPNGaTaXpVTozq46AkSk
 mXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681822097; x=1684414097;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rqkVwolejCdv7/LNkbu+t+btGlUG3iVPjdNQQHw5yQY=;
 b=MqKL691p9v7ZAOufO8zdGMsBYc3MC0h1lZRYMnKGeoEHM1HmCBDLJO0JHZsijeEiOc
 4NV1qhNyH+M7qOJRxx1pxWZqg6eP9gYkz7396rNSgMRqLIJpHTBp6IjArjYvv4cg6n0Y
 XEd6k1eTNxrcVdvBYbXPOxiFiI7hWjgPQzDnBit+Lv3/AnDd+qT/94Hf0mB4qZxMVuhB
 kxrUU/GgOhfOksh/9PrWr05xtNGEahNAJoUEYMue+wSaDrp3UwhLdqnKqpCJRiOdcnUe
 k8q1Iq/JeIIfK/86zWDP69wkJN0S1Im4qwYbU8FdFoR7BO8lyJvPzDBVCymBKWUtzCRD
 mRSw==
X-Gm-Message-State: AAQBX9dTqQqI6Rpc8HZIcVHDF96pMf45viD0NqJkzmD3fKNCgHBbh8O6
 uMuVcCoY2rORqIgkdk9Y9mOpgw==
X-Google-Smtp-Source: AKy350YgUWriHDzQ+saslLDjtDpjVNzRae1Rsdzb2Mwj+wi1eAw2DcOIcDtAuqHB7/YJPjBumy0l6w==
X-Received: by 2002:a19:7606:0:b0:4d5:831a:1af8 with SMTP id
 c6-20020a197606000000b004d5831a1af8mr2899464lff.40.1681822097189; 
 Tue, 18 Apr 2023 05:48:17 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 13-20020ac25f0d000000b004ec8a7e5362sm2376404lfq.101.2023.04.18.05.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 05:48:16 -0700 (PDT)
Message-ID: <5cc3b85c-1860-757e-471c-e69269276e23@linaro.org>
Date: Tue, 18 Apr 2023 14:48:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 10/17] drm/msm/dpu: Disable pingpong TE on DPU 5.0.0
 and above
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Adam Skladowski <a39.skl@gmail.com>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-10-ef76c877eb97@somainline.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-10-ef76c877eb97@somainline.org>
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.04.2023 22:21, Marijn Suijten wrote:
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
I believe everything here is correct, even though there's
quite a bunch of stuff involved:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  8 +++----
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  8 +++----
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 12 +++++------
>  .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 12 +++++------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 12 +++++------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  4 ++--
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  2 +-
>  .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  2 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 12 +++++------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  8 +++----
>  .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 24 ++++++++++-----------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 16 +++++++-------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 25 ++++++++++------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    | 12 ++++++-----
>  14 files changed, 78 insertions(+), 79 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 2b3ae84057df..b7845591c384 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -112,16 +112,16 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg msm8998_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SDM845_MASK, 0, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SDM845_MASK, 0, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index ceca741e93c9..5b9b3b99f1b5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -110,16 +110,16 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sdm845_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SDM845_MASK, 0, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SDM845_MASK, 0, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 282d410269ff..43cf813a4766 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -128,22 +128,22 @@ static const struct dpu_dspp_cfg sm8150_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sm8150_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_TE2_MASK, MERGE_3D_0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk_te,
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_TE2_MASK, MERGE_3D_0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, sdm845_pp_sblk,
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, sdm845_pp_sblk,
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> -	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, sdm845_pp_sblk,
> +	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>  			-1),
> -	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, sdm845_pp_sblk,
> +	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>  			-1),
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index c57400265f28..1313193f410b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -116,22 +116,22 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sc8180x_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_TE2_MASK, MERGE_3D_0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk_te,
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_TE2_MASK, MERGE_3D_0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, sdm845_pp_sblk,
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, sdm845_pp_sblk,
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> -	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, sdm845_pp_sblk,
> +	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>  			-1),
> -	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, sdm845_pp_sblk,
> +	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>  			-1),
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index 2c40229ea515..f8378990aa25 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -129,22 +129,22 @@ static const struct dpu_dspp_cfg sm8250_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sm8250_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_TE2_MASK, MERGE_3D_0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk_te,
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_TE2_MASK, MERGE_3D_0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, sdm845_pp_sblk,
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, sdm845_pp_sblk,
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> -	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, sdm845_pp_sblk,
> +	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>  			-1),
> -	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, sdm845_pp_sblk,
> +	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>  			-1),
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 8799ed757119..68d1fb988b0d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -80,8 +80,8 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sc7180_pp[] = {
> -	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te, -1, -1),
> -	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_TE2_MASK, 0, sdm845_pp_sblk_te, -1, -1),
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_TE2_MASK, 0, sdm845_pp_sblk_te, -1, -1),
>  };
>  
>  static const struct dpu_intf_cfg sc7180_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index 988d820f7ef2..e15dc96f1286 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -60,7 +60,7 @@ static const struct dpu_dspp_cfg sm6115_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sm6115_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
>  		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>  		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index c9003dcc1a59..2ff98ef6999f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -57,7 +57,7 @@ static const struct dpu_dspp_cfg qcm2290_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg qcm2290_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
>  		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>  		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 41ef0c8fc993..6b7e1837422a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -127,22 +127,22 @@ static const struct dpu_dspp_cfg sm8350_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sm8350_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sdm845_pp_sblk,
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sdm845_pp_sblk,
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> -	PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sdm845_pp_sblk,
> +	PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>  			-1),
> -	PP_BLK("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sdm845_pp_sblk,
> +	PP_BLK("pingpong_5", PINGPONG_5, 0x6e000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>  			-1),
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 5957de185984..0961fa5c3907 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -87,10 +87,10 @@ static const struct dpu_dspp_cfg sc7280_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sc7280_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk, -1, -1),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, PINGPONG_SM8150_MASK, 0, sc7280_pp_sblk, -1, -1),
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, PINGPONG_SM8150_MASK, 0, sc7280_pp_sblk, -1, -1),
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, PINGPONG_SM8150_MASK, 0, sc7280_pp_sblk, -1, -1),
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, PINGPONG_SM8150_MASK, 0, sc7280_pp_sblk, -1, -1),
>  };
>  
>  static const struct dpu_intf_cfg sc7280_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 12c14d15e386..bad1c688517d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -121,18 +121,18 @@ static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk,
> -		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk,
> -		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9), -1),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sdm845_pp_sblk,
> -		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10), -1),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sdm845_pp_sblk,
> -		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11), -1),
> -	PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sdm845_pp_sblk,
> -		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30), -1),
> -	PP_BLK("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sdm845_pp_sblk,
> -		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9), -1),
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10), -1),
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11), -1),
> +	PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30), -1),
> +	PP_BLK("pingpong_5", PINGPONG_5, 0x6e000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
> +			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
>  };
>  
>  static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index e409c119b0a2..efd3aa6c9bc1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -128,28 +128,28 @@ static const struct dpu_dspp_cfg sm8450_dspp[] = {
>  };
>  /* FIXME: interrupts */
>  static const struct dpu_pingpong_cfg sm8450_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk,
> +	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sdm845_pp_sblk,
> +	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sdm845_pp_sblk,
> +	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> -	PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sdm845_pp_sblk,
> +	PP_BLK("pingpong_4", PINGPONG_4, 0x6d000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>  			-1),
> -	PP_BLK("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sdm845_pp_sblk,
> +	PP_BLK("pingpong_5", PINGPONG_5, 0x6e000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>  			-1),
> -	PP_BLK("pingpong_6", PINGPONG_6, 0x65800, MERGE_3D_3, sdm845_pp_sblk,
> +	PP_BLK("pingpong_6", PINGPONG_6, 0x65800, PINGPONG_SM8150_MASK, MERGE_3D_3, sdm845_pp_sblk,
>  			-1,
>  			-1),
> -	PP_BLK("pingpong_7", PINGPONG_7, 0x65c00, MERGE_3D_3, sdm845_pp_sblk,
> +	PP_BLK("pingpong_7", PINGPONG_7, 0x65c00, PINGPONG_SM8150_MASK, MERGE_3D_3, sdm845_pp_sblk,
>  			-1,
>  			-1),
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index ca8a02debda9..2d16cdbd7d44 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -75,11 +75,18 @@
>  #define MIXER_QCM2290_MASK \
>  	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
>  
> -#define PINGPONG_SDM845_MASK BIT(DPU_PINGPONG_DITHER)
> +#define PINGPONG_SDM845_MASK \
> +	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE))
>  
> -#define PINGPONG_SDM845_SPLIT_MASK \
> +#define PINGPONG_SDM845_TE2_MASK \
>  	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>  
> +#define PINGPONG_SM8150_MASK \
> +	(BIT(DPU_PINGPONG_DITHER))
> +
> +#define PINGPONG_SM8150_TE2_MASK \
> +	(PINGPONG_SM8150_MASK | BIT(DPU_PINGPONG_TE2))
> +
>  #define CTL_SC7280_MASK \
>  	(BIT(DPU_CTL_ACTIVE_CFG) | \
>  	 BIT(DPU_CTL_FETCH_ACTIVE) | \
> @@ -501,21 +508,11 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>  	.intr_done = _done, \
>  	.intr_rdptr = _rdptr, \
>  	}
> -#define PP_BLK_TE(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
> +#define PP_BLK(_name, _id, _base, _features, _merge_3d, _sblk, _done, _rdptr) \
>  	{\
>  	.name = _name, .id = _id, \
>  	.base = _base, .len = 0xd4, \
> -	.features = PINGPONG_SDM845_SPLIT_MASK, \
> -	.merge_3d = _merge_3d, \
> -	.sblk = &_sblk, \
> -	.intr_done = _done, \
> -	.intr_rdptr = _rdptr, \
> -	}
> -#define PP_BLK(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
> -	{\
> -	.name = _name, .id = _id, \
> -	.base = _base, .len = 0xd4, \
> -	.features = PINGPONG_SDM845_MASK, \
> +	.features = _features, \
>  	.merge_3d = _merge_3d, \
>  	.sblk = &_sblk, \
>  	.intr_done = _done, \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index dea270c0936f..4a20a5841f22 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -300,11 +300,13 @@ static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
>  static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>  				unsigned long features)
>  {
> -	c->ops.setup_tearcheck = dpu_hw_pp_setup_te_config;
> -	c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
> -	c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
> -	c->ops.get_line_count = dpu_hw_pp_get_line_count;
> -	c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
> +	if (test_bit(DPU_PINGPONG_TE, &features)) {
> +		c->ops.setup_tearcheck = dpu_hw_pp_setup_te_config;
> +		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
> +		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
> +		c->ops.get_line_count = dpu_hw_pp_get_line_count;
> +		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
> +	}
>  	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
>  	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>  	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> 
