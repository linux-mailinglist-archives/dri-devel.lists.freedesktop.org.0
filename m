Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4133858559
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 19:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705F310EC72;
	Fri, 16 Feb 2024 18:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TyFtznLx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6F310E123;
 Fri, 16 Feb 2024 18:37:56 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1d73066880eso22916005ad.3; 
 Fri, 16 Feb 2024 10:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708108676; x=1708713476; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTOTiA83cEyzgvuAUrqO3QZn2AXxY8Ci4OP2fK3qDG8=;
 b=TyFtznLx3NnXswsblYHFNP/HnzTE1vbCXVKGSudzzB1KOuYdAUGuYwOGjW3G11u0qt
 6P8DF8U1P38/X1d/afQHmf//usw2HW+WgiFOkCM8yP7IVYy4Y3NEa7SKXKeN4Ke7V0sU
 LFqFE01tIeSNRkwWmOUqsNAslZZQy5Ty0f61EA2xXY9D9dMjA5iT5sSFWoXl7ZEa8g3a
 Qa/q9MwuJsxRtxx+xwqoTCmaJk2Kg/pxy9kV4Zncg2bL4gD/4GDFw/owhMdHbS8lMxUs
 s6FrVZAa1TaF9/580moJE2dFhy3GmLAwWZlY+t0NpHzWa3tUqOoYOnZMJ/NyiMjNJ/lG
 hnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708108676; x=1708713476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hTOTiA83cEyzgvuAUrqO3QZn2AXxY8Ci4OP2fK3qDG8=;
 b=VAJiiXe5/X40Mf7i8ByMKtoZaYc8I8UCSvScXN3ghaXGPrF12t4YMc0dXJ3NOlSisl
 HpqjzPtZi/468748EPLo5pvhbxV3qc/CaihEHXyovqqZRsMk7BvIxGjGLo4zS4k6pLK0
 l/ecrwnEtUbS9+3WwRE8sDcZWROtSuXt4CYTXa91NmUH4vy//ls7z7XY4N4KKo11Ol+O
 zQAmrurhEgwjq/zXrA7h0+pTL1dquBTLThUJgT3qsjC7l4iADrWmasSd48tz/8e8Caks
 qEvGbMOoZXaP8fj9+SkLSN6MJG6OJNOCQILxyaYziAVR9aWLkMwIgfpQKs7537vCG5WS
 holQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX03lirP+eVbWlgXJoFbP/7pZZwPbXNO7uCUcq4WNOv/SYhSmFRD+MCEsVtHtimCbGQHBA1f33W/xOVMaGXtLJ7q4AO/vls0czjYLwZvdiMln9IhpdDaiP7m6wykZEAT2srY9LFGviOTjfjezY/RQ==
X-Gm-Message-State: AOJu0YyHXIZe1iJyuO/U1ZjPU6WGa6x7d920kQVwuleKPn39/SfM5YMi
 bvuX/639S6elwyGlgR94eX3pkP2TKsUbayYzG0Y9jN5fa5VsVyntMIv9WEkIlhwtj2lTGzAPc8w
 qPvhjyZVggMJx8nt/x89fxowSJA8=
X-Google-Smtp-Source: AGHT+IGYW++JuTQHjSFv47s+S9WuTXr1L6en1U64g+AlyvHrLKP/pLL6d+qesF+rFStorBQeD/VB8eU0L30G8qQRUK4=
X-Received: by 2002:a17:902:ce01:b0:1db:96d3:3608 with SMTP id
 k1-20020a170902ce0100b001db96d33608mr5737096plg.2.1708108675862; Fri, 16 Feb
 2024 10:37:55 -0800 (PST)
MIME-Version: 1.0
References: <20240216140709.73708-1-mario.limonciello@amd.com>
 <8970de85-3117-4e28-82b4-3b35c5beb7cf@gmail.com>
 <6b9e6f24-8fa5-43c5-88a2-068dfcb9996e@amd.com>
 <e47b859d-eb0c-49f8-8a96-6f454fa18592@gmail.com>
 <20361f26-2c83-4619-8f9e-ec8788b8280f@amd.com>
 <126803c6-177a-4ffd-8b65-856fb83f9972@amd.com>
 <0e10db11-0723-47e8-82ed-94d68e3c5afb@amd.com>
In-Reply-To: <0e10db11-0723-47e8-82ed-94d68e3c5afb@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 Feb 2024 13:37:43 -0500
Message-ID: <CADnq5_NQ9Lx_A2v8mmaEPzct6yYJo9pC6EmUtee=HFrJ8ZnUNw@mail.gmail.com>
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

