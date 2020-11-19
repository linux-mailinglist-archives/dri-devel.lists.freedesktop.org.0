Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CA62B96B2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 16:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292CC6E56A;
	Thu, 19 Nov 2020 15:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90E06E56A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 15:48:40 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id o3so5686957ota.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 07:48:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lIAE4uzT+8vC+EjZ/7M0VoomkRn2xJpo+773Y2o0nSA=;
 b=RXBstzy6B3CpcWiZtO86S2ZohYkFF/TfhGACeoAeI4/7e/MXcf1m9dRFuc4hj48pUN
 VPz9i5dvPkMr+aVvwpqPsMwhxEWiobvpMOWADRBul3DjphAURrA5yiFepHB021NvsDuf
 9EqsfWOQzIaQJkAXmS4IEzPojK7r0XMxRszHTw71a1iGV3uho8N2g6wqnFbv5yiWBHvk
 R2lXcIa+g1tzDe5t1e3XrdFhDjxqsqtzz3GRz7HRnCc8qMrWGxom9RDbHwtoBWOxTJel
 +DPE5h7lzlNvxoJ8nmFUk1DZm7OeUKFV3/BQCENha6ygJwnrwMdsKRha+L8eQJC1YhHf
 lFDw==
X-Gm-Message-State: AOAM533PaoCWgyPDVdBiDMZC+6RYzGViW2j0QIb8AHc+1EmbLIAQ+c6D
 fvb8YVCnVGtRQbPPa8oaeg==
X-Google-Smtp-Source: ABdhPJzTxVOEW8YGQa60XmqmgMXCcZhJsnkbKKeiQk6v95zH5TTqI6+EhayfcsXXG4TUs/ahIGv2mw==
X-Received: by 2002:a9d:8d7:: with SMTP id 81mr10744011otf.345.1605800920267; 
 Thu, 19 Nov 2020 07:48:40 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u63sm106798oia.50.2020.11.19.07.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 07:48:39 -0800 (PST)
Received: (nullmailer pid 3309224 invoked by uid 1000);
 Thu, 19 Nov 2020 15:48:38 -0000
Date: Thu, 19 Nov 2020 09:48:38 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 3/8] dt-bindings: display: imx: Add i.MX8qxp/qm DPR
 channel binding
Message-ID: <20201119154838.GA3308916@bogus>
References: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
 <1605777745-23625-4-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605777745-23625-4-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, tzimmermann@suse.de, airlied@linux.ie,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 Nov 2020 17:22:20 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Channel.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.example.dts:26.33-34 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1364: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1402852

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
