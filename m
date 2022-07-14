Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB9D574F2F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 15:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2894112509;
	Thu, 14 Jul 2022 13:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DAB112509;
 Thu, 14 Jul 2022 13:31:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=be58Zem7W4HGpXA9UA3fvAj7y8lbf0QoPKpIJRjpyEDf5cLhpBkmMmmucWGmomY2kA5g27ezwbUXt5MnDsLbYG3DIKxGfmtCikei39eiZOiXcax8qfwL4yWLw0XSevknuyx29nl+8Hd1MfT2MAzEH+Y7VjCv9H1IQ00OY51y/EWJgJaAKf32bK2sOeOGH1URtgOCusaolVrqId8msepYKxSti4qOi3ADg0XD5rI0wtQ2mZdk+MEjce58Z6VFix54Oma6F+yLWZJox2haPAxl/Yce+RiV5mfoICjhh+YcWMNpUwxQn1tSeuVA/3mgDeyXyY8eITXbaQZAJynRfWOGrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AF7US8uLhJrTQ6FyMeGIxqruSy7x/7xKTPD77IeKIZo=;
 b=ALL8kzfhcUnARwG5bM+Z/upOq+IYsEDa2zqjDzyk7RBU7m2xEnbr/Vm8JRqwZ5aA/BmlQLPcAzaHvPnSzPHj0SFDjdyjWkeP1WvxItO0G4dSEPlHiZGVZs1kv1nXIheVcq/JLgGY40oBMHAcTFEkTK3Fpc34oScWYlRg7qmPSFg8pPgngv9VkI51Q1WKP6tYUfimSrIA+jKWtbwHgG9dcYfW6v8SaXK09lGbQec6oxex0YLz4TWvGs/2wkdHTSDlsE/CwOL4k2FM08DXYydHPkI6zZ8Pu6PSPLl/fBMfNwYcschHJ1ZjEBNHFEuyV8JEpg1bSTxgK5I62V4gLGpVRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AF7US8uLhJrTQ6FyMeGIxqruSy7x/7xKTPD77IeKIZo=;
 b=aJysGYuHI5ISsDcW3efVmnlivEoPE97rIojcDrWejlmhOZTii3cdV0nkzjjNAiC7KwnCIDrM8jvcR8g8G+Hf0I7BCv4ualljkKC0x+u9ARB0y5bw1YKkZAF3WX/q1EYOD6ffUFDMIdMlwq+wR8+HgtjxIorBP12nIAHnfE1nfrI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5208.namprd12.prod.outlook.com (2603:10b6:208:311::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 14 Jul
 2022 13:31:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.013; Thu, 14 Jul 2022
 13:31:13 +0000
Message-ID: <f04f872d-192c-ee0b-8fbf-3093161e0527@amd.com>
Date: Thu, 14 Jul 2022 15:31:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] Revert "drm/amdgpu: add drm buddy support to amdgpu"
Content-Language: en-US
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20220708102124.493372-1-Arunpravin.PaneerSelvam@amd.com>
 <20220714145423.721e1c3b@maurocar-mobl2>
 <83d9f973-abdd-3d8b-5955-84cfc3f49eea@amd.com>
 <20220714151918.29c7a241@maurocar-mobl2>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220714151918.29c7a241@maurocar-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0040.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6d6829f-0703-4a3a-1314-08da659d1f30
