Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9394399D3C6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 17:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2B910E47D;
	Mon, 14 Oct 2024 15:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m3cFn/Bk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA14510E47D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 15:45:46 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2e2b71fd16fso788569a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 08:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728920746; x=1729525546; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=urBdkgegMF7XQRvU3yEsW/lOkG2RPkpWnSJ5/Oj21Uo=;
 b=m3cFn/BkEHFLLqHOdj552LOZHhT/EpgXjlIufp1FwjfbPhDn+Rk1GAEgsg4R8okv/3
 5/SLL9bJQnNGFX7CHnLoTvd7Lb9huB+iZxFNAqNFvszu1UzKn8iIqCapUM2PD/HcMe02
 WqwOHvNyhV1zT1atMSjkZ3MWue5Z/5FfsOAfD1rUeK6Fc4J1JfGd7UuoKsb1T5TqOGAu
 NORvVH/e7wlWydwEAwPEbN56SrUAxntZ9Y1Of5/9jM/nuoaVfP9DaCzhLRPVIvStIn1R
 AubvWjuGd2pbZlaZC2qEkfjMwBkUIVYZhHfs0GVwKW6WndH6kde0rSMPsDfFWfRfIS0z
 mGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728920746; x=1729525546;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=urBdkgegMF7XQRvU3yEsW/lOkG2RPkpWnSJ5/Oj21Uo=;
 b=Vu+UhQACZB1YOQHlxbhb3XhAfXg572szSM0aL6bJJIDc+qgkGVhUL0Pi3QvMDRZQUu
 cQSXBEyuVs+pl9QDmXfZZ5CebcpH57Mwg/A52Ew8B3ywwpyOIOJSn8Xa+wdVTBCmJSTN
 w5S/AEjtetzKcE3medJJVUyQ0GzbDG5KuUAQE2HlwVmfStWKeqH6xpqqp/QkPG0xk8nu
 YB4Ksxzk4u4uLYlo+9BMe4O0pUWdsJRxudZ1exiutjitql/sFHWsTMQhr514nEKRwbsh
 jybTkTrZpT4kxskWxX2URGTnAMF4jJfdvfPlojFHstl60z9MnMmf/5fK8mO5Ye9iJr/6
 zLOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqiD5JyRWhpImPNr9MY2Xv1ajkfbATHTRKlVda5dN2zGKWCtSHLu+6M6EpNixiJPDtSodYfawzQ4I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxam52bxlC/txr8fdPFJx5M90i0l74h5hTP0WjbTD47ncOPJ4fR
 BxTbTD8kyrK1XsKKsGu7wzX2fqk9jv9u73q3d8a/7qYyMCUSrWqkbQZPgXcMXCX/BMvOP16B6QI
 zyKH06nxgPgPn8AabLTP55d0WpJe0Qw==
X-Google-Smtp-Source: AGHT+IFsBRoPEXbTXS5Ff46RFH5X1jTMu4OeBPJkvDso2hrabHpmHawU+KMeOBCQH9atwTLfKwg8xP9P9VMxCT5ReGE=
X-Received: by 2002:a17:90a:474f:b0:2e1:682b:361e with SMTP id
 98e67ed59e1d1-2e2f0c3b7e4mr5933462a91.4.1728920746330; Mon, 14 Oct 2024
 08:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20241014152502.1477809-1-superm1@kernel.org>
In-Reply-To: <20241014152502.1477809-1-superm1@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Oct 2024 11:45:34 -0400
Message-ID: <CADnq5_PCHZtmGN4Frknz+10xVMypwpDuW7_kYbTmvihcayCPew@mail.gmail.com>
Subject: Re: [PATCH] PCI/VGA: Don't assume only VGA device found is the boot
 VGA device
To: Mario Limonciello <superm1@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 dri-devel@lists.freedesktop.org, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 "Luke D . Jones" <luke@ljones.dev>
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

On Mon, Oct 14, 2024 at 11:25=E2=80=AFAM Mario Limonciello <superm1@kernel.=
org> wrote:
>
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> The ASUS GA605W has a NVIDIA PCI VGA device and an AMD PCI display device=
.
>
> ```
> 65:00.0 VGA compatible controller: NVIDIA Corporation AD106M [GeForce RTX=
 4070 Max-Q / Mobile] (rev a1)
> 66:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Strix =
[Radeon 880M / 890M] (rev c1)
> ```

For clarity, the iGPU is not a VGA class device.  The "primary" should
not have any dependency on the VGA PCI class, but I'm not sure how
exactly the kernel handles this case.  In this case, the primary
should be the iGPU which is not a VGA PCI class device.

Alex

>
> The fallback logic in vga_is_boot_device() flags the NVIDIA dGPU as the
> boot VGA device, but really the eDP is connected to the AMD PCI display
> device.
>
> Drop this case to avoid marking the NVIDIA dGPU as the boot VGA device.
>
> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
> Reported-by: Luke D. Jones <luke@ljones.dev>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3673
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/pci/vgaarb.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 78748e8d2dba..05ac2b672d4b 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -675,13 +675,6 @@ static bool vga_is_boot_device(struct vga_device *vg=
adev)
>                 return true;
>         }
>
> -       /*
> -        * Vgadev has neither IO nor MEM enabled.  If we haven't found an=
y
> -        * other VGA devices, it is the best candidate so far.
> -        */
> -       if (!boot_vga)
> -               return true;
> -
>         return false;
>  }
>
> --
> 2.43.0
>
