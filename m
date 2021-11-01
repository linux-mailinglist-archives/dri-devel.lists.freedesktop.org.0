Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDEC442142
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 21:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34D889B9E;
	Mon,  1 Nov 2021 20:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AFC89B9E
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 20:01:58 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id k8so13513582oik.7
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Nov 2021 13:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vKbU3K+WrEp4o3QSdl7uJ5u0m9E6kBLDNmgHPy+kDDM=;
 b=QqDLZN1ervk5oYOOph13vhzeXIQjsP/IEoU96wjW4i96LX5PExiw6iaseTpad4oshE
 CnVdCrvyDmwvRSz9Xt0ay5IW/eWV9VAGEMK29ffgLJLaFYk2qASDfa0g/GG3bDPtnOOc
 ZIY4nmW/eSdZroLszTeB+iqh/ZybHRgpFJ+m4omQ/hlPpMRFQlcSpEJhjYZkGViOZNTC
 DJeohait0DfA6aFSWgFIT6N0QCWLm6P89dGxjc8vchGimGNsiEggmove+r6uqmaXtbbw
 OrDRYrtYOJCO4LWKmpuwLkiQih+/tlmnrONw00lzGf2MHDJssFLc0KSgJneNDZruvaiY
 LALQ==
X-Gm-Message-State: AOAM532umFci2D14Le4RYTV1Y95F0Oon4nM/Djp1UZFTvytOBqZZE6Jc
 I8CzxA7FANETpE5Eo4KEBw==
X-Google-Smtp-Source: ABdhPJzu9huACWQR3JSRs6TW0bAUKDyIXz9rtmEFdctQS4TyLEu9YE4GVHGZhVUykEvaSkqL5HdO7w==
X-Received: by 2002:a05:6808:2201:: with SMTP id
 bd1mr1004520oib.73.1635796917384; 
 Mon, 01 Nov 2021 13:01:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g15sm4551923oiy.8.2021.11.01.13.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 13:01:56 -0700 (PDT)
Received: (nullmailer pid 943361 invoked by uid 1000);
 Mon, 01 Nov 2021 20:01:55 -0000
Date: Mon, 1 Nov 2021 15:01:55 -0500
From: Rob Herring <robh@kernel.org>
To: tommy-huang <tommy_huang@aspeedtech.com>
Subject: Re: [PATCH 4/4] dt-bindings: gpu: Add ASPEED GFX bindings document
Message-ID: <YYBHsy3Ed3Ss9281@robh.at.kernel.org>
References: <20211101110107.29010-1-tommy_huang@aspeedtech.com>
 <20211101110107.29010-5-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101110107.29010-5-tommy_huang@aspeedtech.com>
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
 BMC-SW@aspeedtech.com, andrew@aj.id.au, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, robh+dt@kernel.org,
 joel@jms.id.au, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 01 Nov 2021 19:01:07 +0800, tommy-huang wrote:
> Add ast2600-gfx description for gfx driver.
> 
> Signed-off-by: tommy-huang <tommy_huang@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/gpu/aspeed-gfx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

