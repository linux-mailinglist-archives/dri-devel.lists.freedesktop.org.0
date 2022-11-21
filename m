Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E90C632BFD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 19:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F7910E32F;
	Mon, 21 Nov 2022 18:21:40 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAEF10E16D;
 Mon, 21 Nov 2022 18:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669054893; x=1700590893;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PUqAfdLKSrsdAfindMLjTqi1LnIbTAUM8JJBCJlz0Ko=;
 b=PKNQqdQhYme9u1oOyvf1qfcA0qRBZRlYwtlCAcdYoeOURGAhADYbb2wp
 2P3HVYtHTxHBSIHwiq5ikWytesSUVz3+u3KdE7RstBx7F/jXBnMiXDGgF
 mW29Srn+mWALXjqjp1ewsZoj2Hji/4QWrcMkz6GCUeC3XhvUkdQnNd+Hv
 euBAaOx0dkzv5+vilnvm6Jaeaiq41dIB2zxJ9DBtwYFedXz+EyzHQp81T
 ttHVolbcIc01A3YKTdKX9u8eTu2ILK6Az2HbmAhFIUBuwe+ztCpJW53ms
 dhk/6JxpPsXwCyCyhuXN6ah9bA9jBtFFr8WLRo5B0do000Ws2P+7O7l4R w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="399918538"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="399918538"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 10:21:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="704659841"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="704659841"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 21 Nov 2022 10:21:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 10:21:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 21 Nov 2022 10:21:28 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 21 Nov 2022 10:21:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEVyLvWleEHVDyKHpftE63vTtKF42BqGNONNPMqcwZmLOOAmIYxSrXPFAZ7xW78xlCXxlwLAteUStfKJBgx3tqLQh6fFUAHOe8taJsv09XK/AIZk3nwJFo71eB4JPQkp+DlStIWFJmU0N59w25uULUKHQUuNp8MYa7BQ+LGwrRlIZnxvKigh1ruw2sjiBtK9r3gQDJxi8+lFqhtLThuodOBtli+HhW7jErE1ScTOTvw+qB4BeJJef4IQjVrjxoxjCiMkGrHFDJ7xNNB0v5Vh6AlrWqfL9b/KT9/6ils158/Jt/8vGn1UC6BgjISV5inYakIF9Ww4iD0nzE808x6Rig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgWbb8n6+G/uVcophWLDFpfpn7fCmYYqCnU5VUeP4YY=;
 b=Ynk5AYrob1MXYFlyk4kAdSrukCOwwRHtDCGysWlQ0XQ3YsmON+FXzCkZNxfQIJMbVw+H6iYhZvRjASEeX5PBKgy95nh1WfvBj9GVq9cYLm+1fvIr4N8+ZtjUbEgU4BH4+cp//Pmwddk3bQ/ajrrbKM0+j5/bhGBr26aK99py+Zx9RsP+n1OWZXxqGsVLuBWY8UliqihJ7ChB+O67JT0so8xQz40q4WV4pGg2byE+PL1ZCphHE5Jxkh7BnzYklUqPTDScOBx71TsuSB5E2RyfdC4m4ANYX16m0Syq6IJ/yrsd/QI+o4PM35FmhmY8Q5fFEnaoVe90RKxlUt3NupfgCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH7PR11MB6724.namprd11.prod.outlook.com (2603:10b6:510:1b4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 18:21:21 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a9e2:5c97:e3f0:1f12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a9e2:5c97:e3f0:1f12%4]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 18:21:21 +0000
