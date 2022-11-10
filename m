Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A3624871
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 18:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C01A10E6FC;
	Thu, 10 Nov 2022 17:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E208910E6FC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 17:37:41 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id d3so1369903ils.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 09:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W70VhU4UmtkfhYe6LcJTIV91uyNsXWZMqQbzBIL/iIo=;
 b=B0L/L115Lg2iNNoAwkSzKmtGvnFGkjsMmGulxTnWcGEj+d0eZgKD+IdBPGLANc5byZ
 HrGvWr4laXLkCCDxaXq5CHW41Q+f7Ix+HSnYIC70VVWkF0AO2XjMqT9njsp6fQ4HtvgK
 er7Cqkn972kHAArcC78G/VtVo1Zdta+cWiqA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W70VhU4UmtkfhYe6LcJTIV91uyNsXWZMqQbzBIL/iIo=;
 b=SRTYLttwgRf9Xd74+9LyByOfrt0XpGxyb2rOqksy5rEoLbU08AOFgGXSdADe7ARdcO
 pU/xWJ2sVd8X/w3sChUN9FFLCE9TBux3YidUQps3jpp3pGD/52v8gCBVI/qTGPUoVFhB
 ECANypR9zu/bs79aOmHf/+lO95lYvH00AHysONJgwBd+gVYcXyyt0Ql9OzaDhmxzTzix
 PS4K7H+iyYS81falofpY+9D0i/sduQP/BSdWHQrVhRl/DSLQKR0XNFuT/4l+5uHH+Ym2
 N3h8XMpgx2etFAHGtTN59oZIaLpPhuRCmnYhbthpMn7x+TayQsQzK+/Le7b00JjtHZXV
 W9iQ==
X-Gm-Message-State: ACrzQf39AbGg6/Rh9MwE++BaCokxBG7PJLIXiJt2Jr0zS/uiMpVh5rWY
 o9AcZa44T6uap1ODaa3nrGYtJyB8NQBFvyBu7B+JjQ==
X-Google-Smtp-Source: AMsMyM6XyEdsXU2nFmT/1CwysC/chyHNqPpPCI/YoB+liihMr9GQ5b36r7Cjw2mCudTxJTtErd/nDVXb9BekUTKvBOU=
X-Received: by 2002:a05:6e02:1108:b0:2ff:e796:926 with SMTP id
 u8-20020a056e02110800b002ffe7960926mr3224282ilk.216.1668101861150; Thu, 10
 Nov 2022 09:37:41 -0800 (PST)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <f1dfac7d-643e-db29-28fe-7a2fcde01894@kontron.de>
 <CAOMZO5AqRRYLTUQWACiCA0RCvsjGaCmK3yhdGP8XfNxjFP1OiA@mail.gmail.com>
 <CAMty3ZA9sPf97C0xonHwBR8SWDrRyA7DKVCmWOyoxijQwXUSZQ@mail.gmail.com>
 <291cd9ec-582a-49e7-adf5-9955539897ea@denx.de>
In-Reply-To: <291cd9ec-582a-49e7-adf5-9955539897ea@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 10 Nov 2022 23:07:30 +0530
Message-ID: <CAMty3ZCLZKDnmG3XdxidKPNYLieoxUqW0or3RTWO3EW0NAiTSA@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
To: Marek Vasut <marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 10, 2022 at 10:29 PM Marek Vasut <marex@denx.de> wrote:
>
> On 11/10/22 17:03, Jagan Teki wrote:
> > On Thu, Nov 10, 2022 at 9:24 PM Fabio Estevam <festevam@gmail.com> wrote:
> >>
> >> Hi,
> >>
> >> On Mon, Nov 7, 2022 at 1:34 PM Frieder Schrempf
> >> <frieder.schrempf@kontron.de> wrote:
> >>
> >>> I tested this on the Kontron DL i.MX8MM which uses a TI SN65DSI84 bridge
> >>> and a Jenson 7" LVDS Display.
> >>>
> >>> Thanks for your work, Jagan!
> >>>
> >>> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron DL
> >>> i.MX8MM
> >>
> >> As this series has been successfully tested on multiple devices, is it possible
> >> to apply it so people can make further adjustments?
> >
> > I think the next version patchset on this would be clean and properly
> > address a few comments from Marek Vasut. However, I'm still waiting
> > for Marek's response to my comment on the input bus formats - if it is
> > Okay I will send the v8.
> > https://lore.kernel.org/all/CAMty3ZAM+fetmBQWaSbfjME7-Up4h+Ln3BRHaPgg5tuSsObPdw@mail.gmail.com/
>
> Just send a V8 and let's see how that looks, no need to wait for me.

Planning to include your 8M Plus patch as part of the v8, hope it's fine?

Jagan.
