Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A8CA34B79
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC1D10E06C;
	Thu, 13 Feb 2025 17:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SkyL+VW8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B5E10E06C;
 Thu, 13 Feb 2025 17:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739466963; x=1771002963;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8e4BS7nefu9+FH8Fbcd0HjepgBmqXhv877MSOaj4tj8=;
 b=SkyL+VW8j7+hgvQuEJ+LpaplhYIRs25xKPriUg61eJYlF4ZgstopBxzK
 l+ccAeYusnzfaa+tpSsYs7pW/wxnmCqAyOZ3zAF+DC2ue1PbrejbtYVOM
 xQbCCWRsZH3qlEfiaozPZAwBNJJ0F+c2rLQd1Ci8985ZPeYuiuVolPs+X
 1H56Q4A8edhChZ1Eg3DMju3I5t8ks/dO8/hzUuD0wW2hgJ/luW57/ddzn
 z72ix/Mls7BkQj4JfiCsMDLhZBZaU4+Vv7KW3ArDoybdusgUx1QiW2Q9U
 TPA492LG0feNzNgixN4jX8tT/B5Ejn7TeGBt7edwJfzyog/B9jfEkpCaR A==;
X-CSE-ConnectionGUID: P+h5RuU7Qq26eW7NOCJWpA==
X-CSE-MsgGUID: oIWQsYZnRHu9cmMWPdGpAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="65536642"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="65536642"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 09:16:02 -0800
X-CSE-ConnectionGUID: RvMk15k/Rpq6EK53p8NZjg==
X-CSE-MsgGUID: 2fTCsJ7uTvu/mOpP+zakIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117836859"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 09:16:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 09:15:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 09:15:59 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 09:15:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqgxwojW8/VtawyXwmWLCbIHR7j9whKu9tppq8DHxVdT3Cf7z/2z14lINJXueNhJfx31tOIShrRl43KKpM3kfTOkTxrnR5KpgDsOICXs9KuRld6d9Bq8LII1ZyJ+HBrFQExxUzRek86D5vj5ngszBKi4XgtYMfLcN3DFKTJNmrTzT+HWiy4KfeVZGULkg2EIymmcClSN7UsLxP7miyRvkLvYwqFmTJ0XNKrrzEOnbKcwulqeo976fW96boEk+v5iIMVSyQTlweO3VXf2rtBy25fzFg+1PVXmBTrY3//QhlJJvSbZ8cAt+D4bc1Jj95WY3IkoJnjmBkzK2gJ7U/BHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1d+qLROe+9jNDKpx9pfH7m9Mkpnp/z7fOSmd5CFkF8=;
 b=avjsn3vrGOgmaC+El9kW462wyRgIVe8o/AKqDcBMG0BKL0iguSHP+3Qa6rNslU3Xle2vLqZ5i09mCPAdopQnvLH/Wzkf98ZdpsNF+FPGwUQyRFK1ii5i6Tf/y+6X2iVxTlMerBqM7YyJVNg+MDjh8IECDbBQB6Z9cToJKtXP4R0CPKapGFki8fKs83JU60o8nCA/TjRHpc4q0mIuWoDP1CR7IhlbtSkiPR5ReRqnhjfChSppM4JQ0vw+CW4Lt+kpGy6LP0HztOOshpiBDJg+qt/M/7zI4sCGHhb+RcvwmIwqSzIacz1vDoW6gX5hCcwgZr1eJzeOn9MaOvuAOLidxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4840.namprd11.prod.outlook.com (2603:10b6:510:43::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 17:15:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 17:15:42 +0000
Date: Thu, 13 Feb 2025 11:15:40 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Chris Wilson
 <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH 0/3] drm/i915: Fix harmfull driver register/unregister
 assymetry
Message-ID: <ppadgdknj2mhuwjw5dromtwicmcqy2ad2rfy7adr4ss45zjyso@7uzhe6n6tpsu>
References: <20250206180927.2237256-5-janusz.krzysztofik@linux.intel.com>
 <Z6n4nx7V2D1z0zWA@ashyti-mobl2.lan>
 <tdyxqxcuigkc54zrrue4e6nqdhczgwbhn7z4bbw4h4kgfqmata@uckh7vqzx6ua>
 <Z6y_tE7DvfirNwLh@ashyti-mobl2.lan>
 <qwgzgt7iyqrxuxhk2q7bawk7w5anhmjlqcyaayxqlxmozeb3pm@6v7l6famp3o7>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <qwgzgt7iyqrxuxhk2q7bawk7w5anhmjlqcyaayxqlxmozeb3pm@6v7l6famp3o7>
