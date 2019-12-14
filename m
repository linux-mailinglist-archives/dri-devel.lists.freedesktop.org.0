Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AD511F171
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 11:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACE66E32C;
	Sat, 14 Dec 2019 10:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2E36E32C
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2019 10:54:22 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E184B804CE;
 Sat, 14 Dec 2019 11:54:19 +0100 (CET)
Date: Sat, 14 Dec 2019 11:54:18 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/6] dt-bindings: display/ingenic: Add compatible
 string for JZ4770
Message-ID: <20191214105418.GA5687@ravnborg.org>
References: <20191210144142.33143-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210144142.33143-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=nZJdUF_zLBciypfbcfYA:9
 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22 a=AjGcO6oz07-iQ99wixmX:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul.

On Tue, Dec 10, 2019 at 03:41:37PM +0100, Paul Cercueil wrote:
> Add a compatible string for the LCD controller found in the JZ4770 SoC.
> 
> v2: No change
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Acked-by: Rob Herring <robh@kernel.org>

Whole series looks good.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  Documentation/devicetree/bindings/display/ingenic,lcd.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.txt b/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> index 7b536c8c6dde..01e3261defb6 100644
> --- a/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> +++ b/Documentation/devicetree/bindings/display/ingenic,lcd.txt
> @@ -4,6 +4,7 @@ Required properties:
>  - compatible: one of:
>    * ingenic,jz4740-lcd
>    * ingenic,jz4725b-lcd
> +  * ingenic,jz4770-lcd
>  - reg: LCD registers location and length
>  - clocks: LCD pixclock and device clock specifiers.
>  	   The device clock is only required on the JZ4740.
> -- 
> 2.24.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
