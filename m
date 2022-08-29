Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C72815A4230
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 07:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBE610F08E;
	Mon, 29 Aug 2022 05:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5074E10EDF4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 05:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661750700; x=1693286700;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=AHdSsUUUV1JQXei8Xd/xJYMb2f5Ey2S3xAWww22dACs=;
 b=DtlYHqmqbnBMTHbvcXn6OyVBOtP3CxjIF2+/uDz2YN7mKkwPZO0lmobB
 wySJI4rQp+ndpVDRq0pUPh7T5eU0k7sYpp1u8Lw/SG4QL4eO1saIHa9ao
 BPK4RMi2xd1LMYtfa+mRspwWZjyz9NXhwbj94jpO8vaJA3CsgjXr9y+ZK
 lwY2muL4QW6f6hsZlP4I2uabro7xviIEzzh9AW6f0eWhlNwEDjY5+vLM5
 3vA0/iBPXJiHcelLBwkyQgO9MGHQrKKhR0w8unPLfonOFED+oJ4irAgL7
 g/W61fYCTtHeTBj9+4GA3PdXB1r4uamP40EMCPFkS3GNhIxOKu+eO3SMp Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="277824637"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="277824637"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2022 22:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="672239650"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 28 Aug 2022 22:24:58 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 28 Aug 2022 22:24:56 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 28 Aug 2022 22:24:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 28 Aug 2022 22:24:56 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 28 Aug 2022 22:24:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MO5/n+R/R5V3U+0sqm0D30WHpSHmPFqzJWgnxfnRN5/8LOdeV6j5MjMdLlqdj9KW445V+7yddCaggWqzcP39WgmhPwWK6lrRJkjKmfwFQfX2+BFM/NiZDf6tPpyF4HuNYZo0cMYqJv6F259AHims71c2MfXVNW1EmH9QaQ7u8IZe6gs6FZP4j8jzNoNYbUUTu+V8PS57Oq6cGX/RNiMkosrW1C74IDyBHwSz7/Z9yTI2nvoNRXqic6Oiel0nQbVmMFDvd9odX2X7elmVvcS88BHMwAsQlyzzq0wi6v3shk8qe/ko6aXeuDDy23Gr255AE5h0Jn2O4hKgChvpOyk4JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP0UflHUFzPa9OTmofF8K4Vt4bGTVtSGZ+BkmwblBow=;
 b=LbARILtu/pADsnTARkIJncorglhQpXZjQkiVvNY/kdEDjowZ4NoM7WBC/auCZN87Jt/AYXrbf4yKCCrIw9jnp3GwRixFgitx0T+rh9fOvGFtup3uHHkWtlcoPOLOgvgpSPEYRDwwrlKpT4XBVh+nKxV0HCnjt2omFsWuk8/ojzc2Fi/3KKZHwuEkaEn0W931cE/oeIZ+hZHxtR4Ol8+DiDj5GsVtGgg3mi7VroF6S/jB0sRIMkL9L1c3kkPnngBO6Pvp9eTEPt1gMyIM6Cc4OZTg7k8lHEXztAi7XEsaY8wvPBGdQPCfvtEnWqcY6IxTila1GvWDZIezrLwKC78wgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 DM6PR11MB3771.namprd11.prod.outlook.com (2603:10b6:5:13f::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Mon, 29 Aug 2022 05:24:54 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::1c31:2858:b6fd:f1a9]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::1c31:2858:b6fd:f1a9%4]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 05:24:54 +0000
Date: Mon, 29 Aug 2022 13:04:05 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 4/4] vfio/pci: Allow MMIO regions to be exported through
 dma-buf
Message-ID: <YwxIxWQQ/ENiFak+@yzhao56-desk.sh.intel.com>
References: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
 <4-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
X-ClientProxiedBy: SGBP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::19)
 To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 148e6dfa-834c-4628-a0d2-08da897ecdd0
