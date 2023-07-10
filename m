Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50A374CF6A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B077B10E216;
	Mon, 10 Jul 2023 08:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C02810E214
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 08:05:56 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-577ddda6ab1so60886647b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 01:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688976355; x=1691568355;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QA/OQiX/pzJCCl8hjUqWSyMfpeWVEaj4HEKssATZWgM=;
 b=RZU+51thCwJE7K/xTfv65nD+a+HixYp05Wa6SBlO2OPNmy5m37MA39idOCBf48iw4I
 JAUO3x4LUqFv5n9ZrELLbiRS/BO1nAGtwpdrXb8nNN8cnDlJ8LzjAQtWkEXmxTcomt/b
 6SKNDx9Qnh0AyCoMIGQBFqko7Wj7IF9txSuTbmmzEpWua6Gd2wGn7hBgEqSgPDGJTBHx
 rX0RleQMfXN1sw6RfY3oojqQIbFW8p9AqKQHEIMY1DqZDGQmZgWBqNdXw08LUdm4UA/H
 NFFls4u9z7XvDbgPxkpjt/TGONun/oCEiAsv7cRZlG36Lvqp1p0iOWBwyDqUuyNHI4TI
 frYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688976355; x=1691568355;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QA/OQiX/pzJCCl8hjUqWSyMfpeWVEaj4HEKssATZWgM=;
 b=P1JAn48rVWup6/QcfsZLeBG178modZy8wX3fhn85KinHyhDsWfpAwystrtxCx99GOp
 2JqQCMvLe7rgE9qe6kd7ru4jQc8+75Zh2JiJpnQZ6riaF6UA0sVLZ/hNa3Mf9dV3wivZ
 E9IdfoZyejtYrI3yt3fc4J1fgwcOTcGrVS1VmrDshoGyKzqwIpo/Z9nYuYUgPXYzGibI
 ZI1oNLx2nwHohC/3Pt3Q/1mKDmcr0+eFSa2+00HVjJ6o0POX6Sfx/hyBTqRLQ6No9mtr
 hbwUJcA/g9Dp7+gwCS3y3M2HIqTKC+hw1gcG4KYabDthD8uo74YIO/akbV+mKBq5kIe1
 b5oQ==
X-Gm-Message-State: ABy/qLbshldt0e7/x1Ysg22B2SSPiYN7NbDriD/j2dhLwuTRglmGWUfM
 Kqju68QZG6QtxlDMSLTivqXC/S4DDAtHVmNfxsaUJQ==
X-Google-Smtp-Source: APBJJlEG5pnp9LkEiUqc/pFjf/LIV6zWlaq1ryHZ9f6Y/+cJDOgcs/p+rabjpQDm2Qv7iTSeTv8n58VhcfRI1V4/2bc=
X-Received: by 2002:a0d:d48e:0:b0:56d:2d82:63de with SMTP id
 w136-20020a0dd48e000000b0056d2d8263demr11415234ywd.3.1688976354895; Mon, 10
 Jul 2023 01:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <cec469206a166c4b070fd7d7bbf89a8df656ccc6.1686729444.git.Sandor.yu@nxp.com>
 <6f590bb6-7d17-3ae8-684d-2d4403d6ff55@linaro.org>
 <PAXPR04MB9448598256524162A74F0311F430A@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <8966feba-eef9-2ea3-dbec-13fc53232a6b@linaro.org>
 <PAXPR04MB9448480F2A0E0542942A661AF430A@PAXPR04MB9448.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9448480F2A0E0542942A661AF430A@PAXPR04MB9448.eurprd04.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 10 Jul 2023 11:05:43 +0300
