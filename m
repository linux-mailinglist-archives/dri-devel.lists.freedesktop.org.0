Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B56D3BC6E9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 08:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193158984F;
	Tue,  6 Jul 2021 06:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AA68984F;
 Tue,  6 Jul 2021 06:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0jhU7aH8eAMaAR2XUwL05PGj1p5LPEAaLvxs9eGga5ZPweX4rr//FaUBK0jhekqVv9DaNGaZRWyJaVKlpihe2HsXASQ+BPH7YEn9ZHsB0Fm8aZ89QwY7jrCBbt/vjzgKDqNAPBDj8gia1dN0ItuJBmb7YMBSPqzbJUMFqP7x3Ea3fKAE1m15IOFyVnSoJhyoiflnnnUOiZmlRnBbU87fNxcq1UMQGiy+lBaizBg5JP4C6pPNTWKz705oua+sZnckR6drvlxidJ4BxFJQRBQtaLbv55GwpDOybF96yiXkhgly4GfKczCfJPd+EFgP5wMxumZCCUKbMDxC0YowO+Qqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kv0gk3N4gxPK8ACVCIPiQCdWxDfcv6ueT9whWXdBWRs=;
 b=l7bMnonotPT2l5P/U8Hqw9w5OsdxBC57TkKMJGaIO9H6FMhND6HSG8J4nJ+PIficgOnZ9/SI7seZbdTwi1JKbfFxGeKNv9pORQdztgBAdWJvtyIZgkKMfiggLk49iaTAk4JmN7bFNvStlzXjbJcV7qH4SppHKh73p3aCCbg37Odh1kFa/XfDlc1AdGuEauQtUNDdlQ1c1b9Bntzr96g05GnHy/WSeC4lnZMWB5Jmq9v0dU+xXrYYcGM5xyrCjLofUp37yyg670wdUaN4jF1EV8dX3Ls5ueDNZwrfGySxGW4pMk9y5yyv4zN/6Of2+TN4CEHZ8qeGryTfQj28OpPKQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kv0gk3N4gxPK8ACVCIPiQCdWxDfcv6ueT9whWXdBWRs=;
 b=tB45OC9HxG2s0kYzGyWQTdapX/n0S1Of8Eq6W8Z41vardOF1A3IVrWrwHsh1o9OmYSmLN/OTT8TtPJwPqI+EQCuPfV1tG4PLYGPZTSQRiryqYYVWHSGkwKKoYUQOCp6ZhRe8Y3LgpvUcG+9fsaO8lfmsEEFo4hU0pTd/nzcWl+I=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4739.namprd12.prod.outlook.com (2603:10b6:208:81::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.32; Tue, 6 Jul
 2021 06:58:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 06:58:41 +0000
Subject: Re: nouveau: failed to initialise sync
To: Alistair Popple <apopple@nvidia.com>,
 Corentin Labbe <clabbe.montjoie@gmail.com>
References: <YOC4uekpD7iA3xPi@Red> <1682547.0nLxAY2a9E@nvdebian>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <dace0dea-7ca9-99cb-ad80-106824cb5e3f@amd.com>
Date: Tue, 6 Jul 2021 08:58:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <1682547.0nLxAY2a9E@nvdebian>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:753c:5dff:bd23:5cf4]
X-ClientProxiedBy: AM0PR10CA0096.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::49) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:753c:5dff:bd23:5cf4]
 (2a02:908:1252:fb60:753c:5dff:bd23:5cf4) by
 AM0PR10CA0096.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 06:58:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0be9c259-748d-4728-32c0-08d9404b7d14
