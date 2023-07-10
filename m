Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB84A74CE6F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0420F10E1E0;
	Mon, 10 Jul 2023 07:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4ED210E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:30:36 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-c5f98fc4237so3941416276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 00:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688974235; x=1691566235;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oHl7fngjoZwHTC555h5RUzOAC7pZIoIYa9Mwto78lz8=;
 b=lkrRgScJqf1Nw2g0ZJDW7UYJfVZu6eF+vC1cpqOvcDFGTpKmkaWBV3dSDN6RYDg53L
 /scvszYKpui2Xnk3z6kdhx216eezRZAgLBqt1WW84cGx1aR0lQkUCZFtAnbwYI969D5d
 yOnaXV4anp/NDbt0BrotYiIAKeYLPDqgQOEu4CfuWVQCWiRmoBnd/39g4OV1dYaFFYMZ
 AjW2NGFp8Jn5wizmcI/yY1YdYS0CxKYHMM/ywLppHolPfUw9fMLF00rEQ5J34IL8QfJ+
 UfQfA0nZlNXhn7UMJHoHPkqQ6qmKfwHe6i5biYNoTsa7LY6q8FbPBLu3TPOV1GAvuIWb
 qV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688974235; x=1691566235;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oHl7fngjoZwHTC555h5RUzOAC7pZIoIYa9Mwto78lz8=;
 b=Zv+IAz4NqzAU9D3HwcKxvrtrGjOA0ip73HGCqQKrz8dZGCplUiWICGkCqFS57hbFbe
 V47gIOF0BXL/QRAuf+pXfyBMgMzKLTrmtT6u8D+PtbNBwNuA6wHAD4VvHQx2EiP7rFXD
 xpoTsWmDHuj/XoOkeQfP4bwsrHR6bXjnNcs4kOFJ7dPWznKziMEbCTBM5hrtk62PLHVo
 Yl+BvDfe1i124VN4qREqLs1MpdXDmAH2JBapM/YdQ/JpJGjw1sjlj3iy6thVBHWI/vDF
 gFZuugsbGKy7Q/fTwHONn/l8KPN5uW+443MsFc2A1h8XkbWVtGeSn9fE4Pfch8tme/bJ
 ht7A==
X-Gm-Message-State: ABy/qLbYLAP3DI3z40w43Lp8/wg88hJ7S6zuapBjnca9bmm5P71k/gyW
 FiR5KcD76+83sADNuuAueE9BnN2mzIEwyXjaSU0p6Q==
X-Google-Smtp-Source: APBJJlEC1ydkMDnqyBVzJGdir+OwRhrUWZ1vDb1g7pXtOn40Y5bgDJbUUwUb1y7kb1Ggfujl5HeIIubX3iiGnia+ngw=
X-Received: by 2002:a25:9904:0:b0:c60:c70d:b4de with SMTP id
 z4-20020a259904000000b00c60c70db4demr10948008ybn.39.1688974235384; Mon, 10
 Jul 2023 00:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <cec469206a166c4b070fd7d7bbf89a8df656ccc6.1686729444.git.Sandor.yu@nxp.com>
 <6f590bb6-7d17-3ae8-684d-2d4403d6ff55@linaro.org>
 <PAXPR04MB9448598256524162A74F0311F430A@PAXPR04MB9448.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9448598256524162A74F0311F430A@PAXPR04MB9448.eurprd04.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 10 Jul 2023 10:30:24 +0300
Message-ID: <CAA8EJpoNTvaMKcn7ben=Ai7CkGcUnZ2g7UiH7Oy4zTX2zzKAxg@mail.gmail.com>
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

On Mon, 10 Jul 2023 at 10:28, Sandor Yu <sandor.yu@nxp.com> wrote:
>
> Hi Dmitry,
>
> Thanks for your comments,
>
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: 2023=E5=B9=B46=E6=9C=8825=E6=97=A5 2:02
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
> > Subject: [EXT] Re: [PATCH v6 4/8] phy: Add HDMI configuration options

Is this part necessary?

> >
> > Caution: This is an external email. Please take care when clicking link=
s or
> > opening attachments. When in doubt, report the message using the 'Repor=
t
> > this email' button
> >
> >
> > On 15/06/2023 04:38, Sandor Yu wrote:
> > > Allow HDMI PHYs to be configured through the generic functions throug=
h
> > > a custom structure added to the generic union.
> > >
> > > The parameters added here are based on HDMI PHY implementation
> > > practices.  The current set of parameters should cover the potential
> > > users.
> > >
> > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > ---
> > >   include/linux/phy/phy-hdmi.h | 38
> > ++++++++++++++++++++++++++++++++++++
> > >   include/linux/phy/phy.h      |  7 ++++++-
> > >   2 files changed, 44 insertions(+), 1 deletion(-)
> > >   create mode 100644 include/linux/phy/phy-hdmi.h
> > >
> > > diff --git a/include/linux/phy/phy-hdmi.h
> > > b/include/linux/phy/phy-hdmi.h new file mode 100644 index
> > > 000000000000..5765aa5bc175
> > > --- /dev/null
> > > +++ b/include/linux/phy/phy-hdmi.h
> > > @@ -0,0 +1,38 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Copyright 2022 NXP
> > > + */
> > > +
> > > +#ifndef __PHY_HDMI_H_
> > > +#define __PHY_HDMI_H_
> > > +
> > > +/**
> > > + * Pixel Encoding as HDMI Specification
> > > + * RGB, YUV422, YUV444:HDMI Specification 1.4a Section 6.5
> > > + * YUV420: HDMI Specification 2.a Section 7.1  */ enum
> > > +hdmi_phy_colorspace {
> > > +     HDMI_PHY_COLORSPACE_RGB,        /* RGB 4:4:4 */
> > > +     HDMI_PHY_COLORSPACE_YUV422,     /* YCbCr 4:2:2 */
> > > +     HDMI_PHY_COLORSPACE_YUV444,     /* YCbCr 4:4:4 */
> > > +     HDMI_PHY_COLORSPACE_YUV420,     /* YCbCr 4:2:0 */
> > > +     HDMI_PHY_COLORSPACE_RESERVED4,
> > > +     HDMI_PHY_COLORSPACE_RESERVED5,
> > > +     HDMI_PHY_COLORSPACE_RESERVED6,
> > > +};
> >
> > This enum duplicates enum hdmi_colorspace from <linux/hdmi.h> HDMI 2.0
> > defines '7' to be IDO-defined.
> >
> > Would it be better to use that enum instead?
> Accept. I will create head file hdmi_colorspace.h to reuse enum hdmi_colo=
rspace in <linux/hdmi.h>.

Hmm, you need another header file to reuse this enum.

>
> B.R
> Sandor
> >
> > > +
> > > +/**
> > > + * struct phy_configure_opts_hdmi - HDMI configuration set
> > > + * @pixel_clk_rate:  Pixel clock of video modes in KHz.
> > > + * @bpc: Maximum bits per color channel.
> > > + * @color_space: Colorspace in enum hdmi_phy_colorspace.
> > > + *
> > > + * This structure is used to represent the configuration state of a =
HDMI phy.
> > > + */
> > > +struct phy_configure_opts_hdmi {
> > > +     unsigned int pixel_clk_rate;
> > > +     unsigned int bpc;
> > > +     enum hdmi_phy_colorspace color_space; };
> > > +
> > > +#endif /* __PHY_HDMI_H_ */
> >
> > [skipped the rest]
> >
> > --
> > With best wishes
> > Dmitry
>


--=20
With best wishes
Dmitry
