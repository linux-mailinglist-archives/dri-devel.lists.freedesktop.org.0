Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9B24A00F1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 20:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB27C10E394;
	Fri, 28 Jan 2022 19:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56ADB10E201;
 Fri, 28 Jan 2022 19:36:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZn0+elmHtMRewbr4d3gs0rBYnkOT3Fpx+3ElFfcpUJdPQRC1xCjLTytNFkNoZrSo1ZexoA26Jnh9gm0tBGrVGcbjLUVawFUOgC56oflB22SDYbkq6ZD9K5nacV2U3H0xtj2R9b/4PgJvMYdzRYZGsWym8YFJTmV/u/gRtPaultAa+mXnXzPohnwPoF9AF+jPFJv68P8VmYOuGmBANYcYpaTmlQa3vt2ih7uuxOh/R6nF9f05dgVJlVPBHgH8dJfTw+Lmsl5CuEemXGGA2RRC2iotO5kkw+f8ckoFzLE103WTy8qr7dGOtHtIFCA8TkmnMoQk1Fv/MKn64dXIsdGLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrwjEdlvLQh05rsFXHiF8OtjqxtZsVLQdgYkR2PenAM=;
 b=AsTPfTgtnNk5RKlqRFavIEc6iVeS7CSMToG0H7n5RPY0mTY8tN4g3APgCuw8Oh8TB/O4NlCvAG89tXNjYnGuamxjjnMcIkYEMk6tx8sUye7UcF1/gS6nvXocjLJYYZjCAX3zCOwywuE5/mXIdAYM2tpEKMKYuI72sTUK6V4WsbboA1MylSghjHItod79NhK6agOFtc7BSTnYfyhKRvQbLvyDtkQ0Tf/LlBV0/0NBXKvX/pxtJgd6oAlDzwGRJbzSGBQ/C3k/BtBduN9Ib13juxcDu80EyoTDormU0ae9tOJkEMeFR/U2vWBwZt/Ow9peg5YI8AN4thE8D0RmrIw5SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrwjEdlvLQh05rsFXHiF8OtjqxtZsVLQdgYkR2PenAM=;
 b=AjcirntIMXPkZO+jdeBmVHdubdqQjQ+vS6DR+5h5Ia++ZNs+iz3XT1bsKv8n7gbSE+IKfRDy7y9fyDxudN2qTFRR2nMfbqfXcyw2V3XDL7UwE4BNBkhK0lBmV1xxzKGV3O76mIAZKEeFVxQeImOEFyMQnStCjijWa/zmKDozpns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by MN2PR12MB4240.namprd12.prod.outlook.com (2603:10b6:208:1d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Fri, 28 Jan
 2022 19:36:44 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3%11]) with mapi id 15.20.4909.019; Fri, 28 Jan 2022
 19:36:44 +0000
Message-ID: <22cc504b-8f40-2c11-c783-ed4548e092b2@amd.com>
Date: Fri, 28 Jan 2022 14:36:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v3 00/12] Define and use reset domain for GPU recovery in
 amdgpu
