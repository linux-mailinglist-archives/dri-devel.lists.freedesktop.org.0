Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766D8CC0555
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 01:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF6710E5D3;
	Tue, 16 Dec 2025 00:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Olj0+mxi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4728910E5D3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 00:19:23 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-c0224fd2a92so3792545a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 16:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765844363; x=1766449163; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Sk1yhdZDsbmHyAUXRbfG+BCb5AaoOf6d28kSsthudBo=;
 b=Olj0+mxiG6PCVrya2B0U7Sr1HlkDRfEwPwtspvFM9cfQBMJTv6939vLA+gMs/GYanG
 /1psIUkyBTwC5MnJ5lXfntaDQXJFXCzYLZHGmvd/Wi3jZ7uRN5RlWEfEI1ySo+Cr7BSz
 SORpxGMvnO/DMAwKwGABXWQvaX2m7QGI4tX7fMyuTk8h/x1MUmUut/e8t+Z91Fx8hOBg
 pmUuRbJqLicEEeMqFaLr7wakXMLFGJu6rtaFdkW0KQFNK1Oqqci88HAOk93cvDStNamE
 mnUx3tgokrjuawYnbrO6Q/Ea0ngGZHOd9iztwrg1mCNyKXUbY7FycsAQVfuzA1pl/lTp
 tEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765844363; x=1766449163;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sk1yhdZDsbmHyAUXRbfG+BCb5AaoOf6d28kSsthudBo=;
 b=XK63GyYUYKCWl+F/xyD6VMwN6YWrHKAb+DdWrRTCHKjHrHE7KhHhwRHav0zcF7OwZv
 czQjVcVJMwzjXCK35ckP9TK/fe6QnzJyNtfDlSuBdXBM4CI4zyH1uYuj+c25hvH3yTAY
 KyXrX4stQ97gaqUqsfVL3TyFmQQoPlqod0Yd2UTmWczxJIyQZFnR0cts8LrhcZgsBVak
 2ESatdG5JIP3shKCjq+EeJgsaDmk2b/E61BNyZpjanlWFzmvbbQrGdEHN2yuc5fx4kML
 AzErDDNBlMGnqmjH9uEAspz1YoEhmR4TfijS8fPAo+MuoUSSYYC4wPHhlvc+A9UB0I9f
 YeJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTdklcFgazrwrJNCeDJZmgQGiPCVLsA+xDBWP+E5Z8zedvdvhfkxuDv/VUs2910dWj9+qqhx8LXNg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQ9wA18E2aRAAGCskKKdTemidUd4Q2kBCJy3z3ExfeVlWBVsj9
 ygUeh/0EnyrVXeebcQmOKHNkc4XNOsntj2555ZBhhUEbqWC25j9k6FGh
X-Gm-Gg: AY/fxX6qmKl+Oky6eYbT0JkfkiCofby6Adt8CJZmyenpXCAM6eIGsp8aatueaC7GiHI
 9v+FPk/i6l0S/WkDxTm89Tihx0vXH/r3hvSv77G4pjQ1lwnqjtD/p0zO3T/tTumQ6PaX7/OpBn8
 C5EJ3v1E5lATeDP/WpYu1cFSE7+IFPFS4Ruljd+Y1h8HiLcXs/2JRqusXLHpV1e5bCB89kZ+wNG
 S2JtCNcq2SGP+ufsgiUHLobDEHtBlw4AtvihwdyKfLFpl47sFhJ7jRs9IaRC0hAxripizSDzjyp
 5Ikl4BYx0DtWJzC1btG4POKHaJ+x9C+a2iLiaVb1PrXhzK655MArzPgWRsu0XsngH6ZF9BEjbwP
 DWEF3oMEhjhrKe21yWfqSEaBDXP2m8xmp3GIFeIzROHK2aPlUT41CDj3aG5t9t5v3zXhMcSsAGq
 Xbnu5Cr0KDYmG6TAWFHfnbb5RrgjMMBzRmDlj/DX11N9I=
X-Google-Smtp-Source: AGHT+IHmrytMydYNAgs0qRZg7qEjrXkSVHGK3fUWY6ADeu6KzKqLiLcf4Z3v4UGHQ57LoQ8XnYjK1w==
X-Received: by 2002:a05:7301:f84:b0:2a4:3593:6466 with SMTP id
 5a478bee46e88-2ac300f729dmr7381219eec.22.1765844362545; 
 Mon, 15 Dec 2025 16:19:22 -0800 (PST)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11f2e30491dsm51066947c88.16.2025.12.15.16.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 16:19:21 -0800 (PST)
Date: Mon, 15 Dec 2025 16:19:16 -0800
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Filesystems Development <linux-fsdevel@vger.kernel.org>,
 Linux Media <linux-media@vger.kernel.org>,
 linaro-mm-sig@lists.linaro.org, kasan-dev@googlegroups.com,
 Linux Virtualization <virtualization@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Network Bridge <bridge@lists.linux.dev>,
 Linux Networking <netdev@vger.kernel.org>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Nikolay Aleksandrov <razor@blackwall.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 Taimur Hassan <Syed.Hassan@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Dillon Varone <Dillon.Varone@amd.com>,
 George Shen <george.shen@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Cruise Hung <Cruise.Hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 David Hildenbrand <david@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Max Kellermann <max.kellermann@ionos.com>,
 "Nysal Jan K.A." <nysal@linux.ibm.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Alexey Skidanov <alexey.skidanov@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Vitaly Wool <vitaly.wool@konsulko.se>,
 Harry Yoo <harry.yoo@oracle.com>, Mateusz Guzik <mjguzik@gmail.com>,
 NeilBrown <neil@brown.name>, Amir Goldstein <amir73il@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, Ivan Lipski <ivan.lipski@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Lyude Paul <lyude@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Roopa Prabhu <roopa@cumulusnetworks.com>, Mao Zhu <zhumao001@208suo.com>,
 Shaomin Deng <dengshaomin@cdjrlc.com>,
 Charles Han <hanchunchao@inspur.com>, Jilin Yuan <yuanjilin@cdjrlc.com>,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
 George Anthony Vernon <contact@gvernon.com>
Subject: Re: [PATCH 04/14] mm: vmalloc: Fix up vrealloc_node_align()
 kernel-doc macro name
Message-ID: <aUClhBdwQb83vN0o@fedora>
References: <20251215113903.46555-1-bagasdotme@gmail.com>
 <20251215113903.46555-5-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215113903.46555-5-bagasdotme@gmail.com>
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

On Mon, Dec 15, 2025 at 06:38:52PM +0700, Bagas Sanjaya wrote:
> Sphinx reports kernel-doc warning:
> 
> WARNING: ./mm/vmalloc.c:4284 expecting prototype for vrealloc_node_align_noprof(). Prototype was for vrealloc_node_align() instead
> 
> Fix the macro name in vrealloc_node_align_noprof() kernel-doc comment.
> 
> Fixes: 4c5d3365882dbb ("mm/vmalloc: allow to set node and align in vrealloc")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---

LGTM.
Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
