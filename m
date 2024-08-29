Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34396963FDF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 11:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A324010E099;
	Thu, 29 Aug 2024 09:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GNM4rxcz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1014510E099;
 Thu, 29 Aug 2024 09:24:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XK/Qj0HePir9rEjOxvL7v21mgflkPS6cc1N6jJ0PjKddxF0mTnsWnbYOjUtxWJRb6baSAhgF91RZTOdVaKmv8Cb5OnB0Rjo3hvM48+r3I17paDx9DLqOkkEY5c+cuKTat/xr31ANX+F3O5gIuot7wmqwO+2whCxR/31ysR+xeibsqhZiqOeF20U5wiTQFIRsIZOPeNKcfAotPui1QjaOYTjlJGb7PaDnCIkfXW1tBZDwGLLlCXSwpb13OVsUA71TPeUMDzlJpOdvivpXMAeqq5T238v1NZOw0Vp141XXNyszTst0J0WGomXWJOPa7ixHLn22qiimH8Ue9Ng/QhQxNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYh4EBY16iD6mMe4aTl/S3YwMXmEMyceI9IrZXRlTJY=;
 b=dn7dCdLjspckupPvCdgQYM82lA8cFBbzIBocccMNDrVsg2gvTlW8H1LVdCA8BVN9HFdoQai8bU6p3svnAn9eADkSFJFm9QLwe8k3bc7qylPjB7UnUdC2+PEY4jvyT7XalDWOL7tKiKEHrEtxTPmPiqKlu6rhW6GRkrYAIZn+BeaHxHkEm8bv4qn0HcJmWEMkmfW28ImWOrNprU50UpOQJ+5wIHjJ8ItZUSq2d5zXDo5Gbpe4hroR5REpl8mDDO7bIRDrSpXybSkuGoQGG/8vqWPjb4+Y7XcIBi0xtrnmM3DALrUew6aHrmy2VHea85tWucj9ygELc3dsO5aT5v3AeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYh4EBY16iD6mMe4aTl/S3YwMXmEMyceI9IrZXRlTJY=;
 b=GNM4rxczctdtKAA3lBFqn96O8xh6RffW5ehEOzn0bqafC0Cx5imDgrxOSHhronabftZ6Jl9f+mptFjagoh8hQUkG+9UdYxCf1PRgbI75jp2GLD4JLozklxyT+szTfUN9doC6dUipozQVPyYWFiIcfxUKsWRzbO6jD9h0d5NjX3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 09:24:31 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%3]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 09:24:31 +0000
Content-Type: multipart/alternative;
 boundary="------------Nx7X4Mlme455EWvH6nEamTSu"
Message-ID: <cbe8aebe-fcad-4ff0-8f56-146628183fd3@amd.com>
Date: Thu, 29 Aug 2024 11:24:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 23/28] drm/xe: Add SVM VRAM migration
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, thomas.hellstrom@linux.intel.com, matthew.auld@intel.com,
 daniel@ffwll.ch, "Paneer Selvam, Arunpravin"
 <Arunpravin.PaneerSelvam@amd.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-24-matthew.brost@intel.com>
 <Zs9LF-jnNrd9ZlxW@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Zs9LF-jnNrd9ZlxW@phenom.ffwll.local>