X-ClientProxiedBy: MW4PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:303:b9::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff434d4-c5bf-4d3a-7f6a-08dd4c520bcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LMNZpbEImrdtXX5Le4sYmjNkwAdIChuiCm6jx8wXf5hSrWPjtslGE22HNDVs?=
 =?us-ascii?Q?vVcXn+FPPhXA4mI5Lr1g2qqC7JZXGiCN5CbCg3wNxTP/BlU3tkntrz8S3RE2?=
 =?us-ascii?Q?QcGtq2ZJZKID735ma608qV25G3M+9HEKPFdoKYqUttPqu1vmieAPRp76UCE/?=
 =?us-ascii?Q?MfIRmSZeUSFLE4FhSxaijV3Li/Q0lS+XQZr0V1kL28ds2fKHa1WBVEH9CG+q?=
 =?us-ascii?Q?W0fHD60GMaaWgsrx+pvpIWDwDQoYRG9/x/nX/z8qEf1BA18SXOlSCC3meqOn?=
 =?us-ascii?Q?AqkIyrqzbC72GrAFP9oxMKOHlmmXHkFcbO0NRdIdHKaUqkBul+t7MD16r98G?=
 =?us-ascii?Q?e8NViILypTqeObjwdBpW2TSlWzwmQKxsAjs5Wrr1cLDavdoSp86jEune1zUp?=
 =?us-ascii?Q?2GSYl4mroF9ZKlE6b4E9k8hKuauMC1lD3luT54PfcFbFUpia+DH5lvx7vZhK?=
 =?us-ascii?Q?Wk5W7dFPcJPmoW7fM3sm76m4mvRzVUXdcJdMcGj7lcGWpkKAX8HjgtnDD+Z3?=
 =?us-ascii?Q?1wRrydBbA9vvSdfnCdmDmWVVkM94ZauLUPrFUknxVySq9OesjKBhNocVBuS+?=
 =?us-ascii?Q?KnmoSeOOwvU+mSHrnt6X9KMlnMzkgw3Qe+3y3Idx5nAN5iEBNq5JwWtq4uVd?=
 =?us-ascii?Q?YYxwcH5rkmrow8C+HiEGpBzANTDfC7J2ERtGMAllBee5mN+dWIrxk+QRVjHr?=
 =?us-ascii?Q?nCWYVaEFf/VqvPI8/iLuZals0gEMQHbq7JXPe/Ik961BrQ0dF+6tsMIkJ0+0?=
 =?us-ascii?Q?KIsYFr6LoAu3dccFKfTc+bZcO5ykzfnRbxR1dV2sieSHlkrSy4Yj1mhZ8dSQ?=
 =?us-ascii?Q?c/x59ulhLV9mgkPzBkS25Gqq8K/nvr0FBKetJDSSZcBx3E6zWLutAaSprIER?=
 =?us-ascii?Q?tF+R4PZY5/32c2w1kL4NGLX/yQik7JHNGm3deQF1VOKRdeUTsDSZzAB4JdZG?=
 =?us-ascii?Q?VBgb8zE8vhu4MTMa9u9GqO2EZ6kmTwE6uQJj7fjvdzp+hEIPzRvH5qw2a8Rk?=
 =?us-ascii?Q?MgemWnfXE+kkbV6pVKt/goxYt6txxSjJ8TsqMOIgixxXU9jZWGL7TTZ3TOTI?=
 =?us-ascii?Q?MipY723GF2WoiQrqW7RB/UqiX9wWfvuLM8x0AMpFVYL7vf9zJdA7MAUyJiLW?=
 =?us-ascii?Q?yW4XBGJiKtdGlEakIW+tSKbJcYxuNGZSWKyzbBWNhidJjWXZcREQg0WBF+vI?=
 =?us-ascii?Q?06po69t1dYZqKhPJvt2Qh80itnnSGmw6yK4qob9x2Lpx/h3pQkbfU6/GZ3F/?=
 =?us-ascii?Q?sjY0lY2q5R3NRZ8uQfPTgZH5sPVM8Xn1u0+dvs91ftMmqD6nIrwF3Fyu5s1M?=
 =?us-ascii?Q?iOgStJNTxp3M4f5pTTY1XLREEqwTvlcGo720CeiWj+QK8j1r01WXSwxQc7KL?=
 =?us-ascii?Q?1B3Kuj+TDbWGk11U4SkXjL85aOG/jPvFuw4iPFHiTgBBWw9zuQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J2ppIa/ZWr04ydOokR0NOWednzZzjDsQLZ5+MoTXw6gAwm46jmyQ5GcWCh77?=
 =?us-ascii?Q?+k2MixI2PGZ5o3JN2JTp1qy/3oW4gPAjhfBJ2W0TdI6R6TJ7pE7oJ6HEU/jj?=
 =?us-ascii?Q?LN4WldMWSecTbP/S25ffcG8coPfiH3i3juDm1JLBMlFYfc3wKsbZ5uGb2STf?=
 =?us-ascii?Q?VTMw59hJFS4VB1TNnLFQbQ55H4CLDT5VfFcLiuy2wEAz2P4Slg2y4yxj17Qg?=
 =?us-ascii?Q?eYjv2+0JBKoaxrwCzSBtjB1qRVWbdKJ+9LoDqDFMUvENPT461fJcDi/IdRfZ?=
 =?us-ascii?Q?BJdsxWNSbZIcgwRUe6ODSoHcHpdGcx66VsTf+bUaDgZBlDxwCdnmpp/M46Bz?=
 =?us-ascii?Q?cc31SHDZBlfAqrwvr5MPAl86V1LiB+BBS4ti9DJpRz58PcSaiWFEUbsCYOcY?=
 =?us-ascii?Q?9gKVxxK/l4apg+T/bYj9+k/DQ04SH4vx8mCvltTPNbz/VJznj7kLojcvw71u?=
 =?us-ascii?Q?sTMM7zB8J9hIRci7D55L9ulDWhGcaC8dM26j4M/NAvv0760ZM2fm2x7Bpw/P?=
 =?us-ascii?Q?5WWn7qIxKLJArVY3M0kdSyU5MaroHLZ7nMwFcTI2aWSVklHdJwDm9jWO0/LC?=
 =?us-ascii?Q?a3qFYOMNqFV8b60PMfPASoQ61/VG+eZ/fS5gfSuWCXy68viJ1zFar17UGC7v?=
 =?us-ascii?Q?iHj+hibrcAeUcxK9TNzJFJD4rbQ9VYOhYxjrP0TxG+fvb56txa1cjPTlT0s8?=
 =?us-ascii?Q?xbxn50l39JD6/zBYTmBRM+a7/55zAMSKb/J9DypibI94vT/0GtcfLl1zDoXy?=
 =?us-ascii?Q?dqJ/nHkLBBIJmfVp4MI9p3DHfGBHY2obRMl60s16Whkdg9n+YOTZjwkrKHXG?=
 =?us-ascii?Q?keONvueNYjOwdSt/mAb25pA7nUbZ8DutFgQ5zSEoU2ZAhHX7fka3Z25werN4?=
 =?us-ascii?Q?jiie0a97O4puFXrtwhVP6RXsfLDSpUUNedpi8ADCjy1RGuAMsJG4/tW/zEpm?=
 =?us-ascii?Q?bCTxLYKoeMdD7sivcKfLwgRUjOMkQkyjEd9yIuuWoMQ065FTrximKrS6/fXb?=
 =?us-ascii?Q?KgBCG3Kj2uNCn61ng7LtheCy1P9+zQZIVz69iD+Mt95EaMViu6l/1HdO/b86?=
 =?us-ascii?Q?q/RJd0aVHMlpKElXZ/2fNu2CshQrRBWEMKdSuLhzngF66ZD3fVHbDW3Sdcak?=
 =?us-ascii?Q?qy+XEEXqEK8KYlG9EqNuJaHKiUDoDYz9VkrDTbkZzvh1Ll4X0UMGixelIRCe?=
 =?us-ascii?Q?IMPmyV9opXAuLx3Sa4dXvw4an+vjiE9VJ1s7vAHqjJK4r/9OfOJIhoRAmwxt?=
 =?us-ascii?Q?FIE64MAry/1oKGovuH9CAqSnGtYC9T+koeX85RZGZM3bjugurdj7Sw+y1cjN?=
 =?us-ascii?Q?rT/OGQqPnPz4eeLAM9pJgrU36HSaumBe+ZQqwbvqH91YkWNq+LUfErToBtCp?=
 =?us-ascii?Q?w7WYZ0Js7edr694Rqjp9Om+q6xMa3fKvrHKK6ARJb8FDGPm6UQjAd1HqYIIG?=
 =?us-ascii?Q?AxqtJWKr4RAzj1uyqCR32SOgDAyi9PPM4o5KBHaOGwcIJZGNsMNMphHtfJWF?=
 =?us-ascii?Q?nsr4s8VA918AdNO+ZP+H2QvmP1IqkQQQB6kL0wyAc1g8w29zUI1mLZ5KH84l?=
 =?us-ascii?Q?lbVKlsiVWAUvq9rGXZl1lDMfzWqcb1ucYeLwHT/E5nMug84V23og8dLbp1x9?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff434d4-c5bf-4d3a-7f6a-08dd4c520bcd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 17:15:42.7853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYwv1ooeHMQGzzKoNpn/Z7cjJVzGe0nTn/Cm2Ki9sIsZjvERxK0SzsJYIeHYOmeGniDmdCBWL3l/fbXH/T0s4hBmmdg+BK/Jq26dlH3R9J8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4840
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

