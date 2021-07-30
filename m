Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D9D3DBED6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 21:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE596F423;
	Fri, 30 Jul 2021 19:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB356E448;
 Fri, 30 Jul 2021 19:11:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZwS6rK08qhvOGzYnQP8/d+Ik2olJx2QqNfJZr1tJx2wBdS+N/MHVqi8TEacxj8F0WvErGe6R0Dneua5WIHWoe4nqAwC4wnzDWM59u3nfDA/LfxqkbnATOCu7XU1lj1x89/8ZyG+vcT/1zYU6+tHJAQNaDgJLhd6WasQdD0e3V34q2WhBRGp8Yx02g79KDLMxFHdjESZ6kA6KtRbD2RJy4K1SeKuCyP3WIeneY619Tn38FbDRhkoubHJY2vYX3PbEpDO9218f6N1JjMQZUKrA5Gkd4i1fV8H9iiJr/4B/TEbKpRoNCcwacxRocVrIGO9GVmsQvxNvfu1mP2Fq2NzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5UL2aBs1rKDk6BOv699L4WW7vvVFWwlAyvJig4kRxk=;
 b=AzviPWE/uhk2bkE52u30TBjZ51nMyLakfr8Jrkn+na59SH7N+lTjqHUnv5LIujgL15QrjLObWKDFV2xE7Y4fIioON3N2gEGfIzHE/mcGNibf2E+I2S1CVAaix4nj3RqKZQI/FaY1NZo17k3OYSg9BhCkVmOqwGPHMyf3biMkORwzTVUKBmk3YPeRe2npyJNPvUiwHrjF6mGVpHLFWQ/X2gIyO+qLKSaOBEmZ3mkDWwX+JFuQnQ377fZLTxuhzDUNVcjcIsi8420z2BPsX1XhBaDC+PnqTrsaxRFHAwJJAQFjWQzU48ClaLcOunoge6x53PcIaaTaCcW9IpKW7mA57A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5UL2aBs1rKDk6BOv699L4WW7vvVFWwlAyvJig4kRxk=;
 b=oQH9M3b3DD7EY8Ko9kQuUIqQCqXsamRkt5b8Wu2e0duOetucAHpgYYyl1GafTG5g/pDQk65K3t+JZOzl4FjyKcVLHfLpAO0rh2IGHtzNzau0l3lJeM2Gn3AeO+RBeK22y6LroZ++r6Lrp9s8U6d/dsaBD4xc7wo//qJ3IWc+2f0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5162.namprd12.prod.outlook.com (2603:10b6:408:11b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Fri, 30 Jul
 2021 19:11:43 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%3]) with mapi id 15.20.4352.033; Fri, 30 Jul 2021
 19:11:43 +0000
Subject: Re: [PATCH v4 10/13] lib: test_hmm add module param for zone device
 type
To: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jglisse@redhat.com
References: <20210717192135.9030-1-alex.sierra@amd.com>
 <20210717192135.9030-11-alex.sierra@amd.com>
 <20210722122348.GG1117491@nvidia.com>
 <4ee9e946-d380-ba84-d6ac-5ad337afc835@amd.com>
 <20210722172648.GN1117491@nvidia.com>
 <596f4387-a896-acdf-acfa-7ddba947b58f@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <4c931ef6-1a52-2cc8-47ff-6077377517af@amd.com>
Date: Fri, 30 Jul 2021 15:11:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <596f4387-a896-acdf-acfa-7ddba947b58f@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::29)
 To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.144.73) by
 YT1PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 19:11:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bf80507-f566-4a6c-dc73-08d9538dde46
