Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAD99135D8
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 21:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE6610E2D9;
	Sat, 22 Jun 2024 19:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XzVq1skq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B83B10E2BB
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 19:29:04 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-70670188420so273988b3a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 12:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719084543; x=1719689343; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qQbELuDe1M8YclthuBMvwZLhrYr/zB7BIDBvb8NO9Zk=;
 b=XzVq1skqsDcH6oJi3HauAS+di14qTtktfjnyob9BFzSC6w/i+RdhLeEzWjJXWVsYw+
 I2mypQgSf7ryustx6Uedj8TlT2RYaHYyAxjKyiwAk0MmVHKIRbfH4vZxY6c7QAEMpqCb
 I+fRvZ+xbgNTI8ZovZW/46kf+dcqE/wkJW9ZNhVgg+Y0UBtTcnCvDkfM7dsvmvA4Y/hX
 NsPfOJce5xoXUB+JfejaBT8sw9COuXHI+SrCtcoxejETuabs7H2Y1q6PLJljX8v56IEM
 RirkK73NeMiUSOvucPyME2VH5di5oyPM2cCOEvWZFyQ/EdR8yX6sdOcQx1cvOwGR/P/U
 Rcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719084543; x=1719689343;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qQbELuDe1M8YclthuBMvwZLhrYr/zB7BIDBvb8NO9Zk=;
 b=CTGxlaKxm00RPzx46gAoCs8pXtOjUZTBhpU9uXGHlOxVqGjL25mhnV8TYU7edz+xMv
 s1xeVESg9bj+jLsGyZNl/1pCxpuACT3GTID8eEgTHbUS4wFP+tiPvrWDZXMt9p3DuhWJ
 vXGgPRETf5/MswhGAJcoGDzwGTdtRiybssWoH3GsNmhhO/2rLP7Edm+rSNSGodcoaAQ0
 bn4mixk2AmPA+Acm7t0gBgTv7GMi1/W9opExCK/bkrVYDL9S8YqB8DrOlI8O9ZLYHzVW
 SQ+Zg5ijZnzDk2lvxXo/hRZitv+nxUJfc6RLl5qGcwRF4IjM+fkI1IMxorEZA2SUcIOX
 fwmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8Q1MnCLWbY7CXUvUmEbKgT++gzQuLejf5VVBWO3cC4T1RRKxnI+fdwWKjOxTKPETK3Wd6PdmMJdgrIL5kRfr9WyL68vqZydYHWcQFQDGi
X-Gm-Message-State: AOJu0Yy5keqPSxAEMlF2HsoffnU60D++jNxMvzxa+VGMLFH22LndCqG4
 zbQixdO548yPX3Mg5PBnnyuXEYbNS6oAmWGVsU15jo8gb08HrmF+
X-Google-Smtp-Source: AGHT+IFDDoVjuhaI8yQebraUmXub4r1NLDjpC70dEVN1YESkE8eowaKqMxBNjB1McCG+t5Ci8DAHrQ==
X-Received: by 2002:aa7:8005:0:b0:705:bf9c:4cdd with SMTP id
 d2e1a72fcca58-7066e543be2mr1101311b3a.16.1719084543261; 
 Sat, 22 Jun 2024 12:29:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d2ec:59a0:2c5f:4460])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706512eba04sm3407547b3a.188.2024.06.22.12.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 12:29:02 -0700 (PDT)
Date: Sat, 22 Jun 2024 12:29:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3] software node: Implement device_get_match_data fwnode
 callback
Message-ID: <Zncl_O-NjMRZYGeA@google.com>
References: <20240427203650.582989-1-sui.jingfeng@linux.dev>
 <ZnXbaubPVAUdDIu0@google.com>
 <7b5305b6-78b0-4add-9e70-271159cfad95@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b5305b6-78b0-4add-9e70-271159cfad95@linux.dev>
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

On Sun, Jun 23, 2024 at 02:04:00AM +0800, Sui Jingfeng wrote:
> Hi,
> 
> On 6/22/24 03:58, Dmitry Torokhov wrote:
> > Hi Sui,
> > 
> > On Sun, Apr 28, 2024 at 04:36:50AM +0800, Sui Jingfeng wrote:
> > > Because the software node backend of the fwnode API framework lacks an
> > > implementation for the .device_get_match_data function callback. This
> > > makes it difficult to use(and/or test) a few drivers that originates
> > > from DT world on the non-DT platform.
> > > 
> > > Implement the .device_get_match_data fwnode callback, which helps to keep
> > > the three backends of the fwnode API aligned as much as possible. This is
> > > also a fundamental step to make a few drivers OF-independent truely
> > > possible.
> > > 
> > > Device drivers or platform setup codes are expected to provide a software
> > > node string property, named as "compatible". At this moment, the value of
> > > this string property is being used to match against the compatible entries
> > > in the of_device_id table. It can be extended in the future though.
> > 
> > I am sorry, but this is not really correct.
> 
> I fine if the maintainers of fwnode API want to reject this, but got
> rejected is not really equals to "not correct".

Your statement is factually incorrect. As I shown below using SPI bus as
an example, compatible is only used for OF-based matches. Specifying
"compatible" property via SW node does zilch for matching process. There
are drivers like atmel_mxt_ts that check presence of "compatible"
explicitly (I added it to ensure that the touch controller has all
necessary properties on x86 because older Chromebooks were using ACPI
HID names to differentiate between the touchscreen and touchpad and I
wanted something more robust) but this is not a part of the matching
process.

