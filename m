Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 335FC4184E0
	for <lists+dri-devel@lfdr.de>; Sun, 26 Sep 2021 00:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10E56E486;
	Sat, 25 Sep 2021 22:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573656E486
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 22:16:34 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id v10so19815591oic.12
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 15:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=4zZa0pNx5SO7y8XUgl4L6wylE3A2MDP8EXBjRieRoGg=;
 b=1IlQpVrJ+Hj/OyU6Wfkiy8EK7ThJpDuAKGT7J4RFOyhcUVtaPEvaDJEcSLY4r4SICT
 S5GJsWSDpOiwGTKAxjWhSVT9vnzXEmZLESl/5zww13A8vch91VBbE6qd4r1EOS7lY+T8
 1CMCvEQWoEddrrXUqk46AKuvmFkUHWu6Qj6LlI79yOgniu3VPq7W1qXi72i7XtQ+sbL0
 IgVKsIKnCEmKAoWOxQl27OwVU6+rt1xgBz4kRc26nDBLcb1B4rsbXt2oc2Yqj5SKiNyd
 vGFEUvJ4C2Jc9AZBYVoGM5yXU6HgZxsGlQaZmFpcg3y6ncihh0+LXGg8szz5U6M0ILa5
 KrcQ==
X-Gm-Message-State: AOAM530alpBpHGoM6q4GWBspcB2COLWjyH4WG+sEqrW5mPCx76XbLqr/
 OwznX5fDQJdx0+BEQKjcGFGfR+DVkw==
X-Google-Smtp-Source: ABdhPJyxrl+MLrGaVMhZlIuZKpsBWIPx8RYrEaa/BgmMRqDJoT3O8C2TV3JX6WZQqreUbBZ5fKjhtQ==
X-Received: by 2002:a05:6808:1a04:: with SMTP id
 bk4mr6680603oib.85.1632608193387; 
 Sat, 25 Sep 2021 15:16:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id z17sm2305434ooz.38.2021.09.25.15.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 15:16:32 -0700 (PDT)
Received: (nullmailer pid 3839363 invoked by uid 1000);
 Sat, 25 Sep 2021 22:16:30 -0000
From: Rob Herring <robh@kernel.org>
To: Justin Chen <justinpopo6@gmail.com>
Cc: netdev@vger.kernel.org, =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Doug Berger <opendmb@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, Michael Chan <michael.chan@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>,
 Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <1632519891-26510-2-git-send-email-justinpopo6@gmail.com>
References: <1632519891-26510-1-git-send-email-justinpopo6@gmail.com>
 <1632519891-26510-2-git-send-email-justinpopo6@gmail.com>
Subject: Re: [PATCH net-next 1/5] dt-bindings: net: Brcm ASP 2.0 Ethernet
 controller
Date: Sat, 25 Sep 2021 17:16:30 -0500
Message-Id: <1632608190.772021.3839362.nullmailer@robh.at.kernel.org>
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

On Fri, 24 Sep 2021 14:44:47 -0700, Justin Chen wrote:
> From: Florian Fainelli <f.fainelli@gmail.com>
> 
> Add a binding document for the Broadcom ASP 2.0 Ethernet controller.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Justin Chen <justinpopo6@gmail.com>
> ---
>  .../devicetree/bindings/net/brcm,asp-v2.0.yaml     | 147 +++++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml:79:10: [warning] wrong indentation: expected 10 but found 9 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/brcm,asp-v2.0.example.dt.yaml: asp@9c00000: 'mdio@c614', 'mdio@ce14' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
Documentation/devicetree/bindings/net/brcm,asp-v2.0.example.dt.yaml:0:0: /example-0/asp@9c00000/mdio@c614: failed to match any schema with compatible: ['brcm,asp-v2.0-mdio']
Documentation/devicetree/bindings/net/brcm,asp-v2.0.example.dt.yaml:0:0: /example-0/asp@9c00000/mdio@ce14: failed to match any schema with compatible: ['brcm,asp-v2.0-mdio']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1532528

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

