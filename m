Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F1347DD89
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 02:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2D510E24C;
	Thu, 23 Dec 2021 01:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E75610E20A;
 Thu, 23 Dec 2021 01:52:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGUTyg4ixMpxAnJJmhWRq4LiWaEMhHU7MTrDN5My+KUdwm+dlxtAxETQgL/uanDkoJXpi1h/cqciGqrksXMu8Kal3+kDdrZAnDmRWDZ7q3q86OV0KwVCYjK0tMf6Uj0IZNwL11WhnrWgmow70s4RRt6dJ0kTCrwOF5gvbT9/irgYt8D1dUTNntyHYhGsatuUmH5rL/5vYwE6VVBNUQ0ipzndMpSGw99Skd3G/M0HnCkwvcgel5clHqFcihtay2e2vHt6yU9mpEDayNpG+JE2EICsUgWoco9UjpME3r+vuDfDOI7gkYN8FplPiT8tFrL1NQcXN0yEGTJcRisZ6BzD8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8ADLSw0b9up48Y6TQEUQP/b78cgENaVp4KCK2n5G/U=;
 b=BW5oVwp38UX9QMzR7IWY6oxJ9lSFUhe/7zBAU8x9U/N7n/cW+Q0Kgu2gOHTgpiCUNzC+8Wi4jRMy5Ub6RsjV1WbDv+OXguYvxsUAwblnNwnc7nlL0sAGhgYP5H/yXOplwWbvi1o6kuMmWrKNTJ56g5t2heVoXRFSnCn1vYL5Lu8J1m4BVjlTY6N8yRQ23GnmTGMeOE/YJp2p72ndXOPodW0qCCmWIqWqzrrngxlxdN26BtBsWLnCReu2a36Ci1ZTDTJ951SywDetzaIPv7D+RZ2z1GCEUitfswW9JY6yYd1k6cR9uCo+bqrFlVIrxkiCX5dxZnwO0/4sBR8Z+J6SsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8ADLSw0b9up48Y6TQEUQP/b78cgENaVp4KCK2n5G/U=;
 b=3Nn+43qW1hl4z6pyiVPOUK0OlfS4smiIRI5iZF871NAPap5atBhk1X7WOwm9PolJMROIlcobFZP1NSoZzANvJDBHENWoILI50L8h0EXOq1Y1o5Tu06PcRXBwk8mGACxcKVZrwWWiwLPB7cRrp5u870Qi9fCuAiZ7Ef59ziUsU+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1527.namprd12.prod.outlook.com (2603:10b6:910:5::23)
 by CY4PR12MB1142.namprd12.prod.outlook.com (2603:10b6:903:40::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17; Thu, 23 Dec
 2021 01:52:04 +0000
Received: from CY4PR12MB1527.namprd12.prod.outlook.com
 ([fe80::b83d:9c56:74dd:937b]) by CY4PR12MB1527.namprd12.prod.outlook.com
 ([fe80::b83d:9c56:74dd:937b%11]) with mapi id 15.20.4801.020; Thu, 23 Dec
 2021 01:52:04 +0000
Content-Type: multipart/alternative;
 boundary="------------DCNk5e0wNmrRTsbceS12SjrI"
Message-ID: <9a2dd649-6925-e798-b9da-19e578a89b4c@amd.com>
Date: Wed, 22 Dec 2021 20:51:57 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
Content-Language: en-CA
From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, Adrian Reber <areber@redhat.com>
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
 <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
 <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
 <de272de9-3f4a-db40-699a-41394cb699dc@amd.com>
 <cb5668d4-a13d-3b0b-442a-bfe1b3a7239a@amd.com>
 <000edeaf-8a89-ea4d-5b9a-2bd7758f675c@amd.com>
 <f00f2f16-f0b3-cb54-f88e-d53353bfdb79@amd.com>
 <f4527002-ec6d-5279-3b79-1aacb6cc55cc@amd.com>
 <YcBM3PMz7J90F3LQ@phenom.ffwll.local>
 <9d1030c2-2269-cfdd-bbb0-9c3d5995841a@amd.com>
 <YcOQN/l7W66W/X0f@phenom.ffwll.local>
 <ebcdbdad-1d34-41be-0423-e97b994e2bb2@amd.com>
In-Reply-To: <ebcdbdad-1d34-41be-0423-e97b994e2bb2@amd.com>
X-ClientProxiedBy: CH0PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:610:e6::18) To CY4PR12MB1527.namprd12.prod.outlook.com
 (2603:10b6:910:5::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e793642e-cde3-4e47-8bc4-08d9c5b6d1a2
X-MS-TrafficTypeDiagnostic: CY4PR12MB1142:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB114233E4716FB2787FD1910AFE7E9@CY4PR12MB1142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mgCOTnlbnoPmLsIUfWhid3dWHB42B7hZI8hBnSNTJjQNzio9rOChwwvwKLRLyahBXExbM1FZ4IyJFuai9IiIaUqSwf7AAMYbUaJfTTo15j2e2iQp0vEHAa9EHqwhMm7HGdDSX+zahLC7SNmGZ9ClaC6RR16IeVGjdjKRk8yMCXP3SWTjmcmNT7MEcIv5I4hxCZ/Y9jInjXzK63BOC1QDkIrpq469CG2Tw6m+tH2oIiWAIj7WjVCFf+YnOsPldrMaucPvET9JrWISLRsMWDlOJMKUJvSzteXC/AyISmIMMIeausoVPgroSOffQOpfjHSjHH8yg5kVWCc9zo2Y32lMk+RHU4cpr76q4zulS+/hxCftswlKLYR56JA81zeh+z83vGWMr0hO1WUxtzzGpRiBiI5UDx35Se1zK0da3GUOPWT7JXd0m7GOT/N9xTXGruZB0QLZENo9Fj9uAUveE9Mm+fY4rSZtbLXL/QH09LqKZB43gmQLQZpwWx1yBiEMqrIpZEDdTUgmtXRw/qExPJLtDrkqibHdjK2t/DHwse7zhx4NdBm9XUMUr97uRZJNGLIyK2ftrU4us7QeVzlD/pbyQyb/HEJDLsVykniyq16HWCXqGBTa86ZRt0PvnUpfF+PSKqzMJ0O5yEC/Y16koikkcpkbzhjAHp0fLQiEO7GA0GwgZOUZ4H8ZCeXK6shPTPxSnOpSZ3J0LqaiAwIqAdZcnvy0a4/57Nbll8VKCKE17c/QYv+/zSQOwxF+1r7qZ9xZe6qCbTMbUYgIFPTkFgcMAobbTetlOARMb35dc9oj0I26gDlhGRxhkIVg7lpgedF8Imb8ndV2VjR1bbbCM3nwbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1527.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66574015)(66556008)(38100700002)(2616005)(66946007)(2906002)(30864003)(36756003)(5660300002)(508600001)(45080400002)(4326008)(54906003)(316002)(110136005)(166002)(26005)(31696002)(966005)(186003)(83380400001)(31686004)(6486002)(8676002)(6506007)(6666004)(33964004)(8936002)(86362001)(53546011)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K29WWjcyZEpWeWkxRzVWbXhBT3NXS1BlVXhPbE04MEswblR1aDhQK3FrU1ls?=
 =?utf-8?B?QjNhaE5tVjVucUo1ZGZERzJmWnRCSExWSDJsSHlEQnpvSmFQTzRwcXRxSSt4?=
 =?utf-8?B?ZFh5dU5jakYyMHRBcHFwbjRRUnh2T3F5OVRiM0VnTFM3VUtmdWszUFRVZ0Zm?=
 =?utf-8?B?KzJNaWVPQmlMTnpRZkRJNWRCU0NocGFLNERRUDVEOGphQ1dSNHoyb0JoYWdN?=
 =?utf-8?B?NDlESksxV05JWmVHRW41ZzVDaHhsTVh1Vzh1UEZIKzBYM2VpcEhkRXRkeXJJ?=
 =?utf-8?B?eUU3bjJQNGx2OVNKT2NIR0prZUpIZDhFaEwxa1U3RDI4bnVIbHlaZWFRMEF6?=
 =?utf-8?B?RzltSkdsU3dlNUkyTW1IY21UMUJDSUNJdTROdng4NW9Sd2NaWWg0cEVrcUU0?=
 =?utf-8?B?aHFFeDZkMGlwb0pTT1VxN0lqZmNwZXpleGdueDhYUHNzRWEzQ2cxc2pLSXR4?=
 =?utf-8?B?c0srcGJpRjBqME1vamU4TUMzVW5XQWdtazRteVJCc28vY3RFZnRQempVWlEw?=
 =?utf-8?B?VzdTaWF2bkVVNVBuelZ5OHVPODh4UVBkOEdXVmdhcjlNcG5yVGMxVzR6MWlZ?=
 =?utf-8?B?dlgyLzZyK2NYMzdjRTNvTmVYcWtObHB3QTZpSzJyaEJLZVVuWWt2bmRMN0Iv?=
 =?utf-8?B?a2tFZ01qcWtrRXpwVVplaGtwaXNQWXJnVGQ0NXNmRTBoQmRwQ0h0T1ExUVlo?=
 =?utf-8?B?Wm1pZmlMRnhUUmFsamEwRmd1UjdjYk12QUtDeEdhWm85NjgrazlvZXFVZVds?=
 =?utf-8?B?cG4zSjY5Z3E5T1ZPNHNDcm5MaEY1UzR1TlVFNE9jT245a01NeGRvelIwek9G?=
 =?utf-8?B?WXp0K3dyem5SUHhCWEpoR0V4YUtMRWVXV2ZBZmR6blo0azlGNlZ2dzRtcXZJ?=
 =?utf-8?B?d01Ld2IyUUl3bGwxeVFkTFQzbURkS0diVmlhUEhmNktSNWljVFFkQ3pwUUFz?=
 =?utf-8?B?OE0yRzVaaTRnWGxqMjd5cGJ2SEQ5eER3K3gyZVJyV0pMQW56Y2xxeEVidTY1?=
 =?utf-8?B?ZlNBQjg5eStvSlV5Mm04Y0c0VFVmS1RwcmlnMHQ0N2w2SVZJTnY4ZitMd3Vq?=
 =?utf-8?B?RE5MK1dBUUp0Wm9zRXE2RnpmbEs2VDdRTnEzN2tOcTdwVW8xZWxEaHEwY2Va?=
 =?utf-8?B?RXBLUzQ4N3ZaNm94ZWVTb004bFpnQjRSRkFlbWxwLzdGd3R3d3NlRExod21r?=
 =?utf-8?B?WXVLU1VTa1d4WFE0ZFlFUnB0OFE5Q2xRRW40L1dMejQ2NjlZUm85WWFrN0hO?=
 =?utf-8?B?cm9GbHBWTlNqenluWXFlaE1RVUxYWUltaVQ1ZHJLMkNBZWVoT0FzN0FJM3dU?=
 =?utf-8?B?Q2creVkzK3dSVGxJNkxSUkJ6dGNmRHJBdng1aXVtcStsQk1WL0hOcFdrcENP?=
 =?utf-8?B?d0hZS09FSzdDeXY2S2VRdjcrcXBqT0xQSkh2VUpSaS9qWDhRV2lqZmNiN1dY?=
 =?utf-8?B?bVZ4ekpjVzk5cnlHYWh5S2lBYzFLWHJrUU1zTXN0ZEhPdHl4VmhiR3EvQ0VU?=
 =?utf-8?B?WDgvSXNBMkhqZHJpekt4Tno2ajZoYTJlWVhlNHJsL25qMW1kb2wxWVk0STRY?=
 =?utf-8?B?WGUvV0JIM3NkbEttdStRK2VTb0I2S044dndURFZ4b1NRb21KUW50Q21YWWNJ?=
 =?utf-8?B?Z1d1VlpsMmQremx2WUR0NGNCb2dISDF5SElCaGUxL2QwdmhFa0djL29WTERz?=
 =?utf-8?B?aEZnajJteUZ3b1R0WkRtZUExeFhqMHp2MjFNSU05Ukp6czVJZllmRUdxWEdG?=
 =?utf-8?B?aFhpVW45blp2aGN2dXkydkVDRHZlNndYOC9FZnB2Q2wyNmFLN0xMcXlJd1Ex?=
 =?utf-8?B?ODZxRzFaWVZ2MTFLdUN5aENmOE8wSksxdVFVL1FFaGlIalprVG9LU2NvY2N6?=
 =?utf-8?B?ZFRIUHNWL3YvUEtzMzJLTXNtKzYxUnE3YkpXNnBvYVFJa3ByVlQzcVpIa2Yw?=
 =?utf-8?B?STZIRWpRVmZ0VGFUREVZRDAvTzE0ejloUUc4SG9TWEJhbWtvcjRMRngxQVRK?=
 =?utf-8?B?TzdJZThDVXEwV25vUUlrRVNTVGErNzRjYTdIOXlvaFptWE9zTU5EWlpCVi9v?=
 =?utf-8?B?VU94RktTaDVBdnNIaWNVZ1A3OXZqQ1hpeUlaVlYxakdXRGQycWd2eW11Z0d1?=
 =?utf-8?B?cGZPdTBCL3llSDdLM2p5QVlOODRKdjhpYWllSzJ4Z3l6R1dIclJ2Ulp0a0xN?=
 =?utf-8?Q?FheAdf1YbfbAers6KR81/Qc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e793642e-cde3-4e47-8bc4-08d9c5b6d1a2
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1527.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 01:52:04.3305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pyec+1WZ8a0231z4KgiV8RN6V6eh2q3D4Nxk8/ZPDtTLcdULX3+ALI7w/Of/FsUqJdcZaIi8N0CIDagN+81nyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1142
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 criu@openvz.org, David Yat Sin <david.yatsin@amd.com>,
 amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 alexander.deucher@amd.com, airlied@redhat.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------DCNk5e0wNmrRTsbceS12SjrI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Sorry for the typo in my previous email. Please read Adrian Reber*

