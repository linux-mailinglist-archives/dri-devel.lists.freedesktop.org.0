Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5329B1397C1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 18:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C1B6E11D;
	Mon, 13 Jan 2020 17:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8F66E11D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 17:33:01 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 183C52009B;
 Mon, 13 Jan 2020 18:33:00 +0100 (CET)
Date: Mon, 13 Jan 2020 18:32:58 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 2/3] dt-bindings: panel-simple: Add compatible for
 Frida FRD350H54004 LCD
Message-ID: <20200113173258.GB20743@ravnborg.org>
References: <20200113161741.32061-1-paul@crapouillou.net>
 <20200113161741.32061-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200113161741.32061-2-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=x7rxvukQcr2PK0DXAjAA:9 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22
 a=pHzHmUro8NiASowvMSCR:22 a=6VlIyEUom7LUIeUMNQJH:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul.

On Mon, Jan 13, 2020 at 01:17:40PM -0300, Paul Cercueil wrote:
> Add bindings documentation for the Frida 3.5" (320x240 pixels) 24-bit
> TFT LCD panel.
> 
> v2: Switch documentation from plain text to YAML
> v3: Simply add new compatible to panel-simple.yaml file instead of
>     adding new file
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Thanks, applied to drm-misc-next.

	Sam

> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 8fe60ee2531c..4a8064e31793 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -37,6 +37,8 @@ properties:
>        - auo,b116xa01
>          # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
>        - boe,nv140fhmn49
> +        # Frida FRD350H54004 3.5" QVGA TFT LCD panel
> +      - frida,frd350h54004
>          # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
>        - giantplus,gpm940b0
>          # Satoz SAT050AT40H12R2 5.0" WVGA TFT LCD panel
> -- 
> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
