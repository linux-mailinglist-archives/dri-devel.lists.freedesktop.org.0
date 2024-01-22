Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75DC836BD5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 17:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E00910ECED;
	Mon, 22 Jan 2024 16:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBBF10ECED
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:52:25 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-40e60e135a7so33991925e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 08:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705942284; x=1706547084; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9Xb3P5uW0KtHlr1gJq8gbLgJiB2wQ8rCJWCXkjGJUtQ=;
 b=UIuiXa3t/odWzsPA4hHm+XJmeg5KN6SEPOX27PmFPpwLBp6oIJIep2FuiKb25lP1EF
 5YN6WGYCvC+oI6U/ZIN9uyCpNFhctuaUYmTTsunkJYFAj83ImseTZqaWCaVEq3O2mTfs
 EEzmF8kTigjUwpuOofF3tww8yIMQZ4nZ7rma6s8ht6CXKLqiYSlSDuxuZR9JtDDbrsK8
 0UxWd7QTOc8zwTNPZjc/zl6dCTE7sHQhvhRPuCdIRtmcLbtvfcD8oCw78laj9dJzGiR+
 ZqIR1Dc272NIeypIsemcGboajkto/3r/vMC4+e7l6tBvck9qF4kzpSai6woIV7+vSLe9
 aZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705942284; x=1706547084;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Xb3P5uW0KtHlr1gJq8gbLgJiB2wQ8rCJWCXkjGJUtQ=;
 b=sLkMQWv5zT88w7mIIq+OJxGycmE0gjvX4R2Aok8v5OWkCUpKZnUZn5EpVhEkJiJX3/
 QdR1hsdgKJPwljyE3XO0VGjBaUviEPoIQmPpRTiA+8v/k035tOfVd3QzNlwwNP80cHhP
 L70g2oKQOvTu+F9c3UevdUff+KddSsGn9YylniCcFr54oF97jo850Z6klLXbQcsRoqgu
 HopoIHygYovumhtkAuzUhWHeyOS005igH2nDj6V8tCOOA/XOohPWH8AcbY4rft65WjhW
 emgQ61dgIj5YN9sOnl7gEBcthtl8oVPxACDTNnre3h90SeiuMEC4IRTvb/TKfYSS0Bk6
 wGwg==
X-Gm-Message-State: AOJu0YzuqmNDVm6O4yYcIWW5CcFxtCAUZffqoySwpngj1/X/Q28pJFju
 +F9/Bq6fMPH2OOHyR4N9ttMDwpZ9I5sAfgoFs83KbUDSzO/KEAs821tFq1JAX0s=
X-Google-Smtp-Source: AGHT+IEe3ZCJOUFqqCaZfXUenFubOiJGjr88xxBaUX1UAuvcpYxGpx+soMDWnfmXjkm1SCbpuxpXaQ==
X-Received: by 2002:a05:600c:b9a:b0:40e:a9c0:31fe with SMTP id
 fl26-20020a05600c0b9a00b0040ea9c031femr1882939wmb.68.1705942284282; 
 Mon, 22 Jan 2024 08:51:24 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 iv11-20020a05600c548b00b0040d8ff79fd8sm39802749wmb.7.2024.01.22.08.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 08:51:23 -0800 (PST)
Date: Mon, 22 Jan 2024 16:51:22 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH v3 3/3] backlight: Add Kinetic KTD2801 backlight support
Message-ID: <20240122165122.GB8815@aspen.lan>
References: <20240120-ktd2801-v3-0-fe2cbafffb21@skole.hr>
 <20240120-ktd2801-v3-3-fe2cbafffb21@skole.hr>
 <20240122102805.GB8596@aspen.lan> <1783156.VLH7GnMWUR@radijator>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1783156.VLH7GnMWUR@radijator>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Karel Balej <balejk@matfyz.cz>, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 05:24:56PM +0100, Duje Mihanović wrote:
> On Monday, January 22, 2024 11:28:05 AM CET Daniel Thompson wrote:
> > On Sat, Jan 20, 2024 at 10:26:45PM +0100, Duje Mihanović wrote:
> > > diff --git a/drivers/video/backlight/ktd2801-backlight.c
> > > b/drivers/video/backlight/ktd2801-backlight.c new file mode 100644
> > > index 000000000000..7b9d1a93aa71
> > > --- /dev/null
> > > <snip>
> > > +/* These values have been extracted from Samsung's driver. */
> > > +#define KTD2801_EXPRESSWIRE_DETECT_DELAY_US	150
> > > +#define KTD2801_EXPRESSWIRE_DETECT_US		270
> > > +#define KTD2801_SHORT_BITSET_US			5
> > > +#define KTD2801_LONG_BITSET_US			(3 *
> KTD2801_SHORT_BITSET_US)
> > > +#define KTD2801_DATA_START_US			5
> > > +#define KTD2801_END_OF_DATA_LOW_US		10
> > > +#define KTD2801_END_OF_DATA_HIGH_US		350
> > > +#define KTD2801_PWR_DOWN_DELAY_US		2600
> >
> > These are a little pointless now. They are all single use constants
> > and have little documentary value.
> >
> > The lack of documentary value is because, for example,
> > KTD2801_EXPRESSWIRE_DETECT_DELAY_US, is assigned to a structure
> > field called detect_delay_us.
> >
> > Likewise I doubt that explicitly stating that long_bitset_us is 3x
> > bigger than short_bitset_us is important for future driver maintainance.
>
> Does this apply for ktd2692 as well?

I think so, yes... but I won't get in the way if you (or anyone else)
decides otherwise.


Daniel.
