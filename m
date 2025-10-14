Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E92BDAB88
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 18:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4713710E208;
	Tue, 14 Oct 2025 16:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="NDNdBX5v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 585 seconds by postgrey-1.36 at gabe;
 Tue, 14 Oct 2025 16:58:18 UTC
Received: from mail-106109.protonmail.ch (mail-106109.protonmail.ch
 [79.135.106.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1ED10E208
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 16:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1760460509; x=1760719709;
 bh=gC2TWQbS/vTc2rEDleuAErmObc3aa8rsr4gKQFzh6Xs=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=NDNdBX5vg+dfL3XT5MmOtx1w/UBXm9xI5RoHQUw6QmhX9Dq4Q+VzCHTv5qDJJPxsd
 1XGW9QDpBEL6cDbVi5zuS/Ii9twDrZmfhr2Hq7DdKL0cW+zG9ctJw4M9j/kVKlFhuF
 L7/jN58UeH36TNC2jd7wP9Ccasj6nwakvAzbiTtv0Irudf/fw7Wnac+T6rL1fn75i1
 0jc4tnetiTHtilqPzpOkXghCDp/DwYBboLHTZweSwt39gE+V2uc9MoiNBguavIDYdN
 Qdrit3+Dx20WOA2yYBOYyPqvqFawQEVOz6fFCbtWliU+Fdhmjvc6JxctbyTAnr3HdG
 IcTldEYGZzqqQ==
Date: Tue, 14 Oct 2025 16:48:23 +0000
To: "xorg-announce@lists.x.org" <xorg-announce@lists.x.org>
From: Simon Ser <contact@emersion.fr>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [ANNOUNCE] libdrm 2.4.127
Message-ID: <i5e3G6jeawc9AdCNJVWHhYG5v0Ou6-vMabHxFb33RDE9SK-LPj7Lm81y2QyYZuhF4ZuXGLIRN-tsqElqtzAW6w49aWXJ__7BRfqqomMhGu0=@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 3d2293760b87ca1d08397ded7d8fd64b53af22ba
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

The last release (2.4.126) included a botched API for the faux bus. This
release fixes it with a breaking change: faux device info is moved to
faux bus info in drmDevice. Since this is a very new API I believe there
are no downstream users yet - but if this release causes breakage for
you please reach out and we'll keep a deprecated field around.

Simon Ser (1):
      build: bump version to 2.4.127

Vlad Zahorodnii (3):
      xf86drm: Trim traling whitespace in xf86drm.h
      xf86drm: Fix drmDevicesEqual() for nodes on the faux bus
      xf86drm: Drop drmFauxDeviceInfo

git tag: libdrm-2.4.127

https://dri.freedesktop.org/libdrm/libdrm-2.4.127.tar.xz
SHA256: 051aeb3e542a57621018ffc443fb088dd69b78eef0ce4808b604ce0feac9f47f  l=
ibdrm-2.4.127.tar.xz
SHA512: 2b1e9bdc864d1d8b890763a5154708bd44ee0cab5cb9156a7ec473d1d83b9fae7f4=
f66f660a68a3d1839ecca010163439c9991d9360f9be03be7ed8823a73ec6  libdrm-2.4.1=
27.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.127.tar.xz.sig
