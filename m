Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E793733D58
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 02:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF5D10E6B2;
	Sat, 17 Jun 2023 00:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BC510E6B2
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 00:48:36 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f7b641f54cso1837717e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 17:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686962914; x=1689554914;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NTLsCOm+x4ZvrOFSB6ytsH0DzFh1BKzhychb27x+ZCk=;
 b=gBqvFFGhi2k1Y4mtAueB4OnvmeneTr3asfVLlhXV/KoukoBpKC/5fJRBWHcdTBqK8i
 xmjTgyEMajixAz7m3A9906HEGtDrMt3nHnXAHkUb2vfOS5b7IxIVvdzjutDP2wNRf+t9
 Pl2PbEvPwAhbeqtPjmYXgOuuP9nstKUX758l4KrWiDTHOyCU5VamLZ68KyuXKRlT9E7F
 phHrRmz5JxT7DwjZcogBgziaJ+1vsOBXwfdw0IxAJF1HddL7yYWGQNAbqzUN3x7exU+k
 EYyW1vacLbLv5RJYukAX/lBXxWjz66LB6ZtHhMLSFt6u65cqH2VSFKQ88nUwHBzUp9ur
 vtkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686962914; x=1689554914;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NTLsCOm+x4ZvrOFSB6ytsH0DzFh1BKzhychb27x+ZCk=;
 b=PfrxI7CoVL1Tdkm9kWkEbjR/bkvTlI08n/U/GzoXWvLVzEsajxg+M3m7BVrovXjZ36
 9F4qjSn8B71/PWH1mpPEatUgJXDZ1MQ9dw8hXNLgsTjwlwXwu9BPNDSsq/WW2r3ix8jD
 ofQX/ixbiOZYm5zbn5UdQfBx6oQUmqeII50gOwadpUzkKNchmdNOqOhETx/Eg6nFSngt
 xxdFJnOr39g0Qz4gT+NWObUFl+YhpgPX4UlFvvSkaHmM+FuQ3L3R4yWhJ4cN1smwm5/G
 rZ5jeBBpXHrYOrUkH9//4a4wiDDeLvwrrpMOt5OSfPGIYxjVpJv6L8z3WrkGNSYvwTLb
 MZsg==
X-Gm-Message-State: AC+VfDwAH6Y1qXMjrO6SdawwoI7i5TILfpDqIkzFLqQC3gjKwk7LeLre
 YyOWjlC5RWuWDK4dfBUNkE9TgA==
X-Google-Smtp-Source: ACHHUZ6AYKV84W3IFZwyIjWK1ncKT0jMqQXhv6X4F4THuR6X7HIaPQniEwqZSsmfjSwnRF1a8MKUNQ==
X-Received: by 2002:a19:f201:0:b0:4f4:dd51:aec7 with SMTP id
 q1-20020a19f201000000b004f4dd51aec7mr2028052lfh.54.1686962914329; 
 Fri, 16 Jun 2023 17:48:34 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d15-20020ac2544f000000b004f858848fefsm348826lfn.177.2023.06.16.17.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jun 2023 17:48:33 -0700 (PDT)
Message-ID: <227c2ba0-cfb2-cd88-6506-895e8735d221@linaro.org>
Date: Sat, 17 Jun 2023 03:48:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 17/19] drm/msm/dpu: inline INTF_BLK and INTF_BLK_DSI_TE
 macros
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-18-dmitry.baryshkov@linaro.org>
 <vpuwgjbgfau6fwn3etg3hyoo44yn4n4xo7hzbe3kfir4ih2tgp@rmutsfjobrub>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <vpuwgjbgfau6fwn3etg3hyoo44yn4n4xo7hzbe3kfir4ih2tgp@rmutsfjobrub>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/06/2023 01:12, Marijn Suijten wrote:
> On 2023-06-16 13:03:15, Dmitry Baryshkov wrote:
>> To simplify making changes to the hardware block definitions, expand
>> corresponding macros. This way making all the changes are more obvious
>> and visible in the source files.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Looks good but I am not sure how much it is worth to review this (versus
> checking your script and rerunning it to see if I get the same results),
> considering that there are quite some conflicts with your interrupt
> rework.  In what order to you intend to land that?

As I wrote, this series goes in first. Initially I designed them the 
other way, but intr rework depends on DPU revision changes, while this 
one doesn't have such dependencies.

-- 
With best wishes
Dmitry

