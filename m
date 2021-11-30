Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5A1463AE9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 17:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBF86E55E;
	Tue, 30 Nov 2021 16:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0976E48F;
 Tue, 30 Nov 2021 16:03:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X29EEvgas1kXoN2xR3GvAq+Gd6debkZohDKMt8J8NfpinkQIHe7pBbc5MQThIskLa91RZxY4PPcLUkbLH17X/kj5rfDxo5izEiOI+t6SHcg6rIKnA1c9rSC4Jz8XHv9fn4Z6p5gwmRzFo3Gc4tg+MeRdW6QCUYnstBF7kAzbhLDS8yN8Rs+dIeqSrhpy2UIWEgRMcg4KWla/8Dex12tAFTT3gw4FjvSTy7ykFcZiTDPsHaD6WgrnTzzOTDZog+KVpxNpVG++WS5M8Dfz0asi4DGpZxDkqFFAnWNBdkEb1vcKNg6mXlaIRlMmlmp7HSz6htl1vS0Xw2mCuE8ufQiWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvXO9Wnk1yHidICpt1HBD38lOD9cx/DOsRE4TlEigRE=;
 b=Li6NIJG/I50DOGZOf+7cjXWSUUzS9pzBRUaVVvwHGorY2ZsobuYmNjCqHMoytSOZnFZa0rtRRvIEXHpdH6+sSIMeLku+86zdbWiZ5fi9i28h+RjChvLdp0n3LQr/v154bw+k6H5CQ4Wk41B84gxdZiVjdTGO93wrQSUCRJ97ZZhBSWTQEJmOkhe4goCF/dDTjDOmvfi/F1/E932MjW26+ErTmXWxQp7UOJbS3/WJGVqQMVbIF3qvlBBSCcNcCxe8FUrhBBwF81shqYNUpLAO6NRPhMQcMHKoifugLrEofMJACAe1QQkTurUj+WcMJmEMTbEylrmUtZO+OA846jppgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvXO9Wnk1yHidICpt1HBD38lOD9cx/DOsRE4TlEigRE=;
 b=DAtXNLNIxyGc4F+db6IQQzZYn42s3oZ6ppem+L4ocJB4TI0tr4peXlwwhtyRWcTOQZ8uy/vaMtoyDmxYtiW+7WuOVdcnTpa3//QS5Dn8ZE8O+BBPVwgIzAxzx3dHn4+fQ3iUBI8Icjjec/M0tuaA74FO/Bzj0zbstJO1t9GnIw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5441.namprd12.prod.outlook.com (2603:10b6:303:13b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 30 Nov
 2021 16:03:24 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46%7]) with mapi id 15.20.4734.023; Tue, 30 Nov 2021
 16:03:24 +0000
Message-ID: <bfaade35-92e4-9da6-d6bd-0bf75926eb76@amd.com>
Date: Tue, 30 Nov 2021 11:03:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/6] Documentation/gpu: Reorganize DC documentation
Content-Language: en-US
To: Rodrigo Siqueira Jordao <rjordrigo@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com>
 <20211125153830.1352994-2-Rodrigo.Siqueira@amd.com>
 <YaEAVV3Ka2lG/iOh@phenom.ffwll.local> <87k0grjhed.fsf@intel.com>
 <254992f1-9f40-b756-b324-8f45726ef823@amd.com>
 <507bfbc5-4be4-9681-c768-efea7c0541d8@amd.com>
 <24a1be4c-0186-96ac-b238-059754a9f856@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <24a1be4c-0186-96ac-b238-059754a9f856@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::48) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Tue, 30 Nov 2021 16:03:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c669549e-8113-464c-cece-08d9b41af01e
