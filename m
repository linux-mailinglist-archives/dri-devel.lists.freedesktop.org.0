Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CABFC8B3010
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 08:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC4111215C;
	Fri, 26 Apr 2024 06:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="WEO+u9OS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358BD11215C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 06:10:15 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-db4364ecd6aso2019226276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 23:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1714111815;
 x=1714716615; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJ1GdTZvweAfdVmldBDNtC2yfd/6DMLGLYkaIty7Abc=;
 b=WEO+u9OSZQbaZ4TWr6uL4QBuIwmrIsIEjxqY26spNBB4+AxqSUWC+V/EMbPe3myHDb
 Oo9kws1grdZRqQBUGhd5LZQYF6S8IjpQxzB1EOJxQbh83ZRdJLp4IYuQ9Y3+EK4Z3yCi
 fSv961dXpfr91HgAgl24nwBM7qa4TBDBMy7gzcuA++3wzKjq6XMPuqZMY779RXeTExT1
 Qq5EOJ6QbTQjD6pQvgdGgjQhe+uI5OuhIY/UlconjCY8mpn969pjJFcAXydn8sp+oRjP
 d2mWpMS548My2Ygr9VyzGwKZgRuC0gyTgM4wdFRHbx0A/jSSV4LOWg6UwJNf7REyushk
 MYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714111815; x=1714716615;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EJ1GdTZvweAfdVmldBDNtC2yfd/6DMLGLYkaIty7Abc=;
 b=kipnsQwo0xMN80B+fKsHZpoxESuzotDb39CRopPp+cLGnY441OWpV8JZwzzwB/F5qV
 hKb/62KVzLMmz6iLAATgDl3p3V60oVWksCoULVItHPLCIqJt2aBPtaNtMEFgVtIGQvxV
 ugo32PYgEb3FrNAdjW9/y/KqSNmIr5BF5/HNE2fyOSPMNVdI8Hl6j6iU/etnALauRUyd
 QVWWVE3+id0sQhjE+VokXPgToDHd1b00nfUR9PmFB+N+F/WK0M+xg4PqmDJKXyhP5ZAt
 nvxsVuFc7nlkfIcsQlCqovN2XFyXcd1sxEEyHnhcboN234uvwolk6N9uuRJU9SU0MYbz
 Q0jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwgkjcJtfmrKTIknRdtyl03m2l3WeEyBA4y2IbwHNudIQqv/JDiQyn8yXO4YCkTsO2CdPffIBNRiom30e/ac6N1GYlWzuTR4BmB9DXBY//
X-Gm-Message-State: AOJu0YxAZOc2y9xCrJHQHXdJWaH7FpPn6zTbfn3DpKerxMCdAyXG2HQ9
 wrHe18HnOqu6e7FEqZmOuA7mNOLLdYIKfa3GagN2JkZrbg14kay5csYjs7DHFAzywkWg8Mt4pLn
 Hu61buA==
X-Google-Smtp-Source: AGHT+IHlZ2ur24tA9w+qawwXye4yK0UgjcstfqtIEww9XJV9C16Ae22n5Rnnt/I7mN59AEO5rNW2VA==
X-Received: by 2002:a05:6902:1351:b0:dd0:bb34:1e77 with SMTP id
 g17-20020a056902135100b00dd0bb341e77mr1928579ybu.53.1714111814710; 
 Thu, 25 Apr 2024 23:10:14 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 cj6-20020a056902188600b00de4f5e1e45bsm3228271ybb.54.2024.04.25.23.10.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 23:10:14 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-de5809cd7b0so1999213276.0; 
 Thu, 25 Apr 2024 23:10:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXUpIEAHFmj5IxZ9WWGzM1HF4j3FLOkm0KzWqechpM2UuHdFPoIsfmax55Hhz74EFvmLazsydphjt1Z/unSaGEpVJtR/o1rfsNqiRaY6weVzKCp95vgRa9ydkh3e4mYVnpUEovKJKtpbc49Rs5x/w==
