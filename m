Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1B885FC68
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 16:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757BC10E968;
	Thu, 22 Feb 2024 15:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gQ5UlCAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DA210E96F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 15:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708615935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=COOOv66KH1+SApkaaFo0J6m3wbUnEio+qyBcuJNmFkI=;
 b=gQ5UlCAFVaKhIvFRXuiLnmG1q8s47eyfidfT/AXPBc7JdGBtLARDVD2UaFRHHoJCgL7iaa
 Up8o4iIuwshLC0GLK5JwUiO8BLXGMwKVyF8W/XB5yoZNorKGfN0u6zMfCgJjUSIjuPQLCU
 LoymMvwqMN86fXx6xeSK6S9qISQwBrU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-KIcUbRnTOnK0e0ZmRCHaxA-1; Thu, 22 Feb 2024 10:32:14 -0500
X-MC-Unique: KIcUbRnTOnK0e0ZmRCHaxA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-512a820c444so4886036e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 07:32:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708615932; x=1709220732;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=COOOv66KH1+SApkaaFo0J6m3wbUnEio+qyBcuJNmFkI=;
 b=b/gtDEWydQmaAHbUu46I2qgv9aQuY7JqQZbhliyUvZU3C7X0FR2aaEbpPsV0sjR+yw
 bi6J/Un+vM5BEavAqFcmA+cvk9coa53Rt1z7LI3HeWrURVje+mO4jZp6PNgicpU1GMHX
 UlrY0ymnItx7Ua8VPl3ChYo2rXivkGRlZ2jLnwh2a9TjXN1LJBS7zrPnRkWLJATBTobQ
 KC9BrewF8iVMXN0EQ90qWF8f1BgotfyXmU6fEXcEOxBe+5/W88CeLimgs2J2klY7dXpI
 OQj3qAJYFTrTlHYacn4+bzPiMm7640aJtSpYaNtf/HkRSqHcTz1UVlssAh1V61fZcueH
 NBjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGmzYT0OHCGb1fA9RNVqBnpLGphP7N+w9bMAVpuv7Ye5tlZ8uN7gBqjp9uhyhSjlCPXGWJWHs62R3VSt/QEbwSvVkP+nL+QUvq8l35kHhn
X-Gm-Message-State: AOJu0YzfusMVC8sXq0SRMav9Ia8m+gIObjqI9QRZlGXVeOGjWU0CpKH2
 FO80ChpdQyNQfvoB/6NGJz1fqrCT2rn2l707gChxwjFt1CmO2aA+fTznqfRu0mrE861ql0DcXP8
 47cUHkvMmHV5p6KuGI2QVLPXEFY0Hs1IVoj2r41ljrxLctg2ZuLLsz0hnRWaUfIqJoqDe03Cg
X-Received: by 2002:a05:6512:242:b0:511:75a7:1513 with SMTP id
 b2-20020a056512024200b0051175a71513mr12875621lfo.67.1708615932307; 
 Thu, 22 Feb 2024 07:32:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYzUCJ58Rq0YBrFgbCy6cdgYwzft9rG3rl8YAo9DDi+bclXTMokpgpGlzD+Y2Qn6bNjH/hxA==
X-Received: by 2002:a05:6512:242:b0:511:75a7:1513 with SMTP id
 b2-20020a056512024200b0051175a71513mr12875601lfo.67.1708615931943; 
 Thu, 22 Feb 2024 07:32:11 -0800 (PST)
Received: from [192.168.9.34] (net-2-34-30-118.cust.vodafonedsl.it.
 [2.34.30.118]) by smtp.gmail.com with ESMTPSA id
 e2-20020a056000120200b0033cf80ad6f5sm20582039wrx.60.2024.02.22.07.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 07:32:11 -0800 (PST)
Message-ID: <045bfb84-9833-442c-ac54-ed7a26451afa@redhat.com>
Date: Thu, 22 Feb 2024 16:32:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/test: add a test suite for GEM objects backed by
 shmem
To: Guenter Roeck <linux@roeck-us.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20231130171417.74162-1-marpagan@redhat.com>
 <a45b796d-5e04-4eac-b5ba-ea6bb3b6131b@roeck-us.net>
From: Marco Pagani <marpagan@redhat.com>
In-Reply-To: <a45b796d-5e04-4eac-b5ba-ea6bb3b6131b@roeck-us.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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



On 2024-02-18 16:49, Guenter Roeck wrote:
> Hi,
> 
> On Thu, Nov 30, 2023 at 06:14:16PM +0100, Marco Pagani wrote:
>> This patch introduces an initial KUnit test suite for GEM objects
>> backed by shmem buffers.
>>
>> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
>> Signed-off-by: Marco Pagani <marpagan@redhat.com>
> 
> When running this in qemu, I get lots of warnings backtraces in the drm
> core.
> 
> WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:327
> WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:173
> WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:385
> WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:211
> WARNING: CPU: 0 PID: 1345 at kernel/dma/mapping.c:194
> WARNING: CPU: 0 PID: 1347 at drivers/gpu/drm/drm_gem_shmem_helper.c:429
> WARNING: CPU: 0 PID: 1349 at drivers/gpu/drm/drm_gem_shmem_helper.c:445 
> 
> It looks like dma_resv_assert_held() asserts each time it is executed.
> The backtrace in kernel/dma/mapping.c is triggered by
> 	if (WARN_ON_ONCE(!dev->dma_mask))
> 		return 0;
> in __dma_map_sg_attrs().
> 
> Is this a possible problem in the test code, or can it be caused by
> some limitations or bugs in the qemu emulation ? If so, do you have any
> thoughts or ideas what those limitations / bugs might be ? 

Hi Guenter,

Thanks for reporting this issue. As you correctly noted, the warnings appear to
be caused by the dma_mask in the mock device being uninitialized. I'll send a
patch to fix it soon.

Marco

