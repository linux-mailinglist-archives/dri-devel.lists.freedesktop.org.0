Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B144474BCCA
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 10:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D46D10E0AA;
	Sat,  8 Jul 2023 08:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3065B10E0AA
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 08:23:10 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-c4d1b491095so3001372276.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jul 2023 01:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20221208.gappssmtp.com; s=20221208; t=1688804589; x=1691396589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uRa64IiPsuM6VDFvcCCrH9MgHZysL/mfECR9wPwska8=;
 b=Inco7shYWGwCbmGRzf9fmjkb4dyXh3+Pj0EhFpbSy0hbTaN9H/D91fZ+cHgA1l+N2M
 nQbvEuGhuCnW/bf+Myx12mHc4zq+K9mPUfkkpNiFV03SfZeNXT0+GkPSfkgBmK2RrXxh
 14Bh+cVOuZeFMpRNNTontYrl+K3H6fCHf0CaCX4eJi7z/d1peN0xtlrCK02WhcAk4820
 w5Mr3LPYVhCLOedGw9/FDIUSsiOnvzUenR406zN1c2wp9PvT/uNkrN73TiObF15xdrKh
 ZX/yxFnoeFBRdvxx6/emxyM7KvV+BFECcftHbsWGy3RthlZt6qe0BtmgRfzd3+yfnwuS
 GQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688804589; x=1691396589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uRa64IiPsuM6VDFvcCCrH9MgHZysL/mfECR9wPwska8=;
 b=RB5wZHxKn9kwGi2zOEZNRKGeDjmkwk3R8iHYJ4CsjcTOiFXbZxKyNACOqWcVmwFzoI
 I2O+y6iiYCVPM+7Xv4yqAvJLwSK3zsOc6Igru/cqU66WzmzLom5uuD25ChV7IiEJDRAv
 eC8kHMQANhiEllYPnYK9MPlMs34u+LOSjJ7DDEoTZcdw4tqe4kDuiwHpYRtifMJgSqTl
 uYBVigc8har+EZcBh4R24Xzyck7Usg7fPzGOvqpdNGA2wu8k4iJQhHPMhnFIEmoizUoV
 FRA19iQu+88HSwYGFBD46p5M+pTEQ/Vm0+06NGyAxfWLoCBl6PHDN4TICHIZ2+eKXoCA
 we2A==
X-Gm-Message-State: ABy/qLZLnm/hAduS4JF93pjUTPLLQ9QasdEX+XtJN2Oeff7it6YeT0kJ
 XrE3dP6a0K5YIOhGiSLNidS/nukfMenVZV8KEUfYvQ==
X-Google-Smtp-Source: APBJJlHV4fQNxortWcxW7ePLIgEI078Rdoj5n5kWWZvlBctClxZotj2w9tR+0lOLRwp+gme8FrDJ6Tc8RYIVhRTp8k0=
X-Received: by 2002:a0d:dc83:0:b0:56c:f090:36eb with SMTP id
 f125-20020a0ddc83000000b0056cf09036ebmr7620028ywe.36.1688804588831; Sat, 08
 Jul 2023 01:23:08 -0700 (PDT)
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
From: Jagan Teki <jagan@edgeble.ai>
Date: Sat, 8 Jul 2023 13:52:57 +0530
Message-ID: <CA+VMnFyaCWFPWszxen92qKBMX6N9g34+aMA4UCnai9KQzzuf9Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
To: Linus Walleij <linus.walleij@linaro.org>,
 Paulo Pavacic <pavacic.p@gmail.com>
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

On Thu, 22 Jun 2023 at 13:52, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
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

I agree with what Linus mentioned.

1. If the panel is designed on top of ST7701 then add driver data on
the existing panel-st7701 driver with this panel.

2. If the panel is designed on top of ST7701S - ST7701 and ST7701S are
completely different in terms of the command set and init sequence
then add panel-sitronix-st7701s.c

3. If the panel is designed on top ST7701S and if the commands set is
the same as ST7701 but the init sequence is different then it is
possible to use the existing st7701 driver with the init sequence as
in driver data.

Thanks,
Jagan.
