Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95311130A1E
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2020 23:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C7989DC7;
	Sun,  5 Jan 2020 22:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCC489DC7;
 Sun,  5 Jan 2020 22:08:13 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id u17so15552992uap.9;
 Sun, 05 Jan 2020 14:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gN32nj0fCJV1JTpdvkxbljfmBSVYN/OI2ByyfTw0WlA=;
 b=DH/djuKMsWL5Ji9Mluc7+DUJAPlPGwfTWrEJA06R1Gl4RMN200Cvg4hxzeiLl27fJ6
 7+V6vdsKgEeisXdUU4plTEPrbTYyy5/KrVeSfrjXWra9+2Hm8T4rxOJHrVRpFFBC/iG5
 uw6b6pflkhHdnMX/7hPUT9c/YEY0mm4JSf1w/vZ4vTT9tT+i63PeQf6CEXMtEp582ybR
 VbVZEVzvCvmFSjI7XzsFa0rSFL04ZbjmefKfEjGDaGNA8ZRxnKRofPlIs4M+Pi2OMSjC
 n/VAaw/3DOvNeKbDPHGZ8IASRk/F3s4Hs/YRKWmZ6dtc6NkYxpZsphMuvupJHSQ5R0r5
 C9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gN32nj0fCJV1JTpdvkxbljfmBSVYN/OI2ByyfTw0WlA=;
 b=c5i+M2c29R3mknSGYVAsYuOUtagMoCsUhEt2G2N6MzGxzyHuI1VXidPJU8b4rtLA6v
 RI/qS2H3Awj5tahYk8yGVX/1NtA4ERLm9U+0iY8idFp542f00xvYdH6N1OCBrEJLo1ag
 AzI9c0AKxGCmxFPjBvhDCDFk5/17hpSKjnRcP7Fs+cZBlA/QOtmvqXLhnop/Wp5/N4CG
 dbjc/T1h1t6s1PMeT1n7dXEJV+x1GFx1a8tCoCQb3gCJKebdk+PAaiN2ki9sH1pXuLCU
 h/qkhJwz+GOqcabgxhEOXtLneOF8Pa/BT78vVB6F+LbZqUvyYu4Lumh/PzZ6ARp6ZtEs
 HX5w==
X-Gm-Message-State: APjAAAVvCQJyX7rFJJ/420VBOTYNLevJ1x1O4oeXvodmAiRljm7yn10b
 933qR0oKXQhRiiknTufV3LmAPqV8dXpE2UE3lM0=
X-Google-Smtp-Source: APXvYqwVhdsTLtyEOlLYzgTMx5J4xh1D/3v3AigHUqzVPMqquC3uNYmIjP2M9M2z3U81JKr4ewrVpFI1uOHTkV7btNM=
X-Received: by 2002:ab0:72d0:: with SMTP id g16mr55270503uap.11.1578262092346; 
 Sun, 05 Jan 2020 14:08:12 -0800 (PST)
MIME-Version: 1.0
References: <20191231205734.1452-1-wambui.karugax@gmail.com>
 <20200101185147.GB3856@dvetter-linux.ger.corp.intel.com>
In-Reply-To: <20200101185147.GB3856@dvetter-linux.ger.corp.intel.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 6 Jan 2020 08:08:01 +1000
Message-ID: <CACAvsv5SF18v7t8kbo0LPQi3L8U3xGGf70_UEfOnKdHu89yo9A@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: use NULL for pointer assignment.
To: Wambui Karuga <wambui.karugax@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Dave Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 ML nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Jan 2020 at 04:51, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Dec 31, 2019 at 11:57:34PM +0300, Wambui Karuga wrote:
> > Replace the use of 0 in the pointer assignment with NULL to address the
> > following sparse warning:
> > drivers/gpu/drm/nouveau/nouveau_hwmon.c:744:29: warning: Using plain integer as NULL pointer
> >
> > Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> I'll check with Ben next week or so whether he wants to pick these up or
> whether I should stuff them into drm-misc-next.
I'll grab them.

Ben.

> -Daniel
>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_hwmon.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > index d445c6f3fece..1c3104d20571 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > @@ -741,7 +741,7 @@ nouveau_hwmon_init(struct drm_device *dev)
> >                       special_groups[i++] = &pwm_fan_sensor_group;
> >       }
> >
> > -     special_groups[i] = 0;
> > +     special_groups[i] = NULL;
> >       hwmon_dev = hwmon_device_register_with_info(dev->dev, "nouveau", dev,
> >                                                       &nouveau_chip_info,
> >                                                       special_groups);
> > --
> > 2.17.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
