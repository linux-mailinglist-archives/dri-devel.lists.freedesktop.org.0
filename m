Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7370227567
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 04:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FA26E17F;
	Tue, 21 Jul 2020 02:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A1A6E175
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 02:10:51 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id y2so19765308ioy.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 19:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tYsP4V1SUj+7wnz/5rxYaGFYfj8VWJ5SvCfnjHlpT0o=;
 b=iieC4a8nY/1laWGUV5MyNhggOznCTuLf0M0TFuUdd4fV1f9LnCoqx3VPDowlJsqcmz
 RCN600LwUgFwn/PZouqYsLyD1FCyv87gaDfZTYsrKKkjDMWHi0BqL2Xu2G3KsWerMvpW
 v1pQBEkLUBxUnD0dCiNA/nWxVyTEyxmLOsODE494aEpDb9wyco1Sj51wyILC2mHi359x
 4N6IubamliWEfZwjtia90Ia8842gg4L1eaD7kiei2dWuJ4fwSKFY1bZNfyG8NZuMlOx+
 9yrhB1vBvoyYAnMyt4jx0lDOa1Hutsqr7DJWdm3oNNbINfvkbTQRj9xKeIPjLVfiz7Td
 18Uw==
X-Gm-Message-State: AOAM530uj+Io1wDdTiSL4h/bCpNjo22QkPwj6+vbrxezpU1LfQ+83IRj
 blxAdLcVRzSvOifNivz2ng==
X-Google-Smtp-Source: ABdhPJzyDAbDfMw1LYrqe/3mIzRA1pgLV9u86hXuncaTyOc9EHaatv5II0wRnco3FxckodBb/3eBDw==
X-Received: by 2002:a5e:8f4b:: with SMTP id x11mr24467381iop.90.1595297450479; 
 Mon, 20 Jul 2020 19:10:50 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id k21sm468811iok.10.2020.07.20.19.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 19:10:49 -0700 (PDT)
Received: (nullmailer pid 3387441 invoked by uid 1000);
 Tue, 21 Jul 2020 02:10:48 -0000
Date: Mon, 20 Jul 2020 20:10:48 -0600
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: arm: sunxi: Add compatible for MSI
 Primo73 tablet
Message-ID: <20200721021048.GA3387398@bogus>
References: <20200714071305.18492-1-wens@kernel.org>
 <20200714071305.18492-4-wens@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714071305.18492-4-wens@kernel.org>
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
Cc: Siarhei Siamashka <siarhei.siamashka@gmail.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Jul 2020 15:13:03 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Document board compatible name for MSI Primo73 tablet.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
