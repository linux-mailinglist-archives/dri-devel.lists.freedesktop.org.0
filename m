Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6102AADEE3A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA28310E83A;
	Wed, 18 Jun 2025 13:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PWCKmb+l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950C910E83A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 13:44:48 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54e98f73850so6543121e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 06:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254287; x=1750859087;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EOnqA9glXHMp+wjKPZ26EK/2be4ewo0aSocx50Gz+sQ=;
 b=PWCKmb+lu37jyArlOnidM8eBjSynCWR0wWlAfSzUzbLBz+TwgDmr9RXubHEVDMXgS2
 J+JioCdyIKPWYorb1blQtO7MwHvslCMKB9V3wyzXWdj0Po77xZViAo+SCRPgjXgJRNK4
 /9nEC+aTnqbqcvp/drfERhEYZ2YxF4I50MpS/GIjIDkVJlNZ/Dxzwfy/b256U5+gOUQi
 JhR0DbDSjKzfPNu+pfk9TfDiwCni7UnkIqEWgkZJM5c6fjfrxhnqthqmyjcxfLDz8d3O
 bZxk7AZGIwAHusUezf59VS8w1EaOv9Av2Ll0NXNvrNJudk1ugTvvRjwlKpLorYZ3qPKY
 CWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750254287; x=1750859087;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EOnqA9glXHMp+wjKPZ26EK/2be4ewo0aSocx50Gz+sQ=;
 b=gLDcLzlRMzkbaY3x2k6Du6V13rLksB54rr7EIIzICTgC6KxYAPg2nZ8+jNVp5aBZXC
 pSL1EUaeW+VOze2BXLUlHoLlGQnLR0VT98gh5u+vcaGkQFqVy8/iiYoXeIK+vHdzsrIF
 i4VNrKYIaacZRHlEF57ko7u/tRY8Q2wCKkGiy8t7vBuAZNcd5zHd4VH7maAPljB5VAKL
 Udv+5GJUGLyrqdAfdCIg1iKQ/tL47VuMHVsnDa7MFoyxVkFG39cER5FDpTIZ07EbRQL2
 dAQ99NRUOX8LB8UZdoTUJeeI+156xB5T2AE5Elu25+Czi51Nu3qy2YXVrttHMD4e0O5k
 lblg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6jNK0Xo93pf2pZc2S2Z/fQ5KXTJ0flnO35WLmwCSzLtQvVg76KR4yjHuW+aZHUwnRLFi3dnYTqrI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0Dg/6L51OVtGCBlMt/jbA6Pg08yVwbNUgwbJv/6jzzM0uii21
 NZZxL8rihdizI/kQe5UjcoCrLT23XQitG46Rje0KVZn0rHqf4YR4ZLR2bRnB4LtQCYhl7QyUpYX
 2EF21+QNH+0Ix2DaKpIXLqvGpqjYQ/Dtih/nUSBfvVg==
X-Gm-Gg: ASbGncut+goPsaykzxmnLzd2EqMU0NuZywZZ4HDf6bcbZxYvRyKvaHGteOwIVMxP8zr
 v5iMNYYq20K3uCXqUdsARut9qRs35nL2UzKEG4TDsAvBVezPBValqkjWAa32BMyTqYNWUic31bl
 K0PoAYPeBDnhaMq2V937knAP6YurCjecmhjumZfwaU4qLuyyZ5t14vIyi71dRkOOFkvzFKcQWzp
 g==
X-Google-Smtp-Source: AGHT+IH6Ld+eVfdvk23fMVj2Sr97EjUVBPbCt4xJwvj5ob6oDsk8hpgZs7OsgvSQaNDiPWolo67AHI2eB2C2BKgawwc=
X-Received: by 2002:a05:6512:3ba5:b0:553:25f4:695c with SMTP id
 2adb3069b0e04-553b6f4470cmr4999420e87.50.1750254287228; Wed, 18 Jun 2025
 06:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102234eucas1p2a1899b494c5ed75e0f39ea517d81c81d@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <20250618-apr_14_for_sending-v5-8-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-8-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:44:35 +0200
X-Gm-Features: AX0GCFuxF3RhQHueJgJf3bU829GFZMlCkCu1kP_wz3N4DTe6r8qi2RcA-BS33s4
Message-ID: <CAMRc=MdXmtZ3EbPDSGQeVaH40oZS7yc8MSMO2TbHza+F2HnBng@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] drm/imagination: Enable PowerVR driver for RISC-V
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Wed, Jun 18, 2025 at 12:22=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Several RISC-V boards feature Imagination GPUs that are compatible with
> the PowerVR driver. An example is the IMG BXM-4-64 GPU on the Lichee Pi
> 4A board. This commit adjusts the driver's Kconfig dependencies to allow
> the PowerVR driver to be compiled on the RISC-V architecture.
>
> By enabling compilation on RISC-V, we expand support for these GPUs,
> providing graphics acceleration capabilities and enhancing hardware
> compatibility on RISC-V platforms.
>
> Add a dependency on MMU to fix a build warning on RISC-V configurations
> without an MMU and enable COMPILE_TEST to improve build coverage.
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/gpu/drm/imagination/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagin=
ation/Kconfig
> index 5f9fff43d6baadc42ebf48d91729bfbf27e06caa..48fd31c031628c70b1e095227=
1baccf7f4694810 100644
> --- a/drivers/gpu/drm/imagination/Kconfig
> +++ b/drivers/gpu/drm/imagination/Kconfig
> @@ -3,9 +3,10 @@
>
>  config DRM_POWERVR
>         tristate "Imagination Technologies PowerVR (Series 6 and later) &=
 IMG Graphics"
> -       depends on ARM64
> +       depends on (ARM64 || RISCV) || COMPILE_TEST

Some maintainers could say that the COMPILE_TEST bit should be a
separate commit but it's typically fine with me.

>         depends on DRM
>         depends on PM
> +       depends on MMU
>         select DRM_EXEC
>         select DRM_GEM_SHMEM_HELPER
>         select DRM_SCHED
>
> --
> 2.34.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
