Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BBDB187CB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 21:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B2E10E315;
	Fri,  1 Aug 2025 19:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="oLva7SuN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F90B10E315;
 Fri,  1 Aug 2025 19:33:28 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4btx2F1VR0z9sd6;
 Fri,  1 Aug 2025 21:33:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1754076805; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RWaNLhbm24FN2VPxqLS0wEWVP3ckHjc8299w5KEB5CM=;
 b=oLva7SuNT6tG4OnBJa4DIwGdgJee+Xi/k6nkZqFA27OyTG4xVhvDr2FZ3QNHzWzTJPDgW6
 UXPi0gQBJj/z3AWvs7XOEUcv6XRqbmv7wHga/9WMH8GRsCxVkaXHuaBlVLssknjafQqcNu
 04PyyEWVyG1RMzDZMiJ8WJSWD16P2OXKNweUWT13DnDJk1AY9zrWCf6aAkv7UG6IQgFJKK
 4lmi7CSfnP8EQT5pMFz3f78IJA81j8cBCIA5vFED9Mvez0Hh3b579ncTZQGz98a+qm8Lu1
 lKMpWONxvlUtKBf59G5KNThsqkOmTeOhBSzw3y0GFEcQ6QQXZD+jZypzxDe0bw==
Message-ID: <f429ce1c4c818d5e622bb6e9dc485e8e6b776e56.camel@mailbox.org>
Subject: Re: [PATCH] drm/nouveau: Remove surplus struct member
From: Philipp Stanner <phasta@mailbox.org>
To: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "phasta@kernel.org" <phasta@kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Fri, 01 Aug 2025 21:33:22 +0200
In-Reply-To: <39dac3cf6ecef55a0e3dac7a381670491f09b8aa.camel@nvidia.com>
References: <20250801074531.79237-2-phasta@kernel.org>
 <809d2ff29bb87f782f7a813d67d3d604882db320.camel@nvidia.com>
 <DBR6S322NP7E.1T932OJTX6A63@kernel.org>
 <39dac3cf6ecef55a0e3dac7a381670491f09b8aa.camel@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 13c93f890bca2754489
X-MBO-RS-META: xa1yr743g3p4es4ok5cfrhg7m5n13iux
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2025-08-01 at 15:42 +0000, Timur Tabi wrote:
> On Fri, 2025-08-01 at 17:12 +0200, Danilo Krummrich wrote:
> > On Fri Aug 1, 2025 at 4:50 PM CEST, Timur Tabi wrote:
> > > Does mean that the TODO has been done, or that someone completely for=
got and now your patch
> > > is
> > > remove all reminders?
> > >=20
> > > If it's the format, maybe add a fixes: tag for the commit that resolv=
ed the TODO?
> >=20
> > The TODO was introduced by commit ebb945a94bba ("drm/nouveau: port all =
engines
> > to new engine module format") from 2012.
> >=20
> > It's a bit hard to know what exactly resolves "this will be reworked in=
 the near
> > future" for a commit with the following diffstat. :)
> >=20
> > 	146 files changed, 14219 insertions(+), 11099 deletions(-)
> >=20
> > The last remains of accel_done were removed with commit
> > 4e2ec2500bfc ("drm/nouveau: Remove file nouveau_fbcon.c"), but I don't =
think we
> > should mention this commit, given that apparently no one knows what was=
 intended
> > to be reworked here [1].
> >=20
> > We could mention the above in the commit message, though it will also b=
e
> > available through the lore link in the commit message once the patch is=
 applied.
>=20
> It's your call, I'm just leery of removing a TODO without any mention of =
whether it's actually
> done.

We can't really tell whether "it" is done or not, because the original
author didn't write down *what* exactly needs to be done, which makes
the TODO kind of useless.

Since that information is lost forever, removing it arguably is
alright.

P.

>=20
> > NIT: Please don't top post, use interleaved style [2] instead.
>=20
> Sorry, coffee didn't kick in yet.

