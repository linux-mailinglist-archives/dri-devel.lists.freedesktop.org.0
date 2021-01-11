Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D443E2F1995
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 16:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDF16E0D8;
	Mon, 11 Jan 2021 15:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EA46E0D8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 15:24:22 +0000 (UTC)
IronPort-SDR: UzaBMT6LCKffUQbFoUx1g5S49o4c+1RSD4+WXyrMUB2+qUsqgigrsZoq1GH7W0PG8Wc9dzdSbt
 0gqqdAo7/btw==
X-IronPort-AV: E=McAfee;i="6000,8403,9860"; a="157060643"
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; d="scan'208";a="157060643"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 07:24:21 -0800
IronPort-SDR: CtnDuOUkoGWV0CG8EHCC+rlcyS1GKN1xTABaB72+I8s02JfTaX35/NjFuJpaIAR+OBXaLIha5z
 iI8h0RgpWOfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; d="scan'208";a="399830097"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 11 Jan 2021 07:24:21 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 11 Jan 2021 07:24:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 11 Jan 2021 07:24:20 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 11 Jan 2021 07:24:20 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 11 Jan 2021 07:24:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIJzC0A5M38XutUKn+tBG068BHQUT3uUwtxglcQ/QJE8Cz8dSzmD1pxq1YSyYTA0k22UXL+0Yz5d9TuH/C2FBIjpAeSnxuv8qwRW9llczA8Lg7b4Dq7aUXM648NMIC0kHShIiybk14hakW/jhhhcVns3gj6sqa3Wtj1IGlxeKXMI0h9yVM5wh4SCRyS9VwFwuM2NJL1kw9ps+X8i2+H1iVFi5Hjx8+fmH20SFdn9FVUhtl7NaIf9fJw4dROJLEwC/TUa0AiUb9fICrngVB1Pvn3YN9LvBOAe7bUM1SCEf2jJ/nF++yKgya11XV5ijz9x9jNhRzOCnq4F19A4ly8E+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vq7ZiHqHZhad+jxv3Sf/ESS/5sKjegrE/X8yIjxFlHE=;
 b=HIwvAm+MXt9N830Gn+MuGD622ZnyitSak3OSK2VO3IAd/CjRzeXd54yqT1NJPO7eRvdNWlvq4qAHlaTFB9qWF+l9EXjvA593ORxlf5t2fps4f4fctHAUv3Mjj34KwAdupCqDvUtTouU4hYqnUGXi/1EOFcofJsIYObUxOe7EpDDHZ0zputhQ8NdWAOx1r+RYrAP5j82WJD9wI1SOiCPni2+WClQGwRTezcd7mxRzxeGm6ZB0d1MWKaMkV0SkML2+fTQ2gmwLE+upTea5lRkJaDWdg61jCYEPzBq1gSp6HLJ0dvWtA1tak6jUU1aZcMTqqqcfoIG2DI9rKQR+KuvdOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vq7ZiHqHZhad+jxv3Sf/ESS/5sKjegrE/X8yIjxFlHE=;
 b=iTjHZRmnX/LZz9KLUFwEIkHvULXqNUmkG0SyPmBTFdC+p4g4P7H0Pnb6hGQIoywbHrvUmVNkrfw8rd52OLq+BlUBN54sHZh9yXNTn2rsFRf4QWZIP9bLEE+q99yWi6S8svNmqVpi2Y1VZ4xfgm5ZW18EKJBdE8GGvxutGy9d/1A=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB5106.namprd11.prod.outlook.com (2603:10b6:303:93::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 15:24:18 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 15:24:18 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v16 0/4] RDMA: Add dma-buf support
