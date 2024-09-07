Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91D5970102
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 10:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6855E10E066;
	Sat,  7 Sep 2024 08:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="wQkj4bC+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com
 [91.218.175.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C368610E066
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2024 08:47:30 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1725698849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U/V4gJDEeseX5jQFeW0yYA0toqnpKY469k3mQ17ssiw=;
 b=wQkj4bC+WErNtAEm8BxqIHn2dlwtM4UpfbVG4kVsVCFyPcyJn1hfJUAI3PAIatPtYMw6uh
 0MUlu+Wy4C0/RtBqiSyAsTiqtu8ayeMonmgPbJaWaKFR9Wd65RyQK3Iu7j0zt1nJtV/y5A
 VmmjmG8EsLLzjvL2O4YsHVzt6tVMvSV6sSmCC2QL0yHzHn3NZqnDA5FPGRpop315vUTMx6
 2tGNMflQrIP6EzT/fbsSpBZH8+OS81BkYsYv+y7rd+fKvRSnBKvSUDpOtS95robjbLhpYk
 xTf2LWG6bsf64yAHsqCtCbxFJuCOrfB4AqyVA45T0OF/EcnLtjaUNYNHbjAFNw==
Content-Type: multipart/signed;
 boundary=ae02d6677900286bbc830f90aa3ab8aa0d85c0a15f3e902cf9eb68b94b65;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Sat, 07 Sep 2024 10:47:18 +0200
Message-Id: <D3ZX6LZNLOYC.30CT6AX32VI2T@cknow.org>
To: "Min-Hua Chen" <minhuadotchen@gmail.com>
Cc: <airlied@gmail.com>, <andy.yan@rock-chips.com>, <andyshrk@163.com>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>, <heiko@sntech.de>,
 <hjc@rock-chips.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/rockchip: include rockchip_drm_drv.h
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
References: <D3Z5JMTKPQIS.2M5O5DY0S4U9G@cknow.org>
 <20240907030259.1243487-1-minhuadotchen@gmail.com>
In-Reply-To: <20240907030259.1243487-1-minhuadotchen@gmail.com>
X-Migadu-Flow: FLOW_OUT
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

--ae02d6677900286bbc830f90aa3ab8aa0d85c0a15f3e902cf9eb68b94b65
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Sep 7, 2024 at 5:02 AM CEST, Min-Hua Chen wrote:
> >FWIW: I didn't see it either, but I assumed I was missing the right
> >context (i.e. patches) needed to trigger that warning.
>
> I triggered the warning by the following step:
>
> install 'sparse' first
>
> ARCH=3Darm64 LLVM=3D1 make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDI=
AN__' mrproper defconfig all -j8

This, especially the 'LLVM' part,  is important context information
and should be part of the commit message.

I had only just started when I saw a number of sparse warnings:

  DTC     arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb
  OVL     arch/arm64/boot/dts/ti/k3-j721e-evm.dtb
  OVL     arch/arm64/boot/dts/ti/k3-j721s2-evm.dtb
  OVL     arch/arm64/boot/dts/ti/k3-am654-idk.dtb
  DTC     arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb
  DTC     arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtbo
  DTC     arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb
  DTC     arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb
  DTC     arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb
  DTC     arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb
../init/main.c:192:12: sparse: warning: symbol 'envp_init' was not declared=
. Should it be static?
../init/main.c:290:16: sparse: warning: cast to restricted __le32
../init/main.c:291:16: sparse: warning: cast to restricted __le32
  CHECK   ../init/do_mounts.c

And several followed, including in c-code files. So I stopped the build
and assume you've identified a or several actual issues.

I've seen several commits where changes were made because LLVM flagged
potentially problematic code, where GCC did not, so it's quite possible
you're on to something here.

But it would be helpful if the commit message said what code was
potentially problematic and why. And then the proper fix for that could
indeed be to include `rockchip_drm_drv.h`.

Cheers,
  Diederik

--ae02d6677900286bbc830f90aa3ab8aa0d85c0a15f3e902cf9eb68b94b65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZtwTGQAKCRDXblvOeH7b
bjrVAP9sF01iIKgasYGx4OaHq+E2M92V0wabM3HMo2iTFErnoQEAkAD2CVBFzBtD
wMom4q6z9MP5ClefkbqycuAelKYGkAU=
=iQLh
-----END PGP SIGNATURE-----

--ae02d6677900286bbc830f90aa3ab8aa0d85c0a15f3e902cf9eb68b94b65--
