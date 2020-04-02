Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDEB19C0A5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 14:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257916EA6F;
	Thu,  2 Apr 2020 12:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5156EA6F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 12:02:01 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id t128so3130199wma.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 05:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=luRAFZxO32FnT2ltTQ9Z7QyiIcHD7yxi9+0tdfe0tkE=;
 b=Z30bZwsSVe2I8HyxeJX0CUVY6RHYO8nd+jRgkLT7Fo++xl2tGKpb3v3nydXmBQsZkF
 RaPWStSruFFxp8Rk6ScKRJCD8Q42ASxOWa7jwrlfNhOaZ0GNehn026azCxilipgCbrwx
 AkDwr/X9ELmsKy1MCXrIugj8IpXeIbFpkFGLE/K7tfwwT2KCtjv7nRrHWO9ZcaMp8FXs
 SDBkWfkOO+4SAQJPTs3fQ7km+E1s402ST5VJB0LZDpR9HFQKnw7Op791neoVv5Afg6og
 19u2TXjUBRrRH2KoMZC2xm8RRh0voMdOz+Us5VK0UU8CV2lNITKuH+SsAZUmw22yVWie
 LJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=luRAFZxO32FnT2ltTQ9Z7QyiIcHD7yxi9+0tdfe0tkE=;
 b=o0OV06wjxxrDKFQb0rvfXznATu8SOCxbdihH6j5ev3hVOxo/52RfJKrXN3qFmqIo17
 RSHbV7x+e3fJaFS3uZX/5e9Lvdau1ETAMrgr34Ge+f4QCvGis2II4AkaYq1SvvnuQ4Nj
 wIsd+9+HqRcVk63kkK6Rw1raO+6e3JfoQVoB9D7zsf4FSk8f7jT3cf4pGrTo/MpFtd7j
 zbZcbYvnJjYdLjE1MZCslnxD+0I4T0JHdGyD7pFwM8hpIJuF9qGGUMT+ZkKybYWb4lcx
 oUMR7ogXnqvcCH2QmwpR/GVIokTJj1mLw/nlViQS2hKCDFdlHoJUGrRFR3ZtBFHNcwjg
 Vk2A==
X-Gm-Message-State: AGi0PuZtBLhAnKCglLeHU8/v2MTQ1k7mx3kg1djY9rpDeQwrRpvaUPZB
 03PEsGikrAvumYaBIrjDCH/PAGzWVtgRPdHzABxWmA==
X-Google-Smtp-Source: APiQypL0bSODEJNqkacSwn9UGaG4MU1yzjV+ByDWnI8kd1pdWvB0mfNV0qTPHpQaL6oW4v48caZT72RLjzYPf370rME=
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr3144726wmc.52.1585828919555; 
 Thu, 02 Apr 2020 05:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
 <CAKMK7uF8cX9ie5DPCNkCr1CCWqFjXBbsW7+Ode3ioM64spMojw@mail.gmail.com>
 <3057b60b-4526-2d52-b551-d4769fe97c7b@nvidia.com>
 <CAKMK7uGbNpjS3YruzF9KjFneMDzdYBHWD_ehnQKPjd+UBmc=OA@mail.gmail.com>
 <a12a471d-1b90-6f21-1bfb-1d33807c1452@nvidia.com>
In-Reply-To: <a12a471d-1b90-6f21-1bfb-1d33807c1452@nvidia.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 2 Apr 2020 13:00:56 +0100
Message-ID: <CAPj87rMaFAYWDYy1LTC4h3_4ghyROjBAgU_rQm_ucnjnq_T9QQ@mail.gmail.com>
Subject: Re: How to handle disconnection of eDP panels due to dynamic display
 mux switches
To: Daniel Dadap <ddadap@nvidia.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel (another one!),

On Thu, 2 Apr 2020 at 08:18, Daniel Dadap <ddadap@nvidia.com> wrote:
> > I primarily asked about vgaswitcheroo since you didn't mention it at all.
>
> I had actually anticipated that vga-switcheroo would likely be
> suggested, and my first draft of my initial message had a lengthy
> explanation about why vga-switcheroo (in its current state) isn't
> suitable, but figured it would be better to simplify the problem
> statement and then discuss switcheroo's limitations if and when it came
> up in discussion.

Luckily, it isn't immutable! cf. https://lwn.net/Articles/443531/

I'd like to reiterate this from Jani as well:
> I think lying to the userspace in this case is a hack to enable a very
> specific use case. Of course it's going to seem easier if you're only
> looking at enabling that narrowly defined feature. But usually the hacks
> end up being restrictions that make future work harder.

I understand the motivation to keep things as tightly contained as
possible, but we already have enough complexity that it's important to
avoid magic functionality that is totally transparent and handled
without anyone needing to know, except for when it isn't actually
transparent and people do need to specifically handle it and then it's
a really spiky corner of API.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
