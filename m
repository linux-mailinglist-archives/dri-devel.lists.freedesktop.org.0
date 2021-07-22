Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 266853D1BA6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 04:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8896ECF0;
	Thu, 22 Jul 2021 02:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A976ECF0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 02:10:04 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id u7so4645828ion.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 19:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=5kLJLZUyCa/nNnxOlQCQXuz6xdsojTMgp+d4EQ2QbHQ=;
 b=Ai9rmRbweMwsDfvWsoaPQioGa8QMvAZBv6e+N81snSJK3MsiS9DQrjqgUxNavFPBMd
 KXaShPDIO2RTmmg+uVR6JMGlNzLTPE398AtohIMhd1nSiqrtFg2kFXsMvoqTHKMiU213
 VCIknrBUP5vl2qFMma6BEGkhaexLMjXfANnovNSwtAgefmHKI0/Vbd/+OUF84X39Raee
 Ciz93Vb4kYTUT51zLew1eDd7kCYEFy7sJo9vX3vZnbV/zcCAxOoxIsn5w70pF67Ycjia
 frtKaENJQdVyazuVwETAFICPNfJMdHoqY9BQRVk1a2XPssvdPAQH+H6KkHp0/7zbgTNi
 bAFg==
X-Gm-Message-State: AOAM533N1Mt97RDuJHJVKJtUlnoLAWfo+nDBW2WUNq7QJKzo93s2GqCM
 k3+D0BTfCahKtLo0uBuICQ==
X-Google-Smtp-Source: ABdhPJwMLhd39uWwXBVgjOGL9sUVJPTwWC0SeOtzYs4b6QhOiDuOk/Cireqqm0B02NJINYM/XBe2uw==
X-Received: by 2002:a6b:b5ce:: with SMTP id
 e197mr28813122iof.123.1626919804208; 
 Wed, 21 Jul 2021 19:10:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id u10sm10518117iop.15.2021.07.21.19.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 19:10:03 -0700 (PDT)
Received: (nullmailer pid 3145325 invoked by uid 1000);
 Thu, 22 Jul 2021 02:09:56 -0000
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
In-Reply-To: <20210721140424.725744-11-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-11-maxime@cerno.tech>
Subject: Re: [PATCH 10/54] dt-bindings: display: panel-lvds: Document panel
 compatibles
Date: Wed, 21 Jul 2021 20:09:56 -0600
Message-Id: <1626919796.956620.3145324.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Jul 2021 16:03:40 +0200, Maxime Ripard wrote:
> The binding mentions that all the drivers using that driver must use a
> vendor-specific compatible but never enforces it, nor documents the
> vendor-specific compatibles.
> 
> Let's make we document all of them, and that the binding will create an
> error if we add one that isn't.
> 
> Cc: dri-devel@lists.freedesktop.org
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/display/panel/lvds.yaml           | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.example.dt.yaml: panel: compatible: ['sharp,lq150x1lg11'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/lvds.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.example.dt.yaml: panel: 'data-mapping' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/lvds.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.example.dt.yaml: panel: 'width-mm' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/lvds.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.example.dt.yaml: panel: 'height-mm' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/lvds.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.example.dt.yaml: panel: 'panel-timing' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/lvds.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.example.dt.yaml: panel: 'oneOf' conditional failed, one must be fixed:
	'port' is a required property
	'ports' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/lvds.yaml
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1508254

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

