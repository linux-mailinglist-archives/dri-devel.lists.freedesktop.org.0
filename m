Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B38A34BBA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74D310EB51;
	Thu, 13 Feb 2025 17:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="irQi/E7f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54AA10EB51;
 Thu, 13 Feb 2025 17:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739467405; x=1771003405;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=+9VcrOS+tdugVjcbTD2CEiBuGeyXuanz6aWz5wmKSCQ=;
 b=irQi/E7fUsQmyv5UIklSsLzXn7Ee90eLb2EB1BaxwjRFvSRCAYgZyLPj
 5nJ/dlthOLUzADzyhI4o7S6wBcNlPpbSdLElSKF0p+LlnyRaMx/sfPfL7
 7TYkyx3GuqhqnD/r/Sw6xSr3XjkfdHCUSspQAlYm+xCsZcg1Pxg8RQYMq
 acj7yUwlsrQ38SjZ7hNckT9eAmfQ2602XfcziNQ9CnKMPazHB99dxR+OW
 L+EE6jejzTgo00DgHkNTJRawr8UyMkA98nr8U0XqSu6hrqOYMlO8d0Vo2
 oBe8DgWeCKYXTMQ+rtg6ZYaJeov59dfVPyv561oSZbAtmSbhMo1S7hhYD w==;