On 12/22/2021 8:49 PM, Bhardwaj, Rajneesh wrote:
>
> Adding Adrian Rebel who is the CRIU maintainer and CRIU list
>
> On 12/22/2021 3:53 PM, Daniel Vetter wrote:
>> On Mon, Dec 20, 2021 at 01:12:51PM -0500, Bhardwaj, Rajneesh wrote:
>>> On 12/20/2021 4:29 AM, Daniel Vetter wrote:
>>>> On Fri, Dec 10, 2021 at 07:58:50AM +0100, Christian König wrote:
>>>>> Am 09.12.21 um 19:28 schrieb Felix Kuehling:
>>>>>> Am 2021-12-09 um 10:30 a.m. schrieb Christian König:
>>>>>>> That still won't work.
>>>>>>>
>>>>>>> But I think we could do this change for the amdgpu mmap callback only.
>>>>>> If graphics user mode has problems with it, we could even make this
>>>>>> specific to KFD BOs in the amdgpu_gem_object_mmap callback.
>>>>> I think it's fine for the whole amdgpu stack, my concern is more about
>>>>> radeon, nouveau and the ARM stacks which are using this as well.
>>>>>
>>>>> That blew up so nicely the last time we tried to change it and I know of at
>>>>> least one case where radeon was/is used with BOs in a child process.
>>>> I'm way late and burried again, but I think it'd be good to be consistent
>
>
> I had committed this change into our amd-staging-drm-next branch last 
> week after I got the ACK and RB from Felix and Christian.
>
>
>>>> here across drivers. Or at least across drm drivers. And we've had the vma
>>>> open/close refcounting to make fork work since forever.
>>>>
>>>> I think if we do this we should really only do this for mmap() where this
>>>> applies, but reading through the thread here I'm honestly confused why
>>>> this is a problem. If CRIU can't handle forked mmaps it needs to be
>>>> thought that, not hacked around. Or at least I'm not understanding why
>>>> this shouldn't work ...
>>>> -Daniel
>>>>
>>> Hi Daniel
>>>
>>> In the v2
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2Fa1a865f5-ad2c-29c8-cbe4-2635d53eceb6%40amd.com%2FT%2F&amp;data=04%7C01%7Crajneesh.bhardwaj%40amd.com%7Ce4634a16c37149da173408d9c58d1338%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637758031981907821%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=h0z4sO19bsJecMqeHGdz%2BHZElKuyzK%2BW%2FMbLWA79I10%3D&amp;reserved=0
>>> I pretty much limited the scope of the change to KFD BOs on mmap. Regarding
>>> CRIU, I think its not a CRIU problem as CRIU on restore, only tries to
>>> recreate all the child processes and then mmaps all the VMAs it sees (as per
>>> checkpoint snapshot) in the new process address space after the VMA
>>> placements are finalized in the position independent code phase. Since the
>>> inherited VMAs don't have access rights the criu mmap fails.
>> Still sounds funky. I think minimally we should have an ack from CRIU
>> developers that this is officially the right way to solve this problem. I
>> really don't want to have random one-off hacks that don't work across the
>> board, for a problem where we (drm subsystem) really shouldn't be the only
>> one with this problem. Where "this problem" means that the mmap space is
>> per file description, and not per underlying inode or real device or
>> whatever. That part sounds like a CRIU problem, and I expect CRIU folks
>> want a consistent solution across the board for this. Hence please grab an
>> ack from them.
>>
>> Cheers, Daniel
>
>
> Maybe Adrian can share his views on this.
>
> Hi Adrian - For the context, on CRIU restore we see mmap failures ( in 
> PIE restore phase) due to permission issues on the (render node) VMAs 
> that were inherited since the application that check pointed had 
> forked.  The VMAs ideally should not be in the child process but the 
> smaps file shows these VMAs in the child address space. We didn't want 
> to use madvise to avoid this copy and rather change in the kernel mode 
> to limit the impact to our user space library thunk. Based on my 
> understanding, during PIE restore phase, after the VMA placements are 
> finalized, CRIU does a sys_mmap on all the VMA it sees in the VmaEntry 
> list and I think its not an issue as per CRIU design but do you think 
> we could handle this corner case better inside CRIU?
>
>
>>> Regards,
>>>
>>> Rajneesh
>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Regards,
>>>>>>      Felix
>>>>>>
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>> Am 09.12.21 um 16:29 schrieb Bhardwaj, Rajneesh:
>>>>>>>> Sounds good. I will send a v2 with only ttm_bo_mmap_obj change. Thank
>>>>>>>> you!
>>>>>>>>
>>>>>>>> On 12/9/2021 10:27 AM, Christian König wrote:
>>>>>>>>> Hi Rajneesh,
>>>>>>>>>
>>>>>>>>> yes, separating this from the drm_gem_mmap_obj() change is certainly
>>>>>>>>> a good idea.
>>>>>>>>>
>>>>>>>>>> The child cannot access the BOs mapped by the parent anyway with
>>>>>>>>>> access restrictions applied
>>>>>>>>> exactly that is not correct. That behavior is actively used by some
>>>>>>>>> userspace stacks as far as I know.
>>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>> Am 09.12.21 um 16:23 schrieb Bhardwaj, Rajneesh:
>>>>>>>>>> Thanks Christian. Would it make it less intrusive if I just use the
>>>>>>>>>> flag for ttm bo mmap and remove the drm_gem_mmap_obj change from
>>>>>>>>>> this patch? For our use case, just the ttm_bo_mmap_obj change
>>>>>>>>>> should suffice and we don't want to put any more work arounds in
>>>>>>>>>> the user space (thunk, in our case).
>>>>>>>>>>
>>>>>>>>>> The child cannot access the BOs mapped by the parent anyway with
>>>>>>>>>> access restrictions applied so I wonder why even inherit the vma?
>>>>>>>>>>
>>>>>>>>>> On 12/9/2021 2:54 AM, Christian König wrote:
>>>>>>>>>>> Am 08.12.21 um 21:53 schrieb Rajneesh Bhardwaj:
>>>>>>>>>>>> When an application having open file access to a node forks, its
>>>>>>>>>>>> shared
>>>>>>>>>>>> mappings also get reflected in the address space of child process
>>>>>>>>>>>> even
>>>>>>>>>>>> though it cannot access them with the object permissions applied.
>>>>>>>>>>>> With the
>>>>>>>>>>>> existing permission checks on the gem objects, it might be
>>>>>>>>>>>> reasonable to
>>>>>>>>>>>> also create the VMAs with VM_DONTCOPY flag so a user space
>>>>>>>>>>>> application
>>>>>>>>>>>> doesn't need to explicitly call the madvise(addr, len,
>>>>>>>>>>>> MADV_DONTFORK)
>>>>>>>>>>>> system call to prevent the pages in the mapped range to appear in
>>>>>>>>>>>> the
>>>>>>>>>>>> address space of the child process. It also prevents the memory
>>>>>>>>>>>> leaks
>>>>>>>>>>>> due to additional reference counts on the mapped BOs in the child
>>>>>>>>>>>> process that prevented freeing the memory in the parent for which
>>>>>>>>>>>> we had
>>>>>>>>>>>> worked around earlier in the user space inside the thunk library.
>>>>>>>>>>>>
>>>>>>>>>>>> Additionally, we faced this issue when using CRIU to checkpoint
>>>>>>>>>>>> restore
>>>>>>>>>>>> an application that had such inherited mappings in the child which
>>>>>>>>>>>> confuse CRIU when it mmaps on restore. Having this flag set for the
>>>>>>>>>>>> render node VMAs helps. VMAs mapped via KFD already take care of
>>>>>>>>>>>> this so
>>>>>>>>>>>> this is needed only for the render nodes.
>>>>>>>>>>> Unfortunately that is most likely a NAK. We already tried
>>>>>>>>>>> something similar.
>>>>>>>>>>>
>>>>>>>>>>> While it is illegal by the OpenGL specification and doesn't work
>>>>>>>>>>> for most userspace stacks, we do have some implementations which
>>>>>>>>>>> call fork() with a GL context open and expect it to work.
>>>>>>>>>>>
>>>>>>>>>>> Regards,
>>>>>>>>>>> Christian.
>>>>>>>>>>>
>>>>>>>>>>>> Cc: Felix Kuehling<Felix.Kuehling@amd.com>
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: David Yat Sin<david.yatsin@amd.com>
>>>>>>>>>>>> Signed-off-by: Rajneesh Bhardwaj<rajneesh.bhardwaj@amd.com>
>>>>>>>>>>>> ---
>>>>>>>>>>>>      drivers/gpu/drm/drm_gem.c       | 3 ++-
>>>>>>>>>>>>      drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
>>>>>>>>>>>>      2 files changed, 3 insertions(+), 2 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>>>>>>>>> index 09c820045859..d9c4149f36dd 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>>>>>>>>> @@ -1058,7 +1058,8 @@ int drm_gem_mmap_obj(struct drm_gem_object
>>>>>>>>>>>> *obj, unsigned long obj_size,
>>>>>>>>>>>>                  goto err_drm_gem_object_put;
>>>>>>>>>>>>              }
>>>>>>>>>>>>      -        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND |
>>>>>>>>>>>> VM_DONTDUMP;
>>>>>>>>>>>> +        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND
>>>>>>>>>>>> +                | VM_DONTDUMP | VM_DONTCOPY;
>>>>>>>>>>>>              vma->vm_page_prot =
>>>>>>>>>>>> pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>>>>>>>>>>>>              vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>>>>>>>>>>>>          }
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>>>>>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>>>>>>> index 33680c94127c..420a4898fdd2 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>>>>>>>>> @@ -566,7 +566,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct
>>>>>>>>>>>> *vma, struct ttm_buffer_object *bo)
>>>>>>>>>>>>            vma->vm_private_data = bo;
>>>>>>>>>>>>      -    vma->vm_flags |= VM_PFNMAP;
>>>>>>>>>>>> +    vma->vm_flags |= VM_PFNMAP | VM_DONTCOPY;
>>>>>>>>>>>>          vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>>>>>>>>>>>>          return 0;
>>>>>>>>>>>>      }
--------------DCNk5e0wNmrRTsbceS12SjrI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Sorry for the typo in my previous email. Please read Adrian
      Reber*<br>
    </p>
    <div class=3D"moz-cite-prefix">On 12/22/2021 8:49 PM, Bhardwaj,
      Rajneesh wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:ebcdbdad-1d34-41be-0423-e97b994e2=
