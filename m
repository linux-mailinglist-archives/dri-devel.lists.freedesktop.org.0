Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD730C9B5C5
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 12:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256EC10E631;
	Tue,  2 Dec 2025 11:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Db7QUEz1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010023.outbound.protection.outlook.com [52.101.85.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755BD10E62F;
 Tue,  2 Dec 2025 11:50:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hTkgXNVBSXw1gTTyfRZfNntPPcULoKj2p4W5VWsku2AzNtYkOWadxQSh/O58IA5TdTYpmz7zEo44LxO/N9E/7J5dRIQPYdn4Pn0ZEAxZe+H6tsHRpirkDUEuje+1v6Mheru+qx0irTuTsJC/3F4MY0RaaReSxHPCKWiKp0BabXNZlycFUNEVckuF0Q8e+3FT+ukd9vmGlQL+wGDhkI6Q/nvD5SLOkPOhbFMhjCtCqtyKqoQ7g+X4AGvpN+5kLjNg8FG6yXpbwV+f/bozGHaeBgpovDWItlzQ/skLEsVq8DorSLFifquHP3a5DCts6gqRStMj2cQDN54vwyHPybDuQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDdGEYmqNYELQr+G5yvy7NeWyaMhgqA2F5Zd0mrWfmM=;
 b=hbVmFUtZdIxO+/Y39iDQXBk+KkMfK54bjsRLnswvCBswLv2SW2VxIg7OIVYK6q4n5wkQOr9iGDXnHqw/W9rxg8c0WbjcNpipfxN5ynA+14jOTVjgt1Of0miwNUkmiMtjXb+oE7ZTEGfCs0U8N8Vle1uYgktPjdIVOWXfxKOyspb4wMRLEkBMbBTIztDh/+zCI7ynoeT1kmMDtd+qFlGndyOVTavpA1ou6NkthuA0KaSQhRXsm84u6qga1urxZPkYYNByX0quf04wxKPUUMTNYRqxOuNooWsDt/yaNoDDBt9u4fpLb0kFQ1DBRYw9XsEOVldQQ7qIGtq1ZxauYpYutw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDdGEYmqNYELQr+G5yvy7NeWyaMhgqA2F5Zd0mrWfmM=;
 b=Db7QUEz1WikP1SVguEFeQbgmTsTHU5ne2VttLHTwE/Vfzxe13OOU5o84+WklrNJzqTgDTNhjsRhFIBNAziWwYTbcIX+It5uuzNCkPRRCR0lq8zBzrgxbTZr7UO5yFU8Wq02qzyWQMVB83AUHSVpyy7u1IgJKm87/Nt/JtA0wDcs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB9007.namprd12.prod.outlook.com (2603:10b6:a03:541::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:50:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 11:50:47 +0000
Message-ID: <201d5bb8-1711-469f-b571-29cb578660fb@amd.com>
Date: Tue, 2 Dec 2025 12:50:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/13] drm/amdgpu: remove
 AMDGPU_GTT_NUM_TRANSFER_WINDOWS
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
 <20251202094738.15614-8-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251202094738.15614-8-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::14) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB9007:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e07c9bb-d27c-40cd-bae5-08de31990823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEhGSlBLS0pCRWYwR3BEZWdzeStSQUl4WW1FbERKSGxoYSs1NEpJYldMMHZv?=
 =?utf-8?B?ZlNSZm1naDQraGZBWEN1REFKMENNL2pvaE9wUVhibGZqWXYySHFmNGozUk5K?=
 =?utf-8?B?U2xmQWkwK3EvMTNraFYvSUJHemdBWTVMQlBZaVp0UU5NVkt2SDVWNWN2ZnZt?=
 =?utf-8?B?UUd2RjRKOFpDM2ZGRStmVGo3Y2lQaTRhdENGNWM1N0RXWmQ0cHNTSUZTUUx4?=
 =?utf-8?B?L2NlR1FaVmJnZEx0REVGRUdLRmhPa2djVXNSKy9pK1JQMjBJZFJXc2o5R2JK?=
 =?utf-8?B?cmo5NUJPeG1GVkl0SktqOHN0UEFmQ0FiSnV5WXNlTXd0RlVFRXNzdkw1ckxX?=
 =?utf-8?B?SnhQMTZOcmc1Y0lkSXcvM0Y5MXU1eTF3VTFMNU9jNnA5ZmVDa2poYkVFZ1JB?=
 =?utf-8?B?V0gvT25XOGxVNTZseDk5VmdoWFN4aHQ2QmhIS1VENUFua0xSbmhjcWxGWk51?=
 =?utf-8?B?UWpnQ3VWNGRxM0pCOXBPbjVDVFY0YzVLYkRDZ3FmaU1Yais1WVdIWlpmdnY4?=
 =?utf-8?B?NW5abUpGMXJuM1NZdkZUMTdCZ0tUV3h3SFRJa3JYOGdDTmI4Y3FZcVlwYmh5?=
 =?utf-8?B?VVNQdWdTTHJnNm4rVnRCSEdtdisyUGRicVRZQ1V3NCtTYVpJdlJTbWhpbW5z?=
 =?utf-8?B?T0UvZVZkd2FvaFVrc0ZOWnhmRGxOQ1VCNWtHU1p0YVZoWXRKZ0paN2pCb1NS?=
 =?utf-8?B?aHBZYkt3WEVud2JEd01lWUtGT01wMHQ4UHlDK2VUUnB6QmpDS0pHOTlvVXNz?=
 =?utf-8?B?bVY2bzdwODRwYjR4bWdKdkNNUm9LNG9uSEdiaGsvNlZhQkttdHZ2dkp5R1pG?=
 =?utf-8?B?cUJGclRlTHFuVkVwYzZlM3Fhblh0RzJWNDIrVy8xRGJBcVpINE1BMWhBL3l3?=
 =?utf-8?B?Z2xNakhXd3dYOTJMTDdWRFRPVmZ3RFpqaUY3bkJOOGRBNkpTcnVBQW84KzIy?=
 =?utf-8?B?aTlXV2xQU3lqMFFDVzNJTmVaTzhIZng2NnVyT3JzZlFXN2RaV2diUWRWWTVp?=
 =?utf-8?B?QVlJYkkyandvd2pFMWVoMHhmVHpRY2Q1WGtRbWZ5TXJYd0lPNmhMYWhoc29R?=
 =?utf-8?B?WnA5ektETGZSVExOSHFNd25HOE9JemlSN29IUFNQcnp1ZnBlM0wzTGFjdWd6?=
 =?utf-8?B?RjQ4M1ZvMEJVMkVRWHYrMzVYNjFNN0gxa0J0SGhpMm1NQmp5NStvVXAxT0o0?=
 =?utf-8?B?T3lHUGpDUzNjbUsySktaRm4zVnhhcEFaRTVuUXEzYW9EcFFTYndTMWkyWXVW?=
 =?utf-8?B?S3B6U0tmZlJQZVdpMTZYdENkVjJLeUFWRXJ3NCtpL0RzYndralpjOEtiUU1L?=
 =?utf-8?B?c3E3ZjdLMG4zYWUvWFBKT0t3amVrWFFVTTVMNW0xbmhiSHBMNGtTTi9yV2VI?=
 =?utf-8?B?dUdjVXlmNThNYXpwTHI2ZXQ4RFdVSENyeFV3dVR2ckc0SGdPTDN0bldqOWk2?=
 =?utf-8?B?QnhSL3Njcml2aVhrOTZKTWc4eTdUVTE3anhwS3pPSnlvK2RIZDg3VVo0UHZ4?=
 =?utf-8?B?Vm5EOUx3cW43MVl0NTBHaWJHdnBPdHkxQzNZSFRjNjB3OGc0aXZYaFh3NUR1?=
 =?utf-8?B?c25xbkQvUmxEZVhHUkpwS2s5WkNlNkU1aStpT1ZNZTZVOWtobDQ0cXRUdnZN?=
 =?utf-8?B?QktzUVZLa0Z2d0FnVndyaVpQWlIyTFJZLzAwYy9TUEtWRG84bVppWFgyTXAv?=
 =?utf-8?B?dExhV2VheDZLa2RaSEp4UURxUTZOaFRObFVKa09XU3NzQW9DMFpGVDlibTFw?=
 =?utf-8?B?MEZleDN0QjBvY2JjeGZpa1MvcHVEdFZvOE9CSURrbTdxVzV3aUxkR0x4RzdD?=
 =?utf-8?B?ZnVxTE1IaDNMd3h5S0c2TDBpQ1M5ZFh2aHJIYlZSeStJTEh3WHkxZXJWS1px?=
 =?utf-8?B?cW82TXhtVkZDNmZ2ZGdrRFZNVDMwM2FwdlJNdjRMQ2lSbE1YTkJ1czg3aWs2?=
 =?utf-8?Q?fEItkTrnxR/PikF3YFgsQmI5r8+HVfCk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YS9QREt1c0ozdjdWR1FSZlNMKzN6Vm1jRm1wVUtySDBOaUZPbmtwcENLS3BL?=
 =?utf-8?B?cE92Y1hUYTRlczFsY1BHUEpMNCttakNrenBSVXZWSWtSV09QZFlSaEhRNXhY?=
 =?utf-8?B?dVFKMzQ1U1M3dE9scmpKZTQ3R0l0S2h5YVRwOG1jVVBWd3JEcmdXR29KUGdl?=
 =?utf-8?B?aFhPbDA5MUFvaGhTV3daSlNZMW8yRThxbWtBVzI3d2FJL2p0bzRPSmJMQnpH?=
 =?utf-8?B?aGNaNlMrSGRxbmV4U1VNM3pFSTRNa2RTdUpqdWprNmp5bmhtcVJnZEdDN1dM?=
 =?utf-8?B?VXhjLzJSd2pNcEVKL1hidnhkaVpxUFE2aHVjU0dZZHhyK1UwU3p2MElGQThi?=
 =?utf-8?B?aWFCb1NVczdnQ2VXRzM2MDBEaXl0ckhxcU4yN0tlOUtVY09Qci9pNGg1Umww?=
 =?utf-8?B?RU9YVGVyeGxyTldUd0JsMnNTbnllZ25vWDVwN3ZxQ1FXMXhSN1VsVWlSMU16?=
 =?utf-8?B?YXBHQ1FDQ20wVlUyOVlOczE5UFdZWVRwTDY3dWhGMmlFU3VSZ2FJdmQrN3RQ?=
 =?utf-8?B?bjlPWUt2Yi9NTzdlaCs5NHREUks5eENpWmtTS011TDl0TDRHdSt2ZGY5TStZ?=
 =?utf-8?B?anpQN2MwdjQvcEVKWnYxYXNTbDljcU1JVVloWkthV3E0MVJYbERJTk5DREQ5?=
 =?utf-8?B?M3Z6bmdnRnFXWTBLY25qTHlCS2prd3F5c3VTYjduRENFN1ZFQUIvOWRGNXhN?=
 =?utf-8?B?VGREWmdXbDVLeXV4eWwrR2lFcjNyQWNpc3F0cjN1RGFMRFNNZTczeHd1ZlJp?=
 =?utf-8?B?dUNHY29JVXYyN0hibTBMRU9ETWNaYUd0K2pQMDk0NHcwSzVFZndVNFdNMno0?=
 =?utf-8?B?QktOY3d3emoxa0dBaGJrVVVCWWxtVXVQVW1iQXZZd292ZVhNOTk5dFZudTlG?=
 =?utf-8?B?blZMdmw5TlpWRTlicnljd2QwNmQvOXd5VjZFSjJuTkF3dWNWbkJOaWd5U0NG?=
 =?utf-8?B?VkhqNXZpeFBuYmludExKSWtCUk0xdEZPV1A1bWlhdVFCSmFKdlJUTmM5bG5L?=
 =?utf-8?B?R3cwYXJWL3Jsa0JGZ2pwUS8vTG4rSlMreGtNU0hYcmRHbjFOY3dQaHpUdGEv?=
 =?utf-8?B?Tkxad2NROFZaZmJvaWxRTDMydnFvR1AzR3VLNlJMbkUyV001UUMvK0NoTU5G?=
 =?utf-8?B?TWJMOWErMmxrZndEak01ZnNQUWhHU3o0dCtDOFg4TERtRVFuVjk5UWErcHpq?=
 =?utf-8?B?WDRrVmFoVDhUaFgrMEwwbS9pVzdQREF5VUo1Skp4MVdWR2JkQjArZ1FSV3V2?=
 =?utf-8?B?RXp0dlZ2VHdCZ205emF6WHhrZTJPcVdqVUcrQUhDSUI1dnd0RHdCZE42Kyt2?=
 =?utf-8?B?ZUhFUEJxZ0M2SFl6QmJEZ3RQMFBtQm4ydnhPMW1LZk5QUGxPS1hKOWN3Tllo?=
 =?utf-8?B?Q0JxR1h2R3MwaERtWlBnODZJTXZuOFd5OWtuOWcyb21uQ3kvSUFydmgrUmw4?=
 =?utf-8?B?VEJZZXRqNG1BUWRNSWJ6Yk44eVBydGpCRVFDdC9UMnRPUElpNm9JaDFwcTVJ?=
 =?utf-8?B?SG9PYkdPM3ZPWVI0VjRaOEVON0JKbHRUU05BcFRhallOSzNRdU1lZFpUSDNE?=
 =?utf-8?B?SkNHMkdjZkROdFRtTm1Qdm16Tlp5SitOajRPSnRCUUs4SGRYbHRYNnB5TS92?=
 =?utf-8?B?K0ZudngxQzNMU1RZQVRaZjQwMXo4eW1tbTA3dmZXbmd2dnBRaXhoQ1ZrZzhi?=
 =?utf-8?B?MjdZQkRvMW5CVHBUc0dqT0QxTXV2cEhsRlJkWHUrRXd5N09lb254c3hBTDMw?=
 =?utf-8?B?SUs1K2pLMVlucDNOSU9BZ0pPWVdDSTJsNTVWT21oSGZ5aEc0NGpoZytPMkdX?=
 =?utf-8?B?SExHVFhXVFFvczQreDdDbm5vT1ozK2dCWDBRUFVOdGJHcnQySlVBc3ZGREZU?=
 =?utf-8?B?eDdUV3R0c0JVdXk2VWs4RGZ6MW5kRU84YnpmMnlheVNKbS9UMmdzU1NoeEM4?=
 =?utf-8?B?WHhNWmxPeUJDNE5UYVlSTnhSKy9oZGtEQW1vQUs5ZW1GZzJnVUdtT1V6QUNE?=
 =?utf-8?B?L1NmTzI0YjFIV0E1RG8xZlA4b0F1SmpNckhPQ2RBY2JUL3NqaEZHS25kMlBQ?=
 =?utf-8?B?R3hibEFFMHduc3FlOWg0dEkrUWk2SWR4RzZJMDhFemEraysycEY5dFh3Nzkz?=
 =?utf-8?Q?yuDsSY6L8MDCrzNEDY63DIixJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e07c9bb-d27c-40cd-bae5-08de31990823
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:50:47.8429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bh5zf6zajEoWWbSdk7vNM0+BCWO78XarT3Q/p3Srvm4CwZxbva1c1xGRfE+TtbGZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9007
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

