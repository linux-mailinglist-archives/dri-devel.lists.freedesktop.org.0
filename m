Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993E24CD368
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 12:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF2D10E8D4;
	Fri,  4 Mar 2022 11:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C54410E8D3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 11:26:10 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id f21so6142246qke.13
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 03:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=A0godyTPEn2FgOlGrx2QRkrSBkW5MJikxlTCkI4Pnyk=;
 b=ZAwzNTGO8wtVj+U0QClTskN4x1J14p56TsGiFUeS6CeBsuE5ZUPpitJmK7R4hpv6bv
 JJo07K4dRItIO5xXEHo1b/Aezb1mKICt8OsoCrSbfwOTwRR44hwhHI/4DFBFPXCdH7g9
 /v5Iu34zljY1LjplMCHutrkjvGGvqELqnX34uHF2zl9ujv3/VNqNqu966ZKkCkUNQzDP
 0CRNEvUcSySEldP3hkP04IuGL0nKanY84oDdJErFXg35dnqc3qgT54er+vO0uoSTsRYq
 B8M7VSfuJq6kOPaj8O/RYDtsruz2ygQjz5hp5/Xp7bb/bLTYmG7WH2Cc+ZzUFP2lhMry
 wNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A0godyTPEn2FgOlGrx2QRkrSBkW5MJikxlTCkI4Pnyk=;
 b=APx/VYp+rn3IzeGtWM3nmAortZZfWgOsGHbPtiIz5maek90UU8Ics3VbW6Vjb0Sy6W
 AxaVtyqi2VWOF1EAD1Aq9QL6OGkl7aA2Kqe9UBelNpsNOZ8Mg/4TdyyRQtEzolHKwMFD
 W+7RSBHYb9c/xPGlCYPNDibQBsCIzvvxvWCJKAAo4YAmoAZJSC4gJo6STtJR6mh9Wb49
 XsR+wy+xa93Sz/yk300i6WldGTbE44UkEIwWu2sVjQLc+VxLb22kV7Qrlt+5OdQyJMi8
 wqqvP8ypc5Ljw+BwxOJuEuPAcZN6XUfOfqlbmZ2OaQ3GzmB3mY4kR2SYkbPNHlnzNgto
 N+Pg==
X-Gm-Message-State: AOAM530kDq0kaPOmM9yA55x068A1GAN8e41eqTH07z6qv63C9ehR90Mk
 8IagyBwn+3DBqtHN7MFZybP8gYOIEZwv8+oETpgz63TjhLqL+i54
X-Google-Smtp-Source: ABdhPJzVzQPUSk4nBKVCSHJzDo49mjdGomgO75XctxuXD0fkyEDwyjc3tHXhGI7M4cESOS2ys1tT88G+Gdp9xrs/+yk=
X-Received: by 2002:a37:6215:0:b0:508:c213:72de with SMTP id
 w21-20020a376215000000b00508c21372demr2214499qkb.30.1646393169553; Fri, 04
 Mar 2022 03:26:09 -0800 (PST)
MIME-Version: 1.0
References: <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com>
 <87y22ts948.fsf@intel.com>
 <YfqGbqQQz5vrDaLI@pendragon.ideasonboard.com> <87v8xxs2hz.fsf@intel.com>
 <CAF6AEGtdnWWhGp7U7nAPD4r3Uoe5BJKVm2rQ2MS=q5GqF6MYDA@mail.gmail.com>
 <YhyB0WmJDWVFO1se@pendragon.ideasonboard.com> <871qzn6vmc.fsf@intel.com>
 <Yhy/6+z7QshG+qOo@pendragon.ideasonboard.com>
 <YhzROBOwTUkZw3Ez@pendragon.ideasonboard.com>
 <4d8daabe-10d9-a3cf-d305-68414cffe4ed@quicinc.com>
 <Yh+4EOKA5FgrlZrF@pendragon.ideasonboard.com>
 <0cfd36a2-26e4-309d-d8e9-e3bf8a5d2417@quicinc.com>
 <MWHPR11MB174187335183FC24BE0F1EA5E3059@MWHPR11MB1741.namprd11.prod.outlook.com>
 <CAA8EJppTVN1EnytD5mCmr4ZTi4M8u9ENOmJuweNyDRkB3LEHnw@mail.gmail.com>
 <MWHPR11MB1741708DEFD56E02C1BBC7A3E3059@MWHPR11MB1741.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB1741708DEFD56E02C1BBC7A3E3059@MWHPR11MB1741.namprd11.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 4 Mar 2022 14:25:58 +0300
Message-ID: <CAA8EJppHOJzJt=oapYhshajWt3mSXKjoMUdcnb3T_i+62Xo8NA@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting from
 drm_writeback_connector structure changes
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
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
Cc: Carsten Haitzler <carsten.haitzler@arm.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Mar 2022 at 13:47, Kandpal, Suraj <suraj.kandpal@intel.com> wrote=
:
>
> Hi,
> > > Hi Abhinav,
> > > > Hi Laurent
> > > >
> > > > Ok sure, I can take this up but I need to understand the proposal a
> > > > little bit more before proceeding on this. So we will discuss this
> > > > in another email where we specifically talk about the connector cha=
nges.
> > > >
> > > > Also, I am willing to take this up once the encoder part is done an=
d
> > > > merged so that atleast we keep moving on that as MSM WB
> > > > implementation can proceed with that first.
> > > >
> > > > Hi Jani and Suraj
> > > >
> > > > Any concerns with splitting up the series into encoder and connecto=
r
> > > > OR re- arranging them?
> > > >
> > > > Let me know if you can do this OR I can also split this up keeping
> > > > Suraj's name in the Co-developed by tag.
> > > I was actually thinking of floating a new patch series with both
> > > encoder and connector pointer changes but with a change in
> > > initialization functions wherein we allocate a connector and encoder
> > > incase the driver doesn=E2=80=99t have its own this should minimize t=
he effect
> > > on other drivers already using current drm writeback framework and al=
so
> > allow i915 to create its own connector.
> >
> > I thought that Laurent was quite strict about the connector. So I'd sug=
gest
> > targeting drm_writeback_connector with an optionally created encoder an=
d
> > the builtin connector
> In that case even if we target that i915 will not be able to move forward=
 with its
> implementation of writeback as builtin connector does not work for us rig=
ht now
> as explained earlier, optionally creating encoder and connector will help=
 everyone
> move forward and once done we can actually sit and work on how to side st=
ep this
> issue using Laurent's suggestion

This is up to Laurent & other DRM maintainers to decide whether this
approach would be accepted or not.
So far unfortunately I have mostly seen the pushback and a strong
suggestion to stop treating each drm_connector as i915_connector.
I haven't checked the exact details, but IMO adding a branch if the
connector's type is DRM_CONNECTOR_VIRTUAL should be doable.

> >
> > > We can work on Laurent's suggestion but that would first require the
> > > initial RFC patches and then a rework from both of our drivers side t=
o
> > > see if they gel well with our current code which will take a
> > > considerable amount of time. We can for now however float the patch
> > > series up which minimally affects the current drivers and also allows
> > > i915 and msm to move forward with its writeback implementation off
> > > course with a proper documentation stating new drivers shouldn't try =
to
> > make their own connectors and encoders and that drm_writeback will do
> > that for them.
> > > Once that's done and merged we can work with Laurent on his proposal
> > > to improve the drm writeback framework so that this issue can be side
> > stepped entirely in future.
> > > For now I would like to keep the encoder and connector pointer change=
s
> > together.
>
> Best Regards,
> Suraj Kandpal



--=20
With best wishes
Dmitry
