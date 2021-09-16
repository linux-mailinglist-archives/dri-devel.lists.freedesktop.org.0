Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD2D40D73E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 12:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1476C6EB4D;
	Thu, 16 Sep 2021 10:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5734C6EB4C;
 Thu, 16 Sep 2021 10:14:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="202029791"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="202029791"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:14:49 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="545467722"
Received: from djustese-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.34.120])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:14:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rajat Jain <rajatja@google.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Gross <mgross@linux.intel.com>,
 Andy Shevchenko <andy@infradead.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 Mark Pearson <markpearson@lenovo.com>, Sebastien Bacher <seb128@ubuntu.com>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/9] drm: Add privacy-screen class and connector properties
In-Reply-To: <ddd05009-49dd-c61e-f966-e28d42eb7ef8@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210906073519.4615-1-hdegoede@redhat.com>
 <ddd8ba1e22adb6fd536c9d72384a30bb9c945997.camel@redhat.com>
 <ddd05009-49dd-c61e-f966-e28d42eb7ef8@redhat.com>
Date: Thu, 16 Sep 2021 13:14:39 +0300
Message-ID: <87pmt8x1ww.fsf@intel.com>
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

On Thu, 16 Sep 2021, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi,
>
> On 9/15/21 11:12 PM, Lyude Paul wrote:
>> OK! Looked over all of these patches. Patches 2 and 4 have some comments=
 that
>> should be addressed, but otherwise this series is:
>>=20
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> Thank you!
>
>> Let me know when/if you need help pushing this upstream
>
> My plan was to just straight forward push the entire series to
> drm-misc-next. The only non drm bits are the drivers/platform/x86/thinkpa=
d_acpi.c
> changes and I'm the drivers/platform/x86 subsys-maintainer and this
> plan has my blessing :)
>
> That only leaves the last patch in the series:
> "drm/i915: Add privacy-screen support"=20
>
> As something which could potentially be troublesome. I can also
> leave that out, while pushing the test to drm-misc-next and then
> push the i915 patch after a drm-misc-next merge into drm-intel-next.
>
> Jani, how would you like to handle the single i915 patch in this
> series?

I think it's easiest to merge that via the same route as everything else
goes. It's a fairly small patch with not that much conflict potential.

