Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40892B07AE5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 18:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA78510E2C7;
	Wed, 16 Jul 2025 16:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="W5RMj8eT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D078C10E2C7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 16:17:36 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56GGHSMF2540402;
 Wed, 16 Jul 2025 11:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1752682648;
 bh=ft3Wq6C1Q+KCfARaoberFidaRltktScsYGYlfSEwaro=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=W5RMj8eTZcR2ac5EvYEJwO2NAMxtLHsyT/FOoaCkkSjCdv0vN0A6aUigg4Xgr70H7
 THuS9Athxb8CcYb3ckaXDe/helWL0/AN1opyIhptp15Gi9AEB4ihSb3AIQLNztDsli
 /K8i+zaBYJ3NYnUF4QoeHAg7pT9bglitwhEzDA48=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56GGHR63998251
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 16 Jul 2025 11:17:27 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 16
 Jul 2025 11:17:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 16 Jul 2025 11:17:27 -0500
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56GGHQQ9753586;
 Wed, 16 Jul 2025 11:17:26 -0500
Message-ID: <d76c0299-a19d-4524-b026-79874fee10ee@ti.com>
Date: Wed, 16 Jul 2025 11:17:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] dt-bindings: gpu: img: Add AM62P SoC specific
 compatible
To: Michael Walle <mwalle@kernel.org>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250716134717.4085567-1-mwalle@kernel.org>
 <20250716134717.4085567-2-mwalle@kernel.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250716134717.4085567-2-mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

On 7/16/25 8:47 AM, Michael Walle wrote:
> The AM62P and the J722S features the same BXS-4 GPU as the J721S2. Add a
> new SoC specific compatible.
> 

If the GPU is the same, and the integration is the same, do you really need
a new compatible?

> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>   Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 4450e2e73b3c..bad3e412a168 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -23,6 +23,7 @@ properties:
>             - const: img,img-rogue
>         - items:
>             - enum:
> +              - ti,am62p-gpu

There is a check below based on SoC compat:

>  - if:
>      properties:
>        compatible:
>          contains:
>            enum:
>              - ti,am62-gpu
>              - ti,j721s2-gpu
>    then:
>      properties:
>        clocks:
>          maxItems: 1

If you do add a new SoC specific compatible does this check need updating?

Andrew

>                 - ti,j721s2-gpu
>             - const: img,img-bxs-4-64
>             - const: img,img-rogue
