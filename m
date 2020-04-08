Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C1C1A2A36
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 22:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FCC6EAC9;
	Wed,  8 Apr 2020 20:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7C76EAC9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 20:18:08 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B564B804E6;
 Wed,  8 Apr 2020 22:18:03 +0200 (CEST)
Date: Wed, 8 Apr 2020 22:18:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: David Lu <david.lu@bitland.com.cn>
Subject: Re: [PATCH] dt-bindings: boe, tv101wum-n16: Add compatible for boe
 tv105wum-nw0.
Message-ID: <20200408201802.GB612@ravnborg.org>
References: <20200324094525.4758-1-david.lu@bitland.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324094525.4758-1-david.lu@bitland.com.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=iKCrp2iyAAAA:8
 a=e5mUnYsNAAAA:8 a=KSWG7gIH_8gM9piVvoQA:9 a=CjuIK1q_8ugA:10
 a=6dnM-gFdnRAg0d82BWIM:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 jungle.chiang@bitland.com.cn, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David.

On Tue, Mar 24, 2020 at 05:45:25PM +0800, David Lu wrote:
> Add bindings documentation for BOE TV105WUM-NW0 10.5" WUXGA TFT LCD
> panel.
> 
> Signed-off-by: David Lu <david.lu@bitland.com.cn>
> Change-Id: I450c0e52aae080728d4794bdffc50bb0d2f39f40

I dropped the Change-Id while applying.
Applied to drm-misc-next and pushed out.

	Sam

> ---
>  .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> index 740213459134..7f5df5851017 100644
> --- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> @@ -24,6 +24,8 @@ properties:
>        - boe,tv101wum-n53
>          # AUO B101UAN08.3 10.1" WUXGA TFT LCD panel
>        - auo,b101uan08.3
> +        # BOE TV105WUM-NW0 10.5" WUXGA TFT LCD panel
> +      - boe,tv105wum-nw0
>  
>    reg:
>      description: the virtual channel number of a DSI peripheral
> -- 
> 2.24.1
> 
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
