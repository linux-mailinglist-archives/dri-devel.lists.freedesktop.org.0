Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560F99A9873
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 07:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B920110E5DA;
	Tue, 22 Oct 2024 05:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hUrbLfsp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02C610E5BA;
 Tue, 22 Oct 2024 05:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729575166; x=1761111166;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v+wAtdqoj9nvUtvS8U2bq2kds88NVXbMB3jEiFu9vOw=;
 b=hUrbLfspoetoPxLkOqp3g3ooSHdTjhvBymrdDFlyoZz9bbnmb1xl4hMT
 j/u+xJX6dOj7IFSecwPBS2Gesupruig01XLedMxETBLfogRbuOsXbM/cX
 3DvA6AVXgQSViuhnYjGHuvWRWPlnc+VS8QlQzsnTEMi7BBmxC2wxYsEFR
 QlKuhlg0jo6fGbwlgUaoVfpT58gwAfPAEGWER7ZqxdkDD8IZ65qa3C2JJ
 FOxSCE6uUs1mhJeKbojLzgMwCydLGIXUd0/51EupuhM2Ki0SQIbigW1GC
 sVmxA55KINevQzokb84gSnZ0i982YWhpiyh7mQnz4Qiu4k8kdTt2uielx g==;
X-CSE-ConnectionGUID: FjQ7l3DzTPm+QcBZ1jhL+w==
X-CSE-MsgGUID: LvMkwGg/SN6ioa96iXNdLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="46574411"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="46574411"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 22:32:44 -0700
X-CSE-ConnectionGUID: JDlzqZPITHa5QnUIsX8JVw==
X-CSE-MsgGUID: 7BgWT6KRSi+vnJ1ADFVMkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="80107010"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 22:32:44 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 22:32:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 22:32:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 22:32:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHlp+jJDGN568yAhi1xeUKvPuxjbR27AtcBwwlkQ3HPyxocKEY52WrnAd51isjYEJ8JPE3t+SyhxKo1+dV67QjBE3kktfosv18OZlRJqykezZ0ncEmfLTQYnSM+CvFCZSXPmRRZQ9WHXg4YGOH0PXvUhLsVpMjbAt5zrEKQl9H/38fghnAycwGS+p6y02J41i5WFW6SxjXwiWh6odTkHaxBj3XGmZqazpGKhkDWhEvgu96MzeN4cEGbB/POwGV1Rv+ld15CHhOLD8K3TzeynPCoEWmfISAB8QqjzAX+dzaq7LOmkT/CEMBXkLB88vFFl7zeBc8+Bf/tzRUe44XBDdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8MP8CLv6AAvJqmFJ1zhfVhiExJNtpoLQtzjp6I9FSU=;
 b=E64x2oFkIvwljoHXStY62yfV0BilKc/Sayn8sdc0Y1Il7V7x7cuPkyvlWDtxN6nePOYhMpajxYQif9Pcps0Y1HKhY1+10wVLmFcT74DrgW8N7+Vy76ZNnrY/NdCoMqRsNMfG6xkFsTb+5Na7oeAlS5nki6IdWpAgmD7cqsSCV/0gsqYKl8QuacztOn45LCtYpO5XI6AjTxCzb/kFRJZMufdObgi6/Pqm2hmXqgMocTB7YqwIbjhYQOq+d7ojKkiqN0eBApTbWFHLFI8sZ9u2uft2QbLaHGruNKoutr6d6uRCoo6zU5W6d2Dbag3ltfHpCWZGtxECoi/ugdzhEZfT4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by BL1PR11MB5272.namprd11.prod.outlook.com (2603:10b6:208:30a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Tue, 22 Oct
 2024 05:32:41 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 05:32:41 +0000
Message-ID: <220773bc-0515-4f70-b012-568652e0fdc0@intel.com>
Date: Tue, 22 Oct 2024 11:02:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe: Mark G2H work queue with WQ_MEM_RECLAIM
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: <dakr@kernel.org>, <pstanner@redhat.com>
References: <20241021175705.1584521-1-matthew.brost@intel.com>
 <20241021175705.1584521-4-matthew.brost@intel.com>
 <bcbf8d2c-c781-4597-8fb2-8763b8514519@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <bcbf8d2c-c781-4597-8fb2-8763b8514519@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::6) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|BL1PR11MB5272:EE_
