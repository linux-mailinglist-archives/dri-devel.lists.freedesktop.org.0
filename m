Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9E47EE80B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 21:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0450910E6D8;
	Thu, 16 Nov 2023 20:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9A110E6D0;
 Thu, 16 Nov 2023 20:01:32 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1ef9f1640a5so620670fac.3; 
 Thu, 16 Nov 2023 12:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700164891; x=1700769691; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5F/bRACSm+KB9HqCPptTC4wnPimDAu4Tx2OSkrkdoQs=;
 b=Kkta51S5b/JPKeje36J5BPBcYdH4EkWnb+WoREZrmz7g0d6a2OQKyAeC1Njby5mDIE
 j9y1sG/pXyFpXis/tYESpUPsc6af5Z99PnoRyqQMMPVlT3f2VqcfVds29JzNwFV1e/iw
 ryEwV0mQ7q0V/RM0UsOUo6H0b/Olge0RMxrbwCOKXy8NEBuSBE8n/nXYasWqleM1umBq
 aOETR1iRD0SyFcvWFmieS/si4whzA2m55YVoaF+YmBvR2g8KCUP6kJ5cfhq7BRPud0MM
 4XSW0RDRZoZZvHmN7jzoDAqP/ixUuXbmnlie0bBtfqRQ0TgXnn6GRoqc68BpbZsy2sQ+
 Zq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700164891; x=1700769691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5F/bRACSm+KB9HqCPptTC4wnPimDAu4Tx2OSkrkdoQs=;
 b=rFkx2zqgSc8HGE8fu0SeQDxzVekS1ViBcILUwgPhFnZjsOAqxhhKgmc55KrnzBRZi8
 Ig31skqBEz8fY4WfMmGN1+qL1BImrJ/1MceVzMnzlRL1nP5MYboui4OykcTl6ojVL+wK
 Z7DlfZl2qMQhErj2lNpgPiGlkg7wV9XmNMB7NQLqfmcNSFJJ9hx5S0NcOLe77Zp/eSoJ
 WLxdJW4j36rTjWANjJaL6jfSVuaYETmpbVxtyz8q78NIo8lT1FMo36OdWVos95PPEbHU
 fHUGPcmN8Yt82eGz0l91A4xgnk1B36l7i9JIh8OoRrlTrdtp419liN2B9j50l3LWHR1I
 8+Ug==
X-Gm-Message-State: AOJu0Yyx3l7aFLHInVMw8X+KVOBeShYRiugS0ViMfL3ZvvSdOb0ejUXy
 Qr9gIKhAVFWA5bybIM4XtI4ToKbLJMZaHhzULqGTTlKd
X-Google-Smtp-Source: AGHT+IFIN8bwGRrQxflEzWWxXE5Gr3CVLYY+pkoS2zfF+G1/FFhZzzoNEh8/iT12Y98vW/4ZjMSvtf3sxtGvLbdDprc=
X-Received: by 2002:a05:6870:e85:b0:1e9:cdad:4903 with SMTP id
 mm5-20020a0568700e8500b001e9cdad4903mr20368203oab.50.1700164891382; Thu, 16
 Nov 2023 12:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20231110172328.27451-1-andrealmeid@igalia.com>
In-Reply-To: <20231110172328.27451-1-andrealmeid@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Nov 2023 15:01:19 -0500
Message-ID: <CADnq5_P9Kpw3_eVaEc_g8E3viTYT=JVvpqOVPV_CEYH8oaJEig@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd: Document device reset methods
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

On Fri, Nov 10, 2023 at 12:23=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@ig=
alia.com> wrote:
>
> Document what each amdgpu driver reset method does.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>

Applied with Randy's suggestion.  Thanks!

Alex

> ---
> v2: Add more details and small correction (Alex)
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index a79d53bdbe13..c4675572f907 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -504,6 +504,31 @@ struct amdgpu_allowed_register_entry {
>         bool grbm_indexed;
>  };
>
> +/**
> + * enum amd_reset_method - Methods for resetting AMD GPU devices
> + *
> + * @AMD_RESET_METHOD_NONE: The device will not be reset.
> + * @AMD_RESET_LEGACY: Method reserved for SI, CIK and VI ASICs.
> + * @AMD_RESET_MODE0: Reset the entire ASIC. Not currently available for =
the
> + *                   any device.
> + * @AMD_RESET_MODE1: Resets all IP blocks on the ASIC (SDMA, GFX, VCN, e=
tc.)
> + *                   individually. Suitable only for some discrete GPU, =
not
> + *                   available for all ASICs.
> + * @AMD_RESET_MODE2: Resets a lesser level of IPs compared to MODE1. Whi=
ch IPs
> + *                   are reset depends on the ASIC. Notably doesn't rese=
t IPs
> + *                   shared with the CPU on APUs or the memory controlle=
rs (so
> + *                   VRAM is not lost). Not available on all ASICs.
> + * @AMD_RESET_BACO: BACO (Bus Alive, Chip Off) method powers off and on =
the card
> + *                  but without powering off the PCI bus. Suitable only =
for
> + *                  discrete GPUs.
> + * @AMD_RESET_PCI: Does a full bus reset using core Linux subsystem PCI =
reset
> + *                 and does a secondary bus reset or FLR, depending on w=
hat the
> + *                 underlying hardware supports.
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
