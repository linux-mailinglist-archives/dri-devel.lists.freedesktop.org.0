Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82C966889F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 01:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D7510E96F;
	Fri, 13 Jan 2023 00:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78CF10E1B7;
 Fri, 13 Jan 2023 00:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673570384; x=1705106384;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=TRPLVfmXFWmjl20ptnBpEmni6y9AZb+wBJ/CzF1j+Sg=;
 b=Ih41hFWSUfnk1ScZGO1wngXzFLRn58eAGAxtmEpp1ct2MsBqjy2QMFmT
 t1bLfIq0IMbl9h0AxFmUz6V1qhfjYQnLT0IwN3Nzy0BkmWoK53CN4pfb7
 GNk8nXkLk02O1JKNHWOj+wLARZ9iDLalolCc2yL/06jqNoDxGkbmR4sXt
 Q2bdOrCK2HhPIVe9dAJ+myUql0vte3a92EyptY4QTF7v4NMgfiXPmN6fj
 uYxB878XXwH6W2cvMtUPli54Yi0tGxzSYLqDv6UcP9U2Rhi6T3qbmsyUO
 If/2m1j45vKPuGlnpJltbLJGq/aUfZYBHPqM56j2YVU+u+539g2ITG1O5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="351106841"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; 
 d="scan'208,217";a="351106841"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 16:39:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="660046451"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; 
 d="scan'208,217";a="660046451"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 12 Jan 2023 16:39:39 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 16:39:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 16:39:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 16:39:38 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 12 Jan 2023 16:39:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D04xhPnqizRF0A84/SVZVivSxcg3oKllQUw35Cv+Kgw58qiE5S7iYllgLl2l2ed2qRBS2HHhPqb3c5+oyNm99Dy/CXrnEFKgmPCVBMPOC72T22K1HwbmjaZSHxzZpN05OlAjDcS/aP2FKOQ5lyMh78ekj7XDyK/vFha1PXGRFHz+W9zzltVF69Wq4/GoFDTx2sTnVdWtqyKKuqJOBA/x4Aw8yJqTRGPW1G4ToCY063a10dFJS5w9IXynMCyMa1zfLAOFs4PQLI9bw8u5sLaPQHBn8G/VQgtt0ucT1b9pZ/7HVHwmnq8TUIBKe9psxLpOHXRndm3WjYTlJmW3jeSVkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJSUX6yrpM9ll9/Zd2t1rMwVT27NciO4tsd6v4EpfLw=;
 b=JjDjzjCO/pDQPJcvudRM14dAsB3JUq2Vjrzouc/k+COoo0QWqPsrkqgBI62bX+KgitRPW7jkuMYibZQR8OpgPPq03g9jXfkFqkkCXXblkD2OdtUroJ0MiQrbMYAcEkZAcG43lhKZyZeGMKldazDWLlk5huA6PfBBoIadSKX4AdyrLf5dJ2/IN8x1xTiOJzTHc8vs8YiTclXG4iGU6HGq6sZzF+JGxCpnSemcXrXiKTdbyfturV7a+JfjxIoLibpCywnmskJ6bXe7Wy04k0C0ey0tAJl9Hg2EkgXpNOnq6nnNY7CiF0xWt6bDW/rPT3QJVZ0BiwP+3TWlzW+H8vK65w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH0PR11MB5190.namprd11.prod.outlook.com (2603:10b6:510:3c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 00:39:34 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ec2f:4a87:326b:2610]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ec2f:4a87:326b:2610%7]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 00:39:34 +0000
Content-Type: multipart/alternative;
 boundary="------------P0E6w0cBk8DnIBzWTBVMRW6p"
Message-ID: <37381bd9-5529-e531-623b-cfdd8ced1037@intel.com>
Date: Thu, 12 Jan 2023 16:39:32 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
Content-Language: en-GB
To: Jason Ekstrand <jason@jlekstrand.net>, Matthew Brost
 <matthew.brost@intel.com>
References: <20230102083019.24b99647@collabora.com>
 <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
 <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
 <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
 <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
 <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
 <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
 <CAOFGe957uYdTFccQp36QRJRDkWQZDCB0ztMNDH0=SSf-RTgzLw@mail.gmail.com>
 <705a0b3c-2fe5-0393-0fda-511f288007c7@linux.intel.com>
 <CAOFGe96KQUmy20_h3OmmXGVmuGkEm8iDhnLzgBjM5dnPApqYvQ@mail.gmail.com>
 <Y7841j8PZ1T9MPEl@DUT025-TGLU.fm.intel.com>
 <CAOFGe970mwYgt10RdGURiMYc1x+MFy-uYOBT++Mygz4tu1XN4A@mail.gmail.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <CAOFGe970mwYgt10RdGURiMYc1x+MFy-uYOBT++Mygz4tu1XN4A@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::7) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH0PR11MB5190:EE_
X-MS-Office365-Filtering-Correlation-Id: ab77998e-210a-4aed-8f36-08daf4fea483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yTbI6RPig9fCTOsaMxiVgZbNfdwoNl3L4+yecHqOncxjLU8ukCGPUnLHKVQWRP9A4B1vz3PO3NaQhHjH7rVVVDGLZB39DSTqTD+tmVmjdWTWNihmyqRX04rQxagsjLqZFx66vLJQUhWL5kK72KHPbKiqpvgBS1knfsEgHxHEa/uRwAr9JwWQWG2E4WCikSRelQS2hkPFeiUxuunUTE/3QL5O4aMZZoSR6kmC44rReGxWbbiWqrUuXGb6vMgfJtlqSRzp2GiWDENQ/H7apCOs56gLjFUbJOwT4yTu04IYMGy0STG6MO1lL7SzBThKiyDbWDqeePg9tD6gdz67HlS3qBj8kxvfF/9RK2ISV9OiHXiPRJhy2zdeqnoV0d0N5mpI2P79yYH5a0Gy9dU+MLk4svX/sC/T/17S6mU4+1+Kbq/PdFJb6NaIxQKJttcrszk8uoASwrqZHQ+wur3prSIFDlVt5YqbmqV8GK0Idpo6l7FkLsSI2cVJD96ewQA3llLEIh6lRIe+v1kTmPzx8igTo8tZRfETEv1oQvAZ/TdPj7dpI7D6vcYGsJfM5Yzvu/Y/9JZRO0ghFl8REf5c5u32YkawfXTbTM07ETitLUm5XKR9O3VnvX8HaeIuoDPWImM7F8NX6ilhEo47ZBpv0LhuxzvljXYJ1UVzzawvCWy0rIMlxF7ycCm8n8WxhcpyjtjQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199015)(2906002)(83380400001)(66899015)(478600001)(66476007)(66556008)(5660300002)(66946007)(33964004)(186003)(53546011)(8936002)(6636002)(36756003)(26005)(6506007)(30864003)(6512007)(6486002)(2616005)(31686004)(82960400001)(41300700001)(38100700002)(110136005)(8676002)(86362001)(966005)(166002)(316002)(4326008)(45080400002)(31696002)(43740500002)(45980500001)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW1QM0djZk1WNVRZcDFYOGdqbEZld1hFUm5neFdvVUg0OWFrZjh1VHJ6dFY5?=
 =?utf-8?B?Rk5CT1J5bHFiU0c2dktwRmhEYTN3V0dxMFlXdUU0MjVFQkRiVVdhampYQi95?=
 =?utf-8?B?SFpnN0d0UXhrVFZneWZsV3dTU0x0Q2N5ZGpnNEhpTEpmdkJjVFNMNklzTFMw?=
 =?utf-8?B?S2ljazNINTVENlY1R1JGN1NkOVFoUnVhUnNDanhrRGhNeDlaTEVmN2oyRkdF?=
 =?utf-8?B?bVJ3ZjlqMzdQY2F2Z3oraFg5bEpmMklJbllTWnkrZUJtT0VucnRZM2xBOEsv?=
 =?utf-8?B?aXV3YUxOTXg1eFRKSC9TMWxtUFN3K0RDanUxbUlZRlNUQk14ajlPRzc4THNz?=
 =?utf-8?B?VE9tNzhUb3pNRGZRUjk5SDF3QmFKTmxQc1Yzem56eTY1T3hZRTQrbFJTaXB5?=
 =?utf-8?B?M2ZyTFBsVXViS05XWTlwTldVajRBblNRTjBzNFhtTlZ2NkdJSkhBdXd0bnZ2?=
 =?utf-8?B?VXpZeU5OU0REdkc5ZSsyWm40ZE9Ca0F1Syt4bFhyOE9WdTN5dWsvbUNmZlBN?=
 =?utf-8?B?SG1Cd3NBMGxjZjN0SzBGMGZOR3pTaGNRSDhWbVhueWJiVDRDWFdKUmMyS2h4?=
 =?utf-8?B?YjU3VExPb21KVXlpM1E0VVBOSmNwNkhWNmtuaVRiTmVkOHJ3YTk2cFpOOUcx?=
 =?utf-8?B?eGJVM05oSnF0c0JqL3B3elNrU1UyRUVCcVhaRE1JNDJRWStWN09pdXM4THA1?=
 =?utf-8?B?aHMxYTRVRnVGL0EvMUhjYU9lRWlGSTN5aG9JMXB3S1NuNWJJd0owcUsvL3cx?=
 =?utf-8?B?WFlsQVBSSkh1alJkMHBVSncwUnNDcjZMQkxkeFpHbkxlQjE2Vi9rcGk0eXQy?=
 =?utf-8?B?aVkwa2J6bVlySHNrRmcwVWQwMkVpYzdFcG9abWRObTMyUi9wMVJITDFZcHh0?=
 =?utf-8?B?alMvWVdSWDRzUnJPeFdzeWlsWnBBRGE1cmlDdXdVSHNHd3NtQVVRaEtJUkRx?=
 =?utf-8?B?eWMrMnlPRVN5QjlVSmVuMHFvUHgvWm9OWXlrdjBlQzFBc0ZJK2FucW53czZI?=
 =?utf-8?B?SnFwTmZYVlBmdDR1U1ltbE1kY0VSZ2FGbFNNRmVsTHMxQ05SQkIvbHVINXRU?=
 =?utf-8?B?UmtPdm1YRzc0TXp1dUJhS1M5eXZ1REp0Mld5b0lUeU80K21POU4vMHc2Qmt4?=
 =?utf-8?B?bzdJOGFTRm10ckprZitjM0tkOS9ZU2FsTHZhNzZ1K0ZFMnhOck9Va3lrcVJK?=
 =?utf-8?B?UFAvSFRYdWZhTW9LN3FTVDBIZUpLejRQSFM3ZklUZy9MSUN0eldJZ3ZVbE44?=
 =?utf-8?B?KzBzd1dkL2M2UkZGQWI4NGphbjVCcjNzVVhkd0xzR1ZZSDY1V0QyRnZEZTkv?=
 =?utf-8?B?N21qbGdsSXdwRnlHVlhBWjNxbWw3dVdKNU1KZWZabU5hSnRTc1lvRjVDcDMy?=
 =?utf-8?B?Yk91VHhvaHJVUFZUWlVLeEI1KzV5ZnpvdlRkWjZYM2JLOGxHdGl4WmlwWmhR?=
 =?utf-8?B?cDM3bHdQc0hmODlBeUwwaTBMWGJVUU9iZUg4QzcyRGwwbkF3QzArbHFZcnpV?=
 =?utf-8?B?MFFmRkhHTTRDaHRvZW5jY3ZOY0tranhJNm03eFhnc0NZejdHZTlqdHpDTFVQ?=
 =?utf-8?B?VVo4aTl2ZGxseFpxMTVGZHZQWjVPVTV0UElkbWlsMlBuYmhiUXRVT3A3ZjBN?=
 =?utf-8?B?dmdncHc0WmFOMHlHMnMzQ1d2WmtkSlFEWGFPZG50T3E3OU9HcUUzTzVlQm5Q?=
 =?utf-8?B?dFFySXdrR0w5Z284R2pCZHQzd2JPQkRFMTdYVk13UEZHbndoWXJMWHhpSjF4?=
 =?utf-8?B?c2orTWRJNi9TYUVGR2huVWVuR0g5RENVbW9ZclVuUjk4Z1F1RFdRMUwvUlV0?=
 =?utf-8?B?QTlOZG9ERW5mOEdmTmU4ZzViRW1vdFVXcThXSGNkdHU0aklRcE5qMUJyTHlB?=
 =?utf-8?B?OHBCMUtOaHBOeE1tZ3JMZXN0MnprZXM1NzJMSTJVdks3R01wSlB5RFpNVyth?=
 =?utf-8?B?dThxNVVTZzZZaVRUcWkyaVlRMG1kNEFaVVZyQ0lVVnFLcW1wWHdzcU4rWkZq?=
 =?utf-8?B?dStPQ3Q2d2txb3d2dDJuRXBobHg3aFVZdGNzdUg5Z0YvSnNhbmFKbUFLbUxT?=
 =?utf-8?B?K2pLZDErOFpNd3N0NFRrN0ZpdkpveEovaHVGc1kxU293bTVUVlk0YzlLN0Zr?=
 =?utf-8?B?QW1Pd01yUUwyY1NRMlh0SnowNUdIYzRGRFcwUVNEL1B6aUZnWEgrVkhseHZ2?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab77998e-210a-4aed-8f36-08daf4fea483
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 00:39:34.7645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UoD13YWYAVuRJdfU50igYs7gRJ/yP6egOYZtRVKbYljHzj4yfGVs69niI0JSI2km07DHy66I45gct8nrDNc1DaYo4gJueIUTIxPXTD+M+HU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5190
X-OriginatorOrg: intel.com
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------P0E6w0cBk8DnIBzWTBVMRW6p
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 1/11/2023 14:56, Jason Ekstrand wrote:
> On Wed, Jan 11, 2023 at 4:32 PM Matthew Brost 
> <matthew.brost@intel.com> wrote:
>
>     On Wed, Jan 11, 2023 at 04:18:01PM -0600, Jason Ekstrand wrote:
>     > On Wed, Jan 11, 2023 at 2:50 AM Tvrtko Ursulin <
>     > tvrtko.ursulin@linux.intel.com> wrote:
>     >
>     > >
>     [snip]
>     > >
>     > > Typically is the key here. But I am not sure it is good
>     enough. Consider
>     > > this example - Intel Flex 170:
>     > >
>     > >   * Delivers up to 36 streams 1080p60 transcode throughput per
>     card.
>     > >   * When scaled to 10 cards in a 4U server configuration, it
>     can support
>     > > up to 360 streams of HEVC/HEVC 1080p60 transcode throughput.
>     > >
>     >
>     > I had a feeling it was going to be media.... 😅
>     >
>
>     Yea wondering the media UMD can be rewritten to use less
>     xe_engines, it
>     is massive rewrite for VM bind + no implicit dependencies so let's
>     just
>     pile on some more work?
>
>
> It could probably use fewer than it does today.  It currently creates 
> and throws away contexts like crazy, or did last I looked at it.  
> However, the nature of media encode is that it often spreads across 
> two or three different types of engines.  There's not much you can do 
> to change that.
And as per Tvrtko's example, you get media servers that transcode huge 
numbers of tiny streams in parallel. Almost no work per frame but 100s 
of independent streams being run concurrently. That means many 100s of 
contexts all trying to run at 30fps. I recall a specific bug about 
thundering herds - hundreds (thousands?) of waiting threads all being 
woken up at once because some request had completed.

