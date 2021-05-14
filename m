Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC8C381258
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 23:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945626E2B6;
	Fri, 14 May 2021 21:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D50A6E2B6;
 Fri, 14 May 2021 21:01:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jL/nnAQnKx3agrMsGEF1Ua9t/RZ8DU/9mepk35gAm4ljnR1jT40R4ZXA6Vqj02WJXuJTMNvfTQ6aci8DwFsDgysBRgGjxOO3rDgcTUvBAc1VX2HJybRhA7JPq9xIAKKFa3xy91XG/a7vKBZnskoqRFV3IQjzk7O/EMWOtRH2dmAno51dFKUmNGRhBKO7b5pIuXvVgt2WD2KGHkuHWtlSW0I4zSO7OWWI5EZtM/zZMtuL5mM+o5wJCJu8RaarLOyH0q0HLc10aFtGnud6bRvLY6KnlmddA4EYayCEmgJvCzWcttbQ2Olzf1ZYie437WTt2Nxr7+8GtxGgJ68+AXZMWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMUt6FN3MHPjboy4Z9TaQIR8HVobamTQMEfDXL0X/y4=;
 b=hSCKsBwTCyQtKa8hlJ/lRMC38RdtxHvZitzg4qITAGxM2FMW24lCBQpPHdItAtWI82ofY96RNKLRg9VBQKaDJjbjMS1pd4U6FgQ4aYYJV+qHolYK4SjqDlsmaMVlCklc2xcr8710nsZVp4ixkRxOiRnuwXJsPgIfUb9JnrgDKbqQ73EATTySSBJCz3YQUADbLAbuTfT+VVqEeOe+B61VbQe5HH5BMNkMRO1S6SFZSwlKFyPdrM//g6xEKJB69CoNKFMY1TBTMy3ToemERl6FFQhQ0icuaL7aGTfIRepBsXRVWRwBWsk6WR4MWBYgrSgoKJDe81L4hExPjR/GBhEk3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMUt6FN3MHPjboy4Z9TaQIR8HVobamTQMEfDXL0X/y4=;
 b=OrVwQW7b1fugG1E818csy9qUcxYbblu3xRAGdfcLkm2NS7Qj4KcKYeutyyQ4ZJmeDCptej5q8aqUOngmT7ar36468++i7f6zWYMFWqSRjDckOOMB4Gyif7R05YZGmueOiihPYDR3wWmb9/UoEk5As9AYZlJflXMJbEHDpDDek70=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW2PR12MB2475.namprd12.prod.outlook.com (2603:10b6:907:3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 14 May
 2021 21:01:38 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::c476:9fdf:664e:4f25]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::c476:9fdf:664e:4f25%4]) with mapi id 15.20.4129.026; Fri, 14 May 2021
 21:01:38 +0000
Subject: Re: [RFC PATCH 0/3] A drm_plane API to support HDR planes
To: Shashank Sharma <shashank.sharma@amd.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210427175005.5b92badc@eldfell>
 <ba369002-69e9-15d5-323c-1923ecdeda63@amd.com>
 <20210430124358.1f5ac6ec@eldfell>
 <82a1c8e6-a7d6-bff3-fae7-f2a3dc68f9f7@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <2ba212c5-d30f-9f9c-3f98-ac27f214a9be@amd.com>
