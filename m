Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NdVLxoGlWl5KAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:21:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB3215235F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF4B10E2B9;
	Wed, 18 Feb 2026 00:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RInCo3mf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010026.outbound.protection.outlook.com
 [40.93.198.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4F810E155;
 Wed, 18 Feb 2026 00:21:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rN4YAOiqniceSJGEG7W81gYzdUMJVXEUPYM6xbgz5tP87eSedd62ETy6Er5tf3fWeVXW8O6EJMF9VTBk9dYaGzUXqv3XWdxdzltQUQN2ginLAph0GrP/qVzFv18PsNJt/TrwLocjhbnNUoIzpbExgQFszQcvuvP8z7x3Pf50mt0YLhmHzVBM7cQRLhoLFtrRBOJt+xmW7sesX4ZBPo9+QQtMPPV4EQOaB/2jzlqLsWCPwJxQ4BPricE/kGSgijtU9lIqGUzrl109EOWymrI1JGscvXh3wuqjTTSeggTStt5869XgKmO09wpgj5T4orKA861SK+zLRL2s+AhuYdA6IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUj850n4OQhSIsY62PfTVBCEvGRwmMWbBRFpG25Xk5c=;
 b=OdHRkYe0eaRMpnAdlmRtRiOebaZ6oIA05aBOB92QlEEsjMt8DuU4G+UM0+kP3J84UjekK+X73LmVMqHetev0/x5rjTjqD+2jmWVOG8hZtg9nCTJFZXOhSX6w65zvo8WJybnL4QxIouxh8+RLbzeNJs1fylwyAlvGGCe9HzRl0AaQ6AXK9GYu5+imYh672aS2nvJtVO3X1J5Z+UvT8QTlCXQ5IwiyvLQ7X8SL/RiQisMxXVFIuQKyrts9aU4K3n/rOCBWJkoUlQuYDsha2Cl05oeGY6tZZAvRyLeFwEzrF3aeuA956G18p3/QCXZxu6kyRmhyVdmGSxgHMnqEIqJqBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUj850n4OQhSIsY62PfTVBCEvGRwmMWbBRFpG25Xk5c=;
 b=RInCo3mfx9HNPI5oIMnV2OUzT55/w//7NCZpQtl2fJCFsCAgBhZNpi/3upR5NJwRTR+hC/6mCGiYughcE6arc0Gxa54Wr02+8TygRXgrwauQwXhM9bJKxgoU6rfSVHhdh2anjkJD3bi7MwLdG2S3gpC69vA198WHAr+PZxb/+WPRRUcGHiAo2GozAe4uJea+rD1Kkdleq6kAPIHHR1MHd80V2a+Ljt1Ej8cguOIKR000eJg55ai8OIPxPfMhAx7ygZmnz4AhsgsouG6xpwY1lo5/dZLUuvvhOPMGZD2Ic90SwkO9SU6zVmTSwFrVpF+VlWi5oQxmGSqfJyGySEIBEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY3PR12MB9629.namprd12.prod.outlook.com (2603:10b6:930:101::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 00:21:37 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:21:37 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: 
Cc: Christian Koenig <christian.koenig@amd.com>,
 Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
 Kevin Tian <kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH RFC 24/26] iommufd: Support DMA-bufs with multiple physical
 ranges