On 12/2/25 10:47, Pierre-Eric Pelloux-Prayer wrote:
> ttm is going to use a variable number of windows so we need to get
> rid of the hardcoded value.
> 
> Since amdgpu_gtt_mgr_init is initialized after
> amdgpu_ttm_set_buffer_funcs_status is called with enable=false, we
> still need to determine the reserved windows count before doing
> the real initialisation so a warning is added if the actual value
> doesn't match the reserved one.

Yeah, the problem is that we need to initialize the SDMA first to figure out the actual number of windows we are going to need.

E.g. it can be that some SDMA instances are harvested or something like that.

Please move this patch as far as possible to the end of the series and let's sync up on teams on how to proceed.

Thanks,
Christian.

> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c |  8 +++++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 21 ++++++++++++++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  7 +++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     |  6 ++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h     |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/vce_v1_0.c       | 12 ++++--------
>  6 files changed, 32 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 895c1e4c6747..924151b6cfd3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -269,10 +269,12 @@ static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func = {
>   *
>   * @adev: amdgpu_device pointer
>   * @gtt_size: maximum size of GTT
> + * @reserved_windows: num of already used windows
>   *
>   * Allocate and initialize the GTT manager.
>   */
> -int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
> +int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size,
> +			u32 reserved_windows)
>  {
>  	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
>  	struct ttm_resource_manager *man = &mgr->manager;
> @@ -283,8 +285,8 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>  
>  	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
>  
> -	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
> -	start += amdgpu_vce_required_gart_pages(adev);
> +	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * reserved_windows;
> +	start += amdgpu_vce_required_gart_pages(adev, start);
>  	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
>  	drm_mm_init(&mgr->mm, start, size);
>  	spin_lock_init(&mgr->lock);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index d3d0419397c5..5e40d47398a4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1906,6 +1906,7 @@ static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity
>  int amdgpu_ttm_init(struct amdgpu_device *adev)
>  {
>  	uint64_t gtt_size;
> +	u32 reserved_windows;
>  	int r;
>  
>  	dma_set_max_seg_size(adev->dev, UINT_MAX);
> @@ -1938,7 +1939,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>  	}
>  
>  	/* Change the size here instead of the init above so only lpfn is affected */
> -	amdgpu_ttm_set_buffer_funcs_status(adev, false);
> +	reserved_windows = amdgpu_ttm_set_buffer_funcs_status(adev, false);
>  #ifdef CONFIG_64BIT
>  #ifdef CONFIG_X86
>  	if (adev->gmc.xgmi.connected_to_cpu)
> @@ -2034,7 +2035,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>  	}
>  
>  	/* Initialize GTT memory pool */
> -	r = amdgpu_gtt_mgr_init(adev, gtt_size);
> +	r = amdgpu_gtt_mgr_init(adev, gtt_size, reserved_windows);
>  	if (r) {
>  		dev_err(adev->dev, "Failed initializing GTT heap.\n");
>  		return r;
> @@ -2173,17 +2174,21 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
>   *
>   * Enable/disable use of buffer functions during suspend/resume. This should
>   * only be called at bootup or when userspace isn't running.
> + *
> + * Returns: the number of GART reserved window
>   */
> -void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
> +u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  {
>  	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
> -	u32 used_windows;
> +	u32 used_windows, reserved_windows;
>  	uint64_t size;
>  	int r;
>  
> +	reserved_windows = 3;
> +
>  	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
>  	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
> -		return;
> +		return reserved_windows;
>  
>  	if (enable) {
>  		struct amdgpu_ring *ring;
> @@ -2198,7 +2203,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  			dev_err(adev->dev,
>  				"Failed setting up TTM BO move entity (%d)\n",
>  				r);
> -			return;
> +			return 0;
>  		}
>  
>  		r = drm_sched_entity_init(&adev->mman.clear_entity.base,
> @@ -2229,6 +2234,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  							     used_windows, true, true);
>  		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
>  							     used_windows, false, true);
> +		WARN_ON(used_windows != reserved_windows);
>  	} else {
>  		drm_sched_entity_destroy(&adev->mman.default_entity.base);
>  		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
> @@ -2247,10 +2253,11 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  	man->size = size;
>  	adev->mman.buffer_funcs_enabled = enable;
>  
> -	return;
> +	return reserved_windows;
>  
>  error_free_entity:
>  	drm_sched_entity_destroy(&adev->mman.default_entity.base);
> +	return 0;
>  }
>  
>  static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 6e04f80b6a75..2b9f143ab968 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -40,7 +40,6 @@
>  #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
>  
>  #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
> -#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
>  
>  extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>  extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
> @@ -135,7 +134,7 @@ struct amdgpu_copy_mem {
>  #define AMDGPU_COPY_FLAGS_GET(value, field) \
>  	(((__u32)(value) >> AMDGPU_COPY_FLAGS_##field##_SHIFT) & AMDGPU_COPY_FLAGS_##field##_MASK)
>  
> -int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size);
> +int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size, u32 reserved_windows);
>  void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev);
>  int amdgpu_preempt_mgr_init(struct amdgpu_device *adev);
>  void amdgpu_preempt_mgr_fini(struct amdgpu_device *adev);
> @@ -169,8 +168,8 @@ bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
>  
>  int amdgpu_ttm_init(struct amdgpu_device *adev);
>  void amdgpu_ttm_fini(struct amdgpu_device *adev);
> -void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
> -					bool enable);
> +u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
> +				       bool enable);
>  int amdgpu_copy_buffer(struct amdgpu_device *adev,
>  		       struct amdgpu_ttm_buffer_entity *entity,
>  		       uint64_t src_offset,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> index a7d8f1ce6ac2..56308efce465 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -459,11 +459,13 @@ void amdgpu_vce_free_handles(struct amdgpu_device *adev, struct drm_file *filp)
>   * For VCE1, see vce_v1_0_ensure_vcpu_bo_32bit_addr for details.
>   * For VCE2+, this is not needed so return zero.
>   */
> -u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev)
> +u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev, u64 gtt_transfer_end)
>  {
>  	/* VCE IP block not added yet, so can't use amdgpu_ip_version */
> -	if (adev->family == AMDGPU_FAMILY_SI)
> +	if (adev->family == AMDGPU_FAMILY_SI) {
> +		adev->vce.gart_page_start = gtt_transfer_end;
>  		return 512;
> +	}
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
> index 1c3464ce5037..d07302535d33 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
> @@ -52,6 +52,7 @@ struct amdgpu_vce {
>  	uint32_t                srbm_soft_reset;
>  	unsigned		num_rings;
>  	uint32_t		keyselect;
> +	u64			gart_page_start;
>  };
>  
>  int amdgpu_vce_early_init(struct amdgpu_device *adev);
> @@ -61,7 +62,7 @@ int amdgpu_vce_entity_init(struct amdgpu_device *adev, struct amdgpu_ring *ring)
>  int amdgpu_vce_suspend(struct amdgpu_device *adev);
>  int amdgpu_vce_resume(struct amdgpu_device *adev);
>  void amdgpu_vce_free_handles(struct amdgpu_device *adev, struct drm_file *filp);
> -u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev);
> +u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev, u64 gtt_transfer_end);
>  int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parser *p, struct amdgpu_job *job,
>  			     struct amdgpu_ib *ib);
>  int amdgpu_vce_ring_parse_cs_vm(struct amdgpu_cs_parser *p,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
> index 9ae424618556..dd18fc45225d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
> @@ -47,11 +47,6 @@
>  #define VCE_V1_0_DATA_SIZE	(7808 * (AMDGPU_MAX_VCE_HANDLES + 1))
>  #define VCE_STATUS_VCPU_REPORT_FW_LOADED_MASK	0x02
>  
> -#define VCE_V1_0_GART_PAGE_START \
> -	(AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS)
> -#define VCE_V1_0_GART_ADDR_START \
> -	(VCE_V1_0_GART_PAGE_START * AMDGPU_GPU_PAGE_SIZE)
> -
>  static void vce_v1_0_set_ring_funcs(struct amdgpu_device *adev);
>  static void vce_v1_0_set_irq_funcs(struct amdgpu_device *adev);
>  
> @@ -541,6 +536,7 @@ static int vce_v1_0_ensure_vcpu_bo_32bit_addr(struct amdgpu_device *adev)
>  	u64 num_pages = ALIGN(bo_size, AMDGPU_GPU_PAGE_SIZE) / AMDGPU_GPU_PAGE_SIZE;
>  	u64 pa = amdgpu_gmc_vram_pa(adev, adev->vce.vcpu_bo);
>  	u64 flags = AMDGPU_PTE_READABLE | AMDGPU_PTE_WRITEABLE | AMDGPU_PTE_VALID;
> +	u64 vce_gart_addr_start = adev->vce.gart_page_start * AMDGPU_GPU_PAGE_SIZE;
>  
>  	/*
>  	 * Check if the VCPU BO already has a 32-bit address.
> @@ -550,12 +546,12 @@ static int vce_v1_0_ensure_vcpu_bo_32bit_addr(struct amdgpu_device *adev)
>  		return 0;
>  
>  	/* Check if we can map the VCPU BO in GART to a 32-bit address. */
> -	if (adev->gmc.gart_start + VCE_V1_0_GART_ADDR_START > max_vcpu_bo_addr)
> +	if (adev->gmc.gart_start + vce_gart_addr_start > max_vcpu_bo_addr)
>  		return -EINVAL;
>  
> -	amdgpu_gart_map_vram_range(adev, pa, VCE_V1_0_GART_PAGE_START,
> +	amdgpu_gart_map_vram_range(adev, pa, adev->vce.gart_page_start,
>  				   num_pages, flags, adev->gart.ptr);
> -	adev->vce.gpu_addr = adev->gmc.gart_start + VCE_V1_0_GART_ADDR_START;
> +	adev->vce.gpu_addr = adev->gmc.gart_start + vce_gart_addr_start;
>  	if (adev->vce.gpu_addr > max_vcpu_bo_addr)
>  		return -EINVAL;
>  

