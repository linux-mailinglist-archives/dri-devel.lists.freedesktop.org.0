Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F08544B0A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 13:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E2111B6AC;
	Thu,  9 Jun 2022 11:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D32511B6B9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 11:52:23 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id n203so2920891vke.7
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 04:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DpKyOYWk3dKy2Si13UacRBwzTTkNXvHAzr1pc3ANi4A=;
 b=kdUXDGcs+Svgp2WRobugxAioxsKbHU8v7cCGOVV3HPJtj0I0jvy8eR2FKyKbnHXQmO
 1HzcL7tOk4hPlatkaL1YblktL6HpGg6qiEAfG3l78pxtqJdOnM+lt1Br39ZJj1h3bHwK
 6pymAbWKM7H68OghqpI1E7ZiQyjW/bIbGA56bi6JfFpgtf/yJbxntSO+xkFzzujNShn4
 07HWIK1q1njPYoH3IDZuRTF1jME4AKPRtoIMzq8SvJ7LqhhYn4OBQA5JtUhLgvsp07Td
 g5VsHbxKJu2HBSMCi6pk7yqdl17+IneDZyG8CQWy9MBm+130byeetly83SjmFInXuP1P
 1bvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DpKyOYWk3dKy2Si13UacRBwzTTkNXvHAzr1pc3ANi4A=;
 b=7aUW30KbBLSipdfdPPKN2s2XgRMuRCTLZH/QqDggUpfCkIczW07I19j2AAP8F0uhp3
 VhgiYy2ePriDmqfMqLxBG6dWt1kr/PbSnSa6uUUawkwG86iH2uhQMnpWxOyR1bhFa0pI
 UQP9kK6WMjtsDDYE+RQkp9U3hpEmAhJtF88mnq/c/md3qqxK83ZLALr88JbR5sNMOLtT
 r0kBTDopSExZHWXxc+qa/+wHG8ZJzG1z9uj+s3vsu9d7elBqbo33xfFMefRjdAYSp6qP
 n5llGwLGLI+kzGh7wtNIGUNl80b3lsOnMCn3jljTU5BjMndOKehcMlZbMY4Px/+Ck8VC
 DJZA==
X-Gm-Message-State: AOAM531+dMy+taFoBu2FEZ/3o402JU9X2x5UafDcC4GdjBeyJhuk/7HX
 3OaAYT7WQzoQl3IEUAHtdoXU3x5qF6Tko1xUWyOSb+0Mrp0=
X-Google-Smtp-Source: ABdhPJwAcPsy1x0ZtBO6/yu3wtwPQiPXrprTE2I3Xz7YdWa8J7Io9yEXudhfqfbw6GKtVQeq6sIaZl+sBNc7HEqUhZo=
X-Received: by 2002:a1f:2a4e:0:b0:357:a4af:25e1 with SMTP id
 q75-20020a1f2a4e000000b00357a4af25e1mr35044206vkq.14.1654775542786; Thu, 09
 Jun 2022 04:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <75eec8af-66fd-bbaa-9aea-4cdf634bf2c8@arcor.de>
 <CALeDE9MzaG0vGfwMrZVArCWpNT94=vTakoM71qykBkVbeL1QmQ@mail.gmail.com>
 <20220608143605.x4arwudst3nqeg7b@houat>
 <3648b281-c6b0-a91c-2a4f-ddbee6988b3f@i2se.com>
In-Reply-To: <3648b281-c6b0-a91c-2a4f-ddbee6988b3f@i2se.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Thu, 9 Jun 2022 12:52:11 +0100
Message-ID: <CALeDE9OkN5Vq-_L=VzSdKK0=6dKrNBX1q3zm3ZaNX8Jy9VJ35w@mail.gmail.com>
Subject: Re: drm/vc4: module dysfunctional on Raspberry Pi 3B as of 5.18.0
To: Stefan Wahren <stefan.wahren@i2se.com>
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
Cc: Peter Mattern <pmattern@arcor.de>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> >>> As of Linux 5.18.0, module vc4 apparently isn't working on Raspberry Pi
> >>> 3B any more.
> >>>
> >>> If a monitor is attached to the device, the boot messages show up as
> >>> usual, but right when KMS starts, the screen turns black. Similarly, the
> >>> screen also turns black when the module is blacklisted at boot time and
> >>> loaded from the running system.
> >>> The problem looks quite similar to the one posted some months ago in [1].
> > If I understand you properly, it results in a blank screen if the
> > monitor is connected, but the system is still responsive?
> >
> > If so, it's a very different problem than the link you provided, since
> > it was occurring when no monitor was connected and resulted in a total
> > system hang.
> >
> >>> Unfortunately, looking through systemd's journal didn't seem to yield
> >>> any real hint. Nevertheless, the results from grepping vc4 are
> >> I'm seeing the same issue with vc4 on a RPi3 on 5.18.1 on Fedora so
> >> can confirm the regression. Maxime would know what might be up here?
>
> i assume you are using the downstream DTB?

In this case it's the one in the Linux kernel (not sure if that's
upstream or downstream in this context) not the one provided by the
RPi firmware.

> Please provide the version/date of the GPU firmware?

[    6.205121] raspberrypi-firmware soc:firmware: Attached to firmware
from 2022-05-24T13:26:52
Which is git f145afc
