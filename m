Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FB727DE56
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 04:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93FB6E11E;
	Wed, 30 Sep 2020 02:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F9F6E11E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 02:11:25 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id n13so126691edo.10
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 19:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=A5w5EPUx8i9QIj/BIW4f3NBFiFNrTM0jbg3P8cjKU8s=;
 b=Z/U2wwbHfPIq8WeqDTkOgVHfiH3me38nRZYKQqUyAOWS5efdN12r4tHa1jb0TEx2xQ
 n4VO9cqB4ndt3uOKiYoB+pF3uTaRBdcuXR2L+hXojxFEa3Jf4pHfsZNx6O322RfVApK7
 6tA+8r5RpZErS5AVRNMMQT1t7W/UdhPRaSM8fG7xtecobU8NipX47mZfZqd7HVnlK1WV
 Ki2+IZ40Kxl+A/oAu0SOV99YPCLZZRrZ/mlSQGg1Gt9VaAQEKF5JTgQ8wHLJ/nSymdmy
 P3EiYU1G9Xljnz0X19ItaAmYJL9kBd1h9/6hFUZftsC76XctDMCmWfCIwM0Ues/Ly2It
 aUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=A5w5EPUx8i9QIj/BIW4f3NBFiFNrTM0jbg3P8cjKU8s=;
 b=unC9eHymjTHN9BmanJZrij1jnOjpUAIhxAbED5hMRYI+kaqiLVTUjSJpJ1ZB4fJJH2
 E0pYRznMIYXs1jP2OTCmAXnSG9Dei60do3CQvvF5lxnyMYgqc2DxzAYZYKMmz8kZeqqy
 SCIKqMap8rRNKtKLadh9Fy2ZGC2uZ7i2YGzWZymEDYV1UlDI2qo4DznqPHrYKwmp79JJ
 wYa/ZP2k9HMHOydo+hdyyRQsO73PqAAjwn50OgNX2dQyL+H8ht3JmeubHm744K/XCihv
 hdLQIhzzAvLvWZHUQapApss4incxCgjdv7sFRlP0pjtTPRjl1uofHPjC5NTv7UilhGm4
 y6Xw==
X-Gm-Message-State: AOAM532nBA0UpjczinsqPZPY1ZAVa4ZR6FJMs/vDn4MddXajxwk40ycO
 C5sJmyoKKI+hT2o7OvAKDXinFz/Q6aaQMXJj3hs=
X-Google-Smtp-Source: ABdhPJw40PYtJP3i6gDVX9/J3nhaoBb5rlJ7lC+UhGH9yC0XDdTrgKR5+mZQSEqPnYQYgBt3kKPx5hYdavKXNjbhp8w=
X-Received: by 2002:aa7:c885:: with SMTP id p5mr361356eds.127.1601431883590;
 Tue, 29 Sep 2020 19:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txaxsmLsagNHLJFn9exfgroVyPF1AHMWE+uiJyQoWoFzA@mail.gmail.com>
In-Reply-To: <CAPM=9txaxsmLsagNHLJFn9exfgroVyPF1AHMWE+uiJyQoWoFzA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 30 Sep 2020 12:11:12 +1000
Message-ID: <CAPM=9tyDgJheEDNyw9xTtQP+n+=nkBRa_W5zZacurDR0fHWaWA@mail.gmail.com>
Subject: Re: vmwgfx on 5.9-rc7 lots of spam
To: "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>, 
 Linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Wed, 30 Sep 2020 at 11:09, Dave Airlie <airlied@gmail.com> wrote:
>
> Hey Roland (et al),
>
> I took the opportunity to boot vmwgfx from Linus 5.9-rc7 on VMware
> Player 15.5.6.build.16341506.
>
> Pretty much stock fedora 32 userspace, all updates as of today.
>
> It isn't pretty, can someone look into this urgently? I'll see if I
> can work out what is happening myself, but it would be good to have
> some engaged on vmware end.

Okay I tracked it down, patch on the list.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
