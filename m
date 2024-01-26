Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AF983DAB3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 14:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B28A10FA74;
	Fri, 26 Jan 2024 13:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166CE10FA72;
 Fri, 26 Jan 2024 13:23:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7MDSWdb8CxmSC2WJ7O4okz0sEOLkBMvcxUMk97uaR7M1oyp0Owgzgq0yaKY0PBRnVLjueHkiA1ZunLVFY6Q+LXnzPN3cGHwdhRYFFF2wV9Tcm/f40cGH+CGUnfRVevPZRPVL1pveS1WdJEdfljxGAhz58XH+Z/jChzpWneT+9+aHn4b4Cqej3PqUJzbX6YOKWkDElI2h2IhUwWGBZymMS85Iikbwro8V158kEypkxa5Y9xoNHurFsP9UTKvWOoAzwzWvXAEXZDPzoiLS4NnqEtI9G/I2f0PZaaw6RZIN0VBGylLIJM8J0JwMRadTLE8OycLcOAeg2HPY1jW0E8Lng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXaAPdexkX5nXQMNuxg+1Rm8hOxvjcf5WUKLNFyrZIo=;
 b=IowSjc5G1mpmqxUVdDxXSCQC/zbnuThJd+U2Ois7miQ5+8SP3E1DYgLUy1vnkmcqGK59ZQmll/nsO9KWQLvHLCf9HbAYbU7flQvKcvjvyY6M+P4f99K7zm4xsb1sytVovK0XxONfQBfWocNbAS9+un7+rFawVO0K+3xMa2XIR7HB1yD8TlIqGRo/H7PqaGFgUBtaSMWBxdtOydSBoKvq2Yzj8/VBdOitfCpJG6Km5/Uynu/veFMr+FqmWcm+3v7ISMNy01cVkCfUcH/o/PenOVTIuY/K00702Dw/ra8VuTA5LfMAbGkrVobJBEJWzx8lCvHAa0QDHj24eKW664QgeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXaAPdexkX5nXQMNuxg+1Rm8hOxvjcf5WUKLNFyrZIo=;
 b=CnRA3/zKI/TqCmjdLYkNpsNz2ChwIfHLRZRABslQKjXcf4TNe9YhfbE6hRa58vbLAG/E+eDINlXJ8vzVHqnCGV8F9mu1D+/Y7HtYjj8ia9EEBGq+HpWHNnlajLvk+JNQ6exUHDbWrZW9b1HuCS8SJlGTOM6VD6AU2IqsOdq8l0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 13:23:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.026; Fri, 26 Jan 2024
 13:23:53 +0000
Content-Type: multipart/alternative;
 boundary="------------g1tnn4l0rWHLnqetVRfUF0Ay"
