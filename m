Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488C326AA46
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 19:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41D86E0F3;
	Tue, 15 Sep 2020 17:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C8F6E0F3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 17:14:47 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id r9so4959943ioa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 10:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UjmOVn51US4ye5ub9FFJR5dw7eba8fmk19nqIQFg/Ps=;
 b=KdLTMLcd+leBzIYsaFl3ezqt9gEnKC1kG7cXUeIR6zkEaAA+axgCP6LdagF48a47bQ
 xCVMAJWygfDLmsElMrH7onTf/marSyJSaSKRCm8tSbmn8CxEMRs/kfrJTq3/9yq7hF9u
 avkJWbJJNPut+XHfqWedZwdoz3htxFDF6FPnyq8fuyNb5/dCzNALaXffWowYBXr2FdAx
 Aiiz/FIyILUArvBv8q5fafvmiMOUd3iAYo9LkAD9bBeD0m8oOhl9YRm37ZWb1crnG/+A
 NgxVHLW6i/KM74nMTSSQQxitOAjcAqT6ZA8Oyj9SFHziS4iWno2Ks2qtslJ6G6VjoWL/
 mZbA==
X-Gm-Message-State: AOAM531ykkiC5ZsM8AS15N4nR0jTrdZtwNWJdmPzYgvN9hy3v/PJ9ZxK
 Pxi+4k8WR5n9vazdJ7l4RQ==
X-Google-Smtp-Source: ABdhPJxxfh2vAvVlCQhrRap2W6x+iat3Ht+bngSXEAH4nORPd70SAjRVOx5rKBHvI6PMcuxpXlmvwg==
X-Received: by 2002:a02:6043:: with SMTP id d3mr18818985jaf.122.1600190087443; 
 Tue, 15 Sep 2020 10:14:47 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id z10sm7806877ioi.13.2020.09.15.10.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 10:14:46 -0700 (PDT)
Received: (nullmailer pid 2146621 invoked by uid 1000);
 Tue, 15 Sep 2020 17:14:44 -0000
Date: Tue, 15 Sep 2020 11:14:44 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add documentation
 for LT9611UXC
Message-ID: <20200915171444.GA2146589@bogus>
References: <20200909092823.64810-1-dmitry.baryshkov@linaro.org>
 <20200909092823.64810-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200909092823.64810-2-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 09 Sep 2020 12:28:22 +0300, Dmitry Baryshkov wrote:
> Lontium LT9611UXC is a DSI to HDMI bridge which supports 2 DSI ports
> and I2S port as input and one HDMI port as output. The LT9611UXC chip is
> handled by a separate driver, but the bindings used are fully compatible
> with the LT9611 chip, so let's reuse the lt9611.yaml schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Acked-by: Vinod Koul <vkoul@kernel.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../devicetree/bindings/display/bridge/lontium,lt9611.yaml   | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
