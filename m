Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Zge5NtgDlWlRKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2985B152162
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412B710E0E4;
	Wed, 18 Feb 2026 00:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="J/k0yGak";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012004.outbound.protection.outlook.com [52.101.48.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B0C10E160;
 Wed, 18 Feb 2026 00:12:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNNQao48EL7LhuZYyaxlzy8JuhXD9beNkarIRNNJEz3bRGq/s2ezl4YdC0KUChR6KBPWBR+7m6GMEiZ/KnlhqQ6CaT0AVtmR3KtP6Zm9K88Z66+MbZEP0XGVGX8rzS0RNnf5MIHAMLD36a+9VEkDFF8p1jLOyAiPT2fudWQFk6bI515CIiq/V8OGPX3S+rxXbQkZi5sm0MOvEnyhCxonFFL/mOHwVpzuwaFqmKULS+DVXu62vqE1n5gAakRlmi9KvyiMRCPuIfUHhQDzEqFbFmoihW2O1EzH1owGzm+Ym41GKw/GLg+UUN1My4ohoqPONfzXRkYLU9FWGXPjB4wk6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhoUjlDDFS9V07OXf6ARfT6bUHZ1WUKVTyxPoxs/dJw=;
 b=LyeCWXgpYooXTzjokPYU206eN/K1chb59gSBzSntPT6SMbp1zUSBU+bJe7LUJEjNcQFgq+GH75OwIaeXeamCR5MF919pnhL1qav60hbKdXF8GzT1Bm4EPLXBU7PjMiFdyxWu2CPVoaijHdCOjAa9eZdAmLcsSb/coae6sGWr1hjSIC0x92ONui0dOG/7qNDWsAfmgL63TkPw3uQ7SKVlD4RGtgZbNVA3G6uqIRC3yOSk7ApEZXTaQXRnDGNzDsP1pf8CjVOj/FQotqbGVqsiW7qUbc1BBrdSd386rYAvMz6/WOaSyJs2HDSwCQ1V4r+ZCmKeE2hqnEw4pce4rE1qIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhoUjlDDFS9V07OXf6ARfT6bUHZ1WUKVTyxPoxs/dJw=;
 b=J/k0yGakQD/L3t8R7I0eNmWHqifvzwLhFOfKYpWfOPQCMwoSyc+KJTnVzbW/EhNfAsWUCBd026kH0dQEbsQvmtd+7FiVac1OpiP82My0MwcXWUVq+RNDsoiFBjLUrv7XJzSIGORc/a7ZjL1KZ5Vz9ud1nHQ0hcosFUfTXJpzYfeMuFVIUguQ8J9ascCpeWcRsc9T9huIZUDcSHTylxIK19qj+kSmSzJPEVon4Oxpq7Aydt5HVnMyfM0z5Hpt/arD8DzRaytQYVEtq1fdislTHAjyvSkbGYt8iLajn4WOYyp/9mPR4VR3/xkciu1vps0F8WAHDEeoFJktiSychosjpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PR12MB8421.namprd12.prod.outlook.com (2603:10b6:208:40f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 00:11:58 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:11:58 +0000
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
Subject: [PATCH RFC 03/26] dma-buf: Add dma_buf_mapping_attach()
Date: Tue, 17 Feb 2026 20:11:34 -0400
Message-ID: <3-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0204.namprd13.prod.outlook.com
 (2603:10b6:208:2be::29) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PR12MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1797bb-3b01-4c36-0366-08de6e825509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ogOqL1+4Iy7PgmBzHm6c79E9aM32uCMPI0uqmVjBUYSl41pEtBT5xAFuQd6N?=
 =?us-ascii?Q?G1eCjfQ/ZzbZcZCG8W/HZTGPYgYFWG2gMLUH5d9aiVfWoy20dweuie8N/IwR?=
 =?us-ascii?Q?rC0Tac3RDyqhi7O/92fysg0fagwpLJ1IfsPshF2AyYADsEOXWskBvCyCZ+0f?=
 =?us-ascii?Q?zj9qHz+fPgyhbY1tmu5wiFnjJmMfloe+Q5z26bFNuTC7tBPjnc03tcThYQPl?=
 =?us-ascii?Q?C6dOkUrkgEM0m++gOlBDw41YY5oyhxGBSlZ6/N0bZ/U/764ssE/nsZx8zUo4?=
 =?us-ascii?Q?SmjgIwxgfpNmNp2N5q5EJWaj0zZCf574u5p8sB6qk30gqawncdyy5aoHOS/M?=
 =?us-ascii?Q?9VA6KaNfpKDnlZOdVP+TyZsRfGssJgkeMCy7c+XJw+ACMku3hLoBzGaltxpK?=
 =?us-ascii?Q?i7O4dmPszqMHRsC81LSrhRQ4971Hla9wASpk1skq3WBS4V2dHj+lIDn76PuC?=
 =?us-ascii?Q?PmBT4URQRDJg3xKaAX0jG96brIUKbYdcYPClICur3BrX8J1/822txxi9Rsw6?=
 =?us-ascii?Q?cxYECNcn3JklL7+DLy1IUywbQZzdGccnhIhaDpOUYg/dEW69uakeDiUwXzu8?=
 =?us-ascii?Q?fpFzg+lQAm3VsbtUIZAZ7vYSHexh4RoQtL+PCbaYI5zllg4bUIqvsWsJRwob?=
 =?us-ascii?Q?5LCBa2BcioPauC7YfynBW6FLYQWIVz17Bk1gKhzP8LvuBXFKBhxj/vwuxBsd?=
 =?us-ascii?Q?ra9mc/UH19wQEL1f+0oe31swQokgJvvfc1BX18aLTprAmvrADwT77Gp2OnOQ?=
 =?us-ascii?Q?7+GSIsv2XrN+HANU6jeVxssnR7N7dJoJhYKMxVCDQEx484pkmjHHKgM3U1KH?=
 =?us-ascii?Q?z+8uJ6bN1kpGdT47JQ/fYwdBt8O5j/3XzaqVbl0uqh8smcY7NTNxf+G+I1hu?=
 =?us-ascii?Q?EHkdvoTx4tT3kdQBGgdDNvLX35FJjPfDcop1UI+S5X9cstnShmBqqTE9q4Mx?=
 =?us-ascii?Q?NGEeTsoiz4pFFYc/yGQoUDp1OIHlqPE9PCJd64GLy5mRjj1+2E7qBw2niEil?=
 =?us-ascii?Q?DS5vO0gxfWPGKDIM8pbeZ8ICcM6xMbHzHQArYxK2cB237YUgSuZ5xlDOoKbs?=
 =?us-ascii?Q?ccvUcTHKP+iS/8uRqYs9r5wCrDMRCBVtTNKxrrVbenRd9wHmjQ+9gfE5OjCq?=
 =?us-ascii?Q?6uSnSQSc6T+fQLHstzbtb6DYEK9cN79e+M1i9/6jSmF73lJ/hyTdL+t2y8Yn?=
 =?us-ascii?Q?fjZHd8lyCGsNoqxA8UPXNi6y4KCf1W/jeR10AZbdjCvQKnjX/GTsWWg12Snd?=
 =?us-ascii?Q?jy1ZD/zMwyi7oVvf61hJoPcg0mJT3+KIIUFWOMz00B/uWLX6x2bTga2r4q4g?=
 =?us-ascii?Q?kWzQ9upXuuhb64x3Ligl18KYoy4XsLYltgkKsTtDMfS48tR3KhvD8Hl532NU?=
 =?us-ascii?Q?M7hNq69B68Bdrs4ApFQGoZ1REFRYFe402iSSIH+ChCTNnjFe+paQ70bAd0le?=
 =?us-ascii?Q?PMP5ykroDmxQZJHDWh0TeRUx3iRBiUCq2TIsjeDolnKiCaawMIqyDx7nVBsI?=
 =?us-ascii?Q?s5OW7b3PY6Z3dRBKLk4ZHX7DfWIFXfVq9VVmAa/FBXn6sGss4t1WYMwHlAg5?=
 =?us-ascii?Q?1yEKzEKgKEptYeCLJYU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FGKIGdPIB5c34bRSfU52Vn0eM+SPHusvzyMgkR+dZeU/5k7lT9J2sSTURxaL?=
 =?us-ascii?Q?kTiv0u7xEuanGMPfsArK10yuypomiqo61z+sbksGBOy75y1rqg7iWujxDjmM?=
 =?us-ascii?Q?wC+Fzlo8BV5JrF6gNsqwzRAlogMUzFNTWAX3w+2rYj9OUogOd6wEGpSfEQE3?=
 =?us-ascii?Q?dHJ0kWQBLzWKWXWkw/R5lyGQv8uTwQ0J76j2m7pwIAjcF4GRRt1FkaiI8+ic?=
 =?us-ascii?Q?F15LHmsnPjtHo3XDXCDGB1zr4qhqKGElwIE4p9KYWH3fNVtt767FY2MLD4GV?=
 =?us-ascii?Q?emxuKphd2tNwc13YSpi3sdm6RHtoUftwfld7OZFdUMOeN8TXDba83qSKIdMd?=
 =?us-ascii?Q?hi/oBlCSlBYh/IvY5tRxzvSg14/20u3yz5ofPtR3nbBJhkNkDoXu3R3AXVap?=
 =?us-ascii?Q?pSrGDDj9oxNNd0s6m9s36hl8GylwAzFeN8Xqtr9Ae7uyE3pi38twcH80jXra?=
 =?us-ascii?Q?KHg3ONYNwMA8MVr7hkeYVLaq4Ivbzecjr//fQzkqD8Yl4GmXsyc2YKAyjQLQ?=
 =?us-ascii?Q?sUFZFqcON9HPviB8QgKkT2G+lziCzPxjnrDc/ohav+dsk2++axHPhR9sF8hy?=
 =?us-ascii?Q?V9BmRtKA4NvDiTRqLA2Jdx9FBJ8VNpd0uUtpz86r55kT3VrQe2cLBuVFbmEu?=
 =?us-ascii?Q?/u9Txn+VBoCADkkqUi1IQWZQq/7NPDDU/0cwuFGRL9zoEUsKJSEA5otWEE4g?=
 =?us-ascii?Q?yZqHhl1Uy0c92Jb31cM7hJ2qFth9wmqGg1L1CUG1wLbiPh4T+OYYBXfcN/jC?=
 =?us-ascii?Q?XGoi0fsss3fIAYcTB2FMWL8N6u+KGlaVVCjTOXZ5BlYNRC3erGmQtm25Woof?=
 =?us-ascii?Q?pUZLtrFaT4QI003sNjXL3P3OqFwBP95GQ6DimLRggc9Crq7FI3WRuuDkl4lH?=
 =?us-ascii?Q?x+hxaEgZQvw5dFR/HU1RQLFFs9lSl0ah42Se0FHHLMjWHFa74qzljHrSLKfg?=
 =?us-ascii?Q?X5RsKCR0MZKZ1tjamuDp0h1FN5lysvMA23bzxJzJs+KuqE75hw5RZhiSNJ8P?=
 =?us-ascii?Q?iJwY0LWFPxYwRrL5t3UnUXYjLo7Vc953tDuMl96xj8rqQuX9A9b/PIkyHius?=
 =?us-ascii?Q?TEG3pPGgLaeJFF30j6dPi9W5Q1ibTNGXAn6OoAvLqBQs1Agl6NCKZ1tRiwao?=
 =?us-ascii?Q?TbHe0K9mXC35t6edlrDJCkvsEyQMIOQkb17niyIU7zuM4j23CUUhRydxCZSD?=
 =?us-ascii?Q?SGFZuRfu4Cd9Qlgzaq/0i3CMYNQcTNNP0mYEBWxdNGfqodllHyiQ4gwDwH0n?=
 =?us-ascii?Q?ZBOgdYc0bXkk5LuzSLesjrO+MXL1h3QX35APzVlzL2YobmBtqGXz1IFCwIHd?=
 =?us-ascii?Q?ir9Ar5GWD91I1rUqtemWAPm/6kD3pi2HLe4lpo8LiQCxPt/fkvJZmdp8acdO?=
 =?us-ascii?Q?TFdFXQZRXGiTekJXEpEhMGAT3yfnf4Pxhs/WzzI5A/P/YkuMrGflSl5LsKis?=
 =?us-ascii?Q?tNcwVF3ZD2zAvcIJYeqxJZdGXYacZnfBgG9sasJUHG/0fwIuC0Shkmrofd3i?=
 =?us-ascii?Q?m9ccGstVIBMH9NDA8vKsWA/JmdO/C/Yp3YNKrrH4cvXT6qflsQWkBPhMoQS/?=
 =?us-ascii?Q?MkfxcYQM+WnjFpZeryvfkSwjAxVwrTI4KiQAKRKTAzbTRUfXC9r75OfFeduo?=
 =?us-ascii?Q?Bsv5jplOZUxMh3mGBOwhLSCkleCkVlNcm8AKdDV+EDLO3TSVsp4cB8tCSS8P?=
 =?us-ascii?Q?vREMzDcT/TC9u64RBJ5RnSxzBEMFX4XpwwjiKyN7VgZ+uyuoSWUCKBh5fvXn?=
 =?us-ascii?Q?AihsVrNeHA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1797bb-3b01-4c36-0366-08de6e825509
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:11:58.7264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8R4QvDo29gvQejMwkzR4TLGt91hd8yu3Yl9v30fcEJm2s/hhu+G+UeI6L2VJsjZd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8421
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2985B152162
X-Rspamd-Action: no action

Introduce a new attach function that accepts the list of importer
supported mapping types from the caller. Turn dma_buf_dynamic_attach() and
dma_buf_attach() into simple wrappers calling this new function with a
compatibility mapping type list that only includes sgt.

dma_buf_mapping_attach() checks if the exporter is mapping aware and calls
its ops->match_mapping() function to pick up the exporter match list and
call dma_buf_match_mapping().

If unaware it will use dma_buf_sgt_exp_compat_match as a compatibility
matchlist that uses the unaware exporter's dma_buf_ops callbacks.

The resulting match is stored in attach->map_type.

In effect attach->map_type is always available and always makes sense
regardless of what combination of aware/unaware importer/exporter is used.

For compatibility with unaware drivers copy the sgt matching data into the
attach->dev and peer2peer.

If the exporter sets exporter_requires_p2p then only the following are
allowed:
 - dma_buf_dynamic_attach() with importer_ops->allow_peer2peer = true
 - dma_buf_mapping_attach() with a
    DMA_BUF_IMAPPING_SGT(xx, exporter_requires_p2p=true)

Other combinations are blocked.

Exporters that want to behave differently based on the importer's
capability can declare exporter_requires_p2p=false and check
attach->map_type.sgt_data.importer_accepts_p2p. Or they can declare two
SGT exporters with different map/unmap functions.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma-buf/dma-buf.c | 91 +++++++++++++++++++++++++++++++--------
 include/linux/dma-buf.h   | 14 ++++++
 2 files changed, 87 insertions(+), 18 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index edaa9e4ee4aed0..6e89fcfdad3015 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -14,6 +14,7 @@
 #include <linux/fs.h>
 #include <linux/slab.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/dma-fence.h>
 #include <linux/dma-fence-unwrap.h>
 #include <linux/anon_inodes.h>
@@ -689,11 +690,19 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	int ret;
 
 	if (WARN_ON(!exp_info->priv || !exp_info->ops
-		    || !exp_info->ops->map_dma_buf
-		    || !exp_info->ops->unmap_dma_buf
 		    || !exp_info->ops->release))
 		return ERR_PTR(-EINVAL);
 
+	if (exp_info->ops->match_mapping) {
+		if (WARN_ON(exp_info->ops->map_dma_buf ||
+			    exp_info->ops->unmap_dma_buf))
+			return ERR_PTR(-EINVAL);
+	} else {
+		if (WARN_ON(!exp_info->ops->map_dma_buf ||
+			    !exp_info->ops->unmap_dma_buf))
+			return ERR_PTR(-EINVAL);
+	}
+
 	if (WARN_ON(!exp_info->ops->pin != !exp_info->ops->unpin))
 		return ERR_PTR(-EINVAL);
 
@@ -916,9 +925,10 @@ dma_buf_pin_on_map(struct dma_buf_attachment *attach)
  */
 
 /**
- * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
+ * dma_buf_mapping_attach - Add the device to dma_buf's attachments list
  * @dmabuf:		[in]	buffer to attach device to.
- * @dev:		[in]	device to be attached.
+ * @importer_matches:	[in]	mapping types supported by the importer
+ * @match_len:		[in]	length of @importer_matches
  * @importer_ops:	[in]	importer operations for the attachment
  * @importer_priv:	[in]	importer private pointer for the attachment
  *
@@ -934,31 +944,46 @@ dma_buf_pin_on_map(struct dma_buf_attachment *attach)
  * error code wrapped into a pointer on failure.
  *
  * Note that this can fail if the backing storage of @dmabuf is in a place not
- * accessible to @dev, and cannot be moved to a more suitable place. This is
- * indicated with the error code -EBUSY.
+ * accessible to any importers, and cannot be moved to a more suitable place.
+ * This is indicated with the error code -EBUSY.
  */
-struct dma_buf_attachment *
-dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
-		       const struct dma_buf_attach_ops *importer_ops,
-		       void *importer_priv)
+struct dma_buf_attachment *dma_buf_mapping_attach(
+	struct dma_buf *dmabuf, struct dma_buf_mapping_match *importer_matches,
+	size_t match_len, const struct dma_buf_attach_ops *importer_ops,
+	void *importer_priv)
 {
+	struct dma_buf_match_args match_args = {
+		.dmabuf = dmabuf,
+		.imp_matches = importer_matches,
+		.imp_len = match_len,
+	};
 	struct dma_buf_attachment *attach;
 	int ret;
 
-	if (WARN_ON(!dmabuf || !dev))
+	if (WARN_ON(!dmabuf))
 		return ERR_PTR(-EINVAL);
 
 	if (WARN_ON(importer_ops && !importer_ops->move_notify))
 		return ERR_PTR(-EINVAL);
 
+
 	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
 	if (!attach)
 		return ERR_PTR(-ENOMEM);
 
-	attach->dev = dev;
+	match_args.attach = attach;
+	if (dmabuf->ops->match_mapping) {
+		ret = dmabuf->ops->match_mapping(&match_args);
+		if (ret)
+			goto err_attach;
+	} else {
+		ret = dma_buf_match_mapping(&match_args,
+					    &dma_buf_sgt_exp_compat_match, 1);
+		if (ret)
+			goto err_attach;
+	}
+
 	attach->dmabuf = dmabuf;
-	if (importer_ops)
-		attach->peer2peer = importer_ops->allow_peer2peer;
 	attach->importer_ops = importer_ops;
 	attach->importer_priv = importer_priv;
 
@@ -977,23 +1002,53 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	kfree(attach);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, "DMA_BUF");
+EXPORT_SYMBOL_NS_GPL(dma_buf_mapping_attach, "DMA_BUF");
 
 /**
- * dma_buf_attach - Wrapper for dma_buf_dynamic_attach
+ * dma_buf_attach - Wrapper for dma_buf_mapping_attach
  * @dmabuf:	[in]	buffer to attach device to.
  * @dev:	[in]	device to be attached.
  *
- * Wrapper to call dma_buf_dynamic_attach() for drivers which still use a static
+ * Wrapper to call dma_buf_mapping_attach() for drivers which still use a static
  * mapping.
  */
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 					  struct device *dev)
 {
-	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
+	struct dma_buf_mapping_match sgt_match[] = {
+		DMA_BUF_IMAPPING_SGT(dev, DMA_SGT_NO_P2P),
+	};
+
+	return dma_buf_mapping_attach(dmabuf, sgt_match, ARRAY_SIZE(sgt_match),
+				      NULL, NULL);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_attach, "DMA_BUF");
 
