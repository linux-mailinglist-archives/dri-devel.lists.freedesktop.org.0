Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD6287B2EF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 21:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA9D10E78F;
	Wed, 13 Mar 2024 20:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PJ3vijfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996FF10E78F;
 Wed, 13 Mar 2024 20:36:23 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-29bfc3ca816so301590a91.0; 
 Wed, 13 Mar 2024 13:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710362183; x=1710966983; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z0P1jMyCYtposYh4opD70xwEj0+xfXkkQO/G2AgEGYg=;
 b=PJ3vijfHT0bgl8b2CFNIVyqfnLesKkRgOskAxJZ80AYJSQDBHTAxi1tMYD8Ro6D3GC
 D7BwLEc1mXLVDNxo8T9hBZcKNJI12saamdZ+AGjiZKKNcfqAir7xbqTxNNovgvWrjNMF
 YGYT41sQDMh8znX9wX2ACj5ytnYdE0qu8ZHuTpz5pc+VQWvmmKH8/hCo0uO3Aqh35U9e
 BQSUu1KDY0lYBhgiKc1aoGtO5ll6wja1WDigulA1OlllJZfwMUYJNeKDdAnYov91q1Dg
 kvuvIxou6vJF0DgeLT5Jt9CEbvzAw6vLKnFFEKfixUyAKo31D2xXJfZ3CaG6RQC3vZB/
 eNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710362183; x=1710966983;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z0P1jMyCYtposYh4opD70xwEj0+xfXkkQO/G2AgEGYg=;
 b=q2eLo5aDu9CiuNAar4Nxun0x6/Qkhq2El5W01nNaTige+BqEjjT4ewtun5g9MrvMHV
 9W5nSKAeo+uGEKPLHXQJS8KV4Gq8zI8uk5dkMMfSg7Vt1LN5IdPu+DeROQ/ZrDkWqEJ2
 c8P574lus1RQwQTJAF11Ipjk681gXgPNOTtSQp1rMvWsGlT8t4nzYSbKbOXHJPZeq09h
 CrB0yW8+uWqkieragGhGsls8HzL/AWf5jf+q/Q99CNdDaZOni82plD+78QfMyV7jzcam
 Vqn7FK1bPP9t+1JCdR70O5Mg1qSBiqQl4cF9ghxlh3BpqExiklLKUUplFLq0PlfYOcQN
 pJJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2IP4ZmW7SphI5cbD9UgEOI33iVzKNUseduPecYLQ7SPW+I/+AprscEDNzD24sO9U3SR2yzcMmcJNbHqrfPfnLQsWgsQqc8DPt+5TO1vOlGPimUcIVYT1FvERY9URmMzev75AoxFslh6ahA/WbzQ==
X-Gm-Message-State: AOJu0YxI3NqX/Kxd9k6oRzgw4gABG+ufo7He0DdT0h634CteHb1JfDek
 e5Fm7KVls6iTZPzNR5Jb9wEKHNvvaTLEvkEpm3STqJqtl79zCceonc9r4ORdio2Xkch42Scq+E+
 ojzsa/kqyIHjz56S3ZlpTrkiuHho=
X-Google-Smtp-Source: AGHT+IE8QOUe7k7X0QgjCkT37L75/xjPFxnl01fGGykO8p1LaCf9vr0q8ZdUbELBJFYpJW6yKCReepjlKYkkQPaEXmo=
X-Received: by 2002:a17:90a:488f:b0:29b:ce33:492d with SMTP id
 b15-20020a17090a488f00b0029bce33492dmr11380791pjh.22.1710362182844; Wed, 13
 Mar 2024 13:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240312124148.257067-1-sunil.khatri@amd.com>
 <20240312124148.257067-2-sunil.khatri@amd.com>
In-Reply-To: <20240312124148.257067-2-sunil.khatri@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 13 Mar 2024 16:36:11 -0400
Message-ID: <CADnq5_ON0NfcpmnHKjNYWgxfvfz-J3tgjX92DaaN63iKb+FOZg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm:amdgpu: add firmware information of all IP's
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

On Tue, Mar 12, 2024 at 8:42=E2=80=AFAM Sunil Khatri <sunil.khatri@amd.com>=
 wrote:
>
> Add firmware version information of each
> IP and each instance where applicable.
>

Is there a way we can share some common code with devcoredump,
debugfs, and the info IOCTL?  All three places need to query this
information and the same logic is repeated in each case.

