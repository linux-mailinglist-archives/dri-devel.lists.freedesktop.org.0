Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF677E7DF4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 18:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E5510E128;
	Fri, 10 Nov 2023 17:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F7810E11F;
 Fri, 10 Nov 2023 17:01:51 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1ef9f1640a5so1180507fac.3; 
 Fri, 10 Nov 2023 09:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699635711; x=1700240511; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sMrYZbRlgCXN0jdJWgsU4bTo4xTt1FXQt6GOccDcYUQ=;
 b=cm04iJvF+gpJK+rzOFu7+Mn0ExXXzdP/8fHjjTxTFuOh85kgdtnXJ09/S16VMIAiFF
 2BXvWPMIHDZrIVoBcSfRyMFclQPJZ9wV5sQTufytJrOxUxtsCu78gXUgmIqlaVP5bkC5
 tG+L8f3fVgU98hoY9QYYzHSHSwfbhN5PkayeQjcl4yoj2LOfB95+OCKfj+utXdzcPB7h
 OjI2wDa7BwarENuzPx0WN/VOBS4CvxXPrRdAVcyomvYBFtQXiPYHp6jLMA1quSIIWi19
 UTDVbL4Bbh17ZgK8jTIXl26SOfaCnuVs6wVgk8XjEGvZ/efQB0JU2TVGLjPfdfPpWEUq
 cptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699635711; x=1700240511;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sMrYZbRlgCXN0jdJWgsU4bTo4xTt1FXQt6GOccDcYUQ=;
 b=vJpcdmJzofez/MhmCjTSQIoEZKMreUFcG0b7SQ1SAqjM+ahqCKfXxu3Vph2/X9bXsB
 MH3BvX9MnRhJbORo7zygExFpHX+72ZDlOEvbElpD6dk1cTq5EVJfaJxb/VCi608Q0Dug
 o0oeapinQpT5Y+c4MgGJvKHG/eSutyfSI5yIuJ9GUIjjtRAR8TBg8+/4m373tip6hRDB
 4vg6OZDxL4jIL3fSZ2+DviMYoN9VuHTAOrdwpl+ec+emCwU4tmU5Artdk9cuo6kXKLXo
 3OrC+C7F08HuOyXLmLHSbfChHYYTSzpqtou7hIf+1j4VqCirzwteNcm2M6F/hHEhpmQ8
 Whwg==
X-Gm-Message-State: AOJu0YzQh9mb/zJaObavgD8I43IjTTI/KqJtDq7ZpTr4T21Fy8uTlh2g
 pbeCkusV9J1hlAWt4yWLvmYrA7wNXINP1immZ1E=
X-Google-Smtp-Source: AGHT+IFl+/Nl/Vd6SMC08TbrrJikc5Cwz1liEKDu9OSvpC5Ug3/XWtCFUFE0q3JqNBokWuXM1Cv+CweVjxik2T5qJ+E=
X-Received: by 2002:a05:6870:1090:b0:1f0:d96:8d9f with SMTP id
 16-20020a056870109000b001f00d968d9fmr7573876oaq.57.1699635710907; Fri, 10 Nov
 2023 09:01:50 -0800 (PST)
MIME-Version: 1.0
References: <20231110155548.20599-1-andrealmeid@igalia.com>
In-Reply-To: <20231110155548.20599-1-andrealmeid@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Nov 2023 12:01:39 -0500
Message-ID: <CADnq5_MOQXiUkyobpuEAnNmcX2jFbEvva+1bm4hrRQ0aguPFag@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Document device reset methods
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 ray.huang@amd.com, dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 10, 2023 at 10:56=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@ig=
alia.com> wrote:
>
> Document what each amdgpu driver reset method does.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index a79d53bdbe13..500f86c79eb7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -504,6 +504,26 @@ struct amdgpu_allowed_register_entry {
>         bool grbm_indexed;
>  };
>
> +/**
> + * enum amd_reset_method - Methods for resetting AMD GPU devices
> + *
> + * @AMD_RESET_METHOD_NONE: The device will not be reset.
> + * @AMD_RESET_LEGACY: Method reserved for SI/CIK asics.

This also applies to VI asics.

> + * @AMD_RESET_MODE0: High level PCIe reset.

Resets the entire ASIC.  Here for completeness, but not actually
available to the driver.

> + * @AMD_RESET_MODE1: Resets each IP block (SDMA, GFX, VCN, etc.) individ=
ually.
> + *                   Suitable only for some discrete GPUs.

Resets all IPs on the asic.  Not available on all asics.

> + * @AMD_RESET_MODE2: Resets only the GFX block. Useful for APUs, giving =
that
> + *                   the rest of IP blocks and SMU is shared with the CP=
U.

Resets a lesser level of IPs compared to MODE1.  Which IPs are reset
depends on the asic.  Notably doesn't reset IPs shared with the CPU on
APUs or the memory controllers (so VRAM is not lost).  Not available
on all asics.

> + * @AMD_RESET_BACO: BACO (Bus Alive, Chip Off) method powers off and on =
the card
> + *                  but without powering off the PCI bus. Suitable only =
for
> + *                  discrete GPUs.
> + * @AMD_RESET_PCI: Does a full bus reset, including powering on and off =
the
> + *                 card.

This calls into the core Linux PCI reset code and does a secondary bus
reset or FLR, depending on what the underlying hardware supports.

> + *
> + * Methods available for AMD GPU driver for resetting the device. Not al=
l
> + * methods are suitable for every device. User can overwrite the method =
using
> + * module parameter `reset_method`.
> + */
>  enum amd_reset_method {
>         AMD_RESET_METHOD_NONE =3D -1,
>         AMD_RESET_METHOD_LEGACY =3D 0,
> --
> 2.42.1
>
