Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9A3B1C88B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 17:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB82710E79C;
	Wed,  6 Aug 2025 15:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="GxriXMId";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961BF10E79C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 15:20:09 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-4fe234cf176so9779137.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 08:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1754493608; x=1755098408;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=805K6fvtdokSqfEHjnN7vRqDDCTH7wpXcqcu6F316LE=;
 b=GxriXMIdXrYtp7K7QGxVJ4+nXhS54X3j4+0uVYJOyQuM3Bz9tqhr3dE+jxu+8q74NX
 mRQnnu4Xs+TZcIYc8aP/U4b7b0fHWn5+7rxUcgSLOPHRVrCgWB+LujdqazJ4UHrF4HOe
 15URhEQewYhRg1unz4+J0ONk39v6T2iaEDp/KJAly0HlLbTs8PryQN0CP2zf3DFXqUqz
 DTz9UYM9vvbF78TLneMktIvaBSsIoSBrKLXas+Tc4kkGv4AtYlfY4BX37qGXKLEdojfb
 LnR9xZUgHFBUE8WLBnkipIOSwkPQN1A9i9z2AMdbhi034Rbhk9S3UAi3HcKPjEYSNS9Y
 brTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754493608; x=1755098408;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=805K6fvtdokSqfEHjnN7vRqDDCTH7wpXcqcu6F316LE=;
 b=qIyHtD9qyLueBV9ffnBjBl1lGmh+Kn1qWhTnRR6PKbiGnRV4tlXvHHIlF5KGD1w4bV
 HI043nj7Mlr7BB37uqHO6N2Ni+e9ZJfLAIjOatK5roDzi8HkYznXOFMJSTJoP3UFyb15
 NXLXZMQgiJtSALAfA9KrbP8ZNbRjSvE57P/irL6qL42d+oPfKlWiHt8yPDzie1NHfulo
 DCGxKZLJ7pDgVNfdmfVKoBIEaEE86yohhZ2LZ1R7AAbWIiBTMcLl0kUtE9EfKP9Nud//
 54nkT6OTpC3QJAj1ZvTO6LAqGwxXU3BK7GORXS+2LM2ZbDcy+RnBcRdzb+WdB2c1ycgp
 ycpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkdkNF3LXbjAE27aUKBi7+hti5OV8pdw8pQy454Cbo/doJ0IeGgPVmkkiYsa70aBITY2B0YnAvs/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9uprkBp7/kmew3z/SrmwBi3wL+gL/Q99OY9MqRdIMyx32quGf
 2YMRPtMwxaV8BZYafL+1LcsvjHO/IZVpyIXtdvK3nppcpByGAfEAsoiteKRu8Et7VkdgMj8NvEl
 2gRt/Ddib9BRvhUKckhH6MN547frrN7nxSm0LYb1lHw==
X-Gm-Gg: ASbGncuzPXrgQvWz0vSBl1civWm8KQeXmWa/+ST1t6tiOfkmV3w00PidWkYEfqdQL76
 K7r9jg/ddaUdaXP9Og6jsJWunyCJef9DevLwLlLO1tP6fBc/zOrnbBo3QSaMf0SG/3h+LFijGy8
 B8RJkEGjzhefAoxj+D0OWXDxxTd7/EJEUJzbP+QoHzqXTgKlmkRNMJS+mM7WPV75wv1V4a/aca1
 kHg
X-Google-Smtp-Source: AGHT+IEwtib/MiSSe6PyJvzqzeOSOjkXKPFo4O7cvuV5C+3dwyYliOiUE4LGgYQXOufi1bsGFYsJcYEM5+C9sofisDk=
X-Received: by 2002:a05:6102:dc7:b0:4de:d08f:6727 with SMTP id
 ada2fe7eead31-503731b8172mr1694875137.13.1754493608384; Wed, 06 Aug 2025
 08:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250731173534.3494324-1-adrian.larumbe@collabora.com>
In-Reply-To: <20250731173534.3494324-1-adrian.larumbe@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 6 Aug 2025 16:19:56 +0100
X-Gm-Features: Ac12FXyX3LGMeD1c7gpkSiDZahsXCZ1jgp3yTJhhAYZ-wv0f2moDW31lBHHWdaw
Message-ID: <CAPj87rPrGX2c3RQKJ6NxGYWbzbNp-9zCC=twCN4OLcD4aXcuHg@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Print RSS for tiler heap BO's in debugfs
 GEMS file
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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

Hi Adri=C3=A1n,

On Thu, 31 Jul 2025 at 18:36, Adri=C3=A1n Larumbe
<adrian.larumbe@collabora.com> wrote:
> @@ -432,7 +432,8 @@ static void panfrost_gem_debugfs_bo_print(struct panf=
rost_gem_object *bo,
>         if (!refcount)
>                 return;
>
> -       resident_size =3D bo->base.pages ? bo->base.base.size : 0;
> +       resident_size =3D bo->base.pages ?
> +               (bo->is_heap ? bo->heap_rss_size : bo->base.base.size) : =
0;

Just use panfrost_gem_rss() here, though you'll need to make it non-static.

With that:
Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
