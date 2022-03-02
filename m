Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D08A44CACC8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 19:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0A110E237;
	Wed,  2 Mar 2022 18:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CCB10E237
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 18:01:22 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 r41-20020a4a966c000000b0031bf85a4124so2840290ooi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 10:01:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/goqT9AknfrrTEcTqtCY9P/6UOTTnBDztD2PHfR3fqA=;
 b=6jqBeVc5+XdSkR51xPmV3+6w1yTq36tZSOz9oiKDaGihNR+9+3Mlz9Pfo6J9Tp9BcV
 6wRdy2YVku6Ky4gys2PcN7OEoPMDOU4EAuyachVsvfHMYPTj62PsHCZoEhLr4WpfEgjY
 sv8xE7R4HBHMrN1d9fE1cbErWJrih/T+ExXoAeljrd3GMN97WyNeDGGvBzQKWuYDcV9t
 9f44sDfklYtIGFEOpQ1rJHdt06L3l58b/CowOG89vsInyBeIUR9M38jbJIaATyYX8xvf
 AIbvtc2ukCnRxbVPaGJM6BGzGKL9nnl9I/QRsrcLuiM3P/xVvPRGrobw7XPwbkb1b6GD
 01TA==
X-Gm-Message-State: AOAM532DHosNC7xLeqi/2qQdkG4LZwfjEloubZ4THFOLsTr9iEbVo+4b
 9UUfR5xM7y/L8zhnty5O4w==
X-Google-Smtp-Source: ABdhPJwU081ZnsYALg3ngDKnxVTNDVswhLhomVWcfKM5MhTUgPTmsvi/R9c2nx7mXVO6EHrERhIVNA==
X-Received: by 2002:a05:6870:f58f:b0:d4:395b:535e with SMTP id
 eh15-20020a056870f58f00b000d4395b535emr820759oab.136.1646244081294; 
 Wed, 02 Mar 2022 10:01:21 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 g2-20020a056830160200b005af14cf9962sm7986991otr.32.2022.03.02.10.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:01:20 -0800 (PST)
Received: (nullmailer pid 3969417 invoked by uid 1000);
 Wed, 02 Mar 2022 18:01:19 -0000
Date: Wed, 2 Mar 2022 12:01:19 -0600
From: Rob Herring <robh@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] dt-bindings: gpu: Convert aspeed-gfx bindings to yaml
Message-ID: <Yh+w7+CdtYYJoRkh@robh.at.kernel.org>
References: <20220302051056.678367-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302051056.678367-1-joel@jms.id.au>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Andrew Jeffery <andrew@aj.id.au>, Tommy Haung <tommy_huang@aspeedtech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 02, 2022 at 03:40:56PM +1030, Joel Stanley wrote:
> Convert the bindings to yaml and add the ast2600 compatible string.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../devicetree/bindings/gpu/aspeed,gfx.yaml   | 69 +++++++++++++++++++
>  .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 -----------
>  2 files changed, 69 insertions(+), 41 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt

Applied, thanks.
