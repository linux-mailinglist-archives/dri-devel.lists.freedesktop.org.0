Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DCB449A04
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 17:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0736E1A2;
	Mon,  8 Nov 2021 16:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7986E222
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 16:38:40 +0000 (UTC)
Date: Mon, 08 Nov 2021 16:38:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1636389518;
 bh=tzD9BA1aM57GbumPmLP6kKmxuB3qvrwiK5Emc9BD9jQ=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=Oa6q2YCFANFOcxCYsQXNHK0EkEkPBwO8+yeGinyBNL5FvwPrq3jMfOTu1dW3MEHMH
 XSCDeTkbzYR6pR/+DBxh4mD37wDKkdIvm5Ia3oHmS3/8UggEc66aj0VGNEXFT8U3PZ
 pJ/DhvWmOk0wEpFghj6Pag0JoqlqPrdKS+pAtVZUzmwsdJC09oDq5MIQWQqlwvicah
 V8HBv1HagqaK+oj1G1Y6oUjqdwMt+lOiIpMhut+f5pU6kOE5mzB3xK3ysoSm+wlpf3
 jtFt/Cz2DNHgcPzQP0ZIyEIUg2rSOXk65ghsC/lW2aEX1qQdf27s13HgK47W0cpNgl
 QNpKrVZQHof8Q==
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Simon Ser <contact@emersion.fr>
Subject: [ANNOUNCE] libdrm 2.4.108
Message-ID: <DyJXgHsOO-Hw2-IzCopzDB4_B4Wt4lk_aEaVQSjQ86JCt8LVvEvKkuZKZfNag51l2jUIAXCJ7bJDF-seABqRgZZsl_Romoj5tjoOWf931h0=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "xorg-announce@lists.x.org" <xorg-announce@lists.x.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Full commit history below.

Aaron Liu (1):
      test/amdgpu: Bob to Alice copy should be TMZ in secure bounce test

Alex Deucher (2):
      amdgpu: add marketing names from 21.30
      amdgpu: add new marketing name

Alex Richardson (1):
      Fix -Werror=3Dformat build errors on FreeBSD

Christian K=C3=B6nig (1):
      amdgpu: add amdgpu_stress utility v2

Dennis Tsiang (2):
      drm_fourcc: sync drm_fourcc with latest drm-next kernel
      xf86drm: Update drmGetFormatModifierNameFromArm to handle AFRC

Eric Anholt (2):
      meson: Build libdrm.so as an unversioned lib on Android.
      meson: Don't build libkms for Android.

Eric Engestrom (1):
      xf86drm: fix mem leak in drm_usb_dev_path()

Jason Ekstrand (1):
      intel: Drop legacy execbuffer support

Jordan Justen (1):
      libdrm: NOTE! Default branch is now main

Joshua Ashton (1):
      amdgpu: Make marketing names consistent

Jos=C3=A9 Roberto de Souza (1):
      intel: Sync pci ids

Karol Herbst (1):
      nouveau: print bo address in the GPU/CPU vm and its size

Luben Tuikov (1):
      tests/amdgpu: Fix TMZ secure bounce test

Luigi Santivetti (1):
      xf86drm: add iterator API for DRM/KMS IN_FORMATS blobs

Mario Kleiner (1):
      headers: drm: Sync with drm-next

Simon Ser (15):
      xf86drm: add GEM_CLOSE ioctl wrapper
      xf86drmMode: make drm_property_type_is arg const
      xf86drmMode: switch to standard inline qualifier
      xf86drmMode: simplify drm_property_type_is
      amdgpu: use drmCloseBufferHandle
      intel: use drmCloseBufferHandle
      radeon: use drmCloseBufferHandle
      etnaviv: use drmCloseBufferHandle
      exynos: use drmCloseBufferHandle
      freedreno: use drmCloseBufferHandle
      nouveau: use drmCloseBufferHandle
      omap: use drmCloseBufferHandle
      tegra: use drmCloseBufferHandle
      man: refer to drmCloseBufferHandle instead of DRM_IOCTL_GEM_CLOSE
      build: bump version to 2.4.108

Tejas Upadhyay (1):
      intel: sync ADL-S PCI IDs with kernel

Tvrtko Ursulin (1):
      intel: Do not assert on unknown chips in drm_intel_decode_context_all=
oc

ZhiJie.Zhang (1):
      tests/modetest: get cursor width and height by drmGetCap

git tag: libdrm-2.4.108

https://dri.freedesktop.org/libdrm/libdrm-2.4.108.tar.xz
SHA256: a1d7948cbc536763fde14b4beb5e4da7867607966d4cf46301087e8b8fe3d6a0  l=
ibdrm-2.4.108.tar.xz
SHA512: 6a841dc3eb8eae7d75e1d35d23a14d51aff758e5a251dbcf6fc8c28d973d935a4a2=
f6751b405e956b2777d93c651721199ac80c3cd14b87d021668120d6bc974  libdrm-2.4.1=
08.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.108.tar.xz.sig
