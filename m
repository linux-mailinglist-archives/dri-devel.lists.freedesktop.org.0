Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A7585FE24
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 17:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0778010E07F;
	Thu, 22 Feb 2024 16:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FIthbcum";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43D610E07F;
 Thu, 22 Feb 2024 16:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708619766; x=1740155766;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2CqciIUKtMDXuPH1Ddbh6AX/x9HgmsRLVM0aYqOh79k=;
 b=FIthbcumr/4/NnqXzfggdySfpFmd3nszUjaWuEyEN2yfJZtUVJpo0CQZ
 UC2rufEDUQk5BZHvtxMuW91ZtBM2FpRjt8fXhVgqcCAS4S8PsedEf5EcM
 fe47tuuJZBOVXvbOPdXdcOYlX8AuJ+RtrCbdPJ9RpKvCChF+FDh0SMD/G
 /75U8RvJ9TZMME6vgAyt7pes+9ApHf6pFMLYoTsW7Z2Nxf/UZHnOicUeU
 LZecbjEQcuE0JvzNisuwEkpUu1n7jSEGRNw3pXOtfAY/yuEoIAvny4dqJ
 112AcuhsK6ygt5DAx7HjwhwXo0ALgjiRzB8VbrVqjy0oyp/jLOuAlNyZ0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="13558163"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="13558163"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:36:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="10135480"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 08:36:05 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:36:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:36:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 08:36:04 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 08:36:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATIQYhYUHRYTAJEd3bg897KqipVSTaQzkALwXYmw9oaPByScHw8TOt7aSntYEhlgmtBj54ttv/Ne3OZMAKzHJ1sKBYdxNosO2a8EI6DvJINPNX0vQdtSZttoIUYUhqDDVf/9KSej4gAf2O168Ue9VhOKrmD7IjnUW7d/iTysLiRDoCIDMhVT65skL25ThFZkBBZ7OBor8WnC4TESk7FrN1QlqQoX0B/ZJngUBFRZN1ZAFgeE06sKMBpC4TcqEUaAHWswfqLlqZyNPMXp4LWwfYfCIL3w8UZ+UbLRiA8R1slmCJ4bvazKTUAy8Lef0gLCJ/aL+1ACNQ9M1nVJkB5rkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4cnHHkB9IPNNglCnh4Zu+4M/XzJp0qiCLG9Fjfe0tY=;
 b=S9F+GN+KT5jSxWjcuhpBTJjUSsH2o0Hmt/oLoppkxMoJtW9To/g2sW0131si91Pm9H86Vl7dBfHs2jXj9fzBWlJb/2L/6vH2u/cXXATSfgvaNLc5glp7Nw4DcVXlBpF3nNdXbTVAwBk0HQMRNa5xzsx+LYvUNhrB74MAj0z4GxRuQeczfMc9J1YIsJXfIWwSu14+WoOSDm2xQqoCHP4Er+xCBbbE549c+7p04dn/A43e+K9OPryHipAEy7+IC6fg8+z+b+jYwX1azO/sD5EuCcFQryqXRKucgs7hsyaMsLptXTQ1Fc7dHmuYfKLC0nke0tICyRYabcO6rpwHTDUiIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH0PR11MB8165.namprd11.prod.outlook.com (2603:10b6:610:18e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Thu, 22 Feb
 2024 16:36:01 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 16:36:01 +0000
Date: Thu, 22 Feb 2024 10:35:57 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Yury Norov <yury.norov@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: Re: Re: [PATCH v3 2/3] bits: Introduce fixed-type BIT
Message-ID: <fmndbl54srecq54nytq5ethwhzryv3owfnkd47xnqbyib7qx5l@hbne5n5v5ibz>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-3-lucas.demarchi@intel.com>
 <ZcZYhZbLyzSXX8PU@yury-ThinkPad>
 <erg2ymp6raf7ru5ggj4hrrhet4i762msoqa2ronv4znfhlkc6o@nxu6ygtdfmrj>
 <ZddfiNP5qGWNDtiT@yury-ThinkPad>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZddfiNP5qGWNDtiT@yury-ThinkPad>
X-ClientProxiedBy: SJ0PR05CA0173.namprd05.prod.outlook.com
 (2603:10b6:a03:339::28) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH0PR11MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d01cbe-755e-4a80-79b9-08dc33c45adf
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JvXIXvqLFng8wjPCGBr8YY8Adqr7SmrSqpFPBhDHw+4/jqO1NekE1qXIYxiIwelkT5yO+mYM/tIfVoO93wL0GofsIQ8gA53646Uxuu56le4Kk77t7iI7zFfKyEsnO+VjQUHefrpWNg8ZBt2ArkPns7q+i2ztsU4seypiv1DwxreQ8UYSMN2JcuvPWgLd1ITinwxOvrRs8qbuw6DXRfYWi1MVmyiLHvGIq83FExQkukOCs7IOE+fQwJTgBJro44JdBIE7WbLO8daPFBxehWiHhPoJMPG7wAYKO7PgX1KieJ82VulLdryB2+s9rlcQx6e9BSzFauCjMvnCLNjFrbRWLzkOimsrPGY2l5tvPAO8tFw7nQeDddv4G0TF3AhU2kdYwtK76hEnr9rbvBk/9CYpEHb5mAPTYlZOEntJGst7anwpKQEowlMVheqjwNpXfZs3N0kkLAkSqQAapO7Xd29XMmNxODZqj+Tx3B5pQrZde9UPVhBnJBgCbUhQ3ohSd7urc1ThB3VxFRCtZ0boIclbQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xVsz0NUWArmZpwBNfS0CMan1uTPLtlwxS7rf3cHJWBuEEQb1DkBFfTdkoijm?=
 =?us-ascii?Q?soi4zsC+35cKwWIrY7cDM7smW/bVaoocdt8P/yGlwDQxTRNGgsAUxjRUVySF?=
 =?us-ascii?Q?JzG/0G5BkMCdN4RGGZJVQ2bJQ08vYAf9HtJwpRWP1V8Zj0RGzDjEUDEF9T1S?=
 =?us-ascii?Q?uTX+w/0kLMGJl17rfbCiB8bI1PjJVm3id337TD0Ejfv7IMvc4MJwAhd2exqA?=
 =?us-ascii?Q?MKamL/i5UjlsPCHRfXQA8FvGDOxvZNwX5wA9KGxkScoX9uIcJp1egtFPTnlZ?=
 =?us-ascii?Q?IWQSbnJKu/EPJRMTtSFSmHkM6tkhN0/zblmRfflMUsau4xwq9NYQU0TTqNus?=
 =?us-ascii?Q?ZxJQXj6kCS8SDGlTJzNBLQGMlfyM3BX3kPt4Ws32BBOJRrAcrYRyXQJVq96G?=
 =?us-ascii?Q?6dtwTWenvfkbJGCj5Etic8jdz+ydM4e0NgrGNm9sV4/EvJAY1nIzhiaizW/e?=
 =?us-ascii?Q?stgm6nRdFTrQ25YQllzjnaIjydvrrpVT62CqRhJzvZ7wdlTeQLAkt93sG5PY?=
 =?us-ascii?Q?ngXVfhoDjnTXfVpFlyzcXKxEXs6p2l44UdRnhp31yssJOShDF/oKTBMFyZWg?=
 =?us-ascii?Q?W71AyOh9PAhsBv8bKw0FAiGpq8X3F4OF3fe82fP17wwtX0WFOuH40ITYEjSE?=
 =?us-ascii?Q?oyqBAl/EKK4nozEOBKNTSkxs89vMRYNWUFP6HGQPiwAAEGxVP6i4SExsudm7?=
 =?us-ascii?Q?ZVpCWXGtO6QIcwL8zUCCr+y7Rnodp3aI1lkjltR3CMZQ7/nsY3m/vdkTJBnv?=
 =?us-ascii?Q?HuHAp/398vAXUBWDqOyrb/s3EOG/Io+Zh5iJpgWSYf6uOE7yD26N8eEL7BkD?=
 =?us-ascii?Q?qtzsXFu9V9kxOKkdgGjE775ZusDkgqbsS0C7QgYikKglIBPdwQaX6Mrp0e+e?=
 =?us-ascii?Q?y5NPSwdboZb/QHyq0i1XGCo8ZIkH7UEBrZRci9VTkhxLmPiJE32xMW23WuD7?=
 =?us-ascii?Q?TKzy55wMDpBBbuOoXza67lV/0gZZI9EsclY3QEDVjfw2d/nYUjXDvygr0KLf?=
 =?us-ascii?Q?4BbWmMF6eBkY3CiA7Z/sOlMBgp0gke0MJ1S+UFyBbLgIoFymRVqAN0G00q1b?=
 =?us-ascii?Q?xWnqzvCG4UJXUcrmUHDmXjkokwMQ+6u3BdF6XUeBOhnmZMMhLxErxyvzHiaL?=
 =?us-ascii?Q?xtVDu19Bg89HxhPMJ5MdA4X8EczKbyjdaqPL6gn8VsLl7axNVLsrOU37rGVe?=
 =?us-ascii?Q?xDMHD9noUnA1euZhrWmpqflUzWf+WuZjq6jOTVlv6CO/nB7RYVKqXGJSl9qC?=
 =?us-ascii?Q?WBgaFA8bZ7lbwLTOpqAPp6PGjhPop4fpb8inSRJnFYtoEmsPj17pVvF7iekH?=
 =?us-ascii?Q?vTCjd+TZ5Wva6An3bg45TyoZ3vaybyBrRsNg0oq5WW8BS9L0v7YqswkXcCP+?=
 =?us-ascii?Q?DR2ef1Gf4MAHQTnzGbjjRXjx8Jl/n7R6mSjJBYJnXBD2D0rmTgV6RJf4HDcG?=
 =?us-ascii?Q?uV0Mne0etHCQtQ0godnfFHWJWWP+3eeQ1c6jg9VLshDPou/uDPqZRvRUEXCo?=
 =?us-ascii?Q?czLZqdEvhVZ7pADgOK/A7oWKvb6lqwMJevfnJS1H+tNGcHiBZLu3QUJIU06H?=
 =?us-ascii?Q?QCuXFykJoygDkJasGMGlDVMl/MSWhPZpGbsYl/ayrg8uquRhXqQSAS6XN/Tn?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d01cbe-755e-4a80-79b9-08dc33c45adf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 16:36:01.2725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NWqQjfeS0+TkB9x9ZOeOUmwEse+iIR6O9ZrIcG2+9SFuayFTnfqttCb8kdgP2cgHb0TUDFBLpEbErhSPXn2sr5THaw1CCniFyp9DXnLk2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8165
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

On Thu, Feb 22, 2024 at 06:51:52AM -0800, Yury Norov wrote:
>On Mon, Feb 19, 2024 at 11:13:57PM -0600, Lucas De Marchi wrote:
>> On Fri, Feb 09, 2024 at 08:53:25AM -0800, Yury Norov wrote:
>> > On Wed, Feb 07, 2024 at 11:45:20PM -0800, Lucas De Marchi wrote:
>> > > Implement fixed-type BIT() to help drivers add stricter checks, like was
>> > > done for GENMASK.
>> > >
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > Acked-by: Jani Nikula <jani.nikula@intel.com>
>> >
>> > So I get v1 from Jan.23 in my mailbox, and this one is v3. Did I miss
>> > a v2? Anyways, please bear my reviewed-by from v1 for this patch.
>>
>> Jan 23 was actually the v2 and I missed the subject prefix.
>>
>> My understanding was that you were going to apply this through some
>> bitmap tree, but checking MAINTAINERS now it seems there's no git tree
>> associated.  So I will just add your r-b and merge this through
>> drm-xe.
>
>I've got a bitmap-related branch. I can move this series in there if
>you prefer. At your discretion.
>
>https://github.com/norov/linux/tree/bitmap_for_next

yeah, sounds good.

thanks
Lucas De Marchi

>
>Thanks,
>Yury
