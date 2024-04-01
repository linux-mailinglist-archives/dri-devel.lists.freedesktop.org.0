Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC018943F3
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 19:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C068710F32D;
	Mon,  1 Apr 2024 17:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d7PHVCRQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162BD10F32D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 17:10:10 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-415523d9824so24036805e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 10:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711991408; x=1712596208; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cOLKrFXode7RL7ZHvCqUyHCs2EwpfvvlesdpnmleB6M=;
 b=d7PHVCRQ0+TOet3YzEyYyCiT4vducNYC758bgeajliEYi/NvJRCpM2+1V4VEN96pQ0
 XW5vn6ZZizXgaGyNd+Z7Pu6f1bPXEQOLradgbIFhVc4P28dKs6/ulJlSJcorcx4md2IB
 bQbr3afijNGdvR1KXNDX9iG33hkL5j5b8EJQyMO2gt21Dh7D71JAF8pwzkbYjy713jm7
 rbcgiv9lT+CMV6xprVqfpprGxVjby4zTS9GyoIqAs54zJG8IbLV7X/Z3DNgjGFnUfQEs
 OiEzM9sKhlIotjWA44myY4IZ5Fg/2vkHlO/SgwwtD9L1gDq+mme6PGd+OihhhuqTlxb4
 jVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711991408; x=1712596208;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cOLKrFXode7RL7ZHvCqUyHCs2EwpfvvlesdpnmleB6M=;
 b=ScrC/eAacv8YDgSCZGWp1iJFs+dkSdjsfJwAOqCVfQPi5kD3oCGbO8P1/r4yr1SOCc
 qHemvgz/B+QpTHFpKeJrO84gAj1KSja0UXtfCWm23ix7LwGAaPqW5cxNvSrnX/i6eJXw
 0I7EnNjQVxwZtewXRyPixJALIV9HsjvLORAa3KfW5DrLz7DyUe4lZh9UdiT+wejk7h8H
 CPoejTeeYVRAVf6D9pAIECAFMH/VHE3hg8Fopisok9AMVJn4OBIBoCNlerBboHpqgRTx
 lnr07T7Xc4sUGifNCL7UOWkE6XFsl7YqNKzXtdrqaNhLheO8t9PIZNYcAStRdtAOEj1x
 EbdQ==
X-Gm-Message-State: AOJu0Yy9QxKnX0m1m0YXGAMFqWXsq9lb/gi+mwPhW3JQUBIDqAHXB2iJ
 kwDvIWcSmJPhcgLj5Y4Z+kka0cZ9Kpklc+PzD5MHfq3fBWmF14SU
X-Google-Smtp-Source: AGHT+IFdvWVQ5t5OSPrCcdGuPANNFpwX5kFJrnnSRIfNsMRL2/flh2LngyKi3zlajFubCMdZRc8Qmw==
X-Received: by 2002:a05:600c:1c1d:b0:413:ee55:8bba with SMTP id
 j29-20020a05600c1c1d00b00413ee558bbamr9516959wms.4.1711991407785; 
 Mon, 01 Apr 2024 10:10:07 -0700 (PDT)
Received: from smtpclient.apple ([167.99.200.149])
 by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b00415509b11c3sm11433054wms.22.2024.04.01.10.10.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Apr 2024 10:10:07 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v5 00/10] drm/ci: Add support for GPU and display testing
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20240401061235.192713-1-vignesh.raman@collabora.com>
Date: Mon, 1 Apr 2024 21:09:52 +0400
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 Helen Koike <helen.koike@collabora.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, emma@anholt.net, robdclark@gmail.com,
 david.heidelberg@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <43FF2E86-D0C7-4497-8203-E598E80FFA1B@gmail.com>
References: <20240401061235.192713-1-vignesh.raman@collabora.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
X-Mailer: Apple Mail (2.3774.400.31)
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

> On 1 Apr 2024, at 10:12=E2=80=AFam, Vignesh Raman =
<vignesh.raman@collabora.com> wrote:
>=20
> Some ARM SOCs have a separate display controller and GPU, each with
> different drivers. For mediatek mt8173, the GPU driver is powervr,
> and the display driver is mediatek. In the case of mediatek mt8183,
> the GPU driver is panfrost, and the display driver is mediatek.
> With rockchip rk3288/rk3399, the GPU driver is panfrost, while the
> display driver is rockchip. For amlogic meson, the GPU driver is
> panfrost, and the display driver is meson.