X-MS-TrafficTypeDiagnostic: CO6PR12MB5441:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5441D6F0183BC94E7A62AAE58C679@CO6PR12MB5441.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OHSVhfQbw3UJ6rSXSZRyPNBwvTW+cJsQIkoYYfCWTt6m7IgwzE71SWyx24035/RDvMVemJpeLPowVcbSQDLzQX05ww64jISUopxN5SlD3olCqJvIjIkKh/3EKDBO3/5skZ+1rVrF54XuQNytahi7VwX7xkvRcKbX0ubYdYIvbRO9MxOFb0D2yTxBh3Gj4HvFUPRSPZdfyoeR6DbbjebJbJUE1slSD/6DLowO6jBOjvRML17owIpm/4ESSt+f6HTQEEol9BdYzovPn0LFGOdAGJsXYOEgGVxhuBuKWF5w/pJOHjpqo8ReAJIiWLj9J5a3K8/3JfvlKfizyqPhHJYxNHNxctpH6xqUTGEysdkJHV/hqXMe0klpjktmDe6HDjCItgzT5Vkp/GMeLLQzz+VTDXFGBtBeUJMBNKaM2SOIxOnFzJE7jJ83UhUM4UlvSvr0JbvXwmk8pz2apezPzN9ZsCIRz3z50nLj9GxQKQuXiE1NeJGUM8Giis4u12pc1kLUihC7CW+eEIu+31Rg6+OsPlR2DEbNYKLo5v56PMEF6FsahJYeH7k56es0/CrvxemY8zSZXNpW4ILRU9dWdtIU/okDDTF7xfUQ7q4tDl9uq9JBWW5u893F/87ULQ/7WaLTrpivFhiLu70Mwj/C60lQyDLfYYWy+LhcCZHEf5Q6Q4F1LJqTE/jIR7hW7HNpH12YJl4lF8pA67a2acnbzwbk0/vfvlRp17kmCFZFOZMPlXtWtmFptA84eHdGP3d9/Ohz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(2616005)(2906002)(956004)(54906003)(83380400001)(26005)(6666004)(53546011)(66946007)(66476007)(66556008)(31696002)(110136005)(16576012)(186003)(316002)(8936002)(8676002)(36756003)(38100700002)(4001150100001)(44832011)(6636002)(31686004)(4326008)(5660300002)(86362001)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXdoai82ZkxEYmdiU1g5TUdmblFlaStHTU1oc0NBbFgwSDY2SmpqRERDWnVE?=
 =?utf-8?B?MEpMZVh4VDNSS3RYU1pmR2lmNnNzYjZOendybjZlQlZUTkkxMFpSZUIxc3dU?=
 =?utf-8?B?aWNhMzdGQy9sVFZ6blMyZzMvYVBaemtoTHR4V2pITjJNdlRqUGd6clJvZ2V4?=
 =?utf-8?B?VmhFd3NUTHJEU1RZMDluRXB3NDZGNmFmWjE1QllUY2VveVlaTElrbDZMWTVh?=
 =?utf-8?B?Q2ZOVnhlVCs3RERKNDVKNVdRajdId3lIc25PTkVOUlpuMjRTOHYvOUtQZW9p?=
 =?utf-8?B?UnhiRWM2VWtOUzI3RDU2V20wWlhSTkROYjBzR0lFbXZTcUZQajhuVVcrencr?=
 =?utf-8?B?K20wSlRkc0kxL2pkVFAwS0crc24zWnVaVzBOL2ZIaUY5QUtjVWkrT1Z0Wnlw?=
 =?utf-8?B?MjZlSXlwUzlodzRCeWtsaGRXYmdOOWlySXo2SHBPSjk3dC9CWWkvTlU5RUZn?=
 =?utf-8?B?ejM3ZXZtazh2NFJnTTMyUWtsOXZqeVRLSkE2ajhpN2NQdFlyZlNwOG1tKy9F?=
 =?utf-8?B?YTdoUitNWHBjaUZEaDlaUWlvY0ltNXlPTk40em9OVW1RdWJ1Qkl6YnRETGFR?=
 =?utf-8?B?RTBSS3Nxc2JwNWp1RjU1TjlMMXFnRXlzM0pkbk9JMGF1WWU4U29nR1ZpVmc5?=
 =?utf-8?B?dzNpdEJ4ZjlwcktQZE5zNFh3ZXM5SElCVVpoRGYvbnF0RElnN1RpcWZKdSt6?=
 =?utf-8?B?TFRtVmlQenJYSnFSdE84Qk9pNERJNlZGbGFFaDhvN3BSU0IrcWpsK2owcDN0?=
 =?utf-8?B?UDVDRENwemUxUVBJZFdibUREZXZ6K2Z6bVROalVPNGJBVVgwNDFVTHU4S2Zs?=
 =?utf-8?B?VWVEaEVQUVZzYnVNSzhNblpjVGhnRm53ckxJZk9hVzJXYTRRVEdUZERrWU9z?=
 =?utf-8?B?a3hFeWhFT0hNT1pnMWVkRUtvMlA3UVRxb00ySjNwdTJVWmo2aExNYUo3aWVn?=
 =?utf-8?B?OXNkT0ZubWpERW93TGF4VFY3bnZ5c3ZGcHU1bmtpM2wzeW9RQlJlYWh5SmN6?=
 =?utf-8?B?MzBLUmpndzRkRHJMZXZFYkFTT0lNUklDeUFiSzV6SHVOYndFUmI0U0VrSUlX?=
 =?utf-8?B?Y2tiQmRFQkFORzFGNk9taHdKdDBKZVpQNW5FV0pyZmR1ZndjMVNJN3RreVA1?=
 =?utf-8?B?WUFTcDBkaEg2L2JSclU5bHJSRkkrR0hEbVBleUVmSndUaVNzT2pOdm1vbmJz?=
 =?utf-8?B?Zm1ZMy9oRlNBZHoxa1JLbzRrOG9nMzdEWlFUOHB5VVdvSm1zWDVScnhxc0hY?=
 =?utf-8?B?RUc2blIrYURLZ2R2WXVaejkwYlJHYTB0YkJCSVJ6aWFXTE00WUh2Ynk4N0xN?=
 =?utf-8?B?eWxJU3pWeXNQdG5KRjQycVhzV3JFUWdIVlB2SzQ1RDQ2cFIxaEwvQzZmVmRJ?=
 =?utf-8?B?dmNuWjd1ZENVZ29Zb1R4Sk0vZUpPMzBVVEVCTWsySWRGRnFiM0tIVVpJSExF?=
 =?utf-8?B?QS9RZTgwdWtQeG9uZGtXd29iQzFnZlFCb21iK0pBdkNSKzlMN1pCdEtxbnNz?=
 =?utf-8?B?bmx5V3RMWEh5VFJUdFliS0VobjRPQkNXYUdlekV2bTRGS0RHcVZmYXcrUUFl?=
 =?utf-8?B?dXNZUkZra2lWOWpmdGM1M0FWVnUxQWxuMGtrZzdQekVDNkV0bGFVWlloZnNI?=
 =?utf-8?B?aFQxaXRPN0Z5VEo4WnR6N294dHVsSWZRSzRTNXFMUzJJWXJSVlZmNjZ4UkVW?=
 =?utf-8?B?VmZsaGllSHFlck9TQkV0ZGp3Wk1ud0lYNkZlcnRqeHI1VmUwVERaSUlCM2dX?=
 =?utf-8?B?MXhRYzdvNDRnenJDaVVrdEJ2dXlFbHRoNjlSd0ZGdk85QzZCMTkxVVRqZTky?=
 =?utf-8?B?Y2xuM2xYbEFLNUhHcmJua3VILzBkTmdqMjdpaDhyV0xhYVpKNU5kSTFPYnhR?=
 =?utf-8?B?K1VFQ1RtNGNoRkNNY3c1bmg2WER6eDdhTDJHUjdMTFRuRkZQMElPb2lxaC9a?=
 =?utf-8?B?dlQzZExPTUZPT290cExOc2F4anY4eTNaamJMRnlVc1djRkM4SWhOWmJiK294?=
 =?utf-8?B?b3FGeHVEK1JrNlROT2VOekpOVXQxSFhFVWk0SlNINStHcVFlZVIrUmlOazlZ?=
 =?utf-8?B?N3NHb2h3NzI1VjlIYm1Hek8xa0lMa1kyT2lyeG4zNzg1S3B3VW43Y1RhaEhh?=
 =?utf-8?B?dEVCTFlxZTFvSjh4N0VXVmJDOGppMTA5SjI2UG9BVVlkY1pSbW0vRFg1d0kr?=
 =?utf-8?Q?u0kJ+5bdqZa6vpInRmL02p0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c669549e-8113-464c-cece-08d9b41af01e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 16:03:24.3273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WuwwhIij5H712w5wgcl7mZhapqnorbtSSTUI/ie7UytzusgRQE+AiMUJFYAsSVVK7hNtsMzzvWWOxdbmIuvt9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5441
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
Cc: linux-doc@vger.kernel.org, Mark Yacoub <markyacoub@chromium.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>, aurabindo.pillai@amd.com,
 nicholas.choi@amd.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 qingqing.zhuo@amd.com, bhawanpreet.lakha@amd.com,
 Roman Gilg <subdiff@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-11-30 10:59, Rodrigo Siqueira Jordao wrote:
