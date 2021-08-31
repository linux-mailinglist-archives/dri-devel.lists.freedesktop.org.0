Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6E43FCF21
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 23:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3C56E0C2;
	Tue, 31 Aug 2021 21:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE186E0C2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 21:30:17 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 q11-20020a9d4b0b000000b0051acbdb2869so971885otf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 14:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Lv/ljHshSZK3RFgD2a8g0MVknlEMt9i5zUtkABsa3c0=;
 b=F03cCYi8g4PBuaQpZ1N/HMZuPV17X5QU3QSQM4B0FxJZg7HLSTuSDbCYpnfoi6rrEj
 t6CmLYoLLFS07KbPSir09U5zW6xWkTEYfyC4WrcTW8+cTErAfn6cAd2/9ksFjdJ+q0hy
 +p37Rolf6HXIPvHGPr3XUgFq7oFppBeoVnGwt/LBzW0xNoLNm0tL2uo7RZNOsxSyKrS1
 Vw0Fc819Rcgn77JZ9dnSaxYJe3RAJPb6TUhYqGHHwNWF8IwSbRJHZes7iHKWgPLoEF1L
 NtbmDLCGR+dGOO3yAhkG7p94j+BWQJ1Z0XggfyOk3P+vj9vopfTlxJZS4KrmViRd2Aq9
 Nmow==
X-Gm-Message-State: AOAM532Gn1d3wAvMZ9h2+iRRaMACcQMw7ywWVmV9w54IQjRQwZMpGfpe
 1sFdCq9kJynicn1dMa/wtg==
X-Google-Smtp-Source: ABdhPJzCoKKVloeON0/InoVfsSGtFPejEa6c0Hy6uFnCKvcn2QG3UG5aK/HzG37HQA69/+Y37NLGSQ==
X-Received: by 2002:a9d:74c5:: with SMTP id a5mr25815380otl.205.1630445416795; 
 Tue, 31 Aug 2021 14:30:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id n130sm3841778oif.32.2021.08.31.14.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 14:30:16 -0700 (PDT)
Received: (nullmailer pid 678569 invoked by uid 1000);
 Tue, 31 Aug 2021 21:30:15 -0000
Date: Tue, 31 Aug 2021 16:30:15 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca@z3ntu.xyz>
Cc: linux-fbdev@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: add missing simple-framebuffer
 formats
Message-ID: <YS6fZ4nFgic1DYhR@robh.at.kernel.org>
References: <20210828110206.142899-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828110206.142899-1-luca@z3ntu.xyz>
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

On Sat, Aug 28, 2021 at 01:02:05PM +0200, Luca Weiss wrote:
> Document all formats currently present in include/linux/platform_data/
> simplefb.h
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  .../bindings/display/simple-framebuffer.yaml         | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> index c2499a7906f5..c1acd2859ae8 100644
> --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> @@ -83,13 +83,25 @@ properties:
>    format:
>      description: >
>        Format of the framebuffer:
> +        * `a1r5g5b5` - 16-bit pixels, d[15]=a, d[14:10]=r, d[9:5]=g, d[4:0]=b
> +        * `a2r10g10b10` - 32-bit pixels, d[31:30]=a, d[29:20]=r, d[19:10]=g, d[9:0]=b

Not a new problem, but are these 32-bit big or little endian words? That 
should be figured out before we add more.

>          * `a8b8g8r8` - 32-bit pixels, d[31:24]=a, d[23:16]=b, d[15:8]=g, d[7:0]=r
> +        * `a8r8g8b8` - 32-bit pixels, d[31:24]=a, d[23:16]=r, d[15:8]=g, d[7:0]=b
>          * `r5g6b5` - 16-bit pixels, d[15:11]=r, d[10:5]=g, d[4:0]=b
> +        * `r5g5b5a1` - 16-bit pixels, d[15:11]=r, d[10:6]=g, d[5:1]=b, d[0]=a
> +        * `r8g8b8` - 24-bit pixels, d[23:16]=r, d[15:8]=g, d[7:0]=b
> +        * `x1r5g5b5` - 16-bit pixels, d[14:10]=r, d[9:5]=g, d[4:0]=b
>          * `x2r10g10b10` - 32-bit pixels, d[29:20]=r, d[19:10]=g, d[9:0]=b
>          * `x8r8g8b8` - 32-bit pixels, d[23:16]=r, d[15:8]=g, d[7:0]=b
>      enum:
> +      - a1r5g5b5
> +      - a2r10g10b10
>        - a8b8g8r8
> +      - a8r8g8b8
>        - r5g6b5
> +      - r5g5b5a1
> +      - r8g8b8
> +      - x1r5g5b5
>        - x2r10g10b10
>        - x8r8g8b8
>  
> -- 
> 2.33.0
> 
> 
