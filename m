Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357A952CEDF
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D80B11B0B4;
	Thu, 19 May 2022 09:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E55411B0B1;
 Thu, 19 May 2022 09:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652950978; x=1684486978;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hAoQkRu47IyaWQTtveq3c7aHdT3liXee0nWJIpO68aY=;
 b=KnfdPscxlT8KXdzqv75Z1ANV1KHBgEGg+OdxYgkoWkDUH8X5cV0uVJEB
 5fOfAZhJCy/DzImsYRScRePnUMfzMyCHNTEgvtEfb0U/JdEBgdmshYMPN
 Um+82sYVNuLCjS4AFqdfqQ/ig6ORQs3JxLp9eBxjspcGULTIhe2ldBnLo
 9iHHyAVlkB2OcTTTMIe5uC7lr4T2V+j9oHd9cP9DzzVyfuxHheTtRTXTW
 rqB/oWg+bdc5MyV5eei86tVUbrERwFQWq/a9G50r3xUYuzIlxuCWZb89Y
 pnD/6oXJC5Ww8rKbMCzLkM9wHexDfSWSZaZ+IVxmXbeflj4cH5lGF10Vm Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="297405542"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="297405542"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:02:57 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="545991736"
Received: from tszulist-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.146.157])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:02:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>, Daniel Dadap
 <ddadap@nvidia.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH 01/14] ACPI: video: Add a native function parameter to
 acpi_video_get_backlight_type()
In-Reply-To: <dc30ddc2-b00e-234e-5ec3-b1ea79c74082@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220517152331.16217-1-hdegoede@redhat.com>
 <20220517152331.16217-2-hdegoede@redhat.com> <87y1yzdxtk.fsf@intel.com>
 <dc30ddc2-b00e-234e-5ec3-b1ea79c74082@redhat.com>
Date: Thu, 19 May 2022 12:02:46 +0300
Message-ID: <87pmk9dhe1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 May 2022, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi,
>
> On 5/18/22 10:55, Jani Nikula wrote:
>> On Tue, 17 May 2022, Hans de Goede <hdegoede@redhat.com> wrote:
>>> ATM on x86 laptops where we want userspace to use the acpi_video backlight
>>> device we often register both the GPU's native backlight device and
>>> acpi_video's firmware acpi_video# backlight device. This relies on
>>> userspace preferring firmware type backlight devices over native ones, but
>>> registering 2 backlight devices for a single display really is undesirable.
>>>
>>> On x86 laptops where the native GPU backlight device should be used,
>>> the registering of other backlight devices is avoided by their drivers
>>> using acpi_video_get_backlight_type() and only registering their backlight
>>> if the return value matches their type.
>>>
>>> acpi_video_get_backlight_type() uses
>>> backlight_device_get_by_type(BACKLIGHT_RAW) to determine if a native
>>> driver is available and will never return native if this returns
>>> false. This means that the GPU's native backlight registering code
>>> cannot just call acpi_video_get_backlight_type() to determine if it
>>> should register its backlight, since acpi_video_get_backlight_type() will
>>> never return native until the native backlight has already registered.
>>>
>>> To fix this add a native function parameter to
>>> acpi_video_get_backlight_type(), which when set to true will make
>>> acpi_video_get_backlight_type() behave as if a native backlight has
>>> already been registered.

Regarding the question below, this is the part that throws me off.

>>>
>>> Note that all current callers are updated to pass false for the new
>>> parameter, so this change in itself causes no functional changes.
>> 
>> 
>>> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
>>> index becc198e4c22..0a06f0edd298 100644
>>> --- a/drivers/acpi/video_detect.c
>>> +++ b/drivers/acpi/video_detect.c
>>> @@ -17,12 +17,14 @@
>>>   * Otherwise vendor specific drivers like thinkpad_acpi, asus-laptop,
>>>   * sony_acpi,... can take care about backlight brightness.
>>>   *
>>> - * Backlight drivers can use acpi_video_get_backlight_type() to determine
>>> - * which driver should handle the backlight.
>>> + * Backlight drivers can use acpi_video_get_backlight_type() to determine which
>>> + * driver should handle the backlight. RAW/GPU-driver backlight drivers must
>>> + * pass true for the native function argument, other drivers must pass false.
>>>   *
>>>   * If CONFIG_ACPI_VIDEO is neither set as "compiled in" (y) nor as a module (m)
>>>   * this file will not be compiled and acpi_video_get_backlight_type() will
>>> - * always return acpi_backlight_vendor.
>>> + * return acpi_backlight_native when its native argument is true and
>>> + * acpi_backlight_vendor when it is false.
>>>   */
>> 
>> Frankly, I think the boolean native parameter here, and at the call
>> sites, is confusing, and the slightly different explanations in the
>> commit message and comment here aren't helping.
>
> Can you elaborate the "slightly different explanations in the
> commit message and comment" part a bit (so that I can fix this) ?
>
>> I suggest adding a separate function that the native backlight drivers
>> should use. I think it's more obvious all around, and easier to document
>> too.
>
> Code wise I think this would mean renaming the original and
> then adding 2 wrappers, but that is fine with me. I've no real
> preference either way and I'm happy with adding a new variant of
> acpi_video_get_backlight_type() for the native backlight drivers
> any suggestion for a name ?

Alternatively, do the native backlight drivers have any need for the
actual backlight type information from acpi? They only need to be able
to ask if they should register themselves, right?

I understand this sounds like bikeshedding, but I'm trying to avoid
duplicating the conditions in the drivers where a single predicate
function call could be sufficient, and the complexity could be hidden in
acpi.

	if (!acpi_video_backlight_use_native())
		return;

Perhaps all the drivers/platform/x86/* backlight drivers could use:

	if (acpi_video_backlight_use_vendor())
		...

You can still use the native parameter etc. internally, but just hide
the details from everyone else, and, hopefully, make it harder for them
to do silly things?

BR,
Jani.


>
> Regards,
>
> Hans
>

-- 
Jani Nikula, Intel Open Source Graphics Center
