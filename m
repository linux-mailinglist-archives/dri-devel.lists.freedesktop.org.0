Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C296C12D4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 14:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA6B10E386;
	Mon, 20 Mar 2023 13:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2056.outbound.protection.outlook.com [40.107.96.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FD910E1C5;
 Mon, 20 Mar 2023 13:11:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMRIrTAoqPL0CbzgTRRDIudHNQ3pU1H+O59gWtFol6D1RZfYdmTJHy3FOnhh0eQb2oRx+4Vh4kIw37W496DxINtadyJQXjb7Y1U92f8Xpmo3nE9/lRfMw1zuPFvyxfgjQ7qX7uJhf73IjODIkOwnQFrnP1H8fWRTE2eTnUVUZ1MKRw6RIXs2ne55eZNWe8NuQKStNzAiIxItpydDSA+UgyemwquVF3EkLbOPQ1647VweMKBDR7iiMdbEzMem1G9hzAgeK5v7uqKehjFGv8R4JCNZbDzUgLPAHrcRXohF5STVpBj+lxW4oEHK48smxHUhIIjt5l7ZeRj4ETUYiofJEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjitvJVzPTlAVJXZvChB0UP10ix19yDQy3ceAgaUXZA=;
 b=SQnDntWoJQXZedAweIIartJyN0wYTsWQLnIitfZ/pDbx9mKpn1PTnBImai7t411HcEOZIMmz+ZPMzzX1fTvJTuDNykTJhq6Q23EdFh7I2GQNat+JRFLwusfHqqfWP65BKsa9gteSFuw1dCsSTWtGt1bU4nkl5s0AFecQfc62jGPqZO6PPn+fRcD2/dzcWtyHgEvW1u0dEkU8/Hjpkj89i12oQImCXHQM9w8ByncoVWddJwhIyUQDt5MGx6Byfkgm+mxHfPI6aNhMOX0DxgYv5ySbNbXtGOdfwgaxKQF7wZ5Q6zzVaANfsqWVJM3HwdctZ7awF3Gu6sd5ftF5JY1Rag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjitvJVzPTlAVJXZvChB0UP10ix19yDQy3ceAgaUXZA=;
 b=pOIPYrzN4MxG+H2WuVapaGc5IXXyz6AyoscmcKpa/+F8sBStzmfZhPUfzssAjNX37ZnZ+icMSNupGALDCxIHI6eLy5UZPecIX/wkzyPVIuubpqUucACRGpUFJEDnioai8h6BApwznOq73LZ3JzXklIHnS1pMaWuL4fC06nEdJ9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH8PR12MB6866.namprd12.prod.outlook.com (2603:10b6:510:1c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 13:11:52 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%9]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 13:11:52 +0000
Message-ID: <fa3bcadf-3ee9-86d7-d6ad-5408081766bf@amd.com>
Date: Mon, 20 Mar 2023 09:11:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 28/37] drm/amd/display/dc/core/dc_stat: Convert a couple
 of doc headers to kerneldoc format
