Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E6B503054
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 00:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B1510E554;
	Fri, 15 Apr 2022 22:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C4710E554
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 22:45:00 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id z33so16531090ybh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 15:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D1FL2N+vbxbnFM4V9Gp8h4r8ZEbQ6gNAmnc+BbEJA0M=;
 b=wQ6ryNU2t32Z7XVkKnortBSO1vhP4kNPzE0wqr1RTT36Eri4XnOpb/3V6ixh/8vGAs
 Z+nJYq1++Fh1TKaMJpA5wDoyoxeS5Rkn/VjHRPMPneKdBztWu9M+2YMaIMv/tsvX3CyF
 rHn3b8miFRaLQ7uHjvvU8P4Dd0l8whW3Ztz7odKEr7rXUovyybYAY6XgYaZX3wZN4iJ1
 pcRhHMwSRmTw9M2cFkAypPhNtMK9vG67z4EDS7Axx5q23QNG3WPbUpVQY5A4YWI3loUY
 lFD1LZ6dPA1G+Y8Twg+dr21cvKs/pm4X+vuxEh+9j10TDmCaeWYCM5yqjlj4dP8GyDXT
 dqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D1FL2N+vbxbnFM4V9Gp8h4r8ZEbQ6gNAmnc+BbEJA0M=;
 b=x13q17BeYFuTN5Y/OU1AFiPjh1bCahGwyGb5ed1+3wM/FPC9TgW3CZrXYvfZAuBoZo
 pjbG3HKAWTtBOHII4aCeaGaXO18njVTOFMtEZV+NqPD36zrzfZGz/UH0QWEyRcufxoFn
 bIS8zBRziwEvBDTokHHYkNYQwltOA0R6Yqrobv7Qk/NBisaXDukRjJAkOMdAVWWrUygU
 CaHw9zHvIAHxyaOU8C9E7L2k/y+R3jTVQTAhuzTMw1v6HwVhGSqcqjLPLvGOzf8LnuZc
 MFDBdkpNu8Bd/N3ihdB/uExqd7a3i/sx+ynGAXgaHfZHMF8MMPCtULmZ9OogIW6Hu1mV
 EijQ==
X-Gm-Message-State: AOAM532KAr2iI7z5TJUfU9Rk8o5av5iwS4PBXf24m6D3yTX5UpOwPnYz
 hLh6HkqZVpAjQhi6W5Wwlp8mYMYsmEEM5hECnAXDyA==
X-Google-Smtp-Source: ABdhPJy35MhSB4tYtvcOuTbUp29+uEFCnZ1T6ERCQSrsGRd9Y5mM+nyuh0bC2y9uq7UVSixNrsvJ7kZrYHNQDG0Qtjs=
X-Received: by 2002:a05:6902:d:b0:629:213c:4937 with SMTP id
 l13-20020a056902000d00b00629213c4937mr1204331ybh.66.1650062699443; Fri, 15
 Apr 2022 15:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220409023628.2104952-1-dianders@chromium.org>
 <20220408193536.RFC.1.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid>
 <a9a5dfb7-819b-d3a2-2c47-d5b239d21ad3@linaro.org>
 <CAD=FV=WKwErpD7iCu+2jFvMutmmmgLUEhAnw8s=27wUxcpF-aQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WKwErpD7iCu+2jFvMutmmmgLUEhAnw8s=27wUxcpF-aQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 16 Apr 2022 01:44:48 +0300
Message-ID: <CAA8EJppOVqaAEVeQY7p0EfCObJxfL591kbaYLYfbgOHHtmfhXw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] drm/dp: Helpers to make it easier for drivers to
 use DP AUX bus properly
To: Doug Anderson <dianders@chromium.org>
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
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 16 Apr 2022 at 00:13, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Apr 14, 2022 at 5:47 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On 09/04/2022 05:36, Douglas Anderson wrote:
> > > As talked about in the kerneldoc for "struct dp_aux_ep_client" in this
> > > patch and also in the past in commit a1e3667a9835 ("drm/bridge:
> > > ti-sn65dsi86: Promote the AUX channel to its own sub-dev"), to use the
> > > DP AUX bus properly we really need two "struct device"s. One "struct
> > > device" is in charge of providing the DP AUX bus and the other is
> > > where we'll try to get a reference to the newly probed endpoint
> > > devices.
> > >
> > > In ti-sn65dsi86 this wasn't too difficult to accomplish. That driver
> > > is already broken up into several "struct devices" anyway because it
> > > also provides a PWM and some GPIOs. Adding one more wasn't that
> > > difficult / ugly.
> > >
> > > When I tried to do the same solution in parade-ps8640, it felt like I
> > > was copying too much boilerplate code. I made the realization that I
> > > didn't _really_ need a separate "driver" for each person that wanted
> > > to do the same thing. By putting all the "driver" related code in a
> > > common place then we could save a bit of hassle. This change
> > > effectively adds a new "ep_client" driver that can be used by
> > > anyone. The devices instantiated by this driver will just call through
> > > to the probe/remove/shutdown calls provided.
> > >
> > > At the moment, the "ep_client" driver is backed by the Linux auxiliary
> > > bus (unfortunate naming--this has nothing to do with DP AUX). I didn't
> > > want to expose this to clients, though, so as far as clients are
> > > concerned they get a vanilla "struct device".
> >
> > I have been thinking about your approach for quite some time. I think
> > that enforcing a use of auxilliary device is an overkill. What do we
> > really need is the the set callbacks in the bus struct or a notifier. We
> > have to notify the aux_bus controller side that the client has been
> > probed successfully or that the client is going to be removed.
>
> It seems like these new callbacks would be nearly the same as the
> probe/remove callbacks in my proposal except:
>
> * They rely on there being exactly 1 AUX device, or we make it a rule
> that we wait for all AUX devices to probe (?)

Is the backlight a separate device on an AUX bus? Judging from
drm_panel_dp_aux_backlight(), it isn't. I assumed that aux bus is just
a point-to-point bus, so there is always a single client.

>
> * We need to come up with a system for detecting when everything
> probes or is going to be removed, though that's probably not too hard.
> I guess the DP AUX bus could just replace the panel's probe function
> with its own and essentially "tail patch" it. I guess it could "head
> patch" the remove call? ...or is there some better way you were
> thinking of knowing when all our children probed?
>
> * The callback on the aux bus controller side would not be able to
> DEFER. In other words trying to acquire a reference to the panel can
> always be the last thing we do so we know there can be no reasons to
> defer after. This should be doable, but at least in the ps8640 case it
> will require changing the code a bit. I notice that today it actually
> tries to get the panel side _before_ it gets the MIPI side and it
> potentially can return -EPROBE_DEFER if it can't find the MIPI side. I
> guess I have a niggling feeling that we'll find some reason in the
> future that we can't be last, but we can probably ignore that. ;-)
>
> I can switch this all to normal callbacks if that's what everyone
> wants, but it doesn't feel significantly cleaner to me and does seem
> to have some (small) downsides.
>
>
> > And this
> > approach would make driver's life easier, since e.g. the bus code can
> > pm_get the EP device before calling callbacks/notifiers and
> > pm_put_autosuspend it afterwards.
>
> Not sure about doing the pm calls on behalf of the EP device. What's
> the goal there?

I think any driver can pm_runtime_get another device. The goal is to
let the 'post_probe' callback to power up the panel, read the EDID,
etc.

BTW: as I'm slowly diving into DP vs eDP differences. Do we need to
write the EDID checksum like we do for DP?
Do you have any good summary for eDP vs DP differences?

-- 
With best wishes
Dmitry
