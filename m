Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0074347352E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 20:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83A210E8AA;
	Mon, 13 Dec 2021 19:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568E510E8A7;
 Mon, 13 Dec 2021 19:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639424701; x=1670960701;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SLGZATRFR/gnGL96L3VBs4ID7oJ2p8+tWemuN1QdByQ=;
 b=luYRMw/srVozLEZGWLkQOSI39mXQnNJeGXwQvSyo6/iUy9OmL21X5bWv
 KbOijafgIqu/4SR4u3DWTQ/D48hcdSWd/IKm1sAAwBS393W48qnvk6z5s
 0ddZv9Uhil++KbmeV2NUKJbY4XgkaRijMi5jrXIz/D5EtsR2WViqHjxNk
 Jb8CIbBrMoQk6Tvo6CHYFB3+TgPYzER/WkLzQ2+v0ifZOztg02MvHwFYu
 EV7kxcEzliLx2ooPmsMuRZI0AycNQlFmdTCkx8Oh7yoxP0+Nee50e7dR/
 lwiSTjEMNmXkBQFUullNVGKhGhPy5t8X5Xd8AgjhZixCzLVIPUXyPIHmH g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="236344394"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="236344394"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 11:44:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="463503591"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga003.jf.intel.com with ESMTP; 13 Dec 2021 11:44:50 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 11:44:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 13 Dec 2021 11:44:50 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 13 Dec 2021 11:44:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVOwOLjbVmB6/neQFQ2kKeA8SPGDYwrKUEUAV97vOKMJSNm04UUOEOlfp8V13Xt+27r224xgrtOTvBJpC5yKlDRgnJTEVWGHHM6rD3fwllgTB9TKbbxpXxqP4xrMWo8FFyr/ozADNcWBrfwZHXovkwrCx74BiGSLLcaOm89Zfc5i2SuhX690WtHZsc51caZGD41gO+AqEr1GmF9hXkXdfDecMJyiZyPFKWBPPaL2GK6A+Jjjz+P++AmfX7lpftLwv7N2HCgm/oj8qogaKu8ThAEDMB1W83PRIDsyAQqYkwORi0Nmb8SxYttqIxy400jaPS0PrL/VMH/dPt3ySY/YoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLSjx1rCUnoZkoQni+adFcr6tn9gpdlGPOxk/44EDGk=;
 b=W1h1+UgcEYgoeKXv9li5sgAnURaY/OVKBjreXRUwTgEwgmw93XHrFClV+XcIxFmQ/s2HpHQfAbGs8YySSDJvJSTWUzkJK5CkrhpMPdDDkF04hn0xRBJTmEkw2G0lfieF4qO3+kWHX5OmGsBiDZ0yY3y69cicuWmgfFOPTV7x2YRcY4QyHEXg401Pb3byIwDovllvGd11ZaWUu2IKQxtr2jvFnN7GC56GNJyoNLNBI4yZuUqSOuB+ZBfkxqvRIBfAuYfjDL9BSxuo5xR+Q/sLbUncm7LO6SIDgV2Ad95WMnRlYuP3r4S27QAk9DA6ADe+7l349ab+ogdJQ8rBqz+I9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLSjx1rCUnoZkoQni+adFcr6tn9gpdlGPOxk/44EDGk=;
 b=hvhFkaOqbgJR+IiE2RKSX0bhE9xFYeHbGjQhtJe4s++zG6oZCPkLkUEp+hsZhmJhzdP1YXsUvi/eLaTdFlM4pXmtbRRhmGZavs+0r8hmYB06RnZrg43EV8XVCsopYZIpiuYjc5pAGvLdgp0zx4u8qBi8yNJoM4tGFV6zQkMzXco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Mon, 13 Dec 2021 19:44:48 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::d91a:c903:855e:5f24]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::d91a:c903:855e:5f24%5]) with mapi id 15.20.4778.018; Mon, 13 Dec 2021
 19:44:48 +0000
