Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB5B54F55C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 12:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F9711A7CE;
	Fri, 17 Jun 2022 10:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C21C11A75D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 10:32:18 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id y19so7941993ejq.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 03:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7uycaSN9iJurwFdQhz5RtglUFVEwCOI11ppJxZo3608=;
 b=lp5VBBWkFeiyeLHXbFMLHxIgQPWdyvIbt3dQIwUt9c8uFPwz+IrfcGPmVoYjN+nhL2
 IXPghsmlO7r72mhRBC5ktRalebTwS9luCPCtI/slO6vetYi4k1699uOx13DUTc3I6tvw
 Fw5zgCep/l0wo0FRNJ/JNClsoRWUoygeY1hZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7uycaSN9iJurwFdQhz5RtglUFVEwCOI11ppJxZo3608=;
 b=vXJYSmX0jynDP9GPzmRLpwM/QY0dIUylvhGnNI9uPFR0xp9pjNqmN+Vwyp4cGTxuQ6
 afuw3MdJ6O6DEcqyee+LxDCc8ND4eEjUdytxWbI1ilZM9NlGz2seGCfmmByROLojZgDM
 5CwvSS/lBrq+WKqu1cXK83Pr9NAsWVk21msh4xZplwmDidqqggYYo6AgOUMYAEeRz0AE
 NblmPqHjRajULa0Zs6s7f+iUGCXpKqmPjZJHf/6AdIoepO8jqFsfrDPqakQHW2KT23xy
 RmLZ6x+bIGaaiPNqIzEOQ8t8sfI1we0Sec60fZ4DZCwZE53wrYvYZQsnJMvmUPdB+F5P
 poJg==
X-Gm-Message-State: AJIora/FwV+S/lQcu1waMwbzVWbZwvXGBP95YxZ6XB32PG1zhSrpMKqL
 OPzMipzQW4yEpni1pmnyhJ1E7XRPZMn40LCifAIpYw==
X-Google-Smtp-Source: AGRyM1vJezawLBpRfzaRxzuh1/FQUhahxawJvf0BNgHsS01ToALH1YZ+PHNDuR5+UilQehEhOeyv7ZocgsRIldm4/oY=
X-Received: by 2002:a17:907:96a8:b0:711:56b8:f72b with SMTP id
 hd40-20020a17090796a800b0071156b8f72bmr8887942ejc.152.1655461936837; Fri, 17
 Jun 2022 03:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220422084720.959271-1-xji@analogixsemi.com>
 <20220422084720.959271-4-xji@analogixsemi.com>
 <CAG3jFytWGSUM9mevHewdmEe-hq3JgB74s7_f0fsEQqkXr9VUHg@mail.gmail.com>
 <CAG3jFyvEYbwkdGtiNR-6vFEXTLjcyT_viqp9qeVxFTu0PrJEVA@mail.gmail.com>
 <CAGXv+5E1cCNWD98fMDjC38y2UztZd=PNQ+=G=wrBYfoXkswvHA@mail.gmail.com>
 <20220425091419.GA967110@anxtwsw-Precision-3640-Tower>
 <CAG3jFyvTim7P_y2G1Br5j3Pwz4KzvRjWgci_qQ3m_YW=3Bog8A@mail.gmail.com>
 <CAKMK7uFHyYTnGtP+vCzo2Uan90DW-QZpPFPn5S9bQ5aPiY=qzA@mail.gmail.com>
 <CAKMK7uHFGsPMZf2SUF4HDXo3XuOLjP3-DLfyp=gB2qpKR964Eg@mail.gmail.com>
 <20220523031324.GA3738288@anxtwsw-Precision-3640-Tower>
 <CAGXv+5EHghwSV+9Www9RvG74PkC7=AQuwn6sVG=cvCni-iwCyQ@mail.gmail.com>
 <CAG3jFysJLoQ2DMYw0oOfbQM3ifBmAhNLMxjPDEt12jq8sKCcSg@mail.gmail.com>