> 
> 
> On 2021-11-30 10:48 a.m., Harry Wentland wrote:
>> On 2021-11-30 10:46, Rodrigo Siqueira Jordao wrote:
>>>
>>>
>>> On 2021-11-29 7:06 a.m., Jani Nikula wrote:
>>>> On Fri, 26 Nov 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>> On Thu, Nov 25, 2021 at 10:38:25AM -0500, Rodrigo Siqueira wrote:
>>>>>> Display core documentation is not well organized, and it is hard to find
>>>>>> information due to the lack of sections. This commit reorganizes the
>>>>>> documentation layout, and it is preparation work for future changes.
>>>>>>
>>>>>> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>>>>> ---
>>>>>>    Documentation/gpu/amdgpu-dc.rst               | 74 -------------------
>>>>>>    .../gpu/amdgpu-dc/amdgpu-dc-debug.rst         |  4 +
>>>>>>    Documentation/gpu/amdgpu-dc/amdgpu-dc.rst     | 29 ++++++++
>>>>>>    Documentation/gpu/amdgpu-dc/amdgpu-dm.rst     | 42 +++++++++++
>>>>>>    Documentation/gpu/drivers.rst                 |  2 +-
>>>>>>    5 files changed, 76 insertions(+), 75 deletions(-)
>>>>>>    delete mode 100644 Documentation/gpu/amdgpu-dc.rst
>>>>>>    create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>>>>>>    create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>>>>>>    create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dm.rst
>>>>>>
>>>>>> diff --git a/Documentation/gpu/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc.rst
>>>>>> deleted file mode 100644
>>>>>> index f7ff7e1309de..000000000000
>>>>>> --- a/Documentation/gpu/amdgpu-dc.rst
>>>>>> +++ /dev/null
>>>>>> @@ -1,74 +0,0 @@
>>>>>> -===================================
>>>>>> -drm/amd/display - Display Core (DC)
>>>>>> -===================================
>>>>>> -
>>>>>> -*placeholder - general description of supported platforms, what dc is, etc.*
>>>>>> -
>>>>>> -Because it is partially shared with other operating systems, the Display Core
>>>>>> -Driver is divided in two pieces.
>>>>>> -
>>>>>> -1. **Display Core (DC)** contains the OS-agnostic components. Things like
>>>>>> -   hardware programming and resource management are handled here.
>>>>>> -2. **Display Manager (DM)** contains the OS-dependent components. Hooks to the
>>>>>> -   amdgpu base driver and DRM are implemented here.
>>>>>> -
>>>>>> -It doesn't help that the entire package is frequently referred to as DC. But
>>>>>> -with the context in mind, it should be clear.
>>>>>> -
>>>>>> -When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by default for
>>>>>> -supported ASICs. To force disable, set `amdgpu.dc=0` on kernel command line.
>>>>>> -Likewise, to force enable on unsupported ASICs, set `amdgpu.dc=1`.
>>>>>> -
>>>>>> -To determine if DC is loaded, search dmesg for the following entry:
>>>>>> -
>>>>>> -``Display Core initialized with <version number here>``
>>>>>> -
>>>>>> -AMDgpu Display Manager
>>>>>> -======================
>>>>>> -
>>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>> -   :doc: overview
>>>>>> -
>>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>>>>> -   :internal:
>>>>>> -
>>>>>> -Lifecycle
>>>>>> ----------
>>>>>> -
>>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>> -   :doc: DM Lifecycle
>>>>>> -
>>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>> -   :functions: dm_hw_init dm_hw_fini
>>>>>> -
>>>>>> -Interrupts
>>>>>> -----------
>>>>>> -
>>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
>>>>>> -   :doc: overview
>>>>>> -
>>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
>>>>>> -   :internal:
>>>>>> -
>>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>> -   :functions: register_hpd_handlers dm_crtc_high_irq dm_pflip_high_irq
>>>>>> -
>>>>>> -Atomic Implementation
>>>>>> ----------------------
>>>>>> -
>>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>> -   :doc: atomic
>>>>>> -
>>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>> -   :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
>>>>>> -
>>>>>> -Display Core
>>>>>> -============
>>>>>> -
>>>>>> -**WIP**
>>>>>> -
>>>>>> -FreeSync Video
>>>>>> ---------------
>>>>>> -
>>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>> -   :doc: FreeSync Video
>>>>>> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>>>>>> new file mode 100644
>>>>>> index 000000000000..bbb8c3fc8eee
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>>>>>> @@ -0,0 +1,4 @@
>>>>>> +Display Core Debug tools
>>>>>> +========================
>>>>>> +
>>>>>> +TODO
>>>>>> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>>>>>> new file mode 100644
>>>>>> index 000000000000..3685b3b1ad64
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>>>>>
>>>>> While we bikeshed names, I think it'd would make sense to call this
>>>>> overview.rst or intro.rst or similar, since it's meant to contain the
>>>>> overall toctree for everything amdgpu related (maybe there will be more in
>>>>> the future).
>>>>
>>>> index.rst?
>>>>
>>>>
>>>
>>> Hi,
>>>
>>> Thanks a lot for the suggestions; I will prepare a V2 that addresses all your comments.
>>>
>>> Ps.: If there is no objection, I'll rename amdgpu-dc to index as Jani suggested.
>>>
>>
>> SGTM, you mean amdgpu/index.rst, right?
> 
> Yeah, but I'm also thinking about this new organization:
> 
> 1. Create an amdgpu folder.
> 2. Inside amdgpu folder, I want to create a display folder.
> 3. Move all display documentation to the display folder and keep other amdgpu generic things under amdgpu.
> 4. Finally, inside the amdgpu folder, I'll create the index.rst for amdgpu, and inside the display folder, I will create a similar file.
> 
> Does it make sense?

Makes sense.

Harry

> Thanks
> 
>> Harry
>>
>>> Thanks.
>>>
>>
> 

