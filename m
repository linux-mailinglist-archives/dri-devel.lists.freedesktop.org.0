Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEB187CDEF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 14:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E3510E113;
	Fri, 15 Mar 2024 13:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JYITxDHf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5623410E113;
 Fri, 15 Mar 2024 13:15:17 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-29c731ba369so1672146a91.3; 
 Fri, 15 Mar 2024 06:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710508517; x=1711113317; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7xArLs+uRWKVcLaNLsdyx3ULVcbdPBPfj9m9G7izSGw=;
 b=JYITxDHfQu1ea1Dwj6tFQnhmI36+i+jNBPUil22Z6hcduooU/6XJXt8XtiM4TCT5dS
 ntqbhcjNLr3VDJWSR6DmAVD5wTtJu5UHRWpv1cIpcFPohE+tffSPIphXoE1XMK3u6zVT
 I2aLDjiMuJx3xhwxxUwWK4RFXLEKPc08t0jgDDG5UH9b1UH1UhsMYsHmlQ8MhTIJl1HE
 pECty76LPqovmfxCjTfs6gUndfWyJJv4gEOTVcZEeyF+RtjAQ8G5idVOWwVAE25PqsUz
 xa9F8hNBx6x5JDMCDm20ipHcH9wq12VC0sovg04RtB8zDspXbPpuSylE43/Uql+O5xpL
 zJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710508517; x=1711113317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7xArLs+uRWKVcLaNLsdyx3ULVcbdPBPfj9m9G7izSGw=;
 b=R5PyIBpF20/9VDhUN4udiLkiV14m1Xemw43VCYlTwEtj8ManqSgJbPeqJOZwUHTxV9
 zAOt5BrJj7YZpCK1PfE9pJlxPErSnoJKt0Y1BPhcfDk2e4oEMQrA4swHupLQ1pZb2g6w
 tJZ1He7GFsEvgFbqdUwz/iq6MnVSs0steCzNTeK13Yd06zfMZXz6bKWZH2cC2+aV/fdV
 tRMxxUxWk4hpeqWjOolhl8nmpygT2NVOJBQiubTXkhkgqggASTS8mDufIBOIWWebpak2
 OuQLcwvuaulLPWaa53ZQzYstBwXULq+bH7b+RCfgU0jXx4pnUjYtavgKdI+4cxvIEnPa
 ZlAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBcnp4qGMoclYTzpu/8FVqr8A5Ly4GIRU3EsvYW/Pp42h/mYc0lUsRIWZPxEwKrqWNbGysdhEnnsbefS/r0xOL3TrklKXUUqDh2sVBu5aupsZ3QEnGZ26221ZqhLOHRZ4hd2OkgwDFotdhdrXtnw==
X-Gm-Message-State: AOJu0YzaMLZHeIVBoBmfKyShtEU9rmx7YLDbCWkGC11qE784j8xFzTbd
 CqFomSztODEx7RD1ZuCaFIxix1mUpV5r30RCTFEjXgM7xGwI8GAHhvcrWdfMsAz+O49siRmAbnC
 4CmA2bg9VUDjSwCfF7gX97k6L0Kk=
X-Google-Smtp-Source: AGHT+IFszOtqZsBrsCaeD8AagP6jTW2qGgUUxVKCWna95eZpFtJXyEtQc+YvHuRJlO1PeqRIIw6BgYeFAlMEpQI+mFg=
X-Received: by 2002:a17:90a:ee93:b0:29b:22d2:9dd5 with SMTP id
 i19-20020a17090aee9300b0029b22d29dd5mr4615017pjz.38.1710508516676; Fri, 15
 Mar 2024 06:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240315121315.406601-1-sunil.khatri@amd.com>
In-Reply-To: <20240315121315.406601-1-sunil.khatri@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 15 Mar 2024 09:15:04 -0400
Message-ID: <CADnq5_NsqSWknj5x0v22iF2_UPCEFO7gnj4BV5j22x-jitO1=g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: add the hw_ip version of all IP's
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Fri, Mar 15, 2024 at 8:13=E2=80=AFAM Sunil Khatri <sunil.khatri@amd.com>=
 wrote:
>
> Add all the IP's version information on a SOC to the
> devcoredump.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>

