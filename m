Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE751EA1ED
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 12:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D0A6E22B;
	Mon,  1 Jun 2020 10:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4D26E22B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 10:35:36 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id q24so4927883pjd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 03:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=21ZKUiitaA/VhyuuR21o/snW4MjwihJIMa0dWGwpQ4I=;
 b=cf95h8/P8RLWELxgMUXot/xVV2Qm8zpk/WRjFXZJchtLMflAlwkn0HVmDmNfmy623M
 x9B+3YHbgZ1PO0Iyf8QndcNTAbtgeZhKTtEw+UTzvdHBadF7RQc4QRHI6LPirfxaz4by
 GF5KQkGkc9WRfDqJXaSLb0Ffc1x3EAy5CiwpwQkZ7hhFQp/YlL3R3kTAtoskNkZcQRtb
 PTf0vgDAYBkq+KqGYqJPG5H7Nn69AxOEVLQ9Qet40Sn14P64WBqUzyEIyegC6hKDvFlx
 Ws3OHclr/nf8BlUexMUqWhVDbydTSJ9PqxD1cJhHayYoqt1RvSagTr6vIKzIq75j8vlG
 frgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=21ZKUiitaA/VhyuuR21o/snW4MjwihJIMa0dWGwpQ4I=;
 b=fpwcO8FSCEPpfH/3UZduT1mevmcQxBI9KvGE16QFha41JKwdOv98cSOu0DYa5THxTi
 09bUninSnkuFQrYN1gLD1H0N66X2btr2xmBUBmotIOXNhD/7c4uMq62NCQMiN5dwMzRs
 Gt70SlKj1OJ7oq8VBPiYxFsnMYK3hUODhpSq8CRLbZeV8GJV3qApTKVIHFgo7LLeIPcp
 HOMpyQ03zZzk4s5JM6m3JH4zkxHrQwMsTB4DFyOIuR4UYFyjqXq0PlsaujeYOOrA/x53
 MavFAJ8Q6Z7KCpH4qOt4kescJuiTcW7SNLiOU2OZm7DPkMSm2srKlpjCcClCAIQ9hbR6
 wZXQ==
X-Gm-Message-State: AOAM531o5gg6WUuXTfZHYNL/eGPWs9aQWwec3O3P09Vyce7f33CWVnCr
 cdSSiIAC3oZ2nTrhBQXPJClmmuw/7+Vj+Gltr9U=
X-Google-Smtp-Source: ABdhPJwgMTA7CTg/J3O189c9eXdi9xezD6/jnmjsispxqh2tGpuDIdE5UzwbivbO5Alg9BCa5kCstAN/6s2oOmrZCw4=
X-Received: by 2002:a17:90a:ac05:: with SMTP id
 o5mr8473367pjq.228.1591007735577; 
 Mon, 01 Jun 2020 03:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200522041506.39638-1-jhubbard@nvidia.com>
 <20200531205819.GC138722@ravnborg.org>
 <854fae07-3cb4-dbcf-fa93-35b447f9d084@nvidia.com>
 <CAHp75Vf6=UuC2Sef3m3CpRmjAOWt8ZgBW+OPf0-_53P3F__CWw@mail.gmail.com>
 <e7f95207-1b30-17a8-4667-ca58b77ec0a3@nvidia.com>
In-Reply-To: <e7f95207-1b30-17a8-4667-ca58b77ec0a3@nvidia.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 1 Jun 2020 13:35:24 +0300
Message-ID: <CAHp75VcaXTM86K9vzyxTQJP_oNnzJ8mMHzgm7ybEioVhG6DHDQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] video: fbdev: fix error handling,
 convert to pin_user_pages*()
To: John Hubbard <jhubbard@nvidia.com>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Paul Mundt <lethal@linux-sh.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 1, 2020 at 1:00 AM John Hubbard <jhubbard@nvidia.com> wrote:
> On 2020-05-31 14:11, Andy Shevchenko wrote:
> >     ...
> > JFYI, we have history.git starting from v0.01.
> >
> OK, thanks for that note. According to that history.git [1],
> then: drivers/video/pvr2fb.c had get_user_pages_fast() support added to
> pvr2fb_write() back in 2004, but only for CONFIG_SH_DMA, as part of
>
>      commit 434502754f2 ("[PATCH] SH Merge")
>
> ...and that commit created the minor bug that patch 0001 here
> addresses. (+Cc Paul just for the sake of completeness.)
>
>
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git

I mentioned this one, but I guess content should be the same.

https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
