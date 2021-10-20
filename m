Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EAA4354A3
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 22:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D356E3B2;
	Wed, 20 Oct 2021 20:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64596E3B2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 20:31:59 +0000 (UTC)
Date: Wed, 20 Oct 2021 20:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634761916;
 bh=O82eCBs2jKxsBVGPMO4TLUmxkXbRQ0J1gDqPWEQFqMw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=oPERsUWQUsvkFAlOSXg3K5Hm8VMamPpnqNtR4IBsb8cEaQaEyPENV8oCJaHicqV6+
 9+NPMOu2FIXQQb64TArDJi3//kR9rgrUKJDWVKGYCaGs3obubJnrUOtS3mWqPWtaIi
 LkT3zeIJopwzYJqVFyU4kJO8OnkMduPKMD96LfvHTwm9IKaTW/2yncKX3dn/3e+t9k
 Jtjwi0SqMwMec3Mkzc23r6nZwbyjnnCgCJ9heZQqC7uNoEXxVE856en/UPyFOXk2Cm
 eo6qY23VbAlILCc+7YSYwEi/WMVorT9BW6LNUgdj9b65LUVV9/pzjkPNPYCWY4Zmuf
 prDH6PEJ1omqQ==
To: Jason Ekstrand <jason@jlekstrand.net>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 4/6] dma-buf: Add an API for exporting sync files (v12)
Message-ID: <WpDYcxfyd8jRAIwx57yTBkythPO5YCzcpNBrsczMx6mTm4L7NePH0YfMb8-hfKGBo2PM6ksjjP5nwTB3lmQVutnVU69CxThJ31Sgqsk_I88=@emersion.fr>
In-Reply-To: <20210610210925.642582-5-jason@jlekstrand.net>
References: <20210610210925.642582-1-jason@jlekstrand.net>
 <20210610210925.642582-5-jason@jlekstrand.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FWIW, I'm using this IOCTL in a wlroots patchset [1].

To detect support for this IOCTL, is there anything better than creating a
DMA-BUF and checking for ENOTTY? I'd like to disable explicit sync at init-=
time
if this is missing.

[1]: https://github.com/swaywm/wlroots/pull/3282
