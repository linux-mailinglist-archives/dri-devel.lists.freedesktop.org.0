Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B59AE54D270
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 22:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBBD112CBF;
	Wed, 15 Jun 2022 20:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3271D112CBB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 20:23:39 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z7so17771501edm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 13:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PXt3RdHLeGINg4yxXorienYktyDgObMjDMbWVl7BWsk=;
 b=KXZ2+v4pB+2qbAYGzjRzDzf5N/FIVRKhj96xYwE1vF5kUN0OtkFe9xaDGtDanFONLy
 hTPZE9BYpcQdjTudH/oFniRh8iBYS/c4UeqaUYPwh2lfS22ODF3u97tyELRsJAEAD6RQ
 XzWUflxaDj9Iu61DuaeDp+azVZ6V13cNbqU61orL81dExdC116TjkX33GuszgTOcEEvU
 GzVSKpsmN9Ed5bYW34e8z5P5bSZUO3hseQ9JF3OB2VQmBTRpr4mRhHHoSIsAF/FCWDuG
 kBQq6IcC9BM5Dg/ILKxnsITQERCqOt1fO9wBv0c6m5vvEQHDWieBkMh2OPDFrT40CG/E
 Gg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PXt3RdHLeGINg4yxXorienYktyDgObMjDMbWVl7BWsk=;
 b=R39Ih8HQxrRHRXr1EgPLO7paQmEFuYr+FQztO5BvQJpsUdD7LW9PqU2coRU+BXMVR3
 O6AXWndqf1KMJawoCtul8SqEklMRU5SzJpR+uYOQmQLVSE2qfsX0FTfjrhZh6VlIHyOj
 hFVh4Ev9u1K2CnAp8cFhCTyRFJFh0aYxpnZDNelJy9RlX6svaKUFAjRKen+3+VU6uZby
 eDJq/oWLfRuAdPCfeY105T/rzxw1jN74oTepNyljy4667HpE1OPqcxBfYMutCx1GqRXk
 lGEz9sGUj/SBYgqCbePatFV5rOciTEgJCOFwqMQ1H5N95CmRUgZLF4v56mvkVfr1wiTY
 KqHg==
X-Gm-Message-State: AJIora+RO4MqNOZssr63hqUmSOGANvxzeksNwcBT1DUNWcZgxEjKbPvM
 1xezubcmtMPX/Lz+MlYTQVqFrcoBIS5IHyoXOhs=
X-Google-Smtp-Source: AGRyM1ttWT68UgN+Rc46Ac5PG1YpNjzWfiePHBmGn7NJyquiZSoFYih8qcY3rjMrbDxNpWSQCqulgS89b6u9UPfVJg8=
X-Received: by 2002:a05:6402:3325:b0:42d:e1d8:99e9 with SMTP id
 e37-20020a056402332500b0042de1d899e9mr1927169eda.87.1655324617605; Wed, 15
 Jun 2022 13:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220615104833.3963552-1-windhl@126.com>
 <Yqm6LvDGqaRMaUHa@kroah.com>
In-Reply-To: <Yqm6LvDGqaRMaUHa@kroah.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 16 Jun 2022 06:23:26 +1000
Message-ID: <CAPM=9twCiqyakgPLz0v=7-abUhzLb8ZZH7-U65PV8qtQOP7Xww@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] drivers: tty: serial: Add missing
 of_node_put() in serial-tegra.c
To: Greg KH <gregkh@linuxfoundation.org>
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
Cc: linux-tegra@vger.kernel.org, heliang <windhl@126.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-serial@vger.kernel.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Jun 2022 at 20:53, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jun 15, 2022 at 06:48:33PM +0800, heliang wrote:
> > In tegra_uart_init(), of_find_matching_node() will return a node
> > pointer with refcount incremented. We should use of_node_put()
> > when it is not used anymore.
> >
> > Signed-off-by: heliang <windhl@126.com>
>
> We need a real name please, one you sign documents with.

How do we enforce that? What if Wong, Adele or Beyonce submit a patch?

What happens if that patch gets reposted, with S-o-b: He Liang
<windhl@126.com> or Hel Iang, Heli Ang? Do you know any of those are
real names? What happens if they post a real name in
Mandarin/Thai/Cyrillic, can you validate it?

Really we require you have an identity attached to an email. If there
is a problem in the future, we'd prefer the email continues to work so
that you are contactable. If you are submitting a small amount of
changes it's probably never going to matter. If you are submitting
larger bodies of work of course it would be good to have a company or
larger org attached to track things down legally later, but again that
isn't always possible.

I don't think alienating the numerous developers who no longer use
their legal names are identified by one name, but haven't changed
their legal one yet people who get married and change their legal name
but don't change their contribution name and I could run this sentence
on forever.

Dave.
