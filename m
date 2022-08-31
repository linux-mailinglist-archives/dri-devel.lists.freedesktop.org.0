Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093D15A807A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 16:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E00610E408;
	Wed, 31 Aug 2022 14:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B2A10E408
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 14:43:03 +0000 (UTC)
Date: Wed, 31 Aug 2022 14:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661956948; x=1662216148;
 bh=LxF+jMPq4Hua2UMddQTAibMZH9xlhgXyZujRdoCmFUM=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=aqqgK7QrKjDsk/fqOIm7AjlUFx+ia8sweFwNlMhJp9Im7WLZ8O5zmMYOfz06dt3Vw
 yvmpCtiLSB84sUzisH0NL3Y1UZmJlfpzF8/Bzdu3dt6GoYxS0k36wuYB0BBRqCIgZM
 sOLyfxzFa7uKLXiFvdDkHfjFyzfGfGMNUu/GFGi45ySK1u3eiccbfm64m6AzT4Uto/
 DvclwRix7bpPhXa5DEYB5bvMItBt4dVM2vCJ9cvorNwiQz51GzR1kuBE/yMYpO9hrj
 Wg6hdF1inJIqs5j4hQVBX5rVhJfLOXnGOvufDb95EBItQjrdH8HrdfD35YOfjT1JzD
 jfjjQymh8wF3w==
To: "xorg-announce@lists.x.org" <xorg-announce@lists.x.org>
From: Simon Ser <contact@emersion.fr>
Subject: [ANNOUNCE] libdrm 2.4.113
Message-ID: <-KFops-dFPakbmfKPwAPAPJAphOC6uUKnvFXu0efzV7ia-jb0zFD2YdpO1F7RMhV2xLFNSR0DZLWb0qUpaA4a0IrJM9y5oyDcs_ZiTRzjuA=@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Alex Deucher (1):
      amdgpu: update marketing names for 22.20

Eric Curtin (1):
      tests/util: Add simpledrm driver

Eric Engestrom (9):
      ci: remove system meson before installing the pip one
      ci: fix the tested meson version
      ci/freedesktop: bump python version of docutils package as 3.8 no lon=
ger exists
      ci: bump images tags to take !255 into effect
      meson: fix value of `auto` for a bunch of drivers
      ci: drop dead script since e722ba9f67
      meson: convert auto combos into proper features
      meson: simplify some more build options by using features
      atomic: fix atomic_add_unless() fallback's return value

Flora Cui (2):
      tests/amdgpu: refactor dispatch/draw test
      tests/amdgpu: add dispatch/draw test for gfx11

Hawking Zhang (1):
      tests/amdgpu: skip gfx CE subtest in gfx11

James Zhu (1):
      tests/amdgpu: enable vcn swRing test for version 4 and later

Likun Gao (2):
      tests/amdgpu: add sdma corrupted header hang test
      tests/amdgpu: add sdma slow copy linear hang test

Matt Roper (2):
      lib: sync i915_pciids.h with kernel
      intel: Hook up new platforms IDs

Matt Turner (1):
      intel: Avoid aliasing violation

Matthieu Herrb (1):
      Remove unused 3rd parameter to open(2)

Ruijing Dong (2):
      tests/amdgpu/vcn: align comments for AMDGPU_HW_IP_VCN_ENC
      tests/amdgpu/vcn: add unified queue support in vcn4

Simon Ser (3):
      xf86drm: add drmGetFormatName()
      tests/modetest: use drmGetFormatName()
      build: bump to version 2.4.113

Simon Zeni (1):
      build: make tests optional

Stephan Lachnit (1):
      build: set c_std to c11

Sui Jingfeng (1):
      meson: auto-enable etnaviv on arm, arc, mips and loongarch architectu=
res

git tag: libdrm-2.4.113

https://dri.freedesktop.org/libdrm/libdrm-2.4.113.tar.xz
SHA256: 7fd7eb2967f63beb4606f22d50e277d993480d05ef75dd88a9bd8e677323e5e1  l=
ibdrm-2.4.113.tar.xz
SHA512: fca9834ce090f63ce6dc6d04491a2c5e86162fdddfc8ea70d55a6cdeb401be65638=
8aae1577e58f463a78d8dc502be0a641908784819874e20bbec9a39a057e0  libdrm-2.4.1=
13.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.113.tar.xz.sig
