Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5089094D308
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 17:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D17410E94B;
	Fri,  9 Aug 2024 15:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qYmxTnsy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9348710E94B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 15:13:11 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5af51684d52so2509515a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 08:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723216390; x=1723821190; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BpX0PmRMIOMosOFUpPOvs2TSQ8WjI+Sk8T/asQuu3RM=;
 b=qYmxTnsyy45Qhx/5FR58Huxkr2Quwg8p3qHZmDqhsFO09T1+x9n1tdxcK7nSrGsGqq
 LmxKbtRA8qH/J4ofXnqTh4gkzSgBXbdm7d7ZwebLtuh6n8mw5DEAKeLlK+/8R0p3BQuU
 MS165Yj9cYU6fqY4bUJC4N7uyCzwtCULvn1YkvtiuC0+kaczPeXNfMiXJJ0So5lBjT5x
 hQJjp+JoCARVEFCOYEwE0LMkPLHNqPYqoiyzCzWRZgeUh/MlF8D+eOMh59R6q8HJ7c0L
 Agis6cJKl2bCv51yRLUHKTXiuvC0ZP2BaQgjfvH3xpEfwaY5bBX0gN6mMiaxnOGP+LVC
 Gong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723216390; x=1723821190;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BpX0PmRMIOMosOFUpPOvs2TSQ8WjI+Sk8T/asQuu3RM=;
 b=oYni2cy6NWNKkbsy/pgrB/eon+QN9PCsZJAtCr4CcApywV7yRIJ/e3QkJnee/Eh/mV
 XPa2uXG/Dfy35VkfqNQSWKZ8z68Yh4afuNhmyLKGcHP5zqXyXkfayKxTS4KlZ0LFJWVd
 0BW1fbBf11Zdli8z283by1weBrTUTv6ClT8DlM8VP/+Bs+fUBB9rKh79wMW/DqsLSHYw
 1skMWB4+tXHt8tQuyRySTKTUfD3zBhDMT6kGKnUaoZWexOYLMo60APq64drWJYs9ijVg
 fXAeLX3erkVaNtzWyPb2307ctJzsYtKp24QEG8sZMdty/ObM+FakaK7yypHiUPVucmiZ
 nUcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgVT7i5JalGgA1SItOIyVFaIGJqbrNpovcmHWIvDYR1kGhNvM7iLyCMN6L5B/LCMgsHzHLk+srN/QRZiZm1XRQWzhqlxnoGaCiFpsOjr5o
X-Gm-Message-State: AOJu0YxIgJMfi3qdgdbK7AWBuPiT/ur0Jd7ywY3cU7F8NXIqGpObGfHW
 2T78z13/9rx6T1s6n87bTHZ/uYPnmodN0KV6rrKU3TnWDr2i1GlXzmxLjIoKvSI=
X-Google-Smtp-Source: AGHT+IEBThtubQZ1lg4fjJJt14Xg/AU44Rj0pn1BDb2spFYMlZm36ap+IHP9bae5VVVd9msuHZFx7A==
X-Received: by 2002:a17:907:9604:b0:a7a:ab1a:2d65 with SMTP id
 a640c23a62f3a-a80aa67ae2cmr145636166b.67.1723216389708; 
 Fri, 09 Aug 2024 08:13:09 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c615f3sm852578166b.94.2024.08.09.08.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 08:13:09 -0700 (PDT)
Date: Fri, 9 Aug 2024 18:13:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev: omapfb: panel-sony-acx565akm: Simplify
 show_cabc_available_modes()
Message-ID: <08fab5a3-4a6c-442c-98f9-672c5afc3609@stanley.mountain>
References: <91fc9049558a4865d441930c8f4732461f478eca.1723110340.git.christophe.jaillet@wanadoo.fr>
 <aa43c1f8-05bc-4edd-b7ba-474953f28f5c@stanley.mountain>
 <7b65dbd8-1129-4fcc-97ba-43400fc98e31@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b65dbd8-1129-4fcc-97ba-43400fc98e31@wanadoo.fr>
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

On Fri, Aug 09, 2024 at 05:09:28PM +0200, Christophe JAILLET wrote:
> Le 09/08/2024 à 16:42, Dan Carpenter a écrit :
> > On Thu, Aug 08, 2024 at 11:46:11AM +0200, Christophe JAILLET wrote:
> > > Use sysfs_emit_at() instead of snprintf() + custom logic.
> > > Using sysfs_emit_at() is much more simple.
> > > 
> > > Also, sysfs_emit() is already used in this function, so using
> > > sysfs_emit_at() is more consistent.
> > > 
> > > Also simplify the logic:
> > >    - always add a space after an entry
> > >    - change the last space into a '\n'
> > > 
> > > Finally it is easy to see that, given the size of cabc_modes, PAGE_SIZE
> > > can not be reached.
> > > So better keep everything simple (and correct).
> > > 
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > >   .../omap2/omapfb/displays/panel-sony-acx565akm.c  | 15 ++++++++-------
> > >   1 file changed, 8 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> > > index 71d2e015960c..fc975615d5c9 100644
> > > --- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> > > +++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> > > @@ -466,19 +466,20 @@ static ssize_t show_cabc_available_modes(struct device *dev,
> > >   		char *buf)
> > >   {
> > >   	struct panel_drv_data *ddata = dev_get_drvdata(dev);
> > > -	int len;
> > > +	int len = 0;
> > >   	int i;
> > >   	if (!ddata->has_cabc)
> > >   		return sysfs_emit(buf, "%s\n", cabc_modes[0]);
> > > -	for (i = 0, len = 0;
> > > -	     len < PAGE_SIZE && i < ARRAY_SIZE(cabc_modes); i++)
> > > -		len += snprintf(&buf[len], PAGE_SIZE - len, "%s%s%s",
> > > -			i ? " " : "", cabc_modes[i],
> > > -			i == ARRAY_SIZE(cabc_modes) - 1 ? "\n" : "");
> > > +	for (i = 0; i < ARRAY_SIZE(cabc_modes); i++)
> > > +		len += sysfs_emit_at(buf, len, "%s ", cabc_modes[i]);
> > > +
> > > +	/* Remove the trailing space */
> > > +	if (len)
> > > +		buf[len - 1] = '\n';
> > 
> > I'm uncomfortable with this line.  It assumes we don't overflow PAGE_SIZE where
> > the original code was careful about checking.  Probably easiest to do what the
> > original code did and say:
> > 
> 
> Hi Dan,
> 
> I don't follow you. AFAIK, it does not assume anything.
> 
> Thanks to sysfs_emit_at(), len can only be in [0..PAGE_SIZE-1] because the
> trailing \0 is not counted.
> 

Ah, you're right.  Sorry for the noise.

regards,
dan carpenter

