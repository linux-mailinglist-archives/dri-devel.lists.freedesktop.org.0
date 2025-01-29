Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E1BA21830
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 08:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A459610E750;
	Wed, 29 Jan 2025 07:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kjv8wCD2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0D010E750
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 07:32:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 685B0A40249;
 Wed, 29 Jan 2025 07:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0791BC4CED3;
 Wed, 29 Jan 2025 07:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738135939;
 bh=edf6GahyS4kb1UUMjT6wYRelLIajZBKgtmSAla2YLgY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kjv8wCD2xyOyOzx6Ndz/9YmNXJrbfN0QJI5XzsYL/xBliwLXKzqYaleXdo7ByuVJa
 QTJBzwtwN46kGOat1zK6Wsg0FRh7OfdUa+IL1j+ZhOtg2Av8dCXtcQSIRpvBUq3vr/
 zlmXZKObadkO9d7vZsOQLTKC994XxA1LLd0vcwrLTCByse9TaVJWHqdN6Q9CtbKlSm
 RKDYE8QKFskkBoWsEuHllVQESs5ofolRAZ4cuBoR/gikHpPPfQPeyannm4PXskLZUC
 7+wAxRXTJxCMaknotTf3cp0QXyN8NESG39PJ81pxKiG4FAfEAo45IFhxsbGIvIXyEu
 wEzzJqrDpRZFA==
Date: Wed, 29 Jan 2025 08:32:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com, 
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 08/18] dt-bindings: reset: Add T-HEAD TH1520 SoC Reset
 Controller
Message-ID: <20250129-stereotyped-just-sponge-c8ffab@krzk-bin>
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194835eucas1p29b16bee72365f321e1056fc4d9d44345@eucas1p2.samsung.com>
 <20250128194816.2185326-9-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250128194816.2185326-9-m.wilczynski@samsung.com>
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

On Tue, Jan 28, 2025 at 08:48:06PM +0100, Michal Wilczynski wrote:
> Add a YAML schema for the T-HEAD TH1520 SoC reset controller. This
> controller manages resets for subsystems such as the GPU within the
> TH1520 SoC.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/reset/thead,th1520-reset.yaml    | 44 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +
>  .../dt-bindings/reset/thead,th1520-reset.h    | 15 +++++++
>  3 files changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
>  create mode 100644 include/dt-bindings/reset/thead,th1520-reset.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

