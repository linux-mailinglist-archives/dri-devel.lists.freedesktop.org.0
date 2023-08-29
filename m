Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 297DE78C447
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 14:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C71110E252;
	Tue, 29 Aug 2023 12:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8199F10E252
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 12:31:26 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31c73c21113so3860722f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 05:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693312285; x=1693917085;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SE6bs8Dp3bXXPQbAvcYoEHq5tNLQIvXmSnCFnORB2BQ=;
 b=L4m+6g+Rd9YQKwljf/KI5dzzG4YnsfQdOpfNL+UjMvsLteg1DA8RxVZH76htesfZTM
 AhdhgN0aNthxx9hXr7t1dWSOO9Eo5YaRx6Uejtjil+b+U7HiMN19ZG8Y6ugPcKAq8ssj
 63enH7wklPfLIMXs+zB5EsTT7ZCUoAfN1QU3PA5aJVP3OXEzZlzYxYp6bVcDnCzdRA4C
 doyLXcAu2rQRCAJ+YIFQUWKYzncsL+DZHmPr0CoCksUiQbN4Y0MGPkgQrKu17eOKNaku
 VP+rqAhc5Sqam1eaOhNoen2yNVHAluVSJwqPVdrNK3mUIlvgDOXyV2SAS1N3bg1cFfFr
 A4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693312285; x=1693917085;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SE6bs8Dp3bXXPQbAvcYoEHq5tNLQIvXmSnCFnORB2BQ=;
 b=G9+xsZJITxS+QqMXuHjawg2T0806IQbq260jqJ2aV2ZqOJ+GvyYbbE+gCdgwvtla1S
 SXVbtf2e6jIYfpasERCONFsen5ph3svYN8cUEBQ0AIp0PKRTVTTqrs1ki+E0M/IeTRRg
 ThrOfwKwhHeSJT6uA2OvYnSqYwyYRa6OQlQPuj9egown5lFttgcSus/9zyo8T2mTfImj
 FP9xIgob3gZAKR/RYVW8jVYvq7Zc3mMmdZTby0FLUc+SeOOmIt7ZsvSUC5FC0rOtTwMm
 XM2ppUyRxhNsEPq4FiW4W09dsD/s5cIQfr/SeCaBzDWNu5uxRUvb0OmtZM3dKWx/tbwy
 l2MQ==
X-Gm-Message-State: AOJu0YyME0Maem6KUaciJtB+DMVlbMoCZK1zMmR/toBOgTw9VQNQlNSt
 Xi7yjdMf7kYGWtoXHalGI8MFSKYwyKdfPw==
X-Google-Smtp-Source: AGHT+IENMUI5IuSSl/1eQZJDC/mUbx0Z8qqzMbvUyi2QDgffZ+TPmqa+d9jFNNfe6i0d2MGn65749Q==
X-Received: by 2002:a05:6000:889:b0:317:5b99:d3d7 with SMTP id
 cs9-20020a056000088900b003175b99d3d7mr20820340wrb.34.1693312284716; 
 Tue, 29 Aug 2023 05:31:24 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a5d4406000000b003143c6e09ccsm13654040wrq.16.2023.08.29.05.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 05:31:24 -0700 (PDT)
Message-ID: <ef05cacc-8a3c-b3e2-b07b-f0d38cd5e7ad@gmail.com>
Date: Tue, 29 Aug 2023 14:31:20 +0200
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
 <5ce9f1b6-0a9e-7cf8-25f9-de9621b342dc@gmail.com>
 <ZO3YmCJKwcJydNGV@ashyti-mobl2.lan>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZO3YmCJKwcJydNGV@ashyti-mobl2.lan>
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
Cc: ogabbay@kernel.org, ttayar@habana.ai, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.08.23 um 13:38 schrieb Andi Shyti:
>>>> During device bringup it might be that we can't access the debugfs files.
>>>> Return -ENODEV until the registration is completed on access.
>>> just wondering, if the device is not registered, how do we get
>>> there?
>> The workflow is:
>> 1. Creation (DRM)
>> 2. Initialization (Driver)
>> 3. Registration (DRM)
>> ...
>> 4. Unregistration (DRM)
>> 5. Deinitialization (Driver)
>> 6. Destruction (DRM)
>>
>> It is possible that debugfs files are created during driver initialization,
>> but Daniel insisted that they should not be accessible until the
>> registration is done (which makes the other UAPI accessible as well).
> makes sense, but then why not -EAGAIN, or -EBUSY?

Good question.

I think the main use case for this is between 4 and 6. E.g. a device 
which is hot removed and now in the process of being torn down.

In this situation we might still have references from userspace (memory 
mapping etc...), so the drm file and with it the debugfs directory is 
still there but the physical device is gone. For the IOCTL UAPI we then 
also return -ENODEV as well, so this makes sense.

The time between 1 and 3 is interesting as well, but here it's more like 
we couldn't get the device initialized and are now stuck. This happens 
sometimes during early hardware bringup and I still disagree with Daniel 
that we should block that (well on the other hand it's trivial for a 
developer to comment those checks out).

Regards,
Christian.

>
> Thanks,
> Andi

