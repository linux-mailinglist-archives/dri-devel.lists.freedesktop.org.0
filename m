Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAAA8B0FEE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 18:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0FC113C6E;
	Wed, 24 Apr 2024 16:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ehy/5vnG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D101E10F74C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 16:34:58 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-51967f75729so5101e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 09:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713976497; x=1714581297; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zmM7lELFzDnGc6ZurObVedqGSv5yidRsKIMWiDcLanw=;
 b=Ehy/5vnGWWvvbUqwCvZ05SR2XvJPCwqB+gUWJigop9ZMZ2mIx9B8h+4Yu6pj+TjmpN
 XNdQxbEXqPce8laUNcK4RpiGXkWn9ur7IpIxtVuz9mgurvm+WB70G80nERLJb/zVyVAs
 lWfmhz8l2DXx1fsvEMNI2YJcmdcGa3FL+4ZZ54kM86cDwPIU7uYlOXGk7wvrRN+qVLV1
 aRhh3cyWpactBFTTmkZZlpqNvsFfHwlKM+8y7BpOEymi6kQwww7d0mCq+9X5O5g5zdcA
 PZ09TCNcHq9Uu8IvpEAoe/HCT2lZ+x7UK7LAx4DE9elloAl6x6K8ybr0pfJY1DSAgRHM
 UXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713976497; x=1714581297;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zmM7lELFzDnGc6ZurObVedqGSv5yidRsKIMWiDcLanw=;
 b=l/1BjNTS0590pebEKtDnFbAhuSQuAKd11ENEm5oVPN1Bc3ABsl3PT55WGTNzqrcb7G
 8u9CgPQ9SyUS9F6dZOGedxylVbOfQ1qQiybFWLK+jQhLtI3KsYCbHeGmNTWc9yQlUTt7
 L2k3u4Fm/GmgcRu8s4WhBYU5kG00Vc6eoPqshesrGQ8uAgCx8EcBkq/0OxoCKZQ03gb9
 R2ePNzogej42QnCoSvUDkpGf6t0QwxRiJF71mse5EG06VBvOJgYibZbM+lQVB/rUOtXW
 P1ZUQzJQa4Fz4Fr6svFn7GGsuwW5IxUjtTVJZ+Hab5uXBPdwIeOdwffe831AU/cMzTXf
 7qZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVecIuYNvfGoUfMbLbRN/E0NgObLpDaB7vHZuG5kqCG8pfWxXGv5qXbvvZZbkCcipG1k44O5lYMWybWWDvBCt4hJQXilvGHR34bDOCeL40U
X-Gm-Message-State: AOJu0Yz5ZB+FTlj2L898Qn3zlXnN0+cr9mHbX+hH9NjGrxold39DIqrI
 zaiIvFRkLIgae6qKbFP1Lr/AWP73haF1DUSdoRRVZuh805xhcnj25lawSSYOxGE=
X-Google-Smtp-Source: AGHT+IHEuFcRmsP4kFacjkpHRKtzhOGVaaVSjSmCp/pdIJ+sH4pCvIEVYuesx7A1/mQPkGI1d1iWBQ==
X-Received: by 2002:ac2:47e7:0:b0:519:1503:9566 with SMTP id
 b7-20020ac247e7000000b0051915039566mr1987909lfp.56.1713976496664; 
 Wed, 24 Apr 2024 09:34:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a056512388900b00518fadeed0fsm2430866lft.115.2024.04.24.09.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 09:34:56 -0700 (PDT)
Date: Wed, 24 Apr 2024 19:34:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org, 
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2] software node: Implement device_get_match_data fwnode
 callback
Message-ID: <kucey3jsydjye3ndflns3cqolcpizhnxgzz3fkmcatlnpbnwrk@22ulsqfh2vf6>
References: <20240422164658.217037-1-sui.jingfeng@linux.dev>
 <Zie3ebHOEpWHj1qV@smile.fi.intel.com>
 <d5bc1e73-a553-451e-ab74-f5f0ca259c6b@linux.dev>
 <hcltp2bbxxg2t7ibmzgiib7mgbwgmvzwnnq6mochdh7c4h76r3@bxj6yk5zq64e>
 <ZikE4qOVO7rgIs9a@smile.fi.intel.com>
 <CAA8EJpr1FSjizAh6Dp5Bmux3NrGYh=BfHFL4D1fa87Og4ymY0w@mail.gmail.com>
 <Zikck2FJb4-PgXX0@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zikck2FJb4-PgXX0@smile.fi.intel.com>
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

On Wed, Apr 24, 2024 at 05:52:03PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 24, 2024 at 04:34:39PM +0300, Dmitry Baryshkov wrote:
> > On Wed, 24 Apr 2024 at 16:11, Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Wed, Apr 24, 2024 at 12:37:16AM +0300, Dmitry Baryshkov wrote:
> > > > On Wed, Apr 24, 2024 at 12:49:18AM +0800, Sui Jingfeng wrote:
> > > > > On 2024/4/23 21:28, Andy Shevchenko wrote:
> > > > > > On Tue, Apr 23, 2024 at 12:46:58AM +0800, Sui Jingfeng wrote:
> 
> ...
> 
> > > > But let me throw an argument why this patch (or something similar) looks
> > > > to be necessary.
> > > >
> > > > Both on DT and non-DT systems the kernel allows using the non-OF based
> > > > matching. For the platform devices there is platform_device_id-based
> > > > matching.
> > > >
> > > > Currently handling the data coming from such device_ids requires using
> > > > special bits of code, e.g. platform_get_device_id(pdev)->driver_data to
> > > > get the data from the platform_device_id. Having such codepaths goes
> > > > against the goal of unifying DT and non-DT paths via generic property /
> > > > fwnode code.
> > > >
> > > > As such, I support Sui's idea of being able to use device_get_match_data
> > > > for non-DT, non-ACPI platform devices.
> > >
> > > I'm not sure I buy this. We have a special helpers based on the bus type to
> > > combine device_get_match_data() with the respective ID table crawling, see
> > > the SPI and I²C cases as the examples.
> > 
> > I was thinking that we might be able to deprecate these helpers and
> > always use device_get_match_data().
> 
> True, but that is orthogonal to swnode match_data support, right?
> There even was (still is?) a patch series to do something like a new
> member to struct device_driver (? don't remember) to achieve that.

Maybe the scenario was not properly described in the commit message, or
maybe I missed something. The usecase that I understood from the commit
message was to use instatiated i2c / spi devices, which means
i2c_device_id / spi_device_id. The commit message should describe why
the usecase requires using 'compatible' property and swnode. Ideally it
should describe how these devices are instantiated at the first place.

-- 
With best wishes
Dmitry
