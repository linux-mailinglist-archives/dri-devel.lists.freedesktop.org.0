Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1160FA103D4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 11:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D9710E0D7;
	Tue, 14 Jan 2025 10:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28A210E0D3;
 Tue, 14 Jan 2025 10:16:56 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-85bb13573fbso1486112241.1; 
 Tue, 14 Jan 2025 02:16:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736849815; x=1737454615;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QraKM6d9Y9J5up/W2kzOhUKdMGrM/JRFuxxdQhypIOc=;
 b=RtzdeUJi1ScEIi8BVvKWoNMGd2N4nZrToOzWyKCA/55N3rkTa8jaHiWeoBXOlRMmjY
 9Fno0fy+sXQzeTAbV+opQBD8IUuxuizgtAdUOMUnaKpBj1hFUGR3OBVe11ocF8+hO/Ih
 GjUvQ9pkqIBLpzNbQtM5sZmVWqUT3x4nx0YqVlxY1vLmlilgsG91yJlfDJRmklu/8M14
 PEbI96GkO7U00Z2tr+9cLO4goGHa0GH0AT2337/KxhYkr5V+nS9LROG2KMOUptTUpYWU
 5969pKh3bNI/sOTFdgNJNVvg8zffMIrz4q1rPXNiQVTs1AWog9rrdchQIcdpQXbUYTWQ
 KoWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLdJF8G56KKdWlop/SH3haV5kQ8mmX4EohD+ytZdtbWa/1PYTYUS1kGtq4aMTjavFspgqqH4e/B/Q=@lists.freedesktop.org,
 AJvYcCXl8WzL+uVIdWMWyrRFbj9imWqiejnazRRRkmH2qikQICXjxSY46UUzHCLgxuUk235LMwWtT/8+HhI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxndsKs/g3oWztR4mlBnM6bkSrD/dA7g6Fkim3FqbK8QWcBWVeX
 LxavYp9KV4H91I/Fv7UuJM2npCdwq3fLFEHLnJqWz18PDPpRPu3OQeX1OI4H
X-Gm-Gg: ASbGnctMeXBKvPNH4rSfwJzSw26wc8/RXaBXCT0ZmVD89AtWolPoXEqa4TbJja+NCmm
 vpiSoISIbeRwQjI0EMCWbdnnAlPr37raYP264inZ/QEf/N2Xr9OLtV764Fvn696YWNmAClrh9pV
 0BKID1GW0PFEckf9PCQlVlw0W7bLi4KpUpAC3AH8TF0Lno9ko5mfk2ZaldIqI4Q9UkDOi9CpE9Q
 ugQslu8eq/nwcwQVsHLHIhaANqdxQg38vE9jmdUmTXb8SDVyB5ybtbTbAZw1wBKoGCFaaVya5o4
 M0mlKO5/kKHkCL+1Gt756ws=
X-Google-Smtp-Source: AGHT+IEPL0u+6q099gZB6b2YuHqyjkd5pQBfNjyEK7OIDQaDVjmApYGqtRBDQTd1WyLGTKk6ZjvoJg==
X-Received: by 2002:a05:6102:4b04:b0:4b2:5c0a:98c1 with SMTP id
 ada2fe7eead31-4b3d10482cdmr22758061137.22.1736849815396; 
 Tue, 14 Jan 2025 02:16:55 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com.
 [209.85.221.171]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4b6091da783sm4558810137.29.2025.01.14.02.16.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 02:16:55 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id
 71dfb90a1353d-51cd05384aaso108822e0c.0; 
 Tue, 14 Jan 2025 02:16:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVAFT2WjoaCfzWF4Ikk91ZvY4NlkyJ7hh2vnizH+uQLIp6WW0/GzmCMGn1gZj5VNXOvLBH4aFJ+Dfw=@lists.freedesktop.org,
 AJvYcCXBICCUDXUWkKdSMUc3fZkjRocxo9zA2izYyQ+bQyKZ96Vm8/gWGev0BAmibGC01hNypSctY8IMHeE=@lists.freedesktop.org
