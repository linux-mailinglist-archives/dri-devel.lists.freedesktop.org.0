Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E7E6D7479
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 08:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E1510E2E7;
	Wed,  5 Apr 2023 06:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3DC10E2E7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 06:36:29 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-502885ae6ceso217272a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 23:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680676587;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9yvcVihuH9wEZQZUx/B/kZ5+djU5fILXyRrycwbFq1U=;
 b=TvQBbCSWXYhS77wmCXyqApj4VkHr2Zt7VkkaLE4c0orGQF+GzuHRlgay5y0SVMhGhA
 732IXN7OjWQOo7yAqqCoiMawA+DlZr5YRZHkUqmoah2nQB4UzixnQhM3B81Uk0xghNQO
 nD6IDscAJDPRAnqt2sfn6tzpRUQqTsn5mGsMn+RLt8qllPCsF/PT3rih/fDm+xapzJIF
 kUoAELCA0O4FukpwiGXOBIFhY6UGTOSd4BSir5UxAsXW9reiJpfF79FszmSAemr3PotU
 6SKB9DAsDrx79cGo4IdvBAoZXGm5IQBkIwPHIX/scNHyVWxSMVlFSoG1GhQXeY29vhdv
 zhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680676587;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9yvcVihuH9wEZQZUx/B/kZ5+djU5fILXyRrycwbFq1U=;
 b=MLHLVdps1QBAGkCM+SfeMz3uW7pAAK1fNrsvkrwmNOogve8b+f2Yo9cyptPcidRSXj
 Q823l/6QpHt5goAtvkuoZKUq0gLdalyqVUjRSmJSlva/z9J8fjIm+6Gra+ntR+F4PBzv
 /xJei1hGPPHu9YffFOi1i0H0H9soFlREN0jgzNGfPST7gyYLwTHg0zwY49XD1m1alLnp
 VBnRZ19Wj15sDVT0nAUbsSYlHkOAgMtJ6pNAp/zh/1s4PmWu51VVlOSTa9HO6uOJ6rg9
 GqXNMeI7MsjGzPmfStlUvSCjgjFwx+jncl5tpFtTqQ3g6dkF+w8VoUWrEIgFZHuNXovA
 Vz9w==
X-Gm-Message-State: AAQBX9ehD4fMg3gy61FvSCQVTyHP6bIAUo7EyY/rcfr5nFBrr1DcUQXF
 qzWXhce7FJL/X7PO7r4AZXAVbA==
X-Google-Smtp-Source: AKy350aV0VWB0Xp1TErOrOX/pYnT3FuSj6/R0SDUrLH/kFZPjvTo+/Jt8izFFo5rNtrh7uybTcUEkg==
X-Received: by 2002:a05:6402:496:b0:501:d3a1:9a3a with SMTP id
 k22-20020a056402049600b00501d3a19a3amr747028edv.25.1680676587457; 
 Tue, 04 Apr 2023 23:36:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3f:6b2:54cd:498e?
 ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a50cd17000000b005021c7f08absm6794887edi.29.2023.04.04.23.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 23:36:27 -0700 (PDT)
Message-ID: <2b65e60f-6518-6a79-42c0-922d4574d5b2@linaro.org>
Date: Wed, 5 Apr 2023 08:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 02/15] dt-bindings: display/msm: gpu: Document GMU
 wrapper-equipped A6xx
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
 <20230223-topic-gmuwrapper-v6-2-2034115bb60c@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v6-2-2034115bb60c@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/04/2023 13:54, Konrad Dybcio wrote:
> The "GMU Wrapper" is Qualcomm's name for "let's treat the GPU blocks
> we'd normally assign to the GMU as if they were a part of the GMU, even
> though they are not". It's a (good) software representation of the GMU_CX
> and GMU_GX register spaces within the GPUSS that helps us programatically
> treat these de-facto GMU-less parts in a way that's very similar to their
> GMU-equipped cousins, massively saving up on code duplication.
> 
> The "wrapper" register space was specifically designed to mimic the layout
> of a real GMU, though it rather obviously does not have the M3 core et al.
> 
> GMU wrapper-equipped A6xx GPUs require clocks and clock-names to be
> specified under the GPU node, just like their older cousins. Account
> for that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

