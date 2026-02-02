Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOSdEBmYgGnL/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:27:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D22CC568
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB28610E4A0;
	Mon,  2 Feb 2026 12:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iIPHvEib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012048.outbound.protection.outlook.com
 [40.107.200.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603FB10E49E;
 Mon,  2 Feb 2026 12:26:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3Oictw3uL3GzluoMWeh/iYGq5Kk/zAeSqjqETxjCUwgmN9l1cvUz2A1XJqilyCnU/4oksc+si0j/yxx38EcfUsuPHAjSpftrGufFsY4NmAHCNvIBEX6rJq26NattUtN3zdr5cyQE290ew+k22IbrQHzAVyQXZNvpYF9DXfzC/oQ8qESmDCZY4FuDpdtkcxgR9by81mUExDhyYNj3jkL0X3J8U3GX2Mj2GVI13cRzp5ORFAFgnKtAARVmqAVDQ5auN1eXVxIqvYPDbemLXGdxKdtqZ7lBOCLVDTXAwzlqQoW3I+hU+lOWoK5pSdm4/9lBnFMcyuDAfF0+wd3pvdHaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYIkC9g/6TaedTao90qX6FVFx+t3iRutqpxe5/dE8dE=;
 b=rBdbjlzUfOQp8fGTSkVw6z+OZDVqQ/1p/eyXLFjHD0kX8td3eEhDTln2LcMdX77kNI5+ry5s5S++xmt1rF2C2g4lYVYK9xNXkpXRUJq2mSln+ds6U0EmR2L9qFTr24Pqs/+oP8JOIwq1hfss70GuTRNax5bKBXdVp5/B4ihyoCTeiKc6XLm+fzoiLoC6XCybIuL8t2mGgl25BqWZq0WXa/5NRhdiYtjIz7cWAN9RCMQ0i67JZd07JCiMzHeXn/r2KLS0pXqoM0IhECjzrkIwUSPT/3ifTu2XGR0ja8+hYIpLidxsYtcrCQH7hWSVFHFO6Gg4x7U9GYwWZ1ikN4YcgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYIkC9g/6TaedTao90qX6FVFx+t3iRutqpxe5/dE8dE=;
 b=iIPHvEibkqfw3ZtOaHP+iVUxp8snva6dHXdrh0LK5wGq+q5SO/skyD4jtHvWqKp5TAxLpKMnUwOZi9OEpu2afnOIvto7mfP8HSa/r+ooVIIWBZqnOgpDTKwiUudWFCMxKvItMUxwDTxMxqhdeAI+diaKcS5Z7Dj4sJStIf8RIaHY3H6VqxXDkJAsQvihVeg3cpVQnzqr9WPhDAr2tdbJLICgEErl8Qf/rtSGLJfAX+D5hj3UFeQNCDCNhFJwVTlpsxPGmRfa5t9dstJEjh+to7X7nnJT3s8d4uE4K02v3Hbj2jCGyY9hNH7fJAwJWcTMb21Ik/9rW/IPOtEi5aQ9og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY8PR12MB8268.namprd12.prod.outlook.com (2603:10b6:930:6c::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 12:26:53 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 12:26:53 +0000
Date: Mon, 2 Feb 2026 23:26:46 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
 John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
 intel-xe@lists.freedesktop.org, Ralph Campbell <rcampbell@nvidia.com>, 
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 linux-mm@kvack.org, 
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-ID: <nvajpou3j7osyx553ktafdc3qx3v6hisygho42swkzm6xdbwvt@bg6d25otpqj3>
References: <0025ee21-2a6c-4c6e-a49a-2df525d3faa1@nvidia.com>
 <aX+oUorOWPt1xbgw@lstrano-desk.jf.intel.com>
 <81b9ffa6-7624-4ab0-89b7-5502bc6c711a@nvidia.com>
 <aX/AgHAZ7Tl4iOua@lstrano-desk.jf.intel.com>
 <lbqqmohxpeynsrunbdyvod2fm4tinzq5coueh2mq6weubste5x@y4f5weqvwszg>
 <f48e3d818c6e20d6ea7a7fbd6b1741f25df17a78.camel@linux.intel.com>
 <ymg5yawktqtw7vfgt77iciqzxhjlsnqrwnjx3xmkflbjqbmq5s@jcxzcymqq2af>
 <d8c02e59a4cdd2d02b41aa5ce8dcd36a94fbba86.camel@linux.intel.com>
 <ewowxagab6ej5xldwsewfvg4wgpmelps2dgqj7efmcnhks4nqg@nqdhfedzlvjb>
 <aaffa3f1bbb97e61d86c0e4ac474cdc8b983b85b.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaffa3f1bbb97e61d86c0e4ac474cdc8b983b85b.camel@linux.intel.com>
X-ClientProxiedBy: SYBPR01CA0153.ausprd01.prod.outlook.com
 (2603:10c6:10:d::21) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY8PR12MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff8936e-eb98-4bb9-1f3f-08de62565891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUgyQnFhZzQwdGk2Sk95bGlUb3VRdnhiOE41dHVoeVN2OXdObndFYWsyd2xr?=
 =?utf-8?B?cEl3WVE1eEg4UXV6V3RrRVJ5bXViZ2FUUy9QR0l1ajFERjNzRkNGSUFXYmNk?=
 =?utf-8?B?OC9lK1NHcjZYR2hoMnprUFhiOGpTb3ZiYXJNMGdsaG5ta0RRWXBhUXVqdzFF?=
 =?utf-8?B?aDZmMXNaT3YwT1o5WjZ2bjFlZ3RMTENyZGNmR2RrQzZRdkpDS1NVMVE5cEdV?=
 =?utf-8?B?SWUvdElTR3lCbi9OekxTUUx6K3R4b25hRElSeTZTZTQ3bUpNdW9HaHhZc1Av?=
 =?utf-8?B?K1pMYkZPMDN1L2R0dDJ4L0ZZTDcyaWRUN3NOMGduVTBwZ2VSaVJDc2RCemx6?=
 =?utf-8?B?N1o4R0xpTkZkUU1IMm9rOG1KRW5Xejd0MmFEYmp6eVhDaVF4TlRSZk9BYTV4?=
 =?utf-8?B?VlVveWpNUUIybUFrYkROTnVBaTU1cHhKSllmR29RNzVlTkVYRzFRWWltMTBN?=
 =?utf-8?B?VC9LSlpIaXRZWERYUjNsNGJna3U0TExIMjRIWmVZTEJodmF2NnkzdHBidWJU?=
 =?utf-8?B?NEJodmttb3RXMnJ6OUVNelMzY0dieFRoZXVST3pFZmZodjlrWU9nK1dZZnRW?=
 =?utf-8?B?VVUxZ0FsTWtvZlAxUmRmMEdaWHR2T2RxNjRFcyt4YTd3eXJyVWdIbzd3SldK?=
 =?utf-8?B?VlRxdFJQbnJjcXEzZytzK0oxZXJDYmRjbWl1NG84aTVnS2Z0Q2tMVWIxdWxD?=
 =?utf-8?B?R29zcXZlNFhaZ1VCMXdsOXVEWlRad25EbkpQQys5VnRTMURFQktGWHJIUkdv?=
 =?utf-8?B?TUE0S29WM3FEOVRvemZ2alczMEVPVW9uMHdPSTBBR0JVRWVWTVduZDRzQTlV?=
 =?utf-8?B?OXBQbEFNeG93clgxNStsM216d0pJRThqb2lHRXV3L2dzTmxBa2VvTjIvWmRH?=
 =?utf-8?B?UEtqaWZFQm1iSFJ1NVBiY1kxaVFVMVgxNklGRW50T0RiS3BlQSszdVBDUjUx?=
 =?utf-8?B?WnhEbWtXLzBjYUl3L2Z2eXlncDZocERyRWVIdXJxN1dDdmFnc1IyeGpiYkti?=
 =?utf-8?B?ZVVESHM2QjlCVlNYaUVtNlJ4VVpKaGo1S0YvYjI1Uk5oRGR3T3hBMmhIUG1U?=
 =?utf-8?B?b2Q3c3RGa3ZqbTJUc2R6M3Rzc0ZTM20rSWdBcExwSDBmdmUrUEVvVDNkMTdB?=
 =?utf-8?B?K3VtOHFsQXRRZnl3aE1LRUliSnBycVExSGVLcDVDSTU2ZFlRVDlaQzdVY3hz?=
 =?utf-8?B?WGNXN1ppYVdRdTY4OVNJcGVGNlVXem9pajdJUHhGNWp1RStnUmw5YS9iaTRu?=
 =?utf-8?B?Yk93QWVhaVRDU3lmYVRZQ3o2dnBCQmNwZ01temk0MXVvMzZEVHlQa1BQeUlm?=
 =?utf-8?B?cTJpa3pPcDVsTndpaVIvMlhSZjJMRlJkaUx5d2J0TXdURVphQm5Qb2RjNDFK?=
 =?utf-8?B?YTdSUHlLSWhXOTU5Q0VrUG8zZEd1SlJLeGFrTG8vaUZEVjZPMGY3NTIxNFN1?=
 =?utf-8?B?dDRZL2g5RW80bE9lWEk1cEhBM1B5YlptR0ZFTlhHVndCc0VNSDJzTURTb3NO?=
 =?utf-8?B?SzhGMWdzbk80VmZaWk9LRzdPOXhEYUk1WHRqVlpDYnRuV2NuTi9CVkhNYjdK?=
 =?utf-8?B?VnovNmlaZHJMazFYMkxDWkt2L2VsVGpJYm1BV0wyQ1VHTXZuckwxcG5WVDBk?=
 =?utf-8?B?VVBsRWdmN2ZsU2J5WHhJNTJLaGNDTDZRS3BtN29MbldTdlpTSTJvWWZpZDhv?=
 =?utf-8?B?UGJIaGtycjlUeHFsVnVFZy91dXpJNTQ4TDNWSnhkaWFEeU4rSEthUnd3Mm41?=
 =?utf-8?B?UVZ1cDRPN09rSmhnMFkwdmhybUJpNCswMzBrdXVyMm1RaVFvSlE0TUpFSE1G?=
 =?utf-8?B?d08zVXBSODJlcms0OVdkTTJBMUo1d1VrdU1xQytyYzcrMnYxRVNOTFZsU0I3?=
 =?utf-8?B?UVEySWFRT1pXcFhVak40eFFQUmw5c3JjSThGRkVsejhNV28vWkoxMHF0UXI4?=
 =?utf-8?B?RVE4RGJuWFRsUjdXL0pDbWtENEViWjk0aGlrVGM1Uk9hMG14MVp3QkZGbnBu?=
 =?utf-8?B?UU9sYlM0Y21EbXo5eVF0Wm9wYTByOUlwNVFkSHkxRHc2WUVUL2hBa2RtdVNZ?=
 =?utf-8?B?NWlRZG9YWHR3RURoVERSMnp0M1E0aDZ0U0ZOYUVsV1FXQTNqTHArOU5KMlUv?=
 =?utf-8?Q?vUbfaPvxDfYfoFEHR+7/HA4md?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjNVZVlQcHdCbTc3OFRyM29zeFd1L0UraHdzNzV1RytsSmFUUzV3UTRqS1dY?=
 =?utf-8?B?QXUybVBSWWRVNWNZZUdqaGt1b1ZKenBFS3EzV2ZCb3ZCK0RQc2RkMjJvZVBX?=
 =?utf-8?B?S01uaU5tZ3NvZ1JPOUROYWl1WTFURC8wd0R1MklDSnNIdS9BR1grc0lxQWpy?=
 =?utf-8?B?eEh2RkcwbERnT2UzUVpKZGFhYldzbHR4KzhJaFQxT2dwRG1Lb2tNVXE0cndF?=
 =?utf-8?B?akdEcVN0M2diT0ZJTFlndUQ5YmNPellpd2FPYmhqMkczZUY2VlFJS0ExNml0?=
 =?utf-8?B?K0J6WXdzc3prdkNnUjdDbTZhVkFLSmx1TFRCRVUwRE53VGJBdkw2U1kvWFB4?=
 =?utf-8?B?ZmZaTGREcTZZZTlSTGRLalFmUFhpSlJOYm1VRHhveTFnbGtLdUdRd2RDQnR2?=
 =?utf-8?B?ck5HTndXOXc4SnRISENoV0xZb2NOVnl1cm5JRS9KVTlSQVdKOG1Yd011T0hh?=
 =?utf-8?B?YlpsTnNmUUh4YjNSbENDd3ZUVnBKVExSLzBsRjJzK3Q5VzMrcFM1TUtzZ3dU?=
 =?utf-8?B?OHoyUVgzWkRvR0kzVDc1WU1tOExlTGZUbnArNForVGk4cVh4QVA5c1BvcUdw?=
 =?utf-8?B?RVdpZjVlNi9vcUk0U2FwOHYrR0I2RVd3bmV1eU02QUhoWjlNT1lYS0YxZ1ha?=
 =?utf-8?B?Q0Y1TDIxRkJwMUxvQ1RzV2poZFRZUlEwdkRERU5VL3lIZE4xclg4TTRnYWk0?=
 =?utf-8?B?WUcxZmRIeTNUK2E0eVJNUW9NcmlSdWU5MDdiN2hCa1c5dVZnTnNxMlJja1dI?=
 =?utf-8?B?d0NNY1hhSmYrSFlwR2hSb0VWblR2WWp2QUpob3NsdTY5VWJEY0tXR1N4dURn?=
 =?utf-8?B?UkhMd2pyTGIrSGQ5d0t4NUhPSitvT2RvRnZUSHZvSWlmZW9hbU40UFFpVVlK?=
 =?utf-8?B?VFIwTEh3YXpYMlV0MU5DR0VNbnFQbHpXd090QkgyRjVtWVliMUNmRWMzeHdM?=
 =?utf-8?B?cC8xRHNycTVaWWdUNnpUSHdldHVpSnhaTkN0NmxPS3BqZCtnSGc2ckV0ajQ3?=
 =?utf-8?B?aWNqb0kyL2pndjRwTE5OQjczWnVnMnUyYnhMeGduRnhySnp3MThvaTVxbDhY?=
 =?utf-8?B?RFM5ekx4MTdRZUpHeGhkcnozT3BFYkE2UVhYeDdYMERaaUhkU0wxY2NJM3dX?=
 =?utf-8?B?ZGhwWm04dG00WXhnOEpMOGI5SEJVZmtWNVd3UWtiWVkrWXdQa05ub09kbTVO?=
 =?utf-8?B?SnYwYURVRkJsKzBHVUU5cmJYNm9KaDZvNnYycmh0ZHlnS1RnL2NmSitDaHpu?=
 =?utf-8?B?ZVlxUXVHZUl6WFJhVFR4KzVyTFQ0TGxaWUZIU0dTSVdJeVZyTHdsT3lYT2ZO?=
 =?utf-8?B?YlhTR3ZwNlF5VHQ4UExLNWtDL3N1MURXK1JLUE1RcTNQRmpXN0puUThqVWhS?=
 =?utf-8?B?eTUvVWQ2T0gxL29KejZlc3BSOUxtVkt6TGlLYzB4bE5iMjU3dmVvbjk1UTBD?=
 =?utf-8?B?eTlsWTFKdm1uR3ErQXNiQkI3aFkvcUdWd0xnNDNSd1U5WC9Wd2pQeGlEL0Ir?=
 =?utf-8?B?V3ZHeHVheDl2bHhMdGJkS3NsQlVLWDAxYXpWRldkNWpmRVMrVFhEZ0o0SWJo?=
 =?utf-8?B?NDBEUlc1RHFZMzliTXJMczBOeUdjdnlreldKbWJQZVptcGVpRnNLN1U1VmJG?=
 =?utf-8?B?SFB1UnN6ZjRjS0loS0RuMG1uVUFST25ORmlHdmlqcEt5MEEwWGoxMUdBWUNF?=
 =?utf-8?B?enl3clJoT0cwdU15dFh0NVkvRVpyRjUva0VvNW4zTVJYVTVRNWRBTHQyRmxk?=
 =?utf-8?B?RUd2dUtvZVplK0Z5VE9qcm1oWmVXTVBidEc2eC9GZisyVzJZRnBHbXYwTXVQ?=
 =?utf-8?B?dVBqSURNS1NuOUNKczZDSmhUR1V1V2k0SWVrS05nNGFzSm1iUmF1K2JuQWJD?=
 =?utf-8?B?QTBKRERvWElSRWlzWEVoRjJLaWhMNmwwbUJFT2JnaklRV0pJZC8zSm1uRjF4?=
 =?utf-8?B?cktNSkdEcWtWUmxUOU0za0J6ZmZPeUJMK3JxQ1VzWXQ5MzZNZTJhK1pjandG?=
 =?utf-8?B?YWpNSjRKWlloS0VFcVVMcmV2UnFUUmwrT0NCeWRidnBlVUFIbE5LcVhYdmZJ?=
 =?utf-8?B?ZWpiM1RkeTBYTWdreTMzY2tmd0h6NFlCTjRNSFZaT1VvenFaVjMwSGtVbzNm?=
 =?utf-8?B?MmJrbllhK0l6MVJhMjRpM3NnU0JmdHc2Y1JyU042OHpaS2FjOFV4WGxHUWty?=
 =?utf-8?B?ZU5pMTRWeVQvclFOblVOSEpicHFpQXpRS0tCdENNbm9wQ2J1ME5pYnNQRjNq?=
 =?utf-8?B?amhQbU1FYTg2VkErY1dPUkR5R2IyRGk5Ynk4YzF2a0VWRDhjYmp1d3c4djlH?=
 =?utf-8?B?S1ExM0c3UTJQRVdFc29hZHNhWWZHNnBJNzNHRW5MZTVlN3dFV3JXUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff8936e-eb98-4bb9-1f3f-08de62565891
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 12:26:53.0344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8E5qGbWIiyYN3/I0LXhB6yCkUnjtGIq1nGBvOFJzkqRTIFwpT492QU+wDWWb8ge83fAVZa/zzICnv/vxis/Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8268
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[apopple@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 91D22CC568
X-Rspamd-Action: no action

On 2026-02-02 at 22:44 +1100, Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote...
> On Mon, 2026-02-02 at 22:22 +1100, Alistair Popple wrote:
> > On 2026-02-02 at 21:41 +1100, Thomas Hellström
> > <thomas.hellstrom@linux.intel.com> wrote...
> > > On Mon, 2026-02-02 at 21:25 +1100, Alistair Popple wrote:
> > > > On 2026-02-02 at 20:30 +1100, Thomas Hellström
> > > > <thomas.hellstrom@linux.intel.com> wrote...
> > > > > Hi,
> > > > > 
> > > > > On Mon, 2026-02-02 at 11:10 +1100, Alistair Popple wrote:
> > > > > > On 2026-02-02 at 08:07 +1100, Matthew Brost
> > > > > > <matthew.brost@intel.com>
> > > > > > wrote...
> > > > > > > On Sun, Feb 01, 2026 at 12:48:33PM -0800, John Hubbard
> > > > > > > wrote:
> > > > > > > > On 2/1/26 11:24 AM, Matthew Brost wrote:
> > > > > > > > > On Sat, Jan 31, 2026 at 01:42:20PM -0800, John Hubbard
> > > > > > > > > wrote:
> > > > > > > > > > On 1/31/26 11:00 AM, Matthew Brost wrote:
> > > > > > > > > > > On Sat, Jan 31, 2026 at 01:57:21PM +0100, Thomas
> > > > > > > > > > > Hellström
> > > > > > > > > > > wrote:
> > > > > > > > > > > > On Fri, 2026-01-30 at 19:01 -0800, John Hubbard
> > > > > > > > > > > > wrote:
> > > > > > > > > > > > > On 1/30/26 10:00 AM, Andrew Morton wrote:
> > > > > > > > > > > > > > On Fri, 30 Jan 2026 15:45:29 +0100 Thomas
> > > > > > > > > > > > > > Hellström
> > > > > > > > > > > > > > wrote:
> > > > > > > > > > > > > ...
> > > > > > > > > > > I’m not convinced the folio refcount has any
> > > > > > > > > > > bearing if
> > > > > > > > > > > we
> > > > > > > > > > > can take a
> > > > > > > > > > > sleeping lock in do_swap_page, but perhaps I’m
> > > > > > > > > > > missing
> > > > > > > > > > > something.
> > > > > > 
> > > > > > I think the point of the trylock vs. lock is that if you
> > > > > > can't
> > > > > > immediately
> > > > > > lock the page then it's an indication the page is undergoing
> > > > > > a
> > > > > > migration.
> > > > > > In other words there's no point waiting for the lock and then
> > > > > > trying
> > > > > > to call
> > > > > > migrate_to_ram() as the page will have already moved by the
> > > > > > time
> > > > > > you
> > > > > > acquire
> > > > > > the lock. Of course that just means you spin faulting until
> > > > > > the
> > > > > > page
> > > > > > finally
> > > > > > migrates.
> > > > > > 
> > > > > > If I'm understanding the problem it sounds like we just want
> > > > > > to
> > > > > > sleep
> > > > > > until the
> > > > > > migration is complete, ie. same as the migration entry path.
> > > > > > We
> > > > > > don't
> > > > > > have a
> > > > > > device_private_entry_wait() function, but I don't think we
> > > > > > need
> > > > > > one,
> > > > > > see below.
> > > > > > 
> > > > > > > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > > > > > > index da360a6eb8a4..1e7ccc4a1a6c 100644
> > > > > > > > > --- a/mm/memory.c
> > > > > > > > > +++ b/mm/memory.c
> > > > > > > > > @@ -4652,6 +4652,8 @@ vm_fault_t do_swap_page(struct
> > > > > > > > > vm_fault
> > > > > > > > > *vmf)
> > > > > > > > >                          vmf->page =
> > > > > > > > > softleaf_to_page(entry);
> > > > > > > > >                          ret =
> > > > > > > > > remove_device_exclusive_entry(vmf);
> > > > > > > > >                  } else if
> > > > > > > > > (softleaf_is_device_private(entry))
> > > > > > > > > {
> > > > > > > > > +                       struct dev_pagemap *pgmap;
> > > > > > > > > +
> > > > > > > > >                          if (vmf->flags &
> > > > > > > > > FAULT_FLAG_VMA_LOCK)
> > > > > > > > > {
> > > > > > > > >                                  /*
> > > > > > > > >                                   * migrate_to_ram is
> > > > > > > > > not
> > > > > > > > > yet
> > > > > > > > > ready to operate
> > > > > > > > > @@ -4670,21 +4672,15 @@ vm_fault_t do_swap_page(struct
> > > > > > > > > vm_fault
> > > > > > > > > *vmf)
> > > > > > > > >                                                        
> > > > > > > > >  
> > > > > > > > > vmf-
> > > > > > > > > > orig_pte)))
> > > > > > > > >                                  goto unlock;
> > > > > > > > > 
> > > > > > > > > -                       /*
> > > > > > > > > -                        * Get a page reference while
> > > > > > > > > we
> > > > > > > > > know
> > > > > > > > > the page can't be
> > > > > > > > > -                        * freed.
> > > > > > > > > -                        */
> > > > > > > > > -                       if (trylock_page(vmf->page)) {
> > > > > > > > > -                               struct dev_pagemap
> > > > > > > > > *pgmap;
> > > > > > > > > -
> > > > > > > > > -                               get_page(vmf->page);
> > > > > > 
> > > > > > At this point we:
> > > > > > 1. Know the page needs to migrate
> > > > > > 2. Have the page locked
> > > > > > 3. Have a reference on the page
> > > > > > 4. Have the PTL locked
> > > > > > 
> > > > > > Or in other words we have everything we need to install a
> > > > > > migration
> > > > > > entry,
> > > > > > so why not just do that? This thread would then proceed into
> > > > > > migrate_to_ram()
> > > > > > having already done migrate_vma_collect_pmd() for the
> > > > > > faulting
> > > > > > page
> > > > > > and any
> > > > > > other threads would just sleep in the wait on migration entry
> > > > > > path
> > > > > > until the
> > > > > > migration is complete, avoiding the livelock problem the
> > > > > > trylock
> > > > > > was
> > > > > > introduced
> > > > > > for in 1afaeb8293c9a.
> > > > > > 
> > > > > >  - Alistair
> > > > > > 
> > > > > > > > 
> > > > > 
> > > > > There will always be a small time between when the page is
> > > > > locked
> > > > > and
> > > > > when we can install a migration entry. If the page only has a
> > > > > single
> > > > > mapcount, then the PTL lock is held during this time so the
> > > > > issue
> > > > > does
> > > > > not occur. But for multiple map-counts we need to release the
> > > > > PTL
> > > > > lock
> > > > > in migration to run try_to_migrate(), and before that, the
> > > > > migrate
> > > > > code
> > > > > is running lru_add_drain_all() and gets stuck.
> > > > 
> > > > Oh right, my solution would be fine for the single mapping case
> > > > but I
> > > > hadn't
> > > > fully thought through the implications of other threads accessing
> > > > this for
> > > > multiple map-counts. Agree it doesn't solve anything there (the
> > > > rest
> > > > of the
> > > > threads would still spin on the trylock).
> > > > 
> > > > Still we could use a similar solution for waiting on device-
> > > > private
> > > > entries as
> > > > we do for migration entries. Instead of spinning on the trylock
> > > > (ie.
> > > > PG_locked)
> > > > we could just wait on it to become unlocked if it's already
> > > > locked.
> > > > Would
> > > > something like the below completely untested code work?
> > > > (obviously
> > > > this is a bit
> > > > of hack, to do it properly you'd want to do more than just remove
> > > > the
> > > > check from
> > > > migration_entry_wait)
> > > 
> > > Well I guess there could be failed migration where something is
> > > aborting the migration even after a page is locked. Also we must
> > > unlock
> > > the PTL lock before waiting otherwise we could deadlock.
> > 
> > Yes, this is exactly what the migration entry wait code does. And if
> > there's a
> > failed migration, no problem, you just retry. That's not a deadlock
> > unless the
> > migration never succeeds and then your stuffed anyway.
> > 
> > > I believe a robust solution would be to take a folio reference and
> > > do a
> > > sleeping lock like John's example. Then to assert that a folio pin-
> > > count, not ref-count is required to pin a device-private folio.
> > > That
> > > would eliminate the problem of the refcount held while locking
> > > blocking
> > > migration. It looks like that's fully consistent with 
> > 
> > Waiting on a migration entry like in my example below is exactly the
> > same as
> > sleeping on the page lock other than it just waits for the page to be
> > unlocked
> > rather than trying to lock it.
> > 
> > Internally migration_entry_wait_on_locked() is just an open-coded
> > version
> > of folio_lock() which deals with dropping the PTL and that works
> > without a page
> > refcount.
> > 
> > So I don't understand how this solution isn't robust? It requires no
> > funniness
> > with refcounts and works practically the same as a sleeping lock.
> 
> You're right. I didn't look closely enough into what the
> migration_entry_wait_on_locked() did. Sorry about that.

No worries. I'm somewhat familiar with it from updating it specifically so it
wouldn't take a page reference as we used to have similar live-lock/starvation
issues in that path too.

> That would indeed fix the problem as well. Then the only argument
> remaining for the get-a-reference-and-lock solution would be it's not
> starvation prone in the same way. But that's definitely a problem I
> think we could live with for now.

I don't follow how this solution would be any more starvation prone than getting
a reference and locking - here the winning fault takes the lock and any other
faulting threads would just wait until it was released before returning from
the fault handler assuming it had been handled. But it's been a while since I've
thought about all the scenarios here so maybe I missed one.

> I'll give this code a test. BTW that removal of unlock_page() isn't
> intentional, right? 

Thanks. And you're right, that was unintentional. Serves me for responding too
late at night :-)

 - Alistair

> Thanks,
> Thomas
> 
> 
> > 
> >  - Alistair
> > 
> > > https://docs.kernel.org/core-api/pin_user_pages.html
> > > 
> > > Then as general improvements we should fully unmap pages before
> > > calling
> > > lru_add_drain_all() as MBrost suggest and finally, to be more nice
> > > to
> > > the system in the common cases, add a cond_resched() to
> > > hmm_range_fault().
> > > 
> > > Thanks,
> > > Thomas
> > > 
> > > 
> > > 
> > > > 
> > > > ---
> > > > 
> > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > index 2a55edc48a65..3e5e205ee279 100644
> > > > --- a/mm/memory.c
> > > > +++ b/mm/memory.c
> > > > @@ -4678,10 +4678,10 @@ vm_fault_t do_swap_page(struct vm_fault
> > > > *vmf)
> > > >  				pte_unmap_unlock(vmf->pte, vmf-
> > > > > ptl);
> > > >  				pgmap = page_pgmap(vmf->page);
> > > >  				ret = pgmap->ops-
> > > > > migrate_to_ram(vmf);
> > > > -				unlock_page(vmf->page);
> > > >  				put_page(vmf->page);
> > > >  			} else {
> > > > -				pte_unmap_unlock(vmf->pte, vmf-
> > > > > ptl);
> > > > +				migration_entry_wait(vma->vm_mm,
> > > > vmf->pmd,
> > > > +						     vmf-
> > > > >address);
> > > >  			}
> > > >  		} else if (softleaf_is_hwpoison(entry)) {
> > > >  			ret = VM_FAULT_HWPOISON;
> > > > diff --git a/mm/migrate.c b/mm/migrate.c
> > > > index 5169f9717f60..b676daf0f4e8 100644
> > > > --- a/mm/migrate.c
> > > > +++ b/mm/migrate.c
> > > > @@ -496,8 +496,6 @@ void migration_entry_wait(struct mm_struct
> > > > *mm,
> > > > pmd_t *pmd,
> > > >  		goto out;
> > > >  
> > > >  	entry = softleaf_from_pte(pte);
> > > > -	if (!softleaf_is_migration(entry))
> > > > -		goto out;
> > > >  
> > > >  	migration_entry_wait_on_locked(entry, ptl);
> > > >  	return;
