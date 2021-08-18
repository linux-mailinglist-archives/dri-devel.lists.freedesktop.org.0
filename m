Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4D33F0AF9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 20:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76516E913;
	Wed, 18 Aug 2021 18:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13A66E8B6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 18:22:50 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 42771a87-0051-11ec-aa7e-0050568cd888;
 Wed, 18 Aug 2021 18:22:34 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 2FDB2194B25;
 Wed, 18 Aug 2021 20:22:56 +0200 (CEST)
Date: Wed, 18 Aug 2021 20:22:43 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Nikola Pavlica <pavlica.nikola@gmail.com>
Cc: dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: add vendor prefix for Vivax
Message-ID: <YR1P86H+s3BuLebl@ravnborg.org>
References: <20210818144648.72665-1-pavlica.nikola@gmail.com>
 <20210818144648.72665-3-pavlica.nikola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818144648.72665-3-pavlica.nikola@gmail.com>
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

On Wed, Aug 18, 2021 at 04:46:48PM +0200, Nikola Pavlica wrote:
> Add vendor prefix for the Vivax brand by M SAN Grupa d.o.o.
> 
> Source (in Croatian): https://www.vivax.com/hr/o-nama.aspx
> 
> Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I like this as the first in the series, as we cannot apply the patch to
the panel-simple binding before the vendor prefix is present.

	Sam

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index f6064d84a424..c234c392538d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1206,6 +1206,8 @@ patternProperties:
>      description: Vitesse Semiconductor Corporation
>    "^vivante,.*":
>      description: Vivante Corporation
> +  "^vivax,.*":
> +    description: Vivax brand by M SAN Grupa d.o.o.
>    "^vocore,.*":
>      description: VoCore Studio
>    "^voipac,.*":
> -- 
> 2.32.0