bb2@amd.com">
     =20
      <p>Adding Adrian Rebel who is the CRIU maintainer and CRIU list<br>
      </p>
      <div class=3D"moz-cite-prefix">On 12/22/2021 3:53 PM, Daniel Vetter
        wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:YcOQN%2Fl7W66W%2FX0f@phenom.ffw=
ll.local">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, Dec 20, 2021 at 01:1=
2:51PM -0500, Bhardwaj, Rajneesh wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">On 12/20/2021 4:29 AM, Dan=
iel Vetter wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">On Fri, Dec 10, 2021 at =
07:58:50AM +0100, Christian K=C3=B6nig wrote:
</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">Am 09.12.21 um 19:28 s=
chrieb Felix Kuehling:
</pre>
              <blockquote type=3D"cite">
                <pre class=3D"moz-quote-pre" wrap=3D"">Am 2021-12-09 um 10:=
30 a.m. schrieb Christian K=C3=B6nig:
</pre>
                <blockquote type=3D"cite">
                  <pre class=3D"moz-quote-pre" wrap=3D"">That still won't w=
ork.

But I think we could do this change for the amdgpu mmap callback only.
</pre>
                </blockquote>
                <pre class=3D"moz-quote-pre" wrap=3D"">If graphics user mod=
e has problems with it, we could even make this
specific to KFD BOs in the amdgpu_gem_object_mmap callback.
</pre>
              </blockquote>
              <pre class=3D"moz-quote-pre" wrap=3D"">I think it's fine for =
