Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Li3MHb8vgWkMEwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 00:14:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC9BD29CC
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 00:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6B010E2EC;
	Mon,  2 Feb 2026 23:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dlie4fjL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011012.outbound.protection.outlook.com [52.101.62.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C57E10E129;
 Mon,  2 Feb 2026 23:14:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=podVM2nN2RIQBES1JuU9RZitlgazKyYBIpS/yfzEMSH4pLFY3y+xyjsudmLl1qQgSWsN3GWr/1/8Oddckc/G69MtC8WKqFr/kE+KSkX0eM7oC6dwtPI58pBvH8+lZSHRzfn3+Zwu0r4557+qCWgo1Trp/6HGvR0ZBVXYsTLJhQ3lCN8GQbGpXbYjmgvHqlUa5qOcAbUhkMXfdk+VlQAfuvF/LZwOajuj2oDSYveZwZaWkDTSHXvTSpCNRjvBRAFdZ6Qu8cGmFxSPe85sUXDVAEWPIJKv2F/ET274qI0ai5cc3P9cSAZ7Ufs0qKSp0cEzczrsnithRMl+D0VOb3LaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOGJPr3wBWEw2A/XvDe7mu65tpo/pGMSzrsSxXFhoww=;
 b=K2CtJjZIUWzWO+6RuM7Gy0Ftk58oT7q8iBezhb4eXURyIzOGVICnx6NFypuZFCPhpNDLuw95RpXRd1of87ZVzcL6u2jRg/1J/kCwFqxpnwwaEN3bTD1qMCC2T6FHsDC7yNpanXobFo00oFcCKdvGIn5heZEpGwTVgEJGPYSTziMEVqj9h/5cLFY+Rnw0FhkGKnqI35kADXJfZtmI40Ze1sLxq3nqro1ykIhL/jQe8g2nttTCSAHBrjhzlvv7H+Gsdor9H51DtOUHTI8Gp9Vd9buRccV7xDnAWPAK3cpZcbguiwXjJJFU7pGeo7a5bFWj/8Li7sfIRsUauK3e813UVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOGJPr3wBWEw2A/XvDe7mu65tpo/pGMSzrsSxXFhoww=;
 b=Dlie4fjLUqlE63aIr8D+vVP1VE00a9uIlLGmxmlyejdJDFod2wbJ3CAvRoLfJ8fzwelO/P/hreDtbw4Ov6cwzXyE88P4BpQnVV0Kxj5aKcp50Vfu9WmVV/6/01KMkFPs6ATBlGdvXIy4t81jcj5yNIhe3j762OzXSBfpvJR5nUcfVkasxob6gw5WnSois1yjHipONEnHVshUtqrGL0xS8Vzy+tHh4CiJ6T68ollvB4NEbUKYXGtk6UHBl0uq5SVdVsH8Le1yk7LgTmhASWzlTgjj/b8mpjghHfgOUo2dfl13oN8z5jz6c+B1oyi1RYGgVq0nrOECuCGoa8pETUEV4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB8428.namprd12.prod.outlook.com (2603:10b6:510:243::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 23:13:57 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 23:13:57 +0000
Date: Tue, 3 Feb 2026 10:13:52 +1100
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
Message-ID: <qjqs7s2ismh3mdrgvb2ovdhs2tkozwt5nqzkvmrxwxpp6llq2m@e6enxkfrru7h>
References: <81b9ffa6-7624-4ab0-89b7-5502bc6c711a@nvidia.com>
 <aX/AgHAZ7Tl4iOua@lstrano-desk.jf.intel.com>
 <lbqqmohxpeynsrunbdyvod2fm4tinzq5coueh2mq6weubste5x@y4f5weqvwszg>
 <f48e3d818c6e20d6ea7a7fbd6b1741f25df17a78.camel@linux.intel.com>
 <ymg5yawktqtw7vfgt77iciqzxhjlsnqrwnjx3xmkflbjqbmq5s@jcxzcymqq2af>
 <d8c02e59a4cdd2d02b41aa5ce8dcd36a94fbba86.camel@linux.intel.com>
 <ewowxagab6ej5xldwsewfvg4wgpmelps2dgqj7efmcnhks4nqg@nqdhfedzlvjb>
 <aaffa3f1bbb97e61d86c0e4ac474cdc8b983b85b.camel@linux.intel.com>
 <nvajpou3j7osyx553ktafdc3qx3v6hisygho42swkzm6xdbwvt@bg6d25otpqj3>
 <43d010966fc99ca480f365220ae8c3615e538b07.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43d010966fc99ca480f365220ae8c3615e538b07.camel@linux.intel.com>
X-ClientProxiedBy: SY5P300CA0045.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fd::18) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: 6362fa61-8890-4366-74a7-08de62b0be02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEVEeTA0VHY3djlMcUh2ZXVhdnlLMkhQenAvWEZ5THp3Wko5RCsyeUFkZ0NO?=
 =?utf-8?B?U2tobjM3R2JkRWpzR1NMczEwNjhMWWdwbGgxS3NUTC85aVlLWWFjL1VyUVU3?=
 =?utf-8?B?aWVTblRMTzdWMFBhT0xzZy9sakJjRjAzTEUvQWlBUUorV1FleGxWeW8xS2tv?=
 =?utf-8?B?WXdxd3dFdzBVb3FyQlplYlRIK2NkQm5sVFhRaHhGS0NpR0RqRnoxTnBjTzU2?=
 =?utf-8?B?L0VpZFdoVWNMcWdEdGtwcU50dGJZUWJGeGE2VmdoNGFJWWxoQWJlUzdYak5R?=
 =?utf-8?B?ZG94U3NiOG5xeHRjM3BxZEhuWVMyOXhvWElxNktHbXpsWnNCS1hWdkNHVXhv?=
 =?utf-8?B?U0NpRVdWYkVjL2RZRHdwQk02ZENXOWRMWk9wMmhjb1V1aHhxdmRheUFIbXNZ?=
 =?utf-8?B?bHlFSFBkcGxxT0JHcHpZTjVKeFUyMlpveEd2dkVVdDl0ZTZOTWhHQWVyc1kw?=
 =?utf-8?B?RE9MZW0ycW1Kc2ZCc2orcC9aVzVuVnpldjNyeUkzNWlhS0FyR0ZHeDhlNFhP?=
 =?utf-8?B?ZjhMdW5CcHl4bW95QVdaMS9TUkl2a1RIb1g4MmxyRnFRTzdFVEtRd2x5VnhF?=
 =?utf-8?B?eHpGSFVlMFZwYm11cVNaM1BtdVpYRlg2YVdvc2VBMDZ0SG9wTHkwdzF3UUlh?=
 =?utf-8?B?VDUzUVllQ3E4QUJBVnJUYUtYbWl0QXZ6UlBjQU5sU1AzZ001NU9mMlZISDBv?=
 =?utf-8?B?eWtlaFlyYWJtRys2Zlo1RU5rdTVvMU1rUHBlQ3l1NW43RUhDK1FoYkVWRm0x?=
 =?utf-8?B?aDlTS0twTGZCblQ4ZVZVUDA0eHJ2Z2FIVWh1bjZ3cWdOMWIrR2lJNDIwcURB?=
 =?utf-8?B?M05CL1VQMEI4WTVPZWlpMHFHV0ZLbk0yNVR2Zm1uUjJPbUx6UnlEOEpycGlZ?=
 =?utf-8?B?Q0tqa3VtejZnYUhQRjFyT282SWpvZmEvNUg2RVZERmFkZEwrMkNPYk45UW1O?=
 =?utf-8?B?cU1URnd5MTAyR0hCM3puT0xIc0V2andHdE16aU8venNXbitNSGZIbWVyYTY0?=
 =?utf-8?B?U2NoRHJDbTlYZldXYk5xUFhaTDFTMVBGL1NsMDBsYWFia2tkMWp6N2x4VUIx?=
 =?utf-8?B?MXowRXV3QURkMUNNNThRbUtBbktjNDBScVJiSS9KbkJlYTVEZk15ancyTTkv?=
 =?utf-8?B?NXVIdEJVNTNPYzR1Q01WLzFrOERaQ2I0c0szc01UQWExeWVya1lMQWxUelA0?=
 =?utf-8?B?dXp6SXNCSE9uOHdIanNwY0lPcEdzcDVCOFVoU2c0T09Dd2d1YzRXaFNsRWNC?=
 =?utf-8?B?eVQ5QzJWS1Y0SmNrWjRqYkhWdnB6SW5PTjNjc1UrczN6M1IwcVJFTUU5L0hL?=
 =?utf-8?B?aThYZnZ6cThCZk5QRkM2Qy9EMkkvRGxRYWpCeHFnQlpycitieDFMOUlwVjFv?=
 =?utf-8?B?dU5IbGtPSXBuclgvME1mVlhHSVYvNUdZa0U1VWFUbDFmOVNJd3hhT2YzTmpr?=
 =?utf-8?B?QTVQN3k5ZVoyU05Eb0NqV1F2RGpmc044RmpnaGQyV3ZMTzJJRk55T3FHM01R?=
 =?utf-8?B?VUtYMUJ0NzNzdGV0VlY0eDhYWG5RZGVTMC84UU5iUXRKYXU2MGRDU2FjTWdZ?=
 =?utf-8?B?Yi84QitDWEVBd2orS2ppU1BoR1U3QXBzaDQ2UG90bms4V3J5b3BwdGVYSksv?=
 =?utf-8?B?RHRlOUYrcytyMmdYajBOY0t4RnJrbFpCNGwzSjY5MCtCWDVpdXk0bFVQbDhP?=
 =?utf-8?B?VjMyQklQbWttVURUOUZJTjFhV1k4TmNUaTYxV3RoVHJWSmt5dmdxZGtIU1or?=
 =?utf-8?B?RmF1MDJINk9ZU01yVzUzdlpXZ3doaDJub1RPWUhrbXZ4Ymg1eE9Qck5PdUIx?=
 =?utf-8?B?NjRyZjlNTWE2UnFadEpxaEdOWS9kSnNLcTI2UzVmcXdjaXA2eTZrMzRuZllQ?=
 =?utf-8?B?NU5Qa3JGMFhNNmE4YkdQNUVRY3docUhudTlNa0UzdmsxRUVIR3Ayckx2K3J0?=
 =?utf-8?B?anREOVhFdklpU3Z6Tm1VMytFWWJIdXpETUVOWDd5RHVHbjRnM2VJT25xMVNT?=
 =?utf-8?B?KzJEa3NMbjFSb3pwVmlpYjBvRWtBaHBBMmtEMlZ6eWQzdWxyNHVMd1MzdDFO?=
 =?utf-8?B?R2ZVZ1JhTHErajN1UENCaWNHYnkydGtKbnIvQVdqcG9EU2phZmw3VzlNWlVH?=
 =?utf-8?Q?ROmGWxBHYLZ4yzJ4btFUva3IX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEFIYngrMFk0NjJHRjN6TlhqbkorWlVwRWwrUGtBTzU2cnE3bmpUbG80Q09v?=
 =?utf-8?B?K1ZCamxWeHF6RHVwcEs5OUlDQnBkT3Fhd0p2UDY5bjFMb0NjdWNBVENxMVRE?=
 =?utf-8?B?SHI0V1k4ZmhPOTNZZ0FUM0xDUnNxaTBkOVkrV2tkZ0EyLzQ2ZFcrcGI1anQv?=
 =?utf-8?B?UTkzcTlvMTdGN0tUYXFJU05XeHJab0NKN1IxZlhjbzlwTXB5bU9jeStuZ2V2?=
 =?utf-8?B?blNTaE91QnVxeW5tbEQ3YzMzRjY2MTJmU2UvWG1MQkZoWlV0a3Z5WEhydFRz?=
 =?utf-8?B?Z2dvZGZieU05NzhFekJwWlFLQ0xGZURJQnAzSkt2cFp2WFU5Mm9rUHFBTEVh?=
 =?utf-8?B?aGJWanpYOS9qVnBhTXZGb2hkTVdVRUFHN2RVQUQ4U0l2TlBTTVdrUE1sS3RD?=
 =?utf-8?B?QkhxTGpCWEhpekNUZ0ZobStXbWpTMjE3OFFKTE1oK3BwUmtxSThaMHArOFJ4?=
 =?utf-8?B?aEJRdlZNTkRXd1oweUdpeGRsUXoxc0hWNGZ3aDQ2UXBQNE1DUlBldC93bFBw?=
 =?utf-8?B?MVd0QVZzZ2cvdHo1NVBmZU41bTZLWkQ5R0xaMG1lSlB1bW1yWUtoZytES09B?=
 =?utf-8?B?MFJwaUdQZ3RjTTFHaG5rbGsyYm1WOGtCNHY1ODFQSVFqZFFiMER3RUNWUWxw?=
 =?utf-8?B?T0F0M1BhRGo5ZWJlenY4SVhsUjBCL2NQeERnVU1CK1UydW52OEZGTGhua016?=
 =?utf-8?B?eFJBOWIzKys5M1oyRE9BSG93TnpZb3FkSnE0ZDlBQmRpanptVEloS1dPQ2Y2?=
 =?utf-8?B?VmZMMkEzNDFYNEV5azlxSXBPODJtM3hqRDhVZjl5blJ0WCtFYlBwOGMya1d1?=
 =?utf-8?B?QUlwa2dMc0orVlBOcXh4RjFPNlQxRmJGdzRCbzNMaUIyL2NVWHk5MjdFeVMy?=
 =?utf-8?B?dXl2dHNTN0tUT09VMkRXV1RPMHc3RHBjZU1jTk9GYnJxNUFYNnFRUzJOSlJW?=
 =?utf-8?B?NldlVWhIMlFPMGVZOVRvV1FDY0VROGJyTEwrZkk5ODlCZFZhczZTNEw1QzhE?=
 =?utf-8?B?Z3l4R2hYWTlyd1BhNlN4eWFtNGk5VzdkOC9MZHB0bzZwQ3BiVzc0dlI2a0Vk?=
 =?utf-8?B?YmNuVU1PZ25GbHdJMHJNM1lsWDh3OGlEdU1vZ2FQOXFUam0xVTM5dHpDZFFE?=
 =?utf-8?B?cm9nNGQ5YllqRmV1WWhGTDBORWowMk1iMXhrMXNXdjk4NGRjOWc5WFV1VGVa?=
 =?utf-8?B?eFcyN2VSRVRuRnhYOVlSSC9yVGZVTENRcW01WXlHK1h4VDdLQis5b3FEbFFC?=
 =?utf-8?B?RExLbDBEWVE4WWF2OVZSM3JtMlBBRXVTQTVVUXo2TWJCUStJS1NPL2FsalU2?=
 =?utf-8?B?WlovQWEwaU1YR2ZDbDZETGJvY0pUNU9jZE9NQXFIT3Vmd0NzN1F1ZnMyZEVZ?=
 =?utf-8?B?aEVEc2RxV1RQbkhCQ1ZIOTJXQ3U2b3VRUWVCL2E1Z2xmbTJKbnMvd0kwYS90?=
 =?utf-8?B?UDJCZ0NqMUF3K0JlUW1Wa1Vyelg0NVA0VkphdDk2VVpkMjlBaERxOUg3SDZx?=
 =?utf-8?B?bGhyUnhzYzU0SXFvUkt1VWdWQVpMaWloZEtJRjJ0RnAzRFg5REc4RENmdHdh?=
 =?utf-8?B?MWN2YXM3Q0o3alp6RHp4RGc0a1Qvb21INTJrdGlqT3d3NDNhajRkR3J4Wkhn?=
 =?utf-8?B?cm5VYWpZLzl4VnBwT3o3N0Ixd241T0hhMmdBZmQyaDl3cHhMMHFPTXBJY0J0?=
 =?utf-8?B?UGRVUTIzMUdxbDlRTlliWVo5K1NaclpXQ3U2bHltSmoxRzd2QVJhZGNNcXBI?=
 =?utf-8?B?NTg2dGpyamFQVjlMUWo0dEtLU3R0d2NqQ2dTSXJRWVJvbjdUTXBjeHJqTGxB?=
 =?utf-8?B?L2NvQk5vVldLejFJV204dU85b2RlWmkzM3VreWs2Q2pQMFFrRWhqSkdBYm5q?=
 =?utf-8?B?Q21Qb09RNUI5RGp2WVh2NTAzOU5ZbEIxMlZvV1E1NkxQdWd3Wk10OGNNOVQ2?=
 =?utf-8?B?Y2phRndlVnp2NEp1bHhubFVRZzBhdFQ5NnBkSmlZbXBLcEdiQUNhNW1Gc2wy?=
 =?utf-8?B?TGNpQzZnd3ZkaVE4RmRDRlE0ak5PTFUxSDk5UXl4MnROWHptYm94Q04xV0dr?=
 =?utf-8?B?Uk9lekdyMCs3T0RENEQ3MW1mNmRjcHNBK1R6TTRrVE5LMWtQTEFIQUZVK2dW?=
 =?utf-8?B?RzF3SytjQStSQTN5VUl2aS9rVERyLy93S3VwYnhDbGNUcmtIdGIyemJsNlN6?=
 =?utf-8?B?TEdtQTFKYW1KMFYxdS94eWVzY0plcWlxZW5JK2MxSEpkSU9RZlhycGg5bkhv?=
 =?utf-8?B?R0I5bUYxbjRyMTFSdEtnbGFtWnJFeWY5bVV0ZTdrell2TmxsdVBrOEJFdDcy?=
 =?utf-8?B?YlZyNnl2Y0tyc0Jlc244YVdtV0g0S28zLzdFRUxmemFWUXdWbmJNUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6362fa61-8890-4366-74a7-08de62b0be02
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 23:13:57.6729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TdcqTzkHAcY44nz2Jk0yEsxaYukpRXD2MKvN0vgts9jVEANHfPcjCV7qEYLj5/30RxkIYshgXVueYUgh1PbnCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8428
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: BCC9BD29CC
X-Rspamd-Action: no action

On 2026-02-03 at 01:07 +1100, Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote...
> On Mon, 2026-02-02 at 23:26 +1100, Alistair Popple wrote:
> > On 2026-02-02 at 22:44 +1100, Thomas Hellström
> > <thomas.hellstrom@linux.intel.com> wrote...
> > > On Mon, 2026-02-02 at 22:22 +1100, Alistair Popple wrote:
> > > > On 2026-02-02 at 21:41 +1100, Thomas Hellström
> > > > <thomas.hellstrom@linux.intel.com> wrote...
> > > > > On Mon, 2026-02-02 at 21:25 +1100, Alistair Popple wrote:
> > > > > > On 2026-02-02 at 20:30 +1100, Thomas Hellström
> > > > > > <thomas.hellstrom@linux.intel.com> wrote...
> > > > > > > Hi,
> > > > > > > 
> > > > > > > On Mon, 2026-02-02 at 11:10 +1100, Alistair Popple wrote:
> > > > > > > > On 2026-02-02 at 08:07 +1100, Matthew Brost
> > > > > > > > <matthew.brost@intel.com>
> > > > > > > > wrote...
> > > > > > > > > On Sun, Feb 01, 2026 at 12:48:33PM -0800, John Hubbard
> > > > > > > > > wrote:
> > > > > > > > > > On 2/1/26 11:24 AM, Matthew Brost wrote:
> > > > > > > > > > > On Sat, Jan 31, 2026 at 01:42:20PM -0800, John
> > > > > > > > > > > Hubbard
> > > > > > > > > > > wrote:
> > > > > > > > > > > > On 1/31/26 11:00 AM, Matthew Brost wrote:
> > > > > > > > > > > > > On Sat, Jan 31, 2026 at 01:57:21PM +0100,
> > > > > > > > > > > > > Thomas
> > > > > > > > > > > > > Hellström
> > > > > > > > > > > > > wrote:
> > > > > > > > > > > > > > On Fri, 2026-01-30 at 19:01 -0800, John
> > > > > > > > > > > > > > Hubbard
> > > > > > > > > > > > > > wrote:
> > > > > > > > > > > > > > > On 1/30/26 10:00 AM, Andrew Morton wrote:
> > > > > > > > > > > > > > > > On Fri, 30 Jan 2026 15:45:29 +0100 Thomas
> > > > > > > > > > > > > > > > Hellström
> > > > > > > > > > > > > > > > wrote:
> > > > > > > > > > > > > > > ...
> > > > > > > > > > > > > I’m not convinced the folio refcount has any
> > > > > > > > > > > > > bearing if
> > > > > > > > > > > > > we
> > > > > > > > > > > > > can take a
> > > > > > > > > > > > > sleeping lock in do_swap_page, but perhaps I’m
> > > > > > > > > > > > > missing
> > > > > > > > > > > > > something.
> > > > > > > > 
> > > > > > > > I think the point of the trylock vs. lock is that if you
> > > > > > > > can't
> > > > > > > > immediately
> > > > > > > > lock the page then it's an indication the page is
> > > > > > > > undergoing
> > > > > > > > a
> > > > > > > > migration.
> > > > > > > > In other words there's no point waiting for the lock and
> > > > > > > > then
> > > > > > > > trying
> > > > > > > > to call
> > > > > > > > migrate_to_ram() as the page will have already moved by
> > > > > > > > the
> > > > > > > > time
> > > > > > > > you
> > > > > > > > acquire
> > > > > > > > the lock. Of course that just means you spin faulting
> > > > > > > > until
> > > > > > > > the
> > > > > > > > page
> > > > > > > > finally
> > > > > > > > migrates.
> > > > > > > > 
> > > > > > > > If I'm understanding the problem it sounds like we just
> > > > > > > > want
> > > > > > > > to
> > > > > > > > sleep
> > > > > > > > until the
> > > > > > > > migration is complete, ie. same as the migration entry
> > > > > > > > path.
> > > > > > > > We
> > > > > > > > don't
> > > > > > > > have a
> > > > > > > > device_private_entry_wait() function, but I don't think
> > > > > > > > we
> > > > > > > > need
> > > > > > > > one,
> > > > > > > > see below.
> > > > > > > > 
> > > > > > > > > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > > > > > > > > index da360a6eb8a4..1e7ccc4a1a6c 100644
> > > > > > > > > > > --- a/mm/memory.c
> > > > > > > > > > > +++ b/mm/memory.c
> > > > > > > > > > > @@ -4652,6 +4652,8 @@ vm_fault_t
> > > > > > > > > > > do_swap_page(struct
> > > > > > > > > > > vm_fault
> > > > > > > > > > > *vmf)
> > > > > > > > > > >                          vmf->page =
> > > > > > > > > > > softleaf_to_page(entry);
> > > > > > > > > > >                          ret =
> > > > > > > > > > > remove_device_exclusive_entry(vmf);
> > > > > > > > > > >                  } else if
> > > > > > > > > > > (softleaf_is_device_private(entry))
> > > > > > > > > > > {
> > > > > > > > > > > +                       struct dev_pagemap *pgmap;
> > > > > > > > > > > +
> > > > > > > > > > >                          if (vmf->flags &
> > > > > > > > > > > FAULT_FLAG_VMA_LOCK)
> > > > > > > > > > > {
> > > > > > > > > > >                                  /*
> > > > > > > > > > >                                   * migrate_to_ram
> > > > > > > > > > > is
> > > > > > > > > > > not
> > > > > > > > > > > yet
> > > > > > > > > > > ready to operate
> > > > > > > > > > > @@ -4670,21 +4672,15 @@ vm_fault_t
> > > > > > > > > > > do_swap_page(struct
> > > > > > > > > > > vm_fault
> > > > > > > > > > > *vmf)
> > > > > > > > > > >                                                    
> > > > > > > > > > >     
> > > > > > > > > > >  
> > > > > > > > > > > vmf-
> > > > > > > > > > > > orig_pte)))
> > > > > > > > > > >                                  goto unlock;
> > > > > > > > > > > 
> > > > > > > > > > > -                       /*
> > > > > > > > > > > -                        * Get a page reference
> > > > > > > > > > > while
> > > > > > > > > > > we
> > > > > > > > > > > know
> > > > > > > > > > > the page can't be
> > > > > > > > > > > -                        * freed.
> > > > > > > > > > > -                        */
> > > > > > > > > > > -                       if (trylock_page(vmf-
> > > > > > > > > > > >page)) {
> > > > > > > > > > > -                               struct dev_pagemap
> > > > > > > > > > > *pgmap;
> > > > > > > > > > > -
> > > > > > > > > > > -                               get_page(vmf-
> > > > > > > > > > > >page);
> > > > > > > > 
> > > > > > > > At this point we:
> > > > > > > > 1. Know the page needs to migrate
> > > > > > > > 2. Have the page locked
> > > > > > > > 3. Have a reference on the page
> > > > > > > > 4. Have the PTL locked
> > > > > > > > 
> > > > > > > > Or in other words we have everything we need to install a
> > > > > > > > migration
> > > > > > > > entry,
> > > > > > > > so why not just do that? This thread would then proceed
> > > > > > > > into
> > > > > > > > migrate_to_ram()
> > > > > > > > having already done migrate_vma_collect_pmd() for the
> > > > > > > > faulting
> > > > > > > > page
> > > > > > > > and any
> > > > > > > > other threads would just sleep in the wait on migration
> > > > > > > > entry
> > > > > > > > path
> > > > > > > > until the
> > > > > > > > migration is complete, avoiding the livelock problem the
> > > > > > > > trylock
> > > > > > > > was
> > > > > > > > introduced
> > > > > > > > for in 1afaeb8293c9a.
> > > > > > > > 
> > > > > > > >  - Alistair
> > > > > > > > 
> > > > > > > > > > 
> > > > > > > 
> > > > > > > There will always be a small time between when the page is
> > > > > > > locked
> > > > > > > and
> > > > > > > when we can install a migration entry. If the page only has
> > > > > > > a
> > > > > > > single
> > > > > > > mapcount, then the PTL lock is held during this time so the
> > > > > > > issue
> > > > > > > does
> > > > > > > not occur. But for multiple map-counts we need to release
> > > > > > > the
> > > > > > > PTL
> > > > > > > lock
> > > > > > > in migration to run try_to_migrate(), and before that, the
> > > > > > > migrate
> > > > > > > code
> > > > > > > is running lru_add_drain_all() and gets stuck.
> > > > > > 
> > > > > > Oh right, my solution would be fine for the single mapping
> > > > > > case
> > > > > > but I
> > > > > > hadn't
> > > > > > fully thought through the implications of other threads
> > > > > > accessing
> > > > > > this for
> > > > > > multiple map-counts. Agree it doesn't solve anything there
> > > > > > (the
> > > > > > rest
> > > > > > of the
> > > > > > threads would still spin on the trylock).
> > > > > > 
> > > > > > Still we could use a similar solution for waiting on device-
> > > > > > private
> > > > > > entries as
> > > > > > we do for migration entries. Instead of spinning on the
> > > > > > trylock
> > > > > > (ie.
> > > > > > PG_locked)
> > > > > > we could just wait on it to become unlocked if it's already
> > > > > > locked.
> > > > > > Would
> > > > > > something like the below completely untested code work?
> > > > > > (obviously
> > > > > > this is a bit
> > > > > > of hack, to do it properly you'd want to do more than just
> > > > > > remove
> > > > > > the
> > > > > > check from
> > > > > > migration_entry_wait)
> > > > > 
> > > > > Well I guess there could be failed migration where something is
> > > > > aborting the migration even after a page is locked. Also we
> > > > > must
> > > > > unlock
> > > > > the PTL lock before waiting otherwise we could deadlock.
> > > > 
> > > > Yes, this is exactly what the migration entry wait code does. And
> > > > if
> > > > there's a
> > > > failed migration, no problem, you just retry. That's not a
> > > > deadlock
> > > > unless the
> > > > migration never succeeds and then your stuffed anyway.
> > > > 
> > > > > I believe a robust solution would be to take a folio reference
> > > > > and
> > > > > do a
> > > > > sleeping lock like John's example. Then to assert that a folio
> > > > > pin-
> > > > > count, not ref-count is required to pin a device-private folio.
> > > > > That
> > > > > would eliminate the problem of the refcount held while locking
> > > > > blocking
> > > > > migration. It looks like that's fully consistent with 
> > > > 
> > > > Waiting on a migration entry like in my example below is exactly
> > > > the
> > > > same as
> > > > sleeping on the page lock other than it just waits for the page
> > > > to be
> > > > unlocked
> > > > rather than trying to lock it.
> > > > 
> > > > Internally migration_entry_wait_on_locked() is just an open-coded
> > > > version
> > > > of folio_lock() which deals with dropping the PTL and that works
> > > > without a page
> > > > refcount.
> > > > 
> > > > So I don't understand how this solution isn't robust? It requires
> > > > no
> > > > funniness
> > > > with refcounts and works practically the same as a sleeping lock.
> > > 
> > > You're right. I didn't look closely enough into what the
> > > migration_entry_wait_on_locked() did. Sorry about that.
> > 
> > No worries. I'm somewhat familiar with it from updating it
> > specifically so it
> > wouldn't take a page reference as we used to have similar live-
> > lock/starvation
> > issues in that path too.
> > 
> > > That would indeed fix the problem as well. Then the only argument
> > > remaining for the get-a-reference-and-lock solution would be it's
> > > not
> > > starvation prone in the same way. But that's definitely a problem I
> > > think we could live with for now.
> > 
> > I don't follow how this solution would be any more starvation prone
> > than getting
> > a reference and locking - here the winning fault takes the lock and
> > any other
> > faulting threads would just wait until it was released before
> > returning from
> > the fault handler assuming it had been handled. But it's been a while
> > since I've
> > thought about all the scenarios here so maybe I missed one.
> 
> My thinking is that it would be if theoretical racing lock-holders
> don't migrate to system, we can't *guarantee* migration will ever
> happen. Although admittedly this is very unlikely to happen. If we
> instead locked the page we'd on the other hand need to walk the page
> table again to check whether the pte content was still valid....

Oh I see what you mean. Something else could be continually grabbing the page
lock but not migrating meaning this thread would never get a chance to. I
doubt/agree that's not a concern in practice - AFAIK nothing other than a driver
or do_swap_page() should be taking the page lock and only for migration so
assuming the driver behaves the page will migrate (or result in a fatal error
due to eg. OOM).

That said if we did discover something else locking the page for reasons other
than migration and causing issues here we could wait on a page flag other than
PG_locked that was specific for migration. But hopefully that's not necessary.

> > 
> > > I'll give this code a test. BTW that removal of unlock_page() isn't
> > > intentional, right? 
> > 
> > Thanks. And you're right, that was unintentional. Serves me for
> > responding too
> > late at night :-)
> 
> So I ended up with this:

Thanks. That looks much more sane than what I posted.

> diff --git a/mm/memory.c b/mm/memory.c
> index da360a6eb8a4..84b6019eac6d 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4684,7 +4684,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>  				unlock_page(vmf->page);
>  				put_page(vmf->page);
>  			} else {
> -				pte_unmap_unlock(vmf->pte, vmf->ptl);
> +				pte_unmap(vmf->pte);
> +			  	migration_entry_wait_on_locked(entry,
> vmf->ptl);
>  			}
>  		} else if (softleaf_is_hwpoison(entry)) {
>  			ret = VM_FAULT_HWPOISON;
> -- 
> 2.52.0
> 
> 
> Seems to be a working fix.

Great. Seems like a good fix to me.

 - Alistair

> /Thomas
> 
> 
> > 
> >  - Alistair
> > 
> > > Thanks,
> > > Thomas
> > > 
> > > 
> > > > 
> > > >  - Alistair
> > > > 
> > > > > https://docs.kernel.org/core-api/pin_user_pages.html
> > > > > 
> > > > > Then as general improvements we should fully unmap pages before
> > > > > calling
> > > > > lru_add_drain_all() as MBrost suggest and finally, to be more
> > > > > nice
> > > > > to
> > > > > the system in the common cases, add a cond_resched() to
> > > > > hmm_range_fault().
> > > > > 
> > > > > Thanks,
> > > > > Thomas
> > > > > 
> > > > > 
> > > > > 
> > > > > > 
> > > > > > ---
> > > > > > 
> > > > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > > > index 2a55edc48a65..3e5e205ee279 100644
> > > > > > --- a/mm/memory.c
> > > > > > +++ b/mm/memory.c
> > > > > > @@ -4678,10 +4678,10 @@ vm_fault_t do_swap_page(struct
> > > > > > vm_fault
> > > > > > *vmf)
> > > > > >  				pte_unmap_unlock(vmf->pte,
> > > > > > vmf-
> > > > > > > ptl);
> > > > > >  				pgmap = page_pgmap(vmf-
> > > > > > >page);
> > > > > >  				ret = pgmap->ops-
> > > > > > > migrate_to_ram(vmf);
> > > > > > -				unlock_page(vmf->page);
> > > > > >  				put_page(vmf->page);
> > > > > >  			} else {
> > > > > > -				pte_unmap_unlock(vmf->pte,
> > > > > > vmf-
> > > > > > > ptl);
> > > > > > +				migration_entry_wait(vma-
> > > > > > >vm_mm,
> > > > > > vmf->pmd,
> > > > > > +						     vmf-
> > > > > > > address);
> > > > > >  			}
> > > > > >  		} else if (softleaf_is_hwpoison(entry)) {
> > > > > >  			ret = VM_FAULT_HWPOISON;
> > > > > > diff --git a/mm/migrate.c b/mm/migrate.c
> > > > > > index 5169f9717f60..b676daf0f4e8 100644
> > > > > > --- a/mm/migrate.c
> > > > > > +++ b/mm/migrate.c
> > > > > > @@ -496,8 +496,6 @@ void migration_entry_wait(struct
> > > > > > mm_struct
> > > > > > *mm,
> > > > > > pmd_t *pmd,
> > > > > >  		goto out;
> > > > > >  
> > > > > >  	entry = softleaf_from_pte(pte);
> > > > > > -	if (!softleaf_is_migration(entry))
> > > > > > -		goto out;
> > > > > >  
> > > > > >  	migration_entry_wait_on_locked(entry, ptl);
> > > > > >  	return;
