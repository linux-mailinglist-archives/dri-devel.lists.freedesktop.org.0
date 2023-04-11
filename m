Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C24926DD82B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 12:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B469810E22B;
	Tue, 11 Apr 2023 10:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E8510E22B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 10:44:40 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id o1so9822116lfc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 03:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681209878;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hirgcP29XHsNtIjSU+Al8iOAd2++V8Gniyy2xGUTSAE=;
 b=IBbce+lN+Nr+vMoC0k9ByIAXwvFFmDnfFThOZ3mb6AR2zqxfAHisyc0aOOaSYbtBrY
 52vr8d45/GQQZPm2GuUm4tltjHvzKNm1w5yPEaon1pI3pB/uXkQNRLc+1II0YnUp2VCE
 WnMdReneoMAhDy24QDI4j3HWN0dC41jSNJ6W+aj7EjbhHt/WyVOSmrjKLG5NYMFJ0PVz
 9bia98efJ9GZVpaaoAjBRSEi4XSiHYBWP2zrCfxjKM3iZh6LrhOud0INyhp+a6gvqSH5
 ThY4E+dFA9feolSub4Xz1TgTazqA1tJnz8O5Q9TcfdvhpkhASWJpv3XsP12ro42azrwD
 i6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681209878;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hirgcP29XHsNtIjSU+Al8iOAd2++V8Gniyy2xGUTSAE=;
 b=NsShnFbE2ryC8pYO2jyJKf+bb3pATl1VfED49BAEJ0uf3Il5ny4uEPorltMLXLo232
 1q6YgdCSwJ2EoW0CQ7zyG5EgFGtVfK2pwi+/YD8TxSSYK38bGXxlH8HiKcBCJkGgVMj1
 Hjj+tBqTnadVe2+2mHbsRhw7un53ArJ65160CgrPGPbWCEYntGNj6HkpcfOsV7zn/Qmq
 tqmPSi5Pohe/iD275s9qBUoG/H+OpBaMYK1YjOyMBoM3ZlroCByvhe/0w1Y24lbas/8h
 k64cQvGlEZnjBirBQEp4y2DoBmIziF73hxrwBpRIxe3UGyjZWw0jep5Pq1rb5KqopUSn
 j6Aw==
X-Gm-Message-State: AAQBX9eyHAo+A0Aw8nJDdSzGAr+dWcAEI+NV/zNbVvtqk9pYaQ8S06SR
 sazTPvwQHGc4ZacoarnEYBcfKg==
X-Google-Smtp-Source: AKy350aIHpbNzEiCyJm0KeFoDAJWdaDbLNPH4o/rRl+cwDyOgsuQ7YSupy1n6sfAf+Uy7vVFdGWf3g==
X-Received: by 2002:a19:7010:0:b0:4ec:8853:136 with SMTP id
 h16-20020a197010000000b004ec88530136mr1672586lfc.12.1681209878356; 
 Tue, 11 Apr 2023 03:44:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r26-20020ac252ba000000b004e048852377sm2502146lfm.263.2023.04.11.03.44.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 03:44:37 -0700 (PDT)
Message-ID: <779fbc24-c307-f229-f8e8-874851604b76@linaro.org>
Date: Tue, 11 Apr 2023 13:44:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 4/4] drm/msm/dpu: use CTL_SC7280_MASK for sm8450's ctl_0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
 <20230408002750.2722304-5-dmitry.baryshkov@linaro.org>
 <66ea8874-424f-e4d8-ff0b-26ffb5333f2d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <66ea8874-424f-e4d8-ff0b-26ffb5333f2d@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/04/2023 03:57, Abhinav Kumar wrote:
> 
> 
> On 4/7/2023 5:27 PM, Dmitry Baryshkov wrote:
>> On sm8450 platform the CTL_0 doesn't differ from the rest of CTL blocks,
>> so switch it to CTL_SC7280_MASK too.
>>
>> Some background: original commit 100d7ef6995d ("drm/msm/dpu: add support
>> for SM8450") had all (relevant at that time) bit spelled individually.
>> Then commit 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog"),
>> despite being a mismerge, correctly changed all other CTL entries to use
>> CTL_SC7280_MASK, except CTL_0.
>>
>> While the current BLOCK_SOC_MASK style is not ideal (and while we are
>> working on a better scheme), let's follow its usage as a least minimal
>> surprise. For example, sc8280xp, a close associate of sm8450, also uses
>> CTL_SC7280_MASK.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> Although I dont totally agree with this, but because sc8280xp also uses 
> the same, I am fine.
> 
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> But either we need to work on a better scheme or expand the macros but 
> not duplicate these for the next chipset which gets added.

Yes. I'm also holding the rest of MASK renaming patches for now.

I'd like to the following major items finalized and merged (probably a 
goal for 6.5):

- INTF_TE restructure
- QSEED3/4 refactoring
- Proper support for active CTLs (wip), removing the need for 
DPU_CTL_SPLIT_DISPLAY on sm8150+
- Pending platforms (2 from 6.x, one from 5.x, hopefully one from 4.x 
too, 3.x if possible). Hopefully this will also include more platforms 
from recent DPU generations (8.x, 9.x)
- Ideally: also sort out max SSPP line widths for VIG vs DMA

I think that after this we can return to the question of platform 
similarities and differences.

Anyway, with the current msm-next + this patchset we should have a 
catalog which one can expand without fearing about conflicts or 
incorrect data duplication.

-- 
With best wishes
Dmitry