Message-ID: <5a0a26b2-3116-4395-b0fc-84b2f248ac15@amd.com>
Date: Fri, 26 Jan 2024 14:23:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>, Felix Kuehling
 <felix.kuehling@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Shah, Ankur N" <ankur.n.shah@intel.com>,
 "Winiarski, Michal" <michal.winiarski@intel.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <SA1PR11MB699106F7114DF265A6E0964D927A2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <61e0c39f-ee4c-460d-99a7-821218f29f8e@amd.com>
 <SA1PR11MB69913BCFDA5F28199D5E002F927A2@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR11MB69913BCFDA5F28199D5E002F927A2@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: 34524be3-e97a-46e1-8373-08dc1e720ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6WpDYbi89Lv+F9wL+cp63P8WsiTOyg3siuYh57mK/imOuLEjxdP3KGuFd2WMA7RhWcws8VaJHDji2oMP8BA8IGmvtaYAsF6YN7UbWMLuqnOqNeLLKiCbS6O8NQ47R0aH2xbhpY2Cm3EsJogPSzVAlUMLqrmShngFWUjyHdmlFeiByXoU1JwOATW7G+JQI4en6YrNlsgrjzZgUK/dYWF+cArlv3IKBg08qKcJiYQZyek3fgCGUNlAkA1pV2x5F6vH8dUnyEaxo5hEr7PBzkc36lay88oXC5wYcbrtMGuEcL8B59Q2tx03sQLeBdgj2zoVTVK1pMrB4sHW10S2x7+WFodYAVe0iEx+ShHkEfUCB/pOgoTVHPD9/MPjLIJml8jgH0nS6+JXW7crwtA/P6hLkdVGGeqNqKZK2u/9JSo1yb6IXqfwBURsdlCbiH6JfW7C2MFxbiybIbtBdlNga/yLpylTFOa2O4ceUFkaO0EkYAECN6D3KttXDGrKvGxqNoUzRD3vZNecDsRWLBpMLXfksOxG0FC2ZsOCWICIUgA5wdb06fAmAMDfaTqb/DAmrQAR+bfyJZp/6fT94yg3Cu0MEntU+Ldk7xfzlKQ19kupFoGEurcBCSe44d9tuF3okpa8iPfXd4cvu+ySBQ0h/goPfb8I3EdRIwuA0hH5jIGaqYE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(346002)(376002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2906002)(31686004)(30864003)(7416002)(478600001)(5660300002)(83380400001)(921011)(66476007)(110136005)(66946007)(41300700001)(316002)(2616005)(36756003)(54906003)(66556008)(6512007)(6486002)(33964004)(8936002)(8676002)(53546011)(31696002)(6666004)(86362001)(6506007)(4326008)(26005)(66574015)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFZnYXBOOFNzOTlJcWtoR2o4Q0JCQWVFQSttejdjZ1ZYQXVHOHBENzJUSTAr?=
 =?utf-8?B?WndCZk52bXRhc2M5WVZJZlVrZkV3RU9iZTZsZERxZVkvSjRmM0d4VWpTMVAw?=
 =?utf-8?B?K1lCQ1pqdytQZ004YUNHbkE0RmRuUzJNUE4vS2kraXBGdzJsNzE0Z0dQWnN3?=
 =?utf-8?B?OGFPMmFuLzI1cnZwdHVGQ1ZmejdrOENxV0lnSWhhNU9vMTE4RmZIdVU1Slpp?=
 =?utf-8?B?NHRVNGJ4QVVidDhydGwwcDE4K0J4YzVsWm9EeWJzaGExdmlXcTJ1TXlnMHV0?=
 =?utf-8?B?YlY2SVpoWmUzRzFHN1dHNGNDcHQycStWb3BiOGo5dVhVTVR3ZzgzUHAxOUsw?=
 =?utf-8?B?b3ozUXp0ajhZcHAyVGdpSlZCNWM0UFhOSlpIVEVpMFczbnlRZm5hdm5Ibnpr?=
 =?utf-8?B?MVJCUGhtVnJXdnNXWkh5TVZvWVN1U1VKMWVHamd2RWhHWGc4cWlvZkdMWnlr?=
 =?utf-8?B?bHg3QStvU3dFM2RFWCtId3NRWHk1dlFnbmw0clA3WjA0MVJROUdrZktTWjl4?=
 =?utf-8?B?U09rRGE5WEJwcFVVbFA4YTRKdVZzbFZPeksyWlZBNjhNS0RHa0ZkMktVamQw?=
 =?utf-8?B?NHNCTGxQUjI1ZTJvYUZPeTUyVGwwcTlLbVJodlJUWnh1WGx3c1orLzd1MlBp?=
 =?utf-8?B?YzArNWpSMnI2SDdhdVVlWWFpeHk3K2ZsdGx1UjgxYmxOQnV4cUxwVXFxQW1Q?=
 =?utf-8?B?T2tXTmgxUUxnS3daRE0wTmtHL2p0Z2dNZG1yUnR4Y3ZFa0Zxbms2bUFzKzJq?=
 =?utf-8?B?UDJSTnFRVVhqYTVNM3RXOU9walNRR1dJWDJaVmhSYWpTTlhxR2drd0NsV2Jz?=
 =?utf-8?B?cWppc3dwdnBqejY3ODF5TXZZNmVMclZBSDRPWWsybzV1d2ZaOTFmRzBQWUpM?=
 =?utf-8?B?S29UUWhQVGFmUlA2SzJHZGtid3NXN2pFaHA2MVZpTG9kT2dUclJFQXEraURl?=
 =?utf-8?B?UUg0RXdCaGNCNjVzc0w2K0h6WU9rckQyMHlSZG9UUkRNQXV2Nlk0SjZNWFZM?=
 =?utf-8?B?amNJci8yRmlOQWtsaHNJaHhhU01sUUdmbzBzUGxOSkt6TmYxcXh5bk9XMktO?=
 =?utf-8?B?Z004WFlBbElvNUUrWjlwWDROdEFwU3g3WEE5d0Vtb2R1SFNXc0pWQTZhR01F?=
 =?utf-8?B?cUtxdVZnSkJEajNnWmxnU2hDUER2UitQKzMrT3pybnQyYnVQM1M2bWpBQkVj?=
 =?utf-8?B?dkh6Vnh5K1UwTTBNN256Y1JlcWFhWWxONkV5K24veEttR255RnhZWFpRalZs?=
 =?utf-8?B?bjF3TjdwQWNNRDY2cno1VndSZUdoN21hcFM0QnRFVkVIOGZOYzN5ODNFUzVB?=
 =?utf-8?B?bUZEdFBjTUdEbjZOTDhnWUhWaldBOHdnZGFncFlBRTJ3R3dzcDQvYTFNdlkv?=
 =?utf-8?B?ckhKczJwbExOZ3hwdXZVWHlXMUF4QTFybjAwcWpHSnJVM1IwRkZYd0t5MnF4?=
 =?utf-8?B?SHZrd2xvaSsraXFmZURObFh2dm94NlExekdWTldQN0hWSHRJNFpPNS9OTCs5?=
 =?utf-8?B?NlkvbmdQNHI0OXNHdTl0Rm9RTHJEQmx5WldsTGEvL1Z5TG5CK29RSFhvZXlG?=
 =?utf-8?B?M1NXV0pITmU1QzdHWmtXVmZ4TjZQc2JnR3JNRlVUaUs4ZnR5V0d2MDZRQ1pl?=
 =?utf-8?B?T1ptQVpib3FwZzV4R3NwNnNrMkthbnJROTByR01nc2tlMm81T1A5MXl5VDZE?=
 =?utf-8?B?VWorT255MEMrSUU3emxlUTFCM0ZPV2Z2RnVrbXN6MjRNL3FkNHcybHpNblZV?=
 =?utf-8?B?NldQMnhGR1dQdTNGYlV6WUUzb1R0SHFJTStMazJ5YkN0VnVjTnpCZkhhUlN2?=
 =?utf-8?B?OU1VTEhjUDZRUk9CQmYwZG84YWlITVJ5VGg4SHBBY0ZDNVp2dVhDcEpiR0VS?=
 =?utf-8?B?ZTJZeFJyTkhYTFR2Z1U2azFHTHRGc0paWkZGMlo1SnNFT0o1TFNUWHFRcUhB?=
 =?utf-8?B?UnNFRFpkUVVma2NJbWV3aUpXUC9zM2xtbU5abEJaMTM5VE45em92elB1Rmls?=
 =?utf-8?B?OGc4cGdtQXBSeEdEYkFrM1M1Ly9DUE9QblFLNnNWQjd2dHVIVHg4Y0Vnamor?=
 =?utf-8?B?OGJ5Y1VhdXNDaE1iL3ZzeklXOTQ2N1NlOENxT3d2a0xkeHc0S0UwRFZNczl2?=
 =?utf-8?Q?jIFzJUdMTk2F29pRnLVbF8dkW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34524be3-e97a-46e1-8373-08dc1e720ab1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 13:23:53.7014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLexWuMqkByD0J/QPyNR4bcFzMHcpAWRAFSnljf3FxpavKmeYYweYpju2DenyChU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9451
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>, "Welty,
 Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------g1tnn4l0rWHLnqetVRfUF0Ay
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 25.01.24 um 19:37 schrieb Zeng, Oak:
>> -----Original Message-----
>> From: Felix Kuehling<felix.kuehling@amd.com>
>> Sent: Thursday, January 25, 2024 12:16 PM
>> To: Zeng, Oak<oak.zeng@intel.com>; Christian König
>> <christian.koenig@amd.com>; Danilo Krummrich<dakr@redhat.com>; Dave
>> Airlie<airlied@redhat.com>; Daniel Vetter<daniel@ffwll.ch>; Shah, Ankur N
>> <ankur.n.shah@intel.com>; Winiarski, Michal<michal.winiarski@intel.com>
>> Cc: Welty, Brian<brian.welty@intel.com>;dri-devel@lists.freedesktop.org; intel-
>> xe@lists.freedesktop.org; Bommu, Krishnaiah<krishnaiah.bommu@intel.com>;
>> Ghimiray, Himal Prasad<himal.prasad.ghimiray@intel.com>;
>> Thomas.Hellstrom@linux.intel.com; Vishwanathapura, Niranjana
>> <niranjana.vishwanathapura@intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>; Gupta, saurabhg<saurabhg.gupta@intel.com>
>> Subject: Re: Making drm_gpuvm work across gpu devices
>>
>>
>> On 2024-01-24 20:17, Zeng, Oak wrote:
>>> Hi Christian,
>>>
>>> Even though I mentioned KFD design, I didn’t mean to copy the KFD
>>> design. I also had hard time to understand the difficulty of KFD under
>>> virtualization environment.
>>>
>> The problem with virtualization is related to virtualization design
>> choices. There is a single process that proxies requests from multiple
>> processes in one (or more?) VMs to the GPU driver. That means, we need a
>> single process with multiple contexts (and address spaces). One proxy
>> process on the host must support multiple guest address spaces.
> My first response is, why processes on the virtual machine can't open /dev/kfd device itself?

