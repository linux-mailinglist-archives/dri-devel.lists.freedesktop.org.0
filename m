Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B024541EFE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 00:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB5310F7B6;
	Tue,  7 Jun 2022 22:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57C410F7FD;
 Tue,  7 Jun 2022 22:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654641620; x=1686177620;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zllixAQdjCYfYEhZ8EIVVOh1N3I1GTGC6DHkNCCxKcA=;
 b=XOf9y6DTrvVeUVlVhHVKUc03eb2t0HWerKx6yogfEWM+7dMahf2Gl05f
 UFDAJB3Oxhh2700u36nBUlSnqv08uNb+E6kw4Ng9XI3zVKriNBUjUFoYX
 iperdRYCAvcpPz7nBrZbegeVv8oJx41TB6PSPxm+CRXuEVnPpHGRXeHHQ
 DZ3EpjTsCI81QnYkuNt4rr2F2lDI69h6PD6D+KG/t2AeYTcknICFV8yZX
 pTRR05fvwQ/EIwtUNxGpOBeSBhpzXT1KNkzw0cNtaQrwrr/16smeWbrIw
 okjZYqW4KpNu5kVOKZz6TwcmKLKW3XfSsJITMdSHjaawb0HJuwqoEiYBc w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="277800449"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="277800449"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 15:40:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; d="scan'208";a="648279201"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 07 Jun 2022 15:40:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 7 Jun 2022 15:40:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 7 Jun 2022 15:40:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 7 Jun 2022 15:40:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 7 Jun 2022 15:40:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsDdCjHYwGkTUYrh5c1bE19h0IYmL/YyV5dqI/cBRf5fbAA6n2Bi8xW8Pn0mKWlrP5lCNvEyL/YmaosmldqzmKXPcISwJzOklYiCSbD23WShm3zSS5bPoaGOKCej+6VjPnkDEevbk3+Jtbjv9rincjilKQRFL54fpt+hMHoaBp9WZaj9RYbnEbvNmOxsM6wtkena3q5XDonShLGPbt27oJ822MmCqEhsdPpp0ogMTuhHo4mHKawjadIoiZEclJqz0/0uZ8IX/yLODzo2ZCDagonxXi7EtSfNkvVUL6HroAbCoz2TOSMQdx+buLM1zHTMW+xyag5PAp0gK77fiWFaHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2RyD1jppP+GMU9GDltlxew5bYZJAFq2LktF3PVg0EQ=;
 b=Ib/8KE3jWs/6H9nvRWSnAAh9JMdXqAsTK661TuMDSnUe4UJ5T8LqJArLCLkBTqmlrATNkshoA+BXILkM7qpBFrf0YELuuZMf2AARhPk+AuQNiuN8KfqFlR3YXDbxqVWZv36BRZreMJkujaK5XfdFlUGuUnEFLhjYfxLmtLjl53G5Zjm8bbhMrdU9ajTmqV90EyGdK36SRa6DoRyRQMNRczERa/kjvK8JQ+bMcoHa7I/QsKse3HzsZOovWSLRjqoHqVQZ5WQ1EHDV38Afc18R5evocJX5h4ZrdAdxYEwKgqy54vkjs0wE7xhhNcSpJGxSTMiH18WXt1kxz16Mz6Py6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17; Tue, 7 Jun
 2022 22:40:17 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::c4f8:da8e:7cef:8cf]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::c4f8:da8e:7cef:8cf%6]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 22:40:16 +0000
Message-ID: <659c09f4-9076-9855-d587-0aadf79df1a2@intel.com>
Date: Tue, 7 Jun 2022 15:40:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH 32/33] drm/i915/guc: Implement GuC priority
 management
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20210727002348.97202-1-matthew.brost@intel.com>
 <20210727002348.97202-33-matthew.brost@intel.com>
 <d5f9d500-da55-3216-754b-69c1ef89ce14@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <d5f9d500-da55-3216-754b-69c1ef89ce14@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CO1PR15CA0064.namprd15.prod.outlook.com
 (2603:10b6:101:1f::32) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5b65ea9-2d3b-48bb-b5dc-08da48d6b190
