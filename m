Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 797EF4A9FB0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 20:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F402F10E66C;
	Fri,  4 Feb 2022 19:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441E510E28A;
 Fri,  4 Feb 2022 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644001407; x=1675537407;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m8fOCeyOJy2lsQtme+P8XmWaQ3DGTeLMWjjKu5JvmFs=;
 b=P4DZ409fTF6eZrY48Mgpc8yPDbaqxIQYcVJgR7Pwoz66taIvEjshykXP
 q+9OUHPvGjDS68QH0qXTrEay4eHUT4EkUckW7M9fToAnFORuaIMhlhHAK
 aDgHB9XI0FJLPKy/G8/xwMCx5UyJdksyVmHcNzBYGxUbyYAeGaAtwgBa0
 AU6RnJen8Y8FsgEJrUKGbKRA/xELbgmBrk9nGWH7q5Rlp/0Oh6ZLeH5Td
 53f2bCCvs/SHHdBVZiaD925nckvZij1sF2vwWzmtOrIaGVzg0uvGRhjp4
 i20mLflD4K6HgD1ls+4sycUG54jm131xgoxkFjkNB3fBcdCjEl0vlok9x A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="311726727"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="311726727"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 11:03:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="539266165"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 04 Feb 2022 11:03:26 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 4 Feb 2022 11:03:26 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 4 Feb 2022 11:03:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 4 Feb 2022 11:03:25 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 4 Feb 2022 11:03:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5CjCT7pkQtqFDE4uWXncVgJjB2h6binEF7Ucdu6/JbntgfLCaqwGV+WX3VdjyJPIB8P6viim6MTlV0TVWiToHDL4tIrWywIPpm7fYmyyjwEYHFEGenPi0jBtXc2n7edSUoVcfbApCvso6ADl3O/E5L88gV4fpwYqzdwS6XKrS5/oGfMSWxha2zm9Q6XyK+Nz0DxOINlP/DEvchnVXMoI7aae+5v9kD4qAPoHH+Pi1jLonBmbQicLnHirX9MmU2JA73eMwRFbyo2Umj+DCOzItTYNzAY8OIK8fHqStxOTnoFQ/Wah4u2WBdg2QMcbLQSpABTLyygMLSK03s19mnxMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfnyBkZas5TgRDgi3KZnHrHnVHNkv0KpEMjhrnGo/Qw=;
 b=lLDPxRxiMQttc4AuU7aK72IpCUlAqXBf78UlHjNeHSwS9EcQoWaMXSkmHXgS8egRP6lCkvx4k+TkRGEhjydherbey2Pi7eVQTwVZN0ts9YEW3n3fQe8gZXbnU01lkEFXPQeo54X5+/61tM6x92+FkmULIOidipw9LFQoKxiKOHYMFp8LCQttUWri10XThx18owvxRCrzbDOiRMSFfWr5BmRsG3sPFyKtHxuhjR9eViS+QqSFah+MlhMhGCmjiY9FXt/lIZqXqpT64uh9kEqO7h9CDH4krThtInPhpfW//15X5TgyGLN0afvIY6cKUU5NGelqUlzDMFEstRPeN0xsIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM5PR11MB1673.namprd11.prod.outlook.com (2603:10b6:4:c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.16; Fri, 4 Feb 2022 19:03:23 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::31cf:9fdd:f7a4:70b8]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::31cf:9fdd:f7a4:70b8%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 19:03:23 +0000
Message-ID: <c1766732-ee83-72bf-a71a-08d30bfdfb34@intel.com>
Date: Fri, 4 Feb 2022 11:03:20 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [PATCH v3 2/2] drm/i915/uapi: Add query for hwconfig table
Content-Language: en-GB
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220119203541.2410082-1-John.C.Harrison@Intel.com>
 <20220119203541.2410082-3-John.C.Harrison@Intel.com>
 <CAKMK7uGijP097LzoNo=MtLHpu5a6fUj=XHP5+N6SmkW5c=9i9Q@mail.gmail.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <CAKMK7uGijP097LzoNo=MtLHpu5a6fUj=XHP5+N6SmkW5c=9i9Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:303:8f::17) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1639b7d-c16b-4341-13e7-08d9e8110463
