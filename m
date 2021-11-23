Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B06DB45A353
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 13:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9656F977;
	Tue, 23 Nov 2021 12:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538FE6F977;
 Tue, 23 Nov 2021 12:51:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57D3560F9F;
 Tue, 23 Nov 2021 12:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637671898;
 bh=wIrWQf7YDEFEE/QQ99FQt/AhMw3wdmvSFHVUP3uKPJM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QGkZLrvRZ8KTMwcjmn6QaI1qSGzu+DoXhu8PQwdm/+cC5pDtmTATs6POIbgvzvvxo
 dvx+KAr/Q+u+JS9xVPk6U+7MmUsBqP+41x4NGLkHYCxIDvlSTvBzSwwSfjybOfj2nq
 TWRsQoUsqmsGmFLBAmPGIX/fzXnDaxy9cZciaQXE+GdZ9Q0gggepiKZXZcNrbqfcrR
 nHkhXzC+DvQ0+sPze3evyAcW6a63+vYer0kxBjG7JGzCBaYsm5sgS1HDHOjsFSlWxO
 c9lRiHDTKp2sG2VkVB8n9OMhlpaRH11oqA5Gp/3+CBjyqqPEmeO+zBNBu7sa5kiK9F
 SG13871QjbYqQ==
Date: Tue, 23 Nov 2021 20:51:08 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH bpf] treewide: add missing includes masked by cgroup ->
 bpf dependency
Message-ID: <20211123125108.GA4453@Peter>
References: <20211120035253.72074-1-kuba@kernel.org>
 <20211120073011.GA36650@Peter>
 <20211120072602.22f9e722@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211120072602.22f9e722@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
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
Cc: kw@linux.com, songliubraving@fb.com, kafai@fb.com, airlied@linux.ie,
 linux-pci@vger.kernel.org, ast@kernel.org, dri-devel@lists.freedesktop.org,
 andrii@kernel.org, a-govindraju@ti.com, ray.huang@amd.com, sbhatta@marvell.com,
 lorenzo.pieralisi@arm.com, daniel@iogearbox.net,
 krzysztof.kozlowski@canonical.com, john.fastabend@gmail.com,
 geert@linux-m68k.org, matthew.auld@intel.com, yhs@fb.com, sgoutham@marvell.com,
 thomas.hellstrom@linux.intel.com, pawell@cadence.com, tzimmermann@suse.de,
 mani@kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, kpsingh@kernel.org, rogerq@kernel.org,
 linux-samsung-soc@vger.kernel.org, rodrigo.vivi@intel.com, bhelgaas@google.com,
 sean@poorly.run, akpm@linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, axboe@kernel.dk,
 linux-block@vger.kernel.org, sj@kernel.org, lima@lists.freedesktop.org,
 linux-mm@kvack.org, jingoohan1@gmail.com, linux-usb@vger.kernel.org,
 christian.koenig@amd.com, hkelam@marvell.com, yuq825@gmail.com,
 gregkh@linuxfoundation.org, bpf@vger.kernel.org, colin.king@intel.com,
 freedreno@lists.freedesktop.org, gakula@marvell.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21-11-20 07:26:02, Jakub Kicinski wrote:
> On Sat, 20 Nov 2021 15:30:11 +0800 Peter Chen wrote:
> > > diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
> > > index 84dadfa726aa..9643b905e2d8 100644
> > > --- a/drivers/usb/cdns3/host.c
> > > +++ b/drivers/usb/cdns3/host.c
> > > @@ -10,6 +10,7 @@
> > >   */
> > >  
> > >  #include <linux/platform_device.h>
> > > +#include <linux/slab.h>  
> > 
> > Should be "#include <linux/module.h>"?
> 
> Why? Different files are missing different includes, this one needs
> slab.h:
> 
> ../drivers/usb/cdns3/host.c: In function ‘__cdns_host_init’:
> ../drivers/usb/cdns3/host.c:86:2: error: implicit declaration of function ‘kfree’; did you mean ‘vfree’? [-Werror=implicit-function-declaration]
>   kfree(cdns->xhci_plat_data);
>   ^~~~~
>   vfree

Oh, my fault.

Acked-by: Peter Chen <peter.chen@kernel.org>

-- 

Thanks,
Peter Chen

