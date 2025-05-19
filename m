Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A021ABC16D
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 16:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEA410E3AC;
	Mon, 19 May 2025 14:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MgIj2IpP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AA610E3AC;
 Mon, 19 May 2025 14:58:11 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-22e19c71070so7547275ad.3; 
 Mon, 19 May 2025 07:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747666691; x=1748271491; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z5gdvpRaAaLM19UVx/GrdVW5vV6MuRm9rJTVLs3u7oM=;
 b=MgIj2IpPNrGzne3IWc12R2CT58GTVSB4BIOd6N5e6x+Sf5WpayaQtvLNCiMUGG0O5U
 zBkDHxUexj3be0DkT8OGLei7cDAnJOuPN4idlFp3NkTcDuNNWJ9cbFj77Tco4i42CE7i
 ODB1SFnksk2qbKznAoU/3fpH2vvJO2Y2vUc6JiaIoqGvVbPmnezw1V0E54EGQ+hgL/Tm
 h4lP8L/ACLVowg6v07+pbu7fzy+y3fOKDnO4ggU3CL+R7rIdcKmoyofFJQjjblyT3eC/
 9lMCC52uz37mC9ei4U1bHABl3NqJ2oVOYKisiDo4aCW4spy41T8p2LQznrRYHOwZbrwL
 mV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747666691; x=1748271491;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z5gdvpRaAaLM19UVx/GrdVW5vV6MuRm9rJTVLs3u7oM=;
 b=AQTpsE1uI2KL+RhBAgX38kGtkrgVZpryl8PJ8jhuDmGHYrEzZw/9Rnp1MjY5GF7OQg
 7cznVe13sdezmzb5aCg7sDjglzAWEw67DXiP6XsonolszylMDgoe55+B8aZhtmEUpKVx
 k0/9HEo2cVRA1C3jp28U662mDFaGEUzE/AXT2nbFYhZFKgDZd0BmDaXKDSApf5ygbNEa
 r6LF6kFcJ7FS+iES2DE/v5994/L2yEA3EFSChXgWq9YfMIfR3lchmNVoxecwXCT/8izR
 /K7KMJfbU7xO+kJUZkHhKggKBanIsa1t111wXU3zqPVWn1+jTL3VPshaNei2Ng2kWZBs
 0hSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkwE9y5LQD5rUe7RnClF6B22Ep0jDg+kAq9y9kTPOLb/ThS6l3ZjrA1mHc8MJTYFIhQZ9uUR9xUjdk@lists.freedesktop.org,
 AJvYcCXaBhvgMGpoU5EbknyD1yN4UEahsY+AFMNP0C32IIOQUbZ9Tn4/TTCyGkuWZOcyp9mkm0Gyh5XY@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4JN1a5XdTOwyR5K/ig2RLnFH/OobZtxTkdqn/Pad8mqMO5ry4
 BUN4kooaXGZtJoRXQRYuTlxCr91Wi5aIJyfEzmsl2OTkpU1njtovCnAifTPoAXhtYI+T2tqE2dt
 mk5HPn4t2EsP7uvoO4TDvjaxl4//XWSBS1A==
X-Gm-Gg: ASbGncuUqWhF0q2sCyi+jJChXgT/UwnWJPfPVPNvK8k9GcCR4pwYoVFPN661Y1sG0XP
 iIPTOx4I1d2WSrC2xbT6z2mxj2tVH8eqlYvtP0z7XwLSVHCOAlAqtYW8AEG3627/rFGXIje+Qsk
 Q+LUOSH7cLpVeh917/fDOKNqG1ECBWGSatxraCC4ZWeeB0
X-Google-Smtp-Source: AGHT+IFS6lS24Joef5xwSP/U3viHYHqlSjU3heJ3YK/ZdGumYT2oGf+W1cgyzoDIT8SU1Nt1vS15n5viC2uvxxX0zH4=
X-Received: by 2002:a17:903:2285:b0:223:49ce:67a2 with SMTP id
 d9443c01a7336-231d4502e3bmr65053865ad.9.1747666690994; Mon, 19 May 2025
 07:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250517030609.818725-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20250517030609.818725-1-jihed.chaibi.dev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 May 2025 10:57:59 -0400
X-Gm-Features: AX0GCFvc-a8H_zK_oq_ihi9yggKR3zIAwzCZb1xZzKZDlyUyHmFEizJ6vo0AuvE
Message-ID: <CADnq5_P1jJQGuJkcx-f-SiVWTJk=6Bd3b54djy-Tfb8tCkRO0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] fixing typo in macro name
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linux.dev
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

Applied.  Thanks!

