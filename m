Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D4ED33B62
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 18:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B115710E906;
	Fri, 16 Jan 2026 17:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FP4WSqif";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011036.outbound.protection.outlook.com [40.107.208.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE6E10E909
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 17:10:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9QhN2yyddtWSU/IZF3yTRg3zNlCurcEPqtK4n/5Q5L2ZRX7GpkAWAacaPxH+p9USBvPHGGix+8VrvyLl7pI2g4vFtKSsm8PTuQqlyDj+B2EvmeugL65y8bL94N2pQjIaxE4/kpeKwxKrji5WgcYQqGgvKgySO/UxM5bziOXN2FMpR6wa/fZLX0xt+oMOuTsI+KkMQ390gtXyI6XoFg434pkiPRWzQqo0L143ceTOYA2uu4O95wfWvhabuO24spxfFIES98YyMc/N2IpIu6uzdSHFK9tI/7UvDvNF9O/RGjep5+qmLwDXv/GQf1Li7HKgcHfgCdaOxWpnv0Zj+Cbog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VuSbtZk2928t/QX8KrxsGRTJfY+QHJyKnr04xQbDmI=;
 b=VxwQJqhXF1xr+KQ5j8wmNx+G7+aIi0vpHl+tXm8Eyx0/xlwzlqR+fJlBRa2TCg61RDIUFyKN4ur7b3kF28IY8X0yG8ccK9fyHc3CRM8Okx3jZQejAL3n3RPFxTNIISbWsSUvMGOMxwP6CUqpVk2XkCM27ScCfJtpgY6gEvnPcRGcaUTIuWkNKQ8aCECw5IrGTsGS3GJiCVnMk1Eeo4YFTX8Jo8iCz7TdhXXyD7JM0KWrVOuIHZBsfZx99jgOdGrp0VP0b3JO+b3NpBJ2Xqmt4hTu8MkS57FlS20m2lLqVOdYqzji7wxpjBv0IsIGyMG4lYylr/Z9ywuNw/hcLO4/5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=schreibt.jetzt smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VuSbtZk2928t/QX8KrxsGRTJfY+QHJyKnr04xQbDmI=;
 b=FP4WSqifBcTSLAudlkRuTyCKCTQFKBzCl3rBqcoVgfez72zGEzunh7JkHCJVb978kQynF604Hbj3oYMpy4i7QbLZ7juk8TimFkdyuC2rvfB98qMqmefANVzAzx4/CS9ocOw0LXVLWDXhnN4HWOfFZrY1M7SC5fdIDOyohymBnfw=
