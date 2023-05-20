Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B6970A452
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 03:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A9910E62B;
	Sat, 20 May 2023 01:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208F010E62C
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 01:33:18 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2af290cf9b7so10613051fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 18:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684546396; x=1687138396;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UAL5nYCj2vZvRS2Tz7EI1xVwLYus4KEX3uqoy05ZFFI=;
 b=MTtBkbuHU4/MtJ2M4gEQGQcKGpcAIKjxMBA8u71oeSIBlIaXgZGwFWU8lP4d4QpWGz
 Q55Uc+H4S97UyOl520XJv4/JiqOhB9R3obS14SIpS5axsPkO/1bWKNFPjNe0FMmBLY7O
 sN3GU7V7SIkd5vO8+0rrihI3bOsM8ADLqD7XnkRwj9roQM7UoFl55dx/JLkHAncL0h66
 PHVSkLoXKte65M6h/FWpH8RZCC94imjYWBnd1XfWCm3KB/9HhDqXRzzl5nZxisu5A/b3
 H/IzKovHCpUSQOHXzr593hDO0I3aKt8S6be3DqAbJfE0TY04RC9/mxzbLsKKt3FtOWlm
 vQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684546396; x=1687138396;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UAL5nYCj2vZvRS2Tz7EI1xVwLYus4KEX3uqoy05ZFFI=;
 b=Lp81aE+d/GP/CLVzwfe0pgqSmalekZNHMe0PNBkFOMn23W9X22/xlGdcS4KuSzZrFD
 kom7aSe8Rr78obJIOPqoocPq+ChMAeyGWr6BgQHYwbpc3bAAXoumaHttfYsN7EnoPRum
 MsfivSOOskOzbSNghKfraT90Od0wu/Ro4nDmEmJ21XkKIHuiwzhpnUWa7e/Se5dteFMO
 iQTjAhxFt4raBNHBDV3EZnuI8Kb8w326RF37eEyRSq5gvJHRU9Srk3L3KeJPzxpBrREN
 iwcVtIgDvMjzrEdvIYxeaeQooOIR1mISBTiK/3qk50qC8DbPacZKdr2aoWuMz/UhNxJ5
 IYMQ==
X-Gm-Message-State: AC+VfDxDF9Ggtj0lHhJy1/lUVIow8dUvCXX2JDib18vME5VDUJStZjar
 CfwZawzyje3yLP7VaabbVI9LSw==
X-Google-Smtp-Source: ACHHUZ7HHg3UADQtG6fGoZzNDiGfxuM+1bHdrchFAFZ7Orolvob30+32S9e800thyEfVX5X2KbhKPw==
X-Received: by 2002:ac2:4e4c:0:b0:4f3:ac64:84f5 with SMTP id
 f12-20020ac24e4c000000b004f3ac6484f5mr1097360lfr.36.1684546396305; 
 Fri, 19 May 2023 18:33:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c26-20020ac2531a000000b004f160559d4asm86296lfh.183.2023.05.19.18.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 18:33:15 -0700 (PDT)
Message-ID: <8ae06612-6108-4cda-79b0-7e26b4b38d24@linaro.org>
Date: Sat, 20 May 2023 04:33:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 09/12] drm/msm: mdss: Add SM6375 support
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
References: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
 <20230411-topic-straitlagoon_mdss-v4-9-68e7e25d70e1@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v4-9-68e7e25d70e1@linaro.org>
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

On 19/05/2023 20:04, Konrad Dybcio wrote:
> Add support for MDSS on SM6375.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

