Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D2F2B0EEF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 21:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87786E424;
	Thu, 12 Nov 2020 20:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1836E424
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 20:17:28 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id w24so6634160wmi.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 12:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TtsMF+MN/EjJ2tU2AFkBzjTCVvgr6vVGUB1QBLbRYvc=;
 b=QPs3CScVl6sufRqmzIKyM24+2zhbZ32UGep0EI7aIVdVOxoWkhg0I2aOjXGWtBsa6T
 KNjhB3dfPMJmvHGAbXXqsWa/Sj11m72su9F2OiWIicOzrz6DY9z5jM0Q2G3t/FiCOulz
 3kAYEkGmfcdomj5uGwCPHxgAFTR4kXTxvJbwZGQENtQ+x6vCDPDTfZnw/QwD/KJ3ZbjZ
 zEZCDdq9Yg98OHUPxCCZ/dgibgoSb66GujmQ5wdwMUU79HlYaccYxzGPvpovGyl/eDda
 5x4YqeftAX2iHxU6BwEhdwmX45MOCp8VcE8JvLjRCDNZtaAQqo0fwCoVvoenhSX1BH7D
 qNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TtsMF+MN/EjJ2tU2AFkBzjTCVvgr6vVGUB1QBLbRYvc=;
 b=EyAIx+TV8S2zDQb3b51tVU7MDfbMIS4N1SMOrr3+y8ZU4z0mziM6+9+Zs5msrEEbXc
 nk+6vle8iEVip75TxBb74zChtXBNm+g7KL1qm6FOo1z1wkoY9QVLRQ6Briz8aL/eHch7
 kp/HnQIBXHnBX7A3a7vU8uKRWfM0/fJ9e989ctJEXOyTUEiYoIOVdieb0r8vAWdEbELo
 S2Jg7gb1a7v0/rkEI7lK7PxnP6QOW22a+QZlWhVbeTBtSAmWwhaqRfYAVtlgjL7DFXmz
 rBPZ+nDIZLKANCP8bB2/zuevvax7I/CdUqH1zPuBTYrFxjMv0x/Zp9oj4j5Fg1jMh5ps
 hHaQ==
X-Gm-Message-State: AOAM533CRe4XlC7jTE8RjXxryIQHWg5HmfWHikcc5RjXkTUeVxs2bC7g
 MwnlDeoc7Kg3n3UAw2mZ+/crqhMcMNLgAX2Ldo8=
X-Google-Smtp-Source: ABdhPJwgwkJ1gJNOD+8dF3xcroI2kzo5RCDpN3DbgNQ7HO8cbGbJOTu8ef4GONRdPvzyBh+zU/MsYuThgNdp7SQaqfI=
X-Received: by 2002:a05:600c:2319:: with SMTP id
 25mr1421344wmo.102.1605212247443; 
 Thu, 12 Nov 2020 12:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20201112153536.85696-1-rajib.mahapatra@amd.com>
In-Reply-To: <20201112153536.85696-1-rajib.mahapatra@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Nov 2020 15:17:16 -0500
Message-ID: <CADnq5_OWDEzjSnpaL0xJgf+VfVrbt-ECMmfvv84zv3hgpajPQQ@mail.gmail.com>
Subject: Re: [PATCH] amdgpu/test: deadlock test for CZ family and RV family
To: rajib.mahapatra@amd.com
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 12, 2020 at 10:36 AM <rajib.mahapatra@amd.com> wrote:
>
> From: Rajib Mahapatra <Rajib.Mahapatra@amd.com>
>
> It enables the test for RV2 and PCO, whole GPU reset is not supported
> for others.
>
> Signed-off-by: Rajib Mahapatra <Rajib.Mahapatra@amd.com>
> Change-Id: Id51605d07b334ecea7a88b3c95fdd57008a4458d

libdrm uses gltlab merge requests.  Please file a gitlab MR for the change:
https://gitlab.freedesktop.org/mesa/drm/-/merge_requests

Alex

> ---
>  include/drm/amdgpu_drm.h      | 15 +++++++++++++++
>  tests/amdgpu/deadlock_tests.c | 18 ++++++++++++++++--
>  2 files changed, 31 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/amdgpu_drm.h b/include/drm/amdgpu_drm.h
> index be84e43c..bb7ded25 100644
> --- a/include/drm/amdgpu_drm.h
> +++ b/include/drm/amdgpu_drm.h
> @@ -995,6 +995,21 @@ struct drm_amdgpu_info_vce_clock_table {
>  #define AMDGPU_FAMILY_AI                       141 /* Vega10 */
>  #define AMDGPU_FAMILY_RV                       142 /* Raven */
>
> +/*
> + * Asic Rev
> + */
> +#define RAVEN_A0 0x01
> +#define PICASSO_A0 0x41
> +
> +#define RAVEN2_A0 0x81
> +#define RAVEN_UNKNOWN 0xFF
> +
> +#define PICASSO_15D8_REV_E3 0xE3
> +
> +#define ASICREV_IS_RAVEN(eChipRev) ((eChipRev >= RAVEN_A0) && eChipRev < RAVEN_UNKNOWN)
> +#define ASICREV_IS_PICASSO(eChipRev) ((eChipRev >= PICASSO_A0) && (eChipRev < RAVEN2_A0))
> +#define ASICREV_IS_RAVEN2(eChipRev) ((eChipRev >= RAVEN2_A0) && (eChipRev < PICASSO_15D8_REV_E3))
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> diff --git a/tests/amdgpu/deadlock_tests.c b/tests/amdgpu/deadlock_tests.c
> index a6c2635d..3be99dc8 100644
> --- a/tests/amdgpu/deadlock_tests.c
> +++ b/tests/amdgpu/deadlock_tests.c
> @@ -126,8 +126,22 @@ CU_BOOL suite_deadlock_tests_enable(void)
>         if (device_handle->info.family_id != AMDGPU_FAMILY_VI &&
>             device_handle->info.family_id != AMDGPU_FAMILY_AI &&
>             device_handle->info.family_id != AMDGPU_FAMILY_CI) {
> -               printf("\n\nGPU reset is not enabled for the ASIC, deadlock suite disabled\n");
> -               enable = CU_FALSE;
> +               if (device_handle->info.family_id == AMDGPU_FAMILY_CZ) {
> +                       printf("\n\nWhole GPU reset is not supported for the ASIC, deadlock suite disabled\n");
> +                       enable = CU_FALSE;
> +               } else if (device_handle->info.family_id == AMDGPU_FAMILY_RV) {
> +                       if (ASICREV_IS_RAVEN2(device_handle->info.chip_external_rev)) {
> +                               enable = CU_TRUE;
> +                       } else if (ASICREV_IS_PICASSO(device_handle->info.chip_external_rev)) {
> +                               enable = CU_TRUE;
> +                       } else {
> +                               printf("\n\nWhole GPU reset is not supported for the ASIC, deadlock suite disabled\n");
> +                               enable = CU_FALSE;
> +                       }
> +               } else {
> +                       printf("\n\nGPU reset is not enabled for the ASIC, deadlock suite disabled\n");
> +                       enable = CU_FALSE;
> +               }
>         }
>
>         if (device_handle->info.family_id >= AMDGPU_FAMILY_AI)
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
