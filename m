Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D18933EB2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 16:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562E710E199;
	Wed, 17 Jul 2024 14:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ae7l/FjZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E249310E170;
 Wed, 17 Jul 2024 14:38:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7MYMKeD/DWJIPezPzZFek5tSizLKvxHPRujyq0vdsqA1EfVGyPgm+vDggY9XZKIzTI7Dqq2fmMT0qIGeQ8wZxSA7K1AMyHohXKKnZ6MGJD2al/vMcTef8gvt1rVRoKDJkQrhYsJvNOxKEOLhDqUFLStJ1fcV7JeUy+LC+syHk61ULooMB1AOBJiqRM7hnlJ13HH52Wt1cwNd9HNv77WjZZA6Ar7FgxB/c2C/RuNSKHlAWGuBS5CwuijRXFa/XaioaU/9MXs3O7He7Hm91waGOMd5MASl2OF8krpyJriDVyuoWu67AuHLUV6ZWfyiPps2HujEsneh3HuyambYAO+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PA0gb5/95RHKtzzpP7OwsSG06C6BPAlc+2ZwOwhLYXc=;
 b=G3p5PVF+ySxWzsxjIHFclMc14K+ur9qpKsIdw78fV9EUmOyM7uu2P3EvN6gcIt7y39XMWjC6mzyXUDSa3pC9ikyF5ozRbaicWZ4n5daQHjVOMMtNetcOKmu6fWLUjNVhwWx10T539d3/osEOLZjSJZu4KHlsvy5IQ70oHcTMuywu/q9jDcX8tq8xPFLCdZc2cI/S7bdEpPcamecYU+qdYk2LMy/cVCVZN6iKSbm+DMsmjhSAOJCgwNRvvvN3pU4+lnFQOzNz0UCMChK3pHL7Sa0VSa7gl/Psa6XnUHhmQ/nZmVsZjfyA/SDyLeP1M/wpC+tGsUVJzV1rXP75lX0GwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PA0gb5/95RHKtzzpP7OwsSG06C6BPAlc+2ZwOwhLYXc=;
 b=ae7l/FjZgLV8eQEHa84PVUpmMrioRWrAy26Z4dCB/k5KfDBrIljpc2G1unQjdhJlq4Vh1DrITKeTghsopL5iJhuGEioosL9EnJHJ1UqH4Og5vIlqXEvBs2HkHYItBmP0250TIVye+pzpoJdGq0Qil7A/jH83hliWYdcE84QxyoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by DS0PR12MB8072.namprd12.prod.outlook.com (2603:10b6:8:dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Wed, 17 Jul
 2024 14:38:42 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3%4]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 14:38:42 +0000
Content-Type: multipart/alternative;
 boundary="------------bHyZ3h9SF7b28WhbEAF1nmAr"
Message-ID: <0437c61a-9283-4827-98d0-e7a9a7baa898@amd.com>
Date: Wed, 17 Jul 2024 20:08:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/amdgpu: Add address alignment support to DCC
 buffers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, matthew.auld@intel.com,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 "Min, Frank" <frank.min@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <marek.olsak@amd.com>
References: <20240716152104.377039-1-Arunpravin.PaneerSelvam@amd.com>
 <20240716152104.377039-2-Arunpravin.PaneerSelvam@amd.com>
 <CAAxE2A6gpvLcq7zDhTDgV1BiBZdbK6t7147ESpq0ufYqW-6gzQ@mail.gmail.com>
 <2a2ea485-50e0-48cb-bb02-736a03368ab7@amd.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <2a2ea485-50e0-48cb-bb02-736a03368ab7@amd.com>
