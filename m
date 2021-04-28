Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997AC36E0B7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 23:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A63A89135;
	Wed, 28 Apr 2021 21:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F6889135
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 21:08:36 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 f75-20020a9d03d10000b0290280def9ab76so54522083otf.12
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 14:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PWrDorBDKcU1kGiZJfgkn3NJ/gIa+8Z+zkyVLhd+hzI=;
 b=TzXXMJJXM9Jiv06VoIb9Y3TR836KwuhlgK7BfrRJRA7y/FGxDH79oN4RCLxod2AR8J
 sjwmRf8ZeykKqhkFOmd47UYF2yShdGxVtVI43Sc2yATfg/OseAKqOgm56q6yp9gRAGI2
 REoCDj6dWZq40S081XF/0E8lkipavEoaYETfJp/SSE5GpYAqtx7JqRbPvBkwO4zv19ft
 j8FINrXPLX7TmMvndbn6nfXpMeWPpK54PnZsLn3337CEEnclzbAxjEijIVMx1sYa/r8k
 CU2VzoFmglRD/qxgEIsAdeanxzwzPWl1DwHClo3yrfm3EZd+hp+I3vRUYzEj4cOPpaa2
 E4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PWrDorBDKcU1kGiZJfgkn3NJ/gIa+8Z+zkyVLhd+hzI=;
 b=GUpEto36HLL4fCCbqFFdf17G/i4WZS/H96X51XoB+vaB+GBDe9SGLpupr/LpNONJIY
 BISPIZasjMSSe0UynXeSubzJxy7KKzc1kXvsA5qV+x39zDMFHo38fkv6cHnh4BlfyDzw
 UAFhCkcK+KS8kvxoRlwXdhkNw+/kZZSn9/N2CRGhM4j/twJICYLV/8DkguIsYzFm/U0Z
 MqP3oZ/FXbjXXzJ2YENE3l8z8FATyxQrimA5P9w352n+iG+bQY291YbQTQePPLMd/skW
 lOfa6gzBJuSTSnR7rkRXfmdokl87/KVAbxfKYyufgMV/vYzW0xAxl3U8J095iksQkUe9
 61Aw==
X-Gm-Message-State: AOAM530Oi3OgTQ+XOzrsrPwb6Ok5dq3lSJmTLI6rFE2M7Sh9K2Tgorzw
 SubQ2iuoAlMu9nkzuGMP2PqjQAQkSREAMtKuLMM=
X-Google-Smtp-Source: ABdhPJx5Sp4rXgvLAFt4EJDF6mG3tjYN4+vt1f7JNZb46kYCthNRHqWTh5Uspr1FuaLFDR8h+UVjLC41TWH+xEjBGiQ=
X-Received: by 2002:a05:6830:1f12:: with SMTP id
 u18mr26275848otg.132.1619644115496; 
 Wed, 28 Apr 2021 14:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210423113846.29651-1-fmdefrancesco@gmail.com>
