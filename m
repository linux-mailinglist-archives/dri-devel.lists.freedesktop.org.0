Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 233519239EE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 11:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BED10E126;
	Tue,  2 Jul 2024 09:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Hu4ipzNx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2065.outbound.protection.outlook.com [40.107.95.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3F210E17C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 09:27:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irzPpo5L9BBH+Iw27b6xjvJff4xiLkNhKEXANL3/WOyQ0A8yd/7GSjv4tmVJ8DYXIvdzwDyqIz/FSjOqn6M1YiUxCJZlF8ZOvaClNf7odfIyWgv2stMvMKvn6AIAbA5X+lesTfZlOCeglNygvxWnxkQvM9Tj/gjIhPj9u0J4jPovSOI4e++Rwmjl2iIkVJWAOFZp2VGRGuMg/ATjjmvzoe/eKdfPTTXkkFhRrNxvr6tYGk2H+GssEDDk16NeLSisbBuz5HgYKqG7VgeBQF7FZfREfOM2BGC0hJ6fIur9aB2qCmdkHnuPmShSZjeiBbjh2D8Dqe5RId//v5ldbXPe5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAURt0djzp5lHpKEZHehhPZU08BNvsBMGyVCo1WnTIg=;
 b=k964H70gKegAv1iVksFPkWNLIe4/HOVEseb7UaVIuYAfd7KR+QM/VBfqOdgjNzBHMZwgEPNUqdset056WpFlm7LUhMe3eN18NTO95fFOPRYt6XL/1uponQ4FJKUN09JVFu1jqRNCAVxRhBuRNJUxRobYTgrT2Jv3Ifxg7YCAdFC3entHpwyYRGoTfE+mTa8RxPM3/P8oynYqNJGgqDaqbWIuz5qNwJ+cvlx/kFA4ANp5OjS21DqUci5biybFgejGSfrkYmcQQQfYcmcCbHALw6cj5HwrjqPQMrul6zf6wtvl2RF0vIzbg9FhcFCACABbkKuU8bi+igvLhB1Mg/VIwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAURt0djzp5lHpKEZHehhPZU08BNvsBMGyVCo1WnTIg=;
 b=Hu4ipzNxNUdON0kYOn4oHuYO/lgd9io2prxVwXYM16AHk0BM/P2foAH63cf/tgNvmonZCds4hsAraJgUCJ8K0/xvEIjsy1grnl40kJCYncb5EyR56hCJKMqJftDtGrFWj+zN6G7cKj0lmrmwPA9v/r8U2hYJWSJsoOBMZpdVePw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8926.namprd12.prod.outlook.com (2603:10b6:a03:53b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Tue, 2 Jul
 2024 09:27:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 09:27:44 +0000
Content-Type: multipart/alternative;
 boundary="------------Z2nyvs8YfQ29SnKXn8AWcn3H"
Message-ID: <ae7085fd-3bca-4a4a-b465-5e4941011877@amd.com>
Date: Tue, 2 Jul 2024 11:27:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] drm/ttm: downgrade cached to write_combined when
 snooping not available
To: Icenowy Zheng <uwu@icenowy.me>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240629052247.2653363-1-uwu@icenowy.me>
 <20240629052247.2653363-3-uwu@icenowy.me>
 <a143a2c3-c6f0-4537-acc6-94f229f14639@app.fastmail.com>
 <2760BA02-8FF8-4B29-BFE2-1322B5BFB6EC@icenowy.me>
 <7e30177b-ff13-4fed-aa51-47a9cbd5d572@amd.com>
 <6303afecce2dff9e7d30f67e0a74205256e0a524.camel@icenowy.me>
 <ff1bf596-83cb-4b3e-a33a-621ac2c8171c@amd.com>
 <b9189c97f7efbaa895198113ee5b47012bd8b4dc.camel@icenowy.me>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b9189c97f7efbaa895198113ee5b47012bd8b4dc.camel@icenowy.me>
X-ClientProxiedBy: FR3P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8926:EE_
X-MS-Office365-Filtering-Correlation-Id: df55e8a6-88b1-4c98-ae1b-08dc9a793a8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXFQdmhEbC82WmhqUldJbTFsZ3NPUkNhVFhRVUoxb2NCRVExaitCczU3TFdI?=
 =?utf-8?B?a0cyTlVoQThpOGFnR2krbk5iOFBTYVYvMGtCOXBHVnp2R0RJZ3N3VnNDMWE1?=
 =?utf-8?B?Yko4OGQwMGovOUZkZmlTd2syUURXUnQ2RUNxR1oyT1ZCRFFjN29yZTZLaXdM?=
 =?utf-8?B?cDNSVlRLMkQ0SlZ4UllVTk5Ja1hEOEhESnBwZnpEbHBDYnN2dmlra2NDMTJh?=
 =?utf-8?B?RVUxUG5zeWlHdDNaMVRvOHVsQ2FBOU5GNTgvWTI1Q2RpRC92dlRKZHUxQk1E?=
 =?utf-8?B?VnVsOXVidE5NWWtnN0RWRndTNEVPRjJwcmpCVm4rcEJvVTRhaGlXbW9DYjBS?=
 =?utf-8?B?WlJiUzNlMjd3K3ludHJuS1VqQUlZSXRvVkozOHZGbkpkdG1vcWMyVEVoV3E0?=
 =?utf-8?B?NTUwa0tiY0dJbzYxeWVrYTVoUDQ0aVQ2MkZEYzJRTUdNOEVHbytPVWZUcEtZ?=
 =?utf-8?B?WEZ5MzlUMlJQc21MWE40d0RUZzVvMHh4THlkZjhtTWZvN0xSb1JVQitkeDQ0?=
 =?utf-8?B?Q3VWTkwwOVVNWXltT2w4VkNlYXVMR3NLd21zUkZTMWFPM1BpODRMaFl2eGF1?=
 =?utf-8?B?ZjBsQjVIK0hOM2Fha0FtZjgxZGtvSGZQRXhYUlp5QnhBaUlaYllCZzFqNTFI?=
 =?utf-8?B?SktBNmpndUFXSWlXL3AxVXhUOFJ2N21iMHhuYUdSTnBCZ3BjZk5JdnVYRUlr?=
 =?utf-8?B?QmJNdXFpSFR1SHJOVFVmV01ITTRzYzlJTzI1VUppK29MeE9BazNVOEpsaXJF?=
 =?utf-8?B?U056L2tuTXBIbGFCdXQ2L1A2dldwNjh1TXY5NUtjSUhGOEhNaWlYWkRXTnAz?=
 =?utf-8?B?WG4rRDF3QnF5UEkwUm9wMytSK1QxbUYxVjdyeXB6WHBHUGZOanlrNnhVaXBz?=
 =?utf-8?B?VEptQTFyS0UyUEJGUkd5bUd2dkVKM0h5c0tZQWo2RHRpLzB1OXlYVkFrOGc2?=
 =?utf-8?B?ZEt5SXE3ajVTcG5VczkrV1c0WW93MmhZejJjY3BZMDRLaCtKMEJkWFd3VUto?=
 =?utf-8?B?UUNKMkxNenhpWVZ5SDltQlg0ZG9sMDBMdDQ0dFhZRU1Hc1F0QjZHcXl5NWlC?=
 =?utf-8?B?WDhURVUwWi9OS3M3dm0rL256ZG9rTXE3N1BlVGN2WW10ZzlWWENCNzVtVlRT?=
 =?utf-8?B?RVNiaWhDbGhYNTFjd0Ryc29GQW5VejhDR1E1RUNHWFhhSXNQLzg5ajdYSFRV?=
 =?utf-8?B?NWN0OG1Pam0rSTdhODZ4MjdlUm5FWENQWXhFVUhyWWk1dTZtTEJWOVVJWXVy?=
 =?utf-8?B?R01ybnFQdmE1TEtlSWRZRXB2RHRCYWpoTFBZNzdEMEVLczBHV3FZbTNXQXBC?=
 =?utf-8?B?VWgwekg5bHI0VExGb2FqZHJLMFZqcCtTNlNQMGdaNEVMU1JtcE4rS0ZCK0dM?=
 =?utf-8?B?VFQ2VTBuM2w2cUFnOTNYZDRQOTF1NnhwL1FRemZDemxaVnl1UXhnaEUwU3Jn?=
 =?utf-8?B?bi84d1M0c2ZLKzhnV0RQTHpPOWFKZ3pmd0VqTlpqZ3JmL3poU1U2cHgxQUxB?=
 =?utf-8?B?TjJJQnRHNkxJNnAyRVhMOFp0NzdzbmlyS1g0TDIwamJwMHpBMStpbDcxYlBT?=
 =?utf-8?B?YVRwTWhpeDBISVA3bDU3NVJsZGJob1BsYUtSakZsMkpOd25hdGQ2WHpaUWZY?=
 =?utf-8?B?ZDdnOTJlYVY0WThtdHhYZGo5WEZUbDRzNFVMNkxzdTh5aDhBWG12S0VPQmhC?=
 =?utf-8?B?MVhZc3RsZmtTM25WLzY3NnNRK3Q5bytaMlhXREZjelA5Z3FyWjNYNVhxYlEv?=
 =?utf-8?B?amV3WkwzOFVxMTRPbVpCT2pFYy9WWXJaQW13ajZDU1BpOWVvTGxhbzZtTW1k?=
 =?utf-8?B?UFBRSTI2VU5vekx6MlczUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDBERnR6aGpjRG5hSjhQbGR2aXh2YzZPQ0xybUlraktzZjIwSlBSelNxZ3dX?=
 =?utf-8?B?SWZRVVU4d2pSemszdlYrcHdQaXVIaGwvOWVleGh2NXNlZWt3NGwxRjU5V3Fk?=
 =?utf-8?B?SlNtRFpOQjdUVytmU1Q2VzV2eDIrc213dmo0d0gwclVxRUVxNUF4Q0hrSHdC?=
 =?utf-8?B?enltSmdFZFQzRHFqZWRKVDVZRHR3TXJxMHdYa0lQeXRSUnpZa0dKOUUzemFQ?=
 =?utf-8?B?ZVFRTE1sY0R0RS9ua1lhUVJtUWIweUhxcDJKRnQycE1HMnVEMklTejhnWUMz?=
 =?utf-8?B?ZktOUWNwZkphK1UwaGx3UmY4a2JvcUlwK1NqQ0FQK1VhY1VJQy9GQkFCSnc1?=
 =?utf-8?B?dU5VRGcyZ29ZSWJzUVduQ3RQRVRSMVhUNVc4MGNKN2hJeFFDRGphUU9CT2xT?=
 =?utf-8?B?bzVFWVUxbEUwMHV1MURIM1FKS1g4YjVUSUZHWEIvR3lEOGExUEs1YW8vU3dw?=
 =?utf-8?B?VGFPeXVxczhtMHBrOXMyMEZBc0ZVNGU4SEZsUytFSlB4TUNLZzlwdzFZRHV4?=
 =?utf-8?B?NmlMakNOUDNUc2VkTHdjakVHblF0eE9UTGR2MkFoWTMxZWkxRnRFRTVjQ25v?=
 =?utf-8?B?cE9Fb0prRnpnK1FSSjJoeEcvWnlKK1NIVFpMT2JrWlcrbXV0RkNoUzZNYm5W?=
 =?utf-8?B?c3FUNU1kZXI2bVp2Z1hZdjFhY3BNV2NqNHZFR1V4ZnR3TWdGcUpYL2JyUWFH?=
 =?utf-8?B?TEMyemlqeXpVMEttb0M4dEdhRFpSSzlRaTl2QmhvSCtuVFdBbStPZHB2OFhz?=
 =?utf-8?B?ZVczOHpuYVUrR251MGRCUXkyQ3ladWZEWGg4ODJkL1ZOcUdjRVcweStqTTJE?=
 =?utf-8?B?bTBoalVqbXlvczRSN3h3UzdFQ1hoRi9zT0g3WWFJeGpWUFNBWnhvOTJQc0VI?=
 =?utf-8?B?cGt6aDFqNGp4ajk0ODEvMXBaWW5oaC8wanJMUFg3Qy9Fd2ZidUwvU3h2WER6?=
 =?utf-8?B?S2RzTktvU2Z6U1pZVHFCQ3lHbXNKSEJsNGtjY3NaZGJRTUJWT2tsN2FjVk55?=
 =?utf-8?B?UXJGbXZDSDEyQS9DWjBKcjB1Sm5ReUc5ZTJHQnB2ZTZLNkdXMUxTclB2cUsz?=
 =?utf-8?B?QnNQRzBWNmd2SFEvT0x4Tlo2ZXMwOER1L0lLcHdUWWIvNW9wUlZmQU5Nc0Fo?=
 =?utf-8?B?Z1dDUHNrd3dJTUFGZUZlM09MRE1iNnhzbHdmZFhHdTRwUHFwNmhOM25Xb3g4?=
 =?utf-8?B?bGl6ek1pblI4dVJtbzMyQ3FDUnlTTWZLb2xDK080TmdHZW9uQ1hYQitZMnBv?=
 =?utf-8?B?emxBT2Z5bGV0Q2RZdWJKVHhVeVl0OVUrUHFCbnhIUjE4R2x0QVBXUXBtS21p?=
 =?utf-8?B?RnZGb3hWREo0ekZiTXE0Sm9rcnpKSlV5Y0hGclhKbVhhV1F6SE04dktwT0F3?=
 =?utf-8?B?UDIvVDBValhKaXZWd0hUNFZ4c2VwOWZXU1lUUGFtRWZsS2xkOUEyOVF5Zlgy?=
 =?utf-8?B?U3I2OVhFQWV4bFlNbStOMXpWUEJWOE5GN05nY25KWTlaOVN1eWdhVkIvM1Ny?=
 =?utf-8?B?Um1lNmtoTFZ6QUp4UGVZTVZOL210d3V2L2FBS1duZlE0VC9yY2xWOTZVQzJN?=
 =?utf-8?B?ejVKQzJDZml2T0FZbTVON2lkcWR0VGRwMUVUaXh4allkME83NW8yU25zYTN3?=
 =?utf-8?B?MktYL01raktrQnduQnQ1VEc2RVEza080VS9TWks5NTRaZ1BlbFd0MnJlQWdm?=
 =?utf-8?B?UzVEaitGcEhFWlBCbjVMaUw4Z1R1SDdtN1pKUDRjTGZhbWNyTVR2RHQvaEJL?=
 =?utf-8?B?c0lkaUtEOTlXMS8vV2Ryb28zWERPb3JPT3VEc0h1NUJzOVh3NG84dDdSN1hM?=
 =?utf-8?B?b1R0WEdURGY0Z3kxVkhxNzB5VElQOWl6OW53TUJhaWlBT0c4V3hNUkRHaTNo?=
 =?utf-8?B?Rk94OHJGbzN3N0dhS2xPb05nNzdkcDVFRGtQU2toWjJ1V1dSNFZvcGlhT2hx?=
 =?utf-8?B?N1Uyb3RhUWpSYWhKdXVEVm1vV3RrWk13Z0RkQWtST2x5STJYcHRFV3FTVVpu?=
 =?utf-8?B?M1JmNTVWdFpzTXZwNVZDeS9IbDdramo0blplVTFyN2xOdHcrVmZSM1BhMW5s?=
 =?utf-8?B?RmxmMEdqY2czenJIL2g1bEtwRm1RTkhhRW5XVzVrSjdYUVhpKzNqRy95eDRz?=
 =?utf-8?Q?rrF8h8Xa7x8tNIoDUA9m9Sutr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df55e8a6-88b1-4c98-ae1b-08dc9a793a8b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 09:27:44.4854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9z/GMZCnLIESVBUL3zZqazM5Vjc4GvG9ZqvXrTNS2x5W+8PMqO++FBKRKeJT3Xg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8926
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

--------------Z2nyvs8YfQ29SnKXn8AWcn3H
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 02.07.24 um 11:06 schrieb Icenowy Zheng:
> [SNIP]
> However I don't think the definition of the AGP spec could apply on all
> PCI(e) implementations. The AGP spec itself don't apply on
> implementations that do not implement AGP (which is the most PCI(e)
> implementations today), and it's not in the reference list of the PCIe
> spec, so it does no help on this context.

No, exactly that is not correct.

See as I explained the No-Snoop extension to PCIe was created to help 
with AGP support and later merged into the base PCIe specification.

So the AGP spec is now part of the PCIe spec.
[SNIP]
>> We have quite a bunch of V4L, sound and I also think network devices
>> which work like that. But those are non-PCI devices.
> I think in the Linux kernel most drivers (of course including PCI ones)
> use DMA buffer in this way, which makes them natually compatible with
> non-coherent PCIe implementations. TTM is one of the few exceptions
> here.

Yes and that is absolutely intentional.

See we don't want to support any non-coherent PCIe implementation.

[SNIP]
>> And if I'm not completely mistaken the RISC-V specification was also
>> updated to disallow stuff like this.
>>
>> So yes you can have boards which implement non-snooped PCIe, but you
>> get
>> exactly zero support from hardware vendors to run software on it.
>>
> It's a quite usual case for free softwares to get no support from
> hardware vendors, and some of them are even developed by reverse
> engineering. I don't think it as a blocker for the Linux kernel to
> merge as many hardwares' support as possible.

We seem to have a misunderstanding here, this is not a software issue. 
The hardware platform is considered broken by the hardware vendor!

In other words people have stitched together hardware in a way which is 
not supported by the creator of that hardware.

So as long as you can't convince anybody from ARM or the RISC-V team or 
whoever created that hardware to confirm that the hardware actually 
works you won't get any support for that.

Regards,
Christian.
--------------Z2nyvs8YfQ29SnKXn8AWcn3H
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 02.07.24 um 11:06 schrieb Icenowy Zheng:<br>
    <blockquote type="cite" cite="mid:b9189c97f7efbaa895198113ee5b47012bd8b4dc.camel@icenowy.me">[SNIP]<span style="white-space: pre-wrap">
</span>
      <pre class="moz-quote-pre" wrap="">However I don't think the definition of the AGP spec could apply on all
PCI(e) implementations. The AGP spec itself don't apply on
implementations that do not implement AGP (which is the most PCI(e)
implementations today), and it's not in the reference list of the PCIe
spec, so it does no help on this context.</pre>
    </blockquote>
    <br>
    No, exactly that is not correct.<br>
    <br>
    See as I explained the No-Snoop extension to PCIe was created to
    help with AGP support and later merged into the base PCIe
    specification.<br>
    <br>
    So the AGP spec is now part of the PCIe spec.<br>
    <span style="white-space: pre-wrap">
[SNIP]</span>
    <blockquote type="cite" cite="mid:b9189c97f7efbaa895198113ee5b47012bd8b4dc.camel@icenowy.me">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">We have quite a bunch of V4L, sound and I also think network devices 
which work like that. But those are non-PCI devices.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think in the Linux kernel most drivers (of course including PCI ones)
use DMA buffer in this way, which makes them natually compatible with
non-coherent PCIe implementations. TTM is one of the few exceptions
here.</pre>
    </blockquote>
    <br>
    Yes and that is absolutely intentional.<br>
    <br>
    See we don't want to support any non-coherent PCIe implementation.<br>
    <br>
    [SNIP]<br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:b9189c97f7efbaa895198113ee5b47012bd8b4dc.camel@icenowy.me">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">And if I'm not completely mistaken the RISC-V specification was also 
updated to disallow stuff like this.

So yes you can have boards which implement non-snooped PCIe, but you
get 
exactly zero support from hardware vendors to run software on it.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It's a quite usual case for free softwares to get no support from
hardware vendors, and some of them are even developed by reverse
engineering. I don't think it as a blocker for the Linux kernel to
merge as many hardwares' support as possible.</pre>
    </blockquote>
    <br>
    We seem to have a misunderstanding here, this is not a software
    issue. The hardware platform is considered broken by the hardware
    vendor!<br>
    <br>
    In other words people have stitched together hardware in a way which
    is not supported by the creator of that hardware.<br>
    <br>
    So as long as you can't convince anybody from ARM or the RISC-V team
    or whoever created that hardware to confirm that the hardware
    actually works you won't get any support for that.<br>
    <br>
    Regards,<br>
    Christian.<br>
  </body>
</html>

--------------Z2nyvs8YfQ29SnKXn8AWcn3H--
