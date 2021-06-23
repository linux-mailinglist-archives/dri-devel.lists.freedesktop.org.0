Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B683B1EFB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 18:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D266E957;
	Wed, 23 Jun 2021 16:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06EB6E957
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 16:48:57 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9702FE2B;
 Wed, 23 Jun 2021 18:48:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624466935;
 bh=2Q3CuBEaSWnIDyvrBeSWb0LBJt599dAaAPxvTcLuiiI=;
 h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
 b=IxOnxP/2FltRazKxLacWdEU91qBZXQblOhTDfywPhz2CBCO0tN7tyKZ4/9xUEGgnI
 f7qveQ2kiFsBGzt0yLcM1hzRPKnsqFUPOi286hO0M4aSCq3uICKCkEzzMdItJNm8oX
 h7MaIDlyR8qln6Uz1HtuuhlG7FUdZn4vtvA1o0PQ=
Subject: Re: [PATCH] dt-bindings: display: renesas,du: Fix 'ports' reference
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20210623164308.2570164-1-robh@kernel.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <1f676239-43be-82cc-4a02-46e4a54821c8@ideasonboard.com>
Date: Wed, 23 Jun 2021 17:48:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623164308.2570164-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On 23/06/2021 17:43, Rob Herring wrote:
> Fix the renesas,du binding 'ports' schema which is referencing the 'port'
> schema instead of the 'ports' schema.
> 

Ah yes indeed.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Fixes: 99d66127fad2 ("dt-bindings: display: renesas,du: Convert binding to YAML")
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> index 121596f106da..5f4345d43020 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -55,7 +55,7 @@ properties:
>      maxItems: 1
>  
>    ports:
> -    $ref: /schemas/graph.yaml#/properties/port
> +    $ref: /schemas/graph.yaml#/properties/ports
>      description: |
>        The connections to the DU output video ports are modeled using the OF
>        graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> 
