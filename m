Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6515C94D272
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 16:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0F510E93E;
	Fri,  9 Aug 2024 14:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wclkAJEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2297D10E93E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 14:48:41 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5bb8e62575eso671580a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 07:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723214919; x=1723819719; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tFtgPj7cDJPPMnEzJqYuz4oTx2v5U6jmL1KNLX38x4Q=;
 b=wclkAJEzi6eA2n2JMI1vbtpKNoKASQKYMV9gTbOERhGO2IdEJfDD4+JzamdEAduMo+
 sJXpmU5fh8TBV7BH/v/NOT7SiJHAT61T2XrVdscw3W+ar9Wfc+vFCsG5fn/K7bESSPfe
 xzVMMzV9ptsQzhaqv12551V2tIWxIyTjGI77TBynt36uB1qe7p25B5B+k1mkB0Ferx+P
 tp5mQARfID3fjTDJ0WDcM98jmPvKzf55Sl9QSdwYwSj3uQPqSS0F+lO9MSdyz7XHfaSD
 gFrEuCqwqtOalwTnd/2oknF4ivGXk3fVUsPEKqFLhOyz4np1VGASirALgP1VlnjVr55c
 pmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723214919; x=1723819719;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tFtgPj7cDJPPMnEzJqYuz4oTx2v5U6jmL1KNLX38x4Q=;
 b=nowQrkXjwWRaYRCyMBcW1YbQ1wUDepsAZS08NWQmoCYJ+aaIUs7Meq2F5KxsFP6ZC2
 jZIzoYzJ/3rGsrC7HV5+reIcD6Rq3T0GUBnmP/9gvFZVZ6QYohlnhZWlVwTY71nY6NB3
 SDSDXqsrsh+zm0jdOrMpt9OOnJPS03Eii6q5XhOhgml8RkiA2aH+/Zz+3NGp34x8RqnP
 69lfzVeGdrTNCdRM6FZq9GjyYPzoZjUcKz/4Sj+hLlvhsmk9oIQuUc5Ye3zC7HbPwVze
 /N2XcUKCoSay+P+ybtEMoLAAoluizuOf49SSOf9W6T1s5di1SToWsvCts5Pe3CA6tdOK
 br3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6YI1icuE1sdO69gJjPL11enc8Cr81EOs/NHFxwxorV6xz2wnZt01/tW0vkq1AN5Bm3R5YOCdOqvN8+ksu7iHaQJm6y8+v83ZPpY3CCW7B
X-Gm-Message-State: AOJu0YzUt7OltF61CS/NOLf6obDG8ytiRMqyOf8s+JudU401zvgQwDvZ
 Bj4ksltV9TvQ5p4SEMvdQoQqP5D/eZndGz8xZUJXhFLi4Vq6S8PFyox642XlzfA=
X-Google-Smtp-Source: AGHT+IFBY2Fa09LrgoQHpcmAJetlamh86kOIIRg78Yt85HeAsUAmRa90xiVBDSWmTBmcEOH2cLKoNw==
X-Received: by 2002:a05:6402:510e:b0:5a1:b6d8:b561 with SMTP id
 4fb4d7f45d1cf-5bd0a535c1emr1850330a12.9.1723214919081; 
 Fri, 09 Aug 2024 07:48:39 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2e5c8edsm1596620a12.81.2024.08.09.07.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 07:48:38 -0700 (PDT)
Date: Fri, 9 Aug 2024 17:48:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev: omapfb: panel-sony-acx565akm: Simplify
 show_cabc_available_modes()
Message-ID: <eb7fc428-3987-4858-b24a-d5c127077acb@stanley.mountain>
References: <91fc9049558a4865d441930c8f4732461f478eca.1723110340.git.christophe.jaillet@wanadoo.fr>
 <aa43c1f8-05bc-4edd-b7ba-474953f28f5c@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa43c1f8-05bc-4edd-b7ba-474953f28f5c@stanley.mountain>
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

On Fri, Aug 09, 2024 at 05:42:32PM +0300, Dan Carpenter wrote:
> On Thu, Aug 08, 2024 at 11:46:11AM +0200, Christophe JAILLET wrote:
> > Use sysfs_emit_at() instead of snprintf() + custom logic.
> > Using sysfs_emit_at() is much more simple.
> > 
> > Also, sysfs_emit() is already used in this function, so using
> > sysfs_emit_at() is more consistent.
> > 
> > Also simplify the logic:
> >   - always add a space after an entry
> >   - change the last space into a '\n'
> > 
> > Finally it is easy to see that, given the size of cabc_modes, PAGE_SIZE
> > can not be reached.
> > So better keep everything simple (and correct).
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >  .../omap2/omapfb/displays/panel-sony-acx565akm.c  | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> > index 71d2e015960c..fc975615d5c9 100644
> > --- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> > +++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
> > @@ -466,19 +466,20 @@ static ssize_t show_cabc_available_modes(struct device *dev,
> >  		char *buf)
> >  {
> >  	struct panel_drv_data *ddata = dev_get_drvdata(dev);
> > -	int len;
> > +	int len = 0;
> >  	int i;
> >  
> >  	if (!ddata->has_cabc)
> >  		return sysfs_emit(buf, "%s\n", cabc_modes[0]);
> >  
> > -	for (i = 0, len = 0;
> > -	     len < PAGE_SIZE && i < ARRAY_SIZE(cabc_modes); i++)
> > -		len += snprintf(&buf[len], PAGE_SIZE - len, "%s%s%s",
> > -			i ? " " : "", cabc_modes[i],
> > -			i == ARRAY_SIZE(cabc_modes) - 1 ? "\n" : "");
> > +	for (i = 0; i < ARRAY_SIZE(cabc_modes); i++)
> > +		len += sysfs_emit_at(buf, len, "%s ", cabc_modes[i]);
> > +
> > +	/* Remove the trailing space */
> > +	if (len)
> > +		buf[len - 1] = '\n';
> 
> I'm uncomfortable with this line.  It assumes we don't overflow PAGE_SIZE where
> the original code was careful about checking.  Probably easiest to do what the
> original code did and say:
> 
> 	for (i = 0; i < ARRAY_SIZE(cabc_modes); i++)
> 		len += sysfs_emit_at(buf, len, "%s%s", cabc_modes[i],
> 				     i == ARRAY_SIZE(cabc_modes) - 1 ? "\n" : "");

Or you could change it to:

	if (len)
		sysfs_emit_at(buf, len - 1, "\n");

But that feels weird.

regards,
dan carpenter

