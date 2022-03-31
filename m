Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1740B4EE4D7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 01:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86EC10E338;
	Thu, 31 Mar 2022 23:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40F910E338
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 23:38:54 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id k10so1221301oia.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 16:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zoRz1HVke9mwT5kDlfSSITmf1xPCuX+NIAz8DDaQA3w=;
 b=FYTXJ6Pqu+utElZiVArHcUca2bU14kYzwbVD7uvdG7aUr6wf3Cvn/5M9lPNrPmMuyN
 fqzcyAG3RxA8QglBknqFKSpqBOryhRxfE6fHC4ZylqI6aw0Teir6r0nKbuSnHSGu28tG
 8ZurMttdpdatYdgPACyWcVsWjaWrK0sB03KBPQwBzmSOBZYIC1vjks8mCRcnDe66/ktA
 AQcJ2mzycCqQPkdQNeMXFNd9C2AhSpxUZ51DYCwv4e8CmvRKAPFoz3oi+rhqWZsaxU86
 +xhoNLk1F1S8h6l46hrkTtQ6GNzB+Vv9/X4GJTTXcfvZoF6K+lOVcXt43rIpQvjUROA+
 kbBw==
X-Gm-Message-State: AOAM530scoWA9bG0z9nerBOAfHQbwGqbVCKPziRPM5RHC+ALSDY/ij7Y
 RdMe+/A2qFM0iAFgH/E402eSz5AXJQ==
X-Google-Smtp-Source: ABdhPJzYoU/79g5Z0Xl2bAurI7Js9F9ApK07KktrWz1hwBsBbI9p0777PkeE+BruyGLA8L3YndMvCg==
X-Received: by 2002:a05:6808:1394:b0:2ec:ddb3:c82b with SMTP id
 c20-20020a056808139400b002ecddb3c82bmr3707458oiw.274.1648769933719; 
 Thu, 31 Mar 2022 16:38:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m13-20020a9d7acd000000b005cda59325e6sm422216otn.60.2022.03.31.16.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 16:38:53 -0700 (PDT)
Received: (nullmailer pid 1709936 invoked by uid 1000);
 Thu, 31 Mar 2022 23:38:52 -0000
Date: Thu, 31 Mar 2022 18:38:52 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: lcdif: Add compatible for i.MX8MP
Message-ID: <YkY7jFS5JvgYK7IP@robh.at.kernel.org>
References: <20220322142853.125880-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322142853.125880-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Mar 2022 15:28:52 +0100, Marek Vasut wrote:
> Add compatible string for i.MX8MP LCDIF variant. This is called LCDIFv3
> and is completely different from the LCDIFv3 found in i.MX23 in that it
> has a completely scrambled register layout compared to all previous LCDIF
> variants. The new LCDIFv3 also supports 36bit address space. However,
> except for the complete bit reshuffling, this is still LCDIF and it still
> works like one.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
