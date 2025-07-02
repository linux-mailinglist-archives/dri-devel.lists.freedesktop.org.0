Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B848AF14B6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 13:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F6210E6FB;
	Wed,  2 Jul 2025 11:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xYsyDshW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142EA10E02B;
 Wed,  2 Jul 2025 11:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mXjf68MYictSxnxRn9pA4BeAHr0pOrRpXBISvtqPchvGUWJmLEVIqDqp6PiviHOyYlUfoCDFYo2oiMUd3+hlQyy5Fonw0N/aBQAgRwIB/om6ZH1f8Gl3XsmWtux9JmJnymMjN+TRSZwCFZg4bYz0koi7JHRdTCf1CseGy/Ovc21o33VTQiRNAB2PNVSnYW5EQQbFZQnnKmJrfwoNXj6Syzf0AieYbHPOGzzBK1u0hwxJaCaTFtnRGeTvECCOs8rYF/yVf8p8CEQJ9tA8XHYM8dAlYt52jeVX5sYtPsfX7Wh/JJAL2Qz1NueUjA6eao74uzf/24I59otMHsgDUv/vVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xC6YThhm9l2YQ75DBjtqM/3PtjSWdZ4YCdG3IRsafaw=;
 b=xM/2U8cr5aQYZMpjUTXUsMfJZy7dEH9iXQ2myJz8hgpG3cn1oYB0Ofap+wxriG5BGbkNb+/SQ6MPMHgiPcrufWTBu3Ri9cjQ74ueGtFUKXJoTfSTv7bJHALDUwD/cSrdsUW9456LGIy6lve3bgw7aT/Tugyc+Ht7xu6aZklbH0U8KF738BmZ9l+D6Zg35NmeR8UXwaWLAuHzAR2qeVcO5snaYq2d8B8XifS7wkyJN9c98OWTHuiGhNxhsiQ7k3SxYDYosao94JdLVGNKTXVwZnaEqIGdaeiAedensAP46K7FLk/EoYeD23TTBBzuCE5txcSgEC+lqEXk1OkZiWX1jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xC6YThhm9l2YQ75DBjtqM/3PtjSWdZ4YCdG3IRsafaw=;
 b=xYsyDshWqvW/A9/5bIJUlaApidG2drG3rKZyhm8IPipKDLOyN3dlHIoCSVgBv3W0l+5m60uTkKIbOS0mPEs3WP88j/vmuWXICGF8UYwQ+KZBzNMoBSqmb4dA5Ya650J6OpY7OaERrN6UdIk65A70oNYFwzu/Qthylifx+xvaPu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by MN2PR12MB4320.namprd12.prod.outlook.com (2603:10b6:208:15f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Wed, 2 Jul
 2025 11:58:25 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%4]) with mapi id 15.20.8880.030; Wed, 2 Jul 2025
 11:58:24 +0000
Content-Type: multipart/alternative;
 boundary="------------OyiYfP5ISKCaARZyTlLQ91gK"
Message-ID: <eebf740c-2a96-434a-a114-2d168f51f774@amd.com>
Date: Wed, 2 Jul 2025 17:28:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/amdgpu: Dirty cleared blocks on free
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, matthew.brost@intel.com
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250701190822.5272-1-Arunpravin.PaneerSelvam@amd.com>
 <39ff4d7d-d8eb-4c2d-9330-2bb8a5a04964@amd.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <39ff4d7d-d8eb-4c2d-9330-2bb8a5a04964@amd.com>