Because it's not using SRIOV, we are using native context and so the KFD 
driver is on the host and not the guest.

> Also try to picture why base amdgpu driver (which is per hardware device based) doesn't have this problem... creating multiple contexts under single amdgpu device, each context servicing one guest process?

Yes, exactly that.

>> I don't know much more than these very high level requirements, and I
>> only found out about those a few weeks ago. Due to my own bias I can't
>> comment whether there are bad design choices in the proxy architecture
>> or in KFD or both. The way we are considering fixing this, is to enable
>> creating multiple KFD contexts in the same process. Each of those
>> contexts will still represent a shared virtual address space across
>> devices (but not the CPU). Because the device address space is not
>> shared with the CPU, we cannot support our SVM API in this situation.
>>
> One kfd process, multiple contexts, each context has a shared address space across devices.... I do see some complications 😊

Yeah, if the process which talks to the driver is not the process which 
initiated the work then the concept to tie anything to device state 
obviously doesn't work.

Regards,
Christian.

>
>> I still believe that it makes sense to have the kernel mode driver aware
>> of a shared virtual address space at some level. A per-GPU API and an
>> API that doesn't require matching CPU and GPU virtual addresses would
>> enable more flexibility at the cost duplicate information tracking for
>> multiple devices and duplicate overhead for things like MMU notifiers
>> and interval tree data structures. Having to coordinate multiple devices
>> with potentially different address spaces would probably make it more
>> awkward to implement memory migration. The added flexibility would go
>> mostly unused, except in some very niche applications.
>>
>> Regards,
>>     Felix
>>
>>
>>> For us, Xekmd doesn't need to know it is running under bare metal or
>>> virtualized environment. Xekmd is always a guest driver. All the
>>> virtual address used in xekmd is guest virtual address. For SVM, we
>>> require all the VF devices share one single shared address space with
>>> guest CPU program. So all the design works in bare metal environment
>>> can automatically work under virtualized environment. +@Shah, Ankur N
>>> <mailto:ankur.n.shah@intel.com>  +@Winiarski, Michal
>>> <mailto:michal.winiarski@intel.com>  to backup me if I am wrong.
>>>
>>> Again, shared virtual address space b/t cpu and all gpu devices is a
>>> hard requirement for our system allocator design (which means
>>> malloc’ed memory, cpu stack variables, globals can be directly used in
>>> gpu program. Same requirement as kfd SVM design). This was aligned
>>> with our user space software stack.
>>>
>>> For anyone who want to implement system allocator, or SVM, this is a
>>> hard requirement. I started this thread hoping I can leverage the
>>> drm_gpuvm design to manage the shared virtual address space (as the
>>> address range split/merge function was scary to me and I didn’t want
>>> re-invent). I guess my takeaway from this you and Danilo is this
>>> approach is a NAK. Thomas also mentioned to me drm_gpuvm is a overkill
>>> for our svm address range split/merge. So I will make things work
>>> first by manage address range xekmd internally. I can re-look
>>> drm-gpuvm approach in the future.
>>>
>>> Maybe a pseudo user program can illustrate our programming model:
>>>
>>> Fd0 = open(card0)
>>>
>>> Fd1 = open(card1)
>>>
>>> Vm0 =xe_vm_create(fd0) //driver create process xe_svm on the process's
>>> first vm_create
>>>
>>> Vm1 = xe_vm_create(fd1) //driver re-use xe_svm created above if called
>>> from same process
>>>
>>> Queue0 = xe_exec_queue_create(fd0, vm0)
>>>
>>> Queue1 = xe_exec_queue_create(fd1, vm1)
>>>
>>> //check p2p capability calling L0 API….
>>>
>>> ptr = malloc()//this replace bo_create, vm_bind, dma-import/export
>>>
>>> Xe_exec(queue0, ptr)//submit gpu job which use ptr, on card0
>>>
>>> Xe_exec(queue1, ptr)//submit gpu job which use ptr, on card1
>>>
>>> //Gpu page fault handles memory allocation/migration/mapping to gpu
>>>
>>> As you can see, from above model, our design is a little bit different
>>> than the KFD design. user need to explicitly create gpuvm (vm0 and vm1
>>> above) for each gpu device. Driver internally have a xe_svm represent
>>> the shared address space b/t cpu and multiple gpu devices. But end
>>> user doesn’t see and no need to create xe_svm. The shared virtual
>>> address space is really managed by linux core mm (through the vma
>>> struct, mm_struct etc). From each gpu device’s perspective, it just
>>> operate under its own gpuvm, not aware of the existence of other
>>> gpuvm, even though in reality all those gpuvm shares a same virtual
>>> address space.
>>>
>>> See one more comment inline
>>>
>>> *From:*Christian König<christian.koenig@amd.com>
>>> *Sent:* Wednesday, January 24, 2024 3:33 AM
>>> *To:* Zeng, Oak<oak.zeng@intel.com>; Danilo Krummrich
>>> <dakr@redhat.com>; Dave Airlie<airlied@redhat.com>; Daniel Vetter
>>> <daniel@ffwll.ch>; Felix Kuehling<felix.kuehling@amd.com>
>>> *Cc:* Welty, Brian<brian.welty@intel.com>;
>>> dri-devel@lists.freedesktop.org;intel-xe@lists.freedesktop.org;
>>> Bommu, Krishnaiah<krishnaiah.bommu@intel.com>; Ghimiray, Himal Prasad
>>> <himal.prasad.ghimiray@intel.com>;Thomas.Hellstrom@linux.intel.com;
>>> Vishwanathapura, Niranjana<niranjana.vishwanathapura@intel.com>;
>>> Brost, Matthew<matthew.brost@intel.com>; Gupta, saurabhg
>>> <saurabhg.gupta@intel.com>
>>> *Subject:* Re: Making drm_gpuvm work across gpu devices
>>>
>>> Am 23.01.24 um 20:37 schrieb Zeng, Oak:
>>>
>>>      [SNIP]
>>>
>>>      Yes most API are per device based.
>>>
>>>      One exception I know is actually the kfd SVM API. If you look at the svm_ioctl
>> function, it is per-process based. Each kfd_process represent a process across N
>> gpu devices.
>>>
>>> Yeah and that was a big mistake in my opinion. We should really not do
>>> that ever again.
>>>
>>>
>>>      Need to say, kfd SVM represent a shared virtual address space across CPU
>> and all GPU devices on the system. This is by the definition of SVM (shared virtual
>> memory). This is very different from our legacy gpu *device* driver which works
>> for only one device (i.e., if you want one device to access another device's
>> memory, you will have to use dma-buf export/import etc).
>>>
>>> Exactly that thinking is what we have currently found as blocker for a
>>> virtualization projects. Having SVM as device independent feature
>>> which somehow ties to the process address space turned out to be an
>>> extremely bad idea.
>>>
>>> The background is that this only works for some use cases but not all
>>> of them.
>>>
>>> What's working much better is to just have a mirror functionality
>>> which says that a range A..B of the process address space is mapped
>>> into a range C..D of the GPU address space.
>>>
>>> Those ranges can then be used to implement the SVM feature required
>>> for higher level APIs and not something you need at the UAPI or even
>>> inside the low level kernel memory management.
>>>
>>> When you talk about migrating memory to a device you also do this on a
>>> per device basis and *not* tied to the process address space. If you
>>> then get crappy performance because userspace gave contradicting
>>> information where to migrate memory then that's a bug in userspace and
>>> not something the kernel should try to prevent somehow.
>>>
>>> [SNIP]
>>>
>>>          I think if you start using the same drm_gpuvm for multiple devices you
>>>
>>>          will sooner or later start to run into the same mess we have seen with
>>>
>>>          KFD, where we moved more and more functionality from the KFD to the
>> DRM
>>>          render node because we found that a lot of the stuff simply doesn't work
>>>
>>>          correctly with a single object to maintain the state.
>>>
>>>      As I understand it, KFD is designed to work across devices. A single pseudo
>> /dev/kfd device represent all hardware gpu devices. That is why during kfd open,
>> many pdd (process device data) is created, each for one hardware device for this
>> process.
>>>
>>> Yes, I'm perfectly aware of that. And I can only repeat myself that I
>>> see this design as a rather extreme failure. And I think it's one of
>>> the reasons why NVidia is so dominant with Cuda.
>>>
>>> This whole approach KFD takes was designed with the idea of extending
>>> the CPU process into the GPUs, but this idea only works for a few use
>>> cases and is not something we should apply to drivers in general.
>>>
>>> A very good example are virtualization use cases where you end up with
>>> CPU address != GPU address because the VAs are actually coming from
>>> the guest VM and not the host process.
>>>
>>> I don’t get the problem here. For us, under virtualization, both the
>>> cpu address and gpu virtual address operated in xekmd is guest virtual
>>> address. They can still share the same virtual address space (as SVM
>>> required)
>>>
>>> Oak
>>>
>>>
>>>
>>> SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should
>>> not have any influence on the design of the kernel UAPI.
>>>
>>> If you want to do something similar as KFD for Xe I think you need to
>>> get explicit permission to do this from Dave and Daniel and maybe even
>>> Linus.
>>>
>>> Regards,
>>> Christian.
>>>

