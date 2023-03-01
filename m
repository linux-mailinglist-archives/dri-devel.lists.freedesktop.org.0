Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8929A6A7653
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 22:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA87510E345;
	Wed,  1 Mar 2023 21:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0E210E345
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 21:46:46 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id s20so19513910lfb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Mar 2023 13:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SvEvYtECFjXZ14pQicD12i0aDPOh0c/iuZFDIRdeUxY=;
 b=DmE74FCYBv2GQl82QmdjTejZeOwniQ+5ZzgeTd7/JjsbI26i3t+O8bpeUo7g/5K1uy
 Hko1Zxm7uD9/8/9yivM5Tf4nxFMKi23t9h7QQaJ78CxmL/kgL6GIO4YchbJm2yIf3ftR
 Ba4lVwegFr5+SBygGwn/3A30u9EN2Vg4KJBEhXWqkbKOqRI42eFGR72r03OSYK7x1dQM
 xBD/930tIp6vwjGAx7UNXo28hcFHEgbgCaSU6fQGy+3+u2K9oWAm+Ngly6Xu6qzgjEDQ
 +KSj0/qIPJNNy5QQo2CQ79ox6SRD6dA9vLvPmHySghSDgSwWryuESwwjCyfK53eSG+gC
 pkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SvEvYtECFjXZ14pQicD12i0aDPOh0c/iuZFDIRdeUxY=;
 b=0b+rk+HkmNIACCLxRFHOrGmal1Z+JoPk1ehyi4ng1NBwykjHIpv8prk+5gtVjoor3Q
 c5/Wnn/N8g47elx4OiegnVQQxsY/dIGsQODW9VhwI5G2Q6+E2gNphqR87r+8K8EwqSMU
 dJmViTdK6M0nPkeVobysoT81EkEzJn6Js0J9958DJOWa8xBGWEV/4IQKYAUd8ablN2/b
 wRVvsr0aWoHGELKlQSOj754SHY/ZebKqiZvkMHcP8dqgUHFK5zPlYGb7+RajYbRZppDQ
 21e1RhywwzLOnSSM8Gs6gwjfPlYX3C6+M7dNyqNMjPkP7MIrqdmcXMgyTOJcYZ84+Q0M
 F8Ww==
X-Gm-Message-State: AO0yUKV2psMyu3l3knrmDz4rBv3ERaErdXu+MKNiPK4jHliZDct63uIk
 vomQOXMSUlROUmqY8hsVbKNP9w==
X-Google-Smtp-Source: AK7set/+Xd7daAY2Co/XPkhqFnBQODqXXDc6d6eZAVH8x8ELROcdmctj91n/iSzcxHW1XyMSVOvVZA==
X-Received: by 2002:ac2:5690:0:b0:4dc:4c1e:13ba with SMTP id
 16-20020ac25690000000b004dc4c1e13bamr2025046lfr.23.1677707205112; 
 Wed, 01 Mar 2023 13:46:45 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a2ea26b000000b00293cc5f83b4sm1844046ljm.27.2023.03.01.13.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 13:46:44 -0800 (PST)
Message-ID: <3ae6709f-5d05-bc0b-3dec-c4819c832fbb@linaro.org>
Date: Wed, 1 Mar 2023 23:46:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/4] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
 <20230221184256.1436-2-quic_jesszhan@quicinc.com>
 <20230301100331.3altimojtca4zx6m@SoMainline.org>
 <5de60136-4150-dcc7-517f-5d65452c5e1b@quicinc.com>
 <20230301170812.zcu6upwzcfkt4s7c@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230301170812.zcu6upwzcfkt4s7c@SoMainline.org>
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/03/2023 19:08, Marijn Suijten wrote:
> On 2023-03-01 08:23:28, Abhinav Kumar wrote:
>>
>> On 3/1/2023 2:03 AM, Marijn Suijten wrote:
>>> On 2023-02-21 10:42:53, Jessica Zhang wrote:
>>> Then, for some patch hygiene, starting here:
>>>
>>>> Depends on: "Implement tearcheck support on INTF block" [3]
>>>>
>>>> Changes in V3:
>>>> - Added function prototypes
>>>> - Reordered function definitions to make change more legible
>>>> - Removed prepare_commit() function from dpu_encoder_phys_cmd
>>>>
>>>> Changes in V4:
>>>> - Reworded commit message to be more specific
>>>> - Removed dpu_encoder_phys_cmd_is_ongoing_pptx() prototype
>>>
>>> ... until here: all this info belongs /below the cut/ outside of the
>>> messge that becomes part of the commit when this patch is applied to the
>>> tree.
>>
>> For DRM, I thought we are keeping the change log above the ---- ?
>> Which means its allowed in the commit message.
> 
> I hope not, seems unlikely to have different rules across kernel
> subsystems.  The main point is that this changelog and dependency chain
> isn't of any value when the final patch is applied, regardless of
> whether it is "allowed".

Unfortunately this is one of DRM peculiarities. So, some of the patches 
have changelog in commit message.

I myself prefer to have changelog in the cover letter, but I don't 
enforce that.

-- 
With best wishes
Dmitry

