Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C17850BB8
	for <lists+dri-devel@lfdr.de>; Sun, 11 Feb 2024 22:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C6410E2AA;
	Sun, 11 Feb 2024 21:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CO0mTmbA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C461010E2AA;
 Sun, 11 Feb 2024 21:51:02 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d0bdb8061fso4067751fa.1; 
 Sun, 11 Feb 2024 13:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707688256; x=1708293056; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BCiwfWXaBiDiiMoNauIUr8Aq7JRDoqoJY68Ac5P8N3Q=;
 b=CO0mTmbA+zgHDhNpVF4m2Ftr7ro1f7a/OpoQbxmEr5GMkrJ64aSP/DcL6Rdc+3rzm+
 IHVp5GFdaP6jqo9Rxv3dR5Wi2It8KGFZARO+neOqP4I8qQjSYqWLE0BnUNwfHZuz0ZlP
 5kBMQ6LDu58b7wM91cEU6aqKv6t5CSXpXTTEBSRNHSKytElBAhMdMjZNIJD/ObDhb6hf
 QuSzPrY0oCLBF7rIzlRETgkUCC7D0TUgMq1trHBCoWiH5vw+ts9BTy8LqfioY2DTGdm+
 fTzDtykuRFASowrAMdlBAbRrhpVUgwIvq0m+Wkgz9M1fZqxzhBiYqrqhkv6W0VqvizEB
 C+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707688256; x=1708293056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BCiwfWXaBiDiiMoNauIUr8Aq7JRDoqoJY68Ac5P8N3Q=;
 b=LZZz0hvkvV5JtN67W3Lc4HIwvcjxGq2Z2eG9SdvEF+LxVJlw50xLRnT7N+yA70cwOS
 pU+DZaFmqduPYq6jjklcq6TuXdBxXXNhQupzvh/UWQrgRhBhqUaA6CdEeoB8+kNFCVT9
 J23fFgbV/cESVuPH1QakPzwSIIZwobj96reJc+S1TtD2IhThnXtYVuQgXST8CmGWh516
 sXslvfOl9C2iFodWmQaMhqOTZZ9xxnshz3NOEXdlYPYbL3HlQE2JGNNzUI4ArYg48n2K
 5JAPwf2NDdDRCL5qRX2wfp/E9fjSCULrejTEcuJNTIWyeTZ0l5ASD3U53mD0lc57tjEJ
 PRaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEvKHEjYIWfABFvcF9QtzIdfwfZxcqMYG/jY/yK+eeQo+3YZfldaRpDtXXeS9oenuqHuIbKOIAtwmjR6RS2ACGWKi6XxXGpGwCsgIwnq7ABVZQUW/yH0bXPUp74enuuly/KdMsmwUEyHBZt+HEqN+6X8ein/Hx0jeYNQWW+YG7QuWU+Ojb6RgtsizeCG8DMHDpFOWetw==
X-Gm-Message-State: AOJu0YwSkYXBn8RE7u5CkUmIs4EI4o3dPABd4vQGJhmfckY0dVVxh/GL
 pAUditEP4E3JWmoRWtivUDILr9bLNzWEPND32uk8Y1ga1z0rh6Ce
X-Google-Smtp-Source: AGHT+IF2zWkwXblenI1gRXr70yrT64HoBD+FajchtchHXmqpxVAuXiJ0OFipLmO1Ysv08aBR9nCokA==
X-Received: by 2002:ac2:434b:0:b0:511:680c:94e9 with SMTP id
 o11-20020ac2434b000000b00511680c94e9mr2303766lfl.3.1707688255748; 
 Sun, 11 Feb 2024 13:50:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWa+ad82KJzb5NNgxC9WfLsveEabqTv2bjpzz476MAr69saqz91H0Xpc3s7eHOWxvuh4tlA4b0dZTxY+I3ZsAyB9GrX+1syIQQUQoJHuiPJxrI5rQHTYVf2shmHFohsuNfo4eo18qFVwgszoOR8ZThcdwQf3GYBStOLX0p+WkIJu/n9Y8OIb8cp4z60WDsGBGjWk9ENHUXd1Gpf/izAQYP0+PgN8oJAKff/n4acdnUglwdQB0ZmC+Kfl5YciYzqg88WjozhRrVEIvYTrzfnU2V1MeHU3YR4paLGpdmGGfbffA2fHzK+Zds7XafjQmQjX9ulWRys5hsqpJgsxVqm5MqyDDsN4E0Q3wvlQbFhAIaHWtGjFRLST52leU4/sgTjlQT03yd5aiCn6t2z88+Zu+mitNrnRKjAMrxJ4BOuaDhkvlbr3fM8xvjNlkLTYc1XRbNCiuGnHaU7iMfTFPHD
Received: from localhost (88-115-160-21.elisa-laajakaista.fi. [88.115.160.21])
 by smtp.gmail.com with ESMTPSA id
 v24-20020ac25598000000b005118f40845fsm77733lfg.281.2024.02.11.13.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 13:50:55 -0800 (PST)
Date: Sun, 11 Feb 2024 23:50:53 +0200
From: Zhi Wang <zhi.wang.linux@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/i915/gvt: remove redundant assignment to
 pointer map
Message-ID: <20240211235053.00002b5c.zhi.wang.linux@gmail.com>
In-Reply-To: <20240209160829.3930396-1-colin.i.king@gmail.com>
References: <20240209160829.3930396-1-colin.i.king@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri,  9 Feb 2024 16:08:29 +0000
Colin Ian King <colin.i.king@gmail.com> wrote:

> The pointer map is being initialized with a value that is never
> read, it is being re-assigned later on in a for-loop. The
> initialization is redundant and can be removed.
> 
> Cleans up clang scan build warning:
> drivers/gpu/drm/i915/gvt/interrupt.c:346:28: warning: Value stored to
> 'map' during its initialization is never read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/i915/gvt/interrupt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c
> b/drivers/gpu/drm/i915/gvt/interrupt.c index
> c8e7dfc9f791..8c8e37f50a45 100644 ---
> a/drivers/gpu/drm/i915/gvt/interrupt.c +++
> b/drivers/gpu/drm/i915/gvt/interrupt.c @@ -343,7 +343,7 @@ static
> void update_upstream_irq(struct intel_vgpu *vgpu, {
>  	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
>  	struct intel_gvt_irq *irq = &vgpu->gvt->irq;
> -	struct intel_gvt_irq_map *map = irq->irq_map;
> +	struct intel_gvt_irq_map *map;
>  	struct intel_gvt_irq_info *up_irq_info = NULL;
>  	u32 set_bits = 0;
>  	u32 clear_bits = 0;

Thanks for the patch!

Reviewed-by: Zhi Wang <zhi.wang.linux@gmail.com>
