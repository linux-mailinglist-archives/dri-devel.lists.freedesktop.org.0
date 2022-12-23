Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A276553CA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 20:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8BF10E20B;
	Fri, 23 Dec 2022 19:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5503E10E1F5;
 Fri, 23 Dec 2022 19:10:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7zCAWOn2eNQIB4xXct+OBoW81f2ChIb7ShCapt+1cpmAiOS1OhJMjlQFbU4XELTabPY1aXwLYS4dkd9pvdNCyWMrwgkkKW8iqCwuFCS191VpYB4Nt6lHC0we8RlEgv72RWzi8D/Hq1Y2mujgEEW1tEBu3h2PCGvI4N21jJHWJurg66nYC8Kf/NeaPxtHkI4v2YcNHt3kjrwqsuXsKm5TXAWIzgqNRgl4hGhxKuWABGeqxfNAeewe4z/3Ke6H3LNnFqTqJYfHFafbtHdHGD4SQo3fSerH0eP7kVDPsCfmw78kWXy2L+ziGY77YSJhkPfNkNg1EMOfNHN3pfI4+w9qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1HzeHqqpVW+i8IHzDPYf67xhTbh8HSGiXRxAvkxMQ4=;
 b=oTC/Rwmf7r0QQP1hOH1ZOnjSvUfTL1/twreszYhaOeDZFgUpwu3LU98vokPxKUH419EenGnpkTp2eJPkDlM/C9Zi7W1hX99K9dZzWWSc8RHlDjJIfPC4CumW8Z0rU6GWIoWyi0wexZkxb+0hvWhsEtYTu+Tpv8rJtL3nBv3bKuTc//zl0VeAabnUp3eCsUd4/m6IenMh0G3LGNqXH9RPu1Jg22oXVhfWDrm5cx41q3UsnJwu3R+YwVtNK2q7u+UmoMi3uwshywY+cfoAOUgo7y34QLOREMQyWEhcy378uKhZJWn63n33prMPo3laedpr7TTozqy3KBp2BEkq7TW2YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1HzeHqqpVW+i8IHzDPYf67xhTbh8HSGiXRxAvkxMQ4=;
 b=0IS+D+gNLeP0EvNP68S25GF5qYmtKNaJOOqoa4qAgjNKCRhaelT491LdInBvHNP44qBhKrJ/a7/j+Rre3Gb65Z071T1T9gYp7Yrl9NTSIh3KvOe8l4tP9bmajnjJL48AIV2cBelaAuvRGLpCe2ZxnhL1VjnUtA4fI5C55VhHh2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA3PR12MB7858.namprd12.prod.outlook.com (2603:10b6:806:306::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Fri, 23 Dec
 2022 19:10:30 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%4]) with mapi id 15.20.5924.016; Fri, 23 Dec 2022
 19:10:30 +0000
