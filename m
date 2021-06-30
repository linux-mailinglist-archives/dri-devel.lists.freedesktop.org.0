Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E143B8218
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 14:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193496E02C;
	Wed, 30 Jun 2021 12:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8546E02C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 12:24:30 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id v20so3860985eji.10
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 05:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Eh0RuQARDzYtX6oU1mn3qAV9Ucz3Lp8rJN5AdD4bnhs=;
 b=WBXCycTdBoh6XyOaRz5Q0FgDS+p+Jgx5jtTyEatbqxXji88bYAukahgX9m7BnqakDW
 ScgcdoRm4a22be1BUHuSaUkIe/dro9uVDW84Gzz8byb3jhcDM21cjjVIswHwmAzAT2ay
 3r1KF56s0IiNEdecxUP32P2jUjjQ9x42GuI1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Eh0RuQARDzYtX6oU1mn3qAV9Ucz3Lp8rJN5AdD4bnhs=;
 b=imG1sOuXmcEGhRto9/cBwUDB63W3yMWYra+kdTfjhnFwE8rRxx2kLpjxXkBHWbBirI
 1FvUZzShReSqLcJtXwhOlL8vJQyYhLgeGqYx4bhkRzlAen9WadvIPGA+qtHKEgydR+Tu
 dpbbxyEoja1ehcGniKB+kQC5NjBpFIRDGUvZJ3ebw3gh7mKgWUiyesq/GonERTd8IGSu
 OmA67VKEygTipImmMPRWBaDsPEJmRkEjGIYVqrO12b/sPr/Q7u1m4Uze0ETvZZlv0dwa
 d0gMx0+mVbIjaIwK+GpvihEja69+hAumyDVc6oKrsdLqrrDmXEW1PaH0QG8lyjJkCsgG
 9DVg==
X-Gm-Message-State: AOAM530TKXWZIb8MJPtk+NMGcog2O6ucMUm4qYHWlda/Iq2vojzY47RB
 3JnNl2aiTcbok4vYCqBIrumM3w1wpKclR7XpRxJpkA==
X-Google-Smtp-Source: ABdhPJxwqMZaLfOn6TzLb/GLihpg4GGodAJleAoeLOXW6d+kxnZXNArRcvf9kTne5Z021JckBamQgD4y7urdQuzOzm0=
X-Received: by 2002:a17:906:2dd5:: with SMTP id
 h21mr35625781eji.522.1625055869329; 
 Wed, 30 Jun 2021 05:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <DB6PR0402MB2760C13BBF36FF98E4F4635988029@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB2760C13BBF36FF98E4F4635988029@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 30 Jun 2021 17:54:18 +0530
Message-ID: <CAMty3ZDb5h2WJNxW=ZdFty53KFoZJmzZ8aBnFYfxnhKhgrpa8A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] arm64: imx8mm: Add MIPI DSI support
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 "linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 dl-linux-imx <linux-imx@nxp.com>, Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 Fancy Fang <chen.fang@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Tomasz Figa <t.figa@samsung.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Peng,

On Tue, Jun 29, 2021 at 12:40 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> Hi Jagan,
>
> > Subject: [RFC PATCH 0/9] arm64: imx8mm: Add MIPI DSI support
> >
> > This series support MIPI DSI on i.MX8MM.
> >
> > It worked directly with existing mxsfb driver but the SEC DSIM timings has to
> > be validate and tested through all platforms, ie reason I'm sending it as RFC.
> >
> > Tested on Engicam i.Core MX8M Mini SoM.
>
> Thanks for the work.
>
> >
> > patch 1: dt-bindings for SEC MIPI DSIM
> >
> > patch 2: SEC MIPI DSIM bridge driver
> >
> > patch 3: dt-bindings for SEC DSIM DPHY
> >
> > patch 4: SEC DSIM DPHY driver
> >
> > patch 5: MIPI DPHY reset enable in blk-ctl
> >
> > patch 6: display mix blk ctl node
> >
> > patch 7: eLCDIF node
> >
> > patch 8: MIPI DSI pipeline nodes
> >
> > patch 9: Enable LVDS panel on EDIMM2.2
> >
> > Note:
> > - all these patches on top of Peng Fan's blk-ctl driver.
>
> Would you please update to use V8 patchset?
>
> And the dtb:
> https://patchwork.kernel.org/project/linux-arm-kernel/
> patch/20210604111005.6804-1-peng.fan@oss.nxp.com/

Thanks for the details.

I will rebase to use this series and test. Will update on blk-ctl patches.

Thanks,
Jagan.