--------------g1tnn4l0rWHLnqetVRfUF0Ay
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 25.01.24 um 19:37 schrieb Zeng, Oak:<span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:SA1PR11MB69913BCFDA5F28199D5E002F927A2@SA1PR11MB6991.namprd11.prod.outlook.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: Felix Kuehling <a class="moz-txt-link-rfc2396E" href="mailto:felix.kuehling@amd.com">&lt;felix.kuehling@amd.com&gt;</a>
Sent: Thursday, January 25, 2024 12:16 PM
To: Zeng, Oak <a class="moz-txt-link-rfc2396E" href="mailto:oak.zeng@intel.com">&lt;oak.zeng@intel.com&gt;</a>; Christian König
<a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>; Danilo Krummrich <a class="moz-txt-link-rfc2396E" href="mailto:dakr@redhat.com">&lt;dakr@redhat.com&gt;</a>; Dave
Airlie <a class="moz-txt-link-rfc2396E" href="mailto:airlied@redhat.com">&lt;airlied@redhat.com&gt;</a>; Daniel Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a>; Shah, Ankur N
<a class="moz-txt-link-rfc2396E" href="mailto:ankur.n.shah@intel.com">&lt;ankur.n.shah@intel.com&gt;</a>; Winiarski, Michal <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
Cc: Welty, Brian <a class="moz-txt-link-rfc2396E" href="mailto:brian.welty@intel.com">&lt;brian.welty@intel.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>; intel-
<a class="moz-txt-link-abbreviated" href="mailto:xe@lists.freedesktop.org">xe@lists.freedesktop.org</a>; Bommu, Krishnaiah <a class="moz-txt-link-rfc2396E" href="mailto:krishnaiah.bommu@intel.com">&lt;krishnaiah.bommu@intel.com&gt;</a>;
Ghimiray, Himal Prasad <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>;
<a class="moz-txt-link-abbreviated" href="mailto:Thomas.Hellstrom@linux.intel.com">Thomas.Hellstrom@linux.intel.com</a>; Vishwanathapura, Niranjana
<a class="moz-txt-link-rfc2396E" href="mailto:niranjana.vishwanathapura@intel.com">&lt;niranjana.vishwanathapura@intel.com&gt;</a>; Brost, Matthew
<a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>; Gupta, saurabhg <a class="moz-txt-link-rfc2396E" href="mailto:saurabhg.gupta@intel.com">&lt;saurabhg.gupta@intel.com&gt;</a>
Subject: Re: Making drm_gpuvm work across gpu devices