Date: Fri, 14 May 2021 17:01:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <82a1c8e6-a7d6-bff3-fae7-f2a3dc68f9f7@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YQBPR01CA0098.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::34) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YQBPR01CA0098.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:3::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.30 via Frontend Transport; Fri, 14 May 2021 21:01:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a956a1c2-f4dd-47c3-cc5f-08d9171b771b
X-MS-TrafficTypeDiagnostic: MW2PR12MB2475:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB247586FC6E7AB6C02171D6268C509@MW2PR12MB2475.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cc+GczcPMJbvvTkNwfUmIsKhDNqeHlKWs+MDUPx2ZGgA8A9CDVSe5EPtT0kh5+Au6ia2FLORsDfkpBKnk6JSlEjtd2ns5nwG9beCT0aFIrmbrLmCpNNgHKmJI6BJVyQGyJKQ7Jlekgf7nt/F/krEAqx+lcQLirJjFsQFmrhv54j+cU7GHeY24gYwQM5U/nRZDqhxQWpPKEQUtb3+RurutnPQOTmGW3xK1zJluWvJE5RwbrEua8aJcOy1MALRZmyh0JheZ7U/XT+EL/4Cd07PMLOtn2YWG7UGu97y1PUlZE/4+CnGVKVckDN4tRSdX7E3xQsEe/0qBmsU0XF78w2MfWs0Z2v9sMgnlK1AQ4krokj7HA+D2gxVQEXEYxi0RMyV9I9OgogoRezKZG9KEzSv+KwOdm8RtpWrZh4xDR0ScgidYKu69pIWg3tWYYCXqjLRkZKSuAp3MDXxJGeIhQSrsaLvHe4IMhgArN1pqvRJJ0kAHPVlRTT2/tKFMS5nDQpFjy18bqYLZJOu2DxAJh81kiyLFVJord8OLDPdtLhU2n4ySR/EySVeqofpOVRPCQ2HDSFifPnz2I4aKA73qFkMqwKc6kt4GPAePi1DUfGmCMEseGIlwH1JXQeFeJA+bNYFm01Z28mwM4t3iZrP6ouzn8YB3OSx6PS/z0qH1+bGOkkydzSMb0dCa1+QJzBs4Pm+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(44832011)(8936002)(956004)(31686004)(8676002)(36756003)(2616005)(316002)(6486002)(110136005)(86362001)(16576012)(5660300002)(6666004)(16526019)(53546011)(2906002)(26005)(31696002)(186003)(66556008)(478600001)(38100700002)(66946007)(83380400001)(66476007)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MTZ2eVh6TXlPTjRmSWhCUGpBc2VMeW8yZFVDUW9qaDVaTWJ5UHI3ZllqU3Y0?=
 =?utf-8?B?Z21NWmtBWGhvbGIrSTZsVUZsMmJnempVaFlkTG9DaWVneGhZTjd6Zm1Ta0hV?=
 =?utf-8?B?MEJQQitWazgxbFI2VFFUSElLM1prSTdSR0F5cENvdVRxN3E0L1dyRVpPT2sw?=
 =?utf-8?B?dXVmQ3paWDFjUGk4MU1OWjVwb3VoS2NacUl4SjI5TnFZVFlwb001ZU1aa2VX?=
 =?utf-8?B?OEJoSDh5L3VNZnRuYW83MCs4TkdTTTU0L0FHTitZWndnT3pubFdEaHdXdWpp?=
 =?utf-8?B?RzNnajhDRTVrNlNTa3ZxMThFM1NpQ0UzdWRqL2IwTFkwMmZnU001WnlKU3Zq?=
 =?utf-8?B?bkFPQkdENTl3VVR5RHBTTnpYV3QxQlJHeHRWRjJYNStJS0p6SVBaZkhpbXJk?=
 =?utf-8?B?UDN1QUtmcENDeWQxL0NmRThwRVh6RnZJNWEyUVZqRVY0TDZXY2NRSnlLZVhU?=
 =?utf-8?B?eEJNNHd6aFFuQUFZbStVcnJZaEE3N3Y5VUxxOHNhMUVoV3dkaXE3MlBWNkFW?=
 =?utf-8?B?RWdBclMyQUlGblQwU0htVHZVRnY4L0FLM3VwQ0NETHpFN1Yxb3ZqVUk2MmUv?=
 =?utf-8?B?NmNaMHdCeW0ybTNNU0QwblFKYzBDOG03VVNVdmZ6a1IrNzBIVGlzekRyNEZo?=
 =?utf-8?B?RXFlTFpaNkdNNGo1NVc2bDBjdXQxVTh1cHMzTmVCanZpUW5qZ0RadE1MQnp2?=
 =?utf-8?B?SHhlU2Q0OUYzenNrdzZyai9YK25pZHFGeisvZWd2TGgrSFB2SUt5RVQ5dHAx?=
 =?utf-8?B?MUx3MW10K2hCUFVjZEVEemZrR2s4TDY2VFdsTHh2Y1F5NHR5Q0s1dHdBQVJO?=
 =?utf-8?B?dGlOVkdyRmI4c2pBOU5PZEdFYTBUWlFlNHhENEtud0JIZk4rMG5MVmtNbHdj?=
 =?utf-8?B?YkFSOU5aZlZhL3RwdVZQS0h3SVZ0QWlIdmhoVzE3RDBPd010YXdob0hXeG9m?=
 =?utf-8?B?L3o0ZVhPaTFBemJmOU44T0ZjM2xCUWJXa0U0OUZpc1R5a0lFZ0JMTmQvNWZP?=
 =?utf-8?B?RDdpOXdtY3l5VXN5Q2o4aWxqb29WeUFPcnhYVlhOdzBWMFRmdFlvaHkrbTdN?=
 =?utf-8?B?d1BscVBoSXhJZ2ZrNTRNdy9SMGNic3Bsa1hKazB1U2FQbi83QVJDMWR1S0pM?=
 =?utf-8?B?U0orSFVJSzM2c3IxN1NrTHpvNlBreitvYW96WnRKTmVxWWNoWkhJZks2Slo1?=
 =?utf-8?B?bTFsUlRNR3RuaDU1clp5WUtub1BUakxkUVJyK0lBb1kyRlZFdHRtZW95RVB6?=
 =?utf-8?B?cWJ1dHRYblFwaC9DOC8zd3VJMXdEZjY1SGovQzMvbkVhdm1nbFh5QkJuOS8z?=
 =?utf-8?B?WW5SaEsyd0trMnBrMy8rZkROV3MxM20wLzNGUXZQN1BpLzBsRkJhYVBXai9w?=
 =?utf-8?B?T01hSm5HUTR4Z2V0ajFIZmZxVVlIeUx4eFRxY3ZUaSt6dGF0bktkZFR2M1pU?=
 =?utf-8?B?bG1hL1Q0YmluaHdMaGNBVzZRLytZaWR0ZHpldzVGOEdzU1dUZ1B2dnhIS21G?=
 =?utf-8?B?OTNXOE5VOVlWV3JtSVc0NUxaMUZkMk5ibFJPR3I1VjgydVhKek5KaEY0b0hz?=
 =?utf-8?B?ak9sZXBrMjNHN0tyVUFXSnNIYkE4RWowL0NqNDJxSTliZEZQMExHNDYrbXps?=
 =?utf-8?B?Ty9kZXRsM3dWWERHSjJjVXlXMVJjU2NEV2dwWWNyS0tnb2lhM0tGVVBPNzJs?=
 =?utf-8?B?Zy9SQU5FMlI4Q3JCdGtoTGozUFJJaXd1SFFOMWlNMTZTUi9nWVE2WGdiTGVV?=
 =?utf-8?Q?gB2zdhm5gCxLWlRGM3oXnABjeCQR1VngqnSVENJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a956a1c2-f4dd-47c3-cc5f-08d9171b771b
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 21:01:38.3823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZuiuHJOPHtShQaHjMP+HSBFRNpPeMetMrRQ5jtEgPSg67C1IIW0NPuxAKHCZPbTYo1Mjm8Uoq0ENT8xnSEzzEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2475
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, mcasas@google.com,
 dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 sebastian@sebastianwick.net, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com,
 Bhawanpreet.Lakha@amd.com, Nicholas.Kazlauskas@amd.com, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-04-30 6:39 a.m., Shashank Sharma wrote:
