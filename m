Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ACB376BD5
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 23:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277FF6EE84;
	Fri,  7 May 2021 21:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95416EE84
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 21:32:22 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id y12so7668420qtx.11
 for <dri-devel@lists.freedesktop.org>; Fri, 07 May 2021 14:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8fK7eHKUxmepqVXRuH1Me+N6pEGrLKxF0Gw1bBJBEhM=;
 b=azyvyBbnB2N43FTbvrcjr+9F6cdhdryHKabro99427Dv96ts5IO815JB0iUXTr+ExI
 07gW+3w12L5iHMy4slmAEbPI048w1An/TnsrjGxk6eFmt/rjGx3mXxeVzi1VJ4+1kT+v
 sJ60cc7kyGi+lUUBgFQ16Y2GNGCbjC0TRQjBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8fK7eHKUxmepqVXRuH1Me+N6pEGrLKxF0Gw1bBJBEhM=;
 b=n35yPlCa4VIyQ/qTEEWCUcAn2IEBI20b173DSv5b9EmJxnZh+RjeF70h1QHzxsag+m
 kUeW+7on3pV4Mk26f7TAHFdHig7LlLFngXejQ2FQWSWEiNM5AzO4sM9yC0EUHQItw/QX
 ShKkSEnxI5ojyIVhAcz/DPV6URl+gElq4craNkBX/734yMPuLbDv+0nesDHhDfTtL+vc
 bAbT8ojdBP2/796OyQGxhWldzg+Vp52LD2rN0x04VeB0OmomWGGi7mwfihN7+yfvdbSu
 8R1VK/GxvrIfgzdxK5Q08ms+6Oy7nC5PW3fenuT2hJ7yNvlcFcw1YjWeyatek1EtAns6
 WYNQ==
X-Gm-Message-State: AOAM533+LPs5ahW76n+2X0qpIeVst+t/UygCW5IpoMhLlADkei1eHvJc
 ZSnNJ9dKggpU/ecMHbUb08nL9k9/2WtA5Q==
X-Google-Smtp-Source: ABdhPJwLZKL6CfmHYRGQXpi22D22ILriCGBjV6PMyDJPf8sScoIt/5AZbgbVbqVEPDW1sV4ldLiROg==
X-Received: by 2002:a05:622a:11d1:: with SMTP id
 n17mr10997671qtk.360.1620423141798; 
 Fri, 07 May 2021 14:32:21 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180])
 by smtp.gmail.com with ESMTPSA id j196sm5869229qke.25.2021.05.07.14.32.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 14:32:20 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id g38so13696972ybi.12
 for <dri-devel@lists.freedesktop.org>; Fri, 07 May 2021 14:32:19 -0700 (PDT)
X-Received: by 2002:a25:d70e:: with SMTP id o14mr15904531ybg.79.1620423139099; 
 Fri, 07 May 2021 14:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201102181144.3469197-1-swboyd@chromium.org>
 <20201102181144.3469197-4-swboyd@chromium.org>
 <YFKc23MwUQAosCs8@pendragon.ideasonboard.com>
 <161646947526.2972785.6883720652669260316@swboyd.mtv.corp.google.com>
 <CAD=FV=U+-spmAxFeDNxhCuB6O=gUvO_==ozg-OGn=2vkUWgL4Q@mail.gmail.com>
 <YFpG+hK7W+4bpp0A@pendragon.ideasonboard.com>
In-Reply-To: <YFpG+hK7W+4bpp0A@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 7 May 2021 14:32:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WfrZz4PsDcEeLkvsFa6p9LOo1G-3e00NzoVLZ713xNpg@mail.gmail.com>
Message-ID: <CAD=FV=WfrZz4PsDcEeLkvsFa6p9LOo1G-3e00NzoVLZ713xNpg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Sean Paul <seanpaul@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Mar 23, 2021 at 12:53 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> On Tue, Mar 23, 2021 at 12:07:27PM -0700, Doug Anderson wrote:
> > On Mon, Mar 22, 2021 at 8:17 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Laurent Pinchart (2021-03-17 17:20:43)
> > > > Hi Stephen,
> > > >
> > > > Reviving a bit of an old thread, for a question.
> > > >
> > > > On Mon, Nov 02, 2020 at 10:11:43AM -0800, Stephen Boyd wrote:
> > > > > @@ -265,6 +267,23 @@ connector_to_ti_sn_bridge(struct drm_connector *connector)
> > > > >  static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
> > > > >  {
> > > > >       struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
> > > > > +     struct edid *edid = pdata->edid;
> > > > > +     int num, ret;
> > > > > +
> > > > > +     if (!edid) {
> > > > > +             pm_runtime_get_sync(pdata->dev);
> > > > > +             edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
> > > > > +             pm_runtime_put(pdata->dev);
> > > >
> > > > Is there any specific reason to use the indirect access method, compared
> > > > to the direct method that translates access to an I2C ancillary address
> > > > to an I2C-over-AUX transaction (see page 20 of SLLSEH2B) ? The direct
> > > > method seems it would be more efficient.
> > >
> > > No I don't think it matters. I was just using the existing support code
> > > that Sean wrote instead of digging into the details. Maybe Sean ran into
> > > something earlier and abandoned that approach?
> >
> > From reading the docs, it sounds as if there _could_ be a reason to
> > use the indirect method. Specifically if the i2c host that the bridge
> > is on doesn't support clock stretching then the direct method wouldn't
> > work according to the docs. Is that something that we'd have to
> > reasonably worry about?
>
> I'm not sure. I'm going through BSP code that uses the direct method,
> and I was wondering if it was just an implementation detail. Once I get
> the display working on this board, I'll try to find time to compare the
> two methods, to see if there's a significatant performance improvement
> from the direct method. If there isn't, I won't bother.

To follow-up here:

We'd actually been using the "direct" method in the BIOS (coreboot)
and just found a problem. We're now switching coreboot to the
"indirect" mode. Specifically we found that, at least on one panel,
the last byte of the extension block (which should have been a CRC)
was coming back as 0 when using the "direct" mode. See:

https://review.coreboot.org/c/coreboot/+/52959

In addition I was thinking about how to use "direct" mode (ignoring
the above problem) and realized that handling the power sequencing at
the right time would be hard. Maybe not a problem for you since your
bridge is always powered, but I wouldn't know how to model this in
general. Specifically if you want to talk over the i2c bus to the
panel you've got to power the bridge but I don't think the bridge gets
called in the normal code paths.

-Doug