X-MS-TrafficTypeDiagnostic: IA1PR11MB6396:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <IA1PR11MB63962B94D33957E80A677B38BDA59@IA1PR11MB6396.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MRPACP/zJnNov+ODVH86ETexcCdDhLS7xBlxrFDVelC5EYqRVy5/0QEDFqxNlHVyupBS3OZLOD54SSPSshn87wI23BUahqp9cwFh4TgYafOhx/WLZbAmWvm53Zr6KYms3hWAaH13sA1W/C5uxoT/xWEcjk+ZSWRlwNfkwpgICa2UDMDXqheHAuAarFZlP6Kps/vfay6HyX8lQ24cdetNsYmdaUfzGrxBsWuD+xbXlvcEgiP1tLg5NFzorSD4HOJ6Z5LA1UA1VKlv8Kn7aymv7BvXnorJ46ljSbOeez8NvK4ZnMOHQaN/YTd8zu6p7tnyG8QpmPkkjSaBrMOK+q3OFnLGirwxnA1tzhKLU1Ug99idaATC5LQuoC8bGCYlxspEQLdJjJBLAZR3reRp2y8ckMfkahGK38ub9wm/dXu7RtExvGFQGueu94AsrN7V9/+NhhNopMwSbt9Ar70B8Ldw849mFK4tTZWADvrCOyaQpPzNPinqlM3i8Ly0gMlvr9/FNtRNM2brWVbIi2NHYWekhFCkOLfXbsm3vEgNoKwpXSaSjJryD9WWizJcB1MxAbks0pDYh6pCdxbouPT+gsLIkKtqQiGxHmKz0pp462iFULOohmPcHMtEdLq+m9yx8A5bX2oIwfPt5h9UuSsn2CiLRili74ey3v618AP6gU5AvkxGWNvQN6yFGtjq/sQwH21P8fHIO6A7clANSlIVw08vEFK7dkeLedZFjJSn37Vq6br3febQuiRSkdCSbmZ3feAH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(2906002)(36756003)(2616005)(66476007)(5660300002)(508600001)(6506007)(316002)(30864003)(6512007)(26005)(53546011)(86362001)(186003)(31696002)(6486002)(66556008)(66946007)(8676002)(110136005)(82960400001)(83380400001)(31686004)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE9rZmtMM2g0aDlqYUJ2WHlDQzFnWnk5UXoxdlZYNVlMaXRzMGNPbHJ5dGND?=
 =?utf-8?B?azVjY3ZlVGdkREJ5SU16dGJKbXRkYUJsRHhqY3hVOG95TVlMZ0Y3cnBPUER3?=
 =?utf-8?B?YkNmWDFkcVg0QzAvTk9kTjNXcTErMmtxUHlid0F1cGZFN3FNYUtHL0ROeGYr?=
 =?utf-8?B?VkE0U3A4WlVESGlxZzdocmFtVHk1a1hNU0FMNkx5MGJZd2pxZXBvOU94U3c4?=
 =?utf-8?B?T1ZtakJvcGlWMWhDUFpIc0ZWNFNqcGpBaGFHemVodTlmSUhTU0xRWGVtVkFq?=
 =?utf-8?B?d1hlOVQrS2R5WVpaRE9XQTd5cFdOSWMxYVljTlc4WFduOXR2VFVrTXgzSnFK?=
 =?utf-8?B?TWVMbXpYYURmaXkra2ZUaGlVVUNmMExYM0RqS1JqMGlwSGpvZlZiem16eWt2?=
 =?utf-8?B?SktBOHdKbHJ4WmJPbXZHcHMzNkxZNjcvOTVUVlZoejUvSjlPVkloUEhSYzdm?=
 =?utf-8?B?b3pKWVZqdmNoTERLMnlYWWlOL3BrTXpGY3QzSVJSaWlFMTdla01veUk2Z05V?=
 =?utf-8?B?cllFQTBQUEhINEtxUmo5NG9aTk9kYkpwSTU5VFV2Q2ZEOVpxRmhGRjV0eWw3?=
 =?utf-8?B?RE0wa1EraUZqeDNPSXRIdk5NL0ZmTUsyamhSV0d4QnZsK3h0dDkrSWRvcjBa?=
 =?utf-8?B?VFllaUdLZ2N2eG1EdERtWGlnY3dGQW1SNEpGMVY2NFZYTTB4dTd4WHQ0djdz?=
 =?utf-8?B?Sk5WZHViMStsRHlUU0ZPSTBWSWp6NVNTVjc4L1hzSVhqSUl1d2J5c3QwV3NM?=
 =?utf-8?B?aGtCaGdkSjcyNUJDU1UwYTRXZkhoVEVIZFgxS0FNdUxLem13NDBIZlBNbGxu?=
 =?utf-8?B?OVA5Nld0dzRNRjNwMWYyVmhtSXN1Z0VML0daeUZtcVdoMlF4ZTExeHpNZmNL?=
 =?utf-8?B?NUxmSXBITUZEd0NvYmoxNGxlajBCa1NPOFJnWGlwcXI5OFVrVk9CbFNVdmdB?=
 =?utf-8?B?a1FNZkd2V2JjQUN5Ymp3TmtsV1VUU0NsdzdBRm8xbzFEZWNzY0ZoVDZMcEo4?=
 =?utf-8?B?ZmJybFBzdFhNWFdtY3pFZE45MHl3WStMd25lYkhHb09NL2pGU2lrQkMxeGZh?=
 =?utf-8?B?Y1pvb1NJeWRScWp4YU5rU0trL2FDWEx0RWo5Si9US0tCSFI2YjZuLzBBNFRo?=
 =?utf-8?B?enhkRWZSVDl0Q1lDZkZJRHZpZ0lJZjlkSVdxSkpDS3hERHZrTDBUMVB0cUxh?=
 =?utf-8?B?eDVEOEFOcjJkcDZuc2ZDM0lINWxNZ2s5d0xsNVNUT0VZVTRxT0ViS3JnOVJL?=
 =?utf-8?B?M2xMUjkrZFdBd29SRnhCQzRXZ3BXYWhmeVJQYi92SGFVc1FmeEFjcmtzOEV3?=
 =?utf-8?B?SGJZenJtWDJiSmF2Y0xVMnBkazJZZXNwdDZxMzVCMlI1SkFtMGgrMmFtS3dt?=
 =?utf-8?B?SmU3Vm5oZlNjWG1pVk9GRXlja2dkc3Rhc00wNTg4M0xaTGtSbitONzBKR0VE?=
 =?utf-8?B?Y0o4K1g0bkFWbVhnNERyaTFveUZYNm1mVHNEektjRno0ZHBuNEZ3MmJBZTBO?=
 =?utf-8?B?NENwQk0wOFlCb3V1cFRWYUp1L3ZEWDkxTUdidXNQOEVVMitONWlOWkgyZlpn?=
 =?utf-8?B?UmU3MjJmMUxUcE9CbWY2cysycTQvaytqbjdtNlF5V1ZYT2JqTm1Fd1o4dDhQ?=
 =?utf-8?B?TFNhcnF2VDRvYllHUHR3b1pBQytvRWhkdnA2UXpmekY4Wk8wY1RGL1c3dDlt?=
 =?utf-8?B?MGt1KzBtWFBncDdpb1RhZS93VVd2T3BVYzJKSkNyRjdyZkF0VDUwN2hEVjd5?=
 =?utf-8?B?UnMrRE9GazhBY2E2ZGxZcm1LbGx0L0hhcDd1ekV6eFBYUWFZYUs2ODVDSXZl?=
 =?utf-8?B?TzNHdFo3ZThZanI1ZVR3aUxQbStxVVoyUnZkRmE2M3hVb3dkYzdSek5BODhI?=
 =?utf-8?B?Vyt1WDFHVDBwZDB2anV0RmszL3BoM01Ga01WaGRybTY5T1NKQmZoTzFHcGR5?=
 =?utf-8?B?UGRPNzUvbUZ6bzdoeDUxTHRuV2JGdytuQ1BjditnT3dJTmpsTlVzS3VYU1VU?=
 =?utf-8?B?Wm9XTGR6L1lPZTg2bHNkTmlxTkhSdnpCNytsRTgrSWhTeExUUkhzWm9wWDkw?=
 =?utf-8?B?Zlh3bVBqQ3prRmF5V0VUaW1YZlJkYlNWQ3BhTi9PVDcyeEhaVmtVRXFZc2oy?=
 =?utf-8?B?TXAxOGVaalJ0U0dxMWZ4OUxsN2U5dDlJZWE4Rjl3OWkyZ3ZXd1U4STNKK3Fn?=
 =?utf-8?B?NnVSVmVJUnpMeE56RGRKalQ3M3BQeVRyQytMMzdidHpNZitRekw3VFdORVYr?=
 =?utf-8?B?dStFVWxjRkFHZ0ltT1REaVI5SEFibml1VS9Na3N2U29hcHpjemRYZ1Mxa3RE?=
 =?utf-8?B?Wmc3amN2M2grbkVFSytFUmJjUUZlc09sTnNFTkhXcThXVGlESm9qeDlxcS9n?=
 =?utf-8?Q?MLbW6d+oSr0BzNPY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b65ea9-2d3b-48bb-b5dc-08da48d6b190
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 22:40:16.8254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEopA07kXbaUXKQ3lHI5KgTJwbPDM2iVTogR3NdYX2Z7ZMSfm7NX2wG/9dO0GWyAvlSYs1JHuRtNGbjWahCzj2B8+cCcQj3pD9izf3lqE04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/7/2022 06:58, Tvrtko Ursulin wrote:
>
> A blast from the past..
>
> On 27/07/2021 01:23, Matthew Brost wrote:
>> Implement a simple static mapping algorithm of the i915 priority levels
>> (int, -1k to 1k exposed to user) to the 4 GuC levels. Mapping is as
>> follows:
>>
>> i915 level < 0          -> GuC low level     (3)
>> i915 level == 0         -> GuC normal level  (2)
>> i915 level < INT_MAX    -> GuC high level    (1)
>> i915 level == INT_MAX   -> GuC highest level (0)
>>
>> We believe this mapping should cover the UMD use cases (3 distinct user
>> levels + 1 kernel level).
>
> I've noticed Vulkan has VK_EXT_global_priority and AFAICT Mesa 
> implementation maps those priorities to i915 uapi:
>
>     VK_QUEUE_GLOBAL_PRIORITY_LOW_KHR = -512
>     VK_QUEUE_GLOBAL_PRIORITY_MEDIUM_KHR = 0
>     VK_QUEUE_GLOBAL_PRIORITY_HIGH_KHR = +512
>     VK_QUEUE_GLOBAL_PRIORITY_REALTIME_KHR = +1023
>
Wasn't aware of the REALTIME option. Does Mesa have that as well? Pretty 
sure it only had low/medium/high last I time looked but that was quite a 
while ago.