X-ClientProxiedBy: FR0P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::9) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|BL1PR12MB5849:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c3d5865-f586-4ac4-9390-08dcc80c637e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmh4VHJKNGZRKzQ1cHFEcy9ERDRLM3d2VTYvdUhSNkdlMTE1MUxNU3RObHk5?=
 =?utf-8?B?UDFJRVpUcWtyQ3NrOWg4N0JJRHFvV21GVWh3dXlLMlpEb0ZCS0lFSzRwUkVU?=
 =?utf-8?B?d21lL0Zrd09HRVg0ZWVKV2RnVEIzaUcrc1BQQVhYc3EzZ1RuaElZeWZ6dzBx?=
 =?utf-8?B?bFo5UWN1azRPRFN5RXZXN2VBZGlDeWp1SHBHQUZQdUJzM3QyVHdadTZmSFow?=
 =?utf-8?B?cHhYWWNqRFRIa2ViWVYxK0pyeW1xTGNCTmNzbDlLOVBkNTcwbFEwamlyUHN3?=
 =?utf-8?B?QTYvQXBVcGUzRWZHMWJkVnREZUNXbkkrN2xUMW9iN2lLZ0lYc3N0bGN4aG5u?=
 =?utf-8?B?V3o3bGRFdnB2MkNOd25SbHViMlg1ME52SW1yc2Z2bU05emUrRWtkaFNYbFpP?=
 =?utf-8?B?andhZjNoaC80WTBIb0pwdW0rMDd6V3p6K2d0eVpubTI0MFZEdmhIdFl3cHQx?=
 =?utf-8?B?dmR0VFRTcWdkMk04ZUdJbG1xVlhDa1hxZnRTSnp4QWVPakp3U0dDR2lQUmpN?=
 =?utf-8?B?L2JrVzJhK1k4azl1b090WWdydkNTT3JZbyt4R2ZsVXlrMGZnY09ORVRWQWcx?=
 =?utf-8?B?RXp1YzFiN2tTRzNjWUY4bURQMXdzajFtdE5UZDFMYWZOWk1yT1ZFR0VOS3hR?=
 =?utf-8?B?SEkvREtkVWZmNkRySEdQLzlFWmh6Um1EZ3FoUDlFdUkvVlE4d25TU2ZXSE1X?=
 =?utf-8?B?aHI3KzNjU3dHSFUxRzlOZFMyMjBVdGx6b0hJWFhMbWtiaVdXeFQwWGc1Wmgr?=
 =?utf-8?B?YlFZT3E4NHIxSE1sTHgxUVYwWmVwS3JRUUZIL0pEVmVta05zdkJHSWdVaU5m?=
 =?utf-8?B?Y09pdTFDQUo3cDd3cWt2UXhIYUJvRG90cjhmVlZva3cxK0EvSmp4ZHpJVHlt?=
 =?utf-8?B?bE81dU1ZdktwL0FZVExSQzhjalQxc0x4NTIxajEzTVhVY1B4K2NESU1wSk41?=
 =?utf-8?B?UU1vM21YbDNNcTYySUF2d1c0UHYwVW1heHQ2T25QWHAxRWJuZGNHSEEwODIw?=
 =?utf-8?B?aGM5NjV3K1h2ajQwTFVVdUZHc2FrbEJINkt3bHg0V3NodTd6NjVNcERWQ0ZH?=
 =?utf-8?B?ckJ4M3hOWEh5d24wZ1I3Vjd6Zm5jQ3VGWUhRQkhqNFFKcmRYOGtYNTkyc2t4?=
 =?utf-8?B?NTZ0NEEzRHZDR0NkdlpqeXBUOHNITW81Znp2bVBSZG1wWGF5eUw0RXRLK0VW?=
 =?utf-8?B?dmQxT3dSTW9nWlRTVGVHdVBIUFRVOWYrTDRmVjhwZnphRGFtTEt5TU14M0Zw?=
 =?utf-8?B?eW8vU21Sdk9ocG9vRDdaejdaTndLZWl3YmlBS0o5aXkrRGM2akVaMjJTWklK?=
 =?utf-8?B?eWdVWDhvdlhCNmdvR3BmQ1dWaW5UWk1zYWo5YnZxZFdJQmwxSGNKMjBIWmdC?=
 =?utf-8?B?SmpxQUhZT1dMOTd2aDlybVlxSmZ4VnZqWU15ZFhxQUpaZnpLaVJhY3o3MC9P?=
 =?utf-8?B?N2pUNkp0d0NESk9oQzF0OWxTaUZzd3pMdzcxSlFTUG5LNGZBays3cnB6dy9G?=
 =?utf-8?B?N21wTU5tVnUxS3BsSUZ3ejI4aEQ4VU5ZZXdsSk1zVW1aTFNaYVZsYnlrT2xT?=
 =?utf-8?B?VjNETSs0VW9lZmVjZ3VaZXRlWFJEU2NxYXg5VUV4bzh0Yy9XVFdYSXhXb3Bh?=
 =?utf-8?B?eWQ1empaN0JwTjlESklFMTFiaWlnQ2hTUHMzZGFNbWhhTmMxYktvVnphZlRK?=
 =?utf-8?B?WUc3Ukx2ME9EK2RrZmVjSHdpejBmVXV2VHFjMGRhZEl1SkJLaElJekdOS3Z3?=
 =?utf-8?Q?3zXcAcuf2gGAecm0rA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2ZBd1VCWUh3dzJCUVljVjA5UG50U3B6QUJ4dXFOTlJkOG1HUEY1cG53YVR1?=
 =?utf-8?B?TE9SVHo5U0J4RURxWFVOMk1NMUVmSE1PRVA5VGdzV1VDRkMzZytVYmN2YnJn?=
 =?utf-8?B?RUVGdGhhZFVpOHU0VkgvSDZKWUJQbjNXZDN2bHpNUGF6aGxTaGhscm41SnR2?=
 =?utf-8?B?MlBjTWFwQ25jY1VQOTFiQkNmRUpwbjVKU1R2aTlycnpJcDNwdkxvVk1HOTB6?=
 =?utf-8?B?VThNZktwR2xaUmgxRUNxQ2laaGhSR1NtVTROSkVTNDNTdFJoOTF6L3p0M2pD?=
 =?utf-8?B?cjZlbE4xdFdLejduRWtKTWwvS0xCSU5SMVNvc3AwbnRlNE1ZL0poRDhUVEJ5?=
 =?utf-8?B?NnBpb3BOKzQ4bG1MclhOWEVBdndXM2hCclJ6bU5tWTJ4a0RTTHk4bUpuUmpu?=
 =?utf-8?B?M2ZpUGw4TmFkZ1VuRC9ndFJ2a0hXNkdVWVNuSDIvUThHVWcrVWZRV2pJOFhv?=
 =?utf-8?B?QnJCSDFGaUtRdzhLcVNRdnZuRlR2dkxQNDlZbzhYcFNJR2FKM1JnZ09pVnhh?=
 =?utf-8?B?U2FMVHAxcDd0cHE4ZmlqL1NmSkN1RmVnRmc5UmthLytEZVBsRTBSV3oxMktI?=
 =?utf-8?B?VlluZ3E3M2wvQklpSWgxVitwSllkU0Y4emtmbmVReExZR1Zac25KVkhRZ3lm?=
 =?utf-8?B?M0hhM1laNWN5ZVhZMlZ5bm1DMHFHenBHeDVFMFVMT1JxU3ZDN2lTV1Bha0tV?=
 =?utf-8?B?QWZ2amRUdmdhRVoySUMrWXdaZkZtNW9Gc3JZdFpLdk9VanhtK3MxVTRUV1Jn?=
 =?utf-8?B?bUprb0RQZ2NzRzJZUWUyVGJ2TG1ad3o0SGlVcW9BbUlTQW80eWZPY1FnSjIx?=
 =?utf-8?B?TWd6dlRoTnI5OUZaNFRtbEJKZlFydlFIY1lSdnkvVC92VXI0NEM3ZmJXWGYz?=
 =?utf-8?B?STlSNWhoN1ViZ3F5QTJ2anVmTkxlT3NPbEl1NGZwSTRNcTljRFZndkgrUHVw?=
 =?utf-8?B?SDFSeXJvZEZwampDcTVYS3FMNWxJYmFwVHhpVm90Si9EcXIweUpwZXlUZ3FK?=
 =?utf-8?B?Yy9yK0RxNWMvTyttUk53OVVSZUMyYW91cGRlamh5TnE0OHNIeXVTdjFPVkV0?=
 =?utf-8?B?K0YwR09Tc0hvNlBPbHdpTmNBSHNLVFNHLzVhYkVPMktDQ1d6eTdUdU5aNHdw?=
 =?utf-8?B?Z2crbkhXdUIyVWF4cjNjbE8xQldZMy9DVmovcXlxQUJxeGdCMjZjMElkZnd4?=
 =?utf-8?B?SlBwd0N0K2hEaGROYzBxUmpjcm5odi9zYkFsUFpRWXd3SW5VTUYwZE5pQXlk?=
 =?utf-8?B?MXBaOXQ4bVlKZE5TMm5vU3ErU3ZhaUl3V2wvbU9oRTk5ZklObHZ0YkdqOVFx?=
 =?utf-8?B?L2sxQjRSMXpCNi9KU2VIaHZnaXdhY0JUSlJ0aTl4MGgreGs2WFMza2ZkMDFi?=
 =?utf-8?B?NXVZdngxSXdTK3BWRkNoSkJRdkw5VDIrbjRjVkttVDJRSTN3cWx3WVlNMWVX?=
 =?utf-8?B?clJXMmhBaXFXOGJnZlhhRUl3a3MrSzJFWFYxY0pQdGhGZXRXNTFpd1d1OUk5?=
 =?utf-8?B?UXNUdlNhYXU5a0Qyazd2c3ZJVlJBVmgyK1A0NDB5a2VhOWVYNEtDbnU3S2pM?=
 =?utf-8?B?U0d1L2pxMmt2T3orZHphQ0QxU1ZONHRMQkE0QUQ1N1hnUUJDdHNrNURFSzI0?=
 =?utf-8?B?aGpqYXMvUC9Kaml2b1FlclpwZmJldlJvUVcxVStxN0tPTlNkTU9taHMvbHJC?=
 =?utf-8?B?dldMT1lkc1U5N1BaWUphOUtkVExEUEYyeVBIdU1GU3k1OUd5UTNTUStQdjY5?=
 =?utf-8?B?eFByOHhRU0E1WGN6Q05lendvTk8vc3VnUVRiMVYwLzNHRU5vUExBZEUwVDF2?=
 =?utf-8?B?bUNKdEVpWmkyK0NlRGJibmFiRjdDK2MwQU8vYU51bzFoUHlFSFdSR1RKcEVL?=
 =?utf-8?B?enUvN1FzMTQ4VlJXYU91M21DSjViQ2ZDam8rVlZuUmh3dGZBSWwxc2p2ZXlF?=
 =?utf-8?B?MytGTFF3YllDZ0poNFpBTXhSUjRvLzl4RGFuUDdjZnQ3WlBUY0R6L1hSdmxB?=
 =?utf-8?B?K2xNRGFKTlBKN0ZmaFZCcFBpK3J1S1A1YU9kM2tpUVk1Y0hCZUwxaVNCSG4y?=
 =?utf-8?B?Z1drOElyalUvRkRQTDZtVGJzWlRzd0w4L3k1ZmJnUEY5UmJ5V0dLdkVvSG14?=
 =?utf-8?Q?o5DYbiCpI1gakH/JEcrs9WuU/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3d5865-f586-4ac4-9390-08dcc80c637e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 09:24:31.6704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9ktt58jYaL5oxrFDY9CLnot3EWj11m1X4yA7nRi1X4JFhSurfEEIRu9NX/MCjwx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5849
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