On 2024-01-24 20:17, Zeng, Oak wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Hi Christian,

Even though I mentioned KFD design, I didn’t mean to copy the KFD
design. I also had hard time to understand the difficulty of KFD under
virtualization environment.

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">The problem with virtualization is related to virtualization design
choices. There is a single process that proxies requests from multiple
processes in one (or more?) VMs to the GPU driver. That means, we need a
single process with multiple contexts (and address spaces). One proxy
process on the host must support multiple guest address spaces.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
My first response is, why processes on the virtual machine can't open /dev/kfd device itself?</pre>
    </blockquote>
    <br>
    Because it's not using SRIOV, we are using native context and so the
    KFD driver is on the host and not the guest.<br>
    <br>
    <blockquote type="cite" cite="mid:SA1PR11MB69913BCFDA5F28199D5E002F927A2@SA1PR11MB6991.namprd11.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">Also try to picture why base amdgpu driver (which is per hardware device based) doesn't have this problem... creating multiple contexts under single amdgpu device, each context servicing one guest process?</pre>
    </blockquote>
    <br>
    Yes, exactly that. <br>
    <br>
    <blockquote type="cite" cite="mid:SA1PR11MB69913BCFDA5F28199D5E002F927A2@SA1PR11MB6991.namprd11.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
I don't know much more than these very high level requirements, and I
only found out about those a few weeks ago. Due to my own bias I can't
comment whether there are bad design choices in the proxy architecture
or in KFD or both. The way we are considering fixing this, is to enable
creating multiple KFD contexts in the same process. Each of those
contexts will still represent a shared virtual address space across
devices (but not the CPU). Because the device address space is not
shared with the CPU, we cannot support our SVM API in this situation.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
One kfd process, multiple contexts, each context has a shared address space across devices.... I do see some complications 😊</pre>
    </blockquote>
    <br>
    Yeah, if the process which talks to the driver is not the process
    which initiated the work then the concept to tie anything to device
    state obviously doesn't work.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:SA1PR11MB69913BCFDA5F28199D5E002F927A2@SA1PR11MB6991.namprd11.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I still believe that it makes sense to have the kernel mode driver aware
