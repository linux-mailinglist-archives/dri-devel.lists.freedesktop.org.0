Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBBB24C0DD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 16:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FB16E542;
	Thu, 20 Aug 2020 14:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32CC6E542
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 14:48:16 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B6D2820026;
 Thu, 20 Aug 2020 16:48:09 +0200 (CEST)
Date: Thu, 20 Aug 2020 16:48:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 00/49] DRM driver for Hikey 970
Message-ID: <20200820144808.GA186324@ravnborg.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
 <20200819152120.GA106437@ravnborg.org>
 <20200819174027.70b39ee9@coco.lan>
 <20200819173558.GA3733@ravnborg.org>
 <20200820160649.54741194@coco.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200820160649.54741194@coco.lan>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=FQPn5FuWFEp6BKnZ598A:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Wanchun Zheng <zhengwanchun@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 devel@driverdev.osuosl.org, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Wei Xu <xuwei5@hisilicon.com>,
 David Airlie <airlied@linux.ie>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>, Jakub Kicinski <kuba@kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Liwei Cai <cailiwei@hisilicon.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Alexei Starovoitov <ast@kernel.org>, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>, mauro.chehab@huawei.com,
 Rob Clark <robdclark@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liuyao An <anliuyao@huawei.com>, netdev@vger.kernel.org,
 Rongrong Zou <zourongrong@gmail.com>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro.

On Thu, Aug 20, 2020 at 04:06:49PM +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 19 Aug 2020 19:35:58 +0200
> Sam Ravnborg <sam@ravnborg.org> escreveu:
> 
> I'm already handling the other comments from your review (I'll send a
> more complete comment about them after finishing),
If you get back only on things you do not understand or do not agree on
that would be fine. The rest should be visible in the changelog on the
updated patch - no need to do extra work here.

> but I have a doubt what you meant about this:
> 
> > +static int kirin_drm_bind(struct device *dev)
> > > +{
> > > +	struct drm_driver *driver = &kirin_drm_driver;
> > > +	struct drm_device *drm_dev;
> > > +	struct kirin_drm_private *priv;
> > > +	int ret;
> > > +
> > > +	drm_dev = drm_dev_alloc(driver, dev);
> > > +	if (!drm_dev)
> > > +		return -ENOMEM;
> > > +
> > > +	ret = kirin_drm_kms_init(drm_dev);
> > > +	if (ret)
> > > +		goto err_drm_dev_unref;
> > > +
> > > +	ret = drm_dev_register(drm_dev, 0);  
> > There is better ways to do this. See drm_drv.c for the code example.
> 
> Not sure if I understood your comment here. The drm_drv.c example also calls 
> drm_dev_register().

This is indeed not obvious from my comments but what I wnated to say is
that the driver should embed drm_device in some struct,
maybe in "struct kirin_drm_private".

This should also be part of the referenced example.

I hope this clarifies it.

	Sam

> 
> The only difference is that it calls it inside driver_probe(), while
> on this driver, it uses:
> 
> 	static const struct component_master_ops kirin_drm_ops = {
> 		.bind = kirin_drm_bind,
> 		.unbind = kirin_drm_unbind,
> 	};
> 
> 	static int kirin_drm_platform_probe(struct platform_device *pdev)
> 	{
> ...
> 		drm_of_component_match_add(dev, &match, compare_of, remote);
> ...
> 	return component_master_add_with_match(dev, &kirin_drm_ops, match);
> }
> 
> Are you meaning that I should get rid of this component API and call
> kirin_drm_bind() from kirin_drm_platform_probe()?
> 
> Thanks,
> Mauro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
