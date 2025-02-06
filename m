Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAEEA2AAD3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 15:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD32D10E86A;
	Thu,  6 Feb 2025 14:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CAgMeCc4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD9A10E869;
 Thu,  6 Feb 2025 14:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738851229; x=1770387229;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=83Gqa8PCP7i3DZXXsDsSLw91ew7OJzntpm427PQFj08=;
 b=CAgMeCc4l06WE+vbgpo6tq/hCijm0NN3Hu53odAWi0czQuLwx2+eWxbg
 PBv0qQiFTjGiGnRqU4YKAtHRuKYuuYpukThDH/mMZy3ZI3g9P6n2ez1Gb
 8l04Ev0bJJPirzfpjgyPlxapjqkAN6J/nkIz56B8F5I0TBxdIe/YxYkTZ
 RjQ/aD/YURrCB/gyB+1qQHIY9txue4xgr3V7x/7ZEYLAz+sd8r8mK19hP
 6eO317eRKwXRQRtT9CrNoOe+Ff4aN4ZaPn5QpuDdR7R9fAezjrlixIWes
 WE5YzdeTHfLtrYfHYy2KkxanZdXm1W8VyjDr4Xw3dTs66cAKc9/ESzhNa w==;
X-CSE-ConnectionGUID: BwpgW719RgqBzFlvOjuEeg==
X-CSE-MsgGUID: q7hvKjHNQWC2vJzdJgGUHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50093183"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="50093183"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 06:13:48 -0800
X-CSE-ConnectionGUID: atq6Rd25Q76L4Vk2Ml8iUw==
X-CSE-MsgGUID: +ykACxZ/RR2yTlmHf2UcWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116413842"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 06:13:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 06:13:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 06:13:47 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 06:13:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZ0k6J736j26PMMZCuEcQE7tzwOj1fTqW0T41AoQXL4nuZE2vkc3ZeJSKbHMHqU/kfKICmE4sXbXLaar2xHZ5LWhxkbuaUDbH487Ydvi6UVpK+JJzOzouDRftlCOQL+7yPZ1aPxYtHbRHmnI2Q14jstztG1sA/NE3UtpKE45Wt0B3JFnW+DIgvV387ik0SOVuAL1zyiD/JkL87jYnrQvFN4guCPYJvGM938RrPqyEY4XM5QrycveD6s9lgdaHaS2WAAVgz5NuxRZ+JiaM9Kb1wJy/HCrHU6gGfkmkWchhAX0WpI6opfXXLs84444SGtcw1+5RdF3dKvxJWbabti4Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVnuUjyYTs+0zzoanKb/5PgEN4ZZv0ZhK4crncrDu4k=;
 b=UTpo0h0TV8xjhPFA51eoHKyPNCjir5PaGrkJxVWMYUp48i/tJsUYFviyT28qOlV2lOCJsOKctlbQFctMO9fEhYAHkBijxx7ZZb8Ty49jdjhdPFpCvycv6aDWrTdLECRVOB8vjmPNOVJ1JoS48t/+rwb+uWaZmHZ77dj51RYhp6hHMDQKr91gOiWtYeUlHfD3IC8K2mJPC5WqoBhTe746hoeXZj8OaDAUkCso4Ih3aWPV1083EMxPHBstBjxBIiq8iCnt+RFXaUI9hHbAde/3vtistTsrpZplYYl1pT4w+5qYiO0qtwRneL1zSrCc75nj7eI6+RrKU7U3M7bihei3iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by SA0PR11MB4765.namprd11.prod.outlook.com (2603:10b6:806:9b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 14:13:45 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 14:13:45 +0000
Date: Thu, 6 Feb 2025 09:13:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dim-tools@lists.freedesktop.org>
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <Z6TDlClHPoVma5ez@intel.com>
References: <Z6TDHpgI6dnOc0KI@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6TDHpgI6dnOc0KI@intel.com>
X-ClientProxiedBy: MW2PR16CA0013.namprd16.prod.outlook.com (2603:10b6:907::26)
 To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|SA0PR11MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e7b053b-5ed9-4954-b4b3-08dd46b87794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?xO1eax/+ew0Ct6MHQp1XjizfwGE14QHpyBo4mMMQ/SCa0z/8u2pUebubLs?=
 =?iso-8859-1?Q?P+DzCSA//mCtjPcnZEgj24QZwLGnsFU3tzV885YzrY3Z5kJnHI1Jo1bxgz?=
 =?iso-8859-1?Q?ZpHBwOmLJ3ESJD17t0vW+ZmStyP6Ha3roFIGNvCzEF5D40qJTMMaG7QLte?=
 =?iso-8859-1?Q?mbO9NcVIEVCSjDaK0scYiXrKRRWAZNvcyPlDAixvRHUAB+VK5QBTayADqq?=
 =?iso-8859-1?Q?ZHUiUDzlHGc2qrWiDKFyBmEzuH6eR4nml/T5e1CoqdHjFyEH9d/PmShhOt?=
 =?iso-8859-1?Q?wVtFu6/Hz5fYPPcOqxX24J+O7UXV2LIazNElDqeRN/2q2imJoOscEdcPXl?=
 =?iso-8859-1?Q?4w4SIQkWZsKOStbkIrptAUHVgmdwB0JONSLWjwCrdpvnZ4bjjz3eMtZxwV?=
 =?iso-8859-1?Q?k2NWrVnPblIQ6/9OOGe9a/AFvYpvYmBFx926csPbxhDukAYNCKB1W/O5j3?=
 =?iso-8859-1?Q?/N622KXruPjOkY4mplc6TOuCEWeH8duSbZSPG1wQJ2JF8iYkOfMx6KUslA?=
 =?iso-8859-1?Q?krxi7RLIEoz9ehyD7T4D/Jri5heVyDd6JAdrNPaIW62VfYNH0UHfmFm5HI?=
 =?iso-8859-1?Q?aPyN9ZliYJADlH2ilcmtjqfqQfQe1u83kaTScMGZ0KjfFvElFvM5TN6v/I?=
 =?iso-8859-1?Q?6YSUVAkTOMdt8YCg8sxlJXQkEeIGH8GTl5jz5K7r8AE1B/Tby2HwMoHHqQ?=
 =?iso-8859-1?Q?DrzZXAbPI0hqKE1nWLKbedBPOCgIISZeY4lFY+rwmkdjb0QrwpECpU/gz5?=
 =?iso-8859-1?Q?9dhJ5C7+Arpy9kz5pb8fehI93NwzUzI08v4SJS6WS2WH49dj2vuvlCyeg7?=
 =?iso-8859-1?Q?IsF4/Z7PLxb4X+XebrdUqC34WprpZSNfAKNVfLBhQl41ssF0goyEeLjKDP?=
 =?iso-8859-1?Q?g/bjEzu+2skn6iBpLWZbASzNvrVddNG+pNtlpgLOcu+QPoAFJVf5UiRcN2?=
 =?iso-8859-1?Q?u5pdRCid0X4jHk6KGT2nfcIIgyaXCsDRw5dw3bglFDuuuWQLEwMQAWVpo+?=
 =?iso-8859-1?Q?LOsl3KQ/R41eVUbdtVr9VO/5ZULlEEp5VgDNh/CNpQYB2kFNmBIl8Hx8UJ?=
 =?iso-8859-1?Q?Yra/106jwh8Ckg+JI2arg5Kg+NBix94dWFeXUQv7erwRYgOTtxdVFW3Xqb?=
 =?iso-8859-1?Q?w3sYiyJGOFp9nwd4GmYbRpmhSDJATG5ixLWL9UeLRjKHA6uya036jf9ABp?=
 =?iso-8859-1?Q?1+Z551BstEHqepBoTN6Lfwj+s8/dydUl76CWpk/LZeZcQE494Mx1Udx5Wi?=
 =?iso-8859-1?Q?zKq+xdF6wW6GucaYS2hq0yTr8jCxiPTljs6flYmmA6eaXZN5SCpPLzlF1R?=
 =?iso-8859-1?Q?e1XO39OMaUaWQbdONhxuu+KZqG/jhCTvm9RDNart531oY+7hRMlDwoM+c8?=
 =?iso-8859-1?Q?F70wV4WaAgX1B+hDYSOAhtPIjv/Ihdeg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?A/2pEoSOg9Wju3/5Y/6XsjQketo18b4upxBc62RYkhRQB8aokTEaLswtp+?=
 =?iso-8859-1?Q?fx60JMHFyfb/x63WUI3XcMJn5Gk7UIpRLeUuFWkBDluXhANZHzKIjA+CJd?=
 =?iso-8859-1?Q?/ek+xXU2qtQqoCVLK4s22XerA1mF+ED7D0B1liImvb7+pQUL8zxfkOFutm?=
 =?iso-8859-1?Q?OERPD+qFgWgstsVsuI7WqSG7Qr7lxyYQAe74ZpCfjqHq2Gd4Ax9d/BC+bf?=
 =?iso-8859-1?Q?j8EZsYVZeDuGSAsZw9DXnRj/eK/6sIOQaswmNIgv8Mmj6hrYqUbGdeSkrS?=
 =?iso-8859-1?Q?wlfKa+3/R3zawDBDUlZMfxViYTPRUTuV5DCWqcEnCuvcBgM7zHCJf0TxD1?=
 =?iso-8859-1?Q?IRPcTjOk3xh0FXmtxhwxM5fikmF4caJxr63HSrH8gXbSC5+88riSPvOACr?=
 =?iso-8859-1?Q?7cqGUA1BCQk4S5/VFPasvMVs1HPBH2i8X/L6RK9fhS+AKEFrY9dDIxhl5v?=
 =?iso-8859-1?Q?jo1RaEDGyvv9GGm/z8vGPT2ctZ8vXFXADpOB47u8ikRLwj6uOZrRUMTSio?=
 =?iso-8859-1?Q?vSJYCRh0xEC0RbkypGHOq3DiO/qsztA59BHHkm8vsaFjFOOhTuZ7eYcWpL?=
 =?iso-8859-1?Q?uzBRcX5b5cpjnXyHNfF/fymyUh7b9uArOs2jVG+uiSRHucE5Ygi8dcutHt?=
 =?iso-8859-1?Q?r9RymsVRF0BKkKw7t0+0M9pJKi3aHjH+mp74uyujHDZOmaOMmPqp0aWtvd?=
 =?iso-8859-1?Q?DwBqdy6leMWZnqasAv/YqBixSND2XEAFKm11NSz0NlrLCPVzS0hE7MTET7?=
 =?iso-8859-1?Q?uxpGXHcMfN4BWGqcMijwlGxRyIbU5HLiX4DRdhOxSS3M5ikoOTNY0NNMxa?=
 =?iso-8859-1?Q?2Rc30HkOKDU3vOwC2aCOz6G5BKDzsoLNslR6tGH4uM5qK9jNhlji0hwyLp?=
 =?iso-8859-1?Q?E2EPsjBj9QDYibGIxND3O2wHNQcLWqVO62P2DQ6k8o5DJINTKjHz97EgY0?=
 =?iso-8859-1?Q?DSA29SapN9Xn3aWS7QQDFE9lhwAEtE1zIQgBF6Q6Vi4BnnAw8uLqh2NT4E?=
 =?iso-8859-1?Q?hpJwyyLbe1CEp4Glf7d8CtmHgGpVpoDtk81SWMqTpI7rmg+jpcLsVAzW9c?=
 =?iso-8859-1?Q?W5g6EpiNESbQ7/RoM0LIS47JlXzA7YWeITwImMQ+7OMXtqTBwkGcu4sklH?=
 =?iso-8859-1?Q?h0QtAgXhBIGtIly+uNHy5o9iHEQlhZH9y7OIpJXVDMSGdtY/adsrrtB1R+?=
 =?iso-8859-1?Q?yXIv5dOj68O2Y+qZnKxkCxp3eJ784Zc3UjouqgJlrMVnQtOX8zduZRVm0d?=
 =?iso-8859-1?Q?hvMZjmGKuuVW89V3lwncrpTpMrkc3TSxQFwwXOd0m23OL4L2dRz386veKB?=
 =?iso-8859-1?Q?qXcB+U8eDEFrn5tpJHTou0mjQ4KEzEv+pr+6CFjsCvRo06mLNqknt2s0Hu?=
 =?iso-8859-1?Q?xXYhZE8sz/SxGoBSvBSTdZ8ogbweW5tApwuAIsOz7FTF7BodHvp8eb0xcU?=
 =?iso-8859-1?Q?NX2R78C1YhmQ+8gJ3PcrV6BU+RQhazFR8lWSTZQy6b077InhruXgCWd9B+?=
 =?iso-8859-1?Q?s/wu6fO/n5qhZUl++9KtOS417qkZE9YRczZFYb7bhwg8OfeGOxmSfEaUUf?=
 =?iso-8859-1?Q?LrTESoq6xCmOwvP8iDLIq7KpOH+LNAgpNVNpKjMnpgi/zOa2DnSvZYSvsq?=
 =?iso-8859-1?Q?sotvdBdkHIxb4Nj4Z/Qzpa6pmEZAr5XdF6n0gr8jCGRjyNcNOUBOwsBQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7b053b-5ed9-4954-b4b3-08dd46b87794
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 14:13:45.3492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9b9Sq99irVbrhaL0kRaZD5+fzSXjnJuXX7jhyJaPeqSSeXbOCJRHTz4YhPVBV+Wa+3yQfTC1741Wz8mIxQaRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4765
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

On Thu, Feb 06, 2025 at 09:11:42AM -0500, Rodrigo Vivi wrote:
> Hi Dave and Sima,
> 
> Here goes the first i915 fixes towards 6.14.
> 
> It looks that our CI was dead for the last round, but I double
> checked locally in both ADL-P and DG2 and everything is working fine.
> In the last round the only addition was the Jani's DP fix, that
> looks correct. So, let's move forward.

I forgot to mention that the most critical patch here seems to
be the Guenter's one, which fixes a build issue that is blocking
a few configuration. I should had propagated that in our -next-fixes
rounds towards -rc1 but I missed that. Sorry!

> 
> Thanks,
> Rodrigo.
> 
> drm-intel-fixes-2025-02-06:
> - Fix the build error with clamp after WARN_ON on gcc 13.x+ (Guenter)
> - HDCP related fixes (Suraj)
> - PMU fix zero delta busyness issue (Umesh)
> - Fix page cleanup on DMA remap failure (Brian)
> - Drop 64bpp YUV formats from ICL+ SDR planes (Ville)
> - GuC log related fix (Daniele)
> - DisplayPort related fixes (Ankit, Jani)
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-02-06
> 
> for you to fetch changes up to 069504f1fcfa1532e4e221290df428b15bd9d284:
> 
>   drm/i915/dp: Fix potential infinite loop in 128b/132b SST (2025-02-05 14:42:42 -0500)
> 
> ----------------------------------------------------------------
> - Fix the build error with clamp after WARN_ON on gcc 13.x+ (Guenter)
> - HDCP related fixes (Suraj)
> - PMU fix zero delta busyness issue (Umesh)
> - Fix page cleanup on DMA remap failure (Brian)
> - Drop 64bpp YUV formats from ICL+ SDR planes (Ville)
> - GuC log related fix (Daniele)
> - DisplayPort related fixes (Ankit, Jani)
> 
> ----------------------------------------------------------------
> Ankit Nautiyal (2):
>       drm/i915/dp: fix the Adaptive sync Operation mode for SDP
>       drm/i915/dp: Return min bpc supported by source instead of 0
> 
> Brian Geffon (1):
>       drm/i915: Fix page cleanup on DMA remap failure
> 
> Daniele Ceraolo Spurio (1):
>       drm/i915/guc: Debug print LRC state entries only if the context is pinned
> 
> Guenter Roeck (1):
>       drm/i915/backlight: Return immediately when scale() finds invalid parameters
> 
> Jani Nikula (2):
>       drm/i915/dp: Iterate DSC BPP from high to low on all platforms
>       drm/i915/dp: Fix potential infinite loop in 128b/132b SST
> 
> Suraj Kandpal (2):
>       drm/i915/hdcp: Fix Repeater authentication during topology change
>       drm/i915/hdcp: Use correct function to check if encoder is HDMI
> 
> Umesh Nerlige Ramappa (1):
>       drm/i915/pmu: Fix zero delta busyness issue
> 
> Ville Syrjälä (1):
>       drm/i915: Drop 64bpp YUV formats from ICL+ SDR planes
> 
>  drivers/gpu/drm/i915/display/intel_backlight.c     |  5 +--
>  drivers/gpu/drm/i915/display/intel_dp.c            | 12 +++-----
>  drivers/gpu/drm/i915/display/intel_dp_mst.c        |  4 +++
>  drivers/gpu/drm/i915/display/intel_hdcp.c          | 15 ++++++++-
>  drivers/gpu/drm/i915/display/skl_universal_plane.c |  4 ---
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c          |  6 +---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 36 ++++++++++++++++++----
>  7 files changed, 57 insertions(+), 25 deletions(-)
