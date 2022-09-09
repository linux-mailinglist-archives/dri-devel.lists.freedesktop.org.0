Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8375B4108
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 22:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D525E10EE5B;
	Fri,  9 Sep 2022 20:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEA110EE5B;
 Fri,  9 Sep 2022 20:51:50 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 l40-20020a4a94eb000000b00472717928b5so464618ooi.1; 
 Fri, 09 Sep 2022 13:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=DUHWHeA08mIahhsciiaTsaPGg+HQzx7SFaoh+t8qFxs=;
 b=SORX/TdUyX7GAibTMD7q0Au1yjFpBBE5BmsKfX9LSqaXhYbo010nYD6yFBM+y/b2T0
 ai3Wt12CE8e9aX4WHsOcWSuflUukQ0Ba7xeLMwyzJEDwBXesFuDioQHfWEGESVczJs/R
 3Ra8UtfgIs8/o6WN/uHjVDOo3T3z/DxzZ4EnmejFMM07CxwMsdYbCPJxHWENFw0e5G47
 bxXHTz/i0SoI98cV+PWtg707lMeW6kpPH4KF7j+YagM2NHhdGbzwQMcVNsDJC6fFFaNi
 cnf4fYyodIXygO6ww9F5uZdwfYgwwofZFVlPOQWA6fUSWiDTJGWvS9F0XH1kHMi35H4n
 8AFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=DUHWHeA08mIahhsciiaTsaPGg+HQzx7SFaoh+t8qFxs=;
 b=w8EKkCqmi9T1Me/AJ1iCiCRVkqWq2u355/YHLSfLuvnx73ah1n1fRz4TLHfn+I35V6
 ApaSdHYT5/tlOZVsK7kjcJTgvHCHAJ8nYSf8sdSzFm73ronoOj31WjjCdIM4F/sqR4yz
 4NCA64n7Wk835TvmFnuMGZvRALaC7tQBOJSV6Bw4jNz9PZn8LnBwAIstsFYKXIUxFNkR
 nIwAgG0DireC8OBzYobB4F+GrQ/rvM1Rt8ApVEE8Tq5la7FZGK+xz60wsTgX5RBmvFAq
 IQzknvIk6ANG3tj+5SeRw1Q60hVs0dVB0h+Ok47WM99tYJl5Ld8WGa8Pzd/UVnLNNW0F
 s37w==
X-Gm-Message-State: ACgBeo30B/r5wMv/fdL/m6nkcumr6XW+M/my8Au8CwTCpUO/2TNO/0nK
 3dzJm8O1gvR1skREICjGUo8owxVMHkxA0y8QhQA=
X-Google-Smtp-Source: AA6agR4lQQ5B0kKRbq0IyYE2sfBAPPacxCJVm/a7if8rUqF0go9tIzZ8wYR2S1rCYNl65J7Xv/DN3zOr2n58YTQSrGM=
X-Received: by 2002:a4a:a78a:0:b0:472:a078:98d6 with SMTP id
 l10-20020a4aa78a000000b00472a07898d6mr2325126oom.97.1662756709748; Fri, 09
 Sep 2022 13:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220905011431.19818-1-jingyuwang_vip@163.com>
In-Reply-To: <20220905011431.19818-1-jingyuwang_vip@163.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Sep 2022 16:51:38 -0400
Message-ID: <CADnq5_O+pduHeGra3R0XHZP=aOUmy4SETzOP+e-x-5rhYHVi2g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_acpi.c
To: Jingyu Wang <jingyuwang_vip@163.com>
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
Cc: rafael.j.wysocki@intel.com, airlied@linux.ie, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com, mario.limonciello@amd.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Sep 5, 2022 at 2:29 AM Jingyu Wang <jingyuwang_vip@163.com> wrote:
>
> Fix everything checkpatch.pl complained about in amdgpu_acpi.c
>
> Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index 55402d238919..3da27436922c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: MIT
>  /*
>   * Copyright 2012 Advanced Micro Devices, Inc.
>   *
> @@ -849,6 +850,7 @@ int amdgpu_acpi_init(struct amdgpu_device *adev)
>                 if (amdgpu_device_has_dc_support(adev)) {
>  #if defined(CONFIG_DRM_AMD_DC)
>                         struct amdgpu_display_manager *dm = &adev->dm;
> +
>                         if (dm->backlight_dev[0])
>                                 atif->bd = dm->backlight_dev[0];
>  #endif
> @@ -863,6 +865,7 @@ int amdgpu_acpi_init(struct amdgpu_device *adev)
>                                 if ((enc->devices & (ATOM_DEVICE_LCD_SUPPORT)) &&
>                                     enc->enc_priv) {
>                                         struct amdgpu_encoder_atom_dig *dig = enc->enc_priv;
> +
>                                         if (dig->bl_dev) {
>                                                 atif->bd = dig->bl_dev;
>                                                 break;
> @@ -919,9 +922,9 @@ static bool amdgpu_atif_pci_probe_handle(struct pci_dev *pdev)
>                 return false;
>
>         status = acpi_get_handle(dhandle, "ATIF", &atif_handle);
> -       if (ACPI_FAILURE(status)) {
> +       if (ACPI_FAILURE(status))
>                 return false;
> -       }
> +
>         amdgpu_acpi_priv.atif.handle = atif_handle;
>         acpi_get_name(amdgpu_acpi_priv.atif.handle, ACPI_FULL_PATHNAME, &buffer);
>         DRM_DEBUG_DRIVER("Found ATIF handle %s\n", acpi_method_name);
> @@ -954,9 +957,9 @@ static bool amdgpu_atcs_pci_probe_handle(struct pci_dev *pdev)
>                 return false;
>
>         status = acpi_get_handle(dhandle, "ATCS", &atcs_handle);
> -       if (ACPI_FAILURE(status)) {
> +       if (ACPI_FAILURE(status))
>                 return false;
> -       }
> +
>         amdgpu_acpi_priv.atcs.handle = atcs_handle;
>         acpi_get_name(amdgpu_acpi_priv.atcs.handle, ACPI_FULL_PATHNAME, &buffer);
>         DRM_DEBUG_DRIVER("Found ATCS handle %s\n", acpi_method_name);
>
> base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
> --
> 2.34.1
>
