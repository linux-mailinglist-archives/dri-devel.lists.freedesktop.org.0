Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7134871FF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 06:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FFB113066;
	Fri,  7 Jan 2022 05:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971D7113065
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 05:10:54 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id j11so11538866lfg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 21:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0yKFhRVY+tmgEn1pnh2jXYO28tsu8Fn3zCjKHC19tG8=;
 b=LM0sBgoiXVAKVgYQ7hvH4qn4ssRopfXMNhWLdwSG93358RsmXHTyImGboqD8IcX2yZ
 XsuwL+phqMqClkbLW8JgbRRSAcvDGKX4LDZClZlqdJAJ7QCctHNWOwEyu0FTWWADbnVS
 G9P2iuSHEuWX8dSL4vQSRNZySy6NMAWL+iqqMCzHCKGepTut/fVYAoUxwnpbJ7ZW2sCq
 SiiZDOqZJBl20lZ8ai9g5+aCnmbrNWadJHgusUtHVOOy8LgihZNZeKXfgPJWBnxEk+ts
 44Pwrfq40iKeadDW7xd1GolnM9r0onIm6TpRyvuyIpK0FS7KDVUMb/FaOhDRBbQe7Lbl
 X2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0yKFhRVY+tmgEn1pnh2jXYO28tsu8Fn3zCjKHC19tG8=;
 b=dmC3vt54j+fiQaeCJ8qZqmOGeGb/Ngh8WmH5lrgLpWSJX3lyHHUhO5Hq0tz7HTweya
 +UylyLcNeR1+Tqv6tAOFID3PpMUY36cHBj0BEppFIt9wtbGqH8xWqbP1gPS8Z6idK+ma
 eB75nBrP6jTx2QxGDqkkGXZ+FfCUA5Gz0419Pl4WMgz1g1ax7e8Gh+GjZg343AWdkhGG
 dZBONDlxCPEHLWetsTV2tYHB3DktWPUNTsiqRKrN9jMRQSqDPsDda/qGNtpSgvyHml9m
 2UjutRSvV1X336E0K8fVau9lIubg2w7+OxrcAgLIKJQUIH1dGnmSN8x64/1ntq9Rpvp/
 gj7Q==
X-Gm-Message-State: AOAM531els7SNTeyubMfIofyrbY8GyxTojY32TY81Fdb4F97W+VclNCC
 l1oF/ZoMo5LJexZzxoU6g5ljfQ==
X-Google-Smtp-Source: ABdhPJyDg1mIC7X2483Y3Ph4N0x5XTKoCpdyLSZUkspnNO0POxxLCuN5JpcD+sVxqaZCVr+5JN7Y0w==
X-Received: by 2002:ac2:4f02:: with SMTP id k2mr54882293lfr.421.1641532252898; 
 Thu, 06 Jan 2022 21:10:52 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p20sm431865lfu.270.2022.01.06.21.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 21:10:52 -0800 (PST)
Message-ID: <0c63a37b-4db9-678b-38a5-c6470bbd0565@linaro.org>
Date: Fri, 7 Jan 2022 08:10:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [RFC PATCH 1/7] drm/msm/dp: fix panel bridge attachment
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
 <20220107020132.587811-2-dmitry.baryshkov@linaro.org>
 <CAE-0n52vvqW7ba5zw_jrqpW=ky_Pas=binMe-nYbr=8OQZs_jQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n52vvqW7ba5zw_jrqpW=ky_Pas=binMe-nYbr=8OQZs_jQ@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/01/2022 06:37, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-01-06 18:01:26)
>> In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
>> enable and disable") the DP driver received a drm_bridge instance, which
>> is always attached to the encoder as a root bridge. However it conflicts
>> with the panel_bridge support for eDP panels.
> 
> Can you elaborate here? How does it conflict? Could be as simple as "it
> attaches before the panel bridge can attach to the root" or something
> like that.

Actually it would be the other way around: panel bridge attaching before 
the "dp" one. But yes, you got the idea. I'll extend the patch's 
description.

>> Change panel_bridge
>> attachment to come after dp_bridge attachment.
>>


-- 
With best wishes
Dmitry