--------------Nx7X4Mlme455EWvH6nEamTSu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 28.08.24 um 18:06 schrieb Daniel Vetter:
> On Tue, Aug 27, 2024 at 07:48:56PM -0700, Matthew Brost wrote:
>> Migration is implemented with range granularity, with VRAM backing being
>> a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of the
>> TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
>> SVM range is migrated to SRAM, the TTM BO is destroyed).
>>
>> The design choice for using TTM BO for VRAM backing store, as opposed to
>> direct buddy allocation, is as follows:
>>
>> - DRM buddy allocations are not at page granularity, offering no
>>    advantage over a BO.
> This one I'm not understanding.

Adding Arun as well. I couldn't understand it fully either, but maybe 
it's because the buddy allocator is more optimized for higher orders of 
allocations?

>
>> - DRM buddy allocations do not solve locking inversion problems between
>>    mmap lock and dma-resv locks.
> Which mmap -> dma_resv inversion? I've seen a lot ... I guess it also
> matters hugely which migration path we're in, i.e. opportunistic
> migration, cpu fault where we have to migrate or die, or when we run out
> of vram and need to evict stuff to make space.

Mhm I think the locking order between mmap lock and dma-resv lock is 
well defined since dma_resv_lockdep() was added.

>> - Unified eviction is required (SVM VRAM and TTM BOs need to be able to
>>    evict each other).
> So core mm handles this by just roughly equally shrinking everything.
> Seems to work, and it has a pile of object shrinkers, and the page lru is
> also split into page cache and anon memory.
>
> I think you need to put in more justification that unified eviction is
> required than just stating it, because a look at mm/ gives a very well
> established counterexample.
>
>> - For exhaustive eviction [1], SVM VRAM allocations will almost certainly
>>    require a dma-resv.
> So from the TTM side we need exhaustive eviction, or at least something a
> bit more exhaustive than what ttm currently has. Note that i915-gem also
> never really got to perfect exhaustive eviction, it's just a pile better
> than ttm right now.

