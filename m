Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4FF3B982C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 23:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E426EAD5;
	Thu,  1 Jul 2021 21:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9C96EAD5
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 21:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETshHoFndtDv6V4gFjSeVAwm4dPANRvFgcsYL+7vVrF321hCsqXHKwOuu4PGIOomMs3dS1Q+MigzzmL6sQZzYa1RTAFM+x4OGIKncXOlq2hcgrkcHgTcQRVXdGXynB82MoT1Gcp47VbsCFW9T6IUtCqrKqORZR2KhQD1l1v04Z8KJtKr0sl5hXChe7SaI6OyYuxkBxeZL9vpJ5VvqhEqBniPn97yDVXS45KIQyhcfJICGIhUzYAKTBPRUc7q+NL5EzO5SZFKlokneaO00vAg1+3CoJS595PULe28q+saYiq46sblpQL5f8nMy+kd/IsIpDqvWkniArtkMVkhe30l7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBUn49rJ4maEU9a7c1qceoFNuDhKiveibJfeh1SoBN8=;
 b=XsPN0UME8ftG04NeSgdBOhvZVu30LtBFuwYzAQLhMSGaBTd/6nY9w3nbsL3CVxpF91XiYT46DIPW3LH1TOV+fiMw2OVca4t/lA8BuecHHtF8M15P0U3lX+0rSSLdd/r3Oku8FMujYf5RJ//cfV3u2MEtGJsPiDXhqcZxFDEh+57VzVjo8CLt2yjcqpBzNZROHCUvi88sF5emb5NwBgFF558/zyoRNvhb38K2UeeD9jE75jpoHx4xNmewin17TksRiUqbnJDSr7llm6vfMVkw+IlLxQEsMKvFKrAmaHVCjlROsltRWy5m8lAVTOc/5/cVLy2q8VsZzJSnMU1gZvxxQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBUn49rJ4maEU9a7c1qceoFNuDhKiveibJfeh1SoBN8=;
 b=IqCeStXgnYP9Ta8yk939KgqQer+DQ/2IQnp+vYDmhYibZTiW1w0DvlXzuzl5aFPqgqJ3hygtMxCUZxYQk3JZ7HzE6Jz16r2HUZULdfcb0hr+ptlcBFJRyMCc4fhXy9mS95eayvZtWpBnN68Tv3h9SgmxI3S0zJ0xDrBo3qLbDbI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5100.namprd12.prod.outlook.com (2603:10b6:408:119::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Thu, 1 Jul
 2021 21:31:18 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 21:31:18 +0000
Subject: Re: [git pull] drm for 5.14-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>, Philip Yang <Philip.Yang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
 <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <b45c99c9-02f9-7e97-7a98-71388a2a1bbd@amd.com>
Date: Thu, 1 Jul 2021 17:31:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.186.84.51]
X-ClientProxiedBy: YT1PR01CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::7) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.84.51) by
 YT1PR01CA0068.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 21:31:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f6dbfb0-c9e8-4fc9-3cb4-08d93cd78fd4
