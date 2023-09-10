Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B11FF799DEC
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 13:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2052D10E181;
	Sun, 10 Sep 2023 11:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6985810E045
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 11:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694346830; x=1725882830;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xTeExKyDWLfvWOwBAR9yIfJXGZ679/Ytys7UDFj3ZRo=;
 b=FnFYBVODuxJv9pUeQIzbjAFuPJPirE7VhYWTlQBGJT04lZVCFZXlHyYE
 +sldJWoxfUfsJ9HKaLpk3iuAnpL/Yy9+S2Bcw4R8/v4MJdjeoSmB/VppQ
 yhNqhjno8BZZ5QVth3Y3C6ldkj6DXH/IEb76OH1cpLh2NCRsvJGVIrm1T
 Lz8fiCqsi+rD1ZoSA02xaLRd12311kubWi1Zr1B4Lv+b4VsbxhH7wFCFV
 SvcMfk9Ad2KuVZgcFz690z2Rkc3d/xhWBVbqWeWNsSXXPx3lC9nUYOsPi
 x9oVuTr8b25IPxgBLJdxJtFHeS4IEpUx3CK70stoZIGbB5K8B20NuIIJM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="358192010"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; d="scan'208";a="358192010"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2023 04:53:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="886175647"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; d="scan'208";a="886175647"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2023 04:53:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 10 Sep 2023 04:53:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 10 Sep 2023 04:53:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 10 Sep 2023 04:53:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFoExXxdZRLEdpOBX3BtcC1mVpgZu4yt98QMYrKHHckIOtSyVRepX55U0Ct4rvN4uu9Bw1YNODiiUyR05xnwpNCQV+RozvHBuGxyvHTJ9WNbm1HMfqgozn4z2/i3t1sUYuho5NHgQ2XmSQCkoxgFCzJRmAHm9SzZCAdm9Kiu4NODnfrkfo/xCE9UmTJ5FqyudS2kmRiAQI160OUesRTJsMXXlhqW/39YdWPYs8WwPRSyNjNKiGT2HsEB5047aw1xA/flzuvZfBFwkM+/nRZT9tp3+5OA1F+M6n2+2aJzdQpZvHcR0HBW+T2r/P67GNK8AmF/NVIXxADqWndpCm0hMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuUW4XvwJLw/1YKzmJ9/018+727PcQ22rT7Fb6iV7FY=;
 b=FDkGFqoR2ucWrp6zTqQL+mtRFizJE/GSNI+SA3Tq8xBt9k6CVDmROsdN/dMxO4rRkl7yoW2HwZOkUVBmsc5qdB5k7dYPJ0UHQjBQqmswxyl0wXovqvi9kZ1Dbu0y/UoYsMCibR9GhWxmZlhmdMc1ckITlunT/ZKs3eSj871PP0eMOOvzOh4iKxQB/NcLreJC0RPRMavkiBk3iTzZFGuUDTJGrlCJGLgPev6IgoMWZO0WWR7LBGXK7eNoPLqH05rVwaQh8Bhm2XPh49FWHbu1ZTSXeEDD9TqF2OUc4OTwFkyZRb2FiSQyLvhVXBTbByH1cidlIIlo9w5hRakrN9oNMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by SA2PR11MB5049.namprd11.prod.outlook.com (2603:10b6:806:11b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Sun, 10 Sep
 2023 11:53:43 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::2846:e5f8:b2e8:1da6]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::2846:e5f8:b2e8:1da6%4]) with mapi id 15.20.6768.029; Sun, 10 Sep 2023
 11:53:43 +0000
Message-ID: <237f8f44-3ac7-4b61-bb04-e86730efbe10@intel.com>
Date: Sun, 10 Sep 2023 19:53:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] kernel BUG in filemap_unaccount_folio
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
References: <000000000000be3c1a0604b53a1c@google.com>
 <32c1b340-065c-4f8f-9e73-da823defb640@intel.com>
 <IA0PR11MB71854F51212E1A3913951F44F8F3A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Yin, Fengwei" <fengwei.yin@intel.com>
