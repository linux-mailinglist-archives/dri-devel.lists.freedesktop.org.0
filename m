Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFFF89075A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 18:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8879C1124FE;
	Thu, 28 Mar 2024 17:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="Nbi9gXcO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1211124FF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 17:43:26 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-5a46abf093cso795125eaf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 10:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711647805; x=1712252605;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9vr5XsWFJLw7ybCrrKVxNz1sn6zwz/bJc/6H6RbUNG0=;
 b=ak6oqrWnN60l+L0CmjPkadulUlPldH+l7sJ3SdQpT9iTm1V8Q7gbi4QZ2HaFWkyOl8
 zDYzdxLpOtTFfhjozQ8syqRIsUi9ixdJVgaGC1LuZDptbqAfZr4huXGiCIvr5Xrk1R7E
 epC4cmtOeXm9MEkFicDuUzTpVohIJ5cF8aoPu2aAZSk1UPr2kvCpri2WEJjXO0NEWrJF
 n7NcZ93/UVnrrgDVnr5tWgZOTZy6MbIMIIrXO6SieLjv3N1wFiluyPVcnVf2C9+Fr7cl
 IuQB0t/6KcvMdqwSSTZm1EVgSGUeBQGxnlRWLo+P87hb2anDdY2JNBv+Z+8FCZ0oIDdo
 cXKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQBXWHC2c4Gv2kTBJj9mVcjQK2ZcwjnMYhA0ZW3avhu0zk9OImbLVMMQrykAIdU7sOAb8+kVL+s3exnY7hoODkQC6x9btB8dzL0QFWe/EP
X-Gm-Message-State: AOJu0Ywcuat1rDLeQGPep4GBPsQep3d7xt/OV+Vp6NWhY2uE4ey8yQUJ
 KINQXcBrZIOUso6DruXCMj35hJIQQbXdZpD1CtNMfq3uoQSTJXrt
X-Google-Smtp-Source: AGHT+IHaNpbaz/HDGu7VcRVzlq5wmBVR+jd4KotHDGtbxum8Y0dFyx1RYgsRz1lnxxh3nMkEQZYc3Q==
X-Received: by 2002:a05:6358:8a9:b0:183:55a6:b239 with SMTP id
 m41-20020a05635808a900b0018355a6b239mr50469rwj.2.1711647805317; 
 Thu, 28 Mar 2024 10:43:25 -0700 (PDT)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 c192-20020a6335c9000000b005dab535fac2sm1545837pga.90.2024.03.28.10.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 10:43:24 -0700 (PDT)
Date: Thu, 28 Mar 2024 14:43:18 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2024; t=1711647802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9vr5XsWFJLw7ybCrrKVxNz1sn6zwz/bJc/6H6RbUNG0=;
 b=Nbi9gXcOc5NcUrstW9X8nn8RlBwi2uHsy2Y32aP2LfHT9yVaTezwxWLxd8PgX5FGtM36DQ
 J2t1xftR/bP/t7FKdz2Y8CUF3W614ML3MHYihRpCfNNbc3+3dn2AjIhqOXzysJrVMP0hf7
 1UzenDadzbEhOnYdG0JsM64KojgNdSryHwTUmQ5K8wDfQNgAymvxvXo8ChVeK6LJUTqoE3
 z8u5RzABxwyrQq0C2ZsxGqMXCzHOLLoFtif0v5pfic0F/IM3bjrl5D17HlBqnMrDxFcR+0
 kQ0rIy8dWwO9Ca3kh1eplvOwhTvsqGcGLWY01wc5zsbRNYczMrUG/EGIdHCskQ==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] video: backlight: constify struct class usage
Message-ID: <zzbvkpcaxgmj3t5qzgiacazsaf5cfn7vjopt56c3ngfvtiskq2@igc4vue7ltqp>
References: <20240305-class_cleanup-backlight-v1-0-c0e15cc25be1@marliere.net>
 <20240328114131.GB13211@google.com>
 <2024032816-tightrope-lushness-00f1@gregkh>
 <anuaxqt2zlravjpepkuhqmii3adjdeh3lzal3wwb7rg7krv6uu@7sbwczq3flot>
 <2024032817-avatar-agony-c17d@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024032817-avatar-agony-c17d@gregkh>
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

On 28 Mar 17:49, Greg Kroah-Hartman wrote:
> On Thu, Mar 28, 2024 at 09:46:01AM -0300, Ricardo B. Marliere wrote:
> > On 28 Mar 13:01, Greg Kroah-Hartman wrote:
> > > On Thu, Mar 28, 2024 at 11:41:31AM +0000, Lee Jones wrote:
> > > > On Tue, 05 Mar 2024, Ricardo B. Marliere wrote:
> > > > 
> > > > > This is a simple and straight forward cleanup series that aims to make the
> > > > > class structures in backlight constant. This has been possible since 2023
> > > > > [1].
> > > > > 
> > > > > [1]: https://lore.kernel.org/all/2023040248-customary-release-4aec@gregkh/
> > > > > 
> > > > > Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> > > > > ---
> > > > > Ricardo B. Marliere (2):
> > > > >       video: backlight: make backlight_class constant
> > > > >       video: backlight: lcd: make lcd_class constant
> > > > > 
> > > > >  drivers/video/backlight/backlight.c | 29 ++++++++++++++++-------------
> > > > >  drivers/video/backlight/lcd.c       | 23 +++++++++++++----------
> > > > >  2 files changed, 29 insertions(+), 23 deletions(-)
> > > > 
> > > > No longer apply.
> > > > 
> > > > Please rebase on top of v6.9-rc1 or for-backlight-next.
> > > 
> > > As I already had this in my local tree, I've sent out a v2 at:
> > > 	https://lore.kernel.org/lkml/2024032805-putdown-mushy-a0f9@gregkh/
> > 
> > Thank you Greg. I will see what is left to be made const for -next.
> 
> Many of your patches were not picked up for -rc1, I'll be taking a bunch
> of them into my tree "soon" as that usually means the subsystem isn't as
> active.

Yup, I was keeping them in my inbox so as to resend but if you could
pick them that would be great!

Cheers,

> 
> thanks,
> 
> greg k-h