X-MS-TrafficTypeDiagnostic: BN9PR12MB5162:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5162501381E9A12EB722E8A392EC9@BN9PR12MB5162.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aYmy+uT/0LyTPIBFiPIRdZvaJrbIwIDHr+cxzqkQjjLgTDnLSsBWjMsEBdXT2f3P/uiNPtl8iPSHXtmJdx1OmC+wvs0ERtdIgI2rKqr+i3Y3PdNd3+eYuxv4yIx6jTmripIMIIwqTuW1aSzw79E8z6asEHHfF+vExlWJTf+YcdXaoS4V700MaW0n7j6Rnur9VtLQpOsjKIyM9Te49B1f/Y6kFYn9FVtIVBcLXV7C9MfVmDwZvpOay239OuHkn8wY+2qeRbuQuO6xcipcrarZFnqy7a2qOydpW3QseegEZ2Bxi62MG8hmXdwCctslBD1bnrJXpH0Tpe7Z/w1s48DbwWTPjEJ3UkBGr/tFRPDZjFPuPc+fR8EeXuRNfgKvjIroPX2DqOAAMOGbcKUDC/D14eLRErtejWAS4/R8PlEExV8liHZFMTzC/15NLe9NrsvwJW8i7eaiX7zSYXy8UFlhsS91PhkmXqoJeDP5I5oJoVK7CDw+nCvPQae1sQwZ4Mh2F8LQyBqLx503BN5x22rLSnzVMTb8Wla8khCWzYB9MRx8fT9nDgbepSJLO1b72YNv8KkLJ7DVOZcBp/ByngJtyy0ONwc3pM2XbLYDXrQHc9w0+jowcK2qcJ6HZ5Ho1QXpyRFM3jFAmAv5GuvcMMy1+UHO/tnOhiqrgUSasV9vYiBDsbX3UDHMVW9iR7eu9N2ku3NjFHCsha7OtvUP3woUMwpDt3tkVUK89H9CrsAaYR4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(8676002)(4326008)(31696002)(53546011)(6486002)(86362001)(478600001)(110136005)(83380400001)(44832011)(7416002)(16576012)(186003)(2906002)(38100700002)(316002)(8936002)(956004)(5660300002)(31686004)(66476007)(66946007)(36756003)(66556008)(2616005)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVppbFhVMVpkOHlDcW91Um5HLzN6TVlhSjhyNWVBcXlScWtFdVh0VXNnV3A1?=
 =?utf-8?B?UUF1a1U0RHhYa3ZOLzV5aFhrekNjUURIYVR2bjV0UFNsZThuT3ZsRkRoSHFN?=
 =?utf-8?B?MmNHL1NDb0RzZ1FSS0dhRk01akwxb0pZMXBGVTd3anBDU29XTzhLUlVGaVdF?=
 =?utf-8?B?VXVTUFpnMzJMV05tOWd0Q0pIbzZML1lrckZGV0FtOGF0d3J1THd4ZlVmdUh3?=
 =?utf-8?B?dnpobWl3ZGc0aXR6N3ZENjd5d05mM2pXTDczQ3ppclpsaVNISTR5TmE3MkNC?=
 =?utf-8?B?VDhiVlY4NVpTNDk5dHpKbGVCM0Z1REdzZjdHSUpaMk1GMUxKTG4vUWpRREJa?=
 =?utf-8?B?ZFpQcU1vb2ZWYitxc29QN2QyZHRGd0p5RUZxWHAvRmwwYkFGdGZGbjlFTU5L?=
 =?utf-8?B?aVc1aVR4K0Q0ZmpVQ2tSMWtKaG4rWnFINVYzaFZZbnhmeGZaaEd2K0taVEZo?=
 =?utf-8?B?OXNTWUNUZXVUNmVwL3hXcnVOMnFTVFREWjBxMTdpeDhyYlBmOFFrNkFWaU1T?=
 =?utf-8?B?a3RaZXQzREs2b3o0Y2h2OCt1SFgzWUlDcVg3dHZkVDJOeDlaYmIvQlVmaHh5?=
 =?utf-8?B?ajdqMnMxOUE1YTNGL3ZhY1BSNkc3bmVXNDdaLzNnTUlCRS9YRnR5THpOdzBW?=
 =?utf-8?B?WDAxVlpRanZOR3FDWXEwN09NMlcxZWZZRit0VkJ6aENDNjNwRnFzZ2NGSVBX?=
 =?utf-8?B?U040MFJnaGV4U2tNUmFWaHY4MHdBL1cvSVJ3aVpQVEp6eHdjTTVjUDV5eTJk?=
 =?utf-8?B?Z0gzQzhHSU9yTFVOZkdpM0hVTHp0LzdLaERhT1AxMDJ6RFhOdFBIdVJOd0d2?=
 =?utf-8?B?a0o0a0VnSUt6K1d2MnZoRCsxSGpDZTUrZDQ4a0pOZnA3OUdZNXVjc283ejlT?=
 =?utf-8?B?NFhuZGwzT1A3T1Z3aEptaGNwZnVpUVcvUFFkeFYvU2dGNFlia3MxK2RIdHdv?=
 =?utf-8?B?bDZ4MEtJeU5RdHZ4aG8zVjd4bmRjK1U1MHdOZ2JEaGE3aU4xOFVlVEZtVHVL?=
 =?utf-8?B?RE93WXA5bXduNFBMajJtc1JKek1Hc1c1bFlJakhYdWJGZXkrZmFGVU5pTUNX?=
 =?utf-8?B?dUFTRWtXcFd1QWhtZDh6bk1wdllwUnhxZmNqMElJTFdKdU9lN2dJcWF3ODVx?=
 =?utf-8?B?TFR2R053M2RBQWx3bEtKTldsWmJDNUJ5R1QreVNrTElyQmZYeSs4MGFicUFL?=
 =?utf-8?B?T1JEL0p5TXY2OUZWd0puQTk4OXl3aVg5M3dNbkY4MmlhVlVDdTIxWVJEcDBJ?=
 =?utf-8?B?V2FmYllTeml5M2FPOVBqY0xoRlVsajhnTXhaWGJ4bytlVm1GN2Z0ZVJPS3RS?=
 =?utf-8?B?alhuWlRvOXlXa3lQdDFwb1lPT3hDVHNlQ2FYTzBvQjFhSnRsUzBEeFJhZC81?=
 =?utf-8?B?MFYrMU9xUWx3MzMxVDNPRzc4eW1BYTJLUUNiU1RoOCs2UFhtY1QrNzlGSkcw?=
 =?utf-8?B?aGJ1TStrVFEwQXk4ZXFLNklVYzdlQzdaYUhzdDVZSDVmWUZKNHNiQWxKQTZX?=
 =?utf-8?B?QWVxUzBkN2RpYSsrSTgxOEl2NGgySXRlL3Jka1FGMjBlSzJOazluM2RyQVpX?=
 =?utf-8?B?QmI5VGI0SkVhSWxjaDZveU15Ny9HTlhEQ0daVUI5c01FbzRObkxXNWNnZE9m?=
 =?utf-8?B?Q1RxZUlpNUpJMWpFYTR2WDNzMy9ISUt4WVRBczlIZHB6RWtpRk8wZkovZTFr?=
 =?utf-8?B?ZXF2ZWV0d0N4cE45ZS9BQ3pQSjU3S1V0OERCMHFaei9vMk9aN3NBbXJNdVZq?=
 =?utf-8?Q?4UiBAVSkfMCB4AHNaOS1wm/wWK/hlkwGMCHZflB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf80507-f566-4a6c-dc73-08d9538dde46
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 19:11:43.5142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCBaQB0tq45+Ga26jV3Q/IUnCQ+mjS62dSMqcRFN40tTrsJRfeybVdwefG325AEzDh+5ICpfo6FiCnkvFMNNgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5162
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