Message-ID: <26c44ed9-4fd8-197a-85cd-038da7096c15@intel.com>
Date: Mon, 21 Nov 2022 10:21:18 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [Intel-gfx] [PATCH v2 0/5] Add module oriented dmesg output
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
References: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
 <87a64o1qn5.fsf@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <87a64o1qn5.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0337.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::12) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH7PR11MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f26c32-1a9a-4d29-4372-08dacbed3092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 59RbHde7YH1abp0WMjOLIGwhporZJJE33KT5XAegoXaNKFugPBGWrwQ+WsC/RTUnmdtCjTkxfpYXA2MP0G6HTMU8UFxXMMmaSUnazh6fLIvoDS17ZJVdQq1hwgI8Uus+j8PnlSTmzKmC+4uA37Z5m9XFHASGzeKpMCae0BMzlw9ugfu6pYYZyLNRUidbokq+GFluZOPCEo5Wyop46grSw3SGgP9PnFL1aWxstpUATDgIDkycIsrId7IRZffIy/h2pLi5/AbMdxoV2qalaact6GVtjmIpka9PIDuYHXSxsGis2MQhWqFvktpYh4GXf0V+mL/QzdZGMzGSOdFmXZbx6PJfcSHp3vrRE1impcV8/JMCUdOqW18s/9yJyKDG3J/qbgYdtlxT5fwwkQGYu7RAcvBQY9fox570QTMjey3/EO6n+9FZTnu4YlTVMPWR95Lb3sEVoS0Zf+x7yu9WjGOqLa7uclGcxRLgEKqi+q3LgH59AN0ONflOBt/1X5TdSqsxCmZRCN8YsSxvAIlUPOMNGl6ixDt0k7P5ZB8i2keoPApXVqvUaybfsD7v32fCDF+Z2esalzWCEGJjz9ExktZETqE7HdzKeioFVYpksTHJqOnvhkDp48PhyW5hJOubOEnyc5IYl03LjG73/3Nv501/PKikaKSWdcpo7h0Z9gyW/kg6t1HmM6Hb+WxKvBpl6edgcKjFLyHPce8wVygOP7duJ82cewPFUjPNr17QxD0YlJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199015)(31686004)(53546011)(86362001)(6666004)(6512007)(26005)(41300700001)(478600001)(31696002)(6486002)(83380400001)(8676002)(4326008)(66946007)(66476007)(6506007)(82960400001)(186003)(38100700002)(66556008)(110136005)(54906003)(316002)(5660300002)(8936002)(2906002)(6636002)(2616005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmNqcTRTUE1wVVlWZ1l3eGozZ3NQbjNtVGRmRjdtNUVoMEpxbTFYNGRFMFVx?=
 =?utf-8?B?T2VQUWo3aFMwaXU0bGxBQ2RkNVlDei81N0RHd2ttdGVtclUwendtQXVkUDNO?=
 =?utf-8?B?L1hWZTJ4b0lDcFR5TDkzZU1ZdCs4c29IWHk5ZktZTTN2U3IvNWVUa2RicENw?=
 =?utf-8?B?YVJ3RE0zejlac3p4YU9ZTlNnRWMyUFdYSWUyb1RPZnp5ME9NblFKZXp5QTJL?=
 =?utf-8?B?L2twVGRIei9KcWl0bmpaWG90UEZNVWp1OTMvYlI4c0J2ek9GWkxHQlV0cE9s?=
 =?utf-8?B?ZXAxR2xHYi8wbFhjMTF4RHFFTi9VRzNWVy9oUG55UFZOOHFkVUduekxtM1I2?=
 =?utf-8?B?SEhaa2U4WEo3QWd1d3JDYlhQSFdPYXBQbXhrVXlsVERQMkR4TlFzU1JSWnFl?=
 =?utf-8?B?clFPKytkaVRpTm9EdWZpZmFZNTNKaGRvbVlOK3VvUmxkWldzWSs5aHNwMHQ2?=
 =?utf-8?B?SE9OOXdnalE1dHlvbFcwa2F5TGhaQzZFaG9LWS95akFJbEdYUU9kbjk4WUoy?=
 =?utf-8?B?cHFobG1MQ1J4TXphRHlRQ0xicC9nNERHQWQySXRlWlR6QWQ4aFBhTmJVZU5q?=
 =?utf-8?B?d2ZjSE1CYys5REVaRERGaHBKMjkrT1VOQ0dpb0ZhQWlIYlFkMGh5NG95WE5J?=
 =?utf-8?B?OWtWOXQ0ZTFzaE1JTlpKdzh3NHRHR2gyVkw5aDF1ZkNoRmNabXNvQnBqL2g2?=
 =?utf-8?B?THZqQzFSZ0djeVM5ZEVRK2FVNHF1b3RvSDdTQ0ZHeGNpcW5iazZiOS9lV2FR?=
 =?utf-8?B?dDEvbFR2UzBDUGdwdUhDRkE0WFV6MmV0NVdIa0RoK0d6Qy9WMnJacTBnait0?=
 =?utf-8?B?UEJMcWJFMnQyaTFWNmNxRzZ3bk05cEVtMzF0MWM3eVkwaTJEMGU1R1o3dC9W?=
 =?utf-8?B?emlTQjZZbVkyUTRvVzVmWWtSY2tIZkhqdU5OV3A4ZXlPOUdMcDVXTXRmYzBJ?=
 =?utf-8?B?dks1SlBnOURPUzQxMG0wVCsyL1U1QnZrUSs4YTlTeE9nZCtXMFJUOGlkQUkr?=
 =?utf-8?B?Z1J4NkRHVnpLNTBlY05qNDM2UFhxckRHeXR2NjA1MDJzWlVDU3R0L2YwZ2hY?=
 =?utf-8?B?MnZxV05Ya3VpQkhjYXZHak1GTkt6TEl3anZoK1lPZDFuaUoxSm1ycVBkRVJU?=
 =?utf-8?B?SW1mWnBTeHo0VWl4TnZqdWx6MWI4RjJJL1hSSnJJNkRUUTJLL3kyMk5raXRJ?=
 =?utf-8?B?L25JSVZzb2EzNWJ2R0ZvdWx5WlFwUVFndVp3OWhTRDNnL3ZCUHJNNVQ4aWZG?=
 =?utf-8?B?N0FTNGxibjRQVkFCNWRKWE91R0xESmZDVWI1akpLKzZmOURYNDRrN3krclVL?=
 =?utf-8?B?MUd1eFhteWJFT3JBV25WaC9ucTI1SElnbDl1dVhJc0NiRXY1TUtRQVNIc0dr?=
 =?utf-8?B?ZHk4NS84eFp0SE1HUU40MmlEeWNXSjVIbjBOMlpONEYvT056VGU2SkxNUHJi?=
 =?utf-8?B?U3RLYlRhNTBiTE5Xd20ySCtWWU13ZW01NnRmeTdNMkxmcWlMZGt4R25YYmZx?=
 =?utf-8?B?R2VvMHRxcWpaeGtMUmp3QThxaDl4ZzFoanNrZEU4T1RMYVZHNjdFWW9NZ0ov?=
 =?utf-8?B?RXViM20rWE9jRzIwaG1hVWlpMUhEMXVwS2ZwUDZIN3hGamEvd1lTNkRGQ2lk?=
 =?utf-8?B?dzkzRWs0Y3YrR3RaWTVrT1JXTVAwY3hYeE9yUmp1cmoxb04rSUdZTm8vRkhr?=
 =?utf-8?B?d3Zjd0RUa2ZLdGMvUEpIZEZkM0xFcTRtK2NYSE9TV1IwMWwybzFCRUlUaEcy?=
 =?utf-8?B?UGluODUzT2QzZTVSTHRFY1MzZHE4bk92SlR6UFJCSTZKN1FGVDdibndtcG44?=
 =?utf-8?B?UlN0b2JXUHpuaG9hMS9ZYkd4U25XRTBSM0haNSt2Z1VpNjRkUDg1THJXMjIv?=
 =?utf-8?B?Y29oenFYeDB2RnN4SFV0elBKTEYyZWZaaHNHRmUvN2MzZjA5d2tacDdmVU9Q?=
 =?utf-8?B?OFFqd0NxV00rRDhkM0dNaVlTNWVQU2hWcklINm9DUFFENFp0NnArQXhMdFM4?=
 =?utf-8?B?VUV3aGdTc0VIbXp4djN2TVN0QTRPaTZ4dk9mdTJVNGJxOHZOeStydFVYMHRC?=
 =?utf-8?B?bDFmOGJVck5PdTZST2txK2dVV0ZRZmxtOVdpQ0NBdDBoZ2dYMWZnY2ltRnFh?=
 =?utf-8?B?SnNZM1hlakE4ZklTOXZJTlkwYkV6YUVtT201enExdk9EUDFZb2l4QUh2bTEr?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f26c32-1a9a-4d29-4372-08dacbed3092
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 18:21:21.0488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qEoUv7uKoZ/5ikp+miEuW9srZdddojBtp0s+n6oqSYS1ocr2FjXpfAIVi0WWFzwFmmkRx8hdjyW9+EpWop56hKBJoz8pmRVWw4mthp4hgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6724
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/18/2022 02:52, Jani Nikula wrote:
> On Thu, 17 Nov 2022, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> When trying to analyse bug reports from CI, customers, etc. it can be
>> difficult to work out exactly what is happening on which GT in a
>> multi-GT system. So add GT oriented debug/error message wrappers. If
>> used instead of the drm_ equivalents, you get the same output but with
>> a GT# prefix on it.
>>
>> It was also requested to extend this further to submodules in order to
>> factor out the repeated structure accessing constructs and common
>> string prefixes. So, add versions for GuC, HuC and GuC CTB as well.
>>
>> This patch set updates all the gt/uc files to use the new helpers as a
>> first step. The intention would be to convert all output messages that
>> have access to a GT structure.
>>
>> v2: Go back to using lower case names, add more wrapper sets (combined
>> review feedback). Also, wrap up probe injection and WARN entries.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> For adding the wrappers in general, I'm going to disagree and
> commit. I'll leave it up to Tvrtko and Joonas.
>
> Regarding the placement of the macros, I insist you add individual
> header files for the wrappers and include them only where needed.
>
> We have a fairly serious problem with everything including everything in
> i915 that I've been slowly trying to tackle. Touch one thing, rebuild
> everything. About a third of our headers cause the rebuild of the entire
> driver when modified. We need to reduce the surface of things that cause
> rebuilds.
>
> For example, intel_gt.h is included by 97 files, intel_guc.h by 332
> files, and intel_huc.h by 329 files (counting recursively).
>
> There's absolutely no reason any of the display code, for example, needs
> to have these logging macros in their build. Long term, the headers
> should be reorganized to reduce the interdependencies, and this is what
> I've been doing in i915_drv.h and display/ in general. But the least we
> can do is not make the problem worse.
@Tvrtko/@Michal W, any other review comments or feedback? I'd rather not 
spend time fixing up the header file issue and reposting only to have 
someone point out another issue that could have been resolved at the 
same time.

John.

> BR,
> Jani.
>
>>
>> John Harrison (5):
>>    drm/i915/gt: Start adding module oriented dmesg output
>>    drm/i915/huc: Add HuC specific debug print wrappers
>>    drm/i915/guc: Add GuC specific debug print wrappers
>>    drm/i915/guc: Add GuC CT specific debug print wrappers
>>    drm/i915/uc: Update the gt/uc code to use gt_err and friends
>>
>>   drivers/gpu/drm/i915/gt/intel_gt.c            |  96 ++++----
>>   drivers/gpu/drm/i915/gt/intel_gt.h            |  35 +++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  32 +--
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  35 +++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |   8 +-
>>   .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  48 ++--
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 222 +++++++++---------
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  19 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  37 ++-
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |   7 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |  55 ++---
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  62 +++--
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  31 +--
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.h        |  23 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 108 ++++-----
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  98 ++++----
>>   drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |  34 +--
>>   .../drm/i915/gt/uc/selftest_guc_hangcheck.c   |  22 +-
>>   .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   |  10 +-
>>   19 files changed, 507 insertions(+), 475 deletions(-)

