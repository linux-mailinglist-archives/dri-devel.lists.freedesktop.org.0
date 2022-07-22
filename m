Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7174557E4A8
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 18:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBB994A83;
	Fri, 22 Jul 2022 16:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F889497C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 16:48:30 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id g1so6511349edb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 09:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fisLtN+BT8yvjNjBHC8GEVzMGlmsArMjpv7WMGpL1uk=;
 b=hGsxQRAaQ1NlnX6V2KJC5urP5Fisa69TIHv/c7JEryUv+CY0+Rbb4BMqZEfVB+u2nS
 IyUkAm5nmu3nGwemICYDJOBjhpJH/OR3iXElWoEVTyoWXZrfGtsZXmbYJiZ+TwDLDeTU
 +9DLqHj3bSOuUMesZoZg8cWXUSEWtmt+B6YWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fisLtN+BT8yvjNjBHC8GEVzMGlmsArMjpv7WMGpL1uk=;
 b=yj9f6LGtT4rErnGbfg3rdUHw9rdYXC/M7V2iC/2JkFvbNlbm/kNNteuFje75hQucbW
 m/h85zfnLl7mw++vK2xM3h+QvO373TqeBCiie1Jqbtl2Kdn785j89ynKH+Y4ZExKKUa5
 F148bjxSfCTcbGL6ULF19LkMoG53x+MRv6DIRG64mNCvWe3TA1G5/Ts0L8J4u5GMcbHs
 ubioIxQNgOSQa53PEXwq/qUwlEr65KaNI9dPfcyBHxyz3LflWShTNjxlQ6G0/2jHQ5vL
 2YETzFzwjYZUbUnA6bTxeqpBegaeW2jkmgjAPYtJV8bb3n8r9rtD0rhlw3A2EjKPfACl
 wLOQ==
X-Gm-Message-State: AJIora9Lt9ed32mP7qyM66/ruArl92/cCshPgJZrrbetH3p2jw92lv5d
 +Ebl0M4TwX7+OoSbPNRP6QNkJHgZi4umOc4n
X-Google-Smtp-Source: AGRyM1voEbLUAQ3IykUk8+xiZdAFWZvvtWT5nwn89GnmZZy2awyw4zDTVlG7ZUK0gOUPABN/Mczj2Q==
X-Received: by 2002:a05:6402:4c3:b0:43a:f612:179d with SMTP id
 n3-20020a05640204c300b0043af612179dmr758805edw.422.1658508508447; 
 Fri, 22 Jul 2022 09:48:28 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52]) by smtp.gmail.com with ESMTPSA id
 bk8-20020a170906b0c800b0072b8222c7f7sm2241118ejb.33.2022.07.22.09.48.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 09:48:22 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id l15so3224851wro.11
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 09:48:21 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr508625wrr.583.1658508501016; Fri, 22
 Jul 2022 09:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220721152314.RFC.1.Ie333b3e4aff6e4a5b58c4aa805e030e561be8773@changeid>
 <269f2610-425b-f296-dcfc-89bdc2e1d587@quicinc.com>
In-Reply-To: <269f2610-425b-f296-dcfc-89bdc2e1d587@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 22 Jul 2022 09:48:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XSVXasU5PMR2kL0WQjQ458xDePuTGd1m14_v9JO5B6oA@mail.gmail.com>
Message-ID: <CAD=FV=XSVXasU5PMR2kL0WQjQ458xDePuTGd1m14_v9JO5B6oA@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/edid: Make 144 Hz not preferred on Sharp
 LQ140M1JW46
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jul 22, 2022 at 9:37 AM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> + sankeerth
>
> Hi Doug
>
> On 7/21/2022 3:23 PM, Douglas Anderson wrote:
> > The Sharp LQ140M1JW46 panel is on the Qualcomm sc7280 CRD reference
> > board. This panel supports 144 Hz and 60 Hz. In the EDID, the 144 Hz
> > mode is listed first and thus is marked preferred. The EDID decode I
> > ran says:
> >
> >    First detailed timing includes the native pixel format and preferred
> >    refresh rate.
> >
> >    ...
> >
> >    Detailed Timing Descriptors:
> >      DTD 1:  1920x1080  143.981 Hz  16:9   166.587 kHz  346.500 MHz
> >                   Hfront   48 Hsync  32 Hback  80 Hpol N
> >                   Vfront    3 Vsync   5 Vback  69 Vpol N
> >      DTD 2:  1920x1080   59.990 Hz  16:9    69.409 kHz  144.370 MHz
> >                   Hfront   48 Hsync  32 Hback  80 Hpol N
> >                   Vfront    3 Vsync   5 Vback  69 Vpol N
> >
> > I'm proposing here that the above is actually a bug and that the 60 Hz
> > mode really should be considered preferred by Linux.
> >
> > The argument here is that this is a laptop panel and on a laptop we
> > know power will always be a concern. Presumably even if someone using
> > this panel wanted to use 144 Hz for some use cases they would only do
> > so dynamically and would still want the default to be 60 Hz.
> >
> > Let's change the default to 60 Hz using a standard quirk.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Yes, we were aware that 144Hz was getting picked. We found that while
> debugging the screen corruption issue.
>
> Well, yes power would be less with 60Hz but so will be the performance.

What performance specifically will be less with 60 Hz? In general the
sc7280 CPU is a bit memory-bandwidth constrained and the LCD refresh
from memory is a non-trivial part of that. Reducing to 60 Hz will
relieve some of the memory bandwidth pressure and will actually allow
tasks on the CPU to run _faster_. I guess the downside is that some
animations might be a little less smooth...


> The test teams have been validating with 144Hz so far so we are checking
> internally with the team whether its OKAY to goto 60Hz now since that
> kind of invalidates the testing they have been doing.

You're worried that the panel itself won't work well at 60 Hz, or
something else about the system won't? The whole system in general
needs to work well with 60 Hz displays and I expect them to be much
more common than 144 Hz displays. Quite honestly if switching to 60 Hz
uncovers a problem that would be a huge benefit of landing this patch
because it would mean we'd find it now rather than down the road when
someone hooks up a different panel.

-Doug
