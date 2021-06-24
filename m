Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6C63B3060
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 15:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843696EB98;
	Thu, 24 Jun 2021 13:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07976EB94;
 Thu, 24 Jun 2021 13:45:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ga9VAeRuA931bC9803EWKKZs/zSPEkzjoPdyQNXtAzjJ3AkFwrxl/TMPyFNaXeNjMeQzMVruXWbZCFFOFR5iDyFTKdJPLS8PQ5UKUqWA5FH13Gs5R7m2jnZ0YYm1JDlxqLUlroXHFw/wdmanT3uA2uZXHN1i0EkD+b3vptzbTdUg6XkOth/7ibWCnNWqpuZ3YUuU8Si3rGFKNwiIWU8qJrOi0QVjSsZaBlBv7Zrz+2PDSMliAc+obE1/6MDWCe48SE89LVMhPDQI1qlJb7h8juVxpAlGPe65IMENRsz/Qz6Xv0manicJyB/o+bssOHNzWskv538m2Dn1ObZMcAWnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryqU+BOEdd9+7nifpRyMst6M7gxhyYAb8S7MsqnYLVI=;
 b=IThyOJVN5ZxgnH0Qlf1JrOvxeazOvhjGk1HKH/21hPxNKm4vgDtqt0spQMmkgixBmvTrt6DX2k0hxQhfPYYTF6s+Nss9+Vhz7nsnKqpN5hUj4BzcTMKlKb883EiyDzg7KHdnguS7B8rsjtWUA7BIdeGvnLEK8IZypAlXWvMh9LiSgcjr0uOAy8S9StSJgBVJqytL1h6g3Tqu/Ixpqh7t0QGIRVKcdVmnZinSCcRqlAnXu3/wEcUsSFncwws2nXXe+Ucus/3LwGkySa/HC/YL9AkOmwo6dP6pkYB547aZADGHSmD3aD1sse0xsltCGmsNr2o7+dwVPL3L+PxApFF/XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryqU+BOEdd9+7nifpRyMst6M7gxhyYAb8S7MsqnYLVI=;
 b=xzSs6JTbKsgL/fIzq7zUcfgku3kwDhkD3JSk5EcCPUExyBv1y9I57GQAn6Z3tWC7MxeSgpwnaxAEbcom082amWBer6M8hjKsJKpkUfPUc7NKYGmRgs+ZLI52RKY+UgqX6eOPSvPfC7OGEYj7O2dZh7hGLl2O1xOzJ+V8N7X+hpo=
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3695.namprd12.prod.outlook.com (2603:10b6:208:15a::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 24 Jun
 2021 13:45:37 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 13:45:37 +0000
Subject: Re: [PATCH 14/15] drm/gem: Tiny kernel clarification for
 drm_gem_fence_array_add
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-15-daniel.vetter@ffwll.ch>
 <4ed8f1d3-eb9c-74d6-d93f-ee28971af7f6@amd.com>
 <YNR9hSMVmzYmotF0@phenom.ffwll.local>
 <4fba7964-3306-4e2a-f87e-906ebedbe7fe@amd.com>
 <YNSJaizc5BpmTM8p@phenom.ffwll.local>
 <3800d89a-3591-daf5-6a9a-292f95c58619@amd.com>
 <YNSLmQXuowJLP8Se@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b34a1a93-3c78-f7a3-a026-bea7b74ebb77@amd.com>
Date: Thu, 24 Jun 2021 15:45:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YNSLmQXuowJLP8Se@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8a1c:e700:29c4:44b6]
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8a1c:e700:29c4:44b6]
 (2a02:908:1252:fb60:8a1c:e700:29c4:44b6) by
 FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.8 via Frontend Transport; Thu, 24 Jun 2021 13:45:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdcc40f6-739e-481d-6e44-08d93716591b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3695:
X-Microsoft-Antispam-PRVS: <MN2PR12MB36950516F2FD28505D2CC71583079@MN2PR12MB3695.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PfpOs2NMVHjr7bNohHd78yRqrNy0BIIQsnJAB0jIvKHBykTUSK1polNFvGYZhVgrCAmIlOsY9VoYze1xHf/plC0bpgLfQ/Jmexb+xGGrJVQIXZvHkaeVypf5ILuRNxNvDvKs2+3CdrFnGxywmileR8Axb9V2H8ECnsQGDKvD+HIgKk2s9RojJBDxM0PazXO9dygaBrvueFc35P/VyS9lA4bPR0tP6ESg5jZHMlCmUN29BekLGk9jrNflCw8dBeqkZsSf0I3q4TbNquMxoIwQuaeYoc9GqbqYxOcL8an5vD4rW+1QgADfMNhA1KGo38Sd6qZpV8e6u4Fp+a7yBndRzXwIHEuA7+N/9N3uCNJ5CZuqkhhhDsfVzkYuSCoRPTFNKdEUAjJgXi8mIAiju5uFHP50F6uFt0WrZbJNJed8Ij9p+/e46N8LV3gGJb+MdfuXfRQmZvrX6HtBU0BoDfnSZiQB35Sfi96an2XsxY9B2x6vPTDQxzfkVQQjZrTS5wE51+q3Ra4h4duYJ9NtrCK4Hw9qy8ZyWkM4F16UCtqmXfkMgg+bo3lpBn4Dd/Us9a9JdKreda62Dw9bFQQH1AViYH8bWCIDYgLM9USic0mhzzGAEFdmOal/yhHZbjrsk4PwBqjANH8bRi3z73MTd74JCeT3bHH6Cgoq1EzEl+MfLcXYZP03X1DiKY4XtoZfKPeLWx2A8y4zvBvusqIxlstMjDNn2g33PZi0+w9wL7jkKFV2dHb5jsdzPmRGhp+slINr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(8936002)(7416002)(54906003)(5660300002)(316002)(86362001)(186003)(31696002)(16526019)(6666004)(2616005)(6486002)(2906002)(478600001)(38100700002)(66476007)(66556008)(31686004)(66946007)(6916009)(4326008)(36756003)(83380400001)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjF3WnVFTjR1cFJXeEdhbVVZbU9wWnF1SHppV2x5VmFteHNKQXhUeWJUcTNs?=
 =?utf-8?B?Y0xleHhWMSthTmtwVVpHdVI5ckF2Y2prUWxqRENyZU5SK2lOS0dVYkJNekxF?=
 =?utf-8?B?QWgwZGI4dWNQR3BNN0pOSndqcHZxS091RUhLeXJxdDJBbVdVbnFkVWF3cjdW?=
 =?utf-8?B?cEplb2MzTjc0ODEzemhZNUxtbDJqcm0wb2hreDdNY0JyMTlseXh6Z2V3YzJs?=
 =?utf-8?B?TGFQQklmZEdUZWlWOHFlTXJBdFBRREFMeXMrbEZXbzV5Yldrb05JRFVuNXlO?=
 =?utf-8?B?eWlzQ1o3UklFNGNRWjRWb2ozQ2d5WDIvOVJLSDVLcDlwY09tR1lnakFXTHEy?=
 =?utf-8?B?ZUQ2cmRlT1NRWnNLNU83K21MRjV5LzB3N0hGdzhJcmhldzBOUmlnQ2FWWHhO?=
 =?utf-8?B?SS92ZGYzRlQxTUJISjEvblcwOW9sNWdkVXZZZGdxdGhPZjdObnAwNk1MNlhv?=
 =?utf-8?B?bHh4Tk1yeUQ2V1dLWURDbjVsbk00VmpIaXkvZjFwNm9VbFY5Y05MUGRiTUlu?=
 =?utf-8?B?Z1c5dDl5VEdVajFkR2xFMHlnOFFMa01LNXkvMUxtRkQxZW85TzU5ejB0bzVn?=
 =?utf-8?B?RlMybWFIS3c4S0NpZWlkVHdjRXU5dk1VRlJ6bTNvSUhLazh5SFRXbExYVHll?=
 =?utf-8?B?bm9lL010UTkxZThQTWhxRmo1Um9rcTRwVGorVUJZV01rU3RKeW9kTm9PaU1r?=
 =?utf-8?B?aFFock1RM3NuNUJCRXNLbGYyUVRYUVZzOXVRVWRrSWJqMUxLbGlUL0cvcXZQ?=
 =?utf-8?B?YVBkOElSRUF2R3pGRlhzdEJoWkpoTkRHZHRnclJIMGNaVW5rWFRBMzRMaVBC?=
 =?utf-8?B?WHFaNFhDU3kwc21Bb1JqWHJUNDkxYUQwUEFRY0ZvamhYb2VRMlUvUzNPaDhX?=
 =?utf-8?B?S3h0YkY1S1E2TjdtbjQ4Z3NML2Zxb05oVmFyZ0RxZGRNWkpiUUFhdnl0ZlQy?=
 =?utf-8?B?NEhvN1BZS2Y0K1g4OE15SnJ2SEhYa2c0Vks5ZWw1UFk0UzgyR1A1UkVJVTlj?=
 =?utf-8?B?aERlbkY4QVhkRnVBN3NkYzd1clNaSHNoejl3a0diY2k3ZEZHNm5Zb0V4MXNH?=
 =?utf-8?B?RUQ2TFJGejFQdDBCZWgxaFp4S3lqeEtGeE5mVnk4ZVB3NGxpWkxmeTl1dkVz?=
 =?utf-8?B?NUZCRExJRkM5TERLemZsUUdoK212VVloK1NWQzhEREJubHRId1lXUEFsUGlv?=
 =?utf-8?B?UGpaT0hhOTdCOGNsdHNhd3hHU3NVVjdKK3pHbHF1MkNCaUJPOGUvYThSdFZW?=
 =?utf-8?B?ZURabDlHZ0VDeDZNSVh2eEZIektmbTRNLy9hYW1NMTN0YU9paVcvbWhUYk9i?=
 =?utf-8?B?U1dmZmk4aUlNRFZVbHBLbGVBQUpNbW0vTGo3aWhBaDd0YWoxWEErZG5oMmNq?=
 =?utf-8?B?SnNzbEN2a1haRU5oNzVtZlhtam5mbFh5Tk1Qa1J6VVl3dXh5dzJRYUk5OFdD?=
 =?utf-8?B?RVhMZTkzd1FxL0JhUTlGR3RZdWhWdzZxOWI4alpTR0lwVUVyWFhHN3ZEakZt?=
 =?utf-8?B?NFN0RFRzU0ZzNnRPR09ncXFaZTFCUjRtT3JwcitxdEVQM2l1TVdyeFZpdGxK?=
 =?utf-8?B?MXBDeVBoNkVieC82WUVyMGpXWXRmQituVEJZalkwVmMrY2IxLzcybzVndVJl?=
 =?utf-8?B?ZkM4MHNBMjRLMEpXeDhUd2NBcURwaGtBTHVOcUUrTG5VL3FEdlNOSkduQkFT?=
 =?utf-8?B?V2FOcXZTUzF6S2YrMVdJRlNjS0djSkFBNTQxd0NxNFFoc0lmWGxIbW9DdUFG?=
 =?utf-8?B?NFRtS2tCYVJ6SVBlcEN1bE1ZM0pLT0gvQnozTGxnem9XTUhMSDFQSFcwLzZP?=
 =?utf-8?B?NWJ1bjkwNlBGYXlOR25uQmFNVFJxd0p6ZTFhMmRMM0c1VkxRa1oxU2lNK04r?=
 =?utf-8?Q?Y3m06I0LXx8j3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdcc40f6-739e-481d-6e44-08d93716591b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 13:45:37.5542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0dagUiRbEPwnXk4/rTBxD1QrPDv8ar1WKbP4MvzNB8kspgIhw6SGYi42ZMA4o+J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3695
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.06.21 um 15:41 schrieb Daniel Vetter:
> On Thu, Jun 24, 2021 at 03:35:19PM +0200, Christian König wrote:
>> Am 24.06.21 um 15:32 schrieb Daniel Vetter:
>>> On Thu, Jun 24, 2021 at 02:48:54PM +0200, Christian König wrote:
>>>> Am 24.06.21 um 14:41 schrieb Daniel Vetter:
>>>>> On Wed, Jun 23, 2021 at 10:42:50AM +0200, Christian König wrote:
>>>>>> Am 22.06.21 um 18:55 schrieb Daniel Vetter:
>>>>>>> Spotted while trying to convert panfrost to these.
>>>>>>>
>>>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>>>> Cc: Lucas Stach <l.stach@pengutronix.de>
>>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>> Cc: David Airlie <airlied@linux.ie>
>>>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/drm_gem.c | 3 +++
>>>>>>>      1 file changed, 3 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>>>> index ba2e64ed8b47..68deb1de8235 100644
>>>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>>>> @@ -1302,6 +1302,9 @@ EXPORT_SYMBOL(drm_gem_unlock_reservations);
>>>>>>>       * @fence_array: array of dma_fence * for the job to block on.
>>>>>>>       * @fence: the dma_fence to add to the list of dependencies.
>>>>>>>       *
>>>>>>> + * This functions consumes the reference for @fence both on success and error
>>>>>>> + * cases.
>>>>>>> + *
>>>>>> Oh, the later is a bit ugly I think. But good to know.
>>>>>>
>>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>> Merged to drm-misc-next, thanks for taking a look. Can you perhaps take a
>>>>> look at the drm/armada patch too, then I think I have reviews/acks for all
>>>>> of them?
>>>> What are you talking about? I only see drm/armada patches for the irq stuff
>>>> Thomas is working on.
>>> There was one in this series, but Maxime was quicker. I'm going to apply
>>> all the remaining ones now. After that I'll send out a patch set to add
>>> some dependency tracking to drm_sched_job so that there's not so much
>>> copypasta going on there. I stumbled over that when reviewing how we
>>> handle dependencies.
>> Do you mean a common container for dma_fence objects a drm_sched_job depends
>> on?
> Yup. Well the real usefulness is the interfaces, so that you can just grep
> for those when trying to figure out htf a driver handles its implicit
> dependencies. And amdgpu is unfortunately going to be a bit in the cold
> because it's special (but should be able to benefit too, just more than
> 1-2 patches to convert it over).

I had that on the TODO list for quite a while as well.

Essentially extracting what the dma_resv_list object is doing into a new 
object (but maybe without RCU).

Christian.

>
> Anyway I'm going to type the cover letter rsn.
> -Daniel