On Fri, Feb 16, 2024 at 10:42=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 16.02.24 um 16:12 schrieb Mario Limonciello:
> > On 2/16/2024 09:05, Harry Wentland wrote:
> >>
> >>
> >> On 2024-02-16 09:47, Christian K=C3=B6nig wrote:
> >>> Am 16.02.24 um 15:42 schrieb Mario Limonciello:
> >>>> On 2/16/2024 08:38, Christian K=C3=B6nig wrote:
> >>>>> Am 16.02.24 um 15:07 schrieb Mario Limonciello:
> >>>>>> By exporting ABM to sysfs it's possible that DRM master and softwa=
re
> >>>>>> controlling the sysfs file fight over the value programmed for ABM=
.
> >>>>>>
> >>>>>> Adjust the module parameter behavior to control who control ABM:
> >>>>>> -2: DRM
> >>>>>> -1: sysfs (IE via software like power-profiles-daemon)
> >>>>>
> >>>>> Well that sounds extremely awkward. Why should a
> >>>>> power-profiles-deamon has control over the panel power saving
> >>>>> features?
> >>>>>
> >>>>> I mean we are talking about things like reducing backlight level
> >>>>> when the is inactivity, don't we?
> >>>>
> >>>> We're talking about activating the ABM algorithm when the system is
> >>>> in power saving mode; not from inactivity.  This allows the user to
> >>>> squeeze out some extra power "just" in that situation.
> >>>>
> >>>> But given the comments on the other patch, I tend to agree with
> >>>> Harry's proposal instead that we just drop the DRM property
> >>>> entirely as there are no consumers of it.
> >>>
> >>> Yeah, but even then the design to let this be controlled by an
> >>> userspace deamon is questionable. Stuff like that is handled inside
> >>> the kernel and not exposed to userspace usually.
> >>>
> >
> > Regarding the "how" and "why" of PPD; besides this panel power savings
> > sysfs file there are two other things that are nominally changed.
> >
> > ACPI platform profile:
> > https://www.kernel.org/doc/html/latest/userspace-api/sysfs-platform_pro=
file.html
> >
> > AMD-Pstate EPP value:
> > https://www.kernel.org/doc/html//latest/admin-guide/pm/amd-pstate.html
> >
> > When a user goes into "power saving" mode both of those are tweaked.
> > Before we introduced the EPP tweaking in PPD we did discuss a callback
> > within the kernel so that userspace could change "just" the ACPI
> > platform profile and everything else would react.  There was pushback
> > on this, and so instead knobs are offered for things that should be
> > tweaked and the userspace daemon can set up policy for what to do when
> > a a user uses a userspace client (such as GNOME or KDE) to change the
> > desired system profile.
>
> Ok, well who came up with the idea of the userspace deamon? Cause I
> think there will be even more push back on this approach.
>
> Basically when we go from AC to battery (or whatever) the drivers
> usually handle that all inside the kernel today. Involving userspace is
> only done when there is a need for that, e.g. inactivity detection or
> similar.

Well, we don't want policy in the kernel unless it's a platform or
hardware requirement.  Kernel should provide the knobs and then
userspace can set them however they want depending on user preference.

Alex


