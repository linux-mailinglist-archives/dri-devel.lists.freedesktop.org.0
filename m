Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BBEC14EB2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 14:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5DF10E3E1;
	Tue, 28 Oct 2025 13:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Nb3r/1zV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013036.outbound.protection.outlook.com
 [40.107.201.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D9210E3E5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 13:39:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fb03JuTEbDRHAzj0wpNnno8fmfdFVxp/oAcvc1KnfpJbdCE3JLP0aN+1zmwXdlwNHziX7G5/YbWLKPSxOUxBCqCnnB5MET1R5Sefg+De2OtL/OWohz4jKluHaoWuQVBAJXZX0IlFSuUh1u7ITTaqpGBrhUYEbiwL9Yy+Yx1ki5sfLGcxSTv8REswZmT2dS2LR/+4gbKM8Hum0Lzexf9GSIO2k6wnfbItpB1ExwIRuBLYW8z/urbM1bcb/sN6QbHLdDDPAvplmOO+3oskIf+sxiRBe4/mV30X4aShgVibR0AOGntWfai6Jjcdt6dcsOOhmiUaqNG+Zz1p+IY94WxZ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6m3heJugSscd6MNgxrrcIYcfAbdBHyP5eU6qTVCZF8=;
 b=gX4CnbwhiZg8tsY1OMHkBAgYfgbwMOR7VMBUYPof99aqOUqHjAinoB5clxNWHqwv58VDMOOHuykAisoo0RyzVOyx+L9WDA2Ws9SSpMpP8sMg8SqHc1TlaRMkHy9NFK7/XwchqIPA7z9y1gQHMkRe33cc3zTbADjgBliuvE3hITE7Jjii5ArVOa1ndbLMYz+wpPlOgBuFT+SNOoFeI1XDyt/javppoiLaxARoi28UYzSfIWG5hOJwHUYaIHHPjuPqUNSlFl+Uh8PQkXg/WqHg7dJ4WvaLtObg+0rerPz2MBFz4WQvH9SD8dp5KQRYJW7ktDULb0LJpPBCr0WAzE1zXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6m3heJugSscd6MNgxrrcIYcfAbdBHyP5eU6qTVCZF8=;
 b=Nb3r/1zVRMqMm6vv6BAh1ARIr+V9aHvPyDW8pCReH3rTFwS643kL0WVpyYh0Jw1wf1NB3BtZm9ZPYHe74SAEU2iocX3d+IUiI2iOQUfryr76YVocB1rpaUqncRfCo05KpShuyCeSn1lbfkUdQc9feCpaPG2OC5WTEfBcXEHfw0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB7744.namprd12.prod.outlook.com (2603:10b6:8:100::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 28 Oct
 2025 13:39:18 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 13:39:18 +0000
Message-ID: <9c75bbb5-907c-439e-b442-ebbac5056bcc@amd.com>
Date: Tue, 28 Oct 2025 08:39:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
To: Francesco Valla <francesco@valla.it>, Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-embedded@vger.kernel.org
References: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
 <93cbbaef-918f-4300-aa5b-11f098e217b2@amd.com>
 <23clcxtgbzbsji2knwp47xdc5udj7lnhbvzsgqi3vklvmhdgjd@26ycx2ed77l4>
 <4497733.UPlyArG6xL@fedora.fritz.box>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <4497733.UPlyArG6xL@fedora.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0043.namprd16.prod.outlook.com
 (2603:10b6:805:ca::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f86378b-4c2e-4bd6-fb87-08de162764c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjdQVWg0YW1kOW5RRWNCN3BJb00vOVVwSDF4d3hoczlTQit2ck41N0M4K2JV?=
 =?utf-8?B?Ti9IOC80cHA0MGd6WnR5NnRhU0x6S0cvbkdZaGV3N1NRQXByTDN5VjV1M2dl?=
 =?utf-8?B?cGlIYnNTV0tlelJYSFdIdGtBNXNEVkZUemtSU3BkOW9VQzhDWjZCRXJCaWNI?=
 =?utf-8?B?NFhXekZSMExOK1Z5Q2NOeU1sTmo2MXVtenJrcHR1WGpuaWZDY0tQMjJiMEcv?=
 =?utf-8?B?QThIZVVERHFpSGFkbU9hS2d6UGJoYmg0b2ZkY2pYc1RmTm8rRDRJOXVKbXF5?=
 =?utf-8?B?bDU3bnN0OGNlaVQ1VDFsL3ZEdndXc0JvOWEwdklNMERmRTZKcUIrQXBURmRR?=
 =?utf-8?B?TFVwRDR4ZTZ5RTJ5K1FZSkxMT1hvM3BmUkQvazBvQ1ZUc2lQSzBkL1pROU4r?=
 =?utf-8?B?anVpMTVXcE44Uzh4ZHByNStJU29DWXh0bUxacWVuSngrc3cxZ1FMbThNdEJy?=
 =?utf-8?B?L0JDYkhESjhiVjl3SVQzS0ZNZG9vTnRpRzZqdjFNaXhkeitKdUlUNGxZUU90?=
 =?utf-8?B?OENNMDl5b2dlSlR3RDRiNzlUS29JNWxubmpYTlh5ZWJoUnRzMFY4ejFrRS9m?=
 =?utf-8?B?VlFyd2dHWW15dGRJU0IwT2lZTVBjeWdJRGJKcXhHR2lHRWJobGtkeG1obnA4?=
 =?utf-8?B?K1U2NDk0QVplS05jNDlUNEZHS0FUaElhYlhZeFRIVzBrTW9Od0M4L1JqMUc2?=
 =?utf-8?B?WUVMcld5dkdVZnBQSkp2TXR2N2FTdGRCc3ZFcmQrNyt5RWtSK1BaOHVuYTB3?=
 =?utf-8?B?TWxhWVczMU5FeUxjd2tiVmVIYytuVFZNOGNCYXQ3ZWtja1FKT1dEMmVLSExp?=
 =?utf-8?B?ZlRNeUZJR0tldDd5OTZtUmNETjZIT3lVZTlFWWkzM2k1R0R5SnFkWVMxd0Vu?=
 =?utf-8?B?UDJCdXM4UGREdml6SUpESnZabS91Q3NtRVVsZ2xzb0hRK3lkTWFSQVJKaURI?=
 =?utf-8?B?b1ZVYWgwc1c1NFFvL2pqWkQ5dzJSMlVQWDFpUlpTVWVVTzN2RUJTS09lYUIw?=
 =?utf-8?B?M2s0akM5UXZFTmo5OWVsS2E3ejdKVUlTODZNYmVFejVwbHFTcUhGWVcyd05m?=
 =?utf-8?B?UU12YzZoOUFETitkbUdvS2FXYTlIVWZsVjdlVzVhb3NLY2wxaDhQaWhqZGVR?=
 =?utf-8?B?dTFJcUtZY1VuNzZGNUZOV2JwWklhendMbVJPM3NYb1NNOXFDRjNTQmc5NUpz?=
 =?utf-8?B?L1dob0U1QnhIM2lXQjJiUzZXZm9teGs0RGkwSnZnc0l5UFkzb0JyTzZNeEt4?=
 =?utf-8?B?bERnQVpqcHRmNFoyWDcrTEl5N0QxNHp4UlAzZC9KbjRPOHFEYkJMWmMxMkFa?=
 =?utf-8?B?RXRYMFJDQ0xvODdZQXRHYXo4V1VQVkJVQlpLSkova2IvQXVNaDJjMnk5YVNQ?=
 =?utf-8?B?Z2lQOTR5dzYvUnR6WE5BZ09SK3RRVmdwMWFWWklDeERJaWtKeUZYZ2hpcmJX?=
 =?utf-8?B?YjMzSEp2RHFhOUlQbGpNbmNxVnpxdk9LVzM3M2FjRXlNZk1RUHFCQUVjelJF?=
 =?utf-8?B?RjJiK0M3Wk9ZellEeXNaSERDclliOVBPZHlwSHkvd1Z4eDFEMVUvOEFsZ21w?=
 =?utf-8?B?amxhMHBmREdnc0pDV2FscC9GUm45dzZhbnhQUUJHNEp5a2QzR2hyaVNrNmJv?=
 =?utf-8?B?K2ZIZXBZcGtXbUYwaEtmR2ptb2Z4L3loRWh6WVhPNHVncGtjQ0I0ZFV0THFR?=
 =?utf-8?B?NTd4ajBYM1I0dW9vSVFIWTdndCtOK3FlME03S05LTVR4NTY2MlF4eHBUd3ly?=
 =?utf-8?B?T3lIcjl6Uk90WEV4RCt5M2RQd1hxN0R2eGVqZHk0N1M2UFB5QmM2K2E4WkFN?=
 =?utf-8?B?d0JsSE1wUjNYdTVCK0hRUlNUNTR0ZDFBMEZlOGg1OHY2ck5BcGF5aXdBajYy?=
 =?utf-8?B?OCtBbHZqNmwyWGZJSzNqd1JjYlUzMzNmR05TVmVyMnlpdmtwc1VxNFJqc1BU?=
 =?utf-8?Q?70zQgZjdteWjRyU2ir1Xfd8Zj9zIwXl9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjZyOWdFdVJ3bXlaeFZTdWJ1YW90QklxZDlzcTkrMU1HWGZqUmE0amlCekE1?=
 =?utf-8?B?aGMzbTQ0Tk02WFc4dGpZSXJGa1hiWlZBWERiWkJ2dnBhWUVGTTRHZFZ4TzVV?=
 =?utf-8?B?WnVTREJTMjFTdjByUTllR3ljTXlIejdnbTJxb2Z5ejZ2SWVoREtqZnNJQmI1?=
 =?utf-8?B?d1d5QU9xOVVMRjFpWTdwOXE3d3A2bm1yT1lFV2hBRmhGbGJSRUxVK2NEQ291?=
 =?utf-8?B?RVE2VDZxeitlUzhoajFUbW9mL3c2eFJFdGM0OU53czNiaFg1Ty9vaEpVOThw?=
 =?utf-8?B?N2tVRXZWemRvZXppZGZxQUZySE9zK0dnNFBobk9RcVJmVjFIZmRjNExTMzAw?=
 =?utf-8?B?cCs1Vi9TaUtGMGE0RDZBbDdHcE5SYXZPWFRaZS9BY3MzUzh5cjZVMVFyNXAx?=
 =?utf-8?B?RXp3aVN2UmQ3cWk2aktGdUVJaUtrK2xUTmNNNUVSMUIwU3QxOFdiZHduUmdW?=
 =?utf-8?B?ejhDcjJ3MlhSVlZOKzNUbVJzZFJKcXNoUEJ3a29idlBvU3h0RlpTdE5jS0R1?=
 =?utf-8?B?b2w5c2tEVmJXL2pmdDVWTFg1Z2ZGTzBNYVZHMTRWdUNnSURCOFRmcHc0THBL?=
 =?utf-8?B?MUw2RUlkNVBibFdDaHh0VGJ4Sk8rb3J5aUQ4UFFFdG5oQXRvMS9yYVovMWhG?=
 =?utf-8?B?bG9lVTA5ZG14ZHpOUzBndVpROUFQWHRFU2tOOFg4UVBjT21Ib0NwUXRydXBu?=
 =?utf-8?B?anJOMTkyTlRjdllja3Q2L3YvdnRkTzhNcU92TXYxdTllSzRGc2ZQSTBxd2Jh?=
 =?utf-8?B?RkRmdW5MV1FhWnRlYmZ0TXoxTHAxa1k2V3FZUW9QL0dVd3VXZUl1QVl3bXlK?=
 =?utf-8?B?NlpkYzZSNlJvbk9XbGtGSk4yTTZrK2xXSEg5cDRKQitycDhJQzdRNlZpc1hK?=
 =?utf-8?B?TnpJeUQ0dE4rdkdqRC9LWFphV0I2TCt2dDVqY2M4eU8xUTI2d0o4OTVrcDlp?=
 =?utf-8?B?QkpzNlZwZXRmS3BwMitRcU94a3lKRm9jZlV6b29zUWpMZzRpNjljeG5xZ0xM?=
 =?utf-8?B?YlBEV2xoNjVHL0pjZGJLdTRDVFU4bkt3c1lLZ0tvR2J1ZHpNNnA2SENuQXEr?=
 =?utf-8?B?bXk4Yk8yRGk1RzVTMS9jMWMrWDV6RGVPTThVV0RwRHZwTkdaQTE2M1c2UXVK?=
 =?utf-8?B?NDdaTGJ0NnFnVklmVWNrdjZSYStvQTV1TmxxaEFLY3pxQ2x5YXhFSHRFSkts?=
 =?utf-8?B?Z2tMeUdKMkxRa21DMUFWbUQ1dUFNQzlDZWlKNjEydlJLVkU2VzhNWCtWYjk1?=
 =?utf-8?B?NUw3YU8vZW1nbWRsZGF5eHZCTnluQkZWYTV4c0ozQVdpdHVwU2tDTCs0MUhJ?=
 =?utf-8?B?cFAvMjRnRWZoZGJxUVM4Y083bEFDREgvd1FacXZPR2EzYkVzems3Qm5meFEr?=
 =?utf-8?B?UUhLclA3c0V2QjNsRWtrNjNaNytZS1pmTzRERTVFdTErZFlxM0NaSk80V2ti?=
 =?utf-8?B?YThITkNVTGhkZXhLT21tV1NiejZOZUxad1ErMlJDMVNKeWJoWG12RTU3VWtu?=
 =?utf-8?B?WXkvQ3FvQkl5UFl4WCtvQU9aaTBEVlQvUDhYN3ZaeGhHd1lIanJFSjFJMDBD?=
 =?utf-8?B?OVU4a2pPWWo2NGc5N3VzS0ltYkt3Ymk5czIyYStlTTZTU3pPNVBrWjhWNEtV?=
 =?utf-8?B?ZGY0Z0wxMHdmWGx2Slp1QmswQ25sSDFRRVdta1UxSU55RU1OS1p3MjQycnNW?=
 =?utf-8?B?SkQrVklIWnV3SVlGOXptSzRuRkZzR1RBQ1UzUVp6TXNjR1VOQnRZcHAzanc4?=
 =?utf-8?B?NUsrdngwVmpSdXdQMXpvRHB4OEttdlRoSWR4QjFELzFDWVB3endlOTd1c1Fr?=
 =?utf-8?B?cXdTbmNxbzUwQ1NEMWV0b1Nrck9DZmRMT3ZkTVNreHphd0kyeUQyVE5LOFcz?=
 =?utf-8?B?N01sZktWenVBK0VOdVVOOEZYUVFQOEFnSVFxRll0b3E3SzJ1SWorMDZscEVv?=
 =?utf-8?B?YkNSWWR1VGJHVVorWTIyUlgxUkpyeFlKeW4ycmpTN3pXQlBxZUtKc1RhSGZZ?=
 =?utf-8?B?YXE3RkFFdk4yLytFY3NNMUZPb0pUb1V0K3BvWGd4RkNtc2o2UlBibEV4azVX?=
 =?utf-8?B?elhrY0hkaFVhdFp6YWJDdUxTMWR2emFYcmNUWnY1cnhqTzArT004ZWFZRWll?=
 =?utf-8?Q?/3zQCKg5btyJv2bi5uw8Nu3vp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f86378b-4c2e-4bd6-fb87-08de162764c4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 13:39:18.5879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPP7913G7JdFNXP1WpnrzJpGJ9KNzTn3MEIDSjhRdlRxQAAA2Eo6cGGVNI1kwtqVEAVT/q6/FHYVeSdmSPiARQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7744
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

On 10/28/25 3:09 AM, Francesco Valla wrote:
> Hi,
> 
> On Monday, 27 October 2025 at 18:19:12 Maxime Ripard <mripard@kernel.org> wrote:
>> On Mon, Oct 27, 2025 at 11:31:06AM -0500, Mario Limonciello wrote:
>>> On 10/27/25 11:28 AM, Maxime Ripard wrote:
>>>> On Mon, Oct 27, 2025 at 11:01:55AM -0500, Mario Limonciello wrote:
>>>>> On 10/27/25 7:35 AM, Thomas Zimmermann wrote:
>>>>>>>>      - a very simple progress bar, which can be driven through sysfs;
>>>>>>
>>>>>> Once you have options to control these settings from user space, you
>>>>>> should do it in user space entirely. As Maxime suggested, please improve
>>>>>> plymouth for anything with animation.
>>>>>>
>>>>>>>>      - a static image (optional).
>>>>>>
>>>>>> Board vendors often provide an image, see /sys/firmware/acpi/bgrt/. This
>>>>>> is a candidate for display, or the penguin or a custom image. Please
>>>>>> make it configurable by Kconfig. Again, if you need policy and
>>>>>> heuristics for deciding what to display, you better do this in user
>>>>>> space.
>>>>>
>>>>> I'd actually argue that the static image from BGRT should be the preferred
>>>>> priority.  This can make for a nice hand off to Plymouth.
>>>>>
>>>>> The (UEFI) BIOS already will show this image as soon as the GOP driver is
>>>>> loaded.  Bootloaders like GRUB by default will avoid showing anything or
>>>>> will overwrite with the exact same image in the same location.  This can let
>>>>> the kernel do the same, and then the moment Plymouth takes over it could do
>>>>> the same.
>>>>
>>>> And BGRT isn't typically found on embedded systems at all, so I'm not
>>>> sure it's a sensible default, let alone a priority. At most a possible
>>>
>>> There are certainly embedded machines using UEFI and that have a BGRT.
>>
>> Yes, indeed, hence the "typically".
>>
>>> How about "Sensible default the top of the priority list if it exists"
>>
>> How about we don't tell contributors what their priorities must be?
>>
>> Maxime
>>
> 
> I'm not familiar at all with BGRT, I'll study a bit about it.
> 
> A build-time configuration could then let the user select:
> 
> - a plain solid color
> - a custom static image
> - the penguin logo (?)
> - (on UEFI systems) BGRT source

Thanks!

What I had in mind (which feel free to disagree - it's an RC afterall):

User can pick one of these:

CONFIG_SPLASH_IMAGE
CONFIG_SPLASH_COLOR

If user picks CONFIG_SPLASH_IMAGE then the default behavior would be 
UEFI BGRT with a fallback to a Linux penguin.

Additionally there could be a

CONFIG_SPLASH_CUSTOM_IMAGE

This would populate the path to a custom image at build time.

If user picks this then it would override both UEFI BGRT and Linux penguin.

> 
> 
> 
> Thank you
> 
> Regards,
> Francesco