Please define what exhaustive eviction should mean? I think I know what 
it is and I have been pushing TTM into the direction of solving this for 
years.

The last missing puzzle piece is to use drm_exec for TTM evictions, but 
apart from that everything should work now.

Regards,
Christian.

> Now if there's also SVM VRAM managed on a page lru, TTM exhaustive
> eviction is going to win because the shrinkers can only trylock dma_resv.
> So this part works. It actually works so well on the system memory side
> that if we're not careful we can trigger oom, because we're too good at
> getting at all the memory.
>
> SVM VRAM allocations otoh do not need exhaustive evictions. Or at least I
> don't see why, because the idea is that thanks to gpu and cpu page faults,
> you can always get out of a pinch by just trashing everything for a while
> and migrating the handfull of available pages a lot.
>
>> - Likely allocation size is 2M which makes of size of BO (872)
>>    acceptable per allocation (872 / 2M == .0004158).
>>
>> With this, using TTM BO for VRAM backing store seems to be an obvious
>> choice as it allows leveraging of the TTM eviction code.
> Except it requires that you hold dma_resv, which brings in all kinds of
> pain. And for eviction we really don't need a lot of synchronization, so a
> lot of that locking is not needed, unlike the case where we have a cpu
> fault, where we absolutely need mmap_lock and all that to make sure we
> fault in the right page.
>
> But for eviction we only need to throw out some pages, if we're not
> entirely precise with picking the right ones (or have no idea into which
> vma they're all currently mapped into) it doesn't matter. That's why
> migrate_device_pages doesn't care about any of that at all, it doesn't
> need to by design. But by bo backing memory you drag in all that stuff
> that's causing headacheds for eviction.
>
> The only thing migration tries to do is remove all pte, and if that
> succeeds, move the page. Specialized for the gpusvm case, looking at mm/
> code as cheat sheet, we need roughly:
>
> - reverse mapping structure like anon_vma. Except gpusvm can assume that
>    there's currently only one gpu side mapping, so we can just stuff the
>    gpusvm an va_address into the page, and protect it with the page lock.
>
> - we need pagetable locks, so that we can manipulate pagetables (well
>    specifically make ptes invalid) without taking any other locks.
>
> - everyone else inserting or removing ptes for svm mappings also needs to
>    lock the page, or we have races. This might be the hmm_range_fault races
>    you're seeing when allowing vram pages, since I don't think there's
>    anything else stopping the page lookup otherwise from succeeding.
>
> - we might also need to stuff migrate ptes into the gpu side, like the cpu
>    does, to hold up refaults before the migration has finished. But I think
>    those are only needed for anon memory in sram because there's no other
>    way to find the right page than swap pte entries, of which migration
>    entries are a special case.
>
> - core code also expects us to handle the page refcount correctly for svm
>    device memory, so we can't free the pages like normal bo pages either
>    directly to drm_buddy.
>
> Now typing this all up will look an awful lot like what you have, with the
> dma_resv lock serving as the page lock and the pagetable lock. The only
> reason is that these locks are much smaller and nest within all the other
> stuff going on and so avoid the inversion issues.
>
> So one annoying part is that this is a lot of pointlessly looking typing.
> The other is that it's full of races, because core mm really is yolo all
> the way down. So lots of ways you lock the wrong page and fun stuff like
> that, but the few cases that matter work:
>
> - svm fault handling with hmm_range fault retries with mmu notifiers. Note
>    that we need to have vram pages locked and the notifier retrie needs to
>    be under the pagetable lock, or there's room to escape. At least that's
>    what I came up with last time I thought it all through.
>
> - migrate_to_ram: it will hold a page reference which we know was the
>    valid vram page when the cpu pte was locked, but it might not be it
>    anymore. So we have to lock the page and check whether it's still gpu
>    mapped, and if not retry the entire fault since most likey another
>    migrate_to_ram has succeed meanwhile in parallel.
>
> - for eviction we don't care, we might actually be migrating a page no one
>    even wants anymore.
>
> Now I think you can get all this done with the dma_resv lock and maybe the
> bo refcount. But it does involve a tremendous amount of headaches and
> impendence mismatch, because that's not how page faults and migrations
> work in core mm.
>
> Cheers, Sima
>
>> Current migration policy is migrate any SVM range greater than or equal
>> to 64k once.
>>
>> [1]https://patchwork.freedesktop.org/series/133643/
>>
>> Signed-off-by: Matthew Brostmatthew.brost@intel.com
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c | 81 ++++++++++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_svm.h |  1 +
>>   2 files changed, 81 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 4372c02a341f..fd8987e0a506 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -217,8 +217,13 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
>>   static int __xe_svm_garbage_collector(struct xe_vm *vm,
>>   				      struct xe_svm_range *range)
>>   {
>> +	struct drm_gpusvm_ctx ctx = {};
>>   	struct dma_fence *fence;
>>   
>> +	/* Evict any pages holding references to vram allocation */
>> +	if (range->base.flags.partial_unmap && IS_DGFX(vm->xe))
>> +		drm_gpusvm_migrate_to_sram(&vm->svm.gpusvm, &range->base, &ctx);
>> +
>>   	xe_vm_lock(vm, false);
>>   	fence = xe_vm_range_unbind(vm, range);
>>   	xe_vm_unlock(vm);
>> @@ -504,21 +509,77 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>>   	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
>>   }
>>   
>> +static struct xe_mem_region *tile_to_mr(struct xe_tile *tile)
>> +{
>> +	return &tile->mem.vram;
>> +}
>> +
>> +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>> +				       struct xe_svm_range *range,
>> +				       const struct drm_gpusvm_ctx *ctx)
>> +{
>> +	struct xe_mem_region *mr = tile_to_mr(tile);
>> +	struct drm_buddy_block *block;
>> +	struct list_head *blocks;
>> +	struct xe_bo *bo;
>> +	ktime_t end = 0;
>> +	int err;
>> +
>> +retry:
>> +	xe_vm_lock(vm, false);
>> +	bo = xe_bo_create(tile_to_xe(tile), tile, vm, range->base.va.end -
>> +			  range->base.va.start, ttm_bo_type_device,
>> +			  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> +			  XE_BO_FLAG_SYSTEM_ALLOC | XE_BO_FLAG_SKIP_CLEAR);
>> +	xe_vm_unlock(vm);
>> +	if (IS_ERR(bo)) {
>> +		err = PTR_ERR(bo);
>> +		if (xe_vm_validate_should_retry(NULL, err, &end))
>> +			goto retry;
>> +		return bo;
>> +	}
>> +
>> +	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
>> +	list_for_each_entry(block, blocks, link)
>> +		block->private = mr;
>> +
>> +	/*
>> +	 * Take ref because as soon as drm_gpusvm_migrate_to_vram succeeds the
>> +	 * creation ref can be dropped upon CPU fault or unmap.
>> +	 */
>> +	xe_bo_get(bo);
>> +
>> +	err = drm_gpusvm_migrate_to_vram(&vm->svm.gpusvm, &range->base,
>> +					 bo, ctx);
>> +	if (err) {
>> +		xe_bo_put(bo);	/* Local ref */
>> +		xe_bo_put(bo);	/* Creation ref */
>> +		return ERR_PTR(err);
>> +	}
>> +
>> +	return bo;
>> +}
>> +
>>   int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   			    struct xe_tile *tile, u64 fault_addr,
>>   			    bool atomic)
>>   {
>> -	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
>> +	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma),
>> +		.vram_possible = IS_DGFX(vm->xe), };
>>   	struct xe_svm_range *range;
>>   	struct drm_gpusvm_range *r;
>>   	struct drm_exec exec;
>>   	struct dma_fence *fence;
>> +	struct xe_bo *bo = NULL;
>>   	ktime_t end = 0;
>>   	int err;
>>   
>>   	lockdep_assert_held_write(&vm->lock);
>>   
>>   retry:
>> +	xe_bo_put(bo);
>> +	bo = NULL;
>> +
>>   	/* Always process UNMAPs first so view SVM ranges is current */
>>   	err = xe_svm_garbage_collector(vm);
>>   	if (err)
>> @@ -534,6 +595,22 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   	if (xe_svm_range_is_valid(range, tile))
>>   		return 0;
>>   
>> +	/* XXX: Add migration policy, for now migrate range once */
>> +	if (IS_DGFX(vm->xe) && !range->migrated &&
>> +	    range->base.flags.migrate_vram &&
>> +	    (range->base.va.end - range->base.va.start) >= SZ_64K) {
>> +		range->migrated = true;
>> +
>> +		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
>> +		if (IS_ERR(bo)) {
>> +			drm_info(&vm->xe->drm,
>> +				 "VRAM allocation failed, falling back to retrying, asid=%u, errno %ld\n",
>> +				 vm->usm.asid, PTR_ERR(bo));
>> +			bo = NULL;
>> +			goto retry;
>> +		}
>> +	}
>> +
>>   	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
>>   	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have change */
>>   	       goto retry;
>> @@ -567,6 +644,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   	dma_fence_put(fence);
>>   
>>   err_out:
>> +	xe_bo_put(bo);
>> +
>>   	return err;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>> index 8b72e91cc37d..3f432483a230 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.h
>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>> @@ -18,6 +18,7 @@ struct xe_svm_range {
>>   	struct list_head garbage_collector_link;
>>   	u8 tile_present;
>>   	u8 tile_invalidated;
>> +	u8 migrated	:1;
>>   };
>>   
>>   int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
>> -- 
>> 2.34.1
>>

