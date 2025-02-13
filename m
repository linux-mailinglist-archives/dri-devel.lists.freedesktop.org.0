Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995EBA34D7A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 19:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8B610EB68;
	Thu, 13 Feb 2025 18:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3xPClR0H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10A910EB66;
 Thu, 13 Feb 2025 18:21:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chZiwYZSWjb6DA0YLx5bikpl5eLJycU/BBMZwFvABPY8eZ22frKZUGpZQpm2Cs79vh6fudHKn6kdRbPgE1Jjv4GMvyMfTFksPyZIZRPitRRRphpP+xfl60kK3RWnESO+QrkO1koUuXyM2YGOma2GH0rPdEnXU+TbkIL8dVPaaZGETp6vl/BLPISgBqx2IafHDatGc6QQw6L+HGIJHlvBmFtP8gBuG46RppQUpPsbJUy+flV2tfBLcgRJCIm0UHzTO6Ky0OBcfDQ/GnURnUc5p6joM+u0K1KDq4s6+4DIQqitFtsEAH3E9gq0TldoULRZr6HCVZ74TGS4PyJo2Pv/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lq7z8unZxk5AA6fShuUikNE1AzfyQTzdAvVwGJwf9Es=;
 b=l+yUnMUbR1SsWpOKcmyLMX34LY3G3+77N6FC1mJjxdvKgv2l79Eg8fxTLqOUbbRRpdeMguzADpOmDQsq4RFbL5b29EyUFeub5o4q8CBOeX0HNlFL6FTPLbwgOKPcX2oWtr2kNkPIGC8ofhuaJXXbeNmR0cgl05wyTuHZ5QSiK3t8/cJnBZt6bczTqNcoakHLWCwYbu1I0/uZ1i7Wh63vQZ6OdQC2vGcqLArLZ+LRkzoBlshzzDldBPZpER3cI5uXYIuJo7GHPds75qz+Vrn03jqn6DnTz/pGYzLV8J9hzywvDDzyEb3YaTeTI/is/zzPYyOnGnmYfBlGRo4oFZPv4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lq7z8unZxk5AA6fShuUikNE1AzfyQTzdAvVwGJwf9Es=;
 b=3xPClR0HNcEkK/XLJaVWDVSUb8MxOBDQSSQ9ZCJeDlmTsq49k1caMOxEvgYFqdp2FilyXn7dcRrujo0mIEupycIb2sCQGk+1tgaMZtMktdg+xUsJe961A8AhjLEjnO3GZ7kuuBhZ+499rR8xbhfDxBqJC0sB54LV546lstelQto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 DS7PR12MB6262.namprd12.prod.outlook.com (2603:10b6:8:96::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.11; Thu, 13 Feb 2025 18:21:05 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 18:21:05 +0000
Message-ID: <44edbdfb-5e23-4c19-8c80-e7acb8b4930f@amd.com>
Date: Thu, 13 Feb 2025 13:21:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 42/45] drm/amd/display: add 3D LUT colorop
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-43-alex.hung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20241220043410.416867-43-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0383.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::29) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|DS7PR12MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd6aa09-b1fe-42ea-c3cd-08dd4c5b2dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUtQQjN6YjdFMlJHWnlkKzZGbEZFTitmRVR6WE96Yk43NlNTRGpmQzFXTDlt?=
 =?utf-8?B?STFiWVMxbTJtTmcxancwYTBTTzhjSlp2cjYyeU0wMG83V2xZL1ZOa2l4LzhS?=
 =?utf-8?B?QmlLYVovYUlYTkwyWjVaN2UyUnQ5akFFZmxhRFAza0VsY3B5RmNqU1Ird00w?=
 =?utf-8?B?UkhSL3lJc0tKUkNIWFp2Nm9oOGVCWVRqcUkrQXFVSG5SOXkzRXB6cnBlSUsx?=
 =?utf-8?B?dFJWTUsrbXZRVkk1cHhxWmRLN1BadURvbnZVNFV2ZW5FOUVNR0N6Zk92TGtU?=
 =?utf-8?B?bHdDR2lCQmcwdjNJZzNHaE1aenJPTHo3MlV1bTBCQzVxS1NvNjdxVC9pNDdN?=
 =?utf-8?B?ZlkxOXdNQzJTUklnOENzL29EdEl4cHpVV1gyRU9BUGZJamI3Y0hVejQ4Ylgx?=
 =?utf-8?B?aWRKellKZjVGN2U1NForREtkdktnTGFXNzErQmZpS2lrSHkrNlBZdGpUZUZi?=
 =?utf-8?B?aEdpb1pyMWUwZUhMTlRvT01td3V5TENTZlQ0SmxCQ3BsYXRtR2c0SEsrTXNE?=
 =?utf-8?B?OTdsWEh0OHM4b1VrNzNJWDBqWnFadVZhbEFzV3J5QlQ4UGN2LzRVWWdqZDNl?=
 =?utf-8?B?MGFpR3JLR0UxWUZKenNsbWRiL21NTE9iOURQR0ZFaXZYT0NJaHZNUFFnbUFk?=
 =?utf-8?B?Yk15S2dRNWFBbVFvc1QwSWZ3RG1FNGZ0cTZ3Tm9JWk94WDdGTnFjc1JRQWgz?=
 =?utf-8?B?ei9DbTZqcE5Pd3pkL29DMFFCSzJnRW5SVDFHTzNhT1VKb1AxUTFkckllMDV6?=
 =?utf-8?B?VkxmeTU1U244NS9SQU1CeGozVzR5MW9wUlI3c3ovbnJ3UEZoREJsMTNVTXJC?=
 =?utf-8?B?eW5GU0xqVlVJV1dsLzlpcHBoY0JaMzhGNmpGUGJmRnFxMDl3NUtzb2Ywa09M?=
 =?utf-8?B?ZjJBRG43SllPQ2FRKzJOdDR4NEpMOWVXZWNYVXpsdC96MmxtOGVucGJHejhR?=
 =?utf-8?B?d3RXRzRvc1NXaDcya0RBcnVEZm5oeTA5dk5SblRBM1VKRnBRWVFpdjRxUzJB?=
 =?utf-8?B?dFBVNzhkWVdqVjd1UGNZN3lCRmgxS21OR2ZtRFBRa1V0ZHFUMk14SWl3T2VW?=
 =?utf-8?B?RDdGRmgrUFc3T0lJcGR6SFpqKzRocGszTXc3STBhb3VQYjIwMlRXZnNsNFha?=
 =?utf-8?B?VjhDUDFEMkFBbmt2R0V3OXpnakhWOGJiSXZQcEtHOTcrNE13QWw2ckdkUlky?=
 =?utf-8?B?S2FuQzF5YXAvVUZYYXJHKzVkbVhrVXViK29pMVBBTHV6OXhjRmd1YTR4Smli?=
 =?utf-8?B?bkExcGNkSU9FNFF4MTdXYnBjYVRyY0xndXUrVTU2QUdOWjNacC8yd28xSVJX?=
 =?utf-8?B?L3piclVvWC90QUVEenJyemdIY016aWNpRmlJYzUrN2x6MTVqekYvOEw1YTlL?=
 =?utf-8?B?MUJ1clBYRmIrTEVkQmROTjBreE1YZXRKdjFmNTZ5QmxKOStXamViK2M3cE5M?=
 =?utf-8?B?VFFDSlNtUkVwOHpEZ0RWSmptMm9zR1doSUNSL0x2c0lQeis1d0JNWG9Makxz?=
 =?utf-8?B?REpOY3Nnbko2QUY0b0Z2M0JockRUdzBtU3R3SldZM3ZNOU01b3RyNFRLazNV?=
 =?utf-8?B?SFdBZUhLU2pOUkt1VjUwNGo3Rkc5V2JQemptYnNVbGVQNWdTMjM0aSsxbkVv?=
 =?utf-8?B?WVBkRU16WTZkNS9lYno1OU00dHRjUVl1NCsvNEREV3JVRW81dGt4eHdJeWdN?=
 =?utf-8?B?Rkp3RGhEZllSMnVRN3NiVEpXekw0T1ZBNE5sVmZ6RUt2QSs4S2syY2RZWHd5?=
 =?utf-8?B?clhtbjdRdVkzMVU3SVZRaGRHOENiakRSNktmamhwNDVuL1ZZL1V2bitybUdG?=
 =?utf-8?B?emFqS0Fucm5BdE1CRmkrQXczbEVXYWpFOVJiWVRTSXRlUjhGejhjaXN0SDJm?=
 =?utf-8?Q?imNcVRELdxAOW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVgraGlIUVU5ZjZVK1puZTNQbHlKQVIvYWdvWXZQblh3cWwvREVrNXo2c3VX?=
 =?utf-8?B?UnZPK0VabDB1enRGVHpxMVh1ZEZ3djUzWDRYUkVnTnFITWJNcXViVWFwcjVw?=
 =?utf-8?B?YUo1OHd1d00xVGdBOTBFc1NRUGU2N2ZRVGJ3UFI4MkNyQTJOc1Q0MEdXbytK?=
 =?utf-8?B?Q3h4NmNaRnNtUU5Rck1IeEpCN3RaSzBWdkdzckkyTmZZbllEOHFxb2dYZjRC?=
 =?utf-8?B?KzV3N3hKS3Npa2NGS0xyZE9Zd2RlMzFiZVFoNDlxTDdXdDRBQU9rcEdSTXVW?=
 =?utf-8?B?T2tGcUpEUTlmZ1BDRDgvNUptSGJPMFgzWkFIQVFPRW9oZktrVFZ5TTBGVVZN?=
 =?utf-8?B?RUZUTGlwQXdaT2R1bmg3N3pGMlRPczdhQ0xVWHg0QnY3d2xyeE1Fekgwcnkz?=
 =?utf-8?B?bVNMZEw5L2FqWUc3cVJtcFJQN3k1dmI5NFhFYXJHazI0NDY4TEdGWUJncVU0?=
 =?utf-8?B?REs3bzBsVWJPTThseE1GQ1V4aGIzTnF0aURvUEtNWktKd0d2eVZQR2VvemxZ?=
 =?utf-8?B?dERIMEp3OXc4ZXRyYkxjaUNhRUNaM0tGTjFpbVVBUEY5eFlpWGhhdTNaS1ZU?=
 =?utf-8?B?WVBMY001aTZaRlI5cmNJbm93dnJQYlVYYmd5L0NPNis1c1lzV2VYc3ZRbGU5?=
 =?utf-8?B?ckFab1l0RUhtM0VqSjhhOEhJYkxtN2dhdGgycXdYdWlyUm5Bc2pDZFpiWTFG?=
 =?utf-8?B?Z3dzUThIY0VlMFYxSnZKWXM3dmZxbTI4TC9VMXlSeFFkOVZVczBtSXo2Yk5D?=
 =?utf-8?B?UWU2MncyK2RMTnRSa1JnYkZVQUNoaG9LRXVMZU1xeXRFUTVxVlBNeGlzY2F4?=
 =?utf-8?B?dXBXa3k3UjNDVjJCTkFUWENod0FhM0tHbTkrRmg2bml6NFU4bTdaaEFQaHdG?=
 =?utf-8?B?cElHb1MxTTNaMXlkU0FENC91RmhEc1dsWWRWSmNRQjNCWjZ2d3Y0SDZmUHow?=
 =?utf-8?B?N1BRYUZYV3I3NEM5UkUyb2wrZ2ZMQWF5aEhEeUppUnRVSHJZelU3NnZ6a29T?=
 =?utf-8?B?NGxsQUtXS2l0dzdxYUNrbXVOUWc4ZzJONHlTckw0YkRveVcySUt3bWNNZUxH?=
 =?utf-8?B?YWt5RWhZdStrckYvazFyeEZETmhCV2xzUGdJMGFIcThTQjV6d1V5YlBZdFFL?=
 =?utf-8?B?OFFaOHRvQ1ZzS3ZvK0lROHpzM1pZTmpORzYxNEJpL3pmWm9iVjRlWVcyaHpN?=
 =?utf-8?B?ZjlxaHZ2VThVaFA1ekxKVDhkZWZBMjIwTENpRGQ2NTB3OWVuaTljK2dsZnNV?=
 =?utf-8?B?SVltbFd3MVZ2by9sMC9LLzVRYWUvRmdxR1BFSUZkcUdITlRMK2J1bTFFYUsx?=
 =?utf-8?B?V0lzU1oxdjYrSStQUkY2dmk2aElVeW5hb2VNMWZXdWNtMnllVHpEQnRHWFRa?=
 =?utf-8?B?VDFCZTZYNHRJRWYvNEd1RzRiNkJDbk5DdmVMK29mODc0ZVJpRm9qb1lPWkh2?=
 =?utf-8?B?N2wzbkI3a2pUdG5TaWthb2lSUURqSlFtRU9zaTlOK0JZaW5OSGlSM20rQjN5?=
 =?utf-8?B?V3owdEh5a0RubzNrLzBNT3FNZkNvWk10V09qSmxGaFh1N2pFb3hoUUpzNU9W?=
 =?utf-8?B?KzAvbXU5QlN6Q1FZRXNjemZpaTIvT1l6NTFYVE44UE85NGNPVjVYMzd0RHN4?=
 =?utf-8?B?YWM3VDUwelJoRGV0RkJzN1ZBbnUyUzd6TVR3dHl3cnYxYmZJZzN1NStnOEJy?=
 =?utf-8?B?dlRrSHh2THR3TjJUQUtibHIyTFNLeTIydmVHSWwvRVZWQXRXRGZCTGg0UU9B?=
 =?utf-8?B?dkZmbW5UWWQ3RlZ5SkVScHoxdWg0QlZMZTZxczRTN0E1UThZbG1OZU1tUHIv?=
 =?utf-8?B?cGJHeENBc2V0Q2NzZGFSSytnbEJCa1dnVHJ4b0Vtam52Y2hEZFJaeUViQzlS?=
 =?utf-8?B?VFNPdFR2SkhLUnA3VG9XQTdVM3lSYlhKUjNEQ1RqZnArL0JwdndUd0MraUJu?=
 =?utf-8?B?T0M5eTlxS0g3MTBjRW13R21JZ0RGamRKVjJ1bjY4cUNzamVVN3lrWjRMQ3o2?=
 =?utf-8?B?R0pLVDhBbEducVBsWnhJcGpmU3lvNFBnUndoS1JsR1dZNHc1bG5MMmhXRHVM?=
 =?utf-8?B?L1pBOUFOdkx6OVFhK0FJMGFtRUd2aU8waWVHUkhKY3U4bXhONVJOZHQ4N0wv?=
 =?utf-8?Q?MULqI8qGx2vKEaOfJCyVfSa6A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd6aa09-b1fe-42ea-c3cd-08dd4c5b2dec
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 18:21:05.4491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Rg5h7QKl23tS5ixhxjWcGnk6cNEgouyBWm6ZMK2Ga3wLJPFUCfGc/kUwW7Wt/i9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6262
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




