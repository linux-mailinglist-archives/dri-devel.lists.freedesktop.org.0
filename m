Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B91A77FF6D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 23:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF4910E078;
	Thu, 17 Aug 2023 21:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D920510E078
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 21:01:00 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2bba6a9b565so3217251fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 14:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20221208.gappssmtp.com; s=20221208; t=1692306059; x=1692910859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZeoBo3Vxb/EshwMcCgSTIf6m36vMo06kvicDB/Y5hQY=;
 b=wiKNV8szwHJVWXuZWC+0JMmrijpCjmso/okaZuZp3vP8PzNOiCFKS1DGuHCukrTuID
 ASpg2wKEzYP82O0HJ41Ddm27xtacbYSW92okQhi0j12iIEkkrL2FWrdvGe4YqtDzI5qA
 wYZZRb8ujS/GP6l5tsGZklRQct+GtgGFlfgEkwSzA+Ad8O3swB+mjz0I4trDt8kMEeC7
 gvg5hzR9DEe0+UHYwJWjsBh6n5UDnhT/FJfbS71IQHBgVvM6uO4rsXBFPqTK5ipm/emc
 4f0RVGyuFHAGVICY4VTINfEbthQnfaL8yxc1Pddzp+bBIN+NXJodSsAPWv+rIYd/5mTN
 OvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692306059; x=1692910859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZeoBo3Vxb/EshwMcCgSTIf6m36vMo06kvicDB/Y5hQY=;
 b=JJfLjSAWMeYm7/o0mFcqbhKxwj7tBx7Tz+yHbSEdzW8MkNeRUzOOY+7rCTVIB8IXus
 u0iwJjm/8cLD25TxCP4+JRYykHfG63clgxNBwVWiajGsxftRnQdtPBAT5y5UAX4vftio
 a0/dd5MDl2ak/LVsHUisg0blk8gl0qO94y6vyGX5/cPWY72FqFdOKQOU9MEXnL7ZrZdE
 1Rtd24ea8FqJYyU+NCWIGFn4BfIcYmkgnAc5QSRklvGNXRfzeg07HRPH5XPJpnFgR5tB
 Jr7yYXAf0ucrsZVQ/uSym7mbU68aFSVbUsa3AsjHmdT6BR44PpiCxwMa/bmlZbrBrC24
 UobQ==
X-Gm-Message-State: AOJu0YySp9X8PsxSkSS9FIo+pF8nRzjcvIGStQINAVynsiCcZjDsB3VD
 Jl8HCNNAtmAtc4xJox1+8PASgnEwDbIGs/uS9J/6ZbrT+wlwQQqF
X-Google-Smtp-Source: AGHT+IFRtxE5z3SLxeHMJAAAD7Xny2uI/enCW9Yws/prSoO4Y1+eutJcq1qW6/e4TYhN2sbf4fU4sQ6rI0Wp0o4NMhA=
X-Received: by 2002:a2e:9943:0:b0:2b9:f13b:613c with SMTP id
 r3-20020a2e9943000000b002b9f13b613cmr443995ljj.2.1692306058686; Thu, 17 Aug
 2023 14:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230724151640.555490-1-frieder@fris.de>
 <CAJ+vNU27A15eLWtFfHCOVn8JgawcgoGUAv2PhKmEf3wcoerPXg@mail.gmail.com>
 <CAOMZO5At6U9_JinNnumCqLMi2ER=3RZXDtsfdAEyjS35SvBaKQ@mail.gmail.com>
In-Reply-To: <CAOMZO5At6U9_JinNnumCqLMi2ER=3RZXDtsfdAEyjS35SvBaKQ@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 17 Aug 2023 14:00:45 -0700
Message-ID: <CAJ+vNU2_W-4+mk53aMkh-jed=QkSJuLisTs4x-b8qMXd5JTGDQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm: bridge: samsung-dsim: Fix init during host
 transfer
To: Fabio Estevam <festevam@gmail.com>, Frieder Schrempf <frieder@fris.de>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 1:59=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Tim,
>
> On Thu, Aug 17, 2023 at 5:53=E2=80=AFPM Tim Harvey <tharvey@gateworks.com=
> wrote:
>
> > Frieder,
> >
> > Sorry for the delay. Yes this resolves the regression I ran into. I
> > tested it on top of v6.5-rc6 on a gw72xx-0x with a DFROBOT DRF0678 7in
> > 800x480 (Raspberry Pi) display which has the Toshiba TC358762
> > compatible DSI to DBI bridge.
> >
> > Let's please get this into v6.5 as soon as possible.
>
> Care to provide your Tested-by tag?

Fabio,

Yes, sorry:
Tested-by: Tim Harvey <tharvey@gateworks.com> #
imx8mm-venice-gw72xx-0x with toshiba tc358762 MIPI DSI bridge

best regards,

Tim
