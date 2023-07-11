Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254ED74E953
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 10:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7770B10E088;
	Tue, 11 Jul 2023 08:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A6610E088
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 08:45:41 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-55b0e7efb1cso2760466a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 01:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1689065141; x=1691657141;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6rAyfFYEC54lt2EK8plIE5lUAw75Zdb2J3/mCKsVdFc=;
 b=osMyAeVS9EE7oQ72ept+nuFwXTGDZis3UCeZJLu4UFhMCl5FqF0UqU8ZGadQdmgYd1
 WBYIfLYja43fjc+Sou3CD8s0QT0hu2AVFWVCc64mXvK4AkQAFf/i41Z+SVsD5vgzGo8W
 JcywYnI+Uw26sosc1BCOQaQ5ZIK4L0LJDRyQ0aDtVpAd38m4x0MPxUB80sPshH9bD1AI
 nNsR0M1I5hFQdbxga5MBJU14uaDwnpzQZY4sZUDsi8C2e3ubUuBXnrdwOXvxNqW09C2h
 GPTEsjcspu1XSf+PutOWGbjULtlBTs6GVod+d3N0SmM/kTwfm+3OFHNnf8U9u/dHy0/Q
 hrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689065141; x=1691657141;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6rAyfFYEC54lt2EK8plIE5lUAw75Zdb2J3/mCKsVdFc=;
 b=Vq02q2MKO6zeY6zRBokbHrhquhTw8qKqgaZSuwin4HhbkBdipZ4uhM96l//hNmLLWo
 ZVQhMjRTP+ZIBWiwvf97ZCBuj47ljVRrpzGh+bAi2p9KAiOPBeaErecx7NTHDmnTt0p8
 M8K3mRw/ghwF5h3qNN5uz5bJ1hpbOpzP7tyL05udD2lXx3GsN2e0qS/dSq/14ktGtJrh
 AUAMeCegHsOIKTjYAPWP9oVLz8CHVN4B835ssmTyiwLVELH+AIAxqC9WRMmNFJKu99nG
 SGk5wSZ4fwwIYBzyNDmeDCtuZlXtwjDpK0X7Jc5ip3I3v8jrjhzK4s4tvtAN8JYeKeeP
 lacA==
X-Gm-Message-State: ABy/qLZzrSk1b9tx9u9/MZ4j1OkkrdlsXjaPxwOxm9jtDgG9SVHn44n9
 qcreHC/ESZloEj+3jb9bfFGqWSt0MK++IJGa9z1gfA==
X-Google-Smtp-Source: APBJJlEEpeiJ/C75pcZKME2sORsUVGMbgtRVsaSJNvTBpYj9gubvUdJuoy+wl7zoQ6u18+207M8ubOvzyKvqaQDqYR8=
X-Received: by 2002:a17:90a:fb93:b0:262:f06a:13e0 with SMTP id
 cp19-20020a17090afb9300b00262f06a13e0mr11892966pjb.5.1689065140955; Tue, 11
 Jul 2023 01:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230704050744.1196293-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=WNLcw2JbMf7tfob2KgjB8eXTC0p1J4OYnQL4k3Mz3mgA@mail.gmail.com>
 <CAHwB_NJbtvXNCFj5=NMBXWCt1S1_WrgGij2Kqdr1omno66kVUw@mail.gmail.com>
 <CAD=FV=W5adfzPkP6dJGwfGO+mcbTdg8v9A0Sd4-FozF+W7nSrA@mail.gmail.com>
In-Reply-To: <CAD=FV=W5adfzPkP6dJGwfGO+mcbTdg8v9A0Sd4-FozF+W7nSrA@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Tue, 11 Jul 2023 16:45:29 +0800
Message-ID: <CAHwB_NLQcL7sDPAp10njng+r=UjmesHyWK6DHxJLYOatemYWLQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Add avdd/avee delay for Starry-himax83102-j02
 and Starry-ili9882t panel
To: Doug Anderson <dianders@google.com>
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, sam@ravnborg.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jul 7, 2023 at 11:15=E2=80=AFPM Doug Anderson <dianders@google.com>=
 wrote:
