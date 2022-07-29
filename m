Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771C35851D0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 16:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A9D10E089;
	Fri, 29 Jul 2022 14:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2616110E089
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 14:50:38 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id rq15so2947413ejc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 07:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=g357UGRf0Iful4TOzguMzCzIJcq6XgTINqo6kA79z4o=;
 b=APHHgWYL3tgaUeSKYYhNcmwEqqgGv9WmoGy/seJ3KbfcSysjrKeQ7jz9d/y7CZxIzr
 KhHjx20mL8cZKbWP2mZjLD3QTqnnAeR7aOTWv0EZwaYVPOIVZT6fyxk3v2DryVWXoYJD
 hgOZY6cjz5nz2PmjMwGfgOJxaxyP0kNcvsQV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=g357UGRf0Iful4TOzguMzCzIJcq6XgTINqo6kA79z4o=;
 b=0L24falc3OTuXtB3qJEaX/ApTz79b91xA7EQo7l3l1ehSbuzqxiHrF4NEUpN+wMyxs
 azhxDp2sTGMkIMhm7bl8qdU/sgUjCfGZvTnXWQDSQJhLQVeGI3tCFJHLIWqE08YxwcBO
 8Ae/aSG2BxxKD3M75dFUvTCZxdGknc1SlrLaftIBacqnufEH3BfzaZvkSKR+lbbI7A4d
 xF3cI7nZ/p2QQY4TQyjvtACduX8sBrd0CUqEhj6XBXRdGH5XqFxLARdmU+2dHeYcHofb
 Eu5QTkSj31hYbY+uqvrnAodwBa4Qt150yQx6n4osZ5aJp0F0kGgW5jXVot7a0GsHR+ti
 ewXw==
X-Gm-Message-State: AJIora8vhVOuVDYv5w7iZwjXu1a8LY9YM8pwR45lKKh//5PxV8J+bCKd
 6LhNlFnr4kgKgeKJx2PqNACgD2E6kZwPjmz0+R4=
X-Google-Smtp-Source: AGRyM1uOGPyeuOrMUahiAMDmzhIAk1y+moXX8o8S1vcEZgx0EnPsPo7seJL6RXHNnmLzxi8XBY5/Hg==
X-Received: by 2002:a17:906:ef8c:b0:72c:780c:6693 with SMTP id
 ze12-20020a170906ef8c00b0072c780c6693mr3117945ejb.196.1659106237438; 
 Fri, 29 Jul 2022 07:50:37 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45]) by smtp.gmail.com with ESMTPSA id
 f7-20020a056402068700b0043adc6552d6sm2447016edy.20.2022.07.29.07.50.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 07:50:35 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id z16so6222170wrh.12
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 07:50:34 -0700 (PDT)
X-Received: by 2002:a05:6000:178f:b0:21e:98ee:f1e6 with SMTP id
 e15-20020a056000178f00b0021e98eef1e6mr2691892wrg.405.1659106233759; Fri, 29
 Jul 2022 07:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220721152314.RFC.1.Ie333b3e4aff6e4a5b58c4aa805e030e561be8773@changeid>
 <269f2610-425b-f296-dcfc-89bdc2e1d587@quicinc.com>
 <CAD=FV=XSVXasU5PMR2kL0WQjQ458xDePuTGd1m14_v9JO5B6oA@mail.gmail.com>
 <CAF6AEGv_Vikf80v-7ccz90fvGPrk5pV1tOxRoWKxKHYuEW8=aA@mail.gmail.com>
 <5c8ca71c-5f0b-d5f5-9f16-e312dec0d01b@quicinc.com>
 <CAD=FV=UGYV1mZenDCRrbpC+gpE12-Uis7fm_=H3PeEjK=t36yA@mail.gmail.com>
 <20220729075118.ofnpk52tk4usm3n3@penduick>
