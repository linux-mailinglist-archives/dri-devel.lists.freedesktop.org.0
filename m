Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC6347970A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 23:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDC410E4C8;
	Fri, 17 Dec 2021 22:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAFB10E4C8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 22:25:09 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so4624452otl.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 14:25:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=s4d4c3incwOgtLKqkF8MQrNgWQ7PbqVn8Snb6/Ty0CQ=;
 b=mKC4r/3/NObF85heA7O4KXRDympXFDo5usO3FkGoGy7s3KoAM6C28iO94u6aszH6Rh
 3WMTR43fM9V278/vv1I4W50o95NRFetgzNZTyucCMs32E47E1JNzDilqZgSuJEI1Wy5X
 UmtQcJzIqPIfVcv1PDPsO+9e/QoJWOdQ3dwn/VmYI19+egvXLz/HPQQm0heLO1KdSAQ7
 m9hdZnIYFHUMgROJ3lG1gsbSv+ZbX2MaILo5dVjKwXOg1SQZui/P15boLsRRwMdvpNa1
 1GZiO29BZ1l17gU9c2uFBxs6Extcj0aKszX/PuTXot6CiRo9LUXihe8yOelne29fiukd
 rqEQ==
X-Gm-Message-State: AOAM532kGZvEy1NGVkvJ8HLufQZFFppDg+gZ4Rg7CXcGZbG1pkKGoMoc
 gTZCCbGuSdt6coLA2l4+Ug==
X-Google-Smtp-Source: ABdhPJwqNSYlcKifVTlbUjtchFecUy6Q4aQrNa/PEUrrD0k3hO6DUuQgOV83C7vmGSncrytsJpNKAQ==
X-Received: by 2002:a9d:8e9:: with SMTP id 96mr3884360otf.192.1639779908440;
 Fri, 17 Dec 2021 14:25:08 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w4sm1990300oiv.37.2021.12.17.14.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 14:25:07 -0800 (PST)
Received: (nullmailer pid 3686966 invoked by uid 1000);
 Fri, 17 Dec 2021 22:25:06 -0000
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
In-Reply-To: <20211217132502.95880-1-maxime@cerno.tech>
References: <20211217132502.95880-1-maxime@cerno.tech>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Turn lvds.yaml into a
 generic schema
Date: Fri, 17 Dec 2021 16:25:06 -0600
Message-Id: <1639779906.571728.3686965.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Dec 2021 14:25:01 +0100, Maxime Ripard wrote:
> The lvds.yaml file so far was both defining the generic LVDS properties
> (such as data-mapping) that could be used for any LVDS sink, but also
> the panel-lvds binding.
> 
> That last binding was to describe LVDS panels simple enough, and had a
> number of other bindings using it as a base to specialise it further.
> 
> However, this situation makes it fairly hard to extend and reuse both
> the generic parts, and the panel-lvds itself.
> 
> Let's remove the panel-lvds parts and leave only the generic LVDS
> properties.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v1:
>   - Moved the schema out of panel
> ---
>  .../bindings/display/{panel => }/lvds.yaml    | 31 ++-----------------
>  .../display/panel/advantech,idk-1110wr.yaml   | 19 ++++++++++--
>  .../display/panel/innolux,ee101ia-01d.yaml    | 23 ++++++++++++--
>  .../display/panel/mitsubishi,aa104xd12.yaml   | 19 ++++++++++--
>  .../display/panel/mitsubishi,aa121td01.yaml   | 19 ++++++++++--
>  .../display/panel/sgd,gktw70sdae4se.yaml      | 19 ++++++++++--
>  6 files changed, 91 insertions(+), 39 deletions(-)
>  rename Documentation/devicetree/bindings/display/{panel => }/lvds.yaml (86%)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/panel/lvds.yaml
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/panel/lvds.yaml
Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml: Documentation/devicetree/bindings/display/panel/lvds.yaml
MAINTAINERS: Documentation/devicetree/bindings/display/panel/lvds.yaml

See https://patchwork.ozlabs.org/patch/1570028

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

