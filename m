Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77909A64702
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 10:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A4E10E3D8;
	Mon, 17 Mar 2025 09:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GtSD5kPr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5F110E3D7;
 Mon, 17 Mar 2025 09:21:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F0F895C53F4;
 Mon, 17 Mar 2025 09:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878E3C4CEEE;
 Mon, 17 Mar 2025 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742203313;
 bh=UIR53RBEBGjhoxZodhVv//7PYC64fcsZWaxeAors98k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GtSD5kPr+LfiDNyVdFU85kUPAvtVq8Kutc4BbhAQojIQLxvx9vvddHoblN5gsu04W
 6sRbGW7QN9sax49m8IKwxDIpvclkqIDOoBVu4PZp/V3/0tjwSDgNKMheZLvj4hwiIw
 Djb7sXVsReG8U8rD9F9mcTiiRGhmCMfJTSffcFm+WLG9Iaum4Wnvhwl+BnYHk+XijX
 2aiiGdWr3IBULXidx9BVnh77IwUp9oE288nt6ve6g8sYA+5OzZV8fNaCmXeuEyN2l+
 tuwtAthxo0m64qccp+YKMWk1YI1a2erhC7pwsmz1oRdVwkNFoBsFN6IcNWY5HsjvoS
 k4Ne+lFQixi9Q==
Date: Mon, 17 Mar 2025 10:21:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>,
 Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Baryshkov <lumag@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
 Adam Skladowski <a39.skl@gmail.com>
Subject: Re: [PATCH v4 3/6] dt-bindings: drm/msm/gpu: Document AON clock for
 A505/A506/A510
Message-ID: <20250317-hypnotic-weightless-mosquito-f489ad@krzk-bin>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-3-1f132e870a49@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250315-msm8937-v4-3-1f132e870a49@mainlining.org>
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

On Sat, Mar 15, 2025 at 03:57:37PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> From: Adam Skladowski <a39.skl@gmail.com>
>=20
> Adreno 505 (MSM8937), Adreno 506(MSM8953) and Adreno 510(MSM8976)
> require Always-on branch clock to be enabled, describe it.
>=20
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> [reword commit, move alwayson on the first place]
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Doc=
umentation/devicetree/bindings/display/msm/gpu.yaml
> index 6ddc72fd85b04537ea270754a897b4e7eb269641..5028398cc3b517e404a92a2c3=
0688f72eab4c1b3 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -152,11 +152,13 @@ allOf:
>        properties:
>          clocks:
>            minItems: 2
> -          maxItems: 7
> +          maxItems: 8
> =20
>          clock-names:
>            items:
>              anyOf:
> +              - const: alwayson
> +                description: GPU Always-On clock

Are you adding bindings for devices which were not described previously?
Then don't grow this pattern, but create if:then: with a strictly
ordered list for them (and keeping order of other variants).

Best regards,
Krzysztof

