Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAA873767B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 23:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F9010E065;
	Tue, 20 Jun 2023 21:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20BF10E065;
 Tue, 20 Jun 2023 21:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687295735; x=1718831735;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lnu0Cj85yckfE7WQKqfEL1ucg2uFYQcLrowheQi8OFs=;
 b=lbFar5HqwRy4rS1i12q7BS4jiTl7nBTrKt29CW9HSNarJXns9QVpI8Dk
 8TO91BKUcAzUMhl0MLFmuBN1EAPIlpWAm4pBqfFfcwFKgLfwWhrZZhtT9
 ZKyXSqdLFsW9tiwZF7fYUEyHCHEHwg0SiGk+4TfjzhLvQzkYM+KKCPCBY
 YOXewRRFaARxj/3H3UmBEZmEe1xBiEAGAcOUx41Ydbt1xUOjE9SMCq+6k
 PxXAeSsnU8ZBXozzv+8wpFbPzm3f9CzYsPa1PuqRrf1r7XEvexKrUtgt2
 b5WUp83pdsX4f8zt6WQ9Rz1kgTcEexx90FJP/qUY5+GGcQ1nVZ1MlAb43 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="340325541"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; d="scan'208";a="340325541"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 14:15:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="691593210"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; d="scan'208";a="691593210"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 20 Jun 2023 14:15:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 14:15:33 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 14:15:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 20 Jun 2023 14:15:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 20 Jun 2023 14:15:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWlr+t+YgqnR98sglEzElgBp4GBe8KsOLPit9zqNqkv6O8UArmgwKIe7PCgcOIlyb+GFkqpFd0rjr99Db8XN0SniiyPec3llGFKKt9egX2FLBMibBRQ5L85D6ZTH6pZzTfZq0oDN1mqCa+zOL7yrHw9LsbN9iqdXk11ALbGQmHXQrp+rKrq0G0YLiat3YgKIMYYzOF3TTawL3xbhlHWr4Gf9psa5LjeM/91/YmEvr9d7zBwASdZse7J/Iv/eRonpcH/+/1gkyAvlqv/SpacUM5iFCqairv0K/aK6Us70vPD3RxUS28CGjWKcDHJiX1Cd2DFlqZQ4DV2sJZFmF7HxUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehvPE+C/BRZ08EihriHu9AQCzqnyxjyFaXByibyAsVo=;
 b=O5UoWYr7jc8ZBFeOONjkIsFFrOGiwSjNRQqgkRSG5I+nAA/W1feUjiLq+snz1kGXCQXjsHXfdPGy5hTXE6aLV+tQvldrsUVN4s2V27wO8tbK6lrYDjEv4j9vnF6524XTEL1QDdaa9t6KENrZr73NLRPY4KR97Q+LCNq1F3cKeWDCdGKxUDgH0w27KUKW9df6SVSyxICPml+CFfozu8PSYyppbp+Kql5TwD368Uzdt9WfgRTFTa9TTDNfqsIKmsThJvxIW2essI6U/tZVl/WkjDSWG+3I6g2qA2HjDe8ZF2MC3T//ROdx4KmsxrolcRFA6PV3ZGZgmWnStGZJgpoisA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6491.namprd11.prod.outlook.com (2603:10b6:208:3a5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 21:15:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 21:15:30 +0000
Date: Tue, 20 Jun 2023 14:15:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [Intel-xe] [RFC PATCH 1/1] drm/xe: Introduce function pointers
 for MMIO functions
