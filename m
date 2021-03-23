Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFE2346884
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 20:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F276E92A;
	Tue, 23 Mar 2021 19:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9886E92A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 19:07:41 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id z10so15523633qkz.13
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 12:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jWYImPY4n0R9yJQuBqYSMZiXrLY8rwBZGNs7mWEym+0=;
 b=M027G/yP3c70cu2GpI+RP+QTZP0mhijfWu1cvjIwMFh6l7wgfNCUFIoXEyhw7nCGH+
 s/7MSjEM48e5TKupVxNEDfe48pnDkxiKL7H8UWexaS5IuC4qC6WB34LJJBI2vZUT+QuF
 tjqn5QGlMqmusOdIEpzZcyy9wdvnRE+HnVKJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jWYImPY4n0R9yJQuBqYSMZiXrLY8rwBZGNs7mWEym+0=;
 b=BS46CVkr26SDcOzjj8tDpHP2AWz+Mcb7Rtp4XPA8S+zAM53OyzvqUKK3j6uBNhKsSZ
 yE9TeYmIlSqASHgTFHNnVN5Use6Bbfy640YgZszeX3tk2StcYEOMeB/qE74pULlbWorl
 FdfAwCwFPNu+KOqjhEu8XvySezf+wBXgxtKHzIV1SeoHSkcSMf9lvo42jKDTNAdir8Y/
 tlVMnJXk9DcOlBmzqhB8E/zogJiXsHuvmwG04r0mo0IfA8BjC5+tuahP/RnaKxNrtEVQ
 jmMGOIHOmk//alTHQmjlZpUhZkauKRrBE6ltT8AVv80xduA2HD+wOzRdN4XSx6ppRbDG
 6VkQ==
X-Gm-Message-State: AOAM530ewyJicDOM5G2fdXZdrU9WrMcOgV5zzU485KlR3VvtgL0JCRpa
 v5MlVpNpJN0L9yefvrW9EfjXzqbzfTa75w==
X-Google-Smtp-Source: ABdhPJwxJQwpO8Il4bwtVpDY99xnHb1DP2+Q+CNFLrN3m6dsZPigMexsbOK65YMXMZ4dtVV1aD0nCg==
X-Received: by 2002:ae9:e40b:: with SMTP id q11mr7002521qkc.318.1616526460327; 
 Tue, 23 Mar 2021 12:07:40 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172])
 by smtp.gmail.com with ESMTPSA id g186sm14458828qke.0.2021.03.23.12.07.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 12:07:39 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id i9so11464901ybp.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 12:07:39 -0700 (PDT)
X-Received: by 2002:a25:69c1:: with SMTP id e184mr7553038ybc.345.1616526459117; 
 Tue, 23 Mar 2021 12:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201102181144.3469197-1-swboyd@chromium.org>
 <20201102181144.3469197-4-swboyd@chromium.org>
 <YFKc23MwUQAosCs8@pendragon.ideasonboard.com>
 <161646947526.2972785.6883720652669260316@swboyd.mtv.corp.google.com>
In-Reply-To: <161646947526.2972785.6883720652669260316@swboyd.mtv.corp.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Mar 2021 12:07:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U+-spmAxFeDNxhCuB6O=gUvO_==ozg-OGn=2vkUWgL4Q@mail.gmail.com>
Message-ID: <CAD=FV=U+-spmAxFeDNxhCuB6O=gUvO_==ozg-OGn=2vkUWgL4Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 22, 2021 at 8:17 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Laurent Pinchart (2021-03-17 17:20:43)
> > Hi Stephen,
> >
> > Reviving a bit of an old thread, for a question.
> >
> > On Mon, Nov 02, 2020 at 10:11:43AM -0800, Stephen Boyd wrote:
> > > @@ -265,6 +267,23 @@ connector_to_ti_sn_bridge(struct drm_connector *connector)
> > >  static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
> > >  {
> > >       struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
> > > +     struct edid *edid = pdata->edid;
> > > +     int num, ret;
> > > +
> > > +     if (!edid) {
> > > +             pm_runtime_get_sync(pdata->dev);
> > > +             edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
> > > +             pm_runtime_put(pdata->dev);
> >
> > Is there any specific reason to use the indirect access method, compared
> > to the direct method that translates access to an I2C ancillary address
> > to an I2C-over-AUX transaction (see page 20 of SLLSEH2B) ? The direct
> > method seems it would be more efficient.
> >
>
> No I don't think it matters. I was just using the existing support code
> that Sean wrote instead of digging into the details. Maybe Sean ran into
> something earlier and abandoned that approach?

From reading the docs, it sounds as if there _could_ be a reason to
use the indirect method. Specifically if the i2c host that the bridge
is on doesn't support clock stretching then the direct method wouldn't
work according to the docs. Is that something that we'd have to
reasonably worry about?

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
