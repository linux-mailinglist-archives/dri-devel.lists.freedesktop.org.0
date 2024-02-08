Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C9B84EA2B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 22:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FECD10EDE5;
	Thu,  8 Feb 2024 21:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ka0b/hC2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A5810EDC8;
 Thu,  8 Feb 2024 21:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707427033; x=1738963033;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wg66Pd47I15VI7LWyfB1wBB78k82Rc+Svvd1Uor1UxU=;
 b=Ka0b/hC2kNCdJ82hFFLt8j/UfFXUdMtKG8vCeuwhoCYdPayWrrL/myhD
 C3hlXe27s/XbVunxnBAWNOCNDOsnLjX9uAwekBFwFFbuYRXMBZmZbzULK
 0kM5xDe2geUPcyc0AeKGMo7pJ5LKg3O/hpLj0nQ1zJlQI6REPVULX1aaj
 DHyoYrKdgw/aJQLuq2ueW9yy2KSjp2w31zWC7vYBch1CixOTzl5npF/CD
 rEeJppNPareRQCgpVSk94beFmOM5df9XcCcRa3Po9kUehUvO4wC4zJow3
 fRKyBEnNNyZOyaYOmaR6L8OET49KVVudfuRJR9PvjrFTl/DB8jkfKmUFj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="11967430"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="11967430"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 13:17:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="910510721"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="910510721"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 13:17:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 13:17:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 13:17:11 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 13:17:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yg/wZ8xhJ3IATuH6RSDiZAZ55DNWnHg0Z6Z5NojJ9Uh+HAjm/ASHXobO/xmILQo7sdWD0RRdBIJiitVmDOe0ux3TOmD6feL7rq3bSrhU9UuhNBafrM8Kh2gid8nTBK/yrN6ujZT0nPyGaLKSJpq30dzqUDDeXA3iCAmvaly2xYOgd9vXgV5WDaiPJ1FDOlOuAew1tMByLYnt0lowZMatPV8KD7P0SQkiuSrGTw/WAXb0WU5RVCpHldBlyVhhIFrXNxEE8lKDccOFMVB4G6uXozxf2/8FJ5TX0W2/25lBgxvg/BUZsAzcxK9hKdiE2sjjLbKpVSYTKcDuEyYtiu1qYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGL6Hg5LWyCRpS1sy3o5J9Ocle0rXK5UYxtklloKaeg=;
 b=dHNHW/IdlIcvRYMF7Ce76dMItoD9PPJuVV4y1d9WsiGmtBYdpBNRi2lzajcXTT4hH283oaJmu6gTbOiA3voKQgNU2tnG5iE5dEF8ioyXVe7Z4tpw16MBxNp4mzTteFZxUxhHhmACV8pGMipod1EqebP25McOUYGfYChRDWH/dEX5bxtpiuVMRlFxKLnAUCJDwS7QQOS6fJ+Jq9rN7vxSIxgZGjnDu6oqYotg8JyrE9GPPW/Ke/OWPekcdVK4PAMBOg2x+s+vSQEiKkBRYqw3BC4O4QfxRYF3Fu0grEmrAFGMYJrQeDgG6ftLvnqCtuhyQs3BMiEtNRVd0l/rOOw84g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7506.namprd11.prod.outlook.com (2603:10b6:8:151::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Thu, 8 Feb
 2024 21:17:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.037; Thu, 8 Feb 2024
 21:17:09 +0000
Date: Thu, 8 Feb 2024 15:17:04 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: Yury Norov <yury.norov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: Re: [PATCH v3 2/3] bits: Introduce fixed-type BIT
Message-ID: <ilppncjskpt52bijaoxlwcklawjpw5cqrndtx2g5xnwpj6bhbm@kn5yjscaha5e>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-3-lucas.demarchi@intel.com>
 <ZcUz3V56qNeTVq66@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZcUz3V56qNeTVq66@ashyti-mobl2.lan>
X-ClientProxiedBy: BYAPR07CA0077.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: 33260f55-15db-45f1-e750-08dc28eb4f2f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xAm2iIgSwlKdlLsWafo7E14m/VxtCAga297OtUa1ZEEJR7MZIggAbgBtT7MYwYO0xkMfhax2yX9obioyKFc9eFp27EaNw7WiN6E+/Hjy3xvdVgzZ0qLBijz/oyrOyDm58HJ8MCOlqdkn9Xf1SbZV1NDUm8Usnm1ARO1YRuHabB2n55hvzbJ2owaoDN0JYH0W2/KRDPIHh93IsJQWgzf7ohvUMUby992dS7Y7hQU1POrLniC2V93CqMRySFjsyZ3t3PkDwExAXc1C0UOiJfWlmwfm9L1nHr7yOu9foawF7wmb8Iag9rNU9GMxKDAjnZ5Wb453XZNpfzymeYSi0EHGU+l8hzdEi0CyZj5RUpkEa/qHPiwC3GTjJdfQWpbj/oeXAogBiXKp0ogznUGFgulPx7FygW49L5wpVWWZN8QZiG0DG2JHx4L+s1zRTx9rDGu0J+mNMwmXIYc2kPSTlxiZ0tzaByTptwW3pfAIbU/jSemGRxYcVarf9S5+WvxbgERPAzSDa/VRQGI2FtO7MjooXdg6dL86A15EVKMMRH0+42HA4HM2OvxtUnQoHCSU4fkv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(82960400001)(86362001)(66556008)(54906003)(316002)(66476007)(6916009)(66946007)(6486002)(478600001)(5660300002)(8936002)(8676002)(4744005)(2906002)(4326008)(38100700002)(6666004)(26005)(9686003)(6512007)(6506007)(41300700001)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zhH+WqL73by5fqOMdWp+0vrLsybOMj0bQaUEmamZcjONkVTiL/sXH/1fVtxg?=
 =?us-ascii?Q?2wxqN1TDNnyj2zJJ4GbrwUhkmwzoFMo8dCispEjcQAMTSWPJnKyDw9lcN8SO?=
 =?us-ascii?Q?cNe0Tgr02TeimiUFGwtLCiNoBjDp3m2pl0mSobAsr4POQUVu63g9xTsw4tA3?=
 =?us-ascii?Q?ceX+cxbZrPYnBt3F7zmTkC21MzwYxFifQQJp88DE2xpCXNxi48fCq8PgoWfZ?=
 =?us-ascii?Q?ALZH7NCm84KRT6LJIBr4xoS++fK0GaC01sX1gqp0iuC228oFIc5wQ8V467QI?=
 =?us-ascii?Q?ahLyGoutsEI1mWj+bH/LiIxFv9KRcYG6Cpsoraz7SE8AmPQRvZjYlVU0+Id0?=
 =?us-ascii?Q?gE86eXDBMauuzKIg/UJC9fzEczzktJxToGOf9HbIO9nVx0IbIUNppPaBa4RD?=
 =?us-ascii?Q?Y9lOMZ17gtIipnPAW7wJECIq1i3873oPqdc6yFtam5s7EzsFYKSN0I/fm6PC?=
 =?us-ascii?Q?z7zOr0FKVXjKEL5lIN2U3LW2SD771CoXzKtW/zt9Q8RIsZCgwz27/G0SQY9n?=
 =?us-ascii?Q?cHAU7e6tUhG/gR7kryD88Varge9CmrIMFCnEgRrSVyRsbpwzZ7kDcM70sFtr?=
 =?us-ascii?Q?TXp+GnmUYbOOxFlLM+UYcGV7ImpAAPFPqlJo1grLgx6TQtS6hQOOeE7T0bvN?=
 =?us-ascii?Q?xFV6yDzblpk1hf6hHJL3JK1rpJ9bTDB+kYuwvJUwYvEH6PWrP5+wK+Sxji81?=
 =?us-ascii?Q?NBFovIIJcezDtA64op5OleetGJwg5Gzc4ZAAGW+0pJlBdbnn+inbJMQs5tSD?=
 =?us-ascii?Q?Dv1H6eOmkRwSl6WrX5npQZwp9MtVdfuQxB8aQCWKkkK2+qAJBrzTDWTYYG7a?=
 =?us-ascii?Q?wiSSahHxDWOAEf63wZOdWBz7OcLW1Jfgg1OIvn2JDYMJwH2KEUi02gWF7ZzW?=
 =?us-ascii?Q?SRTYrycFHkT0bVslLgpOwR2kVGdrWaXlNj7QSFWP0vOKtppN5Q8Wr94KF7H4?=
 =?us-ascii?Q?ZSbJAZJqwZWC1xS4IhqLzdUHTMvsHA+I4K9w3j+vhXR8Uf4NPw7w94g8tFGS?=
 =?us-ascii?Q?No4qphZn5FQwue7Rk9D9PR7VoZJwjVFrkI0js5jLtkdoOV7PZYIVw2I1TUTX?=
 =?us-ascii?Q?1uec4ge+wehkIc4eceXlBPBUax61nq0LXmeVwzCiY18/A/QPXhQpGoAPWiqN?=
 =?us-ascii?Q?6FHQhfmm0R94/eTdNgokYAXvvZM9iyq54r5BZ75mQtTBujkHViW2tUqVsjEh?=
 =?us-ascii?Q?rNoiiAJBi1m4eLFKWhJ8ReY7IiqQNeX1QC4gn+nD2b5vVCv+zYaj/b0bc10a?=
 =?us-ascii?Q?q1LOwK1BJrjdEsR/CKteEbzis2+ojPwrIvBrdgu1G0Q1YK24sYA9XdTwFMLD?=
 =?us-ascii?Q?ZtFJ4Sy6N1eOYHgjeEZ6QPilRqP4BtuXbWEvRVG1v5FbXGbzS7dmgnAg5u2K?=
 =?us-ascii?Q?gnaLzhX5kq9MXL9BixqRHMS6niUW7DmRB4FevFJIJWEvReSF/x5cxbLCpI5P?=
 =?us-ascii?Q?LV3clE6W/hH/4eeuVsqHVw+TJMn4LH4kOVLVBU86hMk/Ljab662wxYZnVuKV?=
 =?us-ascii?Q?9FmJN8rRAVDUjwh//jIgTxXOIsn8DTndSOMd+x+33pMfpEBKF4sfR7siJ2Bz?=
 =?us-ascii?Q?0SAJ1lln8akAgggeNaiDaVpiaxcHTdYeh7xFTljE0+f1NRR7a9RY9Cs8esp5?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33260f55-15db-45f1-e750-08dc28eb4f2f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 21:17:09.1879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5UB5IRQzORGwdfD2RbhjNYJUt3l1L+LFe7E90X2ESxlUNFNY8JVBxyk2vFYh/4P3Yid+7Y/5cMYSBy8cZh21aor77oWgmoJkFaBfTGARKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7506
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

On Thu, Feb 08, 2024 at 09:04:45PM +0100, Andi Shyti wrote:
>Hi Lucas,
>
>looks good, just one idea...
>
>...
>
>> +#define BIT_U8(b)		((u8)(BIT_INPUT_CHECK(u8, b) + BIT(b)))
>> +#define BIT_U16(b)		((u16)(BIT_INPUT_CHECK(u16, b) + BIT(b)))
>> +#define BIT_U32(b)		((u32)(BIT_INPUT_CHECK(u32, b) + BIT(b)))
>> +#define BIT_U64(b)		((u64)(BIT_INPUT_CHECK(u64, b) + BIT(b)))
>
>considering that BIT defines are always referred to unsigned
>types, I would just call them
>
>#define BIT8
>#define BIT16
>#define BIT32
>#define BIT64
>
>what do you think?

it will clash with defines from other headers and not match the ones for
GENMASK  so I prefer it the other way.

thanks
Lucas De Marchi

>
>Andi
