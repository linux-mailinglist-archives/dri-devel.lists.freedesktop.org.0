Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C62A56923
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 14:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C6910EB4F;
	Fri,  7 Mar 2025 13:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="JHtHq+aW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0560110EB4F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 13:42:08 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Z8SBh18gXz9sGw;
 Fri,  7 Mar 2025 14:42:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741354924; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gNFJ4WWT/HAA7YjklzhnZokC4b4A1Y9NdgueWNvZEQo=;
 b=JHtHq+aW0AB5SaDoBrobfYqWrCAlJdH4+4dLtaliWziQ9iiLT/KQNsn79p+joAKtZSFBb0
 yb3o2kPqH9AbDgxIpAo+1dCF58PcrAb/NakSkqAEkBZOKcJ5eH988OxlZ7ARUwL/xbvo4e
 V2eBtZjNr+kvzompThsLhB/0nZ3GAYQjb6DeFQnMPuhYLXg3RZ4Npukc5R2Bc1NDhO6rZt
 6crD55scBM+PR56q818fa7M8cpP8SRbCXBA3r1cP1pUECTe/kGxQTJiarA7NUsfHg6euUO
 FJsbane/Vnu6DkHHOCC5LhbrnLKzJdwhdZ3jlsY/Gsg8OK8tg7XqOoRZ3RjOzw==
Message-ID: <d355bccc3127b727c9f6fe03dfd7a43e4c5cc78e.camel@mailbox.org>
Subject: Re: [PATCH v4 1/5] drm: Move some options to separate new Kconfig
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Fri, 07 Mar 2025 14:41:58 +0100
In-Reply-To: <20250306170555.7244-2-tvrtko.ursulin@igalia.com>
References: <20250306170555.7244-1-tvrtko.ursulin@igalia.com>
 <20250306170555.7244-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: efbaf3d0b5797178186
X-MBO-RS-META: awcd4anpbh6wc5cakgs5u7g6h31fj1i3
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