X-ClientProxiedBy: PN2P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::17) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|DS0PR12MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: b195b434-693a-4f5d-c38f-08dca66e2783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkNZRHpCNDNSbUJYZFVkQ1BMdlZaZDlzbHhBOUVkZ3pjT2RMOE1tckpLbTZL?=
 =?utf-8?B?UTlxL1JHVWxsaUN1Y1ZBOWx6M0FNQlYrQVlZd0F6SjZEZkhxcVNiU1NVOGRG?=
 =?utf-8?B?YmxJd0xneldsczVtVnhhMDhTN2NTWDZpR0ZhZHF0SmtJUHBySS90SVBVallZ?=
 =?utf-8?B?RU42blpNdTU0N0FXOEFpMnIwV0FCT2tQMEMzOTI1b3RzMmN4OWNza2RCanJH?=
 =?utf-8?B?ZVlNS1A4eW5UUWV1OVMxdHN4MHFxYVZZMDBIUGRQU3ZUUmhJd1VNQ0pUbldv?=
 =?utf-8?B?Z0VRNHAvc2psaStQeng2aUNUOGF0RDc5MnZndkpWcSthNTBjUFJHVTFMbVcw?=
 =?utf-8?B?dGlOd3BNY0ptZlAvMmd2cGNzMmdwblQzKzFhRnpQczZKcFIxOGJmUWZuT09X?=
 =?utf-8?B?OGFPM1hYQ0IwV1p0WXNWbE1ad2JjQlZwRXlIZEpWUEZSV1ZnV3NCOXhxaEor?=
 =?utf-8?B?V1RBVUZMZXZ1VUF0Q3hqQktnODhlb3AyNHZpS3FVQXdhTlR1RDZ2ci94Wm5S?=
 =?utf-8?B?SWZIMDNTeUV6Y1hFZldoQWpKVHRPSWxjeHNwRmE4Q20vaHppRC9HSkhncTZi?=
 =?utf-8?B?MmJMSGdYMWpqRUh2Y1ZHNXllTkZzTytTUmUvdUYzL2VnWG03bnQzR1JhRWFQ?=
 =?utf-8?B?amJSYnY0bFM2U2k5Qml1UURDZlZPMUpha2ZSbURDdEVtckdLZXkyM0RBQ0ZD?=
 =?utf-8?B?Mlh6djF6ZHdwUitueEc0b1JGclhyZ2xCN2NOVHMzWGRsUlBpU3VPZW5LU1Nu?=
 =?utf-8?B?QkJHY0ZsclIzVnp4MG5kUU0ybzdIa2ZPU3FhSG00U1VNeHpiMnc2UzZkbTJX?=
 =?utf-8?B?eHF3YlA3dEFRYUVsblZCN2VmbnpVWFFxdDZUbUpldExueWFmLzcxamNVVVJN?=
 =?utf-8?B?SVdTZFBNRk15WFl5U1NRWmV0TitTWm1tcXhlWkdlVVlmUWJqUWtRUEl6SUxm?=
 =?utf-8?B?ZVpqVnB3OXVEZUkzL2hQUHZET0s5MnRrTkNPRjF3b05LeVBMNTBEM0NMWUVX?=
 =?utf-8?B?dTZFWTlCR2hCTWh2REJjMW5aQU4vTjN0SU1NQmFVY3huRXh1YjNvdnVCck4x?=
 =?utf-8?B?ekd1VlliWmdQUFJUc3VPM0ZIYTJRQitrR2pkcDlheGZiQVJiTDlsNTUrc0FD?=
 =?utf-8?B?UUd0RlIvazZ4ck8xS2c4UWVKNDlMdmYzcUlDanF2Tng5bytqeXRoUXZ2T3FH?=
 =?utf-8?B?bDhpZHhTcFA3dVFwTkJhYVk5bkp4c004YzFyWUZWekxVZUFLWjRZcU9Qdlc4?=
 =?utf-8?B?b1FGMUF0SzVIZ2J5amI2enVyQWphaGNaWjROcGtCR3F1NWtXZ3pmejBrUHoy?=
 =?utf-8?B?RzQyRnJVR2xJc2pyNTFsQkVKdVNOcDlZT20xSVFBUE1KeGtIb1hzTGorQ3VE?=
 =?utf-8?B?QWhxNGJNajBxR0ZBZ1FxK1EzUS9ma0tIcEY1c2RHTzlnNWFaUnVpWnRlTlJj?=
 =?utf-8?B?NkM5VTRXdHJmTXpxSUROVEVsSVFNdm5QeVBpOEtPSUx4QkV1S3BacmE0bnYw?=
 =?utf-8?B?dnBBbC9kYTVBSjVMQTl5WkU0S0lSeVFERDg2ODdlZXpQMkIxWTVrTEVxUW84?=
 =?utf-8?B?Z1RaNHJuZzdBTGdmSXpObGVXUEhGWmVHT2ZyR3MzS2FSRCtLY0hXOElPTEJB?=
 =?utf-8?B?Mk1kVXN4eUJMRmsxQTVkb1FKMjNSQ0Z0Q29BOEoyd3Z0L3U3bnFUNkZmQjdq?=
 =?utf-8?B?c2RJQXJ5OHVQclQwL2k5WFcxRTJmMXdTWW5DQjZubHFCcUxKWlRSZklxMG44?=
 =?utf-8?B?RWxQYUwzNG5mU0loRGRoZC9WMEw3T1lxSjZIaXM1ZlZaTmV2czRBRWMwcS9G?=
 =?utf-8?B?bDkvVHdNOTBsdndKSGRQQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VW13V253M1JRNnFEZS9FTGNrR0hNemN2Z0JQbGxJdGIrRWtBVVphcUFXeUFK?=
 =?utf-8?B?SXp2czNBNmZPOW85cXJxVThhenVQdEhLTi96cTUvWEhOTGY1dDd0THBlL1Rv?=
 =?utf-8?B?cVdSL2ZCV0Y2WFAwcWJwd1dQVGdhMTMrSXQyZU40dmQrNWVMN3p6SEVZcUty?=
 =?utf-8?B?M05CTHc2RHZNb2Vhc1VnSUhjTk1VWUVJdzlselR6aXloaWJkM2NyYXRucFpQ?=
 =?utf-8?B?amxjSXVXbXNPU3FRTkQ2ODVBMDFUaHFHYmxDRlJ5cHJJald3b1lGUy9mWjFx?=
 =?utf-8?B?MlNPWHFKQk1wb1EwOWY5b3RUMjVaK29KejZVWmNLVW1WUFNzcTQvVjk2MUxP?=
 =?utf-8?B?QTFGZVNURy95ditxeUZXejgzWW5MYk5vbm9MYVN1OUowWFF2R3h5R2dON0lL?=
 =?utf-8?B?RFVvdXI5eVF5bzhDcWgweG1ZczZseTlUYlBkdTFDSDdubzQ1V3pwT1NJV2Jq?=
 =?utf-8?B?VCtJL2oxdjBRWXFrYS9XY2owaDVnQ2hUeGkvNFMwcGFwRDRZTXVQbjhNMkZk?=
 =?utf-8?B?d3pBM2plTUpnSWVVRDQ2RVJuQUtlblJRRW1KS2pOYXpKdlZJbWZGekhLVVd6?=
 =?utf-8?B?MERaZVZUYjRpVjdsZlYrcjFWc01EWi9jYW02TTd6OUhpenMzNnpRSW9YQjh2?=
 =?utf-8?B?ZXBhUGcwSmJiT1BrMmhZbHJSYWYwbGpFcUZibDdUSHpTOExFUVZ4NXZ1WEhk?=
 =?utf-8?B?RUo2aFprY2U4WHZiTDZSRWYybCtqZ1RXVk5FeC84cGpEampVNTN1cE9zcEZW?=
 =?utf-8?B?Y294ZlR4RmtxMGMzRStEUkVPM0Q5L25EQ2lNT2cxVk9mQ0FIYk9XTGNCZTNJ?=
 =?utf-8?B?a3YzNkp1MUlraGpKS1V0aTJaWGhTNEUvUzB6bFZsMzExS3d3eHV3LzROZnJ3?=
 =?utf-8?B?Z3BRRkNuTFFMaWJRc3dlY1VnUEpQZnV6MjJFc0svOW5sSWYxVnd3b0VCWlhh?=
 =?utf-8?B?aFNOMzgwVHI1RmFEUmJTVXUzVHlEN3pLbVpsVWxQaDBDYVYydFhNbkNHa0Zn?=
 =?utf-8?B?byszQjN1VWl0STAxMWsyaHJXUkE4YnpmQTNXSVBkQU9NeDdvOGRxMkdlSm56?=
 =?utf-8?B?K1NETjFIOEw5dGRPWlRRbzlaZDErWjVmQUs1VG9sSzZobmVKeXNTQVBnNlZM?=
 =?utf-8?B?SjVFM2hRU0tRT2ttdytRbkRSMElDaCtPWG44QlQ3T3JIVkNWRVZ4UW1YT0o0?=
 =?utf-8?B?aCtHaUU2Wkp3c054YXhGMnd0NFRVM1gvRkE1WWE3Q2Fyb3kwUjJuMldQTjhF?=
 =?utf-8?B?dFJBTEswS1YwSVJXV1RLUXgxRzJEcG13b05pOEgvQmpwK3FjdUtHOVhoWURm?=
 =?utf-8?B?NTU4c2hvWTJldGpvRU9uanRWckl4bXlzUlJ4SmVxS0d5RXluUTB5UXVlR1Bj?=
 =?utf-8?B?MXcxdTYrUXlFTHBXUDN4dGRCT0NodStJaUVLRFZTU3RDUTk1eGlWcXdueC9x?=
 =?utf-8?B?d1dZeUY1K1Z0emdwVW1SRG5IblVaQlA3K0NZd0Ezek1yT2l0akUrS1BiUDdI?=
 =?utf-8?B?WExXY3VMQ3ByR2srdkJvdEtpV2JCalVJZHBzSS9KR1NvckZRMWZzNTUyWXpw?=
 =?utf-8?B?cm1hNllWckR6Tm9MSzEwOUN4RWh3WWkzMHIrL25OcDE0ME1aZjZGMDRPcXVE?=
 =?utf-8?B?WlF2bXBncTZkbEN0ZTZCY1N0UTduOUtKaFBVSnNhUFBJOWpBUWZiU0NDVDdU?=
 =?utf-8?B?T25GQVFkdkFCb2J4eUsvK1dUL1EwNXlkVGpXWGQ2eDhRMkRoQk5JVzd4WS91?=
 =?utf-8?B?UVpFdWlZUXVrNzFGUjRaWUtFZVhtZGlpTDY4QjNtanZ1dmxtYnJwMTB5bi9W?=
 =?utf-8?B?N3F3ZjQ2Yzc1Z2pDZHAzVHd4ZDQvYk5tTWRpWE9OQ2dhaFNjbWZnVVV1d3d5?=
 =?utf-8?B?RXpXMm5GNHk5RDV0ZUN0VTNMV1ZMUG5qOUh6N3BkWHhIdEw1cVFBeUI3MnR4?=
 =?utf-8?B?NjVGSTZLRjcrRXcwcDhQZGNDS0g4NFhpRTBtRXZiM0J5RnU5d1dYRTZEMCth?=
 =?utf-8?B?VEVhaEtQUW9taHdMeGltT1NteWVCNDVGRG43NVlHTEJXKzNzS2RwcndVdWp0?=
 =?utf-8?B?dEtJVEZrMHhadWFaSmZJcDhHdUJtalJaTk81YU91N0hNZ0d3cHpMY0ZsNTly?=
 =?utf-8?Q?/bWS8DG+LUGOKBIYeiE1knePG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b195b434-693a-4f5d-c38f-08dca66e2783
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 14:38:42.3198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDsXHpnVRN+nZjlfe7G5lVJC8uI8wFryBMXHC6lfDjW8PWm8rZ4P31y5+BifI6U/k9qr8uJmmyIBxsiIks6kLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8072
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

