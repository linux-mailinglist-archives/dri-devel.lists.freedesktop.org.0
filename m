Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC13867AD1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 16:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09BF10E78E;
	Mon, 26 Feb 2024 15:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YvAwkT2g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6589B10E78C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 15:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708962821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Qmbu7dBEF80J1yr1RbOxauP7q6SR5ks81jt9bNKoU4=;
 b=YvAwkT2goUkv0ki6e/1JzFyf2KqkI3MwSz0ViuWaVIvaKvGYF+c1xga4v0hko1yCXyuFCU
 wNbkuS2erF0XxMgjhRPfknD/0UBC1KDsKIn6WQ/65Mig9HBhLuPNNfXxxHXxQFS6tcm54a
 hotGeqJu3IpXnpVUjQwRG49gImWBgxU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-2VWNCaNLPs-_P9YXE7G7RQ-1; Mon, 26 Feb 2024 10:53:40 -0500
X-MC-Unique: 2VWNCaNLPs-_P9YXE7G7RQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40e435a606aso16920555e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 07:53:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708962819; x=1709567619;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Qmbu7dBEF80J1yr1RbOxauP7q6SR5ks81jt9bNKoU4=;
 b=Lmn5Bk/fhvOuQeXufVZTjJGqYa1miR77Svrdv1b1EMAnLqlVPM9Zb/WGsaUNPY4LIG
 f8BfOODVaNTNxwYB53ONFAF6HKHCBEOQqXJGg19ecgl3x0aWo6alNCVtjT2oSk0KRNZe
 7Ik5+nXuzXwLAbuR/VVzV+60KfMEzF3k0nJQUGgx49j1smHSZO/XxbY0gTtuD52bsTbA
 HKGumZSz2pKD/c3zyTGeUL5r5qbqDdP90w+cLINascRDZ8Z2GpdfFc42A1AnTLed0vIG
 IesLRqypi4VyMOLULjCNLo0kDx33o08//BqcvNsR6LLFUQI3BwcT8KpnGp2AYmoI7yZG
 geJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURYOne7vA5pKFo/lSqXUPYWYUrpI3nCimQ/Tf631BnmJJHf4OiZMw2bQmVnH41JKGsvT5htNWoxd4VqEa7WMc8EehkU9EH/OD20Xnj7oKo
X-Gm-Message-State: AOJu0Yyv7J8JzDsSXCMjfO4pzkDMI/uakfjxVP6/S3VEL4BaoYXvMnwS
 RHWHiclzl2Tn1J3o03omykB3wyRBg9UPSq93iNfUDsYHVIuwDmXvB+XrAPqtq+C7+2073OMYbPf
 NHjAVrDHxlmLnEwMNJqGook4blmXpWIDDQuMzkTAzY9JIz7uSz3ZoWirkdA3y37AIbw==
X-Received: by 2002:a05:600c:190a:b0:412:9bae:d9f4 with SMTP id
 j10-20020a05600c190a00b004129baed9f4mr5084764wmq.22.1708962819004; 
 Mon, 26 Feb 2024 07:53:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFP8L2CjP5ZD0gmYCQtQponQ+6W/eBRjHJgM2LhXR1j5EebPpXZWN4tgy9+v7Ujj3yv5QIoiw==
X-Received: by 2002:a05:600c:190a:b0:412:9bae:d9f4 with SMTP id
 j10-20020a05600c190a00b004129baed9f4mr5084753wmq.22.1708962818661; 
 Mon, 26 Feb 2024 07:53:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a7bce06000000b00410bca333b7sm12348012wmc.27.2024.02.26.07.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 07:53:38 -0800 (PST)
Message-ID: <5f2b4920-c21f-4aae-b058-53a07ecaf0ea@redhat.com>
Date: Mon, 26 Feb 2024 16:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/mgag200: Add a workaround for low-latency
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, daniel@ffwll.ch
References: <20240208095125.377908-1-jfalempe@redhat.com>
 <7850e9fc-f67d-44e9-9795-4b84c9a3c3be@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <7850e9fc-f67d-44e9-9795-4b84c9a3c3be@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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


On 08/02/2024 12:49, Thomas Zimmermann wrote:
> 
> 
> Am 08.02.24 um 10:51 schrieb Jocelyn Falempe:
>> We found a regression in v5.10 on real-time server, using the
>> rt-kernel and the mgag200 driver. It's some really specialized
>> workload, with <10us latency expectation on isolated core.
>> After the v5.10, the real time tasks missed their <10us latency
>> when something prints on the screen (fbcon or printk)
>>
>> The regression has been bisected to 2 commits:
>> commit 0b34d58b6c32 ("drm/mgag200: Enable caching for SHMEM pages")
>> commit 4862ffaec523 ("drm/mgag200: Move vmap out of commit tail")
>>
>> The first one changed the system memory framebuffer from Write-Combine
>> to the default caching.
>> Before the second commit, the mgag200 driver used to unmap the
>> framebuffer after each frame, which implicitly does a cache flush.
>> Both regressions are fixed by this commit, which restore WC mapping
>> for the framebuffer in system memory, and add a cache flush.
>> This is only needed on x86_64, for low-latency workload,
>> so the new kconfig DRM_MGAG200_IOBURST_WORKAROUND depends on
>> PREEMPT_RT and X86.
>>
>> For more context, the whole thread can be found here [1]
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Link: 
>> https://lore.kernel.org/dri-devel/20231019135655.313759-1-jfalempe@redhat.com/ # 1
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Applied to drm-misc-next.

Thanks,

-- 

Jocelyn

