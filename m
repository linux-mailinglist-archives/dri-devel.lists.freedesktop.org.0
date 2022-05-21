Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C0152FE1B
	for <lists+dri-devel@lfdr.de>; Sat, 21 May 2022 18:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D631510E061;
	Sat, 21 May 2022 16:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E154C10E061
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 16:28:53 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id q8so13179910oif.13
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 09:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oK1yB+pWX7DUbSOpiHUXdRbl5cSW3whx4lZdoBBpZGI=;
 b=UrqSD+LVWpiMGbElInA4v1zLlY3zz44S8My+BazS33dvc4USn2c/ACJivVLw21vW59
 8tcYf2szyzOj5GjVLttevS5n+e2k7DtbJ5OHAGJ8NqfuwDOqtJhB9RSQnh9LeV5FuIid
 DBCRdv47mdQhwfLitq4LgbXd3yizYz5n1gG0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oK1yB+pWX7DUbSOpiHUXdRbl5cSW3whx4lZdoBBpZGI=;
 b=6Dfsmeqqq53q/IS8FK2fKG3e+tPmqlyqdBO5NVOHJCzXgz45BudWW8JrXNqkutYtMM
 igsAmHfsc2CyRRjS+XMf+sIUquwL09kzRO5vn+XqOO7JXuBy0V4DK2UXZ9OyjbfDXBhe
 wE4KDaDfDUQYvNEcFodarraa0xEwqH1k3ug37JNO6sKICyBBbkVxSSXZnKKmuMYsj7vP
 IGcvyeyGWxbesH5eoU3Vf6LQjATMZf5nPgGyDrsdHcP2CTptna8l7vZx2C1+eA6d47Iy
 DlHDC33lCXAViE3XQQhdvGJAECEqhrpHPtSpFgR/W/ALtvJZPqRgb8+dNXIL5lxTp3MG
 yKuA==
X-Gm-Message-State: AOAM531ilU1K3JYTyR8aMSql0WJiwPoPFpZCUTNDfrSXSdbJZZ1LdtyC
 xPa1BzVQ0K+eHk5ATzCF1fms1BfIMArNqUjLm56biA==
X-Google-Smtp-Source: ABdhPJwjzViPzNj+UQE/C64zn+ilBV2EKusiLYfvuHVAdSNoX/9mTgUSq3Zi0TP0zUvswqDoY3TGHCLcMRNQuEz5lBY=
X-Received: by 2002:a05:6808:2181:b0:326:901e:f5e7 with SMTP id
 be1-20020a056808218100b00326901ef5e7mr8641168oib.7.1653150533098; Sat, 21 May
 2022 09:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220422084720.959271-1-xji@analogixsemi.com>
 <20220422084720.959271-4-xji@analogixsemi.com>
 <CAG3jFytWGSUM9mevHewdmEe-hq3JgB74s7_f0fsEQqkXr9VUHg@mail.gmail.com>
 <CAG3jFyvEYbwkdGtiNR-6vFEXTLjcyT_viqp9qeVxFTu0PrJEVA@mail.gmail.com>
 <CAGXv+5E1cCNWD98fMDjC38y2UztZd=PNQ+=G=wrBYfoXkswvHA@mail.gmail.com>
 <20220425091419.GA967110@anxtwsw-Precision-3640-Tower>
 <CAG3jFyvTim7P_y2G1Br5j3Pwz4KzvRjWgci_qQ3m_YW=3Bog8A@mail.gmail.com>
 <CAKMK7uFHyYTnGtP+vCzo2Uan90DW-QZpPFPn5S9bQ5aPiY=qzA@mail.gmail.com>
