Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 849995F3337
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 18:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D30010E413;
	Mon,  3 Oct 2022 16:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AC710E40D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 16:16:55 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id w13so11778554oiw.8
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Oct 2022 09:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=n6qNXTUxVdbW5pamC8yW/XZu0YEjyP8JbCRL+nV6Xik=;
 b=xlbK29HOJXGYxQ5+oYH/nZyphMtqVSE0E+A7ds2209IWSOXvh+iPE1sKfWntLMSg+L
 EcoS+Qsk11fdw2WqEJX354SIQQOez5pCKqVDv+8YP2CcdhTIaXvnkuoMpl8qzzqMr7A/
 jt1NYS+iyv26AiacQpGkBIwHJJFyY8lNTaazmUbaXg1kX3RLm3vMtYbrXGx7gBk0Qpda
 jZ320n+Fn1F8VqgdcwsaTGTmTfw2WkXcD1K/dJzgeQZVK9EyGLW46hlrp1o0qXljqPda
 NcG02cuDOewjebKIfx4RNM5wbMPOH5FwLmcO5gsiHKiGQ9RVwUlWzVjuQZQ93osTDf7p
 K94g==
X-Gm-Message-State: ACrzQf1Ma4tiHYOkETOGxmlnjAC/Hl5+mpBvAX6oPyEdeY9nC9cTWTbP
 DfdK4Ptxv9T78NpaRXHEXA==
X-Google-Smtp-Source: AMsMyM5EYqsB+/ddWpoDpynNS+3amBvzxr+amDgwN06v0eLd9S0EKVKIRe6kbLbya8z3KvSzYFYG9g==
X-Received: by 2002:aca:180b:0:b0:352:8bda:c428 with SMTP id
 h11-20020aca180b000000b003528bdac428mr4376671oih.13.1664813814275; 
 Mon, 03 Oct 2022 09:16:54 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 ep31-20020a056870a99f00b0011bde9f5745sm3018755oab.23.2022.10.03.09.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 09:16:53 -0700 (PDT)
Received: (nullmailer pid 2398224 invoked by uid 1000);
 Mon, 03 Oct 2022 16:16:52 -0000
Date: Mon, 3 Oct 2022 11:16:52 -0500
From: Rob Herring <robh@kernel.org>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v3 3/8] dt-bindings: Add bindings for Tegra234 NVDEC
Message-ID: <166481381193.2398163.17368666034757782768.robh@kernel.org>
References: <20220920081203.3237744-1-cyndis@kapsi.fi>
 <20220920081203.3237744-4-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920081203.3237744-4-cyndis@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 20 Sep 2022 11:11:58 +0300, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Update NVDEC bindings for Tegra234. This new engine version only has
> two memory clients, but now requires three clocks, and as a bigger
> change the engine loads firmware from a secure carveout configured by
> the bootloader.
> 
> For the latter, we need to add a phandle to the memory controller
> to query the location of this carveout, and several other properties
> containing offsets into the firmware inside the carveout. This
> carveout is not accessible by the CPU, but is needed by NVDEC,
> so we need this information to be relayed from the bootloader.
> 
> As the binding was getting large with many conditional properties,
> also split the Tegra234 version out into a separate file.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v3:
> - Adjusted descriptions for firmware-related DT properties
>   as requested.
> - Small update to commit message.
> v2:
> - Split out into separate file to avoid complexity with
>   conditionals etc.
> ---
>  .../gpu/host1x/nvidia,tegra234-nvdec.yaml     | 156 ++++++++++++++++++
>  1 file changed, 156 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