the whole amdgpu stack, my concern is more about
radeon, nouveau and the ARM stacks which are using this as well.

That blew up so nicely the last time we tried to change it and I know of at
least one case where radeon was/is used with BOs in a child process.
</pre>
            </blockquote>
            <pre class=3D"moz-quote-pre" wrap=3D"">I'm way late and burried=
 again, but I think it'd be good to be consistent</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <p><br>
      </p>
      <p>I had committed this change into our amd-staging-drm-next
        branch last week after I got the ACK and RB from Felix and
        Christian.<br>
      </p>
      <p><br>
      </p>
      <blockquote type=3D"cite" cite=3D"mid:YcOQN%2Fl7W66W%2FX0f@phenom.ffw=
ll.local">
        <blockquote type=3D"cite">
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">here across drivers. Or =
at least across drm drivers. And we've had the vma
open/close refcounting to make fork work since forever.

I think if we do this we should really only do this for mmap() where this
applies, but reading through the thread here I'm honestly confused why
this is a problem. If CRIU can't handle forked mmaps it needs to be
thought that, not hacked around. Or at least I'm not understanding why
this shouldn't work ...
-Daniel

</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">Hi Daniel

In the v2
<a class=3D"moz-txt-link-freetext" href=3D"https://nam11.safelinks.protecti=
on.outlook.com/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Fall%2Fa1a865f5-ad2c-2=
9c8-cbe4-2635d53eceb6%40amd.com%2FT%2F&amp;amp;data=3D04%7C01%7Crajneesh.bh=
ardwaj%40amd.com%7Ce4634a16c37149da173408d9c58d1338%7C3dd8961fe4884e608e11a=
82d994e183d%7C0%7C0%7C637758031981907821%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sda=
ta=3Dh0z4sO19bsJecMqeHGdz%2BHZElKuyzK%2BW%2FMbLWA79I10%3D&amp;amp;reserved=
=3D0" moz-do-not-send=3D"true">https://nam11.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Fall%2Fa1a865f5-ad2c-29c8-cbe4-263=
5d53eceb6%40amd.com%2FT%2F&amp;amp;data=3D04%7C01%7Crajneesh.bhardwaj%40amd=
.com%7Ce4634a16c37149da173408d9c58d1338%7C3dd8961fe4884e608e11a82d994e183d%=
7C0%7C0%7C637758031981907821%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3Dh0z4sO1=
9bsJecMqeHGdz%2BHZElKuyzK%2BW%2FMbLWA79I10%3D&amp;amp;reserved=3D0</a>
I pretty much limited the scope of the change to KFD BOs on mmap. Regarding
CRIU, I think its not a CRIU problem as CRIU on restore, only tries to
recreate all the child processes and then mmaps all the VMAs it sees (as pe=
r
checkpoint snapshot) in the new process address space after the VMA
placements are finalized in the position independent code phase. Since the
inherited VMAs don't have access rights the criu mmap fails.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">Still sounds funky. I think =
minimally we should have an ack from CRIU
developers that this is officially the right way to solve this problem. I
really don't want to have random one-off hacks that don't work across the
board, for a problem where we (drm subsystem) really shouldn't be the only
one with this problem. Where &quot;this problem&quot; means that the mmap s=
pace is
per file description, and not per underlying inode or real device or
whatever. That part sounds like a CRIU problem, and I expect CRIU folks
want a consistent solution across the board for this. Hence please grab an
ack from them.