> Hello Pekka,
> 
> On 30/04/21 15:13, Pekka Paalanen wrote:
>> On Wed, 28 Apr 2021 13:24:27 +0530
>> Shashank Sharma <shashank.sharma@amd.com> wrote:
>>
>>> Assuming these details, A compositor will look for DRM color properties like these:
>>>
>>> 1. Degamma plane property : To make buffers linear for Gamut mapping
>>>
>>> 2. Gamut mapping plane property:  To gamut map SRGB buffer to BT2020 colorspace
>>>
>>> 3. Color space conversion plane property: To convert from YCBCR->RGB
>>>
>>> 4. Tone mapping plane property: To tone map SDR buffer S2H and HDR buffer H2H
>>>
>>> 5. Gamma plane/CRTC property: to re-apply the output ST2084 curve
>>>
>>>
>> ...
>>
>>>  *
>>>  *
>>>  *
>>>  *             ┌─────────────────┐             ┌─────────────────┐           ┌─────────────────┐       ┌────────────────┐
>>>  * HDR 600 Nits│                 │HDR 600 Nits │                 │HDR600     │                 │HDR500 │                │ HDR500
>>>  *   ────────► │  Degamma        ├────────────►│  Color space    ├──────────►│  Tone mapping   ├──────►│  Gamma         │
>>>  * BT2020      │  OETF ST2084    │ BT2020      │  conversion     │BT2020     │   H2H           │BT2020 │  ST2084        │ BT2020
>>>  * YCBCR420    │                 │ YCBCR420    │ YCBCR->RGB      │RGB88      │   600->500      │RGB888 │                │ RGB888
>>>  * Non Linear  └─────────────────┘ Linear      └─────────────────┘Linear     └─────────────────┘Linear └────────────────┘ ST2084
>>>  */
>> Hi Shashank,
>>
>> I think you might have degamma and color model conversion reversed, or
>> is that a new thing in the HDR specs?
>>
>> Usually the YCbCr/RGB conversion matrix applies to non-linear values
>> AFAIU.
> Ah, that was due to the Gamut mapping block. You are right, color format conversion can happen on non-linear data (doesn't mean it can't happen on linear), but in the sequential block above, there was gamut mapping (color space conversion), which needs to be done on Linear space, and I was a bit too lazy to create separate blocks, so I just re[placed the block titles  :D.
>> There is also confusion with OETF vs. EOTF. I got that initially wrong
>> too. OETF is not just a name for inverse-EOTF but it is used in a
>> different context. Though here it seems to be just a typo.
>> OETF is inherent to a camera when it converts light into
>> electrical signals. EOTF is inherent to a monitor when it converts
>> electrical signals to light. Depending on what the electrical signals
>> have been defined to be in each step of a broadcasting chain, you might
>> need OETF or EOTF or their inverse or a different OETF or EOTF or their
>> inverse.
> 
> Yes, that was a typo. The intention was to call it inverse curve for HDR encoded buffers. It's almost 4 years (and 2 companies) since I last did HDR, so I am a bit rusty on the topic ;) .
> 
> - Shashank
> 

Thanks, Ville and Shashank. This is indeed helpful. I apologize for the late
response but I needed to take some time to do more reading and internalize some
of the HDR and CM concepts. I will send out a v2 of my patchset but realize
that it is only a small step toward the right KMS interface for HDR and CM.

Harry

>>
>> As we are talking about displays and likely assuming display-referred
>> content (not scene-referred content), we probably have no use for OETF,
>> but we could have several different EOTFs.
>>
>>
>> Thanks,
>> pq

