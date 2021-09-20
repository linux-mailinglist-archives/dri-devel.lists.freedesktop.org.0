Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD2441278D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 22:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A9C6E857;
	Mon, 20 Sep 2021 20:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793496E857
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 20:56:01 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 l7-20020a0568302b0700b0051c0181deebso25350657otv.12
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 13:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XPatjUnaHnEphbp45Tc3T1p6HiP/lC6r/ygiKd/wpQg=;
 b=qoAG6GOK0R6HeL2kpuUpnr0REOT3m/4R/UreJtV25ddrxSJ/RVT8N7Gz/MUMDn12Pw
 HQ4+/9lprhuTMD37aptP6AvVmsLpJEnT2mKlpYFnrQfzpUPl9o81oHlv0CFC34rQtxrI
 RuxqJYev/wz8qwV/6VUdcHPNNLlli90AcRlbpg9GPsa0MVl8tg2khwZ6HqbyRf8OdyGk
 GemGkYnUkcnaoQaPacMiu1u3LZSRvHUw1HQpozMDZVUM2ZAH1JCxYU/lPsaSCPte/3JQ
 Y2VrILrR8ex2EXaI1Ex6rWL6Q1SWJDOmBlf57q1KRFyfBIjBskDs1mWLu2qcipvaAW54
 YWug==
X-Gm-Message-State: AOAM531qTq7Qt7kKaLBx3e8H53C1ccnY3U3uPQQ/sf5vb/MLhfxF9dx7
 JX6lD+g8D3h3UK5xwq2xdw==
X-Google-Smtp-Source: ABdhPJw0Ubx9PITUcYUz1zNNca0q8nJ7I3Nn2f8OSxbuj/hwXREco2J/I6rnExb8fxBIFDz9aO3PRg==
X-Received: by 2002:a9d:4681:: with SMTP id z1mr23005506ote.42.1632171360541; 
 Mon, 20 Sep 2021 13:56:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id x192sm2337226oix.9.2021.09.20.13.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 13:55:59 -0700 (PDT)
Received: (nullmailer pid 744183 invoked by uid 1000);
 Mon, 20 Sep 2021 20:55:58 -0000
Date: Mon, 20 Sep 2021 15:55:58 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Bailon <abailon@baylibre.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 khilman@baylibre.com, gpain@baylibre.com
Subject: Re: [RFC PATCH 1/4] dt-bindings: Add bidings for mtk,apu-drm
Message-ID: <YUj1XnBbyNEqrV2g@robh.at.kernel.org>
References: <20210917125945.620097-1-abailon@baylibre.com>
 <20210917125945.620097-2-abailon@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917125945.620097-2-abailon@baylibre.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 17, 2021 at 02:59:42PM +0200, Alexandre Bailon wrote:
> This adds the device tree bindings for the APU DRM driver.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> new file mode 100644
> index 0000000000000..6f432d3ea478c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/mediatek,apu-drm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AI Processor Unit DRM

DRM is a linux thing, not h/w.

> +
> +properties:
> +  compatible:
> +    const: mediatek,apu-drm
> +
> +  remoteproc:

So is remoteproc.

Why don't you have the remoteproc driver create the DRM device?

> +    maxItems: 2
> +    description:
> +      Handle to remoteproc devices controlling the APU
> +
> +  iova:
> +    maxItems: 1
> +    description:
> +      Address and size of virtual memory that could used by the APU

Why does this need to be in DT? If you need to reserve certain VAs, then 
this discussion[1] might be of interest.

Rob

[1] https://lore.kernel.org/all/YUIPCxnyRutMS47%2F@orome.fritz.box/
