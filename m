Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF7CA90744
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 17:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE48310E962;
	Wed, 16 Apr 2025 15:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hxcVJEuw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E4310E95C;
 Wed, 16 Apr 2025 15:04:17 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-3032a9c7cfeso1245242a91.1; 
 Wed, 16 Apr 2025 08:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744815857; x=1745420657; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MVFtqQNk5rkPP5VSi8xT3sOzTBsKiZnfpOajhh4Y93U=;
 b=hxcVJEuwJtomkqwKP8W9lD419VAebfUZGGeAGK28lCIP4ropcCIc3y5hfCplt0QApE
 x2MW4eb3ny00xsOhcqtTZSsIsSNUtcTv33NOq/pQiH/oS+UArm6fKj1cw9OPzuqpC4FU
 CGei7YYqbSXTj2xWPeCaTFY7NUNGZe7DkWvHXuY2d/3bnKwsuh4dJL42NCU8RI/Ok+Hj
 n9DMnfU+btEntM95ygBFeybrcMPP/+qX/nM5W5AnispCzcwumY9SOINgGzxi3JJ0r1rX
 XeH7hyuYISXK5x3yr/0W4lzRniykUT4pLYcFrEpQz9VsYPUrWjaX885ZxV0mZy4lLltN
 0/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744815857; x=1745420657;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MVFtqQNk5rkPP5VSi8xT3sOzTBsKiZnfpOajhh4Y93U=;
 b=waXMQcl0DobBA8Qysq1RpIQzqk+ozkZxMpevSYeweTLxgsKx4depJPRDXkoNprl62M
 QaNm4gUsUpwThVL+tMPeLc/RaneMZw7f0QeDzOsBhPmD5CiRCf+w198v/e3S5AkLaFnu
 ZgVxU40H6QWUDamo85SE4QT/WhswTxGSRAJFl0cOBV/urXfY3mce73rIpOeBLh4sZrpa
 D8AbHWdShe4HGPIIRvaabOBYvXw/m5LAz29vGlxY8orG3itvRguj3mf6Y/ma3ruD28hF
 OYBqNQ+/jgmoCXCtPrfa5PhEPJ6YnMaxBy4iErjOBcHwQKue8eTySgwPJ1i8vOgH8Rw3
 o7SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUHOdNyxSLeN7mlEqOdRWfhr4nZspwzbgRXRWYFSSZbTvKgBKqqBjMgvqYq1tJI81UWb958VJo@lists.freedesktop.org,
 AJvYcCWW+2UYPmuLl3yjeKAAUUWuPuy+ucILGBGUpWg0O1Bp8pd/WqFnAqBEvGV7moIzS21oLXAcW5E94U9i@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWseQyD53pmHMVTOiPvZ9qemz3AAmO7wFj1eOVNi64le7XFIyk
 rKU9be1UEVyXHTZfSQ43Bb5vSgfJjI83WgIcnlsJXhM51ddw/rPr9geEAa29FXQoaWr6FE6UUu7
 ic48w3R3gp+E6cwN/nNMrJ0rOJSk=
X-Gm-Gg: ASbGncscfpq8KcSigjIyTGKcF8zGEVEdiqfJnMEy/mjFY9E2jxxjK6cx8+nNdnXcB96
 meTRBapMeV4LyNc3f9dcpiOXQORzrFPW6ykPsdAVc5s5+jGj4+8Gh/d+l5DCFUsWQaHfhLfk/jx
 n6pfUfAhVmk7JAECy5A/pRA1PAi8ZVPcMj
X-Google-Smtp-Source: AGHT+IGyfxnt/aNFxXm8FZac7BhXF4m820MtTk5Qy0SGVUawuMIbjEGblrp/5GK7oCsMVC9lWrRKZepGO5Ypf/O3GMc=
X-Received: by 2002:a17:90b:384c:b0:306:b6ae:4d7a with SMTP id
 98e67ed59e1d1-30864165e44mr1146372a91.3.1744815856672; Wed, 16 Apr 2025
 08:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <Z678TNhCbTk363Tw@kspp>
 <864c7dd5-0deb-4adb-a1cf-c8a809514d7e@embeddedor.com>
 <217b00f5-d03d-4624-9ba9-d838199ef7b9@embeddedor.com>
In-Reply-To: <217b00f5-d03d-4624-9ba9-d838199ef7b9@embeddedor.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Apr 2025 11:04:04 -0400
X-Gm-Features: ATxdqUGn4UAwWKO9rc3w4V2DzzsBrEKuE_v_1b78ZJI7oY5ijYXBcUz8pBjEKwc
Message-ID: <CADnq5_M5Jv4A5CXAKY2Qd-dhrfmecnauRtVY_ghSsut7i=KNww@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/pm: Avoid multiple
 -Wflex-array-member-not-at-end warnings
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kenneth Feng <kenneth.feng@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kees Cook <keescook@chromium.org>
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

Can you resend, I can't seem to find the original emails.
Additionally, all of the NISLANDS structures are unused in amdgpu, so
those could be removed.

