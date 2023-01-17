Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E39766DC6C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 12:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832DF10E2DB;
	Tue, 17 Jan 2023 11:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B35010E2DB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 11:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673955080; x=1705491080;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=csXXDL3NsaAqXDT+FItt2p2CSWBTqlmNoHbAeHBdx5U=;
 b=ZukQ+jRsoMEV2+Zyu+7+hDqo/AOms0L+jbf0FmN7zjjJGeIM7InBLQ7B
 LtQzDy/AbiFlaZ3p3PPRZN+JCkF6V7aoNXWSlHG22KGKke264n4466A8s
 VhLPRRs+cNsEbQEzcCQOQ5hSxwqZy/0G6mbk/PqaS0979Qk75DzrbfQsA
 K+sXe2z+/z5gzeK7SVPQrVeHxQUYaAFAx+ePzn3HtwXkQbvvRoyZcV2jd
 d/j9/UYLyurC9P4OuvuvM+l6ZNv7dXOvUaP13bRGKqkTS3F7jd0MPJiZ7
 19hhDU6meEBbi6fs42GecvdaWQWCY1LfMXvt09cTE1gCeMNg/fROUI/xB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="323369187"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="323369187"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 03:31:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="904615217"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="904615217"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.10.213])
 ([10.213.10.213])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 03:31:14 -0800
Message-ID: <5b80ac60-10aa-48a9-370f-358fbc9d03fb@intel.com>
Date: Tue, 17 Jan 2023 12:31:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v11 2/5] dt-bindings: display: bridge: cdns,dsi: Add
 compatible for dsi on j721e
Content-Language: en-US
To: Rahul T R <r-ravikumar@ti.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20230103101951.10963-1-r-ravikumar@ti.com>
 <20230103101951.10963-3-r-ravikumar@ti.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230103101951.10963-3-r-ravikumar@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: mparab@cadence.com, a-bhatia1@ti.com, jonas@kwiboo.se, airlied@linux.ie,
 tomi.valkeinen@ideasonboard.com, sjakhade@cadence.com, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, vigneshr@ti.com,
 devicetree@vger.kernel.org, robert.foss@linaro.org, jpawar@cadence.com,
 lee.jones@linaro.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 03.01.2023 11:19, Rahul T R wrote:
> Add compatible to support dsi bridge on j721e
>
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   .../bindings/display/bridge/cdns,dsi.yaml     | 25 ++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> index 3161c33093c1..23060324d16e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> @@ -16,9 +16,15 @@ properties:
>     compatible:
>       enum:
>         - cdns,dsi
> +      - ti,j721e-dsi
>   
>     reg:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description:
> +          Register block for controller's registers.
> +      - description:
> +          Register block for wrapper settings registers in case of TI J7 SoCs.
>   
>     clocks:
>       items:
> @@ -67,6 +73,23 @@ properties:
>   allOf:
>     - $ref: ../dsi-controller.yaml#
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,j721e-dsi
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +          maxItems: 2
> +        power-domains:
> +          maxItems: 1
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
>   required:
>     - compatible
>     - reg

