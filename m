Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794A4A5D856
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 09:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E365B10E0CD;
	Wed, 12 Mar 2025 08:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="CtltPnm5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209BC10E0CD
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 08:38:19 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZCPCp2RWnz9sSs;
 Wed, 12 Mar 2025 09:38:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741768694; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2o584eTSVgc+3XFuJusPvAYRUTlCkr2W8oJFUAS4+I=;
 b=CtltPnm58BkvC2wwBhXVGMxPgGTp4e7iSaySlTLpw0HzSGENuTsCMF3JqD31DZvpXBQUtn
 TWF818ynwi7W1bpClWwmE5nwuFlG4nBSAZ9r2wUnbS2gAnmakC4AoUGt29G0IxBf7ytpiV
 SIsFFQ3QlcRFYG6brdOjLz36ovPuREzwqPw+sRCz7dkJyzVF9UiVMhkuKd+8svxIKIShip
 R35yU96YDiAmYIGT6PJpbGWXD63E494s/0By4Z76nhYlvgjgwoY4WiYlav4lwfFrwb2ehV
 YzaslRcr8WWU3/U86jI/IforNo1CRt1z41Kvdl1cibnmoV52BMWTGPtktKoz8A==
Message-ID: <c7f342a5b1fa4c98c2ed0220b4bc5f719a56c1cc.camel@mailbox.org>
Subject: Re: [PATCH v7 1/7] drm: Move some options to separate new Kconfig
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Date: Wed, 12 Mar 2025 09:38:10 +0100
In-Reply-To: <20250311092339.52199-2-tvrtko.ursulin@igalia.com>
References: <20250311092339.52199-1-tvrtko.ursulin@igalia.com>
 <20250311092339.52199-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 65dqe8bdkzha19x7mk5jp3qisfbki3k4
X-MBO-RS-ID: 9d4b70ff244b34e2965
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

+Cc Dave, Sima (get_maintainer?)

On Tue, 2025-03-11 at 09:23 +0000, Tvrtko Ursulin wrote:
> Move some options out into a new debug specific kconfig file in order
> to
> make things a bit cleaner.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Would be nice to get an ACK / RB from the DRM maintainers since this
touches the overall config


P.

> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
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

