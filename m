Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 468E463ADD5
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 17:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37EB10E2FA;
	Mon, 28 Nov 2022 16:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911AC10E2F6;
 Mon, 28 Nov 2022 16:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669653193; x=1701189193;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1Z+a2Dv6XTFLRYPvYBRAfioQE+AhPrTDdgkWqC7oiX4=;
 b=TqJrF613J7iPjlEvMb9u06vxCFhCrWR93NaoT/KZRz4aHDLNALKJbf9Z
 P8FmynqknTbELC4/EFjGWGq3aPIWmiPf/679Hf/wX3d0FDOklWfUR315z
 CQmY5hYMJ77vjh3TabSKaHKgG5APZufwRPUGmWisf9g7k3QIGEHwkGIwm
 qTp7BRAK+ztbr85Nd1Y3iBow+EhV42pJLkEErGyxKgN9vPZDSNzJUHuHN
 2NdBxIyYaf0fBjgCTU7eLGKgK0n+Ykw0t+1Vyv7RB+Md3LlD9hJ800iXY
 KdqmJHq9fV2lfKeVPjj6wlrVJlbn8Vl387C0IJ1rt8IDehxXYorv3tGGi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="379139404"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; d="scan'208";a="379139404"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 08:32:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="712027635"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; d="scan'208";a="712027635"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 28 Nov 2022 08:32:35 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 28 Nov 2022 08:32:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 28 Nov 2022 08:32:34 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 28 Nov 2022 08:32:34 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 28 Nov 2022 08:32:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTPKoxyJy5msGp8EgkhD9yWUQBr8TV1p1OMD7I5fFG82NVNPVrzJAh2n4BYcpSNHEC0hBnct2+iyMErN9iCFtjR8VaovUXXyib0hjer1YgHcgcyreEOKTNduR6k1NfmjRz+C9T+jKHltTUZbjXqRzWSgNo8oxsbfUa42w/b7tGfQxdgvEi5+531TocZZzU5PmUYRfbLeRiUvuftbcqGJGpYnYRjb0g/uANVAHm/plFL3hp9xWZweMYUpF6ruyHr7wpWi9gVb/jxF9pJtR8fByoyNr8+ncfKJ1wiLlsLQh9PmINkLdJS2L7qhmeqk+nGjC/wo6CUGlRBfSboHmkwk4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xylNHUKPeBob88qtcactbEedBIz2tMkJ7rXH46b8pwk=;
 b=HM65VeBGn5fldMHDeclpmazm1wuAN2RVMnsLLToD2YFI/POCpzsMo7wZxXCaYENMgN23wvxUf3jqy7mH7rd5JfMuM5WZT92ZUUpXUUp/mthGaYKqJSHQbjJ0nlQYasbgMlPhvTDGvg6Rx0ocV5Go5bFJe+Zne0GDLyEcxdEXLCQWFGlmpOQrRhIyfxs8Ue8nu3Qk6G0We/fexcvt33nchPMMDKuTGRqfp7ht8i9lpm5nLisUghrCR7O4pPQxTxZHBh0Q9cz4ojbHPXWyHTTrkIMhhJoSvbD4HJnyiaXdP0Hu7TX2IIDIR8n5xclEh+9rZAYlogEZo8TUZehOX1Ku9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CH3PR11MB7324.namprd11.prod.outlook.com (2603:10b6:610:14f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 16:32:30 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd%6]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 16:32:30 +0000
