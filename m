Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4EB4096C9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 17:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9FE6E0F0;
	Mon, 13 Sep 2021 15:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712586E0F0;
 Mon, 13 Sep 2021 15:11:05 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 g66-20020a9d12c8000000b0051aeba607f1so13725459otg.11; 
 Mon, 13 Sep 2021 08:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N0Efpcf4JoVlqDCutnrfG+qFPXMrV30JaV23oOR02TQ=;
 b=NXP4C+PD7SIGNo51PZLwUfegsmrH8txs0WYvgFII9wbgC6g4fI/O0qwMM9S+y5l7dJ
 3ZxXoZy8/c6F9gjKDwC3HrGubwgiqvkv30lhubp+8yY3mKlnJ+WR/Myd8Z0K1UZ/bM54
 bOU7hBSS2etTjjMsQ2UonDQIC1uo+7ppqmkgVid1Ai0WOHK60DjdFXHkMjtz11a5+M+s
 D0QKEddZjIoV9im5g4ATCM4GI/b1oZ0jZSCDmYGpehtt0Btp1MSfP6liXBRzOoxSrHNe
 J0Iou3kmVcveg5Xi0ooPLQ3WPDWP7n2S5+IFYTxYfXYH0LWnzaYFcX4HVs9XGMkl9I7g
 H7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N0Efpcf4JoVlqDCutnrfG+qFPXMrV30JaV23oOR02TQ=;
 b=EJcZkFPhrbNc8zyYkbXDELnrMtLnCtzAKe2Nu0DAQ7zJA4FjmMX0AyDvNlZRoqhrB2
 0ABa6TKtf6KDL9Z7TyfdbKfPrCzE8QBZIFYT5dwUKDR331ZZSWPtCYOtNV+N5bJABlWb
 Z+j8UhhP7eNbKHJdWViIkzKy5v0RvejHgh7vyL3HCZSXVonPK0W0SO9w1B3AyXi9oxG5
 1UC7YquU3it2DRtDQZZP+99O7Xab6ly97bRUJfpM+mzQazYiucsopkdBFTAYTiqPOrKR
 NqVFYCPlKLndbXifOxu1zJrZ0/pxl4YaktZFUSoP2WK5PXsOQLoJMX+OMBvpjAY1UKKp
 VeCA==
X-Gm-Message-State: AOAM532EKxUH885NN54CNOcLsXvyjAhZX+NKqkxkAB+OPRTJgIGC9kDb
 ecqA2LucB5A6iN+w4wt33lexg/M6832jwuY2ejQ=
X-Google-Smtp-Source: ABdhPJzaBaAFfvhD+/V5c+LIpdQQ7K6i2p3IzuukHqWPgkqC3OOSvJx19F8eUs2GBFMRTSX6uOz797nX45GBUdG5zcc=
X-Received: by 2002:a05:6830:214c:: with SMTP id
 r12mr10263287otd.200.1631545864487; 
 Mon, 13 Sep 2021 08:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210907085301.482579-1-daniel@qtec.com>
 <CADnq5_N3ue6c6XzX+Nu=adsfhCZ6jkUVwNvQqy-Z_TjjGgsPmA@mail.gmail.com>
 <CAH1Ww+QXyoE-YvCZhG3PQ0n43E0R8ydt=GMb08xYF3YqV8o5UQ@mail.gmail.com>
In-Reply-To: <CAH1Ww+QXyoE-YvCZhG3PQ0n43E0R8ydt=GMb08xYF3YqV8o5UQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Sep 2021 11:10:53 -0400
Message-ID: <CADnq5_PDjTNjZLrkdnpQVNzivXhLRQp7RqB_kzMNUYY-Z+Qdfw@mail.gmail.com>
Subject: Re: [RFC][PATCH] drm/amdgpu/powerplay/smu10: Add custom profile
To: Daniel Gomez <daniel@qtec.com>, Huang Rui <ray.huang@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>, changzhu <Changfeng.Zhu@amd.com>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Gomez <dagmcr@gmail.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, 
 xinhui pan <Xinhui.Pan@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 8, 2021 at 3:23 AM Daniel Gomez <daniel@qtec.com> wrote:
