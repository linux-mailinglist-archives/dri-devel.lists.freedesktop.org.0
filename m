Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 795EC78D3C3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 09:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CC210E4D2;
	Wed, 30 Aug 2023 07:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFC410E4D0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 07:57:26 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9a1de3417acso132600366b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 00:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693382244; x=1693987044; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WbWwilcwEmVMgLK1VH/RXl1G63kKTmWXMCeBeqCPM5c=;
 b=lcTVCHMttEVqUog9RfqDdRcICLyG2ciN1KaJN2lsVsUbqfId+Xm6i5TMQkl0w5jkLL
 0PYwThd9W/eZ7xAdlXtcTlxmrxKAnCFISULZTQQmug+z7+6xzup/inxPeKOrnuOjOIwS
 5u5ZCmoN9ts3mvcLyN6MMt30lJyV/++Dy4XUlqMhNf1O4idunB6BOGwz7wavmWI0nUOn
 GbJPErf2nJeUF4zqpHaXd9xvOym0CE8/x2VplMR/hmzs/22zkMiNf1/p0A5tkh3NTAA8
 sjAAEwwmwPDRX4EM0vXYVVXcTbsHM5XXwC3XCP0LJ8Q2Dfy9gYiZYewH7DhTP+dxTGKv
 l+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693382244; x=1693987044;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WbWwilcwEmVMgLK1VH/RXl1G63kKTmWXMCeBeqCPM5c=;
 b=DiPsNPtr4bCAd9/N1qaOw4uNIFjCcz0jVGGz2xGyGMRovutHaEfJ8CfU8PS4OnVbhy
 IisVtCd0It6aKAcqcIDWiA2tAryCaikk4tPl/vSvscMvSwmkLcAa0YI7688EDqREM+RT
 LVKHBtL30qQekmyOjQNH4XWYX2WIAm/kI2bpv1X9HKMEtWLPS0I98LA9kYhx4MT60aT1
 wdokVfj+w0z0Gm4Ot9hpeGMFQUJL1XwzRzShLP9rVZRuSMRSV9Qhbd9IfvSMXxkxW4Ua
 kycq9hHuUKrdguG5ihehGfJ713CwuzGekTsVSYcrX5pBvqOZfq7Y6vepVw4TJIlMY2y5
 l1kg==
X-Gm-Message-State: AOJu0Yzb6/sjQJQW3ZwgZ2FYKqTAGjuigIQygnZXBc3gRL1UW2JZp+3I
 W2yhMkZZ40ZvJplW7y1UohuGq3bogmKIgA==
X-Google-Smtp-Source: AGHT+IHIo88HWuUK30Gf/RgBu2TDsV1rtpSI1Y2MbBTSYqSRUgIkz8sqBwdRXOFAtww45GIX3gx5vQ==
X-Received: by 2002:a17:907:1c1f:b0:9a5:83f0:9bc5 with SMTP id
 nc31-20020a1709071c1f00b009a583f09bc5mr5355383ejc.18.1693382244177; 
 Wed, 30 Aug 2023 00:57:24 -0700 (PDT)
Received: from [192.168.178.25] ([134.19.54.130])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170906840d00b00992665694f7sm6867217ejx.107.2023.08.30.00.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 00:57:23 -0700 (PDT)
Message-ID: <3679a4e7-918f-dde4-46a7-5613d734d13a@gmail.com>
Date: Wed, 30 Aug 2023 09:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/5] drm/debugfs: disallow debugfs access when device
 isn't registered
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Dave Airlie
 <airlied@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>
References: <20230829110115.3442-1-christian.koenig@amd.com>
 <20230829110115.3442-3-christian.koenig@amd.com>
 <ZO3XGchG9fGjoW9K@ashyti-mobl2.lan>
 <5ce9f1b6-0a9e-7cf8-25f9-de9621b342dc@gmail.com>
 <ZO3YmCJKwcJydNGV@ashyti-mobl2.lan>
 <ef05cacc-8a3c-b3e2-b07b-f0d38cd5e7ad@gmail.com>
In-Reply-To: <ef05cacc-8a3c-b3e2-b07b-f0d38cd5e7ad@gmail.com>
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

Am 29.08.23 um 14:31 schrieb Christian König:
> Am 29.08.23 um 13:38 schrieb Andi Shyti:
>>>>> During device bringup it might be that we can't access the debugfs 
>>>>> files.
>>>>> Return -ENODEV until the registration is completed on access.
>>>> just wondering, if the device is not registered, how do we get
>>>> there?
>>> The workflow is:
>>> 1. Creation (DRM)
>>> 2. Initialization (Driver)
>>> 3. Registration (DRM)
>>> ...
>>> 4. Unregistration (DRM)
>>> 5. Deinitialization (Driver)
>>> 6. Destruction (DRM)
>>>
>>> It is possible that debugfs files are created during driver 
>>> initialization,
>>> but Daniel insisted that they should not be accessible until the
>>> registration is done (which makes the other UAPI accessible as well).
>> makes sense, but then why not -EAGAIN, or -EBUSY?
>
> Good question.
>
> I think the main use case for this is between 4 and 6. E.g. a device 
> which is hot removed and now in the process of being torn down.
>
> In this situation we might still have references from userspace 
> (memory mapping etc...), so the drm file and with it the debugfs 
> directory is still there but the physical device is gone. For the 
> IOCTL UAPI we then also return -ENODEV as well, so this makes sense.
>
> The time between 1 and 3 is interesting as well, but here it's more 
> like we couldn't get the device initialized and are now stuck. This 
> happens sometimes during early hardware bringup and I still disagree 
> with Daniel that we should block that (well on the other hand it's 
> trivial for a developer to comment those checks out).

Could I get an rb for this series or at least this patch from you?

I would really like to push that now as long as neither Dave nor Daniel 
have any objections (last time I checked the Intel CI was happy as well, 
but we could re-submit that once more of course).

Thanks,
Christian.

>
> Regards,
> Christian.
>
>>
>> Thanks,
>> Andi
>

