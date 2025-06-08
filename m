Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF23AD11FD
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 14:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48A110E027;
	Sun,  8 Jun 2025 12:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="tNpBOnkK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch
 [79.135.106.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C883810E027
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 12:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1749386059; x=1749645259;
 bh=R7ZTRAbU1aaUQZubIPSz8UAt/LS+Fz3QpOk7zifc1SM=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
 List-Unsubscribe:List-Unsubscribe-Post;
 b=tNpBOnkK+rplwpIvz2FwyF12CuHVT96vShTEJ1i7ehQlt8DOfe897DYy22jXivI/r
 MTNmyiImP8cbee0b1aBfd5SRWGP81Arav+D4WXgjmK6zIB/B4LOfzV39FqDWYQGYFI
 YypMmTWUITsan6zLT78h2fXRkPqJSeJDtRVOMrut4rBwPMxzq4tlJEnsEWhFdiX+su
 pcGmK1o0fRMpW0d8QQvlnAR0zZ+UokFNRedMnUJhscp7XAsyiTQ4t+3WILIZ4PC6vo
 a/rhM5OKD6FBGvxqJbrbjGNbgBumfapXCArrVQFCdL0D2xSFmZWWPaJaEwxnlpIot1
 KGZ6VjCWIsJ2Q==
Date: Sun, 08 Jun 2025 12:34:16 +0000
To: "xorg-announce@lists.x.org" <xorg-announce@lists.x.org>
From: Simon Ser <contact@emersion.fr>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [ANNOUNCE] libdrm 2.4.125
Message-ID: <qt76En2dw9AMAraJ8ukP-mqsOBqIVbAEUQpAmN2Gf7sJyNTaI77hCd4aCOXmJqbVfsMLsxklYTWJoQeKqc12aKlpN1pmgGwM4S261OZVVSs=@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 63da5a7d0eaf2a55a385bcc0db94a5577a2ede5e
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Alex Deucher (4):
      amdgpu: add new marketing names
      amdgpu: add new marketing names
      amdgpu: add new marketing names
      amdgpu: update marketing names

Arunpravin Paneer Selvam (1):
      amdgpu: Add queue id support to the user queue wait IOCTL

Arvind Yadav (2):
      amdgpu: UAPI for AMDGPU usermode queues
      amdgpu: Add amdgpu userqueue IOCTL functions

Corentin No=C3=ABl (1):
      meson: Do not check for meson version >=3D0.54

Daniel van Vugt (1):
      xf86drm: Handle NULL in drmCopyVersion

Jie1zhang (1):
      amdgpu: Add queue priority and secure flags support for user queues

Shashank Sharma (1):
      drm/amdgpu: add new AMDGPU_INFO subquery for userqueue metadata

Simon Ser (7):
      xf86drm: deprecate drmAvailable()
      ci: upgrade ci-templates to latest commit
      ci: upgrade FreeBSD to version 14.2
      ci: fix arm32v7 Debian container preparation
      Switch URLs to mesa/libdrm
      Sync headers with drm-next
      build: bump version to 2.4.125

Sunil Khatri (1):
      drm/amdgpu: add UAPI to query if user queues are supported

git tag: libdrm-2.4.125

https://dri.freedesktop.org/libdrm/libdrm-2.4.125.tar.xz
SHA256: d4bae92797a50f81a93524762e0410a49cd84cfa0f997795bc0172ac8fb1d96a  l=
ibdrm-2.4.125.tar.xz
SHA512: faad141f48a49915c0312eb635df76968f0f4d41bb6851be625a7ae0e24826e7283=
b5ec9ec3b09ead9a96297bf42221c411288f9b000c3dbc159ed8dde93a7e4  libdrm-2.4.1=
25.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.125.tar.xz.sig