Message-ID: <54419919-9227-f4da-cf54-61f5d8c39ffc@intel.com>
Date: Mon, 13 Dec 2021 11:44:46 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH v2 0/3] drm/i915: Support bigger GuC RSA keys
Content-Language: en-US
To: <intel-gfx@lists.freedesktop.org>
References: <20211211000756.1698923-1-daniele.ceraolospurio@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20211211000756.1698923-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0075.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::16) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecdcffec-5a40-42ca-ed7e-08d9be7105ab
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM4PR11MB53890D9F81B6118DF5CE103BF4749@DM4PR11MB5389.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ATMToBe+jbimFIF+lSjS3Fn4k+Pz0i1L1jIIo/2OGt7/qQhUmA2Y42HeXLCDU3w9gpU7jQbMvi7oAp7XHjDcc7ckB12ozSEiKzCA4TuxtdvelbCwr9b+ZFrkh8Y7c0FlbU3mvn6xuNlfTmRMSjOdZoYWpBduKU6rhN8LB36azlN/VCZxCxdEvsMgsy6gkPC4F05szkqPoUme8gItbetV6yJ2VzLrTWAKOPcj/p36lcdOazK3kyz9Kb+aIj5TihTcRVkkz8Stt/9JMEcnzuaeTi5+SvJygsGFR5IrQ+ICFAz/uChyGDdinWRdIchivnSzF27qOb6XOSIkYn32+SU3YbZuCnByA0pk5SjTVN3w1ctGcwJjN2GLyjNRFSet7g1ao/Iuj+1N1EAVHd8OJyl+qfExUIoOrg5WHT7V8mNEoRp1rkLPikgk/ltn6dDLZgXxm3Izig5ByH1KWZ8PmW36wceA1IpKfLYmYUUm8uVBoZc73PgHN9+9Gh19CewzsJdslYenn2m+GtmHXtM4rLjuuLd7SvFdkysFXJVE03E5UbIuJ9rf6vEyXFvhyE6RT/HJSAjNPZGFDoVYSsHlemZUs3JHI3t6utod6HCD9pjCXLOLbjraLtW9SIEByWWXHZxbPQmITwSvhA9+jEMv4Muw++v1aCS6OktSLHHRn63VFH5KcGcFvhgzUmIx9sYswTIdNThcGGsCuYFAHt+Xrjpg2OYxxOKlfwap7nZ5SUh/EfBzi/abGUXR87fEJKKmSdBqKMS1XjjtOsPE/OT97gakIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(2616005)(86362001)(316002)(36756003)(66946007)(4326008)(450100002)(26005)(2906002)(186003)(31686004)(8676002)(54906003)(8936002)(6486002)(6916009)(6512007)(6506007)(107886003)(82960400001)(66476007)(31696002)(83380400001)(508600001)(53546011)(66556008)(5660300002)(135533001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDhsWndFN0laY0kvSFIyVm4raHN3YU1OaUVtMklvZnRyYS9HWHhoQ3doQWhn?=
 =?utf-8?B?cTVSUVpwYk53dnRjVHlNdHFNVHU0QVdDTDd6cGhvY3pqUi9OTGFuVk1oMVhN?=
 =?utf-8?B?TUZDYUg3cGF1ZzRSaEh6VXI5b3FuRTlmQnMrd2pYcHdpajk3SnphRjYzbDBU?=
 =?utf-8?B?NmFmOUhMdUNhQ3dSN0s4THZmSVBKTTgyYjdPUktWNjB1VEVyMkZjejFDVUJN?=
 =?utf-8?B?bTFPQXA4QmUyMTB3MDlDa2gyQk5ac2VkOVlrWmRjOWswVkJxSjg0b2NkMDRC?=
 =?utf-8?B?bG9QY1RPc2UvQk9za2FRVmI4Z2dkc0ZMUlZvRUF5WmVRano5eXhBbCtsZHVD?=
 =?utf-8?B?LzJCRHU4dlhYZ09vSU5aUDQwQlkvRElPa1JPV2h2TytUVDM4MEFGUFN5OTE2?=
 =?utf-8?B?Y0NVMTlMKzIyWldqZjJieXZwazljVTNLREJKaWhNUUhDakJCWE4xVUJVMmFs?=
 =?utf-8?B?bUtSaE9EM3c5a1A0b01QN29ScUlZSFhQMk8vTzJTL0tieFZzdXVuVis1MW1t?=
 =?utf-8?B?dEtWVWdTVGZjWVJRZExZQjJIRTUvWXdNOVRoZG03RVNDdlhqYTlrT2VtRWNY?=
 =?utf-8?B?dDQvZ2RzbmZlUmV6YkdWc0RjRG5TMzVCNldwNGw3YklyKzNQL0JFTkdueDIr?=
 =?utf-8?B?MExaa0tlQjhHc2d4TjlYeXYvc3kyY0xjMThHTzk4VXdiWklRQjdGcDRsa09n?=
 =?utf-8?B?V2YyT0VOTWlDRmJGNkhEaEU3UFpKTEpHMVh6cWhYYk5HbVpCOW1DREt5S2Z1?=
 =?utf-8?B?aklpc29vUXVEcDNSTW91TS9SdzE4a2lXSmNTVkVjVVJwcmtFUmZKY2FLTGxn?=
 =?utf-8?B?dTVBRVl5WGJDUlA2S2Q5b1Bmd3lIcWkyTkkxT080TnZMK0dvQmRGTVdpZEd6?=
 =?utf-8?B?VEh6YVF6dis0S0VkSTNUd1NrQ0tZbkp0N3NoRWFUa25kM1JlYjJqUHd0c0lK?=
 =?utf-8?B?eC9icXRxOEdaUlJjTWJaRFhoNHZvZDFoZG5KMk5xeWxSalFKOHJZMWVrdndE?=
 =?utf-8?B?bUliYXZCb2V2eWRpdTN1bnErbTRvZXlISmJEcC9LODRmbnhIakZ2ZGxrSzdE?=
 =?utf-8?B?NnRFNkpFdHpOMDNFdE9mYUxxVTZLUmIweG5VanBVenhYSkJ5R3ZGQng2TUxy?=
 =?utf-8?B?Uk9LSmZwQnpNdFhnNk5YaWJKb0NtN29EVWFyaTUxWWprR01YTHhyTTFoOXYx?=
 =?utf-8?B?MFJyTFlKZ3BpaE5yRC9pTnNvVm05WmVCa3FROHEwakxJbGRHeFg5dTAvRWdC?=
 =?utf-8?B?RUdnTlYwZkN3ZmxkcXZ1VXhwMkVQUFRyMmd0RDVKWU9UbkNRcTc0dHkwbkxm?=
 =?utf-8?B?V2x6Q2VWMXV6d1R2dm5Ndk8xN1FpYjFqWHJUNlRyWEtrSFA0MDlNRWpIL3pZ?=
 =?utf-8?B?WnpYRjZPYjQ2SngzblFtK1RpUndtc3RPc1ZZUzZsV2lGMjFzdU81blE3Tnh3?=
 =?utf-8?B?ajhFOHRuZDJ5UTFyNGgzU1hlVkVKcTVvc1RnMnVvaWZkNkNoTCtnc1RhdXBo?=
 =?utf-8?B?QjlySmxVSWpTc3dpc2U0dDhURmlTWFh0MkxqWkhmVzk1cTQxSVZHTjMyWE9E?=
 =?utf-8?B?ZEpiWUFkRTcxNFpSZUhJZzNxcWRoZE90enM0NFI4UDdVSUhpcXEzMnlPcXpN?=
 =?utf-8?B?a2xJL2xNaEpncUIrc3N2bEdhNnJNUXdXcVh1ZEVONmtvY1c5UkFNdUhlVmNF?=
 =?utf-8?B?YTJSLzB3OHR5Vi9KRitTV29Fc0lBa1VwNW9ZMS9ScXdnRkdvNkZ1cHVtTThS?=
 =?utf-8?B?ZEdlRmRTcEtGTGlTZmk5WFNtMUZUWkxZWlpUMnpSZnhkTGJPcmYwQmwxamxV?=
 =?utf-8?B?bENnYkdPUmErMHQ0bGQrSi9Sam13OEhiVWhobDZIVjNDNEgvQ1BRcFpjZHF4?=
 =?utf-8?B?bkwva2lVdkJvOWFuQXNpNCs0SEhaM1JYNGM4NEZzZlFlNGZkYldSR3F1L0NJ?=
 =?utf-8?B?MitjalRQRzFMYWZLUHpqRkNXQ2tFL2tHNnBOV0Fwa0tKR0FNZ2ZyTUtzTHB0?=
 =?utf-8?B?Qy9JbzFUbkFOOGZDSHFiMFhmWDhOWm8zdE96bEJWaHgyY3lFYS9iZnhCb3cx?=
 =?utf-8?B?bEFpaUNNN2oveUdnTEszVkhYWEFIUnU1OTczMFdHR0U5azIzWUZLYjljWFJH?=
 =?utf-8?B?RXJZY2k5OEdML0diMnptVXBKOEFwNFByenZwTXRybGpYUnJNR2Qrd0hlUTUw?=
 =?utf-8?B?NjNITXJwRUUxQnRwR1lLTnNYRHBYWWlLK1JWcFdScHdvNFdNTmtGbEh0Mmc1?=
 =?utf-8?B?SExvSVk4VWNiRjhnYVhYMGJKWHR3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecdcffec-5a40-42ca-ed7e-08d9be7105ab
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 19:44:48.7245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEPTGF+WP04NhK/X+YcUDO7R/W6wW9RdeY9XwXksAC7ZMAfZgfoRQ/iAk8lIdBs+I+1yTiRCEW/5bNnvtZybCyBtaiNsljopLbt2ZjCFt9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5389
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
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/10/2021 4:07 PM, Daniele Ceraolo Spurio wrote:
> Some of the newer platforms use a bigger RSA key to authenticate the GuC,
> which is provided to the HW via a ggtt-pinned object instead of mmio.
>
> While doing the changes for this I've also spotted an inconsistency in
> the error status of the fw on init failure, so I've added a path to fix
> that as well.
>
> v2: clarify in comments that the expected RSA size is hardcoded in the
> bootrom (Matt)

I've confirmed with Matt that he's ok with the updated comment and pushed.

Daniele

>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
>
> Daniele Ceraolo Spurio (2):
>    drm/i915/uc: correctly track uc_fw init failure
>    drm/i915/guc: support bigger RSA keys
>
> Michal Wajdeczko (1):
>    drm/i915/uc: Prepare for different firmware key sizes
>
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 33 ++++++--
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 75 +-----------------
>   drivers/gpu/drm/i915/gt/uc/intel_huc.h    |  2 -
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 95 ++++++++++++++++++++---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  | 18 +++--
>   5 files changed, 128 insertions(+), 95 deletions(-)
>

