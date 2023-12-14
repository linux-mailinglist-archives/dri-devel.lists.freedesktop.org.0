Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 505B4812A24
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 09:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5C910E176;
	Thu, 14 Dec 2023 08:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71ADD10E00F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 08:17:13 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-35da85e543eso29228995ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 00:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702541833; x=1703146633;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0xiwwvK2LirL4zExSHvxpuvRjqDqO3bqO7fbrBZ3EcM=;
 b=BthJ/NzjtnIgetXzGMcOv/KJH203/G0OywkEdYV+5UOdN7Wm8gipDQv18I3aDKKKhS
 NfQJCTJRPEyes6B+alEoaCMaMPN+SMdOTFo/CjWfuBQv79zKgMLt3rJLI9FRHOCbwqSV
 joplOf6CNpvRHwsjog6C8/jnd4RocTFnmWWFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702541833; x=1703146633;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0xiwwvK2LirL4zExSHvxpuvRjqDqO3bqO7fbrBZ3EcM=;
 b=VgHytecADVabfMmAF0GhvrHGR6XTstdLAzH9MBb8EHtXqzjdOoK49cJtjLZ/VZZ9rH
 a0g5O2YIkbRRB30EhXQ8N/q1pPyd3m9WhX4AcCB+Q0E19nUllqJ3sre/zSq37OF9D+kY
 YHYqaN+Y27Wmg+sUwHPg53LeY5qh8beQzM0raEu7klgrTr6alTzTlT1r26R8NsMRFD5e
 72I1+dVaEthOleaPdaH9mr5/fsEX+aFPoOD8LBWrV6Yom8F/FMU+kVbDJ2m/k1LwG6T0
 ufF7CmnnPhJEG1mRKBIFfaE5jqymcS2qieFKkR/8zPcaTqPXjRhDKwNPJmyE6GgV+QVo
 9uZA==
X-Gm-Message-State: AOJu0YyxbFaKagLbX6+grNpNcqQoXZnakd3VCTez38/ErCRlNiQAabUQ
 w1tJ2h6IvWZUWZg4/gAASuOUqj8G2GYMiqQIcytFuQ==
X-Google-Smtp-Source: AGHT+IHrdEdNIh1ZE4V8Uz5oEN6VNCt2b4c4KjcgUJHbJ9BSJmU75B8kJ8o14rG4f6MA2NZFrfXbTL5ywJ6odbnD88E=
X-Received: by 2002:a05:6e02:1ba7:b0:35f:741a:7900 with SMTP id
 n7-20020a056e021ba700b0035f741a7900mr2960084ili.15.1702541832782; Thu, 14 Dec
 2023 00:17:12 -0800 (PST)
MIME-Version: 1.0
References: <20231207081801.4049075-1-treapking@chromium.org>
 <20231207081801.4049075-5-treapking@chromium.org>
 <CAD=FV=U6M5rpQXmjC+iGf0BGtiyjRAAcMfo4Fr3pDyYVp3m4aQ@mail.gmail.com>
 <fctpvshu5ychxketsf35jfg2qzi6i3nfup5hy7r7hzmmbpd2j4@xmsik3cycjlj>
 <CAD=FV=V=K9L=bJiNvFJ+K_DHUTPxA4WtukXA+E_VW6uihE8kdQ@mail.gmail.com>
 <cplpgkl5b3nrtdhxauleep6zo2rwic7h7fiwr4wnvrwk6uzxgw@dcgknug2gsaa>
 <CAD=FV=UiF9d5C=da64dj_JnGWuO_vGUg1hgzXSQd0x+pFpe23w@mail.gmail.com>
In-Reply-To: <CAD=FV=UiF9d5C=da64dj_JnGWuO_vGUg1hgzXSQd0x+pFpe23w@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 14 Dec 2023 16:17:01 +0800
Message-ID: <CAEXTbpdjTVteNYMPN_wOwoc9TGuRT-+mugM4pj6tzih_wOU+hg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/panel-edp: Add some panels with conservative
 timings
To: Doug Anderson <dianders@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Guenter Roeck <groeck@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 12:23=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Wed, Dec 13, 2023 at 7:34=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> >
> > > > > Repeating my comments from v1 here too, since I expect this patch=
 to
> > > > > sit on the lists for a little while:
> > > > >
> > > > >
> > > > > This is OK w/ me, but it will need time on the mailing lists befo=
re
> > > > > landing in case anyone else has opinions.
> > > >
> > > > Generally speaking, I'm not really a fan of big patches that dump
> > > > whatever ChromeOS is doing ...
> > > >
> > > > > Specifical thoughts:
> > > > >
> > > > > * I at least feel fairly confident that this is OK since these pa=
nels
> > > > > essentially booted without _any_ delays back on the old downstrea=
m
> > > > > v4.19 kernel. Presumably the panels just had fairly robust timing
> > > > > controllers and so worked OK, but it's better to get the timing m=
ore
> > > > > correct.
> > > >
> > > > ... especially since you have to rely on the recollection of engine=
ers
> > > > involved at the time and you have no real way to test and make thin=
gs
> > > > clearer anymore, and we have to take patches in that are handwavy "=
trust
> > > > us, it's doing the right thing".
> > > >
> > > > I'd really prefer to have these patches sent as they are found out.
> > >
> > > It's probably not clear enough from the commit message, but this isn'=
t
> > > just a dump from downstream 4.19. What happened was:
> > >
> > > 1. Downstream chromeos-4.19 used the "little white lie" approach. The=
y
> > > all claimed a specific panel's compatible string even though there
> > > were a whole pile of panels out there actually being used. Personally=
,
> > > this was not something I was ever a fan of (and I wasn't personally
> > > involved in this project), but it was the "state of the art" before
> > > the generic panel-edp. Getting out of the "little white lie" situatio=
n
> > > was why I spent so much time on the generic edp-panel solution
> > > upstream.
> > >
> > > 2. These devices have now been uprevved to a newer kernel and I
> > > believe that there were issues seen that necessitated a move to the
> > > proper generic panel-edp code.
> > >
> > > 3. We are now getting field reports from our warning collector about =
a
> > > whole pile of panels that are falling back to the "conservative"
> > > timings, which means that they turn on/off much more slowly than they
> > > should.
> > >
> > > Pin-yen made an attempt to search for panels data sheets that matched
> > > up with the IDs that came in from the field reports but there were
> > > some panels that he just couldn't find.
> > >
> > > So basically we're stuck. Options:
> > >
> > > 1. Leave customers who have these panels stuck with the hardware
> > > behaving worse than it used to. This is not acceptable to me.
> > >
> > > 2. Land Pin-yen's patch as a downstream-only patch in ChromeOS. This
> > > would solve the problem, but it would make me sad. If anyone ever
> > > wants to take these old laptops and run some other Linux distribution
> > > on them (and there are several that target old Chromebooks) then
> > > they'd be again stuck with old timings.
> > >
> > > 3. Land a patch like this one that at least gets us into not such a b=
ad shape.
> > >
> > > While I don't love this patch (and that's why I made it clear that it
> > > needs to spend time on the list), it seems better than the
> > > alternatives. Do you have a proposal for something else? If not, can
> > > you confirm you're OK with #3 given this explanation? ...and perhaps
> > > more details in the commit message?
> >
> > I don't have a specific comment, it was more of a comment about the
> > process itself, if you write down what's above in the commit message ..=
.
>
> Pin-yen: can you take a whack at summarizing some of the above in the
> commit message and sending out a v3?

Sure I'll do that in v3. Sorry for not including enough details in the
original commit message.

Pin-yen
