Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696BA722D75
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 19:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2CF10E302;
	Mon,  5 Jun 2023 17:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2159C10E300;
 Mon,  5 Jun 2023 17:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685985482; x=1717521482;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Eyjpdck/uzQvbI+MSg6ovI8/SQl/cApwuDarKXe0+fo=;
 b=gKTnLPAYog/xU2u7RZsgg80EJuROrppISse71klVQLCFW/px60rmeyzf
 0BCeqABOOYS7nWDfOzRb+Og24KzxMLBR/4Rm9fBBdzqJFyQjwAUFbmoes
 7BjN3oN/RspoiVZslCzHj+LCTKymrO5mnub/yHwdUw+2CJMxLD+Oy3Fti
 mU6iXazCiYq0DWwC4L+JVgMdReILjN4p70V2NNIcYajQCVsCe8zUKx0kU
 yqsBKOXOtlVOCp8ZhtoYu1MH2MDmRjhdHvhw4ERgdaV2jwBBZsTKOwwor
 qX6aZeMvRvdKGeMv/b+j+BmxIzHUTql/gPcloiYd2XF3UoYHb44hROusT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="346022040"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="346022040"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 10:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="711880256"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="711880256"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 05 Jun 2023 10:17:58 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 10:17:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 10:17:58 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 10:17:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgKnh9xjcE3TIFvnmziAba5J3Pn+7o82gh+QxT+u4JtmoE8TSBHQyw4TmWwMGX1km9YHxZa3EnZiT0DBw8oiN2pFRN43taHkoS/RN6IK8mx3WPmLbMfTBq+xg4uQJSSpsrLydJk0/yoLDudF4yKE0jePfCOQ2f5omtltsw2bo5AUXu9EJh4e5qBjLsTFcblfrAQT6Dki9b7glp1TZlI0wvtdEGfx5e3GHCYUID7sASj74Mvv+lih3IE0nDsaefyhpXlDKnRbMnL2N/t1WswOd3Bbt2GvQF8xSloTu92ZrHQi2H1vCnf+M0agaTyMs3LAsGMc8h6mGnEFAGPZBr7Kng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nG9I97tN1L2U6E9sGJMB674b4I4o68PMIegXiXXkcXc=;
 b=kTjSoxjI+YITXM8kuQ3C5sxYb8afIRJnkeXTF3jR06elxGJkkgNd0ftt+Trf9GV+eu56O/aKGo4mokXexL7B6jXAgkLaOk4OxiKa0KBJUI0EbBopVg1JU3mEKoWzh0iyUk01+4A24+ENTQbUeeT+oASJRz55jDZe5c5h529Hl3wBuXsDyxlf/bfFhi3HzkmWdr5/qyB8TYrf4S+8ojtH/9jb1Bv9Xe1479SXJpi/ELSBFXMVXoFt71XmNWXsUrKlQrLcvV5QxgBqHHm5HLtaTpPufPgiYGufJnLA2nuWddKUo4ofWNYdm4bJpvJ0ix24xN4Z9S9nI0GvKyT/JhmICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SA3PR11MB7464.namprd11.prod.outlook.com (2603:10b6:806:31b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Mon, 5 Jun
 2023 17:17:55 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::13aa:6fa9:70a7:4735]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::13aa:6fa9:70a7:4735%6]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 17:17:55 +0000
Message-ID: <a4e36fd9-fc83-dd9c-32e0-04ac54b7c612@intel.com>
Date: Mon, 5 Jun 2023 22:47:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [Intel-xe] [RFC 0/5] Proposal to use netlink for RAS and
 Telemetry across drm subsystem
