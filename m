Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA954D18C6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 14:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307CB10E381;
	Tue,  8 Mar 2022 13:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C0610E2CA;
 Tue,  8 Mar 2022 13:10:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1mWDsuI4E7zU/fBWb3U/dxhyrIG70sCj/jNhZ6H6mEaY8HIMP8PYJGr4sN5Ar4Z6LgDxIH3pR8X5rF+I55MlgCLtpGm4/LHP/RPTuZfVZ6wq+X106DQ6cSI/dHjhqB4HX9wQSm1EQyWX1vCeIn0hiO6lGPM4Tvx1CcDrui6hKHlFJGzTXiC2HasAmdy0GFVQPQlA7M88JUqMWxfdg6gQeFuvBq0augxVMvEprFkjre6xyWHTLi9oaNv063E7xylqxWWU7aZXb158SOoNe7I0jFZ8AdZTP5tcVFPxy+GIXCHwcqfXBFjJD/itIMPcthx2GVqkH2BLjshKrr379Pq1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZwl8wFCpWz5b8HzwvINcMlHiMLLe2gogkMEWGWRyr8=;
 b=AylM466kkZKrxcEllosoFx/a/+EL0XK7h0CuSN6wqk+1/IE67vHdEIY53arNHPqogVbb93QdiqzKEvx7wcaEOy6AM5lQ9pOKZMr+0DZbrFKLzlkeG5h3E/TF3rJ7G1OBByYP+W6Ku9fJ042lTcGCrvzJl6v+97ivOAoULK5Lwj7soxLLd320f9hBGPzXKK8yqSkMjvcPFpvytGfsXkGH96/Irw+wtAEyBn5iVI7Ydc6E13WQcKB1H1YqtOwPKRCKPySptWarscFlBdhKJUqGIpus2CGgboN+Sfe1Z36BilWaZGK6UBEB7FHGBI3PyGxj17LiPQ2i/+BweEbXSxsFRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZwl8wFCpWz5b8HzwvINcMlHiMLLe2gogkMEWGWRyr8=;
 b=whKNf54XzLP8UkmM2s1MIxwkFQiRA8B+S01oFbYeupe7F/XdCOahevc931F5P+nKDjJTVQa3WtC1/ARZfn036gA3Y+m2dzetwHo2NA14Ngl9FhLfT6ZVSRKiR+CnDZO+Ph3LVqfREqY2CH41uEl6FfGvtAkU+7E7o1+U6+sf4Zc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by MN2PR12MB4159.namprd12.prod.outlook.com (2603:10b6:208:1da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 13:10:20 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::d56d:98df:8ef5:14f1]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::d56d:98df:8ef5:14f1%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 13:10:20 +0000
Message-ID: <ef20c307-1e90-c677-4d54-256a4fea4ca4@amd.com>
Date: Tue, 8 Mar 2022 14:10:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/doc: pull in drm_buddy.c
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220208151228.344997-1-matthew.auld@intel.com>
 <4dfd15b6-e402-f15d-f793-6d31e591fb20@amd.com>
 <8189fc23-f9d7-9daf-f3a7-8e5054425e0d@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <8189fc23-f9d7-9daf-f3a7-8e5054425e0d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR07CA0005.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::32) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ab75365-2576-4003-2fc6-08da0104feef