X-MS-Office365-Filtering-Correlation-Id: d131358d-8c46-4a01-6686-08dcf25af278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1pFbHBnTEJ4RFhTbElrdlZmSlRGb2U0OWxmY2EvTmRTYmdhZ3hNbDFWVVA0?=
 =?utf-8?B?SS9NUUp1MVdJeFlJMXhZanl6SVptSnN6TWNEMWVXYTRHYWNyaDFZY1dJcDJu?=
 =?utf-8?B?ZHBLVXF3ZzduREgxaXNWdGVnQnU5MmZ5OE1UckNnSVlrenBBdUZWSnNJajcx?=
 =?utf-8?B?ZTVNUU9OaDcvR0NQejR5QUJaQUNIUCt5d3Qyd1NjNTk0TmpKTkt1ZCtzRHRl?=
 =?utf-8?B?d3ZsZjZvVVBIWHg0akNDZTNnNFF5dXNZdkk5UVhtaXpPai9XdXdCZWVkczZJ?=
 =?utf-8?B?TVB5WXYzT3QrN1oyYXZNRWVQRDV2ZHBLL1R1NHBFbW9sVUIyNHE3UVVZSEtr?=
 =?utf-8?B?M1ZlSjFLU1ZpQnFhWFZnVXF0V3RXUFF3bGVYUWhJTlFDaXViWjdVLzVuWnVm?=
 =?utf-8?B?V2JoZDdzajE3ZGEybGJOZHN3SHJpbW5HN2E5aEo5WnN1cTNxY3FhRHJ6M0w0?=
 =?utf-8?B?cWRLUWl6RTkxT2MzcmoxQzExRWR4LzNONUo2VE5sdXZDV3RtWkI5ZDloQlIx?=
 =?utf-8?B?Yjc5bzZoOERURUM5NFBvR0UvbGxEejRqcUpxV0czbWtrSDAwNTB6NFhkWE5X?=
 =?utf-8?B?RVFrdlo2aHpjNDNaWENFM0tBd1FlTjJsczZVOXJMN1hvQSt5ZDRxcUIweVlF?=
 =?utf-8?B?UXU1K0VWNlk1ZUY5RDA1TjY0dWpHaW1LSDBkTDVDSGEyT2VWSjFkSnV4cWFB?=
 =?utf-8?B?WUVWcEtXaVdDbVlEQ2Zka3BveVFmaUo5YmFqZzkyMk9jU0kzSUhPb1EvZWNE?=
 =?utf-8?B?NkR3bjIrL0JKc1BHd1VrZ2tadjlYa2VsdEJqV2R2all3M2s5am1DamVUSG5n?=
 =?utf-8?B?MEYrYUxEZEkvTHNUbW1scndUMGxETGFmWlo0VXNxdkVwZVN5LzVLY2JkZHZx?=
 =?utf-8?B?UUE0TzBtbXhTYk1jZ0M1S1l2Slp2TjhaYmZyWmF1Mnh0Y2ZUd0l5VWRyQ2pY?=
 =?utf-8?B?dHQwZ3FZRTFwTGlLMktnSmlLRjh1Uk9LckRwOW9tTTErbzIxN1pTM3Y2S2tv?=
 =?utf-8?B?QnVKeE1mWnh2TzdDalJKejBRaWF6UmxaUU45aWtXZzgveUo3SDRFWXpkeUxu?=
 =?utf-8?B?MzFOeExiUzNwYXB2eXNsb1MxM2wrNFZKUlNSYU1sUC9NaXZrNGZSMm11MnRZ?=
 =?utf-8?B?SHNmQk0wL1VJRkFXK3R2ZEZLK3ZTY3MyUWFtMGJjeGtOd1VyYmR6UVpDcXZq?=
 =?utf-8?B?Nkc3NFpQTWd5RWlnY2g2RTJVTjlXOFQxdjl3cDh4L2hITElYYmRSWFJMREVa?=
 =?utf-8?B?N0xnVktiK25Yajh5Y2hVUFB4NkVSd2ZscDBHL1VOei9nL05Hd1c2UXdWWUdo?=
 =?utf-8?B?V0VPN2pRQVBvenFvK1JCd1NCSDlVSUxkbnhMS2FwOG0rcFI1WVFGdjd0NkJK?=
 =?utf-8?B?REtLcm5xZkZyRHcwNzF6UEVUa0E2dlVUTmJvYUhEKzJDNTQwRThDUmhkTFF5?=
 =?utf-8?B?aHFtTVB3MkdydllWNHBKdjkxSHFsNk1kMDZ3ZEpqZ1dRM0Qwck42NWlKa0FT?=
 =?utf-8?B?SG10WFd0WnlIYXQ2K1VhcExMV1d4UGJXY2l6aFMwYWpVeFMrWjFxQ1pjbVlL?=
 =?utf-8?B?ZlIvVjVMemMyd3U2ZjJnSHlFL0xrdGJ4RFJlc0pobHdYdk80QVRWOWwyQWpX?=
 =?utf-8?B?L08rODA5ek1qdHM1VUtpU3NGYmt3UENrQ2NtcFZzL3NWdER4NlZ6akFsRW1a?=
 =?utf-8?B?MjNUcG4zTUhmN0tmMUVOcEhwcDh6aDdYaHlCOWluT2w0WGRCdVdoSnVYbG1N?=
 =?utf-8?Q?ubsLUeCMki7SREZ88RtqnDfRLDCWGr+Z+OeNgJf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3Q4UlJWekVLdnVyK3pwT2ZGK1UyL2F1WlNSWFpZSzBvMXNGaGpSK0FGKzNQ?=
 =?utf-8?B?bjJkMWRuaFhZOCthTDZEdktuYjJzNXV5SFNaci9FRTYxdFpFOVBPU2dRVERj?=
 =?utf-8?B?dzVBZ2tVOHdlbWFCY2ZQZnZrdDcwWUg0djEwMDJGYTJZYlp5N0JNeW1pbjMz?=
 =?utf-8?B?eTBRRzBYcDloaTZ0aWlRT0dDenJqWjhWZVhkMVI1U3d4RUNFYlQ1b2xZMkJi?=
 =?utf-8?B?emI1Zk1Tc2FvUGExVDkzZHFQa2NkRU91TzZGMWZaQ1dXVXNBZUIyRUJlM3l1?=
 =?utf-8?B?YTU1UTBDdUROSTA1RnMwWDRvbzdwVkRpTG5ZeDlxY2ZOTSt5QzNDZDJmanRQ?=
 =?utf-8?B?bFgrelBnMFJ1bkszYUpqeEI1WTdBK01vdmFaQ0Z6NHhJOVZtdzFSUHNzQk0r?=
 =?utf-8?B?UEUwd0h3eUptVEhXR1BuZUE3cmpQNkRiRTE5UnMrREtyYVhueEZlbkRQaWNJ?=
 =?utf-8?B?YkpoWFUrMC85a1hPOVJFMTBmVURUYVFjK0dMQ0E4Ym0yVHZKcnh1bGhrQmVD?=
 =?utf-8?B?RkxFODIzYUJjRVNDN3hZSjdHb0ltOG5BZExwVTdOTmlYT2EySlgvY2xJakRP?=
 =?utf-8?B?T0NRQjhzQVpsNFQ5YVVyL2RBYVkxY2h2QkJ4cHZnTUp2cGhFSXNSVmxGaFFl?=
 =?utf-8?B?MVZoU1lTZlFTMmZjc0ltN2lxeE9kMDYyc3JBbHR1WHFBcFh3ZmxuYVJZN3ow?=
 =?utf-8?B?eUcyWmpHYi9XdjVxdHpaN08raVlxKzNjWWpNZE41N3RLVWpSVkx0ZXRzZ0lF?=
 =?utf-8?B?K01NcDI0S3daOTA3S3dWbnFWZ0VGQ3FNSHNMKzdmeG80YVE1azFmSnVmNW84?=
 =?utf-8?B?ZjR1NThJMDlnUVpWY2hsM244bjd5YXl2TDRxTW1xMXl1R3hJU0tIcjU3MDdF?=
 =?utf-8?B?Y2pEeUJ5KzNuMkRsUmxKR29kaUdQK0N4NnByajVQbHZFWUEvYlBRcGVGM2NE?=
 =?utf-8?B?ZnkvaU9wSzFLNnFEcE16b2M1K0Fqbmh1Q0plTEY4OC9DNjlaRWozNDlLcDZC?=
 =?utf-8?B?Zkg1ZkwzSWVLNDJlR2FxNjh1VVFhbE1vdUZ3WWtMc2R3UTMzZXFYcm5KMklZ?=
 =?utf-8?B?WE5RSGlGZmZhdzd3MU1uYk9IdlVVQ3ZzbmZQa1kvVUhzQkx6NnluNVlEVWhY?=
 =?utf-8?B?bVlKVlgwWmU0Y3BtMGpkVStiWWpXbEkwRnlwaHQrQy9CVklyaWxnUkd5TUxZ?=
 =?utf-8?B?aUtmVTdUbllYNnFsdUVsZ2tia2xNZUE4bE5GYmRhZXcwWGpPN1RicDdYY1ht?=
 =?utf-8?B?NlpVYk9icGpESkx6dzczNVVYdzZFUEhZdDR6bnVaUnRLNERUSERZWlZiUTZT?=
 =?utf-8?B?WWg0VHVWWUViT0FCK3hvZlFYU0NoalU4NjlpNVZnZWpKWXFqQm9ucnFFMmNr?=
 =?utf-8?B?Tkk2dFgycE1yWTB0WVhtTGFYUUFWTGtJVWFTeXA3ckFHeTc2M0FhbENITWE1?=
 =?utf-8?B?WXkzNEoxK0hRNlRmbWZpVlROMnI1L0NCRHAvL2hkWVdEV0pUcm5ET2IzeUw1?=
 =?utf-8?B?OEVjanJEQ0pNK0o3S3dJRWZXNW52N2ZkVCs4UmhZRmRXcDREcU1LWWV3eVhO?=
 =?utf-8?B?bDMyN3FBYi9jNlA3TWFXdFBpclUwbmxHZ1lRR2NmSGZ4K05adXpuWFBNTjRy?=
 =?utf-8?B?VFJKTlo1SVY5L3VuUng5ZlBXd1BYNGxKQ2tCRmhOT0ZtcFFzYjdXalRJcjNa?=
 =?utf-8?B?cFBsNTVCTjlhazMxQ3lwbVZCTkd1bnhDV0xCVGZacmkxemduL1o1Z2VkMTM5?=
 =?utf-8?B?K25HS1k3N3NVM2lsaWs3V0EvU2lJMmY4NmpEbStydVNkTmxRRXh1cnVTempH?=
 =?utf-8?B?RXNESTJTYkU4TjZoRlZDZ1MxMGxJNXYxUzdhQlIyaVYzRUJ4VmZOV2RqQnRv?=
 =?utf-8?B?YnhsMjhYbkd5bWxEbUFhWWNzb1FHQzNmL3pIY0Z6alFIWkRoUzU0YngvWTdz?=
 =?utf-8?B?SmFTZ2VQUjlBakl0YUY0bUwrZ2pERkJodGFuZW1IVXlkVUkvY2ZtSmFSbXZE?=
 =?utf-8?B?OVJoSXFqaGVSN09HbVV1RVdoa3ZYUGc0cnFBQlEyZ1NNTlBzWSt0RDR2emJS?=
 =?utf-8?B?RDBmeXdqaXJpTzl4bnJ5bkNMaFdyS1NERENGeDA0L3c2djF2ZVR0MnMxZDZj?=
 =?utf-8?B?RUxHV2kxYWc1YUt1MW44OXhXaEhOMVdtdHJ1UzlZNmMveGUvSkdIUnhMbEJN?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d131358d-8c46-4a01-6686-08dcf25af278
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 05:32:41.1925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ruIQg8dhoVKT8NyMpf2qgAtOl/fRcasPkTG2CTtmDXm0OBnkqF16x+S/Zs64b5hw4xuuyihKqOFtzsXz/aFv5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5272
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



On 22-10-2024 10:36, Ghimiray, Himal Prasad wrote:
> 
> 
> On 21-10-2024 23:27, Matthew Brost wrote:
>> G2H work queue can be used to free memory thus we should allow this work
>> queue to run during reclaim. Mark with G2H work queue with
>> WQ_MEM_RECLAIM appropriately.
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/ 
>> xe_guc_ct.c
>> index c260d8840990..1b5d8fb1033a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -213,7 +213,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>>       xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
>> -    ct->g2h_wq = alloc_ordered_workqueue("xe-g2h-wq", 0);
>> +    ct->g2h_wq = alloc_ordered_workqueue("xe-g2h-wq", WQ_MEM_RECLAIM);
> 
> LGTM
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Some how this patch is not reflecting in my mailbox, so replying here.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

> 
> 
>>       if (!ct->g2h_wq)
>>           return -ENOMEM;
> 

