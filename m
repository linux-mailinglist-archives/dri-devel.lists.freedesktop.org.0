Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88355528A4D
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 18:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C58112AB4;
	Mon, 16 May 2022 16:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F1D112AB5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 16:27:50 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-edf9ddb312so20798260fac.8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 09:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=osVfxhsQi2p2dlDrhzZDuOBV7X+Ps662PG/MDdJu9W0=;
 b=DCFK23SWN8/g+fi0CZ5MlunzGgb+u1+/ytLW7LyrUsMtJbOGnb5PDjxaxL4VoCDw8m
 1JJTiqPfcYjESW1Hd13NFz3E4XGEcVc7b+faDhoUprQaHir1449FhP0d6vhGX+IUXvAj
 PMIeBA7wiIvpNz86QOb+Gs3KklaLm+lbIY4aeUsDqq9+ReXls+qUyS2kkUurTEBgzxDN
 w/O1CAXyS8Ccn/Twjtr4+Rsn4o+BB4Nh9E6TDeY6IqQTyXp8GpMNS0ApzgsLF+fXV0Ub
 2q6k4WKwSp64cZN6pg2SrBoZPZRQ0s0maXQttnLIREyahVRmQXigQC2jINGJ3dgJ2Jgf
 Eopg==
X-Gm-Message-State: AOAM533Vtyr8V7V1UQGW4CUebZxAyoVgAoDdCmPXpPpKlybNXuD3/qai
 MOiiV/gV9QPuYaL5vsUxDw==
X-Google-Smtp-Source: ABdhPJxaunhi1VLlqHvgFaK+EgjKjq0gVMM8ayHjAQzaIw/eUPKQEHsbfeLNaMcAuwFJet/LLjQYYg==
X-Received: by 2002:a05:6870:890f:b0:e1:c92d:d84 with SMTP id
 i15-20020a056870890f00b000e1c92d0d84mr9757652oao.49.1652718469152; 
 Mon, 16 May 2022 09:27:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b18-20020a9d6b92000000b00606b1f72fcbsm4071686otq.31.2022.05.16.09.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 09:27:48 -0700 (PDT)
Received: (nullmailer pid 2793161 invoked by uid 1000);
 Mon, 16 May 2022 16:27:47 -0000
Date: Mon, 16 May 2022 11:27:47 -0500
From: Rob Herring <robh@kernel.org>
To: cyndis@kapsi.fi
Subject: Re: [PATCH v5 1/9] dt-bindings: host1x: Add iommu-map property
Message-ID: <20220516162747.GA2793126-robh@kernel.org>
References: <20220516085258.1227691-1-cyndis@kapsi.fi>
 <20220516085258.1227691-2-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516085258.1227691-2-cyndis@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 will@kernel.org, joro@8bytes.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, robh+dt@kernel.org,
 iommu@lists.linux-foundation.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 May 2022 11:52:50 +0300, cyndis@kapsi.fi wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Add schema information for specifying context stream IDs. This uses
> the standard iommu-map property.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> ---
> v3:
> * New patch
> v4:
> * Remove memory-contexts subnode.
> ---
>  .../bindings/display/tegra/nvidia,tegra20-host1x.yaml        | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
