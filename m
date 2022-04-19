Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBA1506C01
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 14:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F009F10E156;
	Tue, 19 Apr 2022 12:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7535010E156
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 12:12:49 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 t6-20020a056830224600b00605491a5cd7so4527154otd.13
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 05:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=YeAeQ+jnrOWAEKYx6yVLIhj6nj1MTrMjb3kCp0yvejM=;
 b=P8EbOednjbbQMOFk0xgQadRkLsn7BVrAu6mXvrnRnmqogwySVzs/kmRKPfRBflR28p
 oSCT5V2S6PvRW1x3MQV4mqjXWKDVlgXQzMYIQB5I2VrrBGNjJEtgjWVNBaEveHmJny7G
 f4BJ/VXeyojofB2DifoCu8Diwd+IJ/4255h/8o5sfXjqV6Sft9YONMGn0sMTXZhm51Z6
 kT0Na1sZwFGzhqnBx5LuTzH1AqzGn4iUwDQAu8136p8XSk6k7T8D5XsQKlQLO3qmkINJ
 dM/WWZ7HG4/RpT9ApVI6CQEl71iBLsnV56ptRHWLDiRjRdTbqBZa5OC+OBPr+duC8/OO
 CkhA==
X-Gm-Message-State: AOAM5323LCaE2W/h60tYcQyb3S7Pf9C6Nrig7hmLbF7PS0S/MMhupOhF
 ioZD3Yfu6S781/f+vRPk+w==
X-Google-Smtp-Source: ABdhPJwg4yHDT6X1rpfqMAom9LqkVyPVB09XL0HDMP6yioLKul+fCnEZLuA8Ej0AcX2iP5IaEGiPdQ==
X-Received: by 2002:a9d:1928:0:b0:604:13d5:b114 with SMTP id
 j40-20020a9d1928000000b0060413d5b114mr5557181ota.6.1650370368668; 
 Tue, 19 Apr 2022 05:12:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x2-20020a4a2a42000000b0033a3c4392c3sm2302555oox.26.2022.04.19.05.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 05:12:48 -0700 (PDT)
Received: (nullmailer pid 1977870 invoked by uid 1000);
 Tue, 19 Apr 2022 12:12:43 -0000
From: Rob Herring <robh@kernel.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20220419070302.16502-2-a-bhatia1@ti.com>
References: <20220419070302.16502-1-a-bhatia1@ti.com>
 <20220419070302.16502-2-a-bhatia1@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: ti,
 am65x-dss: Add missing register & interrupt
Date: Tue, 19 Apr 2022 07:12:43 -0500
Message-Id: <1650370363.583109.1977869.nullmailer@robh.at.kernel.org>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tomi Valkeinen <tomba@kernel.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Nikhil Devshatwar <nikhil.nd@ti.com>,
 Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Apr 2022 12:33:01 +0530, Aradhya Bhatia wrote:
> The DSS IP on the ti-am65x soc supports an additional register space,
> named "common1". Further. the IP services a maximum number of 2
> interrupts.
> 
> Add the missing register space "common1" and the additional interrupt.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  .../devicetree/bindings/display/ti/ti,am65x-dss.yaml   | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/display/ti/ti,am65x-dss.example.dts:30.17-18 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/display/ti/ti,am65x-dss.example.dtb] Error 1
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

