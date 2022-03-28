Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2944E980B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 15:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD14210EB0D;
	Mon, 28 Mar 2022 13:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F8310EB0D;
 Mon, 28 Mar 2022 13:26:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdaeWIKISRWnZV8xs4a+JOFVmYFH5TDxWqhvUTK08gGzL8INBgpXo3rLvxm3QLBaSmkre0ZUqogcI6IBX+92STsPT664oOi/0Jno7m8HccctFfA1sz32hBWaW+44hUVlwVRhhwcw3jtHA/AeuU89CBXrc4ZcYyJ9Nc8jDGFLUYaG21PhqmqQzBxeZMj1q6aCUos7D8WVoDoiXOCjqbDfjC3cOc30zkxuZB1XuJe3894qWPOmn6JdxVjLkpmZ9/nwgTVlcWI0LvTmfoC3NZtJhs7kLSyREUoIaJ3999WEY5gIdpvON+ogj+YWgN3+RVNQe1GKEDCXlTzz7rWFNYe4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IF5OfN3d96rrV7IhAr1Vhm+hAgpUIrnHAWKzT2UNHqk=;
 b=n1jJh0YFUHN+yk0WeK8jt/Avs3MvVrUsp0FnqioAigPKim/o4AyzIK3B/vWoyOe4Kov9BdCXH9X/TxnoFLjQR6HS/dYU+oEiU6d2Om6LMB4H+wB3tepwFYxwuisAk0i/CL2JsX1eDfX2nsd5SbV5Fv1eo0qShmBJxmHr1yBDC9ZdUJDIval1BocevG6uS2iOyQAE3YVPHdmImHyVukyTlsiFq4/AGnBJSjwNg2xQsVa1971B73HXjM58OOxnRn6T/TXgWx4Ec5mKtQLnJ2LLcDLZ+Eclfkmn3vyIumGVJxk+WOkj2GDlU/8pgNdV4ykPJTmqB9ixb++lCwejuZOr6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IF5OfN3d96rrV7IhAr1Vhm+hAgpUIrnHAWKzT2UNHqk=;
 b=xgv/pSCVajB+tSRvkptPbDyWZrsfciDaZxLhxkqrKmOdqFh2K/nMNQrpqE2aYRq6rkKSxNBqgWDYYf1qrXefPiVNpzn6o/Epw4PduU/WhCEEN8q/XK/0HrBWRsi9iC1jihMO4Ih7BkNkK2Rwh3nIhi2p8+Rztw+Kqpt/1DFbQHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BYAPR12MB2648.namprd12.prod.outlook.com (2603:10b6:a03:69::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Mon, 28 Mar
 2022 13:26:38 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703%6]) with mapi id 15.20.5102.023; Mon, 28 Mar 2022
 13:26:37 +0000
Message-ID: <2a9db303-a06e-d266-0d04-f6f6aaa6d2c4@amd.com>
Date: Mon, 28 Mar 2022 09:26:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>
References: <20211117134926.1d339d71@canb.auug.org.au>
 <20220120142639.02c54ae9@canb.auug.org.au>
 <20220302123126.65bcbc82@canb.auug.org.au>
 <14b6a691-d31e-2e54-cf91-352b9b30414d@amd.com>
 <20220328105653.033d2920@canb.auug.org.au>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <20220328105653.033d2920@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:208:91::36) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bba4ba6b-1adb-45c1-6964-08da10be9646
