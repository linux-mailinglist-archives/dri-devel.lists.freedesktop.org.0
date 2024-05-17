Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B3B8C8D78
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 22:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C361A10EF6C;
	Fri, 17 May 2024 20:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3a+QHjxp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960D610EF6C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 20:54:02 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5724736770cso1018a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 13:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715979241; x=1716584041;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vn13dLP5pRrsDv4NOdbcqGoQN2bmYpHdTGHpP55EB4g=;
 b=3a+QHjxpGch8c5zlYnIt809fTClYfG5ahpViULFO91B2N+At+C4yw3n/jFaNJzCexi
 w3POkFk4AXK/NaVdTnvWDYZVyEKmZDsDLxjgGJtnRvcMIx7E5yJBl16cRXXAaBbey3zw
 n+HvnMqgY/7KwNnTqjJSZ0CrNFH3J/K/eitQQ8tJi8VJsnPSB0aDMS2WlDJyaj1bzc1R
 RlbKSKv0I1qO2iHgr4rbbvz4b0UQHPNJBwOLT+IfZnoF04K/SDtjJsLgTvJKn2shn5ld
 r7wydG/8XxwscBhBnEeXoka0YYYKwjd0Xx+CTHYB6/OdK1VJhK72jL7eaT/BdVy4hGJ0
 +T3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715979241; x=1716584041;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vn13dLP5pRrsDv4NOdbcqGoQN2bmYpHdTGHpP55EB4g=;
 b=u+/xec+baPE06nSxYGmcIe+TwaKH24qYwm1YssMe8JSgBbsqBHDQ2yMMjprB+XyAX+
 tAB71obuUMI6UZfK3IYO1lQOQ6JSPHffEWp4SIvAF0B1LheTSjOolylYE2n08h7Xv5gG
 Vdx2nr/2u92uqNsBjwcLR3XkQjkr0b2rOjwulNV5zJqCCic6w1e3X64JysKZx5UVkHXi
 nfLY2bitMWlIScbmDTXt0NGD1qoEIs9sHXmNx/PeQngUDaC5CaQkC5BVCg5vpI36OJHd
 vF900ct/x/q1oBtcm/lTXMB6Ahj3I4qTIGcd9O88Df3T0VK9FCO1NTJJMqRWSixyYDXC
 tSiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXithQtYvyoLvDz9h/iQXAPrJRI9h/BfInyWXVLtwEc+CMSf796+9iNdBTsXiehzZF1auuNmJUlubbqz3JBps5hFWib+TqCSEKlg5/V8lLw
X-Gm-Message-State: AOJu0YzcKnf6ME+SvvB/668yRm705o69xvLSApM89MKOgMcTVhCOH9ku
 +6F0zUCUac9HiM26sSulVFjf5SVHaZE0+7WJV+ICUJtzp0/wmUxMDxcfWfYrTcC3mGFXgckHuvv
 SVlleTWVnEUViifo8p3J+45hdf8dJuMOHCrUp
X-Google-Smtp-Source: AGHT+IFRAIfV54+Aa1LbyF88d23hN+YT1t2sexWDi9c3fyTst75D5FRNvAf6sgXSn3IVxUNlK5yurWk/GWDFHEMqw/c=
X-Received: by 2002:a05:6402:2158:b0:573:438c:778d with SMTP id
 4fb4d7f45d1cf-5752c3f15c3mr3670a12.1.1715979239492; Fri, 17 May 2024 13:53:59
 -0700 (PDT)
MIME-Version: 1.0
References: <20240517171532.748684-1-devarsht@ti.com>
 <20240517173607.800549-1-devarsht@ti.com>
 <Zke6o3HYnUrgtD0K@smile.fi.intel.com>
In-Reply-To: <Zke6o3HYnUrgtD0K@smile.fi.intel.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Fri, 17 May 2024 13:53:47 -0700
Message-ID: <CAGS_qxpCM=Aw1J_EVQPZv_nDy0zCp6JqxfQk5mGkV+5iCe1OZA@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] lib: add basic KUnit test for lib/math
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com, 
 akpm@linux-foundation.org, gregkh@linuxfoundation.org, adobriyan@gmail.com, 
 jani.nikula@intel.com, p.zabel@pengutronix.de, airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com, 
 vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com, 
 detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com, 
 nicolas@ndufresne.ca, davidgow@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, May 17, 2024 at 1:14=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> > [devarsht: Rebase to 6.9 and change license to GPL]
>
> I'm not sure that you may change license. It needs the author's confirmat=
ion.

Checking, this is referring to the MODULE_LICENSE, which used to be
MODULE_LICENSE("GPL v2");

and is now
MODULE_LICENSE("GPL");

If checkpatch is suggesting that now, then changing it sounds good to me.

>
> > ---
> > Changes since v6:
> > * Rebase to linux-next, change license to GPL as suggested by checkpatc=
h.
>
> Note, checkpatch.pl is not false positives free. Be careful
> with what it suggests.
>
> > +#include <kunit/test.h>
> > +#include <linux/gcd.h>
>
> > +#include <linux/kernel.h>
>
> Do you know why this header is included?

I think I had put it in the original before a lot of the work you did
to split things out of kernel.h.
I haven't had time to look apply this patch series locally yet, but
I'd be pretty sure we can remove it without anything breaking.

Thanks,
Daniel