>     >
>     > > One transcode stream from my experience typically is 3-4 GPU
>     contexts
>     > > (buffer travels from vcs -> rcs -> vcs, maybe vecs) used from
>     a single
>     > > CPU thread. 4 contexts * 36 streams = 144 active contexts.
>     Multiply by
>     > > 60fps = 8640 jobs submitted and completed per second.
>     > >
>     > > 144 active contexts in the proposed scheme means possibly
>     means 144
>     > > kernel worker threads spawned (driven by 36 transcode CPU
>     threads). (I
>     > > don't think the pools would scale down given all are
>     constantly pinged
>     > > at 60fps.)
>     > >
>     > > And then each of 144 threads goes to grab the single GuC CT
>     mutex. First
>     > > threads are being made schedulable, then put to sleep as mutex
>     > > contention is hit, then woken again as mutexes are getting
>     released,
>     > > rinse, repeat.
>     > >
>     >
>     > Why is every submission grabbing the GuC CT mutex? I've not read
>     the GuC
>     > back-end yet but I was under the impression that most run_job()
>     would be
>     > just shoving another packet into a ring buffer.  If we have to
>     send the GuC
>     > a message on the control ring every single time we submit a job,
>     that's
>     > pretty horrible.
>     >
>
>     Run job writes the ring buffer and moves the tail as the first
>     step (no
>     lock required). Next it needs to tell the GuC the xe_engine LRC
>     tail has
>     moved, this is done from a single Host to GuC channel which is
>     circular
>     buffer, the writing of the channel protected by the mutex. There are
>     little more nuances too but in practice there is always space in the
>     channel so the time mutex needs to held is really, really small
>     (check cached credits, write 3 dwords in payload, write 1 dword to
>     move
>     tail). I also believe mutexes in Linux are hybrid where they spin
>     for a
>     little bit before sleeping and certainly if there is space in the
>     channel we shouldn't sleep mutex contention.
>
>
> Ok, that makes sense.  It's maybe a bit clunky and it'd be nice if we 
> had some way to batch things up a bit so we only have to poke the GuC 
> channel once for every batch of things rather than once per job.  
> That's maybe something we can look into as a future improvement; not 
> fundamental.
>
> Generally, though, it sounds like contention could be a real problem 
> if we end up ping-ponging that lock between cores.  It's going to 
> depend on how much work it takes to get the next ready thing vs. the 
> cost of that atomic.  But, also, anything we do is going to 
> potentially run into contention problems.  *shrug*  If we were going 
> to go for one-per-HW-engine, we may as well go one-per-device and then 
> we wouldn't need the lock.  Off the top of my head, that doesn't sound 
> great either but IDK.
>
>     As far as this being horrible, well didn't design the GuC and this how
>     it is implemented for KMD based submission. We also have 256 doorbells
>     so we wouldn't need a lock but I think are other issues with that
>     design
>     too which need to be worked out in the Xe2 / Xe3 timeframe.
>
>
> Yeah, not blaming you.  Just surprised, that's all.  How does it work 
> for userspace submission?  What would it look like if the kernel 
> emulated userspace submission?  Is that even possible?
>
> What are these doorbell things?  How do they play into it?
Basically a bank of MMIO space reserved per 'entity' where a write to 
that MMIO space becomes an named interrupt to GuC. You can assign each 
doorbell to a specific GuC context. So writing to that doorbell address 
is effectively the same as sending a SCHEDULE_CONTEXT H2G message from 
the KMD for that context. But the advantage is you ring the doorbell 
from user land with no call into the kernel at all. Or from within the 
kernel, you can do it without needing any locks at all. Problem is, we 
have 64K contexts in GuC but only 256 doorbells in the hardware. Less if 
using SRIOV. So the "per 'entity'" part because somewhat questionable as 
to exactly what the 'entity' is. And hence we just haven't bothered 
supporting them in Linux because a) no direct submission from user land 
yet, and b) as Matthew says entire chain of IOCTL from UMD to kernel to 
acquiring a lock and sending the H2G has generally been fast enough. The 
latency only becomes an issue for ULLS people but for them, even the 
doorbells from user space are too high a latency because that still 
potentially involves the GuC having to do some scheduling and context 
switch type action.

John.