Message-ID: <knuk622235unwaxosqie2pnczan5oedeuwqabgnaux5io2mmcw@pfd7zkn6offi>
References: <20230602142501.6-1-francois.dugast@intel.com>
 <20230602142501.6-2-francois.dugast@intel.com>
 <qcsuilqdccvku4qoa36a5m3mhdr75akwpba77oisjk6e4kvkrm@6u5tr3dfmf5v>
 <ZIdIfdiClQ60fZSI@fdugast-desk.home>
 <20230615000105.GU5433@mdroper-desk1.amr.corp.intel.com>
 <CAFCwf10Td52xyKN9U903-GzS8V_T6sJ8t9ppLiXCNLzHGHzLEQ@mail.gmail.com>
 <20230615163420.GW5433@mdroper-desk1.amr.corp.intel.com>
 <CAFCwf13z4b9oyTaz_ptMKs=OSvJgp-DryvLF=JQCw2FDvXmPew@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf13z4b9oyTaz_ptMKs=OSvJgp-DryvLF=JQCw2FDvXmPew@mail.gmail.com>
X-ClientProxiedBy: MW4PR04CA0065.namprd04.prod.outlook.com
 (2603:10b6:303:6b::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: 9306902d-989b-41f2-fd61-08db71d379fe
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P7mXMShgBAnpdQYVd/YrokVV7VrcowzDRUjp0jMBaN9+sl5hnBPWc70CancMZktX0c+HUpODjenNdzXJed5CMgZCmqsIIEQz+w6F0ISO5/6Zx+e6I2opjtrFdTU9RYrvKgEohMEQFwds0xa2rFAfkMpKJl0RjDP3kRkJUlmiHqU7ntN55RWxRuSbyJ+dQVPBeA2eqZju0tz3obKlBJxElsaH9DIRgPUNdweW3E2W/+qRPNlkjxnJeKaNnGc4WQCeIbVXt5aSsj2CU8MaMGMhTeTJ0UdvIZBNmYEXPpPAe6oM3aLYr6eN24xojx2oflO1v15vQXxBnrnyKXuRV7xx9BUghrOagprAvxHlbAwv3P9uwM4r6GqjbAohHus7BV6R38wh6IoKScF7ap2iTgau4p1uyUNr7qJCMNYfz3WqBwRJj1AUKGYpoeSzz7nFo6U1KnU3yv3OAG5pnem5pb4MnKZXZg+/Xuhc50gYPsS14/6IE51eDkdRiYaL63iXhlP38KaLeeOBr92rujTS9lN3fLpljF5GwYMOgT4rVxYIVwSPDtXBX39wIThStgoejkD3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199021)(2906002)(82960400001)(478600001)(30864003)(6486002)(316002)(38100700002)(83380400001)(66946007)(5660300002)(41300700001)(66476007)(66556008)(6916009)(53546011)(4326008)(6506007)(6512007)(9686003)(26005)(86362001)(8676002)(8936002)(33716001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDhYS0d4U3Nwd21JUEJMU3EvYlh4R0ducHRPMGlaQzVOTlBIMEZQS0I0UHV3?=
 =?utf-8?B?REV3OE5oMmhYQ2x5VEFtTE04SEJSWDgxNHIrdXVuWFgrd3VYZjI4K0VoeFEz?=
 =?utf-8?B?QU1PdjA3d2Jta0tzaVFlbmNsUWNFT3FTVm94aHJocERxUXJEeklGZWhkMTdT?=
 =?utf-8?B?d2pEek9kSmV4QTlTYzVJTnhPMTRETmRaY0pSTmd1Yk1nTFRBeUVvZERPR0Yx?=
 =?utf-8?B?aHZWaTlLbXhJY2EwSGczY0Qya0p5dlMxRUoyY3F2RXBpMUlBRVN1UkxZUU56?=
 =?utf-8?B?Si8ydlJCQ1l1NGtwUHpJZzQ4NGN5YUxDN1hDWmtUUlpjOTRwYzJuOU85SFJB?=
 =?utf-8?B?ZXpZZGRXQ2VoakMzWE9WR2llL0hpbm5Ccjhlc2lUSmhnL3RVbXMzczZXdTFT?=
 =?utf-8?B?QjJXMHNkTm5qVVoxeFpzTWhDNm1qbUF6ek5iMzVkTVdyK2tFV3ZYemdETFJa?=
 =?utf-8?B?eFV3cFg0T0NkTGdIaVk0MG4zTDZHZlJoeDM2bEc0RUJPYWlFQW9XbVNOWmEv?=
 =?utf-8?B?ODhYTEJJTDFxeXlsOS9LNXkwK0t0K2VkL3VlRmhrSXFpRFJHZWhHU1RrZURQ?=
 =?utf-8?B?RVphVEFUbXgzckE0c3RIQktPNXNmendRbFNFeElnQTk3YW9HYzdMZmRDSGdJ?=
 =?utf-8?B?MjR1dStWSDhxTG56dFgvcjg3UGI5eVRkOXVJb21pUHBrVCtsQjk2M202NkpH?=
 =?utf-8?B?dWlBTG9wT242SFpsdzFQbExxeUhnZVNZdWJMSW1GWXUrK3k3MldFbFpJRm1u?=
 =?utf-8?B?Rjlkcmladno4TE16UGdRUnNqbzZobG9lN3I0MjR3TkJzOUVNKytURUgxa0tB?=
 =?utf-8?B?MjRKckorNVUrS3NOQmV0MGFYR0ExYlB2YWttV2E4YStpNGxxNlc4UllXY0pC?=
 =?utf-8?B?YzJGaHkwN3FqVGRJVkxRSVRERFU0Z01VTE9CTUJmSnVKOW1xUnNTQ3Y0bU1n?=
 =?utf-8?B?ZVJ2bVNkRnJiWnROY1orMkJNS3JOOStBYi9ORzgyV1F0U2FsaEgvTHYzVEFj?=
 =?utf-8?B?Z3Q2UmpORW9DWnZlaFVzK1ByczZzN0pWWWJpRzVjamFibUZYQ0lWQ0dkUUZw?=
 =?utf-8?B?bWVaRFpzeWVJRG9uRVlnbHQ4ak5VOHp0MnNvd3J3eTZjeVVieXIyUUtjUFpH?=
 =?utf-8?B?YkdtNXBKN0dnQVJSY1VvRW8yZExtWUtHanc3dGdKdHZxc2p5YVVOcURndnNk?=
 =?utf-8?B?VkJSNnd2eHJINXMwTUZFQ0piaURpN25hczJ6anEzK3Y0QWhTK1ZRbFVSYUxz?=
 =?utf-8?B?b0NiRFhXMWkxZitweXlsc0pGNzhOcVBIUEd3Z1NMeUs0NFFadElzay9FM1g4?=
 =?utf-8?B?cmVsOFY0UUh3T09EQWxBdG9IeE9iQUtWM1ptUUozam1ZUHgzVkthU2JqaGZE?=
 =?utf-8?B?d0N6bThqR1ljWkU0Z0RzV3IwWElxTFVCUVc5V1BaME5WSy9FdUlkY0w3ckNL?=
 =?utf-8?B?QVQyTHB0ckdWWnRKQjd5ZzgxQU5EQ0Zmd2pnMlMwZEFjTk9BVzRybk9sbWVM?=
 =?utf-8?B?dzE5NEhpMWtHVHpUaUI3SHQ3ZHFvbk1UelZUNnRrVmR5YXUzdEJ1dFJhaDEz?=
 =?utf-8?B?L3VIbXY0VjJBOTE3UktWMVR3Wk5BWkNpQm5pT3lWazFyMkU1NHE3SkdFdlRq?=
 =?utf-8?B?T2VwcFJ5cXNZQXBCS0dpN2VwdW9WWjA5dndmb2RRWnlyTTd2NjJ6eDlOaXpM?=
 =?utf-8?B?cWN6aXl6aUFzT2E5dWsvQlJFZUNXeWlWVVFDODZTOGt1NkFBa2hXUnAxSXND?=
 =?utf-8?B?UnZvQTAxdm9IM1JkS2djNTBCNGR5emJPaTBhNkZXNTZKbkVlYzg2L3Zoc3FF?=
 =?utf-8?B?MnhkK21JaE16MTVTNHBKb1dCaVNsYmJBQU1sa1kvdGgwbk94S0haMURPRU5M?=
 =?utf-8?B?WjFuWnAwRDBNaG9mQjJZbmtaemw2QkRaVGx0T0dOak5mbUM0Y0NmaXFhY3Uy?=
 =?utf-8?B?b3EvMnk2Q1BKSUFpdGNiN2U3RGJWVzFiRVpzODBRSjVRb1BuM1kzMk1HOUNk?=
 =?utf-8?B?cUlWRVZFemk1YmcvVENMRS9FZWdHOURnTGJUTmIzYTh3T1RIMGE4eUYvTnJo?=
 =?utf-8?B?ZVdpN0NDRWs2VHcwWG9MNTZsbDJOZ2JDRjJJZkR2dGxGMVFNSSt2MmswS0dW?=
 =?utf-8?B?MFlRV1NtcUVDOGR6WFpLVlB1Nmo3YWtDOU54Z1UzT0JvTDhqU3dFRkQzb0Iz?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9306902d-989b-41f2-fd61-08db71d379fe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 21:15:30.4187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWNSXt0YSa0OaS2iUU3rLrfA+sDkvXeSoqH++SdZ9rAKozphpKjUQTkwb4Defh9kgXhH4t7hL/avg+qbyRehjIC6PC17ZVDQigO/STN7fcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6491
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
Cc: ofir1.bitton@intel.com, ohadshar@intel.com,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 18, 2023 at 11:28:20AM +0300, Oded Gabbay wrote:
>On Thu, Jun 15, 2023 at 7:34 PM Matt Roper <matthew.d.roper@intel.com> wrote:
>>
>> On Thu, Jun 15, 2023 at 04:04:18PM +0300, Oded Gabbay wrote:
>> > On Thu, Jun 15, 2023 at 3:01 AM Matt Roper <matthew.d.roper@intel.com> wrote:
>> > >
>> > > On Mon, Jun 12, 2023 at 06:31:57PM +0200, Francois Dugast wrote:
>> > > > On Thu, Jun 08, 2023 at 10:35:29AM -0700, Lucas De Marchi wrote:
>> > > > > On Fri, Jun 02, 2023 at 02:25:01PM +0000, Francois Dugast wrote:
>> > > > > > A local structure of function pointers is used as a minimal hardware
>> > > > > > abstraction layer to prepare for platform independent MMIO calls.
>> > > > > >
>> > > > > > Cc: Oded Gabbay <ogabbay@kernel.org>
>> > > > > > Cc: Ofir Bitton <ofir1.bitton@intel.com>
>> > > > > > Cc: Ohad Sharabi <ohadshar@intel.com>
>> > > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> > > > > > ---
>> > > > > > drivers/gpu/drm/xe/xe_device_types.h |  3 ++
>> > > > > > drivers/gpu/drm/xe/xe_mmio.c         | 81 ++++++++++++++++++++++++++++
>> > > > > > drivers/gpu/drm/xe/xe_mmio.h         | 35 ++++++------
>> > > > > > 3 files changed, 99 insertions(+), 20 deletions(-)
>> > > > > >
>> > > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> > > > > > index 17b6b1cc5adb..3f8fd0d8129b 100644
>> > > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
>> > > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> > > > > > @@ -378,6 +378,9 @@ struct xe_device {
>> > > > > >   /** @d3cold_allowed: Indicates if d3cold is a valid device state */
>> > > > > >   bool d3cold_allowed;
>> > > > > >
>> > > > > > + /** @mmio_funcs: function pointers for MMIO related functions */
>> > > > > > + const struct xe_mmio_funcs *mmio_funcs;
>> > > > > > +
>> > > > > >   /* private: */
>> > > > > >
>> > > > > > #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> > > > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> > > > > > index 475b14fe4356..f3d08676a77a 100644
>> > > > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
>> > > > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> > > > > > @@ -25,6 +25,62 @@
>> > > > > >
>> > > > > > #define BAR_SIZE_SHIFT 20
>> > > > > >
>> > > > > > +static void xe_mmio_write32_device(struct xe_gt *gt,
>> > > > > > +                            struct xe_reg reg, u32 val);
>> > > > > > +static u32 xe_mmio_read32_device(struct xe_gt *gt, struct xe_reg reg);
>> > > > > > +static void xe_mmio_write64_device(struct xe_gt *gt,
>> > > > > > +                            struct xe_reg reg, u64 val);
>> > > > > > +static u64 xe_mmio_read64_device(struct xe_gt *gt, struct xe_reg reg);
>> > > > > > +
>> > > > > > +static const struct xe_mmio_funcs xe_mmio_funcs_device = {
>> > > > > > + .write32 = xe_mmio_write32_device,
>> > > > > > + .read32 = xe_mmio_read32_device,
>> > > > > > + .write64 = xe_mmio_write64_device,
>> > > > > > + .read64 = xe_mmio_read64_device,
>> > > > > > +};
>> > > > > > +
>> > > > > > +static inline void xe_mmio_write32_device(struct xe_gt *gt,
>> > > > > > +                            struct xe_reg reg, u32 val)
>> > > > > > +{
>> > > > > > + struct xe_tile *tile = gt_to_tile(gt);
>> > > > > > +
>> > > > > > + if (reg.addr < gt->mmio.adj_limit)
>> > > > > > +         reg.addr += gt->mmio.adj_offset;
>> > > > > > +
>> > > > > > + writel(val, tile->mmio.regs + reg.addr);
>> > > > > > +}
>> > > > > > +
>> > > > > > +static inline u32 xe_mmio_read32_device(struct xe_gt *gt, struct xe_reg reg)
>> > > > > > +{
>> > > > > > + struct xe_tile *tile = gt_to_tile(gt);
>> > > > > > +
>> > > > > > + if (reg.addr < gt->mmio.adj_limit)
>> > > > > > +         reg.addr += gt->mmio.adj_offset;
>> > > > > > +
>> > > > > > + return readl(tile->mmio.regs + reg.addr);
>> > > > > > +}
>> > > > > > +
>> > > > > > +static inline void xe_mmio_write64_device(struct xe_gt *gt,
>> > > > > > +                            struct xe_reg reg, u64 val)
>> > > > > > +{
>> > > > > > + struct xe_tile *tile = gt_to_tile(gt);
>> > > > > > +
>> > > > > > + if (reg.addr < gt->mmio.adj_limit)
>> > > > > > +         reg.addr += gt->mmio.adj_offset;
>> > > > > > +
>> > > > > > + writeq(val, tile->mmio.regs + reg.addr);
>> > > > > > +}
>> > > > > > +
>> > > > > > +static inline u64 xe_mmio_read64_device(struct xe_gt *gt, struct xe_reg reg)
>> > > > > > +{
>> > > > > > + struct xe_tile *tile = gt_to_tile(gt);
>> > > > > > +
>> > > > > > + if (reg.addr < gt->mmio.adj_limit)
>> > > > > > +         reg.addr += gt->mmio.adj_offset;
>> > > > > > +
>> > > > > > + return readq(tile->mmio.regs + reg.addr);
>> > > > > > +}
>> > > > > > +
>> > > > > > static int xe_set_dma_info(struct xe_device *xe)
>> > > > > > {
>> > > > > >   unsigned int mask_size = xe->info.dma_mask_size;
>> > > > > > @@ -377,6 +433,29 @@ static void mmio_fini(struct drm_device *drm, void *arg)
>> > > > > >           iounmap(xe->mem.vram.mapping);
>> > > > > > }
>> > > > > >
>> > > > > > +static void xe_mmio_set_funcs(struct xe_device *xe)
>> > > > > > +{
>> > > > > > + /* For now all platforms use the set of MMIO functions for a
>> > > > > > +  * physical device.
>> > > > > > +  */
>> > > > >
>> > > > >
>> > > > > what is "device" in this context? that seems confusing as we always ever
>> > > > > just support reading/writing to a real device (physical here may also
>> > > > > add to the confusion when thinking about SR-IOV and VFs).
>> > > > > We shouldn't add abstractions that are then never used and all platforms
>> > > > > end up using the same. Unless it's a preparation for a follow up series
>> > > > > adding the different handling.
>> > > >
>> > > > For now "device" is meant as "in opposition to simulator" but I agree
>> > > > we can find a better name. Existing platforms all use the same
>> > > > implementation but this is preparation for platforms that require a
>> > > > different implementation.
>> > >
>> > > I agree with Lucas that this doesn't really seem to be a good candidate
>> > > for a vtable; every platform uses exactly the same logic and I can't
>> > > really envision how/why this would need to change for future platforms
>> > > either, so this seems to just be adding unnecessary complexity.
>> > > Registers being accessed at some offset into a PCI BAR isn't likely to
>> > > change going forward.  On future platforms it's more likely that we'd
>> > > need changes to the part of the code that maps the MMIO BAR rather than
>> > > the code that reads/writes an offset into a mapping that's already been
>> > > setup.
>> > I agree with that for every *real hardware* platform the
>> > implementation will probably be the same.
>> > But for simulator/emulation, there is a different implementation.
>> > And even if we don't upstream that different implementation, doing
>> > this abstraction will help us upstream the rest of the driver as we
>> > minimize the differences between upstream and downstream.
>> > And helping us upstream the driver is a good enough reason imo to add
>> > this abstraction.
>>
>> Adding extra abstraction layers to upstream code that provide no
>> upstream benefit and only come into play for some private, internal-only
>> workflow is generally frowned upon in the DRM subsystem.  Unless you
>> have some kind of public, open-source usage model, adding the extra
>> complexity and clutter here is probably a no-go for upstream.
>While I ofc agree in general with this statement, I believe it does
>not apply in this case.
>
>The intention behind changing register access to be callback functions
>is to allow the Linux driver to serve as the principal entity for
>pre-silicon validation . This is an important distinction, as the aim
>is not to obscure the Linux kernel API for portability across other
>operating systems or to reinvent mechanisms already provided by the
>kernel, which I believe is the primary objection of upstream for
>adding abstraction layers.
>
>Instead, this strategy is about utilizing the inherent advantages of
>Linux for the crucial stage of pre-silicon validation. In fact,
>adopting Linux as the main vessel for this process can help leverage a
>broader open source community for problem-solving, encourage more
>uniform testing practices, and result in higher quality drivers due to
>the transparency and scrutiny inherent in open-source development.
>
>Making the upstream driver as close as possible to the internal driver
>is advantageous for both the speed and quality of the upstreaming
>process. A driver that closely mirrors the internal one will likely
>require fewer modifications, thus streamlining the upstreaming
>process. With a closely aligned internal and upstream driver, the
>benefits of any improvements, bug fixes, and other modifications made
>in the internal driver could be quickly and easily transferred to the
>upstream driver.

The problem is the side you are bending: making the upstream one follow
the internal rather than the opposite, which requires "dead
abstractions". This can be seen as something very very close to an OS
abstraction layer at the best and at the worst as a way to have hooks
enhancing the driver with "extensions" not shared.  So abstractions that
are just a layer of indirection without really abstracting anything from
the upstream point of view will always be a grey zone to avoid.

>
>In short, this change will allow us to do a continuously faster and
>better upstream process, which imho provides a substantial benifit to
>the kernel community.

We are all very aware of the benefits of having non-divergent code
bases. We are all on the same page here. As I and Matt argued, in this
specific case with mmio, a vtable doesn't seem to be the best solution
and the reason for adding it goes to a direction where we have a dead
abstraction from the upstream POV.

There are other cases in the code where a vtable is a reasonable
approach. We've been using vtable throughout i915 for page setup, pte
encoding and more heavily on the display side (see all the encoder
hooks in ).  In the display side specifically, we can't say they are silver
bullet when we are not the only stakeholder in the driver. Hooks are
added/removed/changed which sometimes even create silent conflicts
hidden behind

	if (func->foo)
		func->foo();

And the recipe to avoid that is being involved in upstream development
like we are.

>
>>
>> Also, even if you do have an unusual form of simulation/emulation that
>> doesn't behave like real hardware, are you going to have several of them
>> that all work in different manners and need unique implementations?  If
>> we only ever expect to have two code paths total (and only one of those
>> upstream), then using a vtable seems like overkill.  A very simple
>>
>>         if (special case)
>>                 return alternate_implementation();
>>
>> would be much easier to understand and maintain.
>>
>I agree that in this case (register access), as I don't foresee more
>than two implementations, we can go ahead with your suggestion.
>i.e. in the mmio access functions we will add:
>       if (sim)
>                 return alternate_implementation();
>
>If there are no objections, we can go ahead with this approach and
>send a patch upstream.

In this specific case it does seem to be the best approach, but that
would be a downstream patch, not upstream... unless we add a minimal
simulator in upstream, akin to what mesa has with drm-shim

Lucas De Marchi

>
>Oded
>
>>
>> There are lots of other places in the Xe driver that _would_ benefit
>> from per-platform vtables; we should prioritize making changes like this
>> in the areas where they provide a clear benefit.
>>
>>
>> Matt
>>
>> >
>> >
>> > Oded
>> > >
>> > > >
>> > > > >
>> > > > > +Matt as there is still (at least) one refactor planned in this area,
>> > > > > since gt is not always the proper target for the MMIOs. He was saying in
>> > > > > his earlier series about having a mmio_view or such to abstract the
>> > > > > offset and other differences between each IO range. Not sure if this
>> > > > > series would go the rigth direction, maybe we need to think in both
>> > > > > cases together.
>> > > >
>> > > > Matt, would this series block the refactor mentioned by Lucas?
>> > > >
>> > > > In general, are there objections to introducing functions pointers for
>> > > > MMIO functions (extended to all of them, as suggested by Ohad)?
>> > >
>> > > It probably makes more sense to do vtable conversion on other parts of
>> > > the driver where we already have different implementations per platform
>> > > and where we already know that design makes sense.  We can always come
>> > > back and do this to the MMIO functions later once there are actually
>> > > multiple implementations, but it doesn't seem to serve any purpose right
>> > > now.
>> > >
>> > >
>> > > Matt
>> > >
>> > > >
>> > > > Thanks,
>> > > > Francois
>> > > >
>> > > > >
>> > > > >
>> > > > > Lucas De Marchi
>> > > > >
>> > > > > > + switch (xe->info.platform) {
>> > > > > > + case XE_TIGERLAKE:
>> > > > > > + case XE_ROCKETLAKE:
>> > > > > > + case XE_ALDERLAKE_S:
>> > > > > > + case XE_ALDERLAKE_P:
>> > > > > > + case XE_ALDERLAKE_N:
>> > > > > > + case XE_DG1:
>> > > > > > + case XE_DG2:
>> > > > > > + case XE_PVC:
>> > > > > > + case XE_METEORLAKE:
>> > > > > > +         xe->mmio_funcs = &xe_mmio_funcs_device;
>> > > > > > +         break;
>> > > > > > + default:
>> > > > > > +         DRM_ERROR("Unsupported platform\n");
>> > > > > > +         break;
>> > > > > > + }
>> > > > > > +}
>> > > > > > +
>> > > > > > int xe_mmio_init(struct xe_device *xe)
>> > > > > > {
>> > > > > >   struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>> > > > > > @@ -384,6 +463,8 @@ int xe_mmio_init(struct xe_device *xe)
>> > > > > >   const int mmio_bar = 0;
>> > > > > >   int err;
>> > > > > >
>> > > > > > + xe_mmio_set_funcs(xe);
>> > > > > > +
>> > > > > >   /*
>> > > > > >    * Map the first 16MB of th BAR, which includes the registers (0-4MB),
>> > > > > >    * reserved space (4MB-8MB), and GGTT (8MB-16MB) for a single tile.
>> > > > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>> > > > > > index 3c547d78afba..80ce9de7aac4 100644
>> > > > > > --- a/drivers/gpu/drm/xe/xe_mmio.h
>> > > > > > +++ b/drivers/gpu/drm/xe/xe_mmio.h
>> > > > > > @@ -19,6 +19,13 @@ struct xe_device;
>> > > > > >
>> > > > > > #define GEN12_LMEM_BAR            2
>> > > > > >
>> > > > > > +struct xe_mmio_funcs {
>> > > > > > + u32 (*read32)(struct xe_gt *gt, struct xe_reg reg);
>> > > > > > + u64 (*read64)(struct xe_gt *gt, struct xe_reg reg);
>> > > > > > + void (*write32)(struct xe_gt *gt, struct xe_reg reg, u32 val);
>> > > > > > + void (*write64)(struct xe_gt *gt, struct xe_reg reg, u64 val);
>> > > > > > +};
>> > > > > > +
>> > > > > > int xe_mmio_init(struct xe_device *xe);
>> > > > > >
>> > > > > > static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>> > > > > > @@ -34,22 +41,16 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>> > > > > > static inline void xe_mmio_write32(struct xe_gt *gt,
>> > > > > >                              struct xe_reg reg, u32 val)
>> > > > > > {
>> > > > > > - struct xe_tile *tile = gt_to_tile(gt);
>> > > > > > -
>> > > > > > - if (reg.addr < gt->mmio.adj_limit)
>> > > > > > -         reg.addr += gt->mmio.adj_offset;
>> > > > > > + struct xe_device *xe = gt_to_xe(gt);
>> > > > > >
>> > > > > > - writel(val, tile->mmio.regs + reg.addr);
>> > > > > > + xe->mmio_funcs->write32(gt, reg, val);
>> > > > > > }
>> > > > > >
>> > > > > > static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>> > > > > > {
>> > > > > > - struct xe_tile *tile = gt_to_tile(gt);
>> > > > > > -
>> > > > > > - if (reg.addr < gt->mmio.adj_limit)
>> > > > > > -         reg.addr += gt->mmio.adj_offset;
>> > > > > > + struct xe_device *xe = gt_to_xe(gt);
>> > > > > >
>> > > > > > - return readl(tile->mmio.regs + reg.addr);
>> > > > > > + return xe->mmio_funcs->read32(gt, reg);
>> > > > > > }
>> > > > > >
>> > > > > > static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
>> > > > > > @@ -67,22 +68,16 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
>> > > > > > static inline void xe_mmio_write64(struct xe_gt *gt,
>> > > > > >                              struct xe_reg reg, u64 val)
>> > > > > > {
>> > > > > > - struct xe_tile *tile = gt_to_tile(gt);
>> > > > > > -
>> > > > > > - if (reg.addr < gt->mmio.adj_limit)
>> > > > > > -         reg.addr += gt->mmio.adj_offset;
>> > > > > > + struct xe_device *xe = gt_to_xe(gt);
>> > > > > >
>> > > > > > - writeq(val, tile->mmio.regs + reg.addr);
>> > > > > > + xe->mmio_funcs->write64(gt, reg, val);
>> > > > > > }
>> > > > > >
>> > > > > > static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
>> > > > > > {
>> > > > > > - struct xe_tile *tile = gt_to_tile(gt);
>> > > > > > -
>> > > > > > - if (reg.addr < gt->mmio.adj_limit)
>> > > > > > -         reg.addr += gt->mmio.adj_offset;
>> > > > > > + struct xe_device *xe = gt_to_xe(gt);
>> > > > > >
>> > > > > > - return readq(tile->mmio.regs + reg.addr);
>> > > > > > + return xe->mmio_funcs->read64(gt, reg);
>> > > > > > }
>> > > > > >
>> > > > > > static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
>> > > > > > --
>> > > > > > 2.34.1
>> > > > > >
>> > >
>> > > --
>> > > Matt Roper
>> > > Graphics Software Engineer
>> > > Linux GPU Platform Enablement
>> > > Intel Corporation
>>
>> --
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation
