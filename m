Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9A624AF85
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B4E6E8AC;
	Thu, 20 Aug 2020 07:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C716E8AC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 07:03:37 +0000 (UTC)
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D65C20738;
 Thu, 20 Aug 2020 07:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597907017;
 bh=rxLdO7cakOHvaDBZxCktkD2vNW5pXxH+L8dnLiX+3l0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZqoFqS0Qk5EvC6CMaAigGknwQX73VDCtk2GLWe6mI2YG3xO28JIlb4JiNpLdRRVN9
 bYuy9Uqckq5vYNH22NQGflnygdTrodblOQ8XYx5iE+rBj05fEeWdD5XeV6ZzhjYIvj
 OD4L++Wn3c+kTd2qDyL5dNQdO1HmnIJgomtu35bc=
Date: Thu, 20 Aug 2020 09:03:26 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH 00/49] DRM driver for Hikey 970
Message-ID: <20200820090326.3f400a15@coco.lan>
In-Reply-To: <CALAqxLUXnPRec3UYbMKge8yNKBagLOatOeRCagF=JEyPEfWeKA@mail.gmail.com>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
 <20200819152120.GA106437@ravnborg.org>
 <20200819153045.GA18469@pendragon.ideasonboard.com>
 <CALAqxLUXnPRec3UYbMKge8yNKBagLOatOeRCagF=JEyPEfWeKA@mail.gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Wanchun Zheng <zhengwanchun@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, driverdevel <devel@driverdev.osuosl.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Wei Xu <xuwei5@hisilicon.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>, Jakub Kicinski <kuba@kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 linux-media <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Liwei Cai <cailiwei@hisilicon.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Alexei Starovoitov <ast@kernel.org>, "moderated
 list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Rob Herring <robh+dt@kernel.org>, mauro.chehab@huawei.com,
 Rob Clark <robdclark@chromium.org>,
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

Em Wed, 19 Aug 2020 12:52:06 -0700
John Stultz <john.stultz@linaro.org> escreveu:

> On Wed, Aug 19, 2020 at 8:31 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Wed, Aug 19, 2020 at 05:21:20PM +0200, Sam Ravnborg wrote:  
> > > On Wed, Aug 19, 2020 at 01:45:28PM +0200, Mauro Carvalho Chehab wrote:  
> > > > This patch series port the out-of-tree driver for Hikey 970 (which
> > > > should also support Hikey 960) from the official 96boards tree:
> > > >
> > > >    https://github.com/96boards-hikey/linux/tree/hikey970-v4.9
> > > >
> > > > Based on his history, this driver seems to be originally written
> > > > for Kernel 4.4, and was later ported to Kernel 4.9. The original
> > > > driver used to depend on ION (from Kernel 4.4) and had its own
> > > > implementation for FB dev API.
> > > >
> > > > As I need to preserve the original history (with has patches from
> > > > both HiSilicon and from Linaro),  I'm starting from the original
> > > > patch applied there. The remaining patches are incremental,
> > > > and port this driver to work with upstream Kernel.
> > > >  
> ...
> > > > - Due to legal reasons, I need to preserve the authorship of
> > > >   each one responsbile for each patch. So, I need to start from
> > > >   the original patch from Kernel 4.4;  
> ...
> > > I do acknowledge you need to preserve history and all -
> > > but this patchset is not easy to review.  
> >
> > Why do we need to preserve history ? Adding relevant Signed-off-by and
> > Co-developed-by should be enough, shouldn't it ? Having a public branch
> > that contains the history is useful if anyone is interested, but I don't
> > think it's required in mainline.  
> 
> Yea. I concur with Laurent here. I'm not sure what legal reasoning you
> have on this but preserving the "absolute" history here is actively
> detrimental for review and understanding of the patch set.
> 
> Preserving Authorship, Signed-off-by lines and adding Co-developed-by
> lines should be sufficient to provide both atribution credit and DCO
> history.

I'm not convinced that, from legal standpoint, folding things would
be enough. See, there are at least 3 legal systems involved here
among the different patch authors:

	- civil law;
	- common law;
	- customary law + common law.

Merging stuff altogether from different law systems can be problematic,
and trying to discuss this with experienced IP property lawyers will
for sure take a lot of time and efforts. I also bet that different
lawyers will have different opinions, because laws are subject to 
interpretation. With that matter I'm not aware of any court rules 
with regards to folded patches. So, it sounds to me that folding 
patches is something that has yet to be proofed in courts around
the globe.

At least for US legal system, it sounds that the Country of
origin of a patch is relevant, as they have a concept of
"national technology" that can be subject to export regulations.

From my side, I really prefer to play safe and stay out of any such
legal discussions.

Thanks,
Mauro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