Alex


> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 122 ++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_reset.c
> index 611fdb90a1fc..78ddc58aef67 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -168,6 +168,123 @@ void amdgpu_coredump(struct amdgpu_device *adev, bo=
ol vram_lost,
>  {
>  }
>  #else
> +static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev, struc=
t drm_printer *p)
> +{
> +       uint32_t version;
> +       uint32_t feature;
> +       uint8_t smu_program, smu_major, smu_minor, smu_debug;
> +
> +       drm_printf(p, "VCE feature version: %u, fw version: 0x%08x\n",
> +                  adev->vce.fb_version, adev->vce.fw_version);
> +       drm_printf(p, "UVD feature version: %u, fw version: 0x%08x\n",
> +                  0, adev->uvd.fw_version);
> +       drm_printf(p, "GMC feature version: %u, fw version: 0x%08x\n",
> +                  0, adev->gmc.fw_version);
> +       drm_printf(p, "ME feature version: %u, fw version: 0x%08x\n",
> +                  adev->gfx.me_feature_version, adev->gfx.me_fw_version)=
;
> +       drm_printf(p, "PFP feature version: %u, fw version: 0x%08x\n",
> +                  adev->gfx.pfp_feature_version, adev->gfx.pfp_fw_versio=
n);
> +       drm_printf(p, "CE feature version: %u, fw version: 0x%08x\n",
> +                  adev->gfx.ce_feature_version, adev->gfx.ce_fw_version)=
;
> +       drm_printf(p, "RLC feature version: %u, fw version: 0x%08x\n",
> +                  adev->gfx.rlc_feature_version, adev->gfx.rlc_fw_versio=
n);
> +
> +       drm_printf(p, "RLC SRLC feature version: %u, fw version: 0x%08x\n=
",
> +                  adev->gfx.rlc_srlc_feature_version,
> +                  adev->gfx.rlc_srlc_fw_version);
> +       drm_printf(p, "RLC SRLG feature version: %u, fw version: 0x%08x\n=
",
> +                  adev->gfx.rlc_srlg_feature_version,
> +                  adev->gfx.rlc_srlg_fw_version);
> +       drm_printf(p, "RLC SRLS feature version: %u, fw version: 0x%08x\n=
",
> +                  adev->gfx.rlc_srls_feature_version,
> +                  adev->gfx.rlc_srls_fw_version);
> +       drm_printf(p, "RLCP feature version: %u, fw version: 0x%08x\n",
> +                  adev->gfx.rlcp_ucode_feature_version,
> +                  adev->gfx.rlcp_ucode_version);
> +       drm_printf(p, "RLCV feature version: %u, fw version: 0x%08x\n",
> +                  adev->gfx.rlcv_ucode_feature_version,
> +                  adev->gfx.rlcv_ucode_version);
> +       drm_printf(p, "MEC feature version: %u, fw version: 0x%08x\n",
> +                  adev->gfx.mec_feature_version,
> +                  adev->gfx.mec_fw_version);
> +
> +       if (adev->gfx.mec2_fw)
> +               drm_printf(p,
> +                          "MEC2 feature version: %u, fw version: 0x%08x\=
n",
> +                          adev->gfx.mec2_feature_version,
> +                          adev->gfx.mec2_fw_version);
> +
> +       drm_printf(p, "IMU feature version: %u, fw version: 0x%08x\n",
> +                  0, adev->gfx.imu_fw_version);
> +       drm_printf(p, "PSP SOS feature version: %u, fw version: 0x%08x\n"=
,
> +                  adev->psp.sos.feature_version,
> +                  adev->psp.sos.fw_version);
> +       drm_printf(p, "PSP ASD feature version: %u, fw version: 0x%08x\n"=
,
> +                  adev->psp.asd_context.bin_desc.feature_version,
> +                  adev->psp.asd_context.bin_desc.fw_version);
> +
> +       drm_printf(p, "TA XGMI feature version: 0x%08x, fw version: 0x%08=
x\n",
> +                  adev->psp.xgmi_context.context.bin_desc.feature_versio=
n,
> +                  adev->psp.xgmi_context.context.bin_desc.fw_version);
> +       drm_printf(p, "TA RAS feature version: 0x%08x, fw version: 0x%08x=
\n",
> +                  adev->psp.ras_context.context.bin_desc.feature_version=
,
> +                  adev->psp.ras_context.context.bin_desc.fw_version);
> +       drm_printf(p, "TA HDCP feature version: 0x%08x, fw version: 0x%08=
x\n",
> +                  adev->psp.hdcp_context.context.bin_desc.feature_versio=
n,
> +                  adev->psp.hdcp_context.context.bin_desc.fw_version);
> +       drm_printf(p, "TA DTM feature version: 0x%08x, fw version: 0x%08x=
\n",
> +                  adev->psp.dtm_context.context.bin_desc.feature_version=
,
> +                  adev->psp.dtm_context.context.bin_desc.fw_version);
> +       drm_printf(p, "TA RAP feature version: 0x%08x, fw version: 0x%08x=
\n",
> +                  adev->psp.rap_context.context.bin_desc.feature_version=
,
> +                  adev->psp.rap_context.context.bin_desc.fw_version);
> +       drm_printf(p, "TA SECURE DISPLAY feature version: 0x%08x, fw vers=
ion: 0x%08x\n",
> +               adev->psp.securedisplay_context.context.bin_desc.feature_=
version,
> +               adev->psp.securedisplay_context.context.bin_desc.fw_versi=
on);
> +
> +       /* SMC firmware */
> +       version =3D adev->pm.fw_version;
> +
> +       smu_program =3D (version >> 24) & 0xff;
> +       smu_major =3D (version >> 16) & 0xff;
> +       smu_minor =3D (version >> 8) & 0xff;
> +       smu_debug =3D (version >> 0) & 0xff;
> +       drm_printf(p, "SMC feature version: %u, program: %d, fw version: =
0x%08x (%d.%d.%d)\n",
> +                  0, smu_program, version, smu_major, smu_minor, smu_deb=
ug);
> +
> +       /* SDMA firmware */
> +       for (int i =3D 0; i < adev->sdma.num_instances; i++) {
> +               drm_printf(p, "SDMA%d feature version: %u, firmware versi=
on: 0x%08x\n",
> +                          i, adev->sdma.instance[i].feature_version,
> +                          adev->sdma.instance[i].fw_version);
> +       }
> +
> +       drm_printf(p, "VCN feature version: %u, fw version: 0x%08x\n",
> +                  0, adev->vcn.fw_version);
> +       drm_printf(p, "DMCU feature version: %u, fw version: 0x%08x\n",
> +                  0, adev->dm.dmcu_fw_version);
> +       drm_printf(p, "DMCUB feature version: %u, fw version: 0x%08x\n",
> +                  0, adev->dm.dmcub_fw_version);
> +       drm_printf(p, "PSP TOC feature version: %u, fw version: 0x%08x\n"=
,
> +                  adev->psp.toc.feature_version, adev->psp.toc.fw_versio=
n);
> +
> +       version =3D adev->mes.kiq_version & AMDGPU_MES_VERSION_MASK;
> +       feature =3D (adev->mes.kiq_version & AMDGPU_MES_FEAT_VERSION_MASK=
)
> +                                       >> AMDGPU_MES_FEAT_VERSION_SHIFT;
> +       drm_printf(p, "MES_KIQ feature version: %u, fw version: 0x%08x\n"=
,
> +                  feature, version);
> +
> +       version =3D adev->mes.sched_version & AMDGPU_MES_VERSION_MASK;
> +       feature =3D (adev->mes.sched_version & AMDGPU_MES_FEAT_VERSION_MA=
SK)
> +                                       >> AMDGPU_MES_FEAT_VERSION_SHIFT;
> +       drm_printf(p, "MES feature version: %u, fw version: 0x%08x\n",
> +                  feature, version);
> +
> +       drm_printf(p, "VPE feature version: %u, fw version: 0x%08x\n",
> +                  adev->vpe.feature_version, adev->vpe.fw_version);
> +
> +}
> +
>  static ssize_t
>  amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>                         void *data, size_t datalen)
> @@ -215,6 +332,11 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset,=
 size_t count,
>                 }
>         }
>
> +       if (coredump->adev) {
> +               drm_printf(&p, "IP Firmwares\n");
> +               amdgpu_devcoredump_fw_info(coredump->adev, &p);
> +       }
> +
>         if (coredump->ring) {
>                 drm_printf(&p, "\nRing timed out details\n");
>                 drm_printf(&p, "IP Type: %d Ring Name: %s\n",
> --
> 2.34.1
>
