Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB05E52A1B4
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 14:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D0710E17A;
	Tue, 17 May 2022 12:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0581E10E17A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 12:41:02 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id q8so22060669oif.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 05:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=tU6K7uetAiw+rSP5T9+Sc20G5SXNExj5PkXgukoIQpY=;
 b=hkMTOnGKQRvjoII/Jfhn+AXUs3vZVhQ3C9hQM4TUkO+pvuwhrJXSGU5M/UkreK1K7y
 q4Ow5Jxrw+FGuNBOrxKTukeaN8QOzu2hX1Ci4hpeNzS0T1rHhLLIX5p2vKZiaO2YEqXg
 HaTUpRYTy2pZEB7DCcR+wDXeW2S+aHc+xtUQ4QwwksHGCFDgR0LuIMLADbJkem/Ky2mj
 ilHa0clcv/Yzn7I07aOB0Ch74kqr026EuS5uH88nbRymFnEV3XUfkKjVxkGpi9igIaTN
 bSiz0gGJVBCeZNn9mM1sfMJLpLj9oqoG9my3W55mY81GyhFZJf0lBoIQjFtHPBG7OUpN
 IuxA==
X-Gm-Message-State: AOAM5311O0dwZ7AIrdN8kCxqZADS6lpDjNUymHISO1ouUo1k7ZSDAs2J
 vp94hyy3qqhPWa5IeKlY0Q==
X-Google-Smtp-Source: ABdhPJxnbOAePBrL+7Vj6jx6SHaZRvhNaYbZt0r4+5WYZOCl4zrCDiMenp0OWItuwFOIpyqmNZ74CQ==
X-Received: by 2002:a05:6808:2c8:b0:325:ad24:a002 with SMTP id
 a8-20020a05680802c800b00325ad24a002mr16074643oid.82.1652791261252; 
 Tue, 17 May 2022 05:41:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m1-20020a05680806c100b003266e656d39sm4722981oih.4.2022.05.17.05.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 05:41:00 -0700 (PDT)
Received: (nullmailer pid 785390 invoked by uid 1000);
 Tue, 17 May 2022 12:40:59 -0000
From: Rob Herring <robh@kernel.org>
To: Max Krummenacher <max.oss.09@gmail.com>
In-Reply-To: <20220516162826.23025-2-max.oss.09@gmail.com>
References: <20220516162826.23025-1-max.oss.09@gmail.com>
 <20220516162826.23025-2-max.oss.09@gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: display: add new bus-format property
 for panel-dpi
Date: Tue, 17 May 2022 07:40:59 -0500
Message-Id: <1652791259.418473.785387.nullmailer@robh.at.kernel.org>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, max.krummenacher@toradex.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 May 2022 18:28:25 +0200, Max Krummenacher wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> The property is used to set the enum bus_format and infer the bpc
> for a panel defined by 'panel-dpi'.
> This specifies how the panel is connected to the display interface.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
> 
>  .../bindings/display/panel/panel-dpi.yaml     | 11 +++++++++
>  .../dt-bindings/display/dt-media-bus-format.h | 23 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 include/dt-bindings/display/dt-media-bus-format.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/display/panel/panel-dpi.example.dts:20.9-10 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/display/panel/panel-dpi.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

