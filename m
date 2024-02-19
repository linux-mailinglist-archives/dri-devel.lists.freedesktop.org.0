Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB2E85A759
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 16:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F25910E190;
	Mon, 19 Feb 2024 15:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lieHloYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B6110E190;
 Mon, 19 Feb 2024 15:28:31 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-5cdf76cde78so3651431a12.1; 
 Mon, 19 Feb 2024 07:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708356511; x=1708961311; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wx85snFmRIQunrV57oy2nkUhxF85FwsJalUAW+CjTHU=;
 b=lieHloYH6LwaaOLslsRlsz3v0a1b/cokAwL26486o/laHzljGARHghmWo5caugfSdA
 cVvC7aeQQI26vCxBN3dbi8ni2rCJCnYeFm0fVUy8+QHGTw+RxLkTICIwjINJryWpaDJG
 qfBxmaOePB30PPiiOftp0HOdS02+Yi++4hv9ziAeKClr2v3awrKrTtJO7A1g2ejXN69m
 1wS5fCQ90KAyF7gaJA3igM88jWXL65KmptRNwYm0vyfupqXPvu+2VXzd6o9qNcsfuhgo
 1dONAxLo8LkZoXUnrnQnF+cV48nXZeNBVLK94uhmJEnCtV46XBuhzaDOF94yXFhptwd4
 dYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708356511; x=1708961311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wx85snFmRIQunrV57oy2nkUhxF85FwsJalUAW+CjTHU=;
 b=Izv+ZB2tZoR6HjnWnkW2ZZDkIho0bO+4nugqvhyqHqG6dYZq+bqAXVuEsS+27DUkXf
 YuI6BWRZCDHa+SVLwUJEOh2sCR91tBqaMvIL/HDa6gSTUIn9Unsvu5ge6lybZf+elV4W
 GYJNBvGN+Iwcoqks1BHkdSv9nI75830swQ08us8KIMGk7f5UIlc7DwgoV1fUorAdsjT4
 dTOB6zMg0ydgEkNBoLahl3dWKp4SD59cSbnTJw1Lo8tftAYDTZ2ybzMq2elIv0K/tTX6
 KmzVirxqBiZZYMleSNp98sxEDk9lbWIALjJp85Fw9YxD528goQjCQVO7HJYnb0Z3ftFU
 6v1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyP/4s5HWGlDUoIf8Zap5K/r+vpmCx0zXfBrD+NIt7gt77Tz1Jfvlin4GATUSdlBHFiaEiEMLIaTWBFMJS33tvYwuj47pDvAj4LxeA2UTIB8INLovZH5Pz0N+atRsFmvpcxxwB3V5XWiZ06gMtAA==
X-Gm-Message-State: AOJu0Yz4ljD/XeTQJ6UUN7IETWeVlEb+pYLQgWjVWWlph7AZykJKC1mU
 ODHHtWCQ5GDS0Esn+zOWEus+7FDDRIRcuexfURlmvkhyXXctn6nmT+3VW2Ho/pyHYaURsGBeXvX
 0DJn/k5lAPFmobTHuQyf+IfBABxcu3cmO
X-Google-Smtp-Source: AGHT+IHXgG0h6OH8XAxLCMT1hfFDZ2+n8hdHi4gi8dpDDzwfJ8TICN5ZGal1lopk6EX1DfK509NlCVxWEmgUUizAUx4=
X-Received: by 2002:a17:90a:b00f:b0:299:6a7f:cc09 with SMTP id
 x15-20020a17090ab00f00b002996a7fcc09mr3270224pjq.33.1708356510602; Mon, 19
 Feb 2024 07:28:30 -0800 (PST)
MIME-Version: 1.0
References: <20240216140709.73708-1-mario.limonciello@amd.com>
 <8970de85-3117-4e28-82b4-3b35c5beb7cf@gmail.com>
 <6b9e6f24-8fa5-43c5-88a2-068dfcb9996e@amd.com>
 <e47b859d-eb0c-49f8-8a96-6f454fa18592@gmail.com>
 <20361f26-2c83-4619-8f9e-ec8788b8280f@amd.com>
 <126803c6-177a-4ffd-8b65-856fb83f9972@amd.com>
 <0e10db11-0723-47e8-82ed-94d68e3c5afb@amd.com>
 <CADnq5_NQ9Lx_A2v8mmaEPzct6yYJo9pC6EmUtee=HFrJ8ZnUNw@mail.gmail.com>
 <8d6402eb-804b-4b8c-8322-ce374d864bad@amd.com>