X-ClientProxiedBy: PN3PR01CA0142.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::20) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|MN2PR12MB4320:EE_
X-MS-Office365-Filtering-Correlation-Id: 23df2b3d-a142-4c12-622c-08ddb95fbf6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGhkdUZ5T2lVUlM5MTNBYUlLY3FBcGZsdVlCMExZVDNzWEJEaW52UHRmRmdy?=
 =?utf-8?B?MHhTMmdlbHZtMVdjVkFDdEdMakJGOFhaK04zZW95aVM4K2lGaW12aGZvNlhh?=
 =?utf-8?B?cXJ1OGU3cnNxaHF4YXltU0l0czFFUTdiblF3UjEzME50cUVFSkVVTFg3UWlK?=
 =?utf-8?B?ZlVWNU1tR25raUQzRFV3azQxOTBtSVJId1diVENuVHcvWEdwTUZwL2RpdHVM?=
 =?utf-8?B?STdxbUtQME5HNnVXTmduQ1FiOWxhaG1YK1R6ZklPMk5uTDBHakUwUWJRa0hI?=
 =?utf-8?B?dndNK3ZaK0V0Zm9hWnVQMThxbHc2Rkt0QWp1NUVMeFRYZURhUUp1cXZsY0dU?=
 =?utf-8?B?WkpGYUxMZ0N6dWFMaW5nVVBneG0zTDFRZjdUeVB2Y1Q3R3JmaHBydW9zeG9C?=
 =?utf-8?B?TE9vYXJ5czI5MytLQ040c2dmZS9DeTVtVVliODZvMFRjSG44UjVRbmNhS3lC?=
 =?utf-8?B?SldmSlJhZ2xIdUJtRWNxSzZlTlRJMkRQL1VxeEMrQklpaWFOUW5rTlpqVVp0?=
 =?utf-8?B?aXhib3dHSFliZXIzT0dQYjFNNkYzUzhaelhLK1g4dnFON1B2SDFPMktkSDdD?=
 =?utf-8?B?b09TMEdvdzM5ZE1mQWk1Y3VQakg1REpzcjNGUm0ydG9TWklheUxSamdxbHo4?=
 =?utf-8?B?b0owajlLbFZWTlNGKzV0bDNYQW8rekNwSXVBR0FucDZlWVZNbnJWVDZBSkVP?=
 =?utf-8?B?VjFtZUlNVU94VUFPa1RTOEFvWHZtQ0dDd0c1ZTNzTlBBRyt1bXJyUDljWW50?=
 =?utf-8?B?MDhVTHZESTRRenhDU2lxSm9TaTA5RC9iNE9zeldxd2VjVHVIVTJrWXVqWkJJ?=
 =?utf-8?B?akZBRHhYc3diTEVONVNITzkva3ZjZjd6S3hwcXRXOWVBYnpka2xsK2tOQzNM?=
 =?utf-8?B?bXRKOCtzbWdGWXpWc2FxbnNENCs3ZktIMUwwRmVpVXJQY1k1U2NYRWdrUllh?=
 =?utf-8?B?ak5sZ0VyVTVBUE9tbWJ4UXZ4dVFsWW51Zy9LQndlR0JEOEtSVEdicllIckFT?=
 =?utf-8?B?SGYwWTJuRW5oZloxdDc5TFBYb3ltWFFWNWpQcjY2QTI4SlczK3FKK0xQK0NN?=
 =?utf-8?B?R0VxeUV6cU92dGo3UG5BTXcrL0ZYOGptb2RacVR1aVhwRFZIQVFsSytlcHk5?=
 =?utf-8?B?cXd0Tmh3OE8wTElaQmF4UUx0VGV0UEVBMDNvSzNGN1NlR2IvekU4Rk8rZHZI?=
 =?utf-8?B?a1dZTzBCSUNQdnB4Mytldm1yRXpJWnpad1dIQS8xa3IvRXQxVldBQ1lHdVFT?=
 =?utf-8?B?Rld2ZmpXRFdpQzF2b3BmQzkraDZESzVJUnNLSjJvMVQ1NEZCdXNORlhSN05C?=
 =?utf-8?B?UGhwRDgvaURrc2o3RzBsdnlUcXRnNW4zYWV2SDVxWXdCQXFSenhkQUZlajRl?=
 =?utf-8?B?WDR6SlRxek1QNDM1djMxTmY5eEVqRVdYeXE5VkRDQlFzOWhSMWZNaTVGeUtx?=
 =?utf-8?B?N3RrNnAyaWs4aUtVM0NxMFZNbTdKV3hieU9ua1RoS2NNQndiZWlSZ3VhT0JQ?=
 =?utf-8?B?STdPNFRhYVZ0ZEFtcW5HQ2QvcHJZbUVlRzNXQXo4VC9uUkhmK3Y4azZQYlZl?=
 =?utf-8?B?TjNoMXUwaURmRWl3K2I1cE4xZmcyK0x1dkJUbmVaRHFaM21HeThYbWxhNnB0?=
 =?utf-8?B?M3c5T3V0T3orWldRWEVBallRL216WkM3cmwxWlQ0ZEFGWGN4emZsV2xpM2sr?=
 =?utf-8?B?ZDFpeFFXUDVZb3BTMXJGQmtNKzY5cGxlZndVMElMUnkwRXZ4VnZRQmhYQTll?=
 =?utf-8?B?YUVBNzZKdmZWSU84UXdERXZiUFovNS9uTlBGTnVmRFovVXBYNVNKc05uVTd5?=
 =?utf-8?B?N2V0T3Roa1Ayd05BSVBXUGlRMnppZUluVjl3MWtVaXBINFFLL3B2QVhBYk5R?=
 =?utf-8?B?RnZCUE9jaU9GdytQZ3lhZmJmZXV4ekxpZitXZWpuTy9Zd3kzUXhmUnZ5bEU5?=
 =?utf-8?Q?MAJn2Z9Dh5c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3FjaDRUNnRXQVdlY0JHcnFTY2h5WC9IbUExN2J4SkpXemljYzlPVFFtS0xx?=
 =?utf-8?B?cVhFZWZhSTlycmRuY1V5d3c2TnJGMno5a0xROTlJUlQ0SGYwbHBRc2paL0U3?=
 =?utf-8?B?NlFDSUxDQ3BnaVBLeHd3VS9EcFFxM0xVcGRHTWY2Z1BITVhsWktRbk5BdEVV?=
 =?utf-8?B?NzczM2F5ajBRTG5SZzdUYTI3aVZGR0RLMTErTVM1ZHRZQXl2Y2RFTjNCYUhZ?=
 =?utf-8?B?N2JYYWNYVXdhQmFCajdBM0RNamFJZFJwQ3JBZVQ1Q2VZL2FEeGowTklrTkJx?=
 =?utf-8?B?Qk02V3FiU0FjS2FVeGRHMWNvaGpxRlpCRUQ0b1dsQXZ2WmJKTmZNWUUwZ09x?=
 =?utf-8?B?bWFuNTF3alUzOEFGU1dVZVlpeUxsbitLWWM2bjg4TU40UTFlZWw0VFZJZTls?=
 =?utf-8?B?Z2hFankza2hLZ3NuVFJLMEFmak11SjQ1ODdIRldYWXpqSUY1OUZad3Bpai9S?=
 =?utf-8?B?QStNRWVqMHc0c1NaN3hlV0pXc1ZDU2lRNFR3bnVmZ1ZUU0tTSnVPdkVHT0RK?=
 =?utf-8?B?VzlHSTVGMEphMk1kTGpxQ2Zsc0hpU0Rvb2F4SDlMcGhHTldiZjd2VmVIMVhw?=
 =?utf-8?B?ZTUwZEhjY1hDdUV5cVpJNmFVYTFTdHVhL3JlWWIyRkhwQlBsdU02ZHVVdFhq?=
 =?utf-8?B?TXZZTy9JcjVHRzYxS01ha2pHWXd1Uk91T3c3eERRaFROV1NzZE96cThrei8z?=
 =?utf-8?B?dCtkNWQ1MW9PczdLMENvNHU0STBMRmUxK1FRcngzS05YbEVpcDhYWkJQNUFs?=
 =?utf-8?B?Uk5PamRwaXl4NHZIbDFTa0VHeDRKd0ZZOWlxSGxkQTVMUGJoTk5BNEtRaHl0?=
 =?utf-8?B?ZzR3RGZ4RUk1bXh0aThOU21aMnEwb2xPdEhlbG1vMU1XQkZFZ2R4OE95LzZu?=
 =?utf-8?B?MnkyQW1pb3RzNVBDa1QxRUloTSswYXo1aVhFdUhpdm5UcGhoSTFyNWxwZXFh?=
 =?utf-8?B?MHpwRllhMUY2S05OTmQ4Q0xsY25oRUdDYTBzNmJ1ZUFrSVNyNTdRdjNEOWN1?=
 =?utf-8?B?Q3FCWWduaVh6VkVMMjdMdlhZQmlBclQvcVlZU05ieVRWcGZoK2luNDZrZ2pz?=
 =?utf-8?B?ZUo0dVB4WnN2SEZBNUswd0JEajEwYytsbktMRXpvSWJOaXl4c1RxSFJYOVhJ?=
 =?utf-8?B?bFF6bXVDa0N6Tk9FVFZ3MUN1NXZIbGJ3U1c4NDhXbWNaTnE3RGVxN2llNEFa?=
 =?utf-8?B?Q2VhQ3hKT3JraGEvNjEveEFVWlNKUUZ5bmxuWEVNSFFFdDdibnJlKzRhaVVP?=
 =?utf-8?B?YkNvTkVnWFZyZUdPVTBiUGNySXlkVTJpNURjN0hGc29iRjllVTU5N1NxblA2?=
 =?utf-8?B?eU5KNGt5NkVvSnNzNW03V3FjUTV3RTFqdDN5VG94YVBDZ1JCdWlvMlVVVXVl?=
 =?utf-8?B?M2xDaVRZV2dML2MwdkZJeVNBbndYQXV1cDlORjlrVHFIMzM3ZXRzclVNK1l6?=
 =?utf-8?B?aUI0Q2ljQzFIV0RRSjlZZGptVWlkeXkwRGt4dXl5ODhKdzQzekJvT1c0eS9r?=
 =?utf-8?B?MjFUTGt0QmFLNU1DdU9NQk9hQUlBbXorZStCUG5DaFNuczdRVUdrK3FrTU1j?=
 =?utf-8?B?KzNvamFFREtyNWxyYlZOdVkrWFZLYkdiT0o4ZXI5ZUIydDZpSGlpbTBYdWdO?=
 =?utf-8?B?QytHVTA2Y1pBRUtYcHA5dHVIZi9CY3lVMDlHUStlWFhtVStJUmVWSUQxYlp2?=
 =?utf-8?B?WitkT2dsQm5KM1FobnNiSEpiOFc3OWkwbUVkZFZOVHB4WW9IS280U2UyWUNy?=
 =?utf-8?B?dzBOSmQ3cElPbUpZRGhiZENrRDY1QTdUaVNTVENEdjlBdEFRSnkvTk9JQ3U2?=
 =?utf-8?B?Z25FbStXMEJsak1HQm9mZGFBMFhQR2ZFM09OVXZzLzlYdHRwSmt3Q3pXYnBx?=
 =?utf-8?B?ZXZ3QWt2Nll5clhHNkdOaW1wYURmSXFXQlJFODhGSGZhM05XNzhKUGdHUzlU?=
 =?utf-8?B?TGNUWnpPVC9penBraElGeGJES1pzejB6Y1ozSXViOXdTeFI5TjhDNkxRRTh2?=
 =?utf-8?B?bUFlVUcyUXJ4OHE4YW5DMzMxai9HK3BnWTJjZGxnVFZKRFI5c0RJUDJ6eHFE?=
 =?utf-8?B?NHh4MG1sSjdCc1pCQ21IZGtQakNXWC9kUFRKaGtMTSsrYThpM3A0UnhHaitq?=
 =?utf-8?Q?kdk14fcfTnVPGU3jWMflu97xM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23df2b3d-a142-4c12-622c-08ddb95fbf6f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:58:24.5210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09/tei6E5dsoQyZhQFC/bosZ2wZjg3bJ4kYg/zWXvKkh6no4IBh1r2MwtLWSqFA7TJ2EAVyejMFOwAVjtGuq4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4320
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