Thread-Topic: [PATCH v16 0/4] RDMA: Add dma-buf support
Thread-Index: AQHW0ybv5Bnk7Ef2+EKwhnBRO9bgTqoitKeQ
Date: Mon, 11 Jan 2021 15:24:18 +0000
Message-ID: <MW3PR11MB4555CCCDD42F1ADEC61F7ACAE5AB0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
In-Reply-To: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e30cff9b-c91d-43e6-915a-08d8b644f6b8
x-ms-traffictypediagnostic: CO1PR11MB5106:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB51063478ED4A9FFBEA4E61F5E5AB0@CO1PR11MB5106.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2JG1JQcliRqQP0QnC1ukhdVyn6JXy/9s/XLfBGZhiixupG/MqLoaPYiqndGUWoVzmY1INTUdDClwj15svR9lNDzP42CnV3m/VW3PJ+Ocqzos+OwnNRYPn9Fnwp2aLehbHNtfNa9qDM6mHBti0y4xyeE27maI5i69I0iE2B0z2gDbzxlVWxHsc5ATpq7qwzsuEDNDlEzgasgqda1+i3sbyVp7bu6j/Aev8W2sDfI0pP3YvQugMuSNNyD3UjaWN3yNaHxqRlSAMJ9Xp5GXBAqH7NOMNhYNtW8tPdVycDI32nkwGx7axoXMA9YImDxJ9VobVaspjS6+8nvT4IjWukagygR78d5/44ez5v0TNOptgJrKy92FRSb55+0LQp9uAh1p+l1OqYNaHdHdztw8H0Ou1G2ni82wj8ZcNrboOybPle66M+obSoM1BED0TR8W8QqxuT6um82ddCt9A5NGpdQjXg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(76116006)(966005)(4326008)(66946007)(7696005)(64756008)(71200400001)(53546011)(107886003)(86362001)(478600001)(52536014)(5660300002)(66446008)(66476007)(30864003)(9686003)(66556008)(110136005)(55016002)(83380400001)(8936002)(54906003)(26005)(8676002)(33656002)(186003)(6506007)(2906002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?i4SqBW7jub/xhS3b8upvzuIhXbcVBFp11ZRe+Q71/OhFJMklMElnyuuSvl3J?=
 =?us-ascii?Q?MaByIWRTwZw/YyyfSeiA0sTnxWltxQ9+zcCRn/7jqQ/k0FWHe1DExydtLCGr?=
 =?us-ascii?Q?plBj2ikOQLuI+Znj+f+x3ymuJlmsXAepQHgsHFxFewc9YVhqy7tXIysXizSV?=
 =?us-ascii?Q?tg7ksjeOgVWt/OuPKbpZAwENZPULZDM8i6tgeXuhcGW26dFc4wmWM38Y4C9X?=
 =?us-ascii?Q?BMGg5U01vo+EzbUYOuFom7XmGWhmvpOjMw5xSum8lIS2Wkw3rqrmg9ZwpEm7?=
 =?us-ascii?Q?KMSYT2GoXE3ccGuvqqnVYH6Oh7jmF6boRboPKMU+3NTtJxQX3MMMaeXiog74?=
 =?us-ascii?Q?Vdgm1LP/FwwN0rpNFoP0g+V25CF/Al/tIJZFCv9Jb9XhUdAXqZGk/fc3AGIO?=
 =?us-ascii?Q?TELPJp0fW64vgRjMFndhxzt4fqrE0E+AD62Vdh2eUDB5Oc/ziWCfSp0aEJr3?=
 =?us-ascii?Q?iFMINj2jLXzTzam2K3MnLvAI0Os+KqqTY5oZZev9sibGUiKfNEr4sYbK4mMj?=
 =?us-ascii?Q?MKYnDXNliB3lLNgWvW4UDRrlwSmEDAX1ApK1TD0nzuMXRxc1Fep3FQJg9Ru/?=
 =?us-ascii?Q?HSjc1MAlmt+17J9pW4qaN/WOHIX6F0qrZVfGcPwSKEZV4VCkzwavG2Yk8ESZ?=
 =?us-ascii?Q?EvWn1jvZ/awlceId4Zwp25bTCXyx0eowzJO1hifksjxinhhB074cY1tX2V4d?=
 =?us-ascii?Q?eXgBaIz1WaifKLz0xsHw6L91LMwfwXMTqi1DV3OwEOyUcjIqLe0uLCheuOem?=
 =?us-ascii?Q?1o/dL/cMkc8upo3igv4pQSH86VsqqUtuyyQJSZnqI9RW7nJMyp9YpuMm7HOy?=
 =?us-ascii?Q?iDHvzKE7vFOQxYmpiuL6VI1q9Sh1i34nrFfcqRbkUtr/AZh+/hrpoGt8kwY4?=
 =?us-ascii?Q?7z5c8HY6Zpv8oM/nPYv6/TLR7hdg0hjzvPAcl8mCPnNpaKZjOOmpmrv8lHV5?=
 =?us-ascii?Q?0XaWlHsPQLA7YAXqc6KQ17nwtKRE8BbNOr4wUv4nCxo=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e30cff9b-c91d-43e6-915a-08d8b644f6b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2021 15:24:18.4365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j2Z9O9XRKVa7qfBn4ZFg/2Ux1/eEwgdrqN4KaiRNQFQlvpsJ6BNAnODLh2CHc2iFU+Zs+BHr1L1PK1/0HU+gfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5106
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
Cc: Leon
 Romanovsky <leon@kernel.org>, Christian Koenig <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jason, will this series be able to get into 5.12?

> -----Original Message-----
> From: Xiong, Jianxin <jianxin.xiong@intel.com>
> Sent: Tuesday, December 15, 2020 1:27 PM
> To: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org
> Cc: Xiong, Jianxin <jianxin.xiong@intel.com>; Doug Ledford <dledford@redhat.com>; Jason Gunthorpe <jgg@ziepe.ca>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: [PATCH v16 0/4] RDMA: Add dma-buf support
> 
> This is the sixteenth version of the patch set. Changelog:
> 
> v16:
> * Add "select DMA_SHARED_BUFFER" to Kconfig when IB UMEM is enabled.
>   This fixes the auto build test error with a random config.
> 
> v15: https://www.spinics.net/lists/linux-rdma/msg98369.html
> * Rebase to the latest linux-rdma 'for-next' branch (commit 0583531bb9ef)
>   to pick up RDMA core and mlx5 updates
> * Let ib_umem_dmabuf_get() return 'struct ib_umem_dmabuf *' instead of
>   'struct ib_umem *'
> * Move the check of on demand paging support to mlx5_ib_reg_user_mr_dmabuf()
> * Check iova alignment at the entry point of the uverb command so that
>   mlx5_umem_dmabuf_default_pgsz() can always succeed
> 
> v14: https://www.spinics.net/lists/linux-rdma/msg98265.html
> * Check return value of dma_fence_wait()
> * Fix a dma-buf leak in ib_umem_dmabuf_get()
> * Fix return value type cast for ib_umem_dmabuf_get()
> * Return -EOPNOTSUPP instead of -EINVAL for unimplemented functions
> * Remove an unnecessary use of unlikely()
> * Remove left-over commit message resulted from rebase
> 
> v13: https://www.spinics.net/lists/linux-rdma/msg98227.html
> * Rebase to the latest linux-rdma 'for-next' branch (5.10.0-rc6+)
> * Check for device on-demand paging capability at the entry point of
>   the new verbs command to avoid calling device's reg_user_mr_dmabuf()
>   method when CONFIG_INFINIBAND_ON_DEMAND_PAGING is diabled.
> 
> v12: https://www.spinics.net/lists/linux-rdma/msg97943.html
> * Move the prototype of function ib_umem_dmabuf_release() to ib_umem.h
>   and remove umem_dmabuf.h
> * Break a line that is too long
> 
> v11: https://www.spinics.net/lists/linux-rdma/msg97860.html
> * Rework the parameter checking code inside ib_umem_dmabuf_get()
> * Fix incorrect error handling in the new verbs command handler
> * Put a duplicated code sequence for checking iova and setting page size
>   into a function
> * In the invalidation callback, check for if the buffer has been mapped
>   and thus the presence of a valid driver mr is ensured
> * The patch that checks for dma_virt_ops is dropped because it is no
>   longer needed
> * The patch that documents that dma-buf size is fixed has landed at:
>   https://cgit.freedesktop.org/drm/drm-misc/commit/?id=476b485be03c
>   and thus is no longer included here
> * The matching user space patch set is sent separately
> 
> v10: https://www.spinics.net/lists/linux-rdma/msg97483.html
> * Don't map the pages in ib_umem_dmabuf_get(); use the size information
>   of the dma-buf object to validate the umem size instead
> * Use PAGE_SIZE directly instead of use ib_umem_find_best_pgsz() when
>   the MR is created since the pages have not been mapped yet and dma-buf
>   requires PAGE_SIZE anyway
> * Always call mlx5_umem_find_best_pgsz() after mapping the pages to
>   verify that the page size requirement is satisfied
> * Add a patch to document that dma-buf size is fixed
> 
> v9: https://www.spinics.net/lists/linux-rdma/msg97432.html
> * Clean up the code for sg list in-place modification
> * Prevent dma-buf pages from being mapped multiple times
> * Map the pages in ib_umem_dmabuf_get() so that inproper values of
>   address/length/iova can be caught early
> * Check for unsupported flags in the new uverbs command
> * Add missing uverbs_finalize_uobj_create()
> * Sort uverbs objects by name
> * Fix formating issue -- unnecessary alignment of '='
> * Unmap pages in mlx5_ib_fence_dmabuf_mr()
> * Remove address range checking from pagefault_dmabuf_mr()
> 
> v8: https://www.spinics.net/lists/linux-rdma/msg97370.html
> * Modify the dma-buf sg list in place to get a proper umem sg list and
>   restore it before calling dma_buf_unmap_attachment()
> * Validate the umem sg list with ib_umem_find_best_pgsz()
> * Remove the logic for slicing the sg list at runtime
> 
> v7: https://www.spinics.net/lists/linux-rdma/msg97297.html
> * Rebase on top of latest mlx5 MR patch series
> * Slice dma-buf sg list at runtime instead of creating a new list
> * Preload the buffer page mapping when the MR is created
> * Move the 'dma_virt_ops' check into dma_buf_dynamic_attach()
> 
> v6: https://www.spinics.net/lists/linux-rdma/msg96923.html
> * Move the dma-buf invalidation callback from the core to the device
>   driver
> * Move mapping update from work queue to pagefault handler
> * Add dma-buf based MRs to the xarray of mmkeys so that the pagefault
>   handler can be reached
> * Update the new driver method and uverbs command signature by changing
>   the paramter 'addr' to 'offset'
> * Modify the sg list returned from dma_buf_map_attachment() based on
>   the parameters 'offset' and 'length'
> * Don't import dma-buf if 'dma_virt_ops' is used by the dma device
> * The patch that clarifies dma-buf sg lists alignment has landed at
>   https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ac80cd17a615
>   and thus is no longer included with this set
> 
> v5: https://www.spinics.net/lists/linux-rdma/msg96786.html
> * Fix a few warnings reported by kernel test robot:
>     - no previous prototype for function 'ib_umem_dmabuf_release'
>     - no previous prototype for function 'ib_umem_dmabuf_map_pages'
>     - comparison of distinct pointer types in 'check_add_overflow'
> * Add comment for the wait between getting the dma-buf sg tagle and
>   updating the NIC page table
> 
> v4: https://www.spinics.net/lists/linux-rdma/msg96767.html
> * Add a new ib_device method reg_user_mr_dmabuf() instead of expanding
>   the existing method reg_user_mr()
> * Use a separate code flow for dma-buf instead of adding special cases
>   to the ODP memory region code path
> * In invalidation callback, new mapping is updated as whole using work
>   queue instead of being updated in page granularity in the page fault
>   handler
> * Use dma_resv_get_excl() and dma_fence_wait() to ensure the content of
>   the pages have been moved to the new location before the new mapping
>   is programmed into the NIC
> * Add code to the ODP page fault handler to check the mapping status
> * The new access flag added in v3 is removed.
> * The checking for on-demand paging support in the new uverbs command
>   is removed because it is implied by implementing the new ib_device
>   method
> * Clarify that dma-buf sg lists are page aligned
> 
> v3: https://www.spinics.net/lists/linux-rdma/msg96330.html
> * Use dma_buf_dynamic_attach() instead of dma_buf_attach()
> * Use on-demand paging mechanism to avoid pinning the GPU memory
> * Instead of adding a new parameter to the device method for memory
>   registration, pass all the attributes including the file descriptor
>   as a structure
> * Define a new access flag for dma-buf based memory region
> * Check for on-demand paging support in the new uverbs command
> 
> v2: https://www.spinics.net/lists/linux-rdma/msg93643.html
> * The Kconfig option is removed. There is no dependence issue since
>   dma-buf driver is always enabled.
> * The declaration of new data structure and functions is reorganized to
>   minimize the visibility of the changes.
> * The new uverbs command now goes through ioctl() instead of write().
> * The rereg functionality is removed.
> * Instead of adding new device method for dma-buf specific registration,
>   existing method is extended to accept an extra parameter.
> * The correct function is now used for address range checking.
> 
> v1: https://www.spinics.net/lists/linux-rdma/msg90720.html
> * The initial patch set
> * Implement core functions for importing and mapping dma-buf
> * Use dma-buf static attach interface
> * Add two ib_device methods reg_user_mr_fd() and rereg_user_mr_fd()
> * Add two uverbs commands via the write() interface
> * Add Kconfig option
> * Add dma-buf support to mlx5 device
> 
> When enabled, an RDMA capable NIC can perform peer-to-peer transactions over PCIe to access the local memory located on another
> device. This can often lead to better performance than using a system memory buffer for RDMA and copying data between the buffer and
> device memory.
> 
> Current kernel RDMA stack uses get_user_pages() to pin the physical pages backing the user buffer and uses dma_map_sg_attrs() to get the
> dma addresses for memory access. This usually doesn't work for peer device memory due to the lack of associated page structures.
> 
> Several mechanisms exist today to facilitate device memory access.
> 
> ZONE_DEVICE is a new zone for device memory in the memory management subsystem. It allows pages from device memory being
> described with specialized page structures, but what can be done with these page structures may be different from system memory.
> ZONE_DEVICE is further specialized into multiple memory types, such as one type for PCI p2pmem/p2pdma and one type for HMM.
> 
> PCI p2pmem/p2pdma uses ZONE_DEVICE to represent device memory residing in a PCI BAR and provides a set of calls to publish, discover,
> allocate, and map such memory for peer-to-peer transactions. One feature of the API is that the buffer is allocated by the side that does the
> DMA transfer. This works well with the storage usage case, but is awkward with GPU-NIC communication, where typically the buffer is
> allocated by the GPU driver rather than the NIC driver.
> 
> Heterogeneous Memory Management (HMM) utilizes mmu_interval_notifier and ZONE_DEVICE to support shared virtual address space and
> page migration between system memory and device memory. HMM doesn't support pinning device memory because pages located on
> device must be able to migrate to system memory when accessed by CPU. Peer-to-peer access is currently not supported by HMM.
> 
> Dma-buf is a standard mechanism for sharing buffers among different device drivers. The buffer to be shared is exported by the owning
> driver and imported by the driver that wants to use it. The exporter provides a set of ops that the importer can call to pin and map the
> buffer. In addition, a file descriptor can be associated with a dma- buf object as the handle that can be passed to user space.
> 
> This patch series adds dma-buf importer role to the RDMA driver in attempt to support RDMA using device memory such as GPU VRAM.
> Dma-buf is chosen for a few reasons: first, the API is relatively simple and allows a lot of flexibility in implementing the buffer manipulation
> ops.
> Second, it doesn't require page structure. Third, dma-buf is already supported in many GPU drivers. However, we are aware that existing
> GPU drivers don't allow pinning device memory via the dma-buf interface.
> Pinning would simply cause the backing storage to migrate to system RAM.
> True peer-to-peer access is only possible using dynamic attach, which requires on-demand paging support from the NIC to work. For this
> reason, this series only works with ODP capable NICs.
> 
> This series consists of four patches. The first patch adds the common code for importing dma-buf from a file descriptor and mapping the
> dma-buf pages. Patch 2 add the new driver method reg_user_mr_dmabuf().
> Patch 3 adds a new uverbs command for registering dma-buf based memory region. Patch 4 adds dma-buf support to the mlx5 driver.
> 
> Related user space RDMA library changes are provided as a separate patch series.
> 
> Jianxin Xiong (4):
>   RDMA/umem: Support importing dma-buf as user memory region
>   RDMA/core: Add device method for registering dma-buf based memory
>     region
>   RDMA/uverbs: Add uverbs command for dma-buf based MR registration
>   RDMA/mlx5: Support dma-buf based userspace memory region
> 
>  drivers/infiniband/Kconfig                    |   1 +
>  drivers/infiniband/core/Makefile              |   2 +-
>  drivers/infiniband/core/device.c              |   1 +
>  drivers/infiniband/core/umem.c                |   3 +
>  drivers/infiniband/core/umem_dmabuf.c         | 174 ++++++++++++++++++++++++++
>  drivers/infiniband/core/uverbs_std_types_mr.c | 117 ++++++++++++++++-
>  drivers/infiniband/hw/mlx5/main.c             |   2 +
>  drivers/infiniband/hw/mlx5/mlx5_ib.h          |  18 +++
>  drivers/infiniband/hw/mlx5/mr.c               | 112 ++++++++++++++++-
>  drivers/infiniband/hw/mlx5/odp.c              |  89 ++++++++++++-
>  include/rdma/ib_umem.h                        |  48 ++++++-
>  include/rdma/ib_verbs.h                       |   6 +-
>  include/uapi/rdma/ib_user_ioctl_cmds.h        |  14 +++
>  13 files changed, 573 insertions(+), 14 deletions(-)  create mode 100644 drivers/infiniband/core/umem_dmabuf.c
> 
> --
> 1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