In-Reply-To: <8d6402eb-804b-4b8c-8322-ce374d864bad@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 Feb 2024 10:28:18 -0500
Message-ID: <CADnq5_N9=ngOr5srp9CGZRx-=JVmQxte5MgpkcRnTMcSCNfuYA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Only allow one entity to control ABM
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Hamza Mahfooz <Hamza.Mahfooz@amd.com>, Sun peng Li <Sunpeng.Li@amd.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Feb 19, 2024 at 10:19=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 16.02.24 um 19:37 schrieb Alex Deucher:
> > On Fri, Feb 16, 2024 at 10:42=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 16.02.24 um 16:12 schrieb Mario Limonciello:
> >>> On 2/16/2024 09:05, Harry Wentland wrote:
> >>>>
> >>>> On 2024-02-16 09:47, Christian K=C3=B6nig wrote:
> >>>>> Am 16.02.24 um 15:42 schrieb Mario Limonciello:
> >>>>>> On 2/16/2024 08:38, Christian K=C3=B6nig wrote:
> >>>>>>> Am 16.02.24 um 15:07 schrieb Mario Limonciello:
> >>>>>>>> By exporting ABM to sysfs it's possible that DRM master and soft=
ware
> >>>>>>>> controlling the sysfs file fight over the value programmed for A=
BM.
> >>>>>>>>
> >>>>>>>> Adjust the module parameter behavior to control who control ABM:
> >>>>>>>> -2: DRM
> >>>>>>>> -1: sysfs (IE via software like power-profiles-daemon)
> >>>>>>> Well that sounds extremely awkward. Why should a
> >>>>>>> power-profiles-deamon has control over the panel power saving
> >>>>>>> features?
> >>>>>>>
> >>>>>>> I mean we are talking about things like reducing backlight level
> >>>>>>> when the is inactivity, don't we?
> >>>>>> We're talking about activating the ABM algorithm when the system i=
s
> >>>>>> in power saving mode; not from inactivity.  This allows the user t=
o
> >>>>>> squeeze out some extra power "just" in that situation.
> >>>>>>
> >>>>>> But given the comments on the other patch, I tend to agree with
> >>>>>> Harry's proposal instead that we just drop the DRM property
> >>>>>> entirely as there are no consumers of it.
> >>>>> Yeah, but even then the design to let this be controlled by an
> >>>>> userspace deamon is questionable. Stuff like that is handled inside
> >>>>> the kernel and not exposed to userspace usually.
> >>>>>
> >>> Regarding the "how" and "why" of PPD; besides this panel power saving=
s
> >>> sysfs file there are two other things that are nominally changed.
> >>>
> >>> ACPI platform profile:
> >>> https://www.kernel.org/doc/html/latest/userspace-api/sysfs-platform_p=
rofile.html
> >>>
> >>> AMD-Pstate EPP value:
> >>> https://www.kernel.org/doc/html//latest/admin-guide/pm/amd-pstate.htm=
l
> >>>
> >>> When a user goes into "power saving" mode both of those are tweaked.
> >>> Before we introduced the EPP tweaking in PPD we did discuss a callbac=
k
> >>> within the kernel so that userspace could change "just" the ACPI
> >>> platform profile and everything else would react.  There was pushback
> >>> on this, and so instead knobs are offered for things that should be
> >>> tweaked and the userspace daemon can set up policy for what to do whe=
n
> >>> a a user uses a userspace client (such as GNOME or KDE) to change the
> >>> desired system profile.
> >> Ok, well who came up with the idea of the userspace deamon? Cause I
> >> think there will be even more push back on this approach.
> >>
> >> Basically when we go from AC to battery (or whatever) the drivers
> >> usually handle that all inside the kernel today. Involving userspace i=
s
> >> only done when there is a need for that, e.g. inactivity detection or
> >> similar.
> > Well, we don't want policy in the kernel unless it's a platform or
> > hardware requirement.  Kernel should provide the knobs and then
> > userspace can set them however they want depending on user preference.
>
> Well, you not have the policy itself but usually the handling inside the
> kernel.
>
> In other words when I connect/disconnect AC from my laptop I can hear
> the fan changing, which is a switch in power state. Only the beep which
> comes out of the speakers as conformation is handled in userspace I think=
.
>
> And IIRC changing background light is also handled completely inside the
> kernel and when I close the lid the display turns off on its own and not
> because of some userspace deamon.
>
> So why is for this suddenly a userspace deamon involved?