In-Reply-To: <CAKMK7uFHyYTnGtP+vCzo2Uan90DW-QZpPFPn5S9bQ5aPiY=qzA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 21 May 2022 18:28:42 +0200
Message-ID: <CAKMK7uHFGsPMZf2SUF4HDXo3XuOLjP3-DLfyp=gB2qpKR964Eg@mail.gmail.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 qwen@analogixsemi.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 bliang@analogixsemi.com, Xin Ji <xji@analogixsemi.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 21 May 2022 at 18:07, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, 17 May 2022 at 18:09, Robert Foss <robert.foss@linaro.org> wrote:
> >
> > On Mon, 25 Apr 2022 at 11:14, Xin Ji <xji@analogixsemi.com> wrote:
> > >
> > > On Mon, Apr 25, 2022 at 04:24:50PM +0800, Chen-Yu Tsai wrote:
> > > > On Fri, Apr 22, 2022 at 10:13 PM Robert Foss <robert.foss@linaro.org> wrote:
> > > > >
> > > > > On Fri, 22 Apr 2022 at 16:01, Robert Foss <robert.foss@linaro.org> wrote:
> > > > > >
> > > > > > On Fri, 22 Apr 2022 at 10:49, Xin Ji <xji@analogixsemi.com> wrote:
> > > > > > >
> > > > > > > As V4L2_FWNODE_BUS_TYPE_PARALLEL not properly descript for DPI
> > > > > > > interface, this patch use new defined V4L2_FWNODE_BUS_TYPE_DPI for it.
> > > > > > >
> > > > > > > Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> > > > > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
> > > > > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > index 376da01243a3..71df977e8f53 100644
> > > > > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > @@ -1623,14 +1623,14 @@ static int anx7625_parse_dt(struct device *dev,
> > > > > > >
> > > > > > >         anx7625_get_swing_setting(dev, pdata);
> > > > > > >
> > > > > > > -       pdata->is_dpi = 1; /* default dpi mode */
> > > > > > > +       pdata->is_dpi = 0; /* default dsi mode */
> > > > > > >         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> > > > > > >         if (!pdata->mipi_host_node) {
> > > > > > >                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> > > > > > >                 return -ENODEV;
> > > > > > >         }
> > > > > > >
> > > > > > > -       bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > > > > > > +       bus_type = 0;
> > > > > > >         mipi_lanes = MAX_LANES_SUPPORT;
> > > > > > >         ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> > > > > > >         if (ep0) {
> > > > > > > @@ -1640,8 +1640,8 @@ static int anx7625_parse_dt(struct device *dev,
> > > > > > >                 mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > > > > > >         }
> > > > > > >
> > > > > > > -       if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> > > > > > > -               pdata->is_dpi = 0;
> > > > > > > +       if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
> > > > > > > +               pdata->is_dpi = 1;
> > > > > > >
> > > > > > >         pdata->mipi_lanes = mipi_lanes;
> > > > > > >         if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> > > > > >
> > > > > > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > > > >
> > > > > Acked-by: Robert Foss <robert.foss@linaro.org>
> > > >
> > > > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > > >
> > > > Confirmed this fixes the display on Juniper (Acer Chromebook Spin 311) on
> > > > mainline (next-20220422).
> > > >
> > > > Xin, in the future, please send the whole series to all recipients of
> > > > all patches listed by get_maintainers.pl, not just the recipients of
> > > > each patch. In the case of this series, they should have been sent
> > > > to all of the mailing lists (media, devicetree, dri-devel) so that
> > > > everyone has the same, full view of the patches.
> > > Hi ChenYu, OK, I'll send to all media, devicetree, dri-devel next time.
> > > Thanks,
> > > Xin
> > > >
> > > > ChenYu
> >
> > Applied 3/4 + 4/4 to drm-misc-next.
>
> This patch doesn't even compile. Can you pls fix this up asap? Also
> pls compile-test before pushing ...

Marek says the prerequisite landed through linux-media, and that's why
it compilers on linux-next but not in drm-misc-next.

Don't do that.

Instead:
- merge all patches through one branch, with the foreign patches acked
for that merge patch
- wait until you can backmerge all the dependencies
- do a topic branch

This probably needs to be reverted here and instead merged through
linux-media. Or you wait until -rc1 and then apply it to
drm-misc-next.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
