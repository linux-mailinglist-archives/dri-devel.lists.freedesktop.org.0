Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFD55EABD0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 17:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22B910E6FE;
	Mon, 26 Sep 2022 15:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAD110E6FE;
 Mon, 26 Sep 2022 15:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664207911; x=1695743911;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XIS/7qoPBwgwj5RDVOsEB3OVK0DpoBgb/TIQ3TQ/td4=;
 b=KVAxLC48QmNf8bcpYaj8Gm9HGiIs4nt2Qs3BE6IyVA2RJFa6CH3iIw60
 ozHTpbHh2erjxalXq/CWsNG7DWqNHK5Ct4csaa5SBMKMyjxRMdLW3blmR
 Y7M4EibUGRwgWUQII6DQzyfNJGEXoY/mhxODksdp9qZAM4W2fU1mmb+RT
 aDkE5OoxV8ocLbq90VcnhFfxyvg3vrpNa/y+N9XT4yB+RdJwrNccjFSDP
 +POnPgFbWIoAabHI64Ig43/qFRWk0OmFSYmm34pSj2Ux8u23G7+XN7H/X
 YkjAX0a1k/icOFdsbqpxf1CcLhrS8emO9hoFwnrQ74Ozr2CP+Uvjm8fvo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="281439749"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="281439749"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 08:58:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="710168897"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="710168897"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Sep 2022 08:58:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 08:58:30 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 08:58:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 26 Sep 2022 08:58:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 26 Sep 2022 08:58:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5PajHMlgv8yx5w/+KzXMN5gOJZYGkw/8dGQ8dYD6pNi16Lt7s2cRcLw6QIoR0pzhisZgu+LV0TqAQaMira11fNx0hcEdaOH8QzUm1USaxXYuEe0u69DM/v5CBktgCedDUDk0MbfTdxLJyDGedW1SiX7UHKlHU4A2RvsUCZuBDWXZMAprU+XreJQWqSG7Ogc1BKdDNVrrzqP9gtq6l3GWBxDvw0MGDjPoghJ+zKawTdf4CH5VMnm8/xDKt84wUpJD1tJ2bCK1xQIVGhyupf/00xlKRh9Q+BTbwnNU9/T4+fej2StSB63nrW4b9/jnZnT/siwcG5SsyxdvPLqiWFmvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXER2aYRJhXgQnzPlQnifIqd6dALLVMsF9TOYDXG8Sk=;
 b=BdUO2lR1VtIpq6MVvtKHLunPPyaxaV6R2zSVmW5p6PAD0LPSYrLWGozgRY0c4ZqpBkZjy9c1MOeaSDeYCezMr7kdlvI4EM4vfWF020nlZNS7lEi7nWISZREbJMwU3cnBQfDfXRSXzs0r0h8/mz6UGjxrT4p/lrh61CdtwMiLDb1/xqdVQ/rbC3LGaq+YEuanyFnlUAYlDIfenZYYMQD2BLdY8AJPykZkwxFZfxI4gjqkeQM+TUCgIJEYDeIVAEGA+WPLEjUXwJDdXcUexghxOVk0emWTxok+gMJDKDRQ2vlEbYM14BtqRihM2YNGhMqC+BVr8biLSouWYeD52cSYlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by DM4PR11MB5342.namprd11.prod.outlook.com (2603:10b6:5:391::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Mon, 26 Sep
 2022 15:58:27 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae%7]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 15:58:27 +0000
