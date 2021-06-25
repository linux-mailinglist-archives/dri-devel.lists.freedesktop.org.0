Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6393B3FAD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 10:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A0C6E0F6;
	Fri, 25 Jun 2021 08:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF836E0F6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 08:44:48 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id m18so9698015wrv.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 01:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=CeLIgK7phntxuaeQvPCnk2ZyJcdGeb6jadwfkvYxxgM=;
 b=vXsFLLSmooZPxNu5MeItcer3hbOrLr7vuzPntpRAKSJDQDP50GigF6mB/+YGJPQ6Qi
 q1xJXzWsnJlQE0sI+cTJKDCoFYFrF2u0gxI15ckp7cr9XDrQM9FjRPO51PvEeANGHL1W
 46c3eofsBeTcqCUoHry7gzKMde/py9SMCq9y8LCibLzMpAR6UDrxTG3Aksl/fn1abUG/
 qUT7DM8SNwJEhV2KbJNUQ0P/2BbSZaHL8wFYyJ8oys9wC+qeOLtaoFk3ghxsxzP5wd6y
 arVd0bXMxsiUM1cpGDMlcgxxz3KUoNrNgi0ieNE6NFRSld3h1RCFuj1QoZU6nmKgiA6v
 EZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CeLIgK7phntxuaeQvPCnk2ZyJcdGeb6jadwfkvYxxgM=;
 b=ry818DgKFicjJUJE/olYWKkYN7DE3rQLWXOs5rdnKE+qLbLJGFpGP2i/noMsYCF2AS
 2wnE6DDJZ7IhSFxxibBmIohNTH46JysNbfUsPCd54Nl8ISYm6UUWr8Y3Rwz3bLEAgiBm
 g3CO8eZHkomn8NRk3+p2vbeqOtGBTdpjfsYGwIfP034GS6ZrtSAOMQERmbIWAwHANdD5
 rct7Go6g9mJ78AbU1rX5y4HTiP57112UT8ehqO18Lxr6wOwAg26INVgbdpdLX/9OJMgu
 gJwrf9KUt6Rrf2I8dZKOrxuDZb1W4gsnUlFtmvk4k8jf7HVvDN84fI2cM9nEau/7jR6/
 MBsQ==
X-Gm-Message-State: AOAM530YrHVwfNmqDwYW9HwU8pP1+r+9ElI7symoVdopUZQCTKWr7Y1i
 SQpEYamQJl1obaBekpH47mDbeg==
X-Google-Smtp-Source: ABdhPJy6QPvA46rrabm8WK7MpmyNlT70x3mmpSQDGdKnjvoL839Qo+4WZsph4rnpzLh8DptMMKfy6A==
X-Received: by 2002:a5d:4983:: with SMTP id r3mr9484655wrq.184.1624610686789; 
 Fri, 25 Jun 2021 01:44:46 -0700 (PDT)
Received: from dell (92.40.180.154.threembb.co.uk. [92.40.180.154])
 by smtp.gmail.com with ESMTPSA id o17sm9632530wmh.19.2021.06.25.01.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 01:44:46 -0700 (PDT)
Date: Fri, 25 Jun 2021 09:44:43 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 2/2] backlight: lm3630a: convert to atomic PWM API and
 check for errors
Message-ID: <YNWXe9OhS3o4iRGi@dell>
References: <20210621122148.116863-1-u.kleine-koenig@pengutronix.de>
 <20210621122148.116863-3-u.kleine-koenig@pengutronix.de>
 <YNHh2cdcyzLWSCkK@dell>
 <20210624201009.5se7o27b7m6bff4g@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210624201009.5se7o27b7m6bff4g@pengutronix.de>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Jun 2021, Uwe Kleine-König wrote:

> Hi Lee,
> 
> On Tue, Jun 22, 2021 at 02:12:57PM +0100, Lee Jones wrote:
> > On Mon, 21 Jun 2021, Uwe Kleine-König wrote:
> > 
> > > The practical upside here is that this only needs a single API call to
> > > program the hardware which (depending on the underlaying hardware) can
> > > be more effective and prevents glitches.
> > > 
> > > Up to now the return value of the pwm functions was ignored. Fix this
> > > and propagate the error to the caller.
> > > 
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > ---
> > >  drivers/video/backlight/lm3630a_bl.c | 42 +++++++++++++---------------
> > >  1 file changed, 19 insertions(+), 23 deletions(-)
> > 
> > Fixed the subject line and applied, thanks.
> 
> It's not obvious to me what needed fixing here, and I don't find where
> you the patches, neither in next nor in
> https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git; so I
> cannot check what you actually changed.
> 
> I assume you did s/lm3630a/lm3630a_bl/ ? I didn't because it felt
> tautological.

No, but perhaps I should have.  Format goes:

<backlight>: <driver_file_name>: <Subject starting with uppercase>

Where <driver_file_name> has the file extension removed.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