Date: Tue, 17 Feb 2026 20:11:55 -0400
Message-ID: <24-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0058.namprd15.prod.outlook.com
 (2603:10b6:208:237::27) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY3PR12MB9629:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf1ba7a-132f-48d1-bbfa-08de6e83adf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wAzoS7+W/KzQYr9PTA/YruD4gJ0qQIC29mIaWsIxEVV6ETAFGw4sckZfvR03?=
 =?us-ascii?Q?sKIIdcFLrtDOae7081kOgSskbSmcgXYdlU/Mfkfo9Vm0pN4hTz43bsgNEZm0?=
 =?us-ascii?Q?RTmeDgaacEUFpmvhNSN6TG/dXHP3u9wFKUhPQKUOfwyg2gpK+H7vAxYVlORY?=
 =?us-ascii?Q?RuFjSi2KrVZF7bf/zhfsQx2hhgJaiP0TrungCHIf20IPp3Xr+Gb7xGI/uQcv?=
 =?us-ascii?Q?m9Zvv0IfMQN3OcHWCwOtnCRuH9M8fbQz12i84c/HKqgnXRx4JuHdexKpWUUo?=
 =?us-ascii?Q?27HG4/KaUoMhZrkmmG63XX4txhzw6WmqPDXENY9FheDHTV/JZNLQOwDPIlNj?=
 =?us-ascii?Q?Aob74BvuI3zTHBBwX16DyttzmzFZXcnaeLXCnP9a4lXyX6yJEadFERWAIlMn?=
 =?us-ascii?Q?0yJWZS1M7I7FGUr8brsY/nSGiSAAN+Hks8WYdJDF6nDzWA+hISzVRh3csD0B?=
 =?us-ascii?Q?AK2fAPm1B2wlkAahuLFfi6tG3C4dNLnFbWR8zm7WmqWUpwNC0lZdBsorSTpO?=
 =?us-ascii?Q?BU9Fxx3OyGkmrXcOqGrt3VqfvFTFA2p+yRg4ydm3Qc5+lYmHy4YBd0oQ0WDK?=
 =?us-ascii?Q?9a1kdxgmOg8uMbTOE49WdhNJ07TGAV8xepr6JwqAh1hoXCDcH/VrS5mrpl2T?=
 =?us-ascii?Q?l4i5D/QOk3yqetu2TM3rMXQBm0jZbjEjjz2kopAq8IjtaYdrfgCpupoRi5Yt?=
 =?us-ascii?Q?h+03X92kAihMUblDw5jIFdP1XFUxPdkX2Ptj3PZuGiGl95v4i7fgachzKBjl?=
 =?us-ascii?Q?6yhBhw83QRa9fJfX7u5sGw7f5jKiKdGc4fxL6gf5ADIatmsRWm3DwUpKdcto?=
 =?us-ascii?Q?uSIH4edta0sVUi8t7ZJgeBUVCDN3NpE7jRadhYVaG8YldFjMxDzfVYh+RykV?=
 =?us-ascii?Q?YO9N/8LqsSvkkd1HFgi8g/ulq/THhOjO8NDRQxKy4dbTSuOkHq2gMx0fCg3G?=
 =?us-ascii?Q?Hu38gJRv3jigPw5dow+U9Mb3r9HDVELPS1VBVpy2KV4jYjMv9ShOoLkXW927?=
 =?us-ascii?Q?SWoeDwOH5bQBRF2QVwORPL0g81w/3K4rZ0RmYbtK3mGG1cyQHnuiNQTADrT8?=
 =?us-ascii?Q?o9BaQ4LwGMF2o/jYVtPEXQNorRK+04DXRi0cme4zJT7AaIdspPMFHIaLjZI5?=
 =?us-ascii?Q?N0fvJMHZ+i/AgMObbDCOnEq+K6dng/p46Vf0hrnCWyMzpeDM3b8ofDqshGjI?=
 =?us-ascii?Q?ghb6v7bpG2n7ChjbTPGSxMu+294z+vqpTPAMrvwwZKsFkHCyk2UAonkCwyp1?=
 =?us-ascii?Q?6yxcOMLh65/vjjQDQYvdBjY/ihd2Jb1FqcDr6bu9BRbCKrsaEovkr4h62S+R?=
 =?us-ascii?Q?3jVM/D093GfY+FzeW9kslyCCnc0SMdc6IPGTv8ZZ9Fehx9QsaezoS17DHOAh?=
 =?us-ascii?Q?x0ZhjYo21amJ4Fihpw2RD7PB2jWzbsH6L30uwGII25lTFGVnx47eTBacd/Nc?=
 =?us-ascii?Q?YqN0YhydUWkg27RU224GaG4RTNNQycbYVkEFQEiAYAnvbgpcLBTbtD/DFnJM?=
 =?us-ascii?Q?7dZfux+CJJpXLnVWVAkHGZElkqgsm45tYr9VOV7Np1ThATK4j5tW2sEWDC6y?=
 =?us-ascii?Q?AzPHEsnTsXBifk6S4LI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C5lOi4Z1P5GrnYJrSBbKpAngoh21bvoecMWfQD+7PFLAlkY06C9dKy8bTEDO?=
 =?us-ascii?Q?vvpsS0Oy5IBKLFK13BImamroG4JJAeM2CSC5m0nVEHU1CbryaYTMtWHMRfo9?=
 =?us-ascii?Q?FyoWNSdpsIksHYtBPQMMny8GiNY38iUVu+P4HDoEOgfU6T4zseCMG/TRAC50?=
 =?us-ascii?Q?4ha7DDkzwxJygOAH9QULAfAhbNTevgOR6TaqerXlEPHLMuHEagarWPGIUtcr?=
 =?us-ascii?Q?TSjMIqFpxsNR0TlcXwXCsCYERN0TpOfbnZb7Hitn/+pzuGn9xOx0DankOf4z?=
 =?us-ascii?Q?0qw2KBlh5NKdE4Q3wEYh0NedJsOCR7lNXPGpt85iRu4k7nAQ8wjiuheo0ZPG?=
 =?us-ascii?Q?XFY6jDSmXNVACkWHIOOXw41l6ClJ/RHc3D9KgSs9KSx6eHtF0zHJi6uI3DHS?=
 =?us-ascii?Q?Y7wiAaLLQdDyMS9fyZkY4IteKeevJXIvLFkOEv7NEU7zPlR9aB12XCgH4JyC?=
 =?us-ascii?Q?JBYSnZ5EaVZL+zQ7GsM6dmUgmt0C3yqJF+2FDcx4FZjCj9avrIgUdxlQwfnH?=
 =?us-ascii?Q?Su1VkGY6y59KGGFmiuvyJukxFjKdgrndochfleX1Ts8bubJPTshcF3ew/PQ2?=
 =?us-ascii?Q?2QzYvR+TGQoj01/Q8ZmK4XlCt1aD5i8iLC2LB22wisWAaD4sO0Dw9+95X8dX?=
 =?us-ascii?Q?3cDalqXgM73fXP0QSEQ0A5jIxSVbC1f0UM3G21oAio11bUxpb4lSPvdMwqca?=
 =?us-ascii?Q?y30+H5TuHeCYzl9y/RajjpXHaBLnaRvvRPgNuofVqqwM+BqmSHXBFSFW0ESa?=
 =?us-ascii?Q?Ba1MU1jfj3vBLTzSSKEE+f+iMn0UlY0T9iFHEeup7M0BLblChVd34uquLbPq?=
 =?us-ascii?Q?nh2aDOt3F18xRAzVdrhuYhdwLxD+4O9arINP6pU02TSg+wSrdL1raSwpffWe?=
 =?us-ascii?Q?jJ96xaYgKcDks5hmfHI/xMHd2pSlD1zn24E6T5RCs09QtBLjJKEBTT6i7n33?=
 =?us-ascii?Q?XDz/QXNOI26OPHsMLzkutJQpCV96m5Mrx2FOr3wE7l2/VTg4EC5qje4llR0a?=
 =?us-ascii?Q?KtinkMjEEGgJOXjkr1ZThTb6s0UTFA+iuBjr0W4UtDwLGxnhjhsLmD7YmydL?=
 =?us-ascii?Q?NosTFSU4spt+u8j8wfXnVuh+yxwWWmmXj6PhyKmN8rZfE7yMIC9EBP2STW/V?=
 =?us-ascii?Q?2GQEmTVvF2oWJc295/Id7QxBvF1+Evdk3PoUahOsGQajM9MNUqmTp3ECb3/E?=
 =?us-ascii?Q?uOneHBfvbqAfcXl0wK47uO8gDlgVh9iqpat5UkQNl4oiG6aprjvWcy5fJ68h?=
 =?us-ascii?Q?aQrL8fvgR4HjXjyXM7DaGTfR4i9KVK4GOZEXd2312tE+phxfin3EBcoWZd+I?=
 =?us-ascii?Q?RDo4G29gVpx+6GRa95InIJ4bGAT1uhQvKK5QVa2dlfpMCaG2U3n/Rpgtqde3?=
 =?us-ascii?Q?fbAGjjU2v9ieMU3CB5jfjNqN7xr91TPMeC6NLZ4mkhsAKunv3a9cGwAzcK1H?=
 =?us-ascii?Q?1vFfKcXnG89dIK2OG79ceoh7krnzHVzRXvphYNZcK3qAheF0Cl4fg+tDmS5D?=
 =?us-ascii?Q?5Z8oLoQT/v/RFxG0TME/m1GypOJP+wsujHZfHVHaq8m2iNh6aIK2tXx9eR3E?=
 =?us-ascii?Q?Hi+4dfRGKK1DUPomSRO8oMzvb8ro0FbR/InR0QXiOprk2asotDz709NqRXTv?=
 =?us-ascii?Q?7ZQ3tBG0x1aoWl0gZ/RbZZ+an+bsz431PoK3cdjhvEfdsC76mhYeYwLNmBtd?=
 =?us-ascii?Q?07f2LqZu8H3T2rP9gEohev3oK2qPl+9404QZ9CNos3zF/e+7ZVH/N1sl9mOH?=
 =?us-ascii?Q?dA88XvdLRQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf1ba7a-132f-48d1-bbfa-08de6e83adf3
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:21:37.3218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11iATgK4InHtC3YPGTWCvZk1Shv//rjNWRe89X0dUJ1LApOxeXZXF7VqmcjToCe+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9629
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 2BB3215235F
X-Rspamd-Action: no action