In-Reply-To: <IA0PR11MB71854F51212E1A3913951F44F8F3A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::29)
 To CO1PR11MB4820.namprd11.prod.outlook.com
 (2603:10b6:303:6f::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4820:EE_|SA2PR11MB5049:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b17ab54-2240-478d-f297-08dbb1f4947a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mwdKxa1RoA162SlaWpI4iTJ58+TIm7NUMc7a3D9oAS0H9L7LBUUZIyYCGWCueRobhQ4QyeoK/u+urw4gXNej1g7erJDXRhX4cKWRyYEds3USnPPnc7O92huCDpr/A1wLupgl1mZmEQk13ALqDl5+S3BZZ3pBL/YGska9H0ywiI+Mzk5BzKWPCCYF6ckA6kUXa+F0ddcVsq04O6eh2j4lRi3ZY7/R3f/QIHN+4bt3tMgUmnCXIssZkIehic5K98rjvRM1c9GCmHl59jDMqWbywn41EH3HKy6eG+/cb92SW1LXCV44B9UZO6+KMhbI0PL4JdJuHjoFaA6nnJr5ZhgWy5XwwbnnuLfUcJMfvXHPTFhiN7zV7Fk2GiN+2FGAP9AGOOngcEih6TUvxoDKBVEirGSjPtXrQx3ktLFD65PjoXYXSfDa/1Xqz/oSq/6gMjMpziVo/04Ors70pdLf2SBldN5vFWFotQRzd4/39CQ/Nu7/e+A+aHmASSEAqQahQkoTEUK+rxdRTBMWm85rXZPaz8tfbNlbMMr9rQ+AfIYkxLHscJHD6R8QH0n5eHyVRIOZPCYuM4u02FcDg8KbRPqJ3abqsZXIKJgKN9AGNDQOqEHOFwXrachyDPmt0mDxdlWsTrcyVWQ+PKPKep0eTN0T3rHvFbrg96H9BIhUWiwMe2jx6R3xdpszNbUdVWBf6qgNP4Xb6LNxJcFBbvnvkjZeOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4820.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199024)(1800799009)(186009)(41300700001)(31686004)(6666004)(53546011)(6506007)(6486002)(36756003)(86362001)(31696002)(38100700002)(82960400001)(26005)(2616005)(2906002)(966005)(45080400002)(6512007)(83380400001)(478600001)(6636002)(316002)(8936002)(8676002)(6862004)(5660300002)(4326008)(7416002)(37006003)(66946007)(66556008)(66476007)(54906003)(99710200001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3ZDaXQwZnZNelhtMWR1N3YvV3hZZldaaEFGTG1oNkROZmYxbGxhMTNGWWo5?=
 =?utf-8?B?WkpKMkFVRlg4c0ZaMXAwNUNoOHZXNXNaRDVTMTR3RWVML0dzOXRiVExkRnBm?=
 =?utf-8?B?SURwUW1TdHRBZGFpM0RYRHIvNFFWK214OTcwK3l2anlQMjhzMHBaZlZnL1k1?=
 =?utf-8?B?Tmd5V0JlaTRPMk5yWWFMdUVYN00yejNGREh1SWhJU1RTWFJQaUw4bTkrNFdC?=
 =?utf-8?B?eWZkbXBvOGZvdERvS016Mjd1bStoU2xocnJEQWh3QjhWQ3lQY25ab0pQWDBx?=
 =?utf-8?B?aTRJbUFmWEZuWlBhV2tVRlpHRTNuS1VVU0Q2aTVVZkhlRHIzc2k0aUp1NDkv?=
 =?utf-8?B?WjdibXFGTnVkdTBlV3JkY0lmQ3N6Y1J6eU1ybS80Tk9FMHg3eU1keFZxRUdq?=
 =?utf-8?B?NCsyYnhUNCtrcERWTGgvV25GMWEwdTdURmJpSUsrYUpFVjZwcldnR2daUzZP?=
 =?utf-8?B?Y1ZnVVhYMVN4OHQ3STlvcFdxM1R1cHk0M3FBb2FiYnNKb2RHMlAzcjdUSTlv?=
 =?utf-8?B?OWRRNW5vVFdFVVRVVWZuZGxvNTAraVNvZTZrbFNWTUVGQm5WQUwvZExMV2py?=
 =?utf-8?B?Wm9yOHlYMkJIR0VsbXBxUkRINm9WZ1Y1MlZkeGcwcUNHTUd0WnRmSmRic1pm?=
 =?utf-8?B?Y3VyT25pNnY4NWJIck8rNDRlc0F3b3o4YUtYZHVjMHR1YWtLVEFRMkgvZUY0?=
 =?utf-8?B?RHBuWTd5czFWODRFc1prSmpOaHAzZkpsY29CdmJyKytvMnhBVzdwcDd1RmhK?=
 =?utf-8?B?U0tpa3hxaXl5cDFYeWR5STJkdmNjMUxEOFluck5JOGxveE1MQjUzdFptUDBh?=
 =?utf-8?B?d2NLNnlFNWRGcUF4R0l1VzNtdW5nSE4ycUROdGROY2R1U0YzeTBUNnNUb3VM?=
 =?utf-8?B?WklLVTBsKzdqZmd4UlVhOHJrbXpOMHQ1anVKaHVMV0lId25rL2RCZzNzbldj?=
 =?utf-8?B?NFdHWDVOOUNHWWJkN2hOalE5T0ppWWRsdEVHT1M1akRYWm4rNjZRc2lCMitq?=
 =?utf-8?B?cUNnam16eWhyZjZvSklFZDBPb1BwUHhGVlJjZTFhS09qc3prL2NpOFFOZzVi?=
 =?utf-8?B?UndiWUhBZ0dYUVRwTDAzdGYxWGJlS0w5SUdkWlUvY3ZaUUVIcFV5d0pTVFgv?=
 =?utf-8?B?Z2ZCYUNSb0NJOWtYYTZsV0JpdDRDaFJSRk1TWnEyNTFtOWpKcGZVS213akkz?=
 =?utf-8?B?bEpPWFJQdXpsSUYxSE9lSURXTGhxRkZhdVNDa2dtQ0l0SDFZcDBFalJjOGs3?=
 =?utf-8?B?bEdqL0xDM2pvTm5DM0FQVG5ISFM3OXlIVHorSVNPOFE0ZEJZZHJISWIzVkp3?=
 =?utf-8?B?eFdWNkp6RTlLMDNFMHZrTThwNGl3OXMxSFRERXd3U2hMV3drcERhQzNEK0Ni?=
 =?utf-8?B?NmViN2xVOVB5MThqTTlzUjhXU1YyZGFySVBVaTgraE9Gd2hPb2Iwb1IydW1Q?=
 =?utf-8?B?UjB4NW56dThvKzF1TDZYMThpYUxuOHJxYWtQcjg5NmZQR3BCU3BaTFNLK2E4?=
 =?utf-8?B?azhEUDhKclVGU1pHTTdybDVsUU03WjFTT0JFL2dEZ3c1bExRRExlVTZZSkF6?=
 =?utf-8?B?c0Rydlp3eVBUSlpmUDJSQVdEeE9ZZkhqR2VkcGhUT000MVhvbXlmbWRBMkw2?=
 =?utf-8?B?Zk1FUlVZUUFITS9lUmgrdSsySzZrOG9BQWY4M0VHak9JNTVTUWFXQlRXME9q?=
 =?utf-8?B?MFptK25CS3hsTUZpZk5nZUtVdVp5MHJOSmxOTVZ3b2cyblU1Q2J1ZmpTd1Uz?=
 =?utf-8?B?NXhXd2JISVR1dnBrdnNVUVZYR0JUQmJZQ2pHT25BeVNVVXd6cnI0L2JWYXd2?=
 =?utf-8?B?TVgzTkZhQmlpbEhqTHRDRkZFalBYWGhneURpSis5d2QrTGM5VklmTkJjZFdS?=
 =?utf-8?B?K1dTQTF2NkY4N0V0RHJ6Sk5XMm5wbkJEMUlQaTRlOENrVU1POE8xYTJNaXU4?=
 =?utf-8?B?SkI1c2N3Z0FFRzZVMlFEUENxd2dLaEp4cGlndlN0Um9HZ1BTdFBKTHBPcHE5?=
 =?utf-8?B?R2dMbFRiQSt2Q3QzUU9iY3VzaFdOWGhlWUg5b0VuZFZpYVJwbFVKMWNFQ3I4?=
 =?utf-8?B?NzM0ajRYUm5jZmNRTDIyOUxqWlpLMTY1bHgvU3IvWExLOVRSM1BsZGs1RDg5?=
 =?utf-8?Q?V1f93qDB//jIjbsAUrtDwqtX0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b17ab54-2240-478d-f297-08dbb1f4947a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2023 11:53:42.7473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rv6NsbUCVC0yQJm5BfE3A5a5Zc8UPY4b225ZUACfJrtdPmJ8PwoGG3ZZFRLZvWfUGoBpp5OiHl8othQROHidQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5049
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
Cc: "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
 "hughd@google.com" <hughd@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 syzbot <syzbot+17a207d226b8a5fb0fd9@syzkaller.appspotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/10/2023 3:02 PM, Kasireddy, Vivek wrote:
> Hi Fengwei,
> 
>>
>> Add udmabuf maintainers.
>>
>> On 9/7/2023 2:51 AM, syzbot wrote:
>>> Hello,
>>>
>>> syzbot found the following issue on:
>>>
>>> HEAD commit:    db906f0ca6bb Merge tag 'phy-for-6.6' of git://git.kernel.o..
>>> git tree:       upstream
>>> console+strace: https://syzkaller.appspot.com/x/log.txt?x=16cbb32fa80000
>>> kernel config:
>> https://syzkaller.appspot.com/x/.config?x=3bd57a1ac08277b0
>>> dashboard link:
>> https://syzkaller.appspot.com/bug?extid=17a207d226b8a5fb0fd9
>>> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for
>> Debian) 2.40
>>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11609f38680000
>>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14c1fc00680000
>>>
>>> Downloadable assets:
>>> disk image: https://storage.googleapis.com/syzbot-
>> assets/46394f3ca3eb/disk-db906f0c.raw.xz
>>> vmlinux: https://storage.googleapis.com/syzbot-
>> assets/eeaa594bfd1f/vmlinux-db906f0c.xz
>>> kernel image: https://storage.googleapis.com/syzbot-
>> assets/5c8df8de79ec/bzImage-db906f0c.xz
>>>
>>> IMPORTANT: if you fix the issue, please add the following tag to the
>> commit:
>>> Reported-by: syzbot+17a207d226b8a5fb0fd9@syzkaller.appspotmail.com
>>
>> Operations from user space before kernel BUG hit:
>>
>> [pid  5043]
>> memfd_create("\x79\x10\x35\x25\xfa\x2c\x1f\x99\xa2\xc9\x8e\xcd\x5c\xfa
>> \xf6\x12\x95\x5e\xdf\x54\xe2\x3d\x0e\x7e\x46\xcd\x73\xa3\xff\x89\x3e\x
>> 84\xa9\x86\x86\xa2\x46\x90\x93\x98\x4e\x05\x65\x92\x4a\x77\xce\x63\xc
>> e\x9f\x32\xc8\x02\x66\x03\x07\x6d\x08\xb4\x48\x8f\x9e\xa5\x16\x8f\x61\
>> xff\xb2\x22\x8a\x15\x13\xa2\x17\x25\x21\x54\x8b\xa1\xb9\x2d\x13\xf9\x
>> 6f\x67\x95\x9d\x54\xef\xca\x68\x77\xf5\xff\x75\x7f\x75\xb8\x2a\xd3"...,
>> MFD_ALLOW_SEALING) = 3
>> [pid  5043] ftruncate(3, 65535)         = 0
>> [pid  5043] fcntl(3, F_ADD_SEALS,
>> F_SEAL_SEAL|F_SEAL_SHRINK|F_SEAL_GROW) = 0
>> [pid  5043] openat(AT_FDCWD, "/dev/udmabuf", O_RDWR) = 4
>> [pid  5043] ioctl(4, UDMABUF_CREATE, 0x20000000) = 5
>> [pid  5043] mmap(0x20667000, 16384,
>> PROT_WRITE|PROT_EXEC|PROT_SEM|PROT_GROWSDOWN,
>> MAP_SHARED|MAP_FIXED|MAP_POPULATE|MAP_STACK, 5, 0) = 0x20667000
>>
>> The crash happens when test app tried to close the memfd.
>>
>>
>> It's like test app created udmabuf above memfd. But didn't boost memfd
>> refcount.
>> And mmap with MAP_POPULATE make the underneath folios mapped.
>>
>> When memfd is closed without munmap 0x20667000, the memfd refcount
>> hit zero and
>> trigger evict() and hit
>> 	VM_BUG_ON_FOLIO(folio_mapped(folio), folio);
>>
>>
>> Related test code:
>>
>>   res = syscall(__NR_memfd_create, /*name=*/0x20000040ul, /*flags=*/2ul);
>>   if (res != -1)
>>     r[0] = res;
>>   syscall(__NR_ftruncate, /*fd=*/r[0], /*len=*/0xfffful);
>>   syscall(__NR_fcntl, /*fd=*/r[0], /*cmd=*/0x409ul, /*seals=*/7ul);
>>   memcpy((void*)0x200001c0, "/dev/udmabuf\000", 13);
>>   res = syscall(__NR_openat, /*fd=*/0xffffffffffffff9cul, /*file=*/0x200001c0ul,
>>                 /*flags=*/2ul, 0);
>>   if (res != -1)
>>     r[1] = res;
>>   *(uint32_t*)0x20000000 = r[0];
>>   *(uint32_t*)0x20000004 = 0;
>>   *(uint64_t*)0x20000008 = 0;
>>   *(uint64_t*)0x20000010 = 0x8000;
>>   res = syscall(__NR_ioctl, /*fd=*/r[1], /*cmd=*/0x40187542,
>>                 /*arg=*/0x20000000ul);
>>   if (res != -1)
>>     r[2] = res;
>>   syscall(__NR_mmap, /*addr=*/0x20667000ul, /*len=*/0x4000ul,
>>           /*prot=*/0x100000eul, /*flags=*/0x28011ul, /*fd=*/r[2],
>>           /*offset=*/0ul);
>>   close_fds();
>>
>>
>> Should memfd refcount increased when create udmabuf above it? Thanks.
> I think the following patch should fix this crash:
> https://lists.freedesktop.org/archives/dri-devel/2023-August/418952.html
Yes. This patch avoid playing with struct page when mmap memory to user
space. And avoid make pages marked as mapped.


