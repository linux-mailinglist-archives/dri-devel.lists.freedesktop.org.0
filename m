Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D715B1150
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 02:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F109C10E3A0;
	Thu,  8 Sep 2022 00:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1FD10E3A0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 00:32:28 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id u9so34280867ejy.5
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 17:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=yswe5UvynuPJmR7TROq3C4jcUZ2Pkk4MSSkw0eJxwM8=;
 b=RkxT4GcJVYPfiUjCX955mRFINqGAq8VNN+LptWtiNk61ojlzsZX1EH4in57b27Q/LO
 nStb2XViM4M5FE2zTh5UeL8Yq0cwNHwWw0lzxPY5Z4mMTesQbMvgFFVdKGfsapCzipDp
 JcBLTzaFfxQqmZaQswxYLJTgMv1n97y/FFzZHfOs7ewCMYKx9/3y+kLgk+FDt1VsAaaj
 +qyvrpsuSOTexTHnKv6NbvoHXOBnyneEBlNvNbKBvQw+7EFluonjlGWcc7bOVXqgsziq
 KwPlbO4cNU9YW53onLVS7YwSrJTm0Ih/M5fqWDnTXziOeqJkC1QddiOm1NY2oQgFAFCN
 nHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=yswe5UvynuPJmR7TROq3C4jcUZ2Pkk4MSSkw0eJxwM8=;
 b=B7PyezPOsSDUcI0YrIx5OmL78rIxtYkFh/mbVgEGKr22D7ntfnoRMAuQOzVpNevVmf
 Uy1oNgdPTx30b06iWMxtrEqPTNx+gwtWVFEpRKN27VlbzSgJTwhJ1l3oX+PNHwDRAiaw
 4RtTY4ANuhrgfLHvlRKQ1jIQgCReaB7EUHoB2AD6Hj82w+ASlpJv2sKh/QsSMMb6F09M
 IfqYBGKx32Fhp8X3xPaeOGydehzPKXK/qra3s0z2xtbU9LVLxIYX7rCuaEjcOC8B8qsH
 BDQYIDWqPkigoe0NaB4BiYQE4hZZEAdBiRxrfLmovUGKdn1YoHx0qiT7nh+0Cu4ysfl6
 b9kA==
X-Gm-Message-State: ACgBeo3/XQi/r3XGNSsSsrYMRSJzMMNn1RU3LkRtcj5wNp09KcNtVNiZ
 DprwfblxZ8YNEYg3U2xsMxFUNWECDGwvfDoRkvblLA==
X-Google-Smtp-Source: AA6agR4uDJOCaTz0FVi+KJnVIm61TPqwATLn4YOd9952FLaly2lRXMCdPQHjmdT6KeTEoCF0irQD994IPBPL2xcbUxQ=
X-Received: by 2002:a17:906:d54e:b0:73d:dcb2:39ac with SMTP id
 cr14-20020a170906d54e00b0073ddcb239acmr4090828ejc.520.1662597147359; Wed, 07
 Sep 2022 17:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220815093905.134164-1-hsinyi@chromium.org>
 <CAD=FV=XYNKF8q1mttru_J188pYMjSphQsEfQAO1Bt7GvjJRKXw@mail.gmail.com>
 <CAJMQK-gjg9evLY3oP5rgaGoRdQQTLqnK2-FChaabJTCxLTTmYA@mail.gmail.com>
 <CAMuczyUH1tefU_4+dx495_5kdrxRdA3pmXS-eyjzMCcYFfjNXQ@mail.gmail.com>
 <CAJMQK-jEgRq68JXSWtS4y5_39vJ1pWCT2-Atg31__veRtnuREA@mail.gmail.com>
 <CAD=FV=UXFiA4hW8_cmO0Di-NCpqvkjTqqOfbc6DfD5Rs8aT6hA@mail.gmail.com>
 <CAD=FV=Vg5o-OxyQnemB+XfkGundDA-R31QhkmHJv4RmTMcF2gA@mail.gmail.com>
 <CAD=FV=Vqs+wPsOUgVK9VyzqDHewBR6HyQgcddQpe9Sd6OG6Nuw@mail.gmail.com>
In-Reply-To: <CAD=FV=Vqs+wPsOUgVK9VyzqDHewBR6HyQgcddQpe9Sd6OG6Nuw@mail.gmail.com>
From: Rock Chiu <rock.chiu@paradetech.corp-partner.google.com>
Date: Thu, 8 Sep 2022 08:32:16 +0800
Message-ID: <CAMuczyVbLE0mg9K4NNn=epWE9vVJjFbua=7gDtV+xLGqJ1+Jrw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Add double reset T4 and T5 to
 power-on sequence
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Jason Yen <jason.yen@paradetech.corp-partner.google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Jason.

-Rock

Doug Anderson <dianders@chromium.org> =E6=96=BC 2022=E5=B9=B48=E6=9C=8830=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E6=B8=85=E6=99=A85:49=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Hi,
>
> On Mon, Aug 22, 2022 at 9:33 AM Doug Anderson <dianders@chromium.org> wro=
te:
> >
> > Hi,
> >
> > On Thu, Aug 18, 2022 at 8:03 AM Doug Anderson <dianders@chromium.org> w=
rote:
> > >
> > > Hi,
> > >
> > > On Wed, Aug 17, 2022 at 8:22 PM Hsin-Yi Wang <hsinyi@chromium.org> wr=
ote:
> > > >
> > > > On Thu, Aug 18, 2022 at 11:19 AM Rock Chiu
> > > > <rock.chiu@paradetech.corp-partner.google.com> wrote:
> > > > >
> > > > > How does T4/T5  impact the real case? We talked previously the T4=
/T5
> > > > > shouldn't cause user impact.
> > > > > Do we have testing data from ODM?
> > > > >
> > > > Please leave comments below the previous comment's headline.
> > > >
> > > > I'm confused. The reason I upstreamed this patch is because this is=
 in
> > > > your application note and you asked us to help upstream it. Now do =
you
> > > > mean that we don't need T4 and T5?
> > >
> > > I think Rock is asking what problems the extra delay is causing. In
> > > other words: why do we care about keeping these delays short?
> > >
> > > The answer is that it affects boot speed and also resume speed of
> > > devices. Adding these two delays here means that there's an extra 100
> > > ms before the user can see something on the screen. That may not seem
> > > like a lot, but those kinds of delays add up quickly. At least on
> > > Chromebooks, booting quickly is always a big goal.
> >
> > While I'm not very happy with this change and I don't really
> > understand why these delays need to be so long, if folks are really
> > certain that we need them and can't make them shorter then I guess we
> > can land it. I'll wait a few more days in case anyone wants to chime
> > in with their thoughts.
>
> I'll continue to grumble, but I did push it.
>
> 55453c0914d9 drm/bridge: ps8640: Add double reset T4 and T5 to power-on s=
equence
>
> I pushed to "drm-misc-next" and not "drm-misc-fixes". It doesn't feel
> massively urgent since apparently we've been without the
> "double-reset" for years and having the extra bake time feels like the
> better way to lean.
>
> -Doug