Message-ID: <e9752fdf-bb5a-ac75-30bd-9aa757304394@intel.com>
Date: Mon, 28 Nov 2022 08:32:29 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/i915/huc: fix leak of debug object in huc load fence
 on driver unload
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20221111005651.4160369-1-daniele.ceraolospurio@intel.com>
 <Y4DI+gq1rVQXDRbg@intel.com> <119a95f9-9c54-d811-8c2f-f3ecd52258c9@intel.com>
 <Y4Syz9kXp1JPal4I@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <Y4Syz9kXp1JPal4I@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CH3PR11MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f4f32c-a18b-4e9b-b11c-08dad15e2519
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J6PjE+ST48E8sjpCJxUyI+ioHb1JGjt2tzf1s92gS/FZFybu/wI5mmkHrBMD8D4rvI1YCe7MYjLWFSahFE+ce4UOXh2jln8SQeI7XGqDtZygAX1pQJ54aLAby0bXDbnw+zViGvF5jstjW3SaT4IbkWh9vvmY92ItprNN9BY8G8zEWgp2IzXCkzUQtXWF/L0dtooU/TPI8g5Q55tFlyy/VJgqJw/nkySirceA2VVoA8tmShxoZ7vT42YT3ps/2FKgEy7csjjsLo5D+qZQcUzR4a/RgV6VceDHB+onHx0hEO5ym9fdtr5IrHg/PB5KhmHKpfc7/SrKs3Uq2VdH42t0YZhpHz7EX6p9iXZhWWrzZ+YxQkHByWO7MThPpeYAVgxkc1c4UNMvQ0fF6KXh/emW8oNhByxuRZp3Q86i8g1ZDKSlwlsbVvgx+V2JEYuAOuyXdv8tHPvzrPO5kC3Hc+lD3PeWJGeZtgeXSt8UZaMpZg3f4h+5J+RB2Hkeg0yxWbAyqkY90EXKzTz00mic2j88tfCAGo9kt6Gmstn03EKDd7C9K+NK0dqqx+2aoBZc4G19Xg8KhbVN6+2Up5yi+Gen07CvBd+WPa7q5ooAyqBRF2L+FhfhDV0OiqlU09Av9Ep+68h0/hWlq4mM3IHWu272lkCq3ymMUMC12Q2fdje6oskbpvnDe8RWWj3wAJe2Rulu+BThOmFiUuKyJYUnvRMgcTERjhl6W/tBFm2Wcp84ewooXJXA9n780bBLNAS09OE5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(366004)(39850400004)(346002)(376002)(451199015)(5660300002)(31686004)(66556008)(66476007)(8676002)(4326008)(8936002)(41300700001)(36756003)(54906003)(966005)(6916009)(66946007)(6486002)(2906002)(316002)(478600001)(86362001)(6512007)(31696002)(26005)(53546011)(6506007)(186003)(2616005)(83380400001)(66574015)(38100700002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3NYZXBLNGI3OGVSRmdrNUVNdjRDMk5PUmhBTFF3NDYvc0tkY01OV25PY3hN?=
 =?utf-8?B?b25XaVRUbWlYalZZMHRNTVVpME5wSm5zd2htNUxkU2ZnczJsa1RCVnZWRUs5?=
 =?utf-8?B?T29MSGhUbURmT2ZXeEY3bWhUcmdDRVdrYnRXNnFINzJBck1kdExlbThPS0Zu?=
 =?utf-8?B?NzRSZE9qRXFSMnpJNDZiOVpZbW1JaFhPRWtmM2cxTmNTS3JTbEpZdG5HN2I4?=
 =?utf-8?B?c3NHVDFIZ2Y0UUUybEM5RzFjUzY2Z0pJZS8xMkg0NjZEd0Z6TW5BdG8xamZk?=
 =?utf-8?B?RHBZZHozTG55VTI0UmJCUkttb2FKLzArdUJBN2R2ckNQcXZpVWsvenpZMThL?=
 =?utf-8?B?eElCVEVjd3NIdi9maXA0YTBDeGEwUkx6TWRJRGxoUnJ3d3JIdGJnV0FkWjd5?=
 =?utf-8?B?VlFDeXVhb0o1enB4WEQyWS9tTk0wMWN1QSs4VE9rdFYwTDdVa01uOWtTc1Uz?=
 =?utf-8?B?VkQyYUcrSFMzTkxYSmQxdFFXZGhPbGlkMmhLODhhLzBlbzdDeURLc3d3cDE3?=
 =?utf-8?B?R3J3WG9vVVdTaEx1VFgzWXhOcWlMTmdiVUdVZTJYdytGSjlrQm1ZWEtWV1hC?=
 =?utf-8?B?cDZyeSsyZERYUHlHQm44WHVOQ2xIb2FuSTlSUDBkU2k3d3o1SnBYWS93ek5j?=
 =?utf-8?B?L2JDbFVIeUI2NjJZQnJnQ2QvSUZqMzhCbGd6RDNxT3JHeno4L3JPU1ZnQ3Nn?=
 =?utf-8?B?d1RySVpqcTVWSjFsckFTdlYyZXpYRHVRdGZJU1lacmticllVWFliL3d6SkNr?=
 =?utf-8?B?c0l3bmZ3cFMzTUMzR3FIMEw5V1FWZ0tiRUw4TS9JMk9MU1JrU0xDNzNoSzNm?=
 =?utf-8?B?eXQrRVNVUVBiOThqMVlBYUN6MGgrQzJGaUN4a0Q4N2dTNnBubXNhYXdJTm5l?=
 =?utf-8?B?MEtueWRXdWpKeE9ZSkNXUFdsZ2JyRjhoaEhaN0R4RHhCcUJ4L1p0aWNpQy9s?=
 =?utf-8?B?d2hXZE91c25GaVN1Wm01ZmZtYll1QTlVb3RUQnVTWFFLTVRqM2IraklkZXpG?=
 =?utf-8?B?QWpJZmpKd3hGdXY3MTNRT1FTamJvNGFWNEJmZ3dxR1FZNUVjVmJQUG1VdEZz?=
 =?utf-8?B?b3JvVkFXZi9VVmxFY3JVU29oRElnU3RxM0ZuNEg1SkdhZkFPMnNwQk9nTHkr?=
 =?utf-8?B?dHU1RmhtL205ZWN3N1RnZi9vcCtGQmhKVy9OSWVxWHcxMXV3by9MTmZ3UGUy?=
 =?utf-8?B?ejFVc1VWREtpdVpwNnFLQmdWdC9uZmcwNlpOOWFWM3ZxbENKeGRNRUtJb2Iw?=
 =?utf-8?B?azVFaEZVODl3dC9HV1Q1WjJla3N1cHZ4TmVaZGRMSkNjN2VwQ0FRR3l3cy9C?=
 =?utf-8?B?NHIwN01mcWdpY3JVdzRTU0txK0ZubU5nUEFKdG8zVm0yUkd2d0p3eFp5QTBX?=
 =?utf-8?B?ajFnZkM5S3NxcTN6UnFzRXU4eUlhLzZwVHlhMHBEalJSWG5mVEZycUE1WHhs?=
 =?utf-8?B?NDdMT3NVMUlWRmZTTzJqZDBHaVY3eUtieXdLSU1zanZQTkI3ZGNZRHZvZ0lr?=
 =?utf-8?B?M1lUOGQ0Z1d2KzNPUkx6RTYwaHZ3RkpVS2dRc1dYYmhYV0RzVjQ4UlZabEtj?=
 =?utf-8?B?YUY4alZOUUtxc2o0UnVQZDlRZU9YVmlDeFBkcXBmc2w0RDQxWnIxUW1XOUNl?=
 =?utf-8?B?am54bHZJTU1RTzhDMGM3R04rQ0JnNml4ZVRIWHFFN2JPWHJacElkdUQwaTFO?=
 =?utf-8?B?LzJGTUdMa3BEdXRPVWxYOU5tWUhiUVVzU0JRbmxVZmxaa056b3JUNXZvcUlD?=
 =?utf-8?B?NWZxaWw0a2RiNmpieXhBRjlINTBQRkdzSVFEeHQrc1VKTTVGRmt3YVZmWTlM?=
 =?utf-8?B?MEg4WjRFTDZqbjE2ZU9QVG9ZclVwV0JHR0ZTNzRTSTNXQjdKVi96R1c2OVFV?=
 =?utf-8?B?eGltbFUxVlRyZEIrSU5ZNFh2Zm4yek5PUVNqazJzem1XeUpmSCt5dExucG43?=
 =?utf-8?B?QWxFZjVDRUlDT2ZoMU41WjNhcWVaWFdnbUpVYWRPZ25tK0lKeXhPM3QzY291?=
 =?utf-8?B?Tm4yaUhjOVgvWXRFWTREWVdHanVRS2JlM25YUkg5TmFPbXFCNDVTVmQrak0y?=
 =?utf-8?B?QkZIa0N0L2VLL3A0dWRGbnBTeUFjK0tvUnR6WHRqTUNORDJyYUhsM3ZrY2xT?=
 =?utf-8?B?bTFrbis5TjhIU3BnVC9EYWpDeEtMRmR5cEVwRWlwK25rNzM0WE9pUDdXWlVR?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f4f32c-a18b-4e9b-b11c-08dad15e2519
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 16:32:30.7480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rNv2wJBjIbnPHSWh8axcfpxIYT35jcMfOJxWf7gv7902SZwzBJUFoxpg+TPPCz6R1CsMZ2G/XnB4VYKJx1pCN4xcyQ6D1Rp6sDRhECkJwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7324
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
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org, Brian Norris <briannorris@chromium.org>,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/28/2022 5:08 AM, Ville Syrjälä wrote:
> On Mon, Nov 28, 2022 at 01:10:58AM -0800, Ceraolo Spurio, Daniele wrote:
>>
>> On 11/25/2022 5:54 AM, Ville Syrjälä wrote:
>>> On Thu, Nov 10, 2022 at 04:56:51PM -0800, Daniele Ceraolo Spurio wrote:
>>>> The fence is always initialized in huc_init_early, but the cleanup in
>>>> huc_fini is only being run if HuC is enabled. This causes a leaking of
>>>> the debug object when HuC is disabled/not supported, which can in turn
>>>> trigger a warning if we try to register a new debug offset at the same
>>>> address on driver reload.
>>>>
>>>> To fix the issue, make sure to always run the cleanup code.
>>> This oopsing in ci now. Somehow the patchwork run did not
>>> hit that oops.
>> Can you point me to the oops log? I opened a few recent runs at random
>> but I wasn't able to find it.
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12425/fi-blb-e6850/igt@core_hotunplug@unbind-rebind.html

Thanks, it's indeed the same issue (and I've just confirmed that the 
pre-merge result for the fix do mention that this test is moving from 
incomplete to pass). From just a visual inspection I thought the problem 
would only affect MTL, which does have HuC but only on one of the 2 GTs, 
but it looks like this impacts also platforms without HuC at all (as 
long as they also have no VCS engines). I'll try to get the fix reviewed 
and merged ASAP.

Thanks,
Daniele


