Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D562DD25583
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 16:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEE910E792;
	Thu, 15 Jan 2026 15:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsI2vx82";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0CE10E792;
 Thu, 15 Jan 2026 15:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768490985; x=1800026985;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0A7SE5T/r1Wg+BtO7JyuvpxWntZseBUEMfi957N/VUI=;
 b=jsI2vx82kNvUiBtP3+hKGn0hLHmhFpKmU6z6EC3CwABkzz/dL/F33Hxb
 RJWSxZRV7qd0GzCdQczp26wgyzqQ30soEPzBVOIaKlvdJznI7LVOMt562
 jS6CsjOG0x/iMEaO57j8sGlf8+Rmftqak/MnaJlUxydKvjB/qJlGBS3WB
 wF/bq0tu8Dcpie3E9F8TEDKFD7j+AjLqoh5O/BOO499R5D9PTDHdEEuxI
 +mcm9yeULxB9Zhb083t0Ix1k6ikeKSwvAwdAfEdhroqYp+Su+aZ68mMYR
 cGyDaYgc75xUur2yK1UULwYnW7LSb2AqwSgvdUZ8tXoewwSa+U6JSrmC8 g==;
X-CSE-ConnectionGUID: DS8oUnP/QKSM46CY4/F8HQ==
X-CSE-MsgGUID: mOTT4/EQQXOM9RXDNfmxNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69850272"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="69850272"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 07:29:44 -0800
X-CSE-ConnectionGUID: gkCstFr2Qi2Yn8/JIvQMZg==
X-CSE-MsgGUID: XX2BYH+RQzm04T+3Wi/8WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="205260383"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 07:29:44 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 07:29:43 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 07:29:43 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 07:29:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cko/1tlA3XWzgOYSFOfG2ALe8r/omkJzZ0KGILQg6E3ljrDsFvgnT5btHk+ZT283nItWoir/QnV9h/sl1t8flJzDenz/SxDRjg0rlQCeImhaIxtOfNMZmdjLX80gAMYKTcvj6nT9U23oM0sF2hXo0MmsJBPI2cvDQBeu9WDjrQ5kfzOQWMJjLWSifTOb5nCMRwe4Qe5po/Fty7V+WRzjdzU9e+w0wRBuAVAQ9nx1D4T7DZjPl69N07+Il8abFy68UD6RmBY5ftmnVLDc+E70L8r6I2ke4dEHih1ZFIq23gX9f+FHp4gGNVu0ZBUDcSLv8uqU7fFWFnKtJA+5ByfLKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fes0erioX1jFI8XOHqSuQ7pLUY9JuWhGdEKprQ9v0t0=;
 b=vcgPxiBKzef9VNXFfof1bf95zbP62c8Z4i/xB9ez6nUT6WYI66JqESfmiTJSQh8GJ5ztA0iP8Sv8/xDBCbnzLLMkU3F2gtRYjHIFjsPhpVd52alV3QfBuqoPh1bvISPPqX4XKNbDtCcq4GBG14RR7HVi5ZxHWZB1qMd7RiqlCG57NoTgHjEqTq1sQJlMLdctBisCzKP8udBSGn6xhdqC9ynCevU5UOsGVSsmMdmQaI5c+y2kA3AfT2VvT6XrVkBc3oJJJI8+r51QdlFEbZ34DKbCem9WKCp7IraSlKSqJ7YWRIAe8ZEjPB8D3QY+dUZY96VGOWkxVb+y9fsCqbYkTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB7025.namprd11.prod.outlook.com (2603:10b6:510:208::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 15:29:38 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 15:29:38 +0000
Date: Thu, 15 Jan 2026 10:29:33 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Harish Chegondi
 <harish.chegondi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Thomas
 Gleixner" <tglx@linutronix.de>
Subject: Re: [PATCH] drm/xe/eustall: use bitmap_weighted_or() in
 xe_eu_stall_stream_init()
Message-ID: <aWkH3erGBlWQueX7@intel.com>
References: <20251216000259.331293-1-yury.norov@gmail.com>
 <aWEm69i8r6VJtrsx@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aWEm69i8r6VJtrsx@intel.com>
X-ClientProxiedBy: BY5PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::37) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: 802924d7-60f3-408b-3690-08de544ae4fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JF/wPBFX+iD9J+YayQHzRFqPl5TiIpdhT929UIrvQhJfGA6abzyNXrMysU7S?=
 =?us-ascii?Q?oXRlLbDC1EjULYA89lHuhsjJPYRP6/SFuIgI/Ghef6f6Y6o0W4V+UBl5RuU1?=
 =?us-ascii?Q?6PPlvnkHGwV9vZM5RGYTa1ydQRE3u+Fwhz2Qichg7PCpaHkpI90OJh+/ZMyw?=
 =?us-ascii?Q?juA/dSdFaUql/47isRG35Ad8XIIb0RPK1zsjgiowzDdjxi3Pf5P+mnkzWrln?=
 =?us-ascii?Q?GhAkbjkCVNfjF5Ag+hL+VihODx4/ABxwETR6vUiPNhXhO7PeMOjiUmrVm/ED?=
 =?us-ascii?Q?K7NfFWlqt2FOlDFZaVWbb5dW/C36TCbJKhHs9f9vvyzwgP0dCrCD97mTzASk?=
 =?us-ascii?Q?drfNn2oTbXCZjzEWOB06CL6b9+TLSdtNhzA8Fa8AHN2Y0Y4o1VXGkM5JL03c?=
 =?us-ascii?Q?x8nikvQoqogyfrwuEATxxoMYTaK5ZtF3VbsTUKWAyJixGKbUQ9raM1qzfmpN?=
 =?us-ascii?Q?7QVohGn2coJSWSNmQyCHB/jlR4vw2ysB9tuKPdzhpSR2j5W8D0ybVOkXjqBz?=
 =?us-ascii?Q?ykBHcJ0XaKq65CS/7a35acUmIjRld/JKsPszZrZWCApp5i5GcbI0xPM1RN5u?=
 =?us-ascii?Q?CXP77fDeqe8JS73C+UyJZoO/PqmMpa/B1Bo3MZzaHe0QFGi7bTABH5DmRpBa?=
 =?us-ascii?Q?VsmczE2evmBBYn/zr2tUdYqj40PHbmfFMNj1ev9991354RL+SyJvocMMQCIy?=
 =?us-ascii?Q?WosRew8rUL3qUeHk1XOr5lJp5SPT1pebRWg5GWm8JY3zMIOtujrYhpnjLeTw?=
 =?us-ascii?Q?zdlBY6f/iNGLtLXg1m1rMRCzFLlO8yIy2tBwmPEYtvWEahyI4vmL/yEFPOag?=
 =?us-ascii?Q?MhPbclphdH1CveRoP8S/OUoTZ9E9+7RsQ+WU1BDgoBhvkFr9xiITw54pWHgi?=
 =?us-ascii?Q?OHFFs+gswk7DRakA5X6XCV4NOpWv2Ek2CBBtPmXS0fNEevli9BSomCSMXabP?=
 =?us-ascii?Q?0FgtxyTrRvwU0RZfeZ7ttPyrNtFMGBf4dRNhYtYr/h3I4SbNMTbeE9ecxeK6?=
 =?us-ascii?Q?Uc6wP65PURmL81BCuZ/fVsK7g79ne7jjAzpqRiSdAdWGvFZZKvSv8gHIy9lO?=
 =?us-ascii?Q?hKuZxwHWHlOcXrLxivkhV/VyoJ5e24e84z207pjZfIufMaATwvquwr7RAAYm?=
 =?us-ascii?Q?gq2f0oBsfjUZZXbnqt6ysm+OjkEbeJZKV6TCf9YCXLZvgx0liAXFIQIMlrC6?=
 =?us-ascii?Q?Tziyzwrvslju/GUSaEPQfOZngVHn+C2i+kHRaXxE5L3m1vs7z/ZRJBsS7CU1?=
 =?us-ascii?Q?j6rEpkSnww/dTf+ogrdWhnuqDNgH0IjVxqoE4doo9LCcpGotYeWT5WQXL6PF?=
 =?us-ascii?Q?UsVHrDaB+wynikJ8GBMHl26A+7IQzBe96LWJl1HH75p5TX5VpKzlgu2kYrTc?=
 =?us-ascii?Q?7cKOBGveiig4DR3JCL7rEvRXnH08/FKtXAegyHdnf6Z6GyN0awGJezvPk3EJ?=
 =?us-ascii?Q?zBSEzEEZDSpVmCrZPD5tfCiSuqaSKJLMP/Ovs0xsUymC2PK2eX0v06c9KED6?=
 =?us-ascii?Q?F/wVXrzJFgk/7u5UmkaaHAOtpvFYD9J+IWQ3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z79zqM1P+Sfp5/oOSd1gcUVF1ZBh4zNzhDuILxYNs0rolDIErun8yNZaI0n0?=
 =?us-ascii?Q?HvMbMhHm7QNPCuceUbPlp3AzS5pv8o4ugoboBnEWHF/+adE6C6DgtGXLzqok?=
 =?us-ascii?Q?Xg2gfQSCzHzI0tkKDcJo3pHtAlUl9hGh3PUXauJxnpkBbOc911KthyY8xcsY?=
 =?us-ascii?Q?SiqLUeX2F6Ys1X8CGPD/45J2Z/R5HULN1sF2KhqYLyepxf1ZRjdCvRvzaisI?=
 =?us-ascii?Q?/Pe9e4Ms6s69B7SV/yY5czkQOn02PLFsERtdt6AgvMi9WH46DlPHwe9ruxvz?=
 =?us-ascii?Q?xPcdzFCtHCnLXV04iMgn6qZd/H6lN3//lWpeUddQGECiCGyDNruq1//tuK8X?=
 =?us-ascii?Q?v8aa+ZOIcK7osJaQUKDsm5M1SMpiwnPTNYQQA0Q237fq9SsJ58m0V/l3v53V?=
 =?us-ascii?Q?hdX1F1WLrUqFoCsnf/U9nH9jAhPre+7rjJrwsKTWdQVMGOSvK7fB7BXSYHUx?=
 =?us-ascii?Q?5uKrO5CCBpZl/NVkcCRZ8XUaiOXtBYjF0/Zf3eZ8jnv/OFpq9rm+0iqMAE1n?=
 =?us-ascii?Q?d/qBStG5oILe6x1wvIvUGvP8RxX1UYXsbGjlBpheNhgQfQ6TnKtpFQ5pNNmh?=
 =?us-ascii?Q?lhsRRzfaMlL/ggZZOkga4EP29DZ7trInPej+c39hB2mRPx+eya5ZGsN/YjGd?=
 =?us-ascii?Q?MZEREA1+mZuqIY3O4Ie3IV+m/E0Awx9gNtS0wRuIt9BS9mPfZC6Mi9RvHU5F?=
 =?us-ascii?Q?wU7QxMbfgMGokU/yLmn9MY66NdoCK1rSgpB9HCFbq3PID6WqXWD1VtVHARG+?=
 =?us-ascii?Q?8Y1oa8kQUk6IYtGVQpjuTujuR0qupo1MJiUm8WPVNTBla0ICCap/bZuH7XQA?=
 =?us-ascii?Q?oA3aT2jT/bmRO452lHNYEIzrzUAnsM0nWNmt6k2oFEbAnY5EVUyptrAACNBc?=
 =?us-ascii?Q?Z1Lclz0vEet3uWMCRoCeGvcxyANvu8GCFxqILt5MK35VTe2Y7zOMgyIEoqxH?=
 =?us-ascii?Q?bXVThHb6Mbp+NVy7+BMeACn558Z6q1XrhOPBxhQ9Y1EDNvxtv4IEV7VaWT8p?=
 =?us-ascii?Q?Q7TJwOC+D19lrDMEV//elL4ekJNPHS9IOnyVM3/Y5LUd5q2K1EhzAhrDkW2c?=
 =?us-ascii?Q?702fuDCgfGoFDwOXcv1XfG58AFWT6yzGWE2PIvc+y8Fkp0MYSae7FM44rQLL?=
 =?us-ascii?Q?e37YPgSYYXqn8GeSXiFj5fzUklLgLjLkolk1NcPn1wxasxDEz4uBeq48zjOn?=
 =?us-ascii?Q?VQfOgQI+5ONEE8MWdpw5Fap8vq4VM90FKRP2obJzuQhveIF7/q6pI0uk7LFY?=
 =?us-ascii?Q?5uLoVY9dbtZjIaYCBCAD5XVykUhcRcDBEPjuQGOQ6V4j7MWyij3tRTuuVtjN?=
 =?us-ascii?Q?Ee47RpnyxahuUWbCDD5FwzAzYauHjdyiPI2tgEf/gvWtHNUZV6WSppJosygR?=
 =?us-ascii?Q?bIPsxlgtc83Ji+jIe4u7pfsvc241fmdQ4wrB1uHXEeFtp9I+e1A8sYDQvsG8?=
 =?us-ascii?Q?Plsb01dPyTPbgeRA3Gf+PKduszRghQFY1sf1mVQvLGIty7eScWXqNG25o54S?=
 =?us-ascii?Q?zjBkZL5fMPlN9972eQAjSRKkQyRsGZ28qGs6WFvvBZIiG+FksfgWJQxX+Kg7?=
 =?us-ascii?Q?51LcJ3pSXCw+huct4VdOEwrpZDJPQKNuymR3fEfhbKNsj8YtEjX8beWP2yJt?=
 =?us-ascii?Q?Xyco5AyNxGSCWujm4XJ9z6amHBvrLatRbk/KUOYOfKXeS/cWAKNDHFOAbo7Z?=
 =?us-ascii?Q?MEKThyEu3fQLKlj+hcRH+uJXze4AzKETMKM+rjdCCN8Vw8wGZj/VtDaiqqmY?=
 =?us-ascii?Q?dyJvoA88Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 802924d7-60f3-408b-3690-08de544ae4fe
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:29:38.2268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4SNSLvLQ5smOibG3zga34slIw+a09EH6PDSQ6hbCtIW1Z4TF0OlUnLT6fXbVFvDTaLMKD2H1Y3eTmw1loxDv6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7025
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

