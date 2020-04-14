Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9328A1A7EE4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 15:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7FB6E0A1;
	Tue, 14 Apr 2020 13:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9DB6E0A1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 13:55:03 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id x11so12832812otp.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 06:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YU+s8KJHPoG+5CMXLSiMUkq8GexUSBLCLmbjRLZ/BS4=;
 b=DWNjIFNPjbNXGZCRcO4n3dd+Rm46mXjKbt9/2Ct+ZxCFig4blqVDjETKrQLmyeFa9H
 yJr/AhDVBXaZIjAoIgsIBnzhSFXg1bvsLUl12ypEyK092v4KQcZt/k2qtDPVRyQLqV6W
 xudMZrhq95bYdb4R6Honad1jnEKtqdck1zfIrVvzucYBnDlnLhZukVw19gSFyYEo+Qft
 jCYEPqseek5jjL9QLM6ZKmnSvdrUEYHwzUdm7djS3eGTM//2LpK8Ww5oD5NojJJBvfVt
 QrxOcK+A+e+3d77BqJxNISDSg538d0XpyPBzR/3Cgg+G8D12lWck92o0nywJYjbm5SaK
 62tA==
X-Gm-Message-State: AGi0PuZOybP2I4VMIelX9HxEjFpN9dDCz2OotDm5FohBe/QKxJ4NtEMi
 Q5PYN6Q8sWJbBqdi8ZomTA==
X-Google-Smtp-Source: APiQypKFcSonmodklDfiIz6RAoA+hZrCMZcKJ7Z3HFE8/a4fOuWjcDA1laurqKUpYI+jQDGmF1f+wA==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr286700otj.91.1586872502734; 
 Tue, 14 Apr 2020 06:55:02 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h11sm6127563ooj.17.2020.04.14.06.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 06:55:02 -0700 (PDT)
Received: (nullmailer pid 28083 invoked by uid 1000);
 Tue, 14 Apr 2020 13:55:01 -0000
Date: Tue, 14 Apr 2020 08:55:01 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: allow port and ports in
 panel-lvds
Message-ID: <20200414135501.GA22903@bogus>
References: <20200412132139.11418-1-sam@ravnborg.org>
 <20200412132139.11418-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200412132139.11418-2-sam@ravnborg.org>
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 12, 2020 at 03:21:39PM +0200, Sam Ravnborg wrote:
> Both port and ports names may be used in a panel-lvds binding
>   port - for a single port
>   ports - if there is more than one port in sub-nodes
> 
> Fixes the following warning:
> advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property
> 
> advantech,idk-2121wr.yaml needs several ports, so uses a ports node.
> 
> v2:
>   - Use oneOf - makes the logic more obvious (Rob)
>   - Added Fixes tag
>   - Added port: true, ports:true
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Fixes: 8efef33eff50 ("dt-bindings: display: Add idk-2121wr binding")
> Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  .../devicetree/bindings/display/panel/lvds.yaml        | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>

One nit below...

> 
> diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> index d0083301acbe..a5587c4f5ad0 100644
> --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> @@ -96,12 +96,20 @@ properties:
>        If set, reverse the bit order described in the data mappings below on all
>        data lanes, transmitting bits for slots 6 to 0 instead of 0 to 6.
>  
> +  port: true
> +  ports: true
> +
>  required:
>    - compatible
>    - data-mapping
>    - width-mm
>    - height-mm
>    - panel-timing
> -  - port
> +
> +oneOf:
> +  - required:
> +    - port
> +  - required:
> +    - ports

Should be indented 2 more spaces. It only matters for any scripted 
processing we do on the files.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
