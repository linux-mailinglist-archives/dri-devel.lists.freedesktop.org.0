Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1E774A0B9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 17:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FF510E42D;
	Thu,  6 Jul 2023 15:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299C410E42D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 15:18:29 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-262f7b67da8so508866a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 08:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688656708; x=1691248708;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zPB85WR0P+xgxqs8Q8QLiKAMJpfbqqxVyu2DnLqctsg=;
 b=UzHtICmgU/4K1rkod7vW7YianCzTXkLEfApsbzxnNRVFSML67a+WEeZgjdGNQtaOUS
 PhSFodmYF1UYuQK2PxXSUMuk9s+fWS4PFHbLpoEzBBIcL7XpnEVYo+zay7WSad3x+e1b
 UZfGln8snwQfvjSqE8fBjPW2qj3wIGsaw5/SbfZ9BZa1YTgOKgPDNXjxMhuoKKrvXlft
 KoDOMe9MvIqkyfC05Vsk4ywZiVPrNn6Vy2WxiDMmWi3uH3Xtzs8ukz+pK8jyiz6IFRov
 0jkDQYZHWWLANre+0+IXeknMuUc2youFbr0s0TNgB8proRli0iJ+kuqk6JbWBsP5CmbC
 9AIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688656708; x=1691248708;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zPB85WR0P+xgxqs8Q8QLiKAMJpfbqqxVyu2DnLqctsg=;
 b=epaxwNA63YHEoMbcwLRRY8+kW6Hk1eEguKZ4Szzo9nuvm3Xap2orvkIJeaP/qc1P35
 PxzHzhx5Km6fm/uLjMHeA9FkxG6LMqw6RSjpqFw/b+8zyPFqiEjLeMKEuFaNYummwVLz
 DKvHgY0RwqJvdyXqIN89eLGBQhqoNwvB5ISDfJHivMd2nIPJ/Xf/PVulwNcOtcAOU6VZ
 u1h+z25P+JQ0Q3Qf/8dOt2M5K8o1DejhhRm/VjwtAwN1o6d5P/WaTVzOMb1sOLR8kMVP
 FotEVo9w/u212pAVtvsD8piTNtjoOZ7aqIIJmyu7mIRpHKbjy6YqdRee/7PPszDldQJO
 CFIw==
X-Gm-Message-State: ABy/qLZgRxLj/wVZFd8RlVcG6/3QncaM2+piHhnc2cPLWbgPAYmlodlT
 HbdeD9HhwShWie+buaXk54rgQtBpdNYaib+fnsHhSd4eek/hmmPj
X-Google-Smtp-Source: APBJJlGbEK7+CMHGVikG5qSAkmi1koYQ7PRIaz5FQN5/ZPfU4hjy6xAtf8Iu7wMQZ/X0FMTcoopzGs9SvwJ6Mw+QQ+4=
X-Received: by 2002:a17:90b:1d10:b0:262:d4c8:cb3c with SMTP id
 on16-20020a17090b1d1000b00262d4c8cb3cmr1341343pjb.49.1688656708131; Thu, 06
 Jul 2023 08:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230607151127.1542024-1-pavacic.p@gmail.com>
 <20230607151127.1542024-4-pavacic.p@gmail.com>
 <CACRpkdbrEA54qmfTKSsFRG9ZS4u8hM6P5TXtOjRAiW+TD_v-fQ@mail.gmail.com>
 <CAO9szn00vRFm+iM1m7KgkW0WRuKyJEgVU4tVx4f5tF6KPnE=2w@mail.gmail.com>
 <CACRpkdaw8M3dSkmiV5QDOt3BBB7Jo6NxT0Og=zvA4REMA_7y9g@mail.gmail.com>
 <CAO9szn29A0qCABG0ACni42UGpsGKLwG7OT1y_ho3DgQ0WLvfmw@mail.gmail.com>
 <CACRpkdYXtQwmZR1u-1fwmyC_8Yq4bMkjDBcUCfuGqSz_UhXWJQ@mail.gmail.com>
 <CAO9szn0OuKW+-JZMs3TPUHiwLCe6cUPcsUq+og64K2utMyZpqQ@mail.gmail.com>
 <CACRpkdb5stXKb7FNk_FC-PKduCngRX3sZTbzcxN+kRskz78fuQ@mail.gmail.com>
In-Reply-To: <CACRpkdb5stXKb7FNk_FC-PKduCngRX3sZTbzcxN+kRskz78fuQ@mail.gmail.com>
From: Paulo Pavacic <pavacic.p@gmail.com>
Date: Thu, 6 Jul 2023 17:18:17 +0200
Message-ID: <CAO9szn3oTzrrwiyr91H14ep7OPUkA-SDST3CSQAQHvFFnkJWfA@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Linus,

=C4=8Det, 22. lip 2023. u 10:22 Linus Walleij <linus.walleij@linaro.org> na=
pisao je:
>
> On Wed, Jun 21, 2023 at 5:09=E2=80=AFPM Paulo Pavacic <pavacic.p@gmail.co=
m> wrote:
>
> > A lot of modifications to st7701 are required. I believe it would
> > result in a driver that doesn't look or work the same. e.g compare
> > delays between initialization sequences of panel-fannal-c3004 and
> > panel-st7701. I think it would be optimal to create st7701s driver and
> > have special handling for st7701s panels. If there was a flag for
> > whether panel is st7701 or st7701s it would end up looking like a
> > mess.
>
> What matters is if the original authors of the old st7701 driver are
> around and reviewing and testing patches at all. What we need is
> active maintainers. (Added Jagan, Marek & Maya).
>
> I buy the reasoning that the st7701s is perhaps substantially different
> from st7701.
>
> If st7701s is very different then I suppose it needs a separate driver,
> then all we need to to name the driver properly, i.e.
> panel-sitronix-st7701s.c.

I had in person talk with Paul Kocialkowski and I have concluded that
this is the best solution.
I believe I should rename it to st7701s due to the hardware changes. I
would like to create V5 patch with driver renamed to st7701s.
Please let me know if you agree / disagree.

>
> Yours,
> Linus Walleij

Thank you for your time,
Paulo Pava=C4=8Di=C4=87