On Sat, May 17, 2025 at 7:43=E2=80=AFAM Jihed Chaibi <jihed.chaibi.dev@gmai=
l.com> wrote:
>
> "ENABLE" is currently misspelled in SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS
>
> PS: checkpatch.pl is complaining about the presence of a space at the
> start of drivers/gpu/drm/amd/include/atomfirmware.h line: 1716
> This is propably because this file uses (two) spaces and not tabs.
>
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h | 2 +-
>  drivers/gpu/drm/amd/include/atombios.h                      | 4 ++--
>  drivers/gpu/drm/amd/include/atomfirmware.h                  | 2 +-
>  drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c                  | 2 +-
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c         | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h =
b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
> index 813463ffe..cc4670316 100644
> --- a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
> +++ b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
> @@ -424,7 +424,7 @@ struct integrated_info {
>  /*
>   * DFS-bypass flag
>   */
> -/* Copy of SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS from atombios.h */
> +/* Copy of SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS from atombios.h */
>  enum {
>         DFS_BYPASS_ENABLE =3D 0x10
>  };
> diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd=
/include/atombios.h
> index b78360a71..a99923b4e 100644
> --- a/drivers/gpu/drm/amd/include/atombios.h
> +++ b/drivers/gpu/drm/amd/include/atombios.h
> @@ -6017,7 +6017,7 @@ typedef struct _ATOM_INTEGRATED_SYSTEM_INFO_V1_7
>  #define SYS_INFO_GPUCAPS__TMDSHDMI_COHERENT_SINGLEPLL_MODE              =
  0x01
>  #define SYS_INFO_GPUCAPS__DP_SINGLEPLL_MODE                             =
  0x02
>  #define SYS_INFO_GPUCAPS__DISABLE_AUX_MODE_DETECT                       =
  0x08
> -#define SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS                             =
  0x10
> +#define SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS                             =
  0x10
>  //ulGPUCapInfo[16]=3D1 indicate SMC firmware is able to support GNB fast=
 resume function, so that driver can call SMC to program most of GNB regist=
er during resuming, from ML
>  #define SYS_INFO_GPUCAPS__GNB_FAST_RESUME_CAPABLE                       =
  0x00010000
>
> @@ -6460,7 +6460,7 @@ typedef struct _ATOM_INTEGRATED_SYSTEM_INFO_V1_9
>
>  // ulGPUCapInfo
>  #define SYS_INFO_V1_9_GPUCAPSINFO_DISABLE_AUX_MODE_DETECT               =
          0x08
> -#define SYS_INFO_V1_9_GPUCAPSINFO_ENABEL_DFS_BYPASS                     =
          0x10
> +#define SYS_INFO_V1_9_GPUCAPSINFO_ENABLE_DFS_BYPASS                     =
          0x10
>  //ulGPUCapInfo[16]=3D1 indicate SMC firmware is able to support GNB fast=
 resume function, so that driver can call SMC to program most of GNB regist=
er during resuming, from ML
>  #define SYS_INFO_V1_9_GPUCAPSINFO_GNB_FAST_RESUME_CAPABLE               =
          0x00010000
>  //ulGPUCapInfo[18]=3D1 indicate the IOMMU is not available
> diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm=
/amd/include/atomfirmware.h
> index 0160d65f3..52eb3a474 100644
> --- a/drivers/gpu/drm/amd/include/atomfirmware.h
> +++ b/drivers/gpu/drm/amd/include/atomfirmware.h
> @@ -1713,7 +1713,7 @@ enum atom_system_vbiosmisc_def{
>
>  // gpucapinfo
>  enum atom_system_gpucapinf_def{
> -  SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS  =3D 0x10,
> +  SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS  =3D 0x10,
>  };
>
>  //dpphy_override
> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm=
/amd/pm/legacy-dpm/kv_dpm.c
> index 59fae668d..34e71727b 100644
> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> @@ -2594,7 +2594,7 @@ static int kv_parse_sys_info_table(struct amdgpu_de=
vice *adev)
>                                 le32_to_cpu(igp_info->info_8.ulNbpStateNC=
lkFreq[i]);
>                 }
>                 if (le32_to_cpu(igp_info->info_8.ulGPUCapInfo) &
> -                   SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS)
> +                   SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS)
>                         pi->caps_enable_dfs_bypass =3D true;
>
>                 sumo_construct_sclk_voltage_mapping_table(adev,
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c b/driver=
s/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
> index 9d3b33446..9b20076e2 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
> @@ -394,7 +394,7 @@ static int smu8_get_system_info_data(struct pp_hwmgr =
*hwmgr)
>         }
>
>         if (le32_to_cpu(info->ulGPUCapInfo) &
> -               SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS) {
> +               SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS) {
>                 phm_cap_set(hwmgr->platform_descriptor.platformCaps,
>                                     PHM_PlatformCaps_EnableDFSBypass);
>         }
> --
> 2.39.5
>
