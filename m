Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56243A5E870
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 00:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2311110E69D;
	Wed, 12 Mar 2025 23:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GGIdQwmx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D2010E69D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 23:31:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4B0F9A44DE7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 23:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D96F0C4CEED
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 23:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741822274;
 bh=0FIfOKtTFqDx8sOyM2/0xeZkZ1+MOAxFl+Cuyc/3Nls=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GGIdQwmxR8nUUfD7Lzz31qb1s1rmqhY/JV3IIbF0dIeqkYUh7PCjX5tV3OIt2ChJB
 4AIHjNgubzZHGonlGQrAu8E3efAupoPc09z/ktbTeF+GG+JN5YJPIS4NQ/IsroevJK
 M66J0gTPOI1CbX1gwwTovgIsRDblB/ymF90cg6HVh5jrCeFLwqWcrxQ4cPQaCk+KYC
 YhWSt9uxyWWGrvXVMVTGQzEfC4hYxAGD+pXPTA9j/q3ec2ufqJjwjFr+zdRj+61nTz
 j3Yek9nm0irhlkMW3+0Q2NMWmc19UC8D/VD/HTwl97TeZwzGOWwmiI2WHRZ+ILmDGA
 KEbaABtI/NViw==
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2feb96064e4so897145a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 16:31:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWcZBwIutMu5B3j3nNoMdcswrMCFvC8KajfFdWCX+gq8UEy+IbZ2KirqfF1fn7Fztv/B7kor7sXDiM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/9Bg4/5jUijqmeAFzhDjAJRnLe6y85pz44FWheRmTRLLXMEVn
 zV9lYZGpcAmtbw3kP+dvw5yrEW/fcKs9YzpQwMHnPMitzI5UseQrYBZZC/dTi1Cb2LK3iqcOWHm
 jKh+2rNBTHc9tUqfamVQi94aAzA==
X-Google-Smtp-Source: AGHT+IEEEh4O5Kiec3VUO0CDJ2gaa3Qh4/pD7cDIWd+oHbt2InzI4dvUTLi5SMsyxG4sK9hhfjV+fbZColeLXtpafP0=
X-Received: by 2002:a17:90b:3887:b0:2f4:4003:f3ea with SMTP id
 98e67ed59e1d1-2ff7cef99c2mr40636176a91.33.1741822274428; Wed, 12 Mar 2025
 16:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250310132759.3345-1-chunkuang.hu@kernel.org>
 <CAPM=9txoJ3ZOyrcr-FikFAMHSdt3dOFAt=+TvBHFuPTXzH5qvQ@mail.gmail.com>
In-Reply-To: <CAPM=9txoJ3ZOyrcr-FikFAMHSdt3dOFAt=+TvBHFuPTXzH5qvQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 13 Mar 2025 07:32:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-xpp22oCT2u1qssFo_-Dz2FMTtzOKWJVgr7KgXK3DUoQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpePEnQ2cAumHPt5pTwQz9_z9O1wnbZyRwmIti1fdbx5LhZCLS7P1r3G3s
Message-ID: <CAAOTY_-xpp22oCT2u1qssFo_-Dz2FMTtzOKWJVgr7KgXK3DUoQ@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm next for 6.15
To: Dave Airlie <airlied@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Douglas Anderson <dianders@chromium.org>, Fabien Parent <fparent@baylibre.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
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

Hi, Dave:

Dave Airlie <airlied@gmail.com> =E6=96=BC 2025=E5=B9=B43=E6=9C=8812=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=887:40=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hey,
>
> This introduced a warning on my local builds,
>
> commit 30d5c46444a6aa4c78103fb898250ab5e6e8a97d
> Author: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Date:   Mon Feb 24 13:12:21 2025 +0800
>
>     drm/mediatek: Fix config_updating flag never false when no mbox chann=
el
>
>   CC [M]  drivers/gpu/drm/mediatek/mtk_dp.o
> /raid1/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/mediatek/mtk_crt=
c.c:
> In function =E2=80=98mtk_crtc_update_config=E2=80=99:
> /raid1/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/mediatek/mtk_crt=
c.c:630:1:
> warning: label =E2=80=98update_config_out=E2=80=99 defined but not used
> [-Wunused-label]
>   630 | update_config_out:
>       | ^~~~~~~~~~~~~~~~~
>
> Please fix and resend,

Sorry not find this. I've fixed this and resend pull request.

Regards,
Chun-Kuang.

