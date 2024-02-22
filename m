Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10019860121
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 19:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B6310EA15;
	Thu, 22 Feb 2024 18:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GNChC0+t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2338F10EA15
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 18:25:09 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1d51ba18e1bso902425ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 10:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708626308; x=1709231108; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=bj3IcFn8mnJgzD3CoUY6c78LqZOUjuMORbYEATmxZBU=;
 b=GNChC0+tmo11fT6H6wO4WMZjcgC63KsL4hpmHUKfqXYTnKq8NO+m87Ye6sIogQgIjY
 v1/CFfqGsKNI5xH9Ynm50hdFRIAn8umjgz0K8ItY/SZPRL3R+F2E95QtzIMgpqmcwwcc
 eQGJxLwGfm4+k1vG06RRYA/+LuTBDCxuPnQqvM1z+zz/Aa9+I6eI+KjwoQOI6ArJ6765
 wE4a9CZHDyd7lU13nieU8f8dVSo1BL6VA7KlwBMlEzhL0MgNJzSPz3Aw/dhLOX8fr6Zo
 C2U9qr4aP0AoLYVkJx3OyJE23eWTuoDqVU3CJkGv6ZqteAXIUSHFnCjjk0fUpd3NLeNj
 770A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708626308; x=1709231108;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bj3IcFn8mnJgzD3CoUY6c78LqZOUjuMORbYEATmxZBU=;
 b=qxAhTGHYCjXEEM3fs1Cm0Ze2cJBwglcMt5mpZehRUtA5kOG2CKWq/y0unDY5LBRmNI
 TvgTynXN4IwleJhKqGV36p1nPKIWQ/1eyAEpdBtsRiWXDtep+bOQ4rORB1CQkUzv7GTV
 DrI+ANlKKWywzI2skKr0ASZ/E8DTlEZkXkyPuHFic1k6lR1HqYHCe9RgkTYQQiqKIGmj
 aDD3pjwBuXbMBUXLrkraZNkUkAnUMZ54YPYfbuIXVOu9kuX4p/k2og4A+rOESHZYiVz/
 fMChSFZx3QSlSB3vkNx26sQRLtGvYZo5JfVOQ1KTpJ3OlKBUcBIozeWCyWwyHpxuA0xk
 NlZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUceag6hd3sAdpF/USUQcV95qV4aqnAhQcnLrwWbUCPZPVgZvthHgk7h/AvhQ2GPFNFxu4ER+jCk/clTq5bZDuLQyJC4K994hO3REPF9OnH
X-Gm-Message-State: AOJu0Yye3nvFR7bZXgck3aegsa7EwU9oZErJ58iBWl7JJeWEqJaTs7zq
 U3cCr2OvSx/v4QpjTta9gk7p/9h8XPSAq4+FL/cXbX1qedoEiKMG
X-Google-Smtp-Source: AGHT+IHcoigpFbKIQ5fbALcZQ6Rz++MRYgKPcOOAhRgDC8V+XygUKmSTJuBfrizzNDsVEvMULKcBiQ==
X-Received: by 2002:a17:902:e545:b0:1db:ed54:a726 with SMTP id
 n5-20020a170902e54500b001dbed54a726mr15517677plf.63.1708626308374; 
 Thu, 22 Feb 2024 10:25:08 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 mi11-20020a170902fccb00b001da34166cd2sm10255199plb.180.2024.02.22.10.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 10:25:07 -0800 (PST)
Date: Thu, 22 Feb 2024 10:25:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Marco Pagani <marpagan@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5] drm/test: add a test suite for GEM objects backed by
 shmem
Message-ID: <e38512f3-626f-42ae-bb3b-3f631dfaed9c@roeck-us.net>
References: <20231130171417.74162-1-marpagan@redhat.com>
 <a45b796d-5e04-4eac-b5ba-ea6bb3b6131b@roeck-us.net>
 <045bfb84-9833-442c-ac54-ed7a26451afa@redhat.com>
 <fb2ac929-6650-444e-8f24-c9b1562d2bb3@roeck-us.net>
 <ad03c582-28b9-40b2-9c7b-8372ed5a05c2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad03c582-28b9-40b2-9c7b-8372ed5a05c2@redhat.com>
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

On Thu, Feb 22, 2024 at 05:33:48PM +0100, Marco Pagani wrote:
> > 
> > In this context, the TTM unit tests fail as well in qemu, with worse result:
> > It seems there is some bad cleanup after a failed test case, causing list
> > corruptions in the drm core and ultimately a crash. I don't know if this
> > is also caused by the missing dma_mask initialization.
> > 
> 
> That's interesting. Which --arch argument are you using to run the
> tests with QEMU?

Example (I am not sure if any of those parameters matters; it is just one
of my tests):

qemu-system-x86_64 -kernel arch/x86/boot/bzImage -M q35 -cpu IvyBridge \
	-no-reboot -snapshot -smp 2 \
	-device e1000,netdev=net0 -netdev user,id=net0 -m 512 \
	-drive file=rootfs.ext2,format=raw,if=ide \
	--append "earlycon=uart8250,io,0x3f8,9600n8 root=/dev/sda1 console=ttyS0" \
	-d unimp,guest_errors -nographic -monitor none

This results in:

[ ... ]
[    5.989496]     KTAP version 1
[    5.989639]     # Subtest: ttm_device
[    5.989711]     # module: ttm_device_test
[    5.989760]     1..5
[    6.002044]     ok 1 ttm_device_init_basic
[    6.013557]     ok 2 ttm_device_init_multiple
ILLOPC: ffffffffb8ac9350: 0f 0b
[    6.022481]     ok 3 ttm_device_fini_basic
[    6.026172] ------------[ cut here ]------------
[    6.026315] WARNING: CPU: 1 PID: 1575 at drivers/gpu/drm/ttm/ttm_device.c:206 ttm_device_init+0x170/0x190
...
[    6.135016]         ok 3 Above the allocation limit
[    6.138759] ------------[ cut here ]------------
[    6.138925] WARNING: CPU: 1 PID: 1595 at kernel/dma/mapping.c:503 dma_alloc_attrs+0xf6/0x100
...
[    6.143850]     # ttm_pool_alloc_basic: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_pool_test.c:162
[    6.143850]     Expected err == 0, but
[    6.143850]         err == -12 (0xfffffffffffffff4)
[    6.148824]         not ok 4 One page, with coherent DMA mappings enabled

From there things go downhill.

[    6.152821] list_add corruption. prev->next should be next (ffffffffbbd53950), but was 0000000000000000. (prev=ffff8af1c38f9e20).

and so on until the emulation crashes.

Guenter
