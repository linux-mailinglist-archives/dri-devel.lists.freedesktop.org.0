Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2DA819DB4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 12:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6231B10E313;
	Wed, 20 Dec 2023 11:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EFE10E313
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 11:11:32 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1d3e05abcaeso9283045ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 03:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703070692; x=1703675492; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CW8QHigc7u7A+LxPdR2yYff29cC2tGJrVqzNJzM3nrI=;
 b=Bl9UKmNciLhh8kxCMdqdfmyQCWwyDtKCg5a2yZRTl+JFytGITkCN6yFiUOAWiRCvFV
 8HCQR3JefR0YQbTJJYoLjuOG77Hq7QebRjAEl8tPk4WD4kSxgEwQX2XP09Qn0H8bBptX
 KEOQaCN5dwQGmmdFQIUxJmCuYJC7e73uimfzaOPpSpJbWj97Kg2ItD9Pr3D7Cqpep4c7
 CxzH1D0xqGgnzEsmIxM/TQxGCMkGUPjd+Sb/2tIX+LDCxymfEst349liTVEHRGvC9TWY
 cvHB7seFBUaIoVu77gf4/d5HNbtujGinx/gUJzVz4GWLLhVlZchERufVcea/9xI/SQUp
 4rIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703070692; x=1703675492;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CW8QHigc7u7A+LxPdR2yYff29cC2tGJrVqzNJzM3nrI=;
 b=ii4JBytWh2mpZFsm/Ahfe0KyuAaPRX/BFpwPI1J0A2Z84KUPwjG1XgxfFi3jWtJmmk
 4Cvz8ANXI0pRB7cGaB1ZgyqK1v2lzihZbBoMzOD4O7o+4tHAH9lZhYYWGMS14ccx8HNm
 ygl/eMCoysypYbSmgbCewiAVh8t2qqrqni/oPE6NL8z5ZHKFYB7wstDodJEaNYVHq8JR
 /pcGReAL5KcLdGaCN08z0dmw1xedv5nKgffmWN2lW3xDm4mb95u07BxvpTb1g0AXYL4d
 Wf/91jzLXObkwDamHiPTUcyWxQcBM3V9OAYdgL+tBiOyG3EpfMA/ddWDqfp0l79lNBx4
 JusA==
X-Gm-Message-State: AOJu0Yw0/1H61BohBJn2L/gWvXGhR1oDpoH18as6tQJwxQno8Kwcn4TQ
 0/mH8nKGs0OIAea4lergz8Q=
X-Google-Smtp-Source: AGHT+IGpcm3ixSliatDE5AEQWq865kgGOdLVdZhDB9BzNjLdE46gUA+YSII+K9jbur9v6K3pU26NBg==
X-Received: by 2002:a17:902:8bc6:b0:1d0:c942:37c4 with SMTP id
 r6-20020a1709028bc600b001d0c94237c4mr10322705plo.52.1703070692228; 
 Wed, 20 Dec 2023 03:11:32 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a170902d51000b001d365153d09sm11871707plg.184.2023.12.20.03.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 03:11:31 -0800 (PST)
Message-ID: <846e883c-e3ae-426f-83e3-38e357e53ef3@gmail.com>
Date: Wed, 20 Dec 2023 18:11:25 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Automatically update drm CI dependencies?
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
References: <ZXrNI9Pqln9HVYVc@archie.me>
 <1844c32e-13f9-4225-88a7-1c621a3bfc75@collabora.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <1844c32e-13f9-4225-88a7-1c621a3bfc75@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: David Heidelberg <david.heidelberg@collabora.com>,
 Dorine Tipo <dorine.a.tipo@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/19/23 23:43, Helen Koike wrote:
> Hi,
> 
> On 14/12/2023 06:38, Bagas Sanjaya wrote:
>> Hi all,
>>
>> I'm referring to dependabot PR on torvalds.git GitHub mirror [1]. I know
>> that PRs submitted there are not accepted (the repo is essentially read-only
>> mirror), hence this mail question.
>>
>> In summary, dependabot submitted automated PR that bumps package versions
>> in `drivers/gpu/drm/ci/xfails/requirements.txt`. In this case, pip was
>> upgraded to 23.3.
>>
>>  From my experience, such automated PRs can pollute commit history (in
>> some GitHub projects these PR kind can contribute up to half of total
>> commits since the beginning of project). And in some projects, dependabot
>> PRs are automatically merged without any maintainer intervention.
>>
>> Does such PRs (when submitted to LKML these will be patches) make sense
>> for DRM subsystem?
>>
>> Thanks.
>>
>> [1]: https://github.com/torvalds/linux/pull/807
>>
> 
> imho I rather not having this automated patches, but I would like to hear the opinions from others.
> 

But why? Did you mean that making the CI always depends on latest version
of dependencies create another maintenance variable (and may constantly
broke CI)?

Confused...

-- 
An old man doll... just what I always wanted! - Clara

