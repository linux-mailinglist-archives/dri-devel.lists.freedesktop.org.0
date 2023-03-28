Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E85C6CC659
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 17:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE3E10E926;
	Tue, 28 Mar 2023 15:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C730A10E926
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:30:55 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id e21so12987861ljn.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 08:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680017454;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f6Z3hi5xZpY0A+xzxH10t/g2IJeJJpC83ZgAnnPr4r8=;
 b=ClmAdxKaO+IvbX7WxxMeckWeSwBLmWZS6VF3VOIhXlPLy0T3H1VzIEW1bVGMtqWN1Y
 I1QUxWfEat758nykrdkLKr5HXj2Vh60Jpk8eas0vs7lW+SQlvmD3Ylnl6BcTIMS/+wnU
 3ryReA+B9YJgzEe7h/UjssBX8pdqHpB6Jp7goWYlUwqJq/KoHqWQUK14+AflgKT+qWYH
 sfzh4BuAORKzWYhu/WVwMS4AgNOytzjEq+PqMGpCrRi04T5mJ1RS5gnGK3oEcIx3lZg4
 IYgN4JfgezD6s461Z8eNyykS1b8LUDQbZt4I853YvlcCoa97VskKGOXlaCimCKYXe2LK
 r8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680017454;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f6Z3hi5xZpY0A+xzxH10t/g2IJeJJpC83ZgAnnPr4r8=;
 b=HijRdUf4mzUBxUZKWdstVQ2yOZpQDiOHcjzs0rU2m7xTeRKfwyiAthqCBhaW0AnMd0
 eXGzQ2PZmYhpLoJBorTOP7HEDCF2U0+eyWDMO4OFxBInIQ8ukN3I6XL/qzx9wdbxQ/7O
 KBsDXiSBy61AfiCnRSus17mXe7T4WoYFeenp1FUwZsjmBueZf4VblXU+MaGCXepOkvy7
 MI4xehQTxIWy0KR9HnzgIxKwjDxBAF1l8wBG3XRQOioewcdLzx6nfGisImuvUU4p6zig
 8IExz13Tnngz/8e8A4NVj61OhGHh1zAQo0W3UMW9P+Ju5tzn0DYl53YaE4HQEYWleMWn
 KIGA==
X-Gm-Message-State: AAQBX9d+Bk0LTXZ+kxeHjEu3MGI+PY0nyqrjCIAiI8XLXvSVTA0g82v2
 NOb6UOmlKcmppDXaSIrfRw1k0w==
X-Google-Smtp-Source: AKy350bklgIv21W5yZ/4G5UcuAmEvWzN5s4DIXCp2M2RonQn4ByuJaeNtvsiX9cC+vQau4gr3ZNyUw==
X-Received: by 2002:a2e:7212:0:b0:2a0:4de2:db88 with SMTP id
 n18-20020a2e7212000000b002a04de2db88mr5008585ljc.44.1680017454043; 
 Tue, 28 Mar 2023 08:30:54 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a05651c014e00b0029913364649sm5123502ljd.11.2023.03.28.08.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 08:30:53 -0700 (PDT)
Message-ID: <bf424375-6306-35b4-4560-1946695f8fee@linaro.org>
Date: Tue, 28 Mar 2023 18:30:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 12/14] drm/msm/a6xx: Use adreno_is_aXYZ macros in
 speedbin matching
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
 <20230223-topic-gmuwrapper-v4-12-e987eb79d03f@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v4-12-e987eb79d03f@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/03/2023 17:28, Konrad Dybcio wrote:
> Before transitioning to using per-SoC and not per-Adreno speedbin
> fuse values (need another patchset to land elsewhere), a good
> improvement/stopgap solution is to use adreno_is_aXYZ macros in
> place of explicit revision matching. Do so to allow differentiating
> between A619 and A619_holi.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 18 +++++++++---------
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h | 14 ++++++++++++--
>   2 files changed, 21 insertions(+), 11 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