In-Reply-To: <20210423113846.29651-1-fmdefrancesco@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 28 Apr 2021 17:08:24 -0400
Message-ID: <CADnq5_OQEA7+fm4u5nxopJBdXku-cKHeMbr8uekeF+fFVZYH0w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: Fix errors in documentation of function
 parameters
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, outreachy-kernel@googlegroups.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Apr 23, 2021 at 7:38 AM Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> In the function documentation, I removed the excess parameters,
> described the undocumented ones, and fixed the syntax errors.
>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c          | 12 ++++++------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |  4 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c |  8 ++++----
>  3 files changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index 2e9b16fb3fcd..bf2939b6eb43 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -76,7 +76,7 @@ struct amdgpu_atif {
>  /**
>   * amdgpu_atif_call - call an ATIF method
>   *
> - * @handle: acpi handle
> + * @atif: acpi handle
>   * @function: the ATIF function to execute
>   * @params: ATIF function params
>   *
> @@ -166,7 +166,6 @@ static void amdgpu_atif_parse_functions(struct amdgpu_atif_functions *f, u32 mas
>  /**
>   * amdgpu_atif_verify_interface - verify ATIF
>   *
> - * @handle: acpi handle
>   * @atif: amdgpu atif struct
>   *
>   * Execute the ATIF_FUNCTION_VERIFY_INTERFACE ATIF function
> @@ -240,8 +239,7 @@ static acpi_handle amdgpu_atif_probe_handle(acpi_handle dhandle)
>  /**
>   * amdgpu_atif_get_notification_params - determine notify configuration
>   *
> - * @handle: acpi handle
> - * @n: atif notification configuration struct
> + * @atif: acpi handle
>   *
>   * Execute the ATIF_FUNCTION_GET_SYSTEM_PARAMETERS ATIF function
>   * to determine if a notifier is used and if so which one
> @@ -304,7 +302,7 @@ static int amdgpu_atif_get_notification_params(struct amdgpu_atif *atif)
>  /**
>   * amdgpu_atif_query_backlight_caps - get min and max backlight input signal
>   *
> - * @handle: acpi handle
> + * @atif: acpi handle
>   *
>   * Execute the QUERY_BRIGHTNESS_TRANSFER_CHARACTERISTICS ATIF function
>   * to determine the acceptable range of backlight values
> @@ -363,7 +361,7 @@ static int amdgpu_atif_query_backlight_caps(struct amdgpu_atif *atif)
>  /**
>   * amdgpu_atif_get_sbios_requests - get requested sbios event
>   *
> - * @handle: acpi handle
> + * @atif: acpi handle
>   * @req: atif sbios request struct
>   *
>   * Execute the ATIF_FUNCTION_GET_SYSTEM_BIOS_REQUESTS ATIF function
> @@ -899,6 +897,8 @@ void amdgpu_acpi_fini(struct amdgpu_device *adev)
>  /**
>   * amdgpu_acpi_is_s0ix_supported
>   *
> + * @adev: amdgpu_device_pointer
> + *
>   * returns true if supported, false if not.
>   */
>  bool amdgpu_acpi_is_s0ix_supported(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> index 5af464933976..98d31ebad9ce 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> @@ -111,6 +111,8 @@ static const char *amdkfd_fence_get_timeline_name(struct dma_fence *f)
>   *  a KFD BO and schedules a job to move the BO.
>   *  If fence is already signaled return true.
>   *  If fence is not signaled schedule a evict KFD process work item.
> + *
> + *  @f: dma_fence
>   */
>  static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
>  {
> @@ -131,7 +133,7 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
>  /**
>   * amdkfd_fence_release - callback that fence can be freed
>   *
> - * @fence: fence
> + * @f: dma_fence
>   *
>   * This function is called when the reference count becomes zero.
>   * Drops the mm_struct reference and RCU schedules freeing up the fence.
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> index b43e68fc1378..ed3014fbb563 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> @@ -719,7 +719,7 @@ static void unlock_spi_csq_mutexes(struct amdgpu_device *adev)
>  }
>
>  /**
> - * @get_wave_count: Read device registers to get number of waves in flight for
> + * get_wave_count: Read device registers to get number of waves in flight for
>   * a particular queue. The method also returns the VMID associated with the
>   * queue.
>   *
> @@ -755,19 +755,19 @@ static void get_wave_count(struct amdgpu_device *adev, int queue_idx,
>  }
>
>  /**
> - * @kgd_gfx_v9_get_cu_occupancy: Reads relevant registers associated with each
> + * kgd_gfx_v9_get_cu_occupancy: Reads relevant registers associated with each
>   * shader engine and aggregates the number of waves that are in flight for the
>   * process whose pasid is provided as a parameter. The process could have ZERO
>   * or more queues running and submitting waves to compute units.
>   *
>   * @kgd: Handle of device from which to get number of waves in flight
>   * @pasid: Identifies the process for which this query call is invoked
> - * @wave_cnt: Output parameter updated with number of waves in flight that
> + * @pasid_wave_cnt: Output parameter updated with number of waves in flight that
>   * belong to process with given pasid
>   * @max_waves_per_cu: Output parameter updated with maximum number of waves
>   * possible per Compute Unit
>   *
> - * @note: It's possible that the device has too many queues (oversubscription)
> + * Note: It's possible that the device has too many queues (oversubscription)
>   * in which case a VMID could be remapped to a different PASID. This could lead
>   * to an iaccurate wave count. Following is a high-level sequence:
>   *    Time T1: vmid = getVmid(); vmid is associated with Pasid P1
> --
> 2.31.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
