Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D423483F620
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 16:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3020E112694;
	Sun, 28 Jan 2024 15:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A8B112694
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 15:30:24 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6dddf4fc85dso939987b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 07:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706455761; x=1707060561; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h2V/0dCIefEKKW7/a7gcAuJYCSa50UGFdK2xIPchK28=;
 b=CMPIWyoa9N6q34nvc0pRfJUJeyRD9Mqsx3+Gs4YZFjR8kL6ljLYOHRKbytjW9Zgi5Z
 rqNzlmK7BUM0J1yuSnti8fA4fs7zWIfhJhq5CKCDW+BN4IqD7bZDznOgmJZDZpj3j99D
 ncej9kp8J88Y0h6RBEgj3AwzhSXrpO3IV3TQOo00GQCSYDyPaLgfNkTDsneVjnL7jjUq
 0n8pL/hQ48WwLMBeucBza/oxdpPB6Ik7yYNvxUH9vySidYdfd0WY8+BiLTmJybJ1siqZ
 YpZuq08lItHG8kQCh0JIymm6UD0XAML9HyMTp/QveLTr79Lm3Aph0wQiPd+d1Y2G727f
 g/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706455761; x=1707060561;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h2V/0dCIefEKKW7/a7gcAuJYCSa50UGFdK2xIPchK28=;
 b=G65SsgRXyPQrQ2feVLYTiL4fPgBHaqN9EdHbcnZxoe6fRAZ0SuE2WACzeO2ugIYl+X
 50L3/MZniBKjX5idVBTMBxqB2Yreh9BqNs9tj+26068z9c6nHTbT4Quw6d0MaNth0+Ov
 vtiPOpegXj9g4DThDUoTbO2UT3uRi3HbR+e0YUFH3l/ao1seetl701G/f9pCImf9t0lf
 FaXwsr9V5nptklbMSMt4jZX/NLb74JG/9G+Kudkkl+zBgSNify7pNUzDtxz+QrTJ/9EK
 ZjH0w75YWwq9k7+hNu3uyeiVcS9dzBjTnk0QpWGOe6Pqi22kbOz26iowz46o1NhbNTtz
 WyHg==
X-Gm-Message-State: AOJu0Yyx/5yDzfMarWpPBYCYXWP1rK5+xAx+AipyKpj/ZTRPoq8dq/Pq
 zjavrhfwRp2o/eh1r39D6tpUuELR3jvOmfmArRUFgDxMgRsNo9qnRBd75Pu+4roG0EyUf5NjgSs
 GdOJGdifTZz6KRS9WG9cCFfFilvM=
X-Google-Smtp-Source: AGHT+IE/S8nl/+88TGU/a8mCQbnxjPYbc1DSAzdK3mNWN2QY6ccpsxxXVr5Tq64sC5KdK1t3lKPLmjS3QvxEE8CwNq8=
X-Received: by 2002:a05:6a00:6807:b0:6db:c6b1:aa5c with SMTP id
 hq7-20020a056a00680700b006dbc6b1aa5cmr1021670pfb.34.1706455761111; Sun, 28
 Jan 2024 07:29:21 -0800 (PST)
MIME-Version: 1.0
References: <20230920171009.3193296-1-l.stach@pengutronix.de>
 <20231218023655.GG5290@pendragon.ideasonboard.com>
 <20231218094849.4aa15a97@booty> <12346986.O9o76ZdvQC@steina-w>
In-Reply-To: <12346986.O9o76ZdvQC@steina-w>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 28 Jan 2024 09:29:09 -0600
Message-ID: <CAHCN7xLwyUtjizGBJ8B790o9eh4537z65KbKgAKpcD95CoAcFg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Sandor Yu <sandor.yu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 18, 2023 at 2:59=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi everybody,
>
> Am Montag, 18. Dezember 2023, 09:48:49 CET schrieb Luca Ceresoli:
> > Hi,
> >
> > On Mon, 18 Dec 2023 04:36:55 +0200
> >
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > > On Fri, Dec 15, 2023 at 05:09:41PM -0300, Fabio Estevam wrote:
> > > > On Fri, Dec 15, 2023 at 4:01=E2=80=AFPM Adam Ford <aford173@gmail.c=
om> wrote:
> > > > > Thanks for the list.  I was able to successfully build the stable=
 6.6
> > > > > branch with those patches applied and I have the HDMI working.
> > > > > Unfortunately, I get build errors on the linux-next, so it's goin=
g to
> > > > > take me a little time to sort through all of this.
> > > >
> > > > If you need help to figure this problem out, please let me know.
> > > >
> > > > I haven't tried it against linux-next.
> > > >
> > > > > I am thinking that it would be better to consolidate all these
> > > > > together into one series instead of piecemealing it.  However, th=
ere
> > > > > are some items that can be submitted right away without significa=
ntly
> > > > > reworking them against linux-next.  Do people have a preference?
> > > >
> > > > I think it makes sense to re-submit the "easy ones" right away.
> > >
> > > Agreed. The more we can merge quickly, the easier it will become to
> > > rebase and upstream the rest.
> >
> > I agree as well, "release early, release often". These patches are
> > around since a long time and lots of people are using them already, and
> > tracking all of them from different threads is time-consuming. I will
> > happily test them early as soon as they are sent.
>
> I lost track of the series well, but I do remember I had to adjust the
> original series to get it running on linux-next.
> Please keep me on CC so I can add my local changes if necessary.

Fabio / Alexander,

I have a pending question to Peng regarding a change I pulled from NXP
[1] which moves the FDCC clock to the power domain and removes it from
the HDMI-TX driver.  I am hoping to get that answered soon.  If not, I
might just push the series again after a few more days.  In the
meantime, I have a git repo [2] if anyone wants to review stuff.
Marek Vasut sent me an offline patch to address some suspend/resume
issues, and I incorporated them into the series.  My suspend-resume
has been broken for a while, so I cannot test that.


> I have a proof of concept for HDMI audio, which is based on the base HDMI
> support. I can continue on that after merge, but I'm lacking an idea how =
to
> add some kind of "bridge" into the audio pipeline.

Maybe the git repo above will help.  It looks like the xcvr and
audio-tx drivers are there, but they appear to be dependent on custom
NXP sound card drivers which would be nice to replace with standard
audio drivers, so let me know if I can assist in any way.

>
> Best regards
> Alexander
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>

[1] - https://patchwork.kernel.org/project/linux-pm/patch/20240106223951.38=
7067-2-aford173@gmail.com/
[2] - https://github.com/aford173/linux/tree/for-6.9-imx8mp-hdmi

>