This looks great.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 62 +++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_reset.c
> index a0dbccad2f53..3d4bfe0a5a7c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -29,6 +29,43 @@
>  #include "sienna_cichlid.h"
>  #include "smu_v13_0_10.h"
>
> +const char *hw_ip_names[MAX_HWIP] =3D {
> +       [GC_HWIP]               =3D "GC",
> +       [HDP_HWIP]              =3D "HDP",
> +       [SDMA0_HWIP]            =3D "SDMA0",
> +       [SDMA1_HWIP]            =3D "SDMA1",
> +       [SDMA2_HWIP]            =3D "SDMA2",
> +       [SDMA3_HWIP]            =3D "SDMA3",
> +       [SDMA4_HWIP]            =3D "SDMA4",
> +       [SDMA5_HWIP]            =3D "SDMA5",
> +       [SDMA6_HWIP]            =3D "SDMA6",
> +       [SDMA7_HWIP]            =3D "SDMA7",
> +       [LSDMA_HWIP]            =3D "LSDMA",
> +       [MMHUB_HWIP]            =3D "MMHUB",
> +       [ATHUB_HWIP]            =3D "ATHUB",
> +       [NBIO_HWIP]             =3D "NBIO",
> +       [MP0_HWIP]              =3D "MP0",
> +       [MP1_HWIP]              =3D "MP1",
> +       [UVD_HWIP]              =3D "UVD/JPEG/VCN",
> +       [VCN1_HWIP]             =3D "VCN1",
> +       [VCE_HWIP]              =3D "VCE",
> +       [VPE_HWIP]              =3D "VPE",
> +       [DF_HWIP]               =3D "DF",
> +       [DCE_HWIP]              =3D "DCE",
> +       [OSSSYS_HWIP]           =3D "OSSSYS",
> +       [SMUIO_HWIP]            =3D "SMUIO",
> +       [PWR_HWIP]              =3D "PWR",
> +       [NBIF_HWIP]             =3D "NBIF",
> +       [THM_HWIP]              =3D "THM",
> +       [CLK_HWIP]              =3D "CLK",
> +       [UMC_HWIP]              =3D "UMC",
> +       [RSMU_HWIP]             =3D "RSMU",
> +       [XGMI_HWIP]             =3D "XGMI",
> +       [DCI_HWIP]              =3D "DCI",
> +       [PCIE_HWIP]             =3D "PCIE",
> +};
> +
> +
>  int amdgpu_reset_init(struct amdgpu_device *adev)
>  {
>         int ret =3D 0;
> @@ -196,6 +233,31 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset,=
 size_t count,
>                            coredump->reset_task_info.process_name,
>                            coredump->reset_task_info.pid);
>
> +       /* GPU IP's information of the SOC */
> +       if (coredump->adev) {
> +
> +               drm_printf(&p, "\nIP Information\n");
> +               drm_printf(&p, "SOC Family: %d\n", coredump->adev->family=
);
> +               drm_printf(&p, "SOC Revision id: %d\n", coredump->adev->r=
ev_id);
> +               drm_printf(&p, "SOC External Revision id: %d\n",
> +                          coredump->adev->external_rev_id);
> +
> +               for (int i =3D 1; i < MAX_HWIP; i++) {
> +                       for (int j =3D 0; j < HWIP_MAX_INSTANCE; j++) {
> +                               int ver =3D coredump->adev->ip_versions[i=
][j];
> +
> +                               if (ver)
> +                                       drm_printf(&p, "HWIP: %s[%d][%d]:=
 v%d.%d.%d.%d.%d\n",
> +                                                  hw_ip_names[i], i, j,
> +                                                  IP_VERSION_MAJ(ver),
> +                                                  IP_VERSION_MIN(ver),
> +                                                  IP_VERSION_REV(ver),
> +                                                  IP_VERSION_VARIANT(ver=
),
> +                                                  IP_VERSION_SUBREV(ver)=
);
> +                       }
> +               }
> +       }
> +
>         if (coredump->ring) {
>                 drm_printf(&p, "\nRing timed out details\n");
>                 drm_printf(&p, "IP Type: %d Ring Name: %s\n",
> --
> 2.34.1
>
