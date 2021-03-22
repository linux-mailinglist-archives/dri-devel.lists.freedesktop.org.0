Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4644B344D86
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 18:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC876E040;
	Mon, 22 Mar 2021 17:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127826E040
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 17:38:24 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id j26so14802542iog.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 10:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=KOn/yikuZnHsfk0ATJJaj5QFXrZZDuf7Us2s6sB+69E=;
 b=KeNcMUDqY+QFphK1KkH7Stn3HwNz+jE0UUydkKe4t7GclNRhyukoxT/1w/iFs86EPv
 sD20NCl4f0DfB5IYbg0C7E3j8kGEkFBBduwYzLm6EQUBe4lKZa+sJQLUJmYvmNK8XT6L
 S18Zr4mgZyvlkJlwMmtKL12IBSZX7tJ589CcfhC4byWYHafeh49dH2OzQYRSzlcSSoAe
 qu2I+PsgGgDN5og92RAlH+yqw4Jld6I2KT/dSDmLkSOZk8wIMMu1y2oxmVp6vZaGXgxL
 hRw7az0bqPqt1iZV8yUaX6wxuYz87R0IteyAd1wIm3L93rNzk58okABIJszay8ja2T+C
 BDpw==
X-Gm-Message-State: AOAM533EwJAG9U1F9oxX9sAJ0QW+2fAqAtzoAwSM8Evzo1lPkN7WSxVy
 3H8MHrZIyBLF3Jd/Mh3oOQ==
X-Google-Smtp-Source: ABdhPJyoUAfQkJqmR4npAvIULBx8OckjxTiXjCBeTqmz13ScPx4XNLAqTB0atflhfjKT17Ms5oMweA==
X-Received: by 2002:a05:6638:2101:: with SMTP id n1mr465627jaj.7.1616434703417; 
 Mon, 22 Mar 2021 10:38:23 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id q8sm6509747ilv.55.2021.03.22.10.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 10:38:22 -0700 (PDT)
Received: (nullmailer pid 2887758 invoked by uid 1000);
 Mon, 22 Mar 2021 17:38:18 -0000
From: Rob Herring <robh@kernel.org>
To: Daniel Mack <daniel@zonque.org>
In-Reply-To: <20210322095223.3607627-2-daniel@zonque.org>
References: <20210322095223.3607627-1-daniel@zonque.org>
 <20210322095223.3607627-2-daniel@zonque.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: add bindings for newhaven,
 1.8-128160EF
Date: Mon, 22 Mar 2021 11:38:18 -0600
Message-Id: <1616434698.359246.2887757.nullmailer@robh.at.kernel.org>
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
Cc: airlied@linux.ie, devicetree@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Mar 2021 10:52:22 +0100, Daniel Mack wrote:
> This adds documentation for a new ILI9163 based, SPI connected display.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../bindings/display/ilitek,ili9163.yaml      | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9163.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/display/ilitek,ili9163.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/display/ilitek,ili9163.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ilitek,ili9163.yaml: duplicate '$id' value 'http://devicetree.org/schemas/display/ilitek,ili9486.yaml#'

See https://patchwork.ozlabs.org/patch/1456455

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
