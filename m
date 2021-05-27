Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A40DD3925A4
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 05:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05216E9F9;
	Thu, 27 May 2021 03:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F017B6E9F9;
 Thu, 27 May 2021 03:54:18 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso3186741ote.1; 
 Wed, 26 May 2021 20:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uT651Ch6JbByVKpUqSoIkWeIFaGF5wLW7NPyHBjr/q4=;
 b=BgoSlEhFkhdIyEkOpterAYNsrp0jrayCyZw0SQerP0yV49F3y501qTy8MLy7IxcqkT
 Y/skeFxINTA4qTC2dVaMCCUMRYHeTYYc7LtD3vbFjc60J9KbJ4Fit4zFgYLb5PgNhJPn
 /DBrYUxn6FERSZcDLmTTO0oPPiDuZrwM5CD8BMA+TL90MtDKfmojj7sOJYI3JHJbiTl1
 iwtGk//+1PZbcRHnF6KivbfufhP7fRW0x49bFKKyKJsCm9uNutnZTEwQTZg2cm3jvvnz
 O47d7yFttO+MY1s6pwgsGhPGmBm1Iu70nK0+bYuVcj6HUtAKDkHk2z+lNqqPSYRhh2Ok
 c9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uT651Ch6JbByVKpUqSoIkWeIFaGF5wLW7NPyHBjr/q4=;
 b=lBfaBKIbbuztrUKeuVogmSdTGlTmiOrufCvbzzGvcP1DUJfy/M2/VjKkgmChLZRZbv
 Vdt6FcMUmr0AohpLEIl94Z4LaFAtBUreMmcY+wm+Cre3n+15I9tHbBw82gEgVc43VpdV
 okdhMCHCdE5j6/x7zSDPvBQIax2ivyID3n3znbRQa+N7zMX2M1PN+TX3e/y0Xk5iHt4f
 /c1WJQUJWQpMAI2gyMEQSgUIB7Mga2swgAh6zEvRiQlBpXJ5DaI/qXXM/+UWzTqcZJM/
 Cp2CUCBBnK2euts6d8Ogj80He2u2iVfPtBGz/vvOGWZWlohAwrNsl9uGCmRj/ALoDP8Y
 SLeQ==
X-Gm-Message-State: AOAM530PEaA6HWR6BTq6oEsA13tZWDKXzXMA4FhsnptOHyHlVkRhwdFC
 y2esQLB+Q2ejFSRkn8p3nJKQCnXZqtIsmC2B//A=
X-Google-Smtp-Source: ABdhPJz+Skgjs6oUjSpHjiyoi6e2pn0d+BU5ukYqpVviAOSWNeZeIKuSDjBoPmrsukza/eNRL5hcYXhKE8VqLTtg1Bg=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr1247111otl.132.1622087658314; 
 Wed, 26 May 2021 20:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-7-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-7-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 May 2021 23:54:07 -0400
Message-ID: <CADnq5_M9FNTPUjed0zoTktZbJyKLkJ5LDJrjWqS7pFPL3OBHkw@mail.gmail.com>
Subject: Re: [PATCH 06/34] drm/amd/pm/powerplay/hwmgr/vega10_hwmgr: Kernel-doc
 headers must contain function names
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, May 26, 2021 at 4:47 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:547: war=
ning: This comment starts with '/**', but isn't a kernel-doc comment. Refer=
 Documentation/doc-guide/kernel-doc.rst
>  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:603: war=
ning: This comment starts with '/**', but isn't a kernel-doc comment. Refer=
 Documentation/doc-guide/kernel-doc.rst
>  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:629: war=
ning: This comment starts with '/**', but isn't a kernel-doc comment. Refer=
 Documentation/doc-guide/kernel-doc.rst
>  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:1006: wa=
rning: This comment starts with '/**', but isn't a kernel-doc comment. Refe=
r Documentation/doc-guide/kernel-doc.rst
>  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:1155: wa=
rning: This comment starts with '/**', but isn't a kernel-doc comment. Refe=
r Documentation/doc-guide/kernel-doc.rst
>  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:1608: wa=
rning: expecting prototype for Populates single SMC GFXSCLK structure using=
 the provided engine clock(). Prototype was for vega10_populate_single_gfx_=
