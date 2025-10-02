Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818DCBB2417
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 03:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A03F10E141;
	Thu,  2 Oct 2025 01:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WOEqlg92";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88C510E141
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 01:19:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2AE7560328;
 Thu,  2 Oct 2025 01:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC23C4CEF1;
 Thu,  2 Oct 2025 01:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759367993;
 bh=S5v77+loamJYz2mc9F0sUnNrIjYA6jb36MoituK44Hs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WOEqlg92ll97si18eSiQXlGl6HGZySnMaBwFwN1KOe+BKepCzCTp4XHmWDWNL0+Vs
 fX4/VCdyCr9byQQ3Z0r+ux9QG0+uwC9kSinEfbXJ6SgzH2ky58ZlvYD29Ng4kVXttW
 4aCVdg68OqZMZqKviZkvIKWMKvMEN26FpP5W7kfI/ifaq3rvPSCKzuuw0Ook3g9nlj
 kWmsxSO9q9yP/YRsfawTF7cMXQ7FdBYQ4R5FgYT6/yoeVtpGNscbFilr07drwwnmUC
 JLf8fXlNhhVRc4wXKM8AGxBVHRU8tTfSdSZtE5BBI1mFl1zaJ+DVgXDTMfW1JF8y3d
 Eocl/yGYXHhZw==
Date: Wed, 1 Oct 2025 20:19:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-media@vger.kernel.org,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 linux-gpio@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
 Simona Vetter <simona@ffwll.ch>, Aaron Kling <webgeek1234@gmail.com>,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: Re: [PATCH v3 04/22] dt-bindings: display: tegra: document Tegra30
 VI and VIP
Message-ID: <175936798598.2836295.8899587600859365567.robh@kernel.org>
References: <20250925151648.79510-1-clamor95@gmail.com>
 <20250925151648.79510-5-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925151648.79510-5-clamor95@gmail.com>
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


On Thu, 25 Sep 2025 18:16:30 +0300, Svyatoslav Ryhel wrote:
> Existing Parallel VI interface schema for Tegra20 is fully compatible with
> Tegra30; hence, lets reuse it by setting fallback for Tegra30.
> 
> Adjust existing VI schema to reflect that Tegra20 VI is compatible with
> Tegra30 by setting a fallback for Tegra30. Additionally, switch to using
> an enum instead of list of const.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-vi.yaml      | 19 ++++++++++++-------
>  .../display/tegra/nvidia,tegra20-vip.yaml     |  9 +++++++--
>  2 files changed, 19 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