Message-ID: <CAA8EJppbbeZB-pdPdg+gft+kS8Pzsxvqd9v6DsRNwTkL71XSJQ@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH v6 4/8] phy: Add HDMI configuration options
To: Sandor Yu <sandor.yu@nxp.com>
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
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Oliver Brown <oliver.brown@nxp.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Jul 2023 at 11:01, Sandor Yu <sandor.yu@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: 2023=E5=B9=B47=E6=9C=8810=E6=97=A5 15:44
> > To: Sandor Yu <sandor.yu@nxp.com>; andrzej.hajda@intel.com;
> > neil.armstrong@linaro.org; robert.foss@linaro.org;
> > Laurent.pinchart@ideasonboard.com; jonas@kwiboo.se;
> > jernej.skrabec@gmail.com; airlied@gmail.com; daniel@ffwll.ch;
> > robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; festevam@gmail.com;
> > vkoul@kernel.org; dri-devel@lists.freedesktop.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; linux-phy@lists.infradead.org
> > Cc: kernel@pengutronix.de; dl-linux-imx <linux-imx@nxp.com>; Oliver Bro=
wn
> > <oliver.brown@nxp.com>
> > Subject: Re: [EXT] Re: [PATCH v6 4/8] phy: Add HDMI configuration optio=
ns
> >
> >
> > On 10/07/2023 10:28, Sandor Yu wrote:
> > > Hi Dmitry,
> > >
> > > Thanks for your comments,
> > >
> > >> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> On 15/06/2023
> > >> 04:38, Sandor Yu wrote:
> > >>> Allow HDMI PHYs to be configured through the generic functions
> > >>> through a custom structure added to the generic union.
> > >>>
> > >>> The parameters added here are based on HDMI PHY implementation
> > >>> practices.  The current set of parameters should cover the potentia=
l
> > >>> users.
> > >>>
> > >>> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > >>> ---
> > >>>    include/linux/phy/phy-hdmi.h | 38
> > >> ++++++++++++++++++++++++++++++++++++
> > >>>    include/linux/phy/phy.h      |  7 ++++++-
> > >>>    2 files changed, 44 insertions(+), 1 deletion(-)
> > >>>    create mode 100644 include/linux/phy/phy-hdmi.h
> > >>>
> > >>> diff --git a/include/linux/phy/phy-hdmi.h
> > >>> b/include/linux/phy/phy-hdmi.h new file mode 100644 index
> > >>> 000000000000..5765aa5bc175
> > >>> --- /dev/null
> > >>> +++ b/include/linux/phy/phy-hdmi.h
> > >>> @@ -0,0 +1,38 @@
> > >>> +/* SPDX-License-Identifier: GPL-2.0 */
> > >>> +/*
> > >>> + * Copyright 2022 NXP
> > >>> + */
> > >>> +
> > >>> +#ifndef __PHY_HDMI_H_
> > >>> +#define __PHY_HDMI_H_
> > >>> +
> > >>> +/**
> > >>> + * Pixel Encoding as HDMI Specification
> > >>> + * RGB, YUV422, YUV444:HDMI Specification 1.4a Section 6.5
> > >>> + * YUV420: HDMI Specification 2.a Section 7.1  */ enum
> > >>> +hdmi_phy_colorspace {
> > >>> +     HDMI_PHY_COLORSPACE_RGB,        /* RGB 4:4:4 */
> > >>> +     HDMI_PHY_COLORSPACE_YUV422,     /* YCbCr 4:2:2 */
> > >>> +     HDMI_PHY_COLORSPACE_YUV444,     /* YCbCr 4:4:4 */
> > >>> +     HDMI_PHY_COLORSPACE_YUV420,     /* YCbCr 4:2:0 */
> > >>> +     HDMI_PHY_COLORSPACE_RESERVED4,
> > >>> +     HDMI_PHY_COLORSPACE_RESERVED5,
> > >>> +     HDMI_PHY_COLORSPACE_RESERVED6, };
> > >>
> > >> This enum duplicates enum hdmi_colorspace from <linux/hdmi.h> HDMI
> > >> 2.0 defines '7' to be IDO-defined.
> > >>
> > >> Would it be better to use that enum instead?
> > > Accept. I will create head file hdmi_colorspace.h to reuse enum
> > hdmi_colorspace in <linux/hdmi.h>.
> >
> > Excuse me, it was supposed to be a question.
> >
> > Do you need another header file to reuse this enum?
> I'm not sure community whether would accept the patch that simply include=
 <linux/hdmi.h> in phy-hdmi.h
> because there are lots of other definition in <linux/hdmi.h> that not nee=
d by phy-hdmi.h.
> If the answer is yes, I happy to follow.

In my opinion it's a better alternative to creating yet another header.

>
> >
> > >
> > > B.R
> > > Sandor
> > >>
> > >>> +
> > >>> +/**
> > >>> + * struct phy_configure_opts_hdmi - HDMI configuration set
> > >>> + * @pixel_clk_rate:  Pixel clock of video modes in KHz.
> > >>> + * @bpc: Maximum bits per color channel.
> > >>> + * @color_space: Colorspace in enum hdmi_phy_colorspace.
> > >>> + *
> > >>> + * This structure is used to represent the configuration state of =
a HDMI
> > phy.
> > >>> + */
> > >>> +struct phy_configure_opts_hdmi {
> > >>> +     unsigned int pixel_clk_rate;
> > >>> +     unsigned int bpc;
> > >>> +     enum hdmi_phy_colorspace color_space; };
> > >>> +
> > >>> +#endif /* __PHY_HDMI_H_ */
> > >>
> > >> [skipped the rest]
> > >>
> > >> --
> > >> With best wishes
> > >> Dmitry
> > >
> >
> > --
> > With best wishes
> > Dmitry
>
> B.R
> Sandor
>


--=20
With best wishes
Dmitry
