Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9AB53CDCB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 19:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65BB113828;
	Fri,  3 Jun 2022 17:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A613211381D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 17:10:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 15F49B823AE;
 Fri,  3 Jun 2022 17:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2A6C385B8;
 Fri,  3 Jun 2022 17:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654276222;
 bh=Yhb8OPp1sSwZzVcLGVjDxYrN0vlwebO9faHuTNWhG4o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pJUj26xM3omq1XfJzae2/kNYP0GNrKZJAlX6qQvFkoORdgX2jatgBaZhjITDetyo4
 6Ho3r8JCZNDTqYqTywpriBv1enouc70JPjw/sYrT7zAqOY3+TbCZUGrBVxnV0twFzb
 vBFIAuE6Owl4SCoC0jyhKAh0Wkj62wDDrGkEYuY9ZHlH2kkn5YxDGMdMJ4lJ4ZJtOM
 8FilAtIOaatwJZHh8x0+lYlCL4U9MemxvnRqpNaXZGP17ucBaA6OSj8utHuAIdF2Zq
 mOVjuiYHKrUQzkdqfZZndqYO3gcqFcQLMxn6f/bbPrMbEy5YxC7w8yXCWqyVB3lzQC
 zN8eYoz/vFcNw==
Date: Fri, 3 Jun 2022 18:19:17 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [RESEND 10/14] iio: adc: mt6370: Add Mediatek MT6370 support
Message-ID: <20220603181917.3f737913@jic23-huawei>
In-Reply-To: <CABtFH5Lg43EXS7juhXQ2wQFZzkpD7YB8rM6UFT=U9BDOKcbaNw@mail.gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
 <20220531111900.19422-11-peterwu.pub@gmail.com>
 <20220531142102.00007df0@Huawei.com>
 <CABtFH5Lg43EXS7juhXQ2wQFZzkpD7YB8rM6UFT=U9BDOKcbaNw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com, pavel@ucw.cz,
 alice_chen@richtek.com, linux-iio@vger.kernel.org, robh+dt@kernel.org,
 lgirdwood@gmail.com, ChiYuan Huang <cy_huang@richtek.com>,
 krzysztof.kozlowski+dt@linaro.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, daniel.thompson@linaro.org, deller@gmx.de,
 chunfeng.yun@mediatek.com, linux@roeck-us.net, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, sre@kernel.org, linux-kernel@vger.kernel.org,
 chiaen_wu@richtek.com, jingoohan1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> >  
> > > +
> > > +#define MT6370_AICR_400MA            0x6
> > > +#define MT6370_ICHG_500MA            0x4
> > > +#define MT6370_ICHG_900MA            0x8
> > > +
> > > +#define ADC_CONV_TIME_US             35000
> > > +#define ADC_CONV_POLLING_TIME                1000
> > > +
> > > +struct mt6370_adc_data {
> > > +     struct device *dev;
> > > +     struct regmap *regmap;
> > > +     struct mutex lock;  
> >
> > All locks need documentation.  What is the scope of the lock?
> > Looks like it protects device state when doing setup, wait for read, read
> > cycles.  
> 
> This mutex lock is for preventing the different adc channel from being
> read at the same time.
> So, if I just change its name to adc_chan_lock or adc_lock and add the
> comment for this mutex lock, does this change meet your requirement

Yes

> 
> >  
> > > +};
> > > +
> > > +static int mt6370_adc_read_scale(struct mt6370_adc_data *priv,
> > > +                              int chan, int *val1, int *val2)
> > > +{
> > > +     unsigned int reg_val;
> > > +     int ret;
> > > +
> > > +     switch (chan) {
> > > +     case MT6370_CHAN_VBAT:
> > > +     case MT6370_CHAN_VSYS:
> > > +     case MT6370_CHAN_CHG_VDDP:
> > > +             *val1 = 5000;  
> >
> > This seems very large.  Voltages are in millivolts
> > as per Documentation/ABI/testing/sysfs-bus-iio
> > and this means each step is 5 volts.
> >
> > So value in mv is currently 5 * _raw
> >  
> 
> OK, I got it. Also, I will add the ABI file in the next version. Thanks!
Only add ABI documentation for anything non-standard.

The documentation scripts really don't like repeats!

> 
> > > +static const char * const mt6370_channel_labels[MT6370_CHAN_MAX] = {  
> >
> > Perhaps define an enum with which to index this and the chan spec
> > and hence ensure they end up matching.
> >  [vbusdiv5] = "vbusdiv5", etc
> >  
> 
> Do you mean that I can refine this const char array to the following array??
> 
> static const char * const mt6370_channel_labels[MT6370_CHAN_MAX] = {
>     [MT6370_CHAN_VBUSDIV5] =  "vbusdiv5",
>     [MT6370_CHAN_VBUSDIV2] =  "vbusdiv2",
>     ...
>     ...
>     [MT6370_CHAN_TEMP_JC] =  "temp_jc",
> };

Yes

thanks,

Jonathan