> GuC as per this patch remaps to:
>
>     VK_QUEUE_GLOBAL_PRIORITY_LOW_KHR = GUC_CLIENT_PRIORITY_NORMAL
>     VK_QUEUE_GLOBAL_PRIORITY_MEDIUM_KHR = GUC_CLIENT_PRIORITY_KMD_NORMAL
>     VK_QUEUE_GLOBAL_PRIORITY_HIGH_KHR = GUC_CLIENT_PRIORITY_HIGH
>     VK_QUEUE_GLOBAL_PRIORITY_REALTIME_KHR = GUC_CLIENT_PRIORITY_HIGH
>
> Last two being the same, so we lose one level. I don't think it is a 
> problem according to VK spec, which is very loose, so considered fine 
> for us and just unfortunate?
My recollection is that both Vulkan and Mesa describe the priority as 
merely a hint. The implementation is free to obey or ignore as it 
desires (or as it is capable). So while it would be good to support what 
we can, we don't actually fail any compatibility rules if we don't. And 
I think the idea was to reserve the highest priority for KMD only tasks 
such as the heartbeat.

>
> Also, given drm/sched has three priorities - what is the plan to 
> connect GuC's four into those three? I ask because I noticed the 
I guess the plan there is a straight 1:1 for low/medium/high. Matthew 
would be the person with more idea on the drm/scheduler, though.

