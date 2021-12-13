Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E95472EF1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 15:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE6910E743;
	Mon, 13 Dec 2021 14:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADCD10E794;
 Mon, 13 Dec 2021 14:22:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uq9xiX29vWxn/tb4yskLqM73w6nU9yc9VwnVVTV1lmoYzMkcEzBbIAwUxTtKUcgLaVhYjMBmuVmQOu2Oiz2L82nqZWjqlw7u0DJKFIoL1lcb8K6Q5i5JbSRRRHvT7KYW26BWyxmDOFzN6EPcD1y5tTlE8XjpgA6ZyznLGvSL/bjudZEJ1UR7KaMD9J6lzf6yo3QX8smFATWo3xZntEQPlM6482rprJRaWiG+mJ1VizJcwO/iEOTa3I4E91Q5k8eo6tSqjQnPD1yTFUyQGdtkdo5vnAgf8nM2c34supIftJJxjSyz23+LQ6jjqjKabDl/UzMAOXklSZ2GBlzTV7ALRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpHikFGyRAgsiQpAPXABm3tsB4TG3VvLSJZTOhBDQe8=;
 b=BbXKfWChaR7MElRyCfqo11NSfa6Krr7xpi/xvLBZxoNNg3E9wBD7u/ydUH0x2YllCNzNmUuqJ6X4Dn2/AUaX8cA0WohT9tVC9b+WDpFO/GJ8D7XaN7li8/4pqmFwwkeKloEe9Ujc1gV4N/C8bNJGO0yiaX/iDdmLp5ZSXw2bEqeNIu3lE6ndVHqZ6WAZXvFuA/O2Kjoa1gwe/CP3w1OTasKD96hJ5komaLSAtSeE9tQahaaLc5g8zZiDgjwkMnPgRu9fU2lcCDwgdjG53kglw2AMDrMyZ4Qpcybt1sqvNjx4GVKDe/48SuBI1h+8OJ3nAvO+TnLQcgiX7wtoFuNiog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpHikFGyRAgsiQpAPXABm3tsB4TG3VvLSJZTOhBDQe8=;
 b=fkifZ7X8abi8iwNo4nNQkjRnPgRzX3d5Oib9PwUBlfcBakYGgwPFxG7m/qs53GLVgSJ+0HBAScaqMsPI2zNTXwp7pHrhn3ReXhgowAJ5wHJLnyuxdEVIZHSXODuK0+9C6qaBXsOGEc5bNF1dGDpWWTXvmPjOHFa571BKnzM6gVI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2896.namprd12.prod.outlook.com (2603:10b6:208:ab::22)
 by MN2PR12MB3213.namprd12.prod.outlook.com (2603:10b6:208:af::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 14:22:38 +0000
Received: from MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::44f7:66fe:4419:d8d3]) by MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::44f7:66fe:4419:d8d3%7]) with mapi id 15.20.4778.018; Mon, 13 Dec 2021
 14:22:38 +0000
Subject: Re: [PATCH 1/2] drm/amd/display: Reduce stack size for
 dml31_ModeSupportAndSystemConfigurationFull
To: michel.daenzer@mailbox.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
References: <20211209164644.1622152-1-michel@daenzer.net>
 <f513ac48-a2e3-dae9-56f1-ba50da34f6c4@amd.com>
 <5a770e69-ea65-1e61-dc8f-f044b418dead@daenzer.net>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <9a9134ef-35ba-13ef-b28e-ec3a168d99fe@amd.com>
