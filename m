Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A6D783000
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 20:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC23810E141;
	Mon, 21 Aug 2023 18:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DBD10E12A;
 Mon, 21 Aug 2023 18:10:27 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-56cc3453e31so2476154eaf.1; 
 Mon, 21 Aug 2023 11:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692641426; x=1693246226;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O+0c1bNjfyE75s7K3UnnW2WkHRxi8bGxuKvtd+0Q9GI=;
 b=Tb9uEfNphCu8hcDHtBPD8r/V2l/kjy0FGiYp3yigc2F9RDO+UqFEJfEd+UwgTaM4nM
 vMcJ1pLAxK90GKPhZQ8HfTUXeKKi0P1jWo3Dk/nsFLEeJgehyTSqwvsBt02O9aUjZzTJ
 IC6Ra5Yqm0NlentpaxdoP7/rcllhyKVCKRp/y1BFa0yNwk7Mwbd/joA8L3YPwmMdyZzY
 j592z2l24otXgVUGbFS6PBsRLgSsTbgik3hXLlfzmYw5EFwl+efkQypb7LDecufZ5B15
 dsy52dPFJjpspzXqJgR6SF3EPmBmPgGZSGmfwYMh2DnI974Xltl292f12ZuV/JEwFbHW
 5AUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692641426; x=1693246226;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O+0c1bNjfyE75s7K3UnnW2WkHRxi8bGxuKvtd+0Q9GI=;
 b=k/CnA4J8NRwlpAN7sKqVIWIObJjF/a4s5bIr0RH5vw/kCcIX7nto4AUINn2m+U698m
 3tZXDVCqq9ALgcF/BubwCYYU8KFx4faToCmrkVyrYBt5uLtHLHIPsGmbVNmjIEJcWVXl
 2ciLLv0AxBZbVBgIScd3iHnRJXeKPKREwmWCBtYqITn15fprYeeEm2ZethkGekI5n49a
 dl5QQbgcK0R1ad+3bgA1+GsrW9J0I5RJbgJxwCOaIQa3/qh5hq252zDk9+xisK5A34mg
 dWmOzDcVxkgbN9otIysuodo1boirytxDchn5t2PN3pQiopDsdpt82gkZd513JXh/Sdcq
 fUIw==
X-Gm-Message-State: AOJu0YySVH9NlyMfj2jmdWUqT/JO4hb8aYwaXbxD4CQd5OyBCX3Th8pO
 YufDpGHPk1R8pr8V5kjwhDUfkQFgzTQER8mck0Q=
X-Google-Smtp-Source: AGHT+IFhbVjJRJdxdPrJ2yLplShGDmXoxEQ7AAJXyDzbzvmGpIZRWM+xzz1Y2SCaJwO1Vomiz1h/CTfzx4K3L/uFqEw=
X-Received: by 2002:a4a:245a:0:b0:569:ac56:ca98 with SMTP id
 v26-20020a4a245a000000b00569ac56ca98mr7800374oov.3.1692641426484; Mon, 21 Aug
 2023 11:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-3-Arvind.Yadav@amd.com>
 <CADnq5_OBLh=fzsifOEhV3F2F1XGOcCujtVAba3KZ75MkY+tKHg@mail.gmail.com>
 <fff2391b-fc18-af9f-6fe0-7b4c6650dcdd@amd.com>
In-Reply-To: <fff2391b-fc18-af9f-6fe0-7b4c6650dcdd@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 21 Aug 2023 14:10:15 -0400
Message-ID: <CADnq5_PYYy6D__49h6jud9vpbzhnyHh8wossNmzDqryxkcRnqQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drm/amdgpu: Add new function to set GPU power
 profile
To: "Yadav, Arvind" <arvyadav@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, shashank.sharma@amd.com,
 Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 Arvind Yadav <Arvind.Yadav@amd.com>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 21, 2023 at 1:54=E2=80=AFPM Yadav, Arvind <arvyadav@amd.com> wr=
