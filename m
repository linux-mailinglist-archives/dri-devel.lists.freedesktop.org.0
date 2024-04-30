Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADCA8B7DCB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 18:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61802112D10;
	Tue, 30 Apr 2024 16:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ll6M5wB9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A44112D10;
 Tue, 30 Apr 2024 16:53:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/9R8I6BBe3LDQ5q+O+S9frwu7uLb67t/0UnEnXr5FvqJ3+Qroa/gPlswqnk4a0iFK6bTmprMkqdqg1udxZ04HAibXT7A2MnBCcs1TMzFd9LSIYI4MHIRD37nxdp4Sddu/I+XjMfuECmnBzmxmQMyW0aQE/dgZsiQiC7FWUa6C4rfNDSwGozOGlQ+f3mzKVbiI6igZiygU+OssNFmar9vQu9/RyNK1jxRdQB34VOZIxykNPe7CpJMNIRD1JdduKWSAl5r8PvQ4gj8p9U9rJNGvoZ4nsJOjUNjOzuTR8kMDHKu/CPxFcg6MwnyiRJkUz8FhZAmbPrsNy1ZxDTlA9/lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ExdiR9qsQePpPwB3lBEMpHHmnXgNiAl3aYRcLBj+VQ=;
 b=DuzQ/KQQ5NtiXqBlKAeZuU20Tu8WQG5z/exTXXVE/mdcqw4CTjYVWgVwOBuCfM/WF2WiPVglrQufVcrEAtdlKZ1G4x92u1vcFjeEfV4SR7syr5FVEW9v6pmILp2S9ibJVyhEx7P0taEUL4US50o+Q1fQEWvv8/mDcOPp3XEOX7IAcb1fGEzWGRjPoJKo8cVq+DFuWUk3pNqc2CXFgqtcbgLgxuUt1A9YMGYfC8YfctOpvgybj28BcAWbRa8dAb1ixZ9uhJzH415MdpQcwADKIYc+wgnUPPN3lO+QK1DDjsqOgn6ZLm42BFZ8eNdq8A9EnXmOUleuo8lrOkIpsB1yug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ExdiR9qsQePpPwB3lBEMpHHmnXgNiAl3aYRcLBj+VQ=;
 b=ll6M5wB9EV+mtnLMTYkHFziSYxKVPY7ldjbNW6s79IUykCmxIK4RCQtJid0zDUUq9lcVUR8rLKFR2OCglphvoGzuUC9l8YqurO2wWfq+ufW/+wkWO5LqMIMWPkMIBHQzWtRUjGNX2eYUqQleCoFkp42O9PGFC6K8xYGRN0rcRvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by DM6PR12MB4186.namprd12.prod.outlook.com (2603:10b6:5:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.37; Tue, 30 Apr
 2024 16:53:51 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::8916:c54b:ebfa:127f]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::8916:c54b:ebfa:127f%7]) with mapi id 15.20.7519.035; Tue, 30 Apr 2024
 16:53:51 +0000
