Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D8EA757C0
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 20:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442C910E1C6;
	Sat, 29 Mar 2025 19:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GhSKxabT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFA810E1C6
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 19:55:42 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6ef60e500d7so24981817b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 12:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743278141; x=1743882941; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u308vrKVuoCKv+aJT65raHq9rbK345amQxp+zuYQWyM=;
 b=GhSKxabThWI/IaYepeqBXBUYbHRPMKhftMm0w6zxb8x3xT3Sg7A4S5nSHRVHkeTqh1
 gu+sVBWkMLe09X+ebWwqNbOFb79Dx74kBA+RM67NuA1waPPB3FbpG2ARHdWYn1HVbQ+I
 vuB2hoeYbaOVMDVNHT0fijz+tJwIhRvV8cgQLh1gVmJBygz124piBA7zjZSwgJ59Fzxb
 q8mFdf0Sl7rY7d8KBuOQlQQ/K8Enw4YzmZcHYaIZUtq4Tjh9KbxYREN4Ef0hG5WfjIrD
 TsEDHAmChLy7WKJTd2flauk6CBdYsHeUZBn+jPLS/YGG0lmPVdbBod+F0Q5hG3dwhvoT
 ciRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743278141; x=1743882941;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u308vrKVuoCKv+aJT65raHq9rbK345amQxp+zuYQWyM=;
 b=RDNdeLYOxkUgRlMTcm9Y0Q7d/b+7vlAvweHWLaejYc/geLwnCfWgTBUE1bukb/+BBF
 BJ71JXMB4fITTqj8oCW/hhHfKI8Er0KT8Vmxou7b++of1Pm0HSjB0l2xoH4SxcgHwOPR
 5l8GNe/Bm8Z/JRlYC4qQ9A4Z50IPVN8CrdCBHQl7RbkEcQNK0C5/wCtkWZ56HYIKYw4P
 tDVeMJtwY6vwg87QMh/O/fq8G+rHlJpm4+EY/P1eKnHaeq6G1Lu4BUPE0mMaGzsjcCQ4
 EDHA6mJkOZpoiBQBzpVrgcnJa6vYnU+htjEbt6lNGCgU3vv1e60c2uQ8I2nd3PWUKecK
 QtuQ==
X-Gm-Message-State: AOJu0YyUBzLQLWbCBD2oDYQyg/oToJ7q04p9v2NBmWZibTNfSUi9OlAl
 upXJLjXN9+dHtx/LdVKRrDaW3R61T1fcMAyrvDyl1U1CJq/DIRS/
X-Gm-Gg: ASbGncsRb9RloWUCGRgha08mBwvWMrJnU4ZhqNii0UabIpPaYQgeOTo+k3Xzt0j2iE0
 AyAwbxbYIXfrMKoy7laseY4KEKpRRBrecY/ytHnvfObZgKGGCr1ECCJdYVPvhwvIwDGsJhn+ftZ
 CC9jN+bZQjn/TWhZtLNrLS+MAB4ic3UyPEnd2VylvgRCT+DAYbgye0oopDl96PFHkBL/NOVbtOJ
 HTNwA/8sS7vXuvq1da8W21VETHbLg0E8/vs3mmZqAUpCJBp/hniEOnKGzXjkhg++ga8S+Gf6C5R
 ELYkLI0w3QK1hEugvePFO+qpDuMqP2P6xia1f54Au2d+riBF5gc=
X-Google-Smtp-Source: AGHT+IG4rcKHYfG6fUGVUeKFoCaHXdI7Vf7h1ZSu+rjN4tPNcDUIdkmqIFpDhXKjne+NQj0YXgNZuQ==
X-Received: by 2002:a05:690c:4883:b0:6fb:3b2b:e73e with SMTP id
 00721157ae682-702571117d1mr59207557b3.14.1743278141336; 
 Sat, 29 Mar 2025 12:55:41 -0700 (PDT)
Received: from [10.138.35.215] ([45.134.140.51])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7023a3c44besm13457077b3.55.2025.03.29.12.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Mar 2025 12:55:40 -0700 (PDT)
Message-ID: <3baabd6b-95ba-4f84-bdef-b44d6d071aba@gmail.com>
Date: Sat, 29 Mar 2025 15:56:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] *** Add virtio gpu userptr support ***
Content-Language: en-US
To: Honglei Huang <honglei1.huang@amd.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20250321080029.1715078-1-honglei1.huang@amd.com>
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20250321080029.1715078-1-honglei1.huang@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/21/25 4:00 AM, Honglei Huang wrote:
> From: Honglei Huang <Honglei1.Huang@amd.com>
> 
> Hello,
> 
> This series add virtio gpu userptr support and add libhsakmt capset.
> The userptr feature is used for let host access guest user space memory,
> this feature is used for GPU compute use case, to enable ROCm/OpenCL native
> context. It should be pointed out that we are not to implement SVM here, 
> this is just a buffer based userptr implementation.
> The libhsakmt capset is used for ROCm context, libhsakmt is like the role 
> of libdrm in Mesa.
> 
> Patches 1-2 add libhsakmt capset and userptr blob resource flag.

libhsakmt and userptr are orthogonal from each other.
Should the libhsakmt context be a separate patch series?

> Patches 3-5 implement basic userptr feature, in some popular bench marks,
> it has an efficiency of about 70% compared to bare metal in OpenCL API.
> Patch 6 adds interval tree to manage userptrs and prevent duplicate creation.
> 
> V2: - Split add HSAKMT context and blob userptr resource to two patches.
>     - Remove MMU notifier related patches, cause use not moveable user space
>       memory with MMU notifier is not a good idea.
>     - Remove HSAKMT context check when create context, let all the context
>       support the userptr feature.
>     - Remove MMU notifier related content in cover letter.
>     - Add more comments  for patch 6 in cover letter.

I have not looked at the implementation, but thanks for removing the MMU
notifier support.  Should the interval tree be added before the feature
is exposed to userspace?  That would prevent users who are doing kernel
bisects from temporarily exposing a buggy feature to userspace.
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