Am 2021-07-28 um 7:45 p.m. schrieb Sierra Guiza, Alejandro (Alex):
>
> On 7/22/2021 12:26 PM, Jason Gunthorpe wrote:
>> On Thu, Jul 22, 2021 at 11:59:17AM -0500, Sierra Guiza, Alejandro
>> (Alex) wrote:
>>> On 7/22/2021 7:23 AM, Jason Gunthorpe wrote:
>>>> On Sat, Jul 17, 2021 at 02:21:32PM -0500, Alex Sierra wrote:
>>>>> In order to configure device generic in test_hmm, two
>>>>> module parameters should be passed, which correspon to the
>>>>> SP start address of each device (2) spm_addr_dev0 &
>>>>> spm_addr_dev1. If no parameters are passed, private device
>>>>> type is configured.
>>>> I don't think tests should need configuration like this, is it really
>>>> necessary? How can people with normal HW run this test?
>>> Hi Jason,
>>> The idea was to add an easy way to validate the codepaths touched by
>>> this
>>> patch series, which make modifications to the migration helpers for
>>> device
>>> generic type pages. We're using CONFIG_EFI_FAKE_MEMMAP to create
>>> fake SPM
>>> devices inside system memory. No special HW needed. And passing the
>>> kernel
>>> parameter efi_fake_mem. Ex. efi_fake_mem=1G@0x100000000:0x40000. I
>>> should
>>> probably need to include a small example of how to set this in the
>>> test_hmm.sh
>>> usage().
>> I don't think anything about hmm is sensitive to how the pages are
>> acquired - you can't create device generic pages without relying on
>> FAKE_MEMMAP?
> The reason we used fake SPM approach was to have a "special memory"
> not managed by Linux (NOT registered as normal system memory). But
> also accessible by the CPU.
>
> For device_generic we cannot allocate new physical addresses.
> We need the physical address to match the actual system memory
> physical address, so that CPU mappings work as expected.
>
> Would you recommend to use a different approach?

Hi Jason,

Sorry it took us so long to respond to your comment. I was on vacation
for a week. Then I tried to brain-storm some ways with Alex to simplify
hmm_test for device_generic memory, but couldn't really come up with
anything simpler.

The problem as I see it is, that DEVICE_GENERIC pages for hmm_test
should be pages in physical system memory, but they should not be
managed by the Linux page allocator. Unlike DEVICE_PRIVATE, we cannot
allocate arbitrary physical addresses for these pages
(request_free_mem_region). Otherwise we'd break all the assumptions that
make those pages directly accessible in user mode virtual address spaces.

We could maybe allocate contiguous memory from the page allocator and
then register those as device generic pages. But that means, you'd now
have two struct pages for the same physical page. I didn't think that
would be a good idea.

IMHO, reserving some memory for this test with efi_fake_mem is the best
way to keep things sane. It does not require any special hardware or
firmware.

Regards,
  Felix


>
> Regards,
> Alex Sierra
>
>>
>> Jason
