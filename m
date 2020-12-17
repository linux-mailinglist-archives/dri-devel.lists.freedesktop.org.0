Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E4A2DD8AE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 19:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6366889722;
	Thu, 17 Dec 2020 18:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89BB89722
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:50:39 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id i6so28395452otr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:50:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=0J3vl1MTUsZMronAIrs9qpBUzg0oJyXdy+TBq+BXRGg=;
 b=Q7PA4RTe6WyB0gdMuWY2tp0O6Oxr5xVyqDkSW5g1e99WSq9+CIRUrSZYC/z8CjUXns
 LlG6jya7CZO7vL2HND1LcAAFWyBYSuzSnnIImesiKqCvNHVeBaiKj8Q0vW+TTn/0kusN
 pLt81daNNDdnW6t3dn4K6iSTgwS7LopyQEO+eAyp+XOr36PfxqV+On3FpRNcaooQS3ok
 fiPfxUvOJ9PODW6ppql1GuGxkdGzybrN2fXOg+aKvkLG1P/4lviutWGgaCP1mGVrKx9O
 Msyrl01Za+770d1i7ZmTYpmf+6MNqX3+l4Md19FDS86XYdWwqqDFRrEx/kV16oZjkOVr
 DBOA==
X-Gm-Message-State: AOAM530UQd2Q69BSKgsUl52IR+6VjR1ck4zjJn/fTIxmQHsA3KNg9i40
 lI1/9b+oZoo/7vjO4clWmg==
X-Google-Smtp-Source: ABdhPJyupopTHCyOI1kXrI4SvwIdqGJXu/0CPZvamUq8qDnn0fuulgPaAICVXyoXi8ycIfF3QKPJBw==
X-Received: by 2002:a9d:2254:: with SMTP id o78mr245009ota.24.1608231038964;
 Thu, 17 Dec 2020 10:50:38 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l21sm1417234otd.0.2020.12.17.10.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:50:37 -0800 (PST)
Received: (nullmailer pid 50648 invoked by uid 1000);
 Thu, 17 Dec 2020 18:50:36 -0000
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
In-Reply-To: <1608199173-28760-5-git-send-email-victor.liu@nxp.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-5-git-send-email-victor.liu@nxp.com>
Subject: Re: [PATCH 04/14] dt-bindings: display: bridge: Add i.MX8qm/qxp pixel
 combiner binding
Date: Thu, 17 Dec 2020 12:50:36 -0600
Message-Id: <1608231036.357497.50647.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, jonas@kwiboo.se,
 airlied@linux.ie, shawnguo@kernel.org, s.hauer@pengutronix.de,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 kernel@pengutronix.de, linux-imx@nxp.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Dec 2020 17:59:23 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp pixel combiner.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 160 +++++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.example.dts:19:18: fatal error: dt-bindings/clock/imx8-lpcg.h: No such file or directory
   19 |         #include <dt-bindings/clock/imx8-lpcg.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1364: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1417599

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