Alex
On Wed, Apr 16, 2025 at 12:48=E2=80=AFAM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> Hi all,
>
> Friendly ping (second one): who can take this patch, please? =F0=9F=99=82
>
> Thanks!
> -Gustavo
>
> On 11/03/25 02:10, Gustavo A. R. Silva wrote:
> > Hi all,
> >
> > Friendly ping: who can take this, please? :)
> >
> > Thanks!
> > --
> > Gustavo
> >
> > On 14/02/25 18:48, Gustavo A. R. Silva wrote:
> >> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> >> getting ready to enable it, globally.
> >>
> >> So, in order to avoid ending up with a flexible-array member in the
> >> middle of other structs, we use the `struct_group_tagged()` helper
> >> to create a new tagged `struct NISLANDS_SMC_SWSTATE_HDR` (and `struct
> >> SISLANDS_SMC_SWSTATE_HDR`). This structures group together all the
> >> members of the flexible `struct NISLANDS_SMC_SWSTATE` (and `struct
> >> SISLANDS_SMC_SWSTATE`) except the flexible array.
> >>
> >> As a result, the array is effectively separated from the rest of the
> >> members without modifying the memory layout of the flexible structure.
> >> We then change the type of the middle struct members currently causing
> >> trouble from `struct NISLANDS_SMC_SWSTATE` to `struct
> >> NISLANDS_SMC_SWSTATE_HDR` (and from `struct SISLANDS_SMC_SWSTATE` to
> >> `struct SISLANDS_SMC_SWSTATE_HDR`).
> >>
> >> We also want to ensure that when new members need to be added to the
> >> flexible structure, they are always included within the newly created
> >> tagged struct. For this, we use `static_assert()`. This ensures that
> >> the memory layout for both the flexible structure and the new tagged
> >> struct is the same after any changes.
> >>
> >> This approach avoids having to implement `struct NISLANDS_SMC_SWSTATE_=
HDR`
> >> (and `struct SISLANDS_SMC_SWSTATE_HDR`) as a completely separate struc=
ture,
> >> thus preventing having to maintain two independent but basically ident=
ical
> >> structures, closing the door to potential bugs in the future.
> >>
> >> We also use `container_of()` whenever we need to retrieve a pointer to
> >> the flexible structure, through which we can access the flexible-array
> >> member, if necessary.
> >>
> >> So, with this changes, fix the following warnings:
> >>
> >> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/sislands_smc.h:218:49: war=
ning: structure containing a flexible array member is not at the end of ano=
ther
> >> structure [-Wflex-array-member-not-at-end]
> >> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.h:819:41: warning: =
structure containing a flexible array member is not at the end of another s=
tructure [-
> >> Wflex-array-member-not-at-end]
> >> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.h:818:41: warning: =
structure containing a flexible array member is not at the end of another s=
tructure [-
> >> Wflex-array-member-not-at-end]
> >> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.h:817:41: warning: =
structure containing a flexible array member is not at the end of another s=
tructure [-
> >> Wflex-array-member-not-at-end]
> >> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.h:816:41: warning: =
structure containing a flexible array member is not at the end of another s=
tructure [-
> >> Wflex-array-member-not-at-end]
> >>
> >> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> >> ---
> >>   drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c    |  7 ++++--
> >>   drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.h    | 23 +++++++++++------=
--
> >>   .../gpu/drm/amd/pm/legacy-dpm/sislands_smc.h  | 15 ++++++++----
> >>   3 files changed, 29 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/=
drm/amd/pm/legacy-dpm/si_dpm.c
> >> index a87dcf0974bc..2c9d473d122f 100644
> >> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> >> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> >> @@ -5234,7 +5234,8 @@ static int si_init_smc_table(struct amdgpu_devic=
e *adev)
> >>       table->driverState.flags =3D table->initialState.flags;
> >>       table->driverState.levelCount =3D table->initialState.levelCount=
;
> >> -    table->driverState.levels[0] =3D table->initialState.level;
> >> +    container_of(&table->driverState, SISLANDS_SMC_SWSTATE, __hdr)->l=
evels[0] =3D
> >> +                                table->initialState.level;
> >>       ret =3D si_do_program_memory_timing_parameters(adev, amdgpu_boot=
_state,
> >>                                SISLANDS_INITIAL_STATE_ARB_INDEX);
> >> @@ -5755,7 +5756,9 @@ static int si_upload_sw_state(struct amdgpu_devi=
ce *adev,
> >>       int ret;
> >>       u32 address =3D si_pi->state_table_start +
> >>           offsetof(SISLANDS_SMC_STATETABLE, driverState);
> >> -    SISLANDS_SMC_SWSTATE *smc_state =3D &si_pi->smc_statetable.driver=
State;
> >> +    SISLANDS_SMC_SWSTATE *smc_state =3D
> >> +        container_of(&si_pi->smc_statetable.driverState,
> >> +                 SISLANDS_SMC_SWSTATE, __hdr);
> >>       size_t state_size =3D struct_size(smc_state, levels,
> >>                       new_state->performance_level_count);
> >>       memset(smc_state, 0, state_size);
> >> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.h b/drivers/gpu/=
drm/amd/pm/legacy-dpm/si_dpm.h
> >> index 11cb7874a6bb..62530f89ebdf 100644
> >> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.h
> >> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.h
> >> @@ -784,12 +784,17 @@ typedef struct NISLANDS_SMC_HW_PERFORMANCE_LEVEL=
 NISLANDS_SMC_HW_PERFORMANCE_LEV
> >>   struct NISLANDS_SMC_SWSTATE
> >>   {
> >> -    uint8_t                             flags;
> >> -    uint8_t                             levelCount;
> >> -    uint8_t                             padding2;
> >> -    uint8_t                             padding3;
> >> -    NISLANDS_SMC_HW_PERFORMANCE_LEVEL   levels[];
> >> +    /* New members MUST be added within the struct_group() macro belo=
w. */
> >> +    struct_group_tagged(NISLANDS_SMC_SWSTATE_HDR, __hdr,
> >> +        uint8_t                             flags;
> >> +        uint8_t                             levelCount;
> >> +        uint8_t                             padding2;
> >> +        uint8_t                             padding3;
> >> +    );
> >> +    NISLANDS_SMC_HW_PERFORMANCE_LEVEL   levels[];
> >>   };
> >> +static_assert(offsetof(struct NISLANDS_SMC_SWSTATE, levels) =3D=3D si=
zeof(struct NISLANDS_SMC_SWSTATE_HDR),
> >> +          "struct member likely outside of struct_group_tagged()");
> >>   typedef struct NISLANDS_SMC_SWSTATE NISLANDS_SMC_SWSTATE;
> >> @@ -813,10 +818,10 @@ struct NISLANDS_SMC_STATETABLE
> >>       uint32_t                            lowSMIO[NISLANDS_MAX_NO_VREG=
_STEPS];
> >>       NISLANDS_SMC_VOLTAGEMASKTABLE       voltageMaskTable;
> >>       PP_NIslands_DPM2Parameters          dpm2Params;
> >> -    NISLANDS_SMC_SWSTATE                initialState;
> >> -    NISLANDS_SMC_SWSTATE                ACPIState;
> >> -    NISLANDS_SMC_SWSTATE                ULVState;
> >> -    NISLANDS_SMC_SWSTATE                driverState;
> >> +    struct NISLANDS_SMC_SWSTATE_HDR        initialState;
> >> +    struct NISLANDS_SMC_SWSTATE_HDR        ACPIState;
> >> +    struct NISLANDS_SMC_SWSTATE_HDR        ULVState;
> >> +    struct NISLANDS_SMC_SWSTATE_HDR        driverState;
> >>       NISLANDS_SMC_HW_PERFORMANCE_LEVEL   dpmLevels[NISLANDS_MAX_SMC_P=
ERFORMANCE_LEVELS_PER_SWSTATE - 1];
> >>   };
> >> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/sislands_smc.h b/driver=
s/gpu/drm/amd/pm/legacy-dpm/sislands_smc.h
> >> index 90ec411c5029..1711e3e35e80 100644
> >> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/sislands_smc.h
> >> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/sislands_smc.h
> >> @@ -172,12 +172,17 @@ struct SISLANDS_SMC_HW_PERFORMANCE_LEVEL {
> >>   typedef struct SISLANDS_SMC_HW_PERFORMANCE_LEVEL SISLANDS_SMC_HW_PER=
FORMANCE_LEVEL;
> >>   struct SISLANDS_SMC_SWSTATE {
> >> -    uint8_t                             flags;
> >> -    uint8_t                             levelCount;
> >> -    uint8_t                             padding2;
> >> -    uint8_t                             padding3;
> >> +    /* New members MUST be added within the struct_group() macro belo=
w. */
> >> +    struct_group_tagged(SISLANDS_SMC_SWSTATE_HDR, __hdr,
> >> +        uint8_t                             flags;
> >> +        uint8_t                             levelCount;
> >> +        uint8_t                             padding2;
> >> +        uint8_t                             padding3;
> >> +    );
> >>       SISLANDS_SMC_HW_PERFORMANCE_LEVEL   levels[];
> >>   };
> >> +static_assert(offsetof(struct SISLANDS_SMC_SWSTATE, levels) =3D=3D si=
zeof(struct SISLANDS_SMC_SWSTATE_HDR),
> >> +          "struct member likely outside of struct_group_tagged()");
> >>   typedef struct SISLANDS_SMC_SWSTATE SISLANDS_SMC_SWSTATE;
> >> @@ -215,7 +220,7 @@ struct SISLANDS_SMC_STATETABLE {
> >>       struct SISLANDS_SMC_SWSTATE_SINGLE    initialState;
> >>       struct SISLANDS_SMC_SWSTATE_SINGLE    ACPIState;
> >>       struct SISLANDS_SMC_SWSTATE_SINGLE    ULVState;
> >> -    SISLANDS_SMC_SWSTATE            driverState;
> >> +    struct SISLANDS_SMC_SWSTATE_HDR        driverState;
> >>       SISLANDS_SMC_HW_PERFORMANCE_LEVEL    dpmLevels[SISLANDS_MAX_SMC_=
PERFORMANCE_LEVELS_PER_SWSTATE];
> >>   };
> >
>