It's a user preference.  Some people won't like ABM, some will.  They
set the policy from user space.  It's similar to the backlight level.
Some users always prefer a bright backlight regardless of AC/DC state,
others want the backlight to get brighter when on AC power.  The
kernel provides the knobs to set the ABM level and then user space can
specify the level and also device when they want it enabled (never,
only on DC, etc.).  The kernel driver for the backlight doesn't change
the backlight at AC/DC switch, userspace gets an event when the power
source changes and it then talks to the kernel to change the backlight
level.  I think lid is handled the same way.  Userspace gets a lid
event and it turns off the displays and maybe enters suspend or maybe
not depending on what the user wants.

Alex

>
> Christian.
>
> >
> > Alex
> >
> >
> >>>> I think we'll need a bit in our kernel docs describing ABM.
> >>>> Assumptions around what it is and does seem to lead to confusion.
> >>>>
> >>>> The thing is that ABM has a visual impact that not all users like. I=
t
> >>>> would make sense for users to be able to change the ABM level as
> >>>> desired, and/or configure their power profiles to select a certain
> >>>> ABM level.
> >>>>
> >>>> ABM will reduce the backlight and compensate by adjusting brightness
> >>>> and contrast of the image. It has 5 levels: 0, 1, 2, 3, 4. 0 means
> >>>> off. 4 means maximum backlight reduction. IMO, 1 and 2 look okay. 3
> >>>> and 4 can be quite impactful, both to power and visual fidelity.
> >>>>
> >>> Aside from this patch Hamza did make some improvements to the kdoc in
> >>> the recent patches, can you read through again and see if you think i=
t
> >>> still needs improvements?
> >> Well what exactly is the requirement? That we have different ABM
> >> settings for AC and battery? If yes providing different DRM properties
> >> would sound like the right approach to me.
> >>
> >> Regards,
> >> Christian.
> >>
> >>>> Harry
> >>>>
> >>>>> Regards,
> >>>>> Christian.
> >>>>>
> >>>>>>> Regards,
> >>>>>>> Christian.
> >>>>>>>
> >>>>>>>> 0-4: User via command line
> >>>>>>>>
> >>>>>>>> Also introduce a Kconfig option that allows distributions to cho=
ose
> >>>>>>>> the default policy that is appropriate for them.
> >>>>>>>>
> >>>>>>>> Fixes: f97e4303da16 ("drm/amd/display: add panel_power_savings
> >>>>>>>> sysfs entry to eDP connectors")
> >>>>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >>>>>>>> ---
> >>>>>>>> Cc: Hamza Mahfooz <Hamza.Mahfooz@amd.com>
> >>>>>>>> Cc: Harry Wentland <Harry.Wentland@amd.com>
> >>>>>>>> Cc: Sun peng (Leo) Li <Sunpeng.Li@amd.com>
> >>>>>>>>     drivers/gpu/drm/amd/amdgpu/Kconfig            | 72
> >>>>>>>> +++++++++++++++++++
> >>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 23 +++---
> >>>>>>>>     .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +-
> >>>>>>>>     3 files changed, 90 insertions(+), 11 deletions(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>> b/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>> index 22d88f8ef527..2ab57ccf6f21 100644
> >>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>>>> @@ -80,6 +80,78 @@ config DRM_AMDGPU_WERROR
> >>>>>>>>           Add -Werror to the build flags for amdgpu.ko.
> >>>>>>>>           Only enable this if you are warning code for amdgpu.ko=
.
> >>>>>>>> +choice
> >>>>>>>> +    prompt "Amdgpu panel power Savings"
> >>>>>>>> +    default AMDGPU_SYSFS_ABM
> >>>>>>>> +    help
> >>>>>>>> +        Control the default behavior for adaptive panel power
> >>>>>>>> savings.
> >>>>>>>> +
> >>>>>>>> +        Panel power savings features will sacrifice color accur=
acy
> >>>>>>>> +        in exchange for power savings.
> >>>>>>>> +
> >>>>>>>> +        This can be configured for:
> >>>>>>>> +        - dynamic control by the DRM master
> >>>>>>>> +        - dynamic control by sysfs nodes
> >>>>>>>> +        - statically by the user at kernel compile time
> >>>>>>>> +
> >>>>>>>> +        This value can also be overridden by the amdgpu.abmleve=
l
> >>>>>>>> +        module parameter.
> >>>>>>>> +
> >>>>>>>> +config AMDGPU_DRM_ABM
> >>>>>>>> +    bool "DRM Master control"
> >>>>>>>> +    help
> >>>>>>>> +        Export a property called 'abm_level' that can be
> >>>>>>>> +        manipulated by the DRM master for supported hardware.
> >>>>>>>> +
> >>>>>>>> +config AMDGPU_SYSFS_ABM
> >>>>>>>> +    bool "sysfs control"
> >>>>>>>> +    help
> >>>>>>>> +        Export a sysfs file 'panel_power_savings' that can be
> >>>>>>>> +        manipulated by userspace for supported hardware.
> >>>>>>>> +
> >>>>>>>> +config AMDGPU_HARDCODE_ABM0
> >>>>>>>> +    bool "No Panel power savings"
> >>>>>>>> +    help
> >>>>>>>> +        Disable panel power savings.
> >>>>>>>> +        It can only overridden by the kernel command line.
> >>>>>>>> +
> >>>>>>>> +config AMDGPU_HARDCODE_ABM1
> >>>>>>>> +    bool "25% Panel power savings"
> >>>>>>>> +    help
> >>>>>>>> +        Set the ABM panel power savings algorithm to 25%.
> >>>>>>>> +        It can only overridden by the kernel command line.
> >>>>>>>> +
> >>>>>>>> +config AMDGPU_HARDCODE_ABM2
> >>>>>>>> +    bool "50% Panel power savings"
> >>>>>>>> +    help
> >>>>>>>> +        Set the ABM panel power savings algorithm to 50%.
> >>>>>>>> +        It can only overridden by the kernel command line.
> >>>>>>>> +
> >>>>>>>> +config AMDGPU_HARDCODE_ABM3
> >>>>>>>> +    bool "75% Panel power savings"
> >>>>>>>> +    help
> >>>>>>>> +        Set the ABM panel power savings algorithm to 75%.
> >>>>>>>> +        It can only overridden by the kernel command line.
> >>>>>>>> +
> >>>>>>>> +config AMDGPU_HARDCODE_ABM4
> >>>>>>>> +    bool "100% Panel power savings"
> >>>>>>>> +    help
> >>>>>>>> +        Set the ABM panel power savings algorithm to 100%.
> >>>>>>>> +        It can only overridden by the kernel command line.
> >>>>>>>> +endchoice
> >>>>>>>> +
> >>>>>>>> +config AMDGPU_ABM_POLICY
> >>>>>>>> +    int
> >>>>>>>> +    default -2 if AMDGPU_DRM_ABM
> >>>>>>>> +    default -1 if AMDGPU_SYSFS_ABM
> >>>>>>>> +    default 0 if AMDGPU_HARDCODE_ABM0
> >>>>>>>> +    default 1 if AMDGPU_HARDCODE_ABM1
> >>>>>>>> +    default 2 if AMDGPU_HARDCODE_ABM2
> >>>>>>>> +    default 3 if AMDGPU_HARDCODE_ABM3
> >>>>>>>> +    default 4 if AMDGPU_HARDCODE_ABM4
> >>>>>>>> +    default -1
> >>>>>>>> +
> >>>>>>>> +
> >>>>>>>>     source "drivers/gpu/drm/amd/acp/Kconfig"
> >>>>>>>>     source "drivers/gpu/drm/amd/display/Kconfig"
> >>>>>>>>     source "drivers/gpu/drm/amd/amdkfd/Kconfig"
> >>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>>>>> index af7fae7907d7..00d6c8b58716 100644
> >>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>>>>> @@ -844,17 +844,24 @@ module_param_named(visualconfirm,
> >>>>>>>> amdgpu_dc_visual_confirm, uint, 0444);
> >>>>>>>>      * DOC: abmlevel (uint)
> >>>>>>>>      * Override the default ABM (Adaptive Backlight Management)
> >>>>>>>> level used for DC
> >>>>>>>>      * enabled hardware. Requires DMCU to be supported and loade=
d.
> >>>>>>>> - * Valid levels are 0-4. A value of 0 indicates that ABM should
> >>>>>>>> be disabled by
> >>>>>>>> - * default. Values 1-4 control the maximum allowable brightness
> >>>>>>>> reduction via
> >>>>>>>> - * the ABM algorithm, with 1 being the least reduction and 4
> >>>>>>>> being the most
> >>>>>>>> - * reduction.
> >>>>>>>> + * Valid levels are -2 through 4.
> >>>>>>>>      *
> >>>>>>>> - * Defaults to -1, or disabled. Userspace can only override thi=
s
> >>>>>>>> level after
> >>>>>>>> - * boot if it's set to auto.
> >>>>>>>> + *  -2: indicates that ABM should be controlled by DRM property
> >>>>>>>> 'abm_level.
> >>>>>>>> + *  -1: indicates that ABM should be controlled by the sysfs fi=
le
> >>>>>>>> + *      'panel_power_savings'.
> >>>>>>>> + *   0: indicates that ABM should be disabled.
> >>>>>>>> + * 1-4: control the maximum allowable brightness reduction via
> >>>>>>>> + *      the ABM algorithm, with 1 being the least reduction and
> >>>>>>>> 4 being the most
> >>>>>>>> + *      reduction.
> >>>>>>>> + *
> >>>>>>>> + * Both the DRM property 'abm_level' and the sysfs file
> >>>>>>>> 'panel_power_savings'
> >>>>>>>> + * will only be available on supported hardware configurations.
> >>>>>>>> + *
> >>>>>>>> + * The default value is configured by kernel configuration
> >>>>>>>> option AMDGPU_ABM_POLICY
> >>>>>>>>      */
> >>>>>>>> -int amdgpu_dm_abm_level =3D -1;
> >>>>>>>> +int amdgpu_dm_abm_level =3D CONFIG_AMDGPU_ABM_POLICY;
> >>>>>>>>     MODULE_PARM_DESC(abmlevel,
> >>>>>>>> -         "ABM level (0 =3D off, 1-4 =3D backlight reduction lev=
el,
> >>>>>>>> -1 auto (default))");
> >>>>>>>> +         "ABM level (0 =3D off, 1-4 =3D backlight reduction lev=
el,
> >>>>>>>> -1 =3D sysfs control, -2 =3D drm control");
> >>>>>>>>     module_param_named(abmlevel, amdgpu_dm_abm_level, int, 0444)=
;
> >>>>>>>>     int amdgpu_backlight =3D -1;
> >>>>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>>>>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>>>>>> index b9ac3d2f8029..147fe744f82e 100644
> >>>>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>>>>>> @@ -6515,7 +6515,7 @@ static void
> >>>>>>>> amdgpu_dm_connector_unregister(struct drm_connector *connector)
> >>>>>>>>         struct amdgpu_dm_connector *amdgpu_dm_connector =3D
> >>>>>>>> to_amdgpu_dm_connector(connector);
> >>>>>>>>         if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_=
eDP &&
> >>>>>>>> -        amdgpu_dm_abm_level < 0)
> >>>>>>>> +        amdgpu_dm_abm_level =3D=3D -1)
> >>>>>>>> sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
> >>>>>>>> drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
> >>>>>>>> @@ -6623,7 +6623,7 @@ amdgpu_dm_connector_late_register(struct
> >>>>>>>> drm_connector *connector)
> >>>>>>>>         int r;
> >>>>>>>>         if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_=
eDP &&
> >>>>>>>> -        amdgpu_dm_abm_level < 0) {
> >>>>>>>> +        amdgpu_dm_abm_level =3D=3D -1) {
> >>>>>>>>             r =3D sysfs_create_group(&connector->kdev->kobj,
> >>>>>>>>                            &amdgpu_group);
> >>>>>>>>             if (r)
> >>>>>>>> @@ -7654,7 +7654,7 @@ void amdgpu_dm_connector_init_helper(struc=
t
> >>>>>>>> amdgpu_display_manager *dm,
> >>>>>>>>         if (connector_type =3D=3D DRM_MODE_CONNECTOR_eDP &&
> >>>>>>>>             (dc_is_dmcu_initialized(adev->dm.dc) ||
> >>>>>>>> -         adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level < 0=
) {
> >>>>>>>> +         adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level =3D=
=3D
> >>>>>>>> -2) {
> >>>>>>>> drm_object_attach_property(&aconnector->base.base,
> >>>>>>>> adev->mode_info.abm_level_property, 0);
> >>>>>>>>         }
>