>
> >>
> >> I think we'll need a bit in our kernel docs describing ABM.
> >> Assumptions around what it is and does seem to lead to confusion.
> >>
> >> The thing is that ABM has a visual impact that not all users like. It
> >> would make sense for users to be able to change the ABM level as
> >> desired, and/or configure their power profiles to select a certain
> >> ABM level.
> >>
> >> ABM will reduce the backlight and compensate by adjusting brightness
> >> and contrast of the image. It has 5 levels: 0, 1, 2, 3, 4. 0 means
> >> off. 4 means maximum backlight reduction. IMO, 1 and 2 look okay. 3
> >> and 4 can be quite impactful, both to power and visual fidelity.
> >>
> >
> > Aside from this patch Hamza did make some improvements to the kdoc in
> > the recent patches, can you read through again and see if you think it
> > still needs improvements?
>
> Well what exactly is the requirement? That we have different ABM
> settings for AC and battery? If yes providing different DRM properties
> would sound like the right approach to me.
>
> Regards,
> Christian.
>
> >
> >> Harry
> >>
> >>> Regards,
> >>> Christian.
> >>>
> >>>>
> >>>>>
> >>>>> Regards,
> >>>>> Christian.
> >>>>>
> >>>>>> 0-4: User via command line
> >>>>>>
> >>>>>> Also introduce a Kconfig option that allows distributions to choos=
e
> >>>>>> the default policy that is appropriate for them.
> >>>>>>
> >>>>>> Fixes: f97e4303da16 ("drm/amd/display: add panel_power_savings
> >>>>>> sysfs entry to eDP connectors")
> >>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >>>>>> ---
> >>>>>> Cc: Hamza Mahfooz <Hamza.Mahfooz@amd.com>
> >>>>>> Cc: Harry Wentland <Harry.Wentland@amd.com>
> >>>>>> Cc: Sun peng (Leo) Li <Sunpeng.Li@amd.com>
> >>>>>>    drivers/gpu/drm/amd/amdgpu/Kconfig            | 72
> >>>>>> +++++++++++++++++++
> >>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 23 +++---
> >>>>>>    .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +-
> >>>>>>    3 files changed, 90 insertions(+), 11 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>> b/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>> index 22d88f8ef527..2ab57ccf6f21 100644
> >>>>>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> >>>>>> @@ -80,6 +80,78 @@ config DRM_AMDGPU_WERROR
> >>>>>>          Add -Werror to the build flags for amdgpu.ko.
> >>>>>>          Only enable this if you are warning code for amdgpu.ko.
> >>>>>> +choice
> >>>>>> +    prompt "Amdgpu panel power Savings"
> >>>>>> +    default AMDGPU_SYSFS_ABM
> >>>>>> +    help
> >>>>>> +        Control the default behavior for adaptive panel power
> >>>>>> savings.
> >>>>>> +
> >>>>>> +        Panel power savings features will sacrifice color accurac=
y
> >>>>>> +        in exchange for power savings.
> >>>>>> +
> >>>>>> +        This can be configured for:
> >>>>>> +        - dynamic control by the DRM master
> >>>>>> +        - dynamic control by sysfs nodes
> >>>>>> +        - statically by the user at kernel compile time
> >>>>>> +
> >>>>>> +        This value can also be overridden by the amdgpu.abmlevel
> >>>>>> +        module parameter.
> >>>>>> +
> >>>>>> +config AMDGPU_DRM_ABM
> >>>>>> +    bool "DRM Master control"
> >>>>>> +    help
> >>>>>> +        Export a property called 'abm_level' that can be
> >>>>>> +        manipulated by the DRM master for supported hardware.
> >>>>>> +
> >>>>>> +config AMDGPU_SYSFS_ABM
> >>>>>> +    bool "sysfs control"
> >>>>>> +    help
> >>>>>> +        Export a sysfs file 'panel_power_savings' that can be
> >>>>>> +        manipulated by userspace for supported hardware.
> >>>>>> +
> >>>>>> +config AMDGPU_HARDCODE_ABM0
> >>>>>> +    bool "No Panel power savings"
> >>>>>> +    help
> >>>>>> +        Disable panel power savings.
> >>>>>> +        It can only overridden by the kernel command line.
> >>>>>> +
> >>>>>> +config AMDGPU_HARDCODE_ABM1
> >>>>>> +    bool "25% Panel power savings"
> >>>>>> +    help
> >>>>>> +        Set the ABM panel power savings algorithm to 25%.
> >>>>>> +        It can only overridden by the kernel command line.
> >>>>>> +
> >>>>>> +config AMDGPU_HARDCODE_ABM2
> >>>>>> +    bool "50% Panel power savings"
> >>>>>> +    help
> >>>>>> +        Set the ABM panel power savings algorithm to 50%.
> >>>>>> +        It can only overridden by the kernel command line.
> >>>>>> +
> >>>>>> +config AMDGPU_HARDCODE_ABM3
> >>>>>> +    bool "75% Panel power savings"
> >>>>>> +    help
> >>>>>> +        Set the ABM panel power savings algorithm to 75%.
> >>>>>> +        It can only overridden by the kernel command line.
> >>>>>> +
> >>>>>> +config AMDGPU_HARDCODE_ABM4
> >>>>>> +    bool "100% Panel power savings"
> >>>>>> +    help
> >>>>>> +        Set the ABM panel power savings algorithm to 100%.
> >>>>>> +        It can only overridden by the kernel command line.
> >>>>>> +endchoice
> >>>>>> +
> >>>>>> +config AMDGPU_ABM_POLICY
> >>>>>> +    int
> >>>>>> +    default -2 if AMDGPU_DRM_ABM
> >>>>>> +    default -1 if AMDGPU_SYSFS_ABM
> >>>>>> +    default 0 if AMDGPU_HARDCODE_ABM0
> >>>>>> +    default 1 if AMDGPU_HARDCODE_ABM1
> >>>>>> +    default 2 if AMDGPU_HARDCODE_ABM2
> >>>>>> +    default 3 if AMDGPU_HARDCODE_ABM3
> >>>>>> +    default 4 if AMDGPU_HARDCODE_ABM4
> >>>>>> +    default -1
> >>>>>> +
> >>>>>> +
> >>>>>>    source "drivers/gpu/drm/amd/acp/Kconfig"
> >>>>>>    source "drivers/gpu/drm/amd/display/Kconfig"
> >>>>>>    source "drivers/gpu/drm/amd/amdkfd/Kconfig"
> >>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>>> index af7fae7907d7..00d6c8b58716 100644
> >>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>>>> @@ -844,17 +844,24 @@ module_param_named(visualconfirm,
> >>>>>> amdgpu_dc_visual_confirm, uint, 0444);
> >>>>>>     * DOC: abmlevel (uint)
> >>>>>>     * Override the default ABM (Adaptive Backlight Management)
> >>>>>> level used for DC
> >>>>>>     * enabled hardware. Requires DMCU to be supported and loaded.
> >>>>>> - * Valid levels are 0-4. A value of 0 indicates that ABM should
> >>>>>> be disabled by
> >>>>>> - * default. Values 1-4 control the maximum allowable brightness
> >>>>>> reduction via
> >>>>>> - * the ABM algorithm, with 1 being the least reduction and 4
> >>>>>> being the most
> >>>>>> - * reduction.
> >>>>>> + * Valid levels are -2 through 4.
> >>>>>>     *
> >>>>>> - * Defaults to -1, or disabled. Userspace can only override this
> >>>>>> level after
> >>>>>> - * boot if it's set to auto.
> >>>>>> + *  -2: indicates that ABM should be controlled by DRM property
> >>>>>> 'abm_level.
> >>>>>> + *  -1: indicates that ABM should be controlled by the sysfs file
> >>>>>> + *      'panel_power_savings'.
> >>>>>> + *   0: indicates that ABM should be disabled.
> >>>>>> + * 1-4: control the maximum allowable brightness reduction via
> >>>>>> + *      the ABM algorithm, with 1 being the least reduction and
> >>>>>> 4 being the most
> >>>>>> + *      reduction.
> >>>>>> + *
> >>>>>> + * Both the DRM property 'abm_level' and the sysfs file
> >>>>>> 'panel_power_savings'
> >>>>>> + * will only be available on supported hardware configurations.
> >>>>>> + *
> >>>>>> + * The default value is configured by kernel configuration
> >>>>>> option AMDGPU_ABM_POLICY
> >>>>>>     */
> >>>>>> -int amdgpu_dm_abm_level =3D -1;
> >>>>>> +int amdgpu_dm_abm_level =3D CONFIG_AMDGPU_ABM_POLICY;
> >>>>>>    MODULE_PARM_DESC(abmlevel,
> >>>>>> -         "ABM level (0 =3D off, 1-4 =3D backlight reduction level=
,
> >>>>>> -1 auto (default))");
> >>>>>> +         "ABM level (0 =3D off, 1-4 =3D backlight reduction level=
,
> >>>>>> -1 =3D sysfs control, -2 =3D drm control");
> >>>>>>    module_param_named(abmlevel, amdgpu_dm_abm_level, int, 0444);
> >>>>>>    int amdgpu_backlight =3D -1;
> >>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>>>> index b9ac3d2f8029..147fe744f82e 100644
> >>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >>>>>> @@ -6515,7 +6515,7 @@ static void
> >>>>>> amdgpu_dm_connector_unregister(struct drm_connector *connector)
> >>>>>>        struct amdgpu_dm_connector *amdgpu_dm_connector =3D
> >>>>>> to_amdgpu_dm_connector(connector);
> >>>>>>        if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP=
 &&
> >>>>>> -        amdgpu_dm_abm_level < 0)
> >>>>>> +        amdgpu_dm_abm_level =3D=3D -1)
> >>>>>> sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
> >>>>>> drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
> >>>>>> @@ -6623,7 +6623,7 @@ amdgpu_dm_connector_late_register(struct
> >>>>>> drm_connector *connector)
> >>>>>>        int r;
> >>>>>>        if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP=
 &&
> >>>>>> -        amdgpu_dm_abm_level < 0) {
> >>>>>> +        amdgpu_dm_abm_level =3D=3D -1) {
> >>>>>>            r =3D sysfs_create_group(&connector->kdev->kobj,
> >>>>>>                           &amdgpu_group);
> >>>>>>            if (r)
> >>>>>> @@ -7654,7 +7654,7 @@ void amdgpu_dm_connector_init_helper(struct
> >>>>>> amdgpu_display_manager *dm,
> >>>>>>        if (connector_type =3D=3D DRM_MODE_CONNECTOR_eDP &&
> >>>>>>            (dc_is_dmcu_initialized(adev->dm.dc) ||
> >>>>>> -         adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level < 0) =
{
> >>>>>> +         adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level =3D=
=3D
> >>>>>> -2) {
> >>>>>> drm_object_attach_property(&aconnector->base.base,
> >>>>>> adev->mode_info.abm_level_property, 0);
> >>>>>>        }
> >>>>>
> >>>>
> >>>
> >>
> >
>