Message-ID: <87d07be8-a2f2-48b0-afa3-be7a4c108e85@amd.com>
Date: Tue, 30 Apr 2024 10:53:45 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: fix documentation warnings for mpc.h
Content-Language: en-US
To: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240427160509.15736-1-marcelomspessoto@gmail.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20240427160509.15736-1-marcelomspessoto@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::20) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|DM6PR12MB4186:EE_
X-MS-Office365-Filtering-Correlation-Id: 048293fa-7992-473a-a23e-08dc69361ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHp4R3dvSitEKzJhbnFkaXFXZDNuU0JNakFXdVBKdmVIV2VvM0RZR21xMTU2?=
 =?utf-8?B?Z2JkVEJjQmFQNzVDS0gxSTJwOERDRWVlWHUyVVdMNG5iNFYxbmNxeWdVTkFk?=
 =?utf-8?B?cGg4ODNiU0k3L1BnYmxsOUpjcmFzTHJTQ0hScGVldG9yTGplZW01NXM0dzNi?=
 =?utf-8?B?VExrSWFCRmhnRVJNY2ljcmFxNFNNQVFHdXNCREpUZ0tZMWFra0pvblcvbDdD?=
 =?utf-8?B?RFNmTDhXMGV4UWtPY1FmTnkyNG9vT0xnNXBXTXdaQXM5ak1LQXhGUjVqWEhY?=
 =?utf-8?B?Wm41SWU2Mk1Fc1lwTG9nVUs3RnQ0dVpzUUFRK0J5MHo0ZjJiaC9PeXVkNzF3?=
 =?utf-8?B?WU9HK3hPcXR6eHBaVzRoNXZpOEwvMG5uZXRIRUVoeTdvWWExbWRLdjFMUkZ2?=
 =?utf-8?B?VDJpU1pPZFUrTDJNZWhRVGJMZDI0RUN1Nnp5SHYzSXdtVHNBaHREK1RrN0Iz?=
 =?utf-8?B?ZFFSUTBnMFFiWkkza2ZnRXdXelArdncvUjc4TklhazZWODZ4S0MzZ3lmcUI0?=
 =?utf-8?B?cWYwQTR4QWVZbUxLMnJRNmRhcUhoOFVlVCtXRWJ2TC9HekwzekJsYmdnUjNi?=
 =?utf-8?B?SDZXcmkwUWRpT0lWWVcyR0Jna1lxT2grZVlERFdmTmx1b3kveUNvNC9wWEY2?=
 =?utf-8?B?ZGVZSzQwY3gvZGZSSGllYVBNV0VNK3p0SmlEekY4WmpxRVlIbngvYW5BYzRB?=
 =?utf-8?B?Wm9rUzc4TExKdWw3TEMxcEZTV2crS0xqV21xM1hNaHFiTzFaUnBrVjkvcCtB?=
 =?utf-8?B?WnhzQzl3TTJ5MzNQWmFsN3hpMzFxNXBXM1RjL09CWnBDK0ppWWdLQ2dzZCt0?=
 =?utf-8?B?b0NTQWZwdmhkT3k5bEZKanFWTEVKRVdXU3VpSi9JUHVVck1NK3dLK3JHTVBs?=
 =?utf-8?B?NzhldVNSYm9lZWxxSTJRUitldVY5NkcwcnJiU0RmcS9JdG9XWVI5ZHYzbTNH?=
 =?utf-8?B?ZEFPM2dSUm9QZnR5cFMwNVpJT2VXN0NWMWluVkxLcG9tUFpiQ1Z2clhjd0R3?=
 =?utf-8?B?NU5CYk0wZXFmY3RhTmg2bnFqVHN2SHJSQ0hmbDNyelAvU0hPb2NEelJQSzVa?=
 =?utf-8?B?ZzdsU1QzelpoRk13cGxRTXljbUtNNzJmeVNuWEkrbHlQNTQyZ1AyK0NsWnQ2?=
 =?utf-8?B?ZktBRlExb0huZjRobVJYOHVhSGdqb0NINTI2eHJCSGMzTDJBUGMwcWFVZ2h0?=
 =?utf-8?B?YzRldnhOUG1mNDZ0YkZDY3YyQ0pVTFpoYVNWSkcyajUrdnUvbkZYTDVFUTZJ?=
 =?utf-8?B?aEU3WVAxcmlTNkkvTzRhRGQ3L2JxRnhnd283NTdpcVQrdGc1Y21idXV0TTIz?=
 =?utf-8?B?N3piUEdzMmsvRDM3WDVoTUtLWUdBNXFvZ2xtam1HOU9tRXhvOWM4c2RVVS83?=
 =?utf-8?B?VEYvei9PZFRoYzZOdTlLVlR4VUlVNHBsd3liMHBCTFNJYk5RQlhQUEJjZzFZ?=
 =?utf-8?B?dUVVQ2lPZkRFMm5mdVNrOHl0VzRjWTBJazRYUWx5aTFlOWlWaytNTUM4K3Zp?=
 =?utf-8?B?SjBlNmptVjlISUVLSy93TFUzRFF5b3M3d0xUM09Sc0RuYjdCRWFCQngxL2t3?=
 =?utf-8?B?Ymd4N2FZamR2ZkE4Q3RETlI4ZmFkSmhKN3lVakVwWFhUbzM3djZuUUxCT01Q?=
 =?utf-8?Q?ro5bXltkJAFIdzfE0kz7kOv+TXDiM2C4CC/Ye6tQviWQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0o1TFVOL2psK09tZTJyQjg0ZXpXd3hydWJXZzdhaFIrUUQrYnNMbmM3L1FU?=
 =?utf-8?B?ZHN0dlRFcDI2eUNQNzRKTEJZUFEwQmdBVzQ3VTBMUlVoNGRBaUl1WWR4SUNO?=
 =?utf-8?B?MjFiNHptQXowVGhsOHRuNHg2b3FZZG5xclBleWh6MzNITEVYNmNUZXY3M3ln?=
 =?utf-8?B?ZDNHaWo0MXl3Z1kyd3V6cHV1Qk9TdlBjdTkvdlJDV2dGWlhzbGx6THVkMWlw?=
 =?utf-8?B?cFFUUm5QWVVCQkZTZlJPb2hZa2QvS0ZlT0I1K1R6OHlpS0sxSHlSMmtSaGEz?=
 =?utf-8?B?bU5JcldvV2FOWnNsMldQclptditKQnpqN2RvVlJRampQVG9RZTBzbDNIeHRw?=
 =?utf-8?B?NURFRjFoMUVrVWlkUHordThpQlh6eGpDNE95YUdPSms3blVLY0pQb3JRdTRN?=
 =?utf-8?B?akJhZjVIYUlDckNoaXYzZVozYjB3VzdCdXJTS3VUd1VKUjdpbnJhTFN6T2NF?=
 =?utf-8?B?UkRiTUFFZkJhUXR5TkF6ZzkyTUZRTzErZ0RVZm5GeURqeTBzSE9YeUs0SStQ?=
 =?utf-8?B?MXRZZFJ5OE4zckd4M25OdW9IbnIrbldYcWwyMGNLVktUZHAxZk1HdFBCK1Ur?=
 =?utf-8?B?MXRwWXNSNDlEZlNjcElhMTQ5Z2VlOHovNDgyN2pkZFFFNEczZWFoaHg3eHNI?=
 =?utf-8?B?eWhUOWhQbnh3L2NMR2oxS1JEZjFUWWhVcjJpU1g4bCsxRTUwVGducXpZczNK?=
 =?utf-8?B?c0RhZW1ncHdPOWkrTnFWSTRnWWpXSmQ3bGRZZyszRm9Hakc0eGY4Tlc5MXRz?=
 =?utf-8?B?UG1OemFBNVcvaitwN01UYjdIVDRNVEc2MTFlNjNZWTNvZWhUem9sZVh5VmZt?=
 =?utf-8?B?QUY3MHY0ZVQ1bWc2MVBuZytzN2VSY2NFaUhGeWMvQ20rcjJUZnBFTE1UTHIy?=
 =?utf-8?B?NHZ2OGJDZE4ybzh4WEdBcDc0V1QrWHhNWWhsUjRySm9xdTlTWlFpRTJzM0xB?=
 =?utf-8?B?SzB2aDRIekxFS3RoeHN3eUs4RFExazdPcm1NNitkYncwYWZSM3JnOWFNcEVl?=
 =?utf-8?B?YUloRFpqNkRzQmVKa3B5ODZ0NzhnNTBYTkhSVEFCSmFWVkwrVVhyMC9zQ0dq?=
 =?utf-8?B?Qy8xNFZvZitDRUNKM2QzbURmVXExY1c3UitqUk42K3lJM3BFMW9ZMkRVeFhW?=
 =?utf-8?B?dXA1dnFXTXlobnpvN2NydC8rVWExdjU1ODZBSUVkVGJraHI2TVBoazl6cXFl?=
 =?utf-8?B?U29sa3NpU29jTG1ZdTYyWDMyNVNZekJCVWlmdFZtSEJXbGpDL1gwSGJNdFB5?=
 =?utf-8?B?b00yMHpaL1R2NDd6NGdKKzhUNEwzYjBLVUR3ajhoNXE3TEVtdndsVWJ6RkNy?=
 =?utf-8?B?MXJRYkd3RnZsVlVQb2h2Q0o0WmRLZ0xtV1ZhTlVqZmR2Mit1RDZUU2I2VEVx?=
 =?utf-8?B?QzU1d1N1UXFZTjVkSVhWMHZpaEF2dllOeWhCWHhLRlBOMFMxcGNVbUZDVXE3?=
 =?utf-8?B?b3RNa2Yzb0hUaHE5RUh0Z1A2ZXZ5ZS9mTUNnbDRzalNmalBaQWtDUURjM0RW?=
 =?utf-8?B?ZkJrVmt3TmphZW1uZGdxK1JBVytGK2Ezc3hJQ1BHZWZYeXF6WGh5c251NHov?=
 =?utf-8?B?c29rckRlNjN0YnMrY3NFVUdWK01jUUdKajNibE5USGU5M0JUMWVJK1BvRlhq?=
 =?utf-8?B?aElOV2duOCs3TnhPYkxnYUQ3OWlkSThVaVdyMkpDNk1POWdKZmZqUVlVWDRp?=
 =?utf-8?B?WHJ3Z2tPNEhzR0pXdFk2N1R6SGlkV0Q5SmRhVUpIeHN3bmRMc2l0YjVhQVFj?=
 =?utf-8?B?VUZoUmVNLzl5YlUvTGswSFg1THlvZU5WT1IwU0w2UzF1N3M2ZTZ3dVduQTdX?=
 =?utf-8?B?YmxyTG5sdG41U05RSE1nSzdFUHlEbXhTRHVLVVlVeUh3MnhqZFJoTUdab09i?=
 =?utf-8?B?NHNybnRqdzFBU0MxeVl3TlpBV3lzb3lKcjhsZkdBTXd3Q1lFdnpybUVNbTdD?=
 =?utf-8?B?WStZZEZ4YzIvRVppV0tESk5GbzhkeEVucFBmM2xxQzJPU2FNYk4zOGx0alAz?=
 =?utf-8?B?V3ZlaVRVaHIwbzhDU3g1YjZweFRjeHBXTFZzaWk1cVVYRENkQjNSa09wWE1U?=
 =?utf-8?B?U0E0VTN1QTRLZXYvbFhQdHBNdFRHdTlja00zWGxQbm9BNzlVTEFmRmpvYnV0?=
 =?utf-8?Q?jUunUYWeZjaqOTO528PW6nKZI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048293fa-7992-473a-a23e-08dc69361ca2
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 16:53:51.0736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: odVxjghkcvyGoJV6/i0n9lmiX4Ph28WNV0z0pMIW/so1CnQZL2IrVq9SSABVIktPKPjSTju2LqIWcwmpHenKyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186
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

