Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0C5BF3540
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 22:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB51310E2AB;
	Mon, 20 Oct 2025 20:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EY5IMjR/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B781010E2AB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 20:08:26 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-940d9772e28so61449939f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 13:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1760990906; x=1761595706;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IUz779fqArVsu5Mue4uYYMEeKAoqkpKvtbYqWEVcbbY=;
 b=EY5IMjR//RyKvcytKw5Us9OY3GsR6SB90miQQcb54UXAs6w8T1aU1PMTip07U7wDUU
 8N8NivAHRLeJk+fpui6sgnByw+1QT6VrtE16ohOqoK04VBb3jwvJVXGfQPbZhkeu8NVH
 Qpit1su02ESv5qSsoFwIpbpbdT/vUNLqRCKQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760990906; x=1761595706;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IUz779fqArVsu5Mue4uYYMEeKAoqkpKvtbYqWEVcbbY=;
 b=oLJdcSOA/9bizwR/sKRvSkHZwnxB/cJ1uGNSO0Sf3C5SIdAH1Co/ix4BSAJx1ziuRY
 zxJ1HePtYHO+Cdcw25AnsstJ+/cojX9kRysJFeEiAdTII2SpJN4GVK5GDQ9BdpghpdAg
 ddwRT3T7O2Rlnd2liLVOQf2FNxliMeE0t8tkj4ClhyGiQyFdoRo4+bXg+d8oVMCs/laI
 ZyrM8TWILvv9e/vpH8B/v/WbB42mF0GUFXWo4dA1JKZ3761LYcWSn83Fbp+8LEICn+i0
 SmX/2Z0uTp9fVUZel22YcZ70+s4sFFhRoBVMesRFO1hg0PHpM3mIQbS5pDqAraaCXHMR
 gJEg==
X-Gm-Message-State: AOJu0YwGMyq7xoYEyfMa9FaVeH37vcU95eHxjLPuqvQG5i0wRB41G4m7
 1/ArHUWRANmasheDMp1moCjBBSt8nc2JBR7bJXC1eSN6nqoQT5QtorF58pFoQdBI1UJ9TAjMqDk
 0C+pt
X-Gm-Gg: ASbGncvQfwa4/WJvl2RJCj07kev96ltZ/zTWEkCP6P7vcB70Xe9VlSR7q0Jukf25JWB
 1NSpSHWAd3NGKmdr1Li2YDhHJMf/rPnq27V/9GC6yYTbGVHfbMtUUuMpan943pLzA7YJlBArDNt
 58Zax6e1MugDTHo4VwcEvzTfHlrIj3rLQS/Ljw5DeOEXR4jRyMMPMbHRv1QIc1EcKcMjNmpk13Y
 VYL8A+PsfjiP9jwg85Dx9zpkKHYs5fhtHGqBArOskfWC34CV0Rc9UHKgH9c6K3Wce/RbEPbvN41
 IdJRh3W+OnPL3p5mYyGTK7FtifwEOkkx0JgHoXDQsfvdHWXw1xefg3VJOqrLg/qcPmfGNkVaURl
 xnUMKO6f8oC3Bj9GIZggI46mPBfQ31xcKwQBk3JSdMzGUfDEuYqb+XF6kqHSV245wR3/xO5GCFA
 BPGdTHV5AqDP7jDz2Tux0K1ws=
X-Google-Smtp-Source: AGHT+IEgjC7jcUOjYQOxR34I9L+GF1YbZZpGFNn7YiUKCLnGaUh60OooaZvyBRmUy89gJ+clGAPAPQ==
X-Received: by 2002:a05:6602:2b83:b0:919:9bac:8bb0 with SMTP id
 ca18e2360f4ac-93e764a890cmr2449194239f.19.1760990905874; 
 Mon, 20 Oct 2025 13:08:25 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-93e8663b5c2sm304877339f.7.2025.10.20.13.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 13:08:25 -0700 (PDT)
Message-ID: <2541f99c-1081-4253-ae58-97654694cd78@linuxfoundation.org>
Date: Mon, 20 Oct 2025 14:08:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/solomon: Use kmalloc_array() instead of kmalloc()
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20251019145927.167544-1-mehdi.benhadjkhelifa@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20251019145927.167544-1-mehdi.benhadjkhelifa@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/19/25 08:58, Mehdi Ben Hadj Khelifa wrote:
> Replace kmalloc() with kmalloc_array() in several places to correctly
> handle array allocations and benefit from built-in overflow checking.
> This prevents potential integer overflows[1] when computing allocation
> sizes from width, height, pitch, or page values.
> 
> [1]:https://docs.kernel.org/process/deprecated.html

Mu understanding is that this document lists deprecates APIs so people
don't keep adding new ones.

I didn't get the impression that we are supposed to go delete them from
the kernel and cause a churn.

How are you testing these changes - do you have this hardware?

> 
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> ---
>   drivers/gpu/drm/solomon/ssd130x.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 

thanks,
-- Shuah