ote:
>
>
> On 8/21/2023 9:52 PM, Alex Deucher wrote:
> > On Mon, Aug 21, 2023 at 2:55=E2=80=AFAM Arvind Yadav <Arvind.Yadav@amd.=
com> wrote:
> >> This patch adds a function which will change the GPU
> >> power profile based on a submitted job. This can optimize
> >> the power performance when the workload is on.
> >>
> >> v2:
> >> - Splitting workload_profile_set and workload_profile_put
> >>    into two separate patches.
> >> - Addressed review comment.
> >>
> >> Cc: Shashank Sharma <shashank.sharma@amd.com>
> >> Cc: Christian Koenig <christian.koenig@amd.com>
> >> Cc: Alex Deucher <alexander.deucher@amd.com>
> >> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 56 +++++++++++++++++=
++
> >>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  3 +
> >>   2 files changed, 59 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_workload.c
> >> index 32166f482f77..e661cc5b3d92 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> >> @@ -24,6 +24,62 @@
> >>
> >>   #include "amdgpu.h"
> >>
> >> +static enum PP_SMC_POWER_PROFILE
> >> +ring_to_power_profile(uint32_t ring_type)
> >> +{
> >> +       switch (ring_type) {
> >> +       case AMDGPU_RING_TYPE_GFX:
> >> +               return PP_SMC_POWER_PROFILE_FULLSCREEN3D;
> >> +       case AMDGPU_RING_TYPE_COMPUTE:
> >> +               return PP_SMC_POWER_PROFILE_COMPUTE;
> >> +       case AMDGPU_RING_TYPE_UVD:
> >> +       case AMDGPU_RING_TYPE_VCE:
> >> +       case AMDGPU_RING_TYPE_UVD_ENC:
> >> +       case AMDGPU_RING_TYPE_VCN_DEC:
> >> +       case AMDGPU_RING_TYPE_VCN_ENC:
> >> +       case AMDGPU_RING_TYPE_VCN_JPEG:
> >> +               return PP_SMC_POWER_PROFILE_VIDEO;
> >> +       default:
> >> +               return PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
> >> +       }
> >> +}
> >> +
> >> +static int
> >> +amdgpu_power_profile_set(struct amdgpu_device *adev,
> >> +                        enum PP_SMC_POWER_PROFILE profile)
> >> +{
> >> +       int ret =3D amdgpu_dpm_switch_power_profile(adev, profile, tru=
e);
> >> +
> >> +       if (!ret) {
> >> +               /* Set the bit for the submitted workload profile */
> >> +               adev->smu_workload.submit_workload_status |=3D (1 << p=
rofile);
> >> +               atomic_inc(&adev->smu_workload.power_profile_ref[profi=
le]);
> >> +       }
> >> +
> >> +       return ret;
> >> +}
> >> +
> >> +void amdgpu_workload_profile_set(struct amdgpu_device *adev,
> >> +                                uint32_t ring_type)
> >> +{
> >> +       struct amdgpu_smu_workload *workload =3D &adev->smu_workload;
> >> +       enum PP_SMC_POWER_PROFILE profile =3D ring_to_power_profile(ri=
ng_type);
> >> +       int ret;
> >> +
> >> +       if (profile =3D=3D PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
> >> +               return;
> > Why is this one skipped?  How do we get back to the boot up profile?
>
> Hi Alex,
>
> enum PP_SMC_POWER_PROFILE {
>      PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT =3D 0x0,
>      PP_SMC_POWER_PROFILE_FULLSCREEN3D =3D 0x1,
>      PP_SMC_POWER_PROFILE_POWERSAVING  =3D 0x2,
>      PP_SMC_POWER_PROFILE_VIDEO        =3D 0x3,
>      PP_SMC_POWER_PROFILE_VR           =3D 0x4,
>      PP_SMC_POWER_PROFILE_COMPUTE      =3D 0x5,
>      PP_SMC_POWER_PROFILE_CUSTOM       =3D 0x6,
>      PP_SMC_POWER_PROFILE_WINDOW3D     =3D 0x7,
>      PP_SMC_POWER_PROFILE_COUNT,
> };
>
> These are all the profiles. We are using which is >
> PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT.
> Now suppose the profile was DEFAULT and we set it to VIDEO, SMU will
> move the profile to a higher level.
> When we reset the VIDEO profile then SMU will move back to the DEFAULT on=
e.
>
> Our job is to set the profile and reset it after the job is done.
> SMU will take care to move to a higher profile and after reset, it will
> move back to DEFAULT.

I guess that is the part I'm missing.  How does the call to the SMU to
set the profile back to DEFAULT actually happen?  It seems that both
the put and get functions return early in this case.

Alex


Alex


>
> ThankYou,
> ~Arvind
>
> >
> > Alex
> >
> >> +
> >> +       mutex_lock(&workload->workload_lock);
> >> +
> >> +       ret =3D amdgpu_power_profile_set(adev, profile);
> >> +       if (ret) {
> >> +               DRM_WARN("Failed to set workload profile to %s, error =
=3D %d\n",
> >> +                        amdgpu_workload_mode_name[profile], ret);
> >> +       }
> >> +
> >> +       mutex_unlock(&workload->workload_lock);
> >> +}
> >> +
> >>   void amdgpu_workload_profile_init(struct amdgpu_device *adev)
> >>   {
> >>          adev->smu_workload.adev =3D adev;
> >> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/g=
pu/drm/amd/include/amdgpu_workload.h
> >> index 5d0f068422d4..5022f28fc2f9 100644
> >> --- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
> >> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
> >> @@ -46,6 +46,9 @@ static const char * const amdgpu_workload_mode_name[=
] =3D {
> >>          "Window3D"
> >>   };
> >>
> >> +void amdgpu_workload_profile_set(struct amdgpu_device *adev,
> >> +                                uint32_t ring_type);
> >> +
> >>   void amdgpu_workload_profile_init(struct amdgpu_device *adev);
> >>
> >>   void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
> >> --
> >> 2.34.1
> >>
