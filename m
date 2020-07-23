Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C2A22B29A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 17:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4783F89E36;
	Thu, 23 Jul 2020 15:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681C289E33
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 15:33:36 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id l1so6648798ioh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 08:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ge+pWdg+Toeqp3bSA1KgQjI8Zmp56KH/a+tvzolN8yI=;
 b=PQdDXUNq/fW1oZnYKZ7L4kOcxuddLNx7AsvHJv4TJ71pfJrV2fZcyYBDwDLLKmPi11
 7YUjzi72/uxtF8oHztq4CgSnUr7Cpm8andtgtAilwiSV4DjyP6Pp7qpkjchom2BZjzc6
 36/XwnveA1JI7cS7oIzI4kfPHUWmGVt86U3hoMJOC8hnXUNZYRWRszROJZp+xN5PugR2
 slyuM5PN8eW4KufOFZxHqU1ZPFh+3BYnyMZZZZFFt1i3UWZZiK5l6Ku3KYUknHN2SwEN
 mYXsyCD1pvZGFAnOptjtCF3E4fTqMVGJZ6VYAq7aM4E9nsQTS1cDrvDITMApTk1GXN5M
 pGIA==
X-Gm-Message-State: AOAM530W9Cg9yspDAYcug5K3cwHyT7HEMkUItIkLuUFQIEPB7oduzplm
 sh7hclkZ9kzmZxbBJqK2Iw==
X-Google-Smtp-Source: ABdhPJwBy8wFjjv8KG4HasLW4CnpKcT+XNgxoLZ2WOOzGZ0RjayRagVj5gTPdhA/BivvFyGaYjbZNQ==
X-Received: by 2002:a6b:6d07:: with SMTP id a7mr5465452iod.166.1595518415792; 
 Thu, 23 Jul 2020 08:33:35 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id d16sm1524807ill.47.2020.07.23.08.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 08:33:35 -0700 (PDT)
Received: (nullmailer pid 412626 invoked by uid 1000);
 Thu, 23 Jul 2020 15:33:31 -0000
Date: Thu, 23 Jul 2020 09:33:31 -0600
From: Rob Herring <robh@kernel.org>
To: Swapnil Jakhade <sjakhade@cadence.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: drm/bridge: Document Cadence MHDP
 bridge bindings
Message-ID: <20200723153331.GB407329@bogus>
References: <1595403640-12816-1-git-send-email-sjakhade@cadence.com>
 <1595403640-12816-2-git-send-email-sjakhade@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595403640-12816-2-git-send-email-sjakhade@cadence.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, yamonkar@cadence.com,
 praneeth@ti.com, jonas@kwiboo.se, airlied@linux.ie, tomi.valkeinen@ti.com,
 narmstrong@baylibre.com, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com, robh+dt@kernel.org,
 jsarha@ti.com, mparab@cadence.com, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Jul 2020 09:40:38 +0200, Swapnil Jakhade wrote:
> From: Yuti Amonkar <yamonkar@cadence.com>
> 
> Document the bindings used for the Cadence MHDP DPI/DP bridge in
> yaml format.
> 
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/display/bridge/cdns,mhdp.yaml    | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.example.dt.yaml: example-0: dp-bridge@f0fb000000:reg:0: [240, 4211081216, 0, 16777216] is too long


See https://patchwork.ozlabs.org/patch/1333631

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
