Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 934E4552471
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 21:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5F910E275;
	Mon, 20 Jun 2022 19:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF5B10E074
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 19:14:01 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id q140so11055261pgq.6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 12:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NH47jZdjhWf32jVaZ0IHAkgTUTE2rJqOL45liR1vnJ8=;
 b=zjXKFUtvnnuzsKTACuTQo4ZvMG43p2/zFihl3W84CsSIZHrkrfZMMufl4DcesBeLrm
 QC0KMnBMZC7FnKO/rSzNw/PqB0Ucc7G9/kNv1hDG7HL9KMz2G6XMrqiaMXcK+yl+Do9F
 l5o8zQPe80EXJT8yeWy0Kzflb3ZEQY3fJr14N+RvlnLJoMlFiaHK/NnFPOosEZxXBbzh
 /KR9xCQkvYuom/5fGtNpvbOopEu9f8dovOesxJ6yV3MCYZsf6UScCvEXYhO8xTnhk6Kv
 y70uHb3vS/iWNe82W3D/XFnwsLMIovTNMOTy6fKMHKpv/i57/+84YXwZnNri+3Kv057j
 l85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NH47jZdjhWf32jVaZ0IHAkgTUTE2rJqOL45liR1vnJ8=;
 b=lAzBmky+XmHIB2fOWaMnRQLj3o/8u/4EBfxb2GopWaKsNhHbehRHSVhVO36kRbs80s
 lML2FtlVDpsY7Uqp+1aAtNcXuVJgH0gFFKGfiVkW6gx04bTMPE/+y6Tb7VA+20msEDf8
 5RjGcLT0WosJ9VwdoqmTtYlnKTz6zicNhx9sXl+OCngg70sXpS2lNdcw9zknW3XQxxZZ
 juOHcrdX5i3Td6O/tsO8UjrqiUe5TYQYBlC+HtP2uoAdEYubDB6ZEb4uvvVcn+hpdYpv
 4OjtpvBcO/76GEFLordgy9BdeWoGaQL+8q+AtCEqSR5hywdEUEoELMl+bAdE+SZ3srmo
 T2jA==
X-Gm-Message-State: AJIora+mwCFKdqD+zWDSC0vUtYR+j8rWiBKJp8Vm1Go6Z81YPXXE7aqb
 E8+1d+q8JQfszI6/LIdbc1e2qtE8mpJJtcG76HQ7kA==
X-Google-Smtp-Source: AGRyM1sDJkkBU9sTQ9zIHz2OtpUNQYwhHwEI3lfAO1pmWmTfCdmCUh6tOYRrYUXR7q+LJKZYO4K02d01yg39wvXxZWs=
X-Received: by 2002:a63:e114:0:b0:3fd:97a1:7a5 with SMTP id
 z20-20020a63e114000000b003fd97a107a5mr22613273pgh.178.1655752441008; Mon, 20
 Jun 2022 12:14:01 -0700 (PDT)
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
 <CAGXv+5EEB1-jUgUo3HGTu9JgeD46Nuu1PuwO9PYfOKeR3csBbw@mail.gmail.com>
In-Reply-To: <CAGXv+5EEB1-jUgUo3HGTu9JgeD46Nuu1PuwO9PYfOKeR3csBbw@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 20 Jun 2022 21:13:49 +0200
Message-ID: <CAG3jFytBGCvLq6=qwB3xa-nnSLGzh6-fTgoSAGEeJ4p=GHY_tQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/bridge: anx7625: Use DPI bus type
To: Chen-Yu Tsai <wenst@chromium.org>
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

