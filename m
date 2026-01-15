Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C11D25817
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 16:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA0810E79B;
	Thu, 15 Jan 2026 15:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZssHo5En";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909A110E037;
 Thu, 15 Jan 2026 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768492376; x=1800028376;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=dEftFG1+BfWyQb7cxgGWoJ1jGD6dBWMbMcWN8fe84Ho=;
 b=ZssHo5EnorFPGPFa3lfc1VmcXo9AApfoswn8XC0KRYYfzHJxZ09U5jbu
 SpJcHSY2byLLFeV3bUt2YlGe+to8U1xNeHLtVEzN9fU1Sdtpq6jRP2nHu
 gXppJMIFiXqNxRG1Ll+qvxB6SPSEXlMSF6WrGH6smXXxZYdg1G/I6e+W4
 AVtTH0bWKsxQguXpgeahUN6T14Z3MIBCf4z+q+GSJtbrmACKqfohCTU53
 NWjZVsc3N4UXUJN9HTopqPuKUPaQn+4iBR95vsNrX7D4Y38d6hMgiS+bW
 1vkPZAmZamfILRzTtEWB5wBBTeKkDqszCT17ahcZPMXbSqN/han12mXbE Q==;
X-CSE-ConnectionGUID: APcGecgLTz28gKXYbTbNOw==
X-CSE-MsgGUID: XEhEfHkFQrGhyx0UMDxyiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80105418"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="80105418"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 07:52:56 -0800
X-CSE-ConnectionGUID: KZeBSVlPS5yYwVWfbU1yMA==
X-CSE-MsgGUID: JX5wrNE4Q2+fCg4MxBGaKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="210034908"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 07:52:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 07:52:55 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 07:52:55 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 07:52:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ddeo/opBVocRAPfbTa9LVXLQOvJYSX42UIRlUyRDCnSUxejd94Se7CjtZd09VR36Q6emyrMTzuY6owr1He0KuRzyXPWC9967LgJA8Q4zlMR86tHw7hcuqV83nNWdQc1X35+XES15FMBp5vaAdQQue3gtZ9Jd+3a4CbfpnPPMDae/CdY7qUz4eNHH6bWd7/ZdYqKABjkqKFHpIyut/47z8MLTPw+QcsqfHl12sWWPeQohZpfBn6EXZAITbxIZ3GzhXEsHjCUs2jAcg15xWrROLexqBS3CoiTbM8yFNGRNbGN0+UF+FdA/2nOPINbPLUjkC0dSB3b7Bp5KRsQbj1/9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLkJ5Nf2FafhaAP1gaxqdzKofC0AyupX2kM7Byy+U30=;
 b=L/unyhBTRm/XeCmImDoL0iNh+s3bHT/PViqWkSRFCbXUZdT2RT3EKEOI+wGAVpeLJ/5Edf5yj1fv0KDDBo/WCr28prmC0xvoVXn2HI83UovSFeeZvu7+EfXKJWRiFhYQ1LEy3EzLQgUsmIWjPj8fYcHLtpnCc5zGWxl9xorjtKBunjjQEPCK3wt+pZzlYXe7L/f8y9varI5WMFV6T+DToAy0/zP9c3YE2qI6uvJAdt07Gb9Y8RRp2SU0/TaKgjzrwGgMvt9ulfBv3KOT+kat/rrfFVzMbPAp1WZK9FGVmOSUgyU71McAwlyy6HBDG4J9O7vthhtnvGwYTlMcj3X7Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB7078.namprd11.prod.outlook.com (2603:10b6:303:219::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 15:52:52 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 15:52:51 +0000
Date: Thu, 15 Jan 2026 10:52:46 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-next
Message-ID: <aWkNThVRSkGAfUVv@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0046.namprd11.prod.outlook.com
 (2603:10b6:a03:80::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW4PR11MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: ca9429fd-147f-4e3a-3932-08de544e2387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?B902aR+fgz63mF4Ipav1t3SFDa8s79iXuu15gdmlnVcdY2xeyKL62MVi6x?=
 =?iso-8859-1?Q?Nd0hose5ldvuJr5I1Fg5t7/fc88wV8sk2ycMf58xhTr3hRt6uJ/OxnI6PA?=
 =?iso-8859-1?Q?8ZjF3IgR+uMxqum1tnw9nBI247j02q1qRefUEIKq9qn7V3cqeAcYRGm/Wb?=
 =?iso-8859-1?Q?VR8FZhaKUJ/xShmFrOJ0dB5WrgtqbJwbrwGlL9M2SovZp5mMoVYwyE7XJM?=
 =?iso-8859-1?Q?/R1UtfQ0jer3kfQbhTx++wVNLrmneEvx4LSkTVDnsQ8pUZD3VaCi2lmPuY?=
 =?iso-8859-1?Q?5klt1nrIIMKsat3V1ldGluVOlR0y4aKAESo/GNhVygSnjZyuGlZYWzwMFh?=
 =?iso-8859-1?Q?+odKnazBvj2r4WgcF7fVsExmCcL7dedlzcBBvKDJkdD5TO9N7mOb9EvEBG?=
 =?iso-8859-1?Q?1u0KYTCAB7gIwc8y4YxP0N+QOv+O3+OIwEVxy+WYYRFqfMOpqEfwk3KE8d?=
 =?iso-8859-1?Q?MGEg5dwUZ2QrUnGzErh7xcXwuM5exeWvc3WnYnPb0txOzXp8rMRPSJELR1?=
 =?iso-8859-1?Q?X/d+ApXFUhgCLrHRHKgP2NdMj0Dr/ZO7NrCcJvxNpGK0XnU2JpjMcxDT/7?=
 =?iso-8859-1?Q?XwY3ZhYSkLx4PFp6Y4dCowh7BTx5rRpgJIZLUHr2MoAy7Q02wQvKC34Apd?=
 =?iso-8859-1?Q?ifEyStQLLbJA/RORbQW43FO3o9Emms7cnacphRs/SrAfWHruBbdmXJ1YeM?=
 =?iso-8859-1?Q?nxE7hVtn1OX5nLnVDA+W6t7ndzkapjDGjG80pM0jt9tXvr0HpA80Lxb0QX?=
 =?iso-8859-1?Q?DpbmCIPkd7fzCVN/tbw/nQmTzveJIwiEBfjlzaEoZ/SZfgNASILaFrITLQ?=
 =?iso-8859-1?Q?BZ/tMU0MPegT6zhspKkmqOhKiproWyo4dScGjYkxQsPsrdg3MR2pG2gepI?=
 =?iso-8859-1?Q?vc0y7rSN5hoBAh0/Ao5TGLR3NOgyezPGjeMElkjbdtQvieP1iv7Uam5Cp1?=
 =?iso-8859-1?Q?DIZpU07Cny8Ru9wUYOr6KWDUDc7qguo0rMj+xefmIRDfuJjUJXMO0lv/SM?=
 =?iso-8859-1?Q?N9xkKyIl8lPvJW7eqhKz1rqA/2dAJwPdg0Y5E0hXRLAus9wHEf2BCsZyJD?=
 =?iso-8859-1?Q?DeSHrEvwJeAmDCUc6iEdN7llemmWt1oNKQ1V9p2dx0TwyWj/onR64s00nT?=
 =?iso-8859-1?Q?hV6FV5NLknODq8+bd/ushdlodQZHEuu3HhjsO/edjSAslPjfM5Ew1YH0SJ?=
 =?iso-8859-1?Q?UojkAZu9EO40Ef6S1ZDoRz/SnO/xOlMzjfcR3LpWts9JjHm6rWanEupeM+?=
 =?iso-8859-1?Q?7D6nPQsLi9y6dG/ZjtQEEwOM2rrjSczqZrhwdBbtRZcpx/0RPu12Q00EcM?=
 =?iso-8859-1?Q?G3ttjaBXEypY9Igo1uKjgqlcwgNDIRRPtOfJRgACOXYcDhCinS9WMfXQxO?=
 =?iso-8859-1?Q?5Z0Zynvd7GtPdRh/aXV0hBhFWOUpAzpnziewzGPfIQ4NUP4psdYQvj1sFY?=
 =?iso-8859-1?Q?lUFLk9YyRxwO6ziknAo70weodIrkalRb6aDPZwNf6gczAB2hpl1hyMUQBd?=
 =?iso-8859-1?Q?8A6+/kFo906ogayownAnoYcqG5CIse49cxv9fkn/iKR/ksINTEV0hAsotl?=
 =?iso-8859-1?Q?ZHzKNH2Q4xJQcYEUQY4FtjObDegO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?u6rD1hDHzcVkuDX7C9zjHs6DxA8W3sm4fabtMp696d1bh66M79CHKnm/wD?=
 =?iso-8859-1?Q?hj06n2owUzbfI0PK3OtSem7djyNGKQdCmtXXIZJipXAQfECxpuO/U/8BRh?=
 =?iso-8859-1?Q?nCE/SadjEsI9TiRgyda9lIS1dmlPstHbv2XOF56/wmy0zZlpmQExk9CNGh?=
 =?iso-8859-1?Q?uK2irrYe5tunMnnKv1668ylP8LtpInN7Aho3kwRqi2SZJhqLKiGFQashUH?=
 =?iso-8859-1?Q?MMdmlG0wDoktNKLgP+zL1fxFV0Q2Rxm9l5RF/MVAAAUS/c7sJ47DhnW10t?=
 =?iso-8859-1?Q?ery0iVH1U10vPbgWIf6cj5ti7Gu1hY5wU/wZ5iQDRT3Ss13HHTQhdEwVXY?=
 =?iso-8859-1?Q?0pePpy5fqAp1aHsbdPYszW0v7o2ID9vW50T8t3qSpXxrNdBOt+FdHyrU4E?=
 =?iso-8859-1?Q?JAVEf+XZKTEWsQuf/kdrzU63dkpnh9rC0xfmlpHNheKcdyZGX1EhcbIPds?=
 =?iso-8859-1?Q?uB76ub6f8/nEJuf3tQBUQdrPp5XhBv4B3SH5QSjt+v4mdeiIkse1W5G/14?=
 =?iso-8859-1?Q?9fkW2QHjj2VWNLFK4Cq7brGUGdtTZH6V2hzHrzovBaP4pIqwDxJNZjLsq3?=
 =?iso-8859-1?Q?ax4q8a+mFtrq4zg6ID4KcjVnUKgnMmjjqKQUXC+Lme/SR1igilwpHNU1qb?=
 =?iso-8859-1?Q?tsa8NLsRML2RBjhxEewDq+mbIezd7vyYQEjjskfZ5p2PZRhioT8OfYxpUT?=
 =?iso-8859-1?Q?VmQw5ldiHHfXk8HV0D4smdri/nCoP2xTjNko81wxDMu0WAsk2jjZzCXqwt?=
 =?iso-8859-1?Q?HyIOwBa5D3mAWxLePqtX72R4+O7onTCqQmCQANI/TsMRsr7MCot1ag0RwN?=
 =?iso-8859-1?Q?AUwVESk0B2UW+sC9yz4UuF2jL5oSjc9cgCWjM6RFzABjsBqgy4li63qKJq?=
 =?iso-8859-1?Q?M1E6RZjzn+uLa3wxVKCnYju48uH//HfaltGVrub2hZBDCy4YBFzG/EGb3I?=
 =?iso-8859-1?Q?8/X2GCNntOq2476ViqIn/XFSKwN1FnmZfU9ULQzGwU6vKwGUxmI9d03v8R?=
 =?iso-8859-1?Q?BN0C8sXmTlaSQGvy4PS5VmcknfV5irWUC6m+RLQ7bQbqYapuy269+1p+z6?=
 =?iso-8859-1?Q?nzCVrX3sM+iU2RQb+/jzNARVHkXjSipy2qq0GvGWPkYpHXK+0lk4HJccuB?=
 =?iso-8859-1?Q?f656jL+6lss+SRmVezykfRyccY/mJu3IynsExO+KpfxEJcdcByfLOR6M/E?=
 =?iso-8859-1?Q?LguytIWN+Zincb8DwC6g/zuwu+6rOT6AgaUwtJcTTtPLkPorONPZLiYkmB?=
 =?iso-8859-1?Q?HkaaUkveNrsIv21JF+RSdF6srQTUTsflflz7ivQDsw4KGBnWJkZhu/KRBc?=
 =?iso-8859-1?Q?7NsFQZ1W6ZvH8MF779KW2tqHShPf6F5pLVZ52afHbQbndM+2dHHV9AJ3c0?=
 =?iso-8859-1?Q?VDkFXViO2r8nxFJyYFQ/R97CRbIhdxp20QfpGt5BWNRfR+NmahDzRecGtm?=
 =?iso-8859-1?Q?7/0OBHgngqeEzxdF+Dpq+xLt5xPIe5htX4ucg1MfX0Y53EHelfmSegwOOS?=
 =?iso-8859-1?Q?hBZ41N38qcsnsql24kCa0QYQF/zadjG9m5L4apg3JHbfT6cfnwj3hppE5N?=
 =?iso-8859-1?Q?sxfsG0l4pdppU+G2iW7+w+xXV+MwzZ6xa1G/EnywpAYOAMYoQEQO4sDESP?=
 =?iso-8859-1?Q?KaIm8a/Gk2LrHRTU2k9VaG8UxuJWiotetfv1Y9ZP7jV2jlApDxzEGyTGzk?=
 =?iso-8859-1?Q?AloyveDNJ5r3XKcmhwukgU3IbY6bpRCjD81dK0hgFN2tf17g8h2JIZN+5r?=
 =?iso-8859-1?Q?QzZZYXDae7G3NTo4vxmdAFtQSVJEvzv89wx0LaH/FCR0W4u2qjDJOfJMlJ?=
 =?iso-8859-1?Q?XleWnxGv9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9429fd-147f-4e3a-3932-08de544e2387
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 15:52:51.5798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFxmsKi074Nc4iuaqbZOoCZRq2H8Q5rgZmKZFsNw7u/sdkQJFsklJwyaeQdoD/3wXqr+p/HpElT0dIqw83tKYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7078
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

Here goes our likely last drm-intel-next PR towards 7.0.

Thanks,
Rodrigo.

drm-intel-next-2026-01-15:
Beyond Display:
 - Make 'guc_hw_reg_state' static as it isn't exported (Ben)
 - Fix doc build on mei related interface header (Jani)

Display related:
 - Fix ggtt fb alignment on Xe display (Tvrtko)
 - More display clean-up towards deduplication and full separation (Jani)
 - Use the consolidated HDMI tables (Suraj)
 - Account for DSC slice overhead (Ankit)
 - Prepare GVT for display modularization (Ankit, Jani)
 - Enable/Disable DC balance along with VRR DSB (Mitul, Ville)
 - Protection against unsupported modes in LT PHY (Suraj)
 - Display W/a addition and fixes (Gustavo)
 - Fix many SPDX identifier comments (Ankit)
 - Incorporate Xe3_LPD changes for CD2X divider (Gustavo)
 - Clean up link BW/DSC slice config computation (Imre)
The following changes since commit 35ec71285c9311395b14bedc60fa94f6b7e24d2d:

  drm/i915/pc8: Add parent interface for PC8 forcewake tricks (2025-12-19 21:28:48 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2026-01-15

for you to fetch changes up to d30f75d2dba913754dbacb982b19b783a30253ea:

  drm/i915/dp: Simplify computing the DSC compressed BPP for DP-MST (2026-01-13 18:42:21 +0200)

----------------------------------------------------------------
Beyond Display:
 - Make 'guc_hw_reg_state' static as it isn't exported (Ben)
 - Fix doc build on mei related interface header (Jani)

Display related:
 - Fix ggtt fb alignment on Xe display (Tvrtko)
 - More display clean-up towards deduplication and full separation (Jani)
 - Use the consolidated HDMI tables (Suraj)
 - Account for DSC slice overhead (Ankit)
 - Prepare GVT for display modularization (Ankit, Jani)
 - Enable/Disable DC balance along with VRR DSB (Mitul, Ville)
 - Protection against unsupported modes in LT PHY (Suraj)
 - Display W/a addition and fixes (Gustavo)
 - Fix many SPDX identifier comments (Ankit)
 - Incorporate Xe3_LPD changes for CD2X divider (Gustavo)
 - Clean up link BW/DSC slice config computation (Imre)

----------------------------------------------------------------
Ankit Nautiyal (16):
      drm/i915/vdsc: Account for DSC slice overhead in intel_vdsc_min_cdclk()
      drm/i915/display: Abstract pipe/trans/cursor offset calculation
      drm/i915/display: Add APIs to be used by gvt to get the register offsets
      drm/i915/gvt: Add header to use display offset functions in macros
      drm/i915/gvt: Change for_each_pipe to use pipe_valid API
      drm/i915/gvt: Use the appropriate header for the DPLL macro
      drm/i915/gvt/display_helper: Get rid of #ifdef/#undefs
      drm/i915/intel_alpm: Fix the SPDX identifier comment
      drm/i915/intel_cx0_phy: Fix the SPDX identifier comment
      drm/i915/intel_cx0_phy_regs: Fix the SPDX identifier comment
      drm/i915/intel_display_params: Fix the SPDX identifier comment
      drm/i915/intel_dsb: Fix the SPDX identifier comment
      drm/i915/intel_dsb_buffer: Fix the SPDX identifier comment
      drm/i915/intel_gvt_api: Fix the SPDX identifier comment
      drm/i915/intel_lt_phy: Fix the SPDX identifier comment
      drm/i915/lt_phy_regs: Fix the SPDX identifier comment

Ben Dooks (1):
      drm/i915/guc: make 'guc_hw_reg_state' static as it isn't exported

Gustavo Sousa (3):
      drm/i915/display_wa: Keep enum intel_display_wa sorted
      drm/i915/cdclk: Implement Wa_13012396614
      drm/i915/cdclk: Incorporate Xe3_LPD changes for CD2X divider

Imre Deak (19):
      drm/i915/dp: Drop unused timeslots param from dsc_compute_link_config()
      drm/i915/dp: Factor out align_max_sink_dsc_input_bpp()
      drm/i915/dp: Factor out align_max_vesa_compressed_bpp_x16()
      drm/i915/dp: Align min/max DSC input BPPs to sink caps
      drm/i915/dp: Align min/max compressed BPPs when calculating BPP limits
      drm/i915/dp: Drop intel_dp parameter from intel_dp_compute_config_link_bpp_limits()
      drm/i915/dp: Pass intel_output_format to intel_dp_dsc_sink_{min_max}_compressed_bpp()
      drm/i915/dp: Pass mode clock to dsc_throughput_quirk_max_bpp_x16()
      drm/i915/dp: Factor out compute_min_compressed_bpp_x16()
      drm/i915/dp: Factor out compute_max_compressed_bpp_x16()
      drm/i915/dp: Add intel_dp_mode_valid_with_dsc()
      drm/i915/dp: Unify detect and compute time DSC mode BW validation
      drm/i915/dp: Use helpers to align min/max compressed BPPs
      drm/i915/dp: Simplify computing DSC BPPs for eDP
      drm/i915/dp: Simplify computing DSC BPPs for DP-SST
      drm/i915/dp: Simplify computing forced DSC BPP for DP-SST
      drm/i915/dp: Unify computing compressed BPP for DP-SST and eDP
      drm/i915/dp: Simplify eDP vs. DP compressed BPP computation
      drm/i915/dp: Simplify computing the DSC compressed BPP for DP-MST

Jani Nikula (30):
      drm/i915: move display/intel_plane_initial.c to i915_initial_plane.c
      drm/xe/display: rename xe_plane_initial.c to xe_initial_plane.c
      drm/i915: rename intel_plane_initial.h to intel_initial_plane.h
      drm/{i915, xe}: move initial plane calls to parent interface
      drm/{i915, xe}: deduplicate intel_initial_plane_config() between i915 and xe
      drm/{i915, xe}: deduplicate plane_config_fini() between i915 and xe
      drm/{i915, xe}: start deduplicating intel_find_initial_plane_obj() between i915 and xe
      drm/i915: return plane_state from intel_reuse_initial_plane_obj()
      drm/xe: return plane_state from intel_reuse_initial_plane_obj()
      drm/i915: further deduplicate intel_find_initial_plane_obj()
      drm/{i915, xe}: deduplicate intel_alloc_initial_plane_obj() FB modifier checks
      drm/{i915,xe}: deduplicate initial plane setup
      drm/{i915, xe}: pass struct drm_plane_state instead of struct drm_crtc to ->setup
      drm/{i915, xe}: pass struct drm_device instead of drm_device to ->alloc_obj
      drm/i915: drop dependency on struct intel_display from i915 initial plane
      drm/xe/display: drop i915_utils.h
      drm/i915: remove unused dev_priv local variable
      drm/xe/compat: remove unused forcewake get/put macros
      drm/xe/compat: convert uncore macro to static inlines
      drm/i915/display: use to_intel_uncore() to avoid i915_drv.h
      drm/i915: drop i915 param from i915_fence{, _context}_timeout()
      drm/xe: remove compat i915_drv.h and -Ddrm_i915_private=xe_device hack
      drm/i915/utils: drop unnecessary ifdefs
      drm/i915/display: remove accidentally added empty file
      drm/i915/gvt: sort and group include directives
      drm/i915/gvt: include sched_policy.h only where needed
      drm/i915/gvt: reduce include of gt/intel_engine_regs.h
      drm/i915/gvt: reduce include of vfio.h
      drm/i915/gvt: include intel_display_limits.h where needed
      mei: late_bind: fix struct intel_lb_component_ops kernel-doc

Mitul Golani (12):
      drm/i915/display: Add source param for dc balance
      drm/i915/vrr: Add VRR DC balance registers
      drm/i915/vrr: Add DC Balance params to crtc_state
      drm/i915/vrr: Add state dump for DC Balance params
      drm/i915/vrr: Add compute config for DC Balance params
      drm/i915/vrr: Add function to check if DC Balance Possible
      drm/i915/vrr: Add function to reset DC balance accumulated params
      drm/i915/display: Add DC Balance flip count operations
      drm/i915/vrr: Write DC balance params to hw registers
      drm/i915/display: Wait for VRR PUSH status update
      drm/i915/display: Add function to configure event for dc balance
      drm/i915/vrr: Enable DC Balance

Suraj Kandpal (4):
      drm/i915/cx0: Use the consolidated HDMI tables
      drm/i915/ltphy: Remove state verification for LT PHY fields
      drm/i915/ltphy: Compare only certain fields in state verify function
      drm/i915/ltphy: Provide protection against unsupported modes

Tvrtko Ursulin (1):
      drm/xe: Fix ggtt fb alignment

Ville Syrjälä (6):
      drm/i915/dmc: Add pipe dmc registers and bits for DC Balance
      drm/i915/vrr: Add functions to read out vmin/vmax stuff
      drm/i915/vblank: Extract vrr_vblank_start()
      drm/i915/vrr: Implement vblank evasion with DC balancing
      drm/i915/dsb: Add pipedmc dc balance enable/disable
      drm/i915/vrr: Pause DC Balancing for DSB commits

 drivers/gpu/drm/i915/Makefile                      |   6 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |  17 +-
 drivers/gpu/drm/i915/display/intel_alpm.h          |   4 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |  19 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  60 ++-
 drivers/gpu/drm/i915/display/intel_connector.c     |   2 -
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   8 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  13 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |   2 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h  |   4 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  46 +-
 .../gpu/drm/i915/display/intel_display_device.h    |  18 +
 .../gpu/drm/i915/display/intel_display_driver.c    |   4 +-
 .../gpu/drm/i915/display/intel_display_params.h    |   2 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |   3 +-
 .../gpu/drm/i915/display/intel_display_reg_defs.h  |  15 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  11 +
 drivers/gpu/drm/i915/display/intel_display_utils.h |   4 -
 drivers/gpu/drm/i915/display/intel_display_wa.c    |  14 +-
 drivers/gpu/drm/i915/display/intel_display_wa.h    |  12 +-
 drivers/gpu/drm/i915/display/intel_dmc.c           |  25 +
 drivers/gpu/drm/i915/display/intel_dmc.h           |   5 +
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      |  60 +++
 drivers/gpu/drm/i915/display/intel_dp.c            | 515 ++++++++++-----------
 drivers/gpu/drm/i915/display/intel_dp.h            |  17 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  77 +--
 drivers/gpu/drm/i915/display/intel_dram.c          |  42 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |  31 +-
 drivers/gpu/drm/i915/display/intel_dsb.h           |   4 +-
 drivers/gpu/drm/i915/display/intel_dsb_buffer.h    |   4 +-
 drivers/gpu/drm/i915/display/intel_gvt_api.c       |  43 ++
 drivers/gpu/drm/i915/display/intel_gvt_api.h       |  21 +
 drivers/gpu/drm/i915/display/intel_initial_plane.c | 193 ++++++++
 ...intel_plane_initial.h => intel_initial_plane.h} |   6 +-
 drivers/gpu/drm/i915/display/intel_lt_phy.c        |  54 +--
 drivers/gpu/drm/i915/display/intel_lt_phy.h        |   4 +-
 drivers/gpu/drm/i915/display/intel_lt_phy_regs.h   |   4 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c | 442 ------------------
 drivers/gpu/drm/i915/display/intel_rom.c           |   8 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |  46 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |  35 +-
 drivers/gpu/drm/i915/display/intel_vrr.c           | 281 ++++++++++-
 drivers/gpu/drm/i915/display/intel_vrr.h           |  10 +
 drivers/gpu/drm/i915/display/intel_vrr_regs.h      |  68 +++
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |   2 +-
 drivers/gpu/drm/i915/gvt/aperture_gm.c             |   5 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c               |   2 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |  26 +-
 drivers/gpu/drm/i915/gvt/debugfs.c                 |   4 +-
 drivers/gpu/drm/i915/gvt/display.c                 |  23 +-
 drivers/gpu/drm/i915/gvt/display.h                 |   2 +-
 drivers/gpu/drm/i915/gvt/display_helpers.h         |  37 ++
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |   6 +-
 drivers/gpu/drm/i915/gvt/dmabuf.h                  |   7 +-
 drivers/gpu/drm/i915/gvt/edid.c                    |   1 +
 drivers/gpu/drm/i915/gvt/execlist.c                |   2 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |  14 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.h              |   2 -
 drivers/gpu/drm/i915/gvt/firmware.c                |   4 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |   9 +-
 drivers/gpu/drm/i915/gvt/gvt.h                     |  26 +-
 drivers/gpu/drm/i915/gvt/handlers.c                |  21 +-
 drivers/gpu/drm/i915/gvt/interrupt.c               |   5 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |  24 +-
 drivers/gpu/drm/i915/gvt/mmio.c                    |  13 +-
 drivers/gpu/drm/i915/gvt/mmio_context.h            |   5 -
 drivers/gpu/drm/i915/gvt/opregion.c                |   3 +-
 drivers/gpu/drm/i915/gvt/page_track.c              |   3 +-
 drivers/gpu/drm/i915/gvt/sched_policy.c            |   3 +-
 drivers/gpu/drm/i915/gvt/scheduler.c               |   8 +-
 drivers/gpu/drm/i915/gvt/trace.h                   |   2 +-
 drivers/gpu/drm/i915/gvt/trace_points.c            |   2 +
 drivers/gpu/drm/i915/gvt/vgpu.c                    |   6 +-
 drivers/gpu/drm/i915/i915_config.c                 |   3 +-
 drivers/gpu/drm/i915/i915_config.h                 |  10 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   2 +
 drivers/gpu/drm/i915/i915_gpu_error.c              |   2 +-
 drivers/gpu/drm/i915/i915_initial_plane.c          | 290 ++++++++++++
 drivers/gpu/drm/i915/i915_initial_plane.h          |   9 +
 drivers/gpu/drm/i915/i915_request.c                |   3 +-
 drivers/gpu/drm/i915/i915_utils.h                  |   4 -
 drivers/gpu/drm/i915/intel_gvt.c                   |  13 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |   4 +-
 drivers/gpu/drm/xe/Makefile                        |   6 +-
 .../gpu/drm/xe/compat-i915-headers/i915_config.h   |   5 +-
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |  22 -
 .../gpu/drm/xe/compat-i915-headers/i915_utils.h    |   7 -
 .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |  11 +-
 drivers/gpu/drm/xe/display/xe_display.c            |   2 +
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |   2 +-
 drivers/gpu/drm/xe/display/xe_initial_plane.c      | 189 ++++++++
 drivers/gpu/drm/xe/display/xe_initial_plane.h      |   9 +
 drivers/gpu/drm/xe/display/xe_plane_initial.c      | 321 -------------
 include/drm/intel/display_parent_interface.h       |  17 +
 include/drm/intel/intel_lb_mei_interface.h         |   3 +-
 95 files changed, 2017 insertions(+), 1443 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_initial_plane.c
 rename drivers/gpu/drm/i915/display/{intel_plane_initial.h => intel_initial_plane.h} (60%)
 delete mode 100644 drivers/gpu/drm/i915/display/intel_plane_initial.c
 create mode 100644 drivers/gpu/drm/i915/gvt/display_helpers.h
 create mode 100644 drivers/gpu/drm/i915/i915_initial_plane.c
 create mode 100644 drivers/gpu/drm/i915/i915_initial_plane.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_initial_plane.c
 create mode 100644 drivers/gpu/drm/xe/display/xe_initial_plane.h
 delete mode 100644 drivers/gpu/drm/xe/display/xe_plane_initial.c
