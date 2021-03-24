Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D783D348247
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 20:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216C66EA83;
	Wed, 24 Mar 2021 19:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985496E1B7;
 Wed, 24 Mar 2021 19:58:29 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id z136so22822441iof.10;
 Wed, 24 Mar 2021 12:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ckz74ZkgmnFeD8eQMB4UJB/Am1mTvPA8wYzxy5HDh8g=;
 b=OsW370648yuZFvsug0ne+QVnQKivaowi/p0wgiMS3UToWgx0qg3Cvr6vdjT9E9sYr8
 f3Cnhlr2J3m/+LY3oQ2dIpPPygQIuxEKaQ03VmQxNWviYEL/KFd8SBCghDFk+9DcHsUl
 IAaEXSj8CDtGf351VctakQZYbvUaxcH9OAB8v+fEvOVdMe+pEkes57yI+mYZTGYWC/gw
 m6iXxyJm681QH4YBzuUhfCbECQNbldqPkrz+n/mjGElC/LacY1JWOwBmRVHk/OMQYUpE
 e2CRo8YArvTzWr011mQ8U4lYolGJBT9hrivE/RUT4zy4UK5oe5EO4pU323U82JWun2DI
 pc3g==
X-Gm-Message-State: AOAM53096McdDX7JDBXi5NeD8xv9/WLo7PSXoqXvK9Tb7wxrZblZLXA9
 YO8by/DFvywsu4iKbwfuuA==
X-Google-Smtp-Source: ABdhPJy1Icpeq/9CfPDN8APc8tPGVDrDk4uBbBlAilmuMzm4H8LSBAibB/0f7fhpZqajauZV/FGp6w==
X-Received: by 2002:a02:c002:: with SMTP id y2mr4449322jai.107.1616615908972; 
 Wed, 24 Mar 2021 12:58:28 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id z17sm1543306ilz.58.2021.03.24.12.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 12:58:27 -0700 (PDT)
Received: (nullmailer pid 3525447 invoked by uid 1000);
 Wed, 24 Mar 2021 19:58:24 -0000
Date: Wed, 24 Mar 2021 13:58:24 -0600
From: Rob Herring <robh@kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] dt-bindings: msm: Couple of spelling fixes
Message-ID: <20210324195824.GA3523377@robh.at.kernel.org>
References: <20210320192553.29922-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210320192553.29922-1-unixbhaskar@gmail.com>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, dt@kernel.org,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 21, 2021 at 12:55:53AM +0530, Bhaskar Chowdhury wrote:
> 
> s/Subsytem/Subsystem/
> s/contoller/controller/

Rather than worry about trivial fixes, please convert .txt bindings to 
DT schema instead.

> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> index 551ae26f60da..586e6eac5b08 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> @@ -2,14 +2,14 @@ Qualcomm Technologies, Inc. DPU KMS
> 
>  Description:
> 
> -Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encapsulates
> +Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>  sub-blocks like DPU display controller, DSI and DP interfaces etc.
>  The DPU display controller is found in SDM845 SoC.
> 
>  MDSS:
>  Required properties:
>  - compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
> -- reg: physical base address and length of contoller's registers.
> +- reg: physical base address and length of controller's registers.
>  - reg-names: register region names. The following region is required:
>    * "mdss"
>  - power-domains: a power domain consumer specifier according to
> --
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