You forgot to put folks in CC as recipents for the cover letter :(


On Thu, 2025-03-06 at 17:05 +0000, Tvrtko Ursulin wrote:
> Move some options out into a new debug specific kconfig file in order
> to
> make things a bit cleaner.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>

We all have our individual work flows, so don't take this as lecturing
or anything =E2=80=93 I just suspect that I was forgotten in the cover lett=
er
because you Cc people by hand in the individual patches.

What I do is that I run get_maintainer and then put the individuals
listed there into the --to=3D field. That sends the entire series to all
of them.

Only sometimes, when there's a huge list of recipents or when the
patches of a series are very independent, I deviate from that rule.

JFYI


----


Anyways, we have a bigger problem about the entire series. I now tested
again with the same setup as yesterday and the faults are indeed gone,
so that's good.

But to be sure I then did run kmemleak and got a list of leaks that is
more than 2000 lines long.

Excerpt:

unreferenced object 0xffff88810ade5600 (size 168):
  comm "kunit_try_catch", pid 300, jiffies 4294670705
  hex dump (first 32 bytes):
    98 56 de 0a 81 88 ff ff e0 f2 48 b3 ff ff ff ff  .V........H.....
    d9 de 75 22 01 00 00 00 20 7c 45 01 81 88 ff ff  ..u".... |E.....
  backtrace (crc 4f2b379c):
    kmem_cache_alloc_noprof+0x299/0x320
    drm_sched_fence_alloc+0x1d/0xa0
    drm_sched_job_init+0xbc/0x2d0
    drm_mock_sched_job_new+0x105/0x400
    drm_sched_basic_entity_cleanup+0x182/0x510
    kunit_try_run_case+0x1ae/0x490
    kunit_generic_run_threadfn_adapter+0x7b/0xe0
    kthread+0x30f/0x620
    ret_from_fork+0x2f/0x70
    ret_from_fork_asm+0x1a/0x30
unreferenced object 0xffff88810ade5700 (size 168):
  comm "kunit_try_catch", pid 300, jiffies 4294670705
  hex dump (first 32 bytes):
    98 57 de 0a 81 88 ff ff e0 f2 48 b3 ff ff ff ff  .W........H.....
    ff 2d 85 22 01 00 00 00 20 7c 45 01 81 88 ff ff  .-.".... |E.....
  backtrace (crc b5f15c1c):
    kmem_cache_alloc_noprof+0x299/0x320
    drm_sched_fence_alloc+0x1d/0xa0
    drm_sched_job_init+0xbc/0x2d0
    drm_mock_sched_job_new+0x105/0x400
    drm_sched_basic_entity_cleanup+0x182/0x510
    kunit_try_run_case+0x1ae/0x490
    kunit_generic_run_threadfn_adapter+0x7b/0xe0
    kthread+0x30f/0x620
    ret_from_fork+0x2f/0x70
    ret_from_fork_asm+0x1a/0x30
unreferenced object 0xffff88810ade5800 (size 168):
  comm "kunit_try_catch", pid 300, jiffies 4294670705
  hex dump (first 32 bytes):
    98 58 de 0a 81 88 ff ff e0 f2 48 b3 ff ff ff ff  .X........H.....
    fb a0 82 1f 01 00 00 00 20 7c 45 01 81 88 ff ff  ........ |E.....
  backtrace (crc 9fe7a1c9):
    kmem_cache_alloc_noprof+0x299/0x320
    drm_sched_fence_alloc+0x1d/0xa0
    drm_sched_job_init+0xbc/0x2d0
    drm_mock_sched_job_new+0x105/0x400
    drm_sched_basic_entity_cleanup+0x182/0x510
    kunit_try_run_case+0x1ae/0x490
    kunit_generic_run_threadfn_adapter+0x7b/0xe0
    kthread+0x30f/0x620
    ret_from_fork+0x2f/0x70
    ret_from_fork_asm+0x1a/0x30
unreferenced object 0xffff88810ade5900 (size 168):
  comm "kunit_try_catch", pid 300, jiffies 4294670705
  hex dump (first 32 bytes):
    98 59 de 0a 81 88 ff ff e0 f2 48 b3 ff ff ff ff  .Y........H.....
    03 cb 82 1f 01 00 00 00 20 7c 45 01 81 88 ff ff  ........ |E.....
  backtrace (crc 524ba9e4):
    kmem_cache_alloc_noprof+0x299/0x320
    drm_sched_fence_alloc+0x1d/0xa0
    drm_sched_job_init+0xbc/0x2d0
    drm_mock_sched_job_new+0x105/0x400
    drm_sched_basic_entity_cleanup+0x182/0x510
    kunit_try_run_case+0x1ae/0x490
    kunit_generic_run_threadfn_adapter+0x7b/0xe0
    kthread+0x30f/0x620
    ret_from_fork+0x2f/0x70
    ret_from_fork_asm+0x1a/0x30


I'm no expert with kunit tests, but I'm being told that there shouldn't
be leaks from test leftovers.


Please do a test with kmemleak, too, i.e. build and boot a kernel in
QEMU and then do some scans.


Thanks,
Philipp


> ---
> =C2=A0drivers/gpu/drm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 109 +=
+------------------------------
> --
> =C2=A0drivers/gpu/drm/Kconfig.debug | 103 +++++++++++++++++++++++++++++++=
+
> =C2=A02 files changed, 108 insertions(+), 104 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/Kconfig.debug
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index d9986fd52194..46ba24592553 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -26,6 +26,11 @@ menuconfig DRM
> =C2=A0	=C2=A0 details.=C2=A0 You should also select and configure AGP
> =C2=A0	=C2=A0 (/dev/agpgart) support if it is available for your
> platform.
> =C2=A0
> +menu "DRM debugging options"
> +depends on DRM
> +source "drivers/gpu/drm/Kconfig.debug"
> +endmenu
> +
> =C2=A0if DRM
> =C2=A0
> =C2=A0config DRM_MIPI_DBI
> @@ -37,65 +42,6 @@ config DRM_MIPI_DSI
> =C2=A0	bool
> =C2=A0	depends on DRM
> =C2=A0
> -config DRM_DEBUG_MM
> -	bool "Insert extra checks and debug info into the DRM range
> managers"
> -	default n
> -	depends on DRM
> -	depends on STACKTRACE_SUPPORT
> -	select STACKDEPOT
> -	help
> -	=C2=A0 Enable allocation tracking of memory manager and leak
> detection on
> -	=C2=A0 shutdown.
> -
> -	=C2=A0 Recommended for driver developers only.
> -
> -	=C2=A0 If in doubt, say "N".
> -
> -config DRM_USE_DYNAMIC_DEBUG
> -	bool "use dynamic debug to implement drm.debug"
> -	default n
> -	depends on BROKEN
> -	depends on DRM
> -	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
> -	depends on JUMP_LABEL
> -	help
> -	=C2=A0 Use dynamic-debug to avoid drm_debug_enabled() runtime
> overheads.
> -	=C2=A0 Due to callsite counts in DRM drivers (~4k in amdgpu) and
> 56
> -	=C2=A0 bytes per callsite, the .data costs can be substantial,
> and
> -	=C2=A0 are therefore configurable.
> -
> -config DRM_KUNIT_TEST_HELPERS
> -	tristate
> -	depends on DRM && KUNIT
> -	select DRM_KMS_HELPER
> -	help
> -	=C2=A0 KUnit Helpers for KMS drivers.
> -
> -config DRM_KUNIT_TEST
> -	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
> -	depends on DRM && KUNIT && MMU
> -	select DRM_BUDDY
> -	select DRM_DISPLAY_DP_HELPER
> -	select DRM_DISPLAY_HDMI_STATE_HELPER
> -	select DRM_DISPLAY_HELPER
> -	select DRM_EXEC
> -	select DRM_EXPORT_FOR_TESTS if m
> -	select DRM_GEM_SHMEM_HELPER
> -	select DRM_KUNIT_TEST_HELPERS
> -	select DRM_LIB_RANDOM
> -	select PRIME_NUMBERS
> -	default KUNIT_ALL_TESTS
> -	help
> -	=C2=A0 This builds unit tests for DRM. This option is not useful
> for
> -	=C2=A0 distributions or general kernels, but only for kernel
> -	=C2=A0 developers working on DRM and associated drivers.
> -
> -	=C2=A0 For more information on KUnit and unit tests in general,
> -	=C2=A0 please refer to the KUnit documentation in
> -	=C2=A0 Documentation/dev-tools/kunit/.
> -
> -	=C2=A0 If in doubt, say "N".
> -
> =C2=A0config DRM_KMS_HELPER
> =C2=A0	tristate
> =C2=A0	depends on DRM
> @@ -247,23 +193,6 @@ config DRM_TTM
> =C2=A0	=C2=A0 GPU memory types. Will be enabled automatically if a
> device driver
> =C2=A0	=C2=A0 uses it.
> =C2=A0
> -config DRM_TTM_KUNIT_TEST
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "KUnit tests for TTM=
" if !KUNIT_ALL_TESTS
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default n
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on DRM && KUNIT && MM=
U && (UML || COMPILE_TEST)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select DRM_TTM
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select DRM_BUDDY
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select DRM_EXPORT_FOR_TESTS i=
f m
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select DRM_KUNIT_TEST_HELPERS
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default KUNIT_ALL_TESTS
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Enables unit test=
s for TTM, a GPU memory manager subsystem
> used
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to manage memory =
buffers. This option is mostly useful for
> kernel
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 developers. It de=
pends on (UML || COMPILE_TEST) since no
> other driver
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 which uses TTM ca=
n be loaded while running the tests.
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If in doubt, say =
"N".
> -
> =C2=A0config DRM_EXEC
> =C2=A0	tristate
> =C2=A0	depends on DRM
> @@ -463,9 +392,6 @@ config DRM_HYPERV
> =C2=A0
> =C2=A0	 If M is selected the module will be called hyperv_drm.
> =C2=A0
> -config DRM_EXPORT_FOR_TESTS
> -	bool
> -
> =C2=A0# Separate option as not all DRM drivers use it
> =C2=A0config DRM_PANEL_BACKLIGHT_QUIRKS
> =C2=A0	tristate
> @@ -478,31 +404,6 @@ config DRM_PRIVACY_SCREEN
> =C2=A0	bool
> =C2=A0	default n
> =C2=A0
> -config DRM_WERROR
> -	bool "Compile the drm subsystem with warnings as errors"
> -	depends on DRM && EXPERT
> -	depends on !WERROR
> -	default n
> -	help
> -	=C2=A0 A kernel build should not cause any compiler warnings, and
> this
> -	=C2=A0 enables the '-Werror' flag to enforce that rule in the drm
> subsystem.
> -
> -	=C2=A0 The drm subsystem enables more warnings than the kernel
> default, so
> -	=C2=A0 this config option is disabled by default.
> -
> -	=C2=A0 If in doubt, say N.
> -
> -config DRM_HEADER_TEST
> -	bool "Ensure DRM headers are self-contained and pass kernel-
> doc"
> -	depends on DRM && EXPERT
> -	default n
> -	help
> -	=C2=A0 Ensure the DRM subsystem headers both under
> drivers/gpu/drm and
> -	=C2=A0 include/drm compile, are self-contained, have header
> guards, and have
> -	=C2=A0 no kernel-doc warnings.
> -
> -	=C2=A0 If in doubt, say N.
> -
> =C2=A0endif
> =C2=A0
> =C2=A0# Separate option because drm_panel_orientation_quirks.c is shared
> with fbdev
> diff --git a/drivers/gpu/drm/Kconfig.debug
> b/drivers/gpu/drm/Kconfig.debug
> new file mode 100644
> index 000000000000..601d7e07d421
> --- /dev/null
> +++ b/drivers/gpu/drm/Kconfig.debug
> @@ -0,0 +1,103 @@
> +config DRM_USE_DYNAMIC_DEBUG
> +	bool "use dynamic debug to implement drm.debug"
> +	default n
> +	depends on BROKEN
> +	depends on DRM
> +	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
> +	depends on JUMP_LABEL
> +	help
> +	 Use dynamic-debug to avoid drm_debug_enabled() runtime
> overheads.
> +	 Due to callsite counts in DRM drivers (~4k in amdgpu) and
> 56
> +	 bytes per callsite, the .data costs can be substantial, and
> +	 are therefore configurable.
> +
> +config DRM_WERROR
> +	bool "Compile the drm subsystem with warnings as errors"
> +	depends on DRM && EXPERT
> +	depends on !WERROR
> +	default n
> +	help
> +	=C2=A0 A kernel build should not cause any compiler warnings, and
> this
> +	=C2=A0 enables the '-Werror' flag to enforce that rule in the drm
> subsystem.
> +
> +	=C2=A0 The drm subsystem enables more warnings than the kernel
> default, so
> +	=C2=A0 this config option is disabled by default.
> +
> +	=C2=A0 If in doubt, say N.
> +
> +config DRM_HEADER_TEST
> +	bool "Ensure DRM headers are self-contained and pass kernel-
> doc"
> +	depends on DRM && EXPERT
> +	default n
> +	help
> +	=C2=A0 Ensure the DRM subsystem headers both under
> drivers/gpu/drm and
> +	=C2=A0 include/drm compile, are self-contained, have header
> guards, and have
> +	=C2=A0 no kernel-doc warnings.
> +
> +	=C2=A0 If in doubt, say N.
> +
> +config DRM_DEBUG_MM
> +	bool "Insert extra checks and debug info into the DRM range
> managers"
> +	default n
> +	depends on DRM
> +	depends on STACKTRACE_SUPPORT
> +	select STACKDEPOT
> +	help
> +	=C2=A0 Enable allocation tracking of memory manager and leak
> detection on
> +	=C2=A0 shutdown.
> +
> +	=C2=A0 Recommended for driver developers only.
> +
> +	=C2=A0 If in doubt, say "N".
> +
> +config DRM_KUNIT_TEST_HELPERS
> +	tristate
> +	depends on DRM && KUNIT
> +	select DRM_KMS_HELPER
> +	help
> +	=C2=A0 KUnit Helpers for KMS drivers.
> +
> +config DRM_KUNIT_TEST
> +	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
> +	depends on DRM && KUNIT && MMU
> +	select DRM_BUDDY
> +	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_HDMI_STATE_HELPER
> +	select DRM_DISPLAY_HELPER
> +	select DRM_EXEC
> +	select DRM_EXPORT_FOR_TESTS if m
> +	select DRM_GEM_SHMEM_HELPER
> +	select DRM_KUNIT_TEST_HELPERS
> +	select DRM_LIB_RANDOM
> +	select PRIME_NUMBERS
> +	default KUNIT_ALL_TESTS
> +	help
> +	=C2=A0 This builds unit tests for DRM. This option is not useful
> for
> +	=C2=A0 distributions or general kernels, but only for kernel
> +	=C2=A0 developers working on DRM and associated drivers.
> +
> +	=C2=A0 For more information on KUnit and unit tests in general,
> +	=C2=A0 please refer to the KUnit documentation in
> +	=C2=A0 Documentation/dev-tools/kunit/.
> +
> +	=C2=A0 If in doubt, say "N".
> +
> +config DRM_TTM_KUNIT_TEST
> +	tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
> +	default n
> +	depends on DRM && KUNIT && MMU && (UML || COMPILE_TEST)
> +	select DRM_TTM
> +	select DRM_BUDDY
> +	select DRM_EXPORT_FOR_TESTS if m
> +	select DRM_KUNIT_TEST_HELPERS
> +	default KUNIT_ALL_TESTS
> +	help
> +	=C2=A0 Enables unit tests for TTM, a GPU memory manager subsystem
> used
> +	=C2=A0 to manage memory buffers. This option is mostly useful for
> kernel
> +	=C2=A0 developers. It depends on (UML || COMPILE_TEST) since no
> other driver
> +	=C2=A0 which uses TTM can be loaded while running the tests.
> +
> +	=C2=A0 If in doubt, say "N".
> +
> +config DRM_EXPORT_FOR_TESTS
> +	bool