On Thu, Feb 13, 2025 at 03:33:08PM +0100, Krzysztof Niemiec wrote:
>On 2025-02-12 at 16:35:16 GMT, Andi Shyti wrote:
>> Hi Krzysztof,
>>
>> On Wed, Feb 12, 2025 at 12:50:17PM +0100, Krzysztof Niemiec wrote:
>> > On 2025-02-10 at 14:01:19 GMT, Andi Shyti wrote:
>> > > On Thu, Feb 06, 2025 at 07:07:38PM +0100, Janusz Krzysztofik wrote:
>> > > > We return immediately from i915_driver_register() if drm_dev_register()
>> > > > fails, skipping remaining registration steps.  However, the _unregister()
>> > > > counterpart called at device remove knows nothing about that skip and
>> > > > executes reverts for all those steps.  For that to work correctly, those
>> > > > revert functions must be resistant to being called even on uninitialized
>> > > > objects, or we must not skip their initialization.
>> > > >
>> > > > Three cases have been identified and fixes proposed.  Call traces are
>> > > > taken from CI results of igt@i915_driver_load@reload-with-fault-injection
>> > > > execution, reported to several separate Gitlab issues (links provided).
>> > > >
>> > > > Immediate return was introduced to i915_driver_register() by commit
>> > > > ec3e00b4ee27 ("drm/i915: stop registering if drm_dev_register() fails"),
>> > > > however, quite a few things have changed since then.  That's why I haven't
>> > > > mentioned it in a Fixes: tag to avoid it being picked up by stable, which
>> > > > I haven't tested.
>> > >
>> > > I'm not fully convinced about this series as I think that you are
>> > > fixing a subset of what needs to be handled properly. What about
>> > > hwmon? What about gt? what about debugfs?
>> > >
>> > > In my opinion we need to check in _unregister whether the
>> > > drm_dev_register has succeded and one way would be, e.g., to
>> > > check for the drm minor value, or even set the drm device tu NULL
>> > > (first things that come to my mind, maybe there are smarter ways
>> > > of doing it). This way we could skip some of the _unregister()
>> > > steps.
>> > >
>> >
>> > Is there any situation in which having the driver loaded after failing
>> > drm_dev_register() is of any use? Because if not, instead of recording
>> > the fact of registration failure, we can just stop the driver from
>> > loading altogether by checking drm_dev_register()'s return value,
>> > then calling _only_ the required _unregister steps as cleanup in an
>> > error path, and propagating the result up to driver probe. This way we
>> > don't need to store any additional information at all.
>>
>> as long as the driver works, why pushing it to fail? Janusz's
>> patch is really showing the case.
>
>Because the driver doesn't really work... it is loaded into the kernel
>but you can't access it the expected way because we failed to register
>it to userspace, and we also skipped a bunch of registration functions.
>Is there really any benefit to keep it loaded in that state?
>
>Also, i915 is the *only* driver in the drm directory that doesn't check
>drm_dev_register()'s return value. All other drivers at least check it,
>and the ones I took a closer look at (xe, nouveau, amdgpu, radeon,
>virtio) propagate errors in drm_dev_register() up to their pci .probe
>functions. So I think we're safe to handle it this way, and this
>wouldn't force the driver to keep information on whether the
>registration succeeded or not (if _unregister ever gets called, it's
>because we're exiting from a properly loaded driver, so no functions
>are to be skipped)

