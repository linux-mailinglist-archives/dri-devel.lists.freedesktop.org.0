Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0722540F787
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839FC6EC43;
	Fri, 17 Sep 2021 12:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EA86EC43
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 12:31:08 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q11so14905417wrr.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 05:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fXWGJEAQybr4pDDlLtgHrDW/3jidDvhIRctY0I2WY0M=;
 b=qPgJLXy+HvWqdCsqUso4O/PwcACuu8RYEdyfOsmYHTWf5gT6XiAU0uzqalmKErux4/
 hUNQJMMAHx7W66PiCWmOEMtjfRWWsTWJw22JcaIlH5WwShoxgztXd5ROnhYpxcIL8pwF
 +fv2/LiW8OY8pA63ER2Rl74dkVVD6x6wIbcv2lQaxQ9m1J2u5+TCNwTSpT+DbIVKJQED
 47m+1Gi2tUy4iW6w6huQte7RrfeRdCg5qNZUZ+juh66T9lmleEDBxKPHI6I+H7YztyXy
 lCdfPW/FkEVzRhI3bTqn/vgFKom5himskuUEJ1g8LqgLoL7BlQRs1iTdkEoBUF7+JACZ
 qhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fXWGJEAQybr4pDDlLtgHrDW/3jidDvhIRctY0I2WY0M=;
 b=Jm61Vi1JOaUZunhRnrvCYT0dTRHxVzAbNr1SY0c1rxYvrT7k0toG2lkVwi5FzChcUQ
 n18NKbm2hAd2N6JdxGe/PdXeuhlqveLRtENZrfmaQYuTvmmopWxMqovztwSewrYjYBXy
 L3P52aoCVHwltVyYjuBQHZkj1g5sjjOBj8WpKkXKga/B42/qQDFjMtCKnmnE1LOfw6Yc
 Y5pYVKzVvVg3B1T6vzl+Hp7oRtqTcUzkv9tmrddc/0kTiyHHxWzAmhKeTJSvfywwAxJO
 tZqFtsrtVmF0HpdTyL9Qo+Cu2xydSR6v8my//JtwfWoCVFRGoelO3yv6hqfZUB47pXKv
 VYTQ==
X-Gm-Message-State: AOAM532MrgHxM4QSZXmbEz39X+EkWkHHif7L0Fe/2whm+l1IFACQn9By
 QIioDEbPn6X3ZA4mdbNw0E2VyQ==
X-Google-Smtp-Source: ABdhPJw77/NaSGb8f62yLrSui7prnuk28NxJe3qzhMh/O1B6IkPo/w1O1Km+04UOAlZ78Q/3GGfrrg==
X-Received: by 2002:a5d:448d:: with SMTP id j13mr11597328wrq.212.1631881867207; 
 Fri, 17 Sep 2021 05:31:07 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id q11sm10709020wmc.41.2021.09.17.05.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:31:05 -0700 (PDT)
Date: Fri, 17 Sep 2021 13:31:03 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] backlight: bd6107: Make use of the helper function
 dev_err_probe()
Message-ID: <20210917123103.33oytfwhpcakdi2w@maple.lan>
References: <20210917031308.17623-1-caihuoqing@baidu.com>
 <20210917091729.elpngrzpvmp43wns@maple.lan>
 <20210917110528.GA17963@LAPTOP-UKSR4ENP.internal.baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210917110528.GA17963@LAPTOP-UKSR4ENP.internal.baidu.com>
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

On Fri, Sep 17, 2021 at 07:05:28PM +0800, Cai Huoqing wrote:
> Hi
> Thanks for your feedback.
> On 17 9月 21 10:17:29, Daniel Thompson wrote:
> > On Fri, Sep 17, 2021 at 11:13:06AM +0800, Cai Huoqing wrote:
> > > When possible use dev_err_probe help to properly deal with the
> > > PROBE_DEFER error, the benefit is that DEFER issue will be logged
> > > in the devices_deferred debugfs file.
> > > Using dev_err_probe() can reduce code size, and the error value
> > > gets printed.
> > > 
> > > Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> > 
> > Change seems OK but does this really need to be done one file at a time?
> > I'd prefer to see all of backlight handled in one go (given the scope of
> > this change if applied across the kernel it needs automatic tooling
> > anyway).
> Only two related patches for backlight.

Can you explain how you reach this conclusion?

I only checked two drivers (the first two when you list the drivers
an alphabetic order) but both contain code that appears to match the
pattern you are targeting.


> I try to keep one patch for a subdriver, sometimes different
> subdriver owner need to mark reviwed independently.

For mechanical patches of this nature I don't think there is any need
for acks from individual backlight driver authors. Reviews are 100%
welcome but we would not hold a single patch back until all authors
have reviewed it.


Daniel.



> > > ---
> > >  drivers/video/backlight/bd6107.c | 16 ++++++----------
> > >  1 file changed, 6 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/video/backlight/bd6107.c b/drivers/video/backlight/bd6107.c
> > > index 515184fbe33a..e21b793302a2 100644
> > > --- a/drivers/video/backlight/bd6107.c
> > > +++ b/drivers/video/backlight/bd6107.c
> > > @@ -120,7 +120,6 @@ static int bd6107_probe(struct i2c_client *client,
> > >  	struct backlight_device *backlight;
> > >  	struct backlight_properties props;
> > >  	struct bd6107 *bd;
> > > -	int ret;
> > >  
> > >  	if (pdata == NULL) {
> > >  		dev_err(&client->dev, "No platform data\n");
> > > @@ -148,11 +147,9 @@ static int bd6107_probe(struct i2c_client *client,
> > >  	 * the reset.
> > >  	 */
> > >  	bd->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
> > > -	if (IS_ERR(bd->reset)) {
> > > -		dev_err(&client->dev, "unable to request reset GPIO\n");
> > > -		ret = PTR_ERR(bd->reset);
> > > -		return ret;
> > > -	}
> > > +	if (IS_ERR(bd->reset))
> > > +		return dev_err_probe(&client->dev, PTR_ERR(bd->reset),
> > > +				     "unable to request reset GPIO\n");
> > >  
> > >  	memset(&props, 0, sizeof(props));
> > >  	props.type = BACKLIGHT_RAW;
> > > @@ -164,10 +161,9 @@ static int bd6107_probe(struct i2c_client *client,
> > >  					      dev_name(&client->dev),
> > >  					      &bd->client->dev, bd,
> > >  					      &bd6107_backlight_ops, &props);
> > > -	if (IS_ERR(backlight)) {
> > > -		dev_err(&client->dev, "failed to register backlight\n");
> > > -		return PTR_ERR(backlight);
> > > -	}
> > > +	if (IS_ERR(backlight))
> > > +		return dev_err_probe(&client->dev, PTR_ERR(backlight),
> > > +				     "failed to register backlight\n");
> > >  
> > >  	backlight_update_status(backlight);
> > >  	i2c_set_clientdata(client, backlight);
> > > -- 
> > > 2.25.1
> > > 