X-MS-TrafficTypeDiagnostic: MN2PR12MB4159:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB41590770C85D777B3C29DBD683099@MN2PR12MB4159.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aLnE6g9J7ULOVDGy+NcPfae1imhrlrJ9QiYgCxZN2LpLwRmttWh8u0kdoiKzwV6jLZqUO5ANWcnlVEVUh7sSo+DQkxFt4Th2gLaydf7liK8IDzloMTRV9wYk0PS0T4lHh51U7ku1PC/BUQVE34joi0yFjzVcRjH3hlJnzp5Ter+m3vc9Nf3wFRSR/FFFEFiIIkpUoA9cjZJ+kDxwrQrQaRdh+lsIRhwy9hB/FlSxP5emHphV4EEhyY+auG1J7uaQU60TRpx3X5AnOIJ7Efx25t/o2zestbU4j9FOkOkp1iwIMKE8bFixS6SI5I3YRwp8TSANLWH9DrdBue63uE8mOz/7vCMerqG4UuixpZm/w+hxidDNkVQGIRsCTSLbiqyLa1WJ81yUwGP7pN//uIaJOwWzGQ1OUM71FfaTCHixhWfHmCwp9KG2ggfidcriLK5AYchBnxL0ZfAKF4XWzs8aQv1M3TtymIuhbnQu6GY0WHuvRkc/Qd24xEgAKJB0XPGzqtGYMkWyMNRzdOx7PUwGGFmAfDHljGQrW3K1NLGLY4DLLWoLW+Z9hQvLnMnpl4n9W7UVb3O6j9qQlqWf6LbXRvMVTmrBEoWoVFIMWEJ/JZvwkdmAkt0amrIZWqIk2opQAI3JTajCqoP4h7HGmkZJHliaF+pXG5P32y60uBb2SSa4CNJ6YEKjj5a5a6NQ1LzCqhihiE+k9ypr7Hwc1iuVdBI50K7ISu4o4W+dAlKw/w/ESY1V/wm1Br+TmCHY6ONb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6666004)(2616005)(186003)(26005)(6512007)(36756003)(53546011)(508600001)(31696002)(8676002)(8936002)(86362001)(54906003)(6486002)(66556008)(66476007)(4326008)(66946007)(38100700002)(5660300002)(316002)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmU1LzNhaWhmdUNKUHo0Qmc0czVSK3JlenVDcExBSkRqSm5teGVpT0gwMUVl?=
 =?utf-8?B?emJvOC95eXFia1lsVDlmQnBWTGVhdHRJZmo1cTVKR1A2cEFIMXlmamVwMkNS?=
 =?utf-8?B?ekVnd09wdVpBaEtla2FmRCtLOUFGSDhQbmV5S3BHMVh1YVVOcjVKd1hjZUFZ?=
 =?utf-8?B?cXl6ZHc0N0svb1RhWjNvNmdXTENaWFlMMWJyNGtXWkVxKzdtVGtKVXF0TUl1?=
 =?utf-8?B?eFRYR3hTdFJXcUVCdDNJWGovRDA5Tk12QXhqcDh0K2p3WDJIcEhjSG9VNlky?=
 =?utf-8?B?cFVCak1GS3BEWWlIZ09KQy8rNTZWM0Y1b2hiRHhSSzk1Q2ZJYXJCNTZ4OEMv?=
 =?utf-8?B?WWFIekw2VWRCUHp3ZVpHcFdnVkI5VkVwUFlTNytMTE5MNFJZdE5IVkppZnBk?=
 =?utf-8?B?aXk4Y2pPWGtUaUxsak9hSmZLRWxRaFZRbjRaanhqSEUzeGtTWWtxNHVxMCtx?=
 =?utf-8?B?UU1GSm9kbWJIdHY3YkZxUWkxZHN1bUNRZHRzZS9FSHdCUzdhRnVETVUvTXdF?=
 =?utf-8?B?YXo4SmxVR2gyLzdMa0hBeDN6VmxyQkVHTXlpWWN0THp4MEJGY1NUQmlJZU1F?=
 =?utf-8?B?L0V6eXBQRHB2SW4xSjlQLzNZTG5RWW1zN1JZZEdyK3FSdm5LZUpYSE1aWDRj?=
 =?utf-8?B?alh4OWdwOElOblVYeVRXZEhVZG1KWFZ5SzNZR1RQR2hKMVRtMGplMGlpSVF1?=
 =?utf-8?B?dHh0QnFTYmpNUnBaQ1IvNlp6UUpVWEt1VDlxTE80cDRzaEZFTmpCVGVzZWpz?=
 =?utf-8?B?SkRaeHg2cWFzOXQ2d1Z0VVBOU2MzM0NHbDRSdzZhWGQ3ekRpV2xQeEhKN1hw?=
 =?utf-8?B?Zkw4UnFza3VuSjNSbWtHY2hxZXUwWDBldDlmN0NhUy9udHFoQ042b3J4WjI5?=
 =?utf-8?B?ZHNCbGxRNk9vVG0vSVFGRy81TjlJN1h3VmNKOWJUdFJiYUVUakQycVJiQkRP?=
 =?utf-8?B?WFMzRGM3elA0UDN3dzlDVVZURmhodWRBdTlWRjJncG5CK3RDZndWUVlFRGJP?=
 =?utf-8?B?VDNMR2pJTDkyNVdZTDRSdmIwNE4xVitoLzZrR2txbEtGNlFyWFFLQlhVUHNT?=
 =?utf-8?B?bWlDc2RWVUo0VE4wQS9qRk1pVWxOVm1pUE5GaXZCZW14QmdOVEtLbW53NHZr?=
 =?utf-8?B?am1UUVVNNDlGMjhPVy9LUUxxYVdhRGdHd3FncnpXd2RLbzhaWWlJQjNLSkdw?=
 =?utf-8?B?eFVHUzVFOTVaZllRWk1OVVprL2wybG1XZHNzalpDd1Q1dGg2WDhndmVFQ0w5?=
 =?utf-8?B?MHZ6c3FUT2h5MVJWZUlXMXlzZiswNE9QdWhram5vNFFjNVJJeW5vaUhjNm5W?=
 =?utf-8?B?SU9PV2dQbHdYMkFlOVVQNVJSOGdYYzhtMFoxNCtxaytlUFhKalc1c3NqZUhk?=
 =?utf-8?B?dHN1Z1VQOFFXdHduci9FaVVyWGhDUWk0Nkk2SUZyNllCYm1NN09xT2NmcGV1?=
 =?utf-8?B?Q040SjExT3haWm5CQVp4a3k0Z3FiVm45dEtBOEcwVjZyRUQ2MmF4VXB3QlQ1?=
 =?utf-8?B?UDZWNUgwa2l3cUx0SjdmUE5kSjB6L0JmcGRmUlFKRTQ0bWt2WUhqYUtwT0k2?=
 =?utf-8?B?ajZteHpUMUlSVzZSMzQxNTZJcWthSDMxbC9CV1ZjWmNRYkUxaFllOUE4bnJj?=
 =?utf-8?B?a1ZFbmVpQlRHVnFHTHcvQTZYTWlXa2MwbDRhLzNUeEhGVkhQeVIwU2ZidEhp?=
 =?utf-8?B?MEN6bC80UFRWWURMS0RMMGlaeVp0N2hUMW4yOHFWNGJkVTViWTVuMlduNFJ2?=
 =?utf-8?B?TitvbXVwZGU0a0FRL3FWZ3VNZXphMmViRGpxbFMzUTdLMHdBU0p0MlJjSWgx?=
 =?utf-8?B?b3pUOG1sOVBRQVU4cUtwMkRnQzk3UlAzRktFempYRmlOaGh2Q0tyN21aZE5K?=
 =?utf-8?B?elFFYkxDRmRRVzRYNnVIeDQ0Mm9Ib0xuYWJteTlPQTMzaFJyWUhMbDNDWVhW?=
 =?utf-8?B?S212d2VCalcxZFU1N0NYWWVhY0FJVTk3Mm1sZHI1c0RJamRwNlE4ZlR1SWhK?=
 =?utf-8?B?S2JOZkkyRjZmVEsvMWI2SWZFSTNtQVNIeHBpS3pJeGw5b0orSzJjbmZXWWIy?=
 =?utf-8?B?RVYrcHgzZ2wvQ29Zd2FqdzNkdnBVQXdOSkp1MmFQZjlkRVBmWENZczFiVlRK?=
 =?utf-8?Q?wAVU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab75365-2576-4003-2fc6-08da0104feef
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 13:10:19.9618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVQXDlLTn417WTnKJEPzataE+wcCV639NWNv3uxPfq9sbT4DjZwykMkdQ+udBFxa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4159
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
Cc: dri-devel@lists.freedesktop.org,
 Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.03.22 um 13:51 schrieb Matthew Auld:
> On 09/02/2022 07:32, Christian König wrote:
>> Am 08.02.22 um 16:12 schrieb Matthew Auld:
>>> Make sure we pull in the kernel-doc for this.
>>>
>>> Reported-by: Daniel Vetter <daniel@ffwll.ch>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> Thanks. Could you also push this?

Done.

>
>>
>>> ---
>>>   Documentation/gpu/drm-mm.rst | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/Documentation/gpu/drm-mm.rst 
>>> b/Documentation/gpu/drm-mm.rst
>>> index 198bcc1affa1..f32ccce5722d 100644
>>> --- a/Documentation/gpu/drm-mm.rst
>>> +++ b/Documentation/gpu/drm-mm.rst
>>> @@ -466,6 +466,15 @@ DRM MM Range Allocator Function References
>>>   .. kernel-doc:: drivers/gpu/drm/drm_mm.c
>>>      :export:
>>> +DRM Buddy Allocator
>>> +===================
>>> +
>>> +DRM Buddy Function References
>>> +-----------------------------
>>> +
>>> +.. kernel-doc:: drivers/gpu/drm/drm_buddy.c
>>> +   :export:
>>> +
>>>   DRM Cache Handling and Fast WC memcpy()
>>>   =======================================
>>

