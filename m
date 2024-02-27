Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF4C868798
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 04:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96CF10E1B0;
	Tue, 27 Feb 2024 03:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ssg/Qxyh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FCE10F2AA;
 Tue, 27 Feb 2024 03:14:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1E5AB61491;
 Tue, 27 Feb 2024 03:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2585C433C7;
 Tue, 27 Feb 2024 03:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709003661;
 bh=+NW+lDyow4SyOhdect9IQeTUOPcisVXIrgGQDYWrvvk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ssg/QxyhOJaeXFkrLJMUmAPDsXzwnBE39E8CbEID4AG+W2Lrcs0+nNu7jmx0PXCxF
 cnbeHjJ2SUUMjwauBStXvT5oqhuwl+v6R7c/65O4crURWAjGoIG22VNzPM5wlYBxTC
 8RNm0ixH0fdmzjPZFx1ToA7AKAsoY7v3onj4O/PjhYzQ+pV5nQ5FCM06JVhiW9BLgM
 fvqymuS0NHMjw1uv4TldwG+GVT0efutR1R4XYCijr5OQwgzD9PrSXMr3PBctISK76m
 VwAAeuTulVMVcsczI1+bN8+PB7Fop1CuC2BNuBppAYaGyzdqBqcX27lC0FvJQze6GK
 RW9Tp/Cv4uYqA==
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2d2991e8c12so2330231fa.0; 
 Mon, 26 Feb 2024 19:14:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXl8z0EKsibBqWEppgnceSepzbJWcVUmLNJfv8Ias/9qFFGQqeJrwBLVvuiM/FuHraMQR8Kpe/3t0UYsBv1YVBp5rFLy8EkrqDXXIcQU8i9H2kxL8iNDbLeJqkdxNVV/tbzUx8rKNnSZbYlM4oTMqJj
X-Gm-Message-State: AOJu0YzK+f2s9La5s04nkVNFm99nI42nb+Nm8hd1xTN3zVRiAbSyrsVm
 6IeKB87PramKSN32DYeorBrojLG090Wq6YMgpIF0lms6fvGJ0FSF9HWClYgMp+DALnRyV9lFeX9
 kQDA5X2dVhvPcqOq9+2cjmWNy7S0=
X-Google-Smtp-Source: AGHT+IHZR4anyPKBr3MB8qJcW7vCCqkYdpYN/Q5FVYBf6CE/Thk6VlcOx5h6wQFjPwPvyD+a8+DWJDi/ANHG223b+SE=
X-Received: by 2002:a2e:712:0:b0:2d2:8051:3248 with SMTP id
 18-20020a2e0712000000b002d280513248mr2491810ljh.18.1709003660412; Mon, 26 Feb
 2024 19:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
 <20240226-fd-xml-shipped-v1-5-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-5-86bb6c3346d2@linaro.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 27 Feb 2024 12:13:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNARi+VwYKfVy3c2B4NKJq_VxMKQE8t8fWBF4qXJfNYA4JQ@mail.gmail.com>
Message-ID: <CAK7LNARi+VwYKfVy3c2B4NKJq_VxMKQE8t8fWBF4qXJfNYA4JQ@mail.gmail.com>
Subject: Re: [PATCH RFC 05/12] drm/msm: use _shipped suffix for all xml.h files
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kbuild@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
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

On Mon, Feb 26, 2024 at 11:11=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Move non-GPU xml.h files into the ./registers subdir and add the
> _shipped suffix. The GPU files are left intact for now, since they
> require processing via a gen_headers.py, while display headers are
> regenerated using headergen2
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/Makefile                       | 53 ++++++++++++++++=
++----
>  .../{dsi/dsi.xml.h =3D> registers/dsi.xml.h_shipped} |  0
>  .../dsi_phy_10nm.xml.h_shipped}                    |  0
>  .../dsi_phy_14nm.xml.h_shipped}                    |  0
>  .../dsi_phy_20nm.xml.h_shipped}                    |  0
>  .../dsi_phy_28nm.xml.h_shipped}                    |  0
>  .../dsi_phy_28nm_8960.xml.h_shipped}               |  0
>  .../dsi_phy_7nm.xml.h_shipped}                     |  0
>  .../hdmi.xml.h =3D> registers/hdmi.xml.h_shipped}    |  0
>  .../mdp4.xml.h =3D> registers/mdp4.xml.h_shipped}    |  0
>  .../mdp5.xml.h =3D> registers/mdp5.xml.h_shipped}    |  0
>  .../mdp_common.xml.h_shipped}                      |  0
>  .../sfpb.xml.h =3D> registers/sfpb.xml.h_shipped}    |  0
>  13 files changed, 43 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 543e04fa72e3..89c9f5f93b85 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  ccflags-y :=3D -I $(srctree)/$(src)
> +ccflags-y :=3D -I $(obj)/registers


This accidentally overwrites ccflags-y defined above.
So, "-I $(srctree)/$(src)" is lost.



It should be

  ccflags-y +=3D -I $(obj)/registers



I see several build errors.





--=20
Best Regards
Masahiro Yamada