X-MS-TrafficTypeDiagnostic: BL0PR12MB4739:
X-Microsoft-Antispam-PRVS: <BL0PR12MB47391BF63BD361826AC2970F831B9@BL0PR12MB4739.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:196;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0x2E3GNPOY7YU7/8gMh9BywIdJHzO7L9v43uJ65eHx55qTafiSf0nhalhLsOWvbtHmd6kgANe2r3GkraaORSwx8fGgTlpD6lu/rRA3pLWRIo+9GOF56r6ZQNlDa2Vf16r4i8lxawmAjNGIuaHkfYxLIpmpm3gtWbpkVSRSsPj2SprGmLfXoGybR9jdi4LJgLheY3fWi00U0dhezmaQXFbLdG3ieYUlhB2gdlQLw0IHCnFJoaOyDi9nTFVbZy3dntvd0U+1bohlRp79MVhJ7GZf/qZTleAQPTEC247eX0hdlZOLg7Dt/JI6C0GhO2wfFqsAXEI3xFmBDkUT4GcNDIY8JpColGmd+huy8pG6JAiJhU2ewc7DPlZoHS4efqxUM6NVS9wqxXJB2hW870J84bjV3jkHiPzuT8rJpjB54gthaGvhtllyRMzqXxk2rBgj+c+KdytZf9icvgWC4umsXqPRmzoVqb2q9KZjVM0srXssValPvqIiaUqJvuaHwnzbOhFbC0AkCwlk+0yDMwPf3bEzAYnLpQi6v2VSCGYMVu2GA1YZ7qBX7j14+eYePIrcK5FQWRAPpduhk3kaHnpHrhBsjPrabnTCe18SNrTFPOb10PBIev63UZoHfnpJoAOoEysMHPL/V2XAXiejxa5z30N7baYDR7tP/3gMUE5i2x+HuSLXuHoUgTNGiYsZsrdttMNOToBJh0Zym39RPTb3emAUiIVvBiL49nv2uUwW232+O/oGBYD2ypm5/pTFpdaDfU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(186003)(83380400001)(478600001)(316002)(16526019)(2616005)(966005)(8936002)(66574015)(38100700002)(66556008)(6666004)(86362001)(45080400002)(2906002)(31696002)(110136005)(4326008)(5660300002)(8676002)(31686004)(66476007)(66946007)(36756003)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZCs5RDRyMDhqUTdPcVpFWkpSYmdGTFNCeEplbUNGWHcxVWs0dmNEdXlxN1VV?=
 =?utf-8?B?VkFZeTNtRWZObnVvL1h0OG9xWEZsZzFQaVczQlFlWU1aanFRdUNaQ1VPOTR0?=
 =?utf-8?B?ZzlrcHRDYzV5d2ZiaVZ5RWVQRWRMK1Fwa1FKcGxZd2RUbncxVWZVeEtMaDgz?=
 =?utf-8?B?OGFuWCtNYzZreDBQeUVtcWlvelR0dTFucEFoRGZobFErVjlTcXdkV0ZkNlBr?=
 =?utf-8?B?NTRzKzN5TDRkV0F6VTZzRG9EMkk0SmFKR2I3bHJwVmsydVhweFR2S2ZqY3pK?=
 =?utf-8?B?dGtMN0wvMDMwM2dpckFFK1IxTkkvalFZNkx1SDBNTnhqNFV4L0lZb1FFT0pm?=
 =?utf-8?B?Y05RTnRIL1B0T0Ywc3gweE5WMUo0QlZwSXhtc2s4WTZxdU1mY1ZHUm51ZXFz?=
 =?utf-8?B?dW1oVGQ4MkdWRlhRSDVVQ29CbTZYc1JaaW1MZmh0bWFtMVQybHlNWFhyM2Nm?=
 =?utf-8?B?eHkwbVUyQ0NTeTJ1VC8vV3hucDk3MXRrN1FqN0JHNkp1elpxS0dHTmpIQ0xa?=
 =?utf-8?B?ZlJta3Y1a29QWWdsRFRhZ2EyL01nMXRoN3E3RE1UcFdZcTBSQ2FtN0xZcklH?=
 =?utf-8?B?a1RHR2F6LzBGeHJvRU9EMzF5UTVCT2d0WnRURGZHSUFuOWJsd2JxWkVRMnJL?=
 =?utf-8?B?d1FqRnIzTXh6aGIyL0JLL2hTMGdHK1RHNEhvL0ZUL2V0bmdvVTZWRXV2VlNH?=
 =?utf-8?B?S3VYbGt4cVhYWFR5bVU4c0M3OGZBaW4zamd5emVleFVyVURQS09lZ0RsbHNL?=
 =?utf-8?B?bm5uUUVYdC85WjR6NU9jdTM4bWFNVm1FODNPbjN6NWVlRkFoeHhBRE1kbXJu?=
 =?utf-8?B?K21CK3BNQkMvanphR3J2eWN3UHRtTFM4S2F2ZHRtb0tCTDl5Y1N5Y2VHK0VO?=
 =?utf-8?B?dlZaNlBqZzJ5QndZVXJBaWt4MWxoeFlXZ0N5WTNoNEt4SmNzZFdtM1FUMkhJ?=
 =?utf-8?B?elZ0QzFaSTZ2SjNvMW5RSy9NMytKQ1d2NGlxaVlsRWJwbVF3QkNvS3FqZTZw?=
 =?utf-8?B?L1hCcTBKa0ZEQTBHNE1MYUhURS94azJ5SStaRmdudUdobXE1SlhuYk10ckRv?=
 =?utf-8?B?Nlp3bjBhaUhPMzU4QlFTSjhNaXkyRGoyUFF6NFJyaytHSllLVTFUQWRVbjBn?=
 =?utf-8?B?cXlRNGMvaTg5eVZSZTJsck5hQ1EwYmVqQ01pNWtkQStsdzhZVzJMUmpsR3R2?=
 =?utf-8?B?L0lDZUVZN3ZDTkVXUnJYTURjK1dXY3VtK2d0c3JGWnpUU0Npc2UvK3NTYm5U?=
 =?utf-8?B?U2Znb1hLUzBtUXI1NDNzYmNTWldYSmRuMGpwY1g1YWZxLy9oYXljaVhoMldQ?=
 =?utf-8?B?eWpyV3M3QlkzT1dnMFl5emd2OTZqRytWVkhFdG81Y2M1L3FKd0pXRzVVSDdP?=
 =?utf-8?B?SnlNUVNuUHFRUWh6WW5yZTl4c2F4MmhtQ3JxZ3BhN3Eyb0pQdDNBMks4NVRW?=
 =?utf-8?B?T0dyUHFNUlNRZE1lZnhKbW1pM1hoQTdkS29GWjVsTzUxaUlDb1c1aGkzS0Jh?=
 =?utf-8?B?QURod2lGSzBSZWpwMGJkUnFlbmwwMlNjOFpMRWVUVHFUNzIxc0JaYm9PamUy?=
 =?utf-8?B?eFAzSmFRSWtBV1Z5aW1LR2h0dlI4clJ6bzE0YTdZc0FPZWZYWEJvZEJyYSti?=
 =?utf-8?B?OEY1T01hbzE2SkM0ZkUvWExXQnFKSmgrMDZjTllqZzMwRitFMUcyMmpvMTNy?=
 =?utf-8?B?ZEdlKzdLeVNvYU9nYTFINnFub1hUUVVrdmVyNTVTN1lwK2VJdGM4Zy9WckhU?=
 =?utf-8?B?OXFJZFhPQjhIb0JCL3VIZVI0azdhaEZDWHBWc3RPOEJiWjBaS2FjRm1FMy9K?=
 =?utf-8?B?UGpvakNGZ0VOYTJqSGNodDk0QmtFL0l3dmM0U2FEUEVLRGJYZFU3STdJa3Rm?=
 =?utf-8?Q?yfE5sEOpV9fd0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be9c259-748d-4728-32c0-08d9404b7d14
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 06:58:41.6575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AC+S63f1HJv2a+ycfkq+KN6SEJo6FwzuSXlA0YbFhcVAbbTo/2JDZR5QtipciyAI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4739
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

