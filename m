Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A38917AAA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 10:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD79B10E14D;
	Wed, 26 Jun 2024 08:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="DTNBruqs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8ADF10E14D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 08:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1719389790; x=1719648990;
 bh=VzUwR6ypzybZj3GOOVEt3a+yGfHIkSpUfYPe8NWCKJc=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=DTNBruqsAIb3u8Bo9yJQ5X+MTqVLruuYI/Vdxcn0R3Tfvz0D36bEIXEEL7mUOZOi/
 krumyfqXqTTw26pJX/2a0zF+RoIG08MWHAHg5vUW1CM9hSpFKKHo4TjBoQZuQFcR9O
 zXMKU574gNXGB5Bf8hw5d8LHkQUPKLRQtMtcGDeBHATi6bxXaHfQLoyAz4oKcWnOaW
 8lTDI5ukgV66bRwZx37Z22mjf3AnoV3TfSwd6tM9z9ILjYvJNvamE2F2oWMCaJ5gWd
 bRQcS6TRo13STVC7Jp7s1kL27tb/s9dHYsIxp6nybeocisZKioDYlnERIwbjkEXNEZ
 xO9vhsRjoFLtA==
Date: Wed, 26 Jun 2024 08:16:25 +0000
To: "xorg-announce@lists.x.org" <xorg-announce@lists.x.org>
From: Simon Ser <contact@emersion.fr>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [ANNOUNCE] libdrm 2.4.122
Message-ID: <6daLENpRH0oKukQZgPz7_n2qSEBwcRyVSLGS2G_1jWTjj_v61JtIfiCaw18IHS8d07rY2QH4HCzTl7VF1a4kJHjROLdG1NVS3oRlEvOSgtI=@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 5e248104795c1a108c13578c973c7a2f54d15de7
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

Enrico Weigelt, metux IT consult (6):
      OpenBSD: fix FTBS on misspelled and missing variables
      fix FTBS on FreeBSD (or non-Linux in general)
      freedreno: fix FTBS on non-Linux platforms (unused header)
      etnaviv: fix FTBS on undefined linux/* headers on non-Linux platforms=
.
      ci: upgrade debian container to bookworm
      ci: upgrade FreeBSD VM to 14.1

Nicolas Caramelli (1):
      Remove libm in libdrm dependencies

Simon Ser (2):
      Sync headers with drm-next
      build: bump version to 2.4.122

git tag: libdrm-2.4.122

https://dri.freedesktop.org/libdrm/libdrm-2.4.122.tar.xz
SHA256: d9f5079b777dffca9300ccc56b10a93588cdfbc9dde2fae111940dfb6292f251  l=
ibdrm-2.4.122.tar.xz
SHA512: ea6bac94416d4ba0e9805e142ae62904236bc49f803d4fc10c92968a4df64c818dd=
42524ad7a4e988062836783a148e27094050bb2754f751a368627f794ad13  libdrm-2.4.1=
22.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.122.tar.xz.sig
