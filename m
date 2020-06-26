Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C48920AF40
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 11:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953996EC50;
	Fri, 26 Jun 2020 09:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5516EC50
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 09:54:09 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 17so8780034wmo.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 02:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=e00BIFKWHJ6YcMg9EPGjuy1Mt05P2nAv4zIuOyB6gn0=;
 b=kinKxjmErW8QqeKv+vwukdSrfKkrbB8o0iVWzRuEXs3OFXf7u6MnH4Kg7U5g0REsV/
 578rsYOmgZeG/fLiyvY8FlLKUXZRVs8qlITYyAo+TY9rQJ3AB44b+px2fXUv1amtwNv3
 dTs/AyEO3EXnqNAdlLk29enj+r+Hul7vvfqB1Bqszyw69P3d5+ZJac7DwFnyxXozNo6W
 bqHkPDFe0+AxafWEWVFftHIHOz8GmAsuI9yvCKRVtTgFM6VZnzXpnl6cVx1zBeHAF4sS
 bNcRZSWzPvjS0Ut+6KDTjatPpElQI6pZt8lmx7mf5yOH7eAnHNyy5nNX41ZWheDmxfi+
 Unnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e00BIFKWHJ6YcMg9EPGjuy1Mt05P2nAv4zIuOyB6gn0=;
 b=abOQa24as8HbqHBZ6D01vsCHK4GDRQ8+1IlqOs0cpRquQPr6lizzkLcH+Lp5Svsv8P
 GS5S3rStonTGYkU8pQY3ygrQmAVvI9DnjJzJvTzAPessVqKecrv/j6RDPVJ0chfgysti
 ppgLJMzU0ACR/uBTVrvPnW2TRbPhPvRxiVgZWKdYFciiXTXvVRTiuxoMnGxNlZ8As6LO
 Y1rvdpGVMlgl7k4j7NVfnSDf8l+KsgJUdhSXr47qkKVHfQAFOdsKr/FYdDKIq2bRvKZe
 eIgchuQLOn7ggmpjYVyqMjMWmRZlgX/AF11phzF7Kjvin7PCctIZy7+f/WkWb72FXzld
 wHZg==
X-Gm-Message-State: AOAM5301rKoirNOScKz54XbNBgLM1fX4conZDwblVVf4h2yoCx9O/cmt
 raRyY26Ltnn+CuXbCRUzQDHKRw==
X-Google-Smtp-Source: ABdhPJydqBupAhWSjmw8CKfQPZw6AA+9m1XpfRrVUZ2xhSaLPXAfZJjn3oquBKDEjAXfIW5EDnmb2w==
X-Received: by 2002:a1c:2982:: with SMTP id p124mr309487wmp.26.1593165248166; 
 Fri, 26 Jun 2020 02:54:08 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id x7sm37219108wrr.72.2020.06.26.02.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 02:54:07 -0700 (PDT)
Date: Fri, 26 Jun 2020 10:54:05 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/8] backlight: ili922x: Add missing kerneldoc
 descriptions for CHECK_FREQ_REG() args
Message-ID: <20200626095405.nzhqsfjegj6qg2ro@holly.lan>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624145721.2590327-4-lee.jones@linaro.org>
 <20200625094051.u4hanl3rycczlwiy@holly.lan>
 <20200625103334.GO954398@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200625103334.GO954398@dell>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Software Engineering <sbabic@denx.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 25, 2020 at 11:33:34AM +0100, Lee Jones wrote:
> On Thu, 25 Jun 2020, Daniel Thompson wrote:
> 
> > On Wed, Jun 24, 2020 at 03:57:16PM +0100, Lee Jones wrote:
> > > Kerneldoc syntax is used, but not complete.  Descriptions required.
> > > 
> > > Prevents warnings like:
> > > 
> > >  drivers/video/backlight/ili922x.c:116: warning: Function parameter or member 's' not described in 'CHECK_FREQ_REG'
> > >  drivers/video/backlight/ili922x.c:116: warning: Function parameter or member 'x' not described in 'CHECK_FREQ_REG'
> > > 
> > > Cc: <stable@vger.kernel.org>
> > > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > > Cc: Software Engineering <sbabic@denx.de>
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  drivers/video/backlight/ili922x.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
> > > index 9c5aa3fbb2842..8cb4b9d3c3bba 100644
> > > --- a/drivers/video/backlight/ili922x.c
> > > +++ b/drivers/video/backlight/ili922x.c
> > > @@ -107,6 +107,8 @@
> > >   *	lower frequency when the registers are read/written.
> > >   *	The macro sets the frequency in the spi_transfer structure if
> > >   *	the frequency exceeds the maximum value.
> > > + * @s: pointer to controller side proxy for an SPI slave device
> > 
> > What's wrong with "a pointer to an SPI device"?
> > 
> > I am aware, having looked it up to find out what the above actually
> > means, that this is how struct spi_device is described in its own kernel
> > doc but quoting at that level of detail of both overkill and confusing.
> 
> I figured that using the official description would be better than
> making something up.  However if you think it's better to KISS, then I
> can change it.

Yes, I'd strongly prefer KISS here.

I know it is an "I am the world" argument[1] but I found using such a
dogmatically accurate description out of context to be very confusing
and therefore I don't think such a comment improves readability.


Daniel.


[1]: See #3 from http://www.leany.com/logic/Adams.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
