Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2977F13E8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 14:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E97D10E3BB;
	Mon, 20 Nov 2023 13:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C6F10E3BB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 13:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1700485582; x=1700744782;
 bh=K0/aUJ3RvZPtM2eH0MrAQywxV3/qNikcw+0Xkp8J0YA=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=YoyebSmQztuto9pMm/YKAiM9y3ULwFtErJfyYq5co99hVwdojrTXN2cgpbdircggb
 gq0yegfER0KzkHsWILKEZSmAj/pXiZ8QCGfDVnxWHfKJYm3U3XWqwvAeYyUd/2wnWC
 Zd2woBrwmwsaNcwv39SjwRhGnC4rngQT+jKu2iQNdl6qcuP4sqFiDhN28WJB8qRQWK
 AcxRKuqkhHFmUONih59XdT4sT6FceN1Lsgat0A4jPeL7uVQD3aFkWnxSTaqTUWkiFY
 UYRHvHotD2zGio0Gg4/35C3RoBpJy1I5PhqxDOY4Fa7gccnE1qv6Sy4vpeOz3JhDi4
 ZElOTojlMQ2iw==
Date: Mon, 20 Nov 2023 13:06:12 +0000
To: "xorg-announce@lists.x.org" <xorg-announce@lists.x.org>
From: Simon Ser <contact@emersion.fr>
Subject: [ANNOUNCE] libdrm 2.4.118
Message-ID: <oTnkbiU-LSPO_z1xva6aVlKO99KVk1l8BTA9foPrG_1uoP0ZzjVXMRkIsCAHRoQTSqnk8BDbkKcnYbMr6EgftqzM0WIBZz1zeso7SpHfX6s=@emersion.fr>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

David Jagu (1):
      meson: fix typo in libdrm_intel

Geert Uytterhoeven (18):
      util: improve SMPTE color LUT accuracy
      util: factor out and optimize C8 SMPTE color LUT
      util: add support for DRM_FORMAT_C[124]
      util: store number of colors for indexed formats
      util: add SMPTE pattern support for C4 format
      util: add SMPTE pattern support for C1 format
      util: add SMPTE pattern support for C2 format
      modetest: add support for DRM_FORMAT_C[124]
      modetest: add SMPTE pattern support for C[124] formats
      intel: determine target endianness using meson
      util: fix 32 bpp patterns on big-endian
      util: fix 16 bpp patterns on big-endian
      util: add missing big-endian RGB16 frame buffer formats
      modetest: add support for parsing big-endian formats
      util: add test pattern support for big-endian XRGB1555/RGB565
      util: fix pwetty on big-endian
      util: add pwetty support for big-endian RGB565
      modetest: add support for big-endian XRGB1555/RGB565

Jonas Karlman (1):
      modetest: add support for DRM_FORMAT_NV{15,20,30}

Neil Armstrong (1):
      modetest: switch usage to proper options grammar

Simon Ser (4):
      xf86drm: add drmGetNodeTypeFromDevId
      Sync headers with drm-next
      xf86drmMode: add drmModeCloseFB()
      build: bump version to 2.4.118

git tag: libdrm-2.4.118

https://dri.freedesktop.org/libdrm/libdrm-2.4.118.tar.xz
SHA256: a777bd85f2b5fc9c57f886c82058300578317cafdbc77d0a769d7e9a9567ab88  l=
ibdrm-2.4.118.tar.xz
SHA512: 2740ec10dfe96b520345c3f6f0d99a30aac95b1f96656bd9cd11269c2a83a9dac42=
3da29d74a3deb55360e3ae2ca4a1de283e1e443667bedd22673f6629c9920  libdrm-2.4.1=
18.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.118.tar.xz.sig