--------------Nx7X4Mlme455EWvH6nEamTSu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 28.08.24 um 18:06 schrieb Daniel Vetter:<br>
    <blockquote type="cite" cite="mid:Zs9LF-jnNrd9ZlxW@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">On Tue, Aug 27, 2024 at 07:48:56PM -0700, Matthew Brost wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Migration is implemented with range granularity, with VRAM backing being
a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of the
TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
SVM range is migrated to SRAM, the TTM BO is destroyed).

The design choice for using TTM BO for VRAM backing store, as opposed to
direct buddy allocation, is as follows:

- DRM buddy allocations are not at page granularity, offering no
  advantage over a BO.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This one I'm not understanding.</pre>
    </blockquote>
    <br>
    Adding Arun as well. I couldn't understand it fully either, but
    maybe it's because the buddy allocator is more optimized for higher
    orders of allocations?<br>
    <br>
    <blockquote type="cite" cite="mid:Zs9LF-jnNrd9ZlxW@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">- DRM buddy allocations do not solve locking inversion problems between
  mmap lock and dma-resv locks.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Which mmap -&gt; dma_resv inversion? I've seen a lot ... I guess it also
matters hugely which migration path we're in, i.e. opportunistic
migration, cpu fault where we have to migrate or die, or when we run out
of vram and need to evict stuff to make space.</pre>
    </blockquote>
    <br>
    Mhm I think the locking order between mmap lock and dma-resv lock is
    well defined since dma_resv_lockdep() was added.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:Zs9LF-jnNrd9ZlxW@phenom.ffwll.local">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">- Unified eviction is required (SVM VRAM and TTM BOs need to be able to
  evict each other).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