X-Received: by 2002:a25:b1a2:0:b0:de5:4eef:542d with SMTP id
 h34-20020a25b1a2000000b00de54eef542dmr1914263ybj.57.1714111813984; Thu, 25
 Apr 2024 23:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
 <8c55dba5-6308-685e-13da-e728197d8101@quicinc.com>
In-Reply-To: <8c55dba5-6308-685e-13da-e728197d8101@quicinc.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 26 Apr 2024 08:10:02 +0200
X-Gmail-Original-Message-ID: <CAAObsKD4-k7Ya4Mi=vEPaC9DucbnVGDO5SaEUt-_o2_Bg+_FgA@mail.gmail.com>
Message-ID: <CAAObsKD4-k7Ya4Mi=vEPaC9DucbnVGDO5SaEUt-_o2_Bg+_FgA@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>, 
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Thu, Apr 25, 2024 at 8:59=E2=80=AFPM Jeffrey Hugo <quic_jhugo@quicinc.co=
m> wrote:
>
> On 4/24/2024 12:37 AM, Tomeu Vizoso wrote:
> > If we expose a render node for NPUs without rendering capabilities, the
> > userspace stack will offer it to compositors and applications for
> > rendering, which of course won't work.
> >
> > Userspace is probably right in not questioning whether a render node
> > might not be capable of supporting rendering, so change it in the kerne=
l
> > instead by exposing a /dev/accel node.
> >
> > Before we bring the device up we don't know whether it is capable of
> > rendering or not (depends on the features of its blocks), so first try
> > to probe a rendering node, and if we find out that there is no renderin=
g
> > hardware, abort and retry with an accel node.
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Cc: Oded Gabbay <ogabbay@kernel.org>
>
> I hope Oded chimes in as Accel maintainer.  I think Airlie/Vetter had
> also previously mentioned they'd have opinions on what is Accel vs DRM.
>
> This gets a nack from me in its current state.  This is not a strong
> nack, and I don't want to discourage you.  I think there is a path forwar=
d.
>
> The Accel subsystem documentation says that accel drivers will reside in
> drivers/accel/ but this does not.

Indeed, there is that code organization aspect.

> Also, the commit text for "accel: add dedicated minor for accelerator
> devices" mentions -
>
> "for drivers that
> declare they handle compute accelerator, using a new driver feature
> flag called DRIVER_COMPUTE_ACCEL. It is important to note that this
> driver feature is mutually exclusive with DRIVER_RENDER. Devices that
> want to expose both graphics and compute device char files should be
> handled by two drivers that are connected using the auxiliary bus
> framework."
>
> I don't see any of that happening here (two drivers connected by aux
> bus, one in drivers/accel).

Well, the text refers to devices, not drivers. The case we are talking
about is a driver that wants to sometimes expose an accel node, and
sometimes a render node, depending on the hardware it is dealing with.
So there would either be a device exposing a single render node, or a
device exposing a single accel node.

Though by using the auxiliary bus we could in theory solve the code
organization problem mentioned above, I'm not quite seeing how to do
this in a clean way. The driver in /drivers/gpu/drm would have to be a
DRM driver that doesn't register a DRM device, but registers a device
in the auxiliary bus for the driver in /drivers/accel to bind to? Or
are you seeing some possibility that would fit better in the current
DRM framework?

> I think this is the first case we've had of a combo DRM/Accel usecase,
> and so there isn't an existing example to refer you to on how to
> structure things.  I think you are going to be the first example where
> we figure all of this out.

Yep, I will be grateful for any ideas on how to structure this.

> On a more implementation note, ioctls for Accel devices should not be
> marked DRM_RENDER_ALLOW.  Seems like your attempt to reuse as much of
> the code as possible trips over this.

Indeed, thanks.

Cheers,

Tomeu

> -Jeff
