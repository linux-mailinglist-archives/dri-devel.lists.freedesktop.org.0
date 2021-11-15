Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A36644FF31
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 08:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B62A6E428;
	Mon, 15 Nov 2021 07:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E89E6E427;
 Mon, 15 Nov 2021 07:25:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bca+78pC4JH0e+OmJMZE6Dl649xC+ByMglugpQM9OqtAUmm2vn2ebw5/ySizjDP/n+I7IaRgmR478OpbzUgXH0nzmubjV4zg8cI9wmj+iPOGFXkhgvYpWmr4DL8OURgLCGqsgmyUx0rqfEXgM8h1Y01fFD6DmDtxr/PRIkVN6WdCJoWYrzS3HSb9MMXH7HB9J4NIhR2ttYMrXUiEXcIC72fQDTcRk0Pwyh33wsZvTkx2xKtn2jVq4V4a09uA7CykhI07iqI+2TSnpzumqS7S6hwjs3i9cJsuri/wzgSxbt+sjleUJp71EYrcsjcCSiTGjVFRGC9JPgbPxXlc//bBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrNQBiYO7cd9xlymIocvghLg8WYBALzUGSUw43q8tWU=;
 b=HgihDiw1ImNWcy1Bx7Qm+VlerWX75sdVLb6CDPXu39RrPDZSz7DJ49DvVQ3UUDafpQ/4ScXI00I78ks+tdzhJam2EPUDk2K7pdloxoHhFGDtLMijuiSFVTOair+ViqB0CX746VPfikLojOHbD3ZZxlc0y4sPF0KM8cK+gZ57nB8f3hYneXo+6+eShboTwB+rCsd1RuqUWTf4Xp3F9/QD9ZToPbCR+YZC8aVn2yxMwVmdh8ltzYzfjq4UrIgm6hX3TOk2ChCIIYKJwDD2xcDbgcqIOupRHmqT4hm1OU0ayM6/fUhHiIyaVe7KunOLzAJ/ibuPKImkcljPsyyNdSOPsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrNQBiYO7cd9xlymIocvghLg8WYBALzUGSUw43q8tWU=;
 b=mT0B/V2D/NmMlDqBzBy9Apn550OK2upxPwojgdpmFQ38VNXzRyFBRUvJwWtxY3ko/jRPtFpQsFIQ56b6iE/RBKsm2X0voCQ5NZx7ue2APkEJyHCKX5CwXzM+BDeEQfLO8X/fnvkBG9ZLbuxYf8OI2O9e+ICbdhLwpn9c1uvzC+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB2478.namprd12.prod.outlook.com
 (2603:10b6:300:e5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 07:25:25 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 07:25:25 +0000
Subject: Re: Questions about KMS flip
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "Yu, Lang" <Lang.Yu@amd.com>
References: <579d0f44-bb85-11b2-d326-35a0b7c5d0de@amd.com>
 <5c242319-ade3-5621-6429-f77b17c34de5@amd.com>
 <YYV0W1CxT5torU7u@phenom.ffwll.local>
 <64e70779-7c33-7849-aa29-aeaee4a89005@amd.com>
 <YYk7SkflDx8ToqYG@phenom.ffwll.local>
 <4ba7e3f8-7956-882a-6888-57e2448b907d@amd.com>
 <YYvIfXy9bwPokiK9@phenom.ffwll.local>
 <ab2fb071-12ab-da99-53c9-1411ca9acdaa@amd.com>
 <9a5b8470-d02d-71b4-4a89-6d6c32fdfa5d@daenzer.net>
 <88dfe9b4-e170-2d6b-604b-03af5d57152b@daenzer.net>
 <735f8781-982b-a09f-32fe-fded0024a587@gmail.com>
 <58097218-40dd-55fd-32d2-2a299d39230f@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9c14fa9e-fccc-0861-01d5-40e9475d1b18@amd.com>
Date: Mon, 15 Nov 2021 08:25:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <58097218-40dd-55fd-32d2-2a299d39230f@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS8P250CA0007.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::12) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:bf0c:d52c:6ba0:cfc6]
 (2a02:908:1252:fb60:bf0c:d52c:6ba0:cfc6) by
 AS8P250CA0007.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 07:25:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 012bf62f-e2d3-4ff6-cc10-08d9a8091739
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2478:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB24782EB77C7FE3981C2741B883989@MWHPR1201MB2478.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eziCbq83B+1zp9NUBE1lalyILJXNAN3BgJugGZ7/zd+ouKRJymA0pz/UphL3qrNHDdqxNxwX1z+tDneKb+pN4ZNrHTNSwlaLIZ5s1Yi+cjld0Ah2I3GMxCyjQfsm1MistA2/8hZ7R8+7k5fEK+ltdfE4jI9o7WyavSVR7vDiZJgDYYsF/tGGIFjTaTUYxHOzzNS7KFo+NQ7bWyKhruirqG08TUAq4m/W1GvX29ctt8z4f15SSo3lUQucXWY49FGY4YVOf/pQYSzJ6H1hN58KWL0mbD5GuZzt7Qd6LyuqhltE6CG9Lx0n1utHDWyuHrW3wgqdK+cQt3UNLO9otTlzBUyJ29TRMG/TAw9yJBbUIx2W3ENNxNx3iah9fm11t6MBgdrv5s6W7oDoq5QggLzeeAW5LaIRS9O6rvCjI668DNAgs7e0SAHYKzFCfjLIFNHfhQAf2oJYPBCyysX+TDCFrtuL1lz+UyCq/U2zaPel2pitlpjCcaNVMC67U93K1grh+MAMl/RP9xH/5bFohDZq7HuiNlhd8FGxt4pIwnt9uXQqTPK1rc0et91vTfOkpwlbVVHBk7NIs++MGblMvhz1MB7qyJ/EGxWVbR5o4fg11FFIJmJAzH3D+ECu6BDjaiCPUGQKilEXCu3mrG+aTrUFX2nqFw7WuFpzL8yG+/sYWzp8sBDjmaMg13II1+5MdE0TNAwQX51f4sp4jJdzbW6JWbuJnzcWgJZ0oXNsOjkBVqJ1ypBVyLjbvb8Qz9PHq2TMyMpZvZrx43qXL9r5+DEQqjq+ZWKO0DeTCMNGmYGtZi4wGbftCmnZc4uThbJ5+0pnIFJ4jTRFcInEsloliLOlKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(31696002)(186003)(5660300002)(45080400002)(4001150100001)(53546011)(2906002)(36756003)(38100700002)(54906003)(110136005)(6636002)(316002)(6666004)(66476007)(66556008)(8936002)(66946007)(8676002)(6486002)(86362001)(4326008)(83380400001)(2616005)(508600001)(966005)(66574015)(3480700007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWJNVDRNMjZveENadGg3Y0NhL0ZhWlRwZG9YNVd5d2FJK1F3ZE9HZzdKZVp2?=
 =?utf-8?B?NmwvYlp3elUzQUdjZlVZblU3Nzh0Q1hheUdCdXI5dEJsM0tvVFhNUVh0UVRC?=
 =?utf-8?B?WkhtMWI4dzFxUW9MNTJzTUJTbm5JT0ZPNDk0eFAyMmg0UVBJa3VVckp0cE9D?=
 =?utf-8?B?U0xLU3dUTlZ5VkRiNnFOK0RsVkFaRmlwYWloc0hpM2NsRlZFbklLNUwyVUdx?=
 =?utf-8?B?TlU2WCs3VGIwMGdaVS8xTE83U3ViejFYaHRUYS84TjBkeERXVHIySUx1bVh2?=
 =?utf-8?B?ckFaL0t2Ykw0NjVpTVZTL1hSVHFSODliRHA2U2xiVjduUTZZMzdraE4zeWhs?=
 =?utf-8?B?VVYzbVp4RTZGSlpxS3Y4Q0VERlA2VzZrZ0pXODUvSTE4USt2RVdVeG9WTFpG?=
 =?utf-8?B?K1Z6d1U4L25DeCtscjRQNFJqVFh4eTFWbW0vS3pnVm1LQysvOHZPczFNMzh4?=
 =?utf-8?B?VCtuQTdVWUE3SGp6K2MrMXRBcy9ScDNnZmNvMmdyMzBjNk1xRHZDdkp4V2w4?=
 =?utf-8?B?dDhjdzlEQTBCeFZtdTVKT2Y1YTAxOUNxRlVFSzUzMVJWMGlRZE4rc29waWhM?=
 =?utf-8?B?cG9CWGpyTEQvSm8vV3JDV1NnM1BZeUxzRG8vcDBOSi9QMTNHWkhHRmUwd2NB?=
 =?utf-8?B?R2lDcGxrZUR2V0Z4K1JYNGxGMlFBNVBycWgwL0daZ1FKTVBpODhyRGtFR0Vw?=
 =?utf-8?B?NHdIalI3QWRCcWJGNk9RaFZ2S1lIeTZwbVBtOGF5SjM5UEl5U0pPZHlvMS9F?=
 =?utf-8?B?YUc0eDFzR1dud0I3bE92WWVHY3liSllIMVdUb3RTQkVYYzZiV2wzK21DeHRs?=
 =?utf-8?B?SS84TGtsbHR1NWF6WURIUnpBRnROM2pDSUh5MGw5MVNmaFpSSXFtOGt3VHhw?=
 =?utf-8?B?SG1EZWhQaXBRMWxId1Exd2tIV2hwQU15MTEvQkE4cGRkY2lqZDlYZmtGZTNV?=
 =?utf-8?B?bVVJck9MR2RhWDkxSlNTSUJMQjZ6eG1SS1AzdzRNQ2E0QXU5cFNhY3Y0elo3?=
 =?utf-8?B?R0JTZE0rTHZ4MVdKSU1TODNqQUNycHVkZHg4MUdqU2tJLy9hM3JiNktZbnd5?=
 =?utf-8?B?UlY0MWUyYjcvV29ydUxKUmEwSi9XcTRLd2FXdDRtKzgyeWhwZDk2VmNWQk4z?=
 =?utf-8?B?bXVtTUVRdVh5VEZ4R0dWR0k3YzRVK1FadjYxYjBac2M1aGhaSDlGbCtLeEsw?=
 =?utf-8?B?UnBXWGlwaGo4Z1FZZUlHb3I1czFDcWZXNng0Z2hMKzA4bi9nd0dXMEJFdW1Y?=
 =?utf-8?B?bHNsL3Z5N2JNemM3YUlIR3k4TG5jRGREWTJTQVBaQVNXczVXYTZxS3h3am4w?=
 =?utf-8?B?QTNTMWFRZ0NyTHhoMGIwU1hZV2hRWTUzSVZRWkdjcE1pdENaaFA1UElZcm5M?=
 =?utf-8?B?N2N1ZFlURHNDSXFjNklRTXFhRWVaZWJKYTJaRVpNSmtFOTJNS2pTc0xuNWVN?=
 =?utf-8?B?TnVkSCtXNlE3VENCQkJ4V1ZxdnJ6TVAvM3pwSytkbG4xN2h4akxLU0RHbFd6?=
 =?utf-8?B?QzJzSlB4TzY2YUJJRDdBL2Yzak1pUXRLVTRCR2I0bW53dCtzd2F4SjAvcStK?=
 =?utf-8?B?NDlmS3p1OTM1N01KTGdjamRuWGxzRTFDTnFqNnRGMnNNa3MxN0RzU2dERWxN?=
 =?utf-8?B?bXZVV1hrSzIwN3IzYnEvM0VTSEdPZURVNkFDRS9VZk5ISlFzZk51UGwxZWRr?=
 =?utf-8?B?UkdyVFRjcEloNWxHa0hrOHhaRTZMcE9BQ0lMczBKYXBhR0Vnb21pemI0TDFH?=
 =?utf-8?B?MUtFb24wUDR4ZmdtRWdFZkQrSDN5ay9RQkprdCtpejNSaWx1VGU1QWhxQTBk?=
 =?utf-8?B?Y0xtcGpRTU5aWVp0SXpBbkNFY3RzR2RGa3BUSXY4OEMyRVpnSUk5bGYxUEdp?=
 =?utf-8?B?Tk1jaHBDTzdKdGdDeHBYSHhuOXoxOWorUjVXdGcxeU5nY0VJUWhWWVJqSldv?=
 =?utf-8?B?aUhmd0dvaDQwMGMzZFJHL1c5eUhHODFCbDFhV3FqdjhJWXBoamtMQjlDbnc5?=
 =?utf-8?B?MWZueEgwY1A0eHV1TVkzRVpPa2xuZW9KaUpKN0txL0FlbTB6bjFuRGh1TU9x?=
 =?utf-8?B?NUpYdUdIUi9kNk5LamlRZzBkdGp4NGtuRlFCYzEvUVhXMGw1Mng3RmhkR1NE?=
 =?utf-8?B?UkZEOHA5MlpBNlZsa1NQdk1LdUZRK0JGSXVxK2pUcmd4bHl6ZEI3WnNvR1Bi?=
 =?utf-8?Q?hhW8TB64iP+osGcr+VTR0/s=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 012bf62f-e2d3-4ff6-cc10-08d9a8091739
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 07:25:24.9380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBncB5RUkJ0LUKiSwVPx0kU2Z/IFYM1SFSWt4zOBEHNLSA7NvQsu8WmLXTGydK2r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2478
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.11.21 um 17:10 schrieb Michel Dänzer:
> On 2021-11-12 16:03, Christian König wrote:
>> Am 12.11.21 um 15:30 schrieb Michel Dänzer:
>>> On 2021-11-12 15:29, Michel Dänzer wrote:
>>>> On 2021-11-12 13:47, Christian König wrote:
>>>>> Anyway this unfortunately turned out to be work for Harray and Nicholas. In detail it's about this bug report here: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D214621&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cca557eab16864ab544a108d9a5f6f288%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637723302340621335%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=pvLGq%2FJRvVy0k5GMGF2UPotCSdbiQNfndtjI14luAUg%3D&amp;reserved=0
>>>>>
>>>>> Lang was able to reproduce the issue and narrow it down to the pin in amdgpu_display_crtc_page_flip_target().
>>>>>
>>>>> In other words we somehow have an unbalanced pinning of the scanout buffer in DC.
>>>> DC doesn't use amdgpu_display_crtc_page_flip_target AFAICT. The corresponding pin with DC would be in dm_plane_helper_prepare_fb, paired with the unpin in
>>>> dm_plane_helper_cleanup_fb.
>>>>
>>>>
>>>> With non-DC, the pin in amdgpu_display_crtc_page_flip_target is paired with the unpin in dm_plane_helper_cleanup_fb
>>> This should say amdgpu_display_unpin_work_func.
>> Ah! So that is the classic (e.g. non atomic) path?
> Presumably.
>
>
>>>> & dce_v*_crtc_disable. One thing I notice is that the pin is guarded by if (!adev->enable_virtual_display), but the unpins seem unconditional. So could this be about virtual display, and the problem is actually trying to unpin a BO that was never pinned?
>> Nope, my educated guess is rather that we free up the BO before amdgpu_display_unpin_work_func is called.
>>
>> E.g. not pin unbalance, but rather use after free.
> amdgpu_display_crtc_page_flip_target calls amdgpu_bo_ref(work->old_abo), and amdgpu_display_unpin_work_func calls amdgpu_bo_unref(&work->old_abo) only after amdgpu_bo_unpin. So what you describe could only happen if there's an imbalance elsewhere such that amdgpu_bo_unref is called more often than amdgpu_bo_ref, or maybe if amdgpu_bo_reserve fails in amdgpu_display_unpin_work_func (in which case the "failed to reserve buffer after flip" error message should appear in dmesg).

Yeah, seen that in the meantime as well.

But we also have a WARN_ON() when the pincount overruns, so that can't 
be it either.

Long story short I have no idea what's going on here.

Regards,
Christian.
