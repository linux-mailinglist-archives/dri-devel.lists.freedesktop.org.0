Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE3A535DAD
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 11:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E2210E9D4;
	Fri, 27 May 2022 09:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D194C10E9D4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 09:57:00 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id t25so6128357lfg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 02:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=e0tqh7qqeg/7ehiexIPgsAiDdSoZS7aeFNTayUPMdOc=;
 b=ZLNumBwMjmYz6Ddz8l4E2qz1MRkHPqE7mQJC9CNLFuEaHUR0cfrIBdygNdA/Ny4Mv6
 rp/F0FVbaIMEK/PbDA1txZDM+QZynz6bdG/YBBF7tZdfUrzZLXmoaMTBIGDx4nVetifA
 RgaYMbHFsRKj3w6ZSXklGPByUn3iubvjr98VjEVQ2J0SMeLhlFwt23IiHavr3PjJdzvw
 KOq1x7q4bL0pp4pwfnRt9HLodEYBWgQiHaeJaHS1aFTpikMLgsEo4/zNvhcQlybydzYX
 zwPwiqMWvOtpDMrKi5aTBqxls/5n91GIjM28071jM2dsNQ8xKuyJA68BvePufLBdginC
 m9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e0tqh7qqeg/7ehiexIPgsAiDdSoZS7aeFNTayUPMdOc=;
 b=E0onKc/o4t4sQXBnd1V+gm0u3BL3gWpe97fToZWJ3MZWHTayZzcsKs/KpspxL1c8dp
 YU9xuQx+KlSG6BiTp6qhD+c5qpMuwaHBM2UUiTo4I9hkYspxGNVCkrW/SUdfzXSSy+qa
 LTVMVGZm/y87t2w+eOKERrpYQQCGO5vz/npKlFYIDo1CSawH0m8ymIrWE+qr3ZK/9HEE
 2hKuf2OCZghwuFSuh5t+JBroFrZ+oLDEvTNYepyEEhUI7D5RSW5LKMY+L5FpOBvwRUrQ
 PHOups2c5Isgso8MO/A+yOTirL7WWsO6WlgAzAEIJo6bAIfFQ/rPixG+rFA8lWzCosfM
 JQ2w==
X-Gm-Message-State: AOAM532ym93tEGPJf7ZNdcCgGaWcw/1s4FDHldTBGPLoFdkO8JGQuNVT
 BvGca8mKVO5uHWwrmvxWsoo4Tw==
X-Google-Smtp-Source: ABdhPJz1lmb5CKBAD9Igt8Z+9gebkQewb8KfLfs/WVghEp6rr2duyaG6bgXXnHEH9ITbnlE44kqHSQ==
X-Received: by 2002:ac2:4c53:0:b0:478:6908:c76f with SMTP id
 o19-20020ac24c53000000b004786908c76fmr18791795lfk.634.1653645419012; 
 Fri, 27 May 2022 02:56:59 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a05651c031100b0024f3d1daf04sm911304ljp.140.2022.05.27.02.56.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 May 2022 02:56:58 -0700 (PDT)
Message-ID: <7c22e193-2a7b-2537-feff-c4656c022f31@linaro.org>
Date: Fri, 27 May 2022 12:56:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 -next] drm/display: Fix build error without CONFIG_OF
Content-Language: en-GB
To: Linus Walleij <linus.walleij@linaro.org>
References: <20220506123246.21788-1-yuehaibing@huawei.com>
 <CACRpkdZUwfVNZyS6RgcupJ+TRUZVM+1_3ABj_-f_3+v+wNE6mg@mail.gmail.com>
 <CACRpkdaKrk+cj9Yvpe3kmR1iJFczi-yckHiKeLGu9F=hRFiU9w@mail.gmail.com>
 <CAA8EJpq7_V7mZbN+G5fZdK0a4kTcxROAd_bGJtQ5mhzdYr6pNQ@mail.gmail.com>
 <CACRpkdYATkP2ONCxHq6+XsWM8949tXxd5r=OKM36dgwWp3Sxgg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CACRpkdYATkP2ONCxHq6+XsWM8949tXxd5r=OKM36dgwWp3Sxgg@mail.gmail.com>
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
Cc: airlied@linux.ie, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2022 23:08, Linus Walleij wrote:
> On Wed, May 25, 2022 at 3:36 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>> On Mon, 23 May 2022 at 15:55, Linus Walleij <linus.walleij@linaro.org> wrote:
> 
>>> Nope, failed:
>>>
>>> $ dim push-branch drm-misc-next
>>> dim: ac890b9eeb9b ("drm/display: Fix build error without CONFIG_OF"):
>>> Fixes: SHA1 in not pointing at an ancestor:
>>> dim:     f5d01644921b ("drm/msm: select DRM_DP_AUX_BUS for the AUX bus support")
>>> dim: ERROR: issues in commits detected, aborting
>>>
>>> I don't know what to do with this, sorry. The other committers are maybe better
>>> with this kind of situations. I think it is designed to stop me from
>>> shooting myself
>>> in the foot.
>>
>> Linus, can we get an ack from you (or anybody else from DRM core) to
>> merge it through drm/msm tree?
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
>> After a second thought, I think the patch contains wrong Fixes tag. It
>> should be:
>>
>> Fixes: 1e0f66420b13 ("drm/display: Introduce a DRM display-helper module")
>>
>> With that in place would we be able to merge it through drm-misc? Does
>> it needs to be resubmitted?
> 
> But it doesn't apply to drm-misc... that's my problem :/

I think it didn't apply because of the Fixes from msm-next.
If we change that to the mentioned commit (1e0f66420b13), then you 
should be able to push it.


-- 
With best wishes
Dmitry
