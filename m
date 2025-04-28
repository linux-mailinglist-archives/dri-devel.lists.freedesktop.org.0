Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC34A9E801
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 08:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F19B10E155;
	Mon, 28 Apr 2025 06:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mH/0IeSV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6553F10E155
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 06:10:56 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-acb39c45b4eso689343066b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Apr 2025 23:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745820655; x=1746425455; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QphPfE+vUE67L3trT4TGohjxqNrvuWYQckH1kmeBzLI=;
 b=mH/0IeSVBWfCYMl9BAewhCqb+gYMSKHJBJykhtXtwEXpXFqp9vlUqyEhPmvM0GxnqP
 c0tMsmpRxMGsEqVmqK736oG11QHRNRZHoaI43e9Sf5sUGJxlAJNpA9g1mNnmd/fAeJb4
 HbT68Plbwp1VpmpF8YIiNtUTCHdyfleCJ8AQhArrSOA7V1Pm9fHitMATJu5j4LiO+rG9
 y3j8vEhdjaaHfrOhgC9FZp9igGrmp9TdJWPiuc3m7b0yKtdkCdvOArN8q1CZnFTq6yls
 en6IqfSWHAVorD6focEoq/cszCV27GzWdLzDXjqWuPCTTPFtcjfH6AsNmF/EPHYnvzVE
 sb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745820655; x=1746425455;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QphPfE+vUE67L3trT4TGohjxqNrvuWYQckH1kmeBzLI=;
 b=lXlFwXzn5Pma7cTt7VNnP8KKd4J+XB2UowtBfoQfYIJ9BBZzVkwc7u4ScibOwRCLDI
 UxNG1KxWqGnoeGgKl9zKTsEN8ieoVKZUSrXo0I46AUqVcD9gQYEOzcdUQuhkujxWzJ1r
 pooURrGIIaYeGWG8ZRlUJv1vL+Y5BtmlhqsfGlTQSVZ1TjDCV3gJcwm2LBJ05jIx2T+/
 DJivyHMSwLtpnsuYXxAh1Fp0M7gpSmV6eUxTZll86KfzWyn6dZzpp5D8lOFx2+0Jb62r
 /BkGyPpheUlqiwxZpq5BaHnrS+kIyFQdFSAnY1eYRvjEdC3xmgH7qhpLAOuLIyQy+OAo
 1jlA==
X-Gm-Message-State: AOJu0YyVU9DSyz8oRy1vg53BlBVh2aUpGPEXwIyQriwoDXgXnT42fTIN
 FuhhckDzYwqC/KZ+lWRonM4Kgo/VjHw0R2FIAyDS5RIKR0I0Y5JO
X-Gm-Gg: ASbGncs6E9Jmtrr/aS2wOAlbvwll6mh3C+kH8zR3cwnIe57SZ4xw1LbBtWnj0VPsSmm
 EGY8AeKQrxfxUhFxb8w94i+fYALDHsYM2TNlErkRw2X3Fvnop2j/fjqMxKgpzM3itAp6Wr9Xs67
 F8SiaXdw7uAx8X0vAgaoMZSxLXxBVL/hXaUHwagKxPhy/lX/2AOa2Ldr6jBsGqTE0rBaQi5zo7g
 MqWM5j/aMVp5a4IVqXyC93i93mFLxaS7Q+KBeqAMU5KPug651QMYnnPbIteVkssgVZew7HrmYHQ
 y1xs1VU7g7c1Eb/F06VHAA1qKQWfu1v1j7iEFoB1NTr3lYcYPqqtYbcVbDuBWvQh6gTwP+8bT9U
 VcF+ZXVMcgAkEenWPsQ==
X-Google-Smtp-Source: AGHT+IHkHGWY//K0wfWb5JEsBAo4EX5tBYhxssfjjb2vj5Y0wAC7SsY0YE6ZYBAcqI4jC1DXrJwMuA==
X-Received: by 2002:a17:906:f59f:b0:aca:a162:67bb with SMTP id
 a640c23a62f3a-ace739dcdd6mr918382966b.4.1745820654333; 
 Sun, 27 Apr 2025 23:10:54 -0700 (PDT)
Received: from [192.168.1.18] (146.10-240-81.adsl-dyn.isp.belgacom.be.
 [81.240.10.146]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ed70611sm569224466b.143.2025.04.27.23.10.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Apr 2025 23:10:53 -0700 (PDT)
Message-ID: <3aea4181-427f-4859-8a89-54c139775da6@gmail.com>
Date: Mon, 28 Apr 2025 08:10:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] drm/panfrost: enable G31 on H616
From: Philippe Simons <simons.philippe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
References: <20250403055210.54486-1-simons.philippe@gmail.com>
Content-Language: en-US
In-Reply-To: <20250403055210.54486-1-simons.philippe@gmail.com>
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

Hi, is there any issue with this serie

Thanks,

Philippe

On 4/3/25 07:52, Philippe Simons wrote:
> Allwinner H616 has a dedicated power domain for its Mali G31.
>
> Currently after probe, the GPU is put in runtime suspend which
> disable the power domain.
> On first usage of GPU, the power domain enable hangs the system.
>
> This series adds the necessary calls to enable the clocks and
> deasserting the reset line after the power domain enabling and
> asserting the reset line and disabling the clocks prior to the
> power domain disabling.
>
> This allows to use the Mali GPU on all Allwinner H616
> boards and devices.
>
> Changelog v1 .. v2:
> - merge flags to a single GPU_PM_RT flag
> - reorder init/deinit powerup/down sequences according to
>    Mali manuals.
> Link to v1:
> https://lore.kernel.org/linux-sunxi/20250312232319.25712-1-simons.philippe@gmail.com/
>
> Philippe Simons (3):
>    drm/panfrost: Add PM runtime flag
>    drm/panfrost: add h616 compatible string
>    drm/panfrost: reorder pd/clk/rst sequence
>
>   drivers/gpu/drm/panfrost/panfrost_device.c | 71 ++++++++++++++++------
>   drivers/gpu/drm/panfrost/panfrost_device.h |  3 +
>   drivers/gpu/drm/panfrost/panfrost_drv.c    |  8 +++
>   3 files changed, 63 insertions(+), 19 deletions(-)
>
>
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> prerequisite-patch-id: eb8a11e2b24bb282970d8b8528834dea7ee392cc