X-MS-TrafficTypeDiagnostic: BN9PR12MB5100:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5100C3A55C065FF1976E955792009@BN9PR12MB5100.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BFMpFOJIEjkO0LUGms3mG8x/BwX9sJnd37GIYCBd0A2ugIn2R0wpiNnY4JhfXMhIR8KPtJEj+sg1cIUhsj/31elljaqyE0mMn7DSpl2PdbUkViHKlfIzLLM8uL4eon/K6JFtHss3PdHXaapjuS1L2L/ff7ztOhcSXrhsA+pd7YM9G54TEa5FVRJz9KB2mU2tEOV7RFky/FrkUmuigRpnU4QDYHauTXG83vQgvkv0mwy0H3dgfsMNHzUvJcAXbqsdTAXue8CIN/p8uUP9JxqfrPWx56RnoygeKFjRlgx9R9NrX+uQT2LydACJ81djgyMdGsXrADbg1V0lW1yKe4DBvWGowPARdlhcct9PbsI9qh1yhR768J+n1qlYwjtFf0uG+s39X7UIPJwfCxQ93DoPB1xybbrhIXfNtSsLTVp4srqQG/5pPlntp/QSTB38zePg/C0kCy3JTFgulyHw2okw84wmAjacp0NVL4hCRd7k3Ofs2C9ZHfFOZ3VuGVq/U2dInwdl1AEbw5rCuv4wcb8mkFv1m3It08DuC3vtKEsUdiUB8h9/HnZDMUKq1m65TrVtMKLnZ3Egulp8VlP9bV6RaO16WYVCG2eMKfjYSiWh5GxTiMM1SawTtLbb0TvBFC6u44DvWznHj6EjTmcN1Y82d0gOwQ/usFzptnFpgb4GD4z7LOKA8S9jS6rO2fC2EPFkrC6N3Bv1vRCkh8aVXal06VWgCijILJIrrH5TeQBkOt9UYgGSITIEMYrJBTFQvVhd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(66946007)(6636002)(2616005)(956004)(31686004)(83380400001)(66476007)(66556008)(44832011)(8936002)(5660300002)(53546011)(8676002)(26005)(4326008)(186003)(2906002)(6486002)(16526019)(36756003)(478600001)(31696002)(54906003)(110136005)(38100700002)(16576012)(86362001)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0NpaDRsbWtTYUV0SHhuT3U3OU1RVkNyUk5Td1ppQnFheWJSaDlPQVdGQmxJ?=
 =?utf-8?B?U0IrNmxhUlpYamZQT0h5TFhMWGVrVk9wOFdFSmNWWDExdTVuWlViSjZCZEtL?=
 =?utf-8?B?THhQeHZ0TjQvZWl5d1B3N1NNN3VpcVZZaG5VbGNWL0dnVzdrcFhDdWFYeWVh?=
 =?utf-8?B?aEoxeGYzZ0NuRGZOUjcyOHZiOFB0NFU4OTJGYUcrMTVKaDFyUFhLMGd3eEli?=
 =?utf-8?B?WGxhNjZNL1BDekgzSkVZTm1CaHJaVE1xMS9iZEpBYzZudVduUTF4TE0yVWxF?=
 =?utf-8?B?MzZJNld3NzNyVXozQ0lpTWpOM0p6dXpZaUJIRko4b2hvekRlY1hDcS9sbDVR?=
 =?utf-8?B?Q1RTQ1VROWgzUlhRdk0rZVpBSnh5c3ZyaE51S2hsN1BaYXNWK0NtcXN5Tkw2?=
 =?utf-8?B?eWNqV1V4N0NKQ1JQeWxKNzQ1NGRUdXh0QVBLZUZiTk5OdXI3MGk0akdRREZG?=
 =?utf-8?B?NmlnZjZKMFJoVmNBZk9zUDI4QWhja0ladVRzUE1HS0czZjJlNUc1N2hQUHpq?=
 =?utf-8?B?NVBNMnR4VHRDTU9uVmFEM1BZdCtJcnp3UWhxRGlJT05ZUWVkTy9DTkZlMUE5?=
 =?utf-8?B?akhVbk9QbEdVcVR0Mk9iUWZOZXE0RnJ4dnZ5UlZUdkhkTnFuMXllcjUwaW5p?=
 =?utf-8?B?QWxhdWc3SWN2VEh1NkpRcTMweC9heDJRL2tsVkJSZUlKUVM3NlZjVzdIRmds?=
 =?utf-8?B?aUVEdy9SZ2poakRNaTJpdUIvczdCRkxqczBBOUpDcWZlSnNnYnVsM2RPMEh2?=
 =?utf-8?B?ZmhOT2JFbW5GWjA1WGRLb1ZGVkFOWStRdnI1QVB2ckxGcS8wRlFhMkVNNzYr?=
 =?utf-8?B?MDBWS0s4bEUzYlZ2OGFYTHJNNEF4RjVRRmcwRVplQWdOcUVGR1BmTUgxc2pY?=
 =?utf-8?B?eDVRNEd5WEZYQytNN3hUVlRka212cWFVMStYbW5DMElGTUR5TmdRNWhIQjMx?=
 =?utf-8?B?N3N0KytBcCtnejJtUExOQkdERnJveWFtK2pYcEg0R0Q2dTZyMlFDMEFxcmpX?=
 =?utf-8?B?MmtUWUFzVTlGRW91bERIR2wzWmEzWU9HaGs2aCtjNjBUL2o2eThyWlJnbUJH?=
 =?utf-8?B?Z2FmQ1JWcFhnWTRjbWpFZm9UMG42bWllcDRXVTUvQVBNeDVKdEVvbllNakt0?=
 =?utf-8?B?YVROS2NHaDkyQ29QSHJmQ2lOaUVSOVJNN1NHSUNWWTE2WGFPUFV0WU1qS2lm?=
 =?utf-8?B?bmVTNkVpcDZ0Z0lORm9VK1Jhc0J0dHV6VTlHMi9iaFFnT3ZhanpHT0Vac29y?=
 =?utf-8?B?TWFEdUUvZGZJTWlxVkhuMUZYWE5wWCsyY0NQVnNhc0FvNUR4VnNubGsxVWlz?=
 =?utf-8?B?YzkvdnB5TXFLMDlCUEtrSDA1R1pCWmErWXV0bTJVNUJ2N1pYcm5wZFdIWTgw?=
 =?utf-8?B?eHg2cko3Z0JPVGZTTW8xVkY0bFFKa2VNbWhIOWdQVXJKSlYzVlJNRGlqaCtI?=
 =?utf-8?B?Y00rK1ZWN01MMnY0Vy9zeXZpMTJ6SlY0eUY1cFo2Rmkvd2dDcUI3V2RJcW50?=
 =?utf-8?B?bUFMck9OMm55VHJHQ0VSbDV6cVdsc2VFTHRUMWlwazZhVElNTjVKcDFPaGpW?=
 =?utf-8?B?UVJkR05ucld6STRQWnRaVEpEeHN4VkNYNkpDemt5T1FTaTI1QUptRkp0cW9V?=
 =?utf-8?B?bm9aNGs1U2dTang1NUh0Q09ENW1Ec2ZoUFNVTXNYcFpRYVNFc3Z6NUNkL2or?=
 =?utf-8?B?bVJTeGpjQ1J3UHQrS3M5YzJNL0ZaUXM4TENCQXlqWFpwdHRvMjQySEYzYnVI?=
 =?utf-8?Q?xbTWdovwyimrnMkmGIxR9Lwk7IBg/L2/BRxcyt4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6dbfb0-c9e8-4fc9-3cb4-08d93cd78fd4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 21:31:18.2742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8yibwuQ6CZ2RtzBGgwgdLjdOTnPvkfMaG3NqkW6RH2e89SQ30tgqRjD9sV5swQPMqInLn8w1pO5c2X6B+i0aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5100
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-07-01 um 4:15 p.m. schrieb Linus Torvalds:
> On Wed, Jun 30, 2021 at 9:34 PM Dave Airlie <airlied@gmail.com> wrote:
>> Hi Linus,
>>
>> This is the main drm pull request for 5.14-rc1.
>>
>> I've done a test pull into your current tree, and hit two conflicts
>> (one in vc4, one in amdgpu), both seem pretty trivial, the amdgpu one
>> is recent and sfr sent out a resolution for it today.
> Well, the resolutions may be trivial, but the conflict made me look at
> the code, and it's buggy.
>
> Commit 04d8d73dbcbe ("drm/amdgpu: add common HMM get pages function")
> is broken. It made the code do
>
>         mmap_read_lock(mm);
>         vma = find_vma(mm, start);
>         mmap_read_unlock(mm);
>
> and then it *uses* that "vma" after it has dropped the lock.
>
> That's a big no-no - once you've dropped the lock, the vma contents
> simply aren't reliable any more. That mapping could now be unmapped
> and removed at any time.
>
> Now, the conflict actually made one of the uses go away (switching to
> vma_lookup() means that the subsequent code no longer needs to look at
> "vm_start" to verify we're actually _inside_ the vma), but it still
> checks for vma->vm_file afterwards.
>
> So those locking changes in commit 04d8d73dbcbe are completely bogus.
>
> I tried to fix up that bug while handling the conflict, but who knows
> what else similar is going on elsewhere.
>
> So I would ask people to
>
>  (a) verify that I didn't make things worse as I fixed things up (note
> how I had to change the last argument to amdgpu_hmm_range_get_pages()
> from false to true etc).
>
>  (b) go and look at their vma lookup code: you can't just look up a
> vma under the lock, and then drop the lock, and then think things stay
> stable.
>
> In particular for that (b) case: it is *NOT* enough to look up
> vma->vm_file inside the lock and cache that. No - if the test is about
> "no backing file before looking up pages", then you have to *keep*
> holding the lock until after you've actually looked up the pages!
>
> Because otherwise any test for "vma->vm_file" is entirely pointless,
> for the same reason it's buggy to even look at it after dropping the
> lock: because once you've dropped the lock, the thing you just tested
> for might not be true any more.
>
> So no, it's not valid to do
>
>     bool has_file = vma && vma->vm_file;
>
> and then drop the lock, because you don't use 'vma' any more as a
> pointer, and then use 'has_file' outside the lock. Because after
> you've dropped the lock, 'has_file' is now meaningless.
>
> So it's not just about "you can't look at vma->vm_file after dropping
> the lock". It's more fundamental than that. Any *decision* you make
> based on the vma is entirely pointless and moot after the lock is
> dropped!
>
> Did I fix it up correctly? Who knows. The code makes more sense to me
> now and seems valid. But I really *really* want to stress how locking
> is important.

Thank you for the fix and the explanation. Your fix looks correct. I
also double-checked all other uses of find_vma in the amdgpu driver.
They all hold the mmap lock correctly.

Two comments:

With this fix, we could remove the bool mmap_locked parameter from
amdgpu_hmm_range_get_pages because it always gets called with the lock
held now.

You're now holding the mmap lock from the vma_lookup until
hmm_range_fault is done. This ensures that the result of the
vma->vm_file check remains valid. This was broken even before our commit
04d8d73dbcbe ("drm/amdgpu: add common HMM get pages function").


>
> You also can't just unlock in the middle of an operation - even if you
> then take the lock *again* later (as amdgpu_hmm_range_get_pages() then
> did), the fact that you unlocked in the middle means that all the
> earlier tests you did are simply no longer valid when you re-take the
> lock.

I agree completely. I catch a lot of locking bugs in code review. I
probably missed this one because I wasn't paying enough attention to
what was being protected by the mmap_read_lock in this case.

Regards,
  Felix


>
>                  Linus