Message-ID: <b53b1d6e-e81c-98d0-7a7f-a6d5fede90fc@amd.com>
Date: Fri, 23 Dec 2022 14:10:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 16/16] drm/amd/display: Don't restrict bpc to 8 bpc
To: Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-17-harry.wentland@amd.com>
 <114c2e02-41c8-8576-f88d-1c50f41deb9e@mailbox.org>
 <20221214110128.1cd58dea@eldfell>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221214110128.1cd58dea@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0116.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::25) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA3PR12MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f876ad8-0a04-4df3-88e0-08dae5195bb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VXcE/wgMNloBZfKOJdi56NzFX5qD5xWH9ey9xDMOMxVXH1kN3IjqgsbweamxzUqHKYTgU2UFCVMAUP36iyJWNkYBGlHdimOFGwuNAkgwYHKDRKfI6/ofSuje2qo4UTf9QJIGlM1FHY+IKlasv4tkiq/Ezvh3jLNOPCki9+a9Q3bQllOygexBNTITiCHqNfxnRlchs4Z/lPpEMJX1ZVQukjp6jjceWb/rcjWaX9NLNB25vjLRp/LnVIEnpbw+JBizp+da/9CcK8fe2ybJeJGeC72A1ezeAdCo1wdpw99Er+RIvARBJ98/DH2st5JstizDLH9bf/Ea/klzH8yzvH9ixCJenvfXlDd3schldQp0fFD3rb8ycx+X2MnjuwwX0AXvQ4N8scmzPAfas6aOP1acn2Ln9jDBJyfJgVdtJX2Jz1XqjDtmcxf5ININzsP/FZsIQckKybfhkH0xatdxzLlQNpHv5/iTuBiqMwvg2cgvY+RWSlNMiT7sA7S6X5b8hit8zzz/HcYSb7ia7O/2CCohSkXPNcgW9KAZji1H0Yz1pF+qYgRp+/NpvAFK/SNisoSHbbWYv0usvJX7oeRKOgNwC6tfiRVGnvrzTmswOa4GKnzYzDWxe8KJu4gmJSC2AfGd421VOVTiyGStJVWph/6XN0gmwJSFLpoo6lf/W1pulTUtFxs61scHT15BsL4GT4Kh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199015)(44832011)(4326008)(31686004)(8676002)(110136005)(54906003)(2906002)(5660300002)(66556008)(66946007)(66476007)(6666004)(6486002)(966005)(478600001)(53546011)(41300700001)(6512007)(6506007)(26005)(186003)(31696002)(86362001)(83380400001)(2616005)(36756003)(8936002)(66574015)(316002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWFUQk9EelYxS1FVMTYyS0V5Tkc1SlFCc0cvZi9rZFh2NFhIb3VndE5heTJP?=
 =?utf-8?B?RVFaZFJSZkZ4TEgyWWZPL1lkS3lCb1hWanFRZjhGaE5zUEJRMVVVMVl5d3M0?=
 =?utf-8?B?TnpIekcrMlRGTEo3UGN1M1M0V1dJdGllL0c4b0Y2U002TjlleXhRQWJEdHlG?=
 =?utf-8?B?eFF6dXdpeElDcCtzVnRuUXZsSCtrSkZmM3VpSUloZUtOYmZSNHVvcmlRV2dN?=
 =?utf-8?B?WHBoWmh2MEdYdktTQk83a2lNdjRLREtjekZoWWI3dVpCeWl1RkFhdlYzNVBT?=
 =?utf-8?B?RC9BKzh2Y0NrOVRocGZLVTdST1dHZGo5b2l2cUZRYTZqUWtsWmhONmo1N2JI?=
 =?utf-8?B?WDdvM29DYUFDWEx3Qmk1S2pJVkNNQUVPQ28zWnpPZGJYK2Nmall4MVZHZk1L?=
 =?utf-8?B?UVNDZFNKVjlNSmovZnY2QTMwb2YxakZIM3ZGc0ZXNU9qRW1TRUVucDUxS3Qx?=
 =?utf-8?B?UTJrcVkybFZIRW9PWTUzQm40azZZMCtwVEQxdXRBYjZ5WGVjdE9neWwyMHpa?=
 =?utf-8?B?TWNPdkY5dlJyTWJzM2drMmFZZWZyc0ZicVgrZGJNaU5jZ1FaU1RKOTV2SGdq?=
 =?utf-8?B?a0lmQ0xMYlhRVm1wdFlST0ZZVVBPL3FvNWpiR25DT2daZzl2eGxSMHhuTkVB?=
 =?utf-8?B?QzJBSm9rM0xEbGgydmFGeEwweVo0U0JPZWVHblpPa0xzM0tQSm03WmY1UCtv?=
 =?utf-8?B?T09VV1Jsc0FQYVNXajFBcTRzOG1maVpKSTBtT1F5dUNBWlJSVmJUSTNmNUFZ?=
 =?utf-8?B?a1BLUGc1S0ExR3IrQnJzci9EMnJSL0VtZjdJY3NaVEJJVDNQWHlzaklVdTIx?=
 =?utf-8?B?Tk9UblYrYkh3eHpaWkpoT1QzbU1uWU9FUGkvTnRyMmhHS0J2aElqTFp6U3Vr?=
 =?utf-8?B?Y3liVk81c3cycFFkTjFyZnZvYTg2QXVOenRvSmtNZHpkT2ViK3g2NzR5YUdq?=
 =?utf-8?B?cTZkb1ZrSjlnbGRaRGRvSWMvSlJsMlJjM0pKOTdDM0ZMRDdZdldsSmhjK0VO?=
 =?utf-8?B?YWZuT0lJS1RDMFZlUStBU3cxKytjNWhkRjdtb1dwSVZsSnY0cHRlL0JvSkc4?=
 =?utf-8?B?OGJRQWEwbXZyWktBdlBOYzJlWHExU0crWFdOZlZNdlRsK2k5UjFJNk9kRnht?=
 =?utf-8?B?UjJ4Z09IUXRxNjJSbm1MODE1TkhoalJkYjhEODBsckpjZGVtRzFvK3lxWUlE?=
 =?utf-8?B?V1NBcEJlVUllVEh3eWc5ZFJtS1hKckhHNUVHbEx0a0ZET0d0Qm1YV2ZLQnJj?=
 =?utf-8?B?bUtlYi95NVh5RXVuVHVnbXdYRWtlSXJSS0g2ZW1pUXF2b0sveWM4RTFyZnRx?=
 =?utf-8?B?ZXcyMzRhdEY1bXgrSE5mNXNra1RzdGZ4TytQc29DbHRJZHQ5Y3IvcXRjR1VC?=
 =?utf-8?B?VFZmZUxvMHRqN0E0eVlZdUxJcEI1NGRLRUloc01OSzV0SDR6MWc0SjcxMHBh?=
 =?utf-8?B?KzY2WG9raEJLRytLR2ZQRG5WbU5kQ2c4bUVZSWtyMVVpQTRERmFNWnZkRjlS?=
 =?utf-8?B?WHJjMDdHQjFSWFZZME1HY0NlTkNyYTZGZVlqNmV2cHlQUDlSQVdLMFNkWFNh?=
 =?utf-8?B?a1BsUEFvcnMwNnI2NXJYT2ZMZFBKS3RNRmhVSlRDRjViNkNRZGJSK0NzMTRJ?=
 =?utf-8?B?Q0JSTjBnQXRoSkZnY3R6NDRDUjFMa2FIQkxEU0MxR0E3NkVyeDUzengwOVBY?=
 =?utf-8?B?WEFHNVNmVUFKcGh5Yi9QWHhudEhtNS92QTVheVltQU9hdklKdytJQVlNdEsy?=
 =?utf-8?B?dU5aZVBtMjZKQ0FqWTdJQVJSU1lUMS9Pdnpmd2NkdGx2K241Z05QSXdldnpX?=
 =?utf-8?B?MXM0ZDhhUWhaaG9ZMzQ2WDEzaW13S1RWaGdpb0NacGZkVW5xK1BCci9mY0wy?=
 =?utf-8?B?NllCRUtQZHJkOEY0RlppQmpmSGhLTUYrTU5TVzU0ZmFsVmVoTHN1eE9MVUg2?=
 =?utf-8?B?eFlVU1RyTnNFcE5VZEw1SU50U2ZvNkJZRGloY3ViNnJmNGFzWE5meVBzMHgw?=
 =?utf-8?B?eFV1OHYxeDZmS0lRem9zNTMrNndrSUVDZm5LNitXSmQ0NGRGM3Vrc2JwVlR1?=
 =?utf-8?B?bFZWMFZwMitxS0lyOEkwUjlaQnZobnRKNS9nRFR2NFR0WGx4Q1VxcE4zWTRw?=
 =?utf-8?Q?NYEi/xo1ZkrVqgP2vCQIRzTsg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f876ad8-0a04-4df3-88e0-08dae5195bb4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2022 19:10:30.5608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgxGSmZLQCEPSwGjd4APs7pDuti49EB0AN3ebFdk1Y1QEQbWQU8HT+Ljv2vyE//5LZVRo/gRbHhUo+UPICpxug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7858
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/14/22 04:01, Pekka Paalanen wrote:
> On Tue, 13 Dec 2022 18:20:59 +0100
> Michel Dänzer <michel.daenzer@mailbox.org> wrote:
> 
>> On 12/12/22 19:21, Harry Wentland wrote:
>>> This will let us pass kms_hdr.bpc_switch.
>>>
>>> I don't see any good reasons why we still need to
>>> limit bpc to 8 bpc and doing so is problematic when
>>> we enable HDR.
>>>
>>> If I remember correctly there might have been some
>>> displays out there where the advertised link bandwidth
>>> was not large enough to drive the default timing at
>>> max bpc. This would leave to an atomic commit/check
>>> failure which should really be handled in compositors
>>> with some sort of fallback mechanism.
>>>
>>> If this somehow turns out to still be an issue I
>>> suggest we add a module parameter to allow users to
>>> limit the max_bpc to a desired value.  
>>
>> While leaving the fallback for user space to handle makes some sense
>> in theory, in practice most KMS display servers likely won't handle
>> it.
>>
>> Another issue is that if mode validation is based on the maximum bpc
>> value, it may reject modes which would work with lower bpc.
>>
>>
>> What Ville (CC'd) suggested before instead (and what i915 seems to be
>> doing already) is that the driver should do mode validation based on
>> the *minimum* bpc, and automatically make the effective bpc lower
>> than the maximum as needed to make the rest of the atomic state work.
> 
> A driver is always allowed to choose a bpc lower than max_bpc, so it
> very well should do so when necessary due to *known* hardware etc.
> limitations.
> 

I spent a bunch of time to figure out how this actually pans out in
amdgpu and it looks like we're doing the right thing, i.e. if bandwidth
limitations require it we'll downgrade bpc appropriately. These changes
happened over the last couple years or so. So while raising the default
max_bpc wasn't safe in amdgpu years ago it is completely fine now.

As for the relevant code it's mostly handled in create_validate_stream_for_sink
in amdgpu_dm.c where we iterate over a stream's mode validation with
decreasing bpc if it fails (down to a bpc of 6).

For HDMI we also have a separate adjust_colour_depth_from_display_info
function that downgrades bpc in order to fit within the max_tmds_clock.

So, in short, this change should not lead to displays not lighting up
because we no longer force a given bpc.

> So things like mode validation cannot just look at a single max or min
> bpc, but it needs to figure out if there is any usable bpc value that
> makes the mode work.
> 
> The max_bpc knob exists only for the cases where the sink undetectably
> malfunctions unless the bpc is artificially limited more than seems
> necessary. That malfunction requires a human to detect, and reconfigure
> their system as we don't have a quirk database for this I think.
> 
> The question of userspace wanting a specific bpc is a different matter
> and an unsolved one. It also ties to userspace wanting to use the
> current mode to avoid a mode switch between e.g. hand-off from firmware
> boot splash to proper userspace. That's also unsolved AFAIK.
> 

Agreed, the current "max bpc" just sets a max. We'd probably want a
"min bpc" if userspace needs a minimum (e.g., for HDR).

Harry

> OTOH, we have the discussion that concluded as
> https://gitlab.freedesktop.org/wayland/weston/-/issues/612#note_1359898
> which really puts userspace in charge of max_bpc, so the driver-chosen
> default value does not have much impact as long as it makes the
> firmware-chosen video mode to continue, as requested in
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/995
> given that userspace cannot know what the actual bpc currently is nor
> set the exact bpc to keep it the same.
> 
> 
> Thanks,
> pq