On 2024-12-19 23:33, Alex Hung wrote:
> This adds support for a 3D LUT.
> 
> The color pipeline now consists of the following colorops:
> 1. 1D curve colorop
> 2. Multiplier
> 3. 3x4 CTM
> 4. 1D curve colorop
> 5. 1D LUT
> 6. 3D LUT
> 7. 1D curve colorop
> 8. 1D LUT
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
> v7:
>   - Simplify 3D LUT according to drm_colorop changes (Simon Ser)
> 
>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 100 +++++++++++++++++-
>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  19 ++++
>   2 files changed, 116 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 54ec12c1352f..5e8c5c0657c4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -1282,7 +1282,8 @@ __set_dm_plane_colorop_multiplier(struct drm_plane_state *plane_state,
>   static int
>   __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
>   			      struct dc_plane_state *dc_plane_state,
> -			      struct drm_colorop *colorop)
> +			      struct drm_colorop *colorop,
> +			      bool *enabled)
>   {
>   	struct drm_colorop *old_colorop;
>   	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
> @@ -1310,6 +1311,7 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
>   		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
>   		tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
>   		__set_output_tf(tf, 0, 0, false);
> +		*enabled = true;
>   	}
>   
>   	/* 1D LUT - SHAPER LUT */
> @@ -1337,8 +1339,88 @@ __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
>   		shaper_size = shaper_lut != NULL ? shaper_size : 0;
>   
>   		/* Custom LUT size must be the same as supported size */
> -		if (shaper_size == colorop->lut_size)
> +		if (shaper_size == colorop->lut_size) {
>   			__set_output_tf(tf, shaper_lut, shaper_size, false);
> +			*enabled = true;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/* __set_colorop_3dlut - set DRM 3D LUT to DC stream
> + * @drm_lut3d: user 3D LUT
> + * @drm_lut3d_size: size of 3D LUT
> + * @lut3d: DC 3D LUT
> + *
> + * Map user 3D LUT data to DC 3D LUT and all necessary bits to program it
> + * on DCN accordingly.
> + */
> +static void __set_colorop_3dlut(const struct drm_color_lut *drm_lut3d,
> +				uint32_t drm_lut3d_size,
> +				struct dc_3dlut *lut)
> +{
> +	if (!drm_lut3d_size)
> +		return;
> +
> +	lut->state.bits.initialized = 0;
> +
> +	/* Only supports 17x17x17 3D LUT (12-bit) now */
> +	lut->lut_3d.use_12bits = true;
> +	lut->lut_3d.use_tetrahedral_9 = false;
> +
> +	lut->state.bits.initialized = 1;
> +	__drm_3dlut_to_dc_3dlut(drm_lut3d, drm_lut3d_size, &lut->lut_3d,
> +				lut->lut_3d.use_tetrahedral_9, 12);
> +
> +}
> +
> +static int
> +__set_dm_plane_colorop_3dlut(struct drm_plane_state *plane_state,
> +			     struct dc_plane_state *dc_plane_state,
> +			     struct drm_colorop *colorop,
> +			     bool shaper_enabled)
> +{
> +	struct drm_colorop *old_colorop;
> +	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
> +	struct dc_transfer_func *tf = &dc_plane_state->in_shaper_func;
> +	struct drm_atomic_state *state = plane_state->state;
> +	const struct amdgpu_device *adev = drm_to_adev(colorop->dev);
> +	const struct drm_device *dev = colorop->dev;
> +	const struct drm_color_lut *lut3d;
> +	uint32_t lut3d_size;
> +	int i = 0;
> +
> +	/* 3D LUT */
> +	old_colorop = colorop;
> +	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
> +		if (new_colorop_state->colorop == old_colorop &&
> +		    new_colorop_state->colorop->type == DRM_COLOROP_3D_LUT) {
> +			colorop_state = new_colorop_state;
> +			break;
> +		}
> +	}
> +
> +	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_3D_LUT) {
> +		if (!adev->dm.dc->caps.color.dpp.hw_3d_lut) {
> +			drm_dbg(dev, "3D LUT is not supported by hardware\n");
> +			return 0;

Should an error be returned instead?
-Leo

> +		}
> +
> +		drm_dbg(dev, "3D LUT colorop with ID: %d\n", colorop->base.id);
> +		lut3d = __extract_blob_lut(colorop_state->data, &lut3d_size);
> +		lut3d_size = lut3d != NULL ? lut3d_size : 0;
> +		__set_colorop_3dlut(lut3d, lut3d_size, &dc_plane_state->lut3d_func);
> +
> +		/* 3D LUT requires shaper. If shaper colorop is bypassed, enable shaper curve
> +		 * with TRANSFER_FUNCTION_LINEAR
> +		 */
> +		if (!shaper_enabled) {
> +			tf->type = TF_TYPE_DISTRIBUTED_POINTS;
> +			tf->tf = TRANSFER_FUNCTION_LINEAR;
> +			tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
> +			__set_output_tf(tf, NULL, 0, false);
> +		}

Is it possible for an atomic state to have a 3DLUT colorop_state, but not any
shaper colorop_states? For example, say a previous commit enabled the shaper,
and the current commit enables the 3DLUT without any shaper updates?

If so, `shaper_enabled` may not get set to 'true' by
`__set_dm_plane_colorop_shaper` for the current commit, and the previously
programmed shaper would get overwritten by this logic here.

If this is actually an issue, inspect the current shaper state -- if a new one
isn't there -- should work.

- Leo

>   	}
>   
>   	return 0;
> @@ -1467,6 +1549,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>   {
>   	struct drm_colorop *colorop = plane_state->color_pipeline;
>   	struct drm_device *dev = plane_state->plane->dev;
> +	bool shaper_enabled = false;
>   	int ret;
>   
>   	/* 1D Curve - DEGAM TF */
> @@ -1506,7 +1589,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>   		return -EINVAL;
>   	}
>   
> -	ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
> +	ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop, &shaper_enabled);
>   	if (ret)
>   		return ret;
>   
> @@ -1515,6 +1598,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>   	if (!colorop)
>   		return -EINVAL;
>   
> +	/* 3D LUT */
> +	colorop = colorop->next;
> +	if (!colorop) {
> +		drm_dbg(dev, "no 3D LUT colorop found\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop, shaper_enabled);
> +	if (ret)
> +		return ret;
> +
>   	/* 1D Curve & LUT - BLND TF & LUT */
>   	colorop = colorop->next;
>   	if (!colorop) {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index ec94ff887886..e03e6044f937 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -49,6 +49,8 @@ const u64 amdgpu_dm_supported_blnd_tfs =
>   
>   #define MAX_COLOR_PIPELINE_OPS 10
>   
> +#define LUT3D_SIZE		17
> +
>   int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
>   {
>   	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
> @@ -145,6 +147,23 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   
>   	i++;
>   
> +	/* 3D LUT */
> +	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!ops[i]) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		ret = -ENOMEM;
> +		goto cleanup;
> +	}
> +
> +	ret = drm_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
> +				     DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL, true);
> +	if (ret)
> +		goto cleanup;
> +
> +	drm_colorop_set_next_property(ops[i-1], ops[i]);
> +
> +	i++;
> +
>   	/* 1D curve - BLND TF */
>   	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>   	if (!ops[i]) {

