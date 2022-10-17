Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF36D60085D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 10:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C670910E75F;
	Mon, 17 Oct 2022 08:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A1710E110
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 08:10:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+UlalGcsfPkhkmPL04olcUYuVBtwgsVq/nFLbdJTOYdvO4BHgWhNcwv5Ae89essArg9bRwQA2WRjwUwhjWJXWXXLK8RN+cc/lSGSZ7N6Wapy2d7N6ONAfaeNeo+S4b0p6n0h/136liHM82UnR6Kxwosj0ZsYYvvpd3OWoHDICVpj8yMqOhHjazYMl/HoNdXbvdRHleHLV3J95hh4yHqlypcSJOoc+bayjp3rDFsdj15vaGewIf1GGNP34t7CNifzdWW/TpaBViO+xXwjgWv2iJnzxHJgN5+XgQGrCVVeaeFaeh3OBaLpoAOuQvFzcDub7M68TUgdwAx+Jzsksaj8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bpjg6SHjtKCM6a2Mi39k9hc1r3S7xbhs70VjnrhZhc=;
 b=FqHmZAdwtiF6ja++/hAvgA8gI9/UMVKLDATQvX6s8ZdPCcdBM+4pk1aKdcoYRdbiw3As70NA+xFrJlJGRxBZjpr2lEjIqbSG+m2KlyJixmH7YSJ6oWmGCCBdCWRx/6RmCUyWQaV9aA5N2hzyNuEY6oZD2G+SfP1FPtLB34i6l+ve1tcgB9sysW3UErsZfADbMESN8m2LKQVPcRtJo0pE1BSZjZmglEvlwn3JAJbSgVM/DeSE4zVgAD6NYGXby0E5U5wRIdH6Q2HPFSibtOJyvOvqaRWPWOGxJ5C4ICq58mNANq5G0uapqu8VRXPpc8GK3u2P0xToox4BmdF+NrkGBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bpjg6SHjtKCM6a2Mi39k9hc1r3S7xbhs70VjnrhZhc=;
 b=aCd6tUPqVUH5omge+NkdFemCpPCLWtywaUN8TiTztl3UYTCmDRM+UofBjmwjmenf0pAoxf5PPoD7vP8wqh5CtE9XstlJ/206QaA7WsPeNfyDw3DmRM+5guUUrBtVhlB28J/OY+0MDi9RcxVcyWEukGqFcBAhMXjaOrjMxAmvsdw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL3PR12MB6450.namprd12.prod.outlook.com (2603:10b6:208:3b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Mon, 17 Oct
 2022 08:10:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 08:10:00 +0000
Message-ID: <50dcf794-e96f-24a3-5d40-6c64941b1bc0@amd.com>
Date: Mon, 17 Oct 2022 10:09:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [git pull] drm fixes for 6.1-rc1
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>
References: <CAPM=9ty3DGWa8vnfumgSrpSgWnixWjikb6C0Zk_5bW+deKLVQw@mail.gmail.com>
 <20221016080833.5503-1-user@am64>
 <CAPM=9txsBf5HJ97tAMOQ8PdiPciK-zqngERUm7hGJO8Zyyqb+w@mail.gmail.com>
 <C98B32CF-86B0-438D-BC8D-10FA255B3B4F@internode.on.net>
 <7c645fa8-bf29-4b30-bdc5-e61e6bb09927@amd.com>
 <f0110d36-a9c2-c1b9-b193-32da4f98a975@amd.com>
 <67e2904a-4b80-5173-2d8f-6a3d1f702fbb@amd.com>
 <CAPM=9tz8=iDye+vYai2NLLW-u3TfZ=DKdA_h2e+kk==ZO7q3PQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9tz8=iDye+vYai2NLLW-u3TfZ=DKdA_h2e+kk==ZO7q3PQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0083.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL3PR12MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e304582-afb4-4f43-ff56-08dab016fcac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hP3VI2iH4M2wuk/ZMWzOyse+7D60tLp4BlGD7xiIjWLDxJ/ueLda6LOwBbQFOmSUO+vVm7uZCl6g4kMZEYJo0RWxhs8xpiKAXSFD3krAIWEoay6GP+wXwUYmUh50G9VACm9ABL4T9NY4D/RDzZRierdVG49yI6onF96MNUpagNSw646vNP7d9Oy+Th+z1aIBZjtygjRTtXMQn/ibWO0EDv13oubfoG1rz1Z1vyPHm1VzxHRNoqeaMmjp9YU3EajmOGKhJTSMpVzOu7wJE/YOZlY1dEr7xkU4JCeEwIHZagkOXP2TJUDxJsb8X0zXiXprStVoFSo6Z+ybVwlzwfCdydGj8Jt4CbZFYhvAyXuFCNPpMLRCU/ETuilfscfmKo5GtlG+TKsfpRMqF050qcZ0icKu2DBNoep2+BXn0CCBu9uukc1wRke8hX0njFgh+g4a+DqA0778u/1fa104sHc2Nz0eUng8XgOwXpnb1fcgSTmCHMlK7hybEdcilJKy5MveOp8LSNQ0sSj2Ht50Uhc5HAHbfprGvblNXlspzvExjn2v67EeKItnMSbfrvlffcY3zgflPVDZf8oP7JRS3DpYfcLtcWgAHtVn4un7+gAuW7rTb8UPQGpqIoeVaSJosPCGXLoezyQHE9iCGNBzMs+U+Q1cCl2shjUDkT5dD+1tvHqRp30zuXZvgJm5QnQdQml0FW2P5A73fZEcbNJODgoXuGU01mRof+rB1eGdhHzPHSclswZmtJUGG6zMksZ6FHB7/lgBzDe6J+yFr+8CzWGlp8J5yyCCOvz8NsM0kzryAGw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199015)(6486002)(4744005)(8676002)(6506007)(478600001)(2906002)(8936002)(66946007)(41300700001)(186003)(6666004)(86362001)(4326008)(54906003)(66556008)(6916009)(2616005)(316002)(6512007)(83380400001)(31686004)(36756003)(66476007)(31696002)(5660300002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWkxeWVnMmxzRVVBdmJVS1dIcndIb01TL1FtSGJZRUNnbndIcW5NdFZTajdN?=
 =?utf-8?B?VFNQRkR0TVZLRVZSd0RveGgwMnR5dzZaMktaWVFXZGVGTnozbjJrOHI5TG9v?=
 =?utf-8?B?ZU8vTE1JME90NWkwV3RXY1F3cE9oU0phUDFaNzNaWCtuS2g0b2UxcHpPME4z?=
 =?utf-8?B?T0dSQkd6SUEvQjJ3b1ZyUnQwOE8xNEI2RjhPWldVMTZlZGpBWHI0K1VlcVRh?=
 =?utf-8?B?NDFlVVltQUxIUkJ5V1ZET0VuZnpHRHgrSjVJcm5yWnRBaWJ4M0hZWUowbXA1?=
 =?utf-8?B?UnR0d2dzYm1IejBVNzFrQVdRYVR0eVlXT1d4em1HOWkzL1luT3ZRdnR0b0xN?=
 =?utf-8?B?QkorVzJIbjlRK2doVGxVK1FiaXA1eFZrT1F0anFjVjArTnhQTVM2UDhZWmVp?=
 =?utf-8?B?NGNTMkoyOTY5eERPNmdYTlZWeUQzNFhrRFRtODAzZlJRWHlhcUNmUTZKZ2ZG?=
 =?utf-8?B?OEt2NVhXRjRDSFd5bDN6QXAxL0tzZEJ2VXpad2J3blFNTEdWVjBmS3hoYnhT?=
 =?utf-8?B?WmE4VW9pWmRkZUROVyt6T2pUOGZFVXhsVkdQZi8yNmtUVDI3bG9WdXMrU2VG?=
 =?utf-8?B?U0JoaHd0N1J4amdQbENzZ0NQZndQTWExN2FabmE4Ull5a3BLWkIyekFCMWgr?=
 =?utf-8?B?MVZIU3AxK05PdkliY2EvdzdhaUZFT1oraUdrY0t2cStkL1VPOU52Q1hyTTNY?=
 =?utf-8?B?MDI5RlR4OUNIREpSVDNVajRqdjRxQ1VSRTNXOENsd0gzQmcrK1hjWTlYV2xO?=
 =?utf-8?B?ZUV3bDJQRXFjb05wT1RzbllZenFONUNXRGpSejAycUl4Q3I3N0NjM3VKNHBR?=
 =?utf-8?B?SFlOakw5ejNZZzQ4ZkxHYW5iekF1KzEwWjdLbVJGVnROK0FYM3gyQ3djUy9D?=
 =?utf-8?B?VmZJbVQ3cCtDd2pxU0Mxa0luNEllNkxkalVIOEhOaDF6QjJJdzV1Q3A5c091?=
 =?utf-8?B?ekVsKzhPL0ZtbEVUQmVDMDV5UjBiUWVnRmVlV1FucWFFMWRUZGlIOHpxUXVt?=
 =?utf-8?B?eitYWnBaRDFqOWlUR0pwZ2E3QWlNd1VvdjFwN3ZMa2hrMThCb3ZGU2VJT1pj?=
 =?utf-8?B?MVV2aGNjYVJYUEQwejh4RWR4UUNKQ1QvQnFYQ2duL0RoQlpwWC9kWXQzVmhC?=
 =?utf-8?B?MnB6ZVp3aUM2dVZzMHFkL0RPaHZwRmp3UGRrRUI5Y2ZQb0xJM0ZHMEtOVlVS?=
 =?utf-8?B?TEIyWTR0Z1Z2OUxneGw2ZzlQK2M3Q2poRzd0bzlGQ3ZKSDJaNlJLSlBBT1Jl?=
 =?utf-8?B?a3dCMDJjN1Bvcjg0QnZqc29CR1pVVEt2Q1JKWExvcE41UkdQN0JHa3REVE9U?=
 =?utf-8?B?QXJZb3RNLzJKWFIwQkJ4ZmNDUnY5QWNseDR0WTcxeU9OWlNUV0MydHNGUk54?=
 =?utf-8?B?eVg5TEhKd2pQVEdOWlQvYjJvb2N0RDNBY3dsQ3czRlFxRERMbDF1VHBaNC8x?=
 =?utf-8?B?TGpUcTlxeFRHZ0lvc3NlSzhEN3ZkUEorKzB1UGlzVk5WSEdYbkdzZW5MaTNw?=
 =?utf-8?B?aVN6S3g5SkxDd3ZQVzhmU0dGQmZkK2NWV0ZEY0MyTit2eFRvejZLTkpFUmUv?=
 =?utf-8?B?em5XUHNsRE9jWFkvUmNWbGZHK3FmQWk5VUx3WHkyU3k1ejZzSkthb1RnMWQy?=
 =?utf-8?B?aTRzajNkTjQvUlVEcUlEU1hFeUs1M3IzcncrZmtydlNOZVpMVFNHREhQWlVF?=
 =?utf-8?B?dlFKME0vaXVIdUFyRnN4VVNhSVpoMUtwM2JKSGFIZDZwQ1pkNXFhbVQ1a2ZN?=
 =?utf-8?B?NFNNMEI1TkpnQk1CMEJ1S1k3L0FnT2hKc295TER5bGFYVHVhWHdTRmlpb2dy?=
 =?utf-8?B?a2padUN2Q2NEaTJDdjhuVzFMT3hyem1JN29QY3BiNDBCMEx6Q3ZPMWJSSXNM?=
 =?utf-8?B?RFJ1M2VtYTdLSVdFZ3FJZ3pJR2Z6OWJTSHNGVmFYdkk3cU9DU0RVMHk5eEtQ?=
 =?utf-8?B?c1Zyc2JPUXErSDNVMkRKMDFNWVhsV3haanhHNklxK2FLMDBRazMvYXdBcWts?=
 =?utf-8?B?UlJvR3hGb3FRaUp5NmU4TUl5UjRyQS8rVmlZN0w0NWo2TWRqMEt2Vlh1RUVo?=
 =?utf-8?B?dVh5S1FubFdyVU9FTW9wNDhBM2UrOFB4QytURHcyaEcvbGFqbE1CQy9UbHpn?=
 =?utf-8?B?dCsxRDJqOXJFcDBCVkhvSzhHaWhWNHAwNGd2enZEYVE0cTI1dnUvOVR2aE1x?=
 =?utf-8?Q?JsOQDwT790a39I1Xu1XgV2sgsmDNNAs+uTQuhwkBPEMc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e304582-afb4-4f43-ff56-08dab016fcac
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 08:10:00.3342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLrPtX/SCImlkbSMO5DwpIPaP8sTkhTfg1TGH67gc10yEKQ8kGiaA1H69RcQ55Sg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6450
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
Cc: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, torvalds@linux-foundation.org, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Arthur Marsh <arthur.marsh@internode.on.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.10.22 um 10:01 schrieb Dave Airlie:
> On Mon, 17 Oct 2022 at 17:07, Christian König <christian.koenig@amd.com> wrote:
>> Hi Arun,
>>
>> the hw generation doesn't matter. This error message here:
>>
>> amdgpu: Move buffer fallback to memcpy unavailable
>>
>> indicates that the detection of linear buffers still doesn't work as
>> expected or that we have a bug somewhere else.
>>
>> Maybe the limiting when SDMA moves are not available isn't working
>> correctly?
> It is a CAPE_VERDE, so maybe something with the SI UVD memory limitations?

Yeah, good point. Could be that we try to move something into the UVD 
memory window and that something isn't allocated linearly.

Arun can you trace the allocation and make sure that all kernel 
allocations have the CONTIGUOUS flag set?

Thanks,
Christian.

>
> Dave.

