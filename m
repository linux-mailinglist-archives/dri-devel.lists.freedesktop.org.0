Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34524CF2AEE
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 10:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B6610E05E;
	Mon,  5 Jan 2026 09:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jVkeO9Oz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9470210E05E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 09:18:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EBCC260010;
 Mon,  5 Jan 2026 09:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C569C116D0;
 Mon,  5 Jan 2026 09:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767604691;
 bh=77nfSUhXyWDgNFLBFg0h1ki61o/WwLGrd8s8RoTQ0ts=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jVkeO9Oz4OIsv+pu0dLHRmRVm6Z2EHvj/mrSj1JFpWLWoresO/OrfJNo5qlWj9lNf
 ciHt5uJix8ayfzq5bUM1EXTohl5ycqx0zq6XKIvh5udRCdippGVlFTrjO03TsRGjzr
 5sCpCZ6ByAqD6VkvdyWzFxgD8MconpCD72hlf1wzdTHxO/q07aj8CruAfvIGQzfwyB
 0P1aYnTeo2cD8sl+JyDmaL0JEUU477DcUwYNPgltC2fBTVGXGq7s4z6fiAyN0m9e6T
 ExQpoCODirBRBm0uSI0VtNRTSJadfwSm4xbOfet0tzChT74jK6PutLEp1CPL6URqz5
 mOeCq+qXJBLrw==
Date: Mon, 5 Jan 2026 10:18:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img, powervr-rogue: Document GE8300
 GPU in Renesas R-Car D3
Message-ID: <20260105-attentive-vague-scorpion-a6a46b@quoll>
References: <20260104222653.1659382-1-niklas.soderlund+renesas@ragnatech.se>
 <20260104222653.1659382-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260104222653.1659382-2-niklas.soderlund+renesas@ragnatech.se>
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

On Sun, Jan 04, 2026 at 11:26:52PM +0100, Niklas S=C3=B6derlund wrote:
> Document Imagination Technologies PowerVR Rogue GE8300 BNVC 22.67.54.30
> present in Renesas R-Car R8A77995 D3 SoCs.
>=20
> Compared to other R-Car Gen3 SoCs the D3 only have one power domain and
> it is always on. Extend the list of special cases for R8A77995 to
> capture this.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  .../bindings/gpu/img,powervr-rogue.yaml       | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml=
 b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 86ef68985317..2122380561e4 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -25,6 +25,11 @@ properties:
>                - renesas,r8a779a0-gpu
>            - const: img,img-ge7800
>            - const: img,img-rogue
> +      - items:
> +          - enum:
> +              - renesas,r8a77995-gpu
> +          - const: img,img-ge8300
> +          - const: img,img-rogue
>        - items:
>            - enum:
>                - ti,am62-gpu
> @@ -111,6 +116,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - img,img-ge8300
>                - img,img-ge7800

Fixi sorting here
>                - img,img-gx6250
>                - thead,th1520-gpu
> @@ -169,6 +175,20 @@ allOf:
>        required:
>          - power-domains
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r8a77995-gpu

This goes to the other EXACTLY SAME if:then: entry as enum (with
adjustments to description).

Best regards,
Krzysztof

