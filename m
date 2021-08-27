Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7F53F9A71
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1FD6E96C;
	Fri, 27 Aug 2021 13:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6FE6E971
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:47:24 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id z1so8540064ioh.7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y0kIZxdG2WP5UVtm2i0XaO2Bfut6JUxDjhvFbpFOnGo=;
 b=JSu97EaVGMjtQz6hYY6AI5sMmCkndzrTwaujZd7EI+5ltUCYPaLKhEwB6jjgRrI3nk
 WYGpWj6vaCJwjq22DPQhtUxZIPZsPb/0sKt2rkpMP3/BcGUclalMiFrrEngizO7bL/Y+
 dPmWWvxlWCo1jjdczL8iZ2pkyJ+v4ADBp/DrG8KuCWcwPLqb26T0U4Izc7gTkOgEIX3R
 uSPDzIfCjJYAu12vYp0qbjo+/6h83kwd+qh7JzWGUT3zaBIiA74oG496p6Fa6p6soDOh
 s3/di0YPKPA1p9YUw62YWB3e2kxA9zyLOqgph3O5V4yn5cVibzkC2rjwOC5qOcG0R7ru
 OM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y0kIZxdG2WP5UVtm2i0XaO2Bfut6JUxDjhvFbpFOnGo=;
 b=TVJ0nk1norsqcBwkzwjfY8zuYAYtMlFUBPuFPVlKOMJpcYDDAy0W/nwQR3yOdRvOzx
 hPWOnbcYd7j4RPWMmVnbfqX+qMfMguD0NNdqSPJRNZocUjm1zIwB9wvJcfbuyEDpJrea
 8TAnqKEOLxQGJBanVwG5swReErjTFAIgJPy0hbLOt2ZHrbpXA6tSqqstw6vDz/9AR3Ok
 flbcJfr0ZM84kaUxresz2nAquKnyNiSnA4EWS81zl7PliY8gUaH5nDQRNPLnPm6Wt87H
 NuRdRP3CBf6wkiUny/00U/gj163di0vb+pJqQl18iAVVFfvXn3i7MgPLUWpqbsVvbFIa
 nLeg==
X-Gm-Message-State: AOAM531hUkAiFs6ZEBSYukIiUKdZM0T3RwsRyzOolcFpMli+M0O5ikwV
 gb4mjXHDqeI6RPoih2gkzlr++BXoo8vC6YKE2QT8Zg==
X-Google-Smtp-Source: ABdhPJwoMBLlwC9Y3OiKT1MJ/TLJ1htrXZ0Gsq6A+zo5pCGOJKT4X2C+tgqr5zx1l20TXTxPTu1Rb6sQWSkFhJaNluY=
X-Received: by 2002:a5d:8acf:: with SMTP id e15mr7489552iot.184.1630072043205; 
 Fri, 27 Aug 2021 06:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <YSPAseE6WD8dDRuz@ravnborg.org>
 <20210824014124.1080798-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=UFDRG9TJis28Wtsz9RVhp3Xk35stpLyY5ExLx3=8yxPQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UFDRG9TJis28Wtsz9RVhp3Xk35stpLyY5ExLx3=8yxPQ@mail.gmail.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 27 Aug 2021 06:47:10 -0700
Message-ID: <CAD=FV=WEid=JgsXEPWpEfNivJ3DK_hnFxxNf_HDiOpuTozAjHA@mail.gmail.com>
Subject: Re: [v2 0/2] Add driver for BOE tv110c9m-ll3 panel
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>
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

Hi,

On Thu, Aug 26, 2021 at 10:17 AM Doug Anderson <dianders@google.com> wrote:
>
> Hi,
>
> On Mon, Aug 23, 2021 at 6:41 PM yangcong
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > Hi Sam,
> >   This driver support boe tv1110c9m-ll3 and inx hj110iz-01a panel.The IC chip is used NT36523, which is a new IC.
> >
> > 1: panel-boe-tv101wum-nl6.c driver cannot meet the timing requirements of the current two panel.
> >
> > 2: The screen cannot be work in HS mode, panel-boe-tv101wum-nl6.c will switch to HS mode when boe_panel_enter_sleep_mode.
> >
> > static int boe_panel_enter_sleep_mode(struct boe_panel *boe)
> > {
> >         struct mipi_dsi_device *dsi = boe->dsi;
> >         int ret;
> >
> >         dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> >         ...
> >         ...
> > }
>
> It's really up to Sam how he wants to proceed here, but certainly you
> could support things with the existing driver even if there are
> differences. In general you can add more things to the `struct
> panel_desc` in the driver and then make them different for your panel.
> Look, for instance, at `discharge_on_disable`. Not all panels
> supported by this driver do that, so you could support your "cannot
> work in HS mode" in a similar way.
>
> For the timings, you could also add another bit to the `struct
> panel_desc` to select a different delay for your panel or (if it's
> just a small delay) you could just increase it across the board. I
> guess you need a 10 ms delay instead of a 5 ms delay in probe? I'd
> just make it 10 ms across the board and call it done. Similarly looks
> like something needs .5 ms => 1 ms. Again, this is likely fine across
> the board for all panels.
>
> Unless Sam comes back and says "no, wait, keep it two drivers!" then
> I'd suggest that you post a new version that works as Sam suggests. In
> the worst case if having it combined into one driver looks too ugly
> then we can always go back to a split driver.

Breadcrumbs: it looks like yangcong has attempted this in the
confusingly numbered v3 of his other patch series. See:

https://lore.kernel.org/r/20210827082407.101053-4-yangcong5@huaqin.corp-partner.google.com

-Doug
