Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFB946D82B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 17:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD39573CBD;
	Wed,  8 Dec 2021 16:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC9F73CB4;
 Wed,  8 Dec 2021 16:29:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBS5N/qTT0U6Zh5wNah8L1JJivXBwiCPLrLuztrdjrP9pdClgzVvWgUMKA9aAQzKVPIp9wV+pTTal3rqj573NEfBYhpikr37UijWajOUym/MY7y+ju6OgBswOQo0ML/PCDvvlhAie7qXVVHFYOzJaEO9Zrq5m2bnGMeqoiiA3ux9/34ZC+bHet0UEJvWTr//ofMkK5qlwU6jigsv5Ae9WoFyJR+tDbnNaKVT9Aca1NcHOrrK6HNsQpAfNmFTLxZlVmvFnhPz7ObapN7jUcug7KDywxEaXLn65Y1mlvnNn1JGLg+HjaT2/UzVMTkr0FtdeeNa2ZfEiItYxsSutkpd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hzlYm14aCGyIG/6K8w/1BIUfNbvyyamQodUb2ukU64=;
 b=bHJ4ObjCdvvucrHA7bXhABFW4E1eg9sm1K+mcowmKyBj7b4tQT6CP0K5Ksj/T8zF12MGpm04dKvoPsD34joxgdgSEMJjLE/K1CE/vCmWyydp64d1JWTt9xzebnrRHymnZj6ISVOuCWcRdfLU5KWxvtA3HkxnQLtI96UgBIdVXlF+nbXhPrWK5FHxAcfwOaEAdfttPj9yI0rQp9QsQSo2yghwWOBrua+W+BDR/30rxl5Qt0ynj7UroPy4hNsc4+uNgegNZLwGgcPsVv0OZCTmYkebBDm6g3US/Agudr5XZ429eV1c9SMLacpYcMSH37yNPLdDmAspyZFl4qrM9EP7Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hzlYm14aCGyIG/6K8w/1BIUfNbvyyamQodUb2ukU64=;
 b=VgAErjKniFMPfiZT0ocSUyYaOvrtiV9YZ3Soglcdsd2bXLoB8MG1T8i+Yk0JD8ibIMqZf6B4/ddk7bJ6mGZqGLVam9EnxepwQcYyd3siV+v5re4apb4dGXBYqOBzRn+GaWQkvpowNW/gP1AOxilg9zoVa6w0+6VNC+OFM6FZJ9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2896.namprd12.prod.outlook.com (2603:10b6:208:ab::22)
 by MN2PR12MB3630.namprd12.prod.outlook.com (2603:10b6:208:cc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 16:29:35 +0000
Received: from MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::44f7:66fe:4419:d8d3]) by MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::44f7:66fe:4419:d8d3%7]) with mapi id 15.20.4778.011; Wed, 8 Dec 2021
 16:29:35 +0000
