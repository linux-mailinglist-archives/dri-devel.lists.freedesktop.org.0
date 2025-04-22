Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D7EA96270
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 10:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0573310E545;
	Tue, 22 Apr 2025 08:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QmYN7D6/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87F210E544;
 Tue, 22 Apr 2025 08:46:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 17A6AA4BFD0;
 Tue, 22 Apr 2025 08:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A82C4CEE9;
 Tue, 22 Apr 2025 08:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745311587;
 bh=H44nKWfJpflFFXOrn5cncTRUymqZaUjYXbKXiW88Txw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QmYN7D6/vQ3fhyXfvF2TBLjn9Eh6HHivB2z2YJK9Q1otgITmYvXWco87nUQ/XQFej
 d24PAugK941acJt881sWsHAnIbR9eKNrky+nbiRiL4mup5twIh0m67xqu46jrSWmRD
 8EPJxxMkxH/Vj/arYSTCAmWqj9iHXT7hyxLH9R9ouO3DvdjiwDA57a1hsnfA2oh+l/
 e9VnSQ8AiR2H7lLMrYiS9GbwvK3nvogHF+tFOyZtAZ5JPdY+8Mv7Fqt+XS2A39TlML
 XwuNTkJURqd4th6YNyQVCEGs1aHB+mD21WwZyZKVOSEvInoYdj422SG6TzvMh2cnJp
 NpNyOEY6X8TCQ==
Date: Tue, 22 Apr 2025 10:46:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>,
 Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Baryshkov <lumag@kernel.org>, 
 Adam Skladowski <a_skl39@protonmail.com>,
 Sireesh Kodali <sireeshkodali@protonmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, 
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org
Subject: Re: [PATCH v5 1/5] dt-bindings: clock: qcom: Add MSM8937 Global
 Clock Controller
Message-ID: <20250422-ermine-of-pastoral-courage-bb7bcd@kuoka>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-1-bf9879ef14d9@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250421-msm8937-v5-1-bf9879ef14d9@mainlining.org>
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

On Mon, Apr 21, 2025 at 10:18:23PM GMT, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrot=
e:
> Add device tree bindings for the global clock controller on Qualcomm
> MSM8937 platform.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  .../devicetree/bindings/clock/qcom,gcc-msm8953.yaml   | 11 ++++++++---
>  include/dt-bindings/clock/qcom,gcc-msm8917.h          | 19 +++++++++++++=
++++++
>  2 files changed, 27 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