I=E2=80=99m not sure if this is describing the contents of a test lab or =
making
a statement on the Amlogic platform; but (being the pedant I am) I=E2=80=99=
ll
point out that Amlogic G12A/SM1 (Mali G31) and G12B (Mali G52) boards
do use panfrost, but the GXBB/GXL/GXM boards (Mali450) use lima.

CH.

> IGT tests run various tests with different xfails and can test both
> GPU devices and KMS/display devices. Currently, in drm-ci for =
MediaTek,
> Rockchip, and Amlogic Meson platforms, only the GPU driver is tested.
> This leads to incomplete coverage since the display is never tested on
> these platforms. This commit series adds support in drm-ci to run =
tests
> for both GPU and display drivers for MediaTek, Rockchip, and Amlogic
> Meson platforms.
>=20
> Uprev mesa and IGT in drm-ci and add amd, v3d, vc4 and vgem specific
> tests to testlist. Add testlists to the MAINTAINERS file and skip
> driver-specific tests.
>=20
> This series also includes patch to add vkms testing to drm-ci.
>=20
> Working pipeline link,
> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1140647
>=20
> Vignesh Raman (10):
>  drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
>  drm/ci: uprev mesa version
>  drm/ci: uprev IGT and update testlist
>  drm/ci: mediatek: Refactor existing mediatek jobs
>  drm/ci: mediatek: Add job to test panfrost and powervr GPU driver
>  drm/ci: meson: Refactor existing meson jobs
>  drm/ci: meson: Add job to test panfrost GPU driver
>  drm/ci: rockchip: Refactor existing rockchip jobs
>  drm/ci: rockchip: Add job to test panfrost GPU driver
>  drm/ci: add tests on vkms
>=20
> MAINTAINERS                                   |  11 +
> drivers/gpu/drm/ci/arm64.config               |   1 +
> drivers/gpu/drm/ci/build.sh                   |   2 +-
> drivers/gpu/drm/ci/container.yml              |   6 +-
> drivers/gpu/drm/ci/gitlab-ci.yml              |  18 +-
> drivers/gpu/drm/ci/igt_runner.sh              |  16 +-
> drivers/gpu/drm/ci/image-tags.yml             |   5 +-
> drivers/gpu/drm/ci/test.yml                   | 138 ++++++--
> drivers/gpu/drm/ci/testlist.txt               | 321 ++++++++++++++++++
> drivers/gpu/drm/ci/x86_64.config              |   1 +
> .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  25 +-
> .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  10 +-
> .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |  23 +-
> drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   9 +-
> drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |   9 +-
> drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   7 +
> drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |   9 +-
> drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |   9 +-
> drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   9 +-
> drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |   9 +-
> .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  15 -
> .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |  13 +
> .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   6 +
> .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  21 +-
> .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |   8 +
> .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   6 +
> .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   5 -
> .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   6 +
> .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   5 +
> .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |   8 +-
> .../msm-sc7180-trogdor-kingoftown-skips.txt   |   6 +
> ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   6 +
> .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   6 +
> .../gpu/drm/ci/xfails/panfrost-g12b-fails.txt |   1 +
> .../gpu/drm/ci/xfails/panfrost-g12b-skips.txt |   8 +
> .../drm/ci/xfails/panfrost-mt8183-fails.txt   |   1 +
> .../drm/ci/xfails/panfrost-mt8183-skips.txt   |   8 +
> .../drm/ci/xfails/panfrost-rk3288-fails.txt   |   1 +
> .../drm/ci/xfails/panfrost-rk3288-skips.txt   |   8 +
> .../drm/ci/xfails/panfrost-rk3399-fails.txt   |   1 +
> .../drm/ci/xfails/panfrost-rk3399-skips.txt   |   8 +
> .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  50 +--
> .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  21 ++
> .../drm/ci/xfails/rockchip-rk3288-skips.txt   |  15 +-
> .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  38 +--
> .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  28 +-
> .../drm/ci/xfails/rockchip-rk3399-skips.txt   |  11 +
> .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   1 -
> .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   9 +-
> drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |  33 ++
> .../gpu/drm/ci/xfails/vkms-none-flakes.txt    |  20 ++
> drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |  23 ++
> 52 files changed, 890 insertions(+), 144 deletions(-)
> create mode 100644 =
drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
> create mode 100644 =
drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
> create mode 100644 =
drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
>=20
> --=20
> 2.40.1
>=20
>=20
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

