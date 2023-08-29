Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 666B078C359
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E6110E21F;
	Tue, 29 Aug 2023 11:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F9910E21F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 11:35:41 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-401d80f4ef8so4006295e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 04:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693308940; x=1693913740;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oh56qL92Ukj1t6xqto79+ouLLrn9WBm/794t/tH8njc=;
 b=Xvj6YjQ0/X50UahdzL66v1HWjl0NAdGfEv04VwjgKRsuqrsd5aiKMYqp3YjdRP6SRY
 SFi+aENkqB2A2XVpoOKMtORqpDr6bn0+MXEwrPlD4U0Sg2t38ACsyJaCvBE3wMsMKlk8
 I5sN7yIlb1xsyLHkyRxbJ9unpu3b+MiFt6zOp51hDcgmTWNAV79JSrK8nEbhJ+dXCQUo
 Tq4I1VYtVMfojTISk8hoQWOSHArZsIQu3HyGJ1wimYraHdRuRLOrK6mzAiFxU392WpTS
 QyULu2r2TeM1M0erNuBkQszuCNqCCW6JAZhflmpbk6+Dkg/uArr1zGVNZkFEklpY0rfU
 +Lbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693308940; x=1693913740;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oh56qL92Ukj1t6xqto79+ouLLrn9WBm/794t/tH8njc=;
 b=CtK6PdCt0zQ6+2/+DCfKKwa8PVIvFaCXW1Ai7CZXPcG8q9B8FN+QyRvBENl4XBcngX
 wLBCaXeEgM+XR7et2Y9KRT7+nFw4gHfivlvUnWhafoGwQmrF+qUMG5zqwnBJRgBGnh4D
 flJpSxCFmdsUCdpeVCL8yO3qv56SdE3HHBIhXKB78vNTom+/dqSgY5J+EPFd0IEtNdTC
 rATcVktuCFob2qytfKAm9w9/ToB9I8DI3iWqXP3T5PjXtUpd6C6tAQObGH/SUt6lsgGn
 8lcC9NR2NWWJqz4W7K1JgcfWXb6Ev9rGsNVYRKnUHDIAoch3Ffy4ULrUmHTao9Jn+fuo
 msfQ==
X-Gm-Message-State: AOJu0YyZG+lnUg0DQwGxXnBWLbr5kBwnHDsn/NuzUwi6KpumuHl242oO
 z+GepJYg8MT/wGjGEG5KaAA=
X-Google-Smtp-Source: AGHT+IFDJ+Wa4e4T5Sk5dIS9Q6nmAasWRQDMqKl+TxC4K/zXyr1nmh8hGU7a7j1D8pgbkexDtG5i0A==
X-Received: by 2002:a05:600c:2349:b0:3fb:ac9c:e6f with SMTP id
 9-20020a05600c234900b003fbac9c0e6fmr22871373wmq.38.1693308939802; 
 Tue, 29 Aug 2023 04:35:39 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a05600c221300b003fee9cdf55esm13570681wml.14.2023.08.29.04.35.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 04:35:39 -0700 (PDT)
Message-ID: <5ce9f1b6-0a9e-7cf8-25f9-de9621b342dc@gmail.com>
Date: Tue, 29 Aug 2023 13:35:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/5] drm/debugfs: disallow debugfs access when device
 isn't registered
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230829110115.3442-1-christian.koenig@amd.com>
 <20230829110115.3442-3-christian.koenig@amd.com>
 <ZO3XGchG9fGjoW9K@ashyti-mobl2.lan>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZO3XGchG9fGjoW9K@ashyti-mobl2.lan>
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
Cc: ogabbay@kernel.org, ttayar@habana.ai, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.08.23 um 13:31 schrieb Andi Shyti:
> Hi Christian,
>
> On Tue, Aug 29, 2023 at 01:01:12PM +0200, Christian König wrote:
>> During device bringup it might be that we can't access the debugfs files.
>> Return -ENODEV until the registration is completed on access.
> just wondering, if the device is not registered, how do we get
> there?

The workflow is:
1. Creation (DRM)
2. Initialization (Driver)
3. Registration (DRM)
...
4. Unregistration (DRM)
5. Deinitialization (Driver)
6. Destruction (DRM)

It is possible that debugfs files are created during driver 
initialization, but Daniel insisted that they should not be accessible 
until the registration is done (which makes the other UAPI accessible as 
well).

Christian.

>
> Andi