Hi Marcelo,

First of all, thanks a lot for your patch! Please check some of my 
inline comments.

On 4/27/24 10:05 AM, Marcelo Mendes Spessoto Junior wrote:
> Fix most of the display documentation compile warnings by
> documenting struct mpc_funcs functions in dc/inc/hw/mpc.h file.

Could you add the warnings that you fixed in the commit message?

I think some of your changes in this patch address some of the issues 
reported by Stephan Rothwell:

https://lore.kernel.org/all/20240130134954.04fcf763@canb.auug.org.au/

Please include Stephan in the new version of this patch.

Also, use the Fixes tags pointing to:

b8c1c3a82e75 ("Documentation/gpu: Add kernel doc entry for MPC")


> 
> Signed-off-by: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
> ---
>   drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 372 +++++++++++++++++++-
>   1 file changed, 369 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> index 34a398f23..388b96c32 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> @@ -1,4 +1,5 @@
> -/* Copyright 2012-15 Advanced Micro Devices, Inc.
> +/*
> + * Copyright 2012-15 Advanced Micro Devices, Inc.
>    *
>    * Permission is hereby granted, free of charge, to any person obtaining a
>    * copy of this software and associated documentation files (the "Software"),
> @@ -282,6 +283,21 @@ struct mpcc_state {
>    * struct mpc_funcs - funcs
>    */
>   struct mpc_funcs {
> +  /**
> +   * @read_mpcc_state:
> +   *
> +   * Read register content from given MPCC physical instance.

It looks like your text editor left some extra spaces at the end of the 
string in many parts of this patch. Remove this extra space at the end 
of some of the strings in this patch for the next version. If you use 
git log -p after applying your patch, you can visually see where the 
extra space is at the end of each line.

> +   *
> +   * Parameters:
> +   *
> +   * - [in/out] mpc - MPC context
> +   * - [in] mpcc_instance - MPC context instance
> +   * - [in] mpcc_state - MPC context state
> +   *
> +   * Return:
> +   *
> +   * void
> +   */

Use the same indentation as the field/functions that you are documenting.

Finally, ensure you are using the latest amd-staging-drm-next to base 
your patch. I believe you have some merge conflicts since mpc.h has some 
changes.

Thanks
Siqueira

>   	void (*read_mpcc_state)(
>   			struct mpc *mpc,
>   			int mpcc_inst,
> @@ -346,12 +362,22 @@ struct mpc_funcs {
>   	 * Parameters:
>   	 *
>   	 * - [in/out] mpc - MPC context.
> -	 *
> +	 *
>   	 * Return:
>   	 *
>   	 * void
>   	 */
>   	void (*mpc_init)(struct mpc *mpc);
> +
> +  /**
> +   * @mpc_init_single_inst:
> +   *
> +   * Initialize given MPCC physical instance.
> +   *
> +   * Parameters:
> +   * - [in/out] mpc - MPC context.
> +   * - [in] mpcc_id - The MPCC physical instance to be initialized.
> +   */
>   	void (*mpc_init_single_inst)(
>   			struct mpc *mpc,
>   			unsigned int mpcc_id);
> @@ -449,62 +475,282 @@ struct mpc_funcs {
>   			struct mpc_tree *tree,
>   			struct mpcc *mpcc);
>   
> +  /**
> +   * @get_mpcc_for_dpp_from_secondary:
> +   *
> +   * Find, if it exists, a MPCC from a given 'secondary' MPC tree that
> +   * is associated with specified plane.
> +   *
> +   * Parameters:
> +   * - [in/out] tree - MPC tree structure to search for plane.
> +   * - [in] dpp_id - DPP to be searched.
> +   *
> +   * Return:
> +   *
> +   * struct mpcc* - pointer to plane or NULL if no plane found.
> +  */
>   	struct mpcc* (*get_mpcc_for_dpp_from_secondary)(
>   			struct mpc_tree *tree,
>   			int dpp_id);
>   
> +  /**
> +   * @get_mpcc_for_dpp:
> +   *
> +   * Find, if it exists, a MPCC from a given MPC tree that
> +   * is associated with specified plane.
> +   *
> +   * Parameters:
> +   * - [in/out] tree - MPC tree structure to search for plane.
> +   * - [in] dpp_id - DPP to be searched.
> +   *
> +   * Return:
> +   *
> +   * struct mpcc* - pointer to plane or NULL if no plane found.
> +  */
>   	struct mpcc* (*get_mpcc_for_dpp)(
>   			struct mpc_tree *tree,
>   			int dpp_id);
>   
> +  /**
> +   * @wait_for_idle:
> +   *
> +   * Wait for a MPCC in MPC context to enter idle state.
> +   *
> +   * Parameters:
> +   * - [in/out] mpc - MPC Context.
> +   * - [in] id - MPCC to wait for idle state.
> +   *
> +   * Return:
> +   *
> +   * void
> +  */
>   	void (*wait_for_idle)(struct mpc *mpc, int id);
>   
> +  /**
> +   * @assert_mpcc_idle_before_connect:
> +   *
> +   * Assert if MPCC in MPC context is in idle state.
> +   *
> +   * Parameters:
> +   * - [in/out] mpc - MPC context.
> +   * - [in] id - MPCC to assert idle state.
> +   *
> +   * Return:
> +   *
> +   * void
> +  */
>   	void (*assert_mpcc_idle_before_connect)(struct mpc *mpc, int mpcc_id);
>   
> +  /**
> +   * @init_mpcc_list_from_hw:
> +   *
> +   * Iterate through the MPCC array from a given MPC context struct
> +   * and configure each MPCC according to its registers' values.
> +   *
> +   * Parameters:
> +   * - [in/out] mpc - MPC context to initialize MPCC array.
> +   * - [in/out] tree - MPC tree structure containing MPCC contexts to initialize.
> +   *
> +   * Return:
> +   *
> +   * void
> +  */
>   	void (*init_mpcc_list_from_hw)(
>   		struct mpc *mpc,
>   		struct mpc_tree *tree);
>   
> +  /**
> +  * @set_denorm:
> +  *
> +  * Set corresponding OPP DENORM_CONTROL register value to specific denorm_mode
> +  * based on given color depth.
> +  *
> +  * Parameters:
> +  * - [in/out] mpc - MPC context.
> +  * - [in] opp_id - Corresponding OPP to update register.
> +  * - [in] output_depth - Arbitrary color depth to set denorm_mode.
> +  *
> +  * Return:
> +  *
> +  * void
> +  */
>   	void (*set_denorm)(struct mpc *mpc,
>   			int opp_id,
>   			enum dc_color_depth output_depth);
>   
> +  /**
> +  * @set_denorm_clamp:
> +  *
> +  * Set denorm clamp values on corresponding OPP DENORM CONTROL register.
> +  *
> +  * Parameters:
> +  * - [in/out] mpc - MPC context.
> +  * - [in] opp_id - Corresponding OPP to update register.
> +  * - [in] denorm_clamp - Arbitrary denorm clamp to be set.
> +  *
> +  * Return:
> +  *
> +  * void
> +  */
>   	void (*set_denorm_clamp)(
>   			struct mpc *mpc,
>   			int opp_id,
>   			struct mpc_denorm_clamp denorm_clamp);
>   
> +  /**
> +  * @set_output_csc:
> +  *
> +  * Set the Output Color Space Conversion matrix
> +  * with given values and mode.
> +  *
> +  * Parameters:
> +  * - [in/out] mpc - MPC context.
> +  * - [in] opp_id - Corresponding OPP to update register.
> +  * - [in] regval - Values to set in CSC matrix.
> +  * - [in] ocsc_mode - Mode to set CSC.
> +  *
> +  * Return:
> +  *
> +  * void
> +  */
>   	void (*set_output_csc)(struct mpc *mpc,
>   			int opp_id,
>   			const uint16_t *regval,
>   			enum mpc_output_csc_mode ocsc_mode);
>   
> +  /**
> +  * @set_ocsc_default:
> +  *
> +  * Set the Output Color Space Conversion matrix
> +  * to default values according to color space.
> +  *
> +  * Parameters:
> +  * - [in/out] mpc - MPC context.
> +  * - [in] opp_id - Corresponding OPP to update register.
> +  * - [in] color_space - OCSC color space.
> +  * - [in] ocsc_mode - Mode to set CSC.
> +  *
> +  * Return:
> +  *
> +  * void
> +  *
> +  */
>   	void (*set_ocsc_default)(struct mpc *mpc,
>   			int opp_id,
>   			enum dc_color_space color_space,
>   			enum mpc_output_csc_mode ocsc_mode);
>   
> +  /**
> +  * @set_output_gamma:
> +  *
> +  * Set Output Gamma with given curve parameters.
> +  *
> +  * Parameters:
> +  * - [in/out] mpc - MPC context.
> +  * - [in] mpcc_id - Corresponding MPC to update registers.
> +  * - [in] params - Parameters.
> +  *
> +  * Return:
> +  *
> +  * void
> +  *
> +  */
>   	void (*set_output_gamma)(
>   			struct mpc *mpc,
>   			int mpcc_id,
>   			const struct pwl_params *params);
> +  /**
> +  * @power_on_mpc_mem_pwr:
> +  *
> +  * Power on/off memory LUT for given MPCC.
> +  * Powering on enables LUT to be updated.
> +  * Powering off allows entering low power mode.
> +  *
> +  * Parameters:
> +  * - [in/out] mpc - MPC context.
> +  * - [in] mpcc_id - MPCC to power on.
> +  * - [in] power_on
> +  *
> +  * Return:
> +  *
> +  * void
> +  */
>   	void (*power_on_mpc_mem_pwr)(
>   			struct mpc *mpc,
>   			int mpcc_id,
>   			bool power_on);
> +  /**
> +  * @set_dwb_mux:
> +  *
> +  * Set corresponding Display Writeback mux
> +  * MPC register field to given MPCC id.
> +  *
> +  * Parameters:
> +  * - [in/out] mpc - MPC context.
> +  * - [in] dwb_id - DWB to be set.
> +  * - [in] mpcc_id - MPCC id to be stored in DWB mux register.
> +  *
> +  * Return:
> +  *
> +  * void
> +  */
>   	void (*set_dwb_mux)(
>   			struct mpc *mpc,
>   			int dwb_id,
>   			int mpcc_id);
>   
> +  /**
> +  * @disable_dwb_mux:
> +  *
> +  * Reset corresponding Display Writeback mux
> +  * MPC register field.
> +  *
> +  * Parameters:
> +  * - [in/out] mpc - MPC context.
> +  * - [in] dwb_id - DWB to be set.
> +  *
> +  * Return:
> +  *
> +  * void
> +  */
>   	void (*disable_dwb_mux)(
>   		struct mpc *mpc,
>   		int dwb_id);
> -
> +
> +  /**
> +  * @is_dwb_idle:
> +  *
> +  * Check DWB status on MPC_DWB0_MUX_STATUS register field.
> +  * Return if it is null.
> +  *
> +  * Parameters:
> +  * - [in/out] mpc - MPC context.
> +  * - [in] dwb_id - DWB to be checked.
> +  *
> +  * Return:
> +  *
> +  * bool - wheter DWB is idle or not
> +  */
>   	bool (*is_dwb_idle)(
>   		struct mpc *mpc,
>   		int dwb_id);
>   
> +  /**
> +  * @set_out_rate_control:
> +  *
> +  * Set display output rate control.
> +  *
> +  * Parameters:
> +  * - [in/out] mpc - MPC context.
> +  * - [in] opp_id - OPP to be set.
> +  * - [in] enable
> +  * - [in] rate_2x_mode
> +  * - [in] flow_control
> +  *
> +  * Return:
> +  *
> +  * void
> +  */
>   	void (*set_out_rate_control)(
>   		struct mpc *mpc,
>   		int opp_id,
> @@ -512,37 +758,157 @@ struct mpc_funcs {
>   		bool rate_2x_mode,
>   		struct mpc_dwb_flow_control *flow_control);
>   
> +  /**
> +  * @set_gamut_remap:
> +  *
> +  * Set post-blending CTM for given MPCC.
> +  *
> +  * Parameters:
> +  * - [in] mpc - MPC context.
> +  * - [in] mpcc_id - MPCC to set gamut map.
> +  * - [in] adjust
> +  *
> +  * Return:
> +  *
> +  * void
> +  */
>   	void (*set_gamut_remap)(
>   			struct mpc *mpc,
>   			int mpcc_id,
>   			const struct mpc_grph_gamut_adjustment *adjust);
>   
> +  /**
> +  * @program_1dlut:
> +  *
> +  * Set 1 dimensional Lookup Table.
> +  *
> +  * Parameters:
> +  * - [in/out] mpc - MPC context
> +  * - [in] params - curve parameters for the LUT configuration
> +  * - [in] rmu_idx
> +  *
> +  * bool - wheter LUT was set (set with given parameters) or not (params is NULL and LUT is disabled).
> +  */
>   	bool (*program_1dlut)(
>   			struct mpc *mpc,
>   			const struct pwl_params *params,
>   			uint32_t rmu_idx);
>   
> +  /**
> +  * @program_shaper:
> +  *
> +  * Set shaper.
> +  *
> +  * Parameters:
> +  * - [in/out] mpc - MPC context
> +  * - [in] params - curve parameters to be set
> +  * - [in] rmu_idx
> +  *
> +  * Return:
> +  *
> +  * bool - wheter shaper was set (set with given parameters) or not (params is NULL and LUT is disabled).
> +  */
>   	bool (*program_shaper)(
>   			struct mpc *mpc,
>   			const struct pwl_params *params,
>   			uint32_t rmu_idx);
>   
> +  /**
> +  * @acquire_rmu:
> +  *
> +  * Set given MPCC to be multiplexed to given RMU unit.
> +  *
> +  * Parameters:
> +  * - [in/out] mpc - MPC context
> +  * - [in] mpcc_id - MPCC
> +  * - [in] rmu_idx - Given RMU unit to set MPCC to be multiplexed to.
> +  *
> +  * Return:
> +  *
> +  * unit32_t - rmu_idx if operation was successful, -1 else.
> +  */
>   	uint32_t (*acquire_rmu)(struct mpc *mpc, int mpcc_id, int rmu_idx);
>   
> +  /**
> +  * @program_3dlut:
> +  *
> +  * Set 3 dimensional Lookup Table.
> +  *
> +  * Parameters:
> +  * - [in/out] mpc - MPC context
> +  * - [in] params - tetrahedral parameters for the LUT configuration
> +  * - [in] rmu_idx
> +  *
> +  * bool - wheter LUT was set (set with given parameters) or not (params is NULL and LUT is disabled).
> +  */
>   	bool (*program_3dlut)(
>   			struct mpc *mpc,
>   			const struct tetrahedral_params *params,
>   			int rmu_idx);
>   
> +  /**
> +  * @release_rmu:
> +  *
> +  * For a given MPCC, release the RMU unit it muliplexes to.
> +  *
> +  * Parameters:
> +  * - [in/out] mpc - MPC context
> +  * - [in] mpcc_id - MPCC
> +  *
> +  * Return:
> +  *
> +  * int - a valid rmu_idx representing released RMU unit or -1 if there was no RMU unit to release.
> +  */
>   	int (*release_rmu)(struct mpc *mpc, int mpcc_id);
>   
> +  /**
> +  * @get_mpc_out_mux:
> +  *
> +  * Return MPC out mux.
> +  *
> +  * Parameters:
> +  * - [in] mpc - MPC context.
> +  * - [in] opp_id - OPP
> +  *
> +  * Return:
> +  *
> +  * unsigned int - Out Mux
> +  */
>   	unsigned int (*get_mpc_out_mux)(
>   			struct mpc *mpc,
>   			int opp_id);
>   
> +  /**
> +   * @set_bg_color:
> +   *
> +   * Find corresponding bottommost MPCC and
> +   * set its bg color.
> +   *
> +   * Parameters:
> +   * - [in/out] mpc - MPC context.
> +   * - [in] bg_color - background color to be set.
> +   * - [in] mpcc_id
> +   *
> +   * Return:
> +   *
> +   * void
> +  */
>   	void (*set_bg_color)(struct mpc *mpc,
>   			struct tg_color *bg_color,
>   			int mpcc_id);
> +
> +  /**
> +  * @set_mpc_mem_lp_mode:
> +  *
> +  * Set mpc_mem_lp_mode
> +  *
> +  * Parameters:
> +  * - [in/out] mpc
> +  *
> +  * Return:
> +  *
> +  * void
> +  */
>   	void (*set_mpc_mem_lp_mode)(struct mpc *mpc);
>   };
>   

