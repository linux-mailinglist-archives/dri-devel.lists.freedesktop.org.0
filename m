Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE21409F37
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 23:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91C26E28B;
	Mon, 13 Sep 2021 21:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA426E28B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 21:35:25 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id i12so23195705ybq.9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 14:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WU4RoFg6VLiOFaJk3K/XGgOlD1ESkFInWzo0IbGN3kU=;
 b=i3Z0HOIgpurMHd0P76FaxIh1P5hgM75ND5dd9STSAh0z9OlcVhLjPEgL+DGCBv8B0Z
 udwgE4i724dtIieRLRVBW1C73UKb+34IT3LK8m8G6oLPQn4MhhG/OY+yrrAkljZWikGQ
 YD5c4lMTZeWTRf0b1eaJcmEfWHBiXsjqEGfCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WU4RoFg6VLiOFaJk3K/XGgOlD1ESkFInWzo0IbGN3kU=;
 b=zlBCB2bQm1x8nToa5MOUUJQJTzmWJYpGP5MGHxDlpOWTVgJ/KtnMRBRJLmH38o6cbF
 gIhZwgs55NpYTtM10VmfLPGahUlIViou65oj/f1LYq14trEO81M416efdIGDy1/1bd1W
 yDb26KM1YbMrvNeZTG1YwJYSVQvGUIFAcRdxJMnG06++iNZ3+HAhSkkcUBY0hbSmRk6R
 LQJLnx7Y8EPyEdXfIWxP7FqTSyNRTYNjcsE1hoooss02sijPfIlYIYkaBXoUKk6v0b6C
 LAiFlaoO0lw2O3G/ajwpojPvxo5ZEW6Xda/QyyQ7VlAvX4oJGL4+ZvkAoJv2Z0vf6FvR
 yCpA==
X-Gm-Message-State: AOAM531L0hxtOBG6Q9+8Spdu+rP5Efv6AlTorW2BiJHXDfwEj+NyWoSM
 CDTBL394Rov+5BxBow1i9QjKCW2ZAUy9cgwNAfMcwA==
X-Google-Smtp-Source: ABdhPJzrSE7OvTRSnfAVhlv8p0e4jgQ3WUKAFfsLEAMYdX8ZfK6ClcfX8j/VfRFvlWlGf1HJLOYWvtIG6RLTfRcA6t0=
X-Received: by 2002:a25:2f42:: with SMTP id v63mr18356737ybv.388.1631568924984; 
 Mon, 13 Sep 2021 14:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210908111500.1.I9f6dac462da830fa0a8ccccbe977ca918bf14e4a@changeid>
 <20210908111500.2.Iac57921273b27d7f7d65e12ff7be169657f4c1eb@changeid>
 <CAE-0n50mp5F79iJ+zVrbt4ZP7V+UUOcVQe9H3TwEcFFyZWMoNA@mail.gmail.com>
 <CA+cxXhnPd1Z_HVjgM8b0wskASF-ZGuvYDh0quiVMwKFhKVx-JA@mail.gmail.com>
 <CAE-0n51s2MmOthCUSm0+KNBnWmNV=Zzf6eWhYJBme4LpMUUcAQ@mail.gmail.com>
In-Reply-To: <CAE-0n51s2MmOthCUSm0+KNBnWmNV=Zzf6eWhYJBme4LpMUUcAQ@mail.gmail.com>
From: Philip Chen <philipchen@chromium.org>
Date: Mon, 13 Sep 2021 14:35:14 -0700
Message-ID: <CA+cxXhme8OPMxtQqEn5yotx+EDpTBFyBuQxCcofsXUKO7gR0Sg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: parade-ps8640: Add support for AUX channel
To: Stephen Boyd <swboyd@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Thu, Sep 9, 2021 at 12:07 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Philip Chen (2021-09-09 11:15:27)
> > On Wed, Sep 8, 2021 at 3:27 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Philip Chen (2021-09-08 11:18:06)
> > >
> > > > +
> > > > +       data = (len - 1) & AUX_LENGTH_MASK;
> > > > +       regmap_write(map, PAGE0_AUX_LENGTH, data);
> > > > +
> > > > +       if (request == DP_AUX_NATIVE_WRITE || request == DP_AUX_I2C_WRITE) {
> > > > +               ret = regmap_noinc_write(map, PAGE0_AUX_WDATA, buf, len);
> > > > +               if (ret < 0) {
> > > > +                       DRM_ERROR("failed to write PAGE0_AUX_WDATA");
> > >
> > > Needs a newline.
> > Adding an empty line here doesn't look like a common Linux style?
> > Could you point me to any similar instances in the Linux codebase?
>
> Sorry. I meant on the DRM_ERROR message itself. Add a newline.

Fixed in v2. PTAL.
