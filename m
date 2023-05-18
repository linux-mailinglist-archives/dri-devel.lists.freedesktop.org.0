Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27582708A0F
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 23:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557A610E554;
	Thu, 18 May 2023 21:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B9E10E554
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 21:06:18 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2acb6571922so26529331fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 14:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684443976; x=1687035976;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5fRCQUBUSE9kt5x847YU0nJ6a6ueP70DQZSZhSAsujA=;
 b=MFJ96x8VdbW74WOiWAaqj3AH0hGnWlM21ZKOMVOx0TiI2gmUhfeCrxNF3tjXzjk8JR
 y+uGpMIBu2C+gkNqreDb1Z9/cE5Db+X8lKcB060ac7G84OTHdOEiUHmuXMTSBR+PzVZs
 2/Obdk3UQpYs+Wtf/0clth727xP9bvSqRQ30kU8+OprvkmpYrHlKulihXDonCR8mFckl
 piATxyqQsuKZYsrd9ycz751H6DE+jFfxGq+bKdslKmp74dMN6BWfhcdNuMnnaTd3Yy+s
 abrUdClWQYYZB5eGDr8xui66oNv0tAjHUqQZOvMt9seHVsoJUSkOay2HPXe3zDEo9ekf
 XB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684443976; x=1687035976;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5fRCQUBUSE9kt5x847YU0nJ6a6ueP70DQZSZhSAsujA=;
 b=BVLslDnCYzWHffnIaDwm0XZD1UcQCop6HU0zuVfb2VBzR5MsuxHvL7UP3Gb6fNKB+N
 VdHpG79s1FFjYZVWl+OlyrkOiCaXcVpy+0bWzvd2vvYtR5hZJybXngB3wkxgEUJj2YGP
 uA49jZjFxquXeREAf0f7UwFSELKjCNIe7vvsA53QheOSbBGXp1ZfP3XOOYozNPa+hg+q
 B3t64V6hxoVNLatkq7qVuEZcMcLJOzblyazqqRdgkWaT9MAikUyaS+ST4NBQkzg79keD
 fg/VMy8Pk9mkMDSvCfamlTeMCQLNG32uYiqUkuwDNL9ZLc9bBe8vVf/IW6VREfOpjoj2
 jgFA==
X-Gm-Message-State: AC+VfDxoWvqG007C93ccd4Osb4Gwj4oT6V3i8cdGzNspd6Wbv4/dty+q
 CS1CaKGYHWHCRgwe51IpZ6+xNg==
X-Google-Smtp-Source: ACHHUZ76Q+gFfXkGnJhl77tjg89Dl7Ijr1N4x6Vskg+VkFxnEqMGO1zjsU8g3AaGajet9ZOp3VHuTw==
X-Received: by 2002:ac2:54b9:0:b0:4f3:a430:cea6 with SMTP id
 w25-20020ac254b9000000b004f3a430cea6mr66077lfk.51.1684443976186; 
 Thu, 18 May 2023 14:06:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a056512090500b004f0199e8770sm371434lft.65.2023.05.18.14.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 May 2023 14:06:15 -0700 (PDT)
Message-ID: <cace6559-dbd4-0fa0-5b59-88c75cf35091@linaro.org>
Date: Fri, 19 May 2023 00:06:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/3] drm/msm/dpu: drop SSPP's SRC subblock
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230429012353.2569481-1-dmitry.baryshkov@linaro.org>
 <20230429012353.2569481-2-dmitry.baryshkov@linaro.org>
 <375aoihzzqquma4e53zfl7t6xdamlwyb2t36effy44wooylywp@5oz5jl5t54qo>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <375aoihzzqquma4e53zfl7t6xdamlwyb2t36effy44wooylywp@5oz5jl5t54qo>
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

On 18/05/2023 22:14, Marijn Suijten wrote:
> On 2023-04-29 04:23:51, Dmitry Baryshkov wrote:
>> The src_blk declares a lame copy of main SSPP register space. It's
>> offset is always 0. It's length has been fixed to 0x150, while SSPP's
> 
> It's -> its, twice.

Ack

> 
> 
> 
>> length is now correct. Drop the src_blk and access SSPP registers
>> without additional subblock lookup.
> 
> Note that the block code still calls `dpu_debugfs_create_regset32()` on
> "src_blk", do we want to rename that?
> 

I could not come up with a better debugfs file name, so I decided to 
leave it as is.

-- 
With best wishes
Dmitry

