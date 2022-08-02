Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B4D587C5E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 14:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54A28F059;
	Tue,  2 Aug 2022 12:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AFE11B13C;
 Tue,  2 Aug 2022 12:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659443112; x=1690979112;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iS/m2MT56tgRZiXgNXJnfVG8w9erjJrMqZYZV93qMJM=;
 b=f/RsRkgLHViH5KQMJAdmuoxJnAuVp5capQRUmEcWAf7iDlCdo4VjfEOo
 yx4yyReUEO7B4GTRTwyEfA4qKJPqyIEr3HLE8pm5oyaA4H/F9/0bUlLvZ
 d5mlP74l8+it3oHF7Ut4gdw9u2dM8GqyLa0zjDMrrMKG5MdJ9iGLLc8n1
 KVlviRDzLdk61t3sJMTSv+ox221ztdJ+6JGEviXqnqwD9q3sasy5kjKvK
 jVaZ/01ebx414uVucRYGY2FMOd51FDb0XlHdCFIyeuGdzyjQnvy+jHBmM
 OcGpp7kNpBMHL0Mg55bAodjADYr9R3SXEdm+aqrf0/eNry0Ap98CXNtSg A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="290169496"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="290169496"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 05:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="778605772"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga005.jf.intel.com with ESMTP; 02 Aug 2022 05:25:11 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 05:25:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 2 Aug 2022 05:25:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 2 Aug 2022 05:25:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lj5H8iRRfkv9XtWJW30BhvHBy7DSTsB2j2AyfzZKPG2auh9Bpfa4FvGTxDUISWgKlq+Hmxu5u9/yvYN+CYjFG068jx4XCVjYFFd5MeMEKyTRffNKdjbgb5NNZMg8V9G22Up6/2A6F3L+sfwuaP/DXjc2MNgHFIb1WPTtOxk0s+5SiJ8mYwgE2RJIzovwe+5+hZbpQYVqFDcyYaKgYRg7PWnwnI39ZaFxXypZ3mdqv/xKgN0fKWXK+DRaLmKRQKZb/BkJ1REdVJSy5/zd8qc6a7Vb8o2VivJ3RhbaB0LF+ThwPClmv/ShK8KJt4mlBorw4gnyc66jA592ANV3AmXkaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AOTpanc528ore85vleyMJOZ1Sa3RP4HhyfC9+PfUlY=;
 b=k1asl1sC1Bl1URsmVZgo6BK7w7uifKPlv5vX0eY2elmaRrdelv+9sBHSOfLnwyS+u4O1MWdMWuTYrKM15sVYNRtOQsR73O1YOSaCCji3KV+MYtN4fWD+MbvfCDdHy98TsG8SxE7MYlGEDoXichxi/PFSbtLmtho2vHpvxBKr5Rqpf7izEAnlesTrJCJh56NfnCrmZZoyKhfkzvnHMFum+Z5Ewpi5MsWTsfs683tFybZ6nsUTs8W8npEKPQ7upJSRXgaBS2sRZ+y3FfjGrLzMx/TH5QShFhtu70S3nMOkNEjmcaVxUhko1jxWpLfgDa2rcEr7kWCeS/pC+bEcXu/gcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by MWHPR11MB1360.namprd11.prod.outlook.com (2603:10b6:300:26::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Tue, 2 Aug
 2022 12:25:04 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::70e4:76ca:fc65:df73]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::70e4:76ca:fc65:df73%3]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 12:25:04 +0000
Message-ID: <94d076ad-b0ff-0469-a741-255360a7da41@intel.com>
Date: Tue, 2 Aug 2022 15:24:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Intel-gfx] [PATCH v6 0/4] drm/i915/display: stop HPD workers
 before display driver unregister
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Deak,
 Imre" <imre.deak@intel.com>