So core mm handles this by just roughly equally shrinking everything.
Seems to work, and it has a pile of object shrinkers, and the page lru is
also split into page cache and anon memory.

I think you need to put in more justification that unified eviction is
required than just stating it, because a look at mm/ gives a very well
established counterexample.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">- For exhaustive eviction [1], SVM VRAM allocations will almost certainly
  require a dma-resv.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
So from the TTM side we need exhaustive eviction, or at least something a
bit more exhaustive than what ttm currently has. Note that i915-gem also
never really got to perfect exhaustive eviction, it's just a pile better
than ttm right now.</pre>
    </blockquote>
    <br>
    Please define what exhaustive eviction should mean? I think I know
    what it is and I have been pushing TTM into the direction of solving
    this for years.<br>
    <br>
    The last missing puzzle piece is to use drm_exec for TTM evictions,
    but apart from that everything should work now.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:Zs9LF-jnNrd9ZlxW@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">Now if there's also SVM VRAM managed on a page lru, TTM exhaustive
eviction is going to win because the shrinkers can only trylock dma_resv.
So this part works. It actually works so well on the system memory side
that if we're not careful we can trigger oom, because we're too good at
getting at all the memory.

SVM VRAM allocations otoh do not need exhaustive evictions. Or at least I
don't see why, because the idea is that thanks to gpu and cpu page faults,
you can always get out of a pinch by just trashing everything for a while
and migrating the handfull of available pages a lot.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">- Likely allocation size is 2M which makes of size of BO (872)
  acceptable per allocation (872 / 2M == .0004158).

