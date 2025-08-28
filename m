Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D17B39F92
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8D110E9BA;
	Thu, 28 Aug 2025 14:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KJqbyTtM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7C610E9BA;
 Thu, 28 Aug 2025 14:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756389716;
 bh=lCguA9efneea2yG9g+DfE92m0deh/wCKq1TZlgaDIQE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KJqbyTtMW6EbTwUcTzCui/R+89DLlnUgSWgFru071A6U9b9aFqmBBK1fB2W0vYVqc
 PDjoBPGGJERjKw9ZnOi2B8PYvKRSjwUsENQ7aOWY3mFmoSXBfAHm+WAdvwbkm+8kR3
 Qk7PuVrGPHXPlQtkYn8UzkkEZRspofugfu+ikRkxMF3OYS/VfKm1fBHPrD8CbxK7T0
 4ZEFH6+2FbfCB64ONrI3YNxtW3OgqUd7P6PsVXob6DZbbDU9p6Idj1jAaUK0NM1IbH
 LwJQCM1zZDyQS+YqPaYDkUS8qmyQsj2BBcUxuCFfFQzyJ3FfxaFefjaaFejMBslBU9
 7FRlHIfCsiBEA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A086A17E0488;
 Thu, 28 Aug 2025 16:01:55 +0200 (CEST)
Date: Thu, 28 Aug 2025 16:01:51 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com, liviu.dudau@arm.com,
 steven.price@arm.com, intel-gfx@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/4] Add initial Panthor tests
Message-ID: <20250828160151.5674fa67@fedora>
In-Reply-To: <20250828130402.2549948-1-daniel.almeida@collabora.com>
References: <20250828130402.2549948-1-daniel.almeida@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Thu, 28 Aug 2025 10:03:56 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> This series adds basic Panthor tests. In particular, these are being
> used to test both Panthor and Tyr, i.e.: the new Rust GPU driver that
> implements Panthor's uAPI. Most of the initial tests were chosen in
> order to have something to test Tyr with, but this series lays the
> groundwork so that more interesting tests can be added to test more of
> Panthor itself.
> 
> Also, please note that this is my first IGT patch, so apologies in
> advance in case I forgot to follow any IGT-specific workflow when
> submitting this. I don't see a checkpatch.pl equivalent, so there was
> nothing to check this submission with as far as I am aware.
> 
> Daniel Almeida (4):
>   lib: add support for opening Panthor devices
>   tests: panthor: add initial infrastructure
>   lib: initial panthor infrastructure
>   tests/panthor: add panthor tests

Can't really comment on the patches themselves, as I have not been
working on IGT tests myself in while, but I'm really happy to see that
happening at last, so thanks a lot for doing that, and here's my

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

if that's of any value to the IGT maintainers.

BTW, I'm hoping to extend the test coverage of panthor once this
initial bringup series is merged.

Regards,

Boris

> 
>  lib/drmtest.c                 |   1 +
>  lib/drmtest.h                 |   1 +
>  lib/igt_panthor.c             | 150 +++++++++++++++++++
>  lib/igt_panthor.h             |  28 ++++
>  lib/meson.build               |   1 +
>  meson.build                   |   8 ++
>  tests/meson.build             |   2 +
>  tests/panthor/meson.build     |  15 ++
>  tests/panthor/panthor_gem.c   |  59 ++++++++
>  tests/panthor/panthor_group.c | 264 ++++++++++++++++++++++++++++++++++
>  tests/panthor/panthor_query.c |  25 ++++
>  tests/panthor/panthor_vm.c    |  73 ++++++++++
>  12 files changed, 627 insertions(+)
>  create mode 100644 lib/igt_panthor.c
>  create mode 100644 lib/igt_panthor.h
>  create mode 100644 tests/panthor/meson.build
>  create mode 100644 tests/panthor/panthor_gem.c
>  create mode 100644 tests/panthor/panthor_group.c
>  create mode 100644 tests/panthor/panthor_query.c
>  create mode 100644 tests/panthor/panthor_vm.c
> 

