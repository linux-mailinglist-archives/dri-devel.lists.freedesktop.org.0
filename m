Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788EAAD4680
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 01:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6EC10E321;
	Tue, 10 Jun 2025 23:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j86x6sBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A561110E32D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 23:12:15 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-70df67e1b17so53712187b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 16:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749597134; x=1750201934; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MZHaVkiLrbaAoem+fJHSN03rlECJT5C5GzqrHElASHo=;
 b=j86x6sBsRt3bOS9BS666nPML3Bhl9HkzVMwSv4mb0Ydyu/qRW3eeyYzDrdWgpGHyUK
 CuDnkQYKFlBKG3CLcSSLJnylCdj/EOx0BtJFWHRASwwlmuwd/vIRYmHD5iLHzbhD6FQy
 sF0Khxm6BrhukVhmURUx6P7zhupHTyyJZ5kSRev9xKQows6cce0VwxCxW1d+n3BDNUJg
 01JJOhAv7jgRFj3BPxhiEl0Pb259JIfNKqYnzuvKN2QvC/O1ETIVNgA8fyZFX6IZKEg0
 OubZ8yZ1Za5tdIBdtSElnK+dDFlQlP7bqVtSiqeIHaRgRmDObTNmt9eLs0XacOrWCAqY
 oT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749597134; x=1750201934;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MZHaVkiLrbaAoem+fJHSN03rlECJT5C5GzqrHElASHo=;
 b=decCZ75fZ+Wwlb+GnjFQPTvKZbMsOjxVJvOrB2myAH/h5MlbnyVUz4rd3aUI/zeEsO
 ojNN50wUInEhHDtl3gjfZR5ehsSx60CNbkiMWhcWUno18PHUwm1fn8svD4ArYK54x8kW
 STt1dv/nhDE7NBhnjHOP8PbQERrzi/0JgS06KxizX/+IiofgtdW4OPmC806O94P3B4o5
 f6GnOAUOsUQ3ozmuCHevKOE5Po/MAUReUee4E/r7Gh5aAjYwxpMZdiRqSG7qKdEg0UsF
 b+dPZCpKnSLTbclcwW6nDgf89RindNInMh8jU59/zd+Hn6++DuHgFgz0FsL6LVX7GtwH
 Gspw==
X-Gm-Message-State: AOJu0YzaWY7S1D9XqT8IHcRQY6CvL1+Jb9ylNvnDupvb8UVLIVZ5wGKm
 R9Ve0NxH7jAGfhcCAIj2+ueYwSx8RvWwspmxB+q3z4FucHOJlr/Ey11NZJMsGaLYcMsCHyDPXB+
 bB5mWAHsGmwzaudxQw3pfWibmq5LMDSI=
X-Gm-Gg: ASbGncueymX6HlrGaVYXZ90WvImM+rl0ADrgKQx4H5UKukglmofyftg1rXuQrVAHgam
 b48CKkM8HNhassmI9Ja7uWcw6ob/2QHYlynpILTX05yIkArGu73NR4C+nYKWID/ts0epuVtavA4
 uvJrJWmUqYz9eT7E7XG89ZZA6oKvDIIu/e0hiCU/kjb7s+aWhLCyCFztTG3odL1tyzDQmrE/IPV
 oa1
X-Google-Smtp-Source: AGHT+IEXDVnMUtCIHT0EzmIFREsVFhabB3kvSB6CwQcovD6visnkC9fl3iyGLCJk9zRI3gOuA6yIMYxXNcI0Rd99pD8=
X-Received: by 2002:a05:690c:39d:b0:70e:7706:82c1 with SMTP id
 00721157ae682-71140af1863mr18827157b3.34.1749597134588; Tue, 10 Jun 2025
 16:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250602143216.2621881-1-karunika.choo@arm.com>
 <20250602143216.2621881-2-karunika.choo@arm.com>
In-Reply-To: <20250602143216.2621881-2-karunika.choo@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 10 Jun 2025 16:12:03 -0700
X-Gm-Features: AX0GCFs0t2lD4ebPOfl_N7eCj67AHAfs5lteWu97IH0qtVxZ_pexAD0d0DDX1BI
Message-ID: <CAPaKu7TbzqjF+q7McOS3JppiKfg=zKFr4aYQZGsmvOnR+jEN3g@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] drm/panthor: Add GPU specific initialization
 framework
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jun 2, 2025 at 7:33=E2=80=AFAM Karunika Choo <karunika.choo@arm.com=
> wrote:
>
> This patch provides an initialization framework for multiple Mali GPUs
> by introducing a GPU support look-up table. Each entry contains, at
> minimum, the architecture major version of the GPU, and may optionally
> provide feature flags and register offset overrides.
<snipped>
> +/**
> + * struct panthor_hw - GPU specific register mapping and functions
> + */
> +struct panthor_hw {
> +       /** @arch_major: Architecture major to match against */
> +       u32 arch_major;
> +
> +       /** @features: Bitmap containing panthor_hw_feature */
> +       DECLARE_BITMAP(features, PANTHOR_HW_FEATURES_END);
> +
> +       /** @map: Panthor regmap */
> +       struct panthor_hw_regmap map;
> +
> +       /** @ops: Panthor HW specific operations */
> +       struct panthor_hw_ops ops;
> +};
None of the fields are really needed even at the end of this series.

Can we merge patch 1 & 2, introduce just panthor_hw_init and nothing
else, and let panthor_hw_init call panthor_gpu_init_info?


> +
> +int panthor_hw_init(struct panthor_device *ptdev);
> +
> +bool panthor_hw_supports(struct panthor_device *ptdev,
> +                        enum panthor_hw_feature feature);
> +
> +#endif /* __PANTHOR_HW_H__ */
> +
> --
> 2.49.0
>
