Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3B867824C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 17:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC1510E50F;
	Mon, 23 Jan 2023 16:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620B710E50E;
 Mon, 23 Jan 2023 16:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674492855; x=1706028855;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TmTzwbGEawjMX88N7Vr7DCA/PUsRQz9qMHmL4e4M62g=;
 b=Ap+eEoBvjQxuyTZJw49CQtA2LIUY1DOOF5n1sUL1zXgTSJRFCXNQi4WD
 fYj0ac0Shl3ljQn8zihd6GY1KbGjMJjVZoV1JXeGODMyOnUknVgQNgxfO
 11JuLYtLIp+IMmT9RIGgI5K91f3x75jqBHNPoMyGbsEsVx3SSdrknNjn9
 2s8oVeh0EHg6K8K8DAq9hDoW7KSJdpzSIQduBhlCgq60htmzditpDWc+K
 KcgugTaGrDp85jlIIjKqQhUlLDgkHuR3Jn1/Fays+DZZ0vL3ZRlQj4gdj
 GZIssys/WjT7NzlHcdp5BVCm5f8Kpag9fQSl6s94DTgN7ByP0kfvip0iO A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="313984318"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="313984318"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 08:54:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="750492707"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="750492707"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Jan 2023 08:54:07 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 08:54:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 08:54:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 08:54:06 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 08:54:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVO5VDGWQp5SPPYmGwCDRfXwPKCOnj3kY6g+BHP5rXrI6yVmRLmW64/WhSzI2Z3CxQF319+g2/JkS2fBLmVkuiarrvdTUVYTyeb5QYp2CEQidt2U0HysDQe86p9IokRgFPIhUkAbtHE+8lXUbWwlpooyfY7dhfh+/L0fu8lM6c89Pkx1gDIexGAQpGpGLDv4oDHpyTM84XwNHA4k35H2Z0Po2+BuUjgzZXPe+grCF9WSf+yFUs+rs9z++dJRWPmHbRwkn9il7268cL8jvOX2BqWqdwAelesiM1K5VVWRL0CwJFHQhoKc0pWi3z0Ef0FP1+LXG2FlaA4DgcpTt5xAuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwFXQ6OItIUMbaXB05OgH+oEtbrs5n+E6PT/2wuRhLs=;
 b=LnBMfjqyOZSLhEhNjSRQ7oiwnzy4L8SzI+HVJd/jPAL2gSic3WP5F11j0PxBFKpsok0LPqJ2JzgHDgpziOKD5sDAv5p2/xA2MR+zvfM+TH2PguG1FNi8YBJL29Szl28lN8/jH+0cpjdxemnDi/rkPhbRLiVzUWIC+C9Lmup7K5qzrTjVUjuJX17LBh63F29sXBkVFmapnrKr6bqo3WSwqkSZWlNPNEFfTSFH6X6Lsngz/4h1EDZDoeToG3mLaTuOkgmqKNlLohDk0XBRyFfvTKtDZ4T6IBYAgGcMTsiffCJfxP3q0jqjnGRs6CKImGjOMtgJ11qEe73osaIYZveNLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5868.namprd11.prod.outlook.com (2603:10b6:a03:42b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 16:54:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 16:54:01 +0000
Date: Mon, 23 Jan 2023 08:53:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 1/8] drm/i915: Add _PICK_EVEN_2RANGES()
Message-ID: <20230123165358.eokk2cdys3emk3bc@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230120193457.3295977-1-lucas.demarchi@intel.com>
 <20230120193457.3295977-2-lucas.demarchi@intel.com>
 <SJ2PR11MB7715CD391A024B61AA4E2323F8CA9@SJ2PR11MB7715.namprd11.prod.outlook.com>
 <20230122012811.zd7ujwbsuwpt7wjw@ldmartin-desk2.lan>
 <87cz758qhm.fsf@intel.com>
 <SJ2PR11MB77159353F7EC04904FAC27BCF8C89@SJ2PR11MB7715.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ2PR11MB77159353F7EC04904FAC27BCF8C89@SJ2PR11MB7715.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:254::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 3331c691-0efc-4789-5ced-08dafd626d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LyfpkzU9VuN6hB+psUaqRTWW48UyM2wQCUn4l1WMckA0Tf7G/W2GwBtyKePWtpU1PR44USUp5aiim0NXFL6DOYDE8IuE3l1mX67dEpoXK0Dv6Z0QaygtK0d2v7so113OgyB2U9bzV3dlCixK54zVzEB78zCLweeLJX2yUwWqbBOqGzpuc5HJq1dqsqIL+wh2RPD7g9anBJraz8/6jJppU7BvOrnKXl5bMnzmKaoPFPQEMsxhjeKE0P9Yohv4/9/Kzem1Y4mFPze68nMldKlCdRIAfxubqkQw868F1DEAveeIPDSA+QsBavWlxeAGPDPKMO0qByt3rCplGmJ//KYUPQSeXoTT0pmrMAz9eSeXjCsV7b3unp2ow+f8i6MuF1rdH4PLaoKSUY2xwkysgi6fazcbfM/KGHA/ggyp66dSMyLRw5jN0Y9ap/+8TmvK/xmJBmv/FPlDVyv6x9ADeAACX4WfEYtMJt+E8Om65qS6DnCFHU3clRWXhr5KD87Ic2Nf7YRd4JuyQcdN13qyPY2BWYDkdmptdH9zvy6vk30Tx6ozK3wIf3XQU4TmI9Z7/eHnE7cNnzEsXw+iiXPeY+raaDyEPEexaTCLanlVtIXI1dTUVsNc2IANKNuikONX2O0uOkAW09h6lPQ5mbLw0N61iQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199015)(36756003)(86362001)(2906002)(38100700002)(82960400001)(6862004)(4326008)(41300700001)(5660300002)(8936002)(83380400001)(478600001)(6486002)(8676002)(9686003)(53546011)(6506007)(26005)(6512007)(186003)(66946007)(66556008)(66476007)(54906003)(6636002)(316002)(6666004)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1eXcdnn9qA4OeeRrT7IB5MFBEoUlcfb6SlZFZK2dkaSVLB7wFUaJefhBbpko?=
 =?us-ascii?Q?firuhh6vWaNy/7h8YFhr9ofFTWQm3maRAXJfERl9iWvTF0HUGjDrXfj6t2kd?=
 =?us-ascii?Q?SZHrmuhDkwpvvhSQyXQ7ILF99peEPSW27rz5wBy+r2aYKP+MTePOib1catRo?=
 =?us-ascii?Q?4fRijygaf/tUYNek0UIJ8cOjiNFv405eEInM4X/FD52B343Vo+O5VYnv7iYy?=
 =?us-ascii?Q?BbWD/7V4Q9dZQraDXbLtrt7qLG+bOOdgBnQVkFwH7aI0+uSduuIfOfRaBaTJ?=
 =?us-ascii?Q?R9mhouEZd9S/jt5dRIDgCLPQ19eJ113AFopLI5PxHnh8HBraI0+O9igJA/aj?=
 =?us-ascii?Q?4dblY0oVfhcqILrByDwR9iQt5Qx0pboswaYdQSk7Kh23ztQ3Y9cSFFaFd5FL?=
 =?us-ascii?Q?AP3Jc0/8LrvFzpcc3+XKDi+go28Mi7vMv97QUmntY1qyIfd2NfivSbJIdT4J?=
 =?us-ascii?Q?0pgi0VMgC66oRViLGpBJ4NyUqLbvva54nJoDz+W16ozLbAlSj94U5hfhfvVg?=
 =?us-ascii?Q?ynrMfbzYnWZsneZWwX3HkiKxFRgeOpRhkmAK6HxTKMEzSo9y1tQYxokF00bb?=
 =?us-ascii?Q?COHfBS4Cc319cDGY+g1/wOc1+0hQAJYIKQWbNB42uIuijxPC+TtmvW1DxZNW?=
 =?us-ascii?Q?JH+/aPeqFAHXNOHjGUQ7MvMLw0VRDT22qUB+bFrJg722MBAxJobJU+pMnevF?=
 =?us-ascii?Q?gW6+tSXr8AaCWxXfj3erMSgb3yOAV9Y1IDPClYP8hgRJBprA6ypNLvqoFM0D?=
 =?us-ascii?Q?Nj9kJrpAx4gUeNHVeS4j2wn117T2+VCPEQz+1eYvBcj0PweLA4qugkqRSnI+?=
 =?us-ascii?Q?Ijmq/pICx5FHIakXFc3FO+dI6MWf1qnYcK4tOdvxZ5ZnC4Lp5CNMHUwmCF5V?=
 =?us-ascii?Q?1TGCHVS5Z5ee1TpYWpM2RHIdLUAZENcsCq5MoVSOxs8UL76XF8JcvSzsX7lr?=
 =?us-ascii?Q?ipmSnyf7iB48jHpOWow2my/xzrhBRJBFNZUy4ahDdaqr89dMn6tR6RPpbGmQ?=
 =?us-ascii?Q?2IDXyKiI1xMpjgfsTmcAfCoQhb6qO0GWIf6AVCkiqtLcdP1LG7TCBaD5q0xW?=
 =?us-ascii?Q?dAkCmJEr2n94WaNKF2u05abdojMXuqVGIaf3uwvdSvqlxS5lnxzw+1rqaU90?=
 =?us-ascii?Q?aX4bo9RnFurJYXZtsX1DUlvK5lQn5mtbDPtvdYQ0ken2A9hjL6MaYsqUXbQC?=
 =?us-ascii?Q?Qxi38MGYWGVAVAGXF1Uuxar4l0UdEsqk65fzdqAJx/O7YIPP6bIQFm/9SWWr?=
 =?us-ascii?Q?JNo76BtJyJTO69HA6QNB1FHyD0IBVzg/Zn5rpZPSPdka/ODxvKyfZebDZjZl?=
 =?us-ascii?Q?G7OzwuHE38RVcPWDE2COdTTwa5fB9UAtSLsZJmPDB3E2ntuovO3BoF3gV0NU?=
 =?us-ascii?Q?TNMXrrwuB0Y+XF2ow+56YRD6sFs/pjT4N7qAynrGfZu7OsSpng8dt4LEz31U?=
 =?us-ascii?Q?6/HhTqyjGKtgEAp45GfCNlmv+kcvH/W/oBSYqF+7+3fCCoULRuSH76r3X868?=
 =?us-ascii?Q?vgjEEdedYTbIGUjLjqPo+VKwYdm4wYkw8lw3YkEKEtqLuov6SVFUox54rLs7?=
 =?us-ascii?Q?MrZJruObSZY/qF1GntnyK4sSAYIomvaOWRSs5zSo3dJPVb1cAvVqotHmmbuC?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3331c691-0efc-4789-5ced-08dafd626d29
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 16:54:01.0145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 48L91Gg5BLro51OfFaQyMhMEYowMD4uMoUqn26MQ3TZAsaI+FRIzXVeYkIjYwBjpJ0Sl9HKe+VhdW5PhT4HUk0Iju3g+6H/sRlHqYIiueeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5868
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 08:15:16AM -0800, Anusha Srivatsa wrote:
>
>
>> -----Original Message-----
>> From: Jani Nikula <jani.nikula@linux.intel.com>
>> Sent: Monday, January 23, 2023 3:01 AM
>> To: De Marchi, Lucas <lucas.demarchi@intel.com>; Srivatsa, Anusha
>> <anusha.srivatsa@intel.com>
>> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Subject: Re: [Intel-gfx] [PATCH v2 1/8] drm/i915: Add _PICK_EVEN_2RANGES()
>>
>> On Sat, 21 Jan 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> > On Fri, Jan 20, 2023 at 10:14:19PM -0800, Anusha Srivatsa wrote:
>> >>
>> >>
>> >>> -----Original Message-----
>> >>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf
>> >>> Of Lucas De Marchi
>> >>> Sent: Friday, January 20, 2023 11:35 AM
>> >>> To: intel-gfx@lists.freedesktop.org
>> >>> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; dri-
>> >>> devel@lists.freedesktop.org
>> >>> Subject: [Intel-gfx] [PATCH v2 1/8] drm/i915: Add
>> >>> _PICK_EVEN_2RANGES()
>> >>>
>> >>> It's a constant pattern in the driver to need to use 2 ranges of
>> >>> MMIOs based on port, phy, pll, etc. When that happens, instead of
>> >>> using _PICK_EVEN(), _PICK() needs to be used.  Using _PICK() is discouraged
>> due to some reasons like:
>> >>>
>> >>> 1) It increases the code size since the array is declared
>> >>>    in each call site
>> >>> 2) Developers need to be careful not to incur an
>> >>>    out-of-bounds array access
>> >>> 3) Developers need to be careful that the indexes match the
>> >>>    table. For that it may be that the table needs to contain
>> >>>    holes, making (1) even worse.
>> >>>
>> >>> Add a variant of _PICK_EVEN() that works with 2 ranges and selects
>> >>> which one to use depending on the index value.
>> >>>
>> >>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> >>> ---
>> >>>  drivers/gpu/drm/i915/i915_reg_defs.h | 28
>> >>> ++++++++++++++++++++++++++++
>> >>>  1 file changed, 28 insertions(+)
>> >>>
>> >>> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h
>> >>> b/drivers/gpu/drm/i915/i915_reg_defs.h
>> >>> index be43580a6979..b7ec87464d69 100644
>> >>> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
>> >>> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
>> >>> @@ -119,6 +119,34 @@
>> >>>   */
>> >>>  #define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) -
>> >>> (__a)))
>> >>>
>> >>> +/*
>> >>> + * Like _PICK_EVEN(), but supports 2 ranges of evenly spaced address
>> offsets.
>> >>> + * The first range is used for indexes below @__c_index, and the
>> >>> +second
>> >>> + * range is used for anything above it. Example::
>> >>> + *
>> >>> + * #define _FOO_A			0xf000
>> >>> + * #define _FOO_B			0xf004
>> >>> + * #define _FOO_C			0xf008
>> >>> + * #define _SUPER_FOO_A			0xa000
>> >>> + * #define _SUPER_FOO_B			0xa100
>> >>> + * #define FOO(x)			_MMIO(_PICK_EVEN_RANGES(x, 3,
>> >>> 		\
>> >>> + *					      _FOO_A, _FOO_B,
>> >>> 	\
>> >>> + *					      _SUPER_FOO_A, _SUPER_FOO_B))
>> >>> + *
>> >>> + * This expands to:
>> >>> + *	0: 0xf000,
>> >>> + *	1: 0xf004,
>> >>> + *	2: 0xf008,
>> >>> + *	3: 0xa100,
>> >>You mean 3:0xa000
>> >
>> > doesn't really matter. This is an example of register addresses. They
>> > don't need to start from 0, it's whatever the hw gives us.
>>
>> I think the point is that the example is inconsistent between _SUPER_FOO_A and
>> "3: 0xa100".
>
>Yes. It's the inconsistency with _SUPER_FOO_A that I was pointing out.

ah, ok. I will send a fixup to this patch.

thanks
Lucas De Marchi
