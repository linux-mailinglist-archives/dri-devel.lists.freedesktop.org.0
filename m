Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7DC3B92D6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 16:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78EDC6EB18;
	Thu,  1 Jul 2021 14:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7070A6EB18
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 14:06:31 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id g3so5216691ilq.10
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jul 2021 07:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yLHmmEj2mk4rdkuTrjRuXZd3VO0v+sUNL5ijm6xbTJE=;
 b=W07RSf3wTUn/6mDCohqGaHOcQIvtoE1V2aAtYyjZQYct9/p+uv6QfzArFovVnvVKn3
 LMoFS3Fp7UwhC+3TEDYScHSF+SsrIB4Qm1fP920yjjp2aNh71r8bF/2N7j4yAGs40Lrn
 mYm6kxiEGzYZyrdx1HDxfCWFA+1XeruJEdE9LhwzD6Thm8pt++tmX5ocuPEgoTCPLFQN
 ScTYsVi1ZSx1zYdd8zXiFssyAGcPjwQc/GWSEb7AHNuwksqRotFhy3CRov8tQ2egC9LG
 fxgyBwvZcWn8/il41MqgQ6Az3GWKu2s5Y64HYZx0n3LA8ztr1iA0AGNpEDg6hsaGk2S0
 vSMQ==
X-Gm-Message-State: AOAM533lollq78GlbzjWgkPIZARMgHBi66X1lrtd+DaZXDZeJ8ckfpLk
 ErgVN6mTobzk0DZRxaa5yw==
X-Google-Smtp-Source: ABdhPJzM92Q/jJWim96ayyFCopdaorRNbcbr+6aTWu/nFJcw1tUY8oAEYBHv/5i+4sfTgTRR1g4Ijw==
X-Received: by 2002:a05:6e02:1d16:: with SMTP id
 i22mr13367772ila.300.1625148390793; 
 Thu, 01 Jul 2021 07:06:30 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id o10sm26672ilc.75.2021.07.01.07.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 07:06:29 -0700 (PDT)
Received: (nullmailer pid 2285450 invoked by uid 1000);
 Thu, 01 Jul 2021 14:06:23 -0000
Date: Thu, 1 Jul 2021 08:06:23 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix 'unevaluatedProperties' errors in DT
 graph users
Message-ID: <20210701140623.GA2285366@robh.at.kernel.org>
References: <20210623164344.2571043-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210623164344.2571043-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Jun 2021 10:43:44 -0600, Rob Herring wrote:
> In testing out under development json-schema 2020-12 support, there's a
> few issues with 'unevaluatedProperties' and the graph schema. If
> 'graph.yaml#/properties/port' is used, then neither the port nor the
> endpoint(s) can have additional properties. 'graph.yaml#/$defs/port-base'
> needs to be used instead.
> 
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>
> Cc: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/bridge/lontium,lt8912b.yaml    | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/imx258.yaml        | 2 +-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/renesas,vin.yaml       | 3 ++-
>  6 files changed, 8 insertions(+), 6 deletions(-)
> 

Applied, thanks!
