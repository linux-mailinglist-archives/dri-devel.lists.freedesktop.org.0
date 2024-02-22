Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CB88604D5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 22:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C3E10EA93;
	Thu, 22 Feb 2024 21:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IfZOTuV9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D850210EA9E;
 Thu, 22 Feb 2024 21:31:19 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-6083befe2a7so2626807b3.0; 
 Thu, 22 Feb 2024 13:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708637479; x=1709242279; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wUw2xYuDibxwJNkicWQfSsXUxs7Znk2YsGnDeUj+5YE=;
 b=IfZOTuV9M9v4Ku43bhyNKdXOtB7BIO9y/5RFds4WUa7Xwi5k/sHdSmilIt22QZRoEX
 sgrQ2ynqjLKYjS4fkcUkfZPlzX7cll1dqepeu40cy801SLqO5QozGrYe/Jm9orhoOhs+
 wTPjeOjXPOyLZAPjiJi7WBguk5txQ0ZLrCqbjP9x3OgXfU1R7d2dMuik9l28AP2JqBiY
 v35Lw21AtZuPhxHlklOv6RXquIemhTyaY8n8Yy1BaTg9WyhF+su7pPvsqNf94KdGtGOA
 xaFh8J6Oar5gB1b5wjh28/BoaDEW71RwRHjUwplOPfs1bkdHozGg/So6+5PBoODnUr3X
 ZZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708637479; x=1709242279;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wUw2xYuDibxwJNkicWQfSsXUxs7Znk2YsGnDeUj+5YE=;
 b=iCbOo+4CIzWTNnDEZxzjI5Cba7ztf/ia5NGdaQIbGGPVjhsXa/V2ZY3nQzwUWl+aME
 qSKZacreVRFvFMXZ5F9a9wBvbiJ6ZGTqIc4f10pzOscCm6/fYO1XuFk0ctJJBWt6UrW4
 EQuKeRUvlNte221/jH0+oajz3hAwS8caVvtMCZIfta8HcQfzIYNRdKiCjlJ9O1gtbMQY
 /yQTtgQ0uU/yHvIqvR7JcV1XhLRGqwsbZ9CdfYvoM8HQWStE6tkEdApxdkgvggYu/7cH
 zlaEiXhqVLfXy3F/+dGS4mY7f+6yZGL4QV8av2/KFpPdcnOYjzLj7SXIAW+EcLZHlR/R
 joVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWjIsSR6DjfdUm5xdwQC6fY5KGhKNxo+8rQT9HqFJwLrVq7aGeOCPJ5XslibgMv6AStthYLxp5hhoo0chkC3LnXrGBe29Bf4ZE1VnBGrjzxIL3KPnQFgrAo5BJwY8m9x+9zP+zokoREyRarFRrtI1gXPRVJBlWs+ZFMGbWJ2qPIGZbACaxVlJN5rQ6AVeB5AU=
X-Gm-Message-State: AOJu0YyrUGFxnj3W/c26Tl81Kqcsn3o2JeA3zZ3rAMg7+e7NRpAnw2pD
 uHY91mTLWMI/EFYafh5xQMY2DJyu3rGHf+vuQZWz9VyNj3NQbUey
X-Google-Smtp-Source: AGHT+IEJzEq+ITFpoFT5d2FCW0FabJu/wW6r9SFjgCowaIPDswaadHMeAEHodcDXQSdliSMncRMnMA==
X-Received: by 2002:a81:451d:0:b0:608:b15e:4686 with SMTP id
 s29-20020a81451d000000b00608b15e4686mr380500ywa.16.1708637478751; 
 Thu, 22 Feb 2024 13:31:18 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:6d56:5106:b1c5:46d5])
 by smtp.gmail.com with ESMTPSA id
 u129-20020a816087000000b006083c19ea91sm2041632ywb.66.2024.02.22.13.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 13:31:18 -0800 (PST)
Date: Thu, 22 Feb 2024 13:31:17 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: Re: [PATCH v3 1/3] bits: introduce fixed-type genmasks
Message-ID: <Zde9Je1C0LLbXE6z@yury-ThinkPad>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-2-lucas.demarchi@intel.com>
 <CAA8EJpprfrtOjNzT6TFhV1n6MXzLdTahanfxcRW4uVjeHaBduA@mail.gmail.com>
 <ZdZlVn9BI-0q1Xdn@smile.fi.intel.com>
 <btssirjumey2kcp5dyhe6m3embdwd5bswjz3c6swrhxfijfhld@lztxaptkegw6>
 <ZddfF7kb54o2c/QR@yury-ThinkPad>
 <Zddiav19kX8FGKY9@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zddiav19kX8FGKY9@smile.fi.intel.com>
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

On Thu, Feb 22, 2024 at 05:04:10PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 22, 2024 at 06:49:59AM -0800, Yury Norov wrote:
> > On Wed, Feb 21, 2024 at 03:59:06PM -0600, Lucas De Marchi wrote:
> 
> ...
> 
> > +#define __GENMASK(t, h, l) \
> > +	((~0 - (1 << (l)) + 1) & (~0 >> (BITS_PER_LONG - 1 - (h))))
> 
> What's wrong on using the UL/ULL() macros?

Nothing wrong except that in the !__ASSEMBLY section they all are
useless. And having that in mind, useless macros may hurt readability.
 
> Also it would be really good to avoid bifurcation of the implementations of
> __GENMASK() for both cases.

Not exactly. It would be really good if GENMASK_XX() will share the
implementation (and they do). The underscored helper macro is not
intended to be used directly, and I think nobody cares.

> ...
> 
> > -#define __GENMASK(h, l) \
> > -	(((~UL(0)) - (UL(1) << (l)) + 1) & \
> > -	 (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
> 
> This at bare minimum can be left untouched for asm case, no?

As soon as we have to have different versions for the macro depending
on __ASSEMBLY__, I would prefer to remove all compatibility black
magic. After all, the <linux/bits.h> machinery to me is about the same
level of abstraction as the stuff in <linux/const.h>, and in future we
can try to remove dependency on it.

This all is not a big deal to me. I can keep the old implementation
for the asm, if you think it's really important.

What are you thinking guys?

Thanks,
Yury
