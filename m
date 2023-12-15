Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A15A814FF0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 20:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35ED10EA78;
	Fri, 15 Dec 2023 19:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E079010EA78
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 19:01:50 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5c67c1ad5beso1639569a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 11:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702666910; x=1703271710; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aH4j+eRoTUdpqPc/Lq1UK1wxe+ZW7mKIcZTucQXHv4w=;
 b=SJ0ioNdS/62crx6PjwkzNnYw0Rrd6+A4AI9lrrV5UkX40Q0vbhSvh6HODAGuYAC3uC
 ACU/tMBIMhf+nf0/ewGb/Zcy7NVrmHZmKySiBFuiq20tP6udbVHcMya3Yhn4HELJr1Py
 2aEskt6WYhDd9wPNd7MEr6R0Z4If+9DN4m1ZRm1MLUqygRS2t3clIpbaGaZhrbeoDqER
 JQ3EujFSvvWL24xQyXrSXnUKF3euNQLaayccb04pwkpSQmX6aS9m4An5ijLib3N1stku
 VnzaxwQi4c8iFuzBOY7esE/ApkpAKCFmBNRx+Dyxt4oSupqfw3TRrT0fZL/r8oSOQsKF
 cLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702666910; x=1703271710;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aH4j+eRoTUdpqPc/Lq1UK1wxe+ZW7mKIcZTucQXHv4w=;
 b=MKDZUDGUTLp5QzQktNhX0y6qsxbHd/XfN3IEb7BvaQ7cDsz3HrUIiSgcMEaJTqZ55L
 wmVIr1MEH3NvbeI7HKbhp4+qLOzFc6YXrFz0FOc1AoG4ooHQPiunq1g/R04jtK6JWFXA
 LRe6O6GNlnpeaOxfWc8hUeSBH7DwS82TwdoARRlGnyeXAxMCfVe3iX0+P8MfolR6NwwY
 XT/Qw01JWJWTGLlnz/9muCJvP7n3qWPoHtibHrcUFg52k6te/am9zufscC70AaG9vHhz
 oBwTcwfpWtQWMCwWgwm6UskwKG+3A0L+4aq919AoLI0J58Ywicr3TOXDs2M9iyFJyymP
 xzSg==
X-Gm-Message-State: AOJu0YzTZtxJBnWJaEMe52x8lfPD8NTBeRZx9rzj2TRDr6LGuRLhm5OW
 QQT3eTbn/gPQP4bW+FYDQN0cvld+SNpLndKZfv8=
X-Google-Smtp-Source: AGHT+IF0sVYDEk9PCAH/0R5eAGspSLWkz8Lr473dh7sTZA0lII4c3cNxQ4qTtY4MYl7UOmdWeCMiu4rK3nzmQTNIfCw=
X-Received: by 2002:a17:90b:3b8f:b0:285:b08a:7817 with SMTP id
 pc15-20020a17090b3b8f00b00285b08a7817mr14238547pjb.13.1702666910185; Fri, 15
 Dec 2023 11:01:50 -0800 (PST)
MIME-Version: 1.0
References: <20230920171009.3193296-1-l.stach@pengutronix.de>
 <20230920171009.3193296-2-l.stach@pengutronix.de>
 <20230920205736.GB7723@pendragon.ideasonboard.com>
 <CAHCN7xJz=rEH_8wHaBCVOUzP0kO6cM_c=zLf6ocjW8bt1FaCBw@mail.gmail.com>
 <CAOMZO5C7_Rj-Ja0BO0D0Po+gy+XbvyMdQf-wH5YNyhAdMof2vg@mail.gmail.com>
 <20231215142308.GL21146@pendragon.ideasonboard.com>
 <CAHCN7xJPg_Nk=o9fKwkZfVTNSB-YL0m7vY6p1O7+i=PHShp7hg@mail.gmail.com>
 <CAOMZO5AGAkPpds=5H-iQj53djcQtW5GsRQrzdC_JOOrcENhvvw@mail.gmail.com>
In-Reply-To: <CAOMZO5AGAkPpds=5H-iQj53djcQtW5GsRQrzdC_JOOrcENhvvw@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 15 Dec 2023 13:01:39 -0600
Message-ID: <CAHCN7xLHMGcS2-QTneqqpHYU66JwuEG4TyR0j0riFGqO6RC8ug@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
To: Fabio Estevam <festevam@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Sandor Yu <sandor.yu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 10:47=E2=80=AFAM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> Hi Adam,
>
> On Fri, Dec 15, 2023 at 1:40=E2=80=AFPM Adam Ford <aford173@gmail.com> wr=
ote:
>
> > I started looking into this today, but there appears to be some
> > dependencies missing because the PVI is just one small portion of
> > this. The PVI needs to interact with the hdmi_blk_ctrl and the hdmi
> > transmitter itself.
> >
> > It looks like there was at least one attempt to push the hdmi driver,
> > but we're also missing some hdmi power domain information, and the dri
> > patchwork lists a bunch of proposed patches for the lcdif driver.  I
> > haven't looked through them all, so I don't know if they are
> > necessary.  I found a git repo with Lucas' stuff, but it's based on
> > the 6.0 kernel, so it's fairly old.  Either way it seems like there is
> > more to the HDMI than just his one series.
>
> Here is the whole patchset that I tested against 6.6:
>
> https://patchwork.freedesktop.org/patch/485391/
> https://patchwork.freedesktop.org/patch/485392/
> https://patchwork.freedesktop.org/patch/485395/
> https://patchwork.freedesktop.org/patch/515299/
> https://patchwork.freedesktop.org/patch/515300/
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/2022040615340=
2.1265474-12-l.stach@pengutronix.de/

Thanks for the list.  I was able to successfully build the stable 6.6
branch with those patches applied and I have the HDMI working.
Unfortunately, I get build errors on the linux-next, so it's going to
take me a little time to sort through all of this.

I am thinking that it would be better to consolidate all these
together into one series instead of piecemealing it.  However, there
are some items that can be submitted right away without significantly
reworking them against linux-next.  Do people have a preference?

adam


adam
