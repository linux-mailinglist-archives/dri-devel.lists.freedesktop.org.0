Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1931F74DCBC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 19:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C0B10E2BC;
	Mon, 10 Jul 2023 17:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY4PR02CU007.outbound.protection.outlook.com
 (mail-westcentralusazon11011000.outbound.protection.outlook.com
 [40.93.199.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF5D10E2BC
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 17:47:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0AABqMmwxf6Y75ClblrMccmC3eZaI/t0NtH8NPsvOfQHDCOE7FA+KwDpOgAPaOtgKcGxNysMJW3tI87B7UjOgEhlE95bbLHhD8ZzjMOcJ1Qrc2PmmLSu41ZDWuFEtoQtNGQbB4bPllylNGJPPkjD8HL+38O8RrUk8tnkbNn1ARHXf7Jkmq4mhORpvNtUUT2IobLM/bhNQjlOBhm1Mhu5k0Ps9TfbgN68A2ClezZ3wJnIe3wEJHZkLmBQhnVfn3i+ahncdEnMyLkWtL+rfl2c9C+uIZO6pmky9u9pmKmRFU5Pw3/fH/HpVRZeFQVQ38CffhYH296EnNM0DfgNH67wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDBc/cIqllFz6UXVR3m8uytQwgy1Rmi2jiefvR3Bq/o=;
 b=L3weGYrVVBu3PxrlEYbxMNVNUTHTC2dRVwBy55MDKtXg2tIdZi3F8cVqXbJ5EVZecZ6MWKvvAAHhjEgA8hjetFXygvX0VswonXh2nRCbu6094hipprSt6v3zcJBc9GJxiXvrzmYHQdyiEUhmEOy5pTuRXa5Vz2N2GaqmLtSeUvezQvKKZAEzGfe2oQy64QBr+43Uq0nZja2K469upscYMYJvqke980sx2epP2c1xc5Z3Ir3FHZpuB8odOVo8dQ4blXeRVpuWsv02IPoLqn+BxzNDVK39cjUlf646hUe1A3m5jIRqQ+THqUa3ZoPiZJz5Q7EqOpFiu5LZqKudVO+dyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDBc/cIqllFz6UXVR3m8uytQwgy1Rmi2jiefvR3Bq/o=;
 b=rWwbAtvaJKVOacwZTjISfenH3FygMaGm7ye7l0cuW/heLr4iGbsuPGhlBnc1psoppD3dGTaX9ok+F/l/DMGWaZmveQ9JGeF9URTJtDdTOKk+Jn4Lu7ZsVb/oIqVzK24gohD9LJNp9WscAInjApApBKQj9yVudkWtCKswE4oXUoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from DM5PR05MB3371.namprd05.prod.outlook.com (2603:10b6:4:45::31) by
 DS0PR05MB10251.namprd05.prod.outlook.com (2603:10b6:8:162::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.30; Mon, 10 Jul 2023 17:46:59 +0000
Received: from DM5PR05MB3371.namprd05.prod.outlook.com
 ([fe80::d93d:d4ad:c61a:d3a7]) by DM5PR05MB3371.namprd05.prod.outlook.com
 ([fe80::d93d:d4ad:c61a:d3a7%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 17:46:59 +0000
Message-ID: <9768c00d-536b-dd7b-c8e2-e9d920cd6959@vmware.com>
Date: Mon, 10 Jul 2023 10:46:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org> <20230628104106.30360b55@eldfell>
 <20230628105424.11eb45ec@eldfell>
 <2fb2f3985df4d6710e5ad33f6e618a52004714df.camel@vmware.com>
 <20230629110348.3530f427@eldfell>
 <6c5449cf-b7a6-1125-9493-0fe968166915@vmware.com>
 <20230704110845.490344f5@eldfell>
 <ce7754be-8085-ffd1-93f3-a774f7fcdb87@vmware.com>
 <20230706110146.0abeda0a@eldfell>
 <247b630c-8b16-7c33-987e-8b3451be3c70@vmware.com>
 <20230707113837.1a9d31e9@eldfell>
 <6be74496-f14e-302c-329e-d865f5ee3c36@vmware.com>
 <20230710111706.209cfd55@eldfell>
From: Michael Banack <banackm@vmware.com>
In-Reply-To: <20230710111706.209cfd55@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:334::23) To DM5PR05MB3371.namprd05.prod.outlook.com
 (2603:10b6:4:45::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR05MB3371:EE_|DS0PR05MB10251:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f55226f-3d90-4576-9f09-08db816da944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: acVWLH5T2BUwwop0z46JApGh0FfS1ko+tyuW9KMoQvc96K1oeSpzYgARkvG7XQc0PRknYaj7y+K1vb4puDMn5JzzzYnzPFHFu0BlqjmTtWiHwN/toFkOhYCJ6K2VZRR5kKRJd2MUZuVP0IRkzdIDv+Sdt9cGEUUsIO7hEHQ5sAZ3V/reRD8ADuRF0bnO+PdFa0BMMvB4UssKPdp9BcU+aANtOJR4HWmn+xLpFySABG8PjqJT8GHNINJ0f6rwkwlFYqbbNDN0XBpmU9adBdl+oy8oJ32JxTanDBrxactjEsZJH6nyTT2UuDxNxl26dAGZqXyEDOwxYpg1qIMOxhrx3m+q/sIGwwajgVCx9q0FEU3BWE8Rw5OmDTF0IaQfA+0NarSLSQCceNIrmLl9u+M2naOyFs71BPydy1k5a2qZdz1/VVwaBIDI+BqogJDPu20Efff+dYgemFGgMfqqAuA7GBVJtOjEKfwFFhAh9WJ90LOn1LOTDVe8w0YOTLypnSYDLZU/n9Tdvx/eHbcHAbMQx6QRSJQ/V6Aq55WxLLXdfsQPv1h/GWwAiIwCEgo3deCdlnKfD95NmMNGZzyuGR1gux6RKKO6QhW4JyG9SN/VS8ENMS4MgrSvmzgvno6xOiJNteDHJL0syUewPEl4XmDLNbPgYI1wHlMPqv3Uu2gpYLqTuNI1Gzi/J1CZExVQZwdYG2nPdVxXjgBkPDz4gqYQjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR05MB3371.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199021)(6486002)(6666004)(478600001)(54906003)(6506007)(26005)(53546011)(186003)(6512007)(66946007)(2906002)(66476007)(41300700001)(6916009)(316002)(5660300002)(4326008)(7416002)(8936002)(66556008)(38100700002)(8676002)(31696002)(86362001)(36756003)(83380400001)(2616005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2VjY1ZreEk0b1hoaGZxN21JcDhNeHhGQ1JVN29DbE51eVlvanF5QWE3SzJO?=
 =?utf-8?B?Z1hqcThOcHVacTFDRGoveGxwTnVlVlZCUDlLMWZuaUdicGJHL1VIWmM1NmJW?=
 =?utf-8?B?dVlsaHlPNytVc2NxRDRzUGczcHR5LzhlRE95dnZEQ0pDWjl6bW5wRGhSNDl3?=
 =?utf-8?B?ejFXbFRQVmQxTk5CRytVQ1hNV1pxaHJiWjZxN1RKVGpncHR1ZEEvM2RwMU5I?=
 =?utf-8?B?L1N6eGxNR2xDVUJsMXEydHNtcGtMV01hN0V5TkRldmQ0ZktOczR1YVU2eG16?=
 =?utf-8?B?TzV1bk5ydm5CM044dERQU254eGovVXpTeXdrVHFZendrOHJoWHFnS3dxRXln?=
 =?utf-8?B?WHQyQUI2MngvbjBvaXRuN2pIciswS2hwNmRZN2RuYkFlWFFNWllmZ1JUOE1j?=
 =?utf-8?B?dnhIelBoV1Y1YS9FZ0l1Sk5MNm02KzlYMEdSZHFPQTZpU3c3L05ZMWVLNW1U?=
 =?utf-8?B?TWdjcE13eTVmNXdZRWZYT2kwUDMyakdPd1pWV2xZWWQ1S2huVTArclY2dk9L?=
 =?utf-8?B?RWRXT1RidGFRaVhnbnI0a0dnNHJlUm9BNEhGWXVRQVhtV2xady80RzA0WkZq?=
 =?utf-8?B?OU1MWTFGQldWU3lNMUxkZnV0Sy85aEFQV294WjlhbFNYYTlaeEVxdm9qczBE?=
 =?utf-8?B?SHN1bityS00vSDFpUzljSzYwY29mSE5TVThUMG1ZSVk1YnhRb3ByWjZ1SmNV?=
 =?utf-8?B?VmFINUo4WWtYdzFmcGMrMEFIdnV2SW5GbU5jb0Njb3lRNTU1RXRnZ2IydDZa?=
 =?utf-8?B?TFRxbjllbFNFZ3ovbkZsckhXSW9uRkZtZHd2Z3E5QjZSWUlhdXFwdjlBWFRE?=
 =?utf-8?B?eDRvR1czUy9kVjROSkRNRExOK05mbWlLWGVKSWE5TjBjR05rRVp5VGs3STNp?=
 =?utf-8?B?SEdDTkR1bU9sdHFqNUl6UGk1U0paNmlSVEk1RWI0UTJlcFAwd1YwM2hNdWVl?=
 =?utf-8?B?RGpRTmliRnMwK0ViOTB1RCtpZDcya2duTm9PaVI3Nnk4bjhpcGhnRWJaYlBE?=
 =?utf-8?B?YnhmRDcwYUdIK252MzNVS2pjekU3TDV4Wmlmd2VhL1l3TFk2cFVJK3NjR0Q5?=
 =?utf-8?B?NEV6cTUyV3ZsbGVsWEpZSHRPWUJpRVdPYlNWNzQvek1sZHlwSnV0K0Jpb1Jw?=
 =?utf-8?B?ZEFIUmhQcFdZL2pwSTFCczdFNm9uanQ4cjc0L1JZOERDaFVTdE5DTm9HSlBv?=
 =?utf-8?B?WEJxdGE4eEpZM05tMDF6Qnl3QzVJaDVUSDlCcFFrYko0TDhyM1FoeG53SGNE?=
 =?utf-8?B?ckNzTldST1dZYnBJQ1pCcFEwQzBDS21aU0ZWdi9IeFJYQmVjRjNzazh1OHNu?=
 =?utf-8?B?eDZRd1BPelM5VnRxSWJJV0UyckwzeGJIblBsNE5wZXZDdElwMUNRTlErNU8v?=
 =?utf-8?B?cGxYcHdjaGpBYmFIeTJIZHRZZFRscjlxTmFWVk51cjU0YzZFTEtKTXJ6K010?=
 =?utf-8?B?M0xmMGoyejQwaEpnYy8vQ2RFcnBNT2N3aWpWWWF1djRIQkV4MFlIR1hQMkJS?=
 =?utf-8?B?Y1hBSVF4d1FrVlluNThQNGZwdWh5R2VqTzIwcW9HRmw2MTV6U05WdWJVQldP?=
 =?utf-8?B?Q2ZjUDJsRHFrT21OUStHN1Vsby9BREhnWTJxNWRDcFgvUi92M1ZpSnFXRDJi?=
 =?utf-8?B?RHUyUDBkd1lFSWx3d0lHQnZ2bHRQRWJDV3RVc2JpalVLUW1ZTkZRSHpyZEhU?=
 =?utf-8?B?M0ppY2xkRVFsekhkdVNMYXBrQ3JscUJCS3orWnlTOG5MNXlRUzRscU9PMXc2?=
 =?utf-8?B?V090NE5CSVNQVkVIaFhQaTRueFJwTmtCNGVjNndreTFEOFZkY0lnK1NadEhr?=
 =?utf-8?B?bTZnV25MTkFrbDNSeGJTaTI0MkVUc2tNUE0ySmdLaXRZNVU3NWViUXhRNFBH?=
 =?utf-8?B?ZE9lSHlscDAyVHdRRlY4QStWajlsTnR4NjU5aVAwQVVlTDhEQnl5ZEVmaUMy?=
 =?utf-8?B?b0xMZm9abm50a2NqeDIwVVFhYUU3azdNQ3hKR0podEkvMXRMRUlkajhzTkxZ?=
 =?utf-8?B?a1JVcTlNVFhqcWtRWjZCT2lFRVMwaUxIVW5yYzkyTStmY1M1eVhaR2xpekdh?=
 =?utf-8?B?Syt5T0RMaHY5ZVJlQjF3NnEwanMyM1p4UENEbWdpNk02aTFXc0hYOUFKNkpN?=
 =?utf-8?Q?behMCuOjVZarkuEKRZCSWNI7X?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f55226f-3d90-4576-9f09-08db816da944
X-MS-Exchange-CrossTenant-AuthSource: DM5PR05MB3371.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 17:46:59.6134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6Lqfj/es+e7xCCQtej5Jn8nZptnh1mjogrf+JYAxjy0V8lwDLWRm5C41hjQyybZBzgvOzHkUbUTNwYeDD+pVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR05MB10251
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>, "zack@kde.org" <zack@kde.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/10/23 01:17, Pekka Paalanen wrote:
> On Fri, 7 Jul 2023 13:54:21 -0700
> Michael Banack <banackm@vmware.com> wrote:
>
>> On 7/7/23 01:38, Pekka Paalanen wrote:
> ...
>
>>>>>>>>> The question of which input device corresponds to which cursor plane
>>>>>>>>> might be good to answer too. I presume the VM runner is configured to
>>>>>>>>> expose exactly one of each, so there can be only one association?
>>>>>>>> As far as I know, all of the VM consoles are written as though they
>>>>>>>> taking the place of what would the the physical monitors and input
>>>>>>>> devices on a native machine.  So they assume that there is one user,
>>>>>>>> sitting in front of one console, and all monitors/input devices are
>>>>>>>> being used by that user.
>>>>>>> Ok, but having a single user does not mean that there cannot be
>>>>>>> multiple independent pointers, especially on Wayland. The same with
>>>>>>> keyboards.
>>>>>> True, and if the userspace is doing anything complicated here, the
>>>>>> hypervisor has to be responsible for ensuring that whatever it's doing
>>>>>> works with that, or else this system won't work.  I don't know that the
>>>>>> kernel is in a good position to police that.
>>>>> What do you mean by policing here?
>>>>>
>>>>> Isn't it the hypervisor that determines what virtual input devices will
>>>>> be available to the guest OS? Therefore, the hypervisor is in a
>>>>> position to expose exactly one pointer device and exactly one
>>>>> cursor plane to guest OS which means the guest OS cannot get the
>>>>> association wrong. If that's the general and expected hypervisor
>>>>> policy, then there is no need to design explicit device association in
>>>>> the guest kernel UAPI. If so, I'd like it to be mentioned in the kernel
>>>>> docs, too.
>>>> I'm not entirely sure how to fit what you're calling a "pointer" into my
>>>> mental model of what the hypervisor is doing...
>>> My definition: A pointer is a pointing input device that requires a
>>> cursor image to be drawn at the right location for it to be usable.
>> Right, but normal desktops (and our consoles) expect multiple input
>> devices to feed into a single cursor.  So the connection between the
>> on-screen cursor and the corresponding input-devices is not clear to me
>> when you start talking about multiple pointers, even without any
>> hypervisors in the picture.
> The connection is simple: there is an independent on-screen cursor for
> each logical pointer. How that cursor is drawn is irrelevant to the end
> user, and Wayland compositors (a type of a display server) will use any
> means necessary to draw it.
>
> Each logical pointer has one cursor that is independent from all other
> logical pointers. Each logical pointer can have any number of input
> devices controlling it. The assignments are decided by the userspace
> and implemented in a display (window system) server.
>
> This has been ingrained into the fundamental design of Wayland, even if
> the feature is rarely used in practise. The window system may expose
> multiple independent pointers to applications, and each pointer may also
> interact with the same window simultaneously. This naturally leads to
> the question "which cursor goes with which input device?", and the
> kernel, or anything below it, does not know that if there are multiple
> possibilities.

Right, but the whole notion of a "pointer" is also not a kernel concept 
as far as I know?  The kernel only knows that it's requested to display 
a particular set of screen contents on an particular CRTC output.  What 
we're asking for here is for the new HOTSPOT property to allow the final 
desired screen contents to have some opt-in flexibility on how it gets 
displayed to meet the needs of the para-virtualized drivers and their 
use of cursors.

I think trying to extend that beyond the display side to include the 
mouse/input semantics when those are not already part of the kernel 
interface isn't going to work well.

>
>
>>>> So I guess I'm not clear on what kind of usermode<=>kernel contract you
>>>> want here if the kernel isn't what's owning the translation between the
>>>> mouse input and the cursor position.  The hypervisor awkwardly has to
>>>> straddle both the input/graphics domain, and we do so by making
>>>> assumptions about how the user desktop is going to behave.
>>> Correct. In order to reduce that awkwardness, I encourage you to write
>>> down the expectations and requirements in this new Linux UAPI (the KMS
>>> cursor place hotspot property). Then you can be much more confident on
>>> how a random Linux desktop will behave.
>>>
>>> It will also help the reviewers here to understand what the new UAPI is
>>> and how it is supposed to work.
>> The cursor hotspot is I think fairly straightforward, as far as what
>> that means for how hypervisor clients are expected to draw the mouse,
>> and Zack's working on that part.
>>
>> My point was that how the hypervisor then sends input is sort of outside
>> the scope of the graphics portion here, and I think probably outside the
>> current Linux UAPI entirely (unless there's some other input/topology
>> system somewhere else I'm not familiar with).
> I would not say that the hotspot property is in any way obvious. I've
> spent my whole Wayland and compositor developer career of over 10 years
> never seeing the need of the kernel knowing the hotspot myself, because
> I never use VMWare like tools.
Sorry, I meant straight-forward as in well-defined, not as in obvious.  
It should definitely be documented.

We can just clearly specify the graphics contract here in a way that is 
trickier for the mouse/input parts.

>
> You cannot describe why hotspot property is needed or how it works
> without explaining the input side. The hotspot property is actually
> really weird, because its existence requires combining the input system
> with the graphics system for it to make sense. The input system used to
> be out of scope indeed, but this addition forces it in scope. This is
> the first time that I know of when the kernel or components below the
> kernel needs to know, hence there is no existing infrastructure in
> Linux to record that topology or anything.

I think the problem here is going to be that each of the userspaces and 
para-virtual drivers handle this differently...

They all have their own mechanisms to pass the topology/input-mapping up 
to the hypervisor (either custom IOCTLs on their graphics driver, or 
else backdoor-style from userspace), and how that works at the userspace 
layer (ie X11/Wayland) is differently.

>
> (Sidetrack: for ultra-fast displays, say 1000 Hz refresh for seamless
> hand-eye coordination, it could make very much sense for userspace to
> off-load arbitrary KMS plane positioning through the kernel into
> hardware in general, tying the plane position to some input device
> position temporarily. It might make some sense even with today's
> consumer hardware. So I don't think the concept is fundamentally
> limited to paravirtualized environments. But going there would need a
> lot more work than I am willing to suggest to VMWare to tackle to just
> make their own products better.)

Sure, but to do that we would need to standardize how the input mapping 
happens, and create standard kernel interfaces for the topology 
information, and relative mouse acceleration curves, etc. That's the 
piece that I'm saying isn't standardized enough now to be able to spell 
that out in documentation now, because there is no standard way of 
handling all that.

As a hand-waiving, "this is kind of how it works", it's useful to 
document.  But if you're pushing for a hard "this is how the Linux 
kernel handles mouse input", then I don't think any of these components 
are ready to commit to the mouse/input handling as a Linux UAPI.

>> So I guess I would vote for trying to include something to that effect
>> as context or explanation, but not try to strictly define how that works?
> Yes, exactly.

Okay, if we can keep the mouse/input stuff on the fuzzy side then I 
think we're on the same page.

Thanks!
--Michael Banack
