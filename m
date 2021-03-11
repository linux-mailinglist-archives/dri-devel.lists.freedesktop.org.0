Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD9D33799B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 17:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DC86E2E3;
	Thu, 11 Mar 2021 16:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560AF6E2E3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 16:41:07 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id m7so3548998iow.7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 08:41:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=wIM7Ieqmfw1uH+6hgx0cLpcvZ20N4K9oMOEFdEs4Wrk=;
 b=I0/bqlGBIDtFAjPWqcw4TtYvC/6OVboXlFSGYEL9RdA7s8k4dpCPmn6XVsXg/Rmnr3
 uccuBGJjsIS2Xl7Tjah0xJrx8bLki2txuEaOiYNcP1MRKTh8C7ngRVn7CoIZJzvdOP7a
 sIfJ8VxbgcnDMH7ncu3OiBcAGa1FTlHIZQDt2SUyUWkkEdki4hgDj5++Zef83aN31RO7
 521x3eN/oc3ms8+KWHEaMVfHoQ1FzV/XnPiAgjhcLfRFOncXPa78U/X9npFv83wP+2WB
 meMwMQQkhUwkUbX3zfUqSfBrqzF4X3CjII9dRV4YMZRWhrskQxwSCvxPiJMpb+Lvicgv
 4zgg==
X-Gm-Message-State: AOAM532TQuiLrMA36w7Drh8SvjScJNfEGH3BRL4vPmqE6voG42yzT7vb
 72BQa7vo6TZz6fpBIom6DA==
X-Google-Smtp-Source: ABdhPJw7qMPNwJYupbpC1Z+kkGIkKIdh0UVPqqHA+nZwXstYcIz5NI0KZXrwynN0T6JM0dUa5Qkd9g==
X-Received: by 2002:a05:6602:1406:: with SMTP id
 t6mr7012640iov.154.1615480866652; 
 Thu, 11 Mar 2021 08:41:06 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id l16sm1542750ils.11.2021.03.11.08.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 08:41:04 -0800 (PST)
Received: (nullmailer pid 841928 invoked by uid 1000);
 Thu, 11 Mar 2021 16:41:02 -0000
From: Rob Herring <robh@kernel.org>
To: Carlis <zhangxuezhi3@gmail.com>
In-Reply-To: <1615385315-130920-1-git-send-email-zhangxuezhi3@gmail.com>
References: <1615385315-130920-1-git-send-email-zhangxuezhi3@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: sitronix,
 st7789v: Add Waveshare 2inch LCD module
Date: Thu, 11 Mar 2021 09:41:02 -0700
Message-Id: <1615480862.507726.841927.nullmailer@robh.at.kernel.org>
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
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, zhangxuezhi1@yulong.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Mar 2021 22:08:35 +0800, Carlis wrote:
> From: "Carlis" <zhangxuezhi1@yulong.com>
> 
> Document support for the Waveshare 2inch LCD module display, which is a
> 240x320 2" TFT display driven by a Sitronix ST7789V TFT Controller.
> 
> Signed-off-by: Carlis <zhangxuezhi1@yulong.com>
> ---
>  .../bindings/display/sitronix,st7789v.yaml         | 72 ++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7789v.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.example.dt.yaml: panel@0: compatible: 'oneOf' conditional failed, one must be fixed:
	['sitronix,st7789v'] is too short
	'sitronix,st7789v' is not one of ['waveshare,ws-2inch-lcd']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/sitronix,st7789v.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.example.dt.yaml: panel@0: 'dc-gpios' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/sitronix,st7789v.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.example.dt.yaml: panel@0: 'port', 'power-supply', 'spi-cpha', 'spi-cpol' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/sitronix,st7789v.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/sitronix,st7789v.example.dt.yaml: display@0: compatible:0: 'sitronix,st7789v' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/sitronix,st7789v.example.dt.yaml: display@0: compatible: ['waveshare,ws-2inch-lcd', 'sitronix,st7789v'] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/sitronix,st7789v.example.dt.yaml: display@0: compatible: Additional items are not allowed ('sitronix,st7789v' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/sitronix,st7789v.example.dt.yaml: display@0: 'power-supply' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml

See https://patchwork.ozlabs.org/patch/1450539

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
