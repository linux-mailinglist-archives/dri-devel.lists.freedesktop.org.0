Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856CA912E28
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 21:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDF610E0D6;
	Fri, 21 Jun 2024 19:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L6eC4bkZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A779910E0D8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 19:58:39 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-5b9778bb7c8so1182133eaf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 12:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718999918; x=1719604718; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uZT85xg/u3etg74tod0wWvhARm1bf9HjZcOhri8SiLA=;
 b=L6eC4bkZJWp5Dx+rNhHrujv3V4IQ2tAviYVrScB+zCKTN6Z5jIrsGi8ewzFgpmsF05
 iGF9oGJWx69Q6+H/aG0IU8y9aT7+iW2s2H47aLbZjVAROjIlJNbjAWowNsBhzzPIiuz9
 gkc3MHfP8jxSV4Qfkocd2Munl3qA3fKDbls8bWnRR2r4eOS1v+rn4wgMu9J8feQEXphs
 QTS1S0i9iJCLvzGMPFCEOjbcMMNY0MpugRluMEOjHtLjAESqPoed2EDwsBlld2oDyIBb
 1n0SR2Mifo0GGqcWZAsw7WnKUnM9BBW0UQ8GGNs5LsFW8b3ZiWrOmBsc236TrZFuqq69
 3l1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718999918; x=1719604718;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uZT85xg/u3etg74tod0wWvhARm1bf9HjZcOhri8SiLA=;
 b=FN5P2MiLU9UqHpLiQzZIpDoLBi07zvjHLSGBYiKqsyXd3nIp5tVJIFDrwBTbazi/r/
 sH1FWTx1dGPLG7uHnGrGKJtZ/AIP5iBuiA1mLG/vH/FdHdXPNceUFT3WltQJhJkzO2Tc
 0/wG+8KlCEXuOrkQliLD/ZUl6zdUgqD5mgrsPGuZUe6bPKs2wdVqR3xgxwZONhzFBK0U
 e0mw+ONCezf8g9M2HfLD3L2wH/vnvXxOPrawlI2gEaaIuhpAOEJr1WTODjCC1RkRMT72
 MWKsKSkcjdqviGpeP2OkhCHVXzCr29bBXkJJoriBFyMzgE7sm/9xTHklKShSkxTvDlAd
 qVzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCDRQk2YkalZvTv90iiA8XCz6TTDC3p1EpGD1UB58DphiDBD2ZSrKESjDrgS6Sibm77oe3fGg9es4KeHghZyEH9zhhno32embzEzOgRuPo
X-Gm-Message-State: AOJu0YwfcNiegHotCKFh731t13Uksyxbc8rotMdifOlIiVnfK4bVoYji
 dFSwtacyLwa3wm3j8kLchIKMMfzECN5z5K8pa40K2lOlZxlKUdF2
X-Google-Smtp-Source: AGHT+IFczQG/r/FziE5lHomIhZKAzT1QDlQTYWIYUS249ULPQp3760g6B/uCINnT2+aOuTODaKtM9Q==
X-Received: by 2002:a05:6358:7e87:b0:19f:6bb4:e23b with SMTP id
 e5c5f4694b2df-1a1fd45b454mr1045049155d.18.1718999918391; 
 Fri, 21 Jun 2024 12:58:38 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:30ae:a791:227a:a35f])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-716ba6aa524sm1468593a12.63.2024.06.21.12.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 12:58:37 -0700 (PDT)
Date: Fri, 21 Jun 2024 12:58:34 -0700
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
Message-ID: <ZnXbaubPVAUdDIu0@google.com>
References: <20240427203650.582989-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240427203650.582989-1-sui.jingfeng@linux.dev>
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

Hi Sui,

On Sun, Apr 28, 2024 at 04:36:50AM +0800, Sui Jingfeng wrote:
> Because the software node backend of the fwnode API framework lacks an
> implementation for the .device_get_match_data function callback. This
> makes it difficult to use(and/or test) a few drivers that originates
> from DT world on the non-DT platform.
> 
> Implement the .device_get_match_data fwnode callback, which helps to keep
> the three backends of the fwnode API aligned as much as possible. This is
> also a fundamental step to make a few drivers OF-independent truely
> possible.
> 
> Device drivers or platform setup codes are expected to provide a software
> node string property, named as "compatible". At this moment, the value of
> this string property is being used to match against the compatible entries
> in the of_device_id table. It can be extended in the future though.

I am sorry, but this is not really correct. Software nodes are used to
augment missing or incomplete parameters, but are never primary objects
in the matching process. Sometimes "compatible" property is used with
software nodes, but it does not participate in the matching process.

There are several ways for various buses to match a device and a driver,
but none of them operate on software nodes. Consider for example how
devices on SPI bus are matched (see
drivers/spi/spi.c::spi_match_device()):

1. OF/device tree based match. It *requires* the device to have
dev->of_node which is coming from a DTB. It does not work on software
nodes. In case of match the match data should come from of_device_id
entry.

2. ACPI-based match. The match is done based either on OF-compatible
data (which includes "compatible" property) in _DSD (if driver supports
OF-based matching), or based on HID/CID data. In the latter case the
match data is coming from acpi_device_id entry.

3. Name-based match, typically used for board-instantiated devices. In
this case match is done by comparing device name under which it was
instantiated against names listed in the drivers id_table. The match
data is coming from spi_device_id entry.

Similar matching processes are implemented for i2c and platform buses,
as well as others.

Your patch is effectively hijacks the #3 matching process and
substitutes the bus-specific match data (from
spi_device_id/i2c_device_id/etc) with OF data. This is not expected and
while we may want this in a long term (so we can eventually remove these
bus-specific device ids and only have ACPI/OF ones) I do not think we
are ready for this yet. At the very least this needs to be very clearly
documented.

> 
> Fixes: ffb42e64561e ("drm/tiny/repaper: Make driver OF-independent")
> Fixes: 5703d6ae9573 ("drm/tiny/st7735r: Make driver OF-independent")

As other people mentioned this patch does not fix the aforementioned
commits because they are not broken. In case of non-OF match (which
includes the case where you use software nodes) the match data is coming
from matching spi_device_id entry in the driver.

Thanks.

-- 
Dmitry
