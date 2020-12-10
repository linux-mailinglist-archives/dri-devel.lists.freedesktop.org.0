Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5962D6AD5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 23:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83626E4E3;
	Thu, 10 Dec 2020 22:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7613E6E4E3;
 Thu, 10 Dec 2020 22:56:35 +0000 (UTC)
X-Gm-Message-State: AOAM533WuQgWtuuWt4RhF9ADZRFHVPsx3PfNKDh65zoMcMiNIXol36IE
 mC1TSr47CY6xE+/EtYAi1dQHgCPAWqmny8msNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607640995;
 bh=HILNalL3GlPRV+ztE2WnCsMQWzjgnQh5F8d+VjxfhHA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DkCyyeuvJy4iU5hGrhY5rvXdNF/XDEltkcaXCK6XvpomHZn/eMfi17cIpcRiI5UTN
 kSgVM0+4jjhPCNQ75+n/cgaon9liXs7woUDnE8yttzk1aQDmv4io7aucoYzyAtdNG0
 I2wUawkxulB5pG6A0oOdXuJ1alyYKqoFx6TvAWl9grEpRA2evfntb2Y6XvyL5UXgjx
 TzZURk/yteTpMNwsMgcPKMcKwqol/ljrllpmoEMc4onPQTbPEpHiroGdwkcCe99aWN
 MqaDFHEFOoTW4rWfDNURprjhGlC5XlkkOBsq9Gva6ntmAVZmR6ksXaR9lV2TA1APi2
 jOgUDjBhrO9bg==
X-Google-Smtp-Source: ABdhPJxCdEkGcUPgqgCmU+hGdc9mjJz2mo+m7nRBlZJj4NBRvD8ZfcoTXioyfo8/Gn48VrKyiwGC/1HmZUK4DbzvCWk=
X-Received: by 2002:a17:906:d784:: with SMTP id
 pj4mr8261525ejb.360.1607640993261; 
 Thu, 10 Dec 2020 14:56:33 -0800 (PST)
MIME-Version: 1.0
References: <20201210192536.118432146@linutronix.de>
 <20201210194044.364211860@linutronix.de>
In-Reply-To: <20201210194044.364211860@linutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Thu, 10 Dec 2020 16:56:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKCGkyk9whiGQ0hPyWjSYXnC-TSbot85k7=bwVd0rwC=A@mail.gmail.com>
Message-ID: <CAL_JsqKCGkyk9whiGQ0hPyWjSYXnC-TSbot85k7=bwVd0rwC=A@mail.gmail.com>
Subject: Re: [patch 18/30] PCI: xilinx-nwl: Use irq_data_get_irq_chip_data()
To: Thomas Gleixner <tglx@linutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev <netdev@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-s390@vger.kernel.org,
 afzal mohammed <afzal.mohd.ma@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, xen-devel@lists.xenproject.org,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 PCI <linux-pci@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Wambui Karuga <wambui.karugax@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Juergen Gross <jgross@suse.com>, David Airlie <airlied@linux.ie>,
 linux-parisc@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, LKML <linux-kernel@vger.kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 1:42 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Going through a full irq descriptor lookup instead of just using the proper
> helper function which provides direct access is suboptimal.
>
> In fact it _is_ wrong because the chip callback needs to get the chip data
> which is relevant for the chip while using the irq descriptor variant
> returns the irq chip data of the top level chip of a hierarchy. It does not
> matter in this case because the chip is the top level chip, but that
> doesn't make it more correct.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: linux-pci@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/pci/controller/pcie-xilinx-nwl.c |    8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
