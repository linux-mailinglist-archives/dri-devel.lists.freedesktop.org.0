Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED222B867C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 22:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFB489F71;
	Wed, 18 Nov 2020 21:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874CC89F71
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 21:21:36 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id m13so3850680oih.8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 13:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ss0uXL2h5hvFP3EZBj3yPcEtBcUi82HRGtXChv/G4cE=;
 b=lQBExgaUte1viZ3F3JEir7hFPNKco0eGqHJ7Buc6LPmZspl6retDtaObGPRjpJLm7W
 8wTznmxEtMKGgtxFDYscTChzNnUaoGJzAB1AZGk95lrsOP0inGXPJn0Puc10tF2Q9vs+
 Q8acw0Dy4/FsQtVNe0Z/cQoFZCDuvd2L92a/IbaXlXuZORLGR1PltjKRiE0+nOZ9xaqz
 AQJ0DAv1e/IjJ95p/ieaxR6VeI5HFoeuhTPwoBcFdSXJZ72FeSAJzlZjLNnO0B0HbZK8
 VV8Mpz72VBWMRYOte03IvySYr5S7b/nFYoi97my1IPAQ0MSUa6QtKFaiFOOw1kpwlAYx
 9bBw==
X-Gm-Message-State: AOAM533uAO+B1RTHizi4wkCr6o/B0yB+eQoFjY/dwjGxCAeWeKIe6R0/
 qfjryoCmwJZXI+e80cuVcw==
X-Google-Smtp-Source: ABdhPJxxTBYvftWskecODoDjJ4ukv9OAObOfUYCvBisilnIt0kN6iy3jVW5cH+JoiiwCQRORHbp4sg==
X-Received: by 2002:aca:ba42:: with SMTP id k63mr706654oif.111.1605734495634; 
 Wed, 18 Nov 2020 13:21:35 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y18sm6915392ooj.20.2020.11.18.13.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 13:21:34 -0800 (PST)
Received: (nullmailer pid 1836565 invoked by uid 1000);
 Wed, 18 Nov 2020 21:21:33 -0000
Date: Wed, 18 Nov 2020 15:21:33 -0600
From: Rob Herring <robh@kernel.org>
To: Wendy Liang <wendy.liang@xilinx.com>
Subject: Re: [PATCH 1/9] dt-binding: soc: xilinx: ai-engine: Add AI engine
 binding
Message-ID: <20201118212133.GA1836326@bogus>
References: <1605686780-17886-1-git-send-email-wendy.liang@xilinx.com>
 <1605686780-17886-2-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605686780-17886-2-git-send-email-wendy.liang@xilinx.com>
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
Cc: tejas.patel@xilinx.com, devicetree@vger.kernel.org, michal.simek@xilinx.com,
 rajan.vaja@xilinx.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 dragan.cvetic@xilinx.com, ravi.patel@xilinx.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org, manish.narani@xilinx.com,
 derek.kiernan@xilinx.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 Nov 2020 00:06:12 -0800, Wendy Liang wrote:
> Xilinx AI engine array can be partitioned statically for different
> applications. In the device tree, there will be device node for the AI
> engine device, and device nodes for the statically configured AI engine
> partitions. Each of the statically configured partition has a partition
> ID in the system.
> 
> Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
> ---
>  .../bindings/soc/xilinx/xlnx,ai-engine.yaml        | 119 +++++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml:10:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml


See https://patchwork.ozlabs.org/patch/1402008

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
