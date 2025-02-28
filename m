Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76B5A4A4E9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 22:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BA110ED50;
	Fri, 28 Feb 2025 21:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DjaJgjpC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E5C10ED50
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 21:22:01 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6fd2587d059so16285347b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740777720; x=1741382520; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=PcCKf2vQjE3H4ps6lNORm4N0nTYQNrHLGbX+LIFyoMM=;
 b=DjaJgjpCBFqy0HbU6BYyWJTpaQxIoqDx3lFzD3RcyRcssIEgUBtZIFvbQQ7xcb33Xm
 qiHzEpUco+p5J2A4aVglV/CnpujPogy5KIkyBitFLlJPw2foMCp3lgmD2UuxD+JeKBYz
 yc7ZOVaEWfCUdLq6PXBosRn4VtPhXVO2AR4AhQO/Scl8HMNEUBUvwc0m9V2cuCAcbBwl
 umM8/jnUVcr3dOhGcx9WdFX0RFg/XjhA8/VREVx/e3i4kPkRmL9etmxopHGgXa9j2mu9
 V8KOGndEPfhiX0f6VWRMhJH/wIgAW/kSfbruUVcfjzNyeLDZ/xARno4ewN/SE5fuvFoe
 waMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740777720; x=1741382520;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PcCKf2vQjE3H4ps6lNORm4N0nTYQNrHLGbX+LIFyoMM=;
 b=HpRWqORtviWxPB26a/4Ox+plUWrO+Gi0KKbH8sF7KeMAyTYZVsImwEt6jLDzCZeqLb
 6dfx4jrWAdk19TZhyX1s+ntXUREROzoc3lsZ7/UIKfAOrjJmFYtW6dJGlLBzCXMsODHA
 qFgG7cT9iTn5hy3KpwHi+jdRe9RWCIaXGlS4Ji/d1Uy8BCG9OVtWYoFrymyqyGvO9yR4
 zC0ZAbCiddPn+lhaDMrcCrCZNEK2IeMrnizpzIzEnC/FI3c1bWLB1VzW6n8YpMr2M5TG
 EVB4aA7Dl2EiJ8O6EuL6h32SbBdx+Zc3zegsBU/KpnSIIFvtQSqeFsH2GlxJ+kwMWMEl
 zhCA==
X-Gm-Message-State: AOJu0Yyo2FN9XjLrdDTATuKBQ01B2dcvRlge6p+ePA8+fDGinl+F4vyD
 Dx99/onTnStgPURhE7eZ/q37qxB0xhxEHk+61bsuO2+FREvWT981
X-Gm-Gg: ASbGnctUn+W2iIkmxJoCPw3TXqC9STzarV75HTjnnZkzZAAlSa3rv7Oao/vglkcAHrD
 WpOd8PNs5K4px7myL3yj3obFbZseJKifgbbWyHDQoG4yaD0cy5zTuIUGzMOn4aRD7sWHOi/wemr
 DYfs5rtCO9w8zcCf+txMTw+HACSJ63zZKvF5Ps1GnBeQ9L8GhbKqGp4ZWQnMBAfSuR7QxBgKHeG
 xmxBoQ4FssfaW2voi8eVMHCI1tbhQ1AbiE4ntcyu31tXzBimcNW4xPO0pVl/ChgmRoeBLs2ogUW
 FOsRhFMp+iy0PtYWRm4TgDyRNrOMYA==
X-Google-Smtp-Source: AGHT+IHV8+BalWjQQ98R2YG+axIWdSnQZGCo2W2tqEj6EZziT6FUzgu+VloUaTcDIlnVMEjvpHuDfA==
X-Received: by 2002:a05:690c:360d:b0:6e2:1527:446b with SMTP id
 00721157ae682-6fd4a08e916mr65064037b3.3.1740777720274; 
 Fri, 28 Feb 2025 13:22:00 -0800 (PST)
Received: from [10.138.7.94] ([45.134.140.51])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-6fd3ca679a1sm8891797b3.62.2025.02.28.13.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 13:21:59 -0800 (PST)
Message-ID: <cd9f85a5-0d99-4007-bba2-d792ac9d84da@gmail.com>
Date: Fri, 28 Feb 2025 16:21:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] virtio-gpu api: add blob userptr resource
To: Honglei Huang <honglei1.huang@amd.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20250228053650.393646-1-honglei1.huang@amd.com>
 <20250228053650.393646-2-honglei1.huang@amd.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20250228053650.393646-2-honglei1.huang@amd.com>
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

On 2/28/25 12:36 AM, Honglei Huang wrote:
> From: Honglei Huang <Honglei1.Huang@amd.com>
> 
> Add a new resource for blob resource, called userptr, used for let
> host access guest user space memory, to acquire buffer based userptr
> feature in virtio GPU.
> 
> - The capset VIRTIO_GPU_CAPSET_HSAKMT used for context init,
> in this series patches only HSAKMT context can use the userptr
> feature. HSAKMT is a GPU compute library in HSA stack, like
> the role libdrm in mesa stack.

Userptr should not be limited to HSMKMT contexts.  Userptr can
accelerate shm buffers by avoiding a copy from guest to host, and
it can be implemented using grant tables on Xen.
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
