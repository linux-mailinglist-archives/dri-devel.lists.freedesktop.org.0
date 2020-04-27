Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A44DE1BBDE4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB196E3B7;
	Tue, 28 Apr 2020 12:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7896E0CB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:36:46 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id re23so13437087ejb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vQTluHrFlTPouGYN0L8RFSa0ut56oC/RfYr17kNASok=;
 b=meKAh8FbBdII7WfsflAdIDuNSKAWExOwNGTQONordCK+iMffZUBH4QRLKIj9g3hUAn
 YdV1IZ903/Ia+CRl7z1QLOG/iAvLvkeIL46dC+N8HcIA085a47xkeVd/d8bh4ILznfGK
 mYG0TqRV+AdXCoDveEOkLJcaLWYYbpZaf7DWgkpl3d7DEzkPG7MzqxCPG++2mTyCXzBB
 hn2CMjRyBXSOLouKFBFwh/GBKSrvfsJlTDDekvK5NO2FzQWaOyfa9p1QwBfW9k21v7U5
 PCHOoFKOplRT4+78hCu4tj17YMcjc4ZIs+YJhSOwjlxGEh0trr1ZwuzG8JMqICaBTnqK
 TpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vQTluHrFlTPouGYN0L8RFSa0ut56oC/RfYr17kNASok=;
 b=ODk3XXaOAU9WtxcOhRqkWTwMlzbQ982neItgMnMK1QFB3lxNe/BbvrOog5KyJCGkz8
 ysX2gijLNKZ+40qpCPixSfbmDT37UE32Nyx6bovSUCq+HcUWNV1zFHOVymC2vfyAlAuA
 Wju4hNpDsANQ6tEkTxx+sHZVpOb/uGbKmpIoAGZziOPflzpWuWnI9yG3oLtBFGv5YMD9
 cXxc5WlM9IUtaRbUSkVsMxqEpwG7E8sPSRSMm1aqVSLkpKIbk+Wyhtb38D2lO2QEoHXz
 JPxeMgEH1UkCjiR0Yrwwrl3ER3Ur/DzVGK6NMrbK0jyoH/XlopZw/C8wrD5SDVcfGb0y
 n5Fg==
X-Gm-Message-State: AGi0PuaEJpioxyz/sqQxtp3L1Pqq4qwTTLtcOSHwPs3+QdddHfrcFjIP
 CM3kAfRk3pzodOQWUYA2XHY=
X-Google-Smtp-Source: APiQypIRUAnXaWz08Q8liiasN60ylITxEvvKR+QbUyjJant5k2FUB9f77S8t1viHZzIbcdXyf4L9nA==
X-Received: by 2002:a17:906:496:: with SMTP id
 f22mr18305568eja.311.1587976604820; 
 Mon, 27 Apr 2020 01:36:44 -0700 (PDT)
Received: from localhost
 (ipv6-80adf4751ff4da96.ost.clients.hamburg.freifunk.net.
 [2a03:2267:4:0:80ad:f475:1ff4:da96])
 by smtp.gmail.com with ESMTPSA id s18sm2810366ejm.63.2020.04.27.01.36.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 01:36:44 -0700 (PDT)
Date: Mon, 27 Apr 2020 10:36:42 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v1] staging: fbtft: fb_st7789v: Initialize the Display
Message-ID: <20200427083642.GD18436@portage>
References: <1586424337-26602-1-git-send-email-oliver.graute@gmail.com>
 <20200409102013.GP2001@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409102013.GP2001@kadam>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 gregkh@linuxfoundation.org, Oliver Graute <oliver.graute@kococonnector.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/04/20, Dan Carpenter wrote:
> On Thu, Apr 09, 2020 at 11:25:32AM +0200, Oliver Graute wrote:
> > From: Oliver Graute <oliver.graute@kococonnector.com>
> > 
> > Set Gamma Values and Register Values for the HSD20_IPS
> > 
> > Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
> > ---
> >  drivers/staging/fbtft/fb_st7789v.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
> > index 84c5af2dc9a0..b0aa96b703a8 100644
> > --- a/drivers/staging/fbtft/fb_st7789v.c
> > +++ b/drivers/staging/fbtft/fb_st7789v.c
> > @@ -17,8 +17,8 @@
> >  #define DRVNAME "fb_st7789v"
> >  
> >  #define DEFAULT_GAMMA \
> > -	"70 2C 2E 15 10 09 48 33 53 0B 19 18 20 25\n" \
> > -	"70 2C 2E 15 10 09 48 33 53 0B 19 18 20 25"
> > +	"D0 05 0A 09 08 05 2E 44 45 0F 17 16 2B 33\n" \
> > +	"D0 05 0A 09 08 05 2E 43 45 0F 16 16 2B 33"
> 
> How do you know this won't break someone else's setup?

Should I declare an extra define for my values?

+#define HSD20_IPS_GAMMA \
+	"D0 05 0A 09 08 05 2E 44 45 0F 17 16 2B 33\n" \
+	"D0 05 0A 09 08 05 2E 43 45 0F 16 16 2B 33"

> 
> Without knowing anything at all about this driver, it feels like this
> should be:
> 
> 	if (new_hardware)
> 		write_reg(par, PORCTRL, 0x05, 0x05, 0x00, 0x33, 0x33);
> 	else
> 		write_reg(par, PORCTRL, 0x08, 0x08, 0x00, 0x22, 0x22);

ok, I'll update this.

Best regards,

Oliver
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
