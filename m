Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 555624870FF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 04:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5ED010ED69;
	Fri,  7 Jan 2022 03:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B13710ED31
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 03:06:16 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id j11so10693219lfg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 19:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Le5b+gfm8kEhoQGFgPM2eB+8FLoC7vz8a2SlJRnSDGQ=;
 b=Zo5y9ZH8M2cqtZIKViHJ4SXxuJPxDlI+tHz1eH40NGNhxEvrKF6WfuwCYBX1/1kyv/
 5rvBgW/eDCw99yCXUEGbMl/A4XRIdPmwEUlYSO6CR8XX4XOz20SkyYpdxdm0j08RcB9w
 WrKL9T8vV7GqQBFcXHmo29oGlYmzXYDCdtcKYmG6ektDwfdEGXizKI4lddsS6Z/gQ2VX
 v65AidI2OA2sBKAhKMQFnkxNFOGB2CAIfues3B+4ZkaMIZgLSMO+S4koUAEUHvEck6gs
 QNAZxvvM+eeTQhLNo6oB+yLF212K27/+wIMWrY9eJpf+oVppOwloU3hTUDKrNWMkkE02
 Egwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Le5b+gfm8kEhoQGFgPM2eB+8FLoC7vz8a2SlJRnSDGQ=;
 b=k3QlKXsYVsFiqizseJe3Dd2aiWnVvPy4d+rkq7dqcAHgdKFKhhSZRFbhRiadCSULBi
 8wxeyrCpaaZW1hy0dKl4I6SYQnILt5RVK2rjyIr8VamZt8gICBIRynW601mlgzAe9VIl
 brVHoMt7aUkkscLHR8JR3PEASzzjuUN6vRWtSqxsyZ+kTRpLEwg3kU91SQUzsdqnftYh
 fC1g3iIeTeoqdfVc1RMMfb3mBrlcSuO2aCCO/qEMCQmusE55Dza29AdqkazItIwziGqY
 5Msdb9VJao2+BEC+Cz4qUzPmmG3lDaeppIRdF9iWN/lU7eF+TrX96Fpw6FI4olAKeY0N
 iFpQ==
X-Gm-Message-State: AOAM531FtmEIfEzh5zNKMLmjb2bkSAoXFEATFa5cXWMj0YFHaz7P9MjH
 6f+vKzIHpPnLRXzX7Bn8NNCcnA==
X-Google-Smtp-Source: ABdhPJyuJrIFR231OR4pS4P0aMgoBzgDhxyRUxHpUfwtWAajfQcCZXRWZgHwytL4KPjF7en/yVrAxg==
X-Received: by 2002:a05:6512:1155:: with SMTP id
 m21mr54717647lfg.188.1641524774613; 
 Thu, 06 Jan 2022 19:06:14 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n10sm400669lfk.246.2022.01.06.19.06.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 19:06:14 -0800 (PST)
Message-ID: <63e0e911-6a01-0853-47eb-0f4e9cfb261b@linaro.org>
Date: Fri, 7 Jan 2022 06:06:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [RFC PATCH 0/7] Simplify and correct msm/dp bridge implementation
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
 <CAE-0n52Si84XZxURUZ6ONKOCsyCDGF=AXHrStOoMPC67xRiVfQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n52Si84XZxURUZ6ONKOCsyCDGF=AXHrStOoMPC67xRiVfQ@mail.gmail.com>
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

On 07/01/2022 05:16, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-01-06 18:01:25)
>> I noticed that commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
>> enable and disable") conflicts with the panel-edp (panel bridge)
>> support. Both bridges will try to attach directly to the drm encoder
>> itself. I started writing lengthy letter describing what is broken and
>> how it should be fixed. Then at some point I stopped and quickly coded
>> this RFC (which is compile-tested only).
>>
>> Comments and tests (on both DP and eDP setups) are more than welcome.
> 
> There are some DP patches dribbling in every day or so and it's really
> hard to follow along. I asked Kuogee to resend all outstanding patches
> as a single series but that hasn't happened. I'm not super interested in
> reviewing/testing out these patches until the outstanding patches for DP
> on the list are reviewed and landed. Have you looked at those patches?

I haven't been following the DP patches. Well, in fact I was mostly 
stopping myself from looking onto the DP driver and getting elbow deep 
in it. Partially because some of the patches circulating on the list 
were clear hacks (e.g. PHY timeouts). Some would be too complex to 
review them without deep diving into DP. Most of my attention (and spare 
time) goes to the DPU/DSI/MDP5 (and to lesser extent MDP4/HDMI) drives.

With regards to this patch series, the patch 1 is probably most 
important (and might warrant sending it separately), as it should fix 
eDP support for Bjorn.

So, initially I wrote just patch 1. And then the surrounding code 
immediately prompted me to update the rest of the drm glue code. Elbow 
deep, as I said. Patch 7 might be a bit advantageous (and maybe I should 
remove it in future),

> See [1] for an example.

I think most of the patches circulating through the list are irrelevant 
to this patch series, as they do not touch the drm glue code.

>> The following changes since commit 6ed95285382d6f90a3c3a11d5806a5eb7db715c3:
>>
>>    drm/msm/a5xx: Fix missing CP_PROTECT for SMMU on A540 (2021-12-17 15:09:46 -0800)
>>
>> are available in the Git repository at:
>>
>>    https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-dp-bridges
>>
>> for you to fetch changes up to 7eff304d50ba520e9193a293a8e42bbd9d7aa0e1:
>>
>>    drm/msm/dp: stop carying about the connector type (2022-01-07 04:56:06 +0300)
>>
>> ----------------------------------------------------------------
>> Dmitry Baryshkov (7):
>>        drm/msm/dp: fix panel bridge attachment
>>        drm/msm/dp: support attaching bridges to the DP encoder
>>        drm/msm/dp: replace dp_connector with drm_bridge_connector
>>        drm/msm/dp: remove extra wrappers and public functions
>>        drm/msm/dp: remove unused stubs
>>        drm/msm/dp: remove dp_display_en/disable prototypes and data argument
>>        drm/msm/dp: stop carying about the connector type
>>
>>   drivers/gpu/drm/msm/Makefile        |   1 -
>>   drivers/gpu/drm/msm/dp/dp_display.c | 263 ++++++++++++++++++++++++++----------
>>   drivers/gpu/drm/msm/dp/dp_display.h |   5 +-
>>   drivers/gpu/drm/msm/dp/dp_drm.c     | 250 ----------------------------------
>>   drivers/gpu/drm/msm/dp/dp_parser.c  |  28 ++--
>>   drivers/gpu/drm/msm/dp/dp_parser.h  |   4 +-
>>   drivers/gpu/drm/msm/msm_drv.h       |  32 +----
>>   7 files changed, 203 insertions(+), 380 deletions(-)
>>   delete mode 100644 drivers/gpu/drm/msm/dp/dp_drm.c
>>
> 
> [1] https://lore.kernel.org/r/1640220845-25266-1-git-send-email-quic_khsieh@quicinc.com


-- 
With best wishes
Dmitry
