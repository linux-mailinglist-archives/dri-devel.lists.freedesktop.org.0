Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5BCD2F88E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 11:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BA410E856;
	Fri, 16 Jan 2026 10:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aTGmYN6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F8D10E856
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 10:27:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0A7A260160;
 Fri, 16 Jan 2026 10:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC885C116C6;
 Fri, 16 Jan 2026 10:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768559248;
 bh=r0sTW2qUreDPRkSDHBwnFAaEoyMed8xG9ECemqNRBWk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aTGmYN6xJX3Ogv1MQrW75hA5q5VuqceCzEO7QHKBoINSwCz96qspEaw3bn4jszJTE
 LVSGjf+KVym+/BeZXXLMjAlNzRxpFSb0dhCE0Lf/9i7iiO1VdlY6O6md29NebBVvmT
 u+92qpJlWQk39w+E6DE/5TewGl+bL61QNMHrDq8UIqeK3oTmkfCRoVZORBRR2SqQNQ
 Y/6YFg6pggyc5wlo7RnR+FllTm8SYrpPmUyS3w9NrAb8cXdx+GKn5VpCY901FQzyGs
 13gEXQ5bMb5WKDt26l/svyAqbqxbUThGjcI4OxL/3UgK3/U3uITAZq0FXGf6/kDjXI
 QJ+vKbimPkCGg==
Message-ID: <34759368-6b0f-421f-81dd-20006ee19a1b@kernel.org>
Date: Fri, 16 Jan 2026 11:27:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: display: ti, am65x-dss: Add am62p dss
 compatible
To: Swamil Jain <s-jain1@ti.com>, jyri.sarha@iki.fi,
 tomi.valkeinen@ideasonboard.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 aradhya.bhatia@linux.dev, mwalle@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devarsht@ti.com, praneeth@ti.com,
 u-kumar1@ti.com
References: <20260116095406.2544565-1-s-jain1@ti.com>
 <20260116095406.2544565-2-s-jain1@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260116095406.2544565-2-s-jain1@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 16/01/2026 10:54, Swamil Jain wrote:
> TI's AM62P SoC contains two instances of the TI Keystone Display
> SubSystem (DSS), each with two video ports and two video planes. These
> instances support up to three independent video streams through OLDI,
> DPI, and DSI interfaces. The OLDI interfaces utilizes two OLDI
> transmitters OLDI0 and OLDI1.
> 
> DSS0 (first instance) supports:
>  - With respect to OLDI Tx interfaces, DSS0 instance can either drive
>    both OLDI0 Tx and OLDI1 Tx together (e.g. dual link mode or clone
>    mode) or can only drive OLDI0 Tx in single link mode with OLDI1 being
>    utilized by DSS1 or left unused.
>  - DPI output from video port 2.
> 
> DSS1 (second instance) supports:
>  - With respect to OLDI Tx interfaces, DSS1 instance can only drive
>    OLDI1 Tx given DSS0 is not utilizing that as described above.
>  - DSI controller output from video port 2.
> 
> The two OLDI transmitters can be configured in clone mode to drive a
> pair of identical OLDI single-link displays. DPI outputs from
> DSS0 VP2, DSS1 VP1, and DSS1 VP2 are multiplexed, allowing only one
> DPI output at a time.
> 
> Add the compatible string "ti,am62p-dss" and update related
> description accordingly.
> 
> AM62P has different power domains for DSS and OLDI compared to other
> Keystone SoCs. DSS0 can have up to 3 power-domains for DSS0, OLDI0 and
> OLDI1, and DSS1 can have up to 2 power-domains for DSS1 and OLDI1.
> 
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>  .../bindings/display/ti/ti,am65x-dss.yaml     | 37 ++++++++++++++++++-
>  1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 38fcee91211e..b1cec5383160 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -24,6 +24,19 @@ description: |
>    DPI signals are also routed internally to DSI Tx controller present within the
>    SoC. Due to clocking limitations only one of the interface i.e. either DSI or
>    DPI can be used at once.
> +  The AM62P has two instances of TI Keystone Display SubSystem, each with two
> +  video ports and two video planes. These instances can support up to 3
> +  independent video streams through OLDI, DPI, and DSI interfaces.
> +  DSS0 (first instance) supports:
> +    - Two OLDI TXes on video port 1, configurable in dual-link or
> +      single link clone mode
> +    - DPI output on video port 2
> +  DSS1 (second instance) supports:
> +    - One OLDI TX on video port 1 (single-link mode only)
> +    - DSI controller output on video port 2
> +  The two OLDI TXes can be configured in clone mode to drive a pair of
> +  identical OLDI single-link displays. DPI outputs from DSS0 VP2, DSS1 VP1,
> +  and DSS1 VP2 are muxed, allowing only one DPI output at a time.
>  
>  properties:
>    compatible:
> @@ -31,6 +44,7 @@ properties:
>        - ti,am625-dss
>        - ti,am62a7-dss
>        - ti,am62l-dss
> +      - ti,am62p-dss
>        - ti,am65x-dss
>  
>    reg:
> @@ -81,8 +95,13 @@ properties:
>      maxItems: 1
>  
>    power-domains:
> -    maxItems: 1
> -    description: phandle to the associated power domain
> +    minItems: 1
> +    description:
> +      phandle to the associated power domain(s).
> +    items:
> +      - description: DSS controller power domain
> +      - description: OLDI0 power domain
> +      - description: OLDI1 power domain

No, I already rejected this.


This is not how review works. Look:

1. You wrote patch on 7th Jan.
2. I replied ONE DAY LATER.
3. You waited one week to give reply.
4. Then two days later you send new version not waiting for my reply.

If you have one week to reply, then so do I.

NAK, go to v3 and implement comments.

>  
>    dma-coherent: true
>  
> @@ -196,6 +215,20 @@ allOf:
>                properties:
>                  endpoint@1: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,am62p-dss
> +    then:
> +      properties:
> +        power-domains:
> +          maxItems: 3

That's pointless. It's already 3.

Best regards,
Krzysztof