X-MS-TrafficTypeDiagnostic: BYAPR12MB2648:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2648D91AD94DEC7AF2236A11EA1D9@BYAPR12MB2648.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MsAgPX6PaqtCLma1/glGRT65gc1VlpSPMNOaQCXwLggjEA6Pqvhsp9YdOoAk/wIJ41UpZj9+l6UOgtVdHKLS+gPwZO3IgdtkOy7VTWFIZ/bi4t/gi+2e+s6QbAYh8cX/JmyXDbBcR/7FpA8DaWw0gyTNJ/yhQE/DMIgGFh+j9QYn2EqZi9u2g1bpkJUVcIHyJZJ8+V0vyEofP64Aclk6Gwxa2y/wnZUgVpjhdxtjRdDOTMm9VVxrbgs/vg1WBTJM3MpIBv1/yj5SaZRuDAuPHXrWJpLtRMPoQFl2GiII8beWr+OqaEWiNOjrN2sUK3F2tQpxIXiDIJdCHwzzRpmPWpCLUBCNjSObevlu6W7A0iF5YyPoBLU7DCWgaBd3EHbNSapyRYJB2aV4YtFPTWnALsJbZ3Bh0uwb4BOmAb9zOg/LZvg8JTDxUZIupR5I8NNowv4/QYUKd2sqJ45Oun1bL+LIbOQWgWNshPd0Swwp/Tot8QxdJcl9kkJN9ALLBMMFVhh+pXC42oWPmGu1Uf0yVCKIEWQJPApHiPx070mJgK20OUCVzcuT5XUt+oC6b+q/evHnZHej1ATj/gSvnXEF80yl75YFKD7Duus8QpkG4hpMkLUmRf+Mi4uVy11r6gKFtHPOBxrcRtoQpHsDQKj4XkIthzbk1nDIAyLokLGdEpTJGZGmreAENsiu3HIepFxsANNmNrScXjfkNVlAWMQZ1ZI2/dCXTJYfFm5rC3+Dgpw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(8676002)(4326008)(186003)(2616005)(66946007)(66556008)(86362001)(31696002)(6486002)(508600001)(6512007)(83380400001)(5660300002)(44832011)(6506007)(8936002)(2906002)(53546011)(31686004)(38100700002)(6916009)(316002)(54906003)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1cyaVE2KzhWN04zR2I5U05uOU1tRzZwaWtmNVMzT25HVm1sWkdpUnNGQWlW?=
 =?utf-8?B?SEdrRVJISkZtbk1zRWhxWks5bk5STGhBb0x6SU9CUTVxd0JkQVVlMjNDMzhS?=
 =?utf-8?B?aHJkd3BKUFdzODRNdXVNNXM0RUNyYlRiNTlKZ2dMQngxRzdLYzBHMCs3bXJJ?=
 =?utf-8?B?SGtGK3JVL3FHUzQ5WlprV2pwSmZicUZyeWJHMFdwa2FaaGNrNEJ4Sm1FUjY5?=
 =?utf-8?B?am0vcmpUejMyb0s4OWZGQ0ZsUHllMXBrdkZ1bFNvMVhlU3QyUDVJYlFvclpq?=
 =?utf-8?B?ZStOVWJUVU00cCttS2h2aDNTaU5HQWtxSml6QXdjUDI1Sk1xTU1PSEQ1VnVs?=
 =?utf-8?B?SVUwSElTWUVSOHgvS00vT0tEWVNXWndaZW1jU0lXOHZUNEtUQmFBeGJ1ckZF?=
 =?utf-8?B?L0x5cFcrUVpLNVptd2FLSWt3Z0kzMDNWZlhzRTl4VjhmTWNIbGVRVXFwOVNj?=
 =?utf-8?B?SWJJRkhsN2k0K2d3dzlESENCbVVUcmttSHR3aHp0N1BXUHlNUm9mSFRGcEs2?=
 =?utf-8?B?Z2pQMVlCbXAwOUMyaXpUYnAzZmVEcUduMFl1RDd2UEo5ZEVnS3VBSHZwbzFG?=
 =?utf-8?B?Q2NjSzRxWUtmVm92RTg5VWtoZjhhN056SHl0SUZrUkxxbzZkaEZsWDFxaDVJ?=
 =?utf-8?B?OXRwRDlwZWkxZjZTYllUSUkwQUhlQm9TOEI5T1FpZS9iQVBWNW9CUkZXZlNX?=
 =?utf-8?B?Z242MjhBNTFPbWpVakxBR1V2WHpkWmJLVVVwdzlYWUV1ZTBmVmpUbEJvTEQz?=
 =?utf-8?B?b01xZ2ZzZmt5QWlWWXlBUC9ZK1RoOExqc0JnTkJiMTJKWWJXVjVZdXdBOUhW?=
 =?utf-8?B?azFRT1RXN2lrd0lNWFRvZHR3NDVDbnczMHBoaXNnYmgvdU9rWVVieXRhZlJt?=
 =?utf-8?B?MmdVVGxDdHhUZWU2Zk1POUw2SFZra1FZL0lKM3kvblVoWFc4N2hIeXVqbUxO?=
 =?utf-8?B?OXlPS09TaXZXSEdyMVNxQThMTzRUbHF0SlJ0YkVhbERVVDRLbEsvOVNHZEhG?=
 =?utf-8?B?bW1FM1ZCL1JSL1BWVXNSN214a0t4bnMzZnBXWlo3VFpoNXNtMHBHWEZ0bHor?=
 =?utf-8?B?VE5KajFMdXFyMEpRalYvMHo5bzJYcE9mS29CcjQrY3g3TVdHV0VQcmdNMWUw?=
 =?utf-8?B?ZVVBMFhhVEJrdG15TnpMZEVWcFhlREhNSGR4OUFHcC9TeTJZczFubTZJK24z?=
 =?utf-8?B?MmlrUm5sOXJSWHJGMWkxWWJLeUVQMzhIdS93SThJN2o3eUZudk5lVk5sKzFq?=
 =?utf-8?B?YmR5c044aVgwTEZOdlhTZjZCSnprbkNCc0lkaTFsZXNzL2JwRk9tYlNGNTEz?=
 =?utf-8?B?UUk0U01YMXdUaDdHQ1IrUTU0UnhzMStWTno0cTM1bTZOaEJ2b1B2Z1A1c1NW?=
 =?utf-8?B?ZzY1bldzRUtsNkVqT1M0ZU11RFhRTTNBRDRFNy8vRWxNMlJ3TFB3c0toYXZC?=
 =?utf-8?B?bURNSmg2TzZJQTEvRkZqSkVsczV2UG5XYUgraGlwRWNJeExKbEdlSXhGN0la?=
 =?utf-8?B?OC8yODg4VHJqUnRKdU40c1N5MzZqNG13aEJSTEdkR1lHMVRaSURiTEJaSDRO?=
 =?utf-8?B?NnAwK1cvNFpEcFZSNUQ0bVRtV2lrL3VRR2FGSUhvb25ZbS80MW5sckV3Z05J?=
 =?utf-8?B?cG1DZGR5c1VmM0V3RFM5WmpnK01MU2FJZE5xVzRxc2NEeDFNUmFhVHo4WUtt?=
 =?utf-8?B?Ry9Md0tHQURyY2c4MUpaYXJZaTNQRWJtYWxtVE5VY3ZpTEFoL3VMUUZTcmpW?=
 =?utf-8?B?QURXaDB5dDVrd2lsTTF1NkY0NEFsVmkvVDZWMmJsazlVb04xSmNYbDVha1NM?=
 =?utf-8?B?WklmMTcxNVlNRHJRdU1MaUU3Mm5LYVVmNDBYRmt6NUxGeWFDTEhXTmZ1cGZC?=
 =?utf-8?B?b3RsaHVNN1RxWHFwbEJZSDRURWIwdHQxV1ltWWV4anVBUUdPQXVpNkxIcEl1?=
 =?utf-8?B?L1hRemVqZ0VRTk9jYW5KWW04eGdrRjYrNG5sc21SUlpMK01DOVlxajlCOG5l?=
 =?utf-8?B?T1RYdTJPOUZZMTFLRWFEdEtJcUk2UE4xZVFaZlBKZVBKSHYzQ0Rob25mNWUr?=
 =?utf-8?B?MmFLYUIzVHdMNlBNUEVST0xRZE5yODNWbkZRcWZLTnk3d2NTWHVYK09TaTRF?=
 =?utf-8?B?T0N4V2J0NU10WThSaW1UWGlrREVLNEFmZFB2Rk5IZklhK3FvdVB4UWtmZXdD?=
 =?utf-8?B?UGdwb2xiWitpNHZMTGkrUTU5UkZkR21zcmNoWUJSOEFGcVZyejA0RG53ZW1W?=
 =?utf-8?B?QWgyYndsNzJ5YTM5RUNiaUZUM2RxeERTRURQUXcxM0s0VXdGaFRaaWtmMTQr?=
 =?utf-8?B?czdTWC9RN3JZNDEyRlh4L3MwSzYwV2J0VWswTVV0L1ZtSGNPK3lFQTBXdkhp?=
 =?utf-8?Q?Lbm1ZAZWkH9lsh2ecIyKbIHh4cIpIzEcgvFZFei9qeaVC?=
