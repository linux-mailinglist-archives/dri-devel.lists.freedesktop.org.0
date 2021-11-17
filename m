Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2207453E7A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 03:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305586E0EF;
	Wed, 17 Nov 2021 02:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABA76E0EF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 02:27:12 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 a11-20020a4ad1cb000000b002c2657270a0so463133oos.8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 18:27:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=aFMe5CDtHMpqQ1UplAwNPilzRhCxqblKE6FB0t4Tui4=;
 b=ZytxmMLytKDtum3Najx3n900R251I3Y63SCKrqi+OcCDQqPnbgA88k1Cw2Sttfc139
 VVTbO6tAPpHG3eX6sBuXHRdB98MwWpf5kHHHB5BbKpN8Ee3tDlfAUgRTiCTr15zLaO8x
 BBGBWBJQMO3YjQt1uTpSWXpBC5+wr8o3RDOQwPqA4Rl1lFMGce2WHErjfXTx9FRG83BN
 6JVZGissqed5Y2FXa4PW4Gj5Z8seXsQUn2lj65ZZFXx/9VIZXnyJnRDGgBSYYtCZi400
 6Oc4HXM7VxRL5JpCBM0m476UY2QeDiA0CbEvaGQSdGnACI8NRsbqNycRy7ZlX80WPC76
 QAxA==
X-Gm-Message-State: AOAM5339v7qSl9hAGjC+WftWxpywSwFCaXOPD6ndrJ1VPYbMK7uDZM2x
 DVFau76jQZB17YeOro0x1Q==
X-Google-Smtp-Source: ABdhPJxqEJqUWaA7baWpnIy0tRaEYGM2SlpKvIRmEjplWWwz1mGEkLOOgTv57TaIOtvQtwWFLDF7NA==
X-Received: by 2002:a4a:c304:: with SMTP id c4mr6512294ooq.34.1637116031978;
 Tue, 16 Nov 2021 18:27:11 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m12sm1146065oiw.23.2021.11.16.18.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 18:27:11 -0800 (PST)
Received: (nullmailer pid 1207277 invoked by uid 1000);
 Wed, 17 Nov 2021 02:27:10 -0000
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
In-Reply-To: <20211116143503.385807-2-maxime@cerno.tech>
References: <20211116143503.385807-1-maxime@cerno.tech>
 <20211116143503.385807-2-maxime@cerno.tech>
Subject: Re: [PATCH 2/2] dt-bindings: panel: Introduce a panel-lvds binding
Date: Tue, 16 Nov 2021 20:27:10 -0600
Message-Id: <1637116030.318148.1207276.nullmailer@robh.at.kernel.org>
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

On Tue, 16 Nov 2021 15:35:03 +0100, Maxime Ripard wrote:
> Following the previous patch, let's introduce a generic panel-lvds
> binding that documents the panels that don't have any particular
> constraint documented.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/display/panel/panel-lvds.yaml    | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/panel/panel-lvds.yaml:28:15: [warning] wrong indentation: expected 12 but found 14 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.example.dt.yaml: panel-lvds: compatible:0: 'advantech,idk-2121wr' is not one of ['auo,b101ew05', 'tbs,a711-panel']
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1555849

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

