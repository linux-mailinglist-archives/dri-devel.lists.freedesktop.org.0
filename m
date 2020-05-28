Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7794B1E5727
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 08:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1566E348;
	Thu, 28 May 2020 06:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7F36E348
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 06:01:48 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k19so22191480edv.9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 23:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+4G7LztfhKefqislvGUwGcaLm9pBFDOhcjn0F/Q53GA=;
 b=AqgX98324qc7v88oMBNXmxv6ZIWYQ8Q91wG8IRXL86xb3RDlvEjUyyUIfkNMbTZa87
 3aLiJZWfASX81Lh6axF218c69z186jXm1r3nX+w0XFcXm//gwlBuiBQprYUpGvNwtQF1
 7v9qN9dRsqT3mC4foN6sj/rLbegA1ZZgbhTAtoCG1a4xApPa1Fm+ADtgnNcVlQQWOGuD
 EwCNWZtHmuDFiT1pyLNb7gj3n8sCyqCMA/+piGrolDYHymQq+rH0XifEvcbGcFP1JMN3
 p3BRLpG9QtrJEBDe2RNTA/efIUT69m16YzqQ4tskKpTEKsB8+wCmAD7hL9rdutuYxP8t
 GTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+4G7LztfhKefqislvGUwGcaLm9pBFDOhcjn0F/Q53GA=;
 b=Ps6CLKHNGdMGr9qkHnLQjr7UywxPwDWW2VegbqGLkgWdt9dyMOucNgyykXAXfswWIe
 gwbTUTK7fqqUZEb0soJQLewmwdFa3hQLHIMHpCg+43alqW4aX4L30eDcphWAUs4k8P5B
 r/IdKDYX5iUXwKymun7hRMRzYgtJj7XiJzAEAnY9+4q5mmeF3Kh0FWJYkMvd2vngnHsJ
 muPtRV1WtJfURVodeJfO4du8ePs4BlgNybNlKO6x6gtAev/k3zWol2SblOLHwGofxPEa
 uIHWPqGhAW2xZvr9dQFjhLUEM9hSQt0D4nDDmuPQlJM4V/7uyUxF+6OFiE+KhxvSL5Ca
 2VXg==
X-Gm-Message-State: AOAM533n8GiTYsNWjedVvRchpOZZg25dlpzDH+JTtoaGvU9vqh9SLcqp
 JEIm77AVBy3yTyOY7xFflnSfmjcZfYTCOvvPPcA=
X-Google-Smtp-Source: ABdhPJwIk1Z2LwvbqGSnf8PWVoUKndg0g1dzxhJ5rxuKA894xH0b5zaDXP/mOvPqmIXLsQ2D8KrHPxM8vVGTDq9e1aA=
X-Received: by 2002:a50:9547:: with SMTP id v7mr1564141eda.78.1590645706837;
 Wed, 27 May 2020 23:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAAOTY_8tz9nNbCHFJhk9xX8fm9Jd8ETcdNCQfE31AOjZLpNKog@mail.gmail.com>
 <CAPM=9txm_fdy_+Kg=cdXe5SosbYBoXHtsDWYMFm2WQh1QtC_YQ@mail.gmail.com>
 <CAPM=9tzqQ5G82mSACX5speUF2j-8vz7SrOcj7XLsKCjhe3GT6A@mail.gmail.com>
 <9870ea53-cdd9-e34c-dcbd-f087f5abf619@gmail.com>
In-Reply-To: <9870ea53-cdd9-e34c-dcbd-f087f5abf619@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 28 May 2020 16:01:34 +1000
Message-ID: <CAPM=9tw9zn5tCw_tGVgn53Si2NXsVC35JmU_NwBE3NKVvfsfCw@mail.gmail.com>
Subject: Re: [GIT PULL v2] mediatek drm next for 5.8
To: Matthias Brugger <matthias.bgg@gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>,
 YueHaibing <yuehaibing@huawei.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Anand K Mistry <amistry@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 23 May 2020 at 01:58, Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 20/05/2020 07:46, Dave Airlie wrote:
> > On Wed, 20 May 2020 at 15:44, Dave Airlie <airlied@gmail.com> wrote:
> >>
> >> On Mon, 18 May 2020 at 10:06, Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
> >>>
> >>> Hi, Dave & Daniel:
> >>>
> >>> This include dpi pin mode swap, config mipi_tx current and impedance,
> >>> and some fixup. I drop drm_bridge patches in this version.
> >>>
> >>> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
> >>>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
> >>> are available in the Git repository at:
> >>>   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git
> >>> tags/mediatek-drm-next-5.8
> >>> for you to fetch changes up to 007d274a017bb4e2ef7b922c2f54f40cf2073664:
> >>
> >> Did you edit this by hand or pass it through some mailserver that
> >> chewed it up, I had to reconstruct this pull from the above bits, I've
> >> no idea why it's so messed up in the first place.
> >
> > and why does it contain an unexplained backmerge?
> >
> >  Merge tag 'v5.7-next-drm-stable' of
> > ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux
> > into mediatek-drm-next
> >
> > Please don't ever backmerge fixes into next pull, without a long
> > explaination or if you really need it ask us first,
>
> It's not fixes. I suppose my tagging strategy helps to create confusion. The tag
> is v5.7-*next*, which relates to v5.8 (next version after v5.7). Maybe not the
> best way to do it.
>
> We had to merge a series that changed the drivers/gpu/drm, drivers/soc and
> drivers/clk.
> So I took the series through my branch and Chun-Kuang merged a stable tag in his
> branch so that he can take commits on top of this changes.
>
> Maybe the explanation comes too late, but I just wanted to clarify.

Okay so whenever a submaintainer tree has a merge in it, two things
need to happen.

a) the merge needs a commit msg explaining what it is, why it's there.
b) the subsequent pull request should mention it's existence.

I'm not used to pulling trees from submaintainers with merges in them
and usually it's a red flag that they've backmerged something they
shouldn't have.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
