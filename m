Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AA4B184B3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 17:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A05110E8B2;
	Fri,  1 Aug 2025 15:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BULsacfX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8EB910E8B2;
 Fri,  1 Aug 2025 15:12:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 88ECBA535ED;
 Fri,  1 Aug 2025 15:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CAEC4CEE7;
 Fri,  1 Aug 2025 15:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754061142;
 bh=T0JRaAlYPGwVaZX/So46uAmuoyfpyO2EumWKx4Gi5y4=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=BULsacfXSD2H8x/IZT4JCsYTNY4qzwz6L02PaOi3fuYjonBwlTNJ2g3akEI/zjUzO
 zmNhSAEHPKqcQ+DXR5pTiK/D513Oubh51m0NmFU+rkorpgmvtA3sivxaM5aDT8JI0A
 a6nbYGkWYhz64MPTDMWl40l1tl7NEbiRhACsNpbzDPhiuMxKfiHuPZGzMoPbWBBV2l
 2BSQFXP7SY94xi7Qt9JD7TjP/2nt0nAThMowJeTJtMToMj8l6RqcFqN6dG5SFxNZ9T
 Lvv+/9o1keUCpZiWwCjCgCShotsOAYydWSrtIgWnjgF41ltt/+Py/V2bAx4AscNvLy
 4Yq7TKBVANNUw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Aug 2025 17:12:19 +0200
Message-Id: <DBR6S322NP7E.1T932OJTX6A63@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] drm/nouveau: Remove surplus struct member
Cc: "phasta@kernel.org" <phasta@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250801074531.79237-2-phasta@kernel.org>
 <809d2ff29bb87f782f7a813d67d3d604882db320.camel@nvidia.com>
In-Reply-To: <809d2ff29bb87f782f7a813d67d3d604882db320.camel@nvidia.com>
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

On Fri Aug 1, 2025 at 4:50 PM CEST, Timur Tabi wrote:
> Does mean that the TODO has been done, or that someone completely forgot =
and now your patch is
> remove all reminders?
>
> If it's the format, maybe add a fixes: tag for the commit that resolved t=
he TODO?

The TODO was introduced by commit ebb945a94bba ("drm/nouveau: port all engi=
nes
to new engine module format") from 2012.

It's a bit hard to know what exactly resolves "this will be reworked in the=
 near
future" for a commit with the following diffstat. :)

	146 files changed, 14219 insertions(+), 11099 deletions(-)

The last remains of accel_done were removed with commit
4e2ec2500bfc ("drm/nouveau: Remove file nouveau_fbcon.c"), but I don't thin=
k we
should mention this commit, given that apparently no one knows what was int=
ended
to be reworked here [1].

We could mention the above in the commit message, though it will also be
available through the lore link in the commit message once the patch is app=
lied.

NIT: Please don't top post, use interleaved style [2] instead.

[1] https://lore.kernel.org/all/481a2808c235f95726d17803503b2b6dc2746dc3.ca=
mel@mailbox.org/
[2] https://docs.kernel.org/process/submitting-patches.html#use-trimmed-int=
erleaved-replies-in-email-discussions