> 
> Software nodes are used to
> > augment missing or incomplete parameters, but are never primary objects
> > in the matching process. Sometimes "compatible" property is used with
> > software nodes, but it does not participate in the matching process. > There are several ways for various buses to match a device and a driver,
> > but none of them operate on software nodes.
> 
> It's not participate in the matching process in the *past*, but what
> we present is something *new*.

I see absolutely nothing in your patch that would affect the matching
process. It is also not a part of a larger series, so there is nothing
"new" here.

> I fine if you adhere to *old* and/or
> *subsystem-dependent* approach, but there really no need to persuade
> other people to follow your "old" idea.
> 
> Consider for example how
> > devices on SPI bus are matched (see
> > drivers/spi/spi.c::spi_match_device()):
> 
> 
> This only make the driver be able to probed in a non-DT way, but
> it doesn't tell how does the *additional device properties* can
> be get. This is the key point.

I think you misunderstand what device_get_match_data() does. It does not
deal with device properties so there's nothing "additional" there.

> 
> 
> > 1. OF/device tree based match. It *requires* the device to have
> > dev->of_node which is coming from a DTB. It does not work on software
> > nodes. In case of match the match data should come from of_device_id
> > entry.
> > 
> > 2. ACPI-based match. The match is done based either on OF-compatible
> > data (which includes "compatible" property) in _DSD (if driver supports
> > OF-based matching), or based on HID/CID data. In the latter case the
> > match data is coming from acpi_device_id entry.
> > 
> > 3. Name-based match, typically used for board-instantiated devices. In
> > this case match is done by comparing device name under which it was
> > instantiated against names listed in the drivers id_table. The match
> > data is coming from spi_device_id entry.
> 
> The statements here sound right, but it's useless. Because the problems
> isn't solved yet, nor does you words point out a practical approach.

I am explaining you how the system works since there appears to be a
severe misconnect. I think you need to state clearly the problem you are
trying to solve, beyond "completeness of the API" argument.

> 
> > Similar matching processes are implemented for i2c and platform buses,
> > as well as others.
> > 
> > Your patch is effectively hijacks the #3 matching process and
> > substitutes the bus-specific match data (from
> > spi_device_id/i2c_device_id/etc) with OF data. This is not expected and
> 
> Please stop *contaminating* other people's patch, if you have better

I am providing a review of your proposal/patch. That is what happens on
LKML and I suggest you get used to this if you want to become a regular
contributor to the Linxu kernel.

> idea you can posting it. My patch open a new door, and there do have
> programmer in requesting(need) this in the past.

Please point at what exactly you are trying to solve here, because it is
still not clear. Start from the beginning. What are you trying to
achieve on a practical level? I.e. "If I do *this* my device does not
work because of *reason* and to fix this I need *that*". It may very
well be that right "that" is something different from what you are
proposing,

> 
> 
> > while we may want this in a long term (so we can eventually remove these
> > bus-specific device ids and only have ACPI/OF ones) I do not think we
> > are ready for this yet. At the very least this needs to be very clearly
> > documented.
> 
> This is your *personal* wants, if you want to remove something,
> just do it. Keep quiet if you are not ready. Exposing your concerns
> doesn't help to solve any problems.

This sounds incredibly rude. Please consider your tone when writing
your responses.

> 
> Or, if you want it to be clear, you can contribute to Documentation/
> gpu/todo.rst. Other peoples help you to become clear there, thanks.
> 
> Please note that we are talking about the completeness of the fwnode
> APIs, what's you say above has nothing to do the device fwnode APIs.
> Hence, is not revelant to my patch, again is out of scope.
> 
> > > 
> > > Fixes: ffb42e64561e ("drm/tiny/repaper: Make driver OF-independent")
> > > Fixes: 5703d6ae9573 ("drm/tiny/st7735r: Make driver OF-independent")
> > 
> > As other people mentioned this patch does not fix the aforementioned
> > commits because they are not broken.
> 
> You still not really understand what other people does, I'm not saying
> it broken. I'm talking about the completeness.

Completeness for the sake of completeness is not an argument. As it
stands your patch will not change these driver's behavior.

> 
> In case of non-OF match (which
> > includes the case where you use software nodes) the match data is coming
> > from matching spi_device_id entry in the driver.
> 
> 
> We don't care about much how it is probed now, rather, after the driver
> probed by a non-OF way, how does the additional devices properties
> can be get?
> 
> 
> Say:
> 
> 1) "device_property_read_u32(dev, "rotation", &rotation);" and
> 2) "!device_property_read_string(dev, "pervasive,thermal-zone",
> &thermal_zone))"
> 
> 
> For those spi/i2c/platform devices, what we argues are that
> those drivers really should just depend on "OF" before we have
> a reliable fwnode API backend to redirect to.

They are working fine without such restriction now, so I see absolutely
no reason imposing this restriction.

> 
> Where the additional device_property_read_xxxx() calls redirect to?
> 
> What if users want to invoke more device_property_read_xxxx() function?

They are being directed to first the primary FW node instance, which may
be either OF, ACPI, or SW node, and then, if property is not present
there, to the secondary FW node, which can be either again.

At no point ->device_get_match_data() callback in involved in this
process.

Thanks.

-- 
Dmitry