Regards
Yin, Fengwei

> 
> Thanks,
> Vivek
>>
>> Regards
>> Yin, Fengwei
>>
>>>
>>>  search_binary_handler fs/exec.c:1739 [inline]
>>>  exec_binprm fs/exec.c:1781 [inline]
>>>  bprm_execve fs/exec.c:1856 [inline]
>>>  bprm_execve+0x80a/0x1a50 fs/exec.c:1812
>>>  do_execveat_common.isra.0+0x5d3/0x740 fs/exec.c:1964
>>>  do_execve fs/exec.c:2038 [inline]
>>>  __do_sys_execve fs/exec.c:2114 [inline]
>>>  __se_sys_execve fs/exec.c:2109 [inline]
>>>  __x64_sys_execve+0x8c/0xb0 fs/exec.c:2109
>>>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>>>  do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
>>>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>>> ------------[ cut here ]------------
>>> kernel BUG at mm/filemap.c:158!
>>> invalid opcode: 0000 [#1] PREEMPT SMP KASAN
>>> CPU: 0 PID: 5043 Comm: syz-executor729 Not tainted 6.5.0-syzkaller-11275-
>> gdb906f0ca6bb #0
>>> Hardware name: Google Google Compute Engine/Google Compute Engine,
>> BIOS Google 07/26/2023
>>> RIP: 0010:filemap_unaccount_folio+0x62e/0x870 mm/filemap.c:158
>>> Code: 0f 85 68 01 00 00 8b 6b 5c 31 ff 89 ee e8 6a 3e d2 ff 85 ed 7e 16 e8 f1
>> 42 d2 ff 48 c7 c6 c0 3b 97 8a 48 89 df e8 a2 58 10 00 <0f> 0b e8 db 42 d2 ff 48
>> 8d 6b 58 be 04 00 00 00 48 89 ef e8 0a 0d
>>> RSP: 0018:ffffc900039ef828 EFLAGS: 00010093
>>> RAX: 0000000000000000 RBX: ffffea0001cfe400 RCX: 0000000000000000
>>> RDX: ffff88807e171dc0 RSI: ffffffff81b559ae RDI: 0000000000000000
>>> RBP: 0000000000000000 R08: 0000000000000000 R09: fffffbfff1d9be7a
>>> R10: ffffffff8ecdf3d7 R11: 0000000000000001 R12: ffff8880258003b8
>>> R13: ffffea0001cfe400 R14: ffffea0001cfe418 R15: ffffea0001cfe420
>>> FS:  0000555556b42380(0000) GS:ffff8880b9800000(0000)
>> knlGS:0000000000000000
>>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> CR2: 00000000005fdeb8 CR3: 000000007a443000 CR4: 00000000003506f0
>>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>>> Call Trace:
>>>  <TASK>
>>>  __filemap_remove_folio+0x110/0x820 mm/filemap.c:227
>>>  filemap_remove_folio+0xca/0x210 mm/filemap.c:260
>>>  truncate_inode_folio+0x49/0x70 mm/truncate.c:195
>>>  shmem_undo_range+0x365/0x1040 mm/shmem.c:1018
>>>  shmem_truncate_range mm/shmem.c:1114 [inline]
>>>  shmem_evict_inode+0x392/0xb50 mm/shmem.c:1243
>>>  evict+0x2ed/0x6b0 fs/inode.c:664
>>>  iput_final fs/inode.c:1775 [inline]
>>>  iput.part.0+0x55e/0x7a0 fs/inode.c:1801
>>>  iput+0x5c/0x80 fs/inode.c:1791
>>>  dentry_unlink_inode+0x292/0x430 fs/dcache.c:401
>>>  __dentry_kill+0x3b8/0x640 fs/dcache.c:607
>>>  dentry_kill fs/dcache.c:733 [inline]
>>>  dput+0x8dd/0xfd0 fs/dcache.c:913
>>>  __fput+0x536/0xa70 fs/file_table.c:392
>>>  __fput_sync+0x47/0x50 fs/file_table.c:465
>>>  __do_sys_close fs/open.c:1572 [inline]
>>>  __se_sys_close fs/open.c:1557 [inline]
>>>  __x64_sys_close+0x87/0xf0 fs/open.c:1557
>>>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>>>  do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
>>>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>>> RIP: 0033:0x7f6700c6aa90
>>> Code: ff f7 d8 64 89 02 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 66
>> 90 80 3d f1 85 07 00 00 74 17 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 48 c3
>> 0f 1f 80 00 00 00 00 48 83 ec 18 89 7c
>>> RSP: 002b:00007ffd27935ca8 EFLAGS: 00000202 ORIG_RAX:
>> 0000000000000003
>>> RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00007f6700c6aa90
>>> RDX: 0000000000000000 RSI: 0000000000004000 RDI: 0000000000000003
>>> RBP: 00007ffd27935cc0 R08: 0000000000000005 R09: 0000000000000000
>>> R10: 0000000000028011 R11: 0000000000000202 R12: 00007f6700cde5f0
>>> R13: 00007ffd27935ea8 R14: 0000000000000001 R15: 0000000000000001
>>>  </TASK>
>>> Modules linked in:
>>> ---[ end trace 0000000000000000 ]---
>>> RIP: 0010:filemap_unaccount_folio+0x62e/0x870 mm/filemap.c:158
>>> Code: 0f 85 68 01 00 00 8b 6b 5c 31 ff 89 ee e8 6a 3e d2 ff 85 ed 7e 16 e8 f1
>> 42 d2 ff 48 c7 c6 c0 3b 97 8a 48 89 df e8 a2 58 10 00 <0f> 0b e8 db 42 d2 ff 48
>> 8d 6b 58 be 04 00 00 00 48 89 ef e8 0a 0d
>>> RSP: 0018:ffffc900039ef828 EFLAGS: 00010093
>>> RAX: 0000000000000000 RBX: ffffea0001cfe400 RCX: 0000000000000000
>>> RDX: ffff88807e171dc0 RSI: ffffffff81b559ae RDI: 0000000000000000
>>> RBP: 0000000000000000 R08: 0000000000000000 R09: fffffbfff1d9be7a
>>> R10: ffffffff8ecdf3d7 R11: 0000000000000001 R12: ffff8880258003b8
>>> R13: ffffea0001cfe400 R14: ffffea0001cfe418 R15: ffffea0001cfe420
>>> FS:  0000555556b42380(0000) GS:ffff8880b9800000(0000)
>> knlGS:0000000000000000
>>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> CR2: 00000000005fdeb8 CR3: 000000007a443000 CR4: 00000000003506f0
>>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>>>
>>>
>>> ---
>>> This report is generated by a bot. It may contain errors.
>>> See https://goo.gl/tpsmEJ for more information about syzbot.
>>> syzbot engineers can be reached at syzkaller@googlegroups.com.
>>>
>>> syzbot will keep track of this issue. See:
>>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>>>
>>> If the bug is already fixed, let syzbot know by replying with:
>>> #syz fix: exact-commit-title
>>>
>>> If you want syzbot to run the reproducer, reply with:
>>> #syz test: git://repo/address.git branch-or-commit-hash
>>> If you attach or paste a git patch, syzbot will apply it before testing.
>>>
>>> If you want to overwrite bug's subsystems, reply with:
>>> #syz set subsystems: new-subsystem
>>> (See the list of subsystem names on the web dashboard)
>>>
>>> If the bug is a duplicate of another bug, reply with:
>>> #syz dup: exact-subject-of-another-report
>>>
>>> If you want to undo deduplication, reply with:
>>> #syz undup
>>>
> 