Content-Language: en-US
To: Tomer Tayar <ttayar@habana.ai>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
References: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
 <277e905a-25f2-0a61-0dc7-5779c82a177e@habana.ai>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <277e905a-25f2-0a61-0dc7-5779c82a177e@habana.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::18) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SA3PR11MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: 35578545-b769-4e66-08d9-08db65e8ccec
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YelvFg/otB2iHmcxx4faVQwbrwewC6EkUXQIsmKlQ+AvzdwSRn51ETtiuJyOLZrXB2xZ7QDx5QNd9nmF6RaV2WhKC5CK0HPSRkjEL1GBg19dxEjWr4Ze7Sp6+/LgpN0WhJrUmMeUVplX+eRG4AbrzIzdKGYd1JxxoQb6MpbOkSZeIbz6x/eTOGKJPF64MvjjTmB2yk1q7FA7h/lSBnn80qfgrUUkEjADjd3ImLjjrhTAnqPUWl76qW3MwBAno5zg1p6yRrS6tGig05VLmYewVxoiX8dXVHqYlKUTTCblnAlVw/HulibcxMQ2RGSsBMEebUUgD89XFOD8CLB01LBwFfaBV8YW4RQzkD6BeJj/qb6SMslRBAd0tikm6Ifrs7i1Nb07/E+3btVklBkKnZfhDe1MMNDPNMWiXn06MeTWRbbwAzuWmdNriW0Dv0sZudMnA/NOsTxRBm1gTfFlDB+5H4QwwqZKl8jUBi/YmMbwT3jUJdp4jf8ngBBzA77eGW8LwuPuyj+P9k2jJEDDbgSbX1lGsAzT+b5NylQ/KbV0R9nUZPCJgEoXwUy7/YYYtM8Qou2Rvh7BygYU3MujsH+HEVedtmZPwQkh/k2NNEGokizEbrYio1JUzJEGooaajnsE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199021)(6506007)(186003)(26005)(6512007)(53546011)(2616005)(31686004)(966005)(83380400001)(36756003)(6666004)(6486002)(2906002)(30864003)(8676002)(8936002)(82960400001)(54906003)(110136005)(478600001)(38100700002)(5660300002)(31696002)(86362001)(4326008)(316002)(41300700001)(66556008)(66476007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUJjeGY2eVJOUWs1ZG1DL0xFcGFzVndiVmZmRU9PclovMFpiN2Z3ejFlWGZm?=
 =?utf-8?B?bjNRcnN2YkM4Tlg5UXdaNWtjaG9QeEg3SVNyWldPQ0VwQ0ZlV3hUM0NkOVpw?=
 =?utf-8?B?NVpTVFZSK3cvNDZ6a3lMUXJLYzBKQ1hVbkdXVkVOWUlVSnpiYTBWYUQ2WjlS?=
 =?utf-8?B?a252OVJWVHRpdTduemFtYWtpOVZZaFpXK1ZFclpJZko4aEk4WHdvRTNaZWQv?=
 =?utf-8?B?cmRONWJiU0VzTm9xMDVHVUFLUkZQR2g2MC9wd01MY3BkMkJ2TWhkNTl6dUow?=
 =?utf-8?B?OVh0RnhjNjdtQzI3UVo2MThZVkVXSENKRFhHdU9HUmtNYVZuZURud1NFdmhV?=
 =?utf-8?B?R01nRFBmNHphL3VDRFRHOW02cThkdlZpdGh6eTdiZE1yUzNrS2xkN09kQXZ1?=
 =?utf-8?B?eEQ2eHFSNzdLZExjbzVwYWtzNlMyMjdPWEdneGNVc3czb1d6MlFCeHA1QXRO?=
 =?utf-8?B?MExzemp0NGpiaDVNV04xcFZHRG1XU1Fmd2pYS29hTlRaY2V0U3lSeGcyWE9D?=
 =?utf-8?B?aG9EVGY5UnFHcHovQ2RDVElDTEk5K1V1cE5LKzh5RHc1WVQrWjBXZEVmWk5r?=
 =?utf-8?B?ZG8rdHBxNi9lZzRqNFZZd2lSM1d0aGxGTERyalh5ZkhjL29NaXV0RjVkNUkx?=
 =?utf-8?B?LytSMW8zVXRETDAxM2hhMmd5ODNmUGhwSTBFdXdwQjJ6WVZVNEtUNDQyRUNj?=
 =?utf-8?B?eHA1aTBBbnlPdHVrenBBSERIdHV0dnc2MVhuNWdqSmI0L1NmdmpYeXJtWnll?=
 =?utf-8?B?ckxqN3lNLzRjbnBlTS9vTHZMZCtxYksyMTArWUFjNExTbis0ZEFRQzVkKy9N?=
 =?utf-8?B?ZzUyMkhTQUNnVDE3UjdmMXhkU1V0R1BtVEZiNU5aMlpwUmtTaldEdlgyS3lk?=
 =?utf-8?B?RHFQN2FZNjAzaDNqdVhTWlBVU0JLSWQ3MVpLeWRDK3MxMEcxenZPNE1CUXhs?=
 =?utf-8?B?VTk5aUJsdjVsR3NmWFpxRmpNcmc1bkdJMUV1d2hNU2xjVjFsRE1PK0tjcnFE?=
 =?utf-8?B?R0FnTktnYlhJak9iazZnKzE2cHFmbmdaWWZJSTUydEtlNEQ5OXVkME5lOTZn?=
 =?utf-8?B?azB3L21VRmd6N0JiYnprejdUNThCcDk3YjdqWEtJSWlHd0IvUnhBQlhMb0VX?=
 =?utf-8?B?a1dDSWVWYk56MnFZUEQ1R0Y0MGFhWHFra3M2RUlaZzkwOGQxeFQwYWRFUFNq?=
 =?utf-8?B?TnJ0WnIvc1VLYk14UjJSMU54U1RnL1BOb0c1OVB2UXdxaEpIcU5vTy9KdjJH?=
 =?utf-8?B?bEJQbDJWRkRUOHNLdWZkcHAwU052dUhTRkN2TXNpbjhteEdwTUpkOE9mWFNE?=
 =?utf-8?B?WkFoZklWcDZrenJmQkw4b3kwNUJwVWVvenRjQ2tLdW93RGlCT1FWSGdBYitx?=
 =?utf-8?B?Z1czS2Y5ZjRpb3FhdXY3SW9XN3BEb1VzVEJYeHNkQ0oxQTVXTy95Wlp6ZXlU?=
 =?utf-8?B?Q2lma1RyaVVReXJ6VjdFcnBqT1g0YUhIUjk0L2gyNlFYNEx4YVEzOXdiOS9j?=
 =?utf-8?B?MVpKMGl2dUZoaXlGNDdlNW5Ib0Zocm8xRm5uSGxQeFNQR2MzajBkMHRnb2Yv?=
 =?utf-8?B?WjlUd3labHorMUlKbkM3dUdpdlV5OXpvR2FmT0tFbjNJby91TjQ2R0lvTFRm?=
 =?utf-8?B?QTFMM2pzTS9Jb3JvR1l3WUt0ejl1Ykpzbk9xamtJOWZsS0ZTZFhNRUxXUGFx?=
 =?utf-8?B?aUhucnF1Q2dhLzNrTk1EMEFtdHNIb1cwOGQwV3ltMGowSlNHZmtSUlhIYkpp?=
 =?utf-8?B?a2VGdHpXbkJGdTZKMHdsQjgxaWxua0trd3pkejMyenJTWUg1K0RxQ2NORit0?=
 =?utf-8?B?TVVDRm43amRXUE54NG1WY1FDQTgwelhBZUFScDd0RGxLby8yTmxaWENuUGtU?=
 =?utf-8?B?cllqbTVDMlplem51Ynl0SUs4S0dtR1hkWXBZYk1kdU0zUVdpQ2pDWFJyWlZU?=
 =?utf-8?B?cFE1Z0MyMzZIeGMrRkRZZVhWa2xVMDU5eVFtR0FLM2pyWmFRSWtFNzRIcm5p?=
 =?utf-8?B?SjRMVHRoV0tldTM2dWlHazlKSmpEMU9BN3NaZVFCSlJXTWVLL3RJbE53OUs5?=
 =?utf-8?B?VXc2aXpRWjJuOTlyNkgzNHFOWlhHdXRkSVY3ZWFqMGsyS2JrTnhTejhrVXdS?=
 =?utf-8?B?L2hSai9aY1lNMjc2dUlxbHFOTUpuUWVpcFVaQy8vemZYU2RTMVlwbStLSTlV?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35578545-b769-4e66-08d9-08db65e8ccec
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 17:17:55.1565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+WTQDvwOGLfafwJwbczYaA3VzfnVc1L0nZ/UKgkpp4l0emSVI864yxcVaf6SEpqEoIXyMxnEMs+M4odoDjoaXMCRPqTRIvdd1YGMLRIKEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7464
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
Cc: "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04-06-2023 22:37, Tomer Tayar wrote:
> On 26/05/2023 19:20, Aravind Iddamsetty wrote:
>> Our hardware supports RAS(Reliability, Availability, Serviceability) by
>> exposing a set of error counters which can be used by observability
>> tools to take corrective actions or repairs. Traditionally there were
>> being exposed via PMU (for relative counters) and sysfs interface (for
>> absolute value) in our internal branch. But, due to the limitations in
>> this approach to use two interfaces and also not able to have an event
>> based reporting or configurability, an alternative approach to try
>> netlink was suggested by community for drm subsystem wide UAPI for RAS
>> and telemetry as discussed in [1].
>>
>> This [1] is the inspiration to this series. It uses the generic
>> netlink(genl) family subsystem and exposes a set of commands that can
>> be used by every drm driver, the framework provides a means to have
>> custom commands too. Each drm driver instance in this example xe driver
>> instance registers a family and operations to the genl subsystem through
>> which it enumerates and reports the error counters. An event based
>> notification is also supported to which userpace can subscribe to and
>> be notified when any error occurs and read the error counter this avoids
>> continuous polling on error counter. This can also be extended to
>> threshold based notification.
> 
> Hi Aravind,

Hi Tomer,

Thanks a lot for your review.
> 
> The habanalabs driver is another candidate to use this netlink-based drm 
> framework.
> As a single-user device, we have an additional "control" device that 
> allows multiple applications to query for information and to monitor the 
> "compute" device.
> And while we are about to move the compute device to the accel nodes, we 
> don't have a real replacement there for the control device.
> 
> Another possible usage of this framework for habanalabs is the events 
> notification.
> Currently we have an eventfd-based mechanism, and after being notified 
> about an event, user starts querying about the event and the relevant 
> info, usually in several requests.
> With this framework we should be allegedly possible to gather all 
> relevant info together with the event itself.

that is right with the multicast event we can pack data too.
> 
> The current implementation seems intended more to errors (and quite 
> "tailored" to Xe needs ...), while in habanalabs we would need it also 
> for non-error static/dynamic info.
> Maybe we should revise the existing commands/attributes to be more generic?

correct, at present that is the usecase xe driver has and atleast for
the error part I believe is generic if not we can make it, the framework
is extensible. The idea I had was generic commands which every driver
can use will be part of drm framework and if there are specific commands
or attributes that shall be part of driver. But some thought is needed
here as MAX attributes is needed by userspace and how to define
attribute policy etc..,

> 
> Moreover, the drm part is very small, while most of the netlink "mess" 
> is still done by the specific driver.
> So what is the added value in making it a "drm framework"? Do we enforce 
> something here for drm drivers that use it? Do we help them with simpler 
> APIs and hiding the internals of netlink?> Maybe it would be worth moving some functionality from the Xe driver
> into drm helpers?

your suggestion sounds good and interesting but it might need some
analysis like if we move the registration parts to drm framework how
would we register the driver private commands and attributes if there
are any. But ya having most of the part at drm level helps all the
driver. I'll do some analysis and i'll come back on this.

Thanks,
Aravind.

> 
> Thanks,
> Tomer
> 
>> [1]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html
>>
>> this series is on top of https://patchwork.freedesktop.org/series/116181/
>>
>> Below is an example tool drm_ras which demonstrates the use of the
>> supported commands. The tool will be sent to ML with the subject
>> "[RFC i-g-t 0/1] A tool to demonstrate use of netlink sockets to read RAS error counters"
>>
>> read single error counter:
>>
>> $ ./drm_ras READ_ONE --device=drm:/dev/dri/card1 --error_id=0x0000000000000005
>> counter value 0
>>
>> read all error counters:
>>
>> $ ./drm_ras READ_ALL --device=drm:/dev/dri/card1
>> name                                                    config-id               counter
>>
>> error-gt0-correctable-guc                               0x0000000000000001      0
>> error-gt0-correctable-slm                               0x0000000000000003      0
>> error-gt0-correctable-eu-ic                             0x0000000000000004      0
>> error-gt0-correctable-eu-grf                            0x0000000000000005      0
>> error-gt0-fatal-guc                                     0x0000000000000009      0
>> error-gt0-fatal-slm                                     0x000000000000000d      0
>> error-gt0-fatal-eu-grf                                  0x000000000000000f      0
>> error-gt0-fatal-fpu                                     0x0000000000000010      0
>> error-gt0-fatal-tlb                                     0x0000000000000011      0
>> error-gt0-fatal-l3-fabric                               0x0000000000000012      0
>> error-gt0-correctable-subslice                          0x0000000000000013      0
>> error-gt0-correctable-l3bank                            0x0000000000000014      0
>> error-gt0-fatal-subslice                                0x0000000000000015      0
>> error-gt0-fatal-l3bank                                  0x0000000000000016      0
>> error-gt0-sgunit-correctable                            0x0000000000000017      0
>> error-gt0-sgunit-nonfatal                               0x0000000000000018      0
>> error-gt0-sgunit-fatal                                  0x0000000000000019      0
>> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a      0
>> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b      0
>> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c      0
>> error-gt0-soc-fatal-punit                               0x000000000000001d      0
>> error-gt0-soc-fatal-psf-0                               0x000000000000001e      0
>> error-gt0-soc-fatal-psf-1                               0x000000000000001f      0
>> error-gt0-soc-fatal-psf-2                               0x0000000000000020      0
>> error-gt0-soc-fatal-cd0                                 0x0000000000000021      0
>> error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022      0
>> error-gt0-soc-fatal-mdfi-east                           0x0000000000000023      0
>> error-gt0-soc-fatal-mdfi-south                          0x0000000000000024      0
>> error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025      0
>> error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026      0
>> error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027      0
>> error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028      0
>> error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029      0
>> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a      0
>> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b      0
>> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c      0
>> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d      0
>> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e      0
>> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f      0
>> error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030      0
>> error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031      0
>> error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032      0
>> error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033      0
>> error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034      0
>> error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035      0
>> error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036      0
>> error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037      0
>> error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038      0
>> error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039      0
>> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a      0
>> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b      0
>> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c      0
>> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d      0
>> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e      0
>> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f      0
>> error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040      0
>> error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041      0
>> error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042      0
>> error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043      0
>> error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044      0
>> error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045      0
>> error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046      0
>> error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047      0
>> error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048      0
>> error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049      0
>> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a      0
>> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b      0
>> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c      0
>> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d      0
>> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e      0
>> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f      0
>> error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050      0
>> error-gt1-correctable-guc                               0x1000000000000001      0
>> error-gt1-correctable-slm                               0x1000000000000003      0
>> error-gt1-correctable-eu-ic                             0x1000000000000004      0
>> error-gt1-correctable-eu-grf                            0x1000000000000005      0
>> error-gt1-fatal-guc                                     0x1000000000000009      0
>> error-gt1-fatal-slm                                     0x100000000000000d      0
>> error-gt1-fatal-eu-grf                                  0x100000000000000f      0
>> error-gt1-fatal-fpu                                     0x1000000000000010      0
>> error-gt1-fatal-tlb                                     0x1000000000000011      0
>> error-gt1-fatal-l3-fabric                               0x1000000000000012      0
>> error-gt1-correctable-subslice                          0x1000000000000013      0
>> error-gt1-correctable-l3bank                            0x1000000000000014      0
>> error-gt1-fatal-subslice                                0x1000000000000015      0
>> error-gt1-fatal-l3bank                                  0x1000000000000016      0
>> error-gt1-sgunit-correctable                            0x1000000000000017      0
>> error-gt1-sgunit-nonfatal                               0x1000000000000018      0
>> error-gt1-sgunit-fatal                                  0x1000000000000019      0
>> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a      0
>> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b      0
>> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c      0
>> error-gt1-soc-fatal-punit                               0x100000000000001d      0
>> error-gt1-soc-fatal-psf-0                               0x100000000000001e      0
>> error-gt1-soc-fatal-psf-1                               0x100000000000001f      0
>> error-gt1-soc-fatal-psf-2                               0x1000000000000020      0
>> error-gt1-soc-fatal-cd0                                 0x1000000000000021      0
>> error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022      0
>> error-gt1-soc-fatal-mdfi-east                           0x1000000000000023      0
>> error-gt1-soc-fatal-mdfi-south                          0x1000000000000024      0
>> error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025      0
>> error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026      0
>> error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027      0
>> error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028      0
>> error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029      0
>> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a      0
>> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b      0
>> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c      0
>> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d      0
>> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e      0
>> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f      0
>> error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030      0
>> error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031      0
>> error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032      0
>> error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033      0
>> error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034      0
>> error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035      0
>> error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036      0
>> error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037      0
>> error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038      0
>> error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039      0
>> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a      0
>> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b      0
>> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c      0
>> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d      0
>> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e      0
>> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f      0
>> error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040      0
>> error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041      0
>> error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042      0
>> error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043      0
>> error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044      0
>>
>> wait on a error event:
>>
>> $ ./drm_ras WAIT_ON_EVENT --device=drm:/dev/dri/card1
>> waiting for error event
>> error event received
>> counter value 0
>>
>> list all errors:
>>
>> $ ./drm_ras LIST_ERRORS --device=drm:/dev/dri/card1
>> name                                                    config-id
>>
>> error-gt0-correctable-guc                               0x0000000000000001
>> error-gt0-correctable-slm                               0x0000000000000003
>> error-gt0-correctable-eu-ic                             0x0000000000000004
>> error-gt0-correctable-eu-grf                            0x0000000000000005
>> error-gt0-fatal-guc                                     0x0000000000000009
>> error-gt0-fatal-slm                                     0x000000000000000d
>> error-gt0-fatal-eu-grf                                  0x000000000000000f
>> error-gt0-fatal-fpu                                     0x0000000000000010
>> error-gt0-fatal-tlb                                     0x0000000000000011
>> error-gt0-fatal-l3-fabric                               0x0000000000000012
>> error-gt0-correctable-subslice                          0x0000000000000013
>> error-gt0-correctable-l3bank                            0x0000000000000014
>> error-gt0-fatal-subslice                                0x0000000000000015
>> error-gt0-fatal-l3bank                                  0x0000000000000016
>> error-gt0-sgunit-correctable                            0x0000000000000017
>> error-gt0-sgunit-nonfatal                               0x0000000000000018
>> error-gt0-sgunit-fatal                                  0x0000000000000019
>> error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a
>> error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b
>> error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c
>> error-gt0-soc-fatal-punit                               0x000000000000001d
>> error-gt0-soc-fatal-psf-0                               0x000000000000001e
>> error-gt0-soc-fatal-psf-1                               0x000000000000001f
>> error-gt0-soc-fatal-psf-2                               0x0000000000000020
>> error-gt0-soc-fatal-cd0                                 0x0000000000000021
>> error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022
>> error-gt0-soc-fatal-mdfi-east                           0x0000000000000023
>> error-gt0-soc-fatal-mdfi-south                          0x0000000000000024
>> error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025
>> error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026
>> error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027
>> error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028
>> error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029
>> error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a
>> error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b
>> error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c
>> error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d
>> error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e
>> error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f
>> error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030
>> error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031
>> error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032
>> error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033
>> error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034
>> error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035
>> error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036
>> error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037
>> error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038
>> error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039
>> error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a
>> error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b
>> error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c
>> error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d
>> error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e
>> error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f
>> error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040
>> error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041
>> error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042
>> error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043
>> error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044
>> error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045
>> error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046
>> error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047
>> error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048
>> error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049
>> error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a
>> error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b
>> error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c
>> error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d
>> error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e
>> error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f
>> error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050
>> error-gt1-correctable-guc                               0x1000000000000001
>> error-gt1-correctable-slm                               0x1000000000000003
>> error-gt1-correctable-eu-ic                             0x1000000000000004
>> error-gt1-correctable-eu-grf                            0x1000000000000005
>> error-gt1-fatal-guc                                     0x1000000000000009
>> error-gt1-fatal-slm                                     0x100000000000000d
>> error-gt1-fatal-eu-grf                                  0x100000000000000f
>> error-gt1-fatal-fpu                                     0x1000000000000010
>> error-gt1-fatal-tlb                                     0x1000000000000011
>> error-gt1-fatal-l3-fabric                               0x1000000000000012
>> error-gt1-correctable-subslice                          0x1000000000000013
>> error-gt1-correctable-l3bank                            0x1000000000000014
>> error-gt1-fatal-subslice                                0x1000000000000015
>> error-gt1-fatal-l3bank                                  0x1000000000000016
>> error-gt1-sgunit-correctable                            0x1000000000000017
>> error-gt1-sgunit-nonfatal                               0x1000000000000018
>> error-gt1-sgunit-fatal                                  0x1000000000000019
>> error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a
>> error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b
>> error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c
>> error-gt1-soc-fatal-punit                               0x100000000000001d
>> error-gt1-soc-fatal-psf-0                               0x100000000000001e
>> error-gt1-soc-fatal-psf-1                               0x100000000000001f
>> error-gt1-soc-fatal-psf-2                               0x1000000000000020
>> error-gt1-soc-fatal-cd0                                 0x1000000000000021
>> error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022
>> error-gt1-soc-fatal-mdfi-east                           0x1000000000000023
>> error-gt1-soc-fatal-mdfi-south                          0x1000000000000024
>> error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025
>> error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026
>> error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027
>> error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028
>> error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029
>> error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a
>> error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b
>> error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c
>> error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d
>> error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e
>> error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f
>> error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030
>> error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031
>> error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032
>> error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033
>> error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034
>> error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035
>> error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036
>> error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037
>> error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038
>> error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039
>> error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a
>> error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b
>> error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c
>> error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d
>> error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e
>> error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f
>> error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040
>> error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041
>> error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042
>> error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043
>> error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044
>>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Oded Gabbay <ogabbay@kernel.org>
>>
>>
>> Aravind Iddamsetty (5):
>>    drm/netlink: Add netlink infrastructure
>>    drm/xe/RAS: Register a genl netlink family
>>    drm/xe/RAS: Expose the error counters
>>    drm/netlink: define multicast groups
>>    drm/xe/RAS: send multicast event on occurrence of an error
>>
>>   drivers/gpu/drm/xe/Makefile          |   1 +
>>   drivers/gpu/drm/xe/xe_device.c       |   3 +
>>   drivers/gpu/drm/xe/xe_device_types.h |   2 +
>>   drivers/gpu/drm/xe/xe_irq.c          |  32 ++
>>   drivers/gpu/drm/xe/xe_module.c       |   2 +
>>   drivers/gpu/drm/xe/xe_netlink.c      | 526 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_netlink.h      |  14 +
>>   include/uapi/drm/drm_netlink.h       |  81 +++++
>>   include/uapi/drm/xe_drm.h            |  64 ++++
>>   9 files changed, 725 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_netlink.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_netlink.h
>>   create mode 100644 include/uapi/drm/drm_netlink.h
>>
> 
