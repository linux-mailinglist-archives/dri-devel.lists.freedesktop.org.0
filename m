Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F0C54DAD4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 08:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDEB10FE17;
	Thu, 16 Jun 2022 06:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE6A10FE17
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 06:40:12 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id w20so728929lfa.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 23:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Fo3q1iBYoGhPhyOrgYdrc4Ji32AawTPcAJ7xRNS+iog=;
 b=ZcZ96RP0m/oS3P4aD9s3k9nux3YhG4k019MzMy7M2we1KZRSj6vii2tcAoI8zUUHTE
 OSyrm/GZ1sv3CQk9YqMJz3HA5MeElURUYFL5IhUgsr1tFbjilNzyPGd2W6eXSI1Gv/G3
 ZbvnQnGpiTYIybS9fInLq++WW3eqsD0DNzapoxGkaVbtyvYftQS50R2g7Cnofgntv8MD
 vqPoIhPqVf1nh2tTFCr3taZXUreIMoA2ia1N1wu695uxH0xiaxsqQIkL3KdkYUft2Guk
 9miqVHHWUvP33Bx5tB5wpQ0BFu+IsaLJgpWx8ilkeCYXOzWaKyRYQaS+t79Rcw+D6Oo9
 +xDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fo3q1iBYoGhPhyOrgYdrc4Ji32AawTPcAJ7xRNS+iog=;
 b=eUqyxOBnNUiqPX2xTnTCB7sEeeqkKY4dIaQr/j+thUrbabc6S/Rwan18L3LqQhjQYc
 DYT0FqG6igPACAXou+sGUkp/F9Se1vWbJtI+aKYB/jT4beHUKY6WDBYA2l/L0YfDCER/
 GpM1vB0HDoTtUyZvzkRR5rKnDbiPJ4/zPpqUgj455wteB6aV/B/n68VPcS7PO+U1mzYW
 eNujEjVRQxRVi6Gh07nlFVw4hlBMjdZPB2rKXs6aSlgS1k3wWQi+vY23vEjyaLjtnmTo
 qk+/H2ha3V+orUSaZVRO3lMA13yARpgI0Or68nF1+CWv8AJ/PdnSc0fZAiOyZLkeuLby
 Pu0w==
X-Gm-Message-State: AJIora9VJdyTljmGo4oCPMFRPYOrRkJb2KXjiVlmKyqKumKJS6WBV9Es
 fjY4zO26Ds3/Vg2Tk0s1iCm73Q==
X-Google-Smtp-Source: AGRyM1tnT8+tNjAmj7y2q4Z6YubhxjRq1vXJzQJDI+fN33/7O24nIYroy1pNxUyqWLP1qP6WCXNH0Q==
X-Received: by 2002:a05:6512:e9d:b0:478:fc65:328c with SMTP id
 bi29-20020a0565120e9d00b00478fc65328cmr1812469lfb.312.1655361610558; 
 Wed, 15 Jun 2022 23:40:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a056512074f00b004791e0a2857sm110444lfs.198.2022.06.15.23.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 23:40:10 -0700 (PDT)
Message-ID: <09a56067-f91c-a882-de86-acb7d2916457@linaro.org>
Date: Thu, 16 Jun 2022 09:40:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] drm/msm/dpu: move intf and wb assignment to
 dpu_encoder_setup_display()
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>
References: <1655235140-16424-1-git-send-email-quic_abhinavk@quicinc.com>
 <82b09d4d-1985-519e-3657-0d15e07ccc2f@linaro.org>
 <5b35ee5a-ed94-1440-cdc2-909a82c3aa61@quicinc.com>
 <CAE-0n50gNX6XP2O9FJVJB135YUGhi5e8Gqb1FAxj20YQSvumuQ@mail.gmail.com>
 <CAA8EJpq1Td71FwBP5saYTAnS5zK28om+2C79aMPii06ui2JR+w@mail.gmail.com>
 <CAE-0n51CQKObqCmyRaZVNTpX1WWDZ-1KtzQdtU72va-gnFwJNg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n51CQKObqCmyRaZVNTpX1WWDZ-1KtzQdtU72va-gnFwJNg@mail.gmail.com>
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/06/2022 09:28, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-06-15 23:21:56)
>>
>> I have more or less the same setup using a longer format and using the
>> git-log instead of git-show. This way I can just do a git fixes
>> drivers/gpu/drm/msm and spot the commit in question.
> 
> I've long desired to have this be part of checkpatch.pl, but nobody has
> done it yet. Maybe figuring out if the commit exists is harder than I
> think.

The issue is that the commit might exist, but might be not the ancestor 
of the commit in question. And when we do checkpatch, we have no way to 
check the lineage.

-- 
With best wishes
Dmitry