Subject: Re: [PATCH v2 6/6] Documentation/gpu: Add amdgpu and dc glossary
To: Yann Dirson <ydirson@free.fr>
References: <440031901.40973395.1638980185274.JavaMail.root@zimbra39-e7>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <c78ab5cf-0c76-c055-fe40-94b693529144@amd.com>
Date: Wed, 8 Dec 2021 11:29:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <440031901.40973395.1638980185274.JavaMail.root@zimbra39-e7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::8) To MN2PR12MB2896.namprd12.prod.outlook.com
 (2603:10b6:208:ab::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41addd3a-c44e-4330-5180-08d9ba67ebe8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3630:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3630730D8BADA63CAAC208AD986F9@MN2PR12MB3630.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QOvyoyz2YlkrRyzorDmFc7xuXR8QDHZdBfDX79Cr3Gnj95EsjUvz7VQcIHT0fnW4zumLUjXyvfnjOpYUsgzKot37NIMDXGtTrzAhxnI0Ak1fhw9PaBobtNiAwJslhP5icZJSM7haOUCUNgi/Rxm/k2xTqyZtttSziULRg+OUph7gJ1NLvfpWCO9slSwf4TKTtO98nakO9MEkt61VW8toU3Y5dXHDGJvg40dBL/yf9IsKttfFx07fswGCIJD4HSbKfGJ1z6qrfWgSNDMmtvaWNsIXdin11GHu29T6wsJ+zc/M6BPMQeW+8RI+Y3NWG9vPgYwg3q2rH7ZtMdtCyGEk2SHfCVxFYwi/tOUAGT6x8gx5896ivRo32YGsQr5yznF0IOko5mqa5ZJpdGIz51ceqsuytYciHQbE9RaQH2hchJMPY0Z0+3msDpAEzXi92ELeWQK8+n1fXKK/YXPVYVgkiP/yrJFGpzohjZcCTOL/UZw8ZNaRMRci5cNtMylFz8nz5dHuM5lfqX6s31894dWnahoeiD4zVW7JAGIKD/6GAZA28MJxQrn+Wgiyy0yl74yfwt5wmW6cXPr6D1Z2BvIjF/qBzGNyqIA5imBcPxvDlAgGpYQpBwGLe9urTxsJqCnO4Wailihj94O/wDqMguqCNEB9M0kk005rMDNTEq+HIp6KZK0Pxy0wtHGBbtxoHz8bCclQIj5ONQoceFGmzTKnPzZcyVaVRMW3WmSJoq01Q3ngXpvvf6yKMwv2VJbIQ0nXExkBNCejiimufBjBjqn0b3K2iULEx1dy6FSSViEvw7FGUKZmQQpRBeYd33LFu4W6BXxu9n9CzD+Vn9Nxr+LNrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2896.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(6486002)(54906003)(8936002)(7416002)(8676002)(31686004)(38100700002)(6512007)(36756003)(2906002)(186003)(6916009)(6506007)(53546011)(66946007)(316002)(66476007)(31696002)(2616005)(4326008)(966005)(66556008)(508600001)(83380400001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFVBbGVWOGYrVzg1a2dsbm0vcndSdURoeFFlWnpxc0RXdGNYK0x4MDRkQlla?=
 =?utf-8?B?TVVrbVVSc0MxemVJS3hXN09UODhXa29PdVJ5WGJMN2I2dlcwY1VwbnBnZzRB?=
 =?utf-8?B?Qk5qakxSa01MUTZMMEU3Y2RXamxrclZ2UXJPQnkwbEJrcExFWkdvM2kwaWJH?=
 =?utf-8?B?czFERy9NVzZkOW02dldGUEpJVUVCZ3dheHlLeVNIOXladnM2dFYrNGZnN21M?=
 =?utf-8?B?VDJ1N3RLNGVTMXRRZmZlOUliVFFZWFROUEtxajZQdjd3MDJGeHM2ZFlvR1NM?=
 =?utf-8?B?Y0gyWTBZempRMkZWb0I1Z21lbDZ4c3hLaWdkM1ZMdjd2aHRkMnJpUUlieGVN?=
 =?utf-8?B?c0h0Q29zaXRxMjArT2pnWVAvdkF1endsZitBSDV5dWtETWd4amxMTlNCWElB?=
 =?utf-8?B?TWpTRTg0clY1Q2NDTkVMSnpSVnE3Zzd0aHZwVmtFODIrQjZ2dzI3TzRMSHlT?=
 =?utf-8?B?ZkdvaW1zRG9jSUd1bVY3QmNJaFp5aWc2clNLdy8zMnFvV1ZnTHM1KzNjT3Fh?=
 =?utf-8?B?ZVdUZTkwTFgrZWtoVEhsQWkwWkljOWdwa09BTVgwaldiRmpnbEZNb3lSS1Bi?=
 =?utf-8?B?dEcvWmNDMkFISEd0QzNQZG5EbWJlWW9uZ0I5TTNhb1Radmk3WFZBekpLVGxZ?=
 =?utf-8?B?bzVZZDBCd25TU2VDUm1VakxtNTliclVJeC9YTnY0Nm5GVThqbHQ3clFIRjlI?=
 =?utf-8?B?clN3RGk0K1lNeTJDU2dTYzhWbHpGN3piT1E2Mm81MEs5SUJJcU9aRUZoMno4?=
 =?utf-8?B?N3hqcWphN3hPV1lBQnRCRTdEWEw2cTY2S3c3bkpKdjFDbHVRNHlBTGUrM3hl?=
 =?utf-8?B?dDQxRHRCVE14WnM5eFBkcjJGRE9xcnFuVjBvSTk0R0hkUURYMEIxN0U3ZzBU?=
 =?utf-8?B?VkJrNDhwSnpPRVNVK3M3RDhqckNkYXZDTWd0RXRkTElkRGxDSXpYMkZDYXBt?=
 =?utf-8?B?b1RWMzJ1bWF1eEkzUUZ1aG5GOVZNZEtqVmtQT2piUzJnSFFOL3RlMkJnZ1By?=
 =?utf-8?B?ZHVray9yNEY4VnJuMElROVhJbUZhTWYwaC9LbWRRdWtaWjdRdUMvUEx3V2Ux?=
 =?utf-8?B?WTM2d2JyeFFpZmRjMzMxMWM2eUl3NTR6NUdsZk83SThvcmtaVyt2RU9tRDFV?=
 =?utf-8?B?ajBVeGxmSVd0Snc1ZzlxZGVQeWpEN2FhbU5CdXpsTGVBSTl4VExFeDRLekJP?=
 =?utf-8?B?RXBGU2s1SEwwbEo4VXR2VmZFMG5XNjV6RHNsczhXRy9GclVIcnNJWWxFZU9j?=
 =?utf-8?B?RS9ud01JYjVtTnpxRm1YNzFxTE9DaStXbTlxazZNMnV6TXJ4QTFFaXBKNjlu?=
 =?utf-8?B?YlVFV3ZlTzZkc3NXa21PQlFhVFFGTXdmSHNPQW9ZTDd6TzV5L2ozbDQxNjZm?=
 =?utf-8?B?UWlvT0JIWnJPSlMyL0p1b3N3K0tiQWdmcTlUNW11NnlsNnlIQTUweDN0K3hm?=
 =?utf-8?B?WVE5QVIrUFlYWFFFWXE5WGxsaHFBVDhwU3BWNHIvK2RTUVQ1Mm1DSGxNL09q?=
 =?utf-8?B?M25qYTliWHRJaCs5YitMTGtzNGhQYmpHZWNINGZNUXV0SU1WUTJDdFF4Z2I3?=
 =?utf-8?B?NUVIeUltZ3pmNm4zTW9ORXhBRXRydDF5WTBPcUlzUktDOGNGdXh2akdIYTN0?=
 =?utf-8?B?eVRuS2ZMb3ppSGVmSHBQdUpodURUdENOQnEyZGlrbkRGcWdHK0FpNVlqY0sr?=
 =?utf-8?B?TVN1Q05aQjQ4RFd0V0xRNVRZaXZZTGcvT0ZLUFBZUldSZ3pqWjFlTjFkbHNi?=
 =?utf-8?B?d2ZtWXB6YVpTRS9MWEF0aDMwVjc5N2FTUklUR0hzTEtmazdVRzFrWEkxV2ND?=
 =?utf-8?B?Zm1OS2NLSzNwVWhkTzJHYk1WYmZzTTNQQ212VVB3eGh6ajhZZTIzZFVlSFd1?=
 =?utf-8?B?cUlJTVlvVUpta0pvWU45TStJcEFyV0liQkdMK1kvam1pZFJlMlNWY3FrRTZ2?=
 =?utf-8?B?d1ArbnY3N2JQRDF3OHBvSjFLdm1jTnFLY2ROM0hFWDdVZEpvalRzdzZoYmFQ?=
 =?utf-8?B?QU82TnVhS3Fxd21QWTJpN1h0dlNCRnZMYk1UWDk1U2xIdVJoTm1aNzVQMEZs?=
 =?utf-8?B?SlJZMXBTTlFMQzlScldtQjZocjhEU0VpUVVrbnlXaEZPV1Jab3dHTytrN1Bl?=
 =?utf-8?B?QlI1NXFMemhwQ2lGcGQ4bHV1eFdQTjdHRG1kckRZSUQ0OHRFV1ZJbjVwM0ZH?=
 =?utf-8?B?L1lzVG1lT2NtKzhwWm5hdmhybXhjdkpTdklVQ1NvTHYvb20ydDJSWGRsbXFs?=
 =?utf-8?Q?GCfnImP9z19V9m0rxQDUiiXrcjafHCJIn7dnuSgDVs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41addd3a-c44e-4330-5180-08d9ba67ebe8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2896.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 16:29:35.6801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NRAG7C6h2BGWf/nlFcKKCuy4wHSVLcUKRNeZN3AmfYqqUpA5MlsbJwr5Ec08fpiZrnMDAL/q0alE2WSZrgskuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3630
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 aurabindo pillai <aurabindo.pillai@amd.com>, Marek Olsak <marek.olsak@amd.com>,
 Michel Daenzer <michel@daenzer.net>, Sean Paul <seanpaul@chromium.org>,
 bhawanpreet lakha <bhawanpreet.lakha@amd.com>,
 Mark Yacoub <markyacoub@chromium.org>, qingqing zhuo <qingqing.zhuo@amd.com>,
 roman li <roman.li@amd.com>, Roman Gilg <subdiff@gmail.com>,
 nicholas choi <nicholas.choi@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-12-08 11:16 a.m., Yann Dirson wrote:
> Hi Rodrigo,
> 
>> On 2021-12-07 2:49 p.m., Yann Dirson wrote:
>>>
>>>> On Thu, Dec 02, 2021 at 11:01:32AM -0500, Rodrigo Siqueira wrote:
>>>>> In the DC driver, we have multiple acronyms that are not obvious
>>>>> most of
>>>>> the time; the same idea is valid for amdgpu. This commit
>>>>> introduces
>>>>> a DC
>>>>> and amdgpu glossary in order to make it easier to navigate
>>>>> through
>>>>> our
>>>>> driver.
>>>>>
>>>>> Changes since V1:
>>>>>    - Yann: Divide glossary based on driver context.
>>>>>    - Alex: Make terms more consistent and update CPLIB
>>>>>    - Add new acronyms to the glossary
>>>
>>> If you're rerolling, it could be a good time to include the
>>> additional
>>> (and detailed) entries from Alex's answer to "Looking for
>>> clarifications
>>> around gfx/kcq/kiq".  Finding a way to fit the other details not
>>> fitting directly in the glossary will likely take more rounds,
>>> though,
>>> so we can wait for the first round to be merged before dealing with
>>> them.
>>
>> Hi Yann,
>>
>> I will send another version to address Daniel's comment, and I'll
>> also
>> expand the amdgpu acronyms glossary based on your mail thread with
>> Alex.
>> However, I don't want to add more details about that discussion in
>> this
>> series because I don't want to lose focus in this patchset since my
>> main
>> goal is to start to expand display documentation.
> 
> fair enough
> 
> 
>> By the way, I think you could consider writing a kernel-doc based on
>> your discussion with Alex. This way, you can try to consolidate what
>> you
>> discover and get reviews in the content.
> 
> that's the idea, though I'm not sure I have enough material to start with
> yet :)

As you know, right now, we have zero documentation about that, which 
means that if you add something, it is an excellent improvement in the 
current status :)

