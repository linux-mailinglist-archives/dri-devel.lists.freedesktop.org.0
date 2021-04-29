Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB2636ED61
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 17:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E676EF38;
	Thu, 29 Apr 2021 15:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7BE6EF2E;
 Thu, 29 Apr 2021 15:26:50 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso6694296otn.3; 
 Thu, 29 Apr 2021 08:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vbo4pKW3eCIThjMyIy6wsscOAdK3OJqwzPMbrwiTzTg=;
 b=Srmr0fVOgjkykvlE3qdpkc3N3K5sktCMj6v1OgxqDJL0bljoIWUSciurSzygMcC6+n
 Kvfe48eZrFMI4Vezxk+6d1SmAwUj3O8KStWxJ7C6QQj643wUL1pTlFt1cIl+3EPJlog8
 Wjz7r5pur/St1BB4WjvL2c+1TRfSExFtimoriLOUN5bhVZxRQ7ceQ7l6u1U35bjVvgYO
 G+U3UQmd+zdqnS/9c59d2vTHPjnfybGBOMlKvgo2G6yt/3QwDjhtTZtb/DN7njCxMlfl
 Z+5BoYbOdcY8gHWg1rB52LVWnrX7HAjpecCdA5JJdAmydYP8GXTBu8hDuNRA/byDUNS0
 rQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vbo4pKW3eCIThjMyIy6wsscOAdK3OJqwzPMbrwiTzTg=;
 b=dJpkaF0CAuZL2Ae9vfPg9qpXYg31sHxCw+RKN/2WSi2bbYogRM5PcOG28aPixQ4HUt
 sMvj6KWCM4/Dni7gHOS4cS9ks/nDfRvmHH5pXK/0HNUUsrl2ATDEl9mKEGye03012Gki
 KzxEYgLexumKkF3UYzT9J1hWhmf+qv0Jeh/TCyal6nqAFcjdoh/VvvTBG8J1VJfJbHUu
 SK61THgF6YamVVZTRw0kv6GxOwfug3n+nnBF/EddwSC6n5VB9qnD473JfvAHlT7eTcAR
 /xH4y2DcgUn5XKe77hyvuLD52j8mCIL6wCk2338dbKF7nDMVan3ITGXu/aX5qD0gByWW
 WcAA==
X-Gm-Message-State: AOAM530cBOTrd52nnU20rnew6casrDcI5dP3RrBd0UyaHiH34Ir558Dz
 BfC0fyE1YRRFbXmmej4jNneqzRMFQCZCFasVrU8=
X-Google-Smtp-Source: ABdhPJx/VF42MwLva6s4z6QCvKeFfwbdS1g8a6UEzyk0r2NtvE1jU5KzdNDQMYGiG9P9g6IxZOwxNN7a3OAYwulPFs8=
X-Received: by 2002:a9d:63d1:: with SMTP id e17mr1296573otl.311.1619710009654; 
 Thu, 29 Apr 2021 08:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210427112738.15869-1-fmdefrancesco@gmail.com>
 <ef0a9c9d-4a7e-b1ce-05ef-29dca0c020a7@amd.com>
In-Reply-To: <ef0a9c9d-4a7e-b1ce-05ef-29dca0c020a7@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Apr 2021 11:26:38 -0400
Message-ID: <CADnq5_NGxHweFv_Cqwn1em5erGeUH_WJ_6KugJ+iKEUsKtuaYg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/amdgpu: Fix errors in documentation of
 function parameters
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:AMD KFD" <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 2:44 AM Felix Kuehling <felix.kuehling@amd.com> wrote:
>
> On 2021-04-27 7:27, Fabio M. De Francesco wrote:
> > In the documentation of functions, removed excess parameters, described
> > undocumented ones, and fixed syntax errors.
> >
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> >
> > Changes from v1: Cc'ed all the maintainers.
>
> Looks like Alex already applied V1. So this one doesn't apply. "git am
> -3" tells me:

Ah sorry, I didn't see the v2 patch.

Alex


