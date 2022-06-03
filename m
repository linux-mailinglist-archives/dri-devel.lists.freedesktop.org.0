Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AAA53C38C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 06:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5032111332D;
	Fri,  3 Jun 2022 04:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Fri, 03 Jun 2022 04:19:04 UTC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B174E10EB65
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 04:19:04 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-ofhbuD8MPamn3GX1ggr6aA-1; Fri, 03 Jun 2022 00:12:08 -0400
X-MC-Unique: ofhbuD8MPamn3GX1ggr6aA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCDDD3C0F74D;
 Fri,  3 Jun 2022 04:12:07 +0000 (UTC)
Received: from dreadlord.bne.redhat.com (fdacunha.bne.redhat.com [10.64.0.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C64AB40E80E0;
 Fri,  3 Jun 2022 04:12:06 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	xorg-announce@lists.x.org
Subject: [ANNOUNCE] libdrm 2.4.111
Date: Fri,  3 Jun 2022 14:11:55 +1000
Message-Id: <20220603041155.861860-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256


libdrm 2.4.111, just a few things built up, and drop libkms.

Alex Deucher (3):
      test/amdgpu: only disable deadlock tests on asics without GPU reset
      amdgpu: add marketing names from 21.50
      amdgpu: add marketing names from 22.10

Andrey Grodzovsky (1):
      tests/amdgpu/hotunplu: Enable hotunplug tests.

Daniel Stone (2):
      drm/atomic: Stable sort for atomic request de-duplication
      libkms: Remove libkms completely

Dave Airlie (1):
      build: bump version to 2.4.111

Dylan Baker (9):
      meson: use dictionary kwargs
      meson: add override_dependency when possible
      meson: switch the meson builtin for symbol visiblity
      meson: switch to cc.get_supported_arguments
      meson: use more standard formatting for better readability
      meson: use cc.check_header instead of open coding
      meson: use cc.has_function_attribute instead of open coding
      meson: use the modern interface for pkg.generate
      meson: use summary() instead of message

Eleni Maria Stea (3):
      xf86drm.c: fix C99 warning
      modeprint, modetest, proptest: cast __u64 to uint64_t
      tests/modeprint: fix argument type

Eric Engestrom (1):
      use standard `__typeof__()` instead of GNU extension `typeof()`

Flora Cui (2):
      tests/amdgpu: add draw test for gfx10
      tests/amdgpu: add dispatch test for gfx10

Guchun Chen (2):
      tests/amdgpu: Add VCN test support for Biege Goby
      tests/amdgpu: use appropriate ring for different asics

Karol Herbst (1):
      nouveau: add ioctl wrapper to check for dead channels

Lu Jiacheng (1):
      tests/amdgpu: Add test suite CP DMA

Matt Turner (2):
      man: Fix some typos
      man: Add formatting to drmModeGetConnector reference

Raviteja Goud Talla (1):
      intel: sync i915_pciids.h with kernel

Samuel Pitoiset (4):
      amdgpu: update_drm.h for new CTX OP to set/get stable pstates
      amdgpu: implement new CTX OP to set/get stable pstates
      tests/amdgpu: add a test for new CTX OP to get/set stable pstates
      build: bump version to 2.4.110

Sathishkumar S (3):
      tests/amdgpu: add jpeg tests support
      tests/amdgpu: enable jpeg test based on ip query
      tests/amdgpu: enable vcn test based on ip query

Simon Ser (1):
      releasing: s/master/main/

Tejas Upadhyay (2):
      intel: Add support for ADL-N
      intel: Add support for RPLP

Thierry Reding (25):
      tegra: Indent according to .editorconfig
      tegra: Remove unused IOCTL implementations
      tegra: Extract common buffer object allocation code
      tegra: Fix mmap() of GEM buffer objects
      tegra: Add flink helpers
      tegra: Add PRIME support helpers
      tegra: Make API more consistent
      tegra: Install tegra-openclose test
      tegra: Update for new UABI
      tegra: Include private.h in list of source files
      tegra: Add channel APIs
      tegra: Add job and push buffer APIs
      tegra: Add syncpoint APIs
      tests: tegra: Add helper library for tests
      tests: tegra: Add gr2d-fill test
      tests: tegra: Add syncpt-wait test
      tests: tegra: Add syncpoint timeout test
      tests: tegra: Add VIC support
      tests: tegra: Add VIC 3.0 support
      tests: tegra: Add VIC 4.0 support
      tests: tegra: Add VIC 4.1 support
      tests: tegra: Add VIC 4.2 support
      tests: tegra: Add VIC clear test
      tests: tegra: Add VIC blit test
      tests: tegra: Add VIC flip test

ravitejax (1):
      intel: Add support for RPLS platform

git tag: libdrm-2.4.111

https://dri.freedesktop.org/libdrm/libdrm-2.4.111.tar.xz
SHA256: 1ad7164f77424de6f4ecba7c262bde196a214c6e19a6fbf497f0815f4d7ab2a9  l=
ibdrm-2.4.111.tar.xz
SHA512: 17e92e9e4ded8031ac222764bed7e9ff430a1a377f5e435f6b62b4a7f45cb4c4b76=
9b3b79fbcba11512c1ac973abf8cdcca8e0b9659ae095e915d3d5efcf5516  libdrm-2.4.1=
11.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.111.tar.xz.sig

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEEKbZHaGwW9KfbeusDHTzWXnEhr4FAmKZicgACgkQDHTzWXnE
hr6CrA//duEhO2bu78TAcOfZ4NaSghV00jYQOblkcOFgfjmrCdSuqG2k2raPif4t
AwWb1ZgYLDwmkMVEXytFwVkzRsdU8QQrofvML1Q7t3Q8opLNV/8kESqLnelOLmZp
8fVpPiETVZIqEwKFASb1nzTdUmD2R8tV++BX5w/zUeErFIu/4nqEdVJPgOh337ko
VUKvvMb3+ockbJcRud4DjC6P/3WNkYJHz/uJe2UcaB4+SCg2M7HtofQplj/c3bLv
NDEoxliRUDKj7+agpHS9RkJYfnIOT2jf6O9eAxxexrqS2p801Vb97uHFwjbxrmJK
XteXbk4v4k/TnkmJkr8xQs0miDCSVSuSMg4orRXyfCcbPajTUDRWrEWaYWkZz5Z2
8pYHrijpEL/ISLmZkiviYLO/61NsGqOtDB+kCpagH/qw4/xa6FyfM7kvo4f9uM8A
PKqXd4dqUyJ5FgM3LODwbInf1G8VnHcTvxQLSZzwk8w3HezQqBmyN86C2y1mGN91
RyhYTynXugigoqlrCn2p2/Yf8ld73jR16HBXpvx8kTtY+/i5UoCsNd+QiyvmJpXF
E6AkdUS6zgUyTSbYo1wkSOwXvTEAcqJpI9FUOd90KHiOww7NFu6be0wYZb/FsQ+B
iP+oPmUG7L0D0I8WEcbgjkXeuV35nQT70kG0rSPbfrGcYo0FcKA=3D
=3DcVIr
-----END PGP SIGNATURE-----