With this, using TTM BO for VRAM backing store seems to be an obvious
choice as it allows leveraging of the TTM eviction code.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Except it requires that you hold dma_resv, which brings in all kinds of
pain. And for eviction we really don't need a lot of synchronization, so a
lot of that locking is not needed, unlike the case where we have a cpu
fault, where we absolutely need mmap_lock and all that to make sure we
fault in the right page.

But for eviction we only need to throw out some pages, if we're not
entirely precise with picking the right ones (or have no idea into which
vma they're all currently mapped into) it doesn't matter. That's why
migrate_device_pages doesn't care about any of that at all, it doesn't
need to by design. But by bo backing memory you drag in all that stuff
that's causing headacheds for eviction.

The only thing migration tries to do is remove all pte, and if that
succeeds, move the page. Specialized for the gpusvm case, looking at mm/
code as cheat sheet, we need roughly:

- reverse mapping structure like anon_vma. Except gpusvm can assume that
  there's currently only one gpu side mapping, so we can just stuff the
  gpusvm an va_address into the page, and protect it with the page lock.

- we need pagetable locks, so that we can manipulate pagetables (well
  specifically make ptes invalid) without taking any other locks.

- everyone else inserting or removing ptes for svm mappings also needs to
  lock the page, or we have races. This might be the hmm_range_fault races
  you're seeing when allowing vram pages, since I don't think there's
  anything else stopping the page lookup otherwise from succeeding.

- we might also need to stuff migrate ptes into the gpu side, like the cpu
  does, to hold up refaults before the migration has finished. But I think
  those are only needed for anon memory in sram because there's no other
  way to find the right page than swap pte entries, of which migration
  entries are a special case.

- core code also expects us to handle the page refcount correctly for svm
  device memory, so we can't free the pages like normal bo pages either
  directly to drm_buddy.

Now typing this all up will look an awful lot like what you have, with the
dma_resv lock serving as the page lock and the pagetable lock. The only
reason is that these locks are much smaller and nest within all the other
stuff going on and so avoid the inversion issues.

So one annoying part is that this is a lot of pointlessly looking typing.
The other is that it's full of races, because core mm really is yolo all
the way down. So lots of ways you lock the wrong page and fun stuff like
that, but the few cases that matter work:

- svm fault handling with hmm_range fault retries with mmu notifiers. Note
  that we need to have vram pages locked and the notifier retrie needs to
  be under the pagetable lock, or there's room to escape. At least that's
  what I came up with last time I thought it all through.

- migrate_to_ram: it will hold a page reference which we know was the
  valid vram page when the cpu pte was locked, but it might not be it
  anymore. So we have to lock the page and check whether it's still gpu
  mapped, and if not retry the entire fault since most likey another
  migrate_to_ram has succeed meanwhile in parallel.

- for eviction we don't care, we might actually be migrating a page no one
  even wants anymore.

Now I think you can get all this done with the dma_resv lock and maybe the
bo refcount. But it does involve a tremendous amount of headaches and
impendence mismatch, because that's not how page faults and migrations
work in core mm.

Cheers, Sima

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Current migration policy is migrate any SVM range greater than or equal
to 64k once.

[1] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/133643/">https://patchwork.freedesktop.org/series/133643/</a>

Signed-off-by: Matthew Brost <a class="moz-txt-link-abbreviated" href="mailto:matthew.brost@intel.com">matthew.brost@intel.com</a>
---
 drivers/gpu/drm/xe/xe_svm.c | 81 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h |  1 +
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 4372c02a341f..fd8987e0a506 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -217,8 +217,13 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 static int __xe_svm_garbage_collector(struct xe_vm *vm,
 				      struct xe_svm_range *range)
 {
+	struct drm_gpusvm_ctx ctx = {};
 	struct dma_fence *fence;
 
+	/* Evict any pages holding references to vram allocation */
+	if (range-&gt;base.flags.partial_unmap &amp;&amp; IS_DGFX(vm-&gt;xe))
+		drm_gpusvm_migrate_to_sram(&amp;vm-&gt;svm.gpusvm, &amp;range-&gt;base, &amp;ctx);
+
 	xe_vm_lock(vm, false);
 	fence = xe_vm_range_unbind(vm, range);
 	xe_vm_unlock(vm);
@@ -504,21 +509,77 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
 	return (range-&gt;tile_present &amp; ~range-&gt;tile_invalidated) &amp; BIT(tile-&gt;id);
 }
 
+static struct xe_mem_region *tile_to_mr(struct xe_tile *tile)
+{
+	return &amp;tile-&gt;mem.vram;
+}
+
+static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+				       struct xe_svm_range *range,
+				       const struct drm_gpusvm_ctx *ctx)
+{
+	struct xe_mem_region *mr = tile_to_mr(tile);
+	struct drm_buddy_block *block;
+	struct list_head *blocks;
+	struct xe_bo *bo;
+	ktime_t end = 0;
+	int err;
+
+retry:
+	xe_vm_lock(vm, false);
+	bo = xe_bo_create(tile_to_xe(tile), tile, vm, range-&gt;base.va.end -
+			  range-&gt;base.va.start, ttm_bo_type_device,
+			  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+			  XE_BO_FLAG_SYSTEM_ALLOC | XE_BO_FLAG_SKIP_CLEAR);
+	xe_vm_unlock(vm);
+	if (IS_ERR(bo)) {
+		err = PTR_ERR(bo);
+		if (xe_vm_validate_should_retry(NULL, err, &amp;end))
+			goto retry;
+		return bo;
+	}
+
+	blocks = &amp;to_xe_ttm_vram_mgr_resource(bo-&gt;ttm.resource)-&gt;blocks;
+	list_for_each_entry(block, blocks, link)
+		block-&gt;private = mr;
+
+	/*
+	 * Take ref because as soon as drm_gpusvm_migrate_to_vram succeeds the
+	 * creation ref can be dropped upon CPU fault or unmap.
+	 */
+	xe_bo_get(bo);
+
+	err = drm_gpusvm_migrate_to_vram(&amp;vm-&gt;svm.gpusvm, &amp;range-&gt;base,
+					 bo, ctx);
+	if (err) {
+		xe_bo_put(bo);	/* Local ref */
+		xe_bo_put(bo);	/* Creation ref */
+		return ERR_PTR(err);
+	}
+
+	return bo;
+}
+
 int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    struct xe_tile *tile, u64 fault_addr,
 			    bool atomic)
 {
-	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
+	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma),
+		.vram_possible = IS_DGFX(vm-&gt;xe), };
 	struct xe_svm_range *range;
 	struct drm_gpusvm_range *r;
 	struct drm_exec exec;
 	struct dma_fence *fence;
