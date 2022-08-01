Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9FA5871FD
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 22:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDCD12A702;
	Mon,  1 Aug 2022 20:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F9E10E212
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 20:07:28 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id a7so9365299ejp.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 13:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=dM75XEwFU5CbiGRXcEpaIYQB6b03v9H4wzpeMmKaTgk=;
 b=LYlztePAEJ2AR3JYWDBFtZ3dDQRZSbMAj+XFcthBsl3pBXZqprQFMOHZwwbFTGLOKx
 Kcc5sHUB2ovvR1uPTOKjlEKx4fAHAfeDxvzpuG1rxkxvLqeODXbWDMxaO8kT6TXyGXKp
 nelGiqXplCHeWya10cSQlxq30U76m08sgRAaXBd+mSp97UcJxSQEQ+YAuDAYXkPMcQZJ
 QWofxAa7sdyEA4SoI9RKrfTc6287QDZGBAmDinTsSHGhp7lIIVEHwGPok8xr7p9JNqse
 dinisRZYsfERxKgNA1olrNs9Ds8FbKWw2pvKlAzoW/yXKMSYqy/lt61xttNLi4ytim2p
 9J2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=dM75XEwFU5CbiGRXcEpaIYQB6b03v9H4wzpeMmKaTgk=;
 b=pcEzC271GE7Zl1Axcf0ctZ99SCtv+lnIlSUMo4xJbnmkN0PvHkoydoWTWeEzCJpZOe
 tyQ6dhfsSEZ+dkRkSLgu5bwr6jY/BuzkTQGmL1aZrxA/LyyQWGEcDUGKgTMln5rwBdK6
 rFsFmnXcFGnZ57K+a8CFCjbaK7CKfSUkzBE7SrAt634yg0gHqbXC6QTl18CQdxhQUrN1
 zsvzmCTBSZTtV3Nqcuj+l+t3Q5ct2PVHSfj2jtSGvYXrDltsMkNI0Xn1sgHxYnIj3nPD
 8YMg56quzagSZXAengYQzt48CYcdpyjW+rqmtoDl6bF5Phr71hxViADz3/3ssS0nfmP6
 Et6g==
X-Gm-Message-State: AJIora+fIscoSZUOi3CKQrl8jtN0hC7WWbL4vZr+52oOl3hlWvTAsEIC
 yuV6O4imyky95Bg584L/kR5BwYyqE8GW/oEkQnM=
X-Google-Smtp-Source: AGRyM1uexHlNzjAEWlTkuhlfGVVKV9MRLa+HenftvIKqi3rwguQ7/nrBYx0l41AbyHlSKpZlsYS3aD9ELhcedZFNS2k=
X-Received: by 2002:a17:907:2724:b0:72b:496c:568a with SMTP id
 d4-20020a170907272400b0072b496c568amr13821421ejl.305.1659384446832; Mon, 01
 Aug 2022 13:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xJ=N1vWVTBjArskJ59fyaLzmAGWfc0E=_iGizrDNR_Udw@mail.gmail.com>
 <CAOMZO5BAheG4r1Umnd7bLhOqezsxJgE0x1c-858EcabbpPm6Pg@mail.gmail.com>
In-Reply-To: <CAOMZO5BAheG4r1Umnd7bLhOqezsxJgE0x1c-858EcabbpPm6Pg@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 1 Aug 2022 15:07:15 -0500
Message-ID: <CAHCN7xLDPvQ__WJPeCptvq7mFtF3v3TGAG_vyDBxSdoqWwoO8A@mail.gmail.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
To: Fabio Estevam <festevam@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Foss <robert.foss@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 1, 2022 at 2:33 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Adam,
>
> On Sat, Jul 30, 2022 at 12:16 PM Adam Ford <aford173@gmail.com> wrote:
> >
> > Hey all,
> >
> > I am trying to test Jagan's patch series [1] to add support for the
> > samsung dsim bridge which is used on the imx8mm to output DSI video.
> > The DSIM gets the video from the mxsfb, and in my case, the DSI is
> > sent to the adv7535 for connecting to HDMI.
>
> I had to add some extra patches on top of Jagan's imx8mm-dsi-v3 to get
> HDMI output functional on a imx8mm-evk via ADV7535:
>
> https://github.com/fabioestevam/kernel/commits/imx8mm-dsi-v3
>
> Does it work on your board?

I'll give them a try tonight.  I managed to get a hold of an adv7535
user manual, and there are some items that it appears NXP did in their
downstream kernel that never got pushed upstream. Based on my review
of some of the changes, some of the NXP changes seem reasonable to me.
If/when I can get it working, I'll try to report back some of my
findings and push driver changes to the adv7535 as I find them.

adam