>
> On Tue, 7 Sept 2021 at 19:23, Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Tue, Sep 7, 2021 at 4:53 AM Daniel Gomez <daniel@qtec.com> wrote:
> > >
> > > Add custom power profile mode support on smu10.
> > > Update workload bit list.
> > > ---
> > >
> > > Hi,
> > >
> > > I'm trying to add custom profile for the Raven Ridge but not sure if
> > > I'd need a different parameter than PPSMC_MSG_SetCustomPolicy to
> > > configure the custom values. The code seemed to support CUSTOM for
> > > workload types but it didn't show up in the menu or accept any user
> > > input parameter. So far, I've added that part but a bit confusing to
> > > me what is the policy I need for setting these parameters or if it's
> > > maybe not possible at all.
> > >
> > > After applying the changes I'd configure the CUSTOM mode as follows:
> > >
> > > echo manual > /sys/class/drm/card0/device/hwmon/hwmon1/device/power_dpm_force_performance_level
> > > echo "6 70 90 0 0" > /sys/class/drm/card0/device/hwmon/hwmon1/device/pp_power_profile_mode
> > >
> > > Then, using Darren Powell script for testing modes I get the following
> > > output:
> > >
> > > 05:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Raven Ridge [Radeon Vega Series / Radeon Vega Mobile Series] [1002:15dd] (rev 83)
> > > === pp_dpm_sclk ===
> > > 0: 200Mhz
> > > 1: 400Mhz *
> > > 2: 1100Mhz
> > > === pp_dpm_mclk ===
> > > 0: 400Mhz
> > > 1: 933Mhz *
> > > 2: 1067Mhz
> > > 3: 1200Mhz
> > > === pp_power_profile_mode ===
> > > NUM        MODE_NAME BUSY_SET_POINT FPS USE_RLC_BUSY MIN_ACTIVE_LEVEL
> > >   0 BOOTUP_DEFAULT :             70  60          0              0
> > >   1 3D_FULL_SCREEN :             70  60          1              3
> > >   2   POWER_SAVING :             90  60          0              0
> > >   3          VIDEO :             70  60          0              0
> > >   4             VR :             70  90          0              0
> > >   5        COMPUTE :             30  60          0              6
> > >   6         CUSTOM*:             70  90          0              0
> > >
> > > As you can also see in my changes, I've also updated the workload bit
> > > table but I'm not completely sure about that change. With the tests
> > > I've done, using bit 5 for the WORKLOAD_PPLIB_CUSTOM_BIT makes the
> > > gpu sclk locked around ~36%. So, maybe I'm missing a clock limit
> > > configuraton table somewhere. Would you give me some hints to
> > > proceed with this?
> >
> > I don't think APUs support customizing the workloads the same way
> > dGPUs do.  I think they just support predefined profiles.
> >
> > Alex
>
>
> Thanks Alex for the quick response. Would it make sense then to remove
> the custom workload code (PP_SMC_POWER_PROFILE_CUSTOM) from the smu10?
> That workload was added in this commit:
> f6f75ebdc06c04d3cfcd100f1b10256a9cdca407 [1] and not use at all in the
> code as it's limited to PP_SMC_POWER_PROFILE_COMPUTE index. The
> smu10.h also includes the custom workload bit definition and that was
> a bit confusing for me to understand if it was half-supported or not
> possible to use at all as I understood from your comment.
>
> Perhaps could also be mentioned (if that's kind of standard) in the
> documentation[2] so, the custom pp_power_profile_mode is only
> supported in dGPUs.
>
> I can send the patches if it makes sense.

I guess I was thinking of another asic.  @Huang Rui, @changzhu, @Quan,
Evan can any of you comment on what is required for custom profiles on
APUs?

Alex


>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c?id=f6f75ebdc06c04d3cfcd100f1b10256a9cdca407
> [2]: https://www.kernel.org/doc/html/latest/gpu/amdgpu.html#pp-power-profile-mode
>
> Daniel
>
> >
> >
> > >
> > > Thanks in advance,
> > > Daniel
> > >
> > >
> > >  drivers/gpu/drm/amd/pm/inc/smu10.h            | 14 +++--
> > >  .../drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c  | 57 +++++++++++++++++--
> > >  .../drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h  |  1 +
> > >  3 files changed, 61 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/pm/inc/smu10.h b/drivers/gpu/drm/amd/pm/inc/smu10.h
> > > index 9e837a5014c5..b96520528240 100644
> > > --- a/drivers/gpu/drm/amd/pm/inc/smu10.h
> > > +++ b/drivers/gpu/drm/amd/pm/inc/smu10.h
> > > @@ -136,12 +136,14 @@
> > >  #define FEATURE_CORE_CSTATES_MASK     (1 << FEATURE_CORE_CSTATES_BIT)
> > >
> > >  /* Workload bits */
> > > -#define WORKLOAD_PPLIB_FULL_SCREEN_3D_BIT 0
> > > -#define WORKLOAD_PPLIB_VIDEO_BIT          2
> > > -#define WORKLOAD_PPLIB_VR_BIT             3
> > > -#define WORKLOAD_PPLIB_COMPUTE_BIT        4
> > > -#define WORKLOAD_PPLIB_CUSTOM_BIT         5
> > > -#define WORKLOAD_PPLIB_COUNT              6
> > > +#define WORKLOAD_DEFAULT_BIT              0
> > > +#define WORKLOAD_PPLIB_FULL_SCREEN_3D_BIT 1
> > > +#define WORKLOAD_PPLIB_POWER_SAVING_BIT   2
> > > +#define WORKLOAD_PPLIB_VIDEO_BIT          3
> > > +#define WORKLOAD_PPLIB_VR_BIT             4
> > > +#define WORKLOAD_PPLIB_COMPUTE_BIT        5
> > > +#define WORKLOAD_PPLIB_CUSTOM_BIT         6
> > > +#define WORKLOAD_PPLIB_COUNT              7
> > >
> > >  typedef struct {
> > >         /* MP1_EXT_SCRATCH0 */
> > > diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
> > > index 1de3ae77e03e..fef9f9ac1c56 100644
> > > --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
> > > +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
> > > @@ -110,6 +110,11 @@ static int smu10_initialize_dpm_defaults(struct pp_hwmgr *hwmgr)
> > >         smu10_data->num_active_display = 0;
> > >         smu10_data->deep_sleep_dcefclk = 0;
> > >
> > > +       smu10_data->custom_profile_mode[0] = 0;
> > > +       smu10_data->custom_profile_mode[1] = 0;
> > > +       smu10_data->custom_profile_mode[2] = 0;
> > > +       smu10_data->custom_profile_mode[3] = 0;
> > > +
> > >         phm_cap_unset(hwmgr->platform_descriptor.platformCaps,
> > >                                         PHM_PlatformCaps_SclkDeepSleep);
> > >
> > > @@ -544,6 +549,10 @@ static int smu10_hwmgr_backend_init(struct pp_hwmgr *hwmgr)
> > >
> > >         hwmgr->backend = data;
> > >
> > > +       hwmgr->workload_mask = 1 << hwmgr->workload_prority[PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT];
> > > +       hwmgr->power_profile_mode = PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
> > > +       hwmgr->default_power_profile_mode = PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
> > > +
> > >         result = smu10_initialize_dpm_defaults(hwmgr);
> > >         if (result != 0) {
> > >                 pr_err("smu10_initialize_dpm_defaults failed\n");
> > > @@ -1408,9 +1417,15 @@ static int conv_power_profile_to_pplib_workload(int power_profile)
> > >         int pplib_workload = 0;
> > >
> > >         switch (power_profile) {
> > > +       case PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT:
> > > +               pplib_workload = WORKLOAD_DEFAULT_BIT;
> > > +               break;
> > >         case PP_SMC_POWER_PROFILE_FULLSCREEN3D:
> > >                 pplib_workload = WORKLOAD_PPLIB_FULL_SCREEN_3D_BIT;
> > >                 break;
> > > +       case PP_SMC_POWER_PROFILE_POWERSAVING:
> > > +               pplib_workload = WORKLOAD_PPLIB_POWER_SAVING_BIT;
> > > +               break;
> > >         case PP_SMC_POWER_PROFILE_VIDEO:
> > >                 pplib_workload = WORKLOAD_PPLIB_VIDEO_BIT;
> > >                 break;
> > > @@ -1430,22 +1445,24 @@ static int conv_power_profile_to_pplib_workload(int power_profile)
> > >
> > >  static int smu10_get_power_profile_mode(struct pp_hwmgr *hwmgr, char *buf)
> > >  {
> > > +       struct smu10_hwmgr *smu10_data = (struct smu10_hwmgr *)(hwmgr->backend);
> > >         uint32_t i, size = 0;
> > >         static const uint8_t
> > > -               profile_mode_setting[6][4] = {{70, 60, 0, 0,},
> > > +               profile_mode_setting[7][4] = {{70, 60, 0, 0,},
> > >                                                 {70, 60, 1, 3,},
> > >                                                 {90, 60, 0, 0,},
> > >                                                 {70, 60, 0, 0,},
> > >                                                 {70, 90, 0, 0,},
> > >                                                 {30, 60, 0, 6,},
> > >                                                 };
> > > -       static const char *profile_name[6] = {
> > > +       static const char *profile_name[7] = {
> > >                                         "BOOTUP_DEFAULT",
> > >                                         "3D_FULL_SCREEN",
> > >                                         "POWER_SAVING",
> > >                                         "VIDEO",
> > >                                         "VR",
> > > -                                       "COMPUTE"};
> > > +                                       "COMPUTE",
> > > +                                       "CUSTOM"};
> > >         static const char *title[6] = {"NUM",
> > >                         "MODE_NAME",
> > >                         "BUSY_SET_POINT",
> > > @@ -1459,11 +1476,15 @@ static int smu10_get_power_profile_mode(struct pp_hwmgr *hwmgr, char *buf)
> > >         size += sysfs_emit_at(buf, size, "%s %16s %s %s %s %s\n",title[0],
> > >                         title[1], title[2], title[3], title[4], title[5]);
> > >
> > > -       for (i = 0; i <= PP_SMC_POWER_PROFILE_COMPUTE; i++)
> > > +       for (i = 0; i < PP_SMC_POWER_PROFILE_CUSTOM; i++)
> > >                 size += sysfs_emit_at(buf, size, "%3d %14s%s: %14d %3d %10d %14d\n",
> > >                         i, profile_name[i], (i == hwmgr->power_profile_mode) ? "*" : " ",
> > >                         profile_mode_setting[i][0], profile_mode_setting[i][1],
> > >                         profile_mode_setting[i][2], profile_mode_setting[i][3]);
> > > +       size += sysfs_emit_at(buf, size, "%3d %14s%s: %14d %3d %10d %14d\n", i,
> > > +                       profile_name[i], (i == hwmgr->power_profile_mode) ? "*" : " ",
> > > +                       smu10_data->custom_profile_mode[0], smu10_data->custom_profile_mode[1],
> > > +                       smu10_data->custom_profile_mode[2], smu10_data->custom_profile_mode[3]);
> > >
> > >         return size;
> > >  }
> > > @@ -1480,16 +1501,42 @@ static bool smu10_is_raven1_refresh(struct pp_hwmgr *hwmgr)
> > >
> > >  static int smu10_set_power_profile_mode(struct pp_hwmgr *hwmgr, long *input, uint32_t size)
> > >  {
> > > +       struct smu10_hwmgr *smu10_data = (struct smu10_hwmgr *)(hwmgr->backend);
> > > +       uint8_t busy_set_point, FPS, use_rlc_busy, min_active_level;
> > > +       uint32_t power_profile_mode = input[size];
> > >         int workload_type = 0;
> > >         int result = 0;
> > >
> > > -       if (input[size] > PP_SMC_POWER_PROFILE_COMPUTE) {
> > > +       if (input[size] > PP_SMC_POWER_PROFILE_CUSTOM) {
> > >                 pr_err("Invalid power profile mode %ld\n", input[size]);
> > >                 return -EINVAL;
> > >         }
> > >         if (hwmgr->power_profile_mode == input[size])
> > >                 return 0;
> > >
> > > +       if (power_profile_mode == PP_SMC_POWER_PROFILE_CUSTOM) {
> > > +               if (size != 0 && size != 4)
> > > +                       return -EINVAL;
> > > +
> > > +               if (size == 0) {
> > > +                       if (smu10_data->custom_profile_mode[0] != 0)
> > > +                               goto out;
> > > +                       else
> > > +                               return -EINVAL;
> > > +               }
> > > +
> > > +               smu10_data->custom_profile_mode[0] = busy_set_point = input[0];
> > > +               smu10_data->custom_profile_mode[1] = FPS = input[1];
> > > +               smu10_data->custom_profile_mode[2] = use_rlc_busy = input[2];
> > > +               smu10_data->custom_profile_mode[3] = min_active_level = input[3];
> > > +               smum_send_msg_to_smc_with_parameter(hwmgr,
> > > +                                       PPSMC_MSG_SetCustomPolicy,
> > > +                                       busy_set_point | FPS<<8 |
> > > +                                       use_rlc_busy << 16 | min_active_level<<24,
> > > +                                       NULL);
> > > +       }
> > > +
> > > +out:
> > >         /* conv PP_SMC_POWER_PROFILE* to WORKLOAD_PPLIB_*_BIT */
> > >         workload_type =
> > >                 conv_power_profile_to_pplib_workload(input[size]);
> > > diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> > > index 808e0ecbe1f0..4c4b2b1b510a 100644
> > > --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> > > +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> > > @@ -302,6 +302,7 @@ struct smu10_hwmgr {
> > >         uint32_t                             num_active_display;
> > >
> > >         bool                                                    fine_grain_enabled;
> > > +       uint8_t                              custom_profile_mode[4];
> > >  };
> > >
> > >  struct pp_hwmgr;
> > > --
> > > 2.30.2
> > >
