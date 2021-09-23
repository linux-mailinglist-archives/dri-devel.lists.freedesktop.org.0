Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C412416033
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 15:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2346ED25;
	Thu, 23 Sep 2021 13:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4606ED25
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 13:43:30 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id w29so17295604wra.8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 06:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4vvUL3e0KnaoXbHygff1j5G+RP+eVvUFadYzHbYM5yg=;
 b=bJ/9dqxYZ+yDeJTQt2kNS4H2m8IPsSvr9qIFTk33V/6+ygT7/5ahVdLEEZZSShC60o
 MiOTpF9eTEClXfv+gm+DVrZ0z+iec6EG+gat7i0Pq0zMXe54QqEzadUAZpOxEV9nqCOu
 gHIQ0ZGhiDk5ccIVm07xCff/D6+VdOO2mBmy7KHNqBcXdnHEk0HhkUyH+MgTJGhBcSOU
 hX/HkVPy1WmOzUtMSV8N1MdYMMEfYPQhqvXj0BJMBRU91ov0UAkO20oemTFKzBw0UhvV
 CctiqQi+Pr4MKa4Nq3NFkHA+ozl5LK8uqW4szRAzXmP2B44jyAurEvNnQvsbpmnGZnoi
 MzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4vvUL3e0KnaoXbHygff1j5G+RP+eVvUFadYzHbYM5yg=;
 b=smbJIGq1XS2Xc4G+TPC0Wlr3UlS0i9GODqqyXXGWkyt4PefLVpNw5gCOwgPDwi/PBu
 IOMfAzzgOjmRpr3Z5BcX9i0DepA3iBlsKzRaHYrHdKDWtG/87CIm0I3ROIqYOr+vZ1+B
 9CXBbCzBc8WtdUy05IvZUMbGdFajoPu+KcxroF9/HxuKy0FTZb5rqrEPi/Y6aqCBUg2s
 6Bjn/Jm5CKFUYXguI46DsCnxPG/TFn40wDxGNjFT4aDiper44Eo6KT4mkQ1fhr+1T/pX
 Z4e9gFGb9hdTNk3AA9HyVkROKmIJSaA28KumTal+zoGndClGeNkr6AM4fRq4evPOYn/+
 3nTg==
X-Gm-Message-State: AOAM5334M/CdX0oA7yfoLi2vf8xT33IRpS84tyi2KjxRHiFOd99dYyFW
 TfHFnBCd3xOxwhgB9KDXew1OsQ==
X-Google-Smtp-Source: ABdhPJyi3UZLScn4v2Ctypt2vtJmPaKpW9SI96CZeGRqpPXO1oNgQczRmKbml0MnljOLuNSCK8caQA==
X-Received: by 2002:a5d:5042:: with SMTP id h2mr5145969wrt.57.1632404607073;
 Thu, 23 Sep 2021 06:43:27 -0700 (PDT)
Received: from google.com ([95.148.6.233])
 by smtp.gmail.com with ESMTPSA id a3sm5435583wrt.28.2021.09.23.06.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 06:43:26 -0700 (PDT)
Date: Thu, 23 Sep 2021 14:43:24 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] backlight: propagate errors from get_brightness()
Message-ID: <YUyEfDJZT0hr5nI4@google.com>
References: <20210907124751.6404-1-linux@weissschuh.net>
 <YUxNczBccLQeQGA5@google.com>
 <4bb3051e-2550-43c3-afed-d4b00850126e@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bb3051e-2550-43c3-afed-d4b00850126e@t-8ch.de>
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

On Thu, 23 Sep 2021, Thomas Weißschuh wrote:

> On 2021-09-23T10:48+0100, Lee Jones wrote:
> > On Tue, 07 Sep 2021, Thomas Weißschuh wrote:
> > 
> > > backlight.h documents "struct backlight_ops->get_brightness()" to return
> > > a negative errno on failure.
> > > So far these errors have not been handled in the backlight core.
> > > This leads to negative values being exposed through sysfs although only
> > > positive values are documented to be reported.
> > > 
> > > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > > ---
> > > 
> > > v1: https://lore.kernel.org/dri-devel/20210906215525.15418-1-linux@weissschuh.net/
> > > 
> > > v1 -> v2:
> > > * use dev_err() instead of dev_warn() (Daniel Thompson)
> > > * Finish logging format string with newline (Daniel Thompson)
> > > * Log errno via dedicated error pointer format (Daniel Thompson)
> > > 
> > >  drivers/video/backlight/backlight.c | 22 +++++++++++++++++-----
> > >  1 file changed, 17 insertions(+), 5 deletions(-)
> > 
> > Applied, thanks.
> 
> Hi Lee,
> 
> thanks!
> 
> Also I'm sorry about my nagging before.

No worries.

> I was not aware you were on vacation and saw you respond to other mails.

They were in the queue before this one.

I had hundreds of emails to get through on my return!

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
