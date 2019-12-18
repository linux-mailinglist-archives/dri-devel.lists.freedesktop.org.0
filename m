Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BA812531C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 21:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F9B6EA72;
	Wed, 18 Dec 2019 20:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33F36EA72
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 20:21:02 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id b18so4011773otp.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 12:21:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tQKtiXC+t8LkKiCGY5jF8pByY/MVJl26QOwr16m+aeE=;
 b=WTZgcvXM9lppBlYrtfms5qWubFykXdLZ+gh6OG7TaL40v9ox6UVxUVkajs3evMKofR
 UhY4YcXMPu1OZjqCYR772IzMhpI2yLDp2NNwX/d/6ERKEIhuALvu7HqtDgpLlEzLSYYz
 s0XApoCR1uAdIdUH0eqZjUesDs+oiY4o0RX17fZfl6rF2I/hL4U0DEbp1MKJN39je25b
 ZwELrRZ+XXbuynMMa8LJA2P8ccZmAq30PVqG35e5IOxju2QAUV9ERfLUyo3U5pQ0IN8m
 Eift2ZIG6A62rOZDFftivAlTaLJSHBIeycfhkPZmcBE34MGfy7BBwoUBmHmE/E1eotmg
 QpnA==
X-Gm-Message-State: APjAAAWu6kSLXEEPAUYo5tdQSCAnEBaNMxeNA/Xg0FNZdAu6W/eDTCpP
 e3OztOjZAMtFqT9PIgoAcA==
X-Google-Smtp-Source: APXvYqxWRPBfS3GhJdMaRpzvv6ODhgDAS/e+vbund8AbAoO3PbSqP7jRSoCfO885vYQ0b8Q5qPG4Tw==
X-Received: by 2002:a05:6830:13d9:: with SMTP id
 e25mr4465804otq.134.1576700462071; 
 Wed, 18 Dec 2019 12:21:02 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 91sm1198636otb.7.2019.12.18.12.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 12:21:01 -0800 (PST)
Date: Wed, 18 Dec 2019 14:21:01 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v6 5/6] dt-bindings: display: Add idk-2121wr binding
Message-ID: <20191218202101.GB7282@bogus>
References: <1576590361-28244-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1576590361-28244-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576590361-28244-6-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Magnus Damm <magnus.damm@gmail.com>,
 ebiharaml@si-linux.co.jp, devicetree@vger.kernel.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 01:46:00PM +0000, Fabrizio Castro wrote:
> Add binding for the idk-2121wr LVDS panel from Advantech.
> 
> Some panel-specific documentation can be found here:
> https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> ---
> v5->v6:
> * No change
> 
> v4->v5:
> * No change
> 
> v3->v4:
> * Absorbed patch "dt-bindings: display: Add bindings for LVDS
>   bus-timings"
> * Big restructuring after Rob's and Laurent's comments
> 
> v2->v3:
> * New patch
> ---
>  .../display/panel/advantech,idk-2121wr.yaml        | 128 +++++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> new file mode 100644
> index 0000000..24cd38b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: GPL-2.0

Also, dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