--------------bHyZ3h9SF7b28WhbEAF1nmAr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Christian,

Can we use the below combination flags to kick in hardware workaround 
while pinning BO's for this specific hw generation.

if (place->flags & TTM_PL_FLAG_CONTIGUOUS) &&
(amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 0) ||
amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 1))) {
}

Regards,
Arun.

On 7/17/2024 2:38 PM, Christian König wrote:
> Well that approach was discussed before and seemed to be to complicated.
>
> But I totally agree that the AMDGPU_GEM_CREATE_GFX12_DCC flag is a bad 
> idea. This isn't anything userspace should need to specify in the 
> first place.
>
> All we need is a hardware workaround which kicks in all the time while 
> pinning BOs for this specific hw generation and texture channel 
> configuration.
>
> Please remove the AMDGPU_GEM_CREATE_GFX12_DCC flag again if possible 
> or specify why it is actually necessary?
>
> Regards,
> Christian.
>
> Am 17.07.24 um 05:44 schrieb Marek Olšák:
>> AMDGPU_GEM_CREATE_GFX12_DCC is set on 90% of all memory allocations, 
>> and almost all of them are not displayable. Shouldn't we use a 
>> different way to indicate that we need a non-power-of-two alignment, 
>> such as looking at the alignment field directly?
>>
>> Marek
>>
>> On Tue, Jul 16, 2024, 11:45 Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com> wrote:
>>
>>     Add address alignment support to the DCC VRAM buffers.
>>
>>     v2:
>>       - adjust size based on the max_texture_channel_caches values
>>         only for GFX12 DCC buffers.
>>       - used AMDGPU_GEM_CREATE_GFX12_DCC flag to apply change only
>>         for DCC buffers.
>>       - roundup non power of two DCC buffer adjusted size to nearest
>>         power of two number as the buddy allocator does not support non
>>         power of two alignments. This applies only to the contiguous
>>         DCC buffers.
>>
>>     v3:(Alex)
>>       - rewrite the max texture channel caches comparison code in an
>>         algorithmic way to determine the alignment size.
>>
>>     v4:(Alex)
>>       - Move the logic from amdgpu_vram_mgr_dcc_alignment() to
>>     gmc_v12_0.c
>>         and add a new gmc func callback for dcc alignment. If the
>>     callback
>>         is non-NULL, call it to get the alignment, otherwise, use the
>>     default.
>>
>>     v5:(Alex)
>>       - Set the Alignment to a default value if the callback doesn't
>>     exist.
>>       - Add the callback to amdgpu_gmc_funcs.
>>
>>     v6:
>>       - Fix checkpatch error reported by Intel CI.
>>
>>     Signed-off-by: Arunpravin Paneer Selvam
>>     <Arunpravin.PaneerSelvam@amd.com>
>>     Acked-by: Alex Deucher <alexander.deucher@amd.com>
>>     Acked-by: Christian König <christian.koenig@amd.com>
>>     Reviewed-by: Frank Min <Frank.Min@amd.com>
>>     ---
>>      drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h      |  6 ++++
>>      drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 36
>>     ++++++++++++++++++--
>>      drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c       | 15 ++++++++
>>      3 files changed, 55 insertions(+), 2 deletions(-)
>>
>>     diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
>>     b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
>>     index febca3130497..654d0548a3f8 100644
>>     --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
>>     +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
>>     @@ -156,6 +156,8 @@ struct amdgpu_gmc_funcs {
>>                                           uint64_t addr, uint64_t
>>     *flags);
>>             /* get the amount of memory used by the vbios for pre-OS
>>     console */
>>             unsigned int (*get_vbios_fb_size)(struct amdgpu_device
>>     *adev);
>>     +       /* get the DCC buffer alignment */
>>     +       u64 (*get_dcc_alignment)(struct amdgpu_device *adev);
>>
>>             enum amdgpu_memory_partition (*query_mem_partition_mode)(
>>                     struct amdgpu_device *adev);
>>     @@ -363,6 +365,10 @@ struct amdgpu_gmc {
>>     (adev)->gmc.gmc_funcs->override_vm_pte_flags               \
>>                     ((adev), (vm), (addr), (pte_flags))
>>      #define amdgpu_gmc_get_vbios_fb_size(adev)
>>     (adev)->gmc.gmc_funcs->get_vbios_fb_size((adev))
>>     +#define amdgpu_gmc_get_dcc_alignment(_adev) ({        \
>>     +       typeof(_adev) (adev) = (_adev);        \
>>     +  ((adev)->gmc.gmc_funcs->get_dcc_alignment((adev)));    \
>>     +})
>>
>>      /**
>>       * amdgpu_gmc_vram_full_visible - Check if full VRAM is visible
>>     through the BAR
>>     diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>     b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>     index f91cc149d06c..aa9dca12371c 100644
>>     --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>     +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>     @@ -512,6 +512,16 @@ static int amdgpu_vram_mgr_new(struct
>>     ttm_resource_manager *man,
>>                     vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>>
>>             remaining_size = (u64)vres->base.size;
>>     +       if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
>>     +           bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC) {
>>     +               u64 adjust_size;
>>     +
>>     +               if (adev->gmc.gmc_funcs->get_dcc_alignment) {
>>     +                       adjust_size =
>>     amdgpu_gmc_get_dcc_alignment(adev);
>>     +                       remaining_size =
>>     roundup_pow_of_two(remaining_size + adjust_size);
>>     +                       vres->flags |= DRM_BUDDY_TRIM_DISABLE;
>>     +               }
>>     +       }
>>
>>             mutex_lock(&mgr->lock);
>>             while (remaining_size) {
>>     @@ -521,8 +531,12 @@ static int amdgpu_vram_mgr_new(struct
>>     ttm_resource_manager *man,
>>                             min_block_size = mgr->default_page_size;
>>
>>                     size = remaining_size;
>>     -               if ((size >= (u64)pages_per_block << PAGE_SHIFT) &&
>>     -                   !(size & (((u64)pages_per_block <<
>>     PAGE_SHIFT) - 1)))
>>     +
>>     +               if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
>>     +                   bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC)
>>     +                       min_block_size = size;
>>     +               else if ((size >= (u64)pages_per_block <<
>>     PAGE_SHIFT) &&
>>     +                        !(size & (((u64)pages_per_block <<
>>     PAGE_SHIFT) - 1)))
>>                             min_block_size = (u64)pages_per_block <<
>>     PAGE_SHIFT;
>>
>>                     BUG_ON(min_block_size < mm->chunk_size);
>>     @@ -553,6 +567,24 @@ static int amdgpu_vram_mgr_new(struct
>>     ttm_resource_manager *man,
>>             }
>>             mutex_unlock(&mgr->lock);
>>
>>     +       if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
>>     +           bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC) {
>>     +               struct drm_buddy_block *dcc_block;
>>     +               u64 dcc_start, alignment;
>>     +
>>     +               dcc_block =
>>     amdgpu_vram_mgr_first_block(&vres->blocks);
>>     +               dcc_start = amdgpu_vram_mgr_block_start(dcc_block);
>>     +
>>     +               if (adev->gmc.gmc_funcs->get_dcc_alignment) {
>>     +                       alignment =
>>     amdgpu_gmc_get_dcc_alignment(adev);
>>     +                       /* Adjust the start address for DCC
>>     buffers only */
>>     +                       dcc_start = roundup(dcc_start, alignment);
>>     +                       drm_buddy_block_trim(mm, &dcc_start,
>>     + (u64)vres->base.size,
>>     + &vres->blocks);
>>     +               }
>>     +       }
>>     +
>>             vres->base.start = 0;
>>             size = max_t(u64, amdgpu_vram_mgr_blocks_size(&vres->blocks),
>>                          vres->base.size);
>>     diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
>>     b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
>>     index fd3ac483760e..4259edcdec8a 100644
>>     --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
>>     +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
>>     @@ -542,6 +542,20 @@ static unsigned
>>     gmc_v12_0_get_vbios_fb_size(struct amdgpu_device *adev)
>>             return 0;
>>      }
>>
>>     +static u64 gmc_v12_0_get_dcc_alignment(struct amdgpu_device *adev)
>>     +{
>>     +       u64 max_tex_channel_caches, alignment;
>>     +
>>     +       max_tex_channel_caches =
>>     adev->gfx.config.max_texture_channel_caches;
>>     +       if (is_power_of_2(max_tex_channel_caches))
>>     +               alignment = (max_tex_channel_caches / SZ_4) *
>>     max_tex_channel_caches;
>>     +       else
>>     +               alignment =
>>     roundup_pow_of_two(max_tex_channel_caches) *
>>     +                               max_tex_channel_caches;
>>     +
>>     +       return (u64)alignment * SZ_1K;
>>     +}
>>     +
>>      static const struct amdgpu_gmc_funcs gmc_v12_0_gmc_funcs = {
>>             .flush_gpu_tlb = gmc_v12_0_flush_gpu_tlb,
>>             .flush_gpu_tlb_pasid = gmc_v12_0_flush_gpu_tlb_pasid,
>>     @@ -551,6 +565,7 @@ static const struct amdgpu_gmc_funcs
>>     gmc_v12_0_gmc_funcs = {
>>             .get_vm_pde = gmc_v12_0_get_vm_pde,
>>             .get_vm_pte = gmc_v12_0_get_vm_pte,
>>             .get_vbios_fb_size = gmc_v12_0_get_vbios_fb_size,
>>     +       .get_dcc_alignment = gmc_v12_0_get_dcc_alignment,
>>      };
>>
>>      static void gmc_v12_0_set_gmc_funcs(struct amdgpu_device *adev)
>>     -- 
>>     2.25.1
>>
>

--------------bHyZ3h9SF7b28WhbEAF1nmAr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Christian,<br>
    <br>
    Can we use the below combination flags to kick in hardware
    workaround while pinning BO's for this specific hw generation.<br>
    <br>
    if (place-&gt;flags &amp; TTM_PL_FLAG_CONTIGUOUS) &amp;&amp;<br>
    (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 0) ||<br>
    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 1))) {<br>
    }<br>
    <br>
    Regards,<br>
    Arun.<br>
    <br>
    <div class="moz-cite-prefix">On 7/17/2024 2:38 PM, Christian König
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:2a2ea485-50e0-48cb-bb02-736a03368ab7@amd.com">
      
      Well that approach was discussed before and seemed to be to
      complicated.<br>
      <br>
      But I totally agree that the AMDGPU_GEM_CREATE_GFX12_DCC flag is a
      bad idea. This isn't anything userspace should need to specify in
      the first place.<br>
      <br>
      All we need is a hardware workaround which kicks in all the time
      while pinning BOs for this specific hw generation and texture
      channel configuration.<br>
      <br>
      Please remove the AMDGPU_GEM_CREATE_GFX12_DCC flag again if
      possible or specify why it is actually necessary?<br>
      <br>
      Regards,<br>
      Christian.<br>
      <br>
      <div class="moz-cite-prefix">Am 17.07.24 um 05:44 schrieb Marek
        Olšák:<br>
      </div>
      <blockquote type="cite" cite="mid:CAAxE2A6gpvLcq7zDhTDgV1BiBZdbK6t7147ESpq0ufYqW-6gzQ@mail.gmail.com">
        <div dir="auto">
          <div>AMDGPU_GEM_CREATE_GFX12_DCC is set on 90% of all memory
            allocations, and almost all of them are not displayable.
            Shouldn't we use a different way to indicate that we need a
            non-power-of-two alignment, such as looking at the alignment
            field directly?&nbsp;</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Marek<br>
            <br>
            <div class="gmail_quote" dir="auto">
              <div dir="ltr" class="gmail_attr">On Tue, Jul 16, 2024,
                11:45 Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;
                wrote:<br>
              </div>
              <blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Add
                address alignment support to the DCC VRAM buffers.<br>
                <br>
                v2:<br>
                &nbsp; - adjust size based on the max_texture_channel_caches
                values<br>
                &nbsp; &nbsp; only for GFX12 DCC buffers.<br>
                &nbsp; - used AMDGPU_GEM_CREATE_GFX12_DCC flag to apply
                change only<br>
                &nbsp; &nbsp; for DCC buffers.<br>
                &nbsp; - roundup non power of two DCC buffer adjusted size to
                nearest<br>
                &nbsp; &nbsp; power of two number as the buddy allocator does not
                support non<br>
                &nbsp; &nbsp; power of two alignments. This applies only to the
                contiguous<br>
                &nbsp; &nbsp; DCC buffers.<br>
                <br>
                v3:(Alex)<br>
                &nbsp; - rewrite the max texture channel caches comparison
                code in an<br>
                &nbsp; &nbsp; algorithmic way to determine the alignment size.<br>
                <br>
                v4:(Alex)<br>
                &nbsp; - Move the logic from amdgpu_vram_mgr_dcc_alignment()
                to gmc_v12_0.c<br>
                &nbsp; &nbsp; and add a new gmc func callback for dcc alignment.
                If the callback<br>
                &nbsp; &nbsp; is non-NULL, call it to get the alignment,
                otherwise, use the default.<br>
                <br>
                v5:(Alex)<br>
                &nbsp; - Set the Alignment to a default value if the callback
                doesn't exist.<br>
                &nbsp; - Add the callback to amdgpu_gmc_funcs.<br>
                <br>
                v6:<br>
                &nbsp; - Fix checkpatch error reported by Intel CI.<br>
                <br>
                Signed-off-by: Arunpravin Paneer Selvam &lt;<a href="mailto:Arunpravin.PaneerSelvam@amd.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">Arunpravin.PaneerSelvam@amd.com</a>&gt;<br>
                Acked-by: Alex Deucher &lt;<a href="mailto:alexander.deucher@amd.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">alexander.deucher@amd.com</a>&gt;<br>
                Acked-by: Christian König &lt;<a href="mailto:christian.koenig@amd.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;<br>
                Reviewed-by: Frank Min &lt;<a href="mailto:Frank.Min@amd.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">Frank.Min@amd.com</a>&gt;<br>
                ---<br>
                &nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h&nbsp; &nbsp; &nbsp; |&nbsp; 6 ++++<br>
                &nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 36
                ++++++++++++++++++--<br>
                &nbsp;drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c&nbsp; &nbsp; &nbsp; &nbsp;| 15
                ++++++++<br>
                &nbsp;3 files changed, 55 insertions(+), 2 deletions(-)<br>
                <br>
                diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
                b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h<br>
                index febca3130497..654d0548a3f8 100644<br>
                --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h<br>
                +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h<br>
                @@ -156,6 +156,8 @@ struct amdgpu_gmc_funcs {<br>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; uint64_t addr,
                uint64_t *flags);<br>
                &nbsp; &nbsp; &nbsp; &nbsp; /* get the amount of memory used by the vbios
                for pre-OS console */<br>
                &nbsp; &nbsp; &nbsp; &nbsp; unsigned int (*get_vbios_fb_size)(struct
                amdgpu_device *adev);<br>
                +&nbsp; &nbsp; &nbsp; &nbsp;/* get the DCC buffer alignment */<br>
                +&nbsp; &nbsp; &nbsp; &nbsp;u64 (*get_dcc_alignment)(struct amdgpu_device
                *adev);<br>
                <br>
                &nbsp; &nbsp; &nbsp; &nbsp; enum amdgpu_memory_partition
                (*query_mem_partition_mode)(<br>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct amdgpu_device *adev);<br>
                @@ -363,6 +365,10 @@ struct amdgpu_gmc {<br>
                &nbsp; &nbsp; &nbsp; &nbsp;
                (adev)-&gt;gmc.gmc_funcs-&gt;override_vm_pte_flags&nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \<br>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ((adev), (vm), (addr), (pte_flags))<br>
                &nbsp;#define amdgpu_gmc_get_vbios_fb_size(adev)
                (adev)-&gt;gmc.gmc_funcs-&gt;get_vbios_fb_size((adev))<br>
                +#define amdgpu_gmc_get_dcc_alignment(_adev) ({&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp;\<br>
                +&nbsp; &nbsp; &nbsp; &nbsp;typeof(_adev) (adev) = (_adev);&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp;\<br>
                +&nbsp; &nbsp; &nbsp;
                &nbsp;((adev)-&gt;gmc.gmc_funcs-&gt;get_dcc_alignment((adev)));&nbsp;
                &nbsp; &nbsp;\<br>
                +})<br>
                <br>
                &nbsp;/**<br>
                &nbsp; * amdgpu_gmc_vram_full_visible - Check if full VRAM is
                visible through the BAR<br>
                diff --git
                a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
                b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c<br>
                index f91cc149d06c..aa9dca12371c 100644<br>
                --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c<br>
                +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c<br>
                @@ -512,6 +512,16 @@ static int
                amdgpu_vram_mgr_new(struct ttm_resource_manager *man,<br>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vres-&gt;flags |=
                DRM_BUDDY_RANGE_ALLOCATION;<br>
                <br>
                &nbsp; &nbsp; &nbsp; &nbsp; remaining_size = (u64)vres-&gt;base.size;<br>
                +&nbsp; &nbsp; &nbsp; &nbsp;if (bo-&gt;flags &amp;
                AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &amp;&amp;<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bo-&gt;flags &amp;
                AMDGPU_GEM_CREATE_GFX12_DCC) {<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u64 adjust_size;<br>
                +<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
                (adev-&gt;gmc.gmc_funcs-&gt;get_dcc_alignment) {<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;adjust_size =
                amdgpu_gmc_get_dcc_alignment(adev);<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;remaining_size =
                roundup_pow_of_two(remaining_size + adjust_size);<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vres-&gt;flags |=
                DRM_BUDDY_TRIM_DISABLE;<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
                +&nbsp; &nbsp; &nbsp; &nbsp;}<br>
                <br>
                &nbsp; &nbsp; &nbsp; &nbsp; mutex_lock(&amp;mgr-&gt;lock);<br>
                &nbsp; &nbsp; &nbsp; &nbsp; while (remaining_size) {<br>
                @@ -521,8 +531,12 @@ static int
                amdgpu_vram_mgr_new(struct ttm_resource_manager *man,<br>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; min_block_size =
                mgr-&gt;default_page_size;<br>
                <br>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size = remaining_size;<br>
                -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if ((size &gt;= (u64)pages_per_block
                &lt;&lt; PAGE_SHIFT) &amp;&amp;<br>
                -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;!(size &amp; (((u64)pages_per_block
                &lt;&lt; PAGE_SHIFT) - 1)))<br>
                +<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bo-&gt;flags &amp;
                AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &amp;&amp;<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bo-&gt;flags &amp;
                AMDGPU_GEM_CREATE_GFX12_DCC)<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;min_block_size = size;<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;else if ((size &gt;=
                (u64)pages_per_block &lt;&lt; PAGE_SHIFT) &amp;&amp;<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; !(size &amp;
                (((u64)pages_per_block &lt;&lt; PAGE_SHIFT) - 1)))<br>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; min_block_size =
                (u64)pages_per_block &lt;&lt; PAGE_SHIFT;<br>
                <br>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BUG_ON(min_block_size &lt;
                mm-&gt;chunk_size);<br>
                @@ -553,6 +567,24 @@ static int
                amdgpu_vram_mgr_new(struct ttm_resource_manager *man,<br>
                &nbsp; &nbsp; &nbsp; &nbsp; }<br>
                &nbsp; &nbsp; &nbsp; &nbsp; mutex_unlock(&amp;mgr-&gt;lock);<br>
                <br>
                +&nbsp; &nbsp; &nbsp; &nbsp;if (bo-&gt;flags &amp;
                AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &amp;&amp;<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bo-&gt;flags &amp;
                AMDGPU_GEM_CREATE_GFX12_DCC) {<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct drm_buddy_block *dcc_block;<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u64 dcc_start, alignment;<br>
                +<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dcc_block =
                amdgpu_vram_mgr_first_block(&amp;vres-&gt;blocks);<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dcc_start =
                amdgpu_vram_mgr_block_start(dcc_block);<br>
                +<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
                (adev-&gt;gmc.gmc_funcs-&gt;get_dcc_alignment) {<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;alignment =
                amdgpu_gmc_get_dcc_alignment(adev);<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Adjust the start address for
                DCC buffers only */<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dcc_start = roundup(dcc_start,
                alignment);<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;drm_buddy_block_trim(mm,
                &amp;dcc_start,<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                (u64)vres-&gt;base.size,<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &amp;vres-&gt;blocks);<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
                +&nbsp; &nbsp; &nbsp; &nbsp;}<br>
                +<br>
                &nbsp; &nbsp; &nbsp; &nbsp; vres-&gt;base.start = 0;<br>
                &nbsp; &nbsp; &nbsp; &nbsp; size = max_t(u64,
                amdgpu_vram_mgr_blocks_size(&amp;vres-&gt;blocks),<br>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vres-&gt;base.size);<br>
                diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
                b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c<br>
                index fd3ac483760e..4259edcdec8a 100644<br>
                --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c<br>
                +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c<br>
                @@ -542,6 +542,20 @@ static unsigned
                gmc_v12_0_get_vbios_fb_size(struct amdgpu_device *adev)<br>
                &nbsp; &nbsp; &nbsp; &nbsp; return 0;<br>
                &nbsp;}<br>
                <br>
                +static u64 gmc_v12_0_get_dcc_alignment(struct
                amdgpu_device *adev)<br>
                +{<br>
                +&nbsp; &nbsp; &nbsp; &nbsp;u64 max_tex_channel_caches, alignment;<br>
                +<br>
                +&nbsp; &nbsp; &nbsp; &nbsp;max_tex_channel_caches =
                adev-&gt;gfx.config.max_texture_channel_caches;<br>
                +&nbsp; &nbsp; &nbsp; &nbsp;if (is_power_of_2(max_tex_channel_caches))<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;alignment = (max_tex_channel_caches /
                SZ_4) * max_tex_channel_caches;<br>
                +&nbsp; &nbsp; &nbsp; &nbsp;else<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;alignment =
                roundup_pow_of_two(max_tex_channel_caches) *<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;max_tex_channel_caches;<br>
                +<br>
                +&nbsp; &nbsp; &nbsp; &nbsp;return (u64)alignment * SZ_1K;<br>
                +}<br>
                +<br>
                &nbsp;static const struct amdgpu_gmc_funcs
                gmc_v12_0_gmc_funcs = {<br>
                &nbsp; &nbsp; &nbsp; &nbsp; .flush_gpu_tlb = gmc_v12_0_flush_gpu_tlb,<br>
                &nbsp; &nbsp; &nbsp; &nbsp; .flush_gpu_tlb_pasid =
                gmc_v12_0_flush_gpu_tlb_pasid,<br>
                @@ -551,6 +565,7 @@ static const struct amdgpu_gmc_funcs
                gmc_v12_0_gmc_funcs = {<br>
                &nbsp; &nbsp; &nbsp; &nbsp; .get_vm_pde = gmc_v12_0_get_vm_pde,<br>
                &nbsp; &nbsp; &nbsp; &nbsp; .get_vm_pte = gmc_v12_0_get_vm_pte,<br>
                &nbsp; &nbsp; &nbsp; &nbsp; .get_vbios_fb_size =
                gmc_v12_0_get_vbios_fb_size,<br>
                +&nbsp; &nbsp; &nbsp; &nbsp;.get_dcc_alignment =
                gmc_v12_0_get_dcc_alignment,<br>
                &nbsp;};<br>
                <br>
                &nbsp;static void gmc_v12_0_set_gmc_funcs(struct
                amdgpu_device *adev)<br>
                -- <br>
                2.25.1<br>
                <br>
              </blockquote>
            </div>
          </div>
        </div>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------bHyZ3h9SF7b28WhbEAF1nmAr--