Cheers, Daniel</pre>
      </blockquote>
      <p><br>
      </p>
      <p>Maybe Adrian can share his views on this. <br>
      </p>
      <p>Hi Adrian - For the context, on CRIU restore we see mmap
        failures ( in PIE restore phase) due to permission issues on the
        (render node) VMAs that were inherited since the application
        that check pointed had forked.&nbsp; The VMAs ideally should not be
        in the child process but the smaps file shows these VMAs in the
        child address space. We didn't want to use madvise to avoid this
        copy and rather change in the kernel mode to limit the impact to
        our user space library thunk. Based on my understanding, during
        PIE restore phase, after the VMA placements are finalized, CRIU
        does a sys_mmap on all the VMA it sees in the VmaEntry list and
        I think its not an issue as per CRIU design but do you think we
        could handle this corner case better inside CRIU? <span style=3D"co=
lor: rgb(201, 209, 217); font-family: ui-monospace, SFMono-Regular, &quot;S=
F Mono&quot;, Menlo, Consolas, &quot;Liberation Mono&quot;, monospace; font=
-size: 12px; font-style: normal; font-variant-ligatures: normal; font-varia=
nt-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text=
-align: start; text-indent: 0px; text-transform: none; white-space: pre; wi=
dows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-colo=
r: rgb(13, 17, 23); text-decoration-thickness: initial; text-decoration-sty=
le: initial; text-decoration-color: initial; display: inline !important; fl=
oat: none;"></span></p>
      <p><br>
      </p>
      <blockquote type=3D"cite" cite=3D"mid:YcOQN%2Fl7W66W%2FX0f@phenom.ffw=