Content-Language: en-US
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:208:160::47) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eeb52d00-5106-45bc-2822-08d9e29583cb
X-MS-TrafficTypeDiagnostic: MN2PR12MB4240:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4240604534C188C3F0E5C7ADEA229@MN2PR12MB4240.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P1UIBos9TD3SLWWlf5Gg3Om8sOgJp1vCN5WUpjVhVukgE/oCSGXaBdNqBbclqcjkm9vfUeqGyMo5VHeA1cS6hkmNQX3+fga/Gxq1o7/vSBUcNq5OUV+P1B5950UhDse9gPLtMeN04coFZqrAEfSp41cXoJrTw2ahtHTqXvp4SoerOzcyiiAzBGDKRDnmmwj3allC/IxuxdnPCQ6iHiMepnQpxEb9gnucLEfSf3rMa0t6RwY84lse24Ubdlr8W0ecd+MXmNeNsC3HasOkfPefZPTJAA+IxvjdKq7fgPQFdU3DYpEVs/1CpW2dudhDelp/iD+gDpRG96KjczGlFRnNKa3M6NXQrM/PQwL5iHWAd2M4HemBOb+6uemnp5U45SQXx5v2h1eHjHXREPuWObwDY/bYM6UzE+IDIKV4vRqdzMFF4DJ/jPaSpb0qwqivMQUwaaDjsj8ZdqUE3FF81fTShQnD4sS074cxV13na/bQ7uKFW359Rzo4IdjokUhbTFc24XmntbInnVhtzx1/2p1bvlel2NCpSmhJv+9kb/3se7Bk0vA+wcqlN4MWY8VJRzLY73ZbZLQ673LT+mcvC81TUJybuHVRTP7BMq6xL9+mm70y/vhvuQvPEnHgYom0rJxNqALhlPsmO2ficSosG0NdgTKbOYS+hnaVvwDlb4mD/TnPKf1tgXoYc7F4XyTyJh1tt1Tcy3heLjavyfLSaryNdT5CR8bng3hRymLFB1rsqs02f0Xgr0JpkyyTeD6ct4n5mVqMBhB4Bd/6tabJ6UAAB999I7cGgbOCW1MFUAeGufNigzYrM2DNHRXree2gly+HqN7OOWL19691JqL4MoVhfjP38k9apK2aFMhn+0+eUTE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(5660300002)(31696002)(66476007)(31686004)(508600001)(966005)(66946007)(6486002)(186003)(2906002)(86362001)(8676002)(4326008)(8936002)(2616005)(6666004)(6512007)(6506007)(83380400001)(36756003)(44832011)(38100700002)(316002)(53546011)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmlURkhIQXdjK2lqVEF2ZlNpeDNrdVlCYStRdmpYaldKTVFTa0J0OHNJZ3Qw?=
 =?utf-8?B?Vk5zeGk2bGhqL1l6VkxLTVRyUGFCUHplK0pleUtlYXBDcVpueVR2OGhzSkR0?=
 =?utf-8?B?b2FscFNkdkw3ZldPYnByQVpLSjBBbnJ4d2xGK3BEb3RwWXYwczNJT1JmWUdH?=
 =?utf-8?B?Qi9UTndRcTFqR0NCV2FJd1JQZmtBVGNkQkpjZ2Z6Uk9OYU14Q2psY0l5RHBU?=
 =?utf-8?B?alJyamNBSWNvN09kU1VaZ1pEcEFjV2Z0NGk0NjhtNHhUdExIdFo1K3p2M0FU?=
 =?utf-8?B?bkZhVUdPMkxxbUUzUzdmMTlIZEY5eFZFQWE0WmpNM0ZQV09kQ3RNTVpoVzhl?=
 =?utf-8?B?THdyUFlSb1kyTEpQVWdKakduQ3lGZHN4VDVGQ2ZSclI3ZnFwZ3lyeXVjOS9i?=
 =?utf-8?B?ZHgvVTJPU1hESjYycC95SzREaGpGdUxhcGcwUFJSSzFjVStRaVhId0EyWFJO?=
 =?utf-8?B?Qk5HY2pZQ0s5WkEva1V5MVJ3OTlGRFhkK0ZZYmtlc2NPOTdTejZ4QitjMW5L?=
 =?utf-8?B?VG9OTlk3MFNydlVGMFFGQnJCelVBcFc4cmlEVWhLd25wSlZ5aERmc0JCeWJr?=
 =?utf-8?B?RENXRnhEd080UERQbWw5Q0t4bCsrVFM5TXRCTDAzYmZVaXF6anhLUGh6NnpU?=
 =?utf-8?B?VndBK1U3L3N5TUN1S3BicWh3YkplQUg5SjR0Q2FDWnQ2OW5SZzJOKzFYd1Nt?=
 =?utf-8?B?YzVrWUxLLzFBdFZ0ek5jSjRiVmNpa3c4UTlXY0RwcTBvWTJqcldGdFpXZnBB?=
 =?utf-8?B?U2twQ3dLMitSczA3UkxtaXpPdnpIQkZVaTZOamdIZC81VHJzMzNjTGM3TzNs?=
 =?utf-8?B?ZHhWaXJXQjFKd3Z3dGpzSk5vTk5sMmZGMS9MekJVQWZPRWNwSWhBVG9hVXc5?=
 =?utf-8?B?Y3Z5U1BhNFlCbjVtZys4Unp2MURIWGpNcmt3RWVLaHhzeEoxK2MxSndrTmJ1?=
 =?utf-8?B?NHVDTnZIK3dEZGdOQVZWOWpQN3hzVUFSZW15cnJsT0x2YWpIdlpaNmp3Q2Uz?=
 =?utf-8?B?a05tVE9FYmxBRDlCdXJaYkl0dUE0OXdvSXhoQ2JTZERRczhaN0c4LzJaYWJK?=
 =?utf-8?B?ZUxkTW5lamhJdXNqa0pCMjAwREhzWEV1cytGajZCRWxEbk41SFdNM2JpSFNk?=
 =?utf-8?B?ZWdrdGJKYXVKbHdyQlBobE9sWlRtZUdkcExiYkFxVEVMa0t5MGZWeVNSZ3E5?=
 =?utf-8?B?RkgvK2gyWGl6eVVxeTJjVjdDeWx4QjNFZGF6bXpud3N5R2c3SjZrVVp6Z3Fy?=
 =?utf-8?B?eEx5U3FWMUd2MGxpa2dEMWU2QVZWMXBIcjBEYlpTNDZWM01FSVdGbkdBZEZ1?=
 =?utf-8?B?OWtranhTdkwxMElrelFTVHZpY2lodUFPSFR5dmlsNFltR0lya1ZCa2VsS2Ju?=
 =?utf-8?B?MEsvandSSTdvOHEzNEx3Myt4emlOVDdrd01YdWdkcThPendmZ0pmM1hnc1pP?=
 =?utf-8?B?Y2V2WUxVQkFhbUFKS1F6MDJUNTBqaldnWGxCVzFmb0E3NTRrb01seFRGWklv?=
 =?utf-8?B?U2N4bjJ6VENoc29PZnJERnVMSXRrTnRQUEZMbkFqbW16UlNzalNKSWFYbjU3?=
 =?utf-8?B?OHorU0tzcVNOaDdDSDFITm83clB0SHRaQ3JtMEVMcXovR0RZdERCemZObnVZ?=
 =?utf-8?B?c1BMdHNwcnZOYUliV2gwRXliWWlaS0xVUG5TcFk4dVlTbkNEbHFsR0lTUS9G?=
 =?utf-8?B?d3dSTzh3VDlZZ0F4UHNBU1NHaU9Oc2V4bXY2Wm45QTYycXpIMTA1bUoxYjF6?=
 =?utf-8?B?eGdKa0hncHFKaXlsYlNKTC9NMG9EV1lscE82bldoREVlUlRHUWhVUFkxbDRo?=
 =?utf-8?B?dVpRZ2R2bjVFMXd5R1dWSGNCSUpvSnlpeHpLZWpURVdiM0ZPdnhNakpFUENj?=
 =?utf-8?B?dU94UlJwS2FqMVNKN0ZBcTZGZ0Z1L2pqbXV2TjRQZXpKNkx4bVhRbkROY281?=
 =?utf-8?B?bXhRQ0Z5QXE0Vm5RK2JsL1NaWHZ1Z1NHeklVS2V4RTlicGRUNVdjQUhsVU1I?=
 =?utf-8?B?REpCZnNWdUV4RXh4ZkVnNzJ4ZVdHZkdyK3FUV2JWMWxEbWZ2U285aTZJaWJ5?=
 =?utf-8?B?QzA0SjNJS0hoRkJmMWVsSlBpSWlSOTJHdVd1NjNaY1dKOXdDMVpJaVcwMnBs?=
 =?utf-8?B?ckdGWC9JRUpmM1dsalZIZitGTHJqV2dIdFI5ZjErNnE0SFJoRmdJR0FRVHBE?=
 =?utf-8?B?RDZiOVFBNEJBSUpaK2NJL01ZdElVSTA5SUlZR2tQYnJrWjNrc3lGMW9Ha0Z3?=
 =?utf-8?Q?CDa51XGMN3Hwx+GPPyEkdL6oSZwDC5JMjjoUMMTiYM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb52d00-5106-45bc-2822-08d9e29583cb
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 19:36:44.1894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: euDn101ZckF5NcgfjCdnd7eyo+lnlaQ0I0lgL/1Pjnk0xu0pF/yv8FMBzNpPJ2OPPz4oa7f29NdE29Cx7dpx4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4240
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
Cc: horace.chen@amd.com, lijo.lazar@amd.com, jingwech@amd.com,
 christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a gentle ping if people have more comments on this patch set ? 
