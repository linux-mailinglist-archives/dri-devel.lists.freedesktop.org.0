Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9339A5A255D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 12:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12EF10E830;
	Fri, 26 Aug 2022 10:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D67E10E827
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 10:05:04 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id q7so1361088lfu.5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 03:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=KzbOceaNTdDVnBmlwaML66Ag3gKl0lXdyJPKSYlfMfo=;
 b=q8eihlZNapUVxFRiEU7EF/LhPsaz08qpV4fS8UH0p1tLfCsASqzJK4ypoixw0h/ez4
 6CbzJZjfGhPUqbHSpQRiDIJB8GL9CW4LQ9rhDaySA5C3rKbjesmGRlKZZGdpL1dHr4wk
 I5DCiPc7BjD/AnmMdsmpgv1bK2A3gfaIxeEIayc5QCybaFZHgCslg8K3X8Qo+lBUjELW
 KghkIm4r/LbqnSdq2kXDtYmIlYQgTNNL1nNWOp3pL4RZuggBCGYsfnrivqnV8IoQQ0vr
 clpfazGqs60ASVHKOPHj5Gut9iyLthfuMtsm3eOYpIjzLb5GELVJEkyZvYDTSsImlrAR
 QBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=KzbOceaNTdDVnBmlwaML66Ag3gKl0lXdyJPKSYlfMfo=;
 b=atEXyZpfKHErfm37wDtXJ+F3yXTCEggX30Hv34SH4+/YUydzhVCpauCiOE64iEZoWr
 ew2iHjssgqrfPnVK0XqtXwK+kPHp+JDc0cUbJL3h90ekxmHRcgGoqfUsYeYf6SoiagGl
 oMWBkwWnLWpSS3+8mP381slKZvpBJspP+g1j8JHFVsSwrntqxLjtStzQ7vjN8ts+oL0p
 p0y+qrcpLw5+ms+KuvBiMfgCUaZ1qwoZXnZ/MD/YyL/idmBkmVG5FJ9mN34/+/tB7CxW
 LPFbLsIlOSLX+ytybXwEQxgKuQ9dk2nRhphM0VLmD1gZcSbhJgDxy8rhf/a774Z9pLaW
 J6XQ==
X-Gm-Message-State: ACgBeo2eLQmOfsQtCYFrOCBid0gDtdhEgqcsHZJgnKqehzN7QAFeTv0y
 mXYMHwQOzUlzv7NtU8s3+H0+cg==
X-Google-Smtp-Source: AA6agR7XBftW2NwzU7hLIQQlu/k8toww0vgW9/YoDFtF97R9hU26kKpJdaP34/aFNMlrNfNooKaMIw==
X-Received: by 2002:a05:6512:234c:b0:492:d9fd:da59 with SMTP id
 p12-20020a056512234c00b00492d9fdda59mr2174078lfu.63.1661508302738; 
 Fri, 26 Aug 2022 03:05:02 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 j28-20020a056512029c00b0048b17852938sm329074lfp.162.2022.08.26.03.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 03:05:02 -0700 (PDT)
Message-ID: <ca972ced-b4f7-2eb4-0381-095cedf5f356@linaro.org>
Date: Fri, 26 Aug 2022 13:05:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] msm/adreno: fix repeated words in comments
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20220724073650.16460-1-wangjianli@cdjrlc.com>
 <0e16e719-4eb2-bfb3-6b77-88d5314757a1@linaro.org>
 <20220826095311.GG2030@kadam>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220826095311.GG2030@kadam>
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, wangqing@vivo.com,
 wangjianli <wangjianli@cdjrlc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/08/2022 12:53, Dan Carpenter wrote:
> On Fri, Aug 26, 2022 at 12:45:09PM +0300, Dmitry Baryshkov wrote:
>> On 24/07/2022 10:36, wangjianli wrote:
>>>    Delete the redundant word 'in'.
>>
>> Could you please:
>> - adjust the commit subject to follow the rest of commit messages,
>> - drop the extra whitespace at the beginning of the commit message,
>> - add a correct Fixes tag.
> 
> This doesn't fix a bug so the fixes tag is inappropriate.

Well, it fixes a typo, but I see your point. Let's not insist on Fixes 
for the comment fixes.


-- 
With best wishes
Dmitry

