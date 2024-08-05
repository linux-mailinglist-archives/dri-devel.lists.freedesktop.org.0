Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DDC9483C3
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 22:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B60010E2B4;
	Mon,  5 Aug 2024 20:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bdlDiEb4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED0C10E22D;
 Mon,  5 Aug 2024 20:56:27 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-70d1a74a43bso7921322b3a.1; 
 Mon, 05 Aug 2024 13:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722891387; x=1723496187; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/zps7GFsPk6v3LICq084Feq4cUqxiv2Dwwm6SIzfyvM=;
 b=bdlDiEb4L4y8bZNgvK0Gn90nshRaIrC0UVIjKhgVg+y76WiMs+lNTcVNPdUmKGNFox
 ogA9zJlsE4Bl1T9nKlcs3C4BTkn4Fn13PziZSt7YC3E/EQSKaovqjm0qVOPMtg2oSYiN
 3IgQQYzVaNEUXqxrL4GlKF4O7YRIbLhPu5khhEgo1ATrFIx3WCef5RgiJJEm5MURAYI8
 dTLHzbh8NcTsiVCLokHgRZ4ttsRHPub2BdSLxZ6EwqjRCC1wtsB1DALhdwu4q2nxGwnP
 TvaLWEnfibW6mQYDZ39XY7XD5iamV/ew8Mmn4DrmQmIo6/y4OyKIApbWDHQs2uC0djO9
 ZqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722891387; x=1723496187;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/zps7GFsPk6v3LICq084Feq4cUqxiv2Dwwm6SIzfyvM=;
 b=mvpWyvdedQ0NdGINQBJDFGrR4e/67dnQ/Y/JPwmFmyiX/cnCBaHMrbok5tKrEpkK0w
 loy7+tGUvmk56z5gs9S/yo3EjKqJPgIRUCXiRo4OTavvXVdRKwgOGcWTAPxrEgeFmjlU
 NRx5klvQzWEUx1LLaxqujMsHDNItawisNsbuxpGVgUjad9ov9Os6HEIK3REwMZ+CmDNd
 IRlG6eUIG3ch09148/5sKlcTdmk8VT680E+3NvcGs1pskTXHgMj4zzbPEMDi7NI/fCX7
 bMJhC+jkEQ4wIND6vV8uaKzSrfp+JKAcPmh1fxw2PRA5R0lLhhEBbfB2TPVDBlyfrglw
 IaUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfDRF0OybBHG/BODH7BrJD4T8dY0Lg5aOlAJXSm5Sy99dFtABFxec8FpVh0Mc0ipxmAlyqC4OpvUyl@lists.freedesktop.org,
 AJvYcCWtUSBu1G90mp2PBWiRvydnNEjSDVrlTAaTP4sEWN0dT8z1V5yr2/gESCI8OI5kg4FA51MlsyDC@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyx1jmsLxq/niPuVBSTEx3hny9IC9pbVcVF2IJrpMaT6rykPoUo
 qMTGd/zcOgdze/4af8Fvoy3IM8nnXk+3PwDZ2LOabAvQE+MgZXhEmHCNGS7wxzwQVW0s34T79a9
 ul0EOGpK3u9HeBCl8lxLotF39LkI=
X-Google-Smtp-Source: AGHT+IFygedKrccRzQ249fvxaiX09MI78DbeR6+nvbdpDPownt8LElhPJvJc8lssc8mUsZ3Uop8gA2HzGxUxwbL7zaw=
X-Received: by 2002:a05:6a00:ccb:b0:705:c029:c993 with SMTP id
 d2e1a72fcca58-7106cfcd2fcmr12248847b3a.14.1722891386536; Mon, 05 Aug 2024
 13:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <ae4d951d022e6c34b87ae46e15f1522f8d6d3480.1722355024.git.geert+renesas@glider.be>
In-Reply-To: <ae4d951d022e6c34b87ae46e15f1522f8d6d3480.1722355024.git.geert+renesas@glider.be>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 5 Aug 2024 16:56:13 -0400
Message-ID: <CADnq5_Ng1pLTYaP9k5jY1Cka=PfR9xhBzs0xWG+hK-CKO3cH1w@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/r100: Handle unknown family in
 r100_cp_init_microcode()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chris Down <chris@chrisdown.name>, Kees Cook <kees@kernel.org>, 
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Applied.  Thanks!

