Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D10A990C7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 17:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559A410E6DC;
	Wed, 23 Apr 2025 15:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HjlfbL8Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6449D10E6DC
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 15:23:33 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9ebdfso1193989a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 08:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745421812; x=1746026612; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sBJXxI+VnkOvdG03h/gTU2mlJ2vsoYyyCCSIoMLfBQ4=;
 b=HjlfbL8ZKQc88SyJgAYGXgK/GDUIPKT4gdquwa7pLAhNCJZdpq9fUOgDPn5dXpBTRn
 AqhfhYgQoJDsdR2G3/0Cr0fnEexmTXX6/QxAoZVd2x5qP74Hlrb6x8dStwLuhTwxKDs1
 PPvEq+ZAySq8MDfAtr0vA3xa8x+BWn5krDJPIfZKk8HOefGWcpYwE+EbxXPqTAkpETOc
 fq2oWDGLvdE2wCTiLMEz4wqz22m0LqJT/x1jFUHxtYQQ6D5NSUpk5nv5CaNZDqNu9Pw7
 EDRxz+7bOqBHdTx8ILsVpx70tsvlRJbrRFYEZT8xBSQy9rtQDJeyI4VpU4q8u8BubNsf
 zOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745421812; x=1746026612;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sBJXxI+VnkOvdG03h/gTU2mlJ2vsoYyyCCSIoMLfBQ4=;
 b=MibOAaL6yTpHDENUb5ZP6NfR8edKkc6qQ4iTx3IatzbM+SR8nkum3VUwQTZklCWiVt
 cSTkPFLrbPO4XeswR2ALqRYWno8vAAiRn89ALZhD4ZZZtVKT0PSMPlas9Rvz6qr3Tfd2
 ijrMd9vD39FI6XI7YBK0Tm5AyPnjZqcvGJDb3m0pKKOOzv5r4ezCsy4HrC4Ugl+W4yK2
 mwx2h9Wlzwwuy5pu8gYrlx8JkA9aYxq9JEaPm46p0tTlR1JLuhIXWUWYhW/LFRgr4/Ga
 pElZSOp/MOyti4Oh6H9zWHUpjoglcw8Cqifn1vhnUeq4MJkTK3g3vTnI8R2DASOEXCVj
 hUxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPG4j6j9WuQopcv28PzjR1N66MU82U1C/TuLkT1Pg/e/4ktmJeMRQLkLcmAGUV0rz3VsOdViS39hk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDx2JtMP6Aq5Km4R7jY3JQe70AYazCjPdd833F6LkVV4L/3p6d
 UaqS7BxR38Flxy7sGThzh2YS6Myp5HbZhoERAzDZdCKgbaavR+3fPt9uRUJ1iKkbdTV7YG/+bm0
 cPU5AkLmYBosOa5cO0/dEzK5z5+0REZg04BV9mQ==
X-Gm-Gg: ASbGncvk8YqsJhLqTeSc2pK3uienkFmZSdJ2c8iSuSPI6cIZK1aYSBTi6GYALk/4LK0
 ue4y+UDWY1tEITEbUnGRA9ESOsHupjfYR7ghPbwqR9DheM+S1yOudYQrSW81WlEO0kYQIdva3Cs
 XOBVXv4kNnoLfSHGnHN5yk8us=
X-Google-Smtp-Source: AGHT+IGPu59FaDGH5BEkXJJ7svic3UgDeQqapGND2AunCs9qXYZnqI4o1kWAywADMLlCU4WGGSFlE+fbrGMmBQWyplk=
X-Received: by 2002:a05:6402:524e:b0:5e5:d9e5:c4d7 with SMTP id
 4fb4d7f45d1cf-5f62860fdcdmr16126430a12.28.1745421811890; Wed, 23 Apr 2025
 08:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250422191939.555963-1-jkangas@redhat.com>
In-Reply-To: <20250422191939.555963-1-jkangas@redhat.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 23 Apr 2025 20:53:20 +0530
X-Gm-Features: ATxdqUESCavL9HzimYlvlWteFP-krmBUrVLSD6RMVwG58YA294DJfz9zHgN2yXY
Message-ID: <CAO_48GELW3ax5Q3h9=qpWBJJa0Uy3eJwFkEcbaz4ZT56Gq513A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] dma-buf: heaps: Use constant name for CMA heap
To: Jared Kangas <jkangas@redhat.com>
Cc: benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com,
 tjmercier@google.com, christian.koenig@amd.com, mripard@kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hello Jared,

On Wed, 23 Apr 2025 at 00:49, Jared Kangas <jkangas@redhat.com> wrote:
>
> Hi all,
>
> This patch series is based on a previous discussion around CMA heap
> naming. [1] The heap's name depends on the device name, which is
> generally "reserved", "linux,cma", or "default-pool", but could be any
> arbitrary name given to the default CMA area in the devicetree. For a
> consistent userspace interface, the series introduces a constant name
> for the CMA heap, and for backwards compatibility, an additional Kconfig
> that controls the creation of a legacy-named heap with the same CMA
> backing.
>
> The ideas to handle backwards compatibility in [1] are to either use a
> symlink or add a heap node with a duplicate minor. However, I assume
> that we don't want to create symlinks in /dev from module initcalls, and
> attempting to duplicate minors would cause device_create() to fail.
> Because of these drawbacks, after brainstorming with Maxime Ripard, I
> went with creating a new node in devtmpfs with its own minor. This
> admittedly makes it a little unclear that the old and new nodes are
> backed by the same heap when both are present. The only approach that I
> think would provide total clarity on this in userspace is symlinking,
> which seemed like a fairly involved solution for devtmpfs, but if I'm
> wrong on this, please let me know.

Thanks indeed for this patch; just one minor nit: the link referred to
as [1] here seems to be missing. Could you please add it? This would
make it easier to follow the chain of discussion in posterity.
>
> Changelog:
>     v2: Use tabs instead of spaces for large vertical alignment.
>
> Jared Kangas (2):
>   dma-buf: heaps: Parameterize heap name in __add_cma_heap()
>   dma-buf: heaps: Give default CMA heap a fixed name
>
>  Documentation/userspace-api/dma-buf-heaps.rst | 11 ++++---
>  drivers/dma-buf/heaps/Kconfig                 | 10 +++++++
>  drivers/dma-buf/heaps/cma_heap.c              | 30 ++++++++++++++-----
>  3 files changed, 40 insertions(+), 11 deletions(-)
>
> --
> 2.49.0
>

Best,
Sumit
