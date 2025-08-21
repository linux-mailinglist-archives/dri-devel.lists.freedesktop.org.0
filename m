Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125E6B2EF5A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 09:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F7810E16D;
	Thu, 21 Aug 2025 07:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PLNlOioW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B7310E16D;
 Thu, 21 Aug 2025 07:20:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 317345C5BC7;
 Thu, 21 Aug 2025 07:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44595C4CEED;
 Thu, 21 Aug 2025 07:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755760814;
 bh=9O0+HGOwcJkxqZ1P78CUIzkeBXGNDQ1uxZXdRSbeMAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PLNlOioWd7Cfj3B2W6thbArq8HOHjn6MlGUcBz11xtXrMHPxTm8VuqA0RWPOBEmnu
 Z+IY+j30jV+3rq88jbtN0QDR1TsDUAplSqeoEL/YpnQWyJhKmUFYGTAsxjdZdi1B88
 mcoP6aXuLVmwu7M//aVyZUO0SQnU1UnJ//15jA2bY9oc68nD6tbbETX7R+VgvLmYJl
 mpzjNoZPeoihqPcNFl0xJqDI+LhKDJjYeYZxWMrf72zRoYwhajp2tjt8UClarsHD+f
 Hy0J2E20inHBbjyLScBDv/w0uKb74GLYCuia3eOcuawGQEMX+FNxblUH/XrQGWwWrR
 nUDRYhnpEKLtQ==
Date: Thu, 21 Aug 2025 09:20:12 +0200
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
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Baryshkov <lumag@kernel.org>, 
 Adam Skladowski <a_skl39@protonmail.com>,
 Sireesh Kodali <sireeshkodali@protonmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
Subject: Re: [PATCH v6 3/6] dt-bindings: display/msm/gpu: describe A505 clocks
Message-ID: <20250821-radiant-squirrel-of-prowess-f9ea27@kuoka>
References: <20250820-msm8937-v6-0-b090b2acb67e@mainlining.org>
 <20250820-msm8937-v6-3-b090b2acb67e@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250820-msm8937-v6-3-b090b2acb67e@mainlining.org>
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

On Wed, Aug 20, 2025 at 01:37:47AM +0200, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Descirbe A505 clocks it is using same clocks like A506.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Doc=
umentation/devicetree/bindings/display/msm/gpu.yaml
> index 7ef80f9fac8b2927b2a69100a7f6c729d9d188ab..478ae6e7e55a405d9443dda97=
486b6abfa05e22b 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -252,7 +252,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            pattern: '^qcom,adreno-506\.[0-9]+$'

50[56] would work, still simple pattern.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

