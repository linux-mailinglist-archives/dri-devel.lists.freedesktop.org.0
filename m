Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOg3OD5YimmqJgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 22:57:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52507114F1F
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 22:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C76A10E354;
	Mon,  9 Feb 2026 21:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="U30VCN3F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011034.outbound.protection.outlook.com [52.101.62.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921B410E354
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 21:57:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vbq0SrFkn6Se9nTqynIfVgzR+nkWzss5cOfYBoicAFPAJNBYGfNGKdzt4b49wJ/OEjXM2e9unIn9tqHiIin15RR65jqK/hUaUTaq1VihRHrpossCWX4yRSV/4Ea37uipmPU3/FbTBr1fJVK1NeAO9qvKVJh2phhsiNl2rVmJyp8qLV3wGrpV0vPS9Cz2AxlCHVvfVf0G3TDwJByD1cOWjxnTqhswQllN+umsrEKKERW4dLVXBPFvzuFVuGBuoRO/I/lkgC3a2MX6fmxNhtWB4iz0P85mJtdqYkGJ5PcwlMgBg+lNl+UP3mDCOVkCWF4YYzgrNIWIH1GJIUVpG51L4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erAt1BRKgaGGmZYUdjbi4gA072qfwSoug9NAKExGadk=;
 b=BeQ1mCGfwcTqVIvtOnSx71K3/Ncj/tLKA5/aNIgotr7sRF26S+qx7OSv+S3enc62JB2LLWvCXnh4+gZoGQtLrTDbXdUXREia97ABSp5KtZelWhKDOmJlYpwCZGIIlBkBPi01Llu59janhH9Rqr8zpiljxeCsdAFvUmtEvrPelXu88vNniNjJCXTY6Mz8dHKbgNwW8zUm2A/YfbmL59WcwC71vwvJsrJ8aObdGHRaP4zi0G73beswOOObpAmltjEVnfxd0jeZvdgIdwtCfyw/nqYkIcoTTZM44dEuoPRISk6Ge0tzaGB8UKMtt5R8q6ke/yCkcYEYSDyXLNtVScQkYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erAt1BRKgaGGmZYUdjbi4gA072qfwSoug9NAKExGadk=;
 b=U30VCN3FIXWnLv7u8w4dhlchmXBp51fe/Yn3DyXKJLiVr6KpUFO0FpYjhuVvlNSWmRjV8G8Zfktt+tlEhUAUGe4KnMw49nXCC3duIpzmNwFyFIiw8qKruQvk7397RYCQ+5E+aYT8bO1vifNoKNRazKyvzsHXWIG5P3pcgJb8nKok882lJWrP733qLPVz2lvzwp35EeBAaf+rN446XBVqIOixpMScDr79qf85tKxK9kh5emgs2N3al4SPm3gqNnc3QW8ISnUti2skLjaZe4OBNswOJfTOkhu9LnZGxVI4u2wpZenjsvBA/wQOSUsQE+7fu4TIMSrdu6z8cx3jQyFWxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SA1PR12MB7269.namprd12.prod.outlook.com (2603:10b6:806:2be::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 21:57:08 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 21:57:08 +0000
Message-ID: <13f3fcda-7328-4aa5-afc6-75a294a82b2a@nvidia.com>
Date: Tue, 10 Feb 2026 08:57:01 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 11/16] mm/migrate_device: add THP splitting during migration
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251001065707.920170-12-balbirs@nvidia.com>
 <e73bdf49-0a6e-4e82-9727-3a241fa9722c@kernel.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <e73bdf49-0a6e-4e82-9727-3a241fa9722c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::34) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SA1PR12MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: d21e324d-6a6a-4f27-018c-08de68262b91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVplYWJzTnFSd3JzbGhXNDZ5Z08vWTdOM1I1cUt4VlVXT1F2cllCTXlYQ0N1?=
 =?utf-8?B?WmJOQzI0TWJTZFpITXhqaGF2dnNMU2FreFV5amZWZGdiM2w1SlFZTzF2SWVG?=
 =?utf-8?B?RnpidnlNandua2lFVkpMU2t1NDFUaVBvc3V4T0ttbVhNdE42dkZJeWQ2RDNt?=
 =?utf-8?B?bkMvazkvb3RHMFYxdHZjVWxaQllkV2d0TytyYnJZQ1lHZ2hlWmpoMzdMaWFM?=
 =?utf-8?B?VHBnNE16Wnh2c0xPb2JIK3VxbWFhcDhjOXZtMHNhaEhsQ3NUaWRBU3UxTUI2?=
 =?utf-8?B?aDVITDlwMjFBcDV6VDRlK282VFU1VW83OXpTb0Nkd1RVcnc1MVdydjdwWkhX?=
 =?utf-8?B?RTU1MktZakp3LytzdDhYUUJQNmlrOElxeVRXYVdQYlUvQkhUb3l2MVl2TENC?=
 =?utf-8?B?cmtTZU0yUS9uWDNoZ0pobC9CbkZOYlBQSEk0NFJZbFRhOEljSUkvLzJUYzVa?=
 =?utf-8?B?bUdtMGIzbWhjZE85a1lETm9LTklhdytMTGt3YmkxM0VmeEZOVWxGdzlXVzFr?=
 =?utf-8?B?Uzdvd1ZJU1hVNE1CRFpPL2xrdHpTSy9obmRWai84NlRUclFZd015eHRoVjRP?=
 =?utf-8?B?a05PZG02L21VeGVFRVlMZ21oOS9iZzhwZ2VkN3ZUOHlrWWl4MHFmYUFiTVBV?=
 =?utf-8?B?cVdGVzgzSnRjVGdIVEpwZjVHa055T2dBdW9OTXRMMGtxU1huaEZZcjh0TjBB?=
 =?utf-8?B?NmozOURsTEoxK3FVa3MrZ3RxV3A1Vjd1TDV5MkZLVnUxOFB5MTR4bnBQQ1Fw?=
 =?utf-8?B?WjRyNlpmRWMxNDh1RnVyemNNU2RzYWVjVGp0S3BPVk9SMDFZaVpJdVgvNWwy?=
 =?utf-8?B?eEZZN2gwSFhuN1ZqS3pXaG9PdHVzYUFEZEF5N2k5Qk9yQUtobE1STVJSK2J5?=
 =?utf-8?B?SUtmRE9zd3o2OXNRWitQTGZseHRySmt1b1Z3WS8vT2ZPYmZqR2pVZ0htUGhR?=
 =?utf-8?B?QWNRNVljbjhSRmZLK1QzdkN5d0N4a2c4UGtBdzBYS3NRNEhtVFkwUWU3alNV?=
 =?utf-8?B?bFNUcXEvQ1Q4blFxSyswNkRDeFE5MXdpL1RqVkRubGRKa2tEeDFoQWwxTWE0?=
 =?utf-8?B?c1g0OTBiZ0ducHdhOGJWdWdmT050Ny9TK3hTMEFaUzdleThYalc5cDhJT2Z0?=
 =?utf-8?B?N25HaVZhYlE2WHF5dXZ3WnIrWksxKytGcFMrZi9SNkFyUUdmNjZNOFJLTHBs?=
 =?utf-8?B?ZEtPNEpscHhJR2kybWlsajZCVlFNazg1YU5FS0JRTmVWTnMzZmNFY1pTSEll?=
 =?utf-8?B?TmRVMFpRSm9tcjJXWG5lZUo1a3h0dGVUbllsdk1oMjNqWCtLL3RXYkdnZU1X?=
 =?utf-8?B?c044eDdHd0FqVCtSWk1MMFNMaW9QaFVna2tSQXhmRzQyVUdnNnVONkRkSmtv?=
 =?utf-8?B?NXNLNmd3cmhkT3VQeWpCNGd4RHRXS2d6T2RhdkU0QXNRNjJPNVVqMkM4ZVp3?=
 =?utf-8?B?MDEzdVNGT3MwbC9ZMVVvVU5BMHFYM1NXNUFPdndkTjZJQk1SNHJySjlWeUFT?=
 =?utf-8?B?YWI4SUdGQ01MOWVlOVd0cUVQVnViMFk0aDZqZ3VBTE9FTkFsT1lJMDhOTWZk?=
 =?utf-8?B?TWdVZ0VuWEFkcVo1WjcwdS9aYzN2MU9PM2dhR1lVZFNwOVhnY2tzbmttQ0ho?=
 =?utf-8?B?bE44dFpaYWhvUDA4QWVHbUpzejV5SnVQZFNvZi84SWdCUlF2WHNVSUJ6VHFP?=
 =?utf-8?B?ZW52SzBmd2RnbUZnSFBwaGYvNFpBRlFSb0ozbzQzTmp0QXZKQUxKRWpCa0wx?=
 =?utf-8?B?cm9OT3ZiaWhMbXNWYStlYWRPelFEK1ZjTEtiNzNzNHp0QWtKbjA2YlJvL25T?=
 =?utf-8?B?enBJaTJhbDBoY0gwMlRqdWI3d3JMSm9Wc3h4dkg1OWxSM1BETkczNFZJOHpp?=
 =?utf-8?B?ZjkwVlZTS1BQcytRbjcxK1lCSm1xbThXYjhCd1B1SC95dlcxWWRYWm02TmJr?=
 =?utf-8?B?MUlIRWJmOHBQcFlLWkF4cVRyaHBzV2xaelNrZWxic20yZkRKM3FidW84dC9H?=
 =?utf-8?B?cTBWM3l0dUs1aW5Gb0VOWGhyMTRNZitiT0lMUGh5NDdubC9TYTZpOGZyUk1l?=
 =?utf-8?B?TVJCRUdGS3ovcFZ6dFZQL1JRWU8wVWdXQ2FJeFd6eDJVYVVhL2dKTGU2U2c2?=
 =?utf-8?Q?6BO8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlJDYkxhUk9DTjZ1TTJwUkhUWnJFSWFqR0xGakl3S0xDL0xpSGR0RmxSeGxW?=
 =?utf-8?B?cTN5SGZpb3piZnpGVEZRdlBUOTRCdld2Z1R2d0NOQ0d0aUZERjJSUlhXVzF1?=
 =?utf-8?B?VlgwRXh3ZGJtSG9nTXkyU2kzbURuZEJRaVRIZTVGTzgySWlwQjBlbjhjTWpv?=
 =?utf-8?B?REFubFFjUVY0eGFOa0ZEY3RxWVFzYnIvZXNaYjFhRkxETlp5Q1hGQVliemxL?=
 =?utf-8?B?cExtejFZcDEyRDBpbFdmVHNKejRFL01nWFJveEJNZ3VoRnlvZU1RbUhQbGcy?=
 =?utf-8?B?UDJZdGhrd1dpOS9LMjFoaVh4MWRDNDVvUkJzK0lGcngwem5uRDZXSTBSSDR3?=
 =?utf-8?B?UHB1Tmc2RWlSdCtCT3VUTmFwV1h2ODdjL25UajV1V3NnMm5vT2dlT2lLUld5?=
 =?utf-8?B?QmdUdnJBS0RlTWRJYStINHlUaVp3N2lvZmJpKzRwQWlNUWgzeFJ4MTkyVkpM?=
 =?utf-8?B?TXFjOUk1Z0FzdHZjNzBSMWJmZXg2SHZZVlBiRmErcVoxSjZHVG9tWkFWN2ZP?=
 =?utf-8?B?dXpURm5Ra2NSbFNoY1B4TWIyVXFpeFkrVEdDODArMkk0alJHOUpmb0NJalNF?=
 =?utf-8?B?TDV1K1NQd1QrUWlBK1lLU1NreFFzcnNpLzI5dmVUNU12b01FcEFuRGhwODVK?=
 =?utf-8?B?cjRnNlEzaWp3OUY3TVhFd2pJKzllTWkyRVRMV1hjVEU2RjZHVEM3N0U3NGJm?=
 =?utf-8?B?czArVHNqM3ZwV2VCRmVEaDVCa2VpV3VRUjdsM3VDY1oyR2xvWm5YVllQM2pp?=
 =?utf-8?B?L1lHUzlia0hMWE9VcEYwZW9ySEhoTUU2dFI1K3czT05TM3FDMHhwdGhkbVVt?=
 =?utf-8?B?d1JoeERBU3YrUG4yZC92b04zRFZZaXhDODFhMTJXSC8veldua0FENFB3dnhr?=
 =?utf-8?B?YlpjQUhSRHR5VG1FTGRxWEZHQWlENkJrMmo4RE1YOEZvbVdFak9tZklqN3dq?=
 =?utf-8?B?QnRTay9iSVExTlRrOFRFMEZmeGlFZ0JwbFZMenBaU2llZUJvSzB5eEt3L04w?=
 =?utf-8?B?ZjF6VmI2YUlXL3BOb3MzMXVRNGExY0VmbTFrSHg3ZkFZajlYWStiQ0lFcGd0?=
 =?utf-8?B?WWEvdDVjZS9SdnBzZEJ0SU1qMWJhbDdxM3RlTHhwczA3N0lZanVhTWZ0MEh0?=
 =?utf-8?B?aFhTMEhZMzZNRGF4WTNZRGlkSXV3aGljZ0RsdzVNWnFGQ1JsSlFEL0lpSyt3?=
 =?utf-8?B?SWlzVHI2YmxPaTgwb1BpTkorNnBuTlhXOXFVSlhRN2sxaDBNbHhodGZBWC9s?=
 =?utf-8?B?Wm9JWmRYY1RBbHJYN0xjYTh6UnVrK2IwTE5zMS9QNkgvL1pCZkFmSmJIeGxN?=
 =?utf-8?B?cDdhMkRBSGg1YW1EbHpkRW5WR3YxS2t3Nld1ZCtVSFhyN3BUencwQnhIZnZn?=
 =?utf-8?B?cUVYWTNiQm92bVZVd2NSV3ZOMW1QRmo2UjZMeUc3NWtKd2c2aUlWZ29KKzg5?=
 =?utf-8?B?dS9IVVJBOE9ZTmpRYnVzMis1K0hnTlhTU0U5MWdFaUZqTkx1OG56VkhyaUQz?=
 =?utf-8?B?b2x5c3E1SGlBcTd6VFRrOWdSd0lWVU10Y1k4TW82UVdYZUt2NVhROXVsLzJw?=
 =?utf-8?B?Qktya2o1Yjl4S2Q2S1FScy9Gd1ZGSmRjZ3UzcENPbmYrY29La2ZuSVdtayti?=
 =?utf-8?B?UW9LSDdSVEQzR0NRdHRzeWIvZXRZV3o5Q25iM2g1bVE2U2FDVnBWUk16dk9K?=
 =?utf-8?B?azdjN1phcWdMZzJpbzhCM0RqeE1LTmhqQklMMHI3V3FjVUdiRk5IMHB6elhH?=
 =?utf-8?B?YVdqSWZyRW1BZ2NRMzNZT0FDM2FxS293MmthR2lZaGxaY1ZCYkpMRVlDUk9l?=
 =?utf-8?B?VzlBMng1NUppVCsyb3RHNkdwc1FhSDlhYjBKYW9HQUFiUzgyTUVjenQ0NDZn?=
 =?utf-8?B?aXJwVXB4SzBLUU1nenhreFpuTm5NTDdjNnZ1VS9HUm9EblZDaThmODkyNjhn?=
 =?utf-8?B?U0FWVGJSdG4wVW1aQU5ac1ZDY0VKcWNVZ3UyaVo0KzVhbEZtT1NSbWlTNVhx?=
 =?utf-8?B?WGMzQmY5TkdCSDhMQ1ViVURzTTI5WTVlMmh1RmRpeCt3K2ZyakdXYm9BZ0xy?=
 =?utf-8?B?V0NnczhxOUtad2ZtR0dRdzU4VElqSDlJZHFIS3EvRUJKcmxqODVjbzNTMC9F?=
 =?utf-8?B?bkdKeFZCKzRwQlRTbW9Ld01VVXhLODFvQThkTjdpTG9HaXh5Nnh4OVEvMm0y?=
 =?utf-8?B?VG5xMmhINElIN1JpTTFNRExOYTBxK3VweDRLOEY2bGFTTnkzMFNNRzBTMlQx?=
 =?utf-8?B?V3dxS0lLYVZPSDFPVkRabzM2Zms5MkJXeHZvTDdMNW1UZUR2dUg3Z0NoYzBx?=
 =?utf-8?B?VkpGU2VDMzU2dThERjRXbFBCUU5WbmVYMUN4UytrRVIrVHZucndvczFRYWVx?=
 =?utf-8?Q?mVFZJRD6o9P9QMDBcHDyNuPuD2NZRoM1bvsEbuuq1bIRj?=
