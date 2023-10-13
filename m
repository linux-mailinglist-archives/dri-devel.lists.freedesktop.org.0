Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BF57C8BEE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 19:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E99D10E625;
	Fri, 13 Oct 2023 17:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C113D10E625
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 17:05:45 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4063bfc6c03so3555e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 10:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697216744; x=1697821544;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZLTeYfvHIZsFgYvDpFN8FRDYDSigvoHHk+XCSGMyIpE=;
 b=EMJDPbquT8fxTnUN4gfwM5OfVtNxP/k3NMwHEmzLSJO14D9vEE30jb2KgBvCaKEHan
 BlweaQBO1nZEcGQDvvdD7isf3ErB6Gx49iJabrZNiI6vbh/XyWWIQvU2BbnVcNwLOyDH
 /6Gw3THvqPLloqE42d4wdL1Bq1qj3HxjoRZWNEehaSVy1cDRB1ziLVVG6qLJRW2FIjsg
 SK2pa7js5fYHYLELikzlJaAf5fmK3Hu/QygDeuG1TaWfSwpb0S4qBS4WYEzXWGdudmOe
 cOJhpnscxMg9Rw6KsBtcFDcFtQoJ9HgqRdheui0BhxT+0qJP1eGbK8vUsacOLwzIJmq9
 SuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697216744; x=1697821544;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZLTeYfvHIZsFgYvDpFN8FRDYDSigvoHHk+XCSGMyIpE=;
 b=i3bi2ZTRBiHDU+8Nx+ZPmE8wIu+tHjF3nDRhD26lkoIIcx3QzZLcixIazBQfJtF/PI
 JDOUWutvIvBel8fKd1LlMpJKxy21GQJEEldwJ+4EBaaBZ2JGmREppRfpl3t7HxW96WQ5
 spRrFA5UnG1RlVsL9gKWK8VfX3GTi70gknzQ4/7QWa2gQKzPGDps7NMXf1n0K2F1jBZK
 bSvofoVRnGqEbtVQ8FKj3Y6Z1FNbt9WasdVTN/m2mt7+kSBvND4X6nE4E0njRdnkdIWD
 gcRgf7QHX4bJVu2W86nZ8Yvz0YqbHqWkrNiGvtsCt/EXB8OcLhcAvRIYIdkuWw9uAhz0
 3PRw==
X-Gm-Message-State: AOJu0YxmiZGg/MHR33P+z80jLoTe+dWRsudJ6gmQbfdeW00/ElrXmAa8
 vDnUCYK0m2+qR9f38lRPK9kcIsyWJ4hqqTbi8k5W1w==
X-Google-Smtp-Source: AGHT+IE3xqiYKg1JuezqI9ENft5U9ZYxAhPiMMAiZnHB4jypHpaoUmpHYk/8BpvcZlxtKWlHRSF8Bms476/kWK77Xbo=
X-Received: by 2002:a05:600c:3b06:b0:3fe:e9ea:9653 with SMTP id
 m6-20020a05600c3b0600b003fee9ea9653mr153181wms.4.1697216743940; Fri, 13 Oct
 2023 10:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231012121004.2127918-1-yangcong5@huaqin.corp-partner.google.com>
 <20231012121004.2127918-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=VwUHctAQXGr_6FZfTS3r0-MZaSiB8+YkfJJzrJsnZDLw@mail.gmail.com>
 <CAHwB_NKSL8vHdN8TnQY2Z04E4rDRLK5BHoryZCi2kNAwQEjisQ@mail.gmail.com>
 <CAD=FV=VmiS6G25JyAj4UGjU5Q9f80GcjLq1xwU4gdVyzDdk8LQ@mail.gmail.com>
 <CAHwB_NL_RfLBmAOWqj-9iaUZEg-C2JUUveP1cn4dnR98az0BXQ@mail.gmail.com>