>>
>> Thanks
>> Siqueira
>>
>>>
>>>
>>>>>
>>>>> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>>>> ---
>>>>>    Documentation/gpu/amdgpu/amdgpu-glossary.rst  |  47 ++++
>>>>>    .../gpu/amdgpu/display/dc-glossary.rst        | 243
>>>>>    ++++++++++++++++++
>>>>>    Documentation/gpu/amdgpu/display/index.rst    |   1 +
>>>>>    Documentation/gpu/amdgpu/index.rst            |   7 +
>>>>>    4 files changed, 298 insertions(+)
>>>>>    create mode 100644 Documentation/gpu/amdgpu/amdgpu-glossary.rst
>>>>>    create mode 100644
>>>>>    Documentation/gpu/amdgpu/display/dc-glossary.rst
>>>>>
>>>>> diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst
>>>>> b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
>>>>> new file mode 100644
>>>>> index 000000000000..e635851025e7
>>>>> --- /dev/null
>>>>> +++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
>>>>> @@ -0,0 +1,47 @@
>>>>> +===============
>>>>> +AMDGPU Glossary
>>>>> +===============
>>>>> +
>>>>> +Here you can find some generic acronyms used in the amdgpu
>>>>> driver.
>>>>> Notice that
>>>>> +we have a dedicated glossary for Display Core.
>>>>
>>>> Maybe add a link to that here so it's easier to find? sphinx
>>>> autogenerates
>>>> header targets so pretty easy (if the heading is unique at least).
>>>> -Daniel
>>>>
>>>>> +
>>>>> +.. glossary::
>>>>> +
>>>>> +    CPLIB
>>>>> +      Content Protection Library
>>>>> +
>>>>> +    DFS
>>>>> +      Digital Frequency Synthesizer
>>>>> +
>>>>> +    ECP
>>>>> +      Enhanced Content Protection
>>>>> +
>>>>> +    EOP
>>>>> +      End Of Pipe/Pipeline
>>>>> +
>>>>> +    HQD
>>>>> +      Hardware Queue Descriptor
>>>>> +
>>>>> +    KCQ
>>>>> +      Kernel Compute Queue
>>>>> +
>>>>> +    KGQ
>>>>> +      Kernel Graphics Queue
>>>>> +
>>>>> +    KIQ
>>>>> +      Kernel Interface Queue
>>>>> +
>>>>> +    MQD
>>>>> +      Memory Queue Descriptor
>>>>> +
>>>>> +    PPLib
>>>>> +      PowerPlay Library - PowerPlay is the power management
>>>>> component.
>>>>> +
>>>>> +    SMU
>>>>> +      System Management Unit
>>>>> +
>>>>> +    VCE
>>>>> +      Video Compression Engine
>>>>> +
>>>>> +    VCN
>>>>> +      Video Codec Next
>>>>> diff --git a/Documentation/gpu/amdgpu/display/dc-glossary.rst
>>>>> b/Documentation/gpu/amdgpu/display/dc-glossary.rst
>>>>> new file mode 100644
>>>>> index 000000000000..547c0bfbb3e2
>>>>> --- /dev/null
>>>>> +++ b/Documentation/gpu/amdgpu/display/dc-glossary.rst
>>>>> @@ -0,0 +1,243 @@
>>>>> +===========
>>>>> +DC Glossary
>>>>> +===========
>>>>> +
>>>>> +On this page, we try to keep track of acronyms related to the
>>>>> display
>>>>> +component. If you do not find what you are looking for, look at
>>>>> the amdgpu
>>>>> +glossary; if you cannot find it anywhere, consider asking in the
>>>>> amdgfx and
>>>>> +update this page.
>>>>> +
>>>>> +.. glossary::
>>>>> +
>>>>> +    ABM
>>>>> +      Adaptive Backlight Modulation
>>>>> +
>>>>> +    APU
>>>>> +      Accelerated Processing Unit
>>>>> +
>>>>> +    ASIC
>>>>> +      Application-Specific Integrated Circuit
>>>>> +
>>>>> +    ASSR
>>>>> +      Alternate Scrambler Seed Reset
>>>>> +
>>>>> +    AZ
>>>>> +      Azalia (HD audio DMA engine)
>>>>> +
>>>>> +    BPC
>>>>> +      Bits Per Colour/Component
>>>>> +
>>>>> +    BPP
>>>>> +      Bits Per Pixel
>>>>> +
>>>>> +    Clocks
>>>>> +      * PCLK: Pixel Clock
>>>>> +      * SYMCLK: Symbol Clock
>>>>> +      * SOCCLK: GPU Engine Clock
>>>>> +      * DISPCLK: Display Clock
>>>>> +      * DPPCLK: DPP Clock
>>>>> +      * DCFCLK: Display Controller Fabric Clock
>>>>> +      * REFCLK: Real Time Reference Clock
>>>>> +      * PPLL: Pixel PLL
>>>>> +      * FCLK: Fabric Clock
>>>>> +      * MCLK: Memory Clock
>>>>> +
>>>>> +    CRC
>>>>> +      Cyclic Redundancy Check
>>>>> +
>>>>> +    CRTC
>>>>> +      Cathode Ray Tube Controller - commonly called "Controller"
>>>>> -
>>>>> Generates
>>>>> +      raw stream of pixels, clocked at pixel clock
>>>>> +
>>>>> +    CVT
>>>>> +      Coordinated Video Timings
>>>>> +
>>>>> +    DAL
>>>>> +      Display Abstraction layer
>>>>> +
>>>>> +    DC (Software)
>>>>> +      Display Core
>>>>> +
>>>>> +    DC (Hardware)
>>>>> +      Display Controller
>>>>> +
>>>>> +    DCC
>>>>> +      Delta Colour Compression
>>>>> +
>>>>> +    DCE
>>>>> +      Display Controller Engine
>>>>> +
>>>>> +    DCHUB
>>>>> +      Display Controller HUB
>>>>> +
>>>>> +    ARB
>>>>> +      Arbiter
>>>>> +
>>>>> +    VTG
>>>>> +      Vertical Timing Generator
>>>>> +
>>>>> +    DCN
>>>>> +      Display Core Next
>>>>> +
>>>>> +    DCCG
>>>>> +      Display Clock Generator block
>>>>> +
>>>>> +    DDC
>>>>> +      Display Data Channel
>>>>> +
>>>>> +    DIO
>>>>> +      Display IO
>>>>> +
>>>>> +    DPP
>>>>> +      Display Pipes and Planes
>>>>> +
>>>>> +    DSC
>>>>> +      Display Stream Compression (Reduce the amount of bits to
>>>>> represent pixel
>>>>> +      count while at the same pixel clock)
>>>>> +
>>>>> +    dGPU
>>>>> +      discrete GPU
>>>>> +
>>>>> +    DMIF
>>>>> +      Display Memory Interface
>>>>> +
>>>>> +    DML
>>>>> +      Display Mode Library
>>>>> +
>>>>> +    DMCU
>>>>> +      Display Micro-Controller Unit
>>>>> +
>>>>> +    DMCUB
>>>>> +      Display Micro-Controller Unit, version B
>>>>> +
>>>>> +    DPCD
>>>>> +      DisplayPort Configuration Data
>>>>> +
>>>>> +    DPM(S)
>>>>> +      Display Power Management (Signaling)
>>>>> +
>>>>> +    DRR
>>>>> +      Dynamic Refresh Rate
>>>>> +
>>>>> +    DWB
>>>>> +      Display Writeback
>>>>> +
>>>>> +    FB
>>>>> +      Frame Buffer
>>>>> +
>>>>> +    FBC
>>>>> +      Frame Buffer Compression
>>>>> +
>>>>> +    FEC
>>>>> +      Forward Error Correction
>>>>> +
>>>>> +    FRL
>>>>> +      Fixed Rate Link
>>>>> +
>>>>> +    GCO
>>>>> +      Graphical Controller Object
>>>>> +
>>>>> +    GMC
>>>>> +      Graphic Memory Controller
>>>>> +
>>>>> +    GSL
>>>>> +      Global Swap Lock
>>>>> +
>>>>> +    iGPU
>>>>> +      integrated GPU
>>>>> +
>>>>> +    IH
>>>>> +      Interrupt Handler
>>>>> +
>>>>> +    ISR
>>>>> +      Interrupt Service Request
>>>>> +
>>>>> +    ISV
>>>>> +      Independent Software Vendor
>>>>> +
>>>>> +    KMD
>>>>> +      Kernel Mode Driver
>>>>> +
>>>>> +    LB
>>>>> +      Line Buffer
>>>>> +
>>>>> +    LFC
>>>>> +      Low Framerate Compensation
>>>>> +
>>>>> +    LTTPR
>>>>> +      Link Training Tunable Phy Repeater
>>>>> +
>>>>> +    LUT
>>>>> +      Lookup Table
>>>>> +
>>>>> +    MALL
>>>>> +      Memory Access at Last Level
>>>>> +
>>>>> +    MC
>>>>> +      Memory Controller
>>>>> +
>>>>> +    MPC
>>>>> +      Multiple pipes and plane combine
>>>>> +
>>>>> +    MPO
>>>>> +      Multi Plane Overlay
>>>>> +
>>>>> +    MST
>>>>> +      Multi Stream Transport
>>>>> +
>>>>> +    NBP State
>>>>> +      Northbridge Power State
>>>>> +
>>>>> +    NBIO
>>>>> +      North Bridge Input/Output
>>>>> +
>>>>> +    ODM
>>>>> +      Output Data Mapping
>>>>> +
>>>>> +    OPM
>>>>> +      Output Protection Manager
>>>>> +
>>>>> +    OPP
>>>>> +      Output Plane Processor
>>>>> +
>>>>> +    OPTC
>>>>> +      Output Pipe Timing Combiner
>>>>> +
>>>>> +    OTG
>>>>> +      Output Timing Generator
>>>>> +
>>>>> +    PCON
>>>>> +      Power Controller
>>>>> +
>>>>> +    PGFSM
>>>>> +      Power Gate Finite State Machine
>>>>> +
>>>>> +    PSR
>>>>> +      Panel Self Refresh
>>>>> +
>>>>> +    SCL
>>>>> +      Scaler
>>>>> +
>>>>> +    SDP
>>>>> +      Scalable Data Port
>>>>> +
>>>>> +    SLS
>>>>> +      Single Large Surface
>>>>> +
>>>>> +    SST
>>>>> +      Single Stream Transport
>>>>> +
>>>>> +    TMDS
>>>>> +      Transition-Minimized Differential Signaling
>>>>> +
>>>>> +    TMZ
>>>>> +      Trusted Memory Zone
>>>>> +
>>>>> +    TTU
>>>>> +      Time to Underflow
>>>>> +
>>>>> +    VRR
>>>>> +      Variable Refresh Rate
>>>>> +
>>>>> +    UVD
>>>>> +      Unified Video Decoder
>>>>> diff --git a/Documentation/gpu/amdgpu/display/index.rst
>>>>> b/Documentation/gpu/amdgpu/display/index.rst
>>>>> index fe2ecad8df81..e23c752ee5f5 100644
>>>>> --- a/Documentation/gpu/amdgpu/display/index.rst
>>>>> +++ b/Documentation/gpu/amdgpu/display/index.rst
>>>>> @@ -26,3 +26,4 @@ table of content:
>>>>>       display-manager.rst
>>>>>       dc-debug.rst
>>>>>       dcn-overview.rst
>>>>> +   dc-glossary.rst
>>>>> diff --git a/Documentation/gpu/amdgpu/index.rst
>>>>> b/Documentation/gpu/amdgpu/index.rst
>>>>> index 5c8cbf514097..ff38c360b04e 100644
>>>>> --- a/Documentation/gpu/amdgpu/index.rst
>>>>> +++ b/Documentation/gpu/amdgpu/index.rst
>>>>> @@ -334,3 +334,10 @@ smartshift_bias
>>>>>    
>>>>>    .. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>>>>>       :doc: smartshift_bias
>>>>> +
>>>>> +AMDGPU Glossary
>>>>> +===============
>>>>> +
>>>>> +.. toctree::
>>>>> +
>>>>> +   amdgpu-glossary.rst
>>>>> --
>>>>> 2.25.1
>>>>>
>>>>
>>>> --
>>>> Daniel Vetter
>>>> Software Engineer, Intel Corporation
>>>> http://blog.ffwll.ch/>>>
>>