Especially last 5 patches
as first 7 are exact same as V2 and we already went over them mostly.

Andrey

On 2022-01-25 17:37, Andrey Grodzovsky wrote:
> This patchset is based on earlier work by Boris[1] that allowed to have an
> ordered workqueue at the driver level that will be used by the different
> schedulers to queue their timeout work. On top of that I also serialized
> any GPU reset we trigger from within amdgpu code to also go through the same
> ordered wq and in this way simplify somewhat our GPU reset code so we don't need
> to protect from concurrency by multiple GPU reset triggeres such as TDR on one
> hand and sysfs trigger or RAS trigger on the other hand.
>
> As advised by Christian and Daniel I defined a reset_domain struct such that
> all the entities that go through reset together will be serialized one against
> another.
>
> TDR triggered by multiple entities within the same domain due to the same reason will not
> be triggered as the first such reset will cancel all the pending resets. This is
> relevant only to TDR timers and not to triggered resets coming from RAS or SYSFS,
> those will still happen after the in flight resets finishes.
>
> v2:
> Add handling on SRIOV configuration, the reset notify coming from host
> and driver already trigger a work queue to handle the reset so drop this
> intermediate wq and send directly to timeout wq. (Shaoyun)
>
> v3:
> Lijo suggested puting 'adev->in_gpu_reset' in amdgpu_reset_domain struct.
> I followed his advise and also moved adev->reset_sem into same place. This
> in turn caused to do some follow-up refactor of the original patches
> where i decoupled amdgpu_reset_domain life cycle frolm XGMI hive because hive is destroyed and
> reconstructed for the case of reset the devices in the XGMI hive during probe for SRIOV See [2]
> while we need the reset sem and gpu_reset flag to always be present. This was attained
> by adding refcount to amdgpu_reset_domain so each device can safely point to it as long as
> it needs.
>
>
> [1] https://patchwork.kernel.org/project/dri-devel/patch/20210629073510.2764391-3-boris.brezillon@collabora.com/
> [2] https://www.spinics.net/lists/amd-gfx/msg58836.html
>
> P.S Going through drm-misc-next and not amd-staging-drm-next as Boris work hasn't landed yet there.
>
> P.P.S Patches 8-12 are the refactor on top of the original V2 patchset.
>
> P.P.P.S I wasn't able yet to test the reworked code on XGMI SRIOV system because drm-misc-next fails to load there.
> Would appriciate if maybe jingwech can try it on his system like he tested V2.
>
> Andrey Grodzovsky (12):
>    drm/amdgpu: Introduce reset domain
>    drm/amdgpu: Move scheduler init to after XGMI is ready
>    drm/amdgpu: Fix crash on modprobe
>    drm/amdgpu: Serialize non TDR gpu recovery with TDRs
>    drm/amd/virt: For SRIOV send GPU reset directly to TDR queue.
>    drm/amdgpu: Drop hive->in_reset
>    drm/amdgpu: Drop concurrent GPU reset protection for device
>    drm/amdgpu: Rework reset domain to be refcounted.
>    drm/amdgpu: Move reset sem into reset_domain
>    drm/amdgpu: Move in_gpu_reset into reset_domain
>    drm/amdgpu: Rework amdgpu_device_lock_adev
>    Revert 'drm/amdgpu: annotate a false positive recursive locking'
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  15 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  10 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 275 ++++++++++--------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  43 +--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   2 +-
>   .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c    |  18 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c     |  39 +++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h     |  12 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |   2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c      |  24 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h      |   3 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        |   6 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         |  14 +-
>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c         |  19 +-
>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c         |  19 +-
>   drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c         |  11 +-
>   16 files changed, 313 insertions(+), 199 deletions(-)
>