X-MS-TrafficTypeDiagnostic: BL1PR12MB5208:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uuORbo8YMHFyV0mgPIegiLtdsMpjZYBvnKy/lQ/OdZ4OvwmerOjlRKAr4P1RgDRPeOAyrclM8mv03YR6XTa6DKpDKKltM+/Uol8CR998+AfKOwx/ge7NjU8Rv9AozSa1eIBAclehq9UuF0Oax3X9f66i4Hg3u1QT4eIFEr53ULYgBx2RkOWgUwDT0XECmCB0G32oY5yv+Erb6nkd8OltNX4lybgllrbOULCRMDMLbgTXApW5to3WZ/NbZQWNSqhal1tstMbh5hgHg7S5UfRsv8z7pOI9aavBkMBv01vqFNn6nqJLHSLeprSVv3PPkAJ2T96eZAJkawHsSFXYTL/NGlN2Vvtk/vZ7TMN6BUnslPwb8Cyh7cbiDXcGjq4UGygboPe5f/ciWtimvOez5uVJD6J8qtMekMtuXCzZt/LgLpSCmJKHsVKjtyyNu8Cwn/+FoHFQ8Vncc4cOpWW2n0eg8StWEDwcwOvrU/9Bpm+sFtLej9FVolI45R7wgB2gso4C/sJQCic8NGvrjv7HsVPAvq/PvhN/PMtiFs2Nd9eBH9UtOlWZlhLDiaoK1lNQn/InpxuQYK8RcMoiHh/DHrvEMTAviP9YXUj5htzZkiE0QhaNkAXXm1WC4Qs9eEXsyJiZHoFzp9Wt7+QUz6kcr42qRIY/kM5iBwRD8uJeAp8p8Sn7kQw30vJGwiIMR7SmHQB9ViiAHFiY9nv3Blh7ywLgcHubtzkSnj7ibL29vp07HA1FDqqgrUCF609XUbPVsqcEIF1AsyEyQOms9i7gHpWnfzWZgGBRcBGgblUDM4kqZk9DQ2bSrJj03WmfEvxpXOoX+1bv6SypxqJI7kR1pqhzTAJ+GChi0A1stjJeCeh6EMM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(36756003)(38100700002)(8936002)(5660300002)(8676002)(66556008)(66476007)(4326008)(66946007)(31686004)(86362001)(31696002)(316002)(478600001)(6666004)(66574015)(41300700001)(83380400001)(2906002)(186003)(6486002)(6506007)(6512007)(26005)(6916009)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVZ0U0o1a2pSQWhaQjlaUEJwcTNXWWNVM1hIcW1ibTJIK1lYQWk5ZDhwMDZB?=
 =?utf-8?B?KzZITjUvbDl1YTkxdnBCSWU1ajlybzY4a1laV3BGbEtCUmdIZHJRWkR3M1dU?=
 =?utf-8?B?RVI3azh5K3pOblJkVmlsV09SYzdWbHQ5MWliNVZaNlRETlJBamtvZ2xJUjRH?=
 =?utf-8?B?RzkyN0JWeXZhZURVUWRQaUhSb0Zhck80R0s5ei9EbzhnTmZXd0FFSHR6bzRj?=
 =?utf-8?B?cEZuQWowVUtleEdzWWlVdkVlckk5emR2YndWazE4bTZjeXBDeHpvSjMwUkNE?=
 =?utf-8?B?cXJKa1JmdWJNbThYRXBEdVhadFlUYVZhSTVwUTVJM0N1MnU0d1NWdDVDSVRu?=
 =?utf-8?B?YnpkbkFqOEMxVFRBK1pBczdJM1FkVzFPRVFGdGo3UTJQeEVtQ3RsNGdQdFRG?=
 =?utf-8?B?Z2pVWFVJUzJEWmhCSE1FSStmRFVKNi81Q2FublkzZ1BOTDloK25Yak03aGp4?=
 =?utf-8?B?VVp0WkErVzE3ZjJZTU8yWjNyL1F0UVlOV2xNUDBlYnlJNTV5b0FlTXhXMlVh?=
 =?utf-8?B?VEpsbUFEWU9ESkMyRUZwK3ZOT2xkZHJKazhNRzhvRmFPaHFnN0RSKzNqSi90?=
 =?utf-8?B?WHh1bC9kZFZGdlVXcUhja2d6b1ZDU09OMERwNDlMMzB6OVNVYmNYNVZJMmV5?=
 =?utf-8?B?Y3RlK1ViZ25OQ3VwT2ZBdFpnRW5kbjFpaXdZblEzeEFUQ0dxdG5EVkovNHF6?=
 =?utf-8?B?SEwyTU9OMHJlNXRZSEJ2dG5sOVlRZmUzR0ErdFBnWUR1TjlqNEJzcjArNEVm?=
 =?utf-8?B?dGdzUm81cjF2Q0tQODhYWGlJM2VaU05nQmhyVnlxTDZ1OFE1T3lNbUtOODhW?=
 =?utf-8?B?MEdKRm1SaTI4NWFjY0g5TFpMR2xYbmlydVZBejZWTW5wdHdBMHJPOWg2RTJx?=
 =?utf-8?B?SFdIWmttMmZiSHVHd0dSZi92bTFxcEM0aC8vdkNObTZoUjFNSmJXSEpZdnBl?=
 =?utf-8?B?L0JRVEdxWDlhMnpEQ1dlNktFOXJlazBNVnh0SnEyRHBFa2pHMzZIK1dWWUsw?=
 =?utf-8?B?TitnVUxuY2tkMDVpNnRwOHRMZ3FuT1hTZ0tjL0d4SDQ5RitZcTZtK1Y5S2pG?=
 =?utf-8?B?NE5xOEZYM0l0dXpsNGcxS3pPV21WbmVkbkFpT084T01ieisvLzNQRERyc2lh?=
 =?utf-8?B?QlpFM1VlTDRieXl2bE42a0xiZTZTN2tYdzlRZ1MrbzI5M2tlMGhkbFYreDRX?=
 =?utf-8?B?SjBVRHR1aG1sVGRYakp4ZXNOQ1dNM1h3akxFTlN2QVh0UXV2czBXbmZtZlNN?=
 =?utf-8?B?alBrZFNrenhrZWNEb2VPQWxjeENEVklVaWlJdS9vRWh0T3pWQzJXNzhrdFQ3?=
 =?utf-8?B?bXhPZVdwMGYyTXZoNGVMR3pVdEZPNnlLWmRzMjFlWTBYdFUrcCsySGtWUmow?=
 =?utf-8?B?K3kwWm9Qd1lBN1dRL3VRZ3FKc3NWWHN6dmdWUWF2N0JkNGVWVklkd1JCYit2?=
 =?utf-8?B?REMyaDI4cGhDbS9XQVFnK1o0YUZ2S2Uzc2lYL0tHRGtyWUR6SGF2V2RVU3E2?=
 =?utf-8?B?VVIvQmh4Y1E2WFIxRThhL201SGNIYU50YXdRb0Y3RTBIK29mSjB5cXVub21k?=
 =?utf-8?B?WmZNdjlmWmcwM1ZoVVYzZ3U4dnpaUnRGWm1BVDhaWUZsZld0VXpDeWpFS3Qw?=
 =?utf-8?B?Y3FzQ0VTc1lYZWFvWEJ2eEQ1cklpRi9TbVlWSTV6QVhYK3JrUmNzRWNrdXVG?=
 =?utf-8?B?TzVuZWVwWmhRdytpRzZLT3VuWEw0QktQVm1Ma3lneGRMR1JjY0NpbENsTWQy?=
 =?utf-8?B?RyszeXJBRktHOVc0MkRFMEc1SU5iM3d0R2VqRER6eHE5UE5PSkhtOEYwTUFm?=
 =?utf-8?B?NHFNTnYrQUY5M2FRZHUrbFlMWDc3alFmOHErZzV2M1FXSnlNdVJjb0dONGhE?=
 =?utf-8?B?c1JCdlRFQ1lvTklod2RRbjM1aERkekZTcE9CYzVsZkNKaWRZL0NIcDBLTzRM?=
 =?utf-8?B?bW03b0hsOFVhZXl6eDFLNXFTZTNSSVg3a3Q2cWpVUE0vTmVRZ0p4Y0ZUZnJM?=
 =?utf-8?B?cFhPYW1EZXBnQWxBRVJCN3hZUWhiQWFkUnJ2UURkRExkWndqdHZJN2JtV3ZU?=
 =?utf-8?B?bHhjRm1rWnJoY0tBemZ5YWl3RmhRWDhtVm0yTm8yekg0VkxhRVJzbHF0Wk9D?=
 =?utf-8?Q?29xLFgB7PPeXXpvcoaW0qgXiP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d6829f-0703-4a3a-1314-08da659d1f30
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 13:31:13.6205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONLnvBmNg3dAZpQlCgD9HPDhvq1zu8GZyfPkFzqt6i93bObsC1G0aNitryoeW4cc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5208
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.22 um 15:19 schrieb Mauro Carvalho Chehab:
> On Thu, 14 Jul 2022 15:08:48 +0200
> Christian König <christian.koenig@amd.com> wrote:
>
>> Hi Mauro,
>>
>> well the last time I checked drm-tip was clean.
>>
>> The revert is necessary because we had some problems with the commit
>> which we couldn't fix in the 5.19 cycle.
> I see. I don't have any issues with the patch itself, provided that drm-tip
> build doesn't break ;-)
>
>> I will double check drm-tip once more.
> Did a new rebase on the top of:
> 	bc04f10d22f7 (drm-tip/drm-tip) drm-tip: 2022y-07m-14d-12h-41m-36s UTC integration manifest

I have absolutely no idea what's going wrong here.

After just running "dim rebuild-tip" once more my drm-tip is at:

commit bc04f10d22f7d8a6d76abe431cfb6ef6ba67ad0c (drm-tip/drm-tip, drm-tip)
Author: Christian König <christian.koenig@amd.com>
Date:   Thu Jul 14 14:42:33 2022 +0200

     drm-tip: 2022y-07m-14d-12h-41m-36s UTC integration manifest

And that's compiling perfectly fine.

Regards,
Christian.

>
> And it is still broken on amdgpu_vram_mgr.c, but now with different issues:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function ‘amdgpu_vram_mgr_new’:
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:465:13: error: ‘i’ undeclared (first use in this function)
>    465 |         if (i == 1)
>        |             ^
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:465:13: note: each undeclared identifier is reported only once for each function it appears in
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:466:17: error: ‘node’ undeclared (first use in this function)
>    466 |                 node->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
>        |                 ^~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:365:33: error: unused variable ‘block’ [-Werror=unused-variable]
>    365 |         struct drm_buddy_block *block;
>        |                                 ^~~~~
> cc1: all warnings being treated as errors
>
> Regards,
> Mauro

