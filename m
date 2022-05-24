Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39730532016
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 03:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4467B10E31B;
	Tue, 24 May 2022 01:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADAA10E31B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 01:05:17 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id i40so21168732eda.7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 18:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OFIx7s/L3YnWfFaGk/Iok1k3YIHu8uSKhlMvRjqHwqQ=;
 b=KSe/i6TaqXpR9n9Kj7do5tEUVCruj9NeCfJis7lHPt4XCGpfoUSsdoXddyYwkGuok5
 3r/Zv3GeYnYa3EkuzsUa+waSAnvXSIr8oza+OoPRxZNq0zKswJLBHr1tZeo9hc1oY5l1
 INhxu0T4ehuftGE/tXzigmaJGDdwu9VGppBZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OFIx7s/L3YnWfFaGk/Iok1k3YIHu8uSKhlMvRjqHwqQ=;
 b=SVxSRYqaZZ8HLSp79vlNDRd0LOr2Fz2bSm6GK4DB1uTN8whKr6lg/cW/OMiAR3UiJY
 qmm7qXo7prR9oh1Nf8vYimx34M+ZkeYm58Ye3ajuXRnfd28t+iu3wtmdyUTnqwIw937p
 yuFQJD5xNsT0K1NOnAHB9L9hpN2LlEkWg3YCYSYaCJxM48hMurioYXchDytSCP+CCN3q
 jUv3O4/GIrBoykiyu9uOelVd2s3v4flilJMrlmAM5HCC9D8yFCa3DM8u1oFIS58P/0mD
 04q95qAPII6Vb9QelFZip5jdAOTBs0HScLsXHuVNltlUgf/aRBDAJXWOeqDf/I7XmHhK
 I6Xg==
X-Gm-Message-State: AOAM533ld5IfNruhvgKPm3/TkbqvOwdqSUd2aDdZqaeDncunUQWs6NDl
 YPJVUefNdevNkg/9TW1JhUQVwFfCgIiOJG7nUPA=
X-Google-Smtp-Source: ABdhPJyrMId/5GIpoABVAu9dj8p4n0RTiU23tBukauytmAw4XxzKc4F3yU+OaJdvkdEpDHKGrVLyrQ==
X-Received: by 2002:a50:fd95:0:b0:42a:b7ba:291a with SMTP id
 o21-20020a50fd95000000b0042ab7ba291amr26229699edt.247.1653354315904; 
 Mon, 23 May 2022 18:05:15 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43]) by smtp.gmail.com with ESMTPSA id
 w5-20020aa7cb45000000b0042aa7e0f892sm8957620edt.15.2022.05.23.18.05.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 18:05:15 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id u27so22739066wru.8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 18:05:14 -0700 (PDT)
X-Received: by 2002:a05:6000:1548:b0:20f:c4e3:637a with SMTP id
 8-20020a056000154800b0020fc4e3637amr11832701wry.513.1653353955258; Mon, 23
 May 2022 17:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <5857c510-9783-a483-8414-65d7350618d6@suse.de>
 <CAD=FV=X99EWmRk82ako7cL7BWPEsTG=L7VVBVDFX5qKc1MifSA@mail.gmail.com>
In-Reply-To: <CAD=FV=X99EWmRk82ako7cL7BWPEsTG=L7VVBVDFX5qKc1MifSA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 May 2022 17:59:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U3Wywjev9tEhkL_zE1cV5NwEknH2YwHqyhd5TQtiJ=AQ@mail.gmail.com>
Message-ID: <CAD=FV=U3Wywjev9tEhkL_zE1cV5NwEknH2YwHqyhd5TQtiJ=AQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/probe-helper: Make 640x480 first if no EDID
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 20, 2022 at 5:01 PM Doug Anderson <dianders@chromium.org> wrote=
:
>
> Hi,
>
> On Mon, May 16, 2022 at 3:28 AM Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
> >
> > Hi Douglas,
> >
> > I understand that you're trying to tell userspace that the modelist has
> > been made up, but it's not something that should be done via fragile
> > heuristics IMHO.
> >
> > I looked at the Chromium source code that you linked, but I cannot say
> > whether it's doing the correct thing. It all depends on what your
> > program needs.
> >
> > In that function, you could also search for 'DRM_MODE_TYPE_USERDEF'.
> > It's the mode that the user specified on the kernel command line. If
> > Chromium's automatic mode selection fails, you'd give your users direct
> > control over it.
>
> That doesn't really work for Chrome OS. Certainly a kernel hacker
> could do this, but it's not something I could imagine us exposing to
> an average user of a Chromebook.
>
>
> > When there's no flagged mode or if
> > /sys/class/drm/card<...>/status contains "unconnected", you can assume
> > that the modelist is artificial and try the modes in an appropriate ord=
er.
>
> So "no flagged" means that nothing is marked as preferred, correct?
>
> ...so I guess what you're suggesting is that the order that the kernel
> is presenting the modes to userspace is not ABI. If there are no
> preferred modes then userspace shouldn't necessarily assume that the
> first mode returned is the best mode. Instead it should assume that if
> there is no preferred mode then the mode list is made up and it should
> make its own decisions about the best mode to start with. If this is
> the ABI from the kernel then plausibly I could convince people to
> change userspace to pick 640x480 first in this case.
>
> > If we really want the kernel to give additional guarantees, we should
> > have a broader discussion about this topic IMHO.
>
> Sure. I've added St=C3=A9phane Marchesin to this thread in case he wants =
to
> chime in about anything.
>
> Overall, my take on the matter:
>
> * Mostly I got involved because, apparently, a DP compliance test was
> failing. The compliance test was upset that when it presented us with
> no EDID that we didn't default to 640x480. There was a push to make a
> fix for this in the Qualcomm specific driver but that didn't sit right
> with me.
>
> * On all devices I'm currently working with (laptops), the DP is a
> secondary display. If a user was trying to plug in a display with a
> bad EDID and the max mode (1024x768) didn't work, they could just use
> the primary display to choose a different resolution. It seems
> unlikely a user would truly be upset and would probably be happy they
> could get their broken display to work at all. Even if this is a
> primary display, I believe there are documented key combos to change
> the resolution of the primary display even if you can't see anything.
>
> * That all being said, defaulting to 640x480 when there's no EDID made
> sense to me, especially since it's actually defined in the DP spec. So
> I'm trying to do the right thing and solve this corner case. That
> being said, if it's truly controversial I can just drop it.
>
>
> So I guess my plan will be to give St=C3=A9phane a little while in case h=
e
> wants to chime in. If not then I guess I'll try a Chrome patch...
> ...and if that doesn't work, I'll just drop it.

OK, this userspace code seems to work:

https://crrev.com/c/3662501 - ozone/drm: Try 640x480 before picking
the first mode if no EDID

...so we'll see how review of that goes. :-)