ll.local">
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">Regards,

Rajneesh

</pre>
          <blockquote type=3D"cite">
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">Regards,
Christian.

</pre>
              <blockquote type=3D"cite">
                <pre class=3D"moz-quote-pre" wrap=3D"">Regards,
  &nbsp; Felix


</pre>
                <blockquote type=3D"cite">
                  <pre class=3D"moz-quote-pre" wrap=3D"">Regards,
Christian.

Am 09.12.21 um 16:29 schrieb Bhardwaj, Rajneesh:
</pre>
                  <blockquote type=3D"cite">
                    <pre class=3D"moz-quote-pre" wrap=3D"">Sounds good. I w=
ill send a v2 with only ttm_bo_mmap_obj change. Thank
you!

On 12/9/2021 10:27 AM, Christian K=C3=B6nig wrote:
</pre>
                    <blockquote type=3D"cite">
                      <pre class=3D"moz-quote-pre" wrap=3D"">Hi Rajneesh,

yes, separating this from the drm_gem_mmap_obj() change is certainly
a good idea.

</pre>
                      <blockquote type=3D"cite">
                        <pre class=3D"moz-quote-pre" wrap=3D"">The child ca=
nnot access the BOs mapped by the parent anyway with
access restrictions applied
</pre>
                      </blockquote>
                      <pre class=3D"moz-quote-pre" wrap=3D"">exactly that i=
