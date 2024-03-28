Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC20C88F5BB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 04:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140AE10E54B;
	Thu, 28 Mar 2024 03:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VNG0sAA9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D9E10E54B;
 Thu, 28 Mar 2024 03:08:57 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-5bdbe2de25fso326390a12.3; 
 Wed, 27 Mar 2024 20:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711595337; x=1712200137; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3JbUg1/8W4lnY9jEOzWjcb9pipkJTBqtEMv41Xz2F04=;
 b=VNG0sAA9UsusEqD0LuSEJTGMOsBMeLy9YZhUvJgKZpztJ0cVQ+8x1ohcdrrz68Ej4U
 Lp9fBG+I2EI6CfEYXg9EBsdQZSSYhbtZvAOTr9z0XUC4BGhnGI4Av/rfiGciTz8HLxny
 hU7Jd6ImJHRV+tMZ0hcn1jMbIh8ohhtINCx0Xj/eOINs0TGWKYEAaIUyp0q8LzWCVDxi
 ZkYhYO6Z/u4PM1sT0Cno1WE2MQfBZ56dkJrdQyzoBL0NlwRHekINCPwWJzdNjw6Ngqty
 c14vyXYJWU2Zr2lin1fk9eS+wFt/aRzYZeB/WplS9HNZspVhcMRpMUjltgieSRz96nV1
 7CVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711595337; x=1712200137;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3JbUg1/8W4lnY9jEOzWjcb9pipkJTBqtEMv41Xz2F04=;
 b=RIWNFfdVy82JUxcb5qLHMqYKA05ByGsQLuhqqdAonz8zgpTEnGOP+rkq2ABmQHT/mU
 9JlREX8g4hxiL1Dr5ZCll3ZWSDquJKYPqAS4tU6hz3/1W5EJtZWW0QKK5IoLH/x7lYb8
 5A0zetG9jRST0rPX6DVaHkpLVZSPBiqwAX0pJft8p4CTKi3nPW86dVWhWV9vXh0E8oMb
 eF+Qecw3sqzNcedL6x7WdcVIT3y2J/V2yFG8xDRKaP9UY2+xXvRo5vY2Yoa03GdDKceh
 RkPb8/sk4pRRQZCZ3aKyqnmAD3CM4fICoV+Pm1lbbNv2NaT94nv9yVZFtEv5cYOMMCcN
 2pwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVERVqLMxiE6SDFmz0f7bYGFTpzoU1UYaKG87Lt1QlJAJ5h8NbMH3gT32xmACMvDoDoFO6fp8kw5sXluP3k5xbFVjYN+xT4AJiKtKfW9mMGDg4dKY+yn7ygcFqOorbrKMhWhnq6G0J3v10fxWLTg==
X-Gm-Message-State: AOJu0Yyw6EUiH25bWMwN8rOK8HqVz7SxAerfl22nJhfyCDtgZXh7vewj
 n/FPBbNWyaYT7EVZe4HMCpV5CFc3LSlobk1TV08GWhWTqa+PoUakQKbyLDsfz7rRYbg3FyKtn0P
 70b0KuOgSR1gOAwcc1dcTLZwEnrmkFJnL6Qg=
X-Google-Smtp-Source: AGHT+IHW70Qvi9bbhqfYQ9h2KqQnuqI6cgGc6j0/u2kopPAqC7d7T1Ny9gjijWM9ZiyLmlsj8kVmX+XN7k5SA1XrcJA=
X-Received: by 2002:a05:6a20:5498:b0:1a5:6a16:f6c3 with SMTP id
 i24-20020a056a20549800b001a56a16f6c3mr1663466pzk.38.1711595336575; Wed, 27
 Mar 2024 20:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240326173142.2324624-1-sunil.khatri@amd.com>
In-Reply-To: <20240326173142.2324624-1-sunil.khatri@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 27 Mar 2024 23:08:44 -0400
Message-ID: <CADnq5_ONivR7io0w6vkHsQSSMnNCRJU=XdDD6D6SQZ8t9o3FAA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: add IP's FW information to devcoredump
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>
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

On Tue, Mar 26, 2024 at 1:31=E2=80=AFPM Sunil Khatri <sunil.khatri@amd.com>=
 wrote:
>
> Add FW information of all the IP's in the devcoredump.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>

Might want to include the vbios version info as well, e.g.,
atom_context->name
atom_context->vbios_pn
atom_context->vbios_ver_str
atom_context->date