yes nouveau was using the same functionality for internal BOs without 
noticing it. This is fixes by the following commit:

commit d098775ed44021293b1962dea61efb19297b8d02
Author: Christian König <christian.koenig@amd.com>
Date:   Wed Jun 9 19:25:56 2021 +0200

     drm/nouveau: init the base GEM fields for internal BOs

     TTMs buffer objects are based on GEM objects for quite a while
     and rely on initializing those fields before initializing the TTM BO.

     Nouveau now doesn't init the GEM object for internally allocated BOs,
     so make sure that we at least initialize some necessary fields.

Could be that the patch needs to be send to stable as well.

Regards,
Christian.

Am 06.07.21 um 04:44 schrieb Alistair Popple:
> I am also hitting this with upstream. Reverting d02117f8efaa ("drm/ttm: remove
> special handling for non GEM drivers") also fixed it for me.
>
> The change log for that commit reads:
>
>      drm/ttm: remove special handling for non GEM drivers
>      
>      vmwgfx is the only driver actually using this. Move the handling into
>      the driver instead.
>
> I wonder if Nouveau might actually have been using this somehow too?
>
>   - Alistair
>
> On Sunday, 4 July 2021 5:21:29 AM AEST Corentin Labbe wrote:
>> Hello
>>
>> Since some days on next, nouveau fail to load:
>> [    2.754087] nouveau 0000:02:00.0: vgaarb: deactivate vga console
>> [    2.761260] Console: switching to colour dummy device 80x25
>> [    2.766888] nouveau 0000:02:00.0: NVIDIA MCP77/MCP78 (0aa480a2)
>> [    2.783954] nouveau 0000:02:00.0: bios: version 62.77.2a.00.04
>> [    2.810122] nouveau 0000:02:00.0: fb: 256 MiB stolen system memory
>> [    3.484031] nouveau 0000:02:00.0: DRM: VRAM: 256 MiB
>> [    3.488993] nouveau 0000:02:00.0: DRM: GART: 1048576 MiB
>> [    3.494308] nouveau 0000:02:00.0: DRM: TMDS table version 2.0
>> [    3.500052] nouveau 0000:02:00.0: DRM: DCB version 4.0
>> [    3.505192] nouveau 0000:02:00.0: DRM: DCB outp 00: 01000300 0000001e
>> [    3.511632] nouveau 0000:02:00.0: DRM: DCB outp 01: 01011332 00020010
>> [    3.518074] nouveau 0000:02:00.0: DRM: DCB conn 00: 00000100
>> [    3.523728] nouveau 0000:02:00.0: DRM: DCB conn 01: 00001261
>> [    3.529455] nouveau 0000:02:00.0: DRM: failed to initialise sync
> subsystem, -28
>> [    3.545946] nouveau: probe of 0000:02:00.0 failed with error -28
>>
>> I bisected it to:
>> git bisect start
>> # good: [62fb9874f5da54fdb243003b386128037319b219] Linux 5.13
>> git bisect good 62fb9874f5da54fdb243003b386128037319b219
>> # bad: [fb0ca446157a86b75502c1636b0d81e642fe6bf1] Add linux-next specific
> files for 20210701
>> git bisect bad fb0ca446157a86b75502c1636b0d81e642fe6bf1
>> # good: [f63c4fda987a19b1194cc45cb72fd5bf968d9d90] Merge remote-tracking
> branch 'rdma/for-next'
>> git bisect good f63c4fda987a19b1194cc45cb72fd5bf968d9d90
>> # bad: [49c8769be0b910d4134eba07cae5d9c71b861c4a] Merge remote-tracking
> branch 'drm/drm-next'
>> git bisect bad 49c8769be0b910d4134eba07cae5d9c71b861c4a
>> # good: [4e3db44a242a4e2afe33b59793898ecbb61d478e] Merge tag 'wireless-
> drivers-next-2021-06-25' of git://git.kernel.org/pub/scm/linux/kernel/git/
> kvalo/wireless-drivers-next
>> git bisect good 4e3db44a242a4e2afe33b59793898ecbb61d478e
>> # bad: [5745d647d5563d3e9d32013ad4e5c629acff04d7] Merge tag 'amd-drm-
> next-5.14-2021-06-02' of https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fagd5f%2Flinux&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C5f05fa59cd3b4432e71108d94027ede6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637611362989756089%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=gJ98NtSRf3IyVfsCzw3DKydeMTGKIkHJNzUUhUfsWzY%3D&amp;reserved=0 into drm-
> next
>> git bisect bad 5745d647d5563d3e9d32013ad4e5c629acff04d7
>> # bad: [c99c4d0ca57c978dcc2a2f41ab8449684ea154cc] Merge tag 'amd-drm-
> next-5.14-2021-05-19' of https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fagd5f%2Flinux&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C5f05fa59cd3b4432e71108d94027ede6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637611362989756089%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=gJ98NtSRf3IyVfsCzw3DKydeMTGKIkHJNzUUhUfsWzY%3D&amp;reserved=0 into drm-
> next
>> git bisect bad c99c4d0ca57c978dcc2a2f41ab8449684ea154cc
>> # bad: [ae25ec2fc6c5a9e5767bf1922cd648501d0f914c] Merge tag 'drm-misc-
> next-2021-05-17' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
>> git bisect bad ae25ec2fc6c5a9e5767bf1922cd648501d0f914c
>> # bad: [cac80e71cfb0b00202d743c6e90333c45ba77cc5] drm/vkms: rename cursor to
> plane on ops of planes composition
>> git bisect bad cac80e71cfb0b00202d743c6e90333c45ba77cc5
>> # good: [178bdba84c5f0ad14de384fc7f15fba0e272919d] drm/ttm/ttm_device:
> Demote kernel-doc abuses
>> git bisect good 178bdba84c5f0ad14de384fc7f15fba0e272919d
>> # bad: [3f3a6524f6065fd3d130515e012f63eac74d96da] drm/dp: Clarify DP AUX
> registration time
>> git bisect bad 3f3a6524f6065fd3d130515e012f63eac74d96da
>> # bad: [6dd7efc437611db16d432e0030f72d0c7e890127] drm/gud: cleanup coding
> style a bit
>> git bisect bad 6dd7efc437611db16d432e0030f72d0c7e890127
>> # bad: [13b29cc3a722c2c0bc9ab9f72f9047d55d08a2f9] drm/mxsfb: Don't select
> DRM_KMS_FB_HELPER
>> git bisect bad 13b29cc3a722c2c0bc9ab9f72f9047d55d08a2f9
>> # bad: [d02117f8efaa5fbc37437df1ae955a147a2a424a] drm/ttm: remove special
> handling for non GEM drivers
>> git bisect bad d02117f8efaa5fbc37437df1ae955a147a2a424a
>> # good: [13ea9aa1e7d891e950230e82f1dd2c84e5debcff] drm/ttm: fix error
> handling if no BO can be swapped out v4
>> git bisect good 13ea9aa1e7d891e950230e82f1dd2c84e5debcff
>> # first bad commit: [d02117f8efaa5fbc37437df1ae955a147a2a424a] drm/ttm:
> remove special handling for non GEM drivers
>> Reverting the patch permit to have nouveau works again.
>>
>> Regards
>>
>>
>
>
>

