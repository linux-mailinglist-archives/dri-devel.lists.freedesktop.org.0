Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1156D36BAF0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 23:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C753A6E10C;
	Mon, 26 Apr 2021 21:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A646E10C;
 Mon, 26 Apr 2021 21:04:48 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id i26so2430180oii.3;
 Mon, 26 Apr 2021 14:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=9sYpBbEdCsZlXn6s0zm9BTjvqWIX5oqEQY81N9nJXUQ=;
 b=Wk/aRG70+OZW2TYQlxDhsBaW7CeCuBKJw9KjFmUJKUoZUtjTyYnxb0jrftwD9DeNYH
 fsQq1j9T/SHpFKFs1cN+E/+WdblIFT7RrR8tdKIJjBZfgj80gmKTGZe6ksLBoNaqzvw4
 Z9zMz+zlYwFmloiY7nVfPzAInZNVxVPBewSd2p1qMW1/KJTLI+LsSNFLm1iOGNvc/Q80
 j5wOvuiL4YpHW/7CrFx+a5rUGcn4whxYLctrVtIQqJzni2X3FPBotZhR8TPy4XPKqPJn
 pUdFT+9htgrgNIadsaExSEtYxvvN2jOshRPhGo9Uqzm7LtvV3wW3Yb9IhkAteP4RVHJt
 5r7g==
X-Gm-Message-State: AOAM530n2Uf9Xbd/Q4LoV0i75ir/3N6tKto2n95P5b7ZSZHvlmngMUEG
 Au7JjvoJQLjJwhLyW7nku/TSWQsRpg==
X-Google-Smtp-Source: ABdhPJzKYcM9Xr8ii7oWngd0BsINs7L82hbm7wSvPZPLlsusNDqVR+RyLs2yFTyFBTRoVpprcsa/ew==
X-Received: by 2002:aca:5789:: with SMTP id l131mr707651oib.164.1619471087324; 
 Mon, 26 Apr 2021 14:04:47 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i13sm3749245otp.41.2021.04.26.14.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 14:04:46 -0700 (PDT)
Received: (nullmailer pid 4086058 invoked by uid 1000);
 Mon, 26 Apr 2021 21:04:43 -0000
From: Rob Herring <robh@kernel.org>
To: Rajeev Nandan <rajeevny@codeaurora.org>
In-Reply-To: <1619416756-3533-2-git-send-email-rajeevny@codeaurora.org>
References: <1619416756-3533-1-git-send-email-rajeevny@codeaurora.org>
 <1619416756-3533-2-git-send-email-rajeevny@codeaurora.org>
Subject: Re: [v3 1/2] dt-bindings: backlight: add DisplayPort aux backlight
Date: Mon, 26 Apr 2021 16:04:43 -0500
Message-Id: <1619471083.447682.4086057.nullmailer@robh.at.kernel.org>
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
Cc: mkrishn@codeaurora.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, abhinavk@codeaurora.org, kalyan_t@codeaurora.org,
 hoegsberg@chromium.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Apr 2021 11:29:15 +0530, Rajeev Nandan wrote:
> Add bindings for DisplayPort aux backlight driver.
> 
> Changes in v2:
> - New
> 
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>  .../bindings/leds/backlight/dp-aux-backlight.yaml  | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.example.dts:22.38-39 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:377: Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1414: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1470203

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
