Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAB5535124
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 17:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A90D10E1BD;
	Thu, 26 May 2022 15:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F89C10E15F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 15:02:19 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id a23so2037929ljd.9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 08:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0D8beMvITCEnQx8kNlsoiMBAwRlvlYs/p4e3T9UBysk=;
 b=OR6Rn0cIwMEBUkUXJ1VyIu9n2UbV0stSHvaMzeU1kJ8kDh5lCNQlz1mNu6sD4hHaA0
 dsQbVAi+wzj9faH/mKfIHl6OHg8vSDYfvVfGL7nDV0zDbUdYLM/PEvvKA41sSrKUmhNa
 Bza8cJbKFMFqMb38bLJ9tRAbpyPb+z30Go1M6a3e1PvUVdxAgWCKgkFhExjpjUVXpw9t
 VJW3ngnXh77cwHNots7cBAFoRGuaHz+/s5GLwa6f/BB8OYwQSJhTy8x5G6KNtJcil68y
 qHH8/clbfVYNMeGjJ27vJdWGCJBHSA/KAVz1PQB1QZMFNOFrA4XuwtJKrGPqcm0Vj6pp
 anbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0D8beMvITCEnQx8kNlsoiMBAwRlvlYs/p4e3T9UBysk=;
 b=JrLSq3w0kkkLxt9WCv/dtH6nusRow02ObDujfMl3AnSY8XbLFMuK4xSIKcjGt8Ufoo
 NbDTYAw3GL5XUxVQSuv85QI0hbSypzsiC0HvJQ5A5ByazFrEITiqy6T+7dXyH0SY0D6R
 Qs7dzAhJuqpYiA8mDgMWSRaejk7eHKTVQGDd39fd4YDO2eDq5SxEA+QI/IMyTDzGdLou
 uOkHfBry0I1qtKHcToBH9Ggsbk2v15pm3bAZ584pAjK4DB0RtfzZ4yfH9zeJctjpYUso
 FuJ25N016QaLy4aPWFcJwHuPNroYieqBPD0Um9rUcg9eov6w7pMGgOo6rKglTvgwps0J
 5ktA==
X-Gm-Message-State: AOAM5327tdRcJsQAPUxy5uMOrNWfD62QyvIP8LuvyISZG0kmQ+dgiXrr
 s4poXNFslHnJl+SXLuy71604hA==
X-Google-Smtp-Source: ABdhPJwzG8K/zqLzj6k+ONVQDWc9rr4vNc0HCZhyxgpG25v5q4sJTfmZUi0az3S8isaPu1yB9kMinw==
X-Received: by 2002:a2e:bc2a:0:b0:253:edc9:dc73 with SMTP id
 b42-20020a2ebc2a000000b00253edc9dc73mr11569641ljf.351.1653577336150; 
 Thu, 26 May 2022 08:02:16 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a05651236cd00b0047255d211d6sm390892lfs.261.2022.05.26.08.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 08:02:15 -0700 (PDT)
Message-ID: <310e5453-9771-eb90-1a67-b04ec695fee0@linaro.org>
Date: Thu, 26 May 2022 18:02:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 -next] drm/display: Fix build error without CONFIG_OF
Content-Language: en-GB
To: Linus Walleij <linus.walleij@linaro.org>,
 YueHaibing <yuehaibing@huawei.com>
References: <20220506123246.21788-1-yuehaibing@huawei.com>
 <CACRpkdZUwfVNZyS6RgcupJ+TRUZVM+1_3ABj_-f_3+v+wNE6mg@mail.gmail.com>
 <CACRpkdaKrk+cj9Yvpe3kmR1iJFczi-yckHiKeLGu9F=hRFiU9w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CACRpkdaKrk+cj9Yvpe3kmR1iJFczi-yckHiKeLGu9F=hRFiU9w@mail.gmail.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus, Yue,

On 23/05/2022 15:54, Linus Walleij wrote:
> On Mon, May 23, 2022 at 2:46 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Fri, May 6, 2022 at 2:33 PM YueHaibing <yuehaibing@huawei.com> wrote:
>>
>>> While CONFIG_OF is n but COMPILE_TEST is y, we got this:
>>>
>>> WARNING: unmet direct dependencies detected for DRM_DP_AUX_BUS
>>>    Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && OF [=n]
>>>    Selected by [y]:
>>>    - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=y] || QCOM_LLCC [=y]=n) && (QCOM_COMMAND_DB [=n] || QCOM_COMMAND_DB [=n]=n)
>>>
>>> Make DRM_DP_AUX_BUS depends on OF || COMPILE_TEST to fix this warning.
>>>
>>> Fixes: f5d01644921b ("drm/msm: select DRM_DP_AUX_BUS for the AUX bus support")
>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>
>> Patch applied to the DRM tree.
> 
> Nope, failed:
> 
> $ dim push-branch drm-misc-next
> dim: ac890b9eeb9b ("drm/display: Fix build error without CONFIG_OF"):
> Fixes: SHA1 in not pointing at an ancestor:
> dim:     f5d01644921b ("drm/msm: select DRM_DP_AUX_BUS for the AUX bus support")
> dim: ERROR: issues in commits detected, aborting

After a second thought, I think the patch contains wrong Fixes tag. It 
should be:

Fixes: 1e0f66420b13 ("drm/display: Introduce a DRM display-helper module")

With that in place would we be able to merge it through drm-misc? Does 
it needs to be resubmitted?

> 
> I don't know what to do with this, sorry. The other committers are maybe better
> with this kind of situations. I think it is designed to stop me from
> shooting myself
> in the foot.
> 
> Yours,
> Linus Walleij


-- 
With best wishes
Dmitry