X-MS-TrafficTypeDiagnostic: DM5PR11MB1673:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR11MB1673F62F2F52EA983E74C667BD299@DM5PR11MB1673.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VGveoaY1mzAep/RGjAGv91rMUFLNpRFNWvAvLYZJaSJtpEcI6J6XVvA6FbMFL4evjdQzGndScrqza97Gh8HneZUw+ps1RoR8NyvW6hG+04+MjCZKGFFiGbPq4EX5U5HZRjhCOzPfbMAymYuwRPs0Trdn6jUW+aHqJeRqCWGJ3sJ82Hh0/jcCHsyNS6ZzZ0rbqjiui2C11rLA/TvQc3yQ/f3eDoPihBciOuKz8L8Q7XZjJGR0zUj99cmPeZQLAwvrPc+C9uMTZChi3M22hS+z3R6hr7TWewj8sgsgeifMLC/6zcTlrIWcKO2BgeaLEqVb2KGvKvSR2Mgw1ZiFKz60yC5sfjdUaChTErXBqGkNcaIslQUh1P5lUcsxS7T+0TtiPlC5A2BkERc0eQvClrvIuHkTNHy8RnLl++tD12N7yuBxhsh22CKTNuLZcAjyiRJTwvEkNkzu+or02CGrli8vz4p79CzcaN8wimCScvFu7EBIBNThE95xo9sKHS/xR4Tq6Qpix71/SWKGhHhd5TGYSjFeJX1F/HhjsHpxAJw/SAgnkzowHM0Tna3kvGOoRvaEBCnR1Q+Xdxd7s4DALquiu5Krae7Pa2a0bJ7aI4lOVgiOWc3EzWcp5q/70ONXAoZs0Yw68vNPRlyrRDV87ql+ZloK5dEay+38chzgtiSqNEyCMV3LZli6/+Zp2BCyZXYd0LO9a20p2wTyoO1tNohhDJvkYumnAwa8QQTQDlGqjP/k8x/UlZsQz3yY962dLV12
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(31696002)(2906002)(86362001)(26005)(54906003)(6916009)(508600001)(6486002)(83380400001)(8676002)(4326008)(5660300002)(66556008)(31686004)(36756003)(8936002)(38100700002)(66476007)(82960400001)(316002)(6512007)(53546011)(6506007)(2616005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SktRekdhcE1kUlJNRlBhYk9FaG5DbWpjZWpTNG40SHFIM3RLRHhLaFlmWElZ?=
 =?utf-8?B?UFVkcWd4OW9EZ0o2MW1IUXhXVkk1OTNiQ1l0THBkVDVyUTlZdDlrRW1hVmc4?=
 =?utf-8?B?THBoVG5GcmJvMktvbzBBNjg0K2VwVUYxK0lVTDJsVG8vR2hrUHRKZWRQbDFV?=
 =?utf-8?B?QzF1NGllNk9lOVpRS1ZaZ3FTdmV4OTR4MTdFcWx4MHBsQU9WMGp2Rk84VitJ?=
 =?utf-8?B?OVpzNHFmQzZYZDlnbTlWSE1aempsSDlXMm03SndhMDlla21hZEhIUU02Q0Nz?=
 =?utf-8?B?UUNxa2xwUlAyK2NIQ3lIdlhJeHNWdmFkYUswSHdVNXYwM3B0MlRac2hPRDNV?=
 =?utf-8?B?U0JheXQ1RTFuREhYSGFCMUF6SDhvRTlBSlNRa1QwMWY4SjU3NXlicUhTMC9M?=
 =?utf-8?B?cnlSV1lidGs1UmtHWkRHOURBSDZWb3UvVjJqaE5JZjE0VlZXS2ZJRVhramhC?=
 =?utf-8?B?aURZeXZRbEZsc2U2UXNZa0xFd1RFNVR5RlNhd2F3UDNiM1BqbjhCTU1ZQW80?=
 =?utf-8?B?cVdob3psSjVXVC92b1M2QXdjSytEdTY1TGhadUJ6Q0RFMmNVUkMxakticWtX?=
 =?utf-8?B?cGdwTlNxVDJyNDRmb3gxSHNKTFZza2lNKzNNRFI0cEFJc0ZvUzBDMW5zWVZF?=
 =?utf-8?B?cUhrZFcvRk1tYVJ1Nkh0TzR5ZXRTdlJhYzkvZWNNbEk1UjV1Tm8xOHFBYnJj?=
 =?utf-8?B?S1RNTkZudm9BUjhBekhLWDBKNlh2QXNwR0JtUEt5dlYyQmNFY3pobzZZN1Rq?=
 =?utf-8?B?bmFhb25YQ2NMZjFsKzRHOUxGZ2hlQ2cyQ0tZWEdxSVZFZ2VlV0FPSm1BU1Jp?=
 =?utf-8?B?Uk9kL0FzTnVVRThjeW4zQnk2aTdsUDg5WnA3Smk3UVBrOHRvODB4RndwSmNH?=
 =?utf-8?B?Z0tUVS82QXFrdnQvMTNiNlMraW45MVBhQ2hna082ZFA3N0V0MTAwZy82bHpI?=
 =?utf-8?B?Q2grdCs5eFJLcTVhaEUvUEtjczlvMHllb00weW85aHFNODNUZUd4RGt3TTRR?=
 =?utf-8?B?TkdHZjdLYWhjWUNIcDhyS1Fjd2lodThseStRdmppOWtKN2ZVODlHNkM3bkFs?=
 =?utf-8?B?R0RqdGJucXh5V0FoRlBVZkpHZHIrczBLOTVwZU5aQTBWZU1vSEJNelB1NGRj?=
 =?utf-8?B?UFBwOUltZ1pMMjlabkhOL2plYUEwaEJrcFFrQ0VraG9maFVTd01QUUsva0pa?=
 =?utf-8?B?YzFJd1ZPRGxVbGMxQ1Q2S0JiayswT3V3dGxzcVk5VHV1czUxek5SU1VtbnZ6?=
 =?utf-8?B?eGtScGpGU1gwNUN1WnNUeVowSGhWWEJIZExLSUFaa1VtRU9IblY0UnhnVDhD?=
 =?utf-8?B?QjB4SXpuS2NPQks3eVk2TlZZSk95VHhQaEtPYWxWU2RBSGRmaVl4M0R4Undq?=
 =?utf-8?B?RllnVVdsajBhTVZPSmhKQXZKOXFIZC9Wak13TWwwZzNlNFNUdGN6V2VkNnk0?=
 =?utf-8?B?Q01lWUpkOUpRUEJlaVo1RWIxM2xlUXc1QnZnWHVPQ2YvT2wzYVY1WWhxOE56?=
 =?utf-8?B?ZVVNNHpNNi9ZTUZmL1M1ZXpFckRqV1ZCK0N6RGVMZFVoOEh4WkROdDU1cG1C?=
 =?utf-8?B?NFVxc0tkYmd3QmJmV3dhQlNzQ0NxOHI0NFRZVy9HZVFRV0VOK3BiTnBHTU1N?=
 =?utf-8?B?bnM1YkEvRlF0cDdMUGV0Y01iek5Id1JKMFM3N2tCZ0NrMDZyc0lTYnBjQUxH?=
 =?utf-8?B?YWgzNkVTbkxzbjIyZFBlUzFUdXNVNHYyb3BWYTloRVFEdGRUdDh6YVUwVEM3?=
 =?utf-8?B?bVhuVXMyMlJETXZyUnNFMjlveW9rdzRFL0tXZzRPTVpPemc3RHhjeUxwdXdS?=
 =?utf-8?B?dlIrWGZ4Q0h3OVNmRE9rMFpUVmRON2ZTTzRTaG5LTkhVTHpKVTlremd2WkNh?=
 =?utf-8?B?dHVvNWpLQ3kyU0IzQlRJZ1ppNUhxQ000TlNiNmt3TVVFYmxpbVBJTDJ0c09E?=
 =?utf-8?B?U3JBUS82Ti81RnJDV0xrMkhwZHJjemwzNjBPckoreGgxaUpodTFHQkZNakVt?=
 =?utf-8?B?VnZFQVhCWHlKVVZuMEVYSnZUaEtZWnZoLzlqOWRRN1JIdVJqQnBtK2lHdEt4?=
 =?utf-8?B?ZGhHc2U4NGlWWEtMaXJ6SlJHaHJmQ3BnUG53RER4U1NEejdXZU9hSGN4RnNK?=
 =?utf-8?B?VTFUYkJaWWI4dzAwTG9QeitwditSS202cWRhVDVXdkNYYlRxRjlyQ0tvRUxW?=
 =?utf-8?B?RlNyejcwaW0vOEdYMTdPd1h5dit3QXNQd09JRVVtbTlBaS91MUNtdThTckVW?=
 =?utf-8?Q?iALRHZ+CQueIriXg9U58Wz94H0jcpCwU3FcCvnaGAY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1639b7d-c16b-4341-13e7-08d9e8110463
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 19:03:23.6888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0J5s2azv5OYrsGa/3JrlmVKYmset1BbaOQqI41d6Ner17OgEC+7ZIf1WQH0H6Dz/cnTjtS0BqxeFRmKcMYvQMsTG6cbSlbl8pFBIKplJG5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1673
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kenneth Graunke <kenneth.w.graunke@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/4/2022 01:55, Daniel Vetter wrote:
> On Wed, Jan 19, 2022 at 9:35 PM <John.C.Harrison@intel.com> wrote:
>> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> GuC contains a consolidated table with a bunch of information about the
>> current device.
>>
>> Previously, this information was spread and hardcoded to all the components
>> including GuC, i915 and various UMDs. The goal here is to consolidate
>> the data into GuC in a way that all interested components can grab the
>> very latest and synchronized information using a simple query.
>>
>> As per most of the other queries, this one can be called twice.
>> Once with item.length=0 to determine the exact buffer size, then
>> allocate the user memory and call it again for to retrieve the
>> table data. For example:
>>    struct drm_i915_query_item item = {
>>      .query_id = DRM_I915_QUERY_HWCONCFIG_TABLE;
>>    };
>>    query.items_ptr = (int64_t) &item;
>>    query.num_items = 1;
>>
>>    ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));
>>
>>    if (item.length <= 0)
>>      return -ENOENT;
>>
>>    data = malloc(item.length);
>>    item.data_ptr = (int64_t) &data;
>>    ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));
>>
>>    // Parse the data as appropriate...
>>
>> The returned array is a simple and flexible KLV (Key/Length/Value)
>> formatted table. For example, it could be just:
>>    enum device_attr {
>>       ATTR_SOME_VALUE = 0,
>>       ATTR_SOME_MASK  = 1,
>>    };
>>
>>    static const u32 hwconfig[] = {
>>        ATTR_SOME_VALUE,
>>        1,             // Value Length in DWords
>>        8,             // Value
>>
>>        ATTR_SOME_MASK,
>>        3,
>>        0x00FFFFFFFF, 0xFFFFFFFF, 0xFF000000,
>>    };
>>
>> The attribute ids are defined in a hardware spec.
>>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_query.c | 23 +++++++++++++++++++++++
>>   include/uapi/drm/i915_drm.h       |  1 +
>>   2 files changed, 24 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
>> index 2dfbc22857a3..609e64d5f395 100644
>> --- a/drivers/gpu/drm/i915/i915_query.c
>> +++ b/drivers/gpu/drm/i915/i915_query.c
>> @@ -479,12 +479,35 @@ static int query_memregion_info(struct drm_i915_private *i915,
>>          return total_length;
>>   }
>>
>> +static int query_hwconfig_table(struct drm_i915_private *i915,
>> +                               struct drm_i915_query_item *query_item)
>> +{
>> +       struct intel_gt *gt = to_gt(i915);
>> +       struct intel_guc_hwconfig *hwconfig = &gt->uc.guc.hwconfig;
>> +
>> +       if (!hwconfig->size || !hwconfig->ptr)
>> +               return -ENODEV;
>> +
>> +       if (query_item->length == 0)
>> +               return hwconfig->size;
>> +
>> +       if (query_item->length < hwconfig->size)
>> +               return -EINVAL;
>> +
>> +       if (copy_to_user(u64_to_user_ptr(query_item->data_ptr),
>> +                        hwconfig->ptr, hwconfig->size))
>> +               return -EFAULT;
>> +
>> +       return hwconfig->size;
>> +}
>> +
>>   static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>>                                          struct drm_i915_query_item *query_item) = {
>>          query_topology_info,
>>          query_engine_info,
>>          query_perf_config,
>>          query_memregion_info,
>> +       query_hwconfig_table,
>>   };
>>
>>   int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 914ebd9290e5..132515199f27 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -2685,6 +2685,7 @@ struct drm_i915_query_item {
>>   #define DRM_I915_QUERY_ENGINE_INFO     2
>>   #define DRM_I915_QUERY_PERF_CONFIG      3
>>   #define DRM_I915_QUERY_MEMORY_REGIONS   4
>> +#define DRM_I915_QUERY_HWCONFIG_TABLE   5
>>   /* Must be kept compact -- no holes and well documented */
> New uapi needs kerneldoc in the uapi header, and please fill in any
> gaps you have (i.e. if the query uapi this is built on top of isn't
> fully documented yet).
>
> Also this holds across the board, so please keep in mind in patch review.
> -Daniel
There is no extra documentation to add.

The query interface itself is already documented. This new query does 
not have any kernel defined data structures associated with it. There is 
just 'struct drm_i915_query_item' with a length and a pointer, all of 
which are fully documented.

John.

