Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12399C29593
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 19:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0902510E011;
	Sun,  2 Nov 2025 18:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="ARP+t+ms";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="v9KpaIcl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8411710E1A7
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 17:12:05 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id D3C421400085;
 Sun,  2 Nov 2025 12:12:04 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Sun, 02 Nov 2025 12:12:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1762103524;
 x=1762189924; bh=a8GBlzVdFLqLDITNMfrx+jlxxxq6gfyNGi3CdsrexZI=; b=
 ARP+t+msJuI/3RJhhtYbBSFdEA7HyYjz67gdLAISlfgMVO+MnsQr8r1xk62dNhbd
 yI1NvYRfUV5jvNQigsXv5hM9shQ9mIGK7qiGfyO8fc5PQcGXpIOuwDEIZ3WwT5q7
 Gyox0q0Fnl1k6VbVxwNvzp/3PszW8Yb1PKA6OTjeFDd2fkXefL0kmJv1l77vIF5i
 YIgLYJgBqufautWfZLVDdNYHKouRVaxeHaRRsVRK+pLviBAK7gJaEXGEB4qNwR+7
 Hezxm8X7xwAKlixuVAWWSJ+8dOvKgWlCg4pqu016RbmhLzs+27VhTRQqLN29OogB
 3wjUYYJOaN6K34W+lgbHyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762103524; x=
 1762189924; bh=a8GBlzVdFLqLDITNMfrx+jlxxxq6gfyNGi3CdsrexZI=; b=v
 9KpaIclihxfYlmk593KmiTk5BxS4JIR7bgYvhR0NAwe80xqKE16tUXwNpDkvT269
 OFbT4TjgEiVVOOQDgfAiN06ZXLgRr482uVauwHbvA1UG6HKqcbJGpSpu62nfR9uw
 SZQP7sZg848DbQ/gj6+NF4RZuuTr+gfvhjGuc50FwmUunVlkhCkZ8S0QFToF9eDj
 Q9FsUBEScnBDJGasO2skhA9rIWRksj1tLSmc8bbPrE/V3omRv1tZDAkV/l5A1+pY
 zSXEjUYbPxiJ2N5N7CFusfzpEys4zyVu0WPlXGZHfQx2PC4canHEHDI8LJ045GIC
 moNcBmwwrBiSN+laj4PhQ==
X-ME-Sender: <xms:4pAHaaJvAQn91kmZ_L8EDo9K0hkQkKrMWH_IihatlP3lP5mfCsgZLA>
 <xme:4pAHaVGqzWItmKM9uVjZd7D7s73TPSJT17RH_QAqT7tOT2Lt3yN0HyR1RhuS_DqG1
 Am_YdNX9LPn6NdmN50A5pDf7ybqjSBfU9JLJSS02Nex2t7iHMwkLg>
X-ME-Received: <xmr:4pAHae4VRDGyqVonaYTLr6w6DuqmTaw4vZiOzLQ3Heo4t_Q0q99oFoXPKM8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeehkedvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfgggtgfesthejredttddtvdenucfhrhhomheptehlvgigucgh
 ihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrfgrth
 htvghrnhepteetudelgeekieegudegleeuvdffgeehleeivddtfeektdekkeehffehudet
 hffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hlvgigsehshhgriigsohhtrdhorhhgpdhnsggprhgtphhtthhopeefgedpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtoheplhgvohhnsehkvghrnhgvlhdrohhrghdprhgtphhtth
 hopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhoghgrnhhg
 seguvghlthgrthgvvgdrtghomhdprhgtphhtthhopegrgigsohgvsehkvghrnhgvlhdrug
 hkpdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthht
 ohepjhhorhhoseeksgihthgvshdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvg
 hlrdhorhhgpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgt
 ohhmpdhrtghpthhtohepjhhgghesiihivghpvgdrtggr
X-ME-Proxy: <xmx:4pAHacmtyeD6hGjmG5yJylSyTA-HADMGajUjQCdmqT32jDrnaono_w>
 <xmx:4pAHadv8O87-N3u7RBjdpz4I-VpiuG28OEKea_LULbQEWM07iNrZow>
 <xmx:4pAHafSnW8NhnYBcocBvwjMJZJwKp-bH1sWpaSPhMezd7UcEP_aM4A>
 <xmx:4pAHaXEDRYciiigXo_h0MGBa4ZI4FQYqaBv7JF7YPQQn35BVrD5OoA>
 <xmx:5JAHaTjTYS-Qyu0V5EarqGMARTYneth4LDaS1-R29jSNkR8I4POCr7gf>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Nov 2025 12:12:00 -0500 (EST)
Date: Sun, 2 Nov 2025 10:11:58 -0700
From: Alex Williamson <alex@shazbot.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Williamson <alex.williamson@redhat.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Krishnakant Jaju <kjaju@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 iommu@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v6 10/11] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20251102101158.6d2c36c6@shazbot.org>
In-Reply-To: <20251102151253.GA50752@unreal>
References: <20251102-dmabuf-vfio-v6-0-d773cff0db9f@nvidia.com>
 <20251102-dmabuf-vfio-v6-10-d773cff0db9f@nvidia.com>
 <20251102080137.209aa567@shazbot.org>
 <20251102151253.GA50752@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 02 Nov 2025 18:59:44 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2 Nov 2025 17:12:53 +0200
Leon Romanovsky <leon@kernel.org> wrote:
> On Sun, Nov 02, 2025 at 08:01:37AM -0700, Alex Williamson wrote: 
> > We don't need the separate loop or flag, and adding it breaks the
> > existing reverse list walk.  Thanks,  
> 
> Do you want me to send v7? I have a feeling that v6 is good to be merged.

Let's hold off, if this ends up being the only fixup I can roll it in.
Thanks,

Alex
 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 24204893e221..51a3bcc26f8b 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -2403,7 +2403,6 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>                                       struct iommufd_ctx *iommufd_ctx)
>  {
>         struct vfio_pci_core_device *vdev;
> -       bool restore_revoke = false;
>         struct pci_dev *pdev;
>         int ret;
>  
> @@ -2473,7 +2472,6 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>                 }
>  
>                 vfio_pci_dma_buf_move(vdev, true);
> -               restore_revoke = true;
>                 vfio_pci_zap_bars(vdev);
>         }
>  
> @@ -2501,15 +2499,12 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>                                struct vfio_pci_core_device, vdev.dev_set_list);
>  
>  err_undo:
> -       if (restore_revoke) {
> -               list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list)
> -                       if (__vfio_pci_memory_enabled(vdev))
> -                               vfio_pci_dma_buf_move(vdev, false);
> -       }
> -
>         list_for_each_entry_from_reverse(vdev, &dev_set->device_list,
> -                                        vdev.dev_set_list)
> +                                        vdev.dev_set_list) {
> +               if (__vfio_pci_memory_enabled(vdev))
> +                       vfio_pci_dma_buf_move(vdev, false);
>                 up_write(&vdev->memory_lock);
> +       }
>  
>         list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list)
>                 pm_runtime_put(&vdev->pdev->dev);
> 
> 
> > 
> > Alex
> >   
> 

