Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B78A690213
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 09:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5507C10E0C1;
	Thu,  9 Feb 2023 08:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F92B10E0C1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 08:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675931113; x=1707467113;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AZG4nt/NF5XD1bCU1D1DTXwVLKlPtu8KECtv/J/wG8I=;
 b=BVxxHS2dktiNil9i1y0nsb//Iw/FkXoDEX3Yc2MbdssEx//YwIFVicbh
 9P1bSsbeI1G3SYjLZbmm16EhmW6/dqnWnpiVDoBEID71o2/BCCz9hlQc/
 pMp2eN5lHcKaj+31+4aYBbGl5B0PdshY5fhKrQ/zN5vvVHUvJp1n6BVig
 ft3SgChYMWZguQ5lOGqNSZZMywWydCUM1GaOaBa1pxAbDE0map0KSaNZD
 INfObculeLYB+87xFv41Tj+ewS2ZyPhqbWGhTzpuTxWIakAaA+a9wlKYl
 4frTmll1mrstfWo0It38JjjrLcH44bnzarlZttm9LaMR0iK2pftRObgyt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="416272827"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; d="scan'208";a="416272827"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 00:25:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="913055567"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; d="scan'208";a="913055567"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 00:25:01 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id 3D16811FADB;
 Thu,  9 Feb 2023 10:24:59 +0200 (EET)
Date: Thu, 9 Feb 2023 10:24:59 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v11 1/9] device property: Add remote endpoint to devcon
 matcher
Message-ID: <Y+St24gfyhb4VWPT@kekkonen.localdomain>
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-2-treapking@chromium.org>
 <Y+AbhnfJvScvHTGY@kekkonen.localdomain>
 <CAEXTbpf-s8NQKwSxhe=cO-KO=TTSXFznm=1J-ikhc558M6brdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEXTbpf-s8NQKwSxhe=cO-KO=TTSXFznm=1J-ikhc558M6brdQ@mail.gmail.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pin-yen,

On Thu, Feb 09, 2023 at 12:28:33PM +0800, Pin-yen Lin wrote:
> Hi Sakari,
> 
> Thanks for the review.
> 
> On Mon, Feb 6, 2023 at 5:11 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Pin-yen,
> >
> > On Sat, Feb 04, 2023 at 09:30:32PM +0800, Pin-yen Lin wrote:
> > > From: Prashant Malani <pmalani@chromium.org>
> > >
> > > When searching the device graph for device matches, check the
> > > remote-endpoint itself for a match.
> > >
> > > Some drivers register devices for individual endpoints. This allows
> > > the matcher code to evaluate those for a match too, instead
> > > of only looking at the remote parent devices. This is required when a
> > > device supports two mode switches in its endpoints, so we can't simply
> > > register the mode switch with the parent node.
> > >
> > > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > Thanks for the update.
> >
> > I intended to give my Reviewed-by: but there's something still needs to be
> > addressed. See below.
> >
> > >
> > > ---
> > >
> > > Changes in v11:
> > > - Added missing fwnode_handle_put in drivers/base/property.c
> > >
> > > Changes in v10:
> > > - Collected Reviewed-by and Tested-by tags
> > >
> > > Changes in v6:
> > > - New in v6
> > >
> > >  drivers/base/property.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > > diff --git a/drivers/base/property.c b/drivers/base/property.c
> > > index 2a5a37fcd998..e6f915b72eb7 100644
> > > --- a/drivers/base/property.c
> > > +++ b/drivers/base/property.c
> > > @@ -1223,6 +1223,22 @@ static unsigned int fwnode_graph_devcon_matches(struct fwnode_handle *fwnode,
> > >                       break;
> > >               }
> > >
> > > +             /*
> > > +              * Some drivers may register devices for endpoints. Check
> > > +              * the remote-endpoints for matches in addition to the remote
> > > +              * port parent.
> > > +              */
> > > +             node = fwnode_graph_get_remote_endpoint(ep);
> >
> > Here fwnode_graph_get_remote_endpoint() returns an endpoint...
> >
> > > +             if (fwnode_device_is_available(node)) {
> >
> > and you're calling fwnode_device_is_available() on the endpoint node, which
> > always returns true.
> >
> > Shouldn't you call this on the device node instead? What about match()
> > below?
> 
> Yes we should have checked the availability on the device node itself
> instead of the endpoint node. But regarding the match() call, we need
> to call it with the endpoint node because that's where we put the
> "mode-switch" properties and register the mode switches on. We can't
> use the device node because we want to register two mode switches for
> the same device node.

Ok.

I think it should be documented for both fwnode_connection_find_match() and
fwnode_connection_find_matches() may then be also called with the endpoint
node.

-- 
Regards,

Sakari Ailus
