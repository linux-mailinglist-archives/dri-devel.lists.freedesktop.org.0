Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E17E84F9E69
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 22:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3005810E551;
	Fri,  8 Apr 2022 20:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C3E10E52F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 20:52:05 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-e1dcc0a327so11009948fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 13:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PT7kIhGKYEWso/FS/FtYSxv89cgBbpRTQgG43vv2qkI=;
 b=T+QkcCS1NnQtkqIouTb0QjsTwAj386+bD/wUaL147k2HiYSP3ZSkUur7cqGCQQLGlZ
 IIBd65MfyyfESsAHpf5ZSATs1xCoB/dg9Z7jfqenRBdjTmshV60EoAGYRygOcEdB6cGg
 59gCRqnScPSIHT8ad+5JMNqQNs/JmcuABFYNzwhwmORdMvV1cWbvG1RppAirtR4nLy/R
 KDGRW5WaFLLPx7gOKfM7nbuTMgOW0croMqLBIDOx2GpbmXzMtzDZV3P9q1te9IPwEVtd
 9w+G0LjguTQSOi40BG7nb/MFMxqJOXQbwRS4QGldG3ArITIpOfBNOaSDfyS/siQ/5YBE
 zhLQ==
X-Gm-Message-State: AOAM5313OZmiyLTiYS4J6e90RP8n6xp/IHk28zfb59yDipS9xxxy8SCq
 SVoGLsAu+CxyyfOPYGTO8A==
X-Google-Smtp-Source: ABdhPJxVEQzi9SiO14bfxFoe1zwfoZO3q7eUy6FYUE5BjSXG7imLkvH1lQA9n4Xc9M5KSZGJQYXAJg==
X-Received: by 2002:a05:6870:d28d:b0:da:b3f:2b51 with SMTP id
 d13-20020a056870d28d00b000da0b3f2b51mr9053315oae.240.1649451124939; 
 Fri, 08 Apr 2022 13:52:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k14-20020a056830168e00b005b22c20b195sm9764815otr.45.2022.04.08.13.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 13:52:04 -0700 (PDT)
Received: (nullmailer pid 4042062 invoked by uid 1000);
 Fri, 08 Apr 2022 20:52:03 -0000
Date: Fri, 8 Apr 2022 15:52:03 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: icn6211: Document DSI
 data-lanes property
Message-ID: <YlCgcw06jJ14n+kT@robh.at.kernel.org>
References: <20220407185617.179573-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407185617.179573-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Apr 2022 20:56:16 +0200, Marek Vasut wrote:
> It is necessary to specify the number of connected/used DSI data lanes when
> using the DSI input port of this bridge. Document the 'data-lanes' property
> of the DSI input port.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> NOTE: This is consistent with all the other DSI panel and bridge bindings which
>       document 'data-lanes' property, all of which already use OF graph and have
>       the 'data-lanes' property in the port@N subnode, see:
>       $ git grep -l data-lanes Documentation/devicetree/bindings/display/
> ---
>  .../display/bridge/chipone,icn6211.yaml        | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