References: <20220722125143.1604709-1-andrzej.hajda@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20220722125143.1604709-1-andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::17) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d46803b2-63c6-43ba-32a0-08da748206c7
X-MS-TrafficTypeDiagnostic: MWHPR11MB1360:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i99OqWlD7WhJqXVHudH0b+dLLAqkD+IjzcxNDjfVNiatOn9IjonvPxdga7AbcWAMH2OcxJ/r3yYLjVkSjVKjL9/UbYVBXdMk773ahcwK1+4dzD7QimFL1axj0Sl9qxKUO+Zsdf8bIWi/CqpBN9RPL3pWwSg1nDNJ8/r/h5mMzSclAzMqlkYPJZqaLfgErbHoriRiCs0Vqee3i1tOcizOQ7sjREGrrdSsArEz2hydOQGlFpdpJM9dZLaZQF34Aew7TSV2j5pwfWXeEfF28tfhyyLVTMErc5MLxhMLYR9TQwgVUFI68rn74nxV5irp/PA0JlhK979wC2H6N8e05mXNi4SJhjAsduW1g+6fb6+eFc1Zv2Zl1L0/i0iO/4cIOoA9QAdcOvdDXkL7mSUMcrWXhwjDdJYW3PGWwmlzlyHiNPG0gqKJqn9b7mEGYIEOvp7DQoHY4c4UB14ALBasZB/EznqgMzemzb+h8STbrlZhURNOhlErwjPdMLW1LKxOGw46akJt0y8T1QYvcfCYbesPeiRLPZfYjqQVN4mBCjVY9go8J2bG5Z9J9pfqkW2GFULC2O9tr8Ujr2IIG8ss/dGrfb0UjcNbm0SPIEqblY1Aw1iHm3b6lP3ePsMCTbdQZ2g1tZvLpBEGplHOO7b3RPGLpasXuxhK6EuPfMqLHFrpTKj/OFGQeZpOGrbvQJkdfKaWJeJwpvvrKy9V1KmfOP5FFOoKz6aUSwCVJywkq73o9TUPYQKDASxkfMgNXYD/+tLFRXF7zJBeIAgs5v9hu8sePA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(39860400002)(346002)(376002)(396003)(83380400001)(66476007)(8676002)(66556008)(66946007)(4326008)(2616005)(186003)(36756003)(8936002)(31686004)(5660300002)(2906002)(316002)(478600001)(6486002)(966005)(6512007)(53546011)(6506007)(110136005)(6636002)(54906003)(41300700001)(6666004)(31696002)(86362001)(26005)(38100700002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek54cHlYd1M4SnYzcDlaMVRtbjFCcGRFS1VUQmlwVi9NcTk3TzhXem5OMGNz?=
 =?utf-8?B?ajFTUVdaTmN0RHVmbU9lbEFFckxwU1M2OWsycHd2Uis0Sm0vV0NpMlhxTlVE?=
 =?utf-8?B?Q2M2WFMyTDBKaERFMk5uVVpjemR2OGJKSHFqWGhvUFdnY3MxUXZIMG9lN0Zq?=
 =?utf-8?B?Q0xyR1p2cXErZHhpVmNSTmYzWDhwanpUd0swMkFjaFQvZHdlVUNDSHltRUJa?=
 =?utf-8?B?ZXZSeWZDUzhwZHlVaG1ZbWlGQk9heWlUM3JTVGJDUzA4d0c4SjA4dUlvWGpm?=
 =?utf-8?B?SXpWVWdhc0g3TG43SHVpakVaR3JyTUF1cVBFbkQ2MUt0UllxNFlJUG40enZn?=
 =?utf-8?B?cWNzbStXQ0NsMTVNcXc3T0dwWVhzQzdnZC9GKzZhd2h5S1NBcU9pb3pEZTBq?=
 =?utf-8?B?M3crN2ZBeTdxNms5aXhyNkJ6K0FQYUVWYkRnOFJkd051NEJrbWt5c2YybU5B?=
 =?utf-8?B?R0dZbzJmRTQ5dVlqMW4vNWF6bnpTZnYwWDNqWGZLTytVdGlNSEl4YmdzSGFT?=
 =?utf-8?B?UXFSNmNiWHJwbnNoQjdCTXgyRHM5WmdNMDhRZWEzcnA2SXozTlROM0l5YnNW?=
 =?utf-8?B?MDNUcG9sUHJidFdFOGc0UDJ6SUdDWisxVE5ZaWF5ZTgzcmhWanVuMWQxY2JL?=
 =?utf-8?B?S1NUT0c1MFY0bEcxR3BJSHJXNkpXRE5yeHV2NnRSV29MV2Y0bzg3VC85ZGs3?=
 =?utf-8?B?S29zbG1CblYzY1VHRU92YWcybnNnb1E0L1hlU2pCNVdCV2RxbWUvRVdJOFpp?=
 =?utf-8?B?eTNMVlJBbjEzVHMwZlpUVGNIMUdkaGJydjlGamVFOHpuK2VwTy84NXpTVmwy?=
 =?utf-8?B?b3VxOTFUc3RUS3J1emcrZkNmTDRIOXIxaTAwdkY2RE1OZUJSTFA3ZVUvQkti?=
 =?utf-8?B?Y3pxc3dCdkRhRGlCTVo1NFgzdlRtUUJVVHR2NTlEZ2lRQ05uT25icFJibHpN?=
 =?utf-8?B?NzBaK0dCZGZGR2pta2ZWdzg0SXJFTUJGMy9nNjBhNmF6Z21zQXBiSS82SmQw?=
 =?utf-8?B?NE9aYjN0a3MydkxPc1poQzRtQmhmazRsTzNzSFJlZEhtSkRzNGpKc2VBdzdD?=
 =?utf-8?B?eGxWZERZdlZxbVgzSW5lQ203MlJDM0hOdXVqMTB6QkxrekVFSldmeGthazlT?=
 =?utf-8?B?REo0MnB6L3lJVGVZTHBOSGI1ZS9rN2dtMHZFVm1RcU93dVZPZXpPck1JL2J3?=
 =?utf-8?B?d0JiRnRIa0xFZHdranZ4dGNTL0k5S0VTN0xKTUMvUE96dEErVWlCY2hqRnBM?=
 =?utf-8?B?NWNGL2Z6eEhIT1Yzbnc0WDF6ZnFQQUZ3Y1hjUUFvdVhUWDJpaFhFa3Qxc0p1?=
 =?utf-8?B?bU14emZWZExuR212eDhtbUxiblVkLzk3R2o1VUpRemd6cmZhRnZ0Z1Q3eTlU?=
 =?utf-8?B?ZHdHUUphU0MvWHFQbzV0b3pQU3hXUE5jVTNVL0hpNGpnVEVidUJsNzJOa2xn?=
 =?utf-8?B?cUt5WTBRVElGc25wMFg2TDJ0ajV4aWVsWmRza29HTU1OWDlmdTlwaXRKb05t?=
 =?utf-8?B?ckMySWMwNHp5dDduZ3FycVFQQXpEdjlLUWZTMldnUkN0Zk9UU3B4OFlrVnI2?=
 =?utf-8?B?WXlGSXhVb3ZhVXZnUXo3Qlp3aDRMOXpKNDZhUE1WZ1NkVkhRNG90QUs3Rllr?=
 =?utf-8?B?WlNNZC9LZTc0WGJWUGVCdmU4U1BFS3Y4dksyRVZ0MHBWV1pVNXo0c3MyRU9U?=
 =?utf-8?B?K2ZIWUtsZEV3SnU2K1U5cUxTM0JhM2ZlN3BON3cyK3Z0eFdMM2Q2SnVOT0gx?=
 =?utf-8?B?bzEwc3JiOFU0cmh0Q21VeFQyempXMXp1NnRybHRJVS9HSWtrL1BHOGljenhW?=
 =?utf-8?B?eXNnSUJtYUFuRDBZRi9WT1A4TW9UUkRobmNHNUdFVkJ6S3o5Q2FnN3dPZk1j?=
 =?utf-8?B?RHBJSjdBNzY3UXBtdWk4MFozUUZ5QzNaRml5d1diNFdic09Nd3dYM1I3WFBi?=
 =?utf-8?B?eEdhOS9YNUE2cGNhL01JdDVVOW04Q1EyTHVKWjNQb0lJMkZWWFYvc29NQXJB?=
 =?utf-8?B?OGtrcThqMXM1dHBOdkNGUmJ0Z3dDd3FzWjI0TE5qRlRKMkVTK2cvNitpMG9B?=
 =?utf-8?B?bnRJYXBJZFR2UVQydzRleTFhWVVsUjVqaWVNbkxHdDBudXdjR3VveHYrQUV0?=
 =?utf-8?B?bzFJSmpmLzN5dCtIdk16R2FSK0hKcGk4RUVHWFJ2VVJtOGFLWllYbDNaR2xY?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d46803b2-63c6-43ba-32a0-08da748206c7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 12:25:03.8384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FthEuOXXyrDHaUbrcaBGIcyhJtrunbr6FcI/zme9dVN+S/IJ84a1X0k2egrwPyk/YptzimDfa3xZHUyGb8Taij9tKkVUH4SihVLwbHjY3Cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1360
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
Cc: intel-gfx@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani, Ville and Imre,

If there are no problems after reviewing this patch series, could you 
please merge it?

Many thanks,
G.G.

On 7/22/22 3:51 PM, Andrzej Hajda wrote:
> Hi Jani, Ville, Arun,
> 
> This patchset is replacement of patch
> "drm/i915/display: disable HPD workers before display driver unregister" [1].
> Ive decided to split patch into two parts - fbdev and MST, there are different
> issues.
> Ive also dropped shutdown path, as it has slightly different requirements,
> and more importantly I am not able to test properly.
> 
> v2 (thx Arun for review):
>    - reword of commit message (Arun)
>    - intel_fbdev_hpd_set_suspend replaced with intel_fbdev_set_suspend (Arun)
> v3:
>    - new patch adding suspended flag, to handle
>      https://gitlab.freedesktop.org/drm/intel/-/issues/5950
> v4:
>    - check suspend flag also in i915_digport_work_func
> v5:
>    - added patch blocking FB creation in case HPD is supended,
>    - added R-B from Arun to patch 3, thx
> v6:
>    - finally, after getting direct access to bat-rpls-2, I have found the source of last WARN,
>      intel_fbdev_hpd_set_suspend was not called in case of deferred setup, fixed in patch 2.
> 
> [1]: https://patchwork.freedesktop.org/series/103811/
> 
> Regards
> Andrzej
> 
> 
> Andrzej Hajda (4):
>    drm/i915/hpd: postpone HPD cancel work after last user suspension
>    drm/i915/fbdev: suspend HPD before fbdev unregistration
>    drm/i915/display: add hotplug.suspended flag
>    drm/i915/fbdev: do not create fbdev if HPD is suspended
> 
>   drivers/gpu/drm/i915/display/intel_display.c |  3 +++
>   drivers/gpu/drm/i915/display/intel_fbdev.c   | 12 ++++++++++--
>   drivers/gpu/drm/i915/display/intel_hotplug.c | 11 ++++++++++-
>   drivers/gpu/drm/i915/display/intel_hotplug.h |  2 +-
>   drivers/gpu/drm/i915/i915_driver.c           |  4 ++--
>   drivers/gpu/drm/i915/i915_drv.h              |  2 ++
>   drivers/gpu/drm/i915/i915_irq.c              |  1 -
>   7 files changed, 28 insertions(+), 7 deletions(-)
> 