Support the full list of physical address protocol. This requires seeking
to the correct start entry in the physical list and maintaing the current
offset as the population progresses.

Remove the phys field related to the replaced single entry version.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommufd/io_pagetable.h |  3 +-
 drivers/iommu/iommufd/pages.c        | 48 ++++++++++++++++++++--------
 2 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/iommufd/io_pagetable.h b/drivers/iommu/iommufd/io_pagetable.h
index fcd1a2c75dfa3d..3c95b631d86354 100644
--- a/drivers/iommu/iommufd/io_pagetable.h
+++ b/drivers/iommu/iommufd/io_pagetable.h
@@ -203,7 +203,6 @@ struct iopt_pages_dmabuf_track {
 struct iopt_pages_dmabuf {
 	struct dma_buf_attachment *attach;
 	struct dma_buf_phys_list *exp_phys;
-	struct dma_buf_phys_vec phys;
 	/* Always PAGE_SIZE aligned */
 	unsigned long start;
 	struct list_head tracker;
@@ -260,7 +259,7 @@ static inline bool iopt_dmabuf_revoked(struct iopt_pages *pages)
 {
 	lockdep_assert_held(&pages->mutex);
 	if (iopt_is_dmabuf(pages))
-		return pages->dmabuf.phys.len == 0;
+		return pages->dmabuf.exp_phys == NULL;
 	return false;
 }
 
diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 9a23c3e30959a9..85cb1f9ab2ae91 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1078,7 +1078,9 @@ static int pfn_reader_user_update_pinned(struct pfn_reader_user *user,
 }
 
 struct pfn_reader_dmabuf {
-	struct dma_buf_phys_vec phys;
+	struct dma_buf_phys_list *exp_phys;
+	unsigned int cur_index;
+	unsigned long cur_base;
 	unsigned long start_offset;
 };
 
@@ -1089,8 +1091,10 @@ static int pfn_reader_dmabuf_init(struct pfn_reader_dmabuf *dmabuf,
 	if (WARN_ON(iopt_dmabuf_revoked(pages)))
 		return -EINVAL;
 
-	dmabuf->phys = pages->dmabuf.phys;
+	dmabuf->exp_phys = pages->dmabuf.exp_phys;
 	dmabuf->start_offset = pages->dmabuf.start;
+	dmabuf->cur_index = 0;
+	dmabuf->cur_base = 0;
 	return 0;
 }
 
@@ -1100,6 +1104,15 @@ static int pfn_reader_fill_dmabuf(struct pfn_reader_dmabuf *dmabuf,
 				  unsigned long last_index)
 {
 	unsigned long start = dmabuf->start_offset + start_index * PAGE_SIZE;
+	unsigned long npages = last_index - start_index + 1;
+	struct dma_buf_phys_vec *vec =
+		&dmabuf->exp_phys->phys[dmabuf->cur_index];
+
+	while (dmabuf->cur_base + vec->len <= start) {
+		dmabuf->cur_base += vec->len;
+		dmabuf->cur_index++;
+		vec++;
+	}
 
 	/*
 	 * start/last_index and start are all PAGE_SIZE aligned, the batch is
@@ -1107,8 +1120,25 @@ static int pfn_reader_fill_dmabuf(struct pfn_reader_dmabuf *dmabuf,
 	 * If the dmabuf has been sliced on a sub page offset then the common
 	 * batch to domain code will adjust it before mapping to the domain.
 	 */
-	batch_add_pfn_num(batch, PHYS_PFN(dmabuf->phys.paddr + start),
-			  last_index - start_index + 1, BATCH_MMIO);
+	while (npages) {
+		unsigned long offset_in_entry = start - dmabuf->cur_base;
+		unsigned long avail_pages = (vec->len - offset_in_entry) >>
+					    PAGE_SHIFT;
+		unsigned long nr = min(npages, avail_pages);
+
+		if (!batch_add_pfn_num(
+			    batch, (vec->paddr + offset_in_entry) >> PAGE_SHIFT,
+			    nr, BATCH_MMIO))
+			break;
+
+		start += nr * PAGE_SIZE;
+		npages -= nr;
+		if (nr == avail_pages) {
+			dmabuf->cur_base += vec->len;
+			dmabuf->cur_index++;
+			vec++;
+		}
+	}
 	return 0;
 }
 
@@ -1447,7 +1477,6 @@ static void iopt_revoke_notify(struct dma_buf_attachment *attach)
 					     iopt_area_index(area),
 					     iopt_area_last_index(area));
 	}
-	pages->dmabuf.phys.len = 0;
 	dma_buf_pal_unmap_phys(pages->dmabuf.attach, pages->dmabuf.exp_phys);
 	pages->dmabuf.exp_phys = NULL;
 }
@@ -1487,21 +1516,12 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
 		goto err_detach;
 	}
 
-	/* For now only works with single range exporters */
-	if (pages->dmabuf.exp_phys->length != 1) {
-		rc = -EINVAL;
-		goto err_unmap;
-	}
-	pages->dmabuf.phys = pages->dmabuf.exp_phys->phys[0];
-
 	dma_resv_unlock(dmabuf->resv);
 
 	/* On success iopt_release_pages() will detach and put the dmabuf. */
 	pages->dmabuf.attach = attach;
 	return 0;
 
-err_unmap:
-	dma_buf_pal_unmap_phys(attach, pages->dmabuf.exp_phys);
 err_detach:
 	dma_resv_unlock(dmabuf->resv);
 	dma_buf_detach(dmabuf, attach);
-- 
2.43.0

