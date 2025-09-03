Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21209B41780
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 09:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29E310E452;
	Wed,  3 Sep 2025 07:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bWU+9y6r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CC710E452
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 07:59:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 67F536013B;
 Wed,  3 Sep 2025 07:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9D8C4CEF0;
 Wed,  3 Sep 2025 07:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756886370;
 bh=bWcrYa09wM8afU1is5QwkSNfFYCNQIT3VyOg4+tWgdw=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=bWU+9y6r/4lC5Fdio3/WKSQOcd0MXFT+s9wx8BhZIWggVhBpzfs134JZoYNsgV4PW
 JAkEed7PrSjqxFE4GarQ4Ol4349O0qE5mYpC/z0j3lp5MJ2byJyURYE9FyErSu3vUo
 tNYU+TaMH0TAbCCOkBM+mgmFntpFXld1+GTYcfwGU0lpRpoPXSw+yauuklHh2ZVkbj
 hxysp/mqjiI7S2YJDoMRcMHI7YKRFCB5dYsCyjmdOK+7WsVARSyZyCm+XJ6s+2PssP
 BPZwnwZ8/YfKR8HGZM6GMlqwg7LBn9QnJSzZpCZ1M+97R/3EcxV3/Qhhi9lP0Zhq8b
 a/RJGiKeWG6/A==
Message-ID: <6f5d003df567ca8555c9b6e2a174ac6a@kernel.org>
Date: Wed, 03 Sep 2025 07:59:26 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nathan Chancellor" <nathan@kernel.org>
Subject: Re: [PATCH] drm/tidss: dispc: Explicitly include bitfield.h
In-Reply-To: <20250902-drm-tidss-fix-missing-bitfield-h-v1-1-aaad4a285f98@kernel.org>
References: <20250902-drm-tidss-fix-missing-bitfield-h-v1-1-aaad4a285f98@kernel.org>
Cc: dri-devel@lists.freedesktop.org, patches@lists.linux.dev,
 "Jyri Sarha" <jyri.sarha@iki.fi>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>,
 "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
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

On Tue, 2 Sep 2025 14:15:50 -0700, Nathan Chancellor wrote:
> After a recent series to use FIELD_PREP and FIELD_MODIFY in
> tidss_dispc.c, there are many errors when bitfield.h is not implicitly
> included, such as when building allmodconfig for ARCH=3Dhexagon:
>=20
>   drivers/gpu/drm/tidss/tidss_dispc.c:1116:2: error: call to undeclared f=
unction 'FIELD_MODIFY'; ISO C99 and later do not support implicit function =
declarations [-Wimplicit-function-declaration]
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
