Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A907B6E9F59
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 00:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A835710E1F0;
	Thu, 20 Apr 2023 22:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCA610E1F0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 22:51:49 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4edb26f762dso968710e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682031107; x=1684623107;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b7QDRXKQ5hEltVWkohh/QXgJnh9OCjsLGfPd++gOLfA=;
 b=LR8pUUbhaGDkE+APTpcOJs7zvaHbRrsVVMz2qJfsgX7rM0XgeZvqz+HoDdyw4ZxdPx
 5T/GSSKeOaMPLWoBvds284aCFAi3vXuAaEQNvFANBN/3rxp00gODiZQyGFXJauu/RNp6
 EV6nAFiDKsjMrrunm3fqOGHih/lN8RIkij0mDU7QoI5mELo7k/Kng3njtzPOev6Ay8x+
 UngncmNIUqS4Hfv8yOYRn5yUIfH7TaQKXdfHaVWD1Dg0dZjYy5gO37+PZ/3oBCGPHh14
 +sTsPNMhX3r7dICW1+mvHbmSH7D/mpOGMFmWFE1PkURs5Go0uuYbDLuq44LyW3mq6Ui2
 hO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682031107; x=1684623107;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b7QDRXKQ5hEltVWkohh/QXgJnh9OCjsLGfPd++gOLfA=;
 b=UHmHv/3R0CUJ/2wvlMFskwzO2znW1LD4XHCcaKZorUYCeDFOQS41Gw+yti7spY17o5
 SD7iuM1OSkyTGwSCGUHBDtS8t0sV257+Tx/KS6VjK+9Wmj+xFjB3DImJP6ujHF/tYgex
 tbcNQUpij/PadjsZgu+hDP/+ZRDqU4iheLcIaK7BmtowVhTKJRoXSVVeR9sSdFM3z0A+
 yIZU7+uA9ynBL+qQG5Ea0YPJ/8+jDIMQ1nIKn3vxb9zkFK+dcwwiemWwmNh17KqXucnW
 bSQgZ6ZtcXYBv3N0FEctN/uUUdRqoUCLVadB+T9DBAzZbsI6sUjZigkWZG1fpJcN7Cfd
 Icig==
X-Gm-Message-State: AAQBX9eV4CktGuxCePCx5IGVxETet7mXDVCD3M1/Wz0Dai4YsQr7toV6
 dXgOuDTuU1gHg34Jp7ZKi5dNlQ==
X-Google-Smtp-Source: AKy350brXa4fPcfhE4CuqDFqBnzK8W8G0OiORNrCpAz3eFIlV9t2VCSeZ7cFZTuLt/qlGi7mNq743A==
X-Received: by 2002:ac2:53a8:0:b0:4ec:8812:d6ba with SMTP id
 j8-20020ac253a8000000b004ec8812d6bamr754618lfh.15.1682031107371; 
 Thu, 20 Apr 2023 15:51:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a2e7412000000b002a8bb20e534sm387643ljc.108.2023.04.20.15.51.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 15:51:46 -0700 (PDT)
Message-ID: <837ae9c8-c92a-6cff-501e-eecb6ef0e3b1@linaro.org>
Date: Fri, 21 Apr 2023 01:51:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 12/13] iommu/arm-smmu-qcom: Add SM6350 DPU compatible
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-12-5def73f50980@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-12-5def73f50980@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2023 01:31, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> Add the SM6350 DPU compatible to clients compatible list, as it also
> needs the workarounds.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>   1 file changed, 1 insertion(+)

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

