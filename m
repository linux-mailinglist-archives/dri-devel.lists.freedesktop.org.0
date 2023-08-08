Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D995D7742C8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 19:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829C710E3BF;
	Tue,  8 Aug 2023 17:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA1A10E3BF;
 Tue,  8 Aug 2023 17:50:27 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6bb140cd5a5so4759581a34.3; 
 Tue, 08 Aug 2023 10:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691517027; x=1692121827;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TWlJx7PsGTyzNteTizSOpLqocXs80uEAAvr4LDlEbNM=;
 b=Y9f6L5zG+oB9hMT8iZBP2luaQtQobJkM0+UjPzcq0qLvEk/StZCKK5mxLpYnxHI09z
 g/HuM/AouCmsgTv2bPnUPnbRIBWiyEtgvfTVQMaIBRxDiZqlTvfaumIoFgpxHHHnZU0X
 nA+dcw7DftOBgRQX1k6APVkuCRZiOrgtfwcqu7dkoI/uUbvFOpfoMDFRoZszGQ63ZVe8
 ZUxwIXTspHjTF1S4CntGCaceocbiJkp9ImMPSO8aeYaFPX1wX3tAs/4RqeMBoIBqzFno
 ILfKPhrrzto7cmIPbRA+xy1r3Z1CL4sO492ZxwtGSXNrG8LXpfzlfQ712Xdp4zkwnZ69
 TYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691517027; x=1692121827;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TWlJx7PsGTyzNteTizSOpLqocXs80uEAAvr4LDlEbNM=;
 b=XXiUYI7rPnAisc6vAiE05wj6su/86wBC+gwAaLw4vTSA8hhlizo41f8dXLxGmai9Le
 Z6O1wYpJM6Civ/l6+mA1mg7Ai9hYOMLDMO0iiFgOEGuqFlL2cv3gA4X0mV/fZUfi5y+g
 oEotXX7U1GsEYeOd1PqiIm7Y3ozHgawZzcLd413hHOHa+u1asruVHnJ3LxjFpslcbGsp
 Dq6DMKOb4U4D2j6T2NJJ0hr+4txgmKP+8m2+A9ePjJLRKlDJazpHrIU2s2GS5Vndok7/
 gpcTtgGQERr5EvyrSHy6GC+MrFw+zIN/3l/lsBtbDAjch3o3L4zkPTaa2oYnwuovmQ1P
 gvQw==
X-Gm-Message-State: AOJu0YyKbwvPXQ8DAeA62hfzyGuU8AN+9uktV3uLYpI0LufF1nheSaxd
 ZkvLCr99JiHTt4dZ0bk8ydxBFpp7cItdivVG8Jc=
X-Google-Smtp-Source: AGHT+IETVRqfnG/9c8iZoK6+nFRVgBC6izPPN445czcLvx6cDq2hzxlQx2J2ourQD3gT3YZyAR+vvdV76pmlJSPbJuo=
X-Received: by 2002:a05:6871:b1e:b0:1b0:43b6:e13b with SMTP id
 fq30-20020a0568710b1e00b001b043b6e13bmr363559oab.54.1691517026883; Tue, 08
 Aug 2023 10:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230807131759.107914-1-wangxiongfeng2@huawei.com>
In-Reply-To: <20230807131759.107914-1-wangxiongfeng2@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Aug 2023 13:50:15 -0400
Message-ID: <CADnq5_NyoEkOOBJ3pw5i9nMCXp+BVXqeBzAdmkwVNWOHh-gtnw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Use pci_dev_id() to simplify the code
To: Xiongfeng Wang <wangxiongfeng2@huawei.com>
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
Cc: tim.huang@amd.com, lijo.lazar@amd.com, srinivasan.shanmugam@amd.com,
 amd-gfx@lists.freedesktop.org, Bokun.Zhang@amd.com, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, le.ma@amd.com, mario.limonciello@amd.com,
 yangyingliang@huawei.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Aug 7, 2023 at 9:22=E2=80=AFAM Xiongfeng Wang <wangxiongfeng2@huawe=
i.com> wrote:
>
> PCI core API pci_dev_id() can be used to get the BDF number for a pci
> device. We don't need to compose it mannually. Use pci_dev_id() to
> simplify the code a little bit.
>
> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_acpi.c
> index 385c6acb5728..aee0cfdc6da3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -706,7 +706,7 @@ int amdgpu_acpi_pcie_performance_request(struct amdgp=
u_device *adev,
>
>         atcs_input.size =3D sizeof(struct atcs_pref_req_input);
>         /* client id (bit 2-0: func num, 7-3: dev num, 15-8: bus num) */
> -       atcs_input.client_id =3D adev->pdev->devfn | (adev->pdev->bus->nu=
mber << 8);
> +       atcs_input.client_id =3D pci_dev_id(adev->pdev);
>         atcs_input.valid_flags_mask =3D ATCS_VALID_FLAGS_MASK;
>         atcs_input.flags =3D ATCS_WAIT_FOR_COMPLETION;
>         if (advertise)
> @@ -776,7 +776,7 @@ int amdgpu_acpi_power_shift_control(struct amdgpu_dev=
ice *adev,
>
>         atcs_input.size =3D sizeof(struct atcs_pwr_shift_input);
>         /* dGPU id (bit 2-0: func num, 7-3: dev num, 15-8: bus num) */
> -       atcs_input.dgpu_id =3D adev->pdev->devfn | (adev->pdev->bus->numb=
er << 8);
> +       atcs_input.dgpu_id =3D pci_dev_id(adev->pdev);
>         atcs_input.dev_acpi_state =3D dev_state;
>         atcs_input.drv_state =3D drv_state;
>
> @@ -1141,7 +1141,7 @@ int amdgpu_acpi_get_tmr_info(struct amdgpu_device *=
adev, u64 *tmr_offset,
>         if (!tmr_offset || !tmr_size)
>                 return -EINVAL;
>
> -       bdf =3D (adev->pdev->bus->number << 8) | adev->pdev->devfn;
> +       bdf =3D pci_dev_id(adev->pdev);
>         dev_info =3D amdgpu_acpi_get_dev(bdf);
>         if (!dev_info)
>                 return -ENOENT;
> @@ -1162,7 +1162,7 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device *=
adev, int xcc_id,
>         if (!numa_info)
>                 return -EINVAL;
>
> -       bdf =3D (adev->pdev->bus->number << 8) | adev->pdev->devfn;
> +       bdf =3D pci_dev_id(adev->pdev);
>         dev_info =3D amdgpu_acpi_get_dev(bdf);
>         if (!dev_info)
>                 return -ENOENT;
> --
> 2.20.1
>
