Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5785032F626
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 23:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735D06EC79;
	Fri,  5 Mar 2021 22:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFA36EC79
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 22:54:47 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id m25so4243570oie.12
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 14:54:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YmJy9RHCJy3uQpyMxegFKyRBZmNkXavxc/ygHGcpB/Q=;
 b=A6h+7X+6Uf+/4t3IxmBs3LTwwMuzqfXtQzYDV7wo+oTm6slmxa0MWHvuBbCWkubGir
 ZJiITfwbo4JPLd/UCJ5MNZ2yBA6Qbm8Tf6vsPrl1bFXN1KQzUjT9oFqORJtWFXFMmr0k
 K2EmVi0mj8ruxDKKuKK1xafeW4mVx4mfnToNTYr33vtFAqiYfQlRiqTi5FDXrMMCW344
 p7JFowVMrM7U4XfLajYyrqYjajv84An+bg/IJiNEwHUJFzn3IoSROMGkpd0SkdqVfBiw
 ZFK4zKXmV2oCZX/hLHpZTedcvJQjQ4FasWyk6I4VFh3xGlT/F/QrRELvgiY4DoIP43F2
 HkBQ==
X-Gm-Message-State: AOAM533oMoE5Q4HQvFX+f1eouN4NadLr4Kv9264hxjL0W4Chgi9GIfPm
 dIG+bbYDzkVHZDuRzjCVvw==
X-Google-Smtp-Source: ABdhPJwgqxdxeG3gLvugwUTSgjpNpEvow3sM8VSthPlMcISqgz/neBTZry3GPD1+z9Sob/oL1Ma0uw==
X-Received: by 2002:aca:ad02:: with SMTP id w2mr8911700oie.143.1614984887139; 
 Fri, 05 Mar 2021 14:54:47 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i3sm926972otk.56.2021.03.05.14.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 14:54:46 -0800 (PST)
Received: (nullmailer pid 793356 invoked by uid 1000);
 Fri, 05 Mar 2021 22:54:45 -0000
Date: Fri, 5 Mar 2021 16:54:44 -0600
From: Rob Herring <robh@kernel.org>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [PATCH 4/9] dt-bindings: display/panel: add Jenson JT60245-01
Message-ID: <20210305225444.GA792026@robh.at.kernel.org>
References: <20210218225458.823773-1-giulio.benetti@benettiengineering.com>
 <20210218225458.823773-5-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210218225458.823773-5-giulio.benetti@benettiengineering.com>
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
Cc: devicetree@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Palmer <daniel@0x0f.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Lubomir Rintel <lkundrak@v3.sk>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, allen <allen.chen@ite.com.tw>,
 Max Merchel <Max.Merchel@tq-group.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sam Ravnborg <sam@ravnborg.org>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 18, 2021 at 11:54:52PM +0100, Giulio Benetti wrote:
> From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> Add DT binding for "jenson,jt60245-01".
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 08afd6501094..fd0d2a573350 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -169,6 +169,8 @@ properties:
>        - jenson,jt60248-01
>          # Jenson Display JT60249-01 5" (800x480) TFT LCD panel
>        - jenson,jt60249-01
> +        # Jenson Display JT60245-01 7" (800x480) TFT LCD panel
> +      - jenson,jt60245-01

It was going so well. Alpha-numeric order please.

>          # King & Display KD116N21-30NV-A010 eDP TFT LCD panel
>        - kingdisplay,kd116n21-30nv-a010
>          # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