>
> Applying: drm/amd/amdgpu: Fix errors in documentation of function parameters
> Using index info to reconstruct a base tree...
> M       drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> M       drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> M       drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> Falling back to patching base and 3-way merge...
> No changes -- Patch already applied.
>
> Regards,
>    Felix
>
>
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c          | 12 ++++++------
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |  4 +++-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c |  8 ++++----
> >   3 files changed, 13 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > index 2e9b16fb3fcd..bf2939b6eb43 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > @@ -76,7 +76,7 @@ struct amdgpu_atif {
> >   /**
> >    * amdgpu_atif_call - call an ATIF method
> >    *
> > - * @handle: acpi handle
> > + * @atif: acpi handle
> >    * @function: the ATIF function to execute
> >    * @params: ATIF function params
> >    *
> > @@ -166,7 +166,6 @@ static void amdgpu_atif_parse_functions(struct amdgpu_atif_functions *f, u32 mas
> >   /**
> >    * amdgpu_atif_verify_interface - verify ATIF
> >    *
> > - * @handle: acpi handle
> >    * @atif: amdgpu atif struct
> >    *
> >    * Execute the ATIF_FUNCTION_VERIFY_INTERFACE ATIF function
> > @@ -240,8 +239,7 @@ static acpi_handle amdgpu_atif_probe_handle(acpi_handle dhandle)
> >   /**
> >    * amdgpu_atif_get_notification_params - determine notify configuration
> >    *
> > - * @handle: acpi handle
> > - * @n: atif notification configuration struct
> > + * @atif: acpi handle
> >    *
> >    * Execute the ATIF_FUNCTION_GET_SYSTEM_PARAMETERS ATIF function
> >    * to determine if a notifier is used and if so which one
> > @@ -304,7 +302,7 @@ static int amdgpu_atif_get_notification_params(struct amdgpu_atif *atif)
> >   /**
> >    * amdgpu_atif_query_backlight_caps - get min and max backlight input signal
> >    *
> > - * @handle: acpi handle
> > + * @atif: acpi handle
> >    *
> >    * Execute the QUERY_BRIGHTNESS_TRANSFER_CHARACTERISTICS ATIF function
> >    * to determine the acceptable range of backlight values
> > @@ -363,7 +361,7 @@ static int amdgpu_atif_query_backlight_caps(struct amdgpu_atif *atif)
> >   /**
> >    * amdgpu_atif_get_sbios_requests - get requested sbios event
> >    *
> > - * @handle: acpi handle
> > + * @atif: acpi handle
> >    * @req: atif sbios request struct
> >    *
> >    * Execute the ATIF_FUNCTION_GET_SYSTEM_BIOS_REQUESTS ATIF function
> > @@ -899,6 +897,8 @@ void amdgpu_acpi_fini(struct amdgpu_device *adev)
> >   /**
> >    * amdgpu_acpi_is_s0ix_supported
> >    *
> > + * @adev: amdgpu_device_pointer
> > + *
> >    * returns true if supported, false if not.
> >    */
> >   bool amdgpu_acpi_is_s0ix_supported(struct amdgpu_device *adev)
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> > index 5af464933976..98d31ebad9ce 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> > @@ -111,6 +111,8 @@ static const char *amdkfd_fence_get_timeline_name(struct dma_fence *f)
> >    *  a KFD BO and schedules a job to move the BO.
> >    *  If fence is already signaled return true.
> >    *  If fence is not signaled schedule a evict KFD process work item.
> > + *
> > + *  @f: dma_fence
> >    */
> >   static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
> >   {
> > @@ -131,7 +133,7 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
> >   /**
> >    * amdkfd_fence_release - callback that fence can be freed
> >    *
> > - * @fence: fence
> > + * @f: dma_fence
> >    *
> >    * This function is called when the reference count becomes zero.
> >    * Drops the mm_struct reference and RCU schedules freeing up the fence.
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> > index b43e68fc1378..ed3014fbb563 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> > @@ -719,7 +719,7 @@ static void unlock_spi_csq_mutexes(struct amdgpu_device *adev)
> >   }
> >
> >   /**
> > - * @get_wave_count: Read device registers to get number of waves in flight for
> > + * get_wave_count: Read device registers to get number of waves in flight for
> >    * a particular queue. The method also returns the VMID associated with the
> >    * queue.
> >    *
> > @@ -755,19 +755,19 @@ static void get_wave_count(struct amdgpu_device *adev, int queue_idx,
> >   }
> >
> >   /**
> > - * @kgd_gfx_v9_get_cu_occupancy: Reads relevant registers associated with each
> > + * kgd_gfx_v9_get_cu_occupancy: Reads relevant registers associated with each
> >    * shader engine and aggregates the number of waves that are in flight for the
> >    * process whose pasid is provided as a parameter. The process could have ZERO
> >    * or more queues running and submitting waves to compute units.
> >    *
> >    * @kgd: Handle of device from which to get number of waves in flight
> >    * @pasid: Identifies the process for which this query call is invoked
> > - * @wave_cnt: Output parameter updated with number of waves in flight that
> > + * @pasid_wave_cnt: Output parameter updated with number of waves in flight that
> >    * belong to process with given pasid
> >    * @max_waves_per_cu: Output parameter updated with maximum number of waves
> >    * possible per Compute Unit
> >    *
> > - * @note: It's possible that the device has too many queues (oversubscription)
> > + * Note: It's possible that the device has too many queues (oversubscription)
> >    * in which case a VMID could be remapped to a different PASID. This could lead
> >    * to an iaccurate wave count. Following is a high-level sequence:
> >    *    Time T1: vmid = getVmid(); vmid is associated with Pasid P1
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
