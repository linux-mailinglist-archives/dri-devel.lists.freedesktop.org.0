Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F542D93F6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABCA6E0E7;
	Mon, 14 Dec 2020 08:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A087E6E0BE;
 Sun, 13 Dec 2020 11:31:33 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id q22so877199eja.2;
 Sun, 13 Dec 2020 03:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TjWjwM1ceLhbF1IYJl3oWPHfyZ88hbVMXIeiKOfmwOM=;
 b=vPvvh2iQ0r9ZbJoXMCDIftnNA4fETiNQFFFHNFtTvfww3hKWzjIscr3aHAUNvJNsBo
 Ivf0d9Mvb99JMJV9ehcDPkg7swsKEMl7+Y/hUHya1SLUv75EVwMKcVXA4wQhFYugquwI
 v+qVZoFUku+Z4S07otlNJUYYZFwuVftQM+5pKMuoRFtJsCSR2/FO/OAFm9dwXHUCnb0g
 nyevY+rBPRTACXhZ931IzFg7Awoce5sQ06vu7Ya86N9A/av13YTjQRgaXCWsCWUM/pP3
 fYNitfafK87nYGzSZSaCif4DP/TVC+LUGSPprBAe6V1QO0w7yMUKiZ5MZM5KRMECQCql
 1tPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TjWjwM1ceLhbF1IYJl3oWPHfyZ88hbVMXIeiKOfmwOM=;
 b=dn9iTBYrLO0ZFZmiD3WkVldPdSWXD+nrzZlSUwezcaQpxjXpEyvwotJTxSjuIKZ4Fk
 XjqoCDbSeCtzzuEHRLvYdvWHS3BEzMN76JCY/3wHmKvbkx1LJiE4YnAzvMezVNAr0y0j
 N7lNKgqJ/ZDSemUju6BtW6ALLWBSpxhv2w0sInPskWOLJeVptzGOPNoZd7N20h2qX+cd
 KVJlX5FS/rDImCyFM31QtuGKcAtCAUlNL45w9hBXsG1pLMKqmtTxu9hNzgpd4nw9nGe4
 PvdqdCk+/7jGYQCmaBFHoCWVYL17YngUj6K3ar7xRZoNDMrrF64woOIDgozfhyz/V0Xm
 Zldw==
X-Gm-Message-State: AOAM532DWFTVINPIzfCuU2HxSu9vnZmRJbPiBLMkp7I/cwk7y17P8ops
 +BsdWb/zccGs7qXxDHDcyfA=
X-Google-Smtp-Source: ABdhPJyEr8C9Ogdb1mA5xMC+43Vgspphph1JMIeMGN8re3oj2ZBqnM3siDmfQyHHB65lUudEMrQXmA==
X-Received: by 2002:a17:906:4bc5:: with SMTP id
 x5mr1966810ejv.55.1607859092305; 
 Sun, 13 Dec 2020 03:31:32 -0800 (PST)
Received: from [192.168.0.107] ([77.127.34.194])
 by smtp.gmail.com with ESMTPSA id d6sm11014971ejy.114.2020.12.13.03.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 03:31:31 -0800 (PST)
Subject: Re: [patch 21/30] net/mlx4: Use effective interrupt affinity
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <20201210192536.118432146@linutronix.de>
 <20201210194044.672935978@linutronix.de>
From: Tariq Toukan <ttoukan.linux@gmail.com>
Message-ID: <57c3f9d3-7262-9916-626b-c2234de763f0@gmail.com>
Date: Sun, 13 Dec 2020 13:31:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210194044.672935978@linutronix.de>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:40 +0000
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
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 linux-s390@vger.kernel.org, afzal mohammed <afzal.mohd.ma@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, xen-devel@lists.xenproject.org,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-pci@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, intel-gfx@lists.freedesktop.org,
 Wambui Karuga <wambui.karugax@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Juergen Gross <jgross@suse.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, Jon Mason <jdmason@kudzu.us>,
 linux-gpio@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Airlie <airlied@linux.ie>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 linux-ntb@googlegroups.com, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/10/2020 9:25 PM, Thomas Gleixner wrote:
> Using the interrupt affinity mask for checking locality is not really
> working well on architectures which support effective affinity masks.
> 
> The affinity mask is either the system wide default or set by user space,
> but the architecture can or even must reduce the mask to the effective set,
> which means that checking the affinity mask itself does not really tell
> about the actual target CPUs.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Tariq Toukan <tariqt@nvidia.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: netdev@vger.kernel.org
> Cc: linux-rdma@vger.kernel.org
> ---
>   drivers/net/ethernet/mellanox/mlx4/en_cq.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/drivers/net/ethernet/mellanox/mlx4/en_cq.c
> +++ b/drivers/net/ethernet/mellanox/mlx4/en_cq.c
> @@ -117,7 +117,7 @@ int mlx4_en_activate_cq(struct mlx4_en_p
>   			assigned_eq = true;
>   		}
>   		irq = mlx4_eq_get_irq(mdev->dev, cq->vector);
> -		cq->aff_mask = irq_get_affinity_mask(irq);
> +		cq->aff_mask = irq_get_effective_affinity_mask(irq);
>   	} else {
>   		/* For TX we use the same irq per
>   		ring we assigned for the RX    */
> 

Reviewed-by: Tariq Toukan <tariqt@nvidia.com>

Thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
