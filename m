Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 248A82284F9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 18:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE8D6E40C;
	Tue, 21 Jul 2020 16:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0F96E40C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 16:10:02 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id p205so21965790iod.8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5vZnPunGzHzcF0JaBHQsiLzx0dizWC0QJDWGM3L9f5c=;
 b=JP19GPg6++jEUZCrmurtOQQA5K2//WpUpH1TIb9mWXZY8kHZYvJLh9uStkLYe2bOxp
 QwtXMaKqbBQREjn57UX1eaOVe0z/giosTU697qH+XkpVQNv4WVTyANd2ttf0ag7blwWo
 slxhzzQZiFcXM6Wmve3qOtyeECltVXaz5kGeTmlH5ON5e1R9ZOKkXlXYWD+Eno4hYHpi
 7D99N7XdaqizS5fU4GtQBaCTzlUZ3ubQXu64GS1G1JL1V551jyCUUUxif2HSstpDCyg0
 /Jpa3g5cjJ75JZxlc/BYPZuEaIdPaExJBqjS4qOUcZYlISEwDVI10eRb1QXTb7QJWCTe
 AhVw==
X-Gm-Message-State: AOAM533KiSpp4GocuQy2gx04U0WcyOToBHcwC26WBS0DRpZZpGlPMzoR
 iap9sM07XC2YRmSxIMUbcOAzanTtPjb/
X-Google-Smtp-Source: ABdhPJw/GMPRXuRPapKDmiimXNT1feeBi8f4deFqtacLZt7Z7EGOGgBWwTEEUTrlaQ4Q9UqmXfWaCA==
X-Received: by 2002:a6b:7210:: with SMTP id n16mr28740129ioc.177.1595347802108; 
 Tue, 21 Jul 2020 09:10:02 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id d6sm10604898ilq.27.2020.07.21.09.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:10:01 -0700 (PDT)
Received: (nullmailer pid 388371 invoked by uid 1000);
 Tue, 21 Jul 2020 16:09:58 -0000
Date: Tue, 21 Jul 2020 10:09:58 -0600
From: Rob Herring <robh@kernel.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: Re: [PATCH for v5.9] dt-bindings: drm/bridge: Replace HTTP links
 with HTTPS ones
Message-ID: <20200721160958.GA388320@bogus>
References: <20200719174457.60674-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200719174457.60674-1-grandmaster@al2klimov.de>
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
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, linux-kernel@vger.kernel.org,
 krzk@kernel.org, airlied@linux.ie, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 19 Jul 2020 19:44:57 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  Continuing my work started at 93431e0607e5.
>  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>  (Actually letting a shell for loop submit all this stuff for me.)
> 
>  If there are any URLs to be removed completely
>  or at least not (just) HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also: https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See: https://lkml.org/lkml/2020/6/26/837
> 
>  If you apply the patch, please let me know.
> 
>  Sorry again to all maintainers who complained about subject lines.
>  Now I realized that you want an actually perfect prefixes,
>  not just subsystem ones.
>  I tried my best...
>  And yes, *I could* (at least half-)automate it.
>  Impossible is nothing! :)
> 
> 
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.txt         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
