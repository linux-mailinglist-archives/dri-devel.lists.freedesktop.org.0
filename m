Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC08455225
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 02:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF5889FF7;
	Thu, 18 Nov 2021 01:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB06689FF7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 01:23:20 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 o15-20020a9d410f000000b0055c942cc7a0so8011102ote.8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 17:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=a2gBb51PSDI2uZh/kk0Tzm+QaarIKPnZpY56tomY9/c=;
 b=L7/XQphn9oytfiHo1dNoGGG2NLFL6122KEbhIzxD1+4DMsfoTLXzHk6LTL4hiuWcUf
 ocpX64aNys4SQUo2OdzUw0nN18tTfFv/DUAcOveK3OQpbJHVF1kA6raIFNGbby7Ggi1V
 0WZJ2cgOcMBAgGH6B//hiPDJYJ7c0SA58b/e+Ef6Li1gmEGVXFo8vQbxt/iq+dIISJW1
 /nBtLWDRr+casUf2YxAGRR81luqhdcrsmOsF2uIAFuvUW0ih5TaNkKxx1f3my3p8hsPa
 wRjYdquelf3xRPsRQqZx4HH/GGHBOoQLtMBPLA2dbbph33LQFJADZNIdznSNXWyUNGTM
 TKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a2gBb51PSDI2uZh/kk0Tzm+QaarIKPnZpY56tomY9/c=;
 b=Q37NAWu14zGRSrxekUhXw7ybj0F36I7hSDQFGqdInecfoQlSJD6yxxQ9kWkgTQTwE7
 /16F88GfGXFRWniSQOtzwDfA3kyNtVtXB+tO9sx6+qqHPSiHGFhux8i/Y45jFmQFPtTn
 5iWuzojS3HOw/oDb196iL8+0uGEXeL5WJScmMJdSuQGO2bAoPrWMs/jsoOSV7FS+0Pad
 bmlAIOCc7wkUDRM9hlbPppaMw5EzMtseqj7Q7IjX/Lvtxs61IUZcTgv7jB+JKCc7YwEZ
 LDoC4K7e/y4XkAhSntc3n4vTIzRJ0xFIn7EzEpW45Jrw2EwdB3G2GzOQ5AAC2VXWWQ7A
 NyWA==
X-Gm-Message-State: AOAM5314stxAlyY0UkjLFiZQsGvaIU92/DV8eQtaGOjVz56+0aSiEBng
 RBlug0gQcvtNta9oB3a2woLISQ==
X-Google-Smtp-Source: ABdhPJwt5iqWyw+7+XcHVrcQ0vfSgPSyFiKkhDfr0apjKuD+xkntug2oq0SL7Glq+eCIC4elNfBvhQ==
X-Received: by 2002:a9d:2282:: with SMTP id y2mr17579213ota.151.1637198599564; 
 Wed, 17 Nov 2021 17:23:19 -0800 (PST)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246])
 by smtp.gmail.com with ESMTPSA id s17sm304093otp.20.2021.11.17.17.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 17:23:19 -0800 (PST)
Message-ID: <0336e09d-59c4-3155-434a-0b04fda15bb6@kali.org>
Date: Wed, 17 Nov 2021 19:23:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH] drm/scheduler: fix
 drm_sched_job_add_implicit_dependencies harder
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Amit Pundir <amit.pundir@linaro.org>, Rob Clark <robdclark@gmail.com>
References: <20211116155545.473311-1-robdclark@gmail.com>
 <CAMi1Hd0qzu1t6QeZCNgSoTrScZL0_XQnZUPkQ5y7D+oV49GREw@mail.gmail.com>
 <c7741be3-43ec-307b-f5bd-3d19725df76c@amd.com>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <c7741be3-43ec-307b-f5bd-3d19725df76c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/17/21 1:27 AM, Christian König wrote:
> Am 16.11.21 um 19:30 schrieb Amit Pundir:
>> On Tue, 16 Nov 2021 at 21:21, Rob Clark <robdclark@gmail.com> wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> drm_sched_job_add_dependency() could drop the last ref, so we need 
>>> to do
>>> the dma_fence_get() first.
>>>
>> It fixed the splats I saw on RB5 (sm8250 | A650). Thanks.
>>
>> Tested-by: Amit Pundir <amit.pundir@linaro.org>
>
> I've added my rb, pushed this with the original fix to drm-misc-fixes 
> and cleaned up the obvious fallout between drm-misc-fixes and 
> drm-misc-next in drm-tip.
>
> Thanks for the help and sorry for the noise,
> Christian.
>
I've run into this splat on the Lenovo Yoga C630 on 5.16-rc1 - are these 
2 patches (which fix it) going to be heading to 5.16 or were they 
targeted at 5.17?

-- steev