Date: Mon, 13 Dec 2021 09:22:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <5a770e69-ea65-1e61-dc8f-f044b418dead@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0108.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::25) To MN2PR12MB2896.namprd12.prod.outlook.com
 (2603:10b6:208:ab::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b3db699-ac15-40b3-dbd5-08d9be4403e0
X-MS-TrafficTypeDiagnostic: MN2PR12MB3213:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB321344E5D843B8559781131598749@MN2PR12MB3213.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SCXjhTAqjl4uAU4K0XdLNC3a760XTwVCYBJ+AGxt2o1HwLEi4qAXXyo4YD0/xNojPgVULKiEw7wEMi5oaaTeVKjEzuTmM8T3cAc55iyaI6RGi2B4foHe4BF0d9nn3yHm4pXnNi0JMe/BQuwSH+yhoEIg6PuYzmJvBKVLWqBYsC7DF73LIuOjtbKL+5Cibx+LqQwCkW/5ZkesD7cmivA3u2hrjuEKOVNuORn7B9XgVXcqbS4YRGQr4llSaUFyyL9kIrrUsZ8ihWTI+0CFDWpc01BEAkybh9NStdh+9vu/pKszlHr2Uylx9cOvTR+HGdiNR55wq/coizTrAL04TsYf27+mbblaPJQmS9l1E1wF3fnY4zErE2xuVXspUrioTIkTZ7hnN6x+SnBIXcuCTaHGueT4c+JitJWBWLF+YRdB5oMMEFpUh9+YKUJR5lN94dR4vLvNL8Nn1DIvvUikvddqjuO/BQCvGZiOdAdttQblosbw9RYQ9hmPmSyTyavODeYKseFcKDVrtnYZVAk1b0UGLGN5Z1diLxe021s3MWOGNJZABu8AzxJr3bfpkrWK2YHYHb7RWi9EtUNLtQ5h2dM5MS3gKWdvxN70+lkTLYfK6tNlRCjEc3yMpGt5deqj5nTCzjOkp5mNZlXCbEvKCs2mwTIS5iixIEL6s0eQRXUOLNioTNyHXL8R7IOzqb8G08DpK9O0ZXSPqQkgP1DCPJhteaD83ie1ZLOcAr830rjhUH2D5MZLpQsovOQwRFYpvpHjcSI8fgD3q80A4+O+fXpK/yk2jBUkHLT3oghOxbktE7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2896.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(4326008)(5660300002)(66574015)(30864003)(83380400001)(31696002)(8676002)(19627235002)(6512007)(6636002)(31686004)(38100700002)(2906002)(110136005)(316002)(66946007)(6486002)(2616005)(508600001)(4001150100001)(53546011)(6506007)(66556008)(186003)(66476007)(8936002)(213903007)(45980500001)(43740500002)(44824005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1pnOHRVNG1XRVgvbUNIK2MyeGt5cEp2WlluSktGUURLRFNDVDBXdExzbHBU?=
 =?utf-8?B?LzlyV1hVVEk4SVp6cC9QNW9ZN1Z1eW1mMGxsSC9PblhpRUF3d3l1TU5WNFBU?=
 =?utf-8?B?dGM5L1F2VTZWZVRMUlJ1U2FIbXFzR2lacjNBK3MxTnVjNEpNTHRFRHI4TDUz?=
 =?utf-8?B?OERKYVlheExVSkhReWI1VFN2VkphMWFIWVQvRlF0UXdmbUp6aWxuVFNXdE4r?=
 =?utf-8?B?VHNLMVRzQTRKYlNQQmxFSitoRmU3RlNOMjVXQk5kZkQ3WE0vVERTV1M3OVhs?=
 =?utf-8?B?TWVxVi9BSVJPY3JrTk1UZjRMS3ZNZGxYdEVFVWFVTFZRZjlwZW9TcUcyMkdu?=
 =?utf-8?B?VGRoNlpYQzFiQ0VrcSs4TU1ORlpld1pVYzJxU1NnQXN3Z3RJNjFUSnRBWkdp?=
 =?utf-8?B?VW1YeDJpdXRCOWlJYXMwdzBJeW42Z3FzaUlUMWpsaHJuQVdWRlVSai9sMjFz?=
 =?utf-8?B?b2ErUVA4TVV5Y0laeTZDZ1A4SWRQTDJ0ZlJWQndNVHVOZzZZbGhUOEhBYjRG?=
 =?utf-8?B?dFo5ODlsMlZyS1N6b2V6blNVeUNoNGwwMFdUNXRJVzF2c0NHQXRkNmRNK2N6?=
 =?utf-8?B?MG5nVGdxakdzLzhUdnpPV1lmRW1LOVpIMk1vZ3ErUVc2ZFkzWU1XOHorL3Jq?=
 =?utf-8?B?SVFDcVk3ZjgzMWZaUzdqUi9hdWVjdGtSZ1J1akg0cks3SytPa3RNRGlObDZL?=
 =?utf-8?B?TWdLQjdIL1hBRTNYZHJNeDFUeFM5MzM2dkFNaSsyUktTU1QxRmhpZ1orQytB?=
 =?utf-8?B?anhYcXhOSThleUtRaVlKZFZwVWpRc0oza2dyN3U4UVgzVGNzYTlPYUFLSDZa?=
 =?utf-8?B?eEYvazVNVlRtRnBCTmJZM3VSdVFibDZlbkJUcFFlNndKTWhNZk9PRlgxQVB2?=
 =?utf-8?B?dkFIRlV5WUZNREN1cnAvZmFOcFgwMDVXM1JnR2VZc2tZTHliU1NPM2JpYzF0?=
 =?utf-8?B?MHRkUVJPMXI4QkJxaUZXbk41TkZpTnpWaFhhTzI0c05uY0lOVy84V241TjJo?=
 =?utf-8?B?Tk1nY3pZY29xSEYxVlNlTFljNzVLSHhNOGw3WkFsN3prNjAwRnRUZU9rWU1o?=
 =?utf-8?B?YUI4K1I5dDRvWUdSMXJKSDg2ck9tczhiamMxVnpVdXR2RnVuTDZyUlpmVXAw?=
 =?utf-8?B?b2pLS3hwNU5wMEM2SDA4NkhKaEpTS2FpOUs5NGt1Wmk1V0pXQnVYY3JpVlpz?=
 =?utf-8?B?Q0lOcWJvTkxVSW16Z1Q1RHpKUnNNSmtDaDY0Q0JvZ0dZeng4dEZzbFVGYkNC?=
 =?utf-8?B?SHJXdjRYV0dFNkpFQTdZWm0raDVYSFRiQTBWMENqaWcwUVozRUxIUWlhOTZj?=
 =?utf-8?B?UCtiaVF5ZURtRzYyeUU3Y3dIczI2NVpzdE92Z25pMS8zeG5ZdVhsOHBPSGtj?=
 =?utf-8?B?ejFJWG1Fb045ZlFZM01VQzdyck5MZHo2d25PamVXeXUreVlGQW1ONnUrWFU0?=
 =?utf-8?B?SzR5UkZQZmdWZ1JwNEJhMUhENmVqK1Z2dG03V2JhMTJFOEtTd0dwdExkZTNG?=
 =?utf-8?B?Y0pYMFVFVFVBZENZMFUvMURPS2QxNzVCaDRpN2U3WmlhSGo1MXNqeWFzSEVX?=
 =?utf-8?B?OFoxci83eWowNjYwc2ZIcnJacGlaaVNNek5iQ05GcXVOdzVwS05lSlpJamdC?=
 =?utf-8?B?R1ZrN3VFcEJYdFJTN3RweE1DUVlKeW5pZjhvOGZBZzhrcG5qWkhsbHlxVEdp?=
 =?utf-8?B?V3diOGdDZG81RjFrTUhHOTIreTk4R0pma2JjaVRrR000cGRDSEtPelR3MSt0?=
 =?utf-8?B?aU92LzlqK2lQbTZkVnZDZlFQT08wUFl2a29YdUV4ckVjRUhGNUZvN1g3YnJJ?=
 =?utf-8?B?Q1YzVGFNM0tEZ0ZMNlJTTGFwVFNuZmJnaHd0WGtrZUFpM2EyOHNHdlVCNHAr?=
 =?utf-8?B?R0szZkdOeS9KSkZXMzZmemZQdnhGMElwckxQWmd3QmNEMlllV09TM2dqZlIy?=
 =?utf-8?B?SjQrNUpsYmF1QjMxSk9ZWVZEU2lZZWc4QTZGT1FtVFdROFBIN0d2NWdLZE1k?=
 =?utf-8?B?cG5YYVZvaFM2MFpGdmJwRjFVeGZyN1JKZHB3WHZuUnBib3RZVnFwNDZSeDF5?=
 =?utf-8?B?OVFNTExkMDhEVHVBZEFFeE1ZUG9Dd2MrZklQR1g3bGdSdnRZYndoQmtWSG5K?=
 =?utf-8?B?SWwxMmN2Rnk5Z25VeGExc0p0NWxGdTltb0syaXBtMmxEQjVvNXNCc0xTUHlm?=
 =?utf-8?B?elp5Sk9oVWVpM1E2RFZVN0xuNWU1MFhRaUJQSlFqRkdWZjlLVzVOZVhaT2FE?=
 =?utf-8?Q?LablQ6pg8sS1jTKlhvIV3bhJQh8CT6TnucDRVR15ss=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3db699-ac15-40b3-dbd5-08d9be4403e0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2896.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 14:22:38.3606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5HUqIfrOpQq1HDk8lENReuYuj9GqdbDb7qIBWZpczyxSWKACuxzJSoKEvOX0BYIwWvwSKI0dXlT0ct8s17VeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3213
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-12-13 4:46 a.m., Michel Dänzer wrote:
> On 2021-12-11 13:20, Rodrigo Siqueira Jordao wrote:
>>
>>
>> On 2021-12-09 11:46 a.m., Michel Dänzer wrote:
>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>
>>> Move code using the Pipe struct to a new helper function.
>>>
>>> Works around[0] this warning (resulting in failure to build a RHEL debug
>>> kernel with Werror enabled):
>>>
>>> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c: In function ‘dml31_ModeSupportAndSystemConfigurationFull’:
>>> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:5740:1: warning: the frame size of 2144 bytes is larger than 2048 bytes [-Wframe-larger-than=]
>>>
>>> The culprit seems to be the Pipe struct, so pull the relevant block out
>>> into its own sub-function. (This is porting
>>> a62427ef9b55 "drm/amd/display: Reduce stack size for dml21_ModeSupportAndSystemConfigurationFull"
>>> from dml31 to dml21)
>>>
>>> [0] AFAICT this doesn't actually reduce the total amount of stack which
>>> can be used, just moves some of it from
>>> dml31_ModeSupportAndSystemConfigurationFull to the new helper function,
>>> so the former happens to no longer exceed the limit for a single
>>> function.
>>>
>>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>>> ---
>>>    .../dc/dml/dcn31/display_mode_vba_31.c        | 185 ++++++++++--------
>>>    1 file changed, 99 insertions(+), 86 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
>>> index 7e937bdcea00..8965f9af9d0a 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
>>> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
>>> @@ -3949,6 +3949,102 @@ static double TruncToValidBPP(
>>>        return BPP_INVALID;
>>>    }
>>>    +static noinline void CalculatePrefetchSchedulePerPlane(
>>> +        struct display_mode_lib *mode_lib,
>>> +        double HostVMInefficiencyFactor,
>>> +        int i,
>>> +        unsigned j,
>>> +        unsigned k)
>>> +{
>>> +    struct vba_vars_st *v = &mode_lib->vba;
>>> +    Pipe myPipe;
>>> +
>>> +    myPipe.DPPCLK = v->RequiredDPPCLK[i][j][k];
>>> +    myPipe.DISPCLK = v->RequiredDISPCLK[i][j];
>>> +    myPipe.PixelClock = v->PixelClock[k];
>>> +    myPipe.DCFCLKDeepSleep = v->ProjectedDCFCLKDeepSleep[i][j];
>>> +    myPipe.DPPPerPlane = v->NoOfDPP[i][j][k];
>>> +    myPipe.ScalerEnabled = v->ScalerEnabled[k];
>>> +    myPipe.SourceScan = v->SourceScan[k];
>>> +    myPipe.BlockWidth256BytesY = v->Read256BlockWidthY[k];
>>> +    myPipe.BlockHeight256BytesY = v->Read256BlockHeightY[k];
>>> +    myPipe.BlockWidth256BytesC = v->Read256BlockWidthC[k];
>>> +    myPipe.BlockHeight256BytesC = v->Read256BlockHeightC[k];
>>> +    myPipe.InterlaceEnable = v->Interlace[k];
>>> +    myPipe.NumberOfCursors = v->NumberOfCursors[k];
>>> +    myPipe.VBlank = v->VTotal[k] - v->VActive[k];
>>> +    myPipe.HTotal = v->HTotal[k];
>>> +    myPipe.DCCEnable = v->DCCEnable[k];
>>> +    myPipe.ODMCombineIsEnabled = v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1
>>> +        || v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1;
>>> +    myPipe.SourcePixelFormat = v->SourcePixelFormat[k];
>>> +    myPipe.BytePerPixelY = v->BytePerPixelY[k];
>>> +    myPipe.BytePerPixelC = v->BytePerPixelC[k];
>>> +    myPipe.ProgressiveToInterlaceUnitInOPP = v->ProgressiveToInterlaceUnitInOPP;
>>> +    v->NoTimeForPrefetch[i][j][k] = CalculatePrefetchSchedule(
>>> +        mode_lib,
>>> +        HostVMInefficiencyFactor,
>>> +        &myPipe,
>>> +        v->DSCDelayPerState[i][k],
>>> +        v->DPPCLKDelaySubtotal + v->DPPCLKDelayCNVCFormater,
>>> +        v->DPPCLKDelaySCL,
>>> +        v->DPPCLKDelaySCLLBOnly,
>>> +        v->DPPCLKDelayCNVCCursor,
>>> +        v->DISPCLKDelaySubtotal,
>>> +        v->SwathWidthYThisState[k] / v->HRatio[k],
>>> +        v->OutputFormat[k],
>>> +        v->MaxInterDCNTileRepeaters,
>>> +        dml_min(v->MaxVStartup, v->MaximumVStartup[i][j][k]),
>>> +        v->MaximumVStartup[i][j][k],
>>> +        v->GPUVMMaxPageTableLevels,
>>> +        v->GPUVMEnable,
>>> +        v->HostVMEnable,
>>> +        v->HostVMMaxNonCachedPageTableLevels,
>>> +        v->HostVMMinPageSize,
>>> +        v->DynamicMetadataEnable[k],
>>> +        v->DynamicMetadataVMEnabled,
>>> +        v->DynamicMetadataLinesBeforeActiveRequired[k],
>>> +        v->DynamicMetadataTransmittedBytes[k],
>>> +        v->UrgLatency[i],
>>> +        v->ExtraLatency,
>>> +        v->TimeCalc,
>>> +        v->PDEAndMetaPTEBytesPerFrame[i][j][k],
>>> +        v->MetaRowBytes[i][j][k],
>>> +        v->DPTEBytesPerRow[i][j][k],
>>> +        v->PrefetchLinesY[i][j][k],
>>> +        v->SwathWidthYThisState[k],
>>> +        v->PrefillY[k],
>>> +        v->MaxNumSwY[k],
>>> +        v->PrefetchLinesC[i][j][k],
>>> +        v->SwathWidthCThisState[k],
>>> +        v->PrefillC[k],
>>> +        v->MaxNumSwC[k],
>>> +        v->swath_width_luma_ub_this_state[k],
>>> +        v->swath_width_chroma_ub_this_state[k],
>>> +        v->SwathHeightYThisState[k],
>>> +        v->SwathHeightCThisState[k],
>>> +        v->TWait,
>>> +        &v->DSTXAfterScaler[k],
>>> +        &v->DSTYAfterScaler[k],
>>> +        &v->LineTimesForPrefetch[k],
>>> +        &v->PrefetchBW[k],
>>> +        &v->LinesForMetaPTE[k],
>>> +        &v->LinesForMetaAndDPTERow[k],
>>> +        &v->VRatioPreY[i][j][k],
>>> +        &v->VRatioPreC[i][j][k],
>>> +        &v->RequiredPrefetchPixelDataBWLuma[i][j][k],
>>> +        &v->RequiredPrefetchPixelDataBWChroma[i][j][k],
>>> +        &v->NoTimeForDynamicMetadata[i][j][k],
>>> +        &v->Tno_bw[k],
>>> +        &v->prefetch_vmrow_bw[k],
>>> +        &v->dummy7[k],
>>> +        &v->dummy8[k],
>>> +        &v->dummy13[k],
>>> +        &v->VUpdateOffsetPix[k],
>>> +        &v->VUpdateWidthPix[k],
>>> +        &v->VReadyOffsetPix[k]);
>>> +}
>>> +
>>>    void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>>>    {
>>>        struct vba_vars_st *v = &mode_lib->vba;
>>> @@ -5276,92 +5372,9 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>>>                            v->SREnterPlusExitTime);
>>>                      for (k = 0; k < v->NumberOfActivePlanes; k++) {
>>> -                    Pipe myPipe;
>>> -
>>> -                    myPipe.DPPCLK = v->RequiredDPPCLK[i][j][k];
>>> -                    myPipe.DISPCLK = v->RequiredDISPCLK[i][j];
>>> -                    myPipe.PixelClock = v->PixelClock[k];
>>> -                    myPipe.DCFCLKDeepSleep = v->ProjectedDCFCLKDeepSleep[i][j];
>>> -                    myPipe.DPPPerPlane = v->NoOfDPP[i][j][k];
>>> -                    myPipe.ScalerEnabled = v->ScalerEnabled[k];
>>> -                    myPipe.SourceScan = v->SourceScan[k];
>>> -                    myPipe.BlockWidth256BytesY = v->Read256BlockWidthY[k];
>>> -                    myPipe.BlockHeight256BytesY = v->Read256BlockHeightY[k];
>>> -                    myPipe.BlockWidth256BytesC = v->Read256BlockWidthC[k];
>>> -                    myPipe.BlockHeight256BytesC = v->Read256BlockHeightC[k];
>>> -                    myPipe.InterlaceEnable = v->Interlace[k];
>>> -                    myPipe.NumberOfCursors = v->NumberOfCursors[k];
>>> -                    myPipe.VBlank = v->VTotal[k] - v->VActive[k];
>>> -                    myPipe.HTotal = v->HTotal[k];
>>> -                    myPipe.DCCEnable = v->DCCEnable[k];
>>> -                    myPipe.ODMCombineIsEnabled = v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1
>>> -                            || v->ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1;
>>> -                    myPipe.SourcePixelFormat = v->SourcePixelFormat[k];
>>> -                    myPipe.BytePerPixelY = v->BytePerPixelY[k];
>>> -                    myPipe.BytePerPixelC = v->BytePerPixelC[k];
>>> -                    myPipe.ProgressiveToInterlaceUnitInOPP = v->ProgressiveToInterlaceUnitInOPP;
>>> -                    v->NoTimeForPrefetch[i][j][k] = CalculatePrefetchSchedule(
>>> -                            mode_lib,
>>> -                            HostVMInefficiencyFactor,
>>> -                            &myPipe,
>>> -                            v->DSCDelayPerState[i][k],
>>> -                            v->DPPCLKDelaySubtotal + v->DPPCLKDelayCNVCFormater,
>>> -                            v->DPPCLKDelaySCL,
>>> -                            v->DPPCLKDelaySCLLBOnly,
>>> -                            v->DPPCLKDelayCNVCCursor,
>>> -                            v->DISPCLKDelaySubtotal,
>>> -                            v->SwathWidthYThisState[k] / v->HRatio[k],
>>> -                            v->OutputFormat[k],
>>> -                            v->MaxInterDCNTileRepeaters,
>>> -                            dml_min(v->MaxVStartup, v->MaximumVStartup[i][j][k]),
>>> -                            v->MaximumVStartup[i][j][k],
>>> -                            v->GPUVMMaxPageTableLevels,
>>> -                            v->GPUVMEnable,
>>> -                            v->HostVMEnable,
>>> -                            v->HostVMMaxNonCachedPageTableLevels,
>>> -                            v->HostVMMinPageSize,
>>> -                            v->DynamicMetadataEnable[k],
>>> -                            v->DynamicMetadataVMEnabled,
>>> -                            v->DynamicMetadataLinesBeforeActiveRequired[k],
>>> -                            v->DynamicMetadataTransmittedBytes[k],
>>> -                            v->UrgLatency[i],
>>> -                            v->ExtraLatency,
>>> -                            v->TimeCalc,
>>> -                            v->PDEAndMetaPTEBytesPerFrame[i][j][k],
>>> -                            v->MetaRowBytes[i][j][k],
>>> -                            v->DPTEBytesPerRow[i][j][k],
>>> -                            v->PrefetchLinesY[i][j][k],
>>> -                            v->SwathWidthYThisState[k],
>>> -                            v->PrefillY[k],
>>> -                            v->MaxNumSwY[k],
>>> -                            v->PrefetchLinesC[i][j][k],
>>> -                            v->SwathWidthCThisState[k],
>>> -                            v->PrefillC[k],
>>> -                            v->MaxNumSwC[k],
>>> -                            v->swath_width_luma_ub_this_state[k],
>>> -                            v->swath_width_chroma_ub_this_state[k],
>>> -                            v->SwathHeightYThisState[k],
>>> -                            v->SwathHeightCThisState[k],
>>> -                            v->TWait,
>>> -                            &v->DSTXAfterScaler[k],
>>> -                            &v->DSTYAfterScaler[k],
>>> -                            &v->LineTimesForPrefetch[k],
>>> -                            &v->PrefetchBW[k],
>>> -                            &v->LinesForMetaPTE[k],
>>> -                            &v->LinesForMetaAndDPTERow[k],
>>> -                            &v->VRatioPreY[i][j][k],
>>> -                            &v->VRatioPreC[i][j][k],
>>> -                            &v->RequiredPrefetchPixelDataBWLuma[i][j][k],
>>> -                            &v->RequiredPrefetchPixelDataBWChroma[i][j][k],
>>> -                            &v->NoTimeForDynamicMetadata[i][j][k],
>>> -                            &v->Tno_bw[k],
>>> -                            &v->prefetch_vmrow_bw[k],
>>> -                            &v->dummy7[k],
>>> -                            &v->dummy8[k],
>>> -                            &v->dummy13[k],
>>> -                            &v->VUpdateOffsetPix[k],
>>> -                            &v->VUpdateWidthPix[k],
>>> -                            &v->VReadyOffsetPix[k]);
>>> +                    CalculatePrefetchSchedulePerPlane(mode_lib,
>>> +                                      HostVMInefficiencyFactor,
>>> +                                      i, j,    k);
>>>                    }
>>>                      for (k = 0; k < v->NumberOfActivePlanes; k++) {
>>>
>>
>> Hi Michel,
>>
>> Overwall I think this series is good. I also run it in our internal CI and everything looks fine.
>>
>> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>
>> And applied to amd-staging-drm-next.
> 
> Thanks!
> 
> Are there any plans for actually reducing the combined amount of stack used by ModeSupportAndSystemConfigurationFull + CalculatePrefetchSchedulePerPlane?

Hi Michel,

Tbh, I'm not fully aware of the problem with the stack size used by 
"ModeSupportAndSystemConfigurationFull + 
CalculatePrefetchSchedulePerPlane". Could you help me to understand it 
better? Could you provide some background? Also, could you help me 
better understand the impact of this stack size issue in the DML code? 
Any information will be helpful.

> 
> Also, did you check that UseMinimumDCFCLK now modifying mode_lib->vba.DCFCLKState[i][j] and possibly other values in mode_lib->vba makes sense?

To check this patch, I submitted it to our Internal CI, where we ran a 
couple of IGT tests in multiple ASICs, and I conducted a simple smoke 
test using 5600XT and a Raven system. Everything was fine.

Finally, I checked Dmytro's opinion about this change, and he agreed 
that your patch is fine.

Thanks
Siqueira

