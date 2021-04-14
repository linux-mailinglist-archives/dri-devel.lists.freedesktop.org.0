Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FAA35FD14
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 23:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242516E976;
	Wed, 14 Apr 2021 21:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CF86E974
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 21:18:58 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j18so35625024lfg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 14:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LzhLPqNSk6yRIelwOKhkuSwSmAn9K1EbK4SP8DIv2YM=;
 b=IJKN8vuLvU/dUcz1LUaaiRD0ClnnnMl8w9F7IlNc3eCF88nWbhrdPK2MYu2XTbgwma
 C/f5KSGDca0Bq7rgNXu69SGDYzeJcMc+wLo33DALJaA5oG23OES7+zUPwIrV9S8mKp/S
 cJT4EWInG1nOpNedrGGVewV1j0TSJtC396kRb9vb0GKHWdUO4kpypls0aI+dXL7ebKNL
 cwoJyby3oIhYvtLnVQow6EinliP+nwiwQosoQGzcJhnAcwpXxHcxIB93duIui7Lh2OhE
 QSRDNdEt2EMge60JE7IWYm1onCcVrq8owOeOUjM+FpRqfyruDcpeq8cov4Quy/fjrOPM
 0Fsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LzhLPqNSk6yRIelwOKhkuSwSmAn9K1EbK4SP8DIv2YM=;
 b=m39ZP4+Lht//mXRaUth5Wb+LrXFOgdXWs7MMbDa8GNbUZnmiGw8/7dif2rlUByf5/i
 CCBzRfEw6/iGllJFKemqYn4aJVnC56r5hIjHl4XeTBi97Oxu7OOhJWzNuRXcf37UUsKm
 E1mkjKsiZn9G0LrxSxIhgUoOtUNZhYyl/u2RgmRp9d2dcYlLowQX84a5fZBfFCc08q4X
 CfpcsjnPaMMIapV944qgos62KzrKv8VTHMgTnZmBRcdWntXUElWimZ9wnUqW4OH6Diq+
 paPv6JreDFPCGyW5dtndSVHcJ7t/F2fgXAV7sU1Uwp3GO/Dj5ogMbRQrs8nEO/Pb2fCJ
 6gIQ==
X-Gm-Message-State: AOAM530sslqX5/f8mwexgtf4MEeEWATuhNTnpgbilh+/9kpohdWqXZNO
 q5l9IN2SV/NufMNNWTE8C1s6qsvX33kcn7a9wblbSg==
X-Google-Smtp-Source: ABdhPJwN1ImHU/060unJDkarn+Uz7YaUj/bX5poTfP+peWMVri3eTcYjaW/+9nFBNZOuerIQ6NpPk4hCiNGBQ83jVHA=
X-Received: by 2002:a19:c43:: with SMTP id 64mr109924lfm.140.1618435136331;
 Wed, 14 Apr 2021 14:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210414151049.95828-1-hdegoede@redhat.com>
In-Reply-To: <20210414151049.95828-1-hdegoede@redhat.com>
From: Rajat Jain <rajatja@google.com>
Date: Wed, 14 Apr 2021 14:18:20 -0700
Message-ID: <CACK8Z6GoiTJskLkX0rMmrn3edG=ZMy=LqTb2an79oH4S7NfGbw@mail.gmail.com>
Subject: Re: [PATCH resend 0/9] drm: Add privacy-screen class and connector
 properties
To: Hans de Goede <hdegoede@redhat.com>, Jesse Barnes <jsbarnes@google.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Mark Gross <mgross@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sebastien Bacher <seb128@ubuntu.com>, David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Mark Pearson <markpearson@lenovo.com>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Jesse Barnes

Hello,

On Wed, Apr 14, 2021 at 8:11 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> Here is the privacy-screen related code which I last posted in August
> of last year. To the best of my knowledge there is consensus about /
> everyone is in agreement with the new userspace API (2 connector properties)
> this patch-set add (patch 1 of the series).
>
> The blocker the last time was that there were no userspace users of
> the new properties and as a rule we don't add new drm userspace API
> without users.
>
> There now is GNOME userspace code using the new properties:
> https://hackmd.io/@3v1n0/rkyIy3BOw
>
> The new API works as designed for this userspace user and the branches
> mentioned at the above link add the following features to GNOME:
>
> 1. Showing an OSD notification when the privacy-screen is toggled on/off
>    through hotkeys handled by the embedded-controller
> 2. Allowing control of the privacy-screen from the GNOME control-panel,
>    including the on/off slider shown there updating to match the hw-setting
>    when the setting is changed with the control-panel open.
> 3. Restoring the last user-setting at login
>
> This series consists of a number of different parts:
>
> 1. A new version of Rajat's privacy-screen connector properties patch,
> this adds new userspace API in the form of new properties