That said, there are some issues in that patch I think still need
addressing. I've commented on the patch. I don't mind you pushing the
rest already, unless you think addressing the issues is easier by
modifying the other patches (I don't think so).


BR,
Jani.

>
> Regards,
>
> Hans
>
>
>
>
>
>>=20
>> On Mon, 2021-09-06 at 09:35 +0200, Hans de Goede wrote:
>>> Hi all,
>>>
>>> Here is the privacy-screen related code which I last posted in April 20=
21
>>> To the best of my knowledge there is consensus about / everyone is in
>>> agreement with the new userspace API (2 connector properties) this
>>> patch-set add (patch 1 of the series).
>>>
>>> This is unchanged (except for a rebase on drm-tip), what has changed is
>>> that the first userspace consumer of the new properties is now fully re=
ady
>>> for merging (it is just waiting for the kernel bits to land first):
>>>
>>> =C2=A0-
>>> https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas/-/merge_reques=
ts/49
>>> =C2=A0- https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1952
>>> =C2=A0- https://gitlab.gnome.org/GNOME/gnome-control-center/-/merge_req=
uests/1032
>>>
>>> Having a userspace-consumer of the API fully ready for merging, clears =
the
>>> last blocker for this series. It has already has been reviewed before
>>> by Emil Velikov, but it could really do with another review.
>>>
>>> The new API works as designed and add the following features to GNOME:
>>>
>>> 1. Showing an OSD notification when the privacy-screen is toggled on/off
>>> =C2=A0=C2=A0 through hotkeys handled by the embedded-controller
>>> 2. Allowing control of the privacy-screen from the GNOME control-panel,
>>> =C2=A0=C2=A0 including the on/off slider shown there updating to match =
the hw-setting
>>> =C2=A0=C2=A0 when the setting is changed with the control-panel open.
>>> 3. Restoring the last user-setting at login
>>>
>>> This series consists of a number of different parts:
>>>
>>> 1. A new version of Rajat's privacy-screen connector properties patch,
>>> this adds new userspace API in the form of new properties
>>>
>>> 2. Since on most devices the privacy screen is actually controlled by
>>> some vendor specific ACPI/WMI interface which has a driver under
>>> drivers/platform/x86, we need some "glue" code to make this functionali=
ty
>>> available to KMS drivers. Patches 2-4 add a new privacy-screen class for
>>> this, which allows non KMS drivers (and possibly KMS drivers too) to
>>> register a privacy-screen device and also adds an interface for KMS dri=
vers
>>> to get access to the privacy-screen associated with a specific connecto=
r.
>>> This is modelled similar to how we deal with e.g. PWMs and GPIOs in the
>>> kernel, including separate includes for consumers and providers(drivers=
).
>>>
>>> 3. Some drm_connector helper functions to keep the actual changes needed
>>> for this in individual KMS drivers as small as possible (patch 5).
>>>
>>> 4. Make the thinkpad_acpi code register a privacy-screen device on
>>> ThinkPads with a privacy-screen (patches 6-8)
>>>
>>> 5. Make the i915 driver export the privacy-screen functionality through
>>> the connector properties on the eDP connector.
>>>
>>> I believe that it would be best to merge the entire series, including
>>> the thinkpad_acpi changes through drm-misc in one go. As the pdx86
>>> subsys maintainer I hereby give my ack for merging the thinkpad_acpi
>>> changes through drm-misc.
>>>
>>> There is one small caveat with this series, which it is good to be
>>> aware of. The i915 driver will now return -EPROBE_DEFER on Thinkpads
>>> with an eprivacy screen, until the thinkpad_acpi driver is loaded.
>>> This means that initrd generation tools will need to be updated to
>>> include thinkpad_acpi when the i915 driver is added to the initrd.
>>> Without this the loading of the i915 driver will be delayed to after
>>> the switch to real rootfs.
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>> Hans de Goede (8):
>>> =C2=A0 drm: Add privacy-screen class (v3)
>>> =C2=A0 drm/privacy-screen: Add X86 specific arch init code
>>> =C2=A0 drm/privacy-screen: Add notifier support
>>> =C2=A0 drm/connector: Add a drm_connector privacy-screen helper functio=
ns
>>> =C2=A0 platform/x86: thinkpad_acpi: Add hotkey_notify_extended_hotkey()
>>> =C2=A0=C2=A0=C2=A0 helper
>>> =C2=A0 platform/x86: thinkpad_acpi: Get privacy-screen / lcdshadow ACPI
>>> =C2=A0=C2=A0=C2=A0 handles only once
>>> =C2=A0 platform/x86: thinkpad_acpi: Register a privacy-screen device
>>> =C2=A0 drm/i915: Add privacy-screen support
>>>
>>> Rajat Jain (1):
>>> =C2=A0 drm/connector: Add support for privacy-screen properties (v4)
>>>
>>> =C2=A0Documentation/gpu/drm-kms-helpers.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 15 +
>>> =C2=A0Documentation/gpu/drm-kms.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
>>> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 8 +
>>> =C2=A0drivers/gpu/drm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 4 +
>>> =C2=A0drivers/gpu/drm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 1 +
>>> =C2=A0drivers/gpu/drm/drm_atomic_uapi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
>>> =C2=A0drivers/gpu/drm/drm_connector.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 214 +++++++++
>>> =C2=A0drivers/gpu/drm/drm_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 4 +
>>> =C2=A0drivers/gpu/drm/drm_privacy_screen.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 468 +++++++++++++++++++
>>> =C2=A0drivers/gpu/drm/drm_privacy_screen_x86.c=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 86 ++++
>>> =C2=A0drivers/gpu/drm/i915/display/intel_display.c |=C2=A0=C2=A0 5 +
>>> =C2=A0drivers/gpu/drm/i915/display/intel_dp.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 10 +
>>> =C2=A0drivers/gpu/drm/i915/i915_pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 +
>>> =C2=A0drivers/platform/x86/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
2 +
>>> =C2=A0drivers/platform/x86/thinkpad_acpi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 131 ++++--
>>> =C2=A0include/drm/drm_connector.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
56 +++
>>> =C2=A0include/drm/drm_privacy_screen_consumer.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 65 +++
>>> =C2=A0include/drm/drm_privacy_screen_driver.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 84 ++++
>>> =C2=A0include/drm/drm_privacy_screen_machine.h=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 46 ++
>>> =C2=A019 files changed, 1175 insertions(+), 42 deletions(-)
>>> =C2=A0create mode 100644 drivers/gpu/drm/drm_privacy_screen.c
>>> =C2=A0create mode 100644 drivers/gpu/drm/drm_privacy_screen_x86.c
>>> =C2=A0create mode 100644 include/drm/drm_privacy_screen_consumer.h
>>> =C2=A0create mode 100644 include/drm/drm_privacy_screen_driver.h
>>> =C2=A0create mode 100644 include/drm/drm_privacy_screen_machine.h
>>>
>>=20
>

--=20
Jani Nikula, Intel Open Source Graphics Center
