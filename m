Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3842A4BB99
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 11:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED9F10E3B5;
	Mon,  3 Mar 2025 10:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKNJPHn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2782910E3B5;
 Mon,  3 Mar 2025 10:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740996157; x=1772532157;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=sgSh47dVp2GlyukS6Y9orr+PkBLpVJIzgHQtBC1zWXY=;
 b=UKNJPHn2jgVxBV4EmaXkTCICQAkbFe3NwpOrSnL/57BIkEqocVWCNn9o
 ADd1T8iz9vq7XUaXprtqY9cl7eERLwMKyE3MTAKUadaf50VG76Vu9lZDp
 mMUhs5FVf9TFVGYgXOWuBjk6Qem/XVHni7UetW9r7aGMKEJ6OmWGhVd7x
 saIt7x4stq0+342JObFMwtICqtuxCaN5y7jlS9N1CMfZ689bzAXI6QMC+
 f3bcdwVb5PbIMDDWZtqf/vqDjJZLJoJEG3O4EvIawKOBjAbxJqzIOHf+w
 sJfOzG/V5BEosBENbu9zfhcP6Po65sO+PGvtJk08YUQN7GYOJ3YQ2jlqS w==;
X-CSE-ConnectionGUID: ixs5DjNqQKOtHgYAhDa7Fg==
X-CSE-MsgGUID: Aju2ZRZXSEOVgmvbQgRv7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="52501881"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="52501881"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 02:02:37 -0800
X-CSE-ConnectionGUID: Gz0/4ADeS3aScWBalrhr1A==
X-CSE-MsgGUID: 5qxRtmPVQEuT4fVgtKAl3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="123111745"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.122])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 02:02:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, simona.vetter@ffwll.ch, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH 2/2] drm: ensure drm headers are self-contained and pass
 kernel-doc
In-Reply-To: <CAK7LNATHXwEkjJHP7b-ZmhzLfyyuOdsyimna-=r-sJk+DxigrA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1737556766.git.jani.nikula@intel.com>
 <d8ad1c6d707f38a55987f616cb9650aef30b84e1.1737556766.git.jani.nikula@intel.com>
 <CAK7LNATHXwEkjJHP7b-ZmhzLfyyuOdsyimna-=r-sJk+DxigrA@mail.gmail.com>
Date: Mon, 03 Mar 2025 12:02:30 +0200
Message-ID: <87r03e1lft.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Mon, 03 Mar 2025, Masahiro Yamada <masahiroy@kernel.org> wrote:
> +CC: Linus
>
> On Wed, Jan 22, 2025 at 11:41=E2=80=AFPM Jani Nikula <jani.nikula@intel.c=
om> wrote:
>>
>> Ensure drm headers build, are self-contained, have header guards, and
>> have no kernel-doc warnings, when CONFIG_DRM_HEADER_TEST=3Dy.
>>
>> The mechanism follows similar patters used in i915, xe, and usr/include.
>>
>> To cover include/drm, we need to recurse there using the top level
>> Kbuild and the new include/Kbuild files.
>
> NACK.
>
> I replied here:
> https://lore.kernel.org/all/CAK7LNARJgqADxnOXAX49XzDFD4zT=3D7i8yTB0o=3DEm=
NtxmScq8jA@mail.gmail.com/T/#u

I really don't find it fair to completely ignore several pings over an
extended period of time, and then show up to NAK after the patches have
been merged.

> I CCed Linus to avoid him accidentally pulling this.
> He disliked this misfeature.

I believe being able to statically check the headers at build time, both
by the developers and CI, depending on a config option, makes for a more
pleasant development experience.

We've had this in i915 and xe for a long time, and we avoid a lot of
build breakage due to missing includes e.g. while refactoring, and we
don't get reports about kernel-doc issues either. Because they all fail
at build, and we catch the issues pre-merge. We skip a whole class of
merge->dammit->fix cycles with this.

All of the drm headers are clean and pass. We don't add any exception
lists. It's not enabled by default.

I can appreciate this might not be the best approach for all of
include/linux, but for include/drm, I think it's definitely a win.

And one of the underlying goals is to make for minimal headers with
minimal includes and minimal dependencies, preferring forward
declarations over includes, splitting functionality by header, etc. It's
just that doing that often leads to broken headers, unless you actually
build test them... and here we are.


BR,
Jani.


