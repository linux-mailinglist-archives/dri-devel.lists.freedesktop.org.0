Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7537D0799
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 07:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8821010E07B;
	Fri, 20 Oct 2023 05:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46A910E07B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 05:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1697779652; x=1698038852;
 bh=a5N19hbS1YSe6QNrdJl3tFnnzp1vuEiGQk/RDMCDYpg=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=Mt5kMYC39N/LqE0iE/CboxGmB5qBevJvx6UP+7EiTRjihFiP6NqksrD2LCdImCf18
 eWiwdWMKlUxiZSFq2pUa4iXVqvIHzdJm9x/wvZwzNQSE4jwmt5Wo0PZNoETAscUQNX
 ZD9dS7/F87yNL+nLxJQ1UxW/3KwHAhrmgxFzn4iNb5iFf7VGzv5fcjpexN07b2N/bz
 qGswVHgT70wIpV+MCCq7XQJr8iV6dutSnbzpzsKH9Caag/eQC1YrchLgQUEC8b1o/D
 /H124KI3YjOScNCSIOxrUlB1pPJYqSSOU2kpTwyENJqDInyteul9fAlSj3fIvPCqEa
 TCHXmozShjhqw==
Date: Fri, 20 Oct 2023 05:27:19 +0000
To: "xorg-announce@lists.x.org" <xorg-announce@lists.x.org>
From: Simon Ser <contact@emersion.fr>
Subject: [ANNOUNCE] libdrm 2.4.117
Message-ID: <PKQSay2kKlTz02JCfgM8R2GT03UCBNm-V5ZL-00BaUonjetqsAI7I5FmrWLxY62CYE-v16a-EQPAsm_ucU36xByxQNlGe3YIcz1uAZgcfv4=@emersion.fr>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Chia-I Wu (1):
      modetest: print modifiers in hex as well

Dmitry Baryshkov (1):
      modetest: custom mode support

Dylan Baker (3):
      meson: fix intel requirements
      meson: Use feature.require() and feature.allowed()
      meson: replace deprecated program.path -> program.full_path

Ezequiel Garcia (1):
      modetest: avoid erroring if there's no gamma legacy support

Geert Uytterhoeven (8):
      amdgpu: Fix pointer/integer mismatch warning
      amdgpu: Use PRI?64 to format uint64_t
      util: add NV24 and NV42 frame buffer formats
      util: add pattern support for DRM_FORMAT_NV{24,42}
      modetest: add support for DRM_FORMAT_NV{24,42}
      util: fix grey in YUV SMPTE patterns
      modetest: fix mode_vrefresh() for interlace/dblscan/vscan
      util: remove unused definitions of RED, GREEN, and BLUE

Jonathan Gray (5):
      amdgpu: add marketing names from amd-5.4.6 (22.40.6)
      amdgpu: add marketing names from amd-5.5.1 (23.10.1)
      amdgpu: add marketing names from PRO Edition 23.Q3 W7000
      amdgpu: add marketing names from Adrenalin 23.7.2
      amdgpu: add marketing names from Adrenalin 23.9.1

Marijn Suijten (2):
      modetest: document why no blob is created for linear gamma LUT
      modetest: allocate and commit atomic request around set_property()

Neil Armstrong (2):
      modetest: permit -r and -s to work together
      modetest: allow using -r and -P

Rohith Iyer (1):
      modetest: add support for writeback connector

Samuel Pitoiset (2):
      amdgpu: amdgpu_drm.h for new GPUVM fault ioctl
      amdgpu: add support for querying VM faults information

Simon Ser (3):
      xf86drm: mark DRM_MAX_MINOR as deprecated
      ci: bump FreeBSD to 13.2
      build: bump version to 2.4.117

git tag: libdrm-2.4.117

https://dri.freedesktop.org/libdrm/libdrm-2.4.117.tar.xz
SHA256: a2888d69e3eb1c8a77adc08a75a60fbae01f0d208d26f034d1a12e362361242b  l=
ibdrm-2.4.117.tar.xz
SHA512: 326cf565548fb9d50a321562c13acb2a2f5ad5915ffdc2b08ef812fbac887f5b3d2=
71cb2ce8c483633edddf2c55064d55810ff6697f713c179e2d0c8048eb544  libdrm-2.4.1=
17.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.117.tar.xz.sig
