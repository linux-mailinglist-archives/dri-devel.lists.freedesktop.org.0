Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D4688FF6E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 13:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD1410E299;
	Thu, 28 Mar 2024 12:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="ivTCTV7A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E7310E299
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 12:46:10 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1e0f3052145so9005145ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 05:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711629970; x=1712234770;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LTDetgMoFDMdYo+/f65ROtS8ZVAqCz6mWkWnRKEGLi8=;
 b=lF8qOADjXZA3bczqmo2eqcg6+BEZ59jh8jQfTqMIooeQ9CHYEgpyxa8WL5Zu4/vwHp
 vWd+meQKA3unRqb+8JZKup/bOJb7bRt+HToTCgYg6gvoNUQTumysvhkChOGz7hX51/2w
 NY+dFjeMxVSjCEpLnycX0Bh0+8eKfX9dMf5kC+8qXyREQ1yvLDBjFeY0HtRFB1FSrJsj
 cdeEdvy/uLkkDX/27JZ5Gdjz1lEu5SDG0J8dsLP6nQzZMhHEF1vBrQVxTy7N4ZO9PTRI
 GMFBhH+rOt2cxOsVbwL+DoK7vqRxIwckb5ZeCqOPZFeHcBPsyvP38M1Aq1VS23/QmU+I
 vTnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV64vrFtJsjdqHQ3n+uIfutgzLm2dSCSL4TO7eNcovzhnvEcFymn1pZqllX6d6UNH8BPwkT9IwFD6WweHrhGPAZda+18K2tIY1E1VRK1K2P
X-Gm-Message-State: AOJu0YxG+y2+AapKmKNTpIGlXpc81bMWEnNpeDItnh5ie5qbkqb3+2iY
 vpivqHogI4SzlklnKeLqDFRF0lzn2qqe/IrUKtMx0W7CPB4aBwQG
X-Google-Smtp-Source: AGHT+IEEhmPxP0HLaBLqoNVpjIItHLRwRW0RnaGcx72NO0s4/vfI8hmTcXHS732a2Z5eZabhK81l6A==
X-Received: by 2002:a17:902:f54e:b0:1e0:cdcc:340b with SMTP id
 h14-20020a170902f54e00b001e0cdcc340bmr3110653plf.19.1711629969598; 
 Thu, 28 Mar 2024 05:46:09 -0700 (PDT)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 kh6-20020a170903064600b001e0e89f9bfesm1464997plb.264.2024.03.28.05.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 05:46:09 -0700 (PDT)
Date: Thu, 28 Mar 2024 09:46:01 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2024; t=1711629967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LTDetgMoFDMdYo+/f65ROtS8ZVAqCz6mWkWnRKEGLi8=;
 b=ivTCTV7AqA7bEn0lb8P7YlmNMXNPblFn4MUZXCiCZDjUqRXJEU/AKXUMyR4ebB/c7otVus
 m0OhwAu4jIn+nEJRiOv7OgPvLlekcxDN08Fpc1BB2yzz986HdenVZRGp23ZWWrJwTDBDvm
 obEYB0bi1nE2b76rMlnpm7hpgDAQodmA4RAOAmllFemgoI7RWlEVB9TN1rIK7HmU+Q3pH/
 5u29veDfxRN4lvgtmK+4t/FUf296VhcF+udQ7CpD5w19Zcj8wwesHBH1LMyk4rmezetEro
 s8Qq7/PCmt9j/Tmbi2YlB0SComl15y1qFCubJa5fytPEbnvBQBanvuYovsNZXQ==
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
Message-ID: <anuaxqt2zlravjpepkuhqmii3adjdeh3lzal3wwb7rg7krv6uu@7sbwczq3flot>
References: <20240305-class_cleanup-backlight-v1-0-c0e15cc25be1@marliere.net>
 <20240328114131.GB13211@google.com>
 <2024032816-tightrope-lushness-00f1@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024032816-tightrope-lushness-00f1@gregkh>
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

On 28 Mar 13:01, Greg Kroah-Hartman wrote:
> On Thu, Mar 28, 2024 at 11:41:31AM +0000, Lee Jones wrote:
> > On Tue, 05 Mar 2024, Ricardo B. Marliere wrote:
> > 
> > > This is a simple and straight forward cleanup series that aims to make the
> > > class structures in backlight constant. This has been possible since 2023
> > > [1].
> > > 
> > > [1]: https://lore.kernel.org/all/2023040248-customary-release-4aec@gregkh/
> > > 
> > > Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> > > ---
> > > Ricardo B. Marliere (2):
> > >       video: backlight: make backlight_class constant
> > >       video: backlight: lcd: make lcd_class constant
> > > 
> > >  drivers/video/backlight/backlight.c | 29 ++++++++++++++++-------------
> > >  drivers/video/backlight/lcd.c       | 23 +++++++++++++----------
> > >  2 files changed, 29 insertions(+), 23 deletions(-)
> > 
> > No longer apply.
> > 
> > Please rebase on top of v6.9-rc1 or for-backlight-next.
> 
> As I already had this in my local tree, I've sent out a v2 at:
> 	https://lore.kernel.org/lkml/2024032805-putdown-mushy-a0f9@gregkh/

Thank you Greg. I will see what is left to be made const for -next.

> 
> thanks,
> 
> greg k-h