--------------OyiYfP5ISKCaARZyTlLQ91gK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Christian,

On 7/2/2025 1:27 PM, Christian König wrote:
>
> On 01.07.25 21:08, Arunpravin Paneer Selvam wrote:
>> Set the dirty bit when the memory resource is not cleared
>> during BO release.
>>
>> v2(Christian):
>>    - Drop the cleared flag set to false.
>>    - Improve the amdgpu_vram_mgr_set_clear_state() function.
>>
>> Signed-off-by: Arunpravin Paneer Selvam<Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Christian König<christian.koenig@amd.com>
>> Cc:stable@vger.kernel.org
>> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c      | 1 -
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 5 ++++-
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 9c5df35f05b7..86eb6d47dcc5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -409,7 +409,6 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>>   		if (r) {
>>   			goto error;
>>   		} else if (wipe_fence) {
>> -			amdgpu_vram_mgr_set_cleared(bo->resource);
> Mhm, that looks incorrect to me.
>
> Why don't we consider the resource cleared after it go wiped during eviction?

Modifying the resource flag here doesn't go into effect until we call 
the drm_buddy_free_list() in amdgpu_vram_mgr_del(). This BO will be 
cleared once again after executing amdgpu_bo_release_notify(). With the 
new implementation, there's a chance that changing the resource flag the 
second time would cause the WARN_ON to occur. Hence I removed the 
resource cleared function call in amdgpu_move_blit. Thanks, Arun.

>
> Regards,
> Christian.
>
>>   			dma_fence_put(fence);
>>   			fence = wipe_fence;
>>   		}
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>> index b256cbc2bc27..2c88d5fd87da 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>> @@ -66,7 +66,10 @@ to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>>   
>>   static inline void amdgpu_vram_mgr_set_cleared(struct ttm_resource *res)
>>   {
>> -	to_amdgpu_vram_mgr_resource(res)->flags |= DRM_BUDDY_CLEARED;
>> +	struct amdgpu_vram_mgr_resource *ares = to_amdgpu_vram_mgr_resource(res);
>> +
>> +	WARN_ON(ares->flags & DRM_BUDDY_CLEARED);
>> +	ares->flags |= DRM_BUDDY_CLEARED;
>>   }
>>   
>>   #endif
--------------OyiYfP5ISKCaARZyTlLQ91gK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Christian,<br>
    </p>
    <div class="moz-cite-prefix">On 7/2/2025 1:27 PM, Christian König
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:39ff4d7d-d8eb-4c2d-9330-2bb8a5a04964@amd.com">
      <pre class="moz-quote-pre" wrap="">