X-MS-TrafficTypeDiagnostic: DM6PR11MB3771:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ALCAqjCrrQz+Ct5wn2OFAZ85HCgZoEYDZZdPpr36RKlxNz00gj3rIFGRpsFOvaYM+56D3/Q5BGTtN71JZ9UIkrmYE7JnXzWUa6ICwS06Kp+faISHh2ofvEys3xFM54uGwYqmidQIUAAkB7m/OpqtuBbXlrQUsYQi8xQhqekfg2Ulsk/bcmKrwahAjVo6K1ePSZqTICEMEiXT0i50xMWBISyAwypCNb8+kUKghRylghzflH+ZcFrDsnpnTJXEFYxO3v1lpZtIwwuFC6qV5EhOOAQmWRdycurYxDtXEehFFeBEBoog72pQ5eeM8bc94MsYxOJp/0/2Hczqok1gOPl0AUy3hnjtyLzs5SFpaXN2NZKIxiT2kacbAb8OD5Ue+vcf+76ytMyS+ExJoQXMq47poX+VxQjKYAPMsvgOJUklL+GlQYgNs3ip6r3jfrD6+tJu0ln+x4VoeiWSSZ1U70IR6ZldnopyYohgvG+Pg/ftBNVSmKCjp3zS56E6K0AYbwE4FkWtXz2dwuw+72sl9hmOpoDbsn2hUqbJRK0psXIOmTUQfcbeGU4VH/RyUjuiljRzWzUPEOmMEIcVbVWjtxQ9XR3ZZxFbXqZckYTaKbzmCaFEKydPnIdNfbFb+HELGWWMbssea7nyu/bR4hPvC77I+7KdM5Yh3VFLgcZqfNxKpJ4l2i33U8AU0AWtqTxQMgDqyfNFuZjTDxtk/a1Z24gxmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5966.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(376002)(346002)(366004)(396003)(7416002)(5660300002)(8936002)(41300700001)(2906002)(83380400001)(86362001)(3450700001)(6506007)(6666004)(30864003)(6512007)(26005)(186003)(66556008)(6916009)(478600001)(316002)(54906003)(38100700002)(82960400001)(6486002)(66946007)(66476007)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J8yILOBnpuuZrVsLzq2UA82hvOMAANz3c65A5B+dEclzErXvVVJsuC5wKj3t?=
 =?us-ascii?Q?ubyvDtuDDfYiBn4LGHNtB5+AYoopLwyDvSgyIVwk3Ir9eMciLpMfbUw3zN0I?=
 =?us-ascii?Q?+PvBdtKA0AICP80PdNZAhhbe6UqDDuAtCmPYi2c/3YHB8tiagcQjYGcOh5ho?=
 =?us-ascii?Q?iLASDGjJ5mkjzYy6EvaDf8fgagVC0v7sfou6pJxxaP7uDkp569H7dkjxgLEX?=
 =?us-ascii?Q?5HiZy6ogWV0GxOvO+dPmuQ46i8CXfzeYVJtkt5TFCxFDWJo9qNOz7Ya6yTvj?=
 =?us-ascii?Q?7wM3p04gkOQhTbEI6NqODTxcSGfiCf9sC0RlU9xJd/MfUZqUJWnjPQgnp48k?=
 =?us-ascii?Q?2gaYJX/gCEMLjAfLJTLzwVwTk1+LFx3+EpFz8sajBCuCua9eEaFF9190yAop?=
 =?us-ascii?Q?oqa55o3YVSU6RTTFg5629xF3OHoNDLZT3l7hUGsja2VDDNqr9tgOBXO7BfEP?=
 =?us-ascii?Q?yDO/selAqsbxo6LHvdnOVsiz3971eo2DHPGFw2QOf//UcXfsOdFGSB+3m+g9?=
 =?us-ascii?Q?N4m4ZAe5s6OXt8NITRv7D6dUPDcvekTxJcXLAnP9VPtQNHa13m6qirDwQfY0?=
 =?us-ascii?Q?RUn/DsP99pQ2G7sFkBUh/0THvYa1N9xh/y1l2JnxgEZHzKQwaMERla68eiAY?=
 =?us-ascii?Q?i8jaUQzsoJ8IPJraIC9qf5fWyA9Zg6CjKQoTotEsXRxJdwjk9oXiqn1j2j+Y?=
 =?us-ascii?Q?B1cYBGs6DQx76BEE7sT8lGxEivBgzKStwMhUsNo6SpXyyhZi5N6hVxIyqgyX?=
 =?us-ascii?Q?nYUiKJC+N17OYporX8RVURobS9KYmQ3kiJ3HwQMCJk0/1xJu3aVjoQQzY6Dh?=
 =?us-ascii?Q?0WM/aAqopqDju6H9nKV8DGhufa+5r+JYDZZEzxZg478uja9WjSrX8/PtHkQH?=
 =?us-ascii?Q?gDufwWCsYLDZMDxS+Eye97r0BamEGOEuvuXeNzbywlO0M1T6iod9rlp6fvRq?=
 =?us-ascii?Q?jrSJhh1mGJ/zsUH6SNRcEarRi2YRD3AcOXn4xfTd+ioqCQZPn1YILTasYaqg?=
 =?us-ascii?Q?foaRulqFBublWNIa7LeeDB3mRuUC5jeCHVC18/8ifWASwBQStt8P1W2cfmnI?=
 =?us-ascii?Q?Gzn8EKDcqtAqj57Tgwxx2O84CE27yjMaj2k6p2BP3/ykKwOy4sTJH2ax6tPm?=
 =?us-ascii?Q?wUlJogjL8+ddZe+0KemSyqjY/luVZ2OFWZaIPMHvi1HVpxwPG7fjjkE0A3Fa?=
 =?us-ascii?Q?69nAeOe41tKHn7tVu2D3MFibDHFJcvip+YIHnjMI7Sv2oxr8VjU+vFK0XQQA?=
 =?us-ascii?Q?EtmDBZPeRqaUYediQzGR0MftEpf3T4GzcAd6ZFcUrZtAM7PNfbqo2KvkxMjp?=
 =?us-ascii?Q?F3M/W321MLyXpcjIeDJPY+fR/Wh45SBs+i48DYa7lnQ49MAXomuDiiQccK8e?=
 =?us-ascii?Q?O4+nJLdWF5v2OYVBBN2YMiosCJlK10LUO9fs7DxWKx3eG3AnDTuuw0BQAUwK?=
 =?us-ascii?Q?Kkj0fbXAlHZa+3H6tOtZ73AhK/KMPLTwCSGCm6GLPnK2y6wMj8+5gaDe+Bg+?=
 =?us-ascii?Q?627LyZJEUWe22PZTJxLjuMzVErkbzYje4cxZqJT9MkO/mkDYVsOPBSKhPj0R?=
 =?us-ascii?Q?miGmo2wMQo2nP7KZ34XVaSxPv27TDq3RHaKJrCpT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 148e6dfa-834c-4628-a0d2-08da897ecdd0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 05:24:53.9638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjNTfXcAdDDGDcp5qSiVw+IrTFGlpr1ipbUIihMM2uv+xe5VRl5Y+zOzE2dw4PDYhXSdOWFg+Wc6zOcUEB/9hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3771
