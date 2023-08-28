Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E4878AED5
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 13:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278A210E297;
	Mon, 28 Aug 2023 11:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB1110E297
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 11:29:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90E004E6;
 Mon, 28 Aug 2023 13:27:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693222070;
 bh=Z2yGqZnWmLRCLstxt4PFV4RmzJjPF4lqtqgp9OWLgFQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HAcQqvKrMafzD5Ty19d4NOXGtaVkvI6zyhMIVTdLrRoRPd35eTodKu2gM3QlEk02H
 n0MPGm6g1Q3exE/VCb/CiF3Ihb8awF/TK5yWyMJsyZaS3afCCye0srf7jNtVvI69ar
 HqaabJjg9rss8n/Ur6giJvmY67+N9wfpXMTNd4+c=
Date: Mon, 28 Aug 2023 14:29:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 2/2] drm/bridge: Drop conditionals around of_node
 pointers
Message-ID: <20230828112921.GJ14596@pendragon.ideasonboard.com>
References: <20230826071901.29420-1-biju.das.jz@bp.renesas.com>
 <20230826071901.29420-3-biju.das.jz@bp.renesas.com>
 <ZOyCLijP4fb6zxKn@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZOyCLijP4fb6zxKn@smile.fi.intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 28, 2023 at 02:17:02PM +0300, Andy Shevchenko wrote:
> On Sat, Aug 26, 2023 at 08:19:01AM +0100, Biju Das wrote:
> > Having conditional around the of_node pointers turns out to make driver
> > code use ugly #ifdef and #if blocks. So drop the conditionals.
> 
> ...
> 
> > -#ifdef CONFIG_OF
> >  	/** @of_node: device node pointer to the bridge */
> >  	struct device_node *of_node;
> > -#endif
> 
> This simply has to be struct fwnode_handle to begin with.
> Can you convert the driver to use it?

While that's possibly a good idea, it will require touching all the
bridge drivers that set this field, so I think it could be done
separately.

-- 
Regards,

Laurent Pinchart