Thanks a lot Hans!

>
> 2. Since on most devices the privacy screen is actually controlled by
> some vendor specific ACPI/WMI interface which has a driver under
> drivers/platform/x86, we need some "glue" code to make this functionality
> available to KMS drivers. Patches 2-4 add a new privacy-screen class for
> this, which allows non KMS drivers (and possibly KMS drivers too) to
> register a privacy-screen device and also adds an interface for KMS drivers
> to get access to the privacy-screen associated with a specific connector.
> This is modelled similar to how we deal with e.g. PWMs and GPIOs in the
> kernel, including separate includes for consumers and providers(drivers).
>
> 3. Some drm_connector helper functions to keep the actual changes needed
> for this in individual KMS drivers as small as possible (patch 5).
>
> 4. Make the thinkpad_acpi code register a privacy-screen device on
> ThinkPads with a privacy-screen (patches 6-8)
>
> 5. Make the i915 driver export the privacy-screen functionality through
> the connector properties on the eDP connector.
>
> I believe that it would be best to merge the entire series, including
> the thinkpad_acpi changes through drm-misc in one go. As the pdx86
> subsys maintainer I hereby give my ack for merging the thinkpad_acpi
> changes through drm-misc.

Huge +1 to this. This feature has been waiting for acceptance for
almost 1.5 years now, and we (Chromeos) have been carrying it out of
the tree since then. We have real products today that use this
feature. If a version of it can please be accepted and applied, we
look forward to cherry-pick / backport it to our kernels (and adapt chrome
code to the new API).

Thanks,
Rajat



>
> There is one small caveat with this series, which it is good to be
> aware of. The i915 driver will now return -EPROBE_DEFER on Thinkpads
> with an eprivacy screen, until the thinkpad_acpi driver is loaded.
> This means that initrd generation tools will need to be updated to
> include thinkpad_acpi when the i915 driver is added to the initrd.
> Without this the loading of the i915 driver will be delayed to after
> the switch to real rootfs.
>
> Regards,
>
> Hans
>
>
> Hans de Goede (8):
>   drm: Add privacy-screen class
>   drm/privacy-screen: Add X86 specific arch init code
>   drm/privacy-screen: Add notifier support
>   drm/connector: Add a drm_connector privacy-screen helper functions
>   platform/x86: thinkpad_acpi: Add hotkey_notify_extended_hotkey()
>     helper
>   platform/x86: thinkpad_acpi: Get privacy-screen / lcdshadow ACPI
>     handles only once
>   platform/x86: thinkpad_acpi: Register a privacy-screen device
>   drm/i915: Add privacy-screen support
>
> Rajat Jain (1):
>   drm/connector: Add support for privacy-screen properties (v4)
>
>  Documentation/gpu/drm-kms-helpers.rst        |  15 +
>  Documentation/gpu/drm-kms.rst                |   2 +
>  MAINTAINERS                                  |   8 +
>  drivers/gpu/drm/Kconfig                      |   5 +
>  drivers/gpu/drm/Makefile                     |   4 +
>  drivers/gpu/drm/drm_atomic_uapi.c            |   4 +
>  drivers/gpu/drm/drm_connector.c              | 214 ++++++++
>  drivers/gpu/drm/drm_privacy_screen.c         | 493 +++++++++++++++++++
>  drivers/gpu/drm/drm_privacy_screen_x86.c     |  82 +++
>  drivers/gpu/drm/i915/display/intel_display.c |   5 +
>  drivers/gpu/drm/i915/display/intel_dp.c      |  10 +
>  drivers/gpu/drm/i915/i915_pci.c              |  12 +
>  drivers/platform/x86/Kconfig                 |   1 +
>  drivers/platform/x86/thinkpad_acpi.c         | 131 +++--
>  include/drm/drm_connector.h                  |  56 +++
>  include/drm/drm_privacy_screen_consumer.h    |  32 ++
>  include/drm/drm_privacy_screen_driver.h      |  84 ++++
>  include/drm/drm_privacy_screen_machine.h     |  46 ++
>  18 files changed, 1162 insertions(+), 42 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_privacy_screen.c
>  create mode 100644 drivers/gpu/drm/drm_privacy_screen_x86.c
>  create mode 100644 include/drm/drm_privacy_screen_consumer.h
>  create mode 100644 include/drm/drm_privacy_screen_driver.h
>  create mode 100644 include/drm/drm_privacy_screen_machine.h
>
> --
> 2.31.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
