Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF14153569
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 17:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF606F89A;
	Wed,  5 Feb 2020 16:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24B96E9C8;
 Wed,  5 Feb 2020 16:40:50 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a5so3217770wmb.0;
 Wed, 05 Feb 2020 08:40:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YRyho1A5PtF4sCFUVKeESMDn8UQwlv3lsWB4C+ixlEY=;
 b=C318bGkrRneTlTCDTausmrcMq8nqHocj4opfQx0etZqIsLgoXJ1cy34ah/a4foGE+Y
 JjvNFx8hoSuTX6j1H1BZH8Jr6KiaJkaMkZlzxT66Y06vR6fA2Ndz32ckVP0P+0HSA0i/
 vL+JQi1GAnQBz0yRYDhfBF0n/IwyMmGaB3dcvaXG460psW6iEFK3qO5kEjWTc3ROxFEj
 Z1ElkVFm68v0Z4bmCfsqzH4evvIxUvAb2oqjvc9BYZa4YLe5bM5O5ZrVUo+FJRUuHLUR
 GbV5Kvj6PosadUdzPKmPDLR/w9akt9WGR01PosiztBjjeuR6BHnC3/cBwY51amVGbXyW
 jQUw==
X-Gm-Message-State: APjAAAX6PNwidyZI3ft63deTfVzsLlENQE1AowZyxo46LnSOrN1Fxy4Q
 QB2xZTBFAgSUGghQniHC/g==
X-Google-Smtp-Source: APXvYqwgSBNbRA19+O3qYDxG+xq/bkC9e2Rnn786m+qvq+3WemWWG3Fq4I2R9vkXdBpW7/tUBRMRSg==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr6942375wmi.118.1580920849090; 
 Wed, 05 Feb 2020 08:40:49 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.166])
 by smtp.gmail.com with ESMTPSA id g15sm469526wro.65.2020.02.05.08.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 08:40:48 -0800 (PST)
Received: (nullmailer pid 3886 invoked by uid 1000);
 Wed, 05 Feb 2020 16:40:48 -0000
Date: Wed, 5 Feb 2020 16:40:48 +0000
From: Rob Herring <robh@kernel.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCHv3 1/2] dt-bindings: display: add visionox rm69299 panel
 variant
Message-ID: <20200205164048.GA3452@bogus>
References: <1580907990-32108-1-git-send-email-harigovi@codeaurora.org>
 <1580907990-32108-2-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580907990-32108-2-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Harigovindan P <harigovi@codeaurora.org>, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  5 Feb 2020 18:36:29 +0530, Harigovindan P wrote:
> Add bindings for visionox rm69299 panel.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v1:
> 	- Added a compatible string to support sc7180 panel version.
> Changes in v2:
> 	- Removed unwanted properties from description.
> 	- Creating source files without execute permissions(Rob Herring).
> Changes in v3:
> 	- Changing txt file into yaml
> 
>  .../bindings/display/visionox,rm69299.yaml         | 109 +++++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/visionox,rm69299.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/visionox,rm69299.yaml:  while scanning for the next token
found character that cannot start any token
  in "<unicode string>", line 83, column 1
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/display/visionox,rm69299.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/display/visionox,rm69299.example.dts] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1233831
Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
