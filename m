Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBF12E35D6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Dec 2020 11:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995B489B3C;
	Mon, 28 Dec 2020 10:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6967897D0;
 Sun, 27 Dec 2020 19:20:52 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id q25so7561785otn.10;
 Sun, 27 Dec 2020 11:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0sVC8j/qFLW+R/BiCcbxfbFuWt0QadRRyfbTVS1VwHY=;
 b=snNRM2UJuxFlYbt0opdNq/Km+jTrugWz+XCv9dvNVL/debD4RiSNjJuvvfbPHP8li7
 KIhX0/QgOmUeidxtdeZSEin831Gb4MPxK/Nsdy82P6kpVKu6N4Nc/2a1j/rhKSYYtPfM
 OdujcskdH0zj17962B4EA6DAWt+WbPQDoOQkCV+q0RBuHOc2AwsMveKzxEy1LnZjcBm6
 WwVaL7EiOv3pK+MmaGP2Q6W+EWp/A0H6XAJ9Sli5mcOq3SMT90MXTM6BUD6s+YNQPnp0
 3oKuBMFCRu9MNXQfN7PDX/uDAX7jwXSxxMeoGH5bWQ0ZYiFJh6LgmVaIuZavb11TOu03
 Stkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=0sVC8j/qFLW+R/BiCcbxfbFuWt0QadRRyfbTVS1VwHY=;
 b=PkNB4ULWgcjgRUv3u8xgt2jX2dPtM11bQr5paQ9i0rdoPgdPMuMrwZGpDE3szgfPey
 XpI1Ux2+AOIdH4gNiJ5d+7lzOTooknRyRwiSRib+nbyT++iheN5PS4KZfcCzQxBDw6c2
 IWugl7IPgC3syt7qLetfvNHiLmc6X+RazhTvNDrrEzS3BM1u3MvHJP49qNsZPBdFwjjR
 q0ucqUMvbGI5H2gKWcI019p5McxLhuUZoiWAeQzEYyP+e1fVgTNSf8j14NuMWJCX3UNR
 HJZlzZ3OeDQAh6TgQ9nn1SJaFV5xhD13zFENlUhpTb6mLo/sXWHhWnajBkoNXxXIIcGS
 uMow==
X-Gm-Message-State: AOAM532S2BPw19OI5JMzk3C35XqfN4nGtU3R0LVxVOiCqYRJx3sHxf9f
 MRB2I0ZiL98wBjhknx7dqs4=
X-Google-Smtp-Source: ABdhPJy5MA8pTqBMHg7t7kC9SkPKcTOcLW8SMiIKlPFipG2wn4l5044FI2Bd1WiObQwt+tJVlAueHQ==
X-Received: by 2002:a05:6830:cf:: with SMTP id
 x15mr30498943oto.55.1609096852047; 
 Sun, 27 Dec 2020 11:20:52 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id v17sm8555011oou.41.2020.12.27.11.20.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 27 Dec 2020 11:20:50 -0800 (PST)
Date: Sun, 27 Dec 2020 11:20:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 02/30] genirq: Move status flag checks to core
Message-ID: <20201227192049.GA195845@roeck-us.net>
References: <20201210192536.118432146@linutronix.de>
 <20201210194042.703779349@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210194042.703779349@linutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 28 Dec 2020 10:19:13 +0000
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
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Russell King <linux@armlinux.org.uk>, afzal mohammed <afzal.mohd.ma@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-s390@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, Will Deacon <will@kernel.org>,
 Helge Deller <deller@gmx.de>, Michal Simek <michal.simek@xilinx.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-pci@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Wambui Karuga <wambui.karugax@gmail.com>,
 Allen Hubbe <allenbh@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, Jon Mason <jdmason@kudzu.us>,
 linux-gpio@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>, David Airlie <airlied@linux.ie>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
 Marc Zyngier <maz@kernel.org>, linux-ntb@googlegroups.com,
 Saeed Mahameed <saeedm@nvidia.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 08:25:38PM +0100, Thomas Gleixner wrote:
> These checks are used by modules and prevent the removal of the export of
> irq_to_desc(). Move the accessor into the core.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Yes, but that means that irq_check_status_bit() may be called from modules,
but it is not exported, resulting in build errors such as the following.

arm64:allmodconfig:

ERROR: modpost: "irq_check_status_bit" [drivers/perf/arm_spe_pmu.ko] undefined!

Guenter

> ---
>  include/linux/irqdesc.h |   17 +++++------------
>  kernel/irq/manage.c     |   17 +++++++++++++++++
>  2 files changed, 22 insertions(+), 12 deletions(-)
> 
> --- a/include/linux/irqdesc.h
> +++ b/include/linux/irqdesc.h
> @@ -223,28 +223,21 @@ irq_set_chip_handler_name_locked(struct
>  	data->chip = chip;
>  }
>  
> +bool irq_check_status_bit(unsigned int irq, unsigned int bitmask);
> +
>  static inline bool irq_balancing_disabled(unsigned int irq)
>  {
> -	struct irq_desc *desc;
> -
> -	desc = irq_to_desc(irq);
> -	return desc->status_use_accessors & IRQ_NO_BALANCING_MASK;
> +	return irq_check_status_bit(irq, IRQ_NO_BALANCING_MASK);
>  }
>  
>  static inline bool irq_is_percpu(unsigned int irq)
>  {
> -	struct irq_desc *desc;
> -
> -	desc = irq_to_desc(irq);
> -	return desc->status_use_accessors & IRQ_PER_CPU;
> +	return irq_check_status_bit(irq, IRQ_PER_CPU);
>  }
>  
>  static inline bool irq_is_percpu_devid(unsigned int irq)
>  {
> -	struct irq_desc *desc;
> -
> -	desc = irq_to_desc(irq);
> -	return desc->status_use_accessors & IRQ_PER_CPU_DEVID;
> +	return irq_check_status_bit(irq, IRQ_PER_CPU_DEVID);
>  }
>  
>  static inline void
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -2769,3 +2769,23 @@ bool irq_has_action(unsigned int irq)
>  	return res;
>  }
>  EXPORT_SYMBOL_GPL(irq_has_action);
> +
> +/**
> + * irq_check_status_bit - Check whether bits in the irq descriptor status are set
> + * @irq:	The linux irq number
> + * @bitmask:	The bitmask to evaluate
> + *
> + * Returns: True if one of the bits in @bitmask is set
> + */
> +bool irq_check_status_bit(unsigned int irq, unsigned int bitmask)
> +{
> +	struct irq_desc *desc;
> +	bool res = false;
> +
> +	rcu_read_lock();
> +	desc = irq_to_desc(irq);
> +	if (desc)
> +		res = !!(desc->status_use_accessors & bitmask);
> +	rcu_read_unlock();
> +	return res;
> +}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
