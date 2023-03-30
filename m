Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E05C6D1248
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 00:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6518310F091;
	Thu, 30 Mar 2023 22:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD1F10F08D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 22:40:39 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id k37so26581872lfv.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 15:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680216037;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2/ja3fIGJRWDcuO7yeZRURjc4pI/MTQBKxIMYeWLRVY=;
 b=qxp4eqg4dlFQ3Fki7aQ/XWlce3pMJmYyAdcynlUAxSx7WvVnpgOrYyfvCRnHC+OFeo
 ofKlGEJlLVys+eQBfjt7OWLKx3GkjNs3xqhHF1e947OPe/y6cY77vUevXASfVaA23PuY
 olHGfPgJ9IvScdxwkbNCQC417JLxcSK5h5xY/iTszrORiMXybJLVbTKlPIctEzrwt0G3
 U8rluHKnKvh2PMfnSS6EB4ESFzWgxKcIpQxenIIHxk8q9zsBU+jmvJYMNvGgDvEZ1c2a
 5tphqwaDvbB+Q1b1Ol7VPiGxczco5ievV7XdX1b44e1afsN9caTxAdsJUq1XvOkeY2K3
 mbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680216037;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2/ja3fIGJRWDcuO7yeZRURjc4pI/MTQBKxIMYeWLRVY=;
 b=L0snxbZOzZM4WSLLfZf2pAbBs39T5eNBCWtTA4UBrY4j+PVUQCJbIakFMZuTJZf7AZ
 +VD133a3+9Xb4BQZu1leqUV+isuv8gf7XdgshtCDey/Rqu57SWPwafAM+VQIaqXJ8DJS
 FbaHc2VolD1Ta1P/1QxiR1O2ifrFLQnQ8IEah0yJWEtm2GlA7oJ7BYV3ARXfjYHdrVFW
 FqKrc7QAYCcTwByGiQAqUdSTaavUrBmPYRA3YcGMzRQAOkm+blHTM2rOwrPP/zq5qRbQ
 fkCKY/l0UNg/lcAa2WyzoIt069S8htwxpRt6yRm4DYlapnzAtkZP9u3npBclZtb1HVP4
 w5RA==
X-Gm-Message-State: AAQBX9fet3CXa8CIFQHDwbGGou3XXqYV7oMV5KWexv5mE2uU/EIJhtzb
 n0veJJollVjkJOQT26c1/4BlLw==
X-Google-Smtp-Source: AKy350aJj/YVs57oOua+pPg52YOhSmhHcSSpoKDYtxIqVi7a9hZWSol2a27ncUM0XvE2g54LV2AHSg==
X-Received: by 2002:a19:e05c:0:b0:4d8:86c1:4786 with SMTP id
 g28-20020a19e05c000000b004d886c14786mr2401377lfj.27.1680216037367; 
 Thu, 30 Mar 2023 15:40:37 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 v26-20020ac2561a000000b004cb8de497ffsm114763lfd.154.2023.03.30.15.40.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 15:40:37 -0700 (PDT)
Message-ID: <f32f9f21-aef2-cf58-bfcc-2f946e532fcb@linaro.org>
Date: Fri, 31 Mar 2023 00:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v3,28/38] drm/msm/dpu: enable DSPP on sc8180x
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230330215324.1853304-29-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230330215324.1853304-29-dmitry.baryshkov@linaro.org>
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



On 30.03.2023 23:53, Dmitry Baryshkov wrote:
> Enable DSPP blocks on sc8180x platform, basing on the vendor dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 92a8e474e380..bbdfec415185 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -90,6 +90,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
>  	.sspp = sm8150_sspp,
>  	.mixer_count = ARRAY_SIZE(sm8150_lm),
>  	.mixer = sm8150_lm,
> +	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> +	.dspp = sm8150_dspp,
>  	.pingpong_count = ARRAY_SIZE(sm8150_pp),
>  	.pingpong = sm8150_pp,
>  	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