In-Reply-To: <CAHwB_NL_RfLBmAOWqj-9iaUZEg-C2JUUveP1cn4dnR98az0BXQ@mail.gmail.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 13 Oct 2023 10:05:27 -0700
Message-ID: <CAD=FV=W_LT9mPYKjaKP3OvUDeNpsZxkhVN9NP_hQ+Es6Fe3dVw@mail.gmail.com>
Subject: Re: [v3 2/3] drm/panel: ili9882t: Avoid blurred screen from fast sleep
To: cong yang <yangcong5@huaqin.corp-partner.google.com>
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
Cc: neil.armstrong@linaro.org, will@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, catalin.marinas@arm.com, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 12, 2023 at 8:56=E2=80=AFPM cong yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Hi,
>
> On Fri, Oct 13, 2023 at 10:28=E2=80=AFAM Doug Anderson <dianders@google.c=
om> wrote:
> >
> > Hi,
> >
> > On Thu, Oct 12, 2023 at 6:12=E2=80=AFPM cong yang
> > <yangcong5@huaqin.corp-partner.google.com> wrote:
> > >
> > > Hi,
> > >
> > > On Thu, Oct 12, 2023 at 11:15=E2=80=AFPM Doug Anderson <dianders@goog=
le.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Thu, Oct 12, 2023 at 5:10=E2=80=AFAM Cong Yang
> > > > <yangcong5@huaqin.corp-partner.google.com> wrote:
> > > > >
> > > > > At present, we have found that there may be a problem of blurred
> > > > > screen during fast sleep/resume. The direct cause of the blurred
> > > > > screen is that the IC does not receive 0x28/0x10. Because of the
> > > > > particularity of the IC, before the panel enters sleep hid must
> > > > > stop scanning, as i2c_hid_core_suspend before ili9882t_disable.
> > > > > If move the ili9882t_enter_sleep_mode function to ili9882t_unprep=
are,
> > > > > touch reset will pull low before panel entersleep, which does not=
 meet
> > > > > the timing requirements..
> > > >
> > > > The above makes me believe that the reset GPIO should be moved out =
of
> > > > the input driver and into the panel driver. I could just imagine th=
at
> > > > the kernel might have some reason it wants to suspend the i2c hid
> > > > device. If that causes the panel to suddenly start failing then tha=
t
> > > > would be bad... I think we should fix this.
> > >
> > > Thanks, I will confirm with ilitek in further analysis and use "move
> > > the ili9882t_enter_sleep_mode
> > > function to ili9882t_unprepare".  Is the test failure really because
> > > the touch reset timing
> > > does not match? There is also a separate reset GPIO on the panel.
> > > Shouldn't touch reset not
> > > affect the panel?
> > >
> > > If we find a better solution I will continue upstream,=E3=80=82 So is=
 it
> > > possible to apply this plan now?
> >
> > I wouldn't be too upset at applying the current code as long as you're
> > going to continue to investigate. We can always continue to iterate on
> > it and having something working reasonably well is better than nothing
> > at all. However, I probably would wait at least 1 week before applying
> > any patch from you just simply out of courtesy to give others on the
> > mailing list time to express their comments. ...presumably we could
> > get to the bottom of the problem in that 1 week time anyway...
> >
> > I'm not trying to be an obstinate pain here--I'm merely trying to make
> > sure that whatever we land will continue to work across kernel uprevs,
> > even if driver probe order / timing changes in the kernel. If the
> > panel is really so tied to the touchscreen device's reset GPIO timing
> > then it worries me. What happens, for instance, if you disable the
> > touchscreen CONFIG in the kernel? Does the panel still work, or is
> > that extra reset GPIO totally critical to the functioning of the
> > panel. If it's totally critical then it probably makes sense to move
> > to the panel driver given that the touchscreen is a panel follower
> > anyway...
>
> Thanks. It looks like the panel works fine after I disable the touch scre=
en
> device. So the panel may not depend on touch screen reset.
> Need to continue investigating the root cause for current status.

Ah, OK. So I guess the issue is that the ideal case involves more
interleaving of things? Right now, I think this is what happens is at
power off:

1. We call the "disable" of the panel code which enters sleep mode.

2. As panel follower, the touchscreen gets called to power off
_before_ the panel's unprepare stage. This is when we assert the
touchscreen reset GPIO.

3. We call the "unprepare" of the panel code which deasserts the
"enable" pin of the panel and then disables regulators.


The proper sequence is:

1. Stop i2c hid scanning

2. Panel enter sleep

3. Assert touchscreen reset

4. Deassert the "enable" pin of the panel and disable regulators.


Ick. I guess the only way we'd be able to really make this work would
be to extend panel follower to notify followers before _both_ the
disable and the unprepare. I guess I can put that on my todo list and
we can see what folks think. Looking closely at it, I agree that I
don't think we want to move the "touchscreen reset" functionality into
the panel even if it would probably work. That feels ugly.

-Doug
