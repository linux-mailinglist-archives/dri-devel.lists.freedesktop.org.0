Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F230A45912E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 16:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC2C89B5F;
	Mon, 22 Nov 2021 15:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0E689B05
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 15:18:15 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id x15so78229213edv.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 07:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b6qQeQwZADYWFmHsvKFEYvsgX+Aj2KzuO7XMpjH5Ok0=;
 b=pem0mM+r+a3bsrVABMJxJIcMwoXUaegtCJBh+E7EOu7NbW1ly0U9n4YIm2uafBgrMk
 rBgOXPBo+l3OqXVwycswEytYtNZrRgOXu7jL13WB0WescTdT+UKivUUOCSJnm03YKuBB
 Wd5DltpQo0TVlvXLTXW0Qn68XKiBY9bkL5E5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b6qQeQwZADYWFmHsvKFEYvsgX+Aj2KzuO7XMpjH5Ok0=;
 b=5WJfj6uoWv7FNKvT03msSVKQR/OEbZCScsgs3mbW5UnYuQRz2RzH/ctuVWotcLk37E
 Tt7EQx2ekzJsuFg7T3EFieSPvjgwoBhTwFypdRuHJoVo4E474N6e+n4ed4zHZuL+NXzx
 UC1VvjfWSewllOHWsKW2pWCufQwAFjyrJzpZu88YmnlsDBMbrNX4cw0CnDLhQyiCRRNh
 5k8FwKYCa1eCwKxX7sNWrBK9R7MXE5e6NAH04qfAe9zbkRUfe8dSGC4YWcpXhsscr1hr
 pGAEcYzrsRGKlNxgOw7cql5Kl+NAOXZFiyo28soDW43u+mpuf8JdepJLoOdC9DSYTrAf
 EE7Q==
X-Gm-Message-State: AOAM532occfIJc6BUDH86SYFeOsV9wAfxHno4nK/UWBtKV2kODO05aAc
 d3HNsyYh9SAluHh03lSS/MQRsFrAPQs/aXqZWubpWKLRbeE=
X-Google-Smtp-Source: ABdhPJxgEvNdiTuprKcDPLlLBdYdoDjdx+7vpfs5aCAOmahXrglgIsgkfM9qO+NOmt3pnixb+WRXqZJlNjf16Jc4T0M=
X-Received: by 2002:a17:907:7664:: with SMTP id
 kk4mr40382429ejc.319.1637594290898; 
 Mon, 22 Nov 2021 07:18:10 -0800 (PST)
MIME-Version: 1.0
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-5-jagan@amarulasolutions.com>
 <20211122100759.qw6lvwb33ciemg2y@gilmour>
 <CAMty3ZDDQR-OkjqEfb1ZYZG+oLN2ZOv-2GLxs3AdeDHqUD8fjQ@mail.gmail.com>
 <20211122132847.ds4gtk2unq3fkagy@gilmour>
 <CAMty3ZAzwKtABZqJhVDmgOVpnZFg66z6Bc_pn3Fm9=658RPG1g@mail.gmail.com>
 <20211122140929.22cmvnxxapp752ic@gilmour>
 <CAMty3ZBOYRJ5ScrYEKoA9e1hP9=yuKuASvXyorB_kLsp26Fe3A@mail.gmail.com>
 <20211122150610.mvltgil3yquli4qp@gilmour>
In-Reply-To: <20211122150610.mvltgil3yquli4qp@gilmour>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 22 Nov 2021 20:47:59 +0530
Message-ID: <CAMty3ZAm1+UyFXGpO0vuJyGbE-P58EErA+BgWYXWzu2b9vVr7A@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] drm: sun4i: dsi: Add mode_set function
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 22, 2021 at 8:36 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Nov 22, 2021 at 08:01:47PM +0530, Jagan Teki wrote:
> > On Mon, Nov 22, 2021 at 7:39 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Mon, Nov 22, 2021 at 07:21:57PM +0530, Jagan Teki wrote:
> > > > > It's perfectly valid to dereference the pointer in atomic_enable, and
> > > > > that patch would consume memory for no particular reason.
> > > >
> > > > Again, I'm not pointing any mistake in dereference and certainly not
> > > > understand about what memory consumption issue here.
> > >
> > > You add a struct drm_display_mode field to struct sun6i_dsi. It
> > > increases the size of struct sun6i_dsi of sizeof(struct
> > > drm_display_mode).
> > >
> > > > I'm doing it here since I'm doing it via mode_set in other drivers. No
> > > > problem for me either way.
> > >
> > > But *why* are you doing so?
> > >
> > > There might be a valid reason in other drivers, but there's none here
> > > (that you mentioned at least).
> >
> > The reason is to use existing bridge function instead of dereference
> > ie what I've mentioned. I don't have any other reasons.
>
> This discussion is going in circles. Unless you have a reason other than
> "because we can", NAK for the reasons already stated above.

Agreed your point.

Thanks,
Jagan.