To: Lee Jones <lee@kernel.org>, Alex Deucher <alexdeucher@gmail.com>
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-29-lee@kernel.org>
 <CADnq5_O0mQWy5z-SeWryyVeBhhsDX_yrsiuHTUbDBBAscB6b=w@mail.gmail.com>
 <20230320081951.GI9667@google.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230320081951.GI9667@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXP288CA0022.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::33) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH8PR12MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a234b4-533d-4b97-fe56-08db2944abde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XZRVABgAGieXxhxggFJJB6A+kzX+pM1P/5/QU4GHC1WujFKOHdtFCqCYvLP70GJ6nEw4Y49aNwmFxc6Eb50pynlbrxNXcUayIcruCxKKHHdnNXguCKeZFM3O1oQdPgNTduf3UJbK1DzHX174sVDZhWDEaY2RvWJrnBRT/h96/wnkyaU9xb6dQYzgiOREr+PoWE7L3bunnwmxThu9zaFsJyQIVpkSNxWFKWPf7aF313mnRHdi355ICke1bUuhlh3mCc4i6yetOse84YCoQOnMiREiQ3vC9GGzVB396WR0F1vq+Z9tXI0oLW0RZPF8t7RBIjXar4EFohp1ZO0QPwJJgabhyCWpCPzJMlEF3btOQBvRfp40TjkDqm5Dcu/Abpmx2T4EKBSHle/IKYLdPXRAq/Pc5RbkMQBo2HA6cjr38RMAwpNTT8kiuuKLXB0TItlSuua09u9LhhCqxXHlqYbs1SRrJVh8m4OMsyJeJ5bLWAk15H9vRGGksDJVsp1Uv/IBVJDMhvYuTHVLRtbCWkKhoRcAO/qWJciGp9YazPWYaXTGBwXImmZDRATyAQkyZbju3wl8rM8tGNnRpQMFJLb/VoI4K2IiIMrXzVN5jfBKu63iaWSoaqUOhWAcWpz7hAQqvBen3qFGo8ckZHvh59+7UuLWcjhKAy6apkvotkKEpeWSGyw5rVNU/9eq88Hu6XBHhyKrsttsbtQnQfmXZEOOd6tW8wM0ndKtVrpQFByNbjg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(136003)(376002)(39860400002)(366004)(451199018)(2906002)(31696002)(83380400001)(86362001)(186003)(8936002)(6666004)(5660300002)(38100700002)(2616005)(41300700001)(26005)(6506007)(6512007)(31686004)(53546011)(66574015)(110136005)(54906003)(316002)(478600001)(36756003)(44832011)(4326008)(8676002)(6486002)(66476007)(66556008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjZWK3RvVmtFbXpXZitqOEtoTkhvSXBFdHlqMjRpQ1lENmVvRmZaZTRFN3Zm?=
 =?utf-8?B?M2Z1ZUlDbXpwTk16L1Q0T0dPKzhCSzJnSUNrMCtpZnBFbC8zQXgxNnI5dk5Q?=
 =?utf-8?B?UWdzNmZIcGZtaHFNdVU5MWErN0VqOFE3UythdVdzYTRvdnF6MmVFYSs2Tytz?=
 =?utf-8?B?ZE5OSSs2bkJSenpmejRCYmpkcXlTY2xrLzNXR0JvbGxpYTZEK0RFTEF2TFI0?=
 =?utf-8?B?dWsyUUFHNVBKZ2REcUU2VWk2a05jM3BaMlAxeCtRVGpiU003Mkx1VmU0V0NO?=
 =?utf-8?B?Wk8ySEpNcHNmaEU1YjhyQWoyZG9IdVRQdVo2cEtHQmF4dExLMUVlYnRNWEo2?=
 =?utf-8?B?aXJ2a211dE1OK3JWUWJtTldkK1hmV0cwcGJ3aFNDYXgwK1dTQTl6bDJvVzBO?=
 =?utf-8?B?MG4ra0lLQm8xSDUxZE1aU1lqdzMvbDNweXVjQ0xQMjl1MGRCamwwUWY5ZDZw?=
 =?utf-8?B?RXNuRGtHMXRHcS9VczdTVTdja1B3KzNzR3pSMUh1K3ROdUFCZVJJMkNtc1cw?=
 =?utf-8?B?dkc3Y2o4Z0Y3VVlocnlZMWp4b3hTUzJ4S3lrOHVlOTJoQU9ZWmZxZnlEZG9E?=
 =?utf-8?B?V0FHYys4ajF2cEpncGN3ZHRFSUpoWlBja0JsZGNxcW83Ny9tQ1ZiQkRQUWh2?=
 =?utf-8?B?UTlrbnJrcUMvTUFzUVB5MlVlbkVjd1F2NkEyMU9adUhSUHpMNzVRdlRVdnVM?=
 =?utf-8?B?ZmY0T1pnbjRjNStWdmJCaVJBZUVIR2RCbVVkd3ZTNVBmRFhKQTl5d2xOQStD?=
 =?utf-8?B?YmhVbjZBUVNRSHJ6czE1R1NoWmhPM0tCdnlIc2FlMERtRENVWnh5UkViZVc0?=
 =?utf-8?B?eUk5b2VDNmtOanhMb1RJZlpkWjQwYmVrM1ByTXJoNDZhdXBQZ25zVUpYc1RK?=
 =?utf-8?B?SExSOHZEaDlqckY3UDV4WU1Dem1idzhXNkJXWDl4dVUraWNrQ0YyeXMxei9h?=
 =?utf-8?B?Rk5mOFBoeURkbVRLUlFVdURFazVEaU9PajBqV01qS2YvR1NFNUY5K2FTazJw?=
 =?utf-8?B?U0dza0ZXdStLVmx3azRoK0RDWjcxbFpGZW5DNDhnVmZqdjhTNlNHdllFQzE4?=
 =?utf-8?B?bkw4dzVQYnZGelJPUzlLVHBmQWY1SEVaSlZBcmpScXk4KzZIVlg1cXRDUHUv?=
 =?utf-8?B?bXg5c0F6TlA1dkFBNTFQS09QYi91d3JmYXpqSEVwQXIyT0lnanF0ZGtBQzJu?=
 =?utf-8?B?OWplNENWWWRCNGszMFczdW9YVmgxQ25lTWFFVzhqaFhYZ2o0eDNySjJQMzdq?=
 =?utf-8?B?bkM3UE9VdDlCbnpKM1hNYVkxVWR1YTJjb281ZGo5cXluYUlITkJCa0wyUlQr?=
 =?utf-8?B?ZmZFN1Vlay93N3hGMFpzS2NhYjk1aTVtcDRsanBNTFZRcHhCUGxHY2NGbFNM?=
 =?utf-8?B?T3EvblR6ZmJIN3hqY0ZHeTNVVFlRc3lhNURIR0F5elRPOCtpajhWanNjTUhH?=
 =?utf-8?B?Q2RDZDlFOVE5NmM3RzRaY2ltNDVSakd3QVFKalB6NWoybEtTdnhYOTlweURR?=
 =?utf-8?B?NjZIc1pMYkYxZGF4Mks1RURUVTlhTmY4L0pKS2ltcFl3cWJsa3JMSVE4UStI?=
 =?utf-8?B?YnJCSGpLWlZrMVdkcHpGSFQ4VDJkSktkYnQwL1NEMG5LbkprbVV0VmRXSnh2?=
 =?utf-8?B?c0NxVERqOVBMQUZiMXJnWERuNXIzQnhhanY1Vlo3MmRmZ1lOUkhIWndlLy9X?=
 =?utf-8?B?NDhJUTJ2SVdqOHgwSzl3RER5WlZKa1VSNWlvNjlURjFTejRZblp2V3lpWnRt?=
 =?utf-8?B?UEdvUGlqQk9FRlpnOEw3SEtjQnVwbWlhNWNhMWJFM0ZEZGpPK3dyalN4NVhk?=
 =?utf-8?B?cWdsVUpJR0lEbGFRUU0wV2dLS25NV05yYUx0UmpZN3l5b1EvU3V5V1I2N0dC?=
 =?utf-8?B?OS9wemN5cmVJdHpBZytNcU1QREo2MHo1Nisxc2k3dTU3bGRBNzFLVHFobFBV?=
 =?utf-8?B?RXJYK0k2RWQway9PSHV6YWJTRkpnQmFSSjY5eDVnbkQ2RU4va0JlOWlzUUhl?=
 =?utf-8?B?N0pqWjNXVVgxVVZWdUN6WHM0bksydXZPRlE0eVVqQ1ZGejREQ01RKzd4SWFj?=
 =?utf-8?B?Y1cxTWpjYis5a3hoZVA1OWhEY1BvWG1WRTAxTS9kalhJQUJpelhhczZNN1BJ?=
 =?utf-8?Q?cnqEBNL/rrIfEkPiRsB0/RVHi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a234b4-533d-4b97-fe56-08db2944abde
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 13:11:52.4370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ot3sB4EYaqwyBA92oHMYVji0jku3Zy1m9ZgPLZVoM9SbjBl6IK4tDK/Ycv7U5CER5gcJNgArWQLNtpXXi1v64A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6866
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, Jasdeep Dhillon <jdhillon@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Mustapha Ghaddar <mghaddar@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/20/23 04:19, Lee Jones wrote:
> On Fri, 17 Mar 2023, Alex Deucher wrote:
> 
>> On Fri, Mar 17, 2023 at 4:23 AM Lee Jones <lee@kernel.org> wrote:
>>>
>>> Fixes the following W=1 kernel build warning(s):
>>>
>>>  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stat.c:38: warning: Cannot understand  *****************************************************************************
>>>  drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stat.c:76: warning: Cannot understand  *****************************************************************************
>>>
>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>> Cc: Leo Li <sunpeng.li@amd.com>
>>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Mustapha Ghaddar <mghaddar@amd.com>
>>> Cc: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
>>> Cc: Jasdeep Dhillon <jdhillon@amd.com>
>>> Cc: amd-gfx@lists.freedesktop.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Signed-off-by: Lee Jones <lee@kernel.org>
>>> ---
>>>  drivers/gpu/drm/amd/display/dc/core/dc_stat.c | 28 +++++++------------
>>>  1 file changed, 10 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stat.c b/drivers/gpu/drm/amd/display/dc/core/dc_stat.c
>>> index 6c06587dd88c2..5f6392ae31a66 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stat.c
>>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stat.c
>>> @@ -35,19 +35,15 @@
>>>   */
>>>
>>>  /**
>>
>> This looks like it follows some other documentation scheme.  Would
>> probably be better to just remove the extra * and make it not kernel
>> doc.  @Wentland, Harry @Siqueira, Rodrigo ?
> 
> Happy to wait for further input.
> 
> Either demoting from or converting to kerneldoc would be fine.
> 

There's no reason they are formatted the way they are. Converting them to
kerneldoc is fine.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

>>> - *****************************************************************************
>>> - *  Function: dc_stat_get_dmub_notification
>>> + *  dc_stat_get_dmub_notification
>>>   *
>>> - *  @brief
>>> - *             Calls dmub layer to retrieve dmub notification
>>> + * Calls dmub layer to retrieve dmub notification
>>>   *
>>> - *  @param
>>> - *             [in] dc: dc structure
>>> - *             [in] notify: dmub notification structure
>>> + * @dc: dc structure
>>> + * @notify: dmub notification structure
>>>   *
>>> - *  @return
>>> + * Returns
>>>   *     None
>>> - *****************************************************************************
>>>   */
>>>  void dc_stat_get_dmub_notification(const struct dc *dc, struct dmub_notification *notify)
>>>  {
>>> @@ -73,19 +69,15 @@ void dc_stat_get_dmub_notification(const struct dc *dc, struct dmub_notification
>>>  }
>>>
>>>  /**
>>> - *****************************************************************************
>>> - *  Function: dc_stat_get_dmub_dataout
>>> + * dc_stat_get_dmub_dataout
>>>   *
>>> - *  @brief
>>> - *             Calls dmub layer to retrieve dmub gpint dataout
>>> + * Calls dmub layer to retrieve dmub gpint dataout
>>>   *
>>> - *  @param
>>> - *             [in] dc: dc structure
>>> - *             [in] dataout: dmub gpint dataout
>>> + * @dc: dc structure
>>> + * @dataout: dmub gpint dataout
>>>   *
>>> - *  @return
>>> + * Returns
>>>   *     None
>>> - *****************************************************************************
>>>   */
>>>  void dc_stat_get_dmub_dataout(const struct dc *dc, uint32_t *dataout)
>>>  {
>>> --
>>> 2.40.0.rc1.284.g88254d51c5-goog
>>>
> 
> --
> Lee Jones [李琼斯]