s not correct. That behavior is actively used by some
userspace stacks as far as I know.

Regards,
Christian.

Am 09.12.21 um 16:23 schrieb Bhardwaj, Rajneesh:
</pre>
                      <blockquote type=3D"cite">
                        <pre class=3D"moz-quote-pre" wrap=3D"">Thanks Chris=
tian. Would it make it less intrusive if I just use the
flag for ttm bo mmap and remove the drm_gem_mmap_obj change from
this patch? For our use case, just the ttm_bo_mmap_obj change
should suffice and we don't want to put any more work arounds in
the user space (thunk, in our case).

The child cannot access the BOs mapped by the parent anyway with
access restrictions applied so I wonder why even inherit the vma?

On 12/9/2021 2:54 AM, Christian K=C3=B6nig wrote:
</pre>
                        <blockquote type=3D"cite">
                          <pre class=3D"moz-quote-pre" wrap=3D"">Am 08.12.2=
1 um 21:53 schrieb Rajneesh Bhardwaj:
</pre>
                          <blockquote type=3D"cite">
                            <pre class=3D"moz-quote-pre" wrap=3D"">When an =
application having open file access to a node forks, its
shared
mappings also get reflected in the address space of child process
even
though it cannot access them with the object permissions applied.
With the
existing permission checks on the gem objects, it might be
reasonable to
also create the VMAs with VM_DONTCOPY flag so a user space
application
doesn't need to explicitly call the madvise(addr, len,
MADV_DONTFORK)
system call to prevent the pages in the mapped range to appear in
the
address space of the child process. It also prevents the memory
leaks
due to additional reference counts on the mapped BOs in the child
process that prevented freeing the memory in the parent for which
we had
worked around earlier in the user space inside the thunk library.

