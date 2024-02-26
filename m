Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87931866772
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 02:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691D810E548;
	Mon, 26 Feb 2024 01:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KaJtEzf1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B210D10E548
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 01:11:23 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a3ed9cae56fso392605566b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 17:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708909882; x=1709514682; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1BlXsF+OuFlUNEpAoVeuxGYC9Hm23Z9ZRhwis7/85k4=;
 b=KaJtEzf1pQDUh9LQiygfH4x3gZyp0sdGalEHDDfXik1z8mRWgVqlbEJnwt2wDdEne6
 oWnthvK8/9Ju+AjGt+dgCGZImE4tyz+9qAoHVUBVzwYZL1YPBFJWQPBxW9pqdmhKKaxz
 YOV7nZ6DuSi9LRiPgSgvdcgbvZhyqN/M3IDijzDAtdcODFm3/XhkUG8mvO3ICstsdKz1
 y63Pq8p+V4YJRSK1gseQLDnvg6nyWvDZHHLstQ+R29Ve4JLf2+nhrSZVw1XquSxNXW9V
 5+UiTWbRiDTDkjv4ATpr6YzOx+qF1E8wri1fJbI0xmPD1J28rHnGk7ZXdhtqDJj2m1wR
 L4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708909882; x=1709514682;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1BlXsF+OuFlUNEpAoVeuxGYC9Hm23Z9ZRhwis7/85k4=;
 b=K87xxz/g9ePX3I0zq42iyg+3M3UmyB3qYKu7JHNB6oVPufdSJhsvfsbGTiPgHs6/wE
 StpyauYAuEzdL3FeNBPuY7b8zveJTmnZtzogCx2KuxPxhxocaDC4WIs/xef8C8U6a73F
 nT0DbCui28Vyv5p9+FGQ4Y7yPbYVmo5JyUKxdz524DLhQqWsntDW6GxR59KFhLlItcYB
 +0EbHl03RgD05NYTo/m7/n3EzNdH055q4g14WnhibFXcl+RZ1LdFF9xW2+nrmNhJ1eYg
 ciKbpf/ovFnxW0kFK083Si/NpwjqgHxvZjR3b7nYX3kTG9f3cVW2xw/G0oUPn5f2NygD
 WMyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUolQaWfbLvYMZszuX/H7kKFcON3nYWBsFmhw2sm/j6HaUUBBndkU6+7Q+4FE8Xtn1RQrsHR4WndTD8YHfhQfnHIl5wBVpKtrTWf/Z8ctF7
X-Gm-Message-State: AOJu0YzigbF+Q4qF8LPFvmHM7rv89Aksvd/fk2MVQPxl+UJyvCWVRj8o
 PbbligSJD3WWj8Ev3RfDcUMthBmAYrNBkehX4JI5ksnh7uy44EXT88K0Hih6IqyqP0WnsMavuDl
 ukfCnJVGfaGzmehKXvJC7OsamCZ4=
X-Google-Smtp-Source: AGHT+IFOehwj84kQIRqQVYwkOgQPHTcWeDJbPeGXLVkMYA3O7eptousMzzl+O5lBqPSUgagXimIE3CIvovIB7VA25zI=
X-Received: by 2002:a17:906:fa8d:b0:a3f:f8a7:e1f7 with SMTP id
 lt13-20020a170906fa8d00b00a3ff8a7e1f7mr5091442ejb.5.1708909881496; Sun, 25
 Feb 2024 17:11:21 -0800 (PST)
MIME-Version: 1.0
References: <0fff52305e584036a777f440b5f474da@AcuMS.aculab.com>
 <c6924533f157497b836bff24073934a6@AcuMS.aculab.com>
 <CAHk-=wgNh5Gw7RTuaRe7mvf3WrSGDRKzdA55KKdTzKt3xPCnLg@mail.gmail.com>
 <59ae7d89368a4dd5a8b8b3f7bc2ae957@AcuMS.aculab.com>
In-Reply-To: <59ae7d89368a4dd5a8b8b3f7bc2ae957@AcuMS.aculab.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 26 Feb 2024 11:11:09 +1000
Message-ID: <CAPM=9tyJQw2OPP=-WTozVuvzRiRrkk-BtZ+82MQCuUmjXBLKbw@mail.gmail.com>
Subject: Re: [PATCH next v2 08/11] minmax: Add min_const() and max_const()
To: David Laight <David.Laight@aculab.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jens Axboe <axboe@kernel.dk>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, 
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 "David S . Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Harry Wentland <harry.wentland@amd.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 26 Feb 2024 at 07:26, David Laight <David.Laight@aculab.com> wrote:
>
> ...
> > Yes, yes, that may end up requiring getting rid of some current users of
> >
> >   #define MIN(a,b) ((a)<(b) ? (a):(b))
> >
> > but dammit, we don't actually have _that_ many of them, and why should
> > we have random drivers doing that anyway?
>
> They look like they could be changed to min().
> It is even likely the header gets pulled in somewhere.
>
> I'm not sure about the ones in drivers/gpu/drm/amd/display/*..*/*.c, but it
> wouldn't surprise me if that code doesn't use any standard kernel headers.
> Isn't that also the code that manages to pass 42 integer parameters
> to functions?

They are all separate in C files, I think we could get rid of them
pretty easily in favour of the standard ones,

Adding Harry to cc.

Dave.
