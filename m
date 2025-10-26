Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65607C0B58F
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 23:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AF010E0F9;
	Sun, 26 Oct 2025 22:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NVU2GwNf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD2610E0F9
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 22:24:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CF80E41760;
 Sun, 26 Oct 2025 22:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B8EC4CEE7;
 Sun, 26 Oct 2025 22:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761517458;
 bh=wqfmqPUYrqaRfBk+poDFpcrAq8e0x45EHLFsjGjVWiU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NVU2GwNfwtpx6wq6fJoFqVxektGKFDqprTLRqK+JcoZhnNmRQOwGSocBBNOPG3vTT
 81Z3JqDVJdPT4zAxd4RYatkBjpj1wpCqiQL1Rn96e/JWPTDs4o87LztNG8XNWi9jnP
 fRmenZlr9UI4z20bq4qbXEJpgQyySlAoEOrIR96Tl4c8Dqro03eHVatK771aa42f25
 klcYgzV/pv/C/DB7flPJM/stVHiCeNWugqRjMESyhlzRlJpgnx+2/0FfT1Yo6u0F6X
 KVCRG1mGSsasXw8BNa6IRATUkusP7e9W3RB+5jgszjawGRCtUxSRNf+4imwJR/X30o
 5hKdFern7DJxA==
Date: Sun, 26 Oct 2025 17:24:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>,
 Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-media@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5 21/23] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
Message-ID: <176151745413.3041982.13183037303437786159.robh@kernel.org>
References: <20251022144930.73272-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022144930.73272-1-clamor95@gmail.com>
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


On Wed, 22 Oct 2025 17:49:28 +0300, Svyatoslav Ryhel wrote:
> Document CSI HW block found in Tegra20 and Tegra30 SoC.
> 
> The #nvidia,mipi-calibrate-cells is not an introduction of property, such
> property already exists in nvidia,tegra114-mipi.yaml and is used in
> multiple device trees. In case of Tegra30 and Tegra20 CSI block combines
> mipi calibration function and CSI function, in Tegra114+ mipi calibration
> got a dedicated hardware block which is already supported. This property
> here is used to align with mipi-calibration logic used by Tegra114+.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-csi.yaml     | 138 ++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

