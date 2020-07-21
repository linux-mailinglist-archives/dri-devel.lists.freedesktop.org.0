Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2527D227650
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 04:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EB96E1B5;
	Tue, 21 Jul 2020 02:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEFC6E175;
 Tue, 21 Jul 2020 02:57:25 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id n26so20177841ejx.0;
 Mon, 20 Jul 2020 19:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k3JdCJR2g5rc0/sk91yNgBSkmWQJyhTVgrDHkUGVHjw=;
 b=Ss+c31OQAohgVfaRucUoILyjm6J/RThUhKr6ofrstPJujUivtlfDotidMEUMZKHB+0
 6Wd6QUhcvkfDapbavhErmJ80xEwYbu9YZytMwRbP3eIdEmtSgbBxJUO3oPmjUHf9Ni8f
 27bk0w+qnBMTTEKloJighsCyGrB0kBIe/tJh8WlNOo5GaoaYyVSaMRJ2vt5Q8APzYigr
 AXzCk+Y704447zXoZzuMh+A90Z5uB7ZVUSMz2YbKXDFDObY4VJkICExQraK7UJVYlCtj
 OdyImGMjFLv1Vl5UrvH9yK0dRDbbO/IC2odAOVT4JoaadEul+SqJy2UkDNLexg7REcBO
 GxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k3JdCJR2g5rc0/sk91yNgBSkmWQJyhTVgrDHkUGVHjw=;
 b=j2r9kkDEh+2p49eheTp2ql471h4b/OcFjJzeNt2HUpKgHn/n3csy3TgpS8Rza4sIPl
 t26YNjYZXB99K+GIrevduVKR8py+LV936w+mHAR5GrkActAksGhtwKjAChV0loxOKrj8
 kpaCqSF7UmyflQM7F4boENM6gwjCoukDjXxghMLkx2obl6xtlZaQtzbKICDXfGo68eHA
 SHEPLkJkFNRaGtBvjFpG52gZZE3cAuTrLe3BFmEfKOh4V+I3ZJ1tTsVBPiROjeiLGatl
 5PPdWVQxHv9JBwU8eDNwlDiO5ubL5nW769PloPnlhsRZHsXH6Iv8dF/mauFGrbLNdhbr
 kXfw==
X-Gm-Message-State: AOAM533hyWJ3vrrDW3jUZsiGqT/ArjzUocWAt5W0nl1AwD2WRjHElw9u
 N2mRKGzLQwXAz4pOLsA+8RgJy3gGinHkxRC0dvg=
X-Google-Smtp-Source: ABdhPJxwgJlH0PXNzdQwqlPRE5KW+3uZUS5mN2weS9bw8M9k15h4pa+fCzhaVK9NIYfSd8sazWjt2MCDtc2a5bKHZ9o=
X-Received: by 2002:a17:906:494a:: with SMTP id
 f10mr24210363ejt.428.1595300243613; 
 Mon, 20 Jul 2020 19:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200707184125.15114-1-khsieh@codeaurora.org>
 <159527632812.1987609.6364896740387949838@swboyd.mtv.corp.google.com>
 <91a8eef836c1939cb57942c6fdcf2772@codeaurora.org>
 <159528794676.3847286.1584696687662833591@swboyd.mtv.corp.google.com>
In-Reply-To: <159528794676.3847286.1584696687662833591@swboyd.mtv.corp.google.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 20 Jul 2020 19:57:59 -0700
Message-ID: <CAF6AEGs0+=tpOWtY0kUc=Vt7EdEEwQjEffMXxFtDo142gRYRhQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, khsieh@codeaurora.org,
 Tanmay Shah <tanmay@codeaurora.org>, aravindh@codeaurora.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 4:32 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting khsieh@codeaurora.org (2020-07-20 15:48:13)
> > On 2020-07-20 13:18, Stephen Boyd wrote:
> > > Quoting Kuogee Hsieh (2020-07-07 11:41:25)
> > >>  drivers/gpu/drm/msm/dp/dp_power.c           |  32 +-
> > >>  drivers/gpu/drm/msm/dp/dp_power.h           |   1 +
> > >>  drivers/gpu/drm/msm/dp/dp_reg.h             |   1 +
> > >>  17 files changed, 861 insertions(+), 424 deletions(-)
> > >
> > > It seems to spread various changes throughout the DP bits and only has
> > > a
> > > short description about what's changing. Given that the series above
> > > isn't merged it would be better to get rid of this change and make the
> > > changes in the patches that introduce these files.
> > >
> >
> > Yes, the base DP driver is not yet merged as its still in reviews and
> > has been for a while.
> > While it is being reviewed, different developers are working on
> > different aspects of DP such as base DP driver, DP compliance, audio etc
> > to keep things going in parallel.
> > To maintain the authorship of the different developers, we prefer having
> > them as separate changes and not merge them.
> > We can make all these changes as part of the same series if that shall
> > help to keep things together but would prefer the changes themselves to
> > be separate.
> > Please consider this and let us know if that works.
> >
>
> I'm not the maintainer here so it's not really up to me, but this is why
> we have the Co-developed-by tag, to show that multiple people worked on
> some patch. The patch is supposed to logically stand on its own
> regardless of how many people worked on it. Authorship is a single
> person but the Co-developed-by tag helps express that more than one
> person is the actual author of the patch. Can you use that tag instead
> and then squash this into the other DP patches?

The dpu mega-patches are hard enough to review already.. I'd really
appreciated it if the dpu dev's sort out some way to squash later
fixups into earlier patches

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
