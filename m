Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D05AD6E87F0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 04:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DF410E00F;
	Thu, 20 Apr 2023 02:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0718510E00F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 02:24:15 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2478485fd76so298141a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 19:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681957454; x=1684549454;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5hCnIiv0UZoUyqA3j7om4LR5r+3eUZFma/siIy2qvxI=;
 b=aHY0KqzYmBUMNi2SicP8NE4mewVj4KbcqsIdBEOZnX3xv6AbcZVdLJaMN/46ZG2byr
 rBxvGegBdnF3Blj7IULlxmIG7Vc3WSEf6BxpnZwgTSwm5BKMmNTladesWKF27zZEbwa1
 2/069yWBd3mg4yjNl+d9e9NWhFp+40oZgCrJat2dufA7loHBzTGP7MZEEccaSghk9UNB
 QdRJWyYbYJMp0DMsz6nPSJSA6qCJqVd/sd/tHuSTY6mh0fdNp7D77VyWAz3HdyDGpgw/
 MVZJFN+jnIfr2ZMz23p3AofUQ3GIbgveA3oSWQVTDDG8Ucl0RVwh3QnYcf1cgW4/5zAf
 pf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681957454; x=1684549454;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5hCnIiv0UZoUyqA3j7om4LR5r+3eUZFma/siIy2qvxI=;
 b=edNihcg15qgZYa4f37a7gljcQ56dHc6S0zYFFTW586sfdQUTq9HQCziB+hZwIGZEIM
 UAd+wtA0wGb2hNEtyFp1JzwhyKOTeYvRf/vt4r8kYDakgdlVwtpZakzrYLnnkQTsy0qL
 nWT4HCqksjU6SIR6cjPa+/NsHEpOKyzIayk1vzME89FmwnZOnQe6gIamnsVY+0cArlkQ
 9DvH78I8FjBleFkTDRub8rdpnCvKchn2SoMgAkJwkfwKHaBxS6+ys1ahzU5KUYIzUojD
 G0XC0FWML0d1gRb/owF1XBpEN+DNEyNUdlWuKpjd8XYgKVV7I9QhxrS8w+1gNZEfzM/d
 8aZw==
X-Gm-Message-State: AAQBX9f99eyfHcj+Cw5yRV2lqkgvnB4V+uWetH+fPV4tNN09VNsMubEm
 bPrL2TYzapV4uRy3GX32NQpMr117QJK6P7ckt8Y=
X-Google-Smtp-Source: AKy350ZadxRbNfm3xfOR9s+wQOjZ3vM83wayISANsNazFfeiI4PtzsEAeWCrcjhACnyQu547bwbY7U3jZ3QonfXSGK4=
X-Received: by 2002:a17:90a:ad90:b0:247:bd63:c3af with SMTP id
 s16-20020a17090aad9000b00247bd63c3afmr181414pjq.8.1681957453496; Wed, 19 Apr
 2023 19:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230415104104.5537-1-aford173@gmail.com>
 <20230415104104.5537-5-aford173@gmail.com>
 <807aa6c6-bbea-abcc-172d-17e22d1a3988@denx.de>
 <CAHCN7x+NUnMtLbj_7A_uqxPsi5NXRXsPFwDnn=sf1bgm-Q-BsQ@mail.gmail.com>
 <88e53197-2819-c068-eba6-a218a19d8d15@denx.de>
 <CAHCN7xLbbyTaN43pJe3NMdupoGb5vC3yXc_vBn6+CRChWCt92A@mail.gmail.com>
 <ac7ce475-23dd-4d9d-afd1-ad139496a510@denx.de>
In-Reply-To: <ac7ce475-23dd-4d9d-afd1-ad139496a510@denx.de>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 19 Apr 2023 21:24:02 -0500
Message-ID: <CAHCN7xKZnHGkErwpT-zXR6P-nMxBbg4OVNSr1An2vBaTpOsuqA@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm: bridge: samsung-dsim: Support non-burst mode
To: Marek Vasut <marex@denx.de>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 6:23=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 4/18/23 00:24, Adam Ford wrote:
> > On Mon, Apr 17, 2023 at 3:08=E2=80=AFPM Marek Vasut <marex@denx.de> wro=
te:
> >>
> >> On 4/17/23 13:57, Adam Ford wrote:
> >>> On Sun, Apr 16, 2023 at 5:13=E2=80=AFPM Marek Vasut <marex@denx.de> w=
rote:
> >>>>
> >>>> On 4/15/23 12:41, Adam Ford wrote:
> >>>>> The high-speed clock is hard-coded to the burst-clock
> >>>>> frequency specified in the device tree.  However, when
> >>>>> using devices like certain bridge chips without burst mode
> >>>>> and varying resolutions and refresh rates, it may be
> >>>>> necessary to set the high-speed clock dynamically based
> >>>>> on the desired pixel clock for the connected device.
> >>>>
> >>>> The link rate negotiation should happen internally between the neare=
st
> >>>> bridge and DSIM, so please add that to DRM core instead of hacking
> >>>> around it by tweaking the HS clock again.
> >>>
> >>> I thought you tried to add something like this before and had some re=
sistance.
> >>
> >> Yes, all my attempts were rejected by a single reviewer. I suspended m=
y
> >> efforts in that area for now.
> >>
> >>> The Pixel clock is set by the bridge already without any new code
> >>> added to the DRM core..  I am just reading that value that's there,
> >>> and setting the clock accordingly.  I don't see how this is a hack.
> >>
> >> Assume you have a DSI-to-HDMI bridge attached to your DSIM bridge, it
> >> operates in non-burst mode, like ADV7533 . How would you configure the
> >
> > I have an ADV7535
> >
> >> HS clock rate for such a bridge in DT ? (hint: you cannot, because the
> >> required clock comes from the EDID, which may not be available just ye=
t)
> >
> > The whole idea is that you wouldn't want to or need to configure the
> > clock speed in the device tree because it comes from the
> > EDID->bridge->DSI.
> >
> > I've tested this configuration on imx8mm, imx8mn, and imx8mp and I can
> > change the resolution and refresh rate on the fly and the DSI will
> > automatically readjust accordingly.   If you fixed the clock in the
> > device tree, you wouldn't be able to do that, and that was the point
> > of this patch.
>
> Uh, I retract my comment, I was clearly confused here and we're talking
> about the same thing.

I'm working on a V2 for this series.  Are you OK with this if I update
the commit message a bit to make it more clear?

adam