On 01.07.25 21:08, Arunpravin Paneer Selvam wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Set the dirty bit when the memory resource is not cleared
during BO release.

v2(Christian):
  - Drop the cleared flag set to false.
  - Improve the amdgpu_vram_mgr_set_clear_state() function.

Signed-off-by: Arunpravin Paneer Selvam <a class="moz-txt-link-rfc2396E" href="mailto:Arunpravin.PaneerSelvam@amd.com">&lt;Arunpravin.PaneerSelvam@amd.com&gt;</a>
Suggested-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:stable@vger.kernel.org">stable@vger.kernel.org</a>
Fixes: a68c7eaa7a8f (&quot;drm/amdgpu: Enable clear page functionality&quot;)
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c      | 1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 5 ++++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 9c5df35f05b7..86eb6d47dcc5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -409,7 +409,6 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 		if (r) {
 			goto error;
 		} else if (wipe_fence) {
-			amdgpu_vram_mgr_set_cleared(bo-&gt;resource);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Mhm, that looks incorrect to me.

Why don't we consider the resource cleared after it go wiped during eviction?</pre>
    </blockquote>
    <pre class="moz-quote-pre" style="white-space: pre-wrap;" wrap=""><span style="white-space: normal">Modifying the resource flag here doesn't go into effect until we call the drm_buddy_free_list() in amdgpu_vram_mgr_del().
This BO will be cleared once again after executing amdgpu_bo_release_notify(). With the new implementation, there's a
chance that changing the resource flag the second time would cause the WARN_ON to occur. Hence I removed the
resource cleared function call in amdgpu_move_blit.

Thanks,
Arun.
</span></pre>
    <blockquote type="cite" cite="mid:39ff4d7d-d8eb-4c2d-9330-2bb8a5a04964@amd.com">
      <pre class="moz-quote-pre" wrap="">

Regards,
Christian.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 			dma_fence_put(fence);
 			fence = wipe_fence;
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
index b256cbc2bc27..2c88d5fd87da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
@@ -66,7 +66,10 @@ to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
 
 static inline void amdgpu_vram_mgr_set_cleared(struct ttm_resource *res)
 {
-	to_amdgpu_vram_mgr_resource(res)-&gt;flags |= DRM_BUDDY_CLEARED;
+	struct amdgpu_vram_mgr_resource *ares = to_amdgpu_vram_mgr_resource(res);
+
+	WARN_ON(ares-&gt;flags &amp; DRM_BUDDY_CLEARED);
+	ares-&gt;flags |= DRM_BUDDY_CLEARED;
 }
 
 #endif
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------OyiYfP5ISKCaARZyTlLQ91gK--
