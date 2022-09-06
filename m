Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A26075AF725
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 23:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DFB10E330;
	Tue,  6 Sep 2022 21:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3185E10E2AC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 21:41:02 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-1279948d93dso11677349fac.10
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 14:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date;
 bh=VhCmxVW3/wc19U1W+hLsKl0upxjzzE6C+mdsRbM8VCw=;
 b=bhKBsa/NcQFn/FThH5Rc3ve0R+Ylia+867cQtbJFKr6NAg2Ywv6mnnpPPfCMufkgvf
 blbgBVV6RgHIbVTgPF9YM2ADZ9epfELHNpMkJegpg6vxm1UHszFLasik2xYxnlFgvGQ5
 radKpPjjSX7bMCJlLaNHq8kT59ZJhQYj7M1xF/WQuy7UPMGnmvFmemxUiwLQc5uXnWNT
 4AcxRoW653kfYebm5KyrP1VJB85r77dhGP3w8mARXCwwAMTyHorE2ugk8+FXawhr3jpg
 gwUdQiK0AsNucfeWibgK5ZmFyVwNnjUMU0YZNV75qkDsJdCK4wC09UL3A6fKuYcjIvMD
 xqHg==
X-Gm-Message-State: ACgBeo1vQDpRNzC7X++jhEtkrO48avlhxvXSEOPMWOW9+VBZmyVysglJ
 cDi9hA6amIZPyOeiZzWbGA==
X-Google-Smtp-Source: AA6agR521JIOwffhQd3c1csnxBC/264dXCNHrG2kIzcBbeypfKtPCujvZyyo62ASPogB/Ahd6ZypGA==
X-Received: by 2002:a05:6870:f105:b0:127:f289:cd27 with SMTP id
 k5-20020a056870f10500b00127f289cd27mr154611oac.195.1662500461340; 
 Tue, 06 Sep 2022 14:41:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x8-20020a056808144800b0033b15465357sm5842343oiv.5.2022.09.06.14.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 14:41:00 -0700 (PDT)
Received: (nullmailer pid 1224956 invoked by uid 1000);
 Tue, 06 Sep 2022 21:41:00 -0000
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
In-Reply-To: <20220906183642.12505-2-macroalpha82@gmail.com>
References: <20220906183642.12505-1-macroalpha82@gmail.com>
 <20220906183642.12505-2-macroalpha82@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Samsung AMS495QA01
 panel bindings
Date: Tue, 06 Sep 2022 16:41:00 -0500
Message-Id: <1662500460.105772.1224955.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 06 Sep 2022 13:36:41 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add documentation for the Samsung AMS495QA01 panel.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../display/panel/samsung,ams495qa01.yaml     | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.example.dtb: panel@0: 'backlight' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

