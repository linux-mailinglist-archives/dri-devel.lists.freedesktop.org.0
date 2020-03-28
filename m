Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761C0196921
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 21:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB5789DA7;
	Sat, 28 Mar 2020 20:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE67289DA7
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 20:23:04 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D5CA520030;
 Sat, 28 Mar 2020 21:22:57 +0100 (CET)
Date: Sat, 28 Mar 2020 21:22:56 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Pascal Roeleven <dev@pascalroeleven.nl>
Subject: Re: [PATCH v2 1/5] dt-bindings: panel: Add binding for Starry
 KR070PE2T
Message-ID: <20200328202256.GA32230@ravnborg.org>
References: <20200320112205.7100-1-dev@pascalroeleven.nl>
 <20200320112205.7100-2-dev@pascalroeleven.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320112205.7100-2-dev@pascalroeleven.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=S3fqNI52MuJcMP4_ykoA:9 a=CjuIK1q_8ugA:10
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
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pascal.

On Fri, Mar 20, 2020 at 12:21:32PM +0100, Pascal Roeleven wrote:
> Add the devicetree binding for Starry KR070PE2T
> 
> Signed-off-by: Pascal Roeleven <dev@pascalroeleven.nl>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 8fe60ee25..7cbace360 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -43,6 +43,8 @@ properties:
>        - satoz,sat050at40h12r2
>          # Sharp LS020B1DD01D 2.0" HQVGA TFT LCD panel
>        - sharp,ls020b1dd01d
> +        # Starry KR070PE2T 7" WVGA TFT LCD panel
> +      - starry,kr070pe2t

Adapted to apply to drm-misc-next and applied.

	Sam

>  
>    backlight: true
>    enable-gpios: true
> -- 
> 2.20.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