On Fri, 17 Jun 2022 at 12:32, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Hi,
>
> On Mon, May 23, 2022 at 4:37 PM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > On Mon, 23 May 2022 at 09:18, Chen-Yu Tsai <wenst@chromium.org> wrote:
> > >
> > > On Mon, May 23, 2022 at 11:13 AM Xin Ji <xji@analogixsemi.com> wrote:
> > > >
> > > > On Sat, May 21, 2022 at 06:28:42PM +0200, Daniel Vetter wrote:
> > > > > On Sat, 21 May 2022 at 18:07, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > >
> > > > > > On Tue, 17 May 2022 at 18:09, Robert Foss <robert.foss@linaro.org> wrote:
> > > > > > >
> > > > > > > On Mon, 25 Apr 2022 at 11:14, Xin Ji <xji@analogixsemi.com> wrote:
> > > > > > > >
> > > > > > > > On Mon, Apr 25, 2022 at 04:24:50PM +0800, Chen-Yu Tsai wrote:
> > > > > > > > > On Fri, Apr 22, 2022 at 10:13 PM Robert Foss <robert.foss@linaro.org> wrote:
> > > > > > > > > >
> > > > > > > > > > On Fri, 22 Apr 2022 at 16:01, Robert Foss <robert.foss@linaro.org> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Fri, 22 Apr 2022 at 10:49, Xin Ji <xji@analogixsemi.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > As V4L2_FWNODE_BUS_TYPE_PARALLEL not properly descript for DPI
> > > > > > > > > > > > interface, this patch use new defined V4L2_FWNODE_BUS_TYPE_DPI for it.
> > > > > > > > > > > >
> > > > > > > > > > > > Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> > > > > > > > > > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > > > > > > > > > ---
> > > > > > > > > > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
> > > > > > > > > > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > > > > > > > > > >
> > > > > > > > > > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > > > > > index 376da01243a3..71df977e8f53 100644
> > > > > > > > > > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > > > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > > > > > @@ -1623,14 +1623,14 @@ static int anx7625_parse_dt(struct device *dev,
> > > > > > > > > > > >
> > > > > > > > > > > >         anx7625_get_swing_setting(dev, pdata);
> > > > > > > > > > > >
> > > > > > > > > > > > -       pdata->is_dpi = 1; /* default dpi mode */
> > > > > > > > > > > > +       pdata->is_dpi = 0; /* default dsi mode */
> > > > > > > > > > > >         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> > > > > > > > > > > >         if (!pdata->mipi_host_node) {
> > > > > > > > > > > >                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> > > > > > > > > > > >                 return -ENODEV;
> > > > > > > > > > > >         }
> > > > > > > > > > > >
> > > > > > > > > > > > -       bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > > > > > > > > > > > +       bus_type = 0;
> > > > > > > > > > > >         mipi_lanes = MAX_LANES_SUPPORT;
> > > > > > > > > > > >         ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> > > > > > > > > > > >         if (ep0) {
> > > > > > > > > > > > @@ -1640,8 +1640,8 @@ static int anx7625_parse_dt(struct device *dev,
> > > > > > > > > > > >                 mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > > > > > > > > > > >         }
> > > > > > > > > > > >
> > > > > > > > > > > > -       if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> > > > > > > > > > > > -               pdata->is_dpi = 0;
> > > > > > > > > > > > +       if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
> > > > > > > > > > > > +               pdata->is_dpi = 1;
> > > > > > > > > > > >
> > > > > > > > > > > >         pdata->mipi_lanes = mipi_lanes;
> > > > > > > > > > > >         if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> > > > > > > > > > >
> > > > > > > > > > > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > > > > > > > > >
> > > > > > > > > > Acked-by: Robert Foss <robert.foss@linaro.org>
> > > > > > > > >
> > > > > > > > > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > > > > > >
> > > > > > > > > Confirmed this fixes the display on Juniper (Acer Chromebook Spin 311) on
> > > > > > > > > mainline (next-20220422).
> > > > > > > > >
> > > > > > > > > Xin, in the future, please send the whole series to all recipients of
> > > > > > > > > all patches listed by get_maintainers.pl, not just the recipients of
> > > > > > > > > each patch. In the case of this series, they should have been sent
> > > > > > > > > to all of the mailing lists (media, devicetree, dri-devel) so that
> > > > > > > > > everyone has the same, full view of the patches.
> > > > > > > > Hi ChenYu, OK, I'll send to all media, devicetree, dri-devel next time.
> > > > > > > > Thanks,
> > > > > > > > Xin
> > > > > > > > >
> > > > > > > > > ChenYu
> > > > > > >
> > > > > > > Applied 3/4 + 4/4 to drm-misc-next.
> > > > > >
> > > > > > This patch doesn't even compile. Can you pls fix this up asap? Also
> > > > > > pls compile-test before pushing ...
> > > > >
> > > > > Marek says the prerequisite landed through linux-media, and that's why
> > > > > it compilers on linux-next but not in drm-misc-next.
> > > > >
> > > > > Don't do that.
> > > > >
> > > > > Instead:
> > > > > - merge all patches through one branch, with the foreign patches acked
> > > > > for that merge patch
> > > > > - wait until you can backmerge all the dependencies
> > > > > - do a topic branch
> > > > >
> > > > > This probably needs to be reverted here and instead merged through
> > > > > linux-media. Or you wait until -rc1 and then apply it to
> > > > > drm-misc-next.
> > > > > -Daniel
> > > > Hi Daniel, I use git send-email to upstream patch and automatically
> > > > generated reviewer list, so patch 1/4 and 2/4 send to linux-media, and
> > > > these 2 patches already merged in linux-media.
> > >
> > > This is one of the reasons why you should always send the "full" series
> > > to all recipients. That way people, especially maintainers, are more
> > > likely to notice build time cross tree dependencies like this one, and
> > > work towards a common resolution.
> >
> > This mistake is mine, and I think the best solution is to revert 3+4 until rc1.
>
> I think we can reland the patches now?

Re-applied 3/4 + 4/4 to drm-misc-next.