of a shared virtual address space at some level. A per-GPU API and an
API that doesn't require matching CPU and GPU virtual addresses would
enable more flexibility at the cost duplicate information tracking for
multiple devices and duplicate overhead for things like MMU notifiers
and interval tree data structures. Having to coordinate multiple devices
with potentially different address spaces would probably make it more
awkward to implement memory migration. The added flexibility would go
mostly unused, except in some very niche applications.

Regards,
 &nbsp; Felix


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">For us, Xekmd doesn't need to know it is running under bare metal or
virtualized environment. Xekmd is always a guest driver. All the
virtual address used in xekmd is guest virtual address. For SVM, we
require all the VF devices share one single shared address space with
guest CPU program. So all the design works in bare metal environment
can automatically work under virtualized environment. +@Shah, Ankur N
<a class="moz-txt-link-rfc2396E" href="mailto:ankur.n.shah@intel.com">&lt;mailto:ankur.n.shah@intel.com&gt;</a> +@Winiarski, Michal
<a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;mailto:michal.winiarski@intel.com&gt;</a> to backup me if I am wrong.

Again, shared virtual address space b/t cpu and all gpu devices is a
hard requirement for our system allocator design (which means
malloc’ed memory, cpu stack variables, globals can be directly used in
gpu program. Same requirement as kfd SVM design). This was aligned
with our user space software stack.