X-Received: by 2002:a67:bc13:0:b0:4b2:48cc:5c5a with SMTP id
 ada2fe7eead31-4b3d0fc71c8mr16262110137.15.1736849815073; Tue, 14 Jan 2025
 02:16:55 -0800 (PST)
MIME-Version: 1.0
References: <20241204134410.1161769-2-dev@lankhorst.se>
 <20241204143112.1250983-1-dev@lankhorst.se>
In-Reply-To: <20241204143112.1250983-1-dev@lankhorst.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jan 2025 11:16:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUmPfahsnZwx2iB5yfh8rjjW25LNcnYujNBgcKotUXBNg@mail.gmail.com>
X-Gm-Features: AbW1kvYN2hMkKdNHoOg7qKlEDQuu9LKu80dYH1lZ12dEe-3ZNi_7PkuNI0fGm04
Message-ID: <CAMuHMdUmPfahsnZwx2iB5yfh8rjjW25LNcnYujNBgcKotUXBNg@mail.gmail.com>
Subject: Re: [PATCH v2.1 1/1] kernel/cgroup: Add "dmem" memory accounting
 cgroup
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, 
 Maxime Ripard <mripard@kernel.org>, cgroups@vger.kernel.org, linux-mm@kvack.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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

Hi Maarten,

On Wed, Dec 4, 2024 at 3:32=E2=80=AFPM Maarten Lankhorst <dev@lankhorst.se>=
 wrote:
> This code is based on the RDMA and misc cgroup initially, but now
> uses page_counter. It uses the same min/low/max semantics as the memory
> cgroup as a result.
>
> There's a small mismatch as TTM uses u64, and page_counter long pages.
> In practice it's not a problem. 32-bits systems don't really come with
> >=3D4GB cards and as long as we're consistently wrong with units, it's
> fine. The device page size may not be in the same units as kernel page
> size, and each region might also have a different page size (VRAM vs GART
> for example).
>
> The interface is simple:
> - Call dmem_cgroup_register_region()
> - Use dmem_cgroup_try_charge to check if you can allocate a chunk of memo=
ry,
>   use dmem_cgroup__uncharge when freeing it. This may return an error cod=
e,
>   or -EAGAIN when the cgroup limit is reached. In that case a reference
>   to the limiting pool is returned.
> - The limiting cs can be used as compare function for
>   dmem_cgroup_state_evict_valuable.
> - After having evicted enough, drop reference to limiting cs with
>   dmem_cgroup_pool_state_put.
>
> This API allows you to limit device resources with cgroups.
> You can see the supported cards in /sys/fs/cgroup/dmem.capacity
> You need to echo +dmem to cgroup.subtree_control, and then you can
> partition device memory.
>
> Co-developed-by: Friedrich Vock <friedrich.vock@gmx.de>
> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
> Co-developed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Thanks for your patch, which is now commit b168ed458ddecc17
("kernel/cgroup: Add "dmem" memory accounting cgroup") in drm/drm-next.

> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1128,6 +1128,7 @@ config CGROUP_PIDS
>
>  config CGROUP_RDMA
>         bool "RDMA controller"
> +       select PAGE_COUNTER

This change looks unrelated?

Oh, reading your response to the build error, this should have been below?

>         help
>           Provides enforcement of RDMA resources defined by IB stack.
>           It is fairly easy for consumers to exhaust RDMA resources, whic=
h
> @@ -1136,6 +1137,15 @@ config CGROUP_RDMA
>           Attaching processes with active RDMA resources to the cgroup
>           hierarchy is allowed even if can cross the hierarchy's limit.
>
> +config CGROUP_DMEM
> +       bool "Device memory controller (DMEM)"
> +       help
> +         The DMEM controller allows compatible devices to restrict devic=
e
> +         memory usage based on the cgroup hierarchy.
> +
> +         As an example, it allows you to restrict VRAM usage for applica=
tions
> +         in the DRM subsystem.
> +

Do you envision other users than DRM?
Perhaps this should depend on DRM for now?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