Either way,
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> index 44c5da8aa9ce..d598b6520ec9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> @@ -69,6 +69,124 @@ const char *hw_ip_names[MAX_HWIP] =3D {
>         [PCIE_HWIP]             =3D "PCIE",
>  };
>
> +static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
> +                                      struct drm_printer *p)
> +{
> +       uint32_t version;
> +       uint32_t feature;
> +       uint8_t smu_program, smu_major, smu_minor, smu_debug;
> +
> +       drm_printf(p, "VCE feature version: %u, fw version: 0x%08x\n",
> +                  adev->vce.fb_version, adev->vce.fw_version);
> +       drm_printf(p, "UVD feature version: %u, fw version: 0x%08x\n", 0,
> +                  adev->uvd.fw_version);
> +       drm_printf(p, "GMC feature version: %u, fw version: 0x%08x\n", 0,
> +                  adev->gmc.fw_version);
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
> +                  adev->gfx.mec_feature_version, adev->gfx.mec_fw_versio=
n);
> +
> +       if (adev->gfx.mec2_fw)
> +               drm_printf(p, "MEC2 feature version: %u, fw version: 0x%0=
8x\n",
> +                          adev->gfx.mec2_feature_version,
> +                          adev->gfx.mec2_fw_version);
> +
> +       drm_printf(p, "IMU feature version: %u, fw version: 0x%08x\n", 0,
> +                  adev->gfx.imu_fw_version);
> +       drm_printf(p, "PSP SOS feature version: %u, fw version: 0x%08x\n"=
,
> +                  adev->psp.sos.feature_version, adev->psp.sos.fw_versio=
n);
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
> +       drm_printf(
> +               p,
> +               "TA SECURE DISPLAY feature version: 0x%08x, fw version: 0=
x%08x\n",
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
> +       drm_printf(p,
> +                  "SMC feature version: %u, program: %d, fw version: 0x%=
08x (%d.%d.%d)\n",
> +                  0, smu_program, version, smu_major, smu_minor, smu_deb=
ug);
> +
> +       /* SDMA firmware */
> +       for (int i =3D 0; i < adev->sdma.num_instances; i++) {
> +               drm_printf(p,
> +                          "SDMA%d feature version: %u, firmware version:=
 0x%08x\n",
> +                          i, adev->sdma.instance[i].feature_version,
> +                          adev->sdma.instance[i].fw_version);
> +       }
> +
> +       drm_printf(p, "VCN feature version: %u, fw version: 0x%08x\n", 0,
> +                  adev->vcn.fw_version);
> +       drm_printf(p, "DMCU feature version: %u, fw version: 0x%08x\n", 0=
,
> +                  adev->dm.dmcu_fw_version);
> +       drm_printf(p, "DMCUB feature version: %u, fw version: 0x%08x\n", =
0,
> +                  adev->dm.dmcub_fw_version);
> +       drm_printf(p, "PSP TOC feature version: %u, fw version: 0x%08x\n"=
,
> +                  adev->psp.toc.feature_version, adev->psp.toc.fw_versio=
n);
> +
> +       version =3D adev->mes.kiq_version & AMDGPU_MES_VERSION_MASK;
> +       feature =3D (adev->mes.kiq_version & AMDGPU_MES_FEAT_VERSION_MASK=
) >>
> +                 AMDGPU_MES_FEAT_VERSION_SHIFT;
> +       drm_printf(p, "MES_KIQ feature version: %u, fw version: 0x%08x\n"=
,
> +                  feature, version);
> +
> +       version =3D adev->mes.sched_version & AMDGPU_MES_VERSION_MASK;
> +       feature =3D (adev->mes.sched_version & AMDGPU_MES_FEAT_VERSION_MA=
SK) >>
> +                 AMDGPU_MES_FEAT_VERSION_SHIFT;
> +       drm_printf(p, "MES feature version: %u, fw version: 0x%08x\n", fe=
ature,
> +                  version);
> +
> +       drm_printf(p, "VPE feature version: %u, fw version: 0x%08x\n",
> +                  adev->vpe.feature_version, adev->vpe.fw_version);
> +}
> +
>  static ssize_t
>  amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>                         void *data, size_t datalen)
> @@ -118,6 +236,10 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset,=
 size_t count,
>                 }
>         }
>
> +       /* IP firmware information */
> +       drm_printf(&p, "\nIP Firmwares\n");
> +       amdgpu_devcoredump_fw_info(coredump->adev, &p);
> +
>         if (coredump->ring) {
>                 drm_printf(&p, "\nRing timed out details\n");
>                 drm_printf(&p, "IP Type: %d Ring Name: %s\n",
> --
> 2.34.1
>