level() instead
>  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:1663: wa=
rning: This comment starts with '/**', but isn't a kernel-doc comment. Refe=
r Documentation/doc-guide/kernel-doc.rst
>  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:1713: wa=
rning: This comment starts with '/**', but isn't a kernel-doc comment. Refe=
r Documentation/doc-guide/kernel-doc.rst
>  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:1862: wa=
rning: This comment starts with '/**', but isn't a kernel-doc comment. Refe=
r Documentation/doc-guide/kernel-doc.rst
>  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:2546: wa=
rning: expecting prototype for Initializes the SMC table and uploads it(). =
Prototype was for vega10_init_smc_table() instead
>  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_hwmgr.c:2922: wa=
rning: This comment starts with '/**', but isn't a kernel-doc comment. Refe=
r Documentation/doc-guide/kernel-doc.rst
>
> Cc: Evan Quan <evan.quan@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 26 +++++++++++--------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/driv=
ers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> index 31c61ac3bd5e1..25979106fd255 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> @@ -544,7 +544,7 @@ static int vega10_get_socclk_for_voltage_evv(struct p=
p_hwmgr *hwmgr,
>
>  #define ATOM_VIRTUAL_VOLTAGE_ID0             0xff01
>  /**
> - * Get Leakage VDDC based on leakage ID.
> + * vega10_get_evv_voltages - Get Leakage VDDC based on leakage ID.
>   *
>   * @hwmgr:  the address of the powerplay hardware manager.
>   * return:  always 0.
> @@ -600,7 +600,7 @@ static int vega10_get_evv_voltages(struct pp_hwmgr *h=
wmgr)
>  }
>
>  /**
> - * Change virtual leakage voltage to actual value.
> + * vega10_patch_with_vdd_leakage - Change virtual leakage voltage to act=
ual value.
>   *
>   * @hwmgr:         the address of the powerplay hardware manager.
>   * @voltage:       pointer to changing voltage
> @@ -626,7 +626,7 @@ static void vega10_patch_with_vdd_leakage(struct pp_h=
wmgr *hwmgr,
>  }
>
>  /**
> - * Patch voltage lookup table by EVV leakages.
> + * vega10_patch_lookup_table_with_leakage - Patch voltage lookup table b=
y EVV leakages.
>   *
>   * @hwmgr:         the address of the powerplay hardware manager.
>   * @lookup_table:  pointer to voltage lookup table
> @@ -1003,7 +1003,7 @@ static int vega10_setup_asic_task(struct pp_hwmgr *=
hwmgr)
>  }
>
>  /**
> - * Remove repeated voltage values and create table with unique values.
> + * vega10_trim_voltage_table - Remove repeated voltage values and create=
 table with unique values.
>   *
>   * @hwmgr:      the address of the powerplay hardware manager.
>   * @vol_table:  the pointer to changing voltage table
> @@ -1152,7 +1152,7 @@ static void vega10_trim_voltage_table_to_fit_state_=
table(
>  }
>
>  /**
> - * Create Voltage Tables.
> + * vega10_construct_voltage_tables - Create Voltage Tables.
>   *
>   * @hwmgr:  the address of the powerplay hardware manager.
>   * return:  always 0
> @@ -1595,7 +1595,8 @@ static int vega10_populate_smc_link_levels(struct p=
p_hwmgr *hwmgr)
>  }
>
>  /**
> - * Populates single SMC GFXSCLK structure using the provided engine cloc=
k
> + * vega10_populate_single_gfx_level - Populates single SMC GFXSCLK struc=
ture
> + *                                    using the provided engine clock
>   *
>   * @hwmgr:      the address of the hardware manager
>   * @gfx_clock:  the GFX clock to use to populate the structure.
> @@ -1660,7 +1661,8 @@ static int vega10_populate_single_gfx_level(struct =
pp_hwmgr *hwmgr,
>  }
>
>  /**
> - * Populates single SMC SOCCLK structure using the provided clock.
> + * vega10_populate_single_soc_level - Populates single SMC SOCCLK struct=
ure
> + *                                    using the provided clock.
>   *
>   * @hwmgr:     the address of the hardware manager.
>   * @soc_clock: the SOC clock to use to populate the structure.
> @@ -1710,7 +1712,8 @@ static int vega10_populate_single_soc_level(struct =
pp_hwmgr *hwmgr,
>  }
>
>  /**
> - * Populates all SMC SCLK levels' structure based on the trimmed allowed=
 dpm engine clock states
> + * vega10_populate_all_graphic_levels - Populates all SMC SCLK levels' s=
tructure
> + *                                      based on the trimmed allowed dpm=
 engine clock states
>   *
>   * @hwmgr:      the address of the hardware manager
>   */
> @@ -1859,7 +1862,8 @@ static int vega10_populate_single_memory_level(stru=
ct pp_hwmgr *hwmgr,
>  }
>
>  /**
> - * Populates all SMC MCLK levels' structure based on the trimmed allowed=
 dpm memory clock states.
> + * vega10_populate_all_memory_levels - Populates all SMC MCLK levels' st=
ructure
> + *                                     based on the trimmed allowed dpm =
memory clock states.
>   *
>   * @hwmgr:  the address of the hardware manager.
>   * return:   PP_Result_OK on success.
> @@ -2537,7 +2541,7 @@ static void vega10_check_dpm_table_updated(struct p=
p_hwmgr *hwmgr)
>  }
>
>  /**
> - * Initializes the SMC table and uploads it
> + * vega10_init_smc_table - Initializes the SMC table and uploads it
>   *
>   * @hwmgr:  the address of the powerplay hardware manager.
>   * return:  always 0
> @@ -2919,7 +2923,7 @@ static int vega10_stop_dpm(struct pp_hwmgr *hwmgr, =
uint32_t bitmap)
>  }
>
>  /**
> - * Tell SMC to enabled the supported DPMs.
> + * vega10_start_dpm - Tell SMC to enabled the supported DPMs.
>   *
>   * @hwmgr:   the address of the powerplay hardware manager.
>   * @bitmap:  bitmap for the features to enabled.
> --
> 2.31.1
>
