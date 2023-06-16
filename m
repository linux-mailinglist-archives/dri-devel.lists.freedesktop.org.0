Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A987331A1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 14:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7391A10E619;
	Fri, 16 Jun 2023 12:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E830610E619
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:53:04 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-57026f4bccaso7717757b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 05:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686919983; x=1689511983;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CC4+pWhIZunTVuA2ymJql5DGmR0KK8KjL/YmD5fofdc=;
 b=B/4ka6ITmEzsxEMx0GQ36klxPa8Yjb8CE6pScPqKHNm86oYRv6skCJmKi6R+LJtVSn
 pTCokeNSdBgjNoOCerTGRxbVGXxwT18On2/GXpTeAVpmxOuRNjzJ5cc+wTdcZh/xERUP
 rOh9FyvZ/sOJTtcpSsYF0kli9RzeIAVoEMuJwPIibPFOj784G2d8WoEX+UZhnAj5GYnY
 GQdxCG1JO/HhFrHWfT8Rfoogcd71cIAWPVQ0szkiQLLlFURVodk7CQ89dJUHQbmT2Cp5
 khYxpjIOm6gZK9PD9i73ZSCekZZaX7yRv+6i//c7F5ydsM4+cVVyToy29h7beuoTcVPK
 Iuwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686919983; x=1689511983;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CC4+pWhIZunTVuA2ymJql5DGmR0KK8KjL/YmD5fofdc=;
 b=VNvnvo5e3rR8xUYTPpVAwmT8ipzieZRGdhyITZ9YI3KLBCnuczclClpQTW8PK6tf2m
 0jluO91ecD1/U8VPA8e/NFpMYjPlPEtzUJekYrUuwSxaCdPZuM/7ykf0plecqlmKtuzt
 AOLABcGsFUr8fIpf96D30JkNBZ4nBjhasehgIDE3zgiOpOCPokukIu5i5Z214Ewh7Wde
 7D+Mwi5Fl2HFfPSxHZGlhMNuUVv8Hex8HK4sb6WG+g1n0cBcUK+0ZFbFLkaguCffM7X7
 +ojG+qxErl3goBCtqx/wHb7672WVXzYATBtlF+gVsUMVBvG6t96iEwMjz4Jd/KQqb4SZ
 la4Q==
X-Gm-Message-State: AC+VfDyJGSholE/rHqiLAUVNwbMXe3daAThMQoJv+Mq4QFHtCr9WKkDZ
 QqtwrOTb3r0iT84pOsbBu5VT580+EJ9f0IzcrRrA3w==
X-Google-Smtp-Source: ACHHUZ5tzgmAO6NTdW16MM2p4xBolNh5C55obixHUitKfGfBPwj9jOy2ZwWteenp3/N1cvoaMpUp1DjEkRQSwMOnIRg=
X-Received: by 2002:a25:40c3:0:b0:bcd:3379:11b2 with SMTP id
 n186-20020a2540c3000000b00bcd337911b2mr1615849yba.52.1686919983691; Fri, 16
 Jun 2023 05:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230607151127.1542024-1-pavacic.p@gmail.com>
 <20230607151127.1542024-4-pavacic.p@gmail.com>
 <CACRpkdbrEA54qmfTKSsFRG9ZS4u8hM6P5TXtOjRAiW+TD_v-fQ@mail.gmail.com>
 <CAO9szn00vRFm+iM1m7KgkW0WRuKyJEgVU4tVx4f5tF6KPnE=2w@mail.gmail.com>
 <CACRpkdaw8M3dSkmiV5QDOt3BBB7Jo6NxT0Og=zvA4REMA_7y9g@mail.gmail.com>
 <CAO9szn29A0qCABG0ACni42UGpsGKLwG7OT1y_ho3DgQ0WLvfmw@mail.gmail.com>
In-Reply-To: <CAO9szn29A0qCABG0ACni42UGpsGKLwG7OT1y_ho3DgQ0WLvfmw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 16 Jun 2023 14:52:52 +0200
Message-ID: <CACRpkdYXtQwmZR1u-1fwmyC_8Yq4bMkjDBcUCfuGqSz_UhXWJQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
To: Paulo Pavacic <pavacic.p@gmail.com>
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

On Fri, Jun 16, 2023 at 2:31=E2=80=AFPM Paulo Pavacic <pavacic.p@gmail.com>=
 wrote:
> pet, 16. lip 2023. u 13:44 Linus Walleij <linus.walleij@linaro.org> napis=
ao je:
> >
> > On Fri, Jun 16, 2023 at 11:57=E2=80=AFAM Paulo Pavacic <pavacic.p@gmail=
.com> wrote:
> > > =C4=8Det, 15. lip 2023. u 21:55 Linus Walleij <linus.walleij@linaro.o=
rg> napisao je:
> > > >
> > > > I doubt that the display controller is actually by Fannal, but I gu=
ess
> > > > you tried to find out? We usually try to identify the underlying di=
splay
> > > > controller so the driver can be named after it and reused for more
> > > > display panels.
> > >
> > > Yes, of course, the controller is ST7701S.
> >
> > Hm did you try to just refactor
> > drivers/gpu/drm/panel/panel-sitronix-st7701.c
> > to support your new panel?
>
> Yes I have tried, but there are too many changes needed and I wasn't
> sure whether I would be breaking compatibility with st7701 based
> panels.

For the community it creates a problem that now two drivers for similar
hardware need to be maintained, and that burden will land on the DRM
maintainers. For this reason it would be better if a joint driver could
be created.

I am sure the users of the old driver will be willing to test patches to
make sure their devices keep working.

Yours,
Linus Walleij