X-MS-Exchange-AntiSpam-MessageData-1: TDXmPUxghoFVLA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d21e324d-6a6a-4f27-018c-08de68262b91
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 21:57:08.3909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eATOVeRhAd2kEiI4pZvbwO7uPq9YAgIQyze+rm091jkPAblbXO+wVHpOSoWQ0V7bxVvB6l25o63qrxEuUzI1JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7269
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
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:akpm@linux-foundation.org,m:ziy@nvidia.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:osalvador@suse.de,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:matthew.brost@intel.com,m:francois.dugast@intel.com,m:joshuahahnjy@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[balbirs@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balbirs@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,nvidia.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,suse.de,oracle.com,redhat.com,arm.com,kernel.org,ffwll.ch,intel.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 52507114F1F
X-Rspamd-Action: no action

On 2/10/26 03:00, David Hildenbrand (Arm) wrote:
> 
>> index 8c95a658b3ec..022b0729f826 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -3463,15 +3463,6 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
>>           new_folio->mapping = folio->mapping;
>>           new_folio->index = folio->index + i;
>>   -        /*
>> -         * page->private should not be set in tail pages. Fix up and warn once
>> -         * if private is unexpectedly set.
>> -         */
>> -        if (unlikely(new_folio->private)) {
>> -            VM_WARN_ON_ONCE_PAGE(true, new_head);
>> -            new_folio->private = NULL;
>> -        }
>> -
> 
> Balbir, why did you drop this check?
> 

Are we running into this somewhere? This change clearly seems unrelated to the intent of the
patch that made this change (by me). I was seeing new_folio->private as NULL everywhere during
my testing and so I removed the check, happy to bring this defensive test back.

Balbir