For anyone who want to implement system allocator, or SVM, this is a
hard requirement. I started this thread hoping I can leverage the
drm_gpuvm design to manage the shared virtual address space (as the
address range split/merge function was scary to me and I didn’t want
re-invent). I guess my takeaway from this you and Danilo is this
approach is a NAK. Thomas also mentioned to me drm_gpuvm is a overkill
for our svm address range split/merge. So I will make things work
first by manage address range xekmd internally. I can re-look
drm-gpuvm approach in the future.

Maybe a pseudo user program can illustrate our programming model:

Fd0 = open(card0)

Fd1 = open(card1)

Vm0 =xe_vm_create(fd0) //driver create process xe_svm on the process's
first vm_create

Vm1 = xe_vm_create(fd1) //driver re-use xe_svm created above if called
from same process

Queue0 = xe_exec_queue_create(fd0, vm0)

Queue1 = xe_exec_queue_create(fd1, vm1)

//check p2p capability calling L0 API….

ptr = malloc()//this replace bo_create, vm_bind, dma-import/export

Xe_exec(queue0, ptr)//submit gpu job which use ptr, on card0

Xe_exec(queue1, ptr)//submit gpu job which use ptr, on card1

//Gpu page fault handles memory allocation/migration/mapping to gpu

As you can see, from above model, our design is a little bit different
than the KFD design. user need to explicitly create gpuvm (vm0 and vm1
above) for each gpu device. Driver internally have a xe_svm represent
the shared address space b/t cpu and multiple gpu devices. But end
user doesn’t see and no need to create xe_svm. The shared virtual
address space is really managed by linux core mm (through the vma
struct, mm_struct etc). From each gpu device’s perspective, it just
operate under its own gpuvm, not aware of the existence of other
gpuvm, even though in reality all those gpuvm shares a same virtual
address space.

See one more comment inline

