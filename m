Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E432D8391
	for <lists+dri-devel@lfdr.de>; Sat, 12 Dec 2020 01:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A20A6E837;
	Sat, 12 Dec 2020 00:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489406E835
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Dec 2020 00:46:06 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id l11so15930791lfg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 16:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1p8BkEtCdcNBP/TpCqa88TfNrEdwTBnXM61elkmQDlU=;
 b=vPmJzs+nnMzMYiLeSl4C70AwwAUmtSXcRtz7EHFhXOG3+HSYoFdEGzQYdbnIfuLhe1
 cpLA6/bKDco/ZW56K0yojauLy12p9RMJ4MYQUMAZkQKn1JGQikvuaZfR0PCAwR/VHwqu
 l8KSlmgfW9XQH81QbMWcZWDg6fTfP5u9gInsHFToPISthtmCvix2Zi4MyAVk8WOEDUbJ
 6rVaVkrA8lMaHHNzl8tzPLP3FKzwRwCbx4UWePv66IKRrK3BWVszh2/HuHa0/BXzK05/
 +RmxfJa60vjGUHEMlcdmB6LQFBStfB7tIZX79j1mfET935nYYecl+y81TGJ83zzfgTnD
 hTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1p8BkEtCdcNBP/TpCqa88TfNrEdwTBnXM61elkmQDlU=;
 b=e6S4luX2GsoM8GZAVX8biPiCe57iJZ4ILTfA37mq5OEodBICUcGRX761x1kEkF57Bc
 eCRxC48JpwEurUIhqjIaVc0BEo5AVqS3LjTy14a+uDCNXxFL+d2+9C/6zjHMPB7Dkdbd
 UArnPCbDITr7j014GaB8HCa4B7Wo34pm+9nJP3nSV5A6whshl/QaZCuCnVcCxPGqgogV
 u7dehERKBGJqDwALaJx0EpzQ8hM7h9nsq+A3rE6u0PMddf6kay6p+h+QFdHtJRuH2gF5
 7B2GDb4/gMfSthEj+nS8Z9s0hlfhirER7hvq0bzZ0k4UQ7Q+g+iQLCwXObv7f4McqOUI
 /qiA==
X-Gm-Message-State: AOAM530ls/2x/Vw2xmO697m4YcaB2PUxGmyKkrYy1tNG6m7uczu4ncv6
 Jc1NtI7cBhm8HHJesUt55XpgeGG2XOmuFb2z7T8gEQ==
X-Google-Smtp-Source: ABdhPJw+G3KfJG3M7IoDnPiDCepv2YgkNV/jArpapqMifWmjCRwgJbTiMDpguzIYWZxJHM0zdf1udksfd+uvUSH+FdI=
X-Received: by 2002:a05:651c:205b:: with SMTP id
 t27mr2692550ljo.368.1607733964618; 
 Fri, 11 Dec 2020 16:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20201210192536.118432146@linutronix.de>
 <20201210194044.065003856@linutronix.de>
In-Reply-To: <20201210194044.065003856@linutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Dec 2020 01:45:53 +0100
Message-ID: <CACRpkdbKZzaTq+Am6q38Ya5wuUjiMbLE5g2i8bb_mJEWTkXgCg@mail.gmail.com>
Subject: Re: [patch 15/30] pinctrl: nomadik: Use irq_has_action()
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
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Saeed Mahameed <saeedm@nvidia.com>, netdev <netdev@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 linux-s390@vger.kernel.org, afzal mohammed <afzal.mohd.ma@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, xen-devel@lists.xenproject.org,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-pci <linux-pci@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Wambui Karuga <wambui.karugax@gmail.com>,
 Allen Hubbe <allenbh@gmail.com>, Juergen Gross <jgross@suse.com>,
 David Airlie <airlied@linux.ie>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-parisc@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, LKML <linux-kernel@vger.kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 8:42 PM Thomas Gleixner <tglx@linutronix.de> wrote:

> Let the core code do the fiddling with irq_desc.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suppose you will funnel this directly to Torvalds, else tell me and
I'll apply it to my tree.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
