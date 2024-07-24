Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4621893AE32
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 10:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BF510E4EF;
	Wed, 24 Jul 2024 08:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="af7t7Spa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0BC10E4EF;
 Wed, 24 Jul 2024 08:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721811479; x=1753347479;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ZO/GRR+lASq/+hJXGw9UMWBMQ9XV29tothYM/chdAPU=;
 b=af7t7Spa9Px26oKu+8FjauIbNBt3TOYQgH/RVWoxytU2sR+g5sSMLyFB
 t+qYU0mTxtjdVYIeREEWl5JueHLVmH5f/zzvLK49mE9Sbx4T8c3q50/ip
 YJxRR1jP6YnMU143juBjUL+zlsA2itSez64fs/wfJ4bdcF4ZuQGHUl5JJ
 jY3VuhX8LHI/kxDEWhyvYishvxxJKbiWqMYpoFvrdRjb6hGQmi54N6AqD
 FS/LNr5Yl5vMa3/f3izH9otZN31lX5HgNDM6l4Elh9vKxU1SzE2QLThVm
 ZwAkVl9k5S2WUjA+i7wUfBR9DjRuLfuQQQWFaIqTrs+Wyp6zHsVsJLsX+ g==;
X-CSE-ConnectionGUID: s9QOcSylSlaM07VugjYHEQ==
X-CSE-MsgGUID: bHzR/hXDSqS3Czaf59WiWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19439874"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="19439874"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 01:57:59 -0700
X-CSE-ConnectionGUID: rCrVnl35Qe6QwW3OUlq6iQ==
X-CSE-MsgGUID: KgRcEBdgT32ESSTa07cEkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="57642344"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.170])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 01:57:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6n?=
 =?utf-8?Q?ig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>
Subject: Re: [PATCH v2 0/3] drm: backlight quirk infrastructure and lower
 minimum for Framework AMD 13
In-Reply-To: <6db5abf9-cbdd-4ec0-b669-5df23de6c2ad@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net>
 <e61010e4-cb49-44d6-8f0d-044a193d29b2@redhat.com>
 <51f68b3b-dd21-44ef-8ec8-05bea5db6e55@t-8ch.de>
 <6db5abf9-cbdd-4ec0-b669-5df23de6c2ad@redhat.com>
Date: Wed, 24 Jul 2024 11:57:47 +0300
Message-ID: <87sevzf9pw.fsf@intel.com>
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

On Thu, 18 Jul 2024, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi Thomas,
>
> On 6/24/24 6:15 PM, Thomas Wei=C3=9Fschuh wrote:
>> Hi Hans!
>>=20
>> thanks for your feedback!
>>=20
>> On 2024-06-24 11:11:40+0000, Hans de Goede wrote:
>>> On 6/23/24 10:51 AM, Thomas Wei=C3=9Fschuh wrote:
>>>> The value of "min_input_signal" returned from ATIF on a Framework AMD =
13
>>>> is "12". This leads to a fairly bright minimum display backlight.
>>>>
>>>> Add a generic quirk infrastructure for backlight configuration to
>>>> override the settings provided by the firmware.
>>>> Also add amdgpu as a user of that infrastructure and a quirk for the
>>>> Framework 13 matte panel.
>>>> Most likely this will also work for the glossy panel, but I can't test
>>>> that.
>>>>
>>>> One solution would be a fixed firmware version, but given that the
>>>> problem exists since the release of the hardware, it has been known for
>>>> a month that the hardware can go lower and there was no acknowledgment
>>>> from Framework in any way, I'd like to explore this alternative
>>>> way forward.
>>>
>>> There are many panels where the brightness can go lower then the advert=
ised
>>> minimum brightness by the firmware (e.g. VBT for i915). For most users
>>> the minimum brightness is fine, especially since going lower often may =
lead
>>> to an unreadable screen when indoors (not in the full sun) during dayli=
ght
>>> hours. And some users get confused by the unreadable screen and find it
>>> hard to recover things from this state.
>>=20
>> There are a fair amount of complaints on the Framework forums about this.
>> And that specific panel is actually readable even at 0% PWM.
>
> If a lot of Framework users are complaining about this, then maybe Framew=
ork
> should fix their VBT in a BIOS update ?  That seems like a better solution
> then quirking this in the kernel.
>
>>=20
>>> So IMHO we should not be overriding the minimum brightness from the fir=
mware
>>> using quirks because:
>>>
>>> a) This is going to be an endless game of whack-a-mole
>>=20
>> Indeed, but IMO it is better to maintain the list in the kernel than
>> forcing all users to resort to random forum advise and fiddle with
>> lowlevel system configuration.
>
> One of the problem is that what is an acceptable minimum brightness
> value is subjective. One person's "still too bright" is another
> person's "barely readable"