*From:*Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
*Sent:* Wednesday, January 24, 2024 3:33 AM
*To:* Zeng, Oak <a class="moz-txt-link-rfc2396E" href="mailto:oak.zeng@intel.com">&lt;oak.zeng@intel.com&gt;</a>; Danilo Krummrich
<a class="moz-txt-link-rfc2396E" href="mailto:dakr@redhat.com">&lt;dakr@redhat.com&gt;</a>; Dave Airlie <a class="moz-txt-link-rfc2396E" href="mailto:airlied@redhat.com">&lt;airlied@redhat.com&gt;</a>; Daniel Vetter
<a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a>; Felix Kuehling <a class="moz-txt-link-rfc2396E" href="mailto:felix.kuehling@amd.com">&lt;felix.kuehling@amd.com&gt;</a>
*Cc:* Welty, Brian <a class="moz-txt-link-rfc2396E" href="mailto:brian.welty@intel.com">&lt;brian.welty@intel.com&gt;</a>;
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>;
Bommu, Krishnaiah <a class="moz-txt-link-rfc2396E" href="mailto:krishnaiah.bommu@intel.com">&lt;krishnaiah.bommu@intel.com&gt;</a>; Ghimiray, Himal Prasad
<a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:Thomas.Hellstrom@linux.intel.com">Thomas.Hellstrom@linux.intel.com</a>;
Vishwanathapura, Niranjana <a class="moz-txt-link-rfc2396E" href="mailto:niranjana.vishwanathapura@intel.com">&lt;niranjana.vishwanathapura@intel.com&gt;</a>;
Brost, Matthew <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>; Gupta, saurabhg
<a class="moz-txt-link-rfc2396E" href="mailto:saurabhg.gupta@intel.com">&lt;saurabhg.gupta@intel.com&gt;</a>
*Subject:* Re: Making drm_gpuvm work across gpu devices

Am 23.01.24 um 20:37 schrieb Zeng, Oak:

    [SNIP]

    Yes most API are per device based.

    One exception I know is actually the kfd SVM API. If you look at the svm_ioctl
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">function, it is per-process based. Each kfd_process represent a process across N
gpu devices.
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">

Yeah and that was a big mistake in my opinion. We should really not do
that ever again.


    Need to say, kfd SVM represent a shared virtual address space across CPU
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">and all GPU devices on the system. This is by the definition of SVM (shared virtual
memory). This is very different from our legacy gpu *device* driver which works
for only one device (i.e., if you want one device to access another device's
memory, you will have to use dma-buf export/import etc).
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">

Exactly that thinking is what we have currently found as blocker for a
virtualization projects. Having SVM as device independent feature
which somehow ties to the process address space turned out to be an
extremely bad idea.

The background is that this only works for some use cases but not all
of them.

What's working much better is to just have a mirror functionality
which says that a range A..B of the process address space is mapped
into a range C..D of the GPU address space.

Those ranges can then be used to implement the SVM feature required
for higher level APIs and not something you need at the UAPI or even
inside the low level kernel memory management.

When you talk about migrating memory to a device you also do this on a
per device basis and *not* tied to the process address space. If you
then get crappy performance because userspace gave contradicting
information where to migrate memory then that's a bug in userspace and
not something the kernel should try to prevent somehow.

[SNIP]

        I think if you start using the same drm_gpuvm for multiple devices you

        will sooner or later start to run into the same mess we have seen with

        KFD, where we moved more and more functionality from the KFD to the
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">DRM
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
        render node because we found that a lot of the stuff simply doesn't work

        correctly with a single object to maintain the state.

    As I understand it, KFD is designed to work across devices. A single pseudo
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">/dev/kfd device represent all hardware gpu devices. That is why during kfd open,
many pdd (process device data) is created, each for one hardware device for this
process.
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">

Yes, I'm perfectly aware of that. And I can only repeat myself that I
see this design as a rather extreme failure. And I think it's one of
the reasons why NVidia is so dominant with Cuda.

This whole approach KFD takes was designed with the idea of extending
the CPU process into the GPUs, but this idea only works for a few use
cases and is not something we should apply to drivers in general.

A very good example are virtualization use cases where you end up with
CPU address != GPU address because the VAs are actually coming from
the guest VM and not the host process.

I don’t get the problem here. For us, under virtualization, both the
cpu address and gpu virtual address operated in xekmd is guest virtual
address. They can still share the same virtual address space (as SVM
required)

Oak



SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should
not have any influence on the design of the kernel UAPI.

If you want to do something similar as KFD for Xe I think you need to
get explicit permission to do this from Dave and Daniel and maybe even
Linus.

Regards,
Christian.

</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------g1tnn4l0rWHLnqetVRfUF0Ay--