X-CSE-ConnectionGUID: quDM5pDyTWOwTuEMaS5aOA==
X-CSE-MsgGUID: bKaOA9XtSRmPv90Fs3UPXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40447854"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40447854"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 09:23:24 -0800
X-CSE-ConnectionGUID: VJfZjc3mQL+Q5TWeIUomkA==
X-CSE-MsgGUID: RXfBxf67Rem8dx1yH/5znw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113069549"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 09:23:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 09:23:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 09:23:23 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 09:23:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVx6Sln6JHnMvb6R2JQUGuLsaIwYxFiG/CFSmYl5IaFIWOyYETvGi50fMVZ8T+xj5QU3FCdTqlFePtJIhtLN8m6LVADc8ioR2c8NzcxKQ83dsI/T2SrK7/hkbJNkHERgJTvuvi3aCHmKhVOwfuEJZcaCTrxM7AcXo3W3XmIU+BdFIk3D9aKnsC9HaikZ6Ej8uexpy2GBFLdaWKhM/JLZCQvTrgjlL6C1btnAt9ufX6PgSDIUbIzSKoZq2ufiwSoeyzeYGYUQ56i0httRx0qCoN0hjqMlgA60RiSUHoMpXzx1emnqHgemdcciOXbELGg7EIZ1U1MORG98I/PWm8Kx0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCKai51vtgSq02YigyOXZpEeXm4iEV29gfzZwzLy6ws=;
 b=LJiPd1LDyAzffG+4FIZ8jxhzSLn/mOz0RG4ahz8aBj1o7FSFDHbxBUOkgUi459PBXPHD3pykX0mT3t1V/Itkhl+gt2vlRZwoH14F8bDW3tT7cmBog3I374bFKf7Sl/2DOLJ7o1xmK3QPqGkXsnQKLO5BT41m9gjN+CcrHI+U8sE5+W20sUHTMWnIGCy+n7E/MSdBhETfXIIvx4gIzAs6P/1UG0ihoWdCjVmS/Bt0WspcRQ97psMNFCUCtNE67Q+k/24eIrU/FXmraCP7bJKOmUlfxA/cxhWNT40CMMV7ijqOEp47S1+S0NUvj2o8Au/jwPQ5ZieI7DcXBCQBUr+JXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by CY8PR11MB7241.namprd11.prod.outlook.com (2603:10b6:930:94::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Thu, 13 Feb
 2025 17:23:20 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 17:23:20 +0000
Date: Thu, 13 Feb 2025 12:23:15 -0500
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
Subject: [PULL] drm-intel-fixes
Message-ID: <Z64qg13R_72iN3_X@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4PR03CA0285.namprd03.prod.outlook.com
 (2603:10b6:303:b5::20) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|CY8PR11MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f38b8f7-2632-4b72-22c6-08dd4c531c9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XO9wZ429AXtdo/9GWgZ5YfJgE6ZCcIw78xA2tWbwOxfPXuz6cdXdx38htQ3j?=
 =?us-ascii?Q?g2SkcOWU8KQh2tQ5YCc1Ppe16UbVLi99BOJOldTtS9soYsbMEEn0O6V0Foa6?=
 =?us-ascii?Q?ZVYCvDe72rk19aRyqQeZQZTlPB/krpnlqsZCnuf1RSvXyrCJQXNS/Q1YN1s5?=
 =?us-ascii?Q?ACUGfKzsPetitI0WkNui+zpR0aHrfZLz4PUoHk0IOoCoVqfyo/a1rxciEY2K?=
 =?us-ascii?Q?YHwJTFe2FHZ3r3LGdlrYXLothMbR90+2XGFtAY9LGhDSVRJ6PNLoieP3Nl+Z?=
 =?us-ascii?Q?aQvIjSZsfe5JVmx/sm7z4Mf0ZdmdD1APtlCbr2Vjtof0TNNp2ALR9xPmbRVh?=
 =?us-ascii?Q?x3TGSHJOVsI1oygZ01b5WZG2o4fBKYU/2wIMFzeIwCaGzduUs95VKcMRiQWM?=
 =?us-ascii?Q?QgEFWhRX71vK8EWClHFtOC2qQtw2S8zstnHHH53YBuGpyjr24jjr5bKEN4/7?=
 =?us-ascii?Q?iloIG6MxMiwz2L7hLqRbyTmnMJ6hwL3CxU41hFdWOipwVSmUB/Jc4e8fiA4o?=
 =?us-ascii?Q?FzxwUDBoUSGMO2dW3utXonyxV2vT4JOkhS2VZKhj5W4IUEgKhvaAIYVCOInB?=
 =?us-ascii?Q?oHxG3tnBW1pL+V8ALZ63ym/KNMUuTSTZ+4QK4PB0XfI7/B9PQVFH9gFc4Ik3?=
 =?us-ascii?Q?hwVEjn6+nQ1x07lIVOEUalWAzu/MBqqqSt7bg3qhRHDGgvJ0nYkt5ipTkRv1?=
 =?us-ascii?Q?cCnHKInxqgByWJ5Ao9MOnQLfGhyjMl9+00cQAOX18Urp1hR7yrK5LgX/pZ/k?=
 =?us-ascii?Q?lXo8KJFmFz/tNTPFZOrMnIvYLFiCRZOlsHm7r+qct+/pbBad5OCR4QKRK5/z?=
 =?us-ascii?Q?j6QDVIRe+s2D2wfr7HPcLVjugTSVmGcXGhWKzwAPPrj9ANeRMtnJqsrI/AJU?=
 =?us-ascii?Q?JyO5lUDf10bD5syi5MB45w8z3+bGADYdDiJhY4PHjV0WCLgIErCmfqi/Y1MA?=
 =?us-ascii?Q?Bqbyu10p2dBi/QmHKEbkZ9MhMv3gJz9kG/9J9mJczbe0/A0ecIJ9BcTBh9Hz?=
 =?us-ascii?Q?QBoxfMZ7zPJ8TkCE6fJ7YcjxzOr9F7RmnHyAtSqUYkF+iZEB95tp5dzg7bNs?=
 =?us-ascii?Q?msodBedGoevDyIO9qV3clWXcs7un+6vYZNxBu7A6cF+22MGcoTTIZtpeuKrP?=
 =?us-ascii?Q?d3TLLd4QGCp0OorOgFQUVjp7v3hOMK/qQGKPxivgSUdJPpbgXLv05FU3A4wK?=
 =?us-ascii?Q?1urYgsAi72/85mLZIwX3R2FEnovPpMFpvYZalkowCKoLaQN68TNdkn9C2QXU?=
 =?us-ascii?Q?3fFuxeF+w4Z3xouPl1O2RnjSrTvyvnRmX0M+7HiLYdQLNbVeLCwNMh5+ywh2?=
 =?us-ascii?Q?dtuwS0uZqhEoAkYAz8IosbUJ7ZcXLQOcBnPtHwB2kMygWQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qlMjYm/JP1/BxCqQaIuNhMrvKDF8FGVvXCiKjYdeWgQUdc8A41qWXLKYueU+?=
 =?us-ascii?Q?XA+TuON9ecQe4+0LqsMm2kQewOKokhaq6jmShr2ubTc6cbShleVP3ukwNtac?=
 =?us-ascii?Q?Uq6QwtA5giRRbNLYr+he6GycNecnNSgdvBUwj3GYVreTFKMDeTwQWTJczv1W?=
 =?us-ascii?Q?ZO2eGlx3FQ62kdcmdqsWZyMABDx0zwiFDecXRIb1VPeH92kYTAaOcz/xNHOL?=
 =?us-ascii?Q?gAKOD84m6gfOmUZ7jJJRwzsYJmc6wAhLmOxvrR/Qyf/nxVlm+RH54vYnNcFJ?=
 =?us-ascii?Q?HepEh/REZbYsB7f8v7YBJTkPrhkmgPOK9fKUp5UriSgo82YBvgnw+DewZMFu?=
 =?us-ascii?Q?SwVUsW5XTsueVmxn3aKmNdJdD03JQ/XL0lXxx00ygo0PPS9ZKXUheWQxWJuP?=
 =?us-ascii?Q?WANNkdMSN8rid5V/s68dqnhKvJEEBFWDRf4IcqM8Z4QaOMfjAisDjk3uqEpx?=
 =?us-ascii?Q?aKCg4KZKRcfErr1LqD8cJNTZoXPnTm7ckZCelfajvGaBO0HpBR+KzamtfsFy?=
 =?us-ascii?Q?fUykrpqTEACUwoVNsUXw7NpG8jbmSVx0vkInrUQS8oJbstTYUCW2u6evW87T?=
 =?us-ascii?Q?O5Gb/3HZemsFnie0qy3qmd6SzyLS5qn0eQEIvHbQNEHWkgyqpMSoN2+ofcSH?=
 =?us-ascii?Q?SHqHeUwkRyqqfI/O6RSbfInkBK7pj/kd+I//TS0PIDPJhxzTX8Wb2KqtzrQq?=
 =?us-ascii?Q?tcUsV4hRzaWFqPzfNV5PG9f63pO/opdRZ94hSw2KNUJOvuW9WIh05pBBwvau?=
 =?us-ascii?Q?kZt1VkvMlGglV0HdQzZ4PyzubZITsowXgBeKxIWndoIardNc/Na/P04GE2WV?=
 =?us-ascii?Q?q+mM/8s+TutR/7gY57ZHzW1rLfDZ/LWYJpv1KluoxTnUhaJQYwgKHfh8JElj?=
 =?us-ascii?Q?pOMTcujTlMYfMgKGHjKeI1A3J31cTRSddPvDbAFZhHSrjzt1irXRgeQTtSpQ?=
 =?us-ascii?Q?tNsRFKbgScs8ZoqLkakS6NxSAoLK+jcEDw8dZqZIv2WSAP8PfizcFZOLDwhQ?=
 =?us-ascii?Q?h+5ZiWf+jyFFOn3GOeWu79GIRVowPh7hagXInjJZY07akN8cSkG8BK2/cST2?=
 =?us-ascii?Q?acey2ia9zrQAzF8CtMXMMOqU7ptcshxVfI+py/1oadaPe1m1ShvrLYnQwk2L?=
 =?us-ascii?Q?8rSH7n3ERWTPu40Ij5nbU/1LkcoiDk9qbIcUvfcvbdkCMOlyjsI4kV1iwIF+?=
 =?us-ascii?Q?hj9aI9EOWjZMv+1rKPTlAfmv8HNOrmxTlZ+yUrmRUpZAftFeQbQytJbFeDSE?=
 =?us-ascii?Q?eXNivMwaiGil4KYV771WAP1jQxjW/PyT+w1JWDYVexYkPXz/W/UdYGloYj4F?=
 =?us-ascii?Q?/kT+AMF6X/2ngbhnYN5xvUMroyZfMAzdDZoYaxxibDeasF0VZmmqdAVMpOuz?=
 =?us-ascii?Q?MNgyC/mwSnHhdq8b7W4Leyu3a+G/76hDAbQ3H0wLHsyMekjtydq5oJRImzNc?=
 =?us-ascii?Q?ebImYgIaTaMVlSS0u9lXYlHVBURvZWPYZpVysjGX39ju7jBVfS+LC+vdSY/u?=
 =?us-ascii?Q?aag9wDnbF38IE8o0SceFbAO9TntI1GzrqshzfHstLrATTrUcWSyL9eltIcN9?=
 =?us-ascii?Q?Tib/vF69c25yC8IsKgXs1J3dBG3p+xT1OkBGQ0YLf/o8E0igWrxqKGMuN652?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f38b8f7-2632-4b72-22c6-08dd4c531c9d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 17:23:20.4920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1tPGET8Km6JzWY/8ymno3DqAJJRcbf+2oty/g1Y3fowSRFUMqzuyjMsbH3CtGbO0b11W9uDjawdhWBf2ND9SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7241
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

Here goes the i915 fixes for this round, with only one
patch from Krzysztof on selftests.

drm-intel-fixes-2025-02-13:
- Selftest fix: avoid using uninitialized context
The following changes since commit a64dcfb451e254085a7daee5fe51bf22959d52d3:

  Linux 6.14-rc2 (2025-02-09 12:45:03 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-02-13

for you to fetch changes up to 53139b3f9998ea07289e7b70b909fea2264a0de9:

  drm/i915/selftests: avoid using uninitialized context (2025-02-10 11:39:17 -0500)

----------------------------------------------------------------
- Selftest fix: avoid using uninitialized context

----------------------------------------------------------------
Krzysztof Karas (1):
      drm/i915/selftests: avoid using uninitialized context

 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