Side note, IIRC the minimum brightness in VBT was not originally about
subjective minimums, but rather to avoid electrical issues that 0% PWM
caused in some board designs.

BR,
Jani.


>
>>> b) The new value may be too low for certain users / use-cases
>>=20
>> The various userspace wrappers already are applying a safety
>> threshold to not go to "0".
>> At least gnome-settings-daemon and brightnessctl do not go below 1% of
>> brightness_max. They already have to deal with panels that can go
>> completely dark.
>
> Right, something which was added because the minimum brightness value
> on VBTs often is broken. Either it is missing or (subjectively) it is
> too high.
>
>
>>> With that said I realize that there are also many users who want to have
>>> a lower minimum brightness value for use in the evening, since they find
>>> the available minimum value still too bright. I know some people want t=
his
>>> for e.g. various ThinkPad models too.
>>=20
>> From my experience with ThinkPads, the default brightness range there
>> was fine for me. But on the Framework 13 AMD it is not.
>>=20
>>> So rather then quirking this, with the above mentioned disadvantages I =
believe
>>> that it would be better to extend the existing video=3DeDP-1:.... kernel
>>> commandline parsing to allow overriding the minimum brightness in a dri=
ver
>>> agnostic way.
>>=20
>> I'm not a fan. It seems much too complicated for most users.
>
> Wanting lower minimum brightness really is mostly a power-user thing
> and what is the right value is somewhat subjective and this is an often
> heard complained. I really believe that the kernel should NOT get in
> the business of adding quirks for this. OTOH given that this is an often
> heard complaint having some generic mechanism to override the VBT value
> would be good to have.
>
> As for this being too complicated, I fully agree that ideally things
> should just work 100% OOTB, which is why I believe that a firmware fix
> from Framework would be good. But when things do not work 100% adding
> a kernel cmdline option is something which is regularly asked from users /
> found in support questions on fora so I don't think this is overly
> complicated. I agree it is not ideal but IMHO it is workable.
>
> E.g. on Fedora it would simply be a question of users having to run:
>
> sudo grubby --update-kernel=3DALL --args=3D"video=3DeDP-1:min-brightness=
=3D1"
>
> will add the passed in argument to all currently installed (and
> future) kernels.
>
>> Some more background to the Framework 13 AMD case:
>> The same panel on the Intel variant already goes darker.
>> The last responses we got from Framework didn't indicate that the high
>> minimum brightness was intentional [0], [1].
>> Coincidentally the "12" returned from ATIF matches
>> AMDGPU_DM_DEFAULT_MIN_BACKLIGHT, so maybe the firmware is just not set
>> up completely.
>
> Right, so I think this should be investigated closer and then get
> framework to issue a BIOS fix, not add a quirk mechanism to the kernel.
>
> IIRC the amdgpu driver will use AMDGPU_DM_DEFAULT_MIN_BACKLIGHT when
> that setting is 0 in the VBT.
>
>>=20
>>> The minimum brightness override set this way will still need hooking up
>>> in each driver separately but by using the video=3DeDP-1:... mechanism
>>> we can document how to do this in driver independent manner. since
>>> I know there have been multiple requests for something like this in
>>> the past I believe that having a single uniform way for users to do this
>>> will be good.
>>>
>>> Alternatively we could have each driver have a driver specific module-
>>> parameter for this. Either way I think we need some way for users to
>>> override this as a config/setting tweak rather then use quirks for this.
>>=20
>> This also seems much too complicated for normal users.
>
> I agree that having a uniform way is better then having per driver
> module options.
>
> Regards,
>
> Hans
>

--=20
Jani Nikula, Intel
