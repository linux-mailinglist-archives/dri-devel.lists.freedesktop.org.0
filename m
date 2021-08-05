Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A96283E1428
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 13:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2276E580;
	Thu,  5 Aug 2021 11:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3931B6E580
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 11:52:50 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id ca5so8058018pjb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 04:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mGypu+NaaW+Jhwv++tohvkOpOq2EXdTSw+wGzb6zcXY=;
 b=GKXmOU+ySf+o3OukbvSv/pA5RbTOf44GtDdunsovYzvoPvUnPMlSz4t0g+UqM3SsnG
 G1nzYSU4UXFic6w/8n6qihydAo38qyYbFj9YRvlrkRu+Wvjf9X5m2j2r/aKuSdpz2hvy
 C1vy+TeRBfItlx+pL7J7cYgw2plEnn/Z9hUA0yi5/hIg1Hs4lX01hDtVAoFKSdOgABeu
 ylgYVhXb5UJMvGdJTR5tSCUrHE63OAYYHpDHwiYMTvR2/lbYT3VOb0zsuc7j40xbusBf
 JK8Jx4viVS1X9ygZuHkq6qq5YGRDNZnHCkQd2X6i21oZZFLZLugKVoJeHr0WdTF0lfKK
 ADxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mGypu+NaaW+Jhwv++tohvkOpOq2EXdTSw+wGzb6zcXY=;
 b=CoHEJ/y+SLerRiDccCGErulj7v8V2kpr+9OwD0hu93jC05XCYe83YoF1k/EVkil1f5
 wPbxySZg+jiV6LOCiUAscbMpbtYwjDSUXP+7IIGOP4Zr0CKgXzTYG7CAUfhc6VMEERI3
 /l6PDfogsvOlP93HW7yB4H3835nF+Zl0YCUSne9wiK+75fxS9scS5d3MTx5FyvYnnpuw
 t9NSx63vYtadQieXmrJzAidaBwV3nyKcqQmbs9Sbe/zhgUykMCJdceDvGdnC6nWEjmmn
 DGMHf+FyK5limy/AwthE56mqJLv25KlyDJ91HedXSVjD2rw/yhNp3kT4j4ZZYKsQBjFN
 OlVQ==
X-Gm-Message-State: AOAM531y508QYlAUMyMrdmXwDZh/POL/fW5bWiS6IoicqoOQSxqDtkVl
 RXA9OEtqLFD5oyid4y1gsXOLgF0dyIF+QdoyK8Q=
X-Google-Smtp-Source: ABdhPJyqrlC+wjN7QOWKQ3nQEXmW3Mste+3scQ3W1W2pJRbKhcHo+smIRdnf47EbM8CP0WtbPya/hI4LB7KfbDt26Hg=
X-Received: by 2002:a65:5ccd:: with SMTP id b13mr2323pgt.203.1628164369860;
 Thu, 05 Aug 2021 04:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210801085155.3170-1-len.baker@gmx.com>
 <CAHp75VcD_Kqedpkw-Pj+uQbWqdu_9FhXqJS5TuGUPoVv2x45-Q@mail.gmail.com>
 <YQvJB5s1zY2yO87D@kroah.com>
 <CAHp75VeUH3+dZ6scREA-sZz8-7AF_MLobde+2-eZJz=MsxaW0Q@mail.gmail.com>
 <YQvNnf0o9w4fdVjr@kroah.com>
In-Reply-To: <YQvNnf0o9w4fdVjr@kroah.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Aug 2021 14:52:10 +0300
Message-ID: <CAHp75VdWiGM9-AqSeBC0tTWCVyLbjyf-F8_R0uns__HEUdrQMQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Remove all strcpy() uses
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: Len Baker <len.baker@gmx.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Phil Reid <preid@electromag.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 linux-staging@lists.linux.dev, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

+Cc: David, Daniel, Noralf.

The idea is to move fbtft under drivers/fbdev on the same terms, i.e.
no acceptance of the new drivers there.
The rationale is that for some of the panels it (fbtft) will be the
only driver and nobody will convert it to tiny DRM.
See more below.

On Thu, Aug 5, 2021 at 2:38 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Thu, Aug 05, 2021 at 02:30:35PM +0300, Andy Shevchenko wrote:
> > On Thu, Aug 5, 2021 at 2:18 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > > On Sun, Aug 01, 2021 at 02:40:40PM +0300, Andy Shevchenko wrote:
> > > > On Sun, Aug 1, 2021 at 11:53 AM Len Baker <len.baker@gmx.com> wrote:
> > > > >
> > > > > strcpy() performs no bounds checking on the destination buffer. This
> > > > > could result in linear overflows beyond the end of the buffer, leading
> > > > > to all kinds of misbehaviors. So, this serie removes all strcpy uses
> > > > > from the "staging/fbtft" subsystem.
> > > > >
> > > > > Also, refactor the code a bit to follow the kernel coding-style and
> > > > > avoid unnecessary variable initialization.
> > > >
> > > > I don't see patch 3 (even on lore.kernel.org).
> > > >
> > > > Greg, Geert, does it make sense to move this driver outside of staging?
> > >
> > > If you clean up everything that needs to be done, yes, please do.
> >
> > Do we have a clear TODO for that?
> >
> > The current one has the item which is not feasible to achieve in
> > reasonable time. Some of those drivers won't be converted to tiny DRM.
> > So the idea is to keep this out of staging in the maintenance phase
> > (as it currently states, i.e. no new drivers accepted).  For the rest
> > I'm not sure what else can be done (checkpatch? coccinelle?).
> > Actually the first sentence in this paragraph is a motivation for
> > moving out of staging.
>
> Take it up with the DRM developers/maintainers.  If they approve for
> this to move out of staging without being converted over to use tiny
> DRM, then I am fine to move it out.

Got it.  Cc'ed this to corresponding people.

-- 
With Best Regards,
Andy Shevchenko
