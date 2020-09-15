Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A9626A8DE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 17:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F66589E33;
	Tue, 15 Sep 2020 15:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4612C89E33
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 15:34:15 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id t18so3409575ilp.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 08:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1fyZNgMatRtDRm5F6K1pH9IP38hhZV0WXalrPxYTXEE=;
 b=kHi1Sr8d1FzILhgB9R+5lpeCgqCeTK31bfZ5u3w0XLQSoOXg9Z8+AStJCvC+Wgq2CC
 RUukaR+UjPfje2BcjW4qaljXaNVkqtj71gfD3Pvtt/TZCBVfS9nZJkUPHsuLpETwyV81
 XV5k6TrVavU0tPmy5mVTTsYA/LAnaFHgiu2rpkoAUMYPHMlU2nLiFpT9sAIpUhD6oeEb
 AmzhaMYN8ukZxjET0BdYHcGASUr+36wvk1dJJd1GGGvX4xefWfoonGuBsaQmdmg6XaX9
 7HMZuzQbmXap+ZHWpZmFam8CPY9CuFQ8ydbF0edqJBG+vRHjlEsYcLc5cKu7XG6TmHiT
 ZX1g==
X-Gm-Message-State: AOAM533Aq2rtheABJqMeZiSievo9qGwrb7maCD1hAtwa7HSI5QbL006v
 ZKzORIltArDTol8pa9QHOw==
X-Google-Smtp-Source: ABdhPJxblB60qGKbpa/uRK4I1ZRiB+vOa9NARrpUQLiQeXrWQ1UDd3ksQ1EdqPx06vtV1foov4egLg==
X-Received: by 2002:a92:8509:: with SMTP id f9mr14662065ilh.253.1600184054677; 
 Tue, 15 Sep 2020 08:34:14 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id m87sm9266352ilb.58.2020.09.15.08.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 08:34:13 -0700 (PDT)
Received: (nullmailer pid 1988443 invoked by uid 1000);
 Tue, 15 Sep 2020 15:34:13 -0000
Date: Tue, 15 Sep 2020 09:34:13 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/6] dt-bindings: display: amlogic,meson-vpu: add
 bindings for VPU found in AXG SoCs
Message-ID: <20200915153413.GA1982161@bogus>
References: <20200907081825.1654-1-narmstrong@baylibre.com>
 <20200907081825.1654-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907081825.1654-2-narmstrong@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 07, 2020 at 10:18:20AM +0200, Neil Armstrong wrote:
> The Amlogic AXG SoC family has a downgraded VPU supporting only MIPI-DSI output
> after it's ENCL DPI encoder output.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/display/amlogic,meson-vpu.yaml   | 36 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
> index a8d202c9d004..e2e7d99d8ace 100644
> --- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
> @@ -31,8 +31,10 @@ description: |
>  
>    The Video Input Unit is in charge of the pixel scanout from the DDR memory.
>    It fetches the frames addresses, stride and parameters from the "Canvas" memory.
> +  On the AXG family, the Video Input Unit direclty reads from DDR memory.
>    This part is also in charge of the CSC (Colorspace Conversion).
>    It can handle 2 OSD Planes and 2 Video Planes.
> +  On the AXG family, only a single OSD plane without scalins is supported.

s/scalins/scaling/ ?

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