Received: from SN6PR01CA0012.prod.exchangelabs.com (2603:10b6:805:b6::25) by
 DS7PR12MB6238.namprd12.prod.outlook.com (2603:10b6:8:96::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.7; Fri, 16 Jan 2026 17:10:43 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:805:b6:cafe::a) by SN6PR01CA0012.outlook.office365.com
 (2603:10b6:805:b6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 17:10:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 17:10:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 16 Jan
 2026 11:10:38 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 Jan
 2026 11:01:27 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 16 Jan 2026 09:01:27 -0800
Message-ID: <0a7f0ae1-3ce6-c701-6217-422d2728027c@amd.com>
Date: Fri, 16 Jan 2026 09:01:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: amdxdna breaks suspend (was: Re: [PATCH v5 2/8] iommu: Remove
 IOMMU_DEV_FEAT_SVA)
Content-Language: en-US
To: Linus Heckemann <linus@schreibt.jetzt>, Alex Deucher
 <alexdeucher@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>
CC: Min Ma <min.ma@amd.com>, <dri-devel@lists.freedesktop.org>,
 <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20250418080130.1844424-1-baolu.lu@linux.intel.com>
 <20250418080130.1844424-3-baolu.lu@linux.intel.com>
 <ygaqzsib7bc.fsf@localhost> <20251230011916.GB23056@nvidia.com>
 <yga3445n4wt.fsf@localhost>
 <CADnq5_NH0DiyE0M44AzaEQhmSksj13wVwEK_Y2JHj3OLEPs9Mg@mail.gmail.com>
 <20260116160210.GN961588@nvidia.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260116160210.GN961588@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|DS7PR12MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: cce7bc36-87a7-42d0-666b-08de55222e2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c000RThPamtJZlZrN2RYK29WYnNwcDYySC81MGk2TXVhOGRDenNyRXV3Mzk2?=
 =?utf-8?B?eis2RmREa1JzOG5QWE9VTENlN0t6eXpZL3ZIaDkxK3NKMHdGRWdqK3A5a1ox?=
 =?utf-8?B?bm42MExtNi80QmNNV2djWkZGeXFTa3gyQ3p5NG81NHdrKzYzZEgrdDRXVGJr?=
 =?utf-8?B?c010bGx3d1RXaW9paEQydkQyWGFtVXFvZi9SdW5PM2hWZEtGWGpleXNPQ21I?=
 =?utf-8?B?bk1LNDZtakdQVStpVHBJdjJtNmJLVzRBS21rMFNjRGRvMEtIeU5qMk5pVUhU?=
 =?utf-8?B?V1VFYVlDb3JraE5RVDVRakY2TnV5Q0Z5U3ZMQ2dLSmp1bkNVUXJ3SWtqd0ha?=
 =?utf-8?B?U1FIUlRqNVlaQXlVcGJuN2lGZXpJTlgxUWUrUHZWZmxwOEREd2FaUTNCcmhY?=
 =?utf-8?B?MEw0VnJadndGT0V3K01uSmZWWGpqT0taOEFPSld5aWdlMTBiaGdTVjYxREtK?=
 =?utf-8?B?ZldSdWRJb0hiLzdqZ3dZSWRnbmZoZ2JpenY5ZG02Rmt2RG42aElDWTk5cDZy?=
 =?utf-8?B?Yi9JUzFVdTBiSFFGc08wN2lqTC9ZWXAwSDlYUk95YnhZMmtkMWw0eVhZenpO?=
 =?utf-8?B?WmhJWnN2SHZHYnQvMlQ5b0VVNWpkRzJQODdKVGlUK0x5dlh1MmZFb1pza0U3?=
 =?utf-8?B?YXgrTkFlYzU1OXF6Vm5KZCtqbXF0dWdOWU4zUU00OGhKK1ZSY3NCd0NleUZr?=
 =?utf-8?B?M3BKUkRmcWlKVzZaM1BaTVFMeGIwZTlOQmxOM2tpbFY0SlFmNk02VUpOZWN5?=
 =?utf-8?B?MU5VY1VnOVEzczJrY1ZvQmIraTY4Mjl5RTRKcUp1bWpHN2tHOVBCSlZxMXpx?=
 =?utf-8?B?WTJQQ2h4aFd4OENURkVJOVQ1dFBhQlJIMXNNWGxCUWhhc25BVkRkNTMrbzcr?=
 =?utf-8?B?MXVoNkpjcFJLN2ZXMEt5UGRaa21zbDRnVC8yVHE5a1I5c1d5QnBXQzc5ajli?=
 =?utf-8?B?aEhuQlYrUFQ3QzVHb1dzcElwZ01nRGUyVHZEdTI1SElSaVY3UUpCR0FSeFVZ?=
 =?utf-8?B?dUJMVWROTy84VER4R0REUnVwTEM0ZmVMMm9OYm84cHFMUy9IZmhOUU82aE5B?=
 =?utf-8?B?R0xJZlFZVEdjcU5VUkJ0aVdhQjVoeUhvOFRYNWFSTnlod1laUDZOelV1MDVy?=
 =?utf-8?B?WWJ0WUdDTmRrZmVjR01WQzg5MzQwTlozSkNZWWFYZFFrSFVVTC9Vc3Y3Skta?=
 =?utf-8?B?QzZaRzRyR0ZuakwrUkxZM1V4enVEMW1xWUhCR3hYdUNJZlZia2ZnZzVKZTRw?=
 =?utf-8?B?d0R3aUlFWkg0THhEaFJyVlFBQXZFbXpOb21CbHdRQld1TFZoWXNwN1Zxdkh3?=
 =?utf-8?B?cFNTZ0hIc3IvTWJLTDJUSTR0Y0hhWWwyaU9FWlpKdjA5RGpyY28rQ1JYakcr?=
 =?utf-8?B?bHo1d3I4bFAzb0wyYlpzNWduTDdKVXdBc09qZHdRd09pV3dscWdEUE5sMndh?=
 =?utf-8?B?cDlMZGVMVkQ2bmZ1Znp1ZFJVSnpTaVY2eGJiOGo5N2wxWGR3NFpWU1NKQ0dR?=
 =?utf-8?B?R3EwSEkxNWVqemhWWVVSVUJoVU9xKzV4T3AycWFROTBRb3g3aFI1Z0VtcytE?=
 =?utf-8?B?MGZGTWdaaSsvbnh6bG5PWUFkalA4ZVhZNWdTRFF4MDhaTG50MWJpREtGNVpa?=
 =?utf-8?B?Nk1YeDhXUm5SSGg2TForeWJnc2d3UzdZM2hWbnRrKzNzRWhrUkxjek9WYjV5?=
 =?utf-8?B?SjV3UGxKMnlkN0ZlK1ZGK0gvbFUxenFyQ3cxcTBUK1NWaGlYUVpWMDkyL2ZC?=
 =?utf-8?B?aEFOYjM3Zkx0RGUyNHdqRU1TVTgrb2g1eEhzcGNCYkhxV3hCQldRZHlKc1Jr?=
 =?utf-8?B?VWY1aEFrZ1U1Umk2czJUbWszTXdyZVZkaUlVWE1WYTVWTmZUSENPQ0pVOFlk?=
 =?utf-8?B?T3FWTFA3ZGNGWDc0RGpLNTdDTmxYSXliNC83NWF0cmlERFJNVzd4TjUvV2Nq?=
 =?utf-8?B?bElNaWxOR0duY2owVzdTWENVVTZmemtnU1A1U2RTZzkzblphQi8vTTdVUmQ2?=
 =?utf-8?B?aHAybFZ6U0gvRnNFRmxrbEJnazFuRVVJYUNEVUd5OHBNK2JlL2lSODNXd3hs?=
 =?utf-8?B?MVFZdm5oMzZ0MjcwNTBQVXdQdDFDbVA4ZVpGSEhNRWZhcVNmWTI4WXhmcytV?=
 =?utf-8?B?REpLUVNxS0NaUTZ5UFd2MVpXL29CYm9iUlNOaGdsdWhhbGZFLzkwbXRteDFv?=
 =?utf-8?B?UDkvOEF6WGt0dzBtQzNJK1NyMW9jdU5iNlk4S3FYRGVISnBPMytmS1Qxd3l4?=
 =?utf-8?B?Y1E4S3QzZ0syNURGaXZ3Z20rUGRnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 17:10:42.4560 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cce7bc36-87a7-42d0-666b-08de55222e2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6238
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


On 1/16/26 08:02, Jason Gunthorpe wrote:
> On Fri, Jan 16, 2026 at 10:27:56AM -0500, Alex Deucher wrote:
>> On Fri, Jan 16, 2026 at 10:12 AM Linus Heckemann <linus@schreibt.jetzt> wrote:
>>> Jason Gunthorpe <jgg@nvidia.com> writes:
>>>
>>>> On Thu, Dec 25, 2025 at 10:05:59PM +0100, Linus Heckemann wrote:
>>>>> It appears the code removed here was not in fact entirely dead; my 2024
>>>>> gpd win mini ("G1617-01", with a Ryzen 8840U) fails to suspend
>>>>> correctly, and I bisected the issue to this commit.
>>>> The only behavior change this patch had that could be relavent to a
>>>> Ryzen was in drivers/accel/amdxdna/aie2_pci.c - are you using this
>>>> driver?
>>>>
>>>> Prior to this patch amdxdna would have failed to load in configs
>>>> without an iommu as iommu_dev_enable_feature() would have
>>>> failed. After this patch it will load successfully.

I am wondering if the amdxdna loads firmware successfully or the loading 
actually failed?

When running under a hypervisor, we have observed that amdxdna firmware 
loading failures can cause issues. And a quick fix was recently 
upstreamed. Please see:

https://github.com/torvalds/linux/commit/7bbf6d15e935abbb3d604c1fa157350e84a26f98

Are you running under a hypervisor, like xen dom0?


Thanks,

Lizhi

>>>>
>>>> If so then that driver presmuably doesn't have working power
>>>> management in your system.
>>> You're right, blacklisting the amdxdna driver fixes suspend, thanks for
>>> the pointer!
>>>
>>> @Min Ma, Lizhi Hou, dri-devel: do you have any insight into why this
>>> might be happening?
>> The xdna driver requires SVA and the IOMMU.
> It should probably call device_iommu_mapped() during probe then
>
> Jason
