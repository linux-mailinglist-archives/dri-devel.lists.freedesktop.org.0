Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0D14EC4A1
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 14:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8207B10E46B;
	Wed, 30 Mar 2022 12:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73C010E42B;
 Wed, 30 Mar 2022 12:41:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jF/EcriJwmokhNoNvm7djuBQWKCctUkt0DnaOfpERv3B9hpY8QXqdd1iXry5aJ+RfYrxFzKiyh+Rj1+7l65YhU3haDRlixfcsMvvtKheZmhyAV47N9yARaiAynlHv/z9zEdL64twH4ou9FLQo2/gMCzmL6jsklA7i6RUkOCq3Xs0llkth2WsxGUx6nJX34M+Vm7wIeQqKA0jWmnA97TastPRDwmcl5d5Zpd+TKct0j5/iPlta+cwEd0sS7fS0MWfHFLiqB/gb3WbjGU6rgRaZcKD+fKWyAR6oXQDIrS0x5972c9LgmojCrx9nTidSzvTQQl9lH2f+J4qt/xLQeBhUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuHE/jQ5KYbXtgnBzaeatm7IF6rJJY3imhuJY2HUU5s=;
 b=AXsoeR4p6BrvkOV+YtlOOLNO32xIrC2HxlbCSvSobYSIct7hYbaSIVJSqVjUuDkya+qNn8N8P2rHelKObgSTuPFhVJQYEJ7dzqB5+gaBNJs3HBonwa7IL9j84bnxF1RY9clISgvtbgBYP6D9w2s3zG8ZdmmafzwGr7mLzh3ouZVgg7j37HEstVFTnaTFALXwUCroAxkRbbBxv9teccZJ9+6/Z7Sohi/z4J1mx0oix53XZ2KtTSBz0+zf61weLNym4GMIb6dC9t6tgMFl93Qj7XD72bK4KcQpVHlLjl5pRwT7FwXduZKg2JylyjhxkrLlIrC5cYatb7u8kk2mmcqIVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuHE/jQ5KYbXtgnBzaeatm7IF6rJJY3imhuJY2HUU5s=;
 b=y6weZuuoL1WSrcqATyzwUa4WokULiou7y+sFAovRV8U3NiZdUAAQfHTnzsjPdIEnSWT5O2ZFVH601u+yQxaa+Bjruv+oXqNEOi36QuYleNk1aQ820pbd9M/52S7dE5Z3UQnUwOCul3CCqZlb1kOwpCDZjYZjOYbYTSc41YECTBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2896.namprd12.prod.outlook.com (2603:10b6:208:ab::22)
 by CH2PR12MB4295.namprd12.prod.outlook.com (2603:10b6:610:a7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 12:41:33 +0000
Received: from MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::84a2:64f8:f2ec:fc08]) by MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::84a2:64f8:f2ec:fc08%4]) with mapi id 15.20.5102.022; Wed, 30 Mar 2022
 12:41:33 +0000
Message-ID: <1721b4cb-adab-4e5b-070f-c26d0e2c6bbf@amd.com>
Date: Wed, 30 Mar 2022 08:41:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/2] remove DC_FP_* wrappers in dml files
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 airlied@linux.ie, alexander.deucher@amd.com, christian.koenig@amd.com,
 daniel@ffwll.ch, harry.wentland@amd.com, Rodrigo.Siqueira@amd.com,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com