Additionally, we faced this issue when using CRIU to checkpoint
restore
an application that had such inherited mappings in the child which
confuse CRIU when it mmaps on restore. Having this flag set for the
render node VMAs helps. VMAs mapped via KFD already take care of
this so
this is needed only for the render nodes.
</pre>
                          </blockquote>
                          <pre class=3D"moz-quote-pre" wrap=3D"">Unfortunat=
ely that is most likely a NAK. We already tried
something similar.

While it is illegal by the OpenGL specification and doesn't work
for most userspace stacks, we do have some implementations which
call fork() with a GL context open and expect it to work.

Regards,
Christian.

</pre>
                          <blockquote type=3D"cite">
                            <pre class=3D"moz-quote-pre" wrap=3D"">Cc: Feli=
x Kuehling <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Felix.Kuehling=
@amd.com" moz-do-not-send=3D"true">&lt;Felix.Kuehling@amd.com&gt;</a>

Signed-off-by: David Yat Sin <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:david.yatsin@amd.com" moz-do-not-send=3D"true">&lt;david.yatsin@amd.com=
&gt;</a>
Signed-off-by: Rajneesh Bhardwaj <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:rajneesh.bhardwaj@amd.com" moz-do-not-send=3D"true">&lt;rajneesh.bh=
ardwaj@amd.com&gt;</a>
---
  &nbsp; drivers/gpu/drm/drm_gem.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 3 =
++-
  &nbsp; drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
  &nbsp; 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 09c820045859..d9c4149f36dd 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1058,7 +1058,8 @@ int drm_gem_mmap_obj(struct drm_gem_object
*obj, unsigned long obj_size,
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; goto err_drm_gem_object_put;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
  &nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vma-&gt;vm_flags |=3D =
VM_IO | VM_PFNMAP | VM_DONTEXPAND |
VM_DONTDUMP;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vma-&gt;vm_flags |=3D VM_IO | V=
M_PFNMAP | VM_DONTEXPAND
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | VM_DONTDUMP | VM_DONTCOPY;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vma-&gt;vm_page_pr=
ot =3D
pgprot_writecombine(vm_get_page_prot(vma-&gt;vm_flags));
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vma-&gt;vm_page_pr=
ot =3D pgprot_decrypted(vma-&gt;vm_page_prot);
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 33680c94127c..420a4898fdd2 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -566,7 +566,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct
*vma, struct ttm_buffer_object *bo)
  &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vma-&gt;vm_private_data =3D bo;
  &nbsp; -&nbsp;&nbsp;&nbsp; vma-&gt;vm_flags |=3D VM_PFNMAP;
+&nbsp;&nbsp;&nbsp; vma-&gt;vm_flags |=3D VM_PFNMAP | VM_DONTCOPY;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vma-&gt;vm_flags |=3D VM_IO | VM_DONTEXPAN=
D | VM_DONTDUMP;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
  &nbsp; }
</pre>
                          </blockquote>
                        </blockquote>
                      </blockquote>
                    </blockquote>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>=

--------------DCNk5e0wNmrRTsbceS12SjrI--
