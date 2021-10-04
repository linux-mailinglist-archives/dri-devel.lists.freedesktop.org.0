Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED3442163B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 20:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3A16E1F6;
	Mon,  4 Oct 2021 18:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA99D6E1F6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 18:18:35 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 j11-20020a9d190b000000b00546fac94456so22740096ota.6
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 11:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hfPDH+LuFRcAhIlz3hcET85MQea3lnFzaaWohI9DSu4=;
 b=FLrdRUAI4rV8brH5s/QZwD83gujeBGuAn0+64a9UaBgOpocmYeuxdlY43kighH2rS8
 REBSDcmJJdT3KuruaY/vxPXNa4VKXMWIbObn+OA3o6fKKaaZVGgXTsF3TqQ1nv35iYFn
 YCaUBURogL54kimlWxeNfXRIuQo9BORHqJu5boF3QQEgRGI49IwezcBqQvT2LW2tsv2t
 xHbklSPr19YxqLCzXz0B5PTQsN/naYrx2nTEVBBkgQLG+Qo+jF1OM/0DLEMIxF3OFgUw
 ycXRe1y6+fmLwOk5ULnxaW2H4FprK97Sa5dYR/Xo9EjZBEzdtkJMxjDvZjL+6VEdIOic
 c7eg==
X-Gm-Message-State: AOAM53318XHGEMrDyG/t5c5v7BFnUIoyskAh+X5mUyY5Wx0ab1OCWZCX
 afy+cNhh+OUusk2PM83FjA==
X-Google-Smtp-Source: ABdhPJys2SVCxDLn87c9yaE7EPvbMTc8qjz25EWikXj7QmKkffB3+8vSQZS5zRLhaTBrZfqt6u7LNA==
X-Received: by 2002:a9d:4c0c:: with SMTP id l12mr10656606otf.144.1633371515051; 
 Mon, 04 Oct 2021 11:18:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 38sm3036831oti.13.2021.10.04.11.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 11:18:34 -0700 (PDT)
Received: (nullmailer pid 1596326 invoked by uid 1000);
 Mon, 04 Oct 2021 18:18:33 -0000
Date: Mon, 4 Oct 2021 13:18:33 -0500
From: Rob Herring <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH] dt-bindings: display: simple: hardware can use ddc-i2c-bus
Message-ID: <YVtFeWfIa0zZe9sF@robh.at.kernel.org>
References: <20210927214503.36012-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927214503.36012-1-david@ixit.cz>
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

On Mon, 27 Sep 2021 23:45:03 +0200, David Heidelberg wrote:
> Both hardware and driver can communicate DDC over i2c bus.
> 
> Fixes warnings as:
> arch/arm/boot/dts/tegra20-paz00.dt.yaml: panel: 'ddc-i2c-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /home/runner/work/linux/linux/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