> Thanks,
> Dave.
>
> On Mon, 10 Mar 2025 at 23:37, Chun-Kuang Hu <chunkuang.hu@kernel.org> wro=
te:
> >
> > Hi, Dave & Daniel:
> >
> > This includes:
> > 1. HDMI fixup and refinement
> > 2. Move to devm_platform_ioremap_resource() usage
> > 3. Add MT8188 dsc compatible
> > 4. Fix config_updating flag never false when no mbox channel
> > 5. dp: drm_err =3D> dev_err in HPD path to avoid NULL ptr
> > 6. Add dpi power-domains example
> > 7. Add MT8365 SoC support
> > 8. Fix error codes in mtk_dsi_host_transfer()
> >
> > Regards,
> > Chun-Kuang.
> >
> > The following changes since commit 2014c95afecee3e76ca4a56956a936e23283=
f05b:
> >
> >   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.gi=
t tags/mediatek-drm-next-6.15
> >
> > for you to fetch changes up to 8c9d519aa138aa36c0c3f201ff336b17b0ba32b2=
:
> >
> >   drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer() (2025-0=
3-03 13:26:03 +0000)
> >
> > ----------------------------------------------------------------
> > Mediatek DRM Next for Linux 6.15
> >
> > 1. HDMI fixup and refinement
> > 2. Move to devm_platform_ioremap_resource() usage
> > 3. Add MT8188 dsc compatible
> > 4. Fix config_updating flag never false when no mbox channel
> > 5. dp: drm_err =3D> dev_err in HPD path to avoid NULL ptr
> > 6. Add dpi power-domains example
> > 7. Add MT8365 SoC support
> > 8. Fix error codes in mtk_dsi_host_transfer()
> >
> > ----------------------------------------------------------------
> > AngeloGioacchino Del Regno (21):
> >       drm/mediatek: mtk_hdmi: Unregister audio platform device on failu=
re
> >       drm/mediatek: mtk_hdmi: Fix typo for aud_sampe_size member
> >       drm/mediatek: mtk_hdmi: Compress of_device_id array entries
> >       drm/mediatek: mtk_hdmi: Move vendor/product strings to drm_bridge
> >       drm/mediatek: mtk_hdmi: Remove unused members of struct mtk_hdmi
> >       drm/mediatek: mtk_hdmi: Use devm managed version of drm_bridge_ad=
d
> >       drm/mediatek: mtk_hdmi: Remove ifdef for CONFIG_PM_SLEEP
> >       drm/mediatek: mtk_hdmi: Remove goto in mtk_hdmi_clk_enable_audio(=
)
> >       drm/mediatek: mtk_hdmi: Remove driver bound to HDMI print
> >       drm/mediatek: mtk_hdmi: Cleanup function mtk_hdmi_resume()
> >       dt-bindings: display: mediatek: dpi: Add MT8195 and MT8188 compat
> >       drm/mediatek: mtk_dpi: Add support for Pattern Generator in debug=
fs
> >       drm/mediatek: mtk_dpi: Use an array for pixclk factor calculation
> >       drm/mediatek: mtk_dpi: Move pixel clock setting flow to function
> >       drm/mediatek: mtk_dpi: Add checks for reg_h_fre_con existence
> >       drm/mediatek: mtk_dpi: Move the input_2p_en bit to platform data
> >       drm/mediatek: mtk_dpi: Add support for DPI input clock from HDMI
> >       drm/mediatek: mtk_dpi: Support AFIFO 1T1P output and conversion
> >       drm/mediatek: mtk_dpi: Explicitly manage TVD clock in power on/of=
f
> >       drm/mediatek: Add support for MT8195 Digital Parallel Interface
> >       dt-bindings: display: mediatek: dsc: Add MT8188 compatible
> >
> > Anusha Srivatsa (1):
> >       drm/mediatek: Move to devm_platform_ioremap_resource() usage
> >
> > Dan Carpenter (1):
> >       drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer()
> >
> > Douglas Anderson (1):
> >       drm/mediatek: dp: drm_err =3D> dev_err in HPD path to avoid NULL =
ptr
> >
> > Fabien Parent (2):
> >       dt-bindings: display: mediatek: dpi: add power-domains example
> >       drm/mediatek: add MT8365 SoC support
> >
> > Jason-JH Lin (1):
> >       drm/mediatek: Fix config_updating flag never false when no mbox c=
hannel
> >
> >  .../bindings/display/mediatek/mediatek,dpi.yaml    |   7 +
> >  .../bindings/display/mediatek/mediatek,dsc.yaml    |   3 +
> >  drivers/gpu/drm/mediatek/mtk_crtc.c                |   5 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_color.c          |   4 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |   4 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_merge.c          |   4 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |   4 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   4 +-
> >  drivers/gpu/drm/mediatek/mtk_dp.c                  |   6 +-
> >  drivers/gpu/drm/mediatek/mtk_dpi.c                 | 323 +++++++++++++=
++------
> >  drivers/gpu/drm/mediatek/mtk_dpi_regs.h            |   9 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  10 +
> >  drivers/gpu/drm/mediatek/mtk_dsi.c                 |  10 +-
> >  drivers/gpu/drm/mediatek/mtk_hdmi.c                | 108 +++----
> >  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |   4 +-
> >  15 files changed, 334 insertions(+), 171 deletions(-)
