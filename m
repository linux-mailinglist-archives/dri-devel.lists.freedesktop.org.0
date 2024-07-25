Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7157093C922
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 21:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C25910E2A9;
	Thu, 25 Jul 2024 19:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ob8yEPbT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E878810E28E;
 Thu, 25 Jul 2024 19:50:08 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1fc611a0f8cso10537285ad.2; 
 Thu, 25 Jul 2024 12:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721937008; x=1722541808; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9VSUodCp0iyrPyR9RoEZrdu/UPubf2TKzJKuqkmoXBY=;
 b=Ob8yEPbTjqPkWp41+wSISqWa/LAq1MoExYk+LPKzlkicqptAhNNlmmGTnZ+AXo8Esy
 uhhnm8eet722+o2EaFdBcEZ+fh0A5opgjpi5H2Yw6P6V8txeUS0epozhvSDPzF/xJ0DC
 uY5IroVKPjFToGZ69GC2mUgHWxNv2IsrtKnaRw4GK+DXguXzGN5J/cL/bRpJK7PQCtDU
 +FPBr0DZBRzwOAm6fLvn9UES9oq8UtxJ2vZn45CK++LczncHRPWlG26OrXX5tx5vWyix
 KoS36PUfBk2fdOa1KnAqtd08dyz3XI7VG1/HWkOYOd36AqC4iAJweiFAQ/sI9ALH2ZGd
 b/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721937008; x=1722541808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9VSUodCp0iyrPyR9RoEZrdu/UPubf2TKzJKuqkmoXBY=;
 b=g8PcrJP6YKOyXeJNdqeq55nLvWX7oJ/tW2u+KBEYEhjrocTc6J8+xqvrPOTPE5+7h2
 0WY6A/OtLQ61rlyScFNsYEcbii6c7i3qqyc2Re2MFq6yJVrIZ2f+Wj3leCV19+L80esv
 nFvPdozUsbLDs90YlxUGCiGO5TD+yO7SQovhCZUVQOGwWTHYegc7/eWWdKAKg7V0ocT6
 En398lgWH2og4WrV6cMpC3/rV2WuOSDA2+TpV84oa0hmcI2vAMTurNzMu8MypwsgyJJv
 nFa6HMuIkOL7rLONOPMwsRDBluA8gUu82RQONIhDSkpeXfQryG1fIYInUdUf0bsngIV9
 LoJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2kljrWciZfuFmoQKCSGCpCe1tFYyoiRToypsm0/C3/kUa/RWdmbypxDlVLk0KzQ3z9gvznr9XAtDp5x8bekpkQtlgEpsng69qmPnOV2HxLeTVcF/Y+3k5CGUr3GFZ2Rurvqdd207fGD0e6GxOVw==
X-Gm-Message-State: AOJu0YyXru/RCgu2Jll1bqQj7gcgPfZM8H7Ajxyncufk7vgkAzzRXfqt
 AMJ/PmJcwgdx4D5I39zXEZecvY7CDGB+Oh9itvR9cRQor3+BZl+Ffxd58HHmguBRyasvBCrfbsE
 3Y6Jqb9WTsOWIq+4vEA05Y0kSMZwGTw==
X-Google-Smtp-Source: AGHT+IHgrjq7amGcLdexxOnkH/4BLZ1r74+ivIwi5/7IOAGm0XWiiMDVklCFBl5hy5edRCK2xCjHv4+HekMm+tQmBvM=
X-Received: by 2002:a17:902:e550:b0:1fc:4763:445c with SMTP id
 d9443c01a7336-1fed92752c3mr33830085ad.32.1721937008312; Thu, 25 Jul 2024
 12:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240725015712.50237-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240725015712.50237-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 Jul 2024 15:49:55 -0400
Message-ID: <CADnq5_NkOR12Dxcpo6wZe4Act3-4JSoF=oC37464XfwVSqnrqA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: remove unneeded semicolon
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Abaci Robot <abaci@linux.alibaba.com>
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

Alex

On Wed, Jul 24, 2024 at 10:35=E2=80=AFPM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> No functional modification involved.
>
> ./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_=
calcs.c:481:2-3: Unneeded semicolon.
> ./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_=
calcs.c:3783:168-169: Unneeded semicolon.
> ./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_=
calcs.c:3782:166-167: Unneeded semicolon.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9575
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c      | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2=
_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_cor=
e/dml2_core_dcn4_calcs.c
> index 0b671c665373..e4a14d41fb85 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_d=
cn4_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_d=
cn4_calcs.c
> @@ -478,7 +478,7 @@ static unsigned int dml_get_tile_block_size_bytes(enu=
m dml2_swizzle_mode sw_mode
>         default:
>                 DML2_ASSERT(0);
>                 return 256;
> -       };
> +       }
>  }
>
>  static bool dml_is_vertical_rotation(enum dml2_rotation_angle Scan)
> @@ -3779,8 +3779,8 @@ static void CalculateSwathAndDETConfiguration(struc=
t dml2_core_internal_scratch
>                         p->SwathHeightC[k] =3D MaximumSwathHeightC[k] / 2=
;
>                         RoundedUpSwathSizeBytesY[k] =3D p->full_swath_byt=
es_l[k] / 2;
>                         RoundedUpSwathSizeBytesC[k] =3D p->full_swath_byt=
es_c[k] / 2;
> -                       p->request_size_bytes_luma[k] =3D ((p->BytePerPix=
Y[k] =3D=3D 2) =3D=3D dml_is_vertical_rotation(p->display_cfg->plane_descri=
ptors[k].composition.rotation_angle)) ? 128 : 64;;
> -                       p->request_size_bytes_chroma[k] =3D ((p->BytePerP=
ixC[k] =3D=3D 2) =3D=3D dml_is_vertical_rotation(p->display_cfg->plane_desc=
riptors[k].composition.rotation_angle)) ? 128 : 64;;
> +                       p->request_size_bytes_luma[k] =3D ((p->BytePerPix=
Y[k] =3D=3D 2) =3D=3D dml_is_vertical_rotation(p->display_cfg->plane_descri=
ptors[k].composition.rotation_angle)) ? 128 : 64;
> +                       p->request_size_bytes_chroma[k] =3D ((p->BytePerP=
ixC[k] =3D=3D 2) =3D=3D dml_is_vertical_rotation(p->display_cfg->plane_desc=
riptors[k].composition.rotation_angle)) ? 128 : 64;
>                 }
>
>                 if (p->SwathHeightC[k] =3D=3D 0)
> --
> 2.32.0.3.g01195cf9f
>