> fixed three levels does not really fit with some other drivers like 
> msm for instance. There are up to four hardware priorities there and 
> currently an odd mapping scheme is implemented. So I am getting a 
> feeling drm/sched should rather be extended to allow more flexibility 
> for drivers.
>
> And finally a side question on this particular patch - shouldn't GuC 
> map I915_PRIORITY_HEARTBEAT to GUC_CLIENT_PRIORITY_KMD_HIGH (highest)? 
> I'd say yes - we certainly want heartbeats to preempt maximum user 
> priority.
Hmm. Not sure what the point of the HEARTBEAT define is. The heartbeat 
pulse itself starts at minimum priority and then bumps upwards on each 
time period until it hits the max. So eventually, it will run at higher 
than maximum user priority. The HEARTBEAT prio itself seems to be the 
mid-point. So we don't want that to be super-high. It would even maybe 
make more sense for it to match NORMAL.

John.



>
> Regards,
>
> Tvrtko
>
>> In addition to static mapping, a simple counter system is attached to
>> each context tracking the number of requests inflight on the context at
>> each level. This is needed as the GuC levels are per context while in
>> the i915 levels are per request.
>>
>> v2:
>>   (Daniele)
>>    - Add BUILD_BUG_ON to enforce ordering of priority levels
>>    - Add missing lockdep to guc_prio_fini
>>    - Check for return before setting context registered flag
>>    - Map DISPLAY priority or higher to highest guc prio
>>    - Update comment for guc_prio
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   |   3 +
>>   drivers/gpu/drm/i915/gt/intel_context_types.h |   9 +-
>>   drivers/gpu/drm/i915/gt/intel_engine_user.c   |   4 +
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 212 +++++++++++++++++-
>>   drivers/gpu/drm/i915/i915_request.c           |   5 +
>>   drivers/gpu/drm/i915/i915_request.h           |   9 +
>>   drivers/gpu/drm/i915/i915_scheduler.c         |   7 +
>>   drivers/gpu/drm/i915/i915_scheduler_types.h   |  12 +
>>   drivers/gpu/drm/i915/i915_trace.h             |  17 +-
>>   include/uapi/drm/i915_drm.h                   |   9 +
>>   10 files changed, 282 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c 
>> b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
>> index 2007dc6f6b99..209cf265bf74 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
>> @@ -245,6 +245,9 @@ static void signal_irq_work(struct irq_work *work)
>>               llist_entry(signal, typeof(*rq), signal_node);
>>           struct list_head cb_list;
>>   +        if (rq->engine->sched_engine->retire_inflight_request_prio)
>> + rq->engine->sched_engine->retire_inflight_request_prio(rq);
>> +
>>           spin_lock(&rq->lock);
>>           list_replace(&rq->fence.cb_list, &cb_list);
>>           __dma_fence_signal__timestamp(&rq->fence, timestamp);
>> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h 
>> b/drivers/gpu/drm/i915/gt/intel_context_types.h
>> index a5bc876face7..e54351a170e2 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
>> @@ -18,8 +18,9 @@
>>   #include "intel_engine_types.h"
>>   #include "intel_sseu.h"
>>   -#define CONTEXT_REDZONE POISON_INUSE
>> +#include "uc/intel_guc_fwif.h"
>>   +#define CONTEXT_REDZONE POISON_INUSE
>>   DECLARE_EWMA(runtime, 3, 8);
>>     struct i915_gem_context;
>> @@ -191,6 +192,12 @@ struct intel_context {
>>         /* GuC context blocked fence */
>>       struct i915_sw_fence guc_blocked;
>> +
>> +    /*
>> +     * GuC priority management
>> +     */
>> +    u8 guc_prio;
>> +    u32 guc_prio_count[GUC_CLIENT_PRIORITY_NUM];
>>   };
>>     #endif /* __INTEL_CONTEXT_TYPES__ */
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c 
>> b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>> index 84142127ebd8..8f8bea08e734 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>> @@ -11,6 +11,7 @@
>>   #include "intel_engine.h"
>>   #include "intel_engine_user.h"
>>   #include "intel_gt.h"
>> +#include "uc/intel_guc_submission.h"
>>     struct intel_engine_cs *
>>   intel_engine_lookup_user(struct drm_i915_private *i915, u8 class, 
>> u8 instance)
>> @@ -115,6 +116,9 @@ static void set_scheduler_caps(struct 
>> drm_i915_private *i915)
>>               disabled |= (I915_SCHEDULER_CAP_ENABLED |
>>                        I915_SCHEDULER_CAP_PRIORITY);
>>   +        if (intel_uc_uses_guc_submission(&i915->gt.uc))
>> +            enabled |= I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP;
>> +
>>           for (i = 0; i < ARRAY_SIZE(map); i++) {
>>               if (engine->flags & BIT(map[i].engine))
>>                   enabled |= BIT(map[i].sched);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 3ff42d6e934f..b760cbf6ca0e 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -81,6 +81,7 @@ guc_create_virtual(struct intel_engine_cs 
>> **siblings, unsigned int count);
>>    */
>>   #define SCHED_STATE_NO_LOCK_ENABLED            BIT(0)
>>   #define SCHED_STATE_NO_LOCK_PENDING_ENABLE        BIT(1)
>> +#define SCHED_STATE_NO_LOCK_REGISTERED            BIT(2)
>>   static inline bool context_enabled(struct intel_context *ce)
>>   {
>>       return (atomic_read(&ce->guc_sched_state_no_lock) &
>> @@ -116,6 +117,24 @@ static inline void 
>> clr_context_pending_enable(struct intel_context *ce)
>>              &ce->guc_sched_state_no_lock);
>>   }
>>   +static inline bool context_registered(struct intel_context *ce)
>> +{
>> +    return (atomic_read(&ce->guc_sched_state_no_lock) &
>> +        SCHED_STATE_NO_LOCK_REGISTERED);
>> +}
>> +
>> +static inline void set_context_registered(struct intel_context *ce)
>> +{
>> +    atomic_or(SCHED_STATE_NO_LOCK_REGISTERED,
>> +          &ce->guc_sched_state_no_lock);
>> +}
>> +
>> +static inline void clr_context_registered(struct intel_context *ce)
>> +{
>> +    atomic_and((u32)~SCHED_STATE_NO_LOCK_REGISTERED,
>> +           &ce->guc_sched_state_no_lock);
>> +}
>> +
>>   /*
>>    * Below is a set of functions which control the GuC scheduling 
>> state which
>>    * require a lock, aside from the special case where the functions 
>> are called
>> @@ -1092,6 +1111,7 @@ static int steal_guc_id(struct intel_guc *guc)
>>             list_del_init(&ce->guc_id_link);
>>           guc_id = ce->guc_id;
>> +        clr_context_registered(ce);
>>           set_context_guc_id_invalid(ce);
>>           return guc_id;
>>       } else {
>> @@ -1201,10 +1221,15 @@ static int register_context(struct 
>> intel_context *ce, bool loop)
>>       struct intel_guc *guc = ce_to_guc(ce);
>>       u32 offset = intel_guc_ggtt_offset(guc, guc->lrc_desc_pool) +
>>           ce->guc_id * sizeof(struct guc_lrc_desc);
>> +    int ret;
>>         trace_intel_context_register(ce);
>>   -    return __guc_action_register_context(guc, ce->guc_id, offset, 
>> loop);
>> +    ret = __guc_action_register_context(guc, ce->guc_id, offset, loop);
>> +    if (likely(!ret))
>> +        set_context_registered(ce);
>> +
>> +    return ret;
>>   }
>>     static int __guc_action_deregister_context(struct intel_guc *guc,
>> @@ -1260,6 +1285,8 @@ static void guc_context_policy_init(struct 
>> intel_engine_cs *engine,
>>       desc->preemption_timeout = engine->props.preempt_timeout_ms * 
>> 1000;
>>   }
>>   +static inline u8 map_i915_prio_to_guc_prio(int prio);
>> +
>>   static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>>   {
>>       struct intel_engine_cs *engine = ce->engine;
>> @@ -1267,6 +1294,8 @@ static int guc_lrc_desc_pin(struct 
>> intel_context *ce, bool loop)
>>       struct intel_guc *guc = &engine->gt->uc.guc;
>>       u32 desc_idx = ce->guc_id;
>>       struct guc_lrc_desc *desc;
>> +    const struct i915_gem_context *ctx;
>> +    int prio = I915_CONTEXT_DEFAULT_PRIORITY;
>>       bool context_registered;
>>       intel_wakeref_t wakeref;
>>       int ret = 0;
>> @@ -1282,6 +1311,12 @@ static int guc_lrc_desc_pin(struct 
>> intel_context *ce, bool loop)
>>         context_registered = lrc_desc_registered(guc, desc_idx);
>>   +    rcu_read_lock();
>> +    ctx = rcu_dereference(ce->gem_context);
>> +    if (ctx)
>> +        prio = ctx->sched.priority;
>> +    rcu_read_unlock();
>> +
>>       reset_lrc_desc(guc, desc_idx);
>>       set_lrc_desc_registered(guc, desc_idx, ce);
>>   @@ -1290,7 +1325,8 @@ static int guc_lrc_desc_pin(struct 
>> intel_context *ce, bool loop)
>>       desc->engine_submit_mask = adjust_engine_mask(engine->class,
>>                                 engine->mask);
>>       desc->hw_context_desc = ce->lrc.lrca;
>> -    desc->priority = GUC_CLIENT_PRIORITY_KMD_NORMAL;
>> +    ce->guc_prio = map_i915_prio_to_guc_prio(prio);
>> +    desc->priority = ce->guc_prio;
>>       desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>>       guc_context_policy_init(engine, desc);
>>       init_sched_state(ce);
>> @@ -1693,11 +1729,17 @@ static inline void guc_lrc_desc_unpin(struct 
>> intel_context *ce)
>>       GEM_BUG_ON(ce != __get_context(guc, ce->guc_id));
>>       GEM_BUG_ON(context_enabled(ce));
>>   +    clr_context_registered(ce);
>>       deregister_context(ce, ce->guc_id, true);
>>   }
>>     static void __guc_context_destroy(struct intel_context *ce)
>>   {
>> + GEM_BUG_ON(ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_HIGH] ||
>> +           ce->guc_prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
>> + ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
>> +           ce->guc_prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
>> +
>>       lrc_fini(ce);
>>       intel_context_fini(ce);
>>   @@ -1791,15 +1833,124 @@ static int guc_context_alloc(struct 
>> intel_context *ce)
>>       return lrc_alloc(ce, ce->engine);
>>   }
>>   +static void guc_context_set_prio(struct intel_guc *guc,
>> +                 struct intel_context *ce,
>> +                 u8 prio)
>> +{
>> +    u32 action[] = {
>> +        INTEL_GUC_ACTION_SET_CONTEXT_PRIORITY,
>> +        ce->guc_id,
>> +        prio,
>> +    };
>> +
>> +    GEM_BUG_ON(prio < GUC_CLIENT_PRIORITY_KMD_HIGH ||
>> +           prio > GUC_CLIENT_PRIORITY_NORMAL);
>> +
>> +    if (ce->guc_prio == prio || submission_disabled(guc) ||
>> +        !context_registered(ce))
>> +        return;
>> +
>> +    guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 
>> 0, true);
>> +
>> +    ce->guc_prio = prio;
>> +    trace_intel_context_set_prio(ce);
>> +}
>> +
>> +static inline u8 map_i915_prio_to_guc_prio(int prio)
>> +{
>> +    if (prio == I915_PRIORITY_NORMAL)
>> +        return GUC_CLIENT_PRIORITY_KMD_NORMAL;
>> +    else if (prio < I915_PRIORITY_NORMAL)
>> +        return GUC_CLIENT_PRIORITY_NORMAL;
>> +    else if (prio < I915_PRIORITY_DISPLAY)
>> +        return GUC_CLIENT_PRIORITY_HIGH;
>> +    else
>> +        return GUC_CLIENT_PRIORITY_KMD_HIGH;
>> +}
>> +
>> +static inline void add_context_inflight_prio(struct intel_context *ce,
>> +                         u8 guc_prio)
>> +{
>> +    lockdep_assert_held(&ce->guc_active.lock);
>> +    GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_prio_count));
>> +
>> +    ++ce->guc_prio_count[guc_prio];
>> +
>> +    /* Overflow protection */
>> +    GEM_WARN_ON(!ce->guc_prio_count[guc_prio]);
>> +}
>> +
>> +static inline void sub_context_inflight_prio(struct intel_context *ce,
>> +                         u8 guc_prio)
>> +{
>> +    lockdep_assert_held(&ce->guc_active.lock);
>> +    GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_prio_count));
>> +
>> +    /* Underflow protection */
>> +    GEM_WARN_ON(!ce->guc_prio_count[guc_prio]);
>> +
>> +    --ce->guc_prio_count[guc_prio];
>> +}
>> +
>> +static inline void update_context_prio(struct intel_context *ce)
>> +{
>> +    struct intel_guc *guc = &ce->engine->gt->uc.guc;
>> +    int i;
>> +
>> +    BUILD_BUG_ON(GUC_CLIENT_PRIORITY_KMD_HIGH != 0);
>> +    BUILD_BUG_ON(GUC_CLIENT_PRIORITY_KMD_HIGH > 
>> GUC_CLIENT_PRIORITY_NORMAL);
>> +
>> +    lockdep_assert_held(&ce->guc_active.lock);
>> +
>> +    for (i = 0; i < ARRAY_SIZE(ce->guc_prio_count); ++i) {
>> +        if (ce->guc_prio_count[i]) {
>> +            guc_context_set_prio(guc, ce, i);
>> +            break;
>> +        }
>> +    }
>> +}
>> +
>> +static inline bool new_guc_prio_higher(u8 old_guc_prio, u8 
>> new_guc_prio)
>> +{
>> +    /* Lower value is higher priority */
>> +    return new_guc_prio < old_guc_prio;
>> +}
>> +
>>   static void add_to_context(struct i915_request *rq)
>>   {
>>       struct intel_context *ce = rq->context;
>> +    u8 new_guc_prio = map_i915_prio_to_guc_prio(rq_prio(rq));
>> +
>> +    GEM_BUG_ON(rq->guc_prio == GUC_PRIO_FINI);
>>         spin_lock(&ce->guc_active.lock);
>>       list_move_tail(&rq->sched.link, &ce->guc_active.requests);
>> +
>> +    if (rq->guc_prio == GUC_PRIO_INIT) {
>> +        rq->guc_prio = new_guc_prio;
>> +        add_context_inflight_prio(ce, rq->guc_prio);
>> +    } else if (new_guc_prio_higher(rq->guc_prio, new_guc_prio)) {
>> +        sub_context_inflight_prio(ce, rq->guc_prio);
>> +        rq->guc_prio = new_guc_prio;
>> +        add_context_inflight_prio(ce, rq->guc_prio);
>> +    }
>> +    update_context_prio(ce);
>> +
>>       spin_unlock(&ce->guc_active.lock);
>>   }
>>   +static void guc_prio_fini(struct i915_request *rq, struct 
>> intel_context *ce)
>> +{
>> +    lockdep_assert_held(&ce->guc_active.lock);
>> +
>> +    if (rq->guc_prio != GUC_PRIO_INIT &&
>> +        rq->guc_prio != GUC_PRIO_FINI) {
>> +        sub_context_inflight_prio(ce, rq->guc_prio);
>> +        update_context_prio(ce);
>> +    }
>> +    rq->guc_prio = GUC_PRIO_FINI;
>> +}
>> +
>>   static void remove_from_context(struct i915_request *rq)
>>   {
>>       struct intel_context *ce = rq->context;
>> @@ -1812,6 +1963,8 @@ static void remove_from_context(struct 
>> i915_request *rq)
>>       /* Prevent further __await_execution() registering a cb, then 
>> flush */
>>       set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
>>   +    guc_prio_fini(rq, ce);
>> +
>>       spin_unlock_irq(&ce->guc_active.lock);
>>         atomic_dec(&ce->guc_id_ref);
>> @@ -2093,6 +2246,39 @@ static void guc_init_breadcrumbs(struct 
>> intel_engine_cs *engine)
>>       }
>>   }
>>   +static void guc_bump_inflight_request_prio(struct i915_request *rq,
>> +                       int prio)
>> +{
>> +    struct intel_context *ce = rq->context;
>> +    u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
>> +
>> +    /* Short circuit function */
>> +    if (prio < I915_PRIORITY_NORMAL ||
>> +        rq->guc_prio == GUC_PRIO_FINI ||
>> +        (rq->guc_prio != GUC_PRIO_INIT &&
>> +         !new_guc_prio_higher(rq->guc_prio, new_guc_prio)))
>> +        return;
>> +
>> +    spin_lock(&ce->guc_active.lock);
>> +    if (rq->guc_prio != GUC_PRIO_FINI) {
>> +        if (rq->guc_prio != GUC_PRIO_INIT)
>> +            sub_context_inflight_prio(ce, rq->guc_prio);
>> +        rq->guc_prio = new_guc_prio;
>> +        add_context_inflight_prio(ce, rq->guc_prio);
>> +        update_context_prio(ce);
>> +    }
>> +    spin_unlock(&ce->guc_active.lock);
>> +}
>> +
>> +static void guc_retire_inflight_request_prio(struct i915_request *rq)
>> +{
>> +    struct intel_context *ce = rq->context;
>> +
>> +    spin_lock(&ce->guc_active.lock);
>> +    guc_prio_fini(rq, ce);
>> +    spin_unlock(&ce->guc_active.lock);
>> +}
>> +
>>   static void sanitize_hwsp(struct intel_engine_cs *engine)
>>   {
>>       struct intel_timeline *tl;
>> @@ -2317,6 +2503,10 @@ int intel_guc_submission_setup(struct 
>> intel_engine_cs *engine)
>>           guc->sched_engine->disabled = guc_sched_engine_disabled;
>>           guc->sched_engine->private_data = guc;
>>           guc->sched_engine->destroy = guc_sched_engine_destroy;
>> +        guc->sched_engine->bump_inflight_request_prio =
>> +            guc_bump_inflight_request_prio;
>> +        guc->sched_engine->retire_inflight_request_prio =
>> +            guc_retire_inflight_request_prio;
>>           tasklet_setup(&guc->sched_engine->tasklet,
>>                     guc_submission_tasklet);
>>       }
>> @@ -2694,6 +2884,22 @@ void intel_guc_submission_print_info(struct 
>> intel_guc *guc,
>>       drm_printf(p, "\n");
>>   }
>>   +static inline void guc_log_context_priority(struct drm_printer *p,
>> +                        struct intel_context *ce)
>> +{
>> +    int i;
>> +
>> +    drm_printf(p, "\t\tPriority: %d\n",
>> +           ce->guc_prio);
>> +    drm_printf(p, "\t\tNumber Requests (lower index == higher 
>> priority)\n");
>> +    for (i = GUC_CLIENT_PRIORITY_KMD_HIGH;
>> +         i < GUC_CLIENT_PRIORITY_NUM; ++i) {
>> +        drm_printf(p, "\t\tNumber requests in priority band[%d]: %d\n",
>> +               i, ce->guc_prio_count[i]);
>> +    }
>> +    drm_printf(p, "\n");
>> +}
>> +
>>   void intel_guc_submission_print_context_info(struct intel_guc *guc,
>>                            struct drm_printer *p)
>>   {
>> @@ -2716,6 +2922,8 @@ void 
>> intel_guc_submission_print_context_info(struct intel_guc *guc,
>>           drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
>>                  ce->guc_state.sched_state,
>> atomic_read(&ce->guc_sched_state_no_lock));
>> +
>> +        guc_log_context_priority(p, ce);
>>       }
>>   }
>>   diff --git a/drivers/gpu/drm/i915/i915_request.c 
>> b/drivers/gpu/drm/i915/i915_request.c
>> index 541a20371502..1f1d4a6a0eff 100644
>> --- a/drivers/gpu/drm/i915/i915_request.c
>> +++ b/drivers/gpu/drm/i915/i915_request.c
>> @@ -114,6 +114,9 @@ static void i915_fence_release(struct dma_fence 
>> *fence)
>>   {
>>       struct i915_request *rq = to_request(fence);
>>   +    GEM_BUG_ON(rq->guc_prio != GUC_PRIO_INIT &&
>> +           rq->guc_prio != GUC_PRIO_FINI);
>> +
>>       /*
>>        * The request is put onto a RCU freelist (i.e. the address
>>        * is immediately reused), mark the fences as being freed now.
>> @@ -924,6 +927,8 @@ __i915_request_create(struct intel_context *ce, 
>> gfp_t gfp)
>>         rq->rcustate = get_state_synchronize_rcu(); /* acts as 
>> smp_mb() */
>>   +    rq->guc_prio = GUC_PRIO_INIT;
>> +
>>       /* We bump the ref for the fence chain */
>> i915_sw_fence_reinit(&i915_request_get(rq)->submit);
>> i915_sw_fence_reinit(&i915_request_get(rq)->semaphore);
>> diff --git a/drivers/gpu/drm/i915/i915_request.h 
>> b/drivers/gpu/drm/i915/i915_request.h
>> index ac0e3326c067..e6a0e0ebc9aa 100644
>> --- a/drivers/gpu/drm/i915/i915_request.h
>> +++ b/drivers/gpu/drm/i915/i915_request.h
>> @@ -293,6 +293,15 @@ struct i915_request {
>>        */
>>       struct list_head guc_fence_link;
>>   +    /**
>> +     * Priority level while the request is inflight. Differs from i915
>> +     * scheduler priority. See comment above
>> +     * I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP for details.
>> +     */
>> +#define    GUC_PRIO_INIT    0xff
>> +#define    GUC_PRIO_FINI    0xfe
>> +    u8 guc_prio;
>> +
>>       I915_SELFTEST_DECLARE(struct {
>>           struct list_head link;
>>           unsigned long delay;
>> diff --git a/drivers/gpu/drm/i915/i915_scheduler.c 
>> b/drivers/gpu/drm/i915/i915_scheduler.c
>> index 28dd887eb1be..17843c204356 100644
>> --- a/drivers/gpu/drm/i915/i915_scheduler.c
>> +++ b/drivers/gpu/drm/i915/i915_scheduler.c
>> @@ -241,6 +241,9 @@ static void __i915_schedule(struct 
>> i915_sched_node *node,
>>       /* Fifo and depth-first replacement ensure our deps execute 
>> before us */
>>       sched_engine = lock_sched_engine(node, sched_engine, &cache);
>>       list_for_each_entry_safe_reverse(dep, p, &dfs, dfs_link) {
>> +        struct i915_request *from = container_of(dep->signaler,
>> +                             struct i915_request,
>> +                             sched);
>>           INIT_LIST_HEAD(&dep->dfs_link);
>>             node = dep->signaler;
>> @@ -254,6 +257,10 @@ static void __i915_schedule(struct 
>> i915_sched_node *node,
>> GEM_BUG_ON(node_to_request(node)->engine->sched_engine !=
>>                  sched_engine);
>>   +        /* Must be called before changing the nodes priority */
>> +        if (sched_engine->bump_inflight_request_prio)
>> +            sched_engine->bump_inflight_request_prio(from, prio);
>> +
>>           WRITE_ONCE(node->attr.priority, prio);
>>             /*
>> diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h 
>> b/drivers/gpu/drm/i915/i915_scheduler_types.h
>> index eaef233e9080..b0a1b58c7893 100644
>> --- a/drivers/gpu/drm/i915/i915_scheduler_types.h
>> +++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
>> @@ -179,6 +179,18 @@ struct i915_sched_engine {
>>       void    (*kick_backend)(const struct i915_request *rq,
>>                   int prio);
>>   +    /**
>> +     * @bump_inflight_request_prio: update priority of an inflight 
>> request
>> +     */
>> +    void    (*bump_inflight_request_prio)(struct i915_request *rq,
>> +                          int prio);
>> +
>> +    /**
>> +     * @retire_inflight_request_prio: indicate request is retired to
>> +     * priority tracking
>> +     */
>> +    void    (*retire_inflight_request_prio)(struct i915_request *rq);
>> +
>>       /**
>>        * @schedule: adjust priority of request
>>        *
>> diff --git a/drivers/gpu/drm/i915/i915_trace.h 
>> b/drivers/gpu/drm/i915/i915_trace.h
>> index 9613a7c19661..806ad688274b 100644
>> --- a/drivers/gpu/drm/i915/i915_trace.h
>> +++ b/drivers/gpu/drm/i915/i915_trace.h
>> @@ -904,6 +904,7 @@ DECLARE_EVENT_CLASS(intel_context,
>>                    __field(int, pin_count)
>>                    __field(u32, sched_state)
>>                    __field(u32, guc_sched_state_no_lock)
>> +                 __field(u8, guc_prio)
>>                    ),
>>                 TP_fast_assign(
>> @@ -912,12 +913,19 @@ DECLARE_EVENT_CLASS(intel_context,
>>                  __entry->sched_state = ce->guc_state.sched_state;
>>                  __entry->guc_sched_state_no_lock =
>> atomic_read(&ce->guc_sched_state_no_lock);
>> +               __entry->guc_prio = ce->guc_prio;
>>                  ),
>>   -            TP_printk("guc_id=%d, pin_count=%d 
>> sched_state=0x%x,0x%x",
>> +            TP_printk("guc_id=%d, pin_count=%d 
>> sched_state=0x%x,0x%x, guc_prio=%u",
>>                     __entry->guc_id, __entry->pin_count,
>>                     __entry->sched_state,
>> -                  __entry->guc_sched_state_no_lock)
>> +                  __entry->guc_sched_state_no_lock,
>> +                  __entry->guc_prio)
>> +);
>> +
>> +DEFINE_EVENT(intel_context, intel_context_set_prio,
>> +         TP_PROTO(struct intel_context *ce),
>> +         TP_ARGS(ce)
>>   );
>>     DEFINE_EVENT(intel_context, intel_context_reset,
>> @@ -1017,6 +1025,11 @@ trace_i915_request_out(struct i915_request *rq)
>>   {
>>   }
>>   +static inline void
>> +trace_intel_context_set_prio(struct intel_context *ce)
>> +{
>> +}
>> +
>>   static inline void
>>   trace_intel_context_reset(struct intel_context *ce)
>>   {
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 975087553ea0..7f13d241417f 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -572,6 +572,15 @@ typedef struct drm_i915_irq_wait {
>>   #define   I915_SCHEDULER_CAP_PREEMPTION    (1ul << 2)
>>   #define   I915_SCHEDULER_CAP_SEMAPHORES    (1ul << 3)
>>   #define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS    (1ul << 4)
>> +/*
>> + * Indicates the 2k user priority levels are statically mapped into 
>> 3 buckets as
>> + * follows:
>> + *
>> + * -1k to -1    Low priority
>> + * 0        Normal priority
>> + * 1 to 1k    Highest priority
>> + */
>> +#define   I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP    (1ul << 5)
>>     #define I915_PARAM_HUC_STATUS         42

