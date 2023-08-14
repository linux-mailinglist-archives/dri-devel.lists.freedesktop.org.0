Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F1977BF58
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 19:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C52A10E223;
	Mon, 14 Aug 2023 17:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8280410E221;
 Mon, 14 Aug 2023 17:53:26 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3a812843f0fso32169b6e.2; 
 Mon, 14 Aug 2023 10:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692035606; x=1692640406;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DNj4Ehy/sfd0pFzOH9dNZTRBv9sp3KUM4KIPo2H4CmY=;
 b=rN42HWWDFze8qvsP/5ZO5xHNVC1uJACbX1HAtVkEbdgDXR1+Bfdrm1H+0/7J4sJImJ
 oW2Y8orP6PAthtO1xZ3wQaRWB8YwRMcAJiTXh6YScl+8WM7UW36db95j/Bih10gi3eyX
 2ceDPLBzqQNeUnSckxy8FE2wOuuHIKM7XnXdrgYsWQd9OqT1PH5ffT8x7X9cELduQDDS
 I2+TovgvXXmA1otGD4LzagdMAN89bIGTRIE3pBzqLb4/Kq/RyPLV75k6meF6eeG5QKze
 4F/6NrcAg+UAW5vAozvCRLjnyFnYakzvFDQsRBPymTtzaCbADc6K6iKoe+XMcpYOF+Ji
 UXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692035606; x=1692640406;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DNj4Ehy/sfd0pFzOH9dNZTRBv9sp3KUM4KIPo2H4CmY=;
 b=eC+Sv9gdE+eQF26fUAwmsN9WYfVAuCUXY28rzTkhBdsxEXlJpSBCqvRwy7hUGZr5RL
 bD9Tia0dSyNLMRMsOCyHA5UQq7TjprzGU+R6vxklQoR5BWtiiObfM7Ic73mIj4AwOTRe
 2CXX63DmrGUbVbhV6gYn4gleUbE8BVrHczSTbIshD8mXhkJIQ1Ao34B1wWiPP+x511by
 QUpFu1xH+UbdjBeGuWQ6qnYjyQFbKaOj0D5ISzgFBy54B8O5Togtr0GZU0RbtNjdzi3X
 b6boDnZdP9Hcd82Ho/xf89Ld4GFKd6qrv9yOT+wkmNGBy9THuVPtXTxBfTSWVSL5Liyc
 xgdw==
X-Gm-Message-State: AOJu0YxMYLwQgPurlb+w0K7QvSrH645biuLm6fAwfnJP+PsS3lzblMLX
 KKKsVYe8zDdxoinLFj4jmm7iHjZjco9yxhLOeAhRT5+O
X-Google-Smtp-Source: AGHT+IGJXHhBOUTVGCeeiEOn2js4InfzSyxZIwh2hBBvYmWwgDTWI6octp0dURI2oWFYuqtzBpHx3gdNmZPVQNUPUmE=
X-Received: by 2002:a05:6870:424c:b0:1be:c688:1cc with SMTP id
 v12-20020a056870424c00b001bec68801ccmr8400287oac.5.1692035605733; Mon, 14 Aug
 2023 10:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230731093009.3243-1-sunran001@208suo.com>
In-Reply-To: <20230731093009.3243-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Aug 2023 13:53:14 -0400
Message-ID: <CADnq5_Mmzv0-UmRX5fowsg6AOBmBvsWPjm2FSHmxL4oLF_MVDg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in amdgpu_smu.h
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 31, 2023 at 5:30=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrot=
e:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following enum go on the same line
> ERROR: open brace '{' following struct go on the same line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h | 36 +++++++------------
>  1 file changed, 12 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/=
drm/amd/pm/swsmu/inc/amdgpu_smu.h
> index 6e2069dcb6b9..190a90b24d74 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> @@ -200,29 +200,25 @@ struct smu_power_state {
>         struct smu_hw_power_state                     hardware;
>  };
>
> -enum smu_power_src_type
> -{
> +enum smu_power_src_type {
>         SMU_POWER_SOURCE_AC,
>         SMU_POWER_SOURCE_DC,
>         SMU_POWER_SOURCE_COUNT,
>  };
>
> -enum smu_ppt_limit_type
> -{
> +enum smu_ppt_limit_type {
>         SMU_DEFAULT_PPT_LIMIT =3D 0,
>         SMU_FAST_PPT_LIMIT,
>  };
>
> -enum smu_ppt_limit_level
> -{
> +enum smu_ppt_limit_level {
>         SMU_PPT_LIMIT_MIN =3D -1,
>         SMU_PPT_LIMIT_CURRENT,
>         SMU_PPT_LIMIT_DEFAULT,
>         SMU_PPT_LIMIT_MAX,
>  };
>
> -enum smu_memory_pool_size
> -{
> +enum smu_memory_pool_size {
>      SMU_MEMORY_POOL_SIZE_ZERO   =3D 0,
>      SMU_MEMORY_POOL_SIZE_256_MB =3D 0x10000000,
>      SMU_MEMORY_POOL_SIZE_512_MB =3D 0x20000000,
> @@ -282,8 +278,7 @@ struct smu_clock_info {
>         uint32_t max_bus_bandwidth;
>  };
>
> -struct smu_bios_boot_up_values
> -{
> +struct smu_bios_boot_up_values {
>         uint32_t                        revision;
>         uint32_t                        gfxclk;
>         uint32_t                        uclk;
> @@ -305,8 +300,7 @@ struct smu_bios_boot_up_values
>         uint32_t                        firmware_caps;
>  };
>
> -enum smu_table_id
> -{
> +enum smu_table_id {
>         SMU_TABLE_PPTABLE =3D 0,
>         SMU_TABLE_WATERMARKS,
>         SMU_TABLE_CUSTOM_DPM,
> @@ -326,8 +320,7 @@ enum smu_table_id
>         SMU_TABLE_COUNT,
>  };
>
> -struct smu_table_context
> -{
> +struct smu_table_context {
>         void                            *power_play_table;
>         uint32_t                        power_play_table_size;
>         void                            *hardcode_pptable;
> @@ -390,8 +383,7 @@ struct smu_power_context {
>  };
>
>  #define SMU_FEATURE_MAX        (64)
> -struct smu_feature
> -{
> +struct smu_feature {
>         uint32_t feature_num;
>         DECLARE_BITMAP(supported, SMU_FEATURE_MAX);
>         DECLARE_BITMAP(allowed, SMU_FEATURE_MAX);
> @@ -416,21 +408,18 @@ struct mclock_latency_table {
>         struct mclk_latency_entries  entries[MAX_REGULAR_DPM_NUM];
>  };
>
> -enum smu_reset_mode
> -{
> +enum smu_reset_mode {
>      SMU_RESET_MODE_0,
>      SMU_RESET_MODE_1,
>      SMU_RESET_MODE_2,
>  };
>
> -enum smu_baco_state
> -{
> +enum smu_baco_state {
>         SMU_BACO_STATE_ENTER =3D 0,
>         SMU_BACO_STATE_EXIT,
>  };
>
> -struct smu_baco_context
> -{
> +struct smu_baco_context {
>         uint32_t state;
>         bool platform_support;
>         bool maco_support;
> @@ -478,8 +467,7 @@ struct stb_context {
>
>  #define WORKLOAD_POLICY_MAX 7
>
> -struct smu_context
> -{
> +struct smu_context {
>         struct amdgpu_device            *adev;
>         struct amdgpu_irq_src           irq_source;
>
> --
> 2.17.1
>