Message-ID: <06a907d2-e976-ed8a-bfff-277c835d9ab2@intel.com>
Date: Mon, 26 Sep 2022 18:57:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v11.5] overflow: Introduce overflows_type() and
 __castable_to_type()
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <20220926003743.409911-1-keescook@chromium.org>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20220926003743.409911-1-keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|DM4PR11MB5342:EE_
X-MS-Office365-Filtering-Correlation-Id: 264057b1-37e5-4b7d-2ae3-08da9fd7f32d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FbW9krLSJeODju4/i/mXW2DkxTqprvtv8UzKuzbWGKRT9/f8txNBZIRIPAvVvevxMV3LOG1VtsrNGq3WOsxswp44rJZRPe2vRltwxaYkPwRYF2PgtT2igFA1R8NgAU+c65Pu3SzPaC5u0WKy8Fmf325FDzExxUp9ctXIqfULm1xsmZ1vxQCKDIwuCjJ52B2UXrAMXK5EsLAbPZqkzGl3ZES7HXiEr/9Dx1vJViE6uRsnbO4l93b6tXIqcYBu32nek50K3m3j7De4Wch45A9k5bHpZNjAdAC+rq5P3B6Ri0ZCvvE8pvpU+APJsgBu3yOgh16wyjPIvLK9jKtrpP1Zln3gxAUmSRgCr/Mgv+MjuDGGJdx2fgqoKy0bVrnUd7zQJSufRuqIpejCtSIWH9EOflfMLh99WOjyFGMdz1OC4Yha+5zNBYXw141hXiLeATHtnA25kpnB4ts0plxPa6tpEyFvvYL9YZqsTRjCC+vQz86MEaglsdq4dLEL4ZQXwJVK7ulFKET+JWY9zw5zxkKQWUP178ByL60No4KgI2Sy8pvur2YE+fKEn1L09TUnR/bcUY7qmuLE1e+1vzkZE5efobubiFcDlF4XZ/ia4iPovx8H0aEyI2vrOK0ThFEjrkhkyuwSnP72tUU364K60AD49qA/P+D4iXCv0Bf24cswkpyzI/2YdNFIVlXxRj0NxkUMIXVTPnZ8zkbQ1ncy9WDKHDl7rbuZuO1BWuOc0wWzppFulgLiXPBqOAkhdLo8bIkMEJeAukbYI8uMdLTp31vzNg1EOw/ZEo6sECp0pdU76WZRzzDNxZLcVLudqcavbyuM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(396003)(39860400002)(376002)(136003)(451199015)(26005)(2616005)(53546011)(6506007)(6512007)(31686004)(38100700002)(82960400001)(86362001)(31696002)(2906002)(478600001)(6486002)(7416002)(5660300002)(36756003)(186003)(83380400001)(966005)(6666004)(41300700001)(8676002)(4326008)(66556008)(66946007)(66476007)(8936002)(6916009)(316002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3NTYlV5RmQxUk4zeVN2OU1xdFVZcjlrU1FJOUppeGM4b1ZlNCtCRXVPQkNY?=
 =?utf-8?B?bEd3VG5lRzE0U2V6TnlTNFlXcFJVZndCU0tDVUpySHpsVHQ0WjhFdUU5bWRv?=
 =?utf-8?B?VWpMakl4WGd0M28yWnArOWVtVU9CdSs1VE8zSlZscU5nUGtmQ0tPNjlZOFJH?=
 =?utf-8?B?Tjl6UW9kekFjcVh6ZmRKbittZnhRWTFuSE1OWE9Sd1NwdERyUU56dkdTdzgv?=
 =?utf-8?B?aS90enVEK29tOW1ySURYTGl1NmFpeHdKZzBOOG8zb1JqVWZmYnN5emZNQjVq?=
 =?utf-8?B?UUNJczlJckN0aGpvemZMbmw1Ny9OSFB4bzFyUFk4THlNVHZUelRhaHZoSHJa?=
 =?utf-8?B?ZGhidVVMWm5xR05QMmg2aW1ZNnNrZTJZM0pWQVZNWU1vL3JpVi9ENjJlQmd0?=
 =?utf-8?B?L2dRZGxpRGUyaitqRENIVGZ0bkFKa0JYZ24wZ1JPTVRQaWJ5bm8xejFnM3lj?=
 =?utf-8?B?N2lKWGpZdEhSN0R1aVFEK01jdGZ3Q3k4VWNnRUE0U1dYMjY3anpOQUdjUFJK?=
 =?utf-8?B?RzJtYXl2Q01KN2ZXWkV1TzNRNUExTlhzZWFHUjcyNW00Q2FoUFI2enNTdGwv?=
 =?utf-8?B?V2p2aWtNSU5sVVlMUUFUMkxadW1aRnVhS1dtTm0zZmhRaUR5UHViSUxiYUZZ?=
 =?utf-8?B?Z3ZpVTV5Y1ZTbVVEeWVYTU8wb2pEeVRDaHI5N212c3JQdENxeFBYUzRJT2lp?=
 =?utf-8?B?TG9FM3RRYjdCM1JBTmtPS1lnbUlaOFVQU3JGRlk5bnZSSTJlWUdlVWNib05n?=
 =?utf-8?B?TnAzaWJBWGZ2eFBNMFE1R2VzUDJtaDFTb2JhMWp4cWtYcHJGZkF4d1FCTjdz?=
 =?utf-8?B?RzNjek5ySlFvT3RlZXQ0TGplc3NvYk4yVlFwZHZrSDhzL0JEdWMzOXBUcjFn?=
 =?utf-8?B?dFpnZ2JyaitxbWNQMk1nQXdWMHVBQktPNXQzMjE1bjNtZmMxdWRINjNFME1s?=
 =?utf-8?B?MFdXc1lBcVMwcC9VVFdxZkk4Rko0SDJmd2ZoL1UyRVZDb0lCMzN4TG9MdmZS?=
 =?utf-8?B?UVU4dmhSOWFQR2lJNUFvZ1RVZVlmMHovN25pNUxJV1B3aU1kanBLSVQ2Umpm?=
 =?utf-8?B?ZDViMzNNVUlCMEUyR0l2eGZMTTFzcjNLeDdjNDZ3NUJ2aHRvNi9sSG5jRjZw?=
 =?utf-8?B?ckZoMXVKc3QxWXh3UVd6VGV4anNLVTNGYTdMaHNKbzMwcjVrcENyalVuaGlV?=
 =?utf-8?B?b0hzZ3JLSnFkVVlYdGdiY2FQaWpUbXpGWFhXVzZPcnFScDM4SHRiS2c5TXBI?=
 =?utf-8?B?Tzg0Z29zaWNiWVdzR20xT0RhS1lPaUJLcTVJMG55aW5JMEVhL1pJUnhxQ3FB?=
 =?utf-8?B?RkNVL1ZkMUdBYTFkVlY4WjlSM3h2c0VHUml0YVhLZmo1V01RMnlkb0hrbUZ3?=
 =?utf-8?B?UVc5SGdpNlNhbUhlbExSRUdOdHowSkVRYmNxQTBLaTc3aElBeG5Gbk13eWJa?=
 =?utf-8?B?Rk1PSkZoakVKRklNSk1Lc3Nad2pkb1p4clVDL0MxVEtkbTlwREtsWThYTlJE?=
 =?utf-8?B?ZjhUOEJJbWtDWDk5VzFzMWVrNkZoWWhKbFl5eWMvUE54VjhSZnpNc0tOM21X?=
 =?utf-8?B?aFh6cXNyMHpsbmZmZkhaS0dvQll1c3A5UEgyQWJ0enkxeXdiVzlLRVdYaVRs?=
 =?utf-8?B?S1M0Q0o5czloSGxZVlNpeFdUYTlNTG0wZWJtRHhTWDZFeGdIRVdwY0RRNk5i?=
 =?utf-8?B?ZzA1TWlRVUNjN3pFTVh5RVlJanZqSUkwZzBSTzJPZ1dEazc1T1RZQklQUjU0?=
 =?utf-8?B?NG90c3lSRjZLSzVkQ215cVhKTXg5TVlxN29TOVI4aHBFQ094bWZ5dmlpMFRD?=
 =?utf-8?B?SVRoaUZBWG1QSU1zQkl5bkJSK2RJT3dPSUdQcU1ZcEExQ1RySndaUkxrbU90?=
 =?utf-8?B?UVRuNlZZSzZrUHBDNHZZZkFCbEtudTZVamE1c2pJd1ZxdDhUcGFOYWhLb053?=
 =?utf-8?B?Qis4aG9MUGpTbDYxTlVFNmpncUMxSWR5dzRvRUM1MGNQUkJPZnRFNCtYS3Z4?=
 =?utf-8?B?K3pCZGtDVTdBNENTMVc0L3J0YXpWeUlXNkpTMXp6YWgyUTdEQ0xuVzRJVGRz?=
 =?utf-8?B?emQzM3VYVWliODNieTR0RHFjTmVRUWJSdFREYk10Qi9hc1lEU0pLWFlDaVpo?=
 =?utf-8?B?ckVBQ3EyNFBTZ1lDRnlQZEVCKzc2QTRLQzF3dXVtWGNTTm91Skw0anB0bFYv?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 264057b1-37e5-4b7d-2ae3-08da9fd7f32d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 15:58:27.7798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rp57YfzHbe3ryPKEFb9n22squkwmwmpOzOm5g+XTJLzBIjIOBlBWUqmhX1EP30G0dKDDkcNdTISEx/7XroCustvBfPe+BFpnIWPfrgUIrAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5342
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
Cc: Tom Rix <trix@redhat.com>, Daniel Latypov <dlatypov@google.com>,
 llvm@lists.linux.dev, linux@rasmusvillemoes.dk,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 linux-hardening@vger.kernel.org, andrzej.hajda@intel.com,
 linux-sparse@vger.kernel.org, matthew.auld@intel.com,
 andi.shyti@linux.intel.com, airlied@redhat.com,
 thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 mchehab@kernel.org, mauro.chehab@linux.intel.com,
 Nick Desaulniers <ndesaulniers@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 Vitor Massaru Iha <vitor@massaru.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/26/22 3:37 AM, Kees Cook wrote:
> Add overflows_type() to test if a variable or constant value would
> overflow another variable or type. This can be used as a constant
> expression for static_assert() (which requires a constant
> expression[1][2]) when used on constant values. This must be constructed
> manually, since __builtin_add_overflow() does not produce a constant
> expression[3].
> 
> Additionally adds __castable_to_type(), similar to __same_type(), for
> checking if a constant value will fit in a given type (i.e. it could
> be cast to the type without overflow).
> 
> Add unit tests for overflows_type(), __same_type(), and
> __castable_to_type() to the existing KUnit "overflow" test.
> 
> [1] https://en.cppreference.com/w/c/language/_Static_assert
> [2] C11 standard (ISO/IEC 9899:2011): 6.7.10 Static assertions
> [3] https://gcc.gnu.org/onlinedocs/gcc/Integer-Overflow-Builtins.html
>      6.56 Built-in Functions to Perform Arithmetic with Overflow Checking
>      Built-in Function: bool __builtin_add_overflow (type1 a, type2 b,
>                                                      type3 *res)
> 
> Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Tom Rix <trix@redhat.com>
> Cc: Daniel Latypov <dlatypov@google.com>
> Cc: Vitor Massaru Iha <vitor@massaru.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-hardening@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>   include/linux/compiler.h |   1 +
>   include/linux/overflow.h |  48 +++++
>   lib/overflow_kunit.c     | 393 ++++++++++++++++++++++++++++++++++++++-
>   3 files changed, 441 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index 7713d7bcdaea..c631107e93b1 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -244,6 +244,7 @@ static inline void *offset_to_ptr(const int *off)
>    * bool and also pointer types.
>    */
>   #define is_signed_type(type) (((type)(-1)) < (__force type)1)
> +#define is_unsigned_type(type) (!is_signed_type(type))
>   
>   /*
>    * This is needed in functions which generate the stack canary, see
> diff --git a/include/linux/overflow.h b/include/linux/overflow.h
> index 19dfdd74835e..c8cbeae5f4f8 100644
> --- a/include/linux/overflow.h
> +++ b/include/linux/overflow.h
> @@ -127,6 +127,54 @@ static inline bool __must_check __must_check_overflow(bool overflow)
>   	(*_d >> _to_shift) != _a);					\
>   }))
>   
> +#define __overflows_type_constexpr(x, T) (			\
> +	is_unsigned_type(typeof(x)) ?				\
> +		(x) > type_max(typeof(T)) ? 1 : 0		\
> +	: is_unsigned_type(typeof(T)) ?				\
> +		(x) < 0 || (x) > type_max(typeof(T)) ? 1 : 0	\
> +		: (x) < type_min(typeof(T)) ||			\
> +		  (x) > type_max(typeof(T)) ? 1 : 0 )
> +
> +#define __overflows_type(x, T)		({	\
> +	typeof(T) v = 0;			\
> +	check_add_overflow((x), v, &v);		\
> +})
> +
> +/**
> + * overflows_type - helper for checking the overflows between value, variables,
> + *		    or data type
> + *
> + * @n: source constant value or variable to be checked
> + * @T: destination variable or data type proposed to store @x
> + *
> + * Compares the @x expression for whether or not it can safely fit in
> + * the storage of the type in @T. @x and @T can have different types.
> + * If @x is a conxtant expression, this will also resolve to a constant
> + * expression.
> + *
> + * Returns: true if overflow can occur, false otherwise.
> + */
> +#define overflows_type(n, T)					\
> +	__builtin_choose_expr(__is_constexpr(n),		\
> +			      __overflows_type_constexpr(n, T),	\
> +			      __overflows_type(n, T))
> +
> +/**
> + * __castable_to_type - like __same_type(), but also allows for casted literals
> + *
> + * @n: variable or constant value
> + * @T: data type or variable
> + *
> + * Unlike the __same_type() macro, this allows a constant value as the
> + * first argument. If this value would not overflow into an assignment
> + * of the second argument's type, it returns true. Otherwise, this falls
> + * back to __same_type().
> + */
> +#define __castable_to_type(n, T)					\
> +	__builtin_choose_expr(__is_constexpr(n),			\
> +			      !__overflows_type_constexpr(n, T),	\
> +			      __same_type(n, T))
> +
This name is fine, but I prefer the __same_typable you suggested as a 
comment in the previous patch better, what do you think?
( __castable_to_type(n, T); The macro name seems to handle if type 
casting is possible to the second argument type from the first argument 
variable. )

G.G.
