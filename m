Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHYQAUYdemlS2QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 15:29:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8CAA2C8D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 15:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762D010E701;
	Wed, 28 Jan 2026 14:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pfrrYP6t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010066.outbound.protection.outlook.com [52.101.46.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC8A10E701;
 Wed, 28 Jan 2026 14:29:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHmlPA5jgiXf+YmoVpKb3qgpC78vvUE65J+RaNGXdGYoK1aXf5/a3ypM1oEW5/r229PHl9pG6k181A2ehb4hyi+BCEiF+nlwHjOlRgP6Kanwi4KH452lZ5SeTdN/I2bNNhvvdavf4NlI/HdLbHPnwCQwOp/Wp68VOQCc+8IJfj4JXEJADt3DfDcY0085CuNy9BxCjQtqQCP3JGHszw1XRLoUSccpnS0/oTqDK4ni88QVVUa1bwY0mSfdECdfFyfWkv0ZbnuCWSetUFDT9HzvMY/YTa0RVlTeaRqPSgBaasuPHsRc9n3s5cIUtBHwJejuoS+3QQ3tkEndGuSFfAoQhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VviwzL0c5V3jcl8ccWZf7xLsPp2ihbzqpzkTQIAmJj0=;
 b=tcacNKP2pMBHAEpMWDbOhG52nltewBzmN4VPHrg0GGcsFexmuLqQwi6IG+h60La0FNfzgQ2E55zdiPDHm9ucF4JVwVokpORWDRsVg3wPF+8+NgcbxGr8XyV7IRw9EOTJH86pNfI8M5BPR19WR0J43BMsfpRA6i59Na6kRLoNI4qiUjeVtQuUnDTrJLYqRLNlB3wMwcgE3rAChHb/EIB2Ndvvs8TM7+R73AGlFkADZL0BrUn/cwUfvnydtH0i4Ly6C+EbVogSSPx0O0Zh6XmDK17zSkGwuw4QfwWujIdm+ld2rclB/aMBUk5AZ7DHA4iFveLLUFv/xMfTrcZKXyw8IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VviwzL0c5V3jcl8ccWZf7xLsPp2ihbzqpzkTQIAmJj0=;
 b=pfrrYP6t6UaW9leI453809M8ETGFBUMsijSaHSOVhqffVb5ZUiiRctQVGmYYdcDu0RygIFWnGYhAQIbQC25SHuJ6NhfQKSekYT6RwKnhHBQZh4q+Yh4jYg33Jsrqm8RqJMfEZcxmsXlEWTDMyJ7DOuuCzeyNprp1oxheGBU0+jlKLjT0ed2++Qq+Lfl/NRn1SGDD2A+9uC8Md2oawjIsNUIAztz/+7liGKSVfxNCdWgYaH6baJCycDMiYGpR2aUTcOEh7JbL+rvHkhY4CpZsFB6cLyuFAEpTTOADL/UxO2roQVqPKjqRKrouMs1zNYstNEoZI6TX3Agcu0iby+5TuQ==
Received: from SJ0PR05CA0032.namprd05.prod.outlook.com (2603:10b6:a03:33f::7)
 by CY3PR12MB9677.namprd12.prod.outlook.com (2603:10b6:930:101::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 14:29:16 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::a4) by SJ0PR05CA0032.outlook.office365.com
 (2603:10b6:a03:33f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 14:29:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 14:29:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 06:28:57 -0800
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 06:28:56 -0800
Date: Wed, 28 Jan 2026 16:28:53 +0200
From: Leon Romanovsky <leonro@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <francois.dugast@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <jgg@ziepe.ca>
Subject: Re: [RFC PATCH v3 04/11] drm/pagemap: Use dma-map IOVA alloc, link,
 and sync API for DRM pagemap
Message-ID: <20260128142853.GH40916@unreal>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-5-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260128004841.2436896-5-matthew.brost@intel.com>
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|CY3PR12MB9677:EE_
X-MS-Office365-Filtering-Correlation-Id: feae94e3-ad30-4909-a5c3-08de5e799db8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xQOMXNS7dlT7Iw7xgM4KiNOs2gENG1xIqcJRzh5Bg7yWPCN1zKnfKy7YKeZG?=
 =?us-ascii?Q?2o1D+q/IimO2Ehp7sZtM34625PKsd3ZKjAo/5rsJOHIfgzzj+r+8gNio8Z4K?=
 =?us-ascii?Q?/NPxpNUW9XXbNg6f550Bwn4yOUxDvp2F/elwYHIhb0N5CWINUPg/tPB8ng1P?=
 =?us-ascii?Q?AXPMEmZW3UUjILRhPRzsgO5yEPpBieSPzDT1qpY/ovUDcxQOaZUJdu38yeNm?=
 =?us-ascii?Q?4lFfR7PyQ4iBgxikr5pu9s4S7t3kLFj2wCr3P4rBD0Qb1ZWPSrGbvdklDkzJ?=
 =?us-ascii?Q?I63+98DLebi0xj/YbAo37HqZdauHJBWHGJcnpe6i8Oz63NXSdZN3J0XV0nLx?=
 =?us-ascii?Q?P8Y6qmt7XoZkLqPcvSUwWvVX3vOR+CDi/Nsga3UvthGmQeRTgxld+t08TI5u?=
 =?us-ascii?Q?dAkQ3i+eBaa7jdSojVO4TGnm+2bVBfPF/7b6Y/etGabhPP2R3r+OonRQSBus?=
 =?us-ascii?Q?/Re2cwGZTcKkA3wNCqDQQf1OKOCMvcN2Uxp5e9bWAVACV88H4blW/+3Oog+c?=
 =?us-ascii?Q?iPoLGgEsoO9IldWDHZMa4gozxZ18fW6t1HdXJu5se78PVkyRDnf6WZYnStD9?=
 =?us-ascii?Q?3aOwGVgPFLaVc/I+uRQ/bHLwNiAohsFDh5zhN7/JeQ7+UzZ0z/s9uBZBBUj8?=
 =?us-ascii?Q?V0i/NMiwQpZ4E9SrHN1rKzhRHQw1BjTx/w6A+2P+ZpF74h1uv3pfxFfjwG/L?=
 =?us-ascii?Q?Du6F0MZzstK4tMnb1gxS2acYp0tm4gGkkHZ4QSjySgysslAiNlpwOfwAQYVa?=
 =?us-ascii?Q?CQt/wjRnecUokeNn5wVV0yxN9DL8LhWAiOCE1E9y0NOTZzJXJ3bFlfPRl3J5?=
 =?us-ascii?Q?L0nRgffzaPP6zLnlVnewD2FK7jC0I+MOs9R+qLzgUpnNuogH3PBFu3przi1v?=
 =?us-ascii?Q?Z6RoacpsMqIIEwW/m0OFaIzkGcwVO9qBw5aC0rBOz7s5mFz79pAFvjVfcs6T?=
 =?us-ascii?Q?IdD7+PrgULQUs0mMYl/8jG3zrICSzjbhgUOYI/I3dUxc7YmRzigbl0PdSHnS?=
 =?us-ascii?Q?kStmgxTOpiENi6hyl2+oKvV1vC/ukpBBkNJt0Z3+weAfRoIUD36ilQyQKe0P?=
 =?us-ascii?Q?PxDuvB/DQeXYoMmpkIfE+w/sDf/XTwdy2cmgQB8ikc96FgVDfnK74O9br8Qd?=
 =?us-ascii?Q?zz1ba7UFYA+l2+XPYr+Q6VWXtjSqZ9JuJdMb1X9Jk3iwEOtl7MaApNrB29yh?=
 =?us-ascii?Q?9otMOpTLvN+MiNF8C5Fln/aS/Fflzc7zZlqZ4jcWqK4rm8hEPj5k2/X1WUCV?=
 =?us-ascii?Q?dA8uFDTE/9ZzfVi9UdG1saXEjOv6SMviOjuJqa7V/Bu0ZVgMentAo9apue1w?=
 =?us-ascii?Q?cxcZdT7RvF73CUISrsV/RLzY6P7o1Hc8nch60T1WxGbA0UQ3dXL2AZH4JXt+?=
 =?us-ascii?Q?jnFJ97yk4YkG3O1KVRnLchuiNC4nJOV2fgnL6X55i3MWO6z3Ufs4njVtPF4x?=
 =?us-ascii?Q?82KFrE/eFPh4N5MjM1Bi1tzx5MVjEeSfUdqDrTZxUJYG+Xto1uJUl9/bLbY2?=
 =?us-ascii?Q?+vRnqaLmB3qouAAruJSedOf3tWfR3YrxqQ9f/Bpma3V1q3ubJC7FUiOoW6GJ?=
 =?us-ascii?Q?EBuJ0/B+6z2KQDNsIS9o9c6NO96G2wjUMFzN4Op+f1HqrErbDAfH73UxIXEz?=
 =?us-ascii?Q?dvz6aI83Xw5LFJNytejWenVNgfUMF5YuCyRi/oAsXhkFr8sTkjh+01cOCob0?=
 =?us-ascii?Q?OI/eAA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:29:16.2684 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feae94e3-ad30-4909-a5c3-08de5e799db8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9677
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leonro@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F8CAA2C8D
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 04:48:34PM -0800, Matthew Brost wrote:
> The dma-map IOVA alloc, link, and sync APIs perform significantly better
> than dma-map / dma-unmap, as they avoid costly IOMMU synchronizations.
> This difference is especially noticeable when mapping a 2MB region in
> 4KB pages.
> 
> Use the IOVA alloc, link, and sync APIs for DRM pagemap, which create DMA
> mappings between the CPU and GPU for copying data.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 121 +++++++++++++++++++++++++++-------
>  1 file changed, 96 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 4b79d4019453..b928c89f4bd1 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -287,6 +287,7 @@ drm_pagemap_migrate_map_device_pages(struct device *dev,
>   * @migrate_pfn: Array of page frame numbers of system pages or peer pages to map.
>   * @npages: Number of system pages or peer pages to map.
>   * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> + * @state: DMA IOVA state for mapping.
>   *
>   * This function maps pages of memory for migration usage in GPU SVM. It
>   * iterates over each page frame number provided in @migrate_pfn, maps the
> @@ -300,26 +301,79 @@ drm_pagemap_migrate_map_system_pages(struct device *dev,
>  				     struct drm_pagemap_addr *pagemap_addr,
>  				     unsigned long *migrate_pfn,
>  				     unsigned long npages,
> -				     enum dma_data_direction dir)
> +				     enum dma_data_direction dir,
> +				     struct dma_iova_state *state)
>  {
> -	unsigned long i;
> +	struct page *dummy_page = NULL;
> +	unsigned long i, psize;
> +	bool try_alloc = false;
>  
>  	for (i = 0; i < npages;) {
>  		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> -		dma_addr_t dma_addr;
> -		struct folio *folio;
> +		dma_addr_t dma_addr = -1;
>  		unsigned int order = 0;
>  
> -		if (!page)
> -			goto next;
> +		if (!page) {
> +			if (!dummy_page)
> +				goto next;
>  
> -		WARN_ON_ONCE(is_device_private_page(page));
> -		folio = page_folio(page);
> -		order = folio_order(folio);
> +			page = dummy_page;

Why is this dummy_page required? Is it intended to introduce holes in the
IOVA space? If so, what necessitates those holes? You can have less mapped
than IOVA and dma_iova_*() API can handle it.

Thanks
