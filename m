Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6779090E5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 19:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BF210EDF0;
	Fri, 14 Jun 2024 17:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pC8EVGFe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B9410E238;
 Fri, 14 Jun 2024 17:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718384635;
 bh=lm2WP2jZQ+yAD9yshOLeLpSgAYROFU4jcWs2mhGJV/g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pC8EVGFeJC0EZME094IliR7iYu6S2QKmrleDEslrJLGXCVaeDv32icm3cX3aTqv+i
 JWjLrMyYuwMppE48PfQTbHvI1q2LDE/Or+5l8l4ek2coaoTxjYb4VhjN7ubSuCx0Ks
 snhS9mXrE1ixZFJKVBZi6krUVI8pb1Li6QJZyEYL4rl/fSqTtfz9JO/zvzBiFf+sVO
 ZWyGsdyG6jVa3hRhS1WBFbq9PuFaGBpNLUaQ9+AiXc9vZBLZwQGdM7cSIse1QxA/BF
 hjoZTwhdJ61dk4G1uaywehXzCX8h/tBv3/sVwH2SixJk7EmhLn7GXIAbRstouNhu9R
 YPdjdR/2wrIOg==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id CD5BB37821B8;
 Fri, 14 Jun 2024 17:03:50 +0000 (UTC)
Message-ID: <af6d496e-2f49-4f12-bc12-426e06d24494@collabora.com>
Date: Fri, 14 Jun 2024 14:03:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: mark kms_addfb_basic@addfb25-bad-modifier as
 passing on msm
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240613-msm-pass-addfb25-bad-modifier-v1-1-23c556e96c8a@linaro.org>
 <8aa99c1d-ca6a-a26b-96b5-82fc35cea0fa@quicinc.com>
 <CAA8EJpr5r=5MP8DqGPV7Ndz0zKy4Ar3u+RiqocLyt6eZWuifnw@mail.gmail.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <CAA8EJpr5r=5MP8DqGPV7Ndz0zKy4Ar3u+RiqocLyt6eZWuifnw@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 13/06/2024 14:55, Dmitry Baryshkov wrote:
> On Thu, 13 Jun 2024 at 20:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 6/13/2024 9:33 AM, Dmitry Baryshkov wrote:
>>> The commit b228501ff183 ("drm/msm: merge dpu format database to MDP
>>> formats") made get_format take modifiers into account. This makes
>>> kms_addfb_basic@addfb25-bad-modifier pass on MDP4 and MDP5 platforms.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt | 1 -
>>>    drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt | 1 -
>>>    2 files changed, 2 deletions(-)
>>>
>>
>> Would be good to also give a link to the CI for the CI maintainers.
>>
>> But otherwise, LGTM
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Yes, good idea: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/119


Nice to see new tests passing!

Acked-by: Helen Koike <helen.koike@collabora.com>

I'm applying it to drm-misc-next

Thanks,
Helen

> 
>>
>>
>>> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>>> index 3dfbabdf905e..6e7fd1ccd1e3 100644
>>> --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>>> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>>> @@ -4,7 +4,6 @@ device_reset@unbind-cold-reset-rebind,Fail
>>>    device_reset@unbind-reset-rebind,Fail
>>>    dumb_buffer@invalid-bpp,Fail
>>>    kms_3d,Fail
>>> -kms_addfb_basic@addfb25-bad-modifier,Fail
>>>    kms_cursor_legacy@forked-move,Fail
>>>    kms_cursor_legacy@single-bo,Fail
>>>    kms_cursor_legacy@torture-bo,Fail
>>> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>>> index 23a5f6f9097f..46ca69ce2ffe 100644
>>> --- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>>> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>>> @@ -4,6 +4,5 @@ device_reset@unbind-cold-reset-rebind,Fail
>>>    device_reset@unbind-reset-rebind,Fail
>>>    dumb_buffer@invalid-bpp,Fail
>>>    kms_3d,Fail
>>> -kms_addfb_basic@addfb25-bad-modifier,Fail
>>>    kms_lease@lease-uevent,Fail
>>>    tools_test@tools_test,Fail
>>>
>>> ---
>>> base-commit: 6b4468b0c6ba37a16795da567b58dc80bc7fb439
>>> change-id: 20240613-msm-pass-addfb25-bad-modifier-c461fd9c02bb
>>>
>>> Best regards,
> 
> 
> 
