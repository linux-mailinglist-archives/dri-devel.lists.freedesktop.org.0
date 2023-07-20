Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA19375AF41
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 15:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE6410E5BD;
	Thu, 20 Jul 2023 13:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1FC10E5BD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 13:10:33 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31454996e06so638282f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 06:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689858632; x=1690463432;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=csFhQ6XfWBL2F/LVnpr751g3gT4RNTtnYo/4zK0OLk0=;
 b=AYUTrJHThtegFmXAf21FWbF8FkPLNfod8iIQR1PVenWxKes/7avxrVbGScXvzKy1CO
 7fUbxVzyP8Y7w5wQ33shQE9B6SuVByq/xgGu2rFqG20d03w0+INBqau49dXUNpIQE9Jg
 2jcz427S6KPPOVHeTohn9WzY7XSyPnwnDtpMr3nHuPlfOIMdUvvOLlny2o6kRDmRV0en
 5NXLFAsWd2wcsHgjrCkPHm75FXpwMB/iQjMKRvdgRiTV4hEDo9DaFIAJUr8SsWI+yFmO
 iVk7GAds1/JW8Ojz4KuI3JEXftTvnrwfqDSFv7NMd0FTQlXS37RUTR/syR78nlFOusu0
 S7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689858632; x=1690463432;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=csFhQ6XfWBL2F/LVnpr751g3gT4RNTtnYo/4zK0OLk0=;
 b=j6cwNtNBKewQoV/EuxQ1UmzHURKin8ufDdoy8exyc/KJT6ecvgArdr4y82R7D+vN4U
 SMa2wE55jLE+ib81jOS4kxjbuo6yKt0dA73DOg0FkOgWKJwJVUtuLs2vyPqK4VlYPIDb
 k46Epg/Fw4xoCdjZxtmpDCJb6AEXtAlMvpgDyK/xEzCUQFML9NUz0hRFgyHfLFTCK2NP
 vWFqnPtUkxKLLFnQxwonK6FUgthU0PErWv4ugApFuCmkERJ3onoZr7kwIJJrWyw2qyKJ
 iPpZ4/0Z+m85im9Q+J2L1x4oNtZfGlUx69kYIHkFCNFJd1H/F6XsFikP/bWhL48w71jx
 M0rA==
X-Gm-Message-State: ABy/qLZcFbD+0ktKyEEuEX5WmlRnNZ4ZLlX0GQbJiSZoqD4YGko388Qp
 lqQrWfVxMAFSoA9SgxjVQpbyuQ==
X-Google-Smtp-Source: APBJJlHAQBN4QHX5GQzhjDPb1xmuMYdrMdIrZxUPkEN0IlJOj2W5MMz7ipLHhBJ3k2Q6Q703r7zH9w==
X-Received: by 2002:adf:faca:0:b0:313:f5f8:a331 with SMTP id
 a10-20020adffaca000000b00313f5f8a331mr1555738wrs.34.1689858631923; 
 Thu, 20 Jul 2023 06:10:31 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 a15-20020adfeecf000000b00311d8c2561bsm1317303wrp.60.2023.07.20.06.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 06:10:31 -0700 (PDT)
Date: Thu, 20 Jul 2023 14:10:29 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] backlight: gpio_backlight: Drop output gpio direction
 check for initial power state
Message-ID: <20230720131029.GB2525277@aspen.lan>
References: <20230720061105.154821-1-victor.liu@nxp.com>
 <20230720112742.GA2525277@aspen.lan>
 <CAMRc=MfbWjWTdU4ToFMp_ZV6eGdRnjD--Y+qsN329TsLFGQYxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfbWjWTdU4ToFMp_ZV6eGdRnjD--Y+qsN329TsLFGQYxg@mail.gmail.com>
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
Cc: Andy Shevchenko <andy@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Ying Liu <victor.liu@nxp.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "deller@gmx.de" <deller@gmx.de>, "lee@kernel.org" <lee@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 20, 2023 at 02:56:32PM +0200, Bartosz Golaszewski wrote:
> On Thu, Jul 20, 2023 at 1:27 PM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Thu, Jul 20, 2023 at 06:06:27AM +0000, Ying Liu wrote:
> > > Bootloader may leave gpio direction as input and gpio value as logical low.
> > > It hints that initial backlight power state should be FB_BLANK_POWERDOWN
> > > since the gpio value is literally logical low.
> >
> > To be honest this probably "hints" that the bootloader simply didn't
> > consider the backlight at all :-) . I'd rather the patch description
> > focus on what circumstances lead to the current code making a bad
> > decision. More like:
> >
> >   If the GPIO pin is in the input state but the backlight is currently
> >   off due to default pull downs then ...
> >
> > > So, let's drop output gpio
> > > direction check and only check gpio value to set the initial power state.
> >
> > This check was specifically added by Bartosz so I'd be interested in his
> > opinion of this change (especially since he is now a GPIO maintainer)!
> >
> > What motivates (or motivated) the need to check the direction rather
> > than just read that current logic level on the pin?
> >
> >
> > Daniel.
> > [I'm done but since Bartosz and Linus were not on copy of the original
> > thread I've left the rest of the patch below as a convenience ;-) ]
> >
>
> This was done in commit: 706dc68102bc ("backlight: gpio: Explicitly
> set the direction of the GPIO").
>
> Let me quote myself from it:
> --
> The GPIO backlight driver currently requests the line 'as is', without
> actively setting its direction. This can lead to problems: if the line
> is in input mode by default, we won't be able to drive it later when
> updating the status and also reading its initial value doesn't make
> sense for backlight setting.
> --

You are perhaps quoting the wrong bit here ;-). The currently proposed
patch leaves the code to put the pin into output mode unmodified. However
there was an extra line at the bottom of your commit message:
--
Also: check the current direction and only read the value if it's output.
--

This was the bit I wanted to check on, since the proposed patch
literally reverses this!

However...


> I agree with Thomas that it's highly unlikely the bootloader "hints"
> at any specific backlight settings. That being said, the change itself
> looks correct to me. The other branch of that if will always unblank
> the backlight if the GPIO is in input mode which may not be desirable.

... if you're happy the proposed change is OK then I'm happy too!
I came to the same conclusion after reviewing the GPIO code this morning,
however I copied you in because I was worried I might have overlooked
something.


> I don't see any obvious problem with this change, just make sure the
> commit message makes more sense.

Agreed.


Daniel.