X-OriginatorOrg: intel.com
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Leon Romanovsky <leon@kernel.org>, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Alex Williamson <alex.williamson@redhat.com>,
 Maor Gottlieb <maorg@nvidia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 17, 2022 at 01:11:42PM -0300, Jason Gunthorpe wrote:
> dma-buf has become a way to safely acquire a handle to non-struct page
> memory that can still have lifetime controlled by the exporter. Notably
> RDMA can now import dma-buf FDs and build them into MRs which allows for
> PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
> from PCI device BARs.
> 
> The patch design loosely follows the pattern in commit
> db1a8dd916aa ("habanalabs: add support for dma-buf exporter") except this
> does not support pinning.
> 
> Instead, this implements what, in the past, we've called a revocable
> attachment using move. In normal situations the attachment is pinned, as a
> BAR does not change physical address. However when the VFIO device is
> closed, or a PCI reset is issued, access to the MMIO memory is revoked.
> 
> Revoked means that move occurs, but an attempt to immediately re-map the
> memory will fail. In the reset case a future move will be triggered when
> MMIO access returns. As both close and reset are under userspace control
> it is expected that userspace will suspend use of the dma-buf before doing
> these operations, the revoke is purely for kernel self-defense against a
> hostile userspace.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/pci/Makefile           |   1 +
>  drivers/vfio/pci/vfio_pci_config.c  |   8 +-
>  drivers/vfio/pci/vfio_pci_core.c    |  28 ++-
>  drivers/vfio/pci/vfio_pci_dma_buf.c | 265 ++++++++++++++++++++++++++++
>  drivers/vfio/pci/vfio_pci_priv.h    |  23 +++
>  include/linux/vfio_pci_core.h       |   1 +
>  include/uapi/linux/vfio.h           |  18 ++
>  7 files changed, 336 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/vfio/pci/vfio_pci_dma_buf.c
> 
> diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
> index 24c524224da5a3..81006a157cde14 100644
> --- a/drivers/vfio/pci/Makefile
> +++ b/drivers/vfio/pci/Makefile
> @@ -2,6 +2,7 @@
>  
>  vfio-pci-core-y := vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
>  vfio-pci-core-$(CONFIG_VFIO_PCI_ZDEV_KVM) += vfio_pci_zdev.o
> +vfio-pci-core-$(CONFIG_DMA_SHARED_BUFFER) += vfio_pci_dma_buf.o
>  obj-$(CONFIG_VFIO_PCI_CORE) += vfio-pci-core.o
>  
>  vfio-pci-y := vfio_pci.o
> diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
> index d22921efa25987..f8a9c24d04aeb7 100644
> --- a/drivers/vfio/pci/vfio_pci_config.c
> +++ b/drivers/vfio/pci/vfio_pci_config.c
> @@ -584,10 +584,12 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
>  		virt_mem = !!(le16_to_cpu(*virt_cmd) & PCI_COMMAND_MEMORY);
>  		new_mem = !!(new_cmd & PCI_COMMAND_MEMORY);
>  
> -		if (!new_mem)
> +		if (!new_mem) {
>  			vfio_pci_zap_and_down_write_memory_lock(vdev);
> -		else
> +			vfio_pci_dma_buf_move(vdev, true);
> +		} else {
>  			down_write(&vdev->memory_lock);
> +		}
>  
>  		/*
>  		 * If the user is writing mem/io enable (new_mem/io) and we
> @@ -622,6 +624,8 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
>  		*virt_cmd &= cpu_to_le16(~mask);
>  		*virt_cmd |= cpu_to_le16(new_cmd & mask);
>  
> +		if (__vfio_pci_memory_enabled(vdev))
> +			vfio_pci_dma_buf_move(vdev, false);
>  		up_write(&vdev->memory_lock);
>  	}
>  
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index d13e22021860cc..206f159c480e42 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -504,6 +504,8 @@ void vfio_pci_core_close_device(struct vfio_device *core_vdev)
>  	vfio_spapr_pci_eeh_release(vdev->pdev);
>  	vfio_pci_core_disable(vdev);
>  
> +	vfio_pci_dma_buf_cleanup(vdev);
> +
>  	mutex_lock(&vdev->igate);
>  	if (vdev->err_trigger) {
>  		eventfd_ctx_put(vdev->err_trigger);
> @@ -980,7 +982,10 @@ int vfio_pci_try_reset_function(struct vfio_pci_core_device *vdev)
>  	 */
>  	vfio_pci_set_power_state(vdev, PCI_D0);
>  
> +	vfio_pci_dma_buf_move(vdev, true);
>  	ret = pci_try_reset_function(vdev->pdev);
> +	if (__vfio_pci_memory_enabled(vdev))
> +		vfio_pci_dma_buf_move(vdev, false);
>  	up_write(&vdev->memory_lock);
>  
>  	return ret;
> @@ -1210,11 +1215,10 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
>  }
>  EXPORT_SYMBOL_GPL(vfio_pci_core_ioctl);
>  
> -static int vfio_pci_core_feature_token(struct vfio_device *device, u32 flags,
> -				       uuid_t __user *arg, size_t argsz)
> +static int vfio_pci_core_feature_token(struct vfio_pci_core_device *vdev,
> +				       u32 flags, uuid_t __user *arg,
> +				       size_t argsz)
>  {
> -	struct vfio_pci_core_device *vdev =
> -		container_of(device, struct vfio_pci_core_device, vdev);
>  	uuid_t uuid;
>  	int ret;
>  
> @@ -1241,9 +1245,14 @@ static int vfio_pci_core_feature_token(struct vfio_device *device, u32 flags,
>  int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
>  				void __user *arg, size_t argsz)
>  {
> +	struct vfio_pci_core_device *vdev =
> +		container_of(device, struct vfio_pci_core_device, vdev);
> +
>  	switch (flags & VFIO_DEVICE_FEATURE_MASK) {
>  	case VFIO_DEVICE_FEATURE_PCI_VF_TOKEN:
> -		return vfio_pci_core_feature_token(device, flags, arg, argsz);
> +		return vfio_pci_core_feature_token(vdev, flags, arg, argsz);
> +	case VFIO_DEVICE_FEATURE_DMA_BUF:
> +		return vfio_pci_core_feature_dma_buf(vdev, flags, arg, argsz);
>  	default:
>  		return -ENOTTY;
>  	}
> @@ -1881,6 +1890,7 @@ void vfio_pci_core_init_device(struct vfio_pci_core_device *vdev,
>  	INIT_LIST_HEAD(&vdev->vma_list);
>  	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
>  	init_rwsem(&vdev->memory_lock);
> +	INIT_LIST_HEAD(&vdev->dmabufs);
>  }
>  EXPORT_SYMBOL_GPL(vfio_pci_core_init_device);
>  
> @@ -2227,11 +2237,17 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>  	 * cause the PCI config space reset without restoring the original
>  	 * state (saved locally in 'vdev->pm_save').
>  	 */
> -	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
> +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
> +		vfio_pci_dma_buf_move(cur, true);
>  		vfio_pci_set_power_state(cur, PCI_D0);
> +	}
>  
>  	ret = pci_reset_bus(pdev);
>  
> +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
> +		if (__vfio_pci_memory_enabled(cur))
> +			vfio_pci_dma_buf_move(cur, false);
> +
>  err_undo:
>  	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
>  		if (cur == cur_mem)
> diff --git a/drivers/vfio/pci/vfio_pci_dma_buf.c b/drivers/vfio/pci/vfio_pci_dma_buf.c
> new file mode 100644
> index 00000000000000..ac32405de5e48d
> --- /dev/null
> +++ b/drivers/vfio/pci/vfio_pci_dma_buf.c
> @@ -0,0 +1,265 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2022, NVIDIA CORPORATION & AFFILIATES.
> + */
> +#include <linux/dma-buf.h>
> +#include <linux/pci-p2pdma.h>
> +#include <linux/dma-resv.h>
> +
> +#include "vfio_pci_priv.h"
> +
> +MODULE_IMPORT_NS(DMA_BUF);
> +
> +struct vfio_pci_dma_buf {
> +	struct dma_buf *dmabuf;
> +	struct vfio_pci_core_device *vdev;
> +	struct list_head dmabufs_elm;
> +	unsigned int index;
> +	size_t offset;
> +	bool revoked;
> +};
> +
> +static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
> +				   struct dma_buf_attachment *attachment)
> +{
> +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> +	int rc;
> +
> +	rc = pci_p2pdma_distance_many(priv->vdev->pdev, &attachment->dev, 1,
> +				      true);
> +	if (rc < 0)
> +		attachment->peer2peer = false;
> +	return 0;
> +}
> +
> +static void vfio_pci_dma_buf_unpin(struct dma_buf_attachment *attachment)
> +{
> +}
> +
> +static int vfio_pci_dma_buf_pin(struct dma_buf_attachment *attachment)
> +{
> +	/*
> +	 * Uses the dynamic interface but must always allow for
> +	 * dma_buf_move_notify() to do revoke
> +	 */
> +	return -EINVAL;
> +}
> +
> +static struct sg_table *
> +vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
> +		     enum dma_data_direction dir)
> +{
> +	size_t sgl_size = dma_get_max_seg_size(attachment->dev);
> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +	struct scatterlist *sgl;
> +	struct sg_table *sgt;
> +	dma_addr_t dma_addr;
> +	unsigned int nents;
> +	size_t offset;
> +	int ret;
> +
> +	dma_resv_assert_held(priv->dmabuf->resv);
> +
> +	if (!attachment->peer2peer)
> +		return ERR_PTR(-EPERM);
> +
> +	if (!priv->revoked)
> +		return ERR_PTR(-ENODEV);
> +
> +	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
> +	if (!sgt)
> +		return ERR_PTR(-ENOMEM);
> +
> +	nents = DIV_ROUND_UP(priv->dmabuf->size, sgl_size);
> +	ret = sg_alloc_table(sgt, nents, GFP_KERNEL);
> +	if (ret)
> +		goto err_kfree_sgt;
> +
> +	/*
> +	 * Since the memory being mapped is a device memory it could never be in
> +	 * CPU caches.
> +	 */
> +	dma_addr = dma_map_resource(
> +		attachment->dev,
> +		pci_resource_start(priv->vdev->pdev, priv->index) +
> +			priv->offset,
> +		priv->dmabuf->size, dir, DMA_ATTR_SKIP_CPU_SYNC);
dma_map_resource maps the phys to an IOVA in device's
default_domain, which, however, may not be the domain that the device is
currently attached to.
So, the importer of this sgt will convert this dma_addr back to phys?

BTW, I don't see the assignment of priv->index in below
vfio_pci_core_feature_dma_buf(), is it equal to get_dma_buf.region_index ?

Thanks
Yan

> +	ret = dma_mapping_error(attachment->dev, dma_addr);
> +	if (ret)
> +		goto err_free_sgt;
> +
> +	/*
> +	 * Break the BAR's physical range up into max sized SGL's according to
> +	 * the device's requirement.
> +	 */
> +	sgl = sgt->sgl;
> +	for (offset = 0; offset != priv->dmabuf->size;) {
> +		size_t chunk_size = min(priv->dmabuf->size - offset, sgl_size);
> +
> +		sg_set_page(sgl, NULL, chunk_size, 0);
> +		sg_dma_address(sgl) = dma_addr + offset;
> +		sg_dma_len(sgl) = chunk_size;
> +		sgl = sg_next(sgl);
> +		offset += chunk_size;
> +	}
> +
> +	/*
> +	 * Because we are not going to include a CPU list we want to have some
> +	 * chance that other users will detect this by setting the orig_nents to
> +	 * 0 and using only nents (length of DMA list) when going over the sgl
> +	 */
> +	sgt->orig_nents = 0;
> +	return sgt;
> +
> +err_free_sgt:
> +	sg_free_table(sgt);
> +err_kfree_sgt:
> +	kfree(sgt);
> +	return ERR_PTR(ret);
> +}
> +
> +static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
> +				   struct sg_table *sgt,
> +				   enum dma_data_direction dir)
> +{
> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +
> +	dma_unmap_resource(attachment->dev, sg_dma_address(sgt->sgl),
> +			   priv->dmabuf->size, dir, DMA_ATTR_SKIP_CPU_SYNC);
> +	sg_free_table(sgt);
> +	kfree(sgt);
> +}
> +
> +static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
> +{
> +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> +
> +	/*
> +	 * Either this or vfio_pci_dma_buf_cleanup() will remove from the list.
> +	 * The refcount prevents both.
> +	 */
> +	if (priv->vdev) {
> +		down_write(&priv->vdev->memory_lock);
> +		list_del_init(&priv->dmabufs_elm);
> +		up_write(&priv->vdev->memory_lock);
> +		vfio_device_put(&priv->vdev->vdev);
> +	}
> +	kfree(priv);
> +}
> +
> +static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
> +	.attach = vfio_pci_dma_buf_attach,
> +	.map_dma_buf = vfio_pci_dma_buf_map,
> +	.pin = vfio_pci_dma_buf_pin,
> +	.unpin = vfio_pci_dma_buf_unpin,
> +	.release = vfio_pci_dma_buf_release,
> +	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
> +};
> +
> +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> +				  struct vfio_device_feature_dma_buf __user *arg,
> +				  size_t argsz)
> +{
> +	struct vfio_device_feature_dma_buf get_dma_buf;
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	struct vfio_pci_dma_buf *priv;
> +	int ret;
> +
> +	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
> +				 sizeof(get_dma_buf));
> +	if (ret != 1)
> +		return ret;
> +
> +	if (copy_from_user(&get_dma_buf, arg, sizeof(get_dma_buf)))
> +		return -EFAULT;
> +
> +	/* For PCI the region_index is the BAR number like everything else */
> +	if (get_dma_buf.region_index >= VFIO_PCI_ROM_REGION_INDEX)
> +		return -EINVAL;
> +
> +	exp_info.ops = &vfio_pci_dmabuf_ops;
> +	exp_info.size = pci_resource_len(vdev->pdev, get_dma_buf.region_index);
> +	if (!exp_info.size)
> +		return -EINVAL;
> +	if (get_dma_buf.offset || get_dma_buf.length) {
> +		if (get_dma_buf.length > exp_info.size ||
> +		    get_dma_buf.offset >= exp_info.size ||
> +		    get_dma_buf.length > exp_info.size - get_dma_buf.offset ||
> +		    get_dma_buf.offset % PAGE_SIZE ||
> +		    get_dma_buf.length % PAGE_SIZE)
> +			return -EINVAL;
> +		exp_info.size = get_dma_buf.length;
> +	}
> +	exp_info.flags = get_dma_buf.open_flags;
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	INIT_LIST_HEAD(&priv->dmabufs_elm);
> +	priv->offset = get_dma_buf.offset;
> +
> +	exp_info.priv = priv;
> +	priv->dmabuf = dma_buf_export(&exp_info);
> +	if (IS_ERR(priv->dmabuf)) {
> +		ret = PTR_ERR(priv->dmabuf);
> +		kfree(priv);
> +		return ret;
> +	}
> +
> +	/* dma_buf_put() now frees priv */
> +
> +	down_write(&vdev->memory_lock);
> +	dma_resv_lock(priv->dmabuf->resv, NULL);
> +	priv->revoked = __vfio_pci_memory_enabled(vdev);
> +	priv->vdev = vdev;
> +	vfio_device_get(&vdev->vdev);
> +	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
> +	dma_resv_unlock(priv->dmabuf->resv);
> +	up_write(&vdev->memory_lock);
> +
> +	/*
> +	 * dma_buf_fd() consumes the reference, when the file closes the dmabuf
> +	 * will be released.
> +	 */
> +	return dma_buf_fd(priv->dmabuf, get_dma_buf.open_flags);
> +}
> +
> +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
> +{
> +	struct vfio_pci_dma_buf *priv;
> +	struct vfio_pci_dma_buf *tmp;
> +
> +	lockdep_assert_held_write(&vdev->memory_lock);
> +
> +	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		if (!dma_buf_try_get(priv->dmabuf))
> +			continue;
> +		if (priv->revoked != revoked) {
> +			dma_resv_lock(priv->dmabuf->resv, NULL);
> +			priv->revoked = revoked;
> +			dma_buf_move_notify(priv->dmabuf);
> +			dma_resv_unlock(priv->dmabuf->resv);
> +		}
> +		dma_buf_put(priv->dmabuf);
> +	}
> +}
> +
> +void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
> +{
> +	struct vfio_pci_dma_buf *priv;
> +	struct vfio_pci_dma_buf *tmp;
> +
> +	down_write(&vdev->memory_lock);
> +	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		if (!dma_buf_try_get(priv->dmabuf))
> +			continue;
> +		dma_resv_lock(priv->dmabuf->resv, NULL);
> +		list_del_init(&priv->dmabufs_elm);
> +		priv->vdev = NULL;
> +		priv->revoked = true;
> +		dma_buf_move_notify(priv->dmabuf);
> +		dma_resv_unlock(priv->dmabuf->resv);
> +		vfio_device_put(&vdev->vdev);
> +		dma_buf_put(priv->dmabuf);
> +	}
> +	up_write(&vdev->memory_lock);
> +}
> diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
> index 5b1cb9a9838442..c295a1166e7a9c 100644
> --- a/drivers/vfio/pci/vfio_pci_priv.h
> +++ b/drivers/vfio/pci/vfio_pci_priv.h
> @@ -102,4 +102,27 @@ static inline bool vfio_pci_is_vga(struct pci_dev *pdev)
>  	return (pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA;
>  }
>  
> +#ifdef CONFIG_DMA_SHARED_BUFFER
> +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> +				  struct vfio_device_feature_dma_buf __user *arg,
> +				  size_t argsz);
> +void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev);
> +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
> +#else
> +static int
> +vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> +			      struct vfio_device_feature_dma_buf __user *arg,
> +			      size_t argsz)
> +{
> +	return -ENOTTY;
> +}
> +static inline void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
> +{
> +}
> +static inline void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev,
> +					 bool revoked)
> +{
> +}
> +#endif
> +
>  #endif
> diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
> index 9d18b832e61a0d..b57f4ecc2665e1 100644
> --- a/include/linux/vfio_pci_core.h
> +++ b/include/linux/vfio_pci_core.h
> @@ -93,6 +93,7 @@ struct vfio_pci_core_device {
>  	struct mutex		vma_lock;
>  	struct list_head	vma_list;
>  	struct rw_semaphore	memory_lock;
> +	struct list_head	dmabufs;
>  };
>  
>  /* Will be exported for vfio pci drivers usage */
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 733a1cddde30a5..1dcfad6dcb6863 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -986,6 +986,24 @@ enum vfio_device_mig_state {
>  	VFIO_DEVICE_STATE_RUNNING_P2P = 5,
>  };
>  
> +/**
> + * Upon VFIO_DEVICE_FEATURE_GET create a dma_buf fd for the
> + * region selected.
> + *
> + * open_flags are the typical flags passed to open(2), eg O_RDWR, O_CLOEXEC,
> + * etc. offset/length specify a slice of the region to create the dmabuf from.
> + * If both are 0 then the whole region is used.
> + *
> + * Return: The fd number on success, -1 and errno is set on failure.
> + */
> +struct vfio_device_feature_dma_buf {
> +	__u32 region_index;
> +	__u32 open_flags;
> +	__u32 offset;
> +	__u64 length;
> +};
> +#define VFIO_DEVICE_FEATURE_DMA_BUF 3
> +
>  /* -------- API for Type1 VFIO IOMMU -------- */
>  
>  /**
> -- 
> 2.37.2
> 
