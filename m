Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99BD7CE096
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 17:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC37410E121;
	Wed, 18 Oct 2023 14:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF83C10E121
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 14:59:53 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6c7c2c428c1so3927698a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 07:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697641193; x=1698245993; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sHyZ+387T3oqeq7HqyYoKhzeb1fsbRphT6DeM11cMrU=;
 b=QTcSa97P44e8qk9H8uO3vmYqFuLE9XskxVsyp5KG6PwYuimXkPL7feWxACMz+ueNAm
 DqpfCgnUectsQOEXIHXKd5G1+m82xA4zFh4g+M9ofGvzwocYC3qVw5NbJ2ENzYYHMkKq
 GUk4UjHV/wFE6umGvYSbwL05wG0M+9X4TeObBf1Q6tA/3aJ7NCLL97/6zC4UfZSjh9iS
 hrHPLGBCpnIcfF0JWYDJ2veLtZBQ57wMWSI6v/WJkAiCPAT3tUPIu80fqxwvx2Il5u4r
 HiKwruvTenTLengzGxS3WhdNKtcnjQdQGVcNX4Gx3wmQvXLKNOypnDEkbY/Me81/6XH3
 RFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697641193; x=1698245993;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sHyZ+387T3oqeq7HqyYoKhzeb1fsbRphT6DeM11cMrU=;
 b=S2gBDLv0tLiYtF3HsYX9UOm15QfbOCQv+1eYBhh1oZQcbZa+duZnacBPDskmDw85eQ
 khu8vqQUqI/v+L+qAImBxGTznxXKw6VYrJTaL8nYet/1sbJKe4c8PVMMyGgMT3QPZ8Fq
 s3ld1dtiCMcplRSvFfmakTgq/1OxMPcHZ2BufyC8WXJlp/f0lTb2yzbpu/6DQQRDolc5
 7eO0GYV+3269XqwiSAso2NRfsbD1TvmRYkCZ+VBqVb5rDcHuIz4mr42qJGollKgI5azm
 JkXNJDeprc0PUQaRHMQBFnDvlIag/hv1lztWx0N+C2iwpmgmkDxrxpST1RIEqDGZVsxL
 Lt8g==
X-Gm-Message-State: AOJu0YzesHG5AvEue5Oez/Aqu7ECpyUKST0hMTs3BMr/6UgLdkKIsPNY
 4bdo9NGbuUmcpCOMHv1cYfs=
X-Google-Smtp-Source: AGHT+IEzA71SI0QmQIR3m82OpQngFmOKztXN6e8Mqg3eyX7M+EodNAtDriB1JpnpL66F+ts/JJJhBw==
X-Received: by 2002:a05:6830:92a:b0:6c4:6af2:ea72 with SMTP id
 v42-20020a056830092a00b006c46af2ea72mr2634754ott.3.1697641192840; 
 Wed, 18 Oct 2023 07:59:52 -0700 (PDT)
Received: from neuromancer. ([75.28.21.198]) by smtp.gmail.com with ESMTPSA id
 g8-20020a056830308800b006bf0f95f702sm652980ots.64.2023.10.18.07.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 07:59:52 -0700 (PDT)
Message-ID: <652ff2e8.050a0220.2e2de.4666@mx.google.com>
X-Google-Original-Message-ID: <ZS/y5yxqg4QE2QNH@neuromancer.>
Date: Wed, 18 Oct 2023 09:59:51 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
Subject: Re: [PATCH 1/1] drm/panel: st7703: Pick different reset sequence
References: <20230211171748.36692-1-frank@oltmanns.dev>
 <20230211171748.36692-2-frank@oltmanns.dev>
 <ZSvf0HIA3GaZlbac@qwark.sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZSvf0HIA3GaZlbac@qwark.sigxcpu.org>
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
Cc: Ondrej Jirman <megous@megous.com>, Purism Kernel Team <kernel@puri.sm>,
 Samuel Holland <samuel@sholland.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Frank Oltmanns <frank@oltmanns.dev>, Thierry Reding <thierry.reding@gmail.com>,
 Ondrej Jirman <megi@xff.cz>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 15, 2023 at 02:49:20PM +0200, Guido Günther wrote:
> Hi,
> On Sat, Feb 11, 2023 at 06:17:48PM +0100, Frank Oltmanns wrote:
> > From: Ondrej Jirman <megi@xff.cz>
> > 
> > Switching to a different reset sequence, enabling IOVCC before enabling
> > VCC.
> > 
> > There also needs to be a delay after enabling the supplies and before
> > deasserting the reset. The datasheet specifies 1ms after the supplies
> > reach the required voltage. Use 10-20ms to also give the power supplies
> > some time to reach the required voltage, too.
> > 
> > This fixes intermittent panel initialization failures and screen
> > corruption during resume from sleep on panel xingbangda,xbd599 (e.g.
> > used in PinePhone).
> 
> Thanks, applied to drm-misc-next.
> Cheers,
>  -- Guido

Thank you. Probably too late, but this fixes problems I have with a
different ST7703 based panel.

Tested-by: Chris Morgan <macromorgan@hotmail.com>

> 
> > 
> > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> > Reported-by: Samuel Holland <samuel@sholland.org>
> > ---
> >  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 25 ++++++++++---------
> >  1 file changed, 13 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> > index 6747ca237ced..45695aa51f62 100644
> > --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> > +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> > @@ -411,29 +411,30 @@ static int st7703_prepare(struct drm_panel *panel)
> >  		return 0;
> >  
> >  	dev_dbg(ctx->dev, "Resetting the panel\n");
> > -	ret = regulator_enable(ctx->vcc);
> > +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > +
> > +	ret = regulator_enable(ctx->iovcc);
> >  	if (ret < 0) {
> > -		dev_err(ctx->dev, "Failed to enable vcc supply: %d\n", ret);
> > +		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n", ret);
> >  		return ret;
> >  	}
> > -	ret = regulator_enable(ctx->iovcc);
> > +
> > +	ret = regulator_enable(ctx->vcc);
> >  	if (ret < 0) {
> > -		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n", ret);
> > -		goto disable_vcc;
> > +		dev_err(ctx->dev, "Failed to enable vcc supply: %d\n", ret);
> > +		regulator_disable(ctx->iovcc);
> > +		return ret;
> >  	}
> >  
> > -	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > -	usleep_range(20, 40);
> > +	/* Give power supplies time to stabilize before deasserting reset. */
> > +	usleep_range(10000, 20000);
> > +
> >  	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> > -	msleep(20);
> > +	usleep_range(15000, 20000);
> >  
> >  	ctx->prepared = true;
> >  
> >  	return 0;
> > -
> > -disable_vcc:
> > -	regulator_disable(ctx->vcc);
> > -	return ret;
> >  }
> >  
> >  static const u32 mantix_bus_formats[] = {
> > -- 
> > 2.39.1
> > 