In-Reply-To: <CAG3jFysJLoQ2DMYw0oOfbQM3ifBmAhNLMxjPDEt12jq8sKCcSg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Jun 2022 18:32:05 +0800
Message-ID: <CAGXv+5EEB1-jUgUo3HGTu9JgeD46Nuu1PuwO9PYfOKeR3csBbw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/bridge: anx7625: Use DPI bus type
To: Robert Foss <robert.foss@linaro.org>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, qwen@analogixsemi.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 bliang@analogixsemi.com, Xin Ji <xji@analogixsemi.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, May 23, 2022 at 4:37 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> On Mon, 23 May 2022 at 09:18, Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > On Mon, May 23, 2022 at 11:13 AM Xin Ji <xji@analogixsemi.com> wrote:
> > >
> > > On Sat, May 21, 2022 at 06:28:42PM +0200, Daniel Vetter wrote:
> > > > On Sat, 21 May 2022 at 18:07, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >
> > > > > On Tue, 17 May 2022 at 18:09, Robert Foss <robert.foss@linaro.org> wrote:
> > > > > >
> > > > > > On Mon, 25 Apr 2022 at 11:14, Xin Ji <xji@analogixsemi.com> wrote:
> > > > > > >
> > > > > > > On Mon, Apr 25, 2022 at 04:24:50PM +0800, Chen-Yu Tsai wrote:
> > > > > > > > On Fri, Apr 22, 2022 at 10:13 PM Robert Foss <robert.foss@linaro.org> wrote:
> > > > > > > > >
> > > > > > > > > On Fri, 22 Apr 2022 at 16:01, Robert Foss <robert.foss@linaro.org> wrote:
> > > > > > > > > >
> > > > > > > > > > On Fri, 22 Apr 2022 at 10:49, Xin Ji <xji@analogixsemi.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > As V4L2_FWNODE_BUS_TYPE_PARALLEL not properly descript for DPI
> > > > > > > > > > > interface, this patch use new defined V4L2_FWNODE_BUS_TYPE_DPI for it.
> > > > > > > > > > >
> > > > > > > > > > > Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> > > > > > > > > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > > > > > > > > ---
> > > > > > > > > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
> > > > > > > > > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > > > > index 376da01243a3..71df977e8f53 100644
> > > > > > > > > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > > > > @@ -1623,14 +1623,14 @@ static int anx7625_parse_dt(struct device *dev,
> > > > > > > > > > >
> > > > > > > > > > >         anx7625_get_swing_setting(dev, pdata);
> > > > > > > > > > >
> > > > > > > > > > > -       pdata->is_dpi = 1; /* default dpi mode */
> > > > > > > > > > > +       pdata->is_dpi = 0; /* default dsi mode */
> > > > > > > > > > >         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> > > > > > > > > > >         if (!pdata->mipi_host_node) {
> > > > > > > > > > >                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> > > > > > > > > > >                 return -ENODEV;
> > > > > > > > > > >         }
> > > > > > > > > > >
> > > > > > > > > > > -       bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > > > > > > > > > > +       bus_type = 0;
> > > > > > > > > > >         mipi_lanes = MAX_LANES_SUPPORT;
> > > > > > > > > > >         ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> > > > > > > > > > >         if (ep0) {
> > > > > > > > > > > @@ -1640,8 +1640,8 @@ static int anx7625_parse_dt(struct device *dev,
> > > > > > > > > > >                 mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > > > > > > > > > >         }
> > > > > > > > > > >
> > > > > > > > > > > -       if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> > > > > > > > > > > -               pdata->is_dpi = 0;
> > > > > > > > > > > +       if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
> > > > > > > > > > > +               pdata->is_dpi = 1;
> > > > > > > > > > >
> > > > > > > > > > >         pdata->mipi_lanes = mipi_lanes;
> > > > > > > > > > >         if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> > > > > > > > > >
> > > > > > > > > > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > > > > > > > >
> > > > > > > > > Acked-by: Robert Foss <robert.foss@linaro.org>
> > > > > > > >
> > > > > > > > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > > > > >
> > > > > > > > Confirmed this fixes the display on Juniper (Acer Chromebook Spin 311) on
> > > > > > > > mainline (next-20220422).
> > > > > > > >
> > > > > > > > Xin, in the future, please send the whole series to all recipients of
> > > > > > > > all patches listed by get_maintainers.pl, not just the recipients of
> > > > > > > > each patch. In the case of this series, they should have been sent
> > > > > > > > to all of the mailing lists (media, devicetree, dri-devel) so that
> > > > > > > > everyone has the same, full view of the patches.
> > > > > > > Hi ChenYu, OK, I'll send to all media, devicetree, dri-devel next time.
> > > > > > > Thanks,
> > > > > > > Xin
> > > > > > > >
> > > > > > > > ChenYu
> > > > > >
> > > > > > Applied 3/4 + 4/4 to drm-misc-next.
> > > > >
> > > > > This patch doesn't even compile. Can you pls fix this up asap? Also
> > > > > pls compile-test before pushing ...
> > > >
> > > > Marek says the prerequisite landed through linux-media, and that's why
> > > > it compilers on linux-next but not in drm-misc-next.
> > > >
> > > > Don't do that.
> > > >
> > > > Instead:
> > > > - merge all patches through one branch, with the foreign patches acked
> > > > for that merge patch
> > > > - wait until you can backmerge all the dependencies
> > > > - do a topic branch
> > > >
> > > > This probably needs to be reverted here and instead merged through
> > > > linux-media. Or you wait until -rc1 and then apply it to
> > > > drm-misc-next.
> > > > -Daniel
> > > Hi Daniel, I use git send-email to upstream patch and automatically
> > > generated reviewer list, so patch 1/4 and 2/4 send to linux-media, and
> > > these 2 patches already merged in linux-media.
> >
> > This is one of the reasons why you should always send the "full" series
> > to all recipients. That way people, especially maintainers, are more
> > likely to notice build time cross tree dependencies like this one, and
> > work towards a common resolution.
>
> This mistake is mine, and I think the best solution is to revert 3+4 until rc1.

I think we can reland the patches now?

ChenYu

> I'll send out the revert patches to the ML right away.
>
>
> Rob.