X-MS-Exchange-AntiSpam-MessageData-1: UM7xjZfwIDVJyQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba4ba6b-1adb-45c1-6964-08da10be9646
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 13:26:37.9092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETwFugFME/VNBR/0vRLij+oOxRaTrUsiiEtQ6OzDti2mWmpm4UclzLtLn6pe7yVSToBQCqtpe8YKYigMEObw7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2648
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-03-27 19:56, Stephen Rothwell wrote:
> Hi Andrey,
>
> On Tue, 1 Mar 2022 22:26:12 -0500 Andrey Grodzovsky <andrey.grodzovsky@amd.com> wrote:
>> On 2022-03-01 20:31, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> On Thu, 20 Jan 2022 14:26:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>> On Wed, 17 Nov 2021 13:49:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>>> After merging the drm-misc tree, today's linux-next build (htmldocs)
>>>>> produced this warning:
>>>>>
>>>>> include/drm/gpu_scheduler.h:316: warning: Function parameter or member 'work' not described in 'drm_sched_job'
>>>>>
>>>>> Introduced by commit
>>>>>
>>>>>     542cff7893a3 ("drm/sched: Avoid lockdep spalt on killing a processes")
>>>> I am still seeing this warning.
>>> I am still seeing this warning.
>>>   
>> Please check you have commit c7703ce38c1e Andrey Grodzovsky   3 weeks ago    drm/amdgpu: Fix htmldoc warning
> I do have commit c7703ce38c1e (in fact it is in Linus' tree), but that
> commit does not address the warning above.  I am still (as of Friday)
> getting that warning.


Got it, i was confused. Sent a patch to fix, please RB.

Andrey


