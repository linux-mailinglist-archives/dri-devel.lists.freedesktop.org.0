Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33296561F15
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 17:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EB810F57D;
	Thu, 30 Jun 2022 15:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD0F10F567
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 15:20:03 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id v185so12764130ioe.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 08:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DkXqk+AePfbA7pH+z9Dn++p1/AQn3KVd9XT2RKpV41k=;
 b=3ZiBtYpSFCUTpIBQhH67YOxR0GvsLGyNo25el5cxRAayz81M40iraS3S2YMnxpK6vs
 CUP563SqS7ZS8x9itmFwqS7qqcjBut9CIWln0XfQxDeTVDx7vjZvpDY7qrZASUFGdKhY
 dmKfgWSbP9DmIwU5Mb1+sVGcUkE/lXozZFupEBQ4ZDwQgXhystZXKV2Xc8rfiHU6LCc2
 K6g/ASN7SBH4lAkh4hK38hlDBAyws3yl30E3wKwnjFlt2gUaFPZpGLWpcpCtkE4HDx32
 ShZvztXzls8DuZC8AUuvHYUD/uASv3b64moG1i5tLkdpWo3rtljhFBAFMNzH030OaOF7
 F3Yw==
X-Gm-Message-State: AJIora/3amymuan5GXScguOmjKctAGTpKPerOtpPmJhSDPgqS2o73aeF
 GOtRjKypjejuqnFhGkOMsg==
X-Google-Smtp-Source: AGRyM1twz4YnNC+zp+pMABb329bCZNDTct+Lv1bu/S1PkCwpdSDxo7ZeosSO8CRnMziG9bEm4OnGDg==
X-Received: by 2002:a02:ac1:0:b0:339:ce43:bc25 with SMTP id
 184-20020a020ac1000000b00339ce43bc25mr5684411jaw.308.1656602402556; 
 Thu, 30 Jun 2022 08:20:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 bw14-20020a056638460e00b0033ca26010besm4600362jab.148.2022.06.30.08.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 08:20:02 -0700 (PDT)
Received: (nullmailer pid 2729804 invoked by uid 1000);
 Thu, 30 Jun 2022 15:20:01 -0000
Date: Thu, 30 Jun 2022 09:20:01 -0600
From: Rob Herring <robh@kernel.org>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v7/v3 10/22] dt-bindings: host1x: Fix bracketing in example
Message-ID: <20220630152001.GB2722229-robh@kernel.org>
References: <20220627142008.2072474-1-cyndis@kapsi.fi>
 <20220627142008.2072474-11-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627142008.2072474-11-cyndis@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 27, 2022 at 05:19:56PM +0300, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> The bracketing for the interrupts property in the device tree
> example is incorrect. Fix it.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  .../bindings/display/tegra/nvidia,tegra20-host1x.yaml         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
