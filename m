Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2A95855D3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 21:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8228C10E077;
	Fri, 29 Jul 2022 19:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CAB10E077
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 19:57:57 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id c12so7054222ede.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 12:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=W+QN4O2BhXHS+vUE27PDdCSUcq9hnSAP99uK5Xn1FCM=;
 b=Zj2jLtqa9dUSEbGnR+hTFlVho37WJlcebbvW7QtxZQ0BO9XFH3vP2obk6NtwMZBu9R
 lvbWvFWpxmZeSay2R3uGC3Gv6F/586vBXsKjvhZu7UkEmvbwxhHNC+8Oiy55snkgH5t7
 txYnsgBEpnqU+xpfPzP7gA3W/jmyDWqpjGygI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=W+QN4O2BhXHS+vUE27PDdCSUcq9hnSAP99uK5Xn1FCM=;
 b=RbxdMMo8dCx4nzJ9OMyIpswu0gvD0dNygMKGjovgkdeQq1qmA4gmEredHuzFxTfteA
 zVRg0IeNunVt12fwuG0awZMD3eVW9z9XB+OJWvdNGPCVkH+aldNoE//+qDoNtHzwpf2z
 wRFSCj/C8d58v1bc8qYqNwAlDghqgrb4YXN/ZzGQq5qL1oWlPbnK2+GMH28E990fcvBG
 emgucjHF6CqXjlA8+s7uGAXxN+bBZe6L+lZvBaKatz0INzx9CsmV7lQaHHGFVReI7kNJ
 lL+YItLD3Lk11ZogElXRg3DQmqA0LXszsbR176sa1cGyi0/eEYizPax0v1GDsZ+f1sZT
 60FA==
X-Gm-Message-State: AJIora/unDLJqg0NbyFHcJciqrk7Z3hzltGfQsNJ0U18ySRC0fgI879c
 oiVi0gpd4RILkUmHqWorIXMmrIb/lyIwHEId91A=
X-Google-Smtp-Source: AGRyM1sI8DvFNWf18bYDe8TXxh78+C3v1hkUfm86ENi2sHru6dIiY19/LYM2Fj2KTT+Z3Z0hQG0Eiw==
X-Received: by 2002:a05:6402:5415:b0:43b:a888:fefe with SMTP id
 ev21-20020a056402541500b0043ba888fefemr4987789edb.302.1659124675867; 
 Fri, 29 Jul 2022 12:57:55 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 c17-20020a170906d19100b0072ffbbc3341sm2029787ejz.204.2022.07.29.12.57.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 12:57:53 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 i10-20020a1c3b0a000000b003a2fa488efdso2390648wma.4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 12:57:53 -0700 (PDT)
X-Received: by 2002:a05:600c:1e0f:b0:3a3:191c:a3c8 with SMTP id
 ay15-20020a05600c1e0f00b003a3191ca3c8mr3637779wmb.151.1659124672731; Fri, 29
 Jul 2022 12:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220721152314.RFC.1.Ie333b3e4aff6e4a5b58c4aa805e030e561be8773@changeid>
 <269f2610-425b-f296-dcfc-89bdc2e1d587@quicinc.com>
 <CAD=FV=XSVXasU5PMR2kL0WQjQ458xDePuTGd1m14_v9JO5B6oA@mail.gmail.com>
 <CAF6AEGv_Vikf80v-7ccz90fvGPrk5pV1tOxRoWKxKHYuEW8=aA@mail.gmail.com>
 <5c8ca71c-5f0b-d5f5-9f16-e312dec0d01b@quicinc.com>
 <CAD=FV=UGYV1mZenDCRrbpC+gpE12-Uis7fm_=H3PeEjK=t36yA@mail.gmail.com>
 <20220729075118.ofnpk52tk4usm3n3@penduick>
 <CAD=FV=WUB68-DQ-pAFjGaG-kid33ve4Qc3iqb8OUh61xTBohmg@mail.gmail.com>
 <20220729164136.opucqg64qz4ypmvo@penduick>
In-Reply-To: <20220729164136.opucqg64qz4ypmvo@penduick>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 29 Jul 2022 12:57:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UKYksHjuVR27DPdUFFtJrQKB2KbT08qjeYLNW_3y_Mfg@mail.gmail.com>
Message-ID: <CAD=FV=UKYksHjuVR27DPdUFFtJrQKB2KbT08qjeYLNW_3y_Mfg@mail.gmail.com>
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

