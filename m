Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8F63A37A0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 01:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64B56EE12;
	Thu, 10 Jun 2021 23:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C16E6EE12
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 23:05:18 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id l17so1202945qtq.12
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 16:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DK2H2k3s+uwlyyK3T0VDGWYZ6UuIQF3Ctof+ryl7qMI=;
 b=kIZpuicdNrC6eM3Et5rEK7/tRwEwF6F5U9cVTpL7x8215rnNP7GcouVOQgR96fV/aE
 pbhInV6X+QD4LjIvfb1202lWnx0O3ffhrxUZWyE3qBXEct73DhFh/KRNnY9gh8mNTvxl
 Qlv8+MX3oUVH+sZ4j1/xGiPywVZqn3xcIR4Ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DK2H2k3s+uwlyyK3T0VDGWYZ6UuIQF3Ctof+ryl7qMI=;
 b=QGoA/52XGSDWxtthI4duWQGtkNy7fBcn4hmZz2hIyo1b0wG3XH40o/N/1jKNoetn1T
 sPqKZ5+cMmESpvoOE24N05gtTyAlyNf5vHep+JzZqw1B2iBhDqJT9ViQrXMdHYcWbA86
 FrBK/Nxgzi0ps1R0JFoVPDjHhf9yTUg8hHnW3rZRoU4v9aB2EzRFmUlXL8wbV7QvkIGz
 3hRYgCywEnOgh9PMtAdG8A0KDUe0VrK9jRpYQPNRZaBWaUb29yE7NSlLBxB4dxY53DoI
 NKb5gIOSFSdNuRVjrbRa4tH97jcSLiZPOxyd9xaOHlmaZl78CKosoGjIf9HZODZS4kQk
 8UUg==
X-Gm-Message-State: AOAM530fu1T/wKcpZKVuCjJry4nWhRh7NVsV7q8pleSCr424B+ATuM+U
 RApk7IEEWS6AR5+yoN6Alk9G/Oi3VoBZkA==
X-Google-Smtp-Source: ABdhPJwWo++qcCJzj8dF77fv0ou+vn16DQKHYMZ8nw3Cghs0s+7qH4ThZ8nYcKxnMg7eVJcAkC1fuw==
X-Received: by 2002:ac8:57d1:: with SMTP id w17mr1239153qta.149.1623366317029; 
 Thu, 10 Jun 2021 16:05:17 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182])
 by smtp.gmail.com with ESMTPSA id l141sm3233287qke.48.2021.06.10.16.05.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 16:05:16 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id p184so1614511yba.11
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 16:05:16 -0700 (PDT)
X-Received: by 2002:a25:80d4:: with SMTP id c20mr1607384ybm.345.1623366316010; 
 Thu, 10 Jun 2021 16:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210610220527.366432-1-linus.walleij@linaro.org>
 <CAD=FV=XVCNZTPmvLPx7uvU8r8uuHai2Mxpxt0-Jv-ryD=grAMw@mail.gmail.com>
 <CACRpkdZ3=sjxi4VUi35Fa51amoxroOf1GLQP8A2kfZxVgsHwkQ@mail.gmail.com>
 <CAD=FV=U9emGtV5Wj0jyAkHjLFrdnHOUhqqynFg-fvSVz2kibNQ@mail.gmail.com>
 <CACRpkdbNVB+k80a-iG53mhZ+DmZ2FokFiTG48QgGG-r89LmEyA@mail.gmail.com>
In-Reply-To: <CACRpkdbNVB+k80a-iG53mhZ+DmZ2FokFiTG48QgGG-r89LmEyA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Jun 2021 16:05:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U1MK+tC9mDPjsQgHKiMotWYq_GQV7PxJHSSQ4MRgCAwg@mail.gmail.com>
Message-ID: <CAD=FV=U1MK+tC9mDPjsQgHKiMotWYq_GQV7PxJHSSQ4MRgCAwg@mail.gmail.com>
Subject: Re: [PATCH v5] drm/panel: db7430: Add driver for Samsung DB7430
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 10, 2021 at 4:01 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Jun 11, 2021 at 12:42 AM Doug Anderson <dianders@chromium.org> wrote:
> > On Thu, Jun 10, 2021 at 3:39 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
>
> > > #define mipi_dbi_command(dbi, cmd, seq...) \
> > > ({ \
> > >         const u8 d[] = { seq }; \
> > >         mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
> > > })
> > >
> > > I'll fix up the include and apply then we can think about
> > > what to do with mipi_dbi_command().
> >
> > Are you sure that doesn't work? Isn't the return value of a macro the
> > last expression? In this case the return value of
> > mipi_dbi_command_stackbuf() should just flow through.
>
> w00t I didn't know that.
>
> And I like to think of the macro processor as essentially just
> inserting the content of the macro at the cursor.
>
> But arguably it *should* rather be fixed in this macro though?
> It is used in the same way in all other drivers as well.

You want the mipi_dbi_command() to do the error checking and print the
message? Two downsides:

1. What if someone didn't _want_ the message printed? They might want
to try to handle things more elegantly, like maybe fail the function?

2. Currently the mipi_dbi_command() macro doesn't have access to a
"dev" pointer so it wouldn't be able to print as nice of an error as
you can.

That being said, I wouldn't object to introducing a macro next to
mipi_dbi_command() that also takes a dev pointer, prints an error, and
doesn't return a value.

-Doug
