Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC64E2505FF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 19:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157316E082;
	Mon, 24 Aug 2020 17:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175656E082
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 17:25:36 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id g14so9523375iom.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 10:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gaqc4X/qnA9KMqMqQ+N6oiNBtdvQ2DqPg5KJfR7DzDc=;
 b=R5B66ItjOFy5EM2jiH6WmvPISZAmWWDft8N/de88TqLClSL4zZ90eClvfyGnf0F87p
 ix5Mpp+0niEkgKa/c/Uuj67NAMyXUASaCNRC4S2GnpZuqWPhO/eWAPj8s9WnjYBNxdbU
 XsmrCtO4uWe3zYdC7qi5zrPB/4pR6I4AM5cQeyvYx8RYzn7XLIqQH+RS1iXnJUiIyaMz
 3wpWXhD4deSMul9NnVckraK+R6VEHlUPwhnod3e8RiwX/vs2o0wAGJzRUunafXUyMjbE
 M2wutwHn8skybPqWgr3aUPLAyrTeTW81hWoPd7LwouUmeZvdVWcIdcm6/dDzI1CAHeuH
 hr7w==
X-Gm-Message-State: AOAM532vuEGgy7hwgdjZUux1W9I9LloOsoi0RpFCFWO9EuUxE6MiWkNr
 Mu5B8Dn5wBATOaL1f8KdFQ==
X-Google-Smtp-Source: ABdhPJxKE+vkfQKb2OUtjfAlwBWYpgRA8sqo+1D3INz1VaQdhd0fgEmdb42+lRmimyoFGsCBwJ8EwA==
X-Received: by 2002:a05:6602:1583:: with SMTP id
 e3mr3348821iow.173.1598289935478; 
 Mon, 24 Aug 2020 10:25:35 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id v28sm7691743ili.27.2020.08.24.10.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 10:25:34 -0700 (PDT)
Received: (nullmailer pid 2929363 invoked by uid 1000);
 Mon, 24 Aug 2020 17:25:33 -0000
Date: Mon, 24 Aug 2020 11:25:33 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3 v3] dt-bindings: backlight: Add Kinetic KTD253 bindings
Message-ID: <20200824172533.GA2928997@bogus>
References: <20200819205150.164403-1-linus.walleij@linaro.org>
 <20200819205150.164403-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819205150.164403-2-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Aug 2020 22:51:49 +0200, Linus Walleij wrote:
> This adds device tree bindings for the Kinetic KTD253
> white LED backlight driver.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Drop the pointless cargo-culted "default-on" property that
>   we were not using
> - Correct the brightness in the example to something legal (13)
> ChangeLog v1->v2:
> - Create common.yaml for backlight as suggested by Sam and
>   use that.
> - Rename the GPIO line "enable-gpios"
> ---
>  .../leds/backlight/kinetic,ktd253.yaml        | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
