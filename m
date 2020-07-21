Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD022284F6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 18:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663CC6E35F;
	Tue, 21 Jul 2020 16:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AD16E35F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 16:09:38 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id h16so16874911ilj.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MAFnSJ9nfMA+aM1fdOKhLqLRIwC/D6r6rOu7Wq8LJQU=;
 b=nq8efa6NLtzmhWxf6tA9cSJFnc3ZhcKHQRtAj47Ud8WGnArLGGDU6shHEC2MalBIds
 F2OmnWOjTmHAdjjSNMLn3AVqrLZjRNapsltaa+UUPT14V2lEabTYMrW3/VUSg2ymCVzs
 7nXk+/sr2+l2Bv0b/XCUUfv9j+yCZmrJTdg+QNcYtXxnRHmM4TnKIY8g9R4lnS6Br1pC
 QI/GUDkbiI2KuyH0rmMkpDkUpwQQMy2SQGOM9cRRyDx3jidmcadxWNA3SgYjmvlyiPGP
 4DWtj859xY6VExn79aaxNe+mpO/d1yh4DzMRL0NE+9c69ZoC9tvyRNju1cryy0OhUPsT
 CeLQ==
X-Gm-Message-State: AOAM532K+aW0t1g5RDQ2U3j0ulk4K35qN1Dh4y3EaQcP2Ot6vR7Dk7PP
 ckQguiNSHd7AQGs+O5VXBA==
X-Google-Smtp-Source: ABdhPJz0uCodnN2b+0uHsM5KcqfLRxa9mPLd8qxPeebl+S3wN2JyK2Dag3ihJB+mmf/jI3cqcRZxNA==
X-Received: by 2002:a92:d308:: with SMTP id x8mr28150239ila.3.1595347778144;
 Tue, 21 Jul 2020 09:09:38 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id e21sm11034941ioe.11.2020.07.21.09.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:09:37 -0700 (PDT)
Received: (nullmailer pid 387737 invoked by uid 1000);
 Tue, 21 Jul 2020 16:09:35 -0000
Date: Tue, 21 Jul 2020 10:09:35 -0600
From: Rob Herring <robh@kernel.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: Re: [PATCH for v5.9] drm/tilcdc: Replace HTTP links with HTTPS ones
Message-ID: <20200721160935.GA387686@bogus>
References: <20200719172438.60536-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200719172438.60536-1-grandmaster@al2klimov.de>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, tomi.valkeinen@ti.com,
 jsarha@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 19 Jul 2020 19:24:38 +0200, Alexander A. Klimov wrote:
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
>  Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
