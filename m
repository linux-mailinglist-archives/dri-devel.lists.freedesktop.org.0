Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 882C086CC7F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 16:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB42A10E3BD;
	Thu, 29 Feb 2024 15:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UAeZ8AmI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B86B10E463
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 11:10:21 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-513181719easo417018e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 03:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709205019; x=1709809819; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GIBPoOk+1kYrUDtUJWUP6LK4VMtPXxz+WnWICgzvGsc=;
 b=UAeZ8AmIK3nSsGlJ9RJ1AtdrLesKGYLcjhcSrYSUEncnXnP3b75t/jd6jnHoahYMo+
 x5h1aZBiAgnTkRJXkfsHxYgG2N2+yLIvySTdFGHkG9JpYwA10/kjPhY9XxtM6uSsrX/i
 iI98D1Pk08X5wbTPXhDNyFUThkvV1+bJt+kFN7zy90JDS2MTxJ9+J3YVQlMbewjpIejd
 e1lQ0k5wMGA+R1lyYWAocadXklPTG55JI0A8PKtPnOLNzE4L5DGsI+8mXKWAMiQVU7Qw
 iFS3hS8VVKlvm5QEetBhT2rSGMzRQKmpAa6C/Wg/0v+khuby4CeiXl7u80NUsX5Hxurh
 i9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709205019; x=1709809819;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GIBPoOk+1kYrUDtUJWUP6LK4VMtPXxz+WnWICgzvGsc=;
 b=j9T8JdNk6teid6q9ZP4onHbE5An0qeX38Nv31dy4V7AHERwl/V3+cqds/cBDZ1kkcI
 orT5EUIZOxCDQSUoPP+zj7mAiKoYV18o+mlv0Rs8DUY2vtZe2U2e+3EN+DKTqqEh5oGK
 VNfj0ZQlzI69HwqIBm4tOygri97bKcKKMcYQ7uNte4Ma7NKdpDHO3uRNkFuqKe+M8EnH
 fEbDk/itadR6pex/aaFfsL7n7HVVIMSvqaeiQ9awVKYRia4FIcBWOI4II+t4MyFibnH6
 +stbzI4mKXkQIj5k8ai/RhlkdW0EALRogWNUiFFlSWWoHQ/94mPDgvre2HSitirJECeD
 x7ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMtilGAJnEIqOiUw9PuOAaZLmwVCfPf4ji3fzH3cIdGpDdGc0RNeU+IXjOSEbpkadUQEhorofWYxOh21RP39Ai4umFCIAekoApptEcnBzb
X-Gm-Message-State: AOJu0YzPn8j63iaIaQIqLMHnmb8ORUgAUk5goOf4gWkgsAv1ubFzRcr9
 23tMDjPhbXAVRCoy2hOY8LJqzD9JmwMSQl+UquDHvejugRJHmaS3
X-Google-Smtp-Source: AGHT+IE1rn1IKpuRyvo4Opm0Zt3B82O24f9hp/M7IbQ1wdOiuJCWMOZg3kcfpBECPXoLQ+BpqOoHNg==
X-Received: by 2002:ac2:547a:0:b0:513:22d2:ede8 with SMTP id
 e26-20020ac2547a000000b0051322d2ede8mr1329851lfn.39.1709205018795; 
 Thu, 29 Feb 2024 03:10:18 -0800 (PST)
Received: from [10.32.57.243] (yritysnetti-5422ea-26.businessinternet.fi.
 [84.34.234.26]) by smtp.gmail.com with ESMTPSA id
 m17-20020ac24ad1000000b005128d91b9f2sm210079lfp.161.2024.02.29.03.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 03:10:18 -0800 (PST)
Message-ID: <655f89fa-6ccb-4b54-adcd-69024b4a1e28@gmail.com>
Date: Thu, 29 Feb 2024 13:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 gustavo.padovan@collabora.com, pawiecz@collabora.com,
 tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 ricardo.canuelo@collabora.com, kernel@collabora.com,
 torvalds@linuxfoundation.org, gregkh@linuxfoundation.org
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228230725.GF1659@pendragon.ideasonboard.com>
 <0a5bf7d1-0a7e-4071-877a-a3d312d80084@gmail.com>
 <20240229093402.GA30889@pendragon.ideasonboard.com>
Content-Language: en-US
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <20240229093402.GA30889@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 29 Feb 2024 15:12:01 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/29/24 11:34 AM, Laurent Pinchart wrote:
> On Thu, Feb 29, 2024 at 11:26:51AM +0200, Nikolai Kondrashov wrote:
>> On 2/29/24 01:07, Laurent Pinchart wrote:
>>> On Wed, Feb 28, 2024 at 07:55:24PM -0300, Helen Koike wrote:
>>>> **Join Our Slack Channel:**
>>>> We have a Slack channel, #gitlab-ci, on the KernelCI Slack instance https://kernelci.slack.com/ .
>>>> Feel free to join and contribute to the conversation. The KernelCI team has
>>>> weekly calls where we also discuss the GitLab-CI pipeline.
>>>
>>> Could we communicate using free software please ? Furthermore, it's not
>>> possible to create an account on that slack instance unless you have an
>>> e-mail address affiliated with a small number of companies
>>> (https://kernelci.slack.com/signup#/domain-signup). That's a big no-go
>>> for me.
>>
>> Yes, it's not ideal that we use closed-source software for communication, but
>> FWIW I'd be happy to invite you there. Perhaps if you try logging in e.g. with
>> a Google account, I'd be able to see and approve your attempt too.
> 
> I don't use Google accounts to authenticate to third-party services,
> sorry. And in any case, that won't make slack free software.

Of course. You're also welcome to join the #kernelci channel on libera.chat.

It's much quieter there, though.

Nick