On Fri, Jul 29, 2022 at 9:41 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Fri, Jul 29, 2022 at 07:50:20AM -0700, Doug Anderson wrote:
> > On Fri, Jul 29, 2022 at 12:51 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Thu, Jul 28, 2022 at 02:18:38PM -0700, Doug Anderson wrote:
> > > > Hi,
> > > >
> > > > On Thu, Jul 28, 2022 at 10:34 AM Abhinav Kumar
> > > > <quic_abhinavk@quicinc.com> wrote:
> > > > >
> > > > > Hi Rob and Doug
> > > > >
> > > > > On 7/22/2022 10:36 AM, Rob Clark wrote:
> > > > > > On Fri, Jul 22, 2022 at 9:48 AM Doug Anderson <dianders@chromium.org> wrote:
> > > > > >>
> > > > > >> Hi,
> > > > > >>
> > > > > >> On Fri, Jul 22, 2022 at 9:37 AM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > > > >>>
> > > > > >>> + sankeerth
> > > > > >>>
> > > > > >>> Hi Doug
> > > > > >>>
> > > > > >>> On 7/21/2022 3:23 PM, Douglas Anderson wrote:
> > > > > >>>> The Sharp LQ140M1JW46 panel is on the Qualcomm sc7280 CRD reference
> > > > > >>>> board. This panel supports 144 Hz and 60 Hz. In the EDID, the 144 Hz
> > > > > >>>> mode is listed first and thus is marked preferred. The EDID decode I
> > > > > >>>> ran says:
> > > > > >>>>
> > > > > >>>>     First detailed timing includes the native pixel format and preferred
> > > > > >>>>     refresh rate.
> > > > > >>>>
> > > > > >>>>     ...
> > > > > >>>>
> > > > > >>>>     Detailed Timing Descriptors:
> > > > > >>>>       DTD 1:  1920x1080  143.981 Hz  16:9   166.587 kHz  346.500 MHz
> > > > > >>>>                    Hfront   48 Hsync  32 Hback  80 Hpol N
> > > > > >>>>                    Vfront    3 Vsync   5 Vback  69 Vpol N
> > > > > >>>>       DTD 2:  1920x1080   59.990 Hz  16:9    69.409 kHz  144.370 MHz
> > > > > >>>>                    Hfront   48 Hsync  32 Hback  80 Hpol N
> > > > > >>>>                    Vfront    3 Vsync   5 Vback  69 Vpol N
> > > > > >>>>
> > > > > >>>> I'm proposing here that the above is actually a bug and that the 60 Hz
> > > > > >>>> mode really should be considered preferred by Linux.
> > > > >
> > > > > Its a bit tricky to say that this is a bug but I think we can certainly
> > > > > add here that for an internal display we would have ideally had the
> > > > > lower resolution first to indicate it as default.
> > > >
> > > > Yeah, it gets into the vagueness of the EDID spec in general. As far
> > > > as I can find it's really up to the monitor to decide by what means it
> > > > chooses the "preferred" refresh rate if the monitor can support many.
> > > > Some displays may decide that the normal rate is "preferred" and some
> > > > may decide that the high refresh rate is "preferred". Neither display
> > > > is "wrong" per say, but it's nice to have some consistency here and to
> > > > make it so that otherwise "dumb" userspace will get something
> > > > reasonable by default. I'll change it to say:
> > > >
> > > > While the EDID spec appears to allow a display to use any criteria for
> > > > picking which refresh mode is "preferred" or "optimal", that vagueness
> > > > is a bit annoying. From Linux's point of view let's choose the 60 Hz
> > > > one as the default.
> > >
> > > And if we start making that decision, it should be for all panels with a
> > > similar constraint, so most likely handled by the core, and the new
> > > policy properly documented.
> > >
> > > Doing that just for a single panel is weird.
> >
> > Yeah, though having a "general policy" in the core can be problematic.
> >
> > In general I think panel EDIDs are only trustworthy as far as you can
> > throw them. They are notorious for having wrong and incorrect
> > information, which is why the EDID quirk list exists to begin with.
> > Trying to change how we're going to interpret all EDIDs, even all
> > EDIDs for eDP panels, seems like it will break someone somewhere.
> > Maybe there are EDIDs out there that were only ever validated at the
> > higher refresh rate and they don't work / flicker / cause digitizer
> > noise at the lower refresh rate. Heck, we've seen eDP panel vendors
> > that can't even get their checksum correct, so I'm not sure I want to
> > make a global assertion that all panels validated their "secondary"
> > display mode.
> >
> > In this particular case, we have validated that this particular Sharp
> > panel works fine at the lower refresh rate.
> >
> > I would also note that, as far as I understand it, ODMs actually can
> > request different EDIDs from the panel vendors. In the past we have
> > been able to get panel vendors to change EDIDs. Thus for most panels
> > I'd expect that we would discover this early, change the EDID default,
> > and be done with it. The case here is a little unusual in that by the
> > time we got involved and started digging into this panel too many were
> > created and nobody wants to throw away those old panels. This is why
> > I'm treating it as a quirk/bug. Really: we should have updated the
> > EDID of the panel but we're unable to in this case.
>
> You raise some good points, but most of the discussion around that patch
> were mostly around performances, power consumption and so on.
>
> This is very much a policy decision, and if there is some panel where
> the EDID reports 60Hz but is broken, then that panel should be the
> exception to the policy
>
> But doing it for a single panel is just odd

OK, fair enough. I'll abandon this patch at least as far as mainline
is concerned, then.

-Doug