On Fri, Jan 09, 2026 at 11:03:55AM -0500, Rodrigo Vivi wrote:
> On Mon, Dec 15, 2025 at 07:02:58PM -0500, Yury Norov (NVIDIA) wrote:
> > Commit 437cb3ded2503 ("cpumask: Introduce cpumask_weighted_or()") added
> > the new helper, which fits well here. Use it.
> > 
> > Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> (I'm just resending for CI and will merge after the confirmation)

ERROR: modpost: "__bitmap_weighted_or" [drivers/gpu/drm/xe/xe.ko] undefined!

https://patchwork.freedesktop.org/series/159059/

Could you please check and fix this?!

> 
> Thanks for the patch and sorry for the delay.
> 
> > ---
> >  drivers/gpu/drm/xe/xe_eu_stall.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index b896b7ff5900..8bd4307afbbd 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -737,9 +737,9 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
> >  	u32 vaddr_offset;
> >  	int ret;
> >  
> > -	bitmap_or(all_xecores, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
> > -		  XE_MAX_DSS_FUSE_BITS);
> > -	num_xecores = bitmap_weight(all_xecores, XE_MAX_DSS_FUSE_BITS);
> > +	num_xecores = bitmap_weighted_or(all_xecores, gt->fuse_topo.g_dss_mask,
> > +						      gt->fuse_topo.c_dss_mask,
> > +						      XE_MAX_DSS_FUSE_BITS);
> >  	last_xecore = xe_gt_topology_mask_last_dss(all_xecores) + 1;
> >  
> >  	max_wait_num_reports = num_data_rows(per_xecore_buf_size * num_xecores);
> > -- 
> > 2.43.0
> > 
