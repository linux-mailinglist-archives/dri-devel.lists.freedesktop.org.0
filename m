Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CAE419505
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 15:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8AB6E853;
	Mon, 27 Sep 2021 13:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011ED6E853
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 13:24:20 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id x20so7270423wrg.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 06:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OkkBF2SlX+njMQCGOaxP8J7y/Zo+1AhEwVAoMOgNgus=;
 b=X95qVHjaPG6lAZB2Tp+Aiz7+YYAoEJ3daxMAt9XtWYjWkL8qrArnnhwkMs4NV85tOR
 cSgMYAqsjqWZWii73hdROKw3T72lvLKktHTJQ6GMU3Riqvw6VQt+3sKodxLvVfBvj0Gg
 GCUUalNfH4YSvZPedoq0A4WBrKWI/fCjLcKVT9EbA4JxuzD0tiGdEjoOD/lpgZUGHPhQ
 AIoZdiZ89CWK5fd5+GmaVw5VNPgSwLzQBWw9VQUGE21b1p+jXO4335rpcMLhPUG19+U5
 jtGvLStoCNW+gWlViA9rUyBxRnYaX6otQd9QkhI2ASo6BEzdZ4eNd/VhM0+SpRJx3gQS
 PaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OkkBF2SlX+njMQCGOaxP8J7y/Zo+1AhEwVAoMOgNgus=;
 b=sqpS6IcyyfNGbiH53RkfJY92Dp+p0UAGvUTTb82PTFfOHr/8pfXgnqE7IgBMosyUJ8
 Bc13b4WwvJS/R+zdYDTs93em9mIohWLdMDHIVZnrN4xRIzTTIiS6uF3fA1hl2n/wvjCj
 o/cLam7H60fJa9we3FSkYySU9rxx0elPbqZ/tdOlKBYxXRGDS6+je3BasSNq1Ru+su5O
 6LehMFSyOz6tYOo/5mszqobgYxBv1/6FOIKz1u9XWDKGTWuxasMjm+dbGA4GGxnOFZol
 HHsZxu+vh7sSqSzxz1WJrom0B5dxVCisadXwIfMt6scPY8ShkZo6TQiNCNex6+hYBjwV
 wAjQ==
X-Gm-Message-State: AOAM533JQCGL0VINFJYW5THXFjavjBde4/YOLO5/wdEHMiE9pRr26+Ac
 bWL1fLptkcNj5Gujqnrr0X2ZOA==
X-Google-Smtp-Source: ABdhPJwLQrVP4WcPhnxQL3ff/ESGiz5vY/YpE8RavLA8oOM8oKiwVP1Gg3FXEPY+lFhh3FIo3vX20A==
X-Received: by 2002:a5d:510b:: with SMTP id s11mr27352481wrt.79.1632749059438; 
 Mon, 27 Sep 2021 06:24:19 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id y7sm1680146wmj.37.2021.09.27.06.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 06:24:19 -0700 (PDT)
Date: Mon, 27 Sep 2021 14:24:17 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] backlight: hx8357: Add SPI device ID table
Message-ID: <20210927132417.lixg3ojhnwlleht3@maple.lan>
References: <20210922151014.49719-1-broonie@kernel.org>
 <20210927094200.a7d73sl2k4x5xjch@maple.lan>
 <20210927114727.GB4199@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927114727.GB4199@sirena.org.uk>
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

On Mon, Sep 27, 2021 at 12:47:27PM +0100, Mark Brown wrote:
> On Mon, Sep 27, 2021 at 10:42:00AM +0100, Daniel Thompson wrote:
> 
> > Based on this I had expected to find spi_get_device_id() and a ->driver_data
> > somewhere in this patch.
> 
> > Where will this .driver_data be consumed? 
> 
> It will never be consumed unless someone writes a board file - the
> runtime match will still happen based on the DT compatible, this is only
> there for the modalias.

Ok... so I'm not going mad.

In that case what is the point of including unconsumed driver data? Most
DT centric drivers that included this for modalias reasons leave it
NULL.

I reviewed quite a few drivers this morning and I haven't seen a single
one that includes unreachable driver data in this manner. Unless there's
a good reason I'd prefer backlight to follow the prior art!


Daniel.
