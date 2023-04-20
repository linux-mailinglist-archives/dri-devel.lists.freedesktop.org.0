Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73EB6E9F37
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 00:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B2B10ED23;
	Thu, 20 Apr 2023 22:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EDE89907
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 22:43:19 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4ec9ccab8bbso927529e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682030598; x=1684622598;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vdc4rmGvOVsqp5oe4XQe+KMb4W3JpUy4TYDZwsnYsZQ=;
 b=iMmU/ProsZloeDlfszZLM1UhnrSEWbJjuwhbsBIkQ9sbpVonSjhRG+FPE88rZVcOyN
 r5kw6tiLsdoUm4DGrcoZ+oOUk7IZqJQt696BorzzlAb52lkEefX4GwwceABeIF/arWVL
 s2nECak0R/jv9VibAoSWpbroteMwMy22iQPfGTYwhVEIc4eJhKD98KqflXXh0DH9FQKD
 fRgMLcwnUgpahJMyrndXa60iY6a+BTYiAnjtW95phSgoNud9SK5n4u4XD7faHhu+Lo/C
 1iPGPuM14dkyASscMUoPk2rgUxR6YWDW4pK+Mv8Nh4nMuN6wb48vBZ98eyMsk7ePUifD
 8qNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682030598; x=1684622598;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vdc4rmGvOVsqp5oe4XQe+KMb4W3JpUy4TYDZwsnYsZQ=;
 b=S/SlyzR32qL6qTlfyXi6FP3Lb3DemkfATDrFp6j2QCnQjeP73Zd6pTmbOYLmxAAf6u
 nZaUZ/rTibZw/aKN4MH1hrjT1NHUL2n5R8HNOZrtoNys2W+x4/plTCZjCUWktxlkQuqn
 iwQZXgi2XdAE/GYI1hMGyyBuDWuGiJYsZVNCe51WviTafdYUqGWD29UPNQTPmw8Q/Flx
 NmzQ6RESmLLBbBA24gH5asitN/YJx+SevD60SwQMrRH8kFNZiAVX0j7oL/I81a/NSHNj
 bhxBl4++VEWTn+XST6AAplkvK1WR9UmHCSrMrr7/SAecO0zzdbvmMwJ+lPuo1Mktpzxi
 3JfQ==
X-Gm-Message-State: AAQBX9dhQzw7STL2FsqyfUDLGBGJ/C6ieM+m2OSp0EB4edpTTVO2XoyF
 g9KndfSkWNln3l6N5CDL8PLz0Q==
X-Google-Smtp-Source: AKy350ZVF4cIUxwuhl1z55nPu1K7EKpo+nQCFX/oqhNnKdROTunmg2Y4/61DtVtV2y6p7vSA1kX/iw==
X-Received: by 2002:ac2:4427:0:b0:4eb:d8d:6c14 with SMTP id
 w7-20020ac24427000000b004eb0d8d6c14mr727331lfl.11.1682030597782; 
 Thu, 20 Apr 2023 15:43:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a2e868e000000b002a775f96ef4sm402576lji.30.2023.04.20.15.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 15:43:17 -0700 (PDT)
Message-ID: <ae811f1e-1376-f3d4-e297-6dc2f984b4ac@linaro.org>
Date: Fri, 21 Apr 2023 01:43:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 08/13] drm/msm: mdss: Add SM6350 support
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
 <20230411-topic-straitlagoon_mdss-v2-8-5def73f50980@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-8-5def73f50980@linaro.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2023 01:31, Konrad Dybcio wrote:
> Add support for MDSS on SM6350.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

