Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9106D04F9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8106710EE00;
	Thu, 30 Mar 2023 12:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79D610EE00
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:39:20 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id g17so24339571lfv.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 05:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680179959;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3R3nPD3qFWgilc9137SlJTFMh5JUV9k90a6EhVZUbfc=;
 b=VWgMfw5vMFuW9l6DTwdAhG8puqPhV6tLQpKUo7pdbDkHTwEDI+XontB3ocebEsfHbL
 l3VfyZQFkbAQqBLY1TAskq1hSyvA+S4PLw3Rt1YJgQKjyrwR0Wisdk5OW3ib66iklGmU
 vcYPPwmXNNX3dSmZ1Fl3Wpt9a87cF+HyAgyy3aoGhJD8gOhfhAf9vbELn0x+GPgqICjF
 1+1Zvj3nBiUeDmOK++X0DKD4v+/FtgZtSs5KfD7Vd2hZYg0K3Qt74uNjnVRLTxX1CGd/
 zZs6Ub9kfzt9M+uYHO8vmzq8+PAUb0AH2QJZ3t0o44E5PN8gLP50xcT/3bAOcg7B66TK
 Dbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680179959;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3R3nPD3qFWgilc9137SlJTFMh5JUV9k90a6EhVZUbfc=;
 b=RKpMpty27T/wJiYlMmI+kN7duqPU/W634PkACskWfBw/w0vzjrdQe92U/e29+NM58X
 E9Hj8oYhp9sqCNo29fjp9JwqSmwX4A+ylPWH6RhAp9+HL3R264aAEBOWIoFlGqFfIm1f
 zBa4pirAEHfjLt18U+MRxD96ywbeViVc9gjibTJq4S2He+nHS1NuAtsoLtu86VZWhA59
 ELpHxDTxBKlr8oQbL6DoNhGI2E73/XoHU2AOOnL5oBG3Y+nwOlSqGjyhR26YQwdW5e2F
 03P0LezkdviXvGbC8WhGcixrTsdNUNtRunc8G9JW343uo+A1/mq1ysk/y7OSGVn7lSf0
 nO9Q==
X-Gm-Message-State: AAQBX9dICpyiRp3IRGuOasRaWntQ2SUCfLmmvNDGgjQWes8yrrbgEAJD
 Wcc81LYcKIDQ9a2dCM78OBHKuQ==
X-Google-Smtp-Source: AKy350bLpzKJFAnX7mIedg2RtMhZzL8xIMz5h26kAsbDhPqh6l/YDnnkZsD5R6IC+MCFkQxQ+FEZyg==
X-Received: by 2002:ac2:5699:0:b0:4e8:3bac:4e32 with SMTP id
 25-20020ac25699000000b004e83bac4e32mr6183124lfr.53.1680179958934; 
 Thu, 30 Mar 2023 05:39:18 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a19ee01000000b004eaf8b20014sm3436476lfb.76.2023.03.30.05.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:39:18 -0700 (PDT)
Message-ID: <e60607e3-8786-e4fe-f0fa-0851dbb53a3a@linaro.org>
Date: Thu, 30 Mar 2023 14:39:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,40/50] drm/msm/dpu: enable DSPP on sc8180x
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-41-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-41-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Enable DSPP blocks on sc8180x platform, basing on the vendor dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
There's only a single difference between 8150 and 8180:

qcom,sde-dspp-dither = <0x82c 0x00010007>;

is only present on the former. Not sure if it makes any difference.

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index c51e1bba1533..457733a6986e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -91,6 +91,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
>  	.sspp = sm8150_sspp,
>  	.mixer_count = ARRAY_SIZE(sm8150_lm),
>  	.mixer = sm8150_lm,
> +	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> +	.dspp = sm8150_dspp,
>  	.pingpong_count = ARRAY_SIZE(sm8150_pp),
>  	.pingpong = sm8150_pp,
>  	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
