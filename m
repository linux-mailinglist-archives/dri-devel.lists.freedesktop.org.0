Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 877E924AF5B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 08:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2516E8B1;
	Thu, 20 Aug 2020 06:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA76E6E8B1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 06:40:40 +0000 (UTC)
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D847220786;
 Thu, 20 Aug 2020 06:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597905640;
 bh=smEfryQX4LpVGJzthIRWac0/v0EWxUcxXXFygmlh3ss=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uVpRlkTA4U4rKgGuZwZCNYKjnVf9jx9QyQlWzioyqxEFKFORZR+nmJ3A1W5F4jif/
 BJYtLKuGsdnPxO5hTUeXwINInbRp8ypXBnFZxS/ysUVhzONji7yUZ2lF5OFSGgTyUY
 312IwaWgMhztAUA9bEhtGh6dl9ki8qovoCmm2Kpk=
Date: Thu, 20 Aug 2020 08:40:30 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 00/49] DRM driver for Hikey 970
Message-ID: <20200820084030.3663de78@coco.lan>
In-Reply-To: <20200819212551.GA114762@ravnborg.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
 <CALAqxLVRsPKv-xmxQfBFaBa9XOmSfrFj3w9_zyfzNJk8+Kfjug@mail.gmail.com>
 <20200819212551.GA114762@ravnborg.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
 driverdevel <devel@driverdev.osuosl.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Wei Xu <xuwei5@hisilicon.com>,
 David Airlie <airlied@linux.ie>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 linux-media <linux-media@vger.kernel.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Liwei Cai <cailiwei@hisilicon.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Alexei Starovoitov <ast@kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 mauro.chehab@huawei.com, Rob Clark <robdclark@chromium.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 lkml <linux-kernel@vger.kernel.org>, Liuyao An <anliuyao@huawei.com>,
 Network Development <netdev@vger.kernel.org>,
 Rongrong Zou <zourongrong@gmail.com>, BPF Mailing List <bpf@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Wed, 19 Aug 2020 23:25:51 +0200
Sam Ravnborg <sam@ravnborg.org> escreveu:

> Hi John.
> 
> > > So, IMO, the best is to keep it on staging for a while, until those
> > > remaining bugs gets solved.  
> > 
> > I'm not sure I see all of these as compelling for pushing it in via
> > staging. And I suspect in the process of submitting the patches for
> > review folks may find the cause of some of the problems you list here.  
> 
> There is a tendency to forget drivers in staging, and with the almost
> constant refactoring that happens in the drm drivers we would end up
> fixing this driver when a bot trigger an error.
> So IMO we need very good reasons to go in via staging.

My plan is to have this driver upstream for 5.10, and getting it
out of staging by Kernel 5.11. So, I doubt that the DRM kAPIs would
change a lot during those 2 Kernel cycles.

In any case, I'm also fine to have a final patch at the end of this
series moving it out of staging. The only thing that, IMHO, prevents
it to be out of staging is the LDI underflow. Right now, if no input
events reach the driver, DPMS will put the monitor to suspend, and
it never returns back from life. I bet that, once we discover the
root cause, the fix would be just a couple of lines, but identifying
where the problem is can take a while.

Thanks,
Mauro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
