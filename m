Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEC1B00E9C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 00:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA9710E237;
	Thu, 10 Jul 2025 22:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UCPI71/I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8539D10E237;
 Thu, 10 Jul 2025 22:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752185863; x=1783721863;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=lSVJdh2svh0JahJAbzpMppOvPkfeh98mKv0woQKeAkc=;
 b=UCPI71/ITsgwG0Ted+Oz0AZsBMJvhvWcZpMsgDbOzTjiU+wdlGwBkPVl
 IK4maxe0ygGfNq53ZMrMY9S627YBu3BLcgPDBUpCH+rXULCCbzMsUGxAw
 NcE5CAh/xzWS6apxkBcax0tIMiuwQm5Uk7fCaKdG7wd9ui5xFdgQ4TN80
 48OxQmzVA4YAsbDTd5fc/yqp/9lV+PIgDMFF6xnpNcA5tjv4+VcKMp08N
 C0jIhv4UpG9Oy6odvTIUn6bTfX1UrkE43FvN2wn9bjSMqe2FIL3yiH87E
 Sb1Gv+Ul+o3TmKlLCZOdJY82d9dB1l93cFcTlFOUX1Y0gBI9eJ4585Ph/ g==;
X-CSE-ConnectionGUID: XA6VaRdOS3SO3fBZSwaz7A==
X-CSE-MsgGUID: 9p6PULuvS3uN9e9S/UR0aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54634605"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="54634605"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 15:17:42 -0700
X-CSE-ConnectionGUID: 90O4fVMCT7G7h25T5z4l3Q==
X-CSE-MsgGUID: rhsF4roSTn2NJPc/hVcwjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156696652"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 15:17:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 15:17:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 15:17:35 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.83) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 15:17:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAXKZxf6eDsT9P7OdjCNLMGZbGzKNhkBzUVnhsY10U6vKaQbBJEcxhqLnjFH3wMS6LiA9fxAWiWZ1WEjPwT/gCTmK0ALcd7giBLlTsPTYM+C2Be6BmbqGI/hkYE+S9a8QrHDcdgoM1n+/XL7e3D1acDmIyfcSyCC3i+DvQrPp906OZ1v/0837Zt/OuI0w6f2i8BKH6oWzi9t3qa5OgikWWpACnt9EJoyOtUE5fci8UHVK07PbzwMTW4mhokHlT1V4zIlvVEUpm+v6IJX5dK+FH3A353qizKt+ArhuEsjgMCEwL4baseQm52yuCSWEQd8XX9tSkWQkolaaDNYntHG7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UN+4/Qb21lIjw4YmUKPB3222I1vPXmSpfUDNb1fcUVw=;
 b=E+/QE7vN583jRAgsf+2TY/lZyQUOoy7CVB9BpTC+gL1CXCC9zVVKKlHlXB+xEy/lA9+FJN+lDbGL14BgtDGwRfsrB6iYAbA2vyoaOB1snrvhJ+dGRe2rK8DUwhWb/4X7EdpbGAR/DUicDEUOzPtVtJS+tWsIf9sfYpt66/drxYSmb7s60J1D8NV1i0oVxn+OWfn9ah/JDcflYxDzZLMifyzBJgYXEowzIwPCM1DjHpYCueffYJBMfB7hhrw7H9Cu4tVN96MxJ2q/pnIKoBigvEUuDR2v6dBfLUgoizuB7+3oyPmhhMIHcPSX70bHdzA3En/qvpNNOt9JjGC5fPFfOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7832.namprd11.prod.outlook.com (2603:10b6:8:f5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Thu, 10 Jul
 2025 22:17:00 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 22:17:00 +0000
Date: Thu, 10 Jul 2025 18:16:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next
Message-ID: <aHA7184UnWlONORU@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0130.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: ddfb8741-f553-486f-c2e3-08ddbfff7d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?x8GFnQfx253FGOlbizw1Y5GMgqqzGWoAh3BfVsVX2zqpyEEsAnFAC6qyZt?=
 =?iso-8859-1?Q?NncNzIhFSOJmPQn9MtbVj8pHR9m5wkptRe5P87GlaM/MNLsK9bFHHpBJGr?=
 =?iso-8859-1?Q?UPOktBb9Q0WMZSDsGxr7khsVd9lFwYQmt2zaLJAVnvZmCQ/IDRXjhcZgva?=
 =?iso-8859-1?Q?Om5t8oar0I9+azpp+mtz/udzFz+vNBejQ3y42UldkcX2Pfu2MfFQcwMAnK?=
 =?iso-8859-1?Q?o8dqSkMBvBdCB6ZMRdYjUPzM3xTy9p/nNzGf2TTj0VOddeFsOGOwu5jaOa?=
 =?iso-8859-1?Q?aDSW9t7q4vYpN/C1gV5dvGvZVH/64sjag20IOVmU/6a2lJ5VJYpcFwmuMR?=
 =?iso-8859-1?Q?oRazTnvP6pG4HdYPZ0vUIXhjKfTkG+rZPByEE8PbBskB+4uSZP+Xb11zp0?=
 =?iso-8859-1?Q?xvbNyZp3Z5a1A6j2Kn8nNULgoJ3s3Bdz+2ZHSBnP4bduIOuHWwA1ajAPk7?=
 =?iso-8859-1?Q?+CaOSSx2aSo9NCCIWIqXyA9vuTWNPNb288oFEAAJCghazHbMPRbA57B3je?=
 =?iso-8859-1?Q?eXZRsFSV6rhNNvqXbfZkx177/vKX7og7W7mE/YvyRrJMaQsjQ+kQhVImDB?=
 =?iso-8859-1?Q?cGNgtBLSUlYRLGeyqBL/onB/DI/v76gsByN7CgphoCzTbag05gDOyDVP0w?=
 =?iso-8859-1?Q?ylPyYojtj1KlAqYXZ4UL0eCtKsRE6bCLpImkd9LU0XUp4fW/oSR+Re58wA?=
 =?iso-8859-1?Q?q8Cc6Jq1KNkOon4HbRGMeSqlRCyuh5CbN8/9TkFUj92rJq31A/5KBOp+S0?=
 =?iso-8859-1?Q?wvHZmSM+85J2y37dRexMBJjP8IWKxYGbIQptplZYVozBQPebWO1w00gDLq?=
 =?iso-8859-1?Q?oqoK170HU/k2vQi6d6MHly0XmaJNOACYW6c+WhRjBute1tT0KgDYlTxJFP?=
 =?iso-8859-1?Q?JT6ZbWQHVdeMu1RxedB49pwQRvA6bA3qRY6zygVZBso3GlHCo3bCKmPtAs?=
 =?iso-8859-1?Q?XWzY274nY2POUFj6C/RDQN8krJPtNRuHPTtzy0cvgkdrB3aAcoOOBiEIud?=
 =?iso-8859-1?Q?mxMXUsBFtln9GBSnWmkoVnfiMwd5TCBcuChLG3iqlTEnZpjKP6EwnrLdzM?=
 =?iso-8859-1?Q?tZE7u2kJKODPgCwRNA2Dphmg/LEC/geTX0ZfzYZ4lDa65VA+dpwkuDZp5R?=
 =?iso-8859-1?Q?fb3cu7FpJKKWtxL4ed+PVb2/YPDW2FYdG/bKSjN7PxqAMt4IZaBQZE0yXI?=
 =?iso-8859-1?Q?CQ8TXRIbfpCgfloQbfzECAKbC/Rysg0/lC6rh37Qrqcs1L0RESdkyd+YXu?=
 =?iso-8859-1?Q?WFat6pc6cSJWS7y5nnOk9dhugkph3HDZdizt7jOwDc7s9pvy2EkxJr3dh/?=
 =?iso-8859-1?Q?X4sKEd4WnoJK33om4EsCB+n7V6Wfz25fADKJg9pxjpGqvIJWgkT4bvImmk?=
 =?iso-8859-1?Q?i0kEtm6V5c37j2IGelJkmGVIelgLxhv31SXgRGlmgBKWg6K9sFRNo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KJK0EaL5gke8EOLQk/X94rX1ZJMGPB1+4BsJf0LalaVT6bs/s2JMVz2MRC?=
 =?iso-8859-1?Q?ZZfQYw9jh5WSXH/QytzXPiGHkx/0LIwPqTtjEri+A6Sz71rImWG3dRFhMX?=
 =?iso-8859-1?Q?1/zo2f0mvtawefTkLvOAbL7ipJAuAeVeZOuMX04saND/L7KWFRkHnHtcNp?=
 =?iso-8859-1?Q?vfGd5V3H7RzQVOlciow1e3j+UxwhOHtOsNSxLsc4URM8LFkGaTvNC4Jljx?=
 =?iso-8859-1?Q?kVZ1mKlaybsXm2BDKq+bVPSvJo4AVZvF8MxpPj+R2p0CeNu2dfTLelqd7O?=
 =?iso-8859-1?Q?+8Fe7zbRnfvWvlQncNQUJQn6JywWD18KAFuHfY0xUGLnvO9OTndlWCZuUx?=
 =?iso-8859-1?Q?xKB3N2dqMSZCEvOjDispzEc/HPVSvwyJWr+D/WRoOp1vwoUhB/yLfXwkQy?=
 =?iso-8859-1?Q?Tr3CXJ0xTJlECRhAoyl6Pf493xh9Y49NC8fhxCiAF242KSpntkOOKAloYh?=
 =?iso-8859-1?Q?rxuh4UjRtz2UER0DIl8W8WzJH51Ovd0v5D1boZAIDfWHPBJN40NxIS8kcp?=
 =?iso-8859-1?Q?kG4nj1q1RXrBVf3vompZr+i5J/pt9zFwLTz1/9YNGOE8SVu4Iezz+GWnJf?=
 =?iso-8859-1?Q?YXugA3X3XPc4p65QcIZv4P2dzrCIQRWwwhnEvTB2eWOJgWricdEEZvHcU7?=
 =?iso-8859-1?Q?G/OcWrIiN+/EdtbBw/jKBl5otx0BsHN83jUTTrF5X29AfvwI0ki3IeRDzm?=
 =?iso-8859-1?Q?CYpb7PMx6lV95KlL+FnpGT+9vje9XPtBDUYSkp5E0gixJf156+buNhlXpE?=
 =?iso-8859-1?Q?ozQZUUtOvf/jo0t5PMrAnJjVnT6dzVkm4rqSMXFPPAq+2vcJNs6AwOVkiR?=
 =?iso-8859-1?Q?9nrUOVMbRINmRkDA03p0VnKFj3+vt9Dqhe5zLD6M79Psh5d8QSrfA5Bo2m?=
 =?iso-8859-1?Q?nHBagF/g5q+dG7bbITDcJ+uIY7ITVFgVXrZzSeJKIOMoyDAROox5NQljfz?=
 =?iso-8859-1?Q?x5ZyQ3XYmTrvDEArgr9aPrg1p9xxuiRZ8InOieb4WG87Yq2SYerfPWLLFv?=
 =?iso-8859-1?Q?9cQ358OmgFSDcZCieKFWNJPpr00zEjnB+DNnR0/e4EYC7vjo015TSrkTwR?=
 =?iso-8859-1?Q?ttGz5HdJFvx4/Hsq6X70EPKIEcfxSsC0FCtAfHesKRlnEZduvVA8KhbEPh?=
 =?iso-8859-1?Q?qOEq0srPUlhlvAuc2O8LAPFi5yHStuWHizhFshPqo+5Vkm4PlV7Tx5Vfia?=
 =?iso-8859-1?Q?QI3zxCuYHQ+ekQ9usRFroLRaihuCjwWrl6p6c1nJnXVKU/nV6ghInR4IDf?=
 =?iso-8859-1?Q?29YbCsq4uptCMfCqsgJJ6wH/NQm6vWVTqIRJELDZ0o+LsNDDd5gZSUc8db?=
 =?iso-8859-1?Q?MkgYn26jiOiwa1caTQF8td5RhV0h9UnHy0Qy7zEqzPFAcHMKk4r2t01Rjs?=
 =?iso-8859-1?Q?1x/nZ5bw+HxAt/s6iBX0TkqnslKHEAsMcoqVtVmkrsxNlIlaczRcsxn2lw?=
 =?iso-8859-1?Q?1zsfC2oBU3/XOalkFsRTd7um4tcAdYO2E2aesSSn4KLdh4o+FBbYhzcUeq?=
 =?iso-8859-1?Q?w8yk0BFSJsqWNhZATWXbubodeMQ50jZlcktp6IjGY4cwuwKo7nD2PQWU6k?=
 =?iso-8859-1?Q?hFaux66QlpRT2DzyiIRgHS6w+QY0ajRzHgyIzgOwij3y4LnIDMkDv8gr9f?=
 =?iso-8859-1?Q?zC5WqnHBJrSc5W4ju0Xdr4QjCxhf3EY45TRSNDtC4ScOv0gBNur14gSQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfb8741-f553-486f-c2e3-08ddbfff7d91
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 22:17:00.2904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3otZOEU1yvZroHneT1Rsek5MJlD5kJ+KYXk4NX01BL0rPNX8z98RYFIbNbpuqskyOZHfRfA1bu6dF0qQmLKG2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7832
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

Hi Dave and Sima,

Here goes our drm-xe-next towards 6.17.
I'm still considering an extra small one in the beginning
of next week if possible.

Before going to the details of what this pull request contains,
I'd like to say that I had to bypass the new dim rule that checks
for proper Acks in the patches. But only because they are in the DRM subsystem
for the restructure of migration in preparation for multi-device. I hope this
is okay by you, but please let me know if I should remove the patches and resend.
Here are the patches without DRM ack from you:

ccfb15b8158c ("drm/xe/bmg: Add one additional PCI ID"): Mandatory Maintainer Acked-by missing.
b58701687831 ("drm/xe: Implement and use the drm_pagemap populate_mm op"): Mandatory Maintainer Acked-by missing.
2ef19be2a545 ("drm/pagemap: Add a populate_mm op"): Mandatory Maintainer Acked-by missing.
f86ad0ed620c ("drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap"): Mandatory Maintainer Acked-by missing.

Regarding the changes itself, please notice that this pull request includes
some cross-subsystem patches for both MTD and i2c, but all with the proper Acks
in place. They are needed for BMG features.

As for the other Xe highlights, we have a new platform (WildCat Lake),
the removal of the force_probe protection for Panther Lake, new GuC version,
and a lot of SRIOV enabling work, specially targeting enabling it soon on BMG.

Thanks,
Rodrigo.

drm-xe-next-2025-07-10:
UAPI Changes:
 - Documentation fixes (Shuicheng)

Cross-subsystem Changes:
 - MTD intel-dg driver for dgfx non-volatile memory device (Sasha)
 - i2c: designware changes to allow i2c integration with BMG (Heikki)

Core Changes:
 - Restructure migration in preparation for multi-device (Brost, Thomas)
 - Expose fan control and voltage regulator version on sysfs (Raag)

Driver Changes:
 - Add WildCat Lake support (Roper)
 - Add aux bus child device driver for NVM on DGFX (Sasha)
 - Some refactor and fixes to allow cleaner BMG w/a (Lucas, Maarten, Auld)
 - BMG w/a (Vinay)
 - Improve handling of aborted probe (Michal)
 - Do not wedge device on killed exec queues (Brost)
 - Init changes for flicker-free boot (Maarten)
 - Fix out-of-bounds field write in MI_STORE_DATA_IMM (Jia)
 - Enable the GuC Dynamic Inhibit Context Switch optimization (Daniele)
 - Drop bo->size (Brost)
 - Builds and KConfig fixes (Harry, Maarten)
 - Consolidate LRC offset calculations (Tvrtko)
 - Fix potential leak in hw_engine_group (Michal)
 - Future-proof for multi-tile + multi-GT cases (Roper)
 - Validate gt in pmu event (Riana)
 - SRIOV PF: Clear all LMTT pages on alloc (Michal)
 - Allocate PF queue size on pow2 boundary (Brost)
 - SRIOV VF: Make multi-GT migration less error prone (Tomasz)
 - Revert indirect ring state patch to fix random LRC context switches failures (Brost)
 - Fix compressed VRAM handling (Auld)
 - Add one additional BMG PCI ID (Ravi)
 - Recommend GuC v70.46.2 for BMG, LNL, DG2 (Julia)
 - Add GuC and HuC to PTL (Daniele)
 - Drop PTL force_probe requirement (Atwood)
 - Fix error flow in display suspend (Shuicheng)
 - Disable GuC communication on hardware initialization error (Zhanjun)
 - Devcoredump fixes and clean up (Shuicheng)
 - SRIOV PF: Downgrade some info to debug (Michal)
 - Don't allocate temporary GuC policies object (Michal)
 - Support for I2C attached MCUs (Heikki, Raag, Riana)
 - Add GPU memory bo trace points (Juston)
 - SRIOV VF: Skip some W/a (Michal)
 - Correct comment of xe_pm_set_vram_threshold (Shuicheng)
 - Cancel ongoing H2G requests when stopping CT (Michal)
The following changes since commit 36c52fb703e90388285963fc8f03cf60f76cbe4c:

  Merge tag 'drm-intel-next-2025-06-18' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next (2025-06-23 10:49:27 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2025-07-10

for you to fetch changes up to 94de94d24ea8cf567ec7254a723c3192c72c2ca6:

  drm/xe/guc: Cancel ongoing H2G requests when stopping CT (2025-07-10 21:46:29 +0200)

----------------------------------------------------------------
UAPI Changes:
 - Documentation fixes (Shuicheng)

Cross-subsystem Changes:
 - MTD intel-dg driver for dgfx non-volatile memory device (Sasha)
 - i2c: designware changes to allow i2c integration with BMG (Heikki)

Core Changes:
 - Restructure migration in preparation for multi-device (Brost, Thomas)
 - Expose fan control and voltage regulator version on sysfs (Raag)

Driver Changes:
 - Add WildCat Lake support (Roper)
 - Add aux bus child device driver for NVM on DGFX (Sasha)
 - Some refactor and fixes to allow cleaner BMG w/a (Lucas, Maarten, Auld)
 - BMG w/a (Vinay)
 - Improve handling of aborted probe (Michal)
 - Do not wedge device on killed exec queues (Brost)
 - Init changes for flicker-free boot (Maarten)
 - Fix out-of-bounds field write in MI_STORE_DATA_IMM (Jia)
 - Enable the GuC Dynamic Inhibit Context Switch optimization (Daniele)
 - Drop bo->size (Brost)
 - Builds and KConfig fixes (Harry, Maarten)
 - Consolidate LRC offset calculations (Tvrtko)
 - Fix potential leak in hw_engine_group (Michal)
 - Future-proof for multi-tile + multi-GT cases (Roper)
 - Validate gt in pmu event (Riana)
 - SRIOV PF: Clear all LMTT pages on alloc (Michal)
 - Allocate PF queue size on pow2 boundary (Brost)
 - SRIOV VF: Make multi-GT migration less error prone (Tomasz)
 - Revert indirect ring state patch to fix random LRC context switches failures (Brost)
 - Fix compressed VRAM handling (Auld)
 - Add one additional BMG PCI ID (Ravi)
 - Recommend GuC v70.46.2 for BMG, LNL, DG2 (Julia)
 - Add GuC and HuC to PTL (Daniele)
 - Drop PTL force_probe requirement (Atwood)
 - Fix error flow in display suspend (Shuicheng)
 - Disable GuC communication on hardware initialization error (Zhanjun)
 - Devcoredump fixes and clean up (Shuicheng)
 - SRIOV PF: Downgrade some info to debug (Michal)
 - Don't allocate temporary GuC policies object (Michal)
 - Support for I2C attached MCUs (Heikki, Raag, Riana)
 - Add GPU memory bo trace points (Juston)
 - SRIOV VF: Skip some W/a (Michal)
 - Correct comment of xe_pm_set_vram_threshold (Shuicheng)
 - Cancel ongoing H2G requests when stopping CT (Michal)

----------------------------------------------------------------
Alexander Usyskin (7):
      mtd: add driver for intel graphics non-volatile memory device
      mtd: intel-dg: implement region enumeration
      mtd: intel-dg: implement access functions
      mtd: intel-dg: register with mtd
      mtd: intel-dg: align 64bit read and write
      drm/xe/nvm: add on-die non-volatile memory device
      drm/xe/nvm: add support for access mode

Daniele Ceraolo Spurio (5):
      Revert "drm/xe/ptl: Apply Wa_16026007364"
      drm/xe/guc: Enable extended CAT error reporting
      drm/xe/guc: Enable the Dynamic Inhibit Context Switch optimization
      drm/xe/ptl: Add GuC FW definition for PTL
      drm/xe/ptl: Add HuC FW definition for PTL

Harry Austen (1):
      drm/xe: Allow dropping kunit dependency as built-in

Heikki Krogerus (3):
      i2c: designware: Use polling by default when there is no irq resource
      i2c: designware: Add quirk for Intel Xe
      drm/xe: Support for I2C attached MCUs

Jia Yao (1):
      drm/xe: Fix out-of-bounds field write in MI_STORE_DATA_IMM

Julia Filipchuk (1):
      drm/xe/guc: Recommend GuC v70.46.2 for BMG, LNL, DG2

Juston Li (1):
      drm/xe/bo: add GPU memory trace points

Lucas De Marchi (3):
      drm/xe/guc_pc: Add _locked variant for min/max freq
      drm/xe/xe_guc_pc: Lock once to update stashed frequencies
      drm/xe: Split xe_device_td_flush()

Maarten Lankhorst (13):
      drm/xe: Move DSB l2 flush to a more sensible place
      drm/xe: Defer memirq init until needed
      drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
      drm/xe: Simplify GuC early initialization
      drm/xe: Make it possible to read instance0 MCR registers after xe_gt_mcr_init_early
      drm/xe: Only dump PAT when xe_hw_engines_init_early fails
      drm/xe: Rename gt_init sub-functions
      drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early
      drm/xe: Move xe_ttm_sys_mgr_init() downwards.
      drm/xe: Remove xe_uc_init_hwconfig()
      drm/xe: Remove xe_uc_fini_hw
      drm/xe: Rename xe_uc_init_hw to xe_uc_load_hw
      drm/xe: Fix typo in Kconfig

Matt Atwood (1):
      drm/xe/ptl: Drop force_probe requirement

Matt Roper (9):
      drm/xe/xe3: Add support for graphics IP version 30.03
      drm/xe/xe3: Add support for media IP version 30.02
      drm/xe: Add Wildcat Lake device IDs to PTL list
      drm/xe: Export xe_step_name for kunit tests
      drm/xe: Track maximum GTs per tile on a per-platform basis
      drm/xe/tests/pci: Ensure all platforms have a valid GT/tile count
      drm/xe: Assign GT IDs properly on multi-tile + multi-GT platforms
      drm/xe: Don't compare GT ID to GT count when determining valid GTs
      drm/xe/xe_query: Use separate iterator while filling GT list

Matthew Auld (2):
      drm/xe: move DPT l2 flush to a more sensible place
      drm/xe/bmg: fix compressed VRAM handling

Matthew Brost (5):
      drm/xe: Do not wedge device on killed exec queues
      drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap
      drm/xe: Drop bo->size
      drm/xe: Allocate PF queue size on pow2 boundary
      Revert "drm/xe/xe2: Enable Indirect Ring State support for Xe2"

Michal Wajdeczko (11):
      drm/xe: Process deferred GGTT node removals on device unwind
      drm/xe/guc: Explicitly exit CT safe mode on unwind
      drm/xe/hw_engine_group: Fix potential leak
      drm/xe/pf: Clear all LMTT pages on alloc
      drm/xe/pf: Print runtime registers using debug printer
      drm/xe/pf: Print configuration KLVs using debug printer
      drm/xe/guc: Don't allocate temporary policies object
      drm/xe/bmg: Don't use WA 16023588340 and 22019338487 on VF
      drm/xe/guc: Rename CT state change helper
      drm/xe/guc: Move state change logger to helper
      drm/xe/guc: Cancel ongoing H2G requests when stopping CT

Raag Jadav (2):
      drm/xe: Expose fan control and voltage regulator version
      drm/xe/pm: Wire up suspend/resume for I2C controller

Reuven Abliyev (1):
      drm/xe/nvm: add support for non-posted erase

Riana Tauro (2):
      drm/xe/xe_pmu: Validate gt in event supported
      drm/xe/xe_i2c: Add support for i2c in survivability mode

Rodrigo Vivi (1):
      Merge drm/drm-next into drm-xe-next

Shuicheng Lin (5):
      drm/xe/uapi: Correct sync type definition in comments
      drm/xe/pm: Restore display pm if there is error after display suspend
      drm/xe: Remove unused code in devcoredump_snapshot()
      drm/xe: Release runtime pm for error path of xe_devcoredump_read()
      drm/xe/pm: Correct comment of xe_pm_set_vram_threshold()

Thomas Hellström (2):
      drm/pagemap: Add a populate_mm op
      drm/xe: Implement and use the drm_pagemap populate_mm op

Tomasz Lis (1):
      drm/xe/vf: Make multi-GT migration less error prone

Tvrtko Ursulin (1):
      drm/xe: Consolidate LRC offset calculations

Vinay Belgaumkar (1):
      drm/xe/bmg: Update Wa_22019338487

Vodapalli, Ravi Kumar (1):
      drm/xe/bmg: Add one additional PCI ID

Zhanjun Dong (1):
      drm/xe/uc: Disable GuC communication on hardware initialization error

sanirban (1):
      drm/xe/ptl: Apply Wa_16026007364

 Documentation/gpu/rfc/gpusvm.rst            |  12 +-
 MAINTAINERS                                 |   7 +
 drivers/gpu/drm/Makefile                    |   6 +-
 drivers/gpu/drm/drm_gpusvm.c                | 762 +------------------------
 drivers/gpu/drm/drm_pagemap.c               | 838 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/Kconfig                  |  16 +-
 drivers/gpu/drm/xe/Makefile                 |   2 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h    |   4 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h       |  28 +
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c  |  11 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c      |   7 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c    |   2 +-
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h       |   4 +
 drivers/gpu/drm/xe/regs/xe_i2c_regs.h       |  20 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h       |   1 +
 drivers/gpu/drm/xe/regs/xe_pmt.h            |   2 +-
 drivers/gpu/drm/xe/regs/xe_regs.h           |   2 +
 drivers/gpu/drm/xe/tests/xe_bo.c            |   2 +-
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |   4 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c       |  52 +-
 drivers/gpu/drm/xe/tests/xe_pci.c           |  31 +
 drivers/gpu/drm/xe/tests/xe_pci_test.c      |  12 +
 drivers/gpu/drm/xe/tests/xe_pci_test.h      |   1 +
 drivers/gpu/drm/xe/xe_bo.c                  |  37 +-
 drivers/gpu/drm/xe/xe_bo.h                  |  17 +-
 drivers/gpu/drm/xe/xe_bo_types.h            |   4 +-
 drivers/gpu/drm/xe/xe_devcoredump.c         |  50 +-
 drivers/gpu/drm/xe/xe_device.c              | 121 ++--
 drivers/gpu/drm/xe/xe_device.h              |  47 +-
 drivers/gpu/drm/xe/xe_device_sysfs.c        | 143 ++++-
 drivers/gpu/drm/xe/xe_device_types.h        |  22 +-
 drivers/gpu/drm/xe/xe_drm_client.c          |   2 +-
 drivers/gpu/drm/xe/xe_eu_stall.c            |   6 +-
 drivers/gpu/drm/xe/xe_exec_queue.c          |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                |  25 +-
 drivers/gpu/drm/xe/xe_gsc.c                 |   6 +-
 drivers/gpu/drm/xe/xe_gt.c                  |  80 ++-
 drivers/gpu/drm/xe/xe_gt.h                  |   1 -
 drivers/gpu/drm/xe/xe_gt_mcr.c              |  47 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |  26 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |   1 -
 drivers/gpu/drm/xe/xe_gt_types.h            |   2 +
 drivers/gpu/drm/xe/xe_guc.c                 | 147 ++++-
 drivers/gpu/drm/xe/xe_guc.h                 |   2 +
 drivers/gpu/drm/xe/xe_guc_ads.c             |  31 +-
 drivers/gpu/drm/xe/xe_guc_ct.c              |  81 ++-
 drivers/gpu/drm/xe/xe_guc_ct.h              |   1 +
 drivers/gpu/drm/xe/xe_guc_log.c             |   2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c              | 283 +++++++---
 drivers/gpu/drm/xe/xe_guc_pc.h              |   2 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h        |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c          |  31 +-
 drivers/gpu/drm/xe/xe_heci_gsc.c            |   5 +-
 drivers/gpu/drm/xe/xe_huc.c                 |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c           |   3 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c     |  19 +-
 drivers/gpu/drm/xe/xe_i2c.c                 | 329 +++++++++++
 drivers/gpu/drm/xe/xe_i2c.h                 |  62 ++
 drivers/gpu/drm/xe/xe_irq.c                 |   2 +
 drivers/gpu/drm/xe/xe_lmtt.c                |  15 +-
 drivers/gpu/drm/xe/xe_lrc.c                 |  41 +-
 drivers/gpu/drm/xe/xe_lrc_types.h           |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c             |  50 +-
 drivers/gpu/drm/xe/xe_mmio.c                |  16 +-
 drivers/gpu/drm/xe/xe_nvm.c                 | 167 ++++++
 drivers/gpu/drm/xe/xe_nvm.h                 |  15 +
 drivers/gpu/drm/xe/xe_oa.c                  |  10 +-
 drivers/gpu/drm/xe/xe_pci.c                 |  77 +--
 drivers/gpu/drm/xe/xe_pci_types.h           |  41 ++
 drivers/gpu/drm/xe/xe_pcode_api.h           |  15 +
 drivers/gpu/drm/xe/xe_pm.c                  |  20 +-
 drivers/gpu/drm/xe/xe_pmu.c                 |   7 +-
 drivers/gpu/drm/xe/xe_query.c               |  29 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c            | 195 +++----
 drivers/gpu/drm/xe/xe_step.c                |   2 +
 drivers/gpu/drm/xe/xe_survivability_mode.c  |  19 +-
 drivers/gpu/drm/xe/xe_svm.c                 | 125 +++--
 drivers/gpu/drm/xe/xe_svm.h                 |  10 +-
 drivers/gpu/drm/xe/xe_tile.c                |   7 +
 drivers/gpu/drm/xe/xe_tile.h                |  11 +
 drivers/gpu/drm/xe/xe_trace_bo.h            |   4 +-
 drivers/gpu/drm/xe/xe_uc.c                  |  78 +--
 drivers/gpu/drm/xe/xe_uc.h                  |   5 +-
 drivers/gpu/drm/xe/xe_uc_fw.c               |   8 +-
 drivers/gpu/drm/xe/xe_vm.c                  |   8 +-
 drivers/gpu/drm/xe/xe_wa.c                  |  16 +
 drivers/gpu/drm/xe/xe_wa_oob.rules          |  10 +-
 drivers/i2c/busses/i2c-designware-platdrv.c |  18 +-
 drivers/mtd/devices/Kconfig                 |  11 +
 drivers/mtd/devices/Makefile                |   1 +
 drivers/mtd/devices/mtd_intel_dg.c          | 830 +++++++++++++++++++++++++++
 include/drm/drm_gpusvm.h                    |  96 ----
 include/drm/drm_pagemap.h                   | 135 +++++
 include/drm/intel/pciids.h                  |   5 +-
 include/linux/intel_dg_nvm_aux.h            |  32 ++
 include/uapi/drm/xe_drm.h                   |   8 +-
 98 files changed, 3981 insertions(+), 1630 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_pagemap.c
 create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.h
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.h
 create mode 100644 drivers/mtd/devices/mtd_intel_dg.c
 create mode 100644 include/linux/intel_dg_nvm_aux.h