>
> Hi,
>
> On Thu, Jul 6, 2023 at 6:20=E2=80=AFPM cong yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > Hi,
> >
> > On Fri, Jul 7, 2023 at 3:32=E2=80=AFAM Doug Anderson <dianders@google.c=
om> wrote:
> > >
> > > Hi,
> > >
> > > On Mon, Jul 3, 2023 at 10:07=E2=80=AFPM Cong Yang
> > > <yangcong5@huaqin.corp-partner.google.com> wrote:
> > > >
> > > > From power on/off sequence for panel data sheet[1], T2 timing VSP t=
o VSN
> > > > needs 1ms delay when power on, and VSN to VSP also needs 1ms delay =
when
> > > > power off. Some pmic may not be able to adjust the delay internally=
, so
> > > > let's add a delay between avdd/avee regulator gpio to meet the timi=
ng of
> > > > panel.
> > >
> > > Unless I'm mistaken, all of this is best handled via regulator
> > > constraints in the device tree. See the file:
> > >
> > > Documentation/devicetree/bindings/regulator/regulator.yaml
> > >
> > > Specifically, any delays related to actually ramping up / down the
> > > regulator can be specified in the device tree. Nominally, you could
> > > argue that the 1 ms delay actually _does_ belong in the driver, but
> > > IMO the 1 ms number there is really just there because someone though=
t
> > > it was weird to specify a delay of 0 ms. Given that you already need
> > > remp delays in the device tree, it feels OK to me to just include the
> > > 1 ms there.
> >
> > The regulator device tree has only the power on attribute
> > "regulator-enable-ramp-delay",
> > not has power off attribute. The regulator delay looks more like the
> > HW voltage requirement
> > of the power ic itself, and I just want to meet the panel spec
> > requirement. I add regulator-enable-ramp-delay
> > in dts he can also meet my requirement, but I have no way to control
> > the power off delays.
>
> Hmmm, I guess the fact that the delay needed can be different for
> different boards / PMICs still makes me think that the delay doesn't
> belong in the panel driver. Different boards using the same panel
> would need different delays, right?
>
> So, thinking more...
>
> You're saying that you _can_ specify the enable delay in the device
> tree, but not the disable one, right? However, the timing diagram you
> provided doesn't seem to show the "disable" part. Since that's the
> part we're talking about now, could you provide a more complete timing
> diagram? Can you also talk to the panel vendor and confirm that the "1
> ms" actually matters or if they just put that there to ensure
> ordering? In other words, is it simply important that VDD1 gets to
> ~90% before you turn on VSP, or do they truly need a full 1 ms delay?
>
> Can you provide any more details about the power IC you're using? Is
> it just a discrete PMIC with a GPIO enable, or is it something
> fancier? Correct me if I'm confused (entirely possible!), but I think
> some PMICs have a feature where they can turn on "active discharge" so
> that they ramp down more quickly when they're disabled. Any chance
> your PMIC has this?
>
> In general the fact that nobody has added
> "regulator-disable-ramp-delay" to the regulator framework already
> means that the problem you're facing isn't really a common problem.
> There are lots of devices out there that have more than one regulator
> but I don't see examples where drivers need to delay between turning
> all their regulators off. Are you positive that this is something that
> you really need to worry about?
>
> The above is a bit rambling (sorry!), but I guess the summary is:
>
> 1. Please confirm that the panel driver truly needs 1 ms between
> regulators enabled.
>
> 2. Please provide the power sequence diagram for disable. If there's a
> 1 ms delay between regulators being disabled then please confirm.
>
> 3. If the 1 ms delay isn't truly needed then we can just drop this patch,=
 right?

https://github.com/ILITEK-LoganLin/Document/tree/main/ILITEK_Power_Sequence

Ask the vendor to evaluate this 1ms delay again, they think that
current ramp time
does not need 1ms delay, so drop this patch.

>
> 4. IMO if the panel itself truly requires 1 ms between regulators
> being enabled and/or disabled, it would be OK to put the 1 ms delay in
> the driver but it feels wrong to be accounting for ramp time in the
> driver. This should be specified in the device tree.
>
> 5. If we really need to account for the ramp down time, it would at
> least be good to submit a regulator framework patch proposing a way to
> specify this. We'd have to figure out how to make this work since I'd
> imagine that most regulator consumers don't care that much about ramp
> down time. Mark would be the real person to get advice from, but
> perhaps an API call like "regulator_wait_discharged(percent)" that a
> client could call?
>
>
> -Doug