+	struct xe_bo *bo = NULL;
 	ktime_t end = 0;
 	int err;
 
 	lockdep_assert_held_write(&amp;vm-&gt;lock);
 
 retry:
+	xe_bo_put(bo);
+	bo = NULL;
+
 	/* Always process UNMAPs first so view SVM ranges is current */
 	err = xe_svm_garbage_collector(vm);
 	if (err)
@@ -534,6 +595,22 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (xe_svm_range_is_valid(range, tile))
 		return 0;
 
+	/* XXX: Add migration policy, for now migrate range once */
+	if (IS_DGFX(vm-&gt;xe) &amp;&amp; !range-&gt;migrated &amp;&amp;
+	    range-&gt;base.flags.migrate_vram &amp;&amp;
+	    (range-&gt;base.va.end - range-&gt;base.va.start) &gt;= SZ_64K) {
+		range-&gt;migrated = true;
+
+		bo = xe_svm_alloc_vram(vm, tile, range, &amp;ctx);
+		if (IS_ERR(bo)) {
+			drm_info(&amp;vm-&gt;xe-&gt;drm,
+				 &quot;VRAM allocation failed, falling back to retrying, asid=%u, errno %ld\n&quot;,
+				 vm-&gt;usm.asid, PTR_ERR(bo));
+			bo = NULL;
+			goto retry;
+		}
+	}
+
 	err = drm_gpusvm_range_get_pages(&amp;vm-&gt;svm.gpusvm, r, &amp;ctx);
 	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have change */
 	       goto retry;
@@ -567,6 +644,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	dma_fence_put(fence);
 
 err_out:
+	xe_bo_put(bo);
+
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 8b72e91cc37d..3f432483a230 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -18,6 +18,7 @@ struct xe_svm_range {
 	struct list_head garbage_collector_link;
 	u8 tile_present;
 	u8 tile_invalidated;
+	u8 migrated	:1;
 };
 
 int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
-- 
2.34.1

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------Nx7X4Mlme455EWvH6nEamTSu--