+/**
+ * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
+ * @dmabuf:		[in]	buffer to attach device to.
+ * @dev:		[in]	device to be attached.
+ * @importer_ops:	[in]	importer operations for the attachment
+ * @importer_priv:	[in]	importer private pointer for the attachment
+ *
+ * Wrapper to call dma_buf_mapping_attach() for drivers which only support SGT.
+ */
+struct dma_buf_attachment *
+dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
+		       const struct dma_buf_attach_ops *importer_ops,
+		       void *importer_priv)
+{
+	struct dma_buf_mapping_match sgt_match[] = {
+		DMA_BUF_IMAPPING_SGT(dev, importer_ops->allow_peer2peer ?
+						  DMA_SGT_IMPORTER_ACCEPTS_P2P :
+						  DMA_SGT_NO_P2P),
+	};
+
+	return dma_buf_mapping_attach(dmabuf, sgt_match, ARRAY_SIZE(sgt_match),
+				      importer_ops, importer_priv);
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, "DMA_BUF");
+
 /**
  * dma_buf_detach - Remove the given attachment from dmabuf's attachments list
  * @dmabuf:	[in]	buffer to detach from.
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 3bcd1d6d150188..14d556bb022862 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -29,6 +29,7 @@ struct dma_buf;
 struct dma_buf_attachment;
 struct dma_buf_mapping_type;
 struct dma_buf_mapping_exp_ops;
+struct dma_buf_match_args;
 
 
 /*
@@ -308,6 +309,14 @@ struct dma_buf_ops {
 
 	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
 	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
+
+	/**
+	 * @match_mapping:
+	 *
+	 * Called during attach. Allows the exporter to build its own exporter
+	 * struct dma_buf_mapping_match[] and call dma_buf_match_mapping().
+	 */
+	int (*match_mapping)(struct dma_buf_match_args *args);
 };
 
 /**
@@ -619,6 +628,11 @@ struct dma_buf_attachment *
 dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 		       const struct dma_buf_attach_ops *importer_ops,
 		       void *importer_priv);
+struct dma_buf_attachment *dma_buf_mapping_attach(
+	struct dma_buf *dmabuf, struct dma_buf_mapping_match *importer_matches,
+	size_t match_len, const struct dma_buf_attach_ops *importer_ops,
+	void *importer_priv);
+
 void dma_buf_detach(struct dma_buf *dmabuf,
 		    struct dma_buf_attachment *attach);
 int dma_buf_pin(struct dma_buf_attachment *attach);
-- 
2.43.0

