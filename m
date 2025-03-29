Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B066A757BD
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 20:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694FE10E05E;
	Sat, 29 Mar 2025 19:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TRserY7c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDD110E05E
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 19:50:28 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-702599fa7c5so3671087b3.1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 12:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743277828; x=1743882628; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kgUng1lsLClhuHLGL9t/6EycDsTNPfaDVFfdT+Zvh3A=;
 b=TRserY7cOjbF0cQm2OM1zFu96Yufxuhgzir6z8+sJMBqnAfk7Ft1t5kVNK++oVHntC
 KRA3XiCtqeA8pER/Jd7DUj3BRlHZEzFSYVLOjCWmn3vlO008TQg0kMqX2mjbdvkts94v
 dOYDOXdLf6AJgbClqr/L9a+qtZFxAZas6cnfFA0GynNaFBIXv+magRBNbAB/Yb9Hf90e
 I1/QSIzeq04JfTKIg1cZciXyNmkdvQhPYIjI9aILSqjKSsb/xFdAb0M+/s+1+Gm3cqOL
 L+5CQlLm3d8a92lCrUoNydFYGa8T/+dZL43q3t9QKzSh6hFgDK5iSLdk6M8GacObOAba
 EpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743277828; x=1743882628;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kgUng1lsLClhuHLGL9t/6EycDsTNPfaDVFfdT+Zvh3A=;
 b=i6PtDCTfaaiTH7v+WQKwemQ94I8zhT8jIKBQQ+QoYu6uBf3HP2Kzm0EPRAv++TA13j
 pt1SRj1psETO4lYJNbAM9rplazv+yJLs5qjhE9+6Dp0yDHBjj1w2w9NM8UqzML/GMade
 VzaUikD4f5UCo9IReK0F+M13+3MvK8/FzPrGjULoMcpwv4X3yD3bURcGhuF4guWuY3uS
 cyW48EwZz2loy/+1QJbMXYEyULH05/J6pkofBMWn2v/4c+TcP+cWZFcNCgMBO6SexLGs
 dLrqJ4DYQnPYbRaS0cm+1B+ei0eZX8tLAttO3SkuBU/Wr5tkVj5kT1XsYwtLftItgnoH
 b7sg==
X-Gm-Message-State: AOJu0YxUbx03J+L9K0/GTP8VK5hz2xWluPHcGVjtCsq1g2xKo7CMsOyd
 wmm0FFr6wJiK3b/qnSFC0w2/medbD5BSYCJVTAkFXjRQ0TV7GwfC
X-Gm-Gg: ASbGnct2pmdP1r9jmrgXPGJqE4RWbe9N1oZzIsp3g/UX0BK9OKNdDsUz9H3cpNIRrvJ
 n9Aif5iAMG9lgxhLEW+js44IotZKj+4y2b55cTGf4jOJcIn0QHERXzLazdUglyFGMBrLc5zKHQJ
 ef2pmEOqgmNbwgwFVoNcnGXcZd16xBKSUAPDweWP03HEWNf7owD4gHPT4N9w02eg68G3wEafUTh
 HIw8IQ0P3rkkcCSHz5YH5gYl4YuK8jseGI3KY3/sEVnFBNGgzH5tNYa4ZHvqBaVgo5uyuYTm8VZ
 wCl3nPPoXov5CCNQVkDkmxJnaTmtHxWo8c+t3u04BUQLWrGlk2A=
X-Google-Smtp-Source: AGHT+IFXYHGF1kbfN6DrpHRX6V4TwAnNDp2HMI6U89Z+SpTpIjE4sgJHSH4xQxwFLc3mE4l32HKTFg==
X-Received: by 2002:a05:690c:3345:b0:6f9:e4e1:a86 with SMTP id
 00721157ae682-7023e105414mr105948257b3.16.1743277827709; 
 Sat, 29 Mar 2025 12:50:27 -0700 (PDT)
Received: from [10.138.35.215] ([45.134.140.51])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7023a341a52sm13676117b3.23.2025.03.29.12.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Mar 2025 12:50:27 -0700 (PDT)
Message-ID: <42048a80-a736-4ccc-953b-924d1e640cd0@gmail.com>
Date: Sat, 29 Mar 2025 15:50:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] virtio-gpu api: add blob userptr resource
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250228053650.393646-1-honglei1.huang@amd.com>
 <20250228053650.393646-2-honglei1.huang@amd.com>
 <cd9f85a5-0d99-4007-bba2-d792ac9d84da@gmail.com>
 <c2d1334f-6f5a-493f-bbf0-3e92789f128a@amd.com>
 <85470439-3c03-4787-be91-b6b680a5aca5@collabora.com>
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <85470439-3c03-4787-be91-b6b680a5aca5@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/26/25 10:46 AM, Dmitry Osipenko wrote:
> On 3/6/25 13:51, Huang, Honglei1 wrote:
>>
>> On 2025/3/1 5:21, Demi Marie Obenour wrote:
>>> On 2/28/25 12:36 AM, Honglei Huang wrote:
>>>> From: Honglei Huang <Honglei1.Huang@amd.com>
>>>>
>>>> Add a new resource for blob resource, called userptr, used for let
>>>> host access guest user space memory, to acquire buffer based userptr
>>>> feature in virtio GPU.
>>>>
>>>> - The capset VIRTIO_GPU_CAPSET_HSAKMT used for context init,
>>>> in this series patches only HSAKMT context can use the userptr
>>>> feature. HSAKMT is a GPU compute library in HSA stack, like
>>>> the role libdrm in mesa stack.
>>>
>>> Userptr should not be limited to HSMKMT contexts.  Userptr can
>>> accelerate shm buffers by avoiding a copy from guest to host, and
>>> it can be implemented using grant tables on Xen.
>>
>> Yes, I totally agree userptr can accelerate shm buffers, but I currently
>> don't know if there are any other projects working on similar features,
>> or if maintainers have any opinions or better ways to implement them, so
>> I temporarily limit this feature to HSAKMT context only.
>>
>> I am waiting for everyone's opinions, please provide your thoughts.
> 
> USERPTR should be relevant for anything Vulkan-related, like Venus and
> native contexts. I expect that this new feature will work universally
> good for all context types.
> 
> In order to merge USERPTR support upstream, we at least will need to
> prototype the guest USERPTR in one of native context driver to know that
> it works. You'll need to post the whole set of host/guest USERPTR
> patches including QEMU and etc, not just the kernel patches.

Does the user-mode VMM need to be QEMU or would patches to
another open-source VMM, such as crosvm, be sufficient?
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
