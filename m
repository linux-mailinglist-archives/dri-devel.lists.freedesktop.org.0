Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1064E3D99B1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 01:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C2B6E546;
	Wed, 28 Jul 2021 23:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D376E153;
 Wed, 28 Jul 2021 23:45:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwD6p6kfUqrKBN/B2G6EZVG7YgAMuO3W+HD8Ms4jj5Fr2ptUyVu+4IU0rGa6O2wHiVtgFEmZx7t3ohPlQ5Zz2vOTc3XRBt2eLSa/2NLpmjAA/2GjnMkmTCcm3M/abt9dCdizE8Vkug53wFFN4Us5xsdUMCRwzNJjcD3e8QFilJAZIg5OZQBzrms0OFsEH2bXwYUImk1vxOQ6Jti96QYgVyDLuFncFAj4QWD8TLyEwrSgNIIVMotlYiOM3rPVTxYmaoXVcde+WLMCxjdRtWpiC8CTF1wo/E6SP3lEjYq/5wagZfdDw2hUJpeB+f2ZAP+naLnX8Bw+uBwMSBpf2pqNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYwKUphUAfwYBiBR1PiD/B5khVNkrzb7WtXJwZap1Gk=;
 b=QHIO7+FAJyu/x5qyalULbE3oTcuIjiUJsAybapWzwLlY6GCg5rkO9MCCOxsbixJzNGTS3fCO1edQJOFeY/CvRWUN7Z6pydLkfzJYrJmQ43Pn7gMp/VlpE8iowDXJRCH8Saa+lTvVd2eM+y/cxV4q/NMAONmbbBeIklpfCuzLPxB300ScKFStCux9p7P3Y1jQyaV/Qb1vOEDIaSRTLxFbCPK7WDASGG05gUwYvRLHwxgbFQi1m6O5qnZ61JDjNWCmi/AUte3VgRQM1Z1mVWb4hhV0D/uMqyp8Km6LijPRuPFJpzhsNh6E2iODttBW35oZA+LEtL+Abz15MQI66hfZkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYwKUphUAfwYBiBR1PiD/B5khVNkrzb7WtXJwZap1Gk=;
 b=eUBjqiiAjBd6iOJonwi4qvmdS/3zBe/v4ZBCj98laCsn1htwhRR/XmxTi0NUPhovi4BHHJmEgV2Ot3J2qY4O9DxZQcPQbhh/P7PXwWQFAEtdS7RT3GMAt4yzJJg0DFD9Uj9HDpTFG8I1isUAuQmOevHLhtn/2jNlTwKH8pGU1VE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN1PR12MB2543.namprd12.prod.outlook.com (2603:10b6:802:2a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 23:45:25 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39%6]) with mapi id 15.20.4373.018; Wed, 28 Jul 2021
 23:45:25 +0000
Subject: Re: [PATCH v4 10/13] lib: test_hmm add module param for zone device
 type
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20210717192135.9030-1-alex.sierra@amd.com>
 <20210717192135.9030-11-alex.sierra@amd.com>
 <20210722122348.GG1117491@nvidia.com>
 <4ee9e946-d380-ba84-d6ac-5ad337afc835@amd.com>
 <20210722172648.GN1117491@nvidia.com>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Message-ID: <596f4387-a896-acdf-acfa-7ddba947b58f@amd.com>
