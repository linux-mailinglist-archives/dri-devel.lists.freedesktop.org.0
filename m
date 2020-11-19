Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042F92B96AD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 16:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D13089BD4;
	Thu, 19 Nov 2020 15:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4A989BD4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 15:47:01 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id q206so6744987oif.13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 07:47:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i1tNp2KgBd14FkkpCIHyiNr1qV+4/KrTXMEh9UM4OyA=;
 b=J5C1UMrjE82Pfkir4nsPBlREjJhO3w9zJghVyszi4n9l31JXcQ8WU/qUE28cqTw7HJ
 wd874dxkNWyKuWh+iB5cKFmtdy2Dz7pvcfgE0Ld6ix1p8x6rP1baP9oXz+mzq+WeXTgM
 9UZBVdCLV7sonjwXrMa5n/pSnp4FISAnzIytuFEUKrXnxTvPbIP9LzbYAEYGgGLENB8q
 JcJo+yw0Pu6KzfQ7aI7I5WNtxnnLe0FrtMXy3NR4PqKaETdpXRLlfuy8A8EaEGqfAwb0
 YSEWfBWXE7vd5pTnBNVYCoAND+FPav8SWImkPuzZJNtKDZI3uNGLXPSN55JC1GqZUg7S
 vtoA==
X-Gm-Message-State: AOAM531Y0ySl7VqMirgEPeoZczgXe2ea+iFOhcDLAlvB03X5S1xpUc/4
 N1BEuCK3NGdi9paWlFcfZA==
X-Google-Smtp-Source: ABdhPJwkrz3+GCohSQnDOih8nPEsaXejgRb4izFB+vIbBFRIMNrgLzBmWvAhWHS986gyCl3cLw7szQ==
X-Received: by 2002:a54:480b:: with SMTP id j11mr3182548oij.31.1605800820893; 
 Thu, 19 Nov 2020 07:47:00 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x7sm29561otb.19.2020.11.19.07.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 07:46:59 -0800 (PST)
Received: (nullmailer pid 3306861 invoked by uid 1000);
 Thu, 19 Nov 2020 15:46:59 -0000
Date: Thu, 19 Nov 2020 09:46:59 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 1/8] dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
Message-ID: <20201119154659.GA3306242@bogus>
References: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
 <1605777745-23625-2-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605777745-23625-2-git-send-email-victor.liu@nxp.com>
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

On Thu, 19 Nov 2020 17:22:18 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qxp/qm Display Processing Unit.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../bindings/display/imx/fsl,imx8qxp-dpu.yaml      | 358 +++++++++++++++++++++
>  1 file changed, 358 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml:29:6: [warning] wrong indentation: expected 6 but found 5 (indentation)
./Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml:69:111: [warning] line too long (111 > 110 characters) (line-length)
./Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml:70:111: [warning] line too long (111 > 110 characters) (line-length)
./Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml:71:111: [warning] line too long (112 > 110 characters) (line-length)
./Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml:72:111: [warning] line too long (112 > 110 characters) (line-length)
./Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml:73:111: [warning] line too long (111 > 110 characters) (line-length)
./Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml:74:111: [warning] line too long (111 > 110 characters) (line-length)
./Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml:75:111: [warning] line too long (112 > 110 characters) (line-length)
./Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml:76:111: [warning] line too long (112 > 110 characters) (line-length)

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.example.dts:85.33-34 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1364: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1402850

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
