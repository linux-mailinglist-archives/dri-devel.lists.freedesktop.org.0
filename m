Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7EAC39D0F
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 10:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E831F10E862;
	Thu,  6 Nov 2025 09:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bayPNFQc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850B510E85E;
 Thu,  6 Nov 2025 09:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762421374;
 bh=sL0UGN7g+jcZ/fVlwbxKGx1qLRqU9rFzdDzMXJRLTLQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bayPNFQc2esyx9EhtkpuNyQnI0emAHkspyofeSRwvGc/R7x88RBAHV7yGs/nXtolS
 tpA90bNq4YJDokxf8rU/lOHOhwZlWwUbKSD/tqowUA3yHtr0MaR1x7g4y2HwLdC911
 +4I4eiQyXcUfxJUF2TJj9njjtouk2uUALhiiESUTitG4c5qmujzc8UovKPZ3J2meGE
 VmoZeU2CSGGNpnGgJaR82tYWvjiCAYZG24yar+gLcyB0NF+3kHRuWxjzZ5MNqQr781
 7ZlanuqHHkRIh3KPGTDvZpzsUeh8CsPrBP7adKodA7mGl7EEiBW5qxz1qEn9euDx/b
 s9CUiu6LNseXA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F7E117E0CA1;
 Thu,  6 Nov 2025 10:29:33 +0100 (CET)
Date: Thu, 6 Nov 2025 10:29:29 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com, liviu.dudau@arm.com,
 steven.price@arm.com, aliceryhl@google.com, jeffv@google.com,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 0/3] Add initial Panthor tests
Message-ID: <20251106102929.097b030d@fedora>
In-Reply-To: <20251104202845.2879460-1-daniel.almeida@collabora.com>
References: <20251104202845.2879460-1-daniel.almeida@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Tue,  4 Nov 2025 17:28:40 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> This series adds basic Panthor tests. In particular, these are being
> used to test both Panthor[0] and Tyr[1], i.e.: the new Rust GPU driver
> that implements Panthor's uAPI (i.e.: panthor_drm.h). Most of the
> initial tests were chosen in order to have something to test Tyr with,
> but this series lays the groundwork so that more interesting tests can
> be added to test more of Panthor itself.
> 
> This work is being tested on a RockPi 5, featuring an rk3588 SoC and
> Mali-G610 Valhall.
> 
> Note that there's a few (less than five?) remaining checkpatch.pl
> comments about long lines. IMHO there's no way to format them better so
> I hope we can live with this.
> 
> [0]: https://patchwork.freedesktop.org/patch/msgid/20240229162230.2634044-12-boris.brezillon@collabora.com
> [1]: https://lore.kernel.org/dri-devel/aMLB0Vs0dJ_AkU4z@google.com/

Any chance we can get this initial panthor support merged soon? I know
others (including me :-)) have been writing more panthor tests on top of
Daniel's branch, and it'd be great if we could submit those changes too.

> 
> Changes from v2:
> 
> Thanks, Boris {
>   - New helpers for command stream manipulation (see "struct cs_instr")
>   - Reworked bad indentation and formatting
>   - Removed BE support (UMD doesn't care about this either)
> }
> 
> Thanks, Daniel Stone {
>   - Introduced igt_panthor_get_first_core(), which correctly computes
>     the first available core using ffs()
>   - Stopped hardcoding the page size and switched to getpagesize()
>     instead,
>   - Switched to more specific versions of igt_assert as appropriate (like
>     igt_assert_neq(), etc)
>   - Simplified panthor_group.c considerably by relying on the helpers in
>     igt_panthor.[ch]
>   - Switched to the syncobj_create() and syncobj_destroy() helpers.
> }
> 
> - Added group creation helpers with sensible defaults (see
>   igt_panthor_group_create_simple(), for example)
> - Picked up tags
> 
> - Link to v2: https://lore.kernel.org/dri-devel/20250912181931.3738444-1-daniel.almeida@collabora.com/
> 
> Changes from v1:
> - Rebased on top of the latest master
> - Squashed patch 3 from v1 into patch 2.
> - Switched to /* */ comments in headers
> - Initialized padding fields to 0 as applicable in group_destroy and
>   vm_destroy
> - Removed wrong assert(gpu_rev != 0)
> - Changed indentation to use tabs
> - Rework igt_panthor_mmap_bo to take an offset (so we don't call the
>   mmap_offset ioctl twice)
> - Added igt_describe and docs to the functions igt_panthor.c
> - Linked to the driver in the cover letter and patch 1.
> - Improved the commit message for patch 1.
> Link to v1: https://lore.kernel.org/dri-devel/20250828130402.2549948-1-daniel.almeida@collabora.com/
> 
> 
> 
> Daniel Almeida (3):
>   lib: add support for opening Panthor devices
>   panthor: add initial infrastructure
>   tests/panthor: add panthor tests
> 
>  lib/drmtest.c                 |   1 +
>  lib/drmtest.h                 |   1 +
>  lib/igt_panthor.c             | 372 ++++++++++++++++++++++++++++++++++
>  lib/igt_panthor.h             | 221 ++++++++++++++++++++
>  lib/meson.build               |   1 +
>  meson.build                   |   8 +
>  tests/meson.build             |   2 +
>  tests/panthor/meson.build     |  15 ++
>  tests/panthor/panthor_gem.c   |  72 +++++++
>  tests/panthor/panthor_group.c | 123 +++++++++++
>  tests/panthor/panthor_query.c |  29 +++
>  tests/panthor/panthor_vm.c    |  84 ++++++++
>  12 files changed, 929 insertions(+)
>  create mode 100644 lib/igt_panthor.c
>  create mode 100644 lib/igt_panthor.h
>  create mode 100644 tests/panthor/meson.build
>  create mode 100644 tests/panthor/panthor_gem.c
>  create mode 100644 tests/panthor/panthor_group.c
>  create mode 100644 tests/panthor/panthor_query.c
>  create mode 100644 tests/panthor/panthor_vm.c
> 