Date: Wed, 28 Jul 2021 18:45:22 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210722172648.GN1117491@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SA9PR13CA0069.namprd13.prod.outlook.com
 (2603:10b6:806:23::14) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.130.82] (165.204.78.25) by
 SA9PR13CA0069.namprd13.prod.outlook.com (2603:10b6:806:23::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.7 via Frontend Transport; Wed, 28 Jul 2021 23:45:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b8359a8-ae8a-45f0-e9de-08d95221c5bf
X-MS-TrafficTypeDiagnostic: SN1PR12MB2543:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2543767A44CC8CBFF5640E7EFDEA9@SN1PR12MB2543.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MaeQGfalrISF3FFWPESpVHBi8v4xoJOioRFAEgLg9836+ADDNc2MmnvHGOJjlNZLl5sRj1Gn9EzgYb/EizieRTGppR+LcuPWqRU51J6ggtb+UPaBEkixfO69lmPYEaNtFDZM+3Y1Tm0UZ+LFWEyV1LrbxrP5NWSo/7coISKEV5JUCHIbNvVK6RyQtz49GPl45qf+SJg1DOAgVbhHBgC1CSoDuFn6Gz8OuvBbASTNDsKczh/72iq0eS7OPCAUPBL3I6MEeB4aPU8ynquKFvRA0bb5ez0BAgLm4KTDMEmJFhZeE6sTp/2r2l2kGYtHBRSxvK8EqCiBm1SuCc0RBcJdA7Vrb1AeDhUXLnHIWTjZPdJoLH52UV7646rQV/kMQmEyN/NlH6IjD9X3e+4tB8AkMPCtqw2QupB1tt1IY2IOmhR3zGW1pijOaGMIjTcZ32G9V8JTcG9XPiM/qhSdd0NN0taY55bwqDlwDEuiKCKqFsCvlc8DNCrKDNIoM+g/m/9Zqrsf5JNQrqFH9OyU5RZrSuX91l/4zAplR8BxZgIRKUSbaR88ymjkntnPhhL935e0aU8X0i81E2+38ncXcSvD8TRkR054M8pPApPEgC9i6lckEQvKLhorGQRWdNjHsREp9Lje/N21MSk7qqB4VdbkJJZ9hlO+63zrfH+b1E6puwIhC6ci0FhlmaDNKd+a8JUnDxl9R16Fh0aXRptd4EAhef7IpTVvycCfI64maPjA7FcEZ2Kh326SSfLwgERyFAGuMPD+ACepvcG/Ny8RS+Msxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(36756003)(5660300002)(8676002)(8936002)(4326008)(26005)(6916009)(956004)(38350700002)(38100700002)(2616005)(508600001)(66946007)(83380400001)(31696002)(6486002)(31686004)(52116002)(53546011)(86362001)(16576012)(66476007)(7416002)(66556008)(2906002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czN1bHAxUW52UXBoM0NDYytYVGhqcWVIcTA0Szhqa2MzU3c1VVRQVDJoeDNO?=
 =?utf-8?B?NnBQUytJWjJ6UXlmNEdnYmZ0cHM1NlhSbU96NGFJdFVaemZCMEpZdGQ4ZERP?=
 =?utf-8?B?WExpUGZYdXpISkdYelpiUWIzMjNGV3c4UnhYQnJsV0tqeXh1RWp4RWdsNThy?=
 =?utf-8?B?U011YUFyS3FSSlVOV0NUM25FR2hYOCtRZGljbFJydzE2ZTM4RG9Qb1R1T0tk?=
 =?utf-8?B?Ym91MkZLcWl1Y0sweWRYTEMzL3Evd21TaXJuVzBseTlnd3pXWHFPZWpKWS9m?=
 =?utf-8?B?VXk4NDRtZkY5L20rczBwL2ZIYVRFbW8rUmExajlETVdVc3JaNDJrVFpVdWRH?=
 =?utf-8?B?V3pRWkd5Qk1JaEd1ZUlSbDBvTXpicGc0OTY1enEzVmNRQ3F0KzBBTTlPMndT?=
 =?utf-8?B?OXBGWXp3VzRBRjRIWTRMakJzdmk2UUwvVUpiZll0bW83cXE4NGc2M2Y2a1NK?=
 =?utf-8?B?OGxwazJsVm8vZlh0aUlYdFZZc3ZBM09RWEVVSEhmaFovRUJnMWQvZWVQOTNZ?=
 =?utf-8?B?MjhtcVl1U0RxNDRCMnBCU042YnM5SEVoRGN4aWx2a2NsZFJ4a1FZS2FPOHk4?=
 =?utf-8?B?Z1NmbEt1ajcvMDBZU2ZMMktqUGtQcVVDMzBxeS9Jc2dlVFp6d1QwYWZkSGZo?=
 =?utf-8?B?KzI0dHloMTh1QWFYWm1DRnpoT2VIRVpucENKZllKSUpKaU54cSthem56elQr?=
 =?utf-8?B?SWt2a1BGOXNGbnNqT0hJY2lOcXRDRjlBVDBPdG5aRzkrZnVXMHlSdWNGdWpR?=
 =?utf-8?B?akg1Snk5SStXV3hEczA2SGdsWEszZ0l6RE80NXVYS3NxaHlEcWZ4Z1kzc0Mr?=
 =?utf-8?B?UDRnMzhPOXVmejA4M3hnczhmS1NqRnZza2VydGdZa1gvNUd4aGFmdlhYbTYz?=
 =?utf-8?B?UmRQS2FUTHhUL0hPNnBlV3VuUml0SUdMcjRkUlNUZVZMUFQ3MHIwTXFiREdN?=
 =?utf-8?B?SFJOb2xMekRKMFh2QVNzN240dE5lVEU1bW44Ky9vaVlqcWNzU3l1dnlrOFVq?=
 =?utf-8?B?eERDQTBxVElyMG5id296OVF3dnVHY3d0dlRDTDF6MG04RjZLOEwwSFo4L1JX?=
 =?utf-8?B?dTlZUEg1dlV5SkdkYW1OOHpWSzBBRlZlVEhjQjBFVk5wdXpoU2prMmd3WTlW?=
 =?utf-8?B?RS9nWHhiTE9wenNXOFUyajRTbjdoYnUyVUhpbEs3V2dOYUdIYmJVNG9TNnZ3?=
 =?utf-8?B?cmlJaUllRzFUYXZOb2lIOEtwbzRHaHpzMTFxZm0rOEhid2doNkg4S2t4SDFX?=
 =?utf-8?B?THhHcm40cnQ1ZjNxdi82c1UvTU15UTByeDdoTEQvU2dDY0haQng2c3o3c3Qz?=
 =?utf-8?B?WTV1Y2cxK0ZzUUhWZ2N4anI1NFlFMW1Fc3FSQjlHTGowVlVrLzFhSG1DeHRh?=
 =?utf-8?B?dDEzTmFYNUpvdWFzR1BhZFNYRmJES2FlQVR2MTZRQzFUeGhid0RUcWwwVUZM?=
 =?utf-8?B?S25na1FxVXlpWWoxOEd4Y0VXaFZpa21wVlp4Sk5GM0cwYVZGSE1VVXFCS2dj?=
 =?utf-8?B?azVvTDBPYWlGTkZLajUwUnVydnVXSWUvbVZTMlZ6eHM1RkFEYzBIbXlVcTJL?=
 =?utf-8?B?QnhwOThQREcxZ3FpdGEyZlNMd25zUWxzemNIMGhCY2JJWnQ5MFdjSUhiVHJE?=
 =?utf-8?B?dUdRbkVpTGZFVUlRcUt2ajJwS0EveG4rbC8vMEwyQjBVN3BZOURMNWYzcXp0?=
 =?utf-8?B?WUFWQ3lnTzE0RFIrTC92QjlEUnFpRk4zNjd4eStJRVd4TThOaXhucGk1QTVL?=
 =?utf-8?Q?lrEchzrXtPwHKNQt8nCPplCtnz4Jj58OhxE3Brv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8359a8-ae8a-45f0-e9de-08d95221c5bf
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 23:45:25.6644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uaAAOi/eVgfO/RmIq/ufNV4+xCbA9vql6aoQTcyDX1BHaU8ODKcMK4sWenPTHSsZTc8wMSaAFaqAfTR2AzS8Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2543
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
Cc: rcampbell@nvidia.com, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/22/2021 12:26 PM, Jason Gunthorpe wrote:
> On Thu, Jul 22, 2021 at 11:59:17AM -0500, Sierra Guiza, Alejandro (Alex) wrote:
>> On 7/22/2021 7:23 AM, Jason Gunthorpe wrote:
>>> On Sat, Jul 17, 2021 at 02:21:32PM -0500, Alex Sierra wrote:
>>>> In order to configure device generic in test_hmm, two
>>>> module parameters should be passed, which correspon to the
>>>> SP start address of each device (2) spm_addr_dev0 &
>>>> spm_addr_dev1. If no parameters are passed, private device
>>>> type is configured.
>>> I don't think tests should need configuration like this, is it really
>>> necessary? How can people with normal HW run this test?
>> Hi Jason,
>> The idea was to add an easy way to validate the codepaths touched by this
>> patch series, which make modifications to the migration helpers for device
>> generic type pages. We're using CONFIG_EFI_FAKE_MEMMAP to create fake SPM
>> devices inside system memory. No special HW needed. And passing the kernel
>> parameter efi_fake_mem. Ex. efi_fake_mem=1G@0x100000000:0x40000. I should
>> probably need to include a small example of how to set this in the
>> test_hmm.sh
>> usage().
> I don't think anything about hmm is sensitive to how the pages are
> acquired - you can't create device generic pages without relying on
> FAKE_MEMMAP?
The reason we used fake SPM approach was to have a "special memory"
not managed by Linux (NOT registered as normal system memory). But
also accessible by the CPU.

For device_generic we cannot allocate new physical addresses.
We need the physical address to match the actual system memory
physical address, so that CPU mappings work as expected.

Would you recommend to use a different approach?

Regards,
Alex Sierra

>
> Jason
