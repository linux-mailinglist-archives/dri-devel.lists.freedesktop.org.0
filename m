Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D071CB8E4B6
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 22:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9A910E03C;
	Sun, 21 Sep 2025 20:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QxioDiRi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B1410E03C
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 20:08:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D97AC601D6;
 Sun, 21 Sep 2025 20:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BFB3C4CEE7;
 Sun, 21 Sep 2025 20:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758485288;
 bh=JhK7EYIcFoZDxlEsEl//u9AwwpAD2Ir5SVc2aQvCAxE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=QxioDiRihJpqXM64fWo+FGJq8dV0fkMzt6QxQvB+j0ky3ntrdunW1droBiNEcHllB
 fpuisUIgea9BsH/Y4gTHb94VjH2DQ0YaOkjDxDlaBfpPJkWnAbqT17N8oOchJmhKsT
 Slv3kzv3C2cikmJ7Am+tQ78nqAK7YISos79wJjZpIoOeI5cHc3o/YmkZgPvKbmrvgR
 1ZJk2DHR3ZTZ0ZaFiL2FEiF9IODEsTSs1YDeXmIu6ej0UdmKQKasW8DphCxFCaPZ3y
 Sr9vaxqbLMwFyTg5En/466EGThtjwHEE6/DvGlkcSrW4VI1PxVpVBhTgcXFEwt9yw/
 vN2xDxREgy+xA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250906131655.239340-2-clamor95@gmail.com>
References: <20250906131655.239340-1-clamor95@gmail.com>
 <20250906131655.239340-2-clamor95@gmail.com>
Subject: Re: [PATCH v2 1/4] clk: tegra20: reparent dsi clock to pll_d_out0
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org
To: Charan Pedumuru <charan.pedumuru@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
Date: Sun, 21 Sep 2025 13:08:06 -0700
Message-ID: <175848528652.4354.10389254038978524687@lazor>
User-Agent: alot/0.11
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

Quoting Svyatoslav Ryhel (2025-09-06 06:16:52)
> Reparent DSI clock to PLLD_OUT0 instead of directly descend from PLLD.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