On Tue, Jul 30, 2024 at 12:05=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> With -Werror:
>
>     In function =E2=80=98r100_cp_init_microcode=E2=80=99,
>         inlined from =E2=80=98r100_cp_init=E2=80=99 at drivers/gpu/drm/ra=
deon/r100.c:1136:7:
>     include/linux/printk.h:465:44: error: =E2=80=98%s=E2=80=99 directive =
argument is null [-Werror=3Dformat-overflow=3D]
>       465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__=
VA_ARGS__)
>           |                                            ^
>     include/linux/printk.h:437:17: note: in definition of macro =E2=80=98=
printk_index_wrap=E2=80=99
>       437 |                 _p_func(_fmt, ##__VA_ARGS__);                =
           \
>           |                 ^~~~~~~
>     include/linux/printk.h:508:9: note: in expansion of macro =E2=80=98pr=
intk=E2=80=99
>       508 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>           |         ^~~~~~
>     drivers/gpu/drm/radeon/r100.c:1062:17: note: in expansion of macro =
=E2=80=98pr_err=E2=80=99
>      1062 |                 pr_err("radeon_cp: Failed to load firmware \"=
%s\"\n", fw_name);
>           |                 ^~~~~~
>
> Fix this by converting the if/else if/... construct into a proper
> switch() statement with a default to handle the error case.
>
> As a bonus, the generated code is ca. 100 bytes smaller (with gcc 11.4.0
> targeting arm32).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> ---
>  drivers/gpu/drm/radeon/r100.c | 70 ++++++++++++++++++++++-------------
>  1 file changed, 45 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.=
c
> index 0b1e19345f43a771..bfd42e3e161e984f 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -1016,45 +1016,65 @@ static int r100_cp_init_microcode(struct radeon_d=
evice *rdev)
>
>         DRM_DEBUG_KMS("\n");
>
> -       if ((rdev->family =3D=3D CHIP_R100) || (rdev->family =3D=3D CHIP_=
RV100) ||
> -           (rdev->family =3D=3D CHIP_RV200) || (rdev->family =3D=3D CHIP=
_RS100) ||
> -           (rdev->family =3D=3D CHIP_RS200)) {
> +       switch (rdev->family) {
> +       case CHIP_R100:
> +       case CHIP_RV100:
> +       case CHIP_RV200:
> +       case CHIP_RS100:
> +       case CHIP_RS200:
>                 DRM_INFO("Loading R100 Microcode\n");
>                 fw_name =3D FIRMWARE_R100;
> -       } else if ((rdev->family =3D=3D CHIP_R200) ||
> -                  (rdev->family =3D=3D CHIP_RV250) ||
> -                  (rdev->family =3D=3D CHIP_RV280) ||
> -                  (rdev->family =3D=3D CHIP_RS300)) {
> +               break;
> +
> +       case CHIP_R200:
> +       case CHIP_RV250:
> +       case CHIP_RV280:
> +       case CHIP_RS300:
>                 DRM_INFO("Loading R200 Microcode\n");
>                 fw_name =3D FIRMWARE_R200;
> -       } else if ((rdev->family =3D=3D CHIP_R300) ||
> -                  (rdev->family =3D=3D CHIP_R350) ||
> -                  (rdev->family =3D=3D CHIP_RV350) ||
> -                  (rdev->family =3D=3D CHIP_RV380) ||
> -                  (rdev->family =3D=3D CHIP_RS400) ||
> -                  (rdev->family =3D=3D CHIP_RS480)) {
> +               break;
> +
> +       case CHIP_R300:
> +       case CHIP_R350:
> +       case CHIP_RV350:
> +       case CHIP_RV380:
> +       case CHIP_RS400:
> +       case CHIP_RS480:
>                 DRM_INFO("Loading R300 Microcode\n");
>                 fw_name =3D FIRMWARE_R300;
> -       } else if ((rdev->family =3D=3D CHIP_R420) ||
> -                  (rdev->family =3D=3D CHIP_R423) ||
> -                  (rdev->family =3D=3D CHIP_RV410)) {
> +               break;
> +
> +       case CHIP_R420:
> +       case CHIP_R423:
> +       case CHIP_RV410:
>                 DRM_INFO("Loading R400 Microcode\n");
>                 fw_name =3D FIRMWARE_R420;
> -       } else if ((rdev->family =3D=3D CHIP_RS690) ||
> -                  (rdev->family =3D=3D CHIP_RS740)) {
> +               break;
> +
> +       case CHIP_RS690:
> +       case CHIP_RS740:
>                 DRM_INFO("Loading RS690/RS740 Microcode\n");
>                 fw_name =3D FIRMWARE_RS690;
> -       } else if (rdev->family =3D=3D CHIP_RS600) {
> +               break;
> +
> +       case CHIP_RS600:
>                 DRM_INFO("Loading RS600 Microcode\n");
>                 fw_name =3D FIRMWARE_RS600;
> -       } else if ((rdev->family =3D=3D CHIP_RV515) ||
> -                  (rdev->family =3D=3D CHIP_R520) ||
> -                  (rdev->family =3D=3D CHIP_RV530) ||
> -                  (rdev->family =3D=3D CHIP_R580) ||
> -                  (rdev->family =3D=3D CHIP_RV560) ||
> -                  (rdev->family =3D=3D CHIP_RV570)) {
> +               break;
> +
> +       case CHIP_RV515:
> +       case CHIP_R520:
> +       case CHIP_RV530:
> +       case CHIP_R580:
> +       case CHIP_RV560:
> +       case CHIP_RV570:
>                 DRM_INFO("Loading R500 Microcode\n");
>                 fw_name =3D FIRMWARE_R520;
> +               break;
> +
> +       default:
> +               DRM_ERROR("Unsupported Radeon family %u\n", rdev->family)=
;
> +               return -EINVAL;
>         }
>
>         err =3D request_firmware(&rdev->me_fw, fw_name, rdev->dev);
> --
> 2.34.1
>