>
>
>
>
>>
>> v4: check for CONFIG_WERROR in addition to CONFIG_DRM_WERROR
>>
>> v3: adapt to upstream build changes
>>
>> v2: make DRM_HEADER_TEST depend on DRM
>>
>> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  Kbuild                   |  1 +
>>  drivers/gpu/drm/Kconfig  | 11 +++++++++++
>>  drivers/gpu/drm/Makefile | 18 ++++++++++++++++++
>>  include/Kbuild           |  1 +
>>  include/drm/Makefile     | 18 ++++++++++++++++++
>>  5 files changed, 49 insertions(+)
>>  create mode 100644 include/Kbuild
>>  create mode 100644 include/drm/Makefile
>>
>> diff --git a/Kbuild b/Kbuild
>> index 464b34a08f51..f327ca86990c 100644
>> --- a/Kbuild
>> +++ b/Kbuild
>> @@ -97,3 +97,4 @@ obj-$(CONFIG_SAMPLES) +=3D samples/
>>  obj-$(CONFIG_NET)      +=3D net/
>>  obj-y                  +=3D virt/
>>  obj-y                  +=3D $(ARCH_DRIVERS)
>> +obj-$(CONFIG_DRM_HEADER_TEST)  +=3D include/
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index fbef3f471bd0..f9b3ebf63fa9 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -494,6 +494,17 @@ config DRM_WERROR
>>
>>           If in doubt, say N.
>>
>> +config DRM_HEADER_TEST
>> +       bool "Ensure DRM headers are self-contained and pass kernel-doc"
>> +       depends on DRM && EXPERT
>> +       default n
>> +       help
>> +         Ensure the DRM subsystem headers both under drivers/gpu/drm and
>> +         include/drm compile, are self-contained, have header guards, a=
nd have
>> +         no kernel-doc warnings.
>> +
>> +         If in doubt, say N.
>> +
>>  endif
>>
>>  # Separate option because drm_panel_orientation_quirks.c is shared with=
 fbdev
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 85af94bb907d..42901f877bf2 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -222,3 +222,21 @@ obj-y                      +=3D solomon/
>>  obj-$(CONFIG_DRM_SPRD) +=3D sprd/
>>  obj-$(CONFIG_DRM_LOONGSON) +=3D loongson/
>>  obj-$(CONFIG_DRM_POWERVR) +=3D imagination/
>> +
>> +# Ensure drm headers are self-contained and pass kernel-doc
>> +hdrtest-files :=3D \
>> +       $(shell cd $(src) && find . -maxdepth 1 -name 'drm_*.h') \
>> +       $(shell cd $(src) && find display lib -name '*.h')
>> +
>> +always-$(CONFIG_DRM_HEADER_TEST) +=3D \
>> +       $(patsubst %.h,%.hdrtest, $(hdrtest-files))
>> +
>> +# Include the header twice to detect missing include guard.
>> +quiet_cmd_hdrtest =3D HDRTEST $(patsubst %.hdrtest,%.h,$@)
>> +      cmd_hdrtest =3D \
>> +               $(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $=
< -include $<; \
>> +               $(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR=
)$(CONFIG_DRM_WERROR),-Werror) $<; \
>> +               touch $@
>> +
>> +$(obj)/%.hdrtest: $(src)/%.h FORCE
>> +       $(call if_changed_dep,hdrtest)
>> diff --git a/include/Kbuild b/include/Kbuild
>> new file mode 100644
>> index 000000000000..5e76a599e2dd
>> --- /dev/null
>> +++ b/include/Kbuild
>> @@ -0,0 +1 @@
>> +obj-$(CONFIG_DRM_HEADER_TEST)  +=3D drm/
>> diff --git a/include/drm/Makefile b/include/drm/Makefile
>> new file mode 100644
>> index 000000000000..a7bd15d2803e
>> --- /dev/null
>> +++ b/include/drm/Makefile
>> @@ -0,0 +1,18 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +# Ensure drm headers are self-contained and pass kernel-doc
>> +hdrtest-files :=3D \
>> +       $(shell cd $(src) && find * -name '*.h' 2>/dev/null)
>> +
>> +always-$(CONFIG_DRM_HEADER_TEST) +=3D \
>> +       $(patsubst %.h,%.hdrtest, $(hdrtest-files))
>> +
>> +# Include the header twice to detect missing include guard.
>> +quiet_cmd_hdrtest =3D HDRTEST $(patsubst %.hdrtest,%.h,$@)
>> +      cmd_hdrtest =3D \
>> +               $(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $=
< -include $<; \
>> +               $(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR=
)$(CONFIG_DRM_WERROR),-Werror) $<; \
>> +               touch $@
>> +
>> +$(obj)/%.hdrtest: $(src)/%.h FORCE
>> +       $(call if_changed_dep,hdrtest)
>> --
>> 2.39.5
>>

--=20
Jani Nikula, Intel
