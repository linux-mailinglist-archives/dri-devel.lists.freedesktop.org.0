Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D259A9819
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 07:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F0010E2E9;
	Tue, 22 Oct 2024 05:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJLJTNK6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D168010E2E9;
 Tue, 22 Oct 2024 05:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729573619; x=1761109619;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+UGLP/OXxq1G2ARXitFojBwMKw0hyLB0GfWvBpDuTRk=;
 b=UJLJTNK6l1xLTMsjX60p4lpHkdsBZtiMie5agDyBZrz+/jJ/AiVtS2TI
 ocY6zyupsuMKLQ8phWFQc2YxrZ3AUGL+Hc728aGpnd4ikjz2uQqJHZseZ
 K5hiU/EKCkh5mjOhgJOinr9vMPM+VM/oTO2Z7U2YL35f1cYZpwBMUucNR
 DQUZT/3fp7n4xcismXHuZIjDOMZvftkiRugQIYTbArkQyeHxQZo9YAzD9
 dU9w8/oQghscolT2HS8nY1FP9qFdhC5To/ZcPvM8zgw9OEFyi1SXgMhse
 vxCwhU/cGmY6wsLj0e7Nd4nw8HwFR25R7QXxuoP53yZWjZooaB9NOM52A A==;
X-CSE-ConnectionGUID: r2/7A9WaQJWw3lCvbnbR3g==
X-CSE-MsgGUID: Duk6xoJVQwy0U/lJTaQOgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40205615"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40205615"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 22:06:58 -0700
X-CSE-ConnectionGUID: i0TF2qXgT7y3cBukur+ZQQ==
X-CSE-MsgGUID: yRZWrXErTGOQkS3m6AUkjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="79672140"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 22:06:58 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 22:06:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 22:06:58 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 22:06:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSZD2FL5hCFH4pePkaG0jBhVTWOYdE1K98AAT2rzvwRST4gBRbkRjw9qBNUNO7iTnXh9O6ZuDcBdo7m0ACnWQ/6+3llprLFa+rqMMLwvLkKehE7SF+yeZvl12g1MXPRLBL3/VSiDvi1l8ePI0IIomKg9gACrnGxrbraqZQswR+T6oVAO7cpQJNDqaJ1Hq3CZRo4aaXW2lhyZhCpZwNUEV5GtmaAo1kiMmZleq3vMfhvQASWSb/03rKK4FfgW9pjbavjU/En1TO0znoX/9ndobj8sJMCYg+fOUAcLY/OimVGuGFGDau8DRyRfMB9JrYNqg5v/XvunycJX4opBltRaiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4k+nIuhYV5ToOPYcUTfSHZlY+YKkMSJs/Zz4V1DEBV4=;
 b=kiLYrnu1VzfuFz+xtbt8RKoW+P91DCp4MVvbVZo6vsbVLp0eny8zM4vN974fGCOHvg4SzjToNIMxivDu+KPyjGCKfvJ8tjfhSTI5RkMG3bgWDsCYo6ChACZWgV0Ys6+Pf491zKg3c4/SQm7WXxyC3fTsddydWfVssR8whnREiFLIG0ubR2MQLPHy6gliocCkekMwjkSUYgft/COYMv/H+ct4HENbQbY4Ni9xUB8uMW/JqVKeI0SRBba64tq2Y07E24eBrkRlO4LoELt/9XgOLkAUwjfu2HzTntSNGP3mqJIiNKoUxBFtjRZKx42scTJ7eaSWM5GuE+POC0P6d7Z8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB7557.namprd11.prod.outlook.com (2603:10b6:8:14d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 05:06:55 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 05:06:55 +0000
Message-ID: <8ea7292b-33d5-4b88-913d-52201502f545@intel.com>
Date: Tue, 22 Oct 2024 10:36:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe: Mark GT work queue with WQ_MEM_RECLAIM
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <dakr@kernel.org>, <pstanner@redhat.com>
References: <20241021175705.1584521-1-matthew.brost@intel.com>
 <20241021175705.1584521-5-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241021175705.1584521-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::10) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 75dac144-8c8d-49ac-eb33-08dcf2575929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEF6NnBHcUJIV3lMZGppM3pNbWh0b0c5ZnYydkd2Z25iVlhYaE5iVlVocWEr?=
 =?utf-8?B?dlcxVVpESVV3VXF5eS9rSEpFOE9ROUF2MXVrUXpNeVYvY0o0emMrUHBicjlZ?=
 =?utf-8?B?eDFUNGU4dmQ3Z1k3MHpVcFhKN3poOStLenNCZ0x1SFpLZEk4K3lCVmZMYnNN?=
 =?utf-8?B?SGtqOFFCRnlvczJleThoNi9FQTNyTWdxaFUrOGEzVWxITEZwZUVDbWRmM21L?=
 =?utf-8?B?RFpnSlV0UFc0bmQxZFhBS2FTNHRQZytKRlFXZTFZWnZmKzlacjY2K0hyMVVk?=
 =?utf-8?B?eGgzU25PcmRXcmZmWG12MjZOQUNrWVl4RlBGSGt4YzVrMENJNko1MlNHZ2tz?=
 =?utf-8?B?REhLZVUwVGFMZVpNSEZ1dFZGSUx4eC9RMjdoTzJmemxscU1RdFhkazYyK3JS?=
 =?utf-8?B?K1ZDU1pSa21pRFNYRXhuSUJpZkgxYmd5a1JDWkorMTVEZDBEN09ncklxUUVo?=
 =?utf-8?B?RjV3UmhOZkZQNHlFOWFlMEpEVEJLVHhrQzVyU3kxUFk0cGY2dFArVXEwUUw3?=
 =?utf-8?B?dk14WEd1V2VCTllaUVFyd2MrVmdaL1NteGJlcGNzbFFOUlEzWE5FMDNIOG9B?=
 =?utf-8?B?dGErUXFHMVkxeVhsV1U3Wng0Y0RyeEpqRnBVZklScnZ1eEw5K0xNUUgra0t5?=
 =?utf-8?B?VFNJTW9Kam5UQ0Q3SlZoczBlVnM0VFp2NG5xRlB2VDNwV0Q0aHBnSUhLZi9h?=
 =?utf-8?B?NXFDaVJPV2crWlhadTBaZXN3NWl6VHM4UHBidklQQ2JSOW91TURjd04ra1ox?=
 =?utf-8?B?MVIyemdoSEoySm1ZelRielpLeXJSemRmdmhack5FUnFkNmMyaGRFemdteWFZ?=
 =?utf-8?B?YmFkY1FlSHlJSWRTMk93WEVDbGd6dTJnRGZESHdlRWovaG9SaS9qbXNKMUY2?=
 =?utf-8?B?cHNqRjB6VzJPSDVBOW1INU1lVkRqa3lqejFGNDNaQitMdHhaZFNnVnQvNmV0?=
 =?utf-8?B?clZ3T29PVy9veTRrZ3IxMHNiNlU2N256bk44TzZyeXF4bEoveXpDUzlXZWto?=
 =?utf-8?B?TnRaQ3AyT0dhY1hPSDRBdWQwTzZXS3JTOG1IOExZT2lHUmZKd1hUcjBPbUpw?=
 =?utf-8?B?T1F4Q1dvVnJQem9OSzVBRUM0d3RJVGFSKzUxTXpNaERQcEN2eGViR0pZVW1B?=
 =?utf-8?B?VTFEWldnRkNKeGZVNHQwL2lKSGRDSU1uZE9pS0xlUjR1bXRMalQwTUNnNU5O?=
 =?utf-8?B?aGZIRm9HRWsyVU11eXhoemhxQnJWZ2ZGcXpTTHdnT1YxN1E2LytyY3M0OURs?=
 =?utf-8?B?ck5kcEFVTDFVMUlxeWV2Y3lWSnZsZ1Q1U0VOeVpSUXVTc2ljSmRZT2lETytC?=
 =?utf-8?B?Ti9nWjR3Q3hPVU0xTWZxcVFnMXpaai9SNHo5WW9iTXU0UG1yOWp0eGlMWEJn?=
 =?utf-8?B?TWpnUWdsWjdwSHd3MmRDd21WclFJYWRSMk94NlR3R2w1cHdNdE5VRjBITmc1?=
 =?utf-8?B?RkFuajluY0g3T2RoQlo5cyt6azloaFdpM3VnV29zNzViQ0U3S1duVWpxSG45?=
 =?utf-8?B?NFJSTXFRekNvN2xFL1oyMS9xR3Flb3VZaGZ3VVVlNW0wd3RRZ3hvcFNUNERF?=
 =?utf-8?B?SGh0NHRmZ0Qzbk1ueXpNTTg2bmhraml2cExzL1B1d0tsODZPUTVJWjkyV1lD?=
 =?utf-8?B?YjVCdjMvOWx3bS9abGF1RVAzUUU5L3ZGZWxmQWhlc1hpaGVsYVA5TkxqSFZO?=
 =?utf-8?B?b3BSTXdXYW96NlJaenBmZlRBbWVPa0E5SG5UMlNqcVNOaU1FcHVCOFJDWlRT?=
 =?utf-8?Q?/+ZUcPO4bttkENJRPWGiqFEK69Te6yZIrhRjtdW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmtJbldwU0pWYTRsUVNlOE16cmNxNXB4WkVVdy9teGFJZWNic0pmT1o1TWdj?=
 =?utf-8?B?SytqVDdaZHZWaWZqSHZxdnFVOFo5eWxOQUtuRWV0L2QzR2s0TkNJVVVmWkFn?=
 =?utf-8?B?emROYkYwbi9la3h1SlM4RXVIeGx2Ky9TQ3hUdmJVYnIvM3ZHaEV0Y3ZpUkxP?=
 =?utf-8?B?aDFrWFFRcmxZdGp0SzBjNm42TlZudXVSdDlreURvS1FXazZlbzNhejRuV1NP?=
 =?utf-8?B?emlwZWFyaTJ0N0UvdEUzbHYzNS83KzVVWkUvSHlKL1M1ekhYWFU0RUNNa2Rv?=
 =?utf-8?B?VXBzbWprWmY3Q1VPeWlBYXlPdTdBeURjTDczOXJMcEhnTUNWVkJqcUZTcVVE?=
 =?utf-8?B?RUpNdDJ1WHkyOEdjU0VrT1FrSTNtY1p0R0J2UlgvWFlMWnRRdWk1d05QVk52?=
 =?utf-8?B?NnREM1hlelhIaWU4RnRqTEszZm4zSnJVYk5ZWUxFd1lha0Fjc05NYmlXWDg3?=
 =?utf-8?B?OGJMeTFMS01xaldwVFkvR3JTbWFlWXUzRzVEUEh3K2VueXBUZVNlSENZQlBK?=
 =?utf-8?B?Y1dON1R4QjM4K3pFbk1rOHpNWEFqTFdtM2ludm54R0hyd0wyM3JBSE5FekVs?=
 =?utf-8?B?c09VcnN4UGNaZlo0U1lFbXpkQ2hqOFNXUkZGaWs0ejhjc2U5SWk1RWpjOHNw?=
 =?utf-8?B?a3ZOTHpLaldiYXF5TkRiMkJpUXdlM3ZaMFJGWHFjV3VMNDc3OGJ4bVBWOTBs?=
 =?utf-8?B?L2k4eGV6OEhPRXFSQmhMdVN4eElFd2ZwcGhxcGdvOHZNZXlKNENlc2VPODZ4?=
 =?utf-8?B?L2VIUlRhaUo3ckxMTjBPR1RnVGxoMGpCVkhQb0xwTWZtZnJDU2YxRFNXR29S?=
 =?utf-8?B?a05UT0xsWnJPb1dDc2JMUTNXMTBBeGxHbXVlNlh0K3hMb0lYUWgwR2prZGxN?=
 =?utf-8?B?czlLa2g2TFRaR282Zk43T21uaWRvcUszOUc1VWNhNHlRQlNhMlNwZW5vdVFP?=
 =?utf-8?B?dkFQbUE0NHA4eTJTcmhTR2pZanNJWU5Gem1maTlKN2I2c1c4MFJaaExvWTRm?=
 =?utf-8?B?eDZkRjQ5LzdXTE41VzlWQTQrWWV3QnpWbVlaejdmSWdqRTVYekJmQWdSNWxx?=
 =?utf-8?B?NmFQNGFFdE5EYWtZbFArR2Vmb0N6U3h3RHljQ1A4T1BWdVpJOWZJM0pickc5?=
 =?utf-8?B?KzE4WGkxUUZIQmpJaFVsVWJyS2I1YnFuU3lPVmo2RzdKVUxpOTVzWi9nUTlU?=
 =?utf-8?B?UlQ1cmRoMlNNN3htRys2R0ZDOGh1eHpMaEFWSTRGMi8wR3YyYXJ0RFl4dVIv?=
 =?utf-8?B?dS9KRnJtbWVaN0JGKzhtRlFxYlZwRFhKY1d4NjZFcDlwNmE5cmhNK3gyL2p2?=
 =?utf-8?B?VisxQjFDbmZRanUrcWEwRG03eTg1Q3h6blBwZi8yRUt6TURBUmc1TGFIaXRi?=
 =?utf-8?B?dGxuZDhnUWg5dXh6anJlT0xxT1RwaFhuaTAzSG1iY1VYNFI5TUJNdytqN0tB?=
 =?utf-8?B?OUl5bTdlS2t5Sis3N2hVK1NJTmVPdXB4cWJPcDduRzJubE9mZzhhVDdwVmdE?=
 =?utf-8?B?UzVpUkk3cU9Zd3NFcyt3Vkk0RVVwdXN6emk0K1lSKzZRMDhGemJkWUNHSlFJ?=
 =?utf-8?B?ZjloeDB2YXdNdXMwaUgyNDdxOWNKSVpPMFRPL2c0dGNTWm1uRTF1c0Q2aVB2?=
 =?utf-8?B?SUY4QXNMcGJKaDhyMHRMSFRUbDdqYk51K0hkaHpLQUhDTFRxZnVYdTErUVpP?=
 =?utf-8?B?dDlkSlBaaEx3VERxSkx6SFM0N0F4eHQ4WWtGTTI3MjZWbnlMUm8xYjg3Zktz?=
 =?utf-8?B?akNPWnloNmNtdGwwZ0xKRVVpcnZ5Tko1UWRoUzhxU3kxZ1N6ZEpsWUV6elpl?=
 =?utf-8?B?ZjQrQzFZOExlbFlpOXQwMitmWWRPRXV4RVcrUEc1U3BibklLa2xneDEzR0p3?=
 =?utf-8?B?cjFDZFJLY1NZUU9CRUJPTHlBOUhuL0ZhVXhhZU9VbHNGbFd2V3JERW13STA1?=
 =?utf-8?B?aWRmWU10aXBSTFZhS2VMUXhaU1lsditXcGhJQUt5UjJxVENWSHdMeWphK21F?=
 =?utf-8?B?WDFnY2pFS1BLZnRNMUt4ZGZybEdUeFI1MTBJTXNKQlRIWGd4V2s4UWJxcEhn?=
 =?utf-8?B?MzRHSVh6QnZqU1VXMVloQUhpcEJEbU5oMHl4RDdqdmY5WVJwZ2RmdjF1UXNz?=
 =?utf-8?B?Nkx2TXlJYmVySGdZYVlaL2ZwYUZDYnowVEovRTNVMUhoTEdSVXVkNnhxU2to?=
 =?utf-8?Q?ZbigkVj4cy9AJetfu0rElD4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75dac144-8c8d-49ac-eb33-08dcf2575929
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 05:06:55.4503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iol1G6qY+EGQkkbJUkrD5QXWuwj4kZQ0cQpJ2UyOdy1ZVx0ah28VvYwCw7QYpUg5FRniPDNdAhKyT6VuFBZK+EfYkLs808YVUvq25KCeaH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7557
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21-10-2024 23:27, Matthew Brost wrote:
> GT ordered work queue can be used to free memory via resets and fence
> signaling thus we should allow this work queue to run during reclaim.
> Mark with GT ordered work queue with WQ_MEM_RECLAIM appropriately.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 89e9d9d4db06..d6744be01a68 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -77,7 +77,8 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>   		return ERR_PTR(-ENOMEM);
>   
>   	gt->tile = tile;
> -	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
> +	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq",
> +						 WQ_MEM_RECLAIM);

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
>   	if (err)

