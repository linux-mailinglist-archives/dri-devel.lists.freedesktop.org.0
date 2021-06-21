Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF373AE849
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 13:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC13189DFB;
	Mon, 21 Jun 2021 11:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B39389DFB
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 11:41:57 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so10510988wma.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 04:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DaXulPBTPL9u5MFTn3K/5r+5fkI2NXf7vuuT8zNWvU4=;
 b=MFcLKXwlro4GFxU2xiNWqSqBqzohDuy7UxT1eGY4HP91ZA+xSw+cllZqUjalFK+jGR
 mtrNlzENAWzge4UICMdRY01qgjBN6GIVFS7fBSoQZA7yQnRvZOfqr0+u4lsHk2+bLyaA
 T6uqHGCUs2JLNuDZQvqG/H/Q0i1yTYPxUNzDnRlTsnX61ZvjoJKRw9tHLJE0y298st+P
 JDgd7KdKJCxD28hDvY2B7QXo4tPvrbUZ/hKw6Qeroj4KyoPRSF6j7Xm0kRvwtUem6jjM
 QxBpx6xuicCo7cFA4EWR4AxvBu7pg7MefuMJgk2ptCCaCJ4clzkIAX8Nkozbqql26FAM
 EOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DaXulPBTPL9u5MFTn3K/5r+5fkI2NXf7vuuT8zNWvU4=;
 b=EgjwDzjMhVUnkAYbeKXQbJqOgBClvYeewGlY6RvCicVORRrk/FL43vBe2X+2ssacr/
 BSrF3aLYgcF47ji1T5GmY/uNwyhew2GRymkz/uxw+ub+0feW6b1ZSMGC+uZQvyrV7slf
 j4RjfNzUgER+YRyQ4pycvc1OJQtM/0LtX9ggmR5s/rQ3ISoAJKZ0z3LPY/xcsJkAVlzU
 KNorkki9/lWwSMSRfSHJsmekfNeKrFqRdRao/TxIgShpDApH+ZkfBuujOsZ8mi2ckaQl
 KisZ7v3IE9yyju7vfZBs7mC6ICkkfOOZCm00TuRBKuKu2U+24lhJAuK7cABIiW9Mifdj
 jb8w==
X-Gm-Message-State: AOAM531JrSPPBfBrkD2baQlf+XwYHW77/nwPRnBLBJf5v7TlP3dKqOdb
 qmKBb3sbPGPSAJUgortEzdZjbA==
X-Google-Smtp-Source: ABdhPJw80ECoMJiUu4h1kyUH0DdbCSQayz7j+0/CmynOfR2sPAfIA2tYvKtdQoEgI21Oz3HbKQ9zSw==
X-Received: by 2002:a1c:c90c:: with SMTP id f12mr11667719wmb.80.1624275715786; 
 Mon, 21 Jun 2021 04:41:55 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id q19sm18910431wmc.44.2021.06.21.04.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 04:41:55 -0700 (PDT)
Date: Mon, 21 Jun 2021 12:41:53 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 1/2] backlight: lm3630a: fix return code of
 .update_status() callback
Message-ID: <20210621114153.jg5hll46xj2unin5@maple.lan>
References: <20210620193928.14467-1-u.kleine-koenig@pengutronix.de>
 <20210621102351.45m2oznsmg5nfv6t@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210621102351.45m2oznsmg5nfv6t@maple.lan>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 11:23:51AM +0100, Daniel Thompson wrote:
> On Sun, Jun 20, 2021 at 09:39:27PM +0200, Uwe Kleine-König wrote:
> > According to <linux/backlight.h> .update_status() is supposed to
> > return 0 on success and a negative error code otherwise. Adapt
> > lm3630a_bank_a_update_status() to actually do it.
> > 
> > While touching that also add the error code to the failure message.
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> Thanks for this!
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Sorry... looks like I was a little hasty here.

As mentioned in https://marc.info/?l=linux-fbdev&m=162427245024751&w=2
when lm3630a_bank_b_update_status() needs similar fixes.

Just wanted to put something in the ML record so Lee doesn't pick this
patch based on my R-b above...


Danieo.


> 
> 
> Daniel.
> 
> 
> > ---
> >  drivers/video/backlight/lm3630a_bl.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> > index e88a2b0e5904..16a2658a72e1 100644
> > --- a/drivers/video/backlight/lm3630a_bl.c
> > +++ b/drivers/video/backlight/lm3630a_bl.c
> > @@ -190,7 +190,7 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
> >  	if ((pwm_ctrl & LM3630A_PWM_BANK_A) != 0) {
> >  		lm3630a_pwm_ctrl(pchip, bl->props.brightness,
> >  				 bl->props.max_brightness);
> > -		return bl->props.brightness;
> > +		return 0;
> >  	}
> >  
> >  	/* disable sleep */
> > @@ -210,8 +210,8 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
> >  	return 0;
> >  
> >  out_i2c_err:
> > -	dev_err(pchip->dev, "i2c failed to access\n");
> > -	return bl->props.brightness;
> > +	dev_err(pchip->dev, "i2c failed to access (%pe)\n", ERR_PTR(ret));
> > +	return ret;
> >  }
> >  
> >  static int lm3630a_bank_a_get_brightness(struct backlight_device *bl)
> > 
> > base-commit: 6efb943b8616ec53a5e444193dccf1af9ad627b5
> > -- 
> > 2.30.2
> > 
