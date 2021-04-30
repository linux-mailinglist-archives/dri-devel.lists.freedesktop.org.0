Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DC73701D4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 22:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490F26F5B8;
	Fri, 30 Apr 2021 20:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA916F5B8
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 20:10:57 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id m13so71143169oiw.13
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 13:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TQ39G9eWDsOl7sqJoYVutkae5eYvscnE8x+ZtLW1WuU=;
 b=BKasSct8QXdIBpiNA/PaV+ZxC5MJtexzW64bb/9V/QPxrA+wph+nhTW4x7iPW1TG33
 EFiswaDiwCpIWjuapWzCGOXpaC5vPhCdyuwuG0xUBcOH/SueX1ffWbFxVS1AvuQcEfKG
 hfRWQLKOTjDNgTzARsRhV7yj+3NaiqOW5LCBrAQ2GsVuV28Eu0MJ4zqFirNaKeIg5iuT
 xtSwsGTAxFdOjXcGeGfCLGcQBNFGtNx0MzEZqy9CWYuQ8OQTGbHuTFwMTi++ZH7kGBgR
 0yPGJOgqOqEFDGd+45eJBYdFWO4CQcuzNtmUxRSYKRZrBu0+879OB1xK4nx1YZSlaIiO
 prkA==
X-Gm-Message-State: AOAM530i0hqwH+FolQPDhi2hwU9Btps7ZCNtBMMs0E7EdkAOhQ/s5jHr
 5/6EAUTvlx/Tv+M/r//YTA==
X-Google-Smtp-Source: ABdhPJyUY7X2RUi39DJ7DAkgG1ZZWRwUThEejPKruSWn2yZoGsiWv4NM6qjHAXTs3lUPU1MrBlUdFw==
X-Received: by 2002:aca:5a45:: with SMTP id o66mr12542922oib.121.1619813456838; 
 Fri, 30 Apr 2021 13:10:56 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c7sm966221oot.42.2021.04.30.13.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:10:55 -0700 (PDT)
Received: (nullmailer pid 3805175 invoked by uid 1000);
 Fri, 30 Apr 2021 20:10:54 -0000
Date: Fri, 30 Apr 2021 15:10:54 -0500
From: Rob Herring <robh@kernel.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [RESEND PATCH v6 3/4] mfd: rt4831: Adds DT binding document for
 Richtek RT4831
Message-ID: <20210430201054.GA3805118@robh.at.kernel.org>
References: <1619421491-31494-1-git-send-email-u0084500@gmail.com>
 <1619421491-31494-3-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1619421491-31494-3-git-send-email-u0084500@gmail.com>
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
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org, robh+dt@kernel.org,
 b.zolnierkie@samsung.com, jingoohan1@gmail.com, lgirdwood@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, linux-fbdev@vger.kernel.org, broonie@kernel.org,
 pavel@ucw.cz, lee.jones@linaro.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Apr 2021 15:18:10 +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Adds DT binding document for Richtek RT4831.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> Resend this v6 patch series to loop devicetree reviewers.
> ---
>  .../devicetree/bindings/mfd/richtek,rt4831.yaml    | 90 ++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/richtek,rt4831.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
