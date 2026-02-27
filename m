Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJujDUiToWmvuQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:51:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D801B75D8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973B810EB2F;
	Fri, 27 Feb 2026 12:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RAot/11i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010013.outbound.protection.outlook.com [52.101.61.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE8F10EB2F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 12:51:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foqcx4p4oSRO5p+qFv5c2AC2qtcq+gSpXUvmjhJs27UsceWuI02jfKuWaPkRpKjTl+6hyQu8vUIE8bNjVKfFIu3XBkxwTtdKz7HWWgOBBpIic6aSxjO/3jjCPqHPpNzQQyPgrhEmLzT0hiExqEeggOA6WAFzVqIH/DRDX3qBoNY1c4kvDwcD9/OQJwhP6rQUQjcSq3A/qep+Z7T8BsXiuYOm2JyjAGgmrRp0Fr2SwINO2ase1sQE3B+BvZaEr6k6dVdu9bC6l9vaoluRRAOn10mJ3Whlh7BOdeZW3bLYR0vmw4ou6s3DGVHpSKbWVAvg/6ReSBMJ/kH8qHnJ3N17nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ak/VCPMN1THi4rh98xooz9yDT2/963hpgZbN0pNv0GA=;
 b=WbMmBS8w+kIrHD9JrQ99XZcAHDXwRyjwNGkv1dDWjRzdGUP7ECgPgHgCpCSJhhBoP1M0z3gHpsZxZnoq0IIGGb9ncw380quyWPlyaVqJG1qjTH9YXq74tDEEYz8+/+VyrYeVD+j7hpsQPQJXPJndb7Wp57f+CiUxna6kdPFvEwXPOQ/Pd1PAtmu0gPOssiWc7jSpv0KEKlnaDxT2LileaNznYvQjfnxN2UvHC/redJ8tgrIL8RItaNpNcTHoZpoU0/1iMBYmPUexoDvea/71AzbwU3gbW+DrpfCNtVl9PL1w1/2Q5TXoRaHMzT8D3TA4Yodqz/CgoQ2/o+H7I9NVfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ak/VCPMN1THi4rh98xooz9yDT2/963hpgZbN0pNv0GA=;
 b=RAot/11ibRpDBdy/Q2mlxIheSdWoLx24ir8zeFQGwO/WRbiiqIRjTrStlwC4fjSTAQpwBsR4nDuSReHLdO56GfwA1ipZhvz5gfkHhZRhLNeuqoncLeh9dm59VIuqUPPNsTSqv2vdsTUr5BV7RMizUQb6DaSNhyrpxta0FWNo5i/aHO+mqv6NW3aEMzu02iheDkzsncDhnIPYYOHE0enqj63YIJYxhgPYk7MXfkCstxgOCcgwyIgn9p58hUDr5v9jTi4QRioiLHtr9FKFGTI1EFXujTL761pKijWhpMCmp8a47PYbsEoO7cSJCSZbAfcL3uvrbmo2y6YT8YBq6ltjpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PR12MB7700.namprd12.prod.outlook.com (2603:10b6:208:430::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 12:51:11 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 12:51:11 +0000
Date: Fri, 27 Feb 2026 08:51:09 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Matt Evans <mattev@meta.com>, Alex Williamson <alex@shazbot.org>,
 Leon Romanovsky <leon@kernel.org>, Alex Mastro <amastro@fb.com>,
 Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian <kevin.tian@intel.com>,
 Ankit Agrawal <ankita@nvidia.com>, Pranjal Shrivastava <praan@google.com>,
 Alistair Popple <apopple@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org
Subject: Re: [RFC PATCH 3/7] vfio/pci: Support mmap() of a DMABUF
Message-ID: <20260227125109.GH5933@nvidia.com>
References: <20260226202211.929005-1-mattev@meta.com>
 <20260226202211.929005-4-mattev@meta.com>
 <90bd4185-1e87-4393-b9e1-1318a656a7d9@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90bd4185-1e87-4393-b9e1-1318a656a7d9@amd.com>
X-ClientProxiedBy: BL1P222CA0012.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::17) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PR12MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: dca0525c-a6bd-4836-5a7a-08de75fee1f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: tb+vIZSw4GDA3nDhSopJotzSiJwIGFCiQp/UgPF5u3lPuP6cgIL9eoX4sHHc0VfkjIgibxAnJTcknwtPWAtYkRDshG2QMTuJ2prs6mPRposirHwL0b+1Z2ogrfgHy0zB+d0vtDoZMNdapuRXfn6ASyrja4wiTpDk8OYv6LK4M+R7qbwpt3F5VwHJOt3cqdNgcGxzvtyxsZyRUAiYo9BBymoMYGKI6fWOhxcrCUZ4r5PV5ufPEqId7qjGqd5++D55l5tlaoPR1kgLyL8s+JLAzrZ3MYQW5OQE5u2o2rJWhqVgP6/3d9sPFBbsXMb70CTBmVy5a2ognYxwBufkOBTWoYqIqKx8mRHNus54DdTDGNjSFUrjVvLDKjFWrKd8kJAwQwCpuLjdc1gB+MSRWfBQR5buOzR2JmUxTMUsMnhDLL34reEc3e4P57EUdMvyhCjDmsN675oU80GZfE5SyxhVMjl14ILL5WfBO3L4TccWIdGZSX2AW5n4D3lK141yfSo/j0oDi1SixD995Ky8dR/2t+QW2XFM7IBIA0ms3YoVaPaWGSHNxMjjh9xIY1I7oHeLGH4tyXBinUfevLIrOzmlQIj3ZaSKpf1FTqThdVenz8vncaO6VFl33sCV1J9715wp54auPJ09IMfHr7mY9cttdn6vth5GadyJAEVPj8uNqCt+7IcGEE3M6GZQ7JSWk1cpcZEpQ2YAgVW28FmXkhstL41S5i41UplMpA2k9nCZvUs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHZJVXp5UURGYi9Gd0V4bXpTN290Q0FKTHFINXoyVk51ZjNnZWJ5c1lpb2hl?=
 =?utf-8?B?dVJDS1Z0aXhCUnRzSDc2SnVjNElDQ0Zkc2N4Y0xpRVI0RmFzTUZ6U3c1OUVS?=
 =?utf-8?B?eG55QXVLQlNoZ1dFU3RWS1ljZXBLNTFISGVXTWdiSHMyWFJFWENpTytpbmlo?=
 =?utf-8?B?T3NMZFpxVlRTclh4bzBiSW9wSHNDODRtWHo2WDhMOTVDNDUzeGRiUDFGYTly?=
 =?utf-8?B?eWZOOTZWSndHUG1LMGpvL3NpVlhiRmsrS1Q0dWxSTGo0cWpJTHJ5WlovNVlq?=
 =?utf-8?B?V1hTK0lBbnM1dm42cyttd0FKdTNYTjQ3TWxzRktWVkx5L1RmaUwxUExFeFVO?=
 =?utf-8?B?UUM2cXF2c0FpSFYxazIvU3NZa1VDN1B5MmpGUDk0UStiaTUxYVFPY0hUb1BU?=
 =?utf-8?B?OXRMRjI4STRjQTJvYUllTEVPQkZMQ25qT2E1WjZ1UzhpcTdDMW5GRjlRbEl6?=
 =?utf-8?B?RHNPRG44dnJQT2ZVSWdxV3NNS2hWcFNRVWZHT3BwY1dxamlrK2E4cFFaaFlV?=
 =?utf-8?B?OUxYZHNXOUtHZU0rb2ovUXYzY09LR1g1Z2xVcXZ6L2x5b01lL21vTDQ0bnFS?=
 =?utf-8?B?ZkQ0VXhlZ2tmZEM0NGtUQkM1Vm1kcCtBeFh2WUNpd0dZcTlKQjhDenlGc3A2?=
 =?utf-8?B?YURHMFVGQjJoWFNDRE00OWdkYkVUeGFMb0t2NVY1Mi85UVo4d3ZUT2V6bHAy?=
 =?utf-8?B?WUhxa1NiZDRPa1ZXUmZ6aUhmUkw2djVYTndhaHNkMnBrcDJBNDFWTUcyZmFQ?=
 =?utf-8?B?eXVrcHhyaGltOXhqMnZKWk9ucFplSm5vejg5STZFTVFic092QjlHaXFrVGtH?=
 =?utf-8?B?UGZMQmw5UWRVUllNeEJaVUNHbS90UG1PWFgxWGtKNCtmYnlOMlFJZHgvYkh3?=
 =?utf-8?B?dHZYSzdSdmxoMnIzMTdkTHRRS21lSHE5RjNpV3VzNktEbDhtS0JJSVJPcEFQ?=
 =?utf-8?B?T21MRTAwSWJLZTRsVVByejJUcGpJckJONCthN2ZBTUZyczhqeFUyNGpMSElp?=
 =?utf-8?B?d2ZFV0tNSmdhN0QxZ1E3M3R6R0ZDM2x4N0NMYjU2L0R0N1F1eS9mYURYN2JP?=
 =?utf-8?B?SFhDK3ZoQ1VFcDI3ekR0emU1Z2lxcW9id0VqRHBCVExRanJ4dCt3TWZOWkxo?=
 =?utf-8?B?NDFjSnJBMWxYNndoTFJRYVBhN0t4Z1JhN2R4TTg4dG9hTUQvcXM5cDlQSE1k?=
 =?utf-8?B?YXdXdmlja3B3dmxrVUo5T0ZvMGovT0FPeS85MFBOeFdXK0x6ZDlJYS95bDA3?=
 =?utf-8?B?OThaU1lSbzlNTkpPMy9oNFBSVWdrSkVYanArQ0tYMjRwNzc0L201aU1lRmlw?=
 =?utf-8?B?ZUJwMUtNeVcxandZalB4RW8rUy85ZXVETm43SzFuaUc0WVBkcG1qN2JMa1BM?=
 =?utf-8?B?cDhDQ21ZNnozM2hjQzZoNUNKS2ZuejM4ODdLM0x5aDFVR2ZyR21KMEdiRHpp?=
 =?utf-8?B?dExqcDhDMnFzcnhTVXpwYlpLN3hGWC81YWhaaktSQTBxSXczdnlzM08vZkNJ?=
 =?utf-8?B?S0c2K2NzakxzcWNwUW54OFNiRk1GUUV5aE9rS2ZxSFFvMHdBcDBCSGJ2Snkz?=
 =?utf-8?B?TnF2eFFaVG16RXpWSEprYm9jSDRuWGZCbjZQNDZ0dVlyeFk2V1ZoeDBWNlFN?=
 =?utf-8?B?cnMwbDhXVVBDT2pRZERaN3djcmplMHJja2RzdXJFUGlUdTk1NERZYXBwRkNj?=
 =?utf-8?B?cmxpS2kwK3RQMW8rbG12eUFndXZlZUZrYjk0Wmw1ZTFLRUdycXluMTdRQVlD?=
 =?utf-8?B?aS83aC8yR04wY1NxcStiTThUZnpNV1NFVGh6elJrQzhQWnNiMDhhRWJoYktP?=
 =?utf-8?B?STh6YkpIMFRyVFR5dWRmNlN0WWxIbGR6eDZQRy9lK1cxMXQ5ZHdkc3ltcjVX?=
 =?utf-8?B?QnVQalFPUzF3L3hPSzlrNDI4OGZHcmNZaWl5eDlOaTZaeFJ4LzBVcWt6TFBS?=
 =?utf-8?B?bVNLVFprWnRmRE1MdC9VVFIvb2d6blUwaWl1OFhBUTE5V0tRb3NMTHdvNCsy?=
 =?utf-8?B?ZzN5cThpZ3lBWUZzYUo3aENpQm1lQmxJOGpmZk9VWUlZQ2xjcThtVG9nSUsr?=
 =?utf-8?B?ZFBNVnIrRFlyVk5zN09mTzNOeTZTL3hlVU1KNnllV1pJNkN2T1UzV0xHMVJi?=
 =?utf-8?B?ZzZ3dUt6UXhsR0FLRWM0VC9aM3Q0ZEtBRnpMY05BY3g5YURZTTdIUHNxNU5i?=
 =?utf-8?B?TU92c3JTVm1qdUFQNC81dndJdE1oOGNPR3Zhcmo3eUZvRVE5dEZ4Z05UMXJo?=
 =?utf-8?B?cTQ3RFJCbXF2Sk42eFg1eVNtdjQ5M2Z4RXdMclByam5hTDRmSG1nalMxeGJD?=
 =?utf-8?B?MVVGdDZ4a04rNWJQOUJzUTQ4TlF3NUw4K0V4VkdWRkJvMmFHa1M0QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca0525c-a6bd-4836-5a7a-08de75fee1f7
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:51:10.9071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMyhCSaqsBwVdllyG/4ZQ1tq3upu9IRXbyWEb8EMrjRxy9g7lmrnppCaeY54Hoko
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7700
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:mattev@meta.com,m:alex@shazbot.org,m:leon@kernel.org,m:amastro@fb.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid]
X-Rspamd-Queue-Id: 90D801B75D8
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 11:09:31AM +0100, Christian König wrote:

> When a DMA-buf just represents a linear piece of BAR which is
> map-able through the VFIO FD anyway then the right approach is to
> just re-direct the mapping to this VFIO FD.

I actually would like to go the other way and have VFIO always have a
DMABUF under the VMA's it mmaps because that will make it easy to
finish the type1 emulation which requires finding dmabufs for the
VMAs.

> It can be that you want additional checks (e.g. if the DMA-buf is
> revoked) in which case you would need to override the vma->vm_ops,
> but then just do the access checks and call the vfio_pci_mmap_ops to
> get the actually page fault handling done.

It isn't that simple, the vm_ops won't have a way to get back to the
dmabuf from the vma to find the per-fd revoke flag to check it.

> >+               unmap_mapping_range(priv->dmabuf->file->f_mapping,
> >+                                   0, priv->size, 1);
> 
> When you need to use unmap_mapping_range() then you usually share
> the address space object between the file descriptor exporting the
> DMA-buf and the DMA-buf fd itself.

Yeah, this becomes problematic. Right now there is a single address
space per vfio-device and the invalidation is global.

Possibly for this use case you can keep that and do a global unmap and
rely on fault to restore the mmaps that were not revoked.

Jason
