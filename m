Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0885F4CF1AC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 07:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F19E10EE34;
	Mon,  7 Mar 2022 06:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1623710EE49
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 06:12:56 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 6so8186622pgg.0
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Mar 2022 22:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nphVZGk3IRt95221bT7nfSyXQcqcrjz0Ux2hJDzPmMw=;
 b=ifi3tEd+jUJc9itlg1Xoweu6CKrVulnxsqqlasH2SskzDA+aIdNk7OLrpFeGdVti39
 ICRKw31jdbcyCePqW8r/u9kG021jyloq1SQ5LsyS6jm6YYfXPc4nzwpP+vjvkAj3QfQ6
 I8bKLZKELQ52QHAZQBYhCRqgAcKejZjKTfjC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nphVZGk3IRt95221bT7nfSyXQcqcrjz0Ux2hJDzPmMw=;
 b=Dw3UExNctCoah60U14H2xlxhbzUd3Y/gncRgsxofX6jQg3DCN78e6uItLfUZHSKsvO
 zxCYY2rSKNM4sGqcdcIAbNJ18zo6Oz2J4TILlGEj5/zFCh8YFHAZD8FgAs6NxTKkC/mu
 zgHChF0hPRvzVSnJdpcE/5lu4UQ+BqW1CNGqR4YwqbjlxewxsjYQjX7QCikAnWZrk+DI
 Tt1gbGg/i6x9/UmsqkOdIn0HVZCF+R1f+I36C2fnl5IBj6wV0uurlnju+eKvcf6rkOk8
 L97whayiW5x5kWaUu6VHbV5yZgaiD3fbi1TBIxm8r63hrmr6jt1lXX6wxAqL/Ab+0jYe
 oZMw==
X-Gm-Message-State: AOAM532nUvG183xyPNcAxizl+4OLb6I8pd4WnRCPGgHe8BvIdK2gPm9Q
 gtnXqSdNzjP7iHhqvTdCOC2VIFy8ceD2Lg==
X-Google-Smtp-Source: ABdhPJwbS4tHwgK4DS3o62V8oPKsTJMVUVN3CHN8/+075fpx4MAoYZjrJmfkAUcQfL8G/bf+YYFFhw==
X-Received: by 2002:a63:1c8:0:b0:380:189b:1e66 with SMTP id
 191-20020a6301c8000000b00380189b1e66mr5916458pgb.71.1646633575694; 
 Sun, 06 Mar 2022 22:12:55 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:40e5:90aa:d4b:2ad9])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a17090aa38600b001bce781ce03sm11488297pjp.18.2022.03.06.22.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 22:12:55 -0800 (PST)
Date: Mon, 7 Mar 2022 14:12:50 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH v12 3/4] drm/bridge: anx7625: add MIPI DPI input feature
Message-ID: <YiWiYpEfTOOqgyAN@google.com>
References: <20211105031904.2641088-1-xji@analogixsemi.com>
 <20211105031904.2641088-3-xji@analogixsemi.com>
 <YiTruiCIkyxs3jTC@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiTruiCIkyxs3jTC@pendragon.ideasonboard.com>
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
Cc: drinkcat@google.com, pihsun@chromium.org, jonas@kwiboo.se, airlied@linux.ie,
 bliang@analogixsemi.com, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 a.hajda@samsung.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 jernej.skrabec@gmail.com, hsinyi@chromium.org, qwen@analogixsemi.com,
 tzungbi@google.com, sam@ravnborg.org, Xin Ji <xji@analogixsemi.com>,
 dan.carpenter@oracle.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 06, 2022 at 07:13:30PM +0200, Laurent Pinchart wrote:
> Hello Xin,
> 
> (Question for Rob below, and I'm afraid this is urgent as we need to
> merge a fix in v5.17).
> 
> On Fri, Nov 05, 2021 at 11:19:03AM +0800, Xin Ji wrote:
> > The basic anx7625 driver only support MIPI DSI rx signal input.
> > This patch add MIPI DPI rx input configuration support, after apply
> > this patch, the driver can support DSI rx or DPI rx by adding
> > 'bus-type' in DT.
> > 
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 247 ++++++++++++++++------
> >  drivers/gpu/drm/bridge/analogix/anx7625.h |  18 +-
> >  2 files changed, 205 insertions(+), 60 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index f48e91134c20..f7c3386c8929 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c

[...]

> >  static int anx7625_parse_dt(struct device *dev,
> >  			    struct anx7625_platform_data *pdata)
> >  {
> > -	struct device_node *np = dev->of_node;
> > +	struct device_node *np = dev->of_node, *ep0;
> >  	struct drm_panel *panel;
> >  	int ret;
> > +	int bus_type, mipi_lanes;
> > +
> > +	anx7625_get_swing_setting(dev, pdata);
> >  
> > +	pdata->is_dpi = 1; /* default dpi mode */
> >  	pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> >  	if (!pdata->mipi_host_node) {
> >  		DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> >  		return -ENODEV;
> >  	}
> >  
> > -	DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
> > +	bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > +	mipi_lanes = MAX_LANES_SUPPORT;
> > +	ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> > +	if (ep0) {
> > +		if (of_property_read_u32(ep0, "bus-type", &bus_type))
> > +			bus_type = 0;
> > +
> > +		mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > +	}
> > +
> > +	if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> 
> This is not correct *at all*. V4L2_FWNODE_BUS_TYPE_PARALLEL has nothing
> to do with DSI. DSI stands for Digital *Serial* Interface. If anything,
> the V4L2_FWNODE_BUS_TYPE_PARALLEL type would map better to DPI, even if
> it's not an exact match.
> 
> This patch has landed in v5.17-rc1, along with the corresponding
> bindings. As DT bindings are an ABI, we should really fix this before
> v5.17 is released. There is no DSI bus types defined in DT, and adding
> one as a fix so late in the v5.17-rc cycle seems a bit of a stretch to
> me (unless Rob disagrees).
> 
> It would seem best to revert this series and the corresponding bindings,
> and retry in v5.18.

There is a DT patch using this property that is already queued up for 5.17
in the soc tree:

https://lore.kernel.org/all/20220214200507.2500693-1-nfraprado@collabora.com/

merged here:

http://git.kernel.org/soc/soc/c/32568ae37596b529628ac09b875f4874e614f63f

We will need to revert that one as well.

ChenYu
