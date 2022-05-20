Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B2553096B
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 08:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EBD10E633;
	Mon, 23 May 2022 06:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6F610FB09;
 Fri, 20 May 2022 11:46:56 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2ff53d86abbso65211917b3.8; 
 Fri, 20 May 2022 04:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LvK1caeQxb9KXazkizcf3d27KbFbgghmEF5ekNypSGY=;
 b=n3xny0d9arYSZvKyYfYQqYA+fDV7wvSw64khYUSgOaV/MAxad3FGgixBfFCgqECZSn
 f/E2dIGte3Tp38jPNIBIr3kraMm0SvFd1s2Ip0J3vrsXSj/72GGNlOobru8kLjw3ZesJ
 sMxVGXvvN6pZ8lMeSoFg4ZDpCiGTjuR8turZaxQUjTMW+Z375/FXGnFK4+Jv2brfet0/
 /tVhxZD8i/+wqKtCrKEQdwUkAhs0I5qbDIhFjZ2EC2rYuDIWqbCcTwPuUx163IuigoST
 DeL1d90slou34d5xpsK3XLYAp4A56l4wgyE3JX9HCqrWEcDnX4Cl7f0KWabehJnhHRTa
 oP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LvK1caeQxb9KXazkizcf3d27KbFbgghmEF5ekNypSGY=;
 b=YOYBNPTTVhJH3vwFrdbOTPDdbGMjVjTtzQYQp9T0LjFyUGojlEMxdRZkwfKTSdP4/V
 yy+zqAwAsSfZd8eICNm4vBTGEwffWrOSt0Cqrw/wvHj9/Xs0k5vVM9/ZDi8kv5lg2Ssn
 GnC0xUsUBgSlBKJSOn6vkD993Zis1kd+kXVlwLusozro8w+VJXrCfpz3Y/a81wPSgGOK
 mfA5oLE4XH0bErWZriF0w5skp6iGB9Zai+hOXyw1NGXtPafPDIUaJ3MdiO2+xAE2OsQI
 78Q4GB11p9417S0MkI78SWg5NmIsZ+sQ+o2i6ibqeuZjJTSzATihyL9MpKHxDZalaNsJ
 iBew==
X-Gm-Message-State: AOAM5320kHDQ+v5ihVlmqGLWIagjT0H7C1/Pj5Z5dfioMDNsgt9+NMlN
 9Wam5vibexvjf/aSSb7+vF+FSZijW/B4M0uXU3s=
X-Google-Smtp-Source: ABdhPJxgmc9raicYMaTIo3RczLBaRcTTyXZb6+XLRybmGrC18fZQoE1d9vGQPJa6209OsXD8K0jSGFxGdih9hN3TSVY=
X-Received: by 2002:a81:d86:0:b0:2ff:2258:f9b3 with SMTP id
 128-20020a810d86000000b002ff2258f9b3mr9683681ywn.355.1653047215473; Fri, 20
 May 2022 04:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <ac39455b-b85c-4cf7-8cd0-089325c9514a@redhat.com>
 <c703a49c57d77f4fcadba09a55fa926049dfe114.camel@redhat.com>
In-Reply-To: <c703a49c57d77f4fcadba09a55fa926049dfe114.camel@redhat.com>
From: Computer Enthusiastic <computer.enthusiastic@gmail.com>
Date: Fri, 20 May 2022 13:46:44 +0200
Message-ID: <CAHSpYy37aDAxGKR8ZbPC+C3bFxeyYqG8X1Px4h89MSxKLAak=A@mail.gmail.com>
Subject: Re: [Nouveau] nouveau lockdep deadlock report with 5.18-rc6
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 23 May 2022 06:25:06 +0000
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Il giorno mer 18 mag 2022 alle ore 19:42 Lyude Paul <lyude@redhat.com>
ha scritto:
>
> Yeah I noticed this as well, I will try to bisect this the next change that I
> get
>
> On Tue, 2022-05-17 at 13:10 +0200, Hans de Goede wrote:
> > Hi All,
> > I just noticed the below lockdep possible deadlock report with a 5.18-rc6
> > kernel on a Dell Latitude E6430 laptop with the following nvidia GPU:
> > [..]
I hope not to be off topic in regard to kernel version, otherwise I
apologize in advance.

I would like to report that I'm constantly observing a similar, but
somehow different, lockdep warning (see [1]) in kernels 5.16 and 5.17
(compiled with lockdep debugging features) every time I activate the
Suspend To Ram (regardless if STR succeeds or not).

Thanks.

[1] https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues/547#note_1361411
