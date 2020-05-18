Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 543011D85F9
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 20:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6236E46F;
	Mon, 18 May 2020 18:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D701B6E46F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 18:22:37 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id 62so6203437vsi.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B7TcTnxdgBKTVFL5gUH9Cy+Jbda1czl9E/pUOuzMN/k=;
 b=Evwhtrr7DfFquZt/cm+QLYTGVqidVIKhvJS22rNpNJk94fG/F9IzQhDU4y/bCEU4cH
 xd+K0m6JnG5eb4d5M7YXq22v9ymYRgljTktq1YE98d9c1ZmfHOsOmS8lske6MfpztrSe
 NRMzZXp+d2uuIbdUtV6Dcuz5dAbQ4ji99HeIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B7TcTnxdgBKTVFL5gUH9Cy+Jbda1czl9E/pUOuzMN/k=;
 b=Ke0hmDCkNrMADru9PwuGeKDhqCotKrtbDd6Hlbt+hNBiLwh+Hm+EWu1VyOwnpn1cQZ
 4a/TMarcxQGyIt2DwQc6MgUTpjMc+D5AguNbpLayhzVoRJspXRFf58J/m4PcXrLjop42
 3ZTmwV98RV5V2oMpPCdliVeXELJ4AHM0/nEz7kUecDXXBTStL+gkaqamw2L5YkfLFjBK
 aqhDe4EqFUsi5AsydpvYW4/ZdXZBNtDd6RUimC1+8yHWTd3ahcpQALvpuxDuT1JGwaau
 zsAviFf0SjT/rMOEZ5P1hodvWPxYaeakOGRPpXOt0HsZAuNYRY98SZoKd+B7Lq/oAgC+
 ftSg==
X-Gm-Message-State: AOAM531O5WDoyYODQd4WgD4U0cjN1PHGOuLQiknW+Iagtx2qRfOTy6S1
 66JiLkk6TVny9ACQ0NWqoH8kB739A5o=
X-Google-Smtp-Source: ABdhPJyrPrbMB/TfnuD/XQx/4OOxRWmK3tl81MaBE8mTNz0T0ZNXgDjV3IvK1Rcx+2VEeMPTrh6yFg==
X-Received: by 2002:a67:7d4b:: with SMTP id y72mr12855297vsc.59.1589826156680; 
 Mon, 18 May 2020 11:22:36 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51])
 by smtp.gmail.com with ESMTPSA id q135sm3372757vke.1.2020.05.18.11.22.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 11:22:35 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id u79so2842440vsu.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:22:34 -0700 (PDT)
X-Received: by 2002:a67:d199:: with SMTP id w25mr5312377vsi.169.1589826154516; 
 Mon, 18 May 2020 11:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200506140208.v2.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
 <CAF6AEGvXkeOrHGMHo=C1zXhDc9rquQJc8oGDB4VDfhTfdtqyTg@mail.gmail.com>
In-Reply-To: <CAF6AEGvXkeOrHGMHo=C1zXhDc9rquQJc8oGDB4VDfhTfdtqyTg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 May 2020 11:22:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V9Aphv=sV36CcK=ka2zNh7Hwiog4qiUEC7wpgjqYSi5Q@mail.gmail.com>
Message-ID: <CAD=FV=V9Aphv=sV36CcK=ka2zNh7Hwiog4qiUEC7wpgjqYSi5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: ti-sn65dsi86: Implement lane
 reordering + polarity
To: Rob Clark <robdclark@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sam,

On Fri, May 15, 2020 at 2:43 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, May 6, 2020 at 2:03 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > The ti-sn65dsi86 MIPI DSI to eDP bridge chip supports arbitrary
> > remapping of eDP lanes and also polarity inversion.  Both of these
> > features have been described in the device tree bindings for the
> > device since the beginning but were never implemented in the driver.
> > Implement both of them.
> >
> > Part of this change also allows you to (via the same device tree
> > bindings) specify to use fewer than the max number of DP lanes that
> > the panel reports.  This could be useful if your display supports more
> > lanes but only a few are hooked up on your board.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

I guess get_maintainer is somehow not tagging you and I haven't got it
through my thick skull to CC you each time.  If you're willing, I
think this patch is ready too.  Happy to re-post it with you in the To
list if it helps.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
