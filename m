Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB5B73886E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 17:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CBF10E4A1;
	Wed, 21 Jun 2023 15:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E9D10E4A6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 15:09:09 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-54fba092ef5so4769931a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687360148; x=1689952148;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3pxYvZE9qt2zn4FI6+g2LcNJOhg8u1hzKiWBjeT5xgA=;
 b=jLLq+mRHkzHrwYqjN9UVIXbIqiZoTocAuDQkY5eFDqz84bqMoDaYJvcq4QX/1BNStp
 P5TiEJ5fSyOL//D3/jDBRJz8bxW6qM+OFP2V17Gnf/5hHnpqyRF8SzWp8A6+j3xP+Vj8
 /DaiyEPnNinUC3iPGxWHuHYdN7KMTZ7oA8spFcbTv4COud00lhujxlZeAkmvbrFfxm9p
 j6bUI2z4lB2sUyf+0HVFKMJPTEfrbbO7hilZbFwqLMK9AY6urnmVc3zi1WETKzmb8b+g
 LK2jkxrTL0ulvH3501pSHzpjlW3jDZ8vucO0tRfaLUgULfHmNhrAYTsN9T+0ySD3JQgH
 vdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687360148; x=1689952148;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3pxYvZE9qt2zn4FI6+g2LcNJOhg8u1hzKiWBjeT5xgA=;
 b=UdzL1CEWay2WLusm1qFEWJvyUXVbp1uFQgjPZ3rSz7jvV984R7f9jyL6UXLBsNu5S2
 2X4q8PrVv/fGPVqlxGL/jtfW2HvvZg7oMiOcw06dptsAorC07Z/mMyOFlNr11psa+PWU
 pDhp3lN2s1iqUfR+6nFg1EDlyETajW2viaownA2bgvTd06ywTeE0PCZYRceTtecySjN6
 zEU1Rpu3z6HODsm1dWOBivB275wnOqxrcSgoRTl0Cww1mDLqjY0HWzb/ElQJD0K2Brlw
 IxvLwbKCzc9CXbsQiJDvby54D0DGwITw2uAQGg/Fbd6KppzA4XsXc7qr5AXldg4b6JOT
 UhJA==
X-Gm-Message-State: AC+VfDzO7BWaCqUvEHREgR0MQawd0Q3lTcRDn61dKEvnHsYaVGOMeR0d
 vjfU8m3L6iXCrmYFLR02ucD4mi/C3vZcccar72s=
X-Google-Smtp-Source: ACHHUZ7XNoLgOR1r+SBoMmCQ1NX0ViJyRA0eK0+V/MmAoDfiap9j9iqYMS4chfKIcBjthw9/4VmKXdnQC8A6tqyG2oc=
X-Received: by 2002:a17:90b:3e8e:b0:25e:ae28:ea64 with SMTP id
 rj14-20020a17090b3e8e00b0025eae28ea64mr16465969pjb.23.1687360148362; Wed, 21
 Jun 2023 08:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230607151127.1542024-1-pavacic.p@gmail.com>
 <20230607151127.1542024-4-pavacic.p@gmail.com>
 <CACRpkdbrEA54qmfTKSsFRG9ZS4u8hM6P5TXtOjRAiW+TD_v-fQ@mail.gmail.com>
 <CAO9szn00vRFm+iM1m7KgkW0WRuKyJEgVU4tVx4f5tF6KPnE=2w@mail.gmail.com>
 <CACRpkdaw8M3dSkmiV5QDOt3BBB7Jo6NxT0Og=zvA4REMA_7y9g@mail.gmail.com>
 <CAO9szn29A0qCABG0ACni42UGpsGKLwG7OT1y_ho3DgQ0WLvfmw@mail.gmail.com>
 <CACRpkdYXtQwmZR1u-1fwmyC_8Yq4bMkjDBcUCfuGqSz_UhXWJQ@mail.gmail.com>
In-Reply-To: <CACRpkdYXtQwmZR1u-1fwmyC_8Yq4bMkjDBcUCfuGqSz_UhXWJQ@mail.gmail.com>
From: Paulo Pavacic <pavacic.p@gmail.com>
Date: Wed, 21 Jun 2023 17:08:57 +0200
Message-ID: <CAO9szn0OuKW+-JZMs3TPUHiwLCe6cUPcsUq+og64K2utMyZpqQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pet, 16. lip 2023. u 14:53 Linus Walleij <linus.walleij@linaro.org> napisao=
 je:
>
> On Fri, Jun 16, 2023 at 2:31=E2=80=AFPM Paulo Pavacic <pavacic.p@gmail.co=
m> wrote:
> > pet, 16. lip 2023. u 13:44 Linus Walleij <linus.walleij@linaro.org> nap=
isao je:
> > >
> > > On Fri, Jun 16, 2023 at 11:57=E2=80=AFAM Paulo Pavacic <pavacic.p@gma=
il.com> wrote:
> > > > =C4=8Det, 15. lip 2023. u 21:55 Linus Walleij <linus.walleij@linaro=
.org> napisao je:
> > > > >
> > > > > I doubt that the display controller is actually by Fannal, but I =
guess
> > > > > you tried to find out? We usually try to identify the underlying =
display
> > > > > controller so the driver can be named after it and reused for mor=
e
> > > > > display panels.
> > > >
> > > > Yes, of course, the controller is ST7701S.
> > >
> > > Hm did you try to just refactor
> > > drivers/gpu/drm/panel/panel-sitronix-st7701.c
> > > to support your new panel?
> >
> > Yes I have tried, but there are too many changes needed and I wasn't
> > sure whether I would be breaking compatibility with st7701 based
> > panels.
>
> For the community it creates a problem that now two drivers for similar
> hardware need to be maintained, and that burden will land on the DRM
> maintainers. For this reason it would be better if a joint driver could
> be created.

I will try modifying st7701, but that seems like a big task since
currently st7701 crashes kernel (5.15) for me and I have seen
suggestions to use raydium driver over st7701.
Also I guess I should first read some more documentation and compare
st7701 to st7701s. I currently can't reserve a lot of time for that.

>
> I am sure the users of the old driver will be willing to test patches to
> make sure their devices keep working.

A lot of modifications to st7701 are required. I believe it would
result in a driver that doesn't look or work the same. e.g compare
delays between initialization sequences of panel-fannal-c3004 and
panel-st7701. I think it would be optimal to create st7701s driver and
have special handling for st7701s panels. If there was a flag for
whether panel is st7701 or st7701s it would end up looking like a
mess.

>
> Yours,
> Linus Walleij

Thank you for your time,
Paulo
