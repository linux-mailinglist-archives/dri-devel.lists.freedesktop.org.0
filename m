Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A025957E5B7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 19:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811DC11AE35;
	Fri, 22 Jul 2022 17:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0414911A8AB;
 Fri, 22 Jul 2022 17:36:23 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so5406424wmq.0; 
 Fri, 22 Jul 2022 10:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yGBGk+p2EktzA+zS1mnmSkS2k1FkCaq2TcgNmtHB9w8=;
 b=AuiC7D3WaG23z3SLsy5dE+QMQxe+snbzEWYetJrnDWtIk5JkMaBzzb+1XmGz/7npeJ
 prALpI+A0WrXNqQ+ZPXUQxR2/OttVmzrZN8/rQcazbGWI2uVfqAAN2ELkjiPt5lIwNLh
 jqQoZAjQ1N5+bwAF90E/3eLtTEAb+zMDiqqv0knOHSmuH9tLjhMcuDYYcDbWKtZCZ1d2
 KjwZJOyABGNRkacHxap052MwJCkVrWYekdQz/hStIgdovBy7JMUqJEbOtvj0k+ZJeRjo
 nva1EScC/2J+fRygysf7Z1Kf8dNcietJ9qXqcBUFv0Dph+lQvORTcFYX7w66YyrWpzBk
 TL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yGBGk+p2EktzA+zS1mnmSkS2k1FkCaq2TcgNmtHB9w8=;
 b=E1RRct55iafbd8WNT8tGdJeHb2eGiXxLH7RQHQB0wYnWZd/RkcsekGyt9/N9aqD28O
 Adg/XL0KqWAGNGKpfmw4InmGp/kNDwIdfL8a71RDsAE+rRlY+qxOxeFXoVtS6OFerGQD
 qjcxDbzP6dFsj9e8dpHK2EOjRz13j+DIBTuVlF55wI9id1D2lccNAFUFW4AuDWZwAt/J
 8HCvbbdIhjAy2z21VUQwBtGlqfde8eOMleEq39oEEoqQjiU8/ZVdcLu+PELkyTSSPzfx
 3+cERGJaVkTzPLttt75NHjcL9QW4WMhUhKaeGKLdsXVYev8X3BwI8srXSUAFtX0I73xi
 4WKQ==
X-Gm-Message-State: AJIora8vksff/R1TuOTZQHn/04tmn/ZZnyvhQr2+hYbAjrQBIP51Laj1
 4aFetGqtC5XpqqurxQ8iW5d6Qxh8Lsaq61TXN1s=
X-Google-Smtp-Source: AGRyM1u39p8LsNLN5QDBQqApbbnXq6QehY4cZtGOoda3GVQm5WQIb47ThAB08yL1BKFo1IzMvE0TGABxt/gg8mQM5u0=
X-Received: by 2002:a05:600c:3510:b0:3a3:34e7:cfc8 with SMTP id
 h16-20020a05600c351000b003a334e7cfc8mr6773219wmq.164.1658511382374; Fri, 22
 Jul 2022 10:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220721152314.RFC.1.Ie333b3e4aff6e4a5b58c4aa805e030e561be8773@changeid>
 <269f2610-425b-f296-dcfc-89bdc2e1d587@quicinc.com>
 <CAD=FV=XSVXasU5PMR2kL0WQjQ458xDePuTGd1m14_v9JO5B6oA@mail.gmail.com>
In-Reply-To: <CAD=FV=XSVXasU5PMR2kL0WQjQ458xDePuTGd1m14_v9JO5B6oA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 22 Jul 2022 10:36:44 -0700
Message-ID: <CAF6AEGv_Vikf80v-7ccz90fvGPrk5pV1tOxRoWKxKHYuEW8=aA@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/edid: Make 144 Hz not preferred on Sharp
 LQ140M1JW46
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
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 9:48 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Jul 22, 2022 at 9:37 AM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> > + sankeerth
> >
> > Hi Doug
> >
> > On 7/21/2022 3:23 PM, Douglas Anderson wrote:
> > > The Sharp LQ140M1JW46 panel is on the Qualcomm sc7280 CRD reference
> > > board. This panel supports 144 Hz and 60 Hz. In the EDID, the 144 Hz
> > > mode is listed first and thus is marked preferred. The EDID decode I
> > > ran says:
> > >
> > >    First detailed timing includes the native pixel format and preferred
> > >    refresh rate.
> > >
> > >    ...
> > >
> > >    Detailed Timing Descriptors:
> > >      DTD 1:  1920x1080  143.981 Hz  16:9   166.587 kHz  346.500 MHz
> > >                   Hfront   48 Hsync  32 Hback  80 Hpol N
> > >                   Vfront    3 Vsync   5 Vback  69 Vpol N
> > >      DTD 2:  1920x1080   59.990 Hz  16:9    69.409 kHz  144.370 MHz
> > >                   Hfront   48 Hsync  32 Hback  80 Hpol N
> > >                   Vfront    3 Vsync   5 Vback  69 Vpol N
> > >
> > > I'm proposing here that the above is actually a bug and that the 60 Hz
> > > mode really should be considered preferred by Linux.
> > >
> > > The argument here is that this is a laptop panel and on a laptop we
> > > know power will always be a concern. Presumably even if someone using
> > > this panel wanted to use 144 Hz for some use cases they would only do
> > > so dynamically and would still want the default to be 60 Hz.
> > >
> > > Let's change the default to 60 Hz using a standard quirk.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > Yes, we were aware that 144Hz was getting picked. We found that while
> > debugging the screen corruption issue.
> >
> > Well, yes power would be less with 60Hz but so will be the performance.
>
> What performance specifically will be less with 60 Hz? In general the
> sc7280 CPU is a bit memory-bandwidth constrained and the LCD refresh
> from memory is a non-trivial part of that. Reducing to 60 Hz will
> relieve some of the memory bandwidth pressure and will actually allow
> tasks on the CPU to run _faster_. I guess the downside is that some
> animations might be a little less smooth...

I guess he is referring to something that is vblank sync'd running
faster than 60fps.

but OTOH it is a bit of a waste for fbcon to be using 144Hz.  And
there are enough android games that limit themselves to 30fps to save
your "phone" battery.  So it seems a lot more sane to default to 60Hz
and let userspace that knows it wants more pick the 144Hz rate when
needed.

BR,
-R

>
>
> > The test teams have been validating with 144Hz so far so we are checking
> > internally with the team whether its OKAY to goto 60Hz now since that
> > kind of invalidates the testing they have been doing.
>
> You're worried that the panel itself won't work well at 60 Hz, or
> something else about the system won't? The whole system in general
> needs to work well with 60 Hz displays and I expect them to be much
> more common than 144 Hz displays. Quite honestly if switching to 60 Hz
> uncovers a problem that would be a huge benefit of landing this patch
> because it would mean we'd find it now rather than down the road when
> someone hooks up a different panel.
>
> -Doug