References: <20220326202448.2046077-1-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
In-Reply-To: <20220326202448.2046077-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR0102CA0043.prod.exchangelabs.com
 (2603:10b6:208:25::20) To MN2PR12MB2896.namprd12.prod.outlook.com
 (2603:10b6:208:ab::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0874440-2785-4e6d-f08c-08da124a9ecc
X-MS-TrafficTypeDiagnostic: CH2PR12MB4295:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4295CE97744050252E4AE24C981F9@CH2PR12MB4295.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SSp04O2wvZMCR5mG5UiflbcP5xpjpAqyXWRpaGNbWMzt5ZQ9A85gaYBPfjjWZy7fZJ4XVU8TBUQfxIVkIlXPCaKs6YdlGWo9BA0ASWFnH63RA4mXnCkfsS3dkUoxP3D33nzUwct0Sas/ITLGe6PIHhVCA6qS/oDbvL9J4rURv2RsxH5dnyq2N1mYQ5kaxjQbzWzauiGsfgiQgnbuokcGRvsioxWSH/8/RfEnjtKT1z7u6gD243U30FoYJu6dQsHj6/4ntl7ceZRl3WrBG2lc6hwPROVHDCyoUsibR2ToVgycm9cI0nvIftxValPdPtwH8QCpzxaJKs/rgNaPlkbm+HAKrEUiO7Hp6+ZL6X4DpovX+TEN0l3JEy34zliDSDmhFuiRLvmdXzvmPEUsnnPA0UrEVT5FV3lxL3q3UQ/xj8kD5TtqnGOD+eh3JijqJL+mT/XMQmxHT/n+AoCQiHbmGbZvu0KwnHHwhjxL1AFhJxmMf32/nuehtHSuj0q90s4JPAuot0CXmSBsp6uMMT/ohWecV+sXqSi+EtfcEWwOur46WY5OITSEze1XUlgNdGSoan/g9zRLZCNvGONGOxWoFsoSXNWswLIZ1sL5u78RkJiFEfH2DE+teJy2hgvRXv3l+jdFq3nH5bHrJy7H37kdrCWFohzCq6fX6u3TH6pEEDJDvel4FZunMw4HcXVcLo0y9az5s9+cGEcNyWNB+sxXfV5lWHsVsuepqnmoE9POWToUTeSNCqrkhKRR7f4m7+f38+E7nWzDmVGvvOynwdTq4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2896.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(921005)(8936002)(38100700002)(5660300002)(2616005)(186003)(316002)(6512007)(508600001)(6486002)(6636002)(54906003)(53546011)(4326008)(8676002)(83380400001)(6506007)(66556008)(66946007)(66476007)(31686004)(2906002)(36756003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGovTC80Tlk4QlZLeHVRNnQ4TEFYcUczekFlUm1xTGd3YVRFTnc5dmlyU3F1?=
 =?utf-8?B?YU1BQVBXdzVwck9MQmtuTHhHZ0dxeGp3bE05RHhjUkpjS1JOZE1jVzYrcXdx?=
 =?utf-8?B?b0o5UDNxaFAvcGVLbXhQaXlIYWlpcDJzMk1qYWRCbnVGYndWR0V3SlZHZVhJ?=
 =?utf-8?B?c0QxSDZSMjd3blNqbDJLRk1CVEw1dmtQT1Z1YkMzamtBaldYVzdUUjlrVlhk?=
 =?utf-8?B?QzRUczhQTHdkemZVYnE5RlVsdW1XZWU4am84TDBuMkYydUc0WnlYOWZ0aE0w?=
 =?utf-8?B?djZFNGJPeFFkMCticksrWWU3cFhTQmNDM1RUejErSzJCc25ad3Y2V2k2MXlE?=
 =?utf-8?B?eXZtTDI3OVRManRCUHJERndRRFVaUFpCL0pBdTBmRmZzV0Nlc2lxQWpLa0xL?=
 =?utf-8?B?L1ZuYVFPekdWQnBJMW52OUpUSmowYWd1RXlPdis1MFN3WWlGM3hYbHVhcDdz?=
 =?utf-8?B?QzRmeDZQVTF2QVVNUmo1Z1pFUW04VC9NODZHODB6QjR0b050YjBIc2RUUTBK?=
 =?utf-8?B?ajFzTXRaMGMrQ0dVVWZFSHZlZEI4RGc2MkR0THc4MW1ES084SmtGa3g3clZX?=
 =?utf-8?B?MGV0MjJoZkhBelE1SDhxY0RVNTBpb0xxRzVMVnNKb256LytzclNoWUJSbGNm?=
 =?utf-8?B?WDc0RUEyQVBWTHVGRWxHMWxHLzdDdXFsWlFMTi9hbThOaDRHQVh1dWFSaEdl?=
 =?utf-8?B?L09yZWJmRFpRdjNsT1F4L3JiaS9OUWVRRWtiaW5reVREa3FGRjFISzRqR1ho?=
 =?utf-8?B?WFVXbjhxdFJ1Y1J2RFFmbmRhT0dDTXBuMTZBN1ArS2JzbnVBTHNjQmQvd0pu?=
 =?utf-8?B?L3hQNWlqK1c0alZYUE9JV1kzYUFKMWl1MnJpUlIrOThxc05ueVRQSFB3L09x?=
 =?utf-8?B?V0pFdHN5aEZxZU8zQlVPczZFcWhNYVRCU1hDTDlubmlwUnNjOGVCUTZhTElF?=
 =?utf-8?B?dWo0Tit5ZzVHVFNxREhUQXRjTUg4TTYrNG9sTDlFSFZ4UGtzUzg0MFFHSEdK?=
 =?utf-8?B?azJGUFArWlVRS1VBVHg0bElDZDVVR0NtUFdWVkU0V29YQ09lQnp1cHhrMElT?=
 =?utf-8?B?VVo5cU85WGowQ1lWemRPYzBPK00xYzZiTU1EejBQL3FHWnYxSmgyQ04wRUJY?=
 =?utf-8?B?NVd5a1lNcXYzb2NEb1ZEN3VvNHNiaDNvWHBnMWt5dzk0Z21rZVVwQWRHN0Rv?=
 =?utf-8?B?L28rOCs4MTg2Sk9nTGJWTHBuWSs5emNJcFFHQWJDRUlVT1VFMDZYbHBmaVZR?=
 =?utf-8?B?R21uK2s1T1UyaHMrdDV3RmFrL2FRSVMyNXV6QlVieWJzYVpObTNrSXc3c0dM?=
 =?utf-8?B?RnM3cWdNTi9xUEFyYkM5d1B5TENEajd3TUZFdFR2N1I3R1crbWE3bGpkWHdF?=
 =?utf-8?B?S0J6ZTdoU3ZMeHVjSEZnTXZYMzAyTEF4N3BlbDdMQlczQ3J1d2owNkdERC95?=
 =?utf-8?B?WTdvUmZmbTlwekRlZ3NxTGYzZmZXa3gvMHBvaHNESDI5TlFmODRQd3BEa2U5?=
 =?utf-8?B?SkRzZEpJdDV3bmJWWVVoWTUvL1VxcmtiVGx3R1BBakFtdENHR1ZDLytoL2ln?=
 =?utf-8?B?U0c5bFBxam5kTFBEd2pyaVNpbjAzOXhPaDBxcW95OWhqMDJTdGRvSlh1RWto?=
 =?utf-8?B?WlR5Y2E5a3pVaXQ5YzloUG4zZFRtcXBxVDF3Y3NaYk4vbVRteExlQ0VQOWJD?=
 =?utf-8?B?Nzc0VDBTNXdyT0pwMEs5c21kY0xuY0luRjBUS0JTcUkxNm00OWY0bWpJRmV0?=
 =?utf-8?B?cDF6a05kNlhUOG5xRkt4SENBTnQyVFo2UUJaQkRVd0tNM09oaXlaQkpPTzJl?=
 =?utf-8?B?T2dCTEdIVGJvVFg1Z0Y1bEVDalhPRnVGM2FmQWNaQ2g0UlB3SVdLUVJ5UXJY?=
 =?utf-8?B?VUNaVysxVGkxMGRUUzFscis0b0E0Sy9QMTdGY2Iyb05DQXdQVmlRRUZpOXc1?=
 =?utf-8?B?Ukl1OEdHK1RTNTQrQjVyOEdieHBRS2o4OEJ2MVBGL1ZnRlZWa1QzOWlrUGMv?=
 =?utf-8?B?dFJLdDI0K3hYWVVld3JqY2xZMjJ3TktnYS9hVDlFcGNjWkxncER6WU9od3Bz?=
 =?utf-8?B?ZEk4Uzh4aERTL2Zidkl0dFZ5MTlpYnZBczRFTXVGbnJGR2hkY2NLNGdQakQy?=
 =?utf-8?B?TEpFaFNnTWZKN1o4TmNQMUFBclNCVTF6TVY1TWVDOFNOSnREQytMMmJQa1Mv?=
 =?utf-8?B?VDZnZEd4b3l0RTJjRXNXTUY1ZkJsU09XRnhzUUV6Tmcvc3kzWEw0ZHhuMm03?=
 =?utf-8?B?cS80Q0ljYTRSQlYyaFhkSURDQWdtTUR2VU5uUTA3QVZ6U0tFUHc2T2ZaVUVs?=
 =?utf-8?B?RUZ0MlRHMTcwRzcyU0wvRXZkRHpRUHNaOUhVN2VLdXJ0alNkU3BiMXRGUkVT?=
 =?utf-8?Q?RCzYV2XW0nTFkdnqSeivk28p2ilq23u6gIgY+Hr8Msvbt?=
X-MS-Exchange-AntiSpam-MessageData-1: s9Q+llemLqZKPw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0874440-2785-4e6d-f08c-08da124a9ecc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2896.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 12:41:32.8863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ksTA+OsywiJjjJxzNS6EFtcIqjSPUwTageuWwkPrArkqg0gzB9qv2TVR5h3LCwvePs7gIdFIj+dZcUwNgL0CLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4295
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
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jasdeep Dhillon <jdhillon@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-03-26 16:24, Melissa Wen wrote:
>  From FPU documentation, developers must not use DC_FP_START/END in dml
> files, but invoke it when calling FPU-associated functions (isolated in
> dml folder). Therefore, the first patch renames dcn10_validate_bandwidth
> in dml/calcs to dcn_ for generalization, declares dcn10_validate_bandwidth
> in dcn10 - that calls dcn_validate_bandwidth and wraps with DC_FP_*
> accordingly. The second patch removes invocations of DC_FP_* from dml
> files and properly wraps FPU functions in dc code outside dml folder.
> 
> Melissa Wen (2):
>    drm/amd/display: detach fpu operations from dcn10_validate_bandwidth
>      in calcs
>    drm/amd/display: remove DC_FP_* wrapper from dml folder
> 
>   .../amd/display/dc/dcn10/dcn10_hw_sequencer.c | 10 ++++++++--
>   .../drm/amd/display/dc/dcn10/dcn10_resource.c | 16 ++++++++++++++++
>   .../drm/amd/display/dc/dml/calcs/dcn_calcs.c  | 19 +------------------
>   .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  |  2 --
>   .../gpu/drm/amd/display/dc/inc/dcn_calcs.h    |  2 +-
>   5 files changed, 26 insertions(+), 23 deletions(-)
> 


Hi,

Thanks a lot for your patch!

I reviewed and tested this series and lgtm. Applied to amd-staging-drm-next.

Btw, I agree with Christian. Can you try to find a way to add a 
compilation error or warning if the developer tries to add DC_FP_* 
inside DML?

Also, about the question of recursive calling to DC_FP_*, it should be 
safe if using DC_FP_*.

Thanks
Siqueira
