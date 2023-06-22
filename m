Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41802739958
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 10:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B6210E1B7;
	Thu, 22 Jun 2023 08:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C283810E1C0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 08:22:55 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-bfee679b7efso1533597276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 01:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687422174; x=1690014174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LkAmp/eBQd0cTktY86obokW51TRlbdxhv/mUSDQv+nU=;
 b=ryTD1haolYTGV5QhKbwvtO1zw8ha75NRjxLsZio0r8q11fXJAp1d1UhuGi2mBdtzoS
 Yd8SdHE7/3KfHvnaMlTK2Nz5jp/oI5ytf96D2RrI0CvQAMmTVufEaiix0nCH1Hy517jj
 1wadPnb2zAVAiqSyEeMfPJSjfROYLnwTCflkT3TIU/a13cBP0m0nhByfFDf5r+waO8rX
 nIhExbPbf6vWiCRZIBWWsQnwoOLnSjLZ/EK8aM88r1L1O3QHg2bsosfvD+x98vx8TSMb
 /ap4uqa2wSP7grW2zTnOgcwoS2qRShdC+FlDAkjXmtQ1a1EaHiz8i4AAeTUaj39uEkma
 FWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687422174; x=1690014174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LkAmp/eBQd0cTktY86obokW51TRlbdxhv/mUSDQv+nU=;
 b=SXV9+0yhlSnlhZt8Cz26xre7lAc8Zsw2//o7kD970van59m/ElZshgTk7Xcmh8yAoJ
 YRNqwkUEQlvtU0dDaWMMONrLI/J+o+snDfMwtqWECNLn1aBvj1jFFvAshexPtB1QBS6T
 r5RUlEQh1jAusEUAZK8z3WoMWERckDeHbYFhEnEiGoKaWoBL/VWHM/b59e7uM/uE3OJ7
 RFXz10E4ss1fnyErPqR/pcMej2qVk3Kstgukc4D3W24oifoKXzAw0bnE1WEdc+pwiS88
 aOLxnYJ4cq8xHg+B/RBwrvJHX1xCrELcmogCtJMSUGhdwMtJqOy1OyIjPmW+mj2jkxjv
 QTGg==
X-Gm-Message-State: AC+VfDzzXg4bG467+oh5nDU0rZlTlSJqcHepHkG7qRwCKYZj8x2+Ohi2
 YYhLi3GVwFHF3syMKvWMepH7mnBCvn6TU/85yPwXhg==
X-Google-Smtp-Source: ACHHUZ7Vioh9y+yKvbETL5ubLi54HUryu5nk222T86+SVNsggRygRKWvIYgL7sfC92drn2aQWX+t3txSMmBU+WaJnRs=
X-Received: by 2002:a25:9112:0:b0:bc8:cd2c:2fb with SMTP id
 v18-20020a259112000000b00bc8cd2c02fbmr13116488ybl.9.1687422174141; Thu, 22
 Jun 2023 01:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230607151127.1542024-1-pavacic.p@gmail.com>
 <20230607151127.1542024-4-pavacic.p@gmail.com>
 <CACRpkdbrEA54qmfTKSsFRG9ZS4u8hM6P5TXtOjRAiW+TD_v-fQ@mail.gmail.com>
 <CAO9szn00vRFm+iM1m7KgkW0WRuKyJEgVU4tVx4f5tF6KPnE=2w@mail.gmail.com>
 <CACRpkdaw8M3dSkmiV5QDOt3BBB7Jo6NxT0Og=zvA4REMA_7y9g@mail.gmail.com>
 <CAO9szn29A0qCABG0ACni42UGpsGKLwG7OT1y_ho3DgQ0WLvfmw@mail.gmail.com>
 <CACRpkdYXtQwmZR1u-1fwmyC_8Yq4bMkjDBcUCfuGqSz_UhXWJQ@mail.gmail.com>
 <CAO9szn0OuKW+-JZMs3TPUHiwLCe6cUPcsUq+og64K2utMyZpqQ@mail.gmail.com>
In-Reply-To: <CAO9szn0OuKW+-JZMs3TPUHiwLCe6cUPcsUq+og64K2utMyZpqQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Jun 2023 10:22:42 +0200
Message-ID: <CACRpkdb5stXKb7FNk_FC-PKduCngRX3sZTbzcxN+kRskz78fuQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
To: Paulo Pavacic <pavacic.p@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Vasut <marex@denx.de>, Maya Matuszczyk <maccraft123mc@gmail.com>
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

On Wed, Jun 21, 2023 at 5:09=E2=80=AFPM Paulo Pavacic <pavacic.p@gmail.com>=
 wrote:

> A lot of modifications to st7701 are required. I believe it would
> result in a driver that doesn't look or work the same. e.g compare
> delays between initialization sequences of panel-fannal-c3004 and
> panel-st7701. I think it would be optimal to create st7701s driver and
> have special handling for st7701s panels. If there was a flag for
> whether panel is st7701 or st7701s it would end up looking like a
> mess.

What matters is if the original authors of the old st7701 driver are
around and reviewing and testing patches at all. What we need is
active maintainers. (Added Jagan, Marek & Maya).

I buy the reasoning that the st7701s is perhaps substantially different
from st7701.

If st7701s is very different then I suppose it needs a separate driver,
then all we need to to name the driver properly, i.e.
panel-sitronix-st7701s.c.

Yours,
Linus Walleij