In-Reply-To: <20220729075118.ofnpk52tk4usm3n3@penduick>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 29 Jul 2022 07:50:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WUB68-DQ-pAFjGaG-kid33ve4Qc3iqb8OUh61xTBohmg@mail.gmail.com>
Message-ID: <CAD=FV=WUB68-DQ-pAFjGaG-kid33ve4Qc3iqb8OUh61xTBohmg@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/edid: Make 144 Hz not preferred on Sharp
 LQ140M1JW46
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jul 29, 2022 at 12:51 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Jul 28, 2022 at 02:18:38PM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Jul 28, 2022 at 10:34 AM Abhinav Kumar
> > <quic_abhinavk@quicinc.com> wrote:
> > >
> > > Hi Rob and Doug
> > >
> > > On 7/22/2022 10:36 AM, Rob Clark wrote:
> > > > On Fri, Jul 22, 2022 at 9:48 AM Doug Anderson <dianders@chromium.org> wrote:
> > > >>
> > > >> Hi,
> > > >>
> > > >> On Fri, Jul 22, 2022 at 9:37 AM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > >>>
> > > >>> + sankeerth
> > > >>>
> > > >>> Hi Doug
> > > >>>
> > > >>> On 7/21/2022 3:23 PM, Douglas Anderson wrote:
> > > >>>> The Sharp LQ140M1JW46 panel is on the Qualcomm sc7280 CRD reference
> > > >>>> board. This panel supports 144 Hz and 60 Hz. In the EDID, the 144 Hz
> > > >>>> mode is listed first and thus is marked preferred. The EDID decode I
> > > >>>> ran says:
> > > >>>>
> > > >>>>     First detailed timing includes the native pixel format and preferred
> > > >>>>     refresh rate.
> > > >>>>
> > > >>>>     ...
> > > >>>>
> > > >>>>     Detailed Timing Descriptors:
> > > >>>>       DTD 1:  1920x1080  143.981 Hz  16:9   166.587 kHz  346.500 MHz
> > > >>>>                    Hfront   48 Hsync  32 Hback  80 Hpol N
> > > >>>>                    Vfront    3 Vsync   5 Vback  69 Vpol N
> > > >>>>       DTD 2:  1920x1080   59.990 Hz  16:9    69.409 kHz  144.370 MHz
> > > >>>>                    Hfront   48 Hsync  32 Hback  80 Hpol N
> > > >>>>                    Vfront    3 Vsync   5 Vback  69 Vpol N
> > > >>>>
> > > >>>> I'm proposing here that the above is actually a bug and that the 60 Hz
> > > >>>> mode really should be considered preferred by Linux.
> > >
> > > Its a bit tricky to say that this is a bug but I think we can certainly
> > > add here that for an internal display we would have ideally had the
> > > lower resolution first to indicate it as default.
> >
> > Yeah, it gets into the vagueness of the EDID spec in general. As far
> > as I can find it's really up to the monitor to decide by what means it
> > chooses the "preferred" refresh rate if the monitor can support many.
> > Some displays may decide that the normal rate is "preferred" and some
> > may decide that the high refresh rate is "preferred". Neither display
> > is "wrong" per say, but it's nice to have some consistency here and to
> > make it so that otherwise "dumb" userspace will get something
> > reasonable by default. I'll change it to say:
> >
> > While the EDID spec appears to allow a display to use any criteria for
> > picking which refresh mode is "preferred" or "optimal", that vagueness
> > is a bit annoying. From Linux's point of view let's choose the 60 Hz
> > one as the default.
>
> And if we start making that decision, it should be for all panels with a
> similar constraint, so most likely handled by the core, and the new
> policy properly documented.
>
> Doing that just for a single panel is weird.

Yeah, though having a "general policy" in the core can be problematic.

In general I think panel EDIDs are only trustworthy as far as you can
throw them. They are notorious for having wrong and incorrect
information, which is why the EDID quirk list exists to begin with.
Trying to change how we're going to interpret all EDIDs, even all
EDIDs for eDP panels, seems like it will break someone somewhere.
Maybe there are EDIDs out there that were only ever validated at the
higher refresh rate and they don't work / flicker / cause digitizer
noise at the lower refresh rate. Heck, we've seen eDP panel vendors
that can't even get their checksum correct, so I'm not sure I want to
make a global assertion that all panels validated their "secondary"
display mode.

In this particular case, we have validated that this particular Sharp
panel works fine at the lower refresh rate.

I would also note that, as far as I understand it, ODMs actually can
request different EDIDs from the panel vendors. In the past we have
been able to get panel vendors to change EDIDs. Thus for most panels
I'd expect that we would discover this early, change the EDID default,
and be done with it. The case here is a little unusual in that by the
time we got involved and started digging into this panel too many were
created and nobody wants to throw away those old panels. This is why
I'm treating it as a quirk/bug. Really: we should have updated the
EDID of the panel but we're unable to in this case.

-Doug
