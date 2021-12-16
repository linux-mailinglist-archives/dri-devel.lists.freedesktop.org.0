Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 843874766ED
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 01:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E12910E2CC;
	Thu, 16 Dec 2021 00:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DA810E2CC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 00:24:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A6173F6;
 Thu, 16 Dec 2021 01:24:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1639614275;
 bh=jluRvkznhFHQAEudwl6chNVc4AtO829dsSTMAFxI34o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cviJ20aoht5w/BMK49EwlMpGgioG0ErkirGWvjTxg0fDBDNJcRre7ulVmKEVzBYii
 wQlZIlVvsOhBvhNCQoah91L4MF+KINUFx129SgaGMssdrgDAqk2iZyE6qAxlMMDjSm
 gmjQZN3KylbyHCYzrmYFjaAi4Ut+Ggv6xhcWlqGU=
Date: Thu, 16 Dec 2021 02:24:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 00/60] drm: Make all drivers to honour the nomodeset
 parameter
Message-ID: <YbqHQAFtwvTvYddZ@pendragon.ideasonboard.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
 <Ybp7qDs1p3x5GzNJ@pendragon.ideasonboard.com>
 <91c6b455-62cd-cec7-8445-e93c99230a03@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <91c6b455-62cd-cec7-8445-e93c99230a03@redhat.com>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Edmund Dea <edmund.j.dea@intel.com>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 Paul Cercueil <paul@crapouillou.net>, Tomi Valkeinen <tomba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Vasut <marex@denx.de>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, Joel Stanley <joel@jms.id.au>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Qiang Yu <yuq825@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Lechner <david@lechnology.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Alison Wang <alison.wang@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Tian Tao <tiantao6@hisilicon.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Thu, Dec 16, 2021 at 01:13:56AM +0100, Javier Martinez Canillas wrote:
> Hello Laurent,
> 
> On 12/16/21 00:35, Laurent Pinchart wrote:
> 
> [snip]
> 
> >>
> >> I've built tested with 'make allmodconfig && make M=drivers/gpu/drm/', but
> >> only booted in a few devices with and without nomodeset in the cmdline. So
> >> testing and reviewing for all the drivers would be highly appreciated.
> > 
> > The fact that the series is so big makes me think it would be better to
> > handle this in the DRM core. Is there any way we could do so ? Otherwise
> > we'll chase this issue forever in new drivers, and will be plagued with
> > cargo cult problems.
> > 
> 
> Yes, what Thomas suggested is to add a set of drm_module_{pci,platform}_driver()
> macros in include/drm/drm_drv.h, that will just check whether the driver should
> be registered or not and call the {pci,platform}_register_driver() functions.
> 
> That way the change in the drivers would just be something like the following:
> 
> -module_platform_driver(malidp_platform_driver);
> +drm_module_platform_driver(malidp_platform_driver);
> 
> There are some drivers that still need a custom module init functions for various
> reasons (e.g: register a set of devices/drivers, need to be a late init call, etc)
> but at least for most drivers this should be handled transparently as long as they
> use these drm_*_register_driver() macros.

Another option could be to return an error from drm_dev_alloc(). That
may avoid changes in the drivers.

> So just ignore this series and I'll post a v2 soon.

-- 
Regards,

Laurent Pinchart