agreed. In xe we used to check for everything, then this approach of
registering stuff and not checking "because it's not critical enough"
started to show up and made it a nightmare to maintain. This leads to
half-initialized driver that may or may not have debugfs, or sysfs, or
pmu, or hwmon, or drm, etc.

However in xe we are using a different approach. Relevant patch series:
https://lore.kernel.org/intel-xe/20250212193600.475089-1-lucas.demarchi@intel.com/

And with this other one extending devres, we can go further and move
more stuff to be handled by devres:
https://lore.kernel.org/all/20250212200542.515493-1-lucas.demarchi@intel.com/

The .init()/.exit() calls on the module level that started with i915 is
also used in xe, but it doesn't make much sense in most of the
cases since most of the initialization is per device, not per module.

After those series, we are still not done. There's still some display
stuff to figure out on the init/shutodown sequence and the heci stuff
will probably come after the devres part.

That said, there's at least a few reasons to keep the driver attached:

	1) Survivability mode: to allow communication with mei and
	possibly unbrick a device. Right now in xe we handle this
	separately though: the driver needs to be initialized in this
	mode

	2) devcoredump: if there's a crash to be debugged with the help
	of devcoredump, we can't detach the driver otherwise the dump
	will be gone. I'm considering to allow a failure in
	xe_device_probe() not causing xe_pci_probe() to fail so the user
	can grab the devcoredump. In this case, the driver shouldn't be
	registered with drm or anything else at the end though.

Lucas De Marchi


>
>>
>> Andi
>
>Thanks
>Krzysztof
