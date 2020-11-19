Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF262B96B1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 16:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505D689BD4;
	Thu, 19 Nov 2020 15:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E297589BD4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 15:48:15 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id f16so5674156otl.11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 07:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jNIhPxmg0BaACTrqzvaGUD3Lem9SsDuuD5upZKtAA4E=;
 b=YT3bPY12Ddoi80auAMoZlycoxnac6s4l2rUtkr9hQmRUB+Wtr7wGa03VN5xTqVwzPa
 7tBTDSlXVQXlZbhY/0WjZ6Ddggnfkuey6cuYicZKw0h9JEcaNEC8RNYdoX9Wjej7rcqa
 L3fT33GJmRX5HDIkviz43vIwMaPeiJUkmEauK5gxnD9nriklKxE9zohxRD4L1DxGjFR2
 qqOppnDbWC+1npqoxx1L7CuUGlHCQxV2Ie0Pc5LBDiezspl/w2OmCby/WbbUPAP1DUVj
 GPMWxunISbWed6S+8uttljA1ClW3HasYzmFjEQWzl/Nyg/M4AT55z319iZsCdg0OXMy0
 /kJw==
X-Gm-Message-State: AOAM532l+3vgaEkZMsKhmK1q2SQ6d7JhsOmWN/76S82FEOqVvlRTCn0K
 0CDCkGtQ3c89LpfM8JZRCA==
X-Google-Smtp-Source: ABdhPJzsfxth9Ic2aCa7zH6IVqqbDHRcU4XR7Phf3pasfHNI1BZH8DOoXQawnG5okLRXsgiGsFi66Q==
X-Received: by 2002:a05:6830:12c2:: with SMTP id
 a2mr10641245otq.162.1605800895148; 
 Thu, 19 Nov 2020 07:48:15 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t19sm22850otp.51.2020.11.19.07.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 07:48:14 -0800 (PST)
Received: (nullmailer pid 3308585 invoked by uid 1000);
 Thu, 19 Nov 2020 15:48:13 -0000
Date: Thu, 19 Nov 2020 09:48:13 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 2/8] dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
Message-ID: <20201119154813.GA3308033@bogus>
References: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
 <1605777745-23625-3-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605777745-23625-3-git-send-email-victor.liu@nxp.com>
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

On Thu, 19 Nov 2020 17:22:19 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qxp/qm Display Prefetch Resolve Gasket.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../bindings/display/imx/fsl,imx8qxp-prg.yaml      | 60 ++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.example.dts:24.33-34 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1364: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1402851

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