>     Also if you see my follow up response Xe is ~33k execs per second with
>     the current implementation on a 8 core (or maybe 8 thread) TGL which
>     seems to fine to me.
>
>
> 33k exec/sec is about 500/frame which should be fine. 500 is a lot for 
> a single frame.  I typically tell game devs to shoot for dozens per 
> frame.  The important thing is that it stays low even with hundreds of 
> memory objects bound. (Xe should be just fine there.)
>
> --Jason
>
>     Matt
>
>     > --Jason
>     >
>     >
>     > (And yes this backend contention is there regardless of 1:1:1,
>     it would
>     > > require a different re-design to solve that. But it is just a
>     question
>     > > whether there are 144 contending threads, or just 6 with the
>     thread per
>     > > engine class scheme.)
>     > >
>     > > Then multiply all by 10 for a 4U server use case and you get
>     1440 worker
>     > > kthreads, yes 10 more CT locks, but contending on how many CPU
>     cores?
>     > > Just so they can grab a timeslice and maybe content on a mutex
>     as the
>     > > next step.
>     > >
>     > > This example is where it would hurt on large systems. Imagine
>     only an
>     > > even wider media transcode card...
>     > >
>     > > Second example is only a single engine class used (3d
>     desktop?) but with
>     > > a bunch of not-runnable jobs queued and waiting on a fence to
>     signal.
>     > > Implicit or explicit dependencies doesn't matter. Then the
>     fence signals
>     > > and call backs run. N work items get scheduled, but they all
>     submit to
>     > > the same HW engine. So we end up with:
>     > >
>     > >          /-- wi1 --\
>     > >         / ..     .. \
>     > >   cb --+---  wi.. ---+-- rq1 -- .. -- rqN
>     > >         \ ..    ..  /
>     > >          \-- wiN --/
>     > >
>     > >
>     > > All that we have achieved is waking up N CPUs to contend on
>     the same
>     > > lock and effectively insert the job into the same single HW
>     queue. I
>     > > don't see any positives there.
>     > >
>     > > This example I think can particularly hurt small / low power
>     devices
>     > > because of needless waking up of many cores for no benefit.
>     Granted, I
>     > > don't have a good feel on how common this pattern is in practice.
>     > >
>     > > >
>     > > >     That
>     > > >     is the number which drives the maximum number of
>     not-runnable jobs
>     > > that
>     > > >     can become runnable at once, and hence spawn that many
>     work items,
>     > > and
>     > > >     in turn unbound worker threads.
>     > > >
>     > > >     Several problems there.
>     > > >
>     > > >     It is fundamentally pointless to have potentially that
>     many more
>     > > >     threads
>     > > >     than the number of CPU cores - it simply creates a
>     scheduling storm.
>     > > >
>     > > >     Unbound workers have no CPU / cache locality either and
>     no connection
>     > > >     with the CPU scheduler to optimize scheduling patterns.
>     This may
>     > > matter
>     > > >     either on large systems or on small ones. Whereas the
>     current design
>     > > >     allows for scheduler to notice userspace CPU thread
>     keeps waking up
>     > > the
>     > > >     same drm scheduler kernel thread, and so it can keep
>     them on the same
>     > > >     CPU, the unbound workers lose that ability and so 2nd
>     CPU might be
>     > > >     getting woken up from low sleep for every submission.
>     > > >
>     > > >     Hence, apart from being a bit of a impedance mismatch,
>     the proposal
>     > > has
>     > > >     the potential to change performance and power patterns
>     and both large
>     > > >     and small machines.
>     > > >
>     > > >
>     > > > Ok, thanks for explaining the issue you're seeing in more
>     detail.  Yes,
>     > > > deferred kwork does appear to mismatch somewhat with what
>     the scheduler
>     > > > needs or at least how it's worked in the past.  How much
>     impact will
>     > > > that mismatch have?  Unclear.
>     > > >
>     > > >      >      >>> Secondly, it probably demands separate
>     workers (not
>     > > >     optional),
>     > > >      >     otherwise
>     > > >      >      >>> behaviour of shared workqueues has either
>     the potential
>     > > to
>     > > >      >     explode number
>     > > >      >      >>> kernel threads anyway, or add latency.
>     > > >      >      >>>
>     > > >      >      >>
>     > > >      >      >> Right now the system_unbound_wq is used which
>     does have a
>     > > >     limit
>     > > >      >     on the
>     > > >      >      >> number of threads, right? I do have a FIXME
>     to allow a
>     > > >     worker to be
>     > > >      >      >> passed in similar to TDR.
>     > > >      >      >>
>     > > >      >      >> WRT to latency, the 1:1 ratio could actually
>     have lower
>     > > >     latency
>     > > >      >     as 2 GPU
>     > > >      >      >> schedulers can be pushing jobs into the backend /
>     > > cleaning up
>     > > >      >     jobs in
>     > > >      >      >> parallel.
>     > > >      >      >>
>     > > >      >      >
>     > > >      >      > Thought of one more point here where why in Xe we
>     > > >     absolutely want
>     > > >      >     a 1 to
>     > > >      >      > 1 ratio between entity and scheduler - the way
>     we implement
>     > > >      >     timeslicing
>     > > >      >      > for preempt fences.
>     > > >      >      >
>     > > >      >      > Let me try to explain.
>     > > >      >      >
>     > > >      >      > Preempt fences are implemented via the generic
>     messaging
>     > > >      >     interface [1]
>     > > >      >      > with suspend / resume messages. If a suspend
>     messages is
>     > > >     received to
>     > > >      >      > soon after calling resume (this is per entity)
>     we simply
>     > > >     sleep in the
>     > > >      >      > suspend call thus giving the entity a
>     timeslice. This
>     > > >     completely
>     > > >      >     falls
>     > > >      >      > apart with a many to 1 relationship as now a
>     entity
>     > > >     waiting for a
>     > > >      >      > timeslice blocks the other entities. Could we
>     work aroudn
>     > > >     this,
>     > > >      >     sure but
>     > > >      >      > just another bunch of code we'd have to add in
>     Xe. Being to
>     > > >      >     freely sleep
>     > > >      >      > in backend without affecting other entities is
>     really,
>     > > really
>     > > >      >     nice IMO
>     > > >      >      > and I bet Xe isn't the only driver that is
>     going to feel
>     > > >     this way.
>     > > >      >      >
>     > > >      >      > Last thing I'll say regardless of how anyone
>     feels about
>     > > >     Xe using
>     > > >      >     a 1 to
>     > > >      >      > 1 relationship this patch IMO makes sense as I
>     hope we can
>     > > all
>     > > >      >     agree a
>     > > >      >      > workqueue scales better than kthreads.
>     > > >      >
>     > > >      >     I don't know for sure what will scale better and
>     for what use
>     > > >     case,
>     > > >      >     combination of CPU cores vs number of GPU engines
>     to keep
>     > > >     busy vs other
>     > > >      >     system activity. But I wager someone is bound to
>     ask for some
>     > > >      >     numbers to
>     > > >      >     make sure proposal is not negatively affecting
>     any other
>     > > drivers.
>     > > >      >
>     > > >      >
>     > > >      > Then let them ask.  Waving your hands vaguely in the
>     direction of
>     > > >     the
>     > > >      > rest of DRM and saying "Uh, someone (not me) might
>     object" is
>     > > >     profoundly
>     > > >      > unhelpful.  Sure, someone might. That's why it's on
>     dri-devel.
>     > > >     If you
>     > > >      > think there's someone in particular who might have a
>     useful
>     > > >     opinion on
>     > > >      > this, throw them in the CC so they don't miss the
>     e-mail thread.
>     > > >      >
>     > > >      > Or are you asking for numbers?  If so, what numbers
>     are you
>     > > >     asking for?
>     > > >
>     > > >     It was a heads up to the Xe team in case people weren't
>     appreciating
>     > > >     how
>     > > >     the proposed change has the potential influence power
>     and performance
>     > > >     across the board. And nothing in the follow up
>     discussion made me
>     > > think
>     > > >     it was considered so I don't think it was redundant to
>     raise it.
>     > > >
>     > > >     In my experience it is typical that such core changes
>     come with some
>     > > >     numbers. Which is in case of drm scheduler is tricky and
>     probably
>     > > >     requires explicitly asking everyone to test (rather than
>     count on
>     > > >     "don't
>     > > >     miss the email thread"). Real products can fail to ship
>     due ten mW
>     > > here
>     > > >     or there. Like suddenly an extra core prevented from
>     getting into
>     > > deep
>     > > >     sleep.
>     > > >
>     > > >     If that was "profoundly unhelpful" so be it.
>     > > >
>     > > >
>     > > > With your above explanation, it makes more sense what you're
>     asking.
>     > > > It's still not something Matt is likely to be able to
>     provide on his
>     > > > own.  We need to tag some other folks and ask them to test
>     it out.  We
>     > > > could play around a bit with it on Xe but it's not exactly
>     production
>     > > > grade yet and is going to hit this differently from most. 
>     Likely
>     > > > candidates are probably AMD and Freedreno.
>     > >
>     > > Whoever is setup to check out power and performance would be
>     good to
>     > > give it a spin, yes.
>     > >
>     > > PS. I don't think I was asking Matt to test with other
>     devices. To start
>     > > with I think Xe is a team effort. I was asking for more
>     background on
>     > > the design decision since patch 4/20 does not say anything on that
>     > > angle, nor later in the thread it was IMO sufficiently addressed.
>     > >
>     > > >      > Also, If we're talking about a design that might
>     paint us into an
>     > > >      > Intel-HW-specific hole, that would be one thing.  But
>     we're not.
>     > > >     We're
>     > > >      > talking about switching which kernel threading/task
>     mechanism to
>     > > >     use for
>     > > >      > what's really a very generic problem.  The core Xe
>     design works
>     > > >     without
>     > > >      > this patch (just with more kthreads).  If we land
>     this patch or
>     > > >      > something like it and get it wrong and it causes a
>     performance
>     > > >     problem
>     > > >      > for someone down the line, we can revisit it.
>     > > >
>     > > >     For some definition of "it works" - I really wouldn't
>     suggest
>     > > >     shipping a
>     > > >     kthread per user context at any point.
>     > > >
>     > > >
>     > > > You have yet to elaborate on why. What resources is it
>     consuming that's
>     > > > going to be a problem? Are you anticipating CPU affinity
>     problems? Or
>     > > > does it just seem wasteful?
>     > >
>     > > Well I don't know, commit message says the approach does not
>     scale. :)
>     > >
>     > > > I think I largely agree that it's probably
>     unnecessary/wasteful but
>     > > > reducing the number of kthreads seems like a tractable
>     problem to solve
>     > > > regardless of where we put the gpu_scheduler object.  Is
>     this the right
>     > > > solution?  Maybe not.  It was also proposed at one point
>     that we could
>     > > > split the scheduler into two pieces: A scheduler which owns
>     the kthread,
>     > > > and a back-end which targets some HW ring thing where you
>     can have
>     > > > multiple back-ends per scheduler.  That's certainly more
>     invasive from a
>     > > > DRM scheduler internal API PoV but would solve the kthread
>     problem in a
>     > > > way that's more similar to what we have now.
>     > > >
>     > > >      >     In any case that's a low level question caused by
>     the high
>     > > >     level design
>     > > >      >     decision. So I'd think first focus on the high
>     level - which
>     > > >     is the 1:1
>     > > >      >     mapping of entity to scheduler instance proposal.
>     > > >      >
>     > > >      >     Fundamentally it will be up to the DRM
>     maintainers and the
>     > > >     community to
>     > > >      >     bless your approach. And it is important to
>     stress 1:1 is
>     > > about
>     > > >      >     userspace contexts, so I believe unlike any other
>     current
>     > > >     scheduler
>     > > >      >     user. And also important to stress this
>     effectively does not
>     > > >     make Xe
>     > > >      >     _really_ use the scheduler that much.
>     > > >      >
>     > > >      >
>     > > >      > I don't think this makes Xe nearly as much of a
>     one-off as you
>     > > >     think it
>     > > >      > does.  I've already told the Asahi team working on
>     Apple M1/2
>     > > >     hardware
>     > > >      > to do it this way and it seems to be a pretty good
>     mapping for
>     > > >     them. I
>     > > >      > believe this is roughly the plan for nouveau as
>     well.  It's not
>     > > >     the way
>     > > >      > it currently works for anyone because most other
>     groups aren't
>     > > >     doing FW
>     > > >      > scheduling yet.  In the world of FW scheduling and
>     hardware
>     > > >     designed to
>     > > >      > support userspace direct-to-FW submit, I think the
>     design makes
>     > > >     perfect
>     > > >      > sense (see below) and I expect we'll see more drivers
>     move in this
>     > > >      > direction as those drivers evolve. (AMD is doing some
>     customish
>     > > >     thing
>     > > >      > for how with gpu_scheduler on the front-end somehow.
>     I've not dug
>     > > >     into
>     > > >      > those details.)
>     > > >      >
>     > > >      >     I can only offer my opinion, which is that the
>     two options
>     > > >     mentioned in
>     > > >      >     this thread (either improve drm scheduler to cope
>     with what is
>     > > >      >     required,
>     > > >      >     or split up the code so you can use just the parts of
>     > > >     drm_sched which
>     > > >      >     you want - which is frontend dependency tracking)
>     shouldn't
>     > > be so
>     > > >      >     readily dismissed, given how I think the idea was
>     for the new
>     > > >     driver to
>     > > >      >     work less in a silo and more in the community
>     (not do kludges
>     > > to
>     > > >      >     workaround stuff because it is thought to be too
>     hard to
>     > > >     improve common
>     > > >      >     code), but fundamentally, "goto previous
>     paragraph" for what
>     > > I am
>     > > >      >     concerned.
>     > > >      >
>     > > >      >
>     > > >      > Meta comment:  It appears as if you're falling into
>     the standard
>     > > >     i915
>     > > >      > team trap of having an internal discussion about what the
>     > > community
>     > > >      > discussion might look like instead of actually having the
>     > > community
>     > > >      > discussion.  If you are seriously concerned about
>     interactions
>     > > with
>     > > >      > other drivers or whether or setting common direction,
>     the right
>     > > >     way to
>     > > >      > do that is to break a patch or two out into a
>     separate RFC series
>     > > >     and
>     > > >      > tag a handful of driver maintainers.  Trying to
>     predict the
>     > > >     questions
>     > > >      > other people might ask is pointless. Cc them and
>     asking for their
>     > > >     input
>     > > >      > instead.
>     > > >
>     > > >     I don't follow you here. It's not an internal discussion
>     - I am
>     > > raising
>     > > >     my concerns on the design publicly. I am supposed to
>     write a patch to
>     > > >     show something, but am allowed to comment on a RFC series?
>     > > >
>     > > >
>     > > > I may have misread your tone a bit.  It felt a bit like too many
>     > > > discussions I've had in the past where people are trying to
>     predict what
>     > > > others will say instead of just asking them. Reading it
>     again, I was
>     > > > probably jumping to conclusions a bit.  Sorry about that.
>     > >
>     > > Okay no problem, thanks. In any case we don't have to keep
>     discussing
>     > > it, since I wrote one or two emails ago it is fundamentally on the
>     > > maintainers and community to ack the approach. I only felt
>     like RFC did
>     > > not explain the potential downsides sufficiently so I wanted
>     to probe
>     > > that area a bit.
>     > >
>     > > >     It is "drm/sched: Convert drm scheduler to use a work
>     queue rather
>     > > than
>     > > >     kthread" which should have Cc-ed _everyone_ who use drm
>     scheduler.
>     > > >
>     > > >
>     > > > Yeah, it probably should have.  I think that's mostly what
>     I've been
>     > > > trying to say.
>     > > >
>     > > >      >
>     > > >      >     Regards,
>     > > >      >
>     > > >      >     Tvrtko
>     > > >      >
>     > > >      >     P.S. And as a related side note, there are more
>     areas where
>     > > >     drm_sched
>     > > >      >     could be improved, like for instance priority
>     handling.
>     > > >      >     Take a look at msm_submitqueue_create /
>     > > >     msm_gpu_convert_priority /
>     > > >      >     get_sched_entity to see how msm works around the
>     drm_sched
>     > > >     hardcoded
>     > > >      >     limit of available priority levels, in order to
>     avoid having
>     > > >     to leave a
>     > > >      >     hw capability unused. I suspect msm would be
>     happier if they
>     > > >     could have
>     > > >      >     all priority levels equal in terms of whether
>     they apply only
>     > > >     at the
>     > > >      >     frontend level or completely throughout the pipeline.
>     > > >      >
>     > > >      >      > [1]
>     > > >      >
>     > > >
>     https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1
>     <https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1>
>     > > >   
>      <https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1
>     <https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1>
>     > > >
>     > > >      >
>     > > >       <
>     > >
>     https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1
>     <https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1>
>     <
>     > >
>     https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1
>     <https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1>>>
>     > > >      >      >
>     > > >      >      >>> What would be interesting to learn is
>     whether the option
>     > > of
>     > > >      >     refactoring
>     > > >      >      >>> drm_sched to deal with out of order
>     completion was
>     > > >     considered
>     > > >      >     and what were
>     > > >      >      >>> the conclusions.
>     > > >      >      >>>
>     > > >      >      >>
>     > > >      >      >> I coded this up a while back when trying to
>     convert the
>     > > >     i915 to
>     > > >      >     the DRM
>     > > >      >      >> scheduler it isn't all that hard either. The
>     free flow
>     > > >     control
>     > > >      >     on the
>     > > >      >      >> ring (e.g. set job limit == SIZE OF RING /
>     MAX JOB SIZE)
>     > > is
>     > > >      >     really what
>     > > >      >      >> sold me on the this design.
>     > > >      >
>     > > >      >
>     > > >      > You're not the only one to suggest supporting
>     out-of-order
>     > > >     completion.
>     > > >      > However, it's tricky and breaks a lot of internal
>     assumptions of
>     > > the
>     > > >      > scheduler. It also reduces functionality a bit
>     because it can no
>     > > >     longer
>     > > >      > automatically rate-limit HW/FW queues which are often
>     > > >     fixed-size.  (Ok,
>     > > >      > yes, it probably could but it becomes a substantially
>     harder
>     > > >     problem.)
>     > > >      >
>     > > >      > It also seems like a worse mapping to me.  The goal
>     here is to
>     > > turn
>     > > >      > submissions on a userspace-facing engine/queue into
>     submissions
>     > > >     to a FW
>     > > >      > queue submissions, sorting out any dma_fence
>     dependencies.  Matt's
>     > > >      > description of saying this is a 1:1 mapping between
>     sched/entity
>     > > >     doesn't
>     > > >      > tell the whole story. It's a 1:1:1 mapping between
>     xe_engine,
>     > > >      > gpu_scheduler, and GuC FW engine. Why make it a
>     1:something:1
>     > > >     mapping?
>     > > >      > Why is that better?
>     > > >
>     > > >     As I have stated before, what I think what would fit
>     well for Xe is
>     > > one
>     > > >     drm_scheduler per engine class. In specific terms on our
>     current
>     > > >     hardware, one drm scheduler instance for render,
>     compute, blitter,
>     > > >     video
>     > > >     and video enhance. Userspace contexts remain scheduler
>     entities.
>     > > >
>     > > >
>     > > > And this is where we fairly strongly disagree.  More in a bit.
>     > > >
>     > > >     That way you avoid the whole kthread/kworker story and
>     you have it
>     > > >     actually use the entity picking code in the scheduler,
>     which may be
>     > > >     useful when the backend is congested.
>     > > >
>     > > >
>     > > > What back-end congestion are you referring to here?  Running
>     out of FW
>     > > > queue IDs?  Something else?
>     > >
>     > > CT channel, number of context ids.
>     > >
>     > > >
>     > > >     Yes you have to solve the out of order problem so in my
>     mind that is
>     > > >     something to discuss. What the problem actually is (just
>     TDR?), how
>     > > >     tricky and why etc.
>     > > >
>     > > >     And yes you lose the handy LRCA ring buffer size
>     management so you'd
>     > > >     have to make those entities not runnable in some other way.
>     > > >
>     > > >     Regarding the argument you raise below - would any of
>     that make the
>     > > >     frontend / backend separation worse and why? Do you
>     think it is less
>     > > >     natural? If neither is true then all remains is that it
>     appears extra
>     > > >     work to support out of order completion of entities has been
>     > > discounted
>     > > >     in favour of an easy but IMO inelegant option.
>     > > >
>     > > >
>     > > > Broadly speaking, the kernel needs to stop thinking about
>     GPU scheduling
>     > > > in terms of scheduling jobs and start thinking in terms of
>     scheduling
>     > > > contexts/engines.  There is still some need for scheduling
>     individual
>     > > > jobs but that is only for the purpose of delaying them as
>     needed to
>     > > > resolve dma_fence dependencies.  Once dependencies are
>     resolved, they
>     > > > get shoved onto the context/engine queue and from there the
>     kernel only
>     > > > really manages whole contexts/engines.  This is a major
>     architectural
>     > > > shift, entirely different from the way i915 scheduling
>     works.  It's also
>     > > > different from the historical usage of DRM scheduler which I
>     think is
>     > > > why this all looks a bit funny.
>     > > >
>     > > > To justify this architectural shift, let's look at where
>     we're headed.
>     > > > In the glorious future...
>     > > >
>     > > >   1. Userspace submits directly to firmware queues.  The
>     kernel has no
>     > > > visibility whatsoever into individual jobs. At most it can
>     pause/resume
>     > > > FW contexts as needed to handle eviction and memory management.
>     > > >
>     > > >   2. Because of 1, apart from handing out the FW queue IDs
>     at the
>     > > > beginning, the kernel can't really juggle them that much. 
>     Depending on
>     > > > FW design, it may be able to pause a client, give its IDs to
>     another,
>     > > > and then resume it later when IDs free up. What it's not
>     doing is
>     > > > juggling IDs on a job-by-job basis like i915 currently is.
>     > > >
>     > > >   3. Long-running compute jobs may not complete for days. 
>     This means
>     > > > that memory management needs to happen in terms of
>     pause/resume of
>     > > > entire contexts/engines using the memory rather than based
>     on waiting
>     > > > for individual jobs to complete or pausing individual jobs
>     until the
>     > > > memory is available.
>     > > >
>     > > >   4. Synchronization happens via userspace memory fences
>     (UMF) and the
>     > > > kernel is mostly unaware of most dependencies and when a
>     context/engine
>     > > > is or is not runnable.  Instead, it keeps as many of them
>     minimally
>     > > > active (memory is available, even if it's in system RAM) as
>     possible and
>     > > > lets the FW sort out dependencies.  (There may need to be
>     some facility
>     > > > for sleeping a context until a memory change similar to
>     futex() or
>     > > > poll() for userspace threads.  There are some details TBD.)
>     > > >
>     > > > Are there potential problems that will need to be solved
>     here?  Yes.  Is
>     > > > it a good design?  Well, Microsoft has been living in this
>     future for
>     > > > half a decade or better and it's working quite well for
>     them.  It's also
>     > > > the way all modern game consoles work.  It really is just
>     Linux that's
>     > > > stuck with the same old job model we've had since the
>     monumental shift
>     > > > to DRI2.
>     > > >
>     > > > To that end, one of the core goals of the Xe project was to
>     make the
>     > > > driver internally behave as close to the above model as
>     possible while
>     > > > keeping the old-school job model as a very thin layer on
>     top.  As the
>     > > > broader ecosystem problems (window-system support for UMF,
>     for instance)
>     > > > are solved, that layer can be peeled back. The core driver
>     will already
>     > > > be ready for it.
>     > > >
>     > > > To that end, the point of the DRM scheduler in Xe isn't to
>     schedule
>     > > > jobs.  It's to resolve syncobj and dma-buf implicit sync
>     dependencies
>     > > > and stuff jobs into their respective context/engine queue
>     once they're
>     > > > ready.  All the actual scheduling happens in firmware and
>     any scheduling
>     > > > the kernel does to deal with contention, oversubscriptions,
>     too many
>     > > > contexts, etc. is between contexts/engines, not individual
>     jobs.  Sure,
>     > > > the individual job visibility is nice, but if we design
>     around it, we'll
>     > > > never get to the glorious future.
>     > > >
>     > > > I really need to turn the above (with a bit more detail)
>     into a blog
>     > > > post.... Maybe I'll do that this week.
>     > > >
>     > > > In any case, I hope that provides more insight into why Xe
>     is designed
>     > > > the way it is and why I'm pushing back so hard on trying to
>     make it more
>     > > > of a "classic" driver as far as scheduling is concerned. 
>     Are there
>     > > > potential problems here?  Yes, that's why Xe has been labeled a
>     > > > prototype.  Are such radical changes necessary to get to
>     said glorious
>     > > > future?  Yes, I think they are.  Will it be worth it?  I
>     believe so.
>     > >
>     > > Right, that's all solid I think. My takeaway is that frontend
>     priority
>     > > sorting and that stuff isn't needed and that is okay. And that
>     there are
>     > > multiple options to maybe improve drm scheduler, like the fore
>     mentioned
>     > > making it deal with out of order, or split into functional
>     components,
>     > > or split frontend/backend what you suggested. For most of them
>     cost vs
>     > > benefit is more or less not completely clear, neither how much
>     effort
>     > > was invested to look into them.
>     > >
>     > > One thing I missed from this explanation is how drm_scheduler
>     per engine
>     > > class interferes with the high level concepts. And I did not
>     manage to
>     > > pick up on what exactly is the TDR problem in that case. Maybe
>     the two
>     > > are one and the same.
>     > >
>     > > Bottom line is I still have the concern that conversion to
>     kworkers has
>     > > an opportunity to regress. Possibly more opportunity for some
>     Xe use
>     > > cases than to affect other vendors, since they would still be
>     using per
>     > > physical engine / queue scheduler instances.
>     > >
>     > > And to put my money where my mouth is I will try to put testing Xe
>     > > inside the full blown ChromeOS environment in my team plans.
>     It would
>     > > probably also be beneficial if Xe team could take a look at
>     real world
>     > > behaviour of the extreme transcode use cases too. If the stack
>     is ready
>     > > for that and all. It would be better to know earlier rather
>     than later
>     > > if there is a fundamental issue.
>     > >
>     > > For the patch at hand, and the cover letter, it certainly
>     feels it would
>     > > benefit to record the past design discussion had with AMD
>     folks, to
>     > > explicitly copy other drivers, and to record the theoretical
>     pros and
>     > > cons of threads vs unbound workers as I have tried to
>     highlight them.
>     > >
>     > > Regards,
>     > >
>     > > Tvrtko
>     > >
>

--------------P0E6w0cBk8DnIBzWTBVMRW6p
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    On 1/11/2023 14:56, Jason Ekstrand wrote:<br>
    <blockquote type="cite" cite="mid:CAOFGe970mwYgt10RdGURiMYc1x+MFy-uYOBT++Mygz4tu1XN4A@mail.gmail.com">
      
      <div dir="ltr">
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Jan 11, 2023 at 4:32
            PM Matthew Brost &lt;<a href="mailto:matthew.brost@intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">matthew.brost@intel.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">On Wed, Jan 11, 2023 at
            04:18:01PM -0600, Jason Ekstrand wrote:<br>
            &gt; On Wed, Jan 11, 2023 at 2:50 AM Tvrtko Ursulin &lt;<br>
            &gt; <a href="mailto:tvrtko.ursulin@linux.intel.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">tvrtko.ursulin@linux.intel.com</a>&gt;
            wrote:<br>
            &gt; <br>
            &gt; &gt;<br>
            [snip]<br>
            &gt; &gt;<br>
            &gt; &gt; Typically is the key here. But I am not sure it is
            good enough. Consider<br>
            &gt; &gt; this example - Intel Flex 170:<br>
            &gt; &gt;<br>
            &gt; &gt;&nbsp; &nbsp;* Delivers up to 36 streams 1080p60 transcode
            throughput per card.<br>
            &gt; &gt;&nbsp; &nbsp;* When scaled to 10 cards in a 4U server
            configuration, it can support<br>
            &gt; &gt; up to 360 streams of HEVC/HEVC 1080p60 transcode
            throughput.<br>
            &gt; &gt;<br>
            &gt; <br>
            &gt; I had a feeling it was going to be media.... 😅<br>
            &gt; <br>
            <br>
            Yea wondering the media UMD can be rewritten to use less
            xe_engines, it<br>
            is massive rewrite for VM bind + no implicit dependencies so
            let's just<br>
            pile on some more work?<br>
          </blockquote>
          <div><br>
          </div>
          <div>It could probably use fewer than it does today.&nbsp; It
            currently creates and throws away contexts like crazy, or
            did last I looked at it.&nbsp; However, the nature of media
            encode is that it often spreads across two or three
            different types of engines.&nbsp; There's not much you can do to
            change that.<br>
          </div>
        </div>
      </div>
    </blockquote>
    And as per Tvrtko's example, you get media servers that transcode
    huge numbers of tiny streams in parallel. Almost no work per frame
    but 100s of independent streams being run concurrently. That means
    many 100s of contexts all trying to run at 30fps. I recall a
    specific bug about thundering herds - hundreds (thousands?) of
    waiting threads all being woken up at once because some request had
    completed.<br>
    <br>
    <blockquote type="cite" cite="mid:CAOFGe970mwYgt10RdGURiMYc1x+MFy-uYOBT++Mygz4tu1XN4A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            &gt; <br>
            &gt; &gt; One transcode stream from my experience typically
            is 3-4 GPU contexts<br>
            &gt; &gt; (buffer travels from vcs -&gt; rcs -&gt; vcs,
            maybe vecs) used from a single<br>
            &gt; &gt; CPU thread. 4 contexts * 36 streams = 144 active
            contexts. Multiply by<br>
            &gt; &gt; 60fps = 8640 jobs submitted and completed per
            second.<br>
            &gt; &gt;<br>
            &gt; &gt; 144 active contexts in the proposed scheme means
            possibly means 144<br>
            &gt; &gt; kernel worker threads spawned (driven by 36
            transcode CPU threads). (I<br>
            &gt; &gt; don't think the pools would scale down given all
            are constantly pinged<br>
            &gt; &gt; at 60fps.)<br>
            &gt; &gt;<br>
            &gt; &gt; And then each of 144 threads goes to grab the
            single GuC CT mutex. First<br>
            &gt; &gt; threads are being made schedulable, then put to
            sleep as mutex<br>
            &gt; &gt; contention is hit, then woken again as mutexes are
            getting released,<br>
            &gt; &gt; rinse, repeat.<br>
            &gt; &gt;<br>
            &gt; <br>
            &gt; Why is every submission grabbing the GuC CT mutex?&nbsp;
            I've not read the GuC<br>
            &gt; back-end yet but I was under the impression that most
            run_job() would be<br>
            &gt; just shoving another packet into a ring buffer.&nbsp; If we
            have to send the GuC<br>
            &gt; a message on the control ring every single time we
            submit a job, that's<br>
            &gt; pretty horrible.<br>
            &gt;<br>
            <br>
            Run job writes the ring buffer and moves the tail as the
            first step (no<br>
            lock required). Next it needs to tell the GuC the xe_engine
            LRC tail has<br>
            moved, this is done from a single Host to GuC channel which
            is circular<br>
            buffer, the writing of the channel protected by the mutex.
            There are<br>
            little more nuances too but in practice there is always
            space in the<br>
            channel so the time mutex needs to held is really, really
            small<br>
            (check cached credits, write 3 dwords in payload, write 1
            dword to move<br>
            tail). I also believe mutexes in Linux are hybrid where they
            spin for a<br>
            little bit before sleeping and certainly if there is space
            in the<br>
            channel we shouldn't sleep mutex contention.<br>
          </blockquote>
          <div><br>
          </div>
          <div>Ok, that makes sense.&nbsp; It's maybe a bit clunky and it'd
            be nice if we had some way to batch things up a bit so we
            only have to poke the GuC channel once for every batch of
            things rather than once per job.&nbsp; That's maybe something we
            can look into as a future improvement; not fundamental.</div>
          <div><br>
          </div>
          <div>Generally, though, it sounds like contention could be a
            real problem if we end up ping-ponging that lock between
            cores.&nbsp; It's going to depend on how much work it takes to
            get the next ready thing vs. the cost of that atomic.&nbsp; But,
            also, anything we do is going to potentially run into
            contention problems.&nbsp; *shrug*&nbsp; If we were going to go for
            one-per-HW-engine, we may as well go one-per-device and then
            we wouldn't need the lock.&nbsp; Off the top of my head, that
            doesn't sound great either but IDK.<br>
          </div>
          <div>&nbsp;<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            As far as this being horrible, well didn't design the GuC
            and this how<br>
            it is implemented for KMD based submission. We also have 256
            doorbells<br>
            so we wouldn't need a lock but I think are other issues with
            that design<br>
            too which need to be worked out in the Xe2 / Xe3 timeframe.<br>
          </blockquote>
          <div><br>
          </div>
          <div>Yeah, not blaming you.&nbsp; Just surprised, that's all.&nbsp; How
            does it work for userspace submission?&nbsp; What would it look
            like if the kernel emulated userspace submission?&nbsp; Is that
            even possible?</div>
          <div><br>
          </div>
          <div>What are these doorbell things?&nbsp; How do they play into
            it?<br>
          </div>
        </div>
      </div>
    </blockquote>
    Basically a bank of MMIO space reserved per 'entity' where a write
    to that MMIO space becomes an named interrupt to GuC. You can assign
    each doorbell to a specific GuC context. So writing to that doorbell
    address is effectively the same as sending a SCHEDULE_CONTEXT H2G
    message from the KMD for that context. But the advantage is you ring
    the doorbell from user land with no call into the kernel at all. Or
    from within the kernel, you can do it without needing any locks at
    all. Problem is, we have 64K contexts in GuC but only 256 doorbells
    in the hardware. Less if using SRIOV. So the &quot;per 'entity'&quot; part
    because somewhat questionable as to exactly what the 'entity' is.
    And hence we just haven't bothered supporting them in Linux because
    a) no direct submission from user land yet, and b) as Matthew says
    entire chain of IOCTL from UMD to kernel to acquiring a lock and
    sending the H2G has generally been fast enough. The latency only
    becomes an issue for ULLS people but for them, even the doorbells
    from user space are too high a latency because that still
    potentially involves the GuC having to do some scheduling and
    context switch type action.<br>
    <br>
    John.<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:CAOFGe970mwYgt10RdGURiMYc1x+MFy-uYOBT++Mygz4tu1XN4A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            Also if you see my follow up response Xe is ~33k execs per
            second with<br>
            the current implementation on a 8 core (or maybe 8 thread)
            TGL which<br>
            seems to fine to me.<br>
          </blockquote>
          <div><br>
          </div>
          <div>33k exec/sec is about 500/frame which should be fine.&nbsp;
            500 is a lot for a single frame.&nbsp; I typically tell game devs
            to shoot for dozens per frame.&nbsp; The important thing is that
            it stays low even with hundreds of memory objects bound.&nbsp;
            (Xe should be just fine there.)<br>
          </div>
          <div><br>
          </div>
          <div>--Jason</div>
          <div><br>
          </div>
          <div>&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            Matt<br>
            <br>
            &gt; --Jason<br>
            &gt; <br>
            &gt; <br>
            &gt; (And yes this backend contention is there regardless of
            1:1:1, it would<br>
            &gt; &gt; require a different re-design to solve that. But
            it is just a question<br>
            &gt; &gt; whether there are 144 contending threads, or just
            6 with the thread per<br>
            &gt; &gt; engine class scheme.)<br>
            &gt; &gt;<br>
            &gt; &gt; Then multiply all by 10 for a 4U server use case
            and you get 1440 worker<br>
            &gt; &gt; kthreads, yes 10 more CT locks, but contending on
            how many CPU cores?<br>
            &gt; &gt; Just so they can grab a timeslice and maybe
            content on a mutex as the<br>
            &gt; &gt; next step.<br>
            &gt; &gt;<br>
            &gt; &gt; This example is where it would hurt on large
            systems. Imagine only an<br>
            &gt; &gt; even wider media transcode card...<br>
            &gt; &gt;<br>
            &gt; &gt; Second example is only a single engine class used
            (3d desktop?) but with<br>
            &gt; &gt; a bunch of not-runnable jobs queued and waiting on
            a fence to signal.<br>
            &gt; &gt; Implicit or explicit dependencies doesn't matter.
            Then the fence signals<br>
            &gt; &gt; and call backs run. N work items get scheduled,
            but they all submit to<br>
            &gt; &gt; the same HW engine. So we end up with:<br>
            &gt; &gt;<br>
            &gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /-- wi1 --\<br>
            &gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/ ..&nbsp; &nbsp; &nbsp;.. \<br>
            &gt; &gt;&nbsp; &nbsp;cb --+---&nbsp; wi.. ---+-- rq1 -- .. -- rqN<br>
            &gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\ ..&nbsp; &nbsp; ..&nbsp; /<br>
            &gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \-- wiN --/<br>
            &gt; &gt;<br>
            &gt; &gt;<br>
            &gt; &gt; All that we have achieved is waking up N CPUs to
            contend on the same<br>
            &gt; &gt; lock and effectively insert the job into the same
            single HW queue. I<br>
            &gt; &gt; don't see any positives there.<br>
            &gt; &gt;<br>
            &gt; &gt; This example I think can particularly hurt small /
            low power devices<br>
            &gt; &gt; because of needless waking up of many cores for no
            benefit. Granted, I<br>
            &gt; &gt; don't have a good feel on how common this pattern
            is in practice.<br>
            &gt; &gt;<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;That<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;is the number which drives the maximum
            number of not-runnable jobs<br>
            &gt; &gt; that<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;can become runnable at once, and hence
            spawn that many work items,<br>
            &gt; &gt; and<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;in turn unbound worker threads.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;Several problems there.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;It is fundamentally pointless to have
            potentially that many more<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;threads<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;than the number of CPU cores - it simply
            creates a scheduling storm.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;Unbound workers have no CPU / cache
            locality either and no connection<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;with the CPU scheduler to optimize
            scheduling patterns. This may<br>
            &gt; &gt; matter<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;either on large systems or on small ones.
            Whereas the current design<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;allows for scheduler to notice userspace
            CPU thread keeps waking up<br>
            &gt; &gt; the<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;same drm scheduler kernel thread, and so
            it can keep them on the same<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;CPU, the unbound workers lose that
            ability and so 2nd CPU might be<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;getting woken up from low sleep for every
            submission.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;Hence, apart from being a bit of a
            impedance mismatch, the proposal<br>
            &gt; &gt; has<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;the potential to change performance and
            power patterns and both large<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;and small machines.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt; Ok, thanks for explaining the issue you're
            seeing in more detail.&nbsp; Yes,<br>
            &gt; &gt; &gt; deferred kwork does appear to mismatch
            somewhat with what the scheduler<br>
            &gt; &gt; &gt; needs or at least how it's worked in the
            past.&nbsp; How much impact will<br>
            &gt; &gt; &gt; that mismatch have?&nbsp; Unclear.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt;&gt; Secondly, it
            probably demands separate workers (not<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;optional),<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;otherwise<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt;&gt; behaviour of
            shared workqueues has either the potential<br>
            &gt; &gt; to<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;explode number<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt;&gt; kernel threads
            anyway, or add latency.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt;&gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt; Right now the
            system_unbound_wq is used which does have a<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;limit<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;on the<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt; number of threads,
            right? I do have a FIXME to allow a<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;worker to be<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt; passed in similar to
            TDR.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt; WRT to latency, the
            1:1 ratio could actually have lower<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;latency<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;as 2 GPU<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt; schedulers can be
            pushing jobs into the backend /<br>
            &gt; &gt; cleaning up<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;jobs in<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt; parallel.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt; Thought of one more point
            here where why in Xe we<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;absolutely want<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;a 1 to<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt; 1 ratio between entity
            and scheduler - the way we implement<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;timeslicing<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt; for preempt fences.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt; Let me try to explain.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt; Preempt fences are
            implemented via the generic messaging<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;interface [1]<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt; with suspend / resume
            messages. If a suspend messages is<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;received to<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt; soon after calling resume
            (this is per entity) we simply<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;sleep in the<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt; suspend call thus giving
            the entity a timeslice. This<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;completely<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;falls<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt; apart with a many to 1
            relationship as now a entity<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;waiting for a<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt; timeslice blocks the
            other entities. Could we work aroudn<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;this,<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;sure but<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt; just another bunch of
            code we'd have to add in Xe. Being to<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;freely sleep<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt; in backend without
            affecting other entities is really,<br>
            &gt; &gt; really<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;nice IMO<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt; and I bet Xe isn't the
            only driver that is going to feel<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;this way.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt; Last thing I'll say
            regardless of how anyone feels about<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;Xe using<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;a 1 to<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt; 1 relationship this patch
            IMO makes sense as I hope we can<br>
            &gt; &gt; all<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;agree a<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt; workqueue scales better
            than kthreads.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;I don't know for sure what will
            scale better and for what use<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;case,<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;combination of CPU cores vs
            number of GPU engines to keep<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;busy vs other<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;system activity. But I wager
            someone is bound to ask for some<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;numbers to<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;make sure proposal is not
            negatively affecting any other<br>
            &gt; &gt; drivers.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; Then let them ask.&nbsp; Waving your
            hands vaguely in the direction of<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;the<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; rest of DRM and saying &quot;Uh, someone
            (not me) might object&quot; is<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;profoundly<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; unhelpful.&nbsp; Sure, someone might.&nbsp;
            That's why it's on dri-devel.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;If you<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; think there's someone in particular
            who might have a useful<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;opinion on<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; this, throw them in the CC so they
            don't miss the e-mail thread.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; Or are you asking for numbers?&nbsp; If
            so, what numbers are you<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;asking for?<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;It was a heads up to the Xe team in case
            people weren't appreciating<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;how<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;the proposed change has the potential
            influence power and performance<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;across the board. And nothing in the
            follow up discussion made me<br>
            &gt; &gt; think<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;it was considered so I don't think it was
            redundant to raise it.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;In my experience it is typical that such
            core changes come with some<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;numbers. Which is in case of drm
            scheduler is tricky and probably<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;requires explicitly asking everyone to
            test (rather than count on<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;&quot;don't<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;miss the email thread&quot;). Real products
            can fail to ship due ten mW<br>
            &gt; &gt; here<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;or there. Like suddenly an extra core
            prevented from getting into<br>
            &gt; &gt; deep<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;sleep.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;If that was &quot;profoundly unhelpful&quot; so be
            it.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt; With your above explanation, it makes more
            sense what you're asking.<br>
            &gt; &gt; &gt; It's still not something Matt is likely to be
            able to provide on his<br>
            &gt; &gt; &gt; own.&nbsp; We need to tag some other folks and ask
            them to test it out.&nbsp; We<br>
            &gt; &gt; &gt; could play around a bit with it on Xe but
            it's not exactly production<br>
            &gt; &gt; &gt; grade yet and is going to hit this
            differently from most.&nbsp; Likely<br>
            &gt; &gt; &gt; candidates are probably AMD and Freedreno.<br>
            &gt; &gt;<br>
            &gt; &gt; Whoever is setup to check out power and
            performance would be good to<br>
            &gt; &gt; give it a spin, yes.<br>
            &gt; &gt;<br>
            &gt; &gt; PS. I don't think I was asking Matt to test with
            other devices. To start<br>
            &gt; &gt; with I think Xe is a team effort. I was asking for
            more background on<br>
            &gt; &gt; the design decision since patch 4/20 does not say
            anything on that<br>
            &gt; &gt; angle, nor later in the thread it was IMO
            sufficiently addressed.<br>
            &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; Also, If we're talking about a
            design that might paint us into an<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; Intel-HW-specific hole, that would
            be one thing.&nbsp; But we're not.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;We're<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; talking about switching which
            kernel threading/task mechanism to<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;use for<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; what's really a very generic
            problem.&nbsp; The core Xe design works<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;without<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; this patch (just with more
            kthreads).&nbsp; If we land this patch or<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; something like it and get it wrong
            and it causes a performance<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;problem<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; for someone down the line, we can
            revisit it.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;For some definition of &quot;it works&quot; - I
            really wouldn't suggest<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;shipping a<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;kthread per user context at any point.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt; You have yet to elaborate on why. What
            resources is it consuming that's<br>
            &gt; &gt; &gt; going to be a problem? Are you anticipating
            CPU affinity problems? Or<br>
            &gt; &gt; &gt; does it just seem wasteful?<br>
            &gt; &gt;<br>
            &gt; &gt; Well I don't know, commit message says the
            approach does not scale. :)<br>
            &gt; &gt;<br>
            &gt; &gt; &gt; I think I largely agree that it's probably
            unnecessary/wasteful but<br>
            &gt; &gt; &gt; reducing the number of kthreads seems like a
            tractable problem to solve<br>
            &gt; &gt; &gt; regardless of where we put the gpu_scheduler
            object.&nbsp; Is this the right<br>
            &gt; &gt; &gt; solution?&nbsp; Maybe not.&nbsp; It was also proposed
            at one point that we could<br>
            &gt; &gt; &gt; split the scheduler into two pieces: A
            scheduler which owns the kthread,<br>
            &gt; &gt; &gt; and a back-end which targets some HW ring
            thing where you can have<br>
            &gt; &gt; &gt; multiple back-ends per scheduler.&nbsp; That's
            certainly more invasive from a<br>
            &gt; &gt; &gt; DRM scheduler internal API PoV but would
            solve the kthread problem in a<br>
            &gt; &gt; &gt; way that's more similar to what we have now.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;In any case that's a low level
            question caused by the high<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;level design<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;decision. So I'd think first
            focus on the high level - which<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;is the 1:1<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;mapping of entity to scheduler
            instance proposal.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;Fundamentally it will be up to
            the DRM maintainers and the<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;community to<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;bless your approach. And it is
            important to stress 1:1 is<br>
            &gt; &gt; about<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;userspace contexts, so I
            believe unlike any other current<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;scheduler<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;user. And also important to
            stress this effectively does not<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;make Xe<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;_really_ use the scheduler that
            much.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; I don't think this makes Xe nearly
            as much of a one-off as you<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;think it<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; does.&nbsp; I've already told the Asahi
            team working on Apple M1/2<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;hardware<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; to do it this way and it seems to
            be a pretty good mapping for<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;them. I<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; believe this is roughly the plan
            for nouveau as well.&nbsp; It's not<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;the way<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; it currently works for anyone
            because most other groups aren't<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;doing FW<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; scheduling yet.&nbsp; In the world of FW
            scheduling and hardware<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;designed to<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; support userspace direct-to-FW
            submit, I think the design makes<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;perfect<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; sense (see below) and I expect
            we'll see more drivers move in this<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; direction as those drivers evolve.&nbsp;
            (AMD is doing some customish<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;thing<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; for how with gpu_scheduler on the
            front-end somehow. I've not dug<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;into<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; those details.)<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;I can only offer my opinion,
            which is that the two options<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;mentioned in<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;this thread (either improve drm
            scheduler to cope with what is<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;required,<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;or split up the code so you can
            use just the parts of<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;drm_sched which<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;you want - which is frontend
            dependency tracking) shouldn't<br>
            &gt; &gt; be so<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;readily dismissed, given how I
            think the idea was for the new<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;driver to<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;work less in a silo and more in
            the community (not do kludges<br>
            &gt; &gt; to<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;workaround stuff because it is
            thought to be too hard to<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;improve common<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;code), but fundamentally, &quot;goto
            previous paragraph&quot; for what<br>
            &gt; &gt; I am<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;concerned.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; Meta comment:&nbsp; It appears as if
            you're falling into the standard<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;i915<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; team trap of having an internal
            discussion about what the<br>
            &gt; &gt; community<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; discussion might look like instead
            of actually having the<br>
            &gt; &gt; community<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; discussion.&nbsp; If you are seriously
            concerned about interactions<br>
            &gt; &gt; with<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; other drivers or whether or setting
            common direction, the right<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;way to<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; do that is to break a patch or two
            out into a separate RFC series<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;and<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; tag a handful of driver
            maintainers.&nbsp; Trying to predict the<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;questions<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; other people might ask is
            pointless. Cc them and asking for their<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;input<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; instead.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;I don't follow you here. It's not an
            internal discussion - I am<br>
            &gt; &gt; raising<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;my concerns on the design publicly. I am
            supposed to write a patch to<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;show something, but am allowed to comment
            on a RFC series?<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt; I may have misread your tone a bit.&nbsp; It felt
            a bit like too many<br>
            &gt; &gt; &gt; discussions I've had in the past where people
            are trying to predict what<br>
            &gt; &gt; &gt; others will say instead of just asking them.&nbsp;
            Reading it again, I was<br>
            &gt; &gt; &gt; probably jumping to conclusions a bit.&nbsp; Sorry
            about that.<br>
            &gt; &gt;<br>
            &gt; &gt; Okay no problem, thanks. In any case we don't have
            to keep discussing<br>
            &gt; &gt; it, since I wrote one or two emails ago it is
            fundamentally on the<br>
            &gt; &gt; maintainers and community to ack the approach. I
            only felt like RFC did<br>
            &gt; &gt; not explain the potential downsides sufficiently
            so I wanted to probe<br>
            &gt; &gt; that area a bit.<br>
            &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;It is &quot;drm/sched: Convert drm scheduler
            to use a work queue rather<br>
            &gt; &gt; than<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;kthread&quot; which should have Cc-ed
            _everyone_ who use drm scheduler.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt; Yeah, it probably should have.&nbsp; I think
            that's mostly what I've been<br>
            &gt; &gt; &gt; trying to say.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;Regards,<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;Tvrtko<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;P.S. And as a related side
            note, there are more areas where<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;drm_sched<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;could be improved, like for
            instance priority handling.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;Take a look at
            msm_submitqueue_create /<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;msm_gpu_convert_priority /<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;get_sched_entity to see how msm
            works around the drm_sched<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;hardcoded<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;limit of available priority
            levels, in order to avoid having<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;to leave a<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;hw capability unused. I suspect
            msm would be happier if they<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;could have<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;all priority levels equal in
            terms of whether they apply only<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;at the<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;frontend level or completely
            throughout the pipeline.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt; [1]<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;<a href="https://patchwork.freedesktop.org/patch/515857/?series=112189&amp;rev=1" rel="noreferrer" target="_blank" moz-do-not-send="true">https://patchwork.freedesktop.org/patch/515857/?series=112189&amp;rev=1</a><br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;&lt;<a href="https://patchwork.freedesktop.org/patch/515857/?series=112189&amp;rev=1" rel="noreferrer" target="_blank" moz-do-not-send="true">https://patchwork.freedesktop.org/patch/515857/?series=112189&amp;rev=1</a><br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp;&lt;<br>
            &gt; &gt; <a href="https://patchwork.freedesktop.org/patch/515857/?series=112189&amp;rev=1" rel="noreferrer" target="_blank" moz-do-not-send="true">https://patchwork.freedesktop.org/patch/515857/?series=112189&amp;rev=1</a>
            &lt;<br>
            &gt; &gt; <a href="https://patchwork.freedesktop.org/patch/515857/?series=112189&amp;rev=1" rel="noreferrer" target="_blank" moz-do-not-send="true">https://patchwork.freedesktop.org/patch/515857/?series=112189&amp;rev=1</a>&gt;&gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt;&gt; What would be
            interesting to learn is whether the option<br>
            &gt; &gt; of<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;refactoring<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt;&gt; drm_sched to deal
            with out of order completion was<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;considered<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;and what were<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt;&gt; the conclusions.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt;&gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt; I coded this up a
            while back when trying to convert the<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;i915 to<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;the DRM<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt; scheduler it isn't
            all that hard either. The free flow<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;control<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;on the<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt; ring (e.g. set job
            limit == SIZE OF RING / MAX JOB SIZE)<br>
            &gt; &gt; is<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp;really what<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;&nbsp; &nbsp; &nbsp; &gt;&gt; sold me on the this
            design.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; You're not the only one to suggest
            supporting out-of-order<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;completion.<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; However, it's tricky and breaks a
            lot of internal assumptions of<br>
            &gt; &gt; the<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; scheduler. It also reduces
            functionality a bit because it can no<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;longer<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; automatically rate-limit HW/FW
            queues which are often<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;fixed-size.&nbsp; (Ok,<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; yes, it probably could but it
            becomes a substantially harder<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;problem.)<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; It also seems like a worse mapping
            to me.&nbsp; The goal here is to<br>
            &gt; &gt; turn<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; submissions on a userspace-facing
            engine/queue into submissions<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;to a FW<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; queue submissions, sorting out any
            dma_fence dependencies.&nbsp; Matt's<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; description of saying this is a 1:1
            mapping between sched/entity<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;doesn't<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; tell the whole story. It's a 1:1:1
            mapping between xe_engine,<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; gpu_scheduler, and GuC FW engine.&nbsp;
            Why make it a 1:something:1<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;mapping?<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp; &gt; Why is that better?<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;As I have stated before, what I think
            what would fit well for Xe is<br>
            &gt; &gt; one<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;drm_scheduler per engine class. In
            specific terms on our current<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;hardware, one drm scheduler instance for
            render, compute, blitter,<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;video<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;and video enhance. Userspace contexts
            remain scheduler entities.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt; And this is where we fairly strongly
            disagree.&nbsp; More in a bit.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;That way you avoid the whole
            kthread/kworker story and you have it<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;actually use the entity picking code in
            the scheduler, which may be<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;useful when the backend is congested.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt; What back-end congestion are you referring to
            here?&nbsp; Running out of FW<br>
            &gt; &gt; &gt; queue IDs?&nbsp; Something else?<br>
            &gt; &gt;<br>
            &gt; &gt; CT channel, number of context ids.<br>
            &gt; &gt;<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;Yes you have to solve the out of order
            problem so in my mind that is<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;something to discuss. What the problem
            actually is (just TDR?), how<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;tricky and why etc.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;And yes you lose the handy LRCA ring
            buffer size management so you'd<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;have to make those entities not runnable
            in some other way.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;Regarding the argument you raise below -
            would any of that make the<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;frontend / backend separation worse and
            why? Do you think it is less<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;natural? If neither is true then all
            remains is that it appears extra<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;work to support out of order completion
            of entities has been<br>
            &gt; &gt; discounted<br>
            &gt; &gt; &gt;&nbsp; &nbsp; &nbsp;in favour of an easy but IMO inelegant
            option.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt; Broadly speaking, the kernel needs to stop
            thinking about GPU scheduling<br>
            &gt; &gt; &gt; in terms of scheduling jobs and start
            thinking in terms of scheduling<br>
            &gt; &gt; &gt; contexts/engines.&nbsp; There is still some need
            for scheduling individual<br>
            &gt; &gt; &gt; jobs but that is only for the purpose of
            delaying them as needed to<br>
            &gt; &gt; &gt; resolve dma_fence dependencies.&nbsp; Once
            dependencies are resolved, they<br>
            &gt; &gt; &gt; get shoved onto the context/engine queue and
            from there the kernel only<br>
            &gt; &gt; &gt; really manages whole contexts/engines.&nbsp; This
            is a major architectural<br>
            &gt; &gt; &gt; shift, entirely different from the way i915
            scheduling works.&nbsp; It's also<br>
            &gt; &gt; &gt; different from the historical usage of DRM
            scheduler which I think is<br>
            &gt; &gt; &gt; why this all looks a bit funny.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt; To justify this architectural shift, let's
            look at where we're headed.<br>
            &gt; &gt; &gt; In the glorious future...<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp;1. Userspace submits directly to firmware
            queues.&nbsp; The kernel has no<br>
            &gt; &gt; &gt; visibility whatsoever into individual jobs.&nbsp;
            At most it can pause/resume<br>
            &gt; &gt; &gt; FW contexts as needed to handle eviction and
            memory management.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp;2. Because of 1, apart from handing out the
            FW queue IDs at the<br>
            &gt; &gt; &gt; beginning, the kernel can't really juggle
            them that much.&nbsp; Depending on<br>
            &gt; &gt; &gt; FW design, it may be able to pause a client,
            give its IDs to another,<br>
            &gt; &gt; &gt; and then resume it later when IDs free up.&nbsp;
            What it's not doing is<br>
            &gt; &gt; &gt; juggling IDs on a job-by-job basis like i915
            currently is.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp;3. Long-running compute jobs may not
            complete for days.&nbsp; This means<br>
            &gt; &gt; &gt; that memory management needs to happen in
            terms of pause/resume of<br>
            &gt; &gt; &gt; entire contexts/engines using the memory
            rather than based on waiting<br>
            &gt; &gt; &gt; for individual jobs to complete or pausing
            individual jobs until the<br>
            &gt; &gt; &gt; memory is available.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt;&nbsp; &nbsp;4. Synchronization happens via userspace
            memory fences (UMF) and the<br>
            &gt; &gt; &gt; kernel is mostly unaware of most dependencies
            and when a context/engine<br>
            &gt; &gt; &gt; is or is not runnable.&nbsp; Instead, it keeps as
            many of them minimally<br>
            &gt; &gt; &gt; active (memory is available, even if it's in
            system RAM) as possible and<br>
            &gt; &gt; &gt; lets the FW sort out dependencies.&nbsp; (There
            may need to be some facility<br>
            &gt; &gt; &gt; for sleeping a context until a memory change
            similar to futex() or<br>
            &gt; &gt; &gt; poll() for userspace threads.&nbsp; There are some
            details TBD.)<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt; Are there potential problems that will need
            to be solved here?&nbsp; Yes.&nbsp; Is<br>
            &gt; &gt; &gt; it a good design?&nbsp; Well, Microsoft has been
            living in this future for<br>
            &gt; &gt; &gt; half a decade or better and it's working
            quite well for them.&nbsp; It's also<br>
            &gt; &gt; &gt; the way all modern game consoles work.&nbsp; It
            really is just Linux that's<br>
            &gt; &gt; &gt; stuck with the same old job model we've had
            since the monumental shift<br>
            &gt; &gt; &gt; to DRI2.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt; To that end, one of the core goals of the Xe
            project was to make the<br>
            &gt; &gt; &gt; driver internally behave as close to the
            above model as possible while<br>
            &gt; &gt; &gt; keeping the old-school job model as a very
            thin layer on top.&nbsp; As the<br>
            &gt; &gt; &gt; broader ecosystem problems (window-system
            support for UMF, for instance)<br>
            &gt; &gt; &gt; are solved, that layer can be peeled back.&nbsp;
            The core driver will already<br>
            &gt; &gt; &gt; be ready for it.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt; To that end, the point of the DRM scheduler
            in Xe isn't to schedule<br>
            &gt; &gt; &gt; jobs.&nbsp; It's to resolve syncobj and dma-buf
            implicit sync dependencies<br>
            &gt; &gt; &gt; and stuff jobs into their respective
            context/engine queue once they're<br>
            &gt; &gt; &gt; ready.&nbsp; All the actual scheduling happens in
            firmware and any scheduling<br>
            &gt; &gt; &gt; the kernel does to deal with contention,
            oversubscriptions, too many<br>
            &gt; &gt; &gt; contexts, etc. is between contexts/engines,
            not individual jobs.&nbsp; Sure,<br>
            &gt; &gt; &gt; the individual job visibility is nice, but if
            we design around it, we'll<br>
            &gt; &gt; &gt; never get to the glorious future.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt; I really need to turn the above (with a bit
            more detail) into a blog<br>
            &gt; &gt; &gt; post.... Maybe I'll do that this week.<br>
            &gt; &gt; &gt;<br>
            &gt; &gt; &gt; In any case, I hope that provides more
            insight into why Xe is designed<br>
            &gt; &gt; &gt; the way it is and why I'm pushing back so
            hard on trying to make it more<br>
            &gt; &gt; &gt; of a &quot;classic&quot; driver as far as scheduling is
            concerned.&nbsp; Are there<br>
            &gt; &gt; &gt; potential problems here?&nbsp; Yes, that's why Xe
            has been labeled a<br>
            &gt; &gt; &gt; prototype.&nbsp; Are such radical changes
            necessary to get to said glorious<br>
            &gt; &gt; &gt; future?&nbsp; Yes, I think they are.&nbsp; Will it be
            worth it?&nbsp; I believe so.<br>
            &gt; &gt;<br>
            &gt; &gt; Right, that's all solid I think. My takeaway is
            that frontend priority<br>
            &gt; &gt; sorting and that stuff isn't needed and that is
            okay. And that there are<br>
            &gt; &gt; multiple options to maybe improve drm scheduler,
            like the fore mentioned<br>
            &gt; &gt; making it deal with out of order, or split into
            functional components,<br>
            &gt; &gt; or split frontend/backend what you suggested. For
            most of them cost vs<br>
            &gt; &gt; benefit is more or less not completely clear,
            neither how much effort<br>
            &gt; &gt; was invested to look into them.<br>
            &gt; &gt;<br>
            &gt; &gt; One thing I missed from this explanation is how
            drm_scheduler per engine<br>
            &gt; &gt; class interferes with the high level concepts. And
            I did not manage to<br>
            &gt; &gt; pick up on what exactly is the TDR problem in that
            case. Maybe the two<br>
            &gt; &gt; are one and the same.<br>
            &gt; &gt;<br>
            &gt; &gt; Bottom line is I still have the concern that
            conversion to kworkers has<br>
            &gt; &gt; an opportunity to regress. Possibly more
            opportunity for some Xe use<br>
            &gt; &gt; cases than to affect other vendors, since they
            would still be using per<br>
            &gt; &gt; physical engine / queue scheduler instances.<br>
            &gt; &gt;<br>
            &gt; &gt; And to put my money where my mouth is I will try
            to put testing Xe<br>
            &gt; &gt; inside the full blown ChromeOS environment in my
            team plans. It would<br>
            &gt; &gt; probably also be beneficial if Xe team could take
            a look at real world<br>
            &gt; &gt; behaviour of the extreme transcode use cases too.
            If the stack is ready<br>
            &gt; &gt; for that and all. It would be better to know
            earlier rather than later<br>
            &gt; &gt; if there is a fundamental issue.<br>
            &gt; &gt;<br>
            &gt; &gt; For the patch at hand, and the cover letter, it
            certainly feels it would<br>
            &gt; &gt; benefit to record the past design discussion had
            with AMD folks, to<br>
            &gt; &gt; explicitly copy other drivers, and to record the
            theoretical pros and<br>
            &gt; &gt; cons of threads vs unbound workers as I have tried
            to highlight them.<br>
            &gt; &gt;<br>
            &gt; &gt; Regards,<br>
            &gt; &gt;<br>
            &gt; &gt; Tvrtko<br>
            &gt; &gt;<br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------P0E6w0cBk8DnIBzWTBVMRW6p--
