Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D176731B704
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 11:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214AF6E17E;
	Mon, 15 Feb 2021 10:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C966E17B;
 Mon, 15 Feb 2021 10:24:04 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id fa16so3468010pjb.1;
 Mon, 15 Feb 2021 02:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AG9OeEDo/3JdE44hP8BDfnT3JJC7Oi1S02kLK5AK3ek=;
 b=FzZrFSd5XTW066ME8RWqO1mVPmO6hUrCaIQ0yFwcCCj/jPmlLkQsd6esrQr065Q9WA
 GOCMtCb8mfeKSVYw870MRCgSx9rR5HAID6NpooUmoY157LqRc5QYz9pRS1gv3R2QO0CK
 QD6XW00LTp4P2//WB2woePR7kVehsPBTli+YEjArC/ZU7iR75UJguvSuVl/QGplYsIBB
 Ts3uB2UNHJ1xKWvqw5szyNRNr9ikbOSS3/6aTCBkvsXZj04lypKB/IrLvb/LDf03h6/w
 laT2i1k4Wz2KLoBPIPpxhpTcKIrkEExTeMmIWWv4ElIDI397HmEbuKo9T1gJwhZ2Q98G
 IFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AG9OeEDo/3JdE44hP8BDfnT3JJC7Oi1S02kLK5AK3ek=;
 b=KCrMZ2J9KRE+eIcuNj8Wz1C5EEBhtSSizWQZSuZt+pbD7Ydjtl6IhSpPHShpgNjS5Z
 vhOjdDafc4ag6XCfHOclXbijLhcYJA/5ZgOG/vSO5PgQbAVXBferfDKFlOqAEZDt3MFl
 9G5d3QTMQ4zPA9tJdCZ8cH6LKBBbsk9NRr8zjj/fit1O3JxRh33zwyiNgY+OBx5vhOYk
 vWoZ9o++q7W+YgJA9b0qbDMyqwRxdwJ3rV/n0M6tdbqClJXvTvNJ6jtimig9RrxQ1h5F
 VZS5U5NgnAQfZajKpC1tgSiGut5hZy2UOT9Sbs2ho6K0UJXuw8EsQBzMB7mNp/4l38sO
 yXhA==
X-Gm-Message-State: AOAM533qb7BaRyOokMJjKlS9SV6bT8tWyMKybKWhNoe3j8udXsp6dEwQ
 TEGaZhbdKMXbhbaNJ1t/ht82Zy5ibiI0k/xjirY=
X-Google-Smtp-Source: ABdhPJy6fd17nzrxmvBZLNEEyvUfWO1c2I3ULmO+swt4RuS8MLyRy+fsv8X3w+qA8r5rod6I6LpxBy/P4TAkz6g8UII=
X-Received: by 2002:a17:90a:4fc1:: with SMTP id
 q59mr16050899pjh.129.1613384644563; 
 Mon, 15 Feb 2021 02:24:04 -0800 (PST)
MIME-Version: 1.0
References: <20210215113939.03e44e3c@canb.auug.org.au>
In-Reply-To: <20210215113939.03e44e3c@canb.auug.org.au>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 15 Feb 2021 12:23:48 +0200
Message-ID: <CAHp75Ve2TyPx4H=7E92tKZ=GV46Y0Vzi-NwGMLrGtiXv-Nv7gg@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the pm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Mark Gross <mark.gross@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 15, 2021 at 2:45 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>
> In file included from drivers/gpu/drm/gma500/mdfld_output.c:28:
> arch/x86/include/asm/intel_scu_ipc.h:23:12: warning: 'struct module' declared inside parameter list will not be visible outside of this definition or declaration
>    23 |     struct module *owner);
>       |            ^~~~~~
> arch/x86/include/asm/intel_scu_ipc.h:33:17: warning: 'struct module' declared inside parameter list will not be visible outside of this definition or declaration
>    33 |          struct module *owner);
>       |                 ^~~~~~
>
> Introduced by commit
>
>   bfc838f8598e ("drm/gma500: Convert to use new SCU IPC API")
>
> OK, these will go away when the drm-misc tree removes this file in commit
>
>   e1da811218d2 ("drm/gma500: Remove Medfield support")
>
> So, if you don't want to see these warnings in Linus' build testing,
> you need to make sure that the drm-misc tree is merged before the pm
> tree (or the drivers-x86 tree).  Or you need to include module.h in
> mdfld_output.c before intel_scu_ipc.h (or in intel_scu_ipc.h itself).

Thanks for the report.
I guess the DRM tree should carry this burden, or they can merge the
immutable tag themselves.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
