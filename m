Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B9E7A0F9D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 23:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F64410E588;
	Thu, 14 Sep 2023 21:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF48710E14B;
 Thu, 14 Sep 2023 21:12:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4sZ0F/UHE+GzG98Z1gXU0qf7PwJS0ZMlE0zK1HAOaoYWwfTOLyg8RRt1cQ2rUZz0CaqPbPDn2ev7GI/JXYpBPDzpTtT08Vfav8q2P6tD7v7TvATiioHHK0KvWRABSN96run8Jhy0e3FCdXnsUkcEIb2LLz1v7aqK96kw4k7c6Y/8qNdMEkt5MuD3CMBqt7Osil/rCwaNwLgf7ULGpKjc6mnFFZ3CfvPCC+229qTf3trre/k4eDS/F/mkbdy9FOQVXsEzzu5RCHot5YaRKXM7fi5X6xJ1HPgIgJhRTxb/e5gjFONamLTpb0rIR/njvAHnJLJhqYR+kflvGN7aNDYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8dBQPV5gJUP6LDKffD9+MuU8hEv6PfCEPYR5gky6rY=;
 b=OaaKX070td9wS2WjRd5MWQPCpaWvv/9eim2/g7P5Kw7C4kh112JpCq6iZeHxV+oH5Y6NKgZDfvBajO0qNzxOcJqta7n+fORm63yvHvVaWNK9kLCv1WK59wpSPCoUrz+Uw+Za0c0WgjePCjC2Ad9dcUXLCD18ZFtmGpNPlhhCLIM/ZwrTt/E9bjQuE85d/fBdPDIC31XuoVWMauRR4De0qpbkkxXf/vsZ42d58HIIGQWJKi1Jjw2qlpCVYcsQka1llVGj+cnc4zHNmN8ygr53pD5ZIrXzcD6RzHV7nnz+5iK37VXuh4kWuR5ISRt/5H+zRlZ3s2ycpmqZU/uBhusNIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8dBQPV5gJUP6LDKffD9+MuU8hEv6PfCEPYR5gky6rY=;
 b=jTR0RNWlzUMzROlO7miTW2O5bUYCre9OLuZDmhh3d3bEUMvvUlUbNmLgdc94BnUlhFkf02OJcmN3IXGpivsUIi4OV5F1iOVBY0YSqrEAMQJpQEbI8dTve/MJev4h0F8v0nxcHsvuZIFkI2GOY8vegXB11cwz5b5a+rDDB1mSYmw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6270.namprd12.prod.outlook.com (2603:10b6:208:3c2::20)
 by CH3PR12MB8709.namprd12.prod.outlook.com (2603:10b6:610:17c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Thu, 14 Sep
 2023 21:12:48 +0000
Received: from MN0PR12MB6270.namprd12.prod.outlook.com
 ([fe80::dfbb:d644:5eda:83f8]) by MN0PR12MB6270.namprd12.prod.outlook.com
 ([fe80::dfbb:d644:5eda:83f8%4]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 21:12:48 +0000
Message-ID: <e44d8385-1137-4f41-a3db-9af88ff87bb9@amd.com>
Date: Thu, 14 Sep 2023 17:12:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: fix the ability to use lower resolution
 modes on eDP
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230914175354.102709-1-hamza.mahfooz@amd.com>
 <3630bc42-c04c-4c22-99f2-5dc6bd5d8e2f@amd.com>
 <290648a9-4882-4228-bdbd-1045e20b71f7@amd.com>
In-Reply-To: <290648a9-4882-4228-bdbd-1045e20b71f7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0103.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::12) To MN0PR12MB6270.namprd12.prod.outlook.com
 (2603:10b6:208:3c2::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6270:EE_|CH3PR12MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: f6cab830-f66c-42d6-f796-08dbb5675917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FIj1T5cmO5tm9LvTw8oEWxguG+HHlD0m0RubBvyCPAqO5guKqQpVG4jf9EjSmETIUwoWZ4bN5gkqEH/e9VZ/mMFNHqwnfrA3HiVbDcSC3zvoVldvTsi3lwwodfu02A2GkQY4i2F1tyMPRF9v4QCf+RwPpVE9ahGtQOtAwnfOTcm6Y1OxBlEqKj1PQH7Qe3p2UcDrYmR8KkHFmJAQeKTB+uDP9epcY6KewkbkwX723ezERiHFyUY8Vdm24vh6wIQ79rVP3rtkv4fuDN72mr1VtCUf9IzmiGyS/39ohWArEY83O4lHr6L/Z5JyLc+Wun2MevNzh5ZauCIsZpB9ntGmJzP1cbo9SpgCK3Z80zEEZbn5EXOiZqOO3m7wQGIvTpJcZisTE3Uawx06a1TiQPkKxHSyU6wWw1pfsIiH73USItm80iuxWenTTzTrDi1nZtuMUYksB6i30EH377whV2Ov5LsVr8RZJIqqJoq59LTBHDkB2NSvs8xIOLAa7ee1IWhmmTA+SjEEL8E1V7QCAswsY+UezGpAqbo8GNJzFgxLENKTMxRqoFqZWmnmu2Cy0iTtSFD7vZvCXEjs9pR/YKg/VbK17F8Zc9137/d0+rQznIshtJ3oakoWtCpEtr1CrQN3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6270.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199024)(186009)(1800799009)(4326008)(54906003)(8676002)(8936002)(31686004)(41300700001)(5660300002)(66476007)(66946007)(66556008)(2906002)(44832011)(316002)(6506007)(966005)(478600001)(6666004)(38100700002)(6512007)(53546011)(6486002)(36756003)(26005)(2616005)(83380400001)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzQrWFREa0JTdHJBODEwdDZ0RDZ4b2NyRElXeVpqbU80NjNDck1XQmUvdW5O?=
 =?utf-8?B?RWFTaVNGcmp3R2xBWGhVNnRhVFFwRlBtQkh1WlFCUXRlaXM0RU5iMlM3VUd4?=
 =?utf-8?B?VDlTaGRJblozZk45UnZvaCtMalRTaHdGRlNuZDF6THJOdy9jb0FVcFgrdWFI?=
 =?utf-8?B?NjlJOFUzQWVWRWVlWDdWeUVaakVnREpGS2ZiOFFRbmczVmVZaEp1dFhRNDNM?=
 =?utf-8?B?OXdhREc4cW1CcUF2NllmeWkrckJQbDY3RnFXM1I1ZGtHMzVHU2hBSm91akxW?=
 =?utf-8?B?aEdXNmhveFBRLzk2WFhGMm50ci81ME9hRFFRbUtxc3d2R0Y4bncrb0w4L0F0?=
 =?utf-8?B?U3UwUjVHQVo3eTBwYkRyZk1ZWm13SXpUOVZZcGZYcDErMmsyTXN1Vm83UnBk?=
 =?utf-8?B?Y29wTFV4dkk1UmduaEdyVG5YcG14aUhqalJDWGo5dm1ldXFOVFZraTAzVEdq?=
 =?utf-8?B?RThBVzhSQzFCdSs4R0UvZjNucm95V3RJRm5CbmRoM3ZQQm5MaW1NMXg4N3Uw?=
 =?utf-8?B?Y0xVRUV5azdpeXdoTkd2TE5NaWNNSzl2cS9WdkhOaSs5VG9aNDB3TjlkMS9k?=
 =?utf-8?B?SGtLVXRsKytud01Vb1ZHKzJnWWgvMU5kTzNscjJaTHMxUlI5QUpybzdZNUY5?=
 =?utf-8?B?Y2V1K25jelgzejFSY0M3SDVQZUZQbStNYjY4eXMzZjhCQVVYaWQ1NFR2Tzcz?=
 =?utf-8?B?NmdleVNIY09wZlBJZW5zQi9oNVdkVmtjOVpUQXJFc2dWcHp1a1BpamFmb0Nl?=
 =?utf-8?B?WDNsaldPdGtyamZYODZGSXBBREtnRHdWeVZmWTdIaXpvU2RRSXdxSzRmREdo?=
 =?utf-8?B?MUxNc2VOWlp2OTNYNjJSSWZoNEtIQ2VOWlRpbzZaVWRRQTJjdDFDWXNtUjRO?=
 =?utf-8?B?d1BQOTRNd3dhcFozL1JmdXVkc3kzeXBReHo4SngxUkErZXVsYnZJcjV3cTRF?=
 =?utf-8?B?aS9kNXZsZytvL2lKTEh0NEwyanczY2VUZ2huM2pEaVFvZkdtRkhqQUJXbEYy?=
 =?utf-8?B?N1FqSDZhK1RpZnVlMUhWZmVhdnhEVXlCem1SWFpDdnp6MVN1RUNnNkhYSllt?=
 =?utf-8?B?WHhrTWVYaXJENWFuL2UweGhGNklVRXlJNS9UVHFKcFZtbytLN29Od04rMTls?=
 =?utf-8?B?UUZXSG50c2RabStFeml0ODcyRHBuSnFRSnFhOGZDaGlSZVhuUTBLczBUbUhJ?=
 =?utf-8?B?Q2gzYnBZNEVTcHQ2Mk5TVlhhSlBpaUU0R2JLdDA3VCswQ2FlWGVTMTRLMzRG?=
 =?utf-8?B?WlhIam9KeFV6eWI2MUdZcmVSTkJpRDZWMHZmTUlpWHJXYUNIWVZFSldnb1dL?=
 =?utf-8?B?amVCWE1HZ1N0d0JDRVhscGtmeWhzQW9WbUVENUZFeTJKMTZLaEw0S3o2MVJn?=
 =?utf-8?B?ZHBranZ6Nk82TEtkeURHV3NxMXptaE9MTVRhaHduUjZMUmdhK2RlY0pjaTFU?=
 =?utf-8?B?aUtzZVFERUFEcHNzeDlIMStOY3JRaFlINFg2aEVVNG5NRmFySnUvd3ZTOTNW?=
 =?utf-8?B?TXFVUVpKK1ZoMUVJdjFMUE9uU2hGSU85MzFWdzdEUXY3RWlGWitLbk1VTy8z?=
 =?utf-8?B?WVFNcUN1WmRRQkpxTmVBdWVWRUw0WFFIbHdsZVRsRVVOR1RZWDk3MVZKbVZV?=
 =?utf-8?B?djRkbll5RzJjNUtVMm8xVW1wR2VoVEZWVUE2clJBM01xeU05LzZ5WlBmeVIr?=
 =?utf-8?B?S2FscllNY2NWaTNla0k2WVI1OS9wTDlaTUk1ZlhLNEdHQXp6ZTV6WVFNYndM?=
 =?utf-8?B?dFI4QnNoQnJObUxudG1keUlWUTZWbWN3L3dySXF4Yi9uWCtNRG1yaVNGVEZn?=
 =?utf-8?B?QzdnZXhndmNxOEVqZmhYdk0yYlpJcy96dWR2TXJ5NlNCczFiQ3dNelU0a2tP?=
 =?utf-8?B?NDh4b05CcytMQ1ZWcURlSHhrdVUxZEl3eldvQzBJWUo5anFhWUtQRVp3WDJt?=
 =?utf-8?B?Y3djcm92ejk3ZjNhTlA3amcxQU9pcDF6V2pzMTV0Z2E5NUVsQTlZSEhDOXYw?=
 =?utf-8?B?MExNbXZabUlHM2crMEZSbVNWMmE2VCtIVnh1VlE5OWJoN2lCNUdnTTJvV2Fk?=
 =?utf-8?B?aDZBelRQcUpyemg4ODhrRWNMRUZWNm00Y1ZSdFhURzdkdk5SQ1RWb0w0ZUox?=
 =?utf-8?Q?VxgKNpRl985iec6GkfSwO4AD2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6cab830-f66c-42d6-f796-08dbb5675917
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6270.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 21:12:48.5591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zd6sDWlI/STKZxXCBiZ+9NzhaMb7xdY7WPTYsb9nUMplfs6peAw1g/Mc2F+3JjquivpCoxUVKCJQfdhu8z4mLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8709
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
Cc: Stylon Wang <stylon.wang@amd.com>, Alan Liu <haoping.liu@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 dri-devel@lists.freedesktop.org, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/14/23 17:04, Hamza Mahfooz wrote:
> 
> On 9/14/23 16:40, Harry Wentland wrote:
>> On 2023-09-14 13:53, Hamza Mahfooz wrote:
>>> On eDP we can receive invalid modes from dm_update_crtc_state() for
>>> entirely new streams for which drm_mode_set_crtcinfo() shouldn't be
>>> called on. So, instead of calling drm_mode_set_crtcinfo() from within
>>> create_stream_for_sink() we can instead call it from
>>> amdgpu_dm_connector_mode_valid(). Since, we are guaranteed to only call
>>> drm_mode_set_crtcinfo() for valid modes from that function (invalid
>>> modes are rejected by that callback) and that is the only user
>>> of create_validate_stream_for_sink() that we need to call
>>> drm_mode_set_crtcinfo() for (as before commit cb841d27b876
>>> ("drm/amd/display: Always pass connector_state to stream validation"),
>>> that is the only place where create_validate_stream_for_sink()'s
>>> dm_state was NULL).
>>>
>>
>> I don't seem to see how a NULL dm_state in
>> create_validate_stream_for_sink() (or create_stream_for_sink() for that
>> matter) has an impact on the drm_mode_set_crtcinfo() call. That one 
>> depends
>> on !old_stream and &mode.
> 
> If we look back to commit 4a2df0d1f28e ("drm/amd/display: Fixed
> non-native modes not lighting up") it seems like the intent was to only
> have drm_mode_set_crtcinfo() called for
> amdgpu_dm_connector_mode_valid(). Since, even if we go that far back
> create_stream_for_sink()'s dm_state was only NULL when it was called
> from amdgpu_dm_connector_mode_valid().
> 
>>
>> It does look like &mode is an empty mode if we can't find a 
>> preferred_mode,
>> though. Not sure if that can cause an issue.
> 
> I don't think it should be an issue, since before commit 4a2df0d1f28e
> ("drm/amd/display: Fixed non-native modes not lighting up") we always

I meant to refer to commit bd49f19039c1 ("drm/amd/display: Always set
crtcinfo from create_stream_for_sink") here.

> called drm_mode_set_crtcinfo() in the aforementioned case (and only for 
> that case).
> 
>>
>> Harry
>>
>>> Cc: stable@vger.kernel.org
>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2693
>>> Fixes: cb841d27b876 ("drm/amd/display: Always pass connector_state to 
>>> stream validation")
>>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index 933c9b5d5252..beef4fef7338 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -6128,8 +6128,6 @@ create_stream_for_sink(struct 
>>> amdgpu_dm_connector *aconnector,
>>>       if (recalculate_timing)
>>>           drm_mode_set_crtcinfo(&saved_mode, 0);
>>> -    else if (!old_stream)
>>> -        drm_mode_set_crtcinfo(&mode, 0);
>>>       /*
>>>        * If scaling is enabled and refresh rate didn't change
>>> @@ -6691,6 +6689,8 @@ enum drm_mode_status 
>>> amdgpu_dm_connector_mode_valid(struct drm_connector *connec
>>>           goto fail;
>>>       }
>>> +    drm_mode_set_crtcinfo(mode, 0);
>>> +
>>>       stream = create_validate_stream_for_sink(aconnector, mode,
>>>                            to_dm_connector_state(connector->state),
>>>                            NULL);
>>
-- 
Hamza

