Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DD067F887
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 15:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784AC10E1B1;
	Sat, 28 Jan 2023 14:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FBD10E1B1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 14:14:18 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 nn18-20020a17090b38d200b0022bfb584987so7267020pjb.2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 06:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vcgL8SdpnxRsXHVcNTMAFxs4sTzc2o5ZQi6m3PVqUzI=;
 b=MvVYsT2ll7BqSiHFoXFdmjtRJlIYjvOZ3Tw0MD1ie55Ld04C6LqnyY2Is+GZmAKX59
 0Be39rasBg6kmi6TygnzNCks2eelJ+9/zV2x49Iq8+oP/RH8hwZLzt5d4zlgvC8/1Ps5
 gQlC5QUPMZaxt/4qQIelVnL9ipULadnVPLk9KSHOqoEPLhj4DaO9zeHZZJSx/6tVAqxj
 02arQwEpI5hXPEdp4TlOITrh0+XY8PXbWhnyBd/+UJ5aDAGVM23dnDIzhSACYbo1KNUh
 E3wwVyq+uwnVGhQJBp+jCLQfPr9AqFuWR1QXnfxIWaQSbGN/u6A7En8I8acUPfTQzyDm
 G+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vcgL8SdpnxRsXHVcNTMAFxs4sTzc2o5ZQi6m3PVqUzI=;
 b=TuCuS/VxAxCnXUnleueEYexjCrJ8/m6AvMbJ0Qr/DJew/kanj+nix2xVE10yfGOONY
 MylfOL05SDyhTzb4+JmJgBdQKHQSRfzFrPL8EIbHoi7XvUYxFvAwW9sGc63gmSGY8j2W
 CotHayWS2vSM6wzxmfjIDERXZBPh4dMo0pMgSJQ7XYcvCkyfx5hp5uojyYh/qoOCX1dJ
 u72vCUIO0kE6YQ/SVBrudElfTQKu4msMmN+lPNfHwHZPLjkBVUKWtZI3FgWJEy6ISNr7
 IVxCp8erIWPHNwVYMZSLWX30C5CVuYP9tc8eqRHKAHEh1sbfETEJRYGRZhlHKOpl1f56
 5+gw==
X-Gm-Message-State: AFqh2ko5ojtVsm6+L0+kShqN16o0qwKVSogC1MY6pLXZro/4eOa1O+zm
 J6JU/EINzC0ep1ruf4uFs0E=
X-Google-Smtp-Source: AMrXdXsXWzoBxbwbN7xeHbxeAhi+J3eAuA7zq84kXi9P8o8Rrp64f2ipuiw/n1L/mXacwxSx0GOLRw==
X-Received: by 2002:a05:6a20:4657:b0:b8:8208:a837 with SMTP id
 eb23-20020a056a20465700b000b88208a837mr40088810pzb.22.1674915257780; 
 Sat, 28 Jan 2023 06:14:17 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 x189-20020a6386c6000000b004a281fb63c3sm3958223pgd.87.2023.01.28.06.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 06:14:17 -0800 (PST)
Date: Sat, 28 Jan 2023 22:14:09 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: ktz8866: Convert to i2c's .probe_new()
Message-ID: <Y9Utsbi5PYZ26m9j@Gentoo>
References: <20230127152639.1347229-1-u.kleine-koenig@pengutronix.de>
 <Y9RuDM9VAMBzj4vd@Gentoo>
 <20230128133239.ndanz4gzm73wwaiv@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230128133239.ndanz4gzm73wwaiv@pengutronix.de>
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
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 28, 2023 at 02:32:39PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> On Sat, Jan 28, 2023 at 08:36:28AM +0800, Jianhua Lu wrote:
> > On Fri, Jan 27, 2023 at 04:26:39PM +0100, Uwe Kleine-König wrote:
> > > The probe function doesn't make use of the i2c_device_id * parameter so
> > > it can be trivially converted.
> > > 
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > ---
> > > Hello,
> > > 
> > > there is an ongoing effort to convert all drivers to .probe_new to
> > > eventually drop .probe with the i2c_device_id parameter. This driver
> > > currently sits in next so wasn't on my radar before.
> > > 
> > > My plan is to tackle that after the next merge window. So I ask you to
> > > either apply this patch during the next merge window or accept that it
> > > will go in via the i2c tree together with the patch that drops .probe().
> > > 
> > > Best regards
> > > Uwe
> > > 
> > >  drivers/video/backlight/ktz8866.c | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
> > > index 97b723719e13..d38c13ad39c7 100644
> > > --- a/drivers/video/backlight/ktz8866.c
> > > +++ b/drivers/video/backlight/ktz8866.c
> > > @@ -124,8 +124,7 @@ static void ktz8866_init(struct ktz8866 *ktz)
> > >  		ktz8866_write(ktz, LCD_BIAS_CFG1, LCD_BIAS_EN);
> > >  }
> > >  
> > > -static int ktz8866_probe(struct i2c_client *client,
> > > -			 const struct i2c_device_id *id)
> > > +static int ktz8866_probe(struct i2c_client *client)
> > >  {
> > >  	struct backlight_device *backlight_dev;
> > >  	struct backlight_properties props;
> > > @@ -197,7 +196,7 @@ static struct i2c_driver ktz8866_driver = {
> > >  		.name = "ktz8866",
> > >  		.of_match_table = ktz8866_match_table,
> > >  	},
> > > -	.probe = ktz8866_probe,
> > > +	.probe_new = ktz8866_probe,
> > 
> > I think .probe_new() will be renamed to new .probe() again when there are
> > patches dropping old .probe().
> 
> Right, the plan is to reintroduce .probe with the prototype that
> .probe_new has today.
> 
> > I prefer that you pack this commit to the i2c-tree commit that drops
> > old .probe(). 
> 
> That's fine for me. Can I interpret this as an Ack for this patch?
Yes, but can't get my A-b directly, this patch should be ignored and 
resend it within the i2c-tree patch series or split it to two patch
series.
> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |


