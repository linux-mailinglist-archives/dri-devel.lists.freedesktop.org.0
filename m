Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47134AB55E0
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 15:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF6610E3A0;
	Tue, 13 May 2025 13:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0zH8ZBS4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7FC10E3A0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 13:21:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmYs0UuCiGj1jDOvbjXo7qsbvjVYA+Aw71dBKanmC+5Ggj57utVYbUCaie4D0q68zaZqX6RFs5uhwFMWLAdK1FPlpQHk587le2NAHtwVcC8+RlROTMBvFnHrbZQ4XRrjrHI9rHLZjQ0Q5fg1ZGOP746ny4fCePs2TJP2gkIWz87BQVaITkJIx0kdVdXHKKFo6TB8i+B02oqCH4MftBUPwKDQQAOx2L7/HGg2xsLPs5qwMiKHGoBReVUxvpQv4IdeaVZE8pQpYh3coTw7gMZ28KT+niKHpQiVl4GBBlMZ+sQ1W3XOgZQxkljT0ve5ydH4on3CpRH3VgDnPNNjUY7OZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxPXzanJ9J7V0C93bb6gwqbcQfO/pxFBOih6GrZoWXQ=;
 b=Gaof6WRKT/MjEN5HZhElpMuPyPgnA+xVpUPYcrvsR2arSbT7v0LF9cThuIULyY8eypHUMWaO0bDJTopxp4FF7GCWRlhwkDIaGyYJoMxJeZyZmf65RRTqNYkca1bYlBQDs8jt6tBfZuBUkrPEh09KrSQBdb7NM8txeS5gKcI4Lptdj6YmimjjBn780TKzWKgxJQCq00+ercSZ/Vr2bF/qnFzqDqowC9sjtEbpuZkUn1XCYmBcI+9u7H0M3pYVEqzJthS/va0yAgwItSqLhufoj9h8Jr1xMIYOiHLuVclE4yEAWguH1GQ/epsdNC8ci/7bS1z8qY23NTh9XmG+sBJ82g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxPXzanJ9J7V0C93bb6gwqbcQfO/pxFBOih6GrZoWXQ=;
 b=0zH8ZBS4N0RxXwDCbXCW8PoniaxyE/XvKPC9pDU7i/V7tP4O46viXC9Mbp7fVJmGuB1rqRcPV/8avUjUKNH7Ac7w0jIh62qrhg01IykFVU8AyHd3/WFn6oa2GHtnp25vThVUEJFj7RqY07dqcNeFNsQsk0W1cuwMMBvHtARmAeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6614.namprd12.prod.outlook.com (2603:10b6:8:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 13:21:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 13:21:32 +0000
Message-ID: <5aae4982-4ad0-4d31-a8d6-6392ff48bc53@amd.com>
Date: Tue, 13 May 2025 15:21:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] amdgpu: add support for memcg integration
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20250512061913.3522902-1-airlied@gmail.com>
 <20250512061913.3522902-7-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250512061913.3522902-7-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0feebc-21fd-4360-17fb-08dd922113e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjU4WlVMNC91Y2pUL3c2cFIxNE9IVnpvNGMyaVpPak9iVjRpR21MRVJwWjVQ?=
 =?utf-8?B?SDNDemo3VkJOdU45UmdWY1BEQXlhbHZZQWVIUlg2S2w3OENnVSs0dGY2UUdr?=
 =?utf-8?B?RFNKZ2JJVUx3dnc4czIyNTlMeExGZzY0VnhkVTkwaDZxT29KTnZnRjAweHBw?=
 =?utf-8?B?Y2Y3b2dvODNEUUJLL2ZUeFFYVnhyRllYU282UlMvQ1MwL2JscS9ZWVJMUUhJ?=
 =?utf-8?B?SE9jMTRxQ0NmeUlPK3pXRjJHRzQ0RTZlUSt1V1pydFduZVV6N2NORkRzbGxJ?=
 =?utf-8?B?SlpVcjhqZ3krVU0zV1JFKzdoaDNtQXN2QlZaWGxlZ2lSaFlvclV5S0NVc2pD?=
 =?utf-8?B?R1I1REZrUUQ3cTVRZlhiZ214VkQ0ckdKT0FjZVFPTjFTVWdacU4rMzF4SkND?=
 =?utf-8?B?OXlhQXhhOUZtVks2Nzh5MWFHdlNBTWZSdXF3c0F1Wm9oT0w3SDl1Qmp3WFcx?=
 =?utf-8?B?RVlPYW5TZGhUdUxTWURoN3FnR2tDaHR6MStaY0hVempaVkhEVm5lNXR2ZE5z?=
 =?utf-8?B?cjBYUkNKM2F3ekl5ZkF5SGtZdHpYVkNLVGUyUWNENHBWczhQQ1M1RVBCTytT?=
 =?utf-8?B?cUVJSnNzaWRwMWkvNy8vT3RWNWlSUGdZWm0vckR5ZVphWDhKL3M1NUxBWGZJ?=
 =?utf-8?B?N1EwbDFSVXJGd0ZoRGlVOGRVMkVMN2tud2YrYnZ4OVRwcTQ2TWJPZTBBUXc3?=
 =?utf-8?B?YVpNcDBwWmcyNkFpMTJSVXgzcC9weE5WMnRCcXFETEVZUGgyMmJGNW5VdDZE?=
 =?utf-8?B?YUNiZUZnTUN4WjRMZlFxWHVkand5NWtZWmtjdmFsNzZGVmN6M01rYjNNeXZN?=
 =?utf-8?B?bXdQbVRrT0prRmtzcW9ycGJjWS9iT1h1VVJZbktzRjlHNU5sK21waUp4TjNN?=
 =?utf-8?B?N2tRUElyN0ZudFRDZ2V5ZlJKWHBoSWN0MW9EU1AwUlVDNW9XY3NNOWVNK3hP?=
 =?utf-8?B?S3EyNEFWRmRGZnc2SHRIZnRCaDlCN2pqN3BBZlZ1a3FBQkMycDA3NkljUkNr?=
 =?utf-8?B?Y21qRnZxbEo5OW5qU0lCb25BckJqT3d0QzZzamNhRmRkQXJNMzJkcU84cjNR?=
 =?utf-8?B?cDd0L1dkWUpoNGlYYVRFeUtoenlNMW1XUzBXN0VmU2JkdVYweW05V2VyZml6?=
 =?utf-8?B?cCtEUU5EYXUzRFZFNXh1TlNKL0ltN1l3Z2RraWk5am5wc25zN2VqaHpOU2Vs?=
 =?utf-8?B?SC9Lb1BURHhTbFE0NEMvb09seUxHS1g0VU1hak56SEV4VFhSMGJlQ2lIQmRt?=
 =?utf-8?B?QkJrWUc5RWFBdGxmU2JlWHNZK2lRYk9STVk3RTZLZk44LytZQmh3djZ1UFBy?=
 =?utf-8?B?T2hmVUU2aEZoME1JTTB3YWZFdVhMNjk3UThYVmtmdDljczhIWlhtVVpZdTds?=
 =?utf-8?B?VkFMY3dJNitIQnQ0WmxOdDJKcGpKdEc4Q3lrNUNZTkF6NUQ3MGZXdHhqT0o0?=
 =?utf-8?B?MG5pak1KZ0liaEw1Q05GdWpWNjl5Q3lWMGRtZVkrNGlxc3ZBQ1BqemRseDMx?=
 =?utf-8?B?Ry8xZ01vSnlHNVQvc0FxV0NoYTA4b1B3akRWTVNpNHNTRGxQOXUrR1c3UWVN?=
 =?utf-8?B?Z2pCUStpNkVJbGw5N2NERC9MQlhwL2tkSW9PR2g2a3R5OE1BVllnMTAybzdw?=
 =?utf-8?B?SXR3UEYvZ0dXN0V2bnQ5TjlkYWxvRmFiemFsT2RHYnZoRVBVVkhNYzNNYy8x?=
 =?utf-8?B?a1YwT0RQbTgrNENCNWlhOEpBcHEyZW5Md3Q0RzlTTktXZHpsZGdzN3dKRjBJ?=
 =?utf-8?B?V2JHckQ0NUEydWEwM3E0OS9LQ2Q1NWgyb1B6WXRXN0Evem9tZEdHSWdYZlNC?=
 =?utf-8?B?UExmVFp1UXoyUGdDanZMTS90OGtqa2d4SFdBeFl6TWxZelBkOVFPT2s0ajdo?=
 =?utf-8?B?aTZMc0tIMEcySHhuOXNwTm9YN0NXWlB4ZlA1Qmpha0dveldYWjRid2thQmRB?=
 =?utf-8?Q?QVXUluiQag8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFZsSXBnRDZxM204eDdYYk9XZ200VXFodlVuckNNbTRucjZ2c1RYNEhOM2d1?=
 =?utf-8?B?c0xNRmJJZmZRNVNyelluanJwdjNpaEhyd3REaWM3VWdWWExSOWtVN29VSXFw?=
 =?utf-8?B?aXFORzVROFNUbEc1TkNTdExER3N5ZDhpL2l1Q0ZpNGYyZS9keXBMT1R0M3RI?=
 =?utf-8?B?NnJmN0pXSzc2S3lkTmM0eUxmNHlNTVl2cktvSStlQkd5TGhGRE0yS01YNm5G?=
 =?utf-8?B?cWo1N1JoRG93L2ZZa25jYTU3cFM0MHhhYnozeU9yUkFnaStSUGdYNUlaSFBv?=
 =?utf-8?B?VFhsWFVMdXJuOU9lc1dXdzZ0bWpiVVJwcHVyTHo5bWl3ZXpsRU5ZK2lMSVZ5?=
 =?utf-8?B?eU80dzVjKzdoOTV6RSttRFlMOHlSSkRjNnpmSm40TGVuWFZYcy9RVWJKTVJo?=
 =?utf-8?B?eXdVRnNYM0srUnRmaVVsc1RJT21MY2FaUVNNUEhSdW8yaUZNSTVaZzJWOWxT?=
 =?utf-8?B?STJrWXczcTNmMW1FZ0gyMnJmRExicDhIa040ZFNUR3BiaFRPQ0YxYmhJdVZV?=
 =?utf-8?B?ejlsNzVCcTc4KzZoY3I4WWh3ZkRtK0xSYWhrWmwvMDMvcmZvdEg0RDEwSTcz?=
 =?utf-8?B?dzRCc1h0dVR3ZVJneWRwUFI2Mm9UTkpRMndFTzhSOE9BRko0THlwcEp2TVpG?=
 =?utf-8?B?YlRHN3g3dStaZzJCeXExbytGbkFmRlZ4ZllTQkpQb1dmSGRSL3pZUXFDYnVp?=
 =?utf-8?B?VFZhRWUzMVcya3h4UVpRZVFQYW5YTld6ajJTdk0yS3RneFZhNGRiYThXVTNa?=
 =?utf-8?B?VHpXbVB3NGF1RkNaUnovcUhvcXlTUlNqRWV6R3gwa2poNnhGeUhtSlV2WVc2?=
 =?utf-8?B?R2RhdUw2WERIaFl5SEhOR0tYNkRMbXlyTkkxTytFcERrUEl3ano1SXRrN1NL?=
 =?utf-8?B?OEt0VW4wTU1KUTdvVDFsU0RWN3pIQUNidGtCTVpXZ0VCWGJtSjBneGIwQ25L?=
 =?utf-8?B?SjNEZThWL3pGS29HbW5tN0x0L2pCUVdTS2tibHdMdXlnbVEvcDFQNEdoM3Ri?=
 =?utf-8?B?UzAwY3lCVHpZVEpKVTAxUlBEWEd6ZFNyVjNmdDQwajJUTVh5QUs0cWRQZ3N1?=
 =?utf-8?B?REVQNnJ0MUFxdGdpTVVwRDdzVFRhaW1FRmUwRnNpY0c5eU0xaEhBRE90Q3Ba?=
 =?utf-8?B?U1NxY2tnVWdKY2tBeGFKUUJkcnl0Q3g3U0Z0RFhuZmZCcHJhVGMweWNiOCtW?=
 =?utf-8?B?bGozUUx4S3JzV2J2b3diSks1SmI2TVRwR250MzY3QmlDN1VnZU5nb3h2UThS?=
 =?utf-8?B?bHRoaU9jZVEyK1B2bVYrVkx2b0p3T3B0Nkx2K0hHL2I2V2w4TXFFWDZPWU5i?=
 =?utf-8?B?Ulo3TDBOWkhldnJYZkwrMDZZbHh0dVdPZzMwa2V1a2FDUE1ld21STUtOZ1FG?=
 =?utf-8?B?bzdkQmQ5MmM2eHltamJGTk9ibDAyeWhYdHBwQUcrOTJXWGFMTVRVeUlLOWUv?=
 =?utf-8?B?MEp3YXI2QmJlWVQxbGpRc1loMVBrWXdXbTl4T1RxS1JjRmVQbGRGcU5LV3cr?=
 =?utf-8?B?aGhvVW53c1Q5Ukpqamp6UzZIYjBHRjNMaXZibUFONXZaQm5YZHJYU2xKMWJ1?=
 =?utf-8?B?c21vVFRmQ2ljVWZLUGFLVkQxd1kyVXBaOTRob3NEbjVETTBNMTRqdkNxa3Rl?=
 =?utf-8?B?L0t0Kzh0c284anBVMHVnVUtsL0FCN1h3NEZzUVI3K2ZUYWhMVmVzZmFVSkJO?=
 =?utf-8?B?MEJwc0FacmdLRE1rMWVEK2xZZG4yamM3NUhxeHJvdCsrRUJTSXZyRk05eUUr?=
 =?utf-8?B?ajVNTnBXbE1sYndKd1V1TWpkYitmSUpSZWNoWWx6dXBYZnRraE5KL1YvT2ZX?=
 =?utf-8?B?cnpCRUpCQi92OFVIOU5LdlZTOTBTM2JZSERLSmVGcno2T2ZDbE1Za0NmMHhO?=
 =?utf-8?B?VklMT2duTG93QWV5OVVONlhhanJ6bVpHekpBMGRPbmcxT0Nvc2M4WjlHZ2Q0?=
 =?utf-8?B?VUVveWFzeEdvY3kvMXdVcm43VkRSL0N2VEhGUUhMRUpORG5PYWYzYVVIYUNG?=
 =?utf-8?B?S2x4a1BlVlR1dUtseTJEM2ZBYnByQldtUGFOeGMwQmlRbTdpczJmcTQ4QWd5?=
 =?utf-8?B?RU5CUkhWL0xlUmpPTWVlOWlVS3BYVmxDOTRxcnExSC9QL09uRHYwZFdFc0ty?=
 =?utf-8?Q?tE615YWwNejI0tAMbcI/uS1N/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0feebc-21fd-4360-17fb-08dd922113e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 13:21:32.3502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lo9RQ0AZzhpDYZOcOHFhUwn9YNoAc+Oe7uck2cBfIebJTSSpvPBzK7w/5+s8jpLU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6614
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

On 5/12/25 08:12, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This adds the memcg object for any user allocated objects,
> add uses the MEMCG placement flags in the correct places.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c     |  5 ++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 16 +++++++++++-----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  2 ++
>  5 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 82df06a72ee0..1684a7e6d6cd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -839,7 +839,10 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>  				union drm_amdgpu_cs *cs)
>  {
>  	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
> -	struct ttm_operation_ctx ctx = { true, false };
> +	struct ttm_operation_ctx ctx = {
> +		.interruptible = true,
> +		.no_wait_gpu = false,
> +	};

In general this change here is very welcomed, but should probably be in a separate patch.

Looks likely a leftover from when the flag was in the context.

Apart from that the patch series looks totally fine to me.

Regards,
Christian.

>  	struct amdgpu_vm *vm = &fpriv->vm;
>  	struct amdgpu_bo_list_entry *e;
>  	struct drm_gem_object *obj;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 69429df09477..bdad9a862ed3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -89,6 +89,7 @@ static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>  	struct amdgpu_bo *aobj = gem_to_amdgpu_bo(gobj);
>  
>  	amdgpu_hmm_unregister(aobj);
> +	mem_cgroup_put(aobj->tbo.memcg);
>  	ttm_bo_put(&aobj->tbo);
>  }
>  
> @@ -116,6 +117,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
>  	bp.domain = initial_domain;
>  	bp.bo_ptr_size = sizeof(struct amdgpu_bo);
>  	bp.xcp_id_plus1 = xcp_id_plus1;
> +	bp.memcg = get_mem_cgroup_from_mm(current->mm);
>  
>  	r = amdgpu_bo_create_user(adev, &bp, &ubo);
>  	if (r)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 0b9987781f76..1d930421354a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -158,7 +158,7 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
>  		places[c].mem_type =
>  			abo->flags & AMDGPU_GEM_CREATE_PREEMPTIBLE ?
>  			AMDGPU_PL_PREEMPT : TTM_PL_TT;
> -		places[c].flags = 0;
> +		places[c].flags = TTM_PL_FLAG_MEMCG;
>  		/*
>  		 * When GTT is just an alternative to VRAM make sure that we
>  		 * only use it as fallback and still try to fill up VRAM first.
> @@ -173,7 +173,7 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
>  		places[c].fpfn = 0;
>  		places[c].lpfn = 0;
>  		places[c].mem_type = TTM_PL_SYSTEM;
> -		places[c].flags = 0;
> +		places[c].flags = TTM_PL_FLAG_MEMCG;
>  		c++;
>  	}
>  
> @@ -657,16 +657,21 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>  		size = ALIGN(size, PAGE_SIZE);
>  	}
>  
> -	if (!amdgpu_bo_validate_size(adev, size, bp->domain))
> +	if (!amdgpu_bo_validate_size(adev, size, bp->domain)) {
> +		mem_cgroup_put(bp->memcg);
>  		return -ENOMEM;
> +	}
>  
>  	BUG_ON(bp->bo_ptr_size < sizeof(struct amdgpu_bo));
>  
>  	*bo_ptr = NULL;
>  	bo = kvzalloc(bp->bo_ptr_size, GFP_KERNEL);
> -	if (bo == NULL)
> +	if (bo == NULL) {
> +		mem_cgroup_put(bp->memcg);
>  		return -ENOMEM;
> +	}
>  	drm_gem_private_object_init(adev_to_drm(adev), &bo->tbo.base, size);
> +	bo->tbo.memcg = bp->memcg;
>  	bo->tbo.base.funcs = &amdgpu_gem_object_funcs;
>  	bo->vm_bo = NULL;
>  	bo->preferred_domains = bp->preferred_domain ? bp->preferred_domain :
> @@ -1341,7 +1346,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>  vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
> -	struct ttm_operation_ctx ctx = { false, false };
> +	struct ttm_operation_ctx ctx = { .interruptible = false,
> +					 .no_wait_gpu = false };
>  	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
>  	int r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index 375448627f7b..9a4c506cfb76 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -55,6 +55,7 @@ struct amdgpu_bo_param {
>  	enum ttm_bo_type		type;
>  	bool				no_wait_gpu;
>  	struct dma_resv			*resv;
> +	struct mem_cgroup               *memcg;
>  	void				(*destroy)(struct ttm_buffer_object *bo);
>  	/* xcp partition number plus 1, 0 means any partition */
>  	int8_t				xcp_id_plus1;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 53b71e9d8076..f40b0c0a820b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -151,11 +151,13 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>  			amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_GTT |
>  							AMDGPU_GEM_DOMAIN_CPU);
>  		}
> +		abo->placements[0].flags &= ~TTM_PL_FLAG_MEMCG;
>  		break;
>  	case TTM_PL_TT:
>  	case AMDGPU_PL_PREEMPT:
>  	default:
>  		amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_CPU);
> +		abo->placements[0].flags &= ~TTM_PL_FLAG_MEMCG;
>  		break;
>  	}
>  	*placement = abo->placement;

