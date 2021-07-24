Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C30B3D4835
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 16:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12D86E15C;
	Sat, 24 Jul 2021 14:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E363B6E15C;
 Sat, 24 Jul 2021 14:58:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D13C60EB0;
 Sat, 24 Jul 2021 14:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627138704;
 bh=NbqjL70DokqVvV19hzj4hiRcYchamdVrDx6kJEYgsgM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IqSXjpLTIn6PxzBXLoGz2wvI8STZMkUsHdjULHm/QAiDJCK+FFPSya+ZsEpV67SUs
 kgR1JNugBg+D2Qks7kJFatUrRasJVjUvGcik3Ul3RShflNDK0dr7wg8/jEltdYTZ9R
 ha3JphNjP26TV/QlbYJu9yCxHPcg6mrWnQlVQeJfq5rvpDave68y1YC8Z/nZbOBwe2
 sGCkJxS/4ayx4GTKbEXZIqu5+6/IFD6WYPTW0gPzq/++Gp73sGAXgc2HFa2MWc10rR
 O1BcDMmAHJQxOAhIKWEFDFMV27tSa/mrPNvB8yJbIvHNelvgaNBeFr3BVXMZnIaKUx
 /GqLkL2h2B3sA==
Received: by mail-wm1-f52.google.com with SMTP id
 j34-20020a05600c1c22b029024e75084404so2419267wms.1; 
 Sat, 24 Jul 2021 07:58:24 -0700 (PDT)
X-Gm-Message-State: AOAM530caWDz+p9EhoQPx+C5sETviO8TtC7q+2ol1VXLR4Altw2zgAlq
 8QMjKRDpb8MA89VvNlcYfljr9MptXEHdU91zLfE=
X-Google-Smtp-Source: ABdhPJwltPl/wWX13/CxEFCAvNsrOMzwCqFUDp745ygruk3669M6BQP+fmfDf7Z3x+vjqYFjPYCieuVIF4EIc3uZU8w=
X-Received: by 2002:a1c:4e0c:: with SMTP id g12mr18758940wmh.120.1627138703148; 
 Sat, 24 Jul 2021 07:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210723224617.3088886-1-kherbst@redhat.com>
 <CAK8P3a3u_jsxQW4dPXtsdKkw1mjKXL-h=qN1SGHytvUMPf3fPw@mail.gmail.com>
 <CACO55tuNWk6emjnnukgv9h-9jbpVP564Ogmi7TGbybc9n5v+ZQ@mail.gmail.com>
 <CAK8P3a1BceSaiqkTf+9Pr4Br-G3kgqD4ztwiaS7fxNiUg9t7Dg@mail.gmail.com>
 <CACO55tsoi2akTKvFdz3p48UHRjFXDW7dUnOM8qVePBFWet-3UQ@mail.gmail.com>
 <CACO55tuceMUz2pgOM23wvcmtaTqbo6S6rCB+mfLptqJRt=fMWA@mail.gmail.com>
 <CAK8P3a3+AD02-8nbULMdae2Hc=hJ+-Zb_CL+bHF-9oGieYiZWQ@mail.gmail.com>
 <CACO55tswMuDE9u3asU2Ls7BhA0uKGGarLk+E-WTD6MVnLwc3tw@mail.gmail.com>
In-Reply-To: <CACO55tswMuDE9u3asU2Ls7BhA0uKGGarLk+E-WTD6MVnLwc3tw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 24 Jul 2021 16:58:06 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0i0WP24Z0TScmPqKxmM2ovtKnmm+qZq6+Tc1ju+hma0w@mail.gmail.com>
Message-ID: <CAK8P3a0i0WP24Z0TScmPqKxmM2ovtKnmm+qZq6+Tc1ju+hma0w@mail.gmail.com>
Subject: Re: [PATCH] nouveau: make backlight support non optional
To: Karol Herbst <kherbst@redhat.com>
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 24, 2021 at 4:14 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> we use the MXM_WMI in code. We also have to keep arm in mind and not
> break stuff there. So I will try to play around with your changes and
> see how that goes.

Ok, should find any randconfig build failures for arm, arm64 or x86 over the
weekend. I also this on linux-next today

ld: drivers/gpu/drm/i915/display/intel_panel.o: in function
`intel_backlight_device_register':
intel_panel.c:(.text+0x2804): undefined reference to `backlight_device_register'
ld: intel_panel.c:(.text+0x284e): undefined reference to
`backlight_device_register'
ld: drivers/gpu/drm/i915/display/intel_panel.o: in function
`intel_backlight_device_unregister':
intel_panel.c:(.text+0x28b1): undefined reference to
`backlight_device_unregister'

and I added this same thing there to see how it goes:

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 87825d36335b..69c6b7aec49e 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -3,6 +3,8 @@ config DRM_I915
        tristate "Intel 8xx/9xx/G3x/G4x/HD Graphics"
        depends on DRM
        depends on X86 && PCI
+       depends on ACPI_VIDEO || !ACPI
+       depends on BACKLIGHT_CLASS_DEVICE
        select INTEL_GTT
        select INTERVAL_TREE
        # we need shmfs for the swappable backing store, and in particular
@@ -16,10 +18,6 @@ config DRM_I915
        select IRQ_WORK
        # i915 depends on ACPI_VIDEO when ACPI is enabled
        # but for select to work, need to select ACPI_VIDEO's dependencies, ick
-       select DRM_I915_BACKLIGHT if ACPI
-       select INPUT if ACPI
-       select ACPI_VIDEO if ACPI
-       select ACPI_BUTTON if ACPI
        select SYNC_FILE
        select IOSF_MBI
        select CRC32
@@ -64,13 +62,7 @@ config DRM_I915_FORCE_PROBE
          Use "*" to force probe the driver for all known devices.

 config DRM_I915_BACKLIGHT
-       tristate "Control backlight support"
-       depends on DRM_I915
-       default DRM_I915
-       select BACKLIGHT_CLASS_DEVICE
-       help
-          Say Y here if you want to control the backlight of your display
-          (e.g. a laptop panel).
+       def_tristate DRM_I915

 config DRM_I915_CAPTURE_ERROR
        bool "Enable capturing GPU state following a hang"
