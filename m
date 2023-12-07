Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542FA8090E9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 19:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDA610E20B;
	Thu,  7 Dec 2023 18:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDBA10E20B;
 Thu,  7 Dec 2023 18:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701975591; x=1733511591;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=YdcFlcw5FoRpvtfry5DepxZa+LziVQh11XhB2mcLglQ=;
 b=JP7cACLAnFDHWOOPE3KrqpCrZBWQ8aE/2DeTx0Y6t+SFTEo/F3soO/EC
 MULByWijsv0+uQvMaUsMtFy2e5+ntIIDgju7HW0uWN5FCbAxrbFh5hAev
 7mMkRC4YPiVBk6sswk5Ayvk+/9njczuos0l9WSdk4maDCsgokSgmLuMa5
 WOFJicQlEMDTZqwlxHZevsqJKDDZCQqeEAGZ2+wd4uUILQTIFHwAlLhR6
 b99ihm1aDqw2TCSZBZ3mctr32/yh6fsfVLLU9ERfq4eZAlXB7YGPWO+79
 IotfemrJXU3bHiODvLey5g93WRZ/j4zGclmmhTh4oKlGZ3XOBAvio7Eah Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="398160410"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="398160410"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 10:59:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="862575808"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="862575808"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 10:59:47 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 10:59:47 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 10:59:46 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 10:59:46 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 10:59:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NILrn1JhJFzFRgrB6srrlARRpWUzVRcy9fz2E6RS7AhecUFLOWuyX7RJaCTUlqLMsOCXmoXap6Zia/tZKRyczcIPfgoYGg0zpAQpprLJEU6UN6TJf5A8fvPHo99NxEXFQH0lWwQHGesri2ctEg4Jr9firTC7FSBQ+0by6oev2gjpMCTouUo5XbpfNJYFnGhHdvsOFroqSljL7z4gltBFzV88qVesLACCV73xe+xw0XSAUvDoNZrDzrIb0DXEApwFJQd34cnlazWQArfVm81zslsAUcAFgXWsQarF9QIaV0SKJUaCPvg7QjQi5rrED8wgPgAiJsYlOtWY1N8D0SXSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozQ/m3ngVBSso8TqdGjtC1LSU/yZHx9xDPKboAnjzFo=;
 b=mrF5q/csr8WLPxxApXpTv9T9D/pkTq8YwU6Y9oZ6vh3ZilnrUPndPkW1181gsqAppt+Xw5m9qQG8OFPqJUs10CrH/cgWTZcIJD/Ybm9MdyHZ7hZkeR/hsOsym3zF7sWSA2i7NODiYCurQDGiWK8kw5nxNTzGpo+cOJUAnzh7YFu62lIzLvz1o97ZQ3hOR9SzUNDC9W4Y0S1q26jhe6/lLAhxvUfDB89cupHAlNFrL7WkuW5sG37Qo2TtpHlojk2aMKYCB8gOdoRpc9xDa0hM3pwb9x4gP6JeVvtHqtevz0WRQtAHU6LnvuwpxyznVaXSnppjvsm1/r9mX5gLBUEDvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7756.namprd11.prod.outlook.com (2603:10b6:208:420::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 18:59:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 18:59:44 +0000
Date: Thu, 7 Dec 2023 13:59:39 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <ZXIWG6bRYaUw0w6-@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e7c8e9-73de-4353-8735-08dbf756ad04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5b7nf482B/spuFEULuRRdWMzdP8POe4EYI8kS4GyvBlzahIrQGG+uYBboKDpxlr9et9aq/2/J3BqLfAM0AvVXc1GQI6w4wiN/xqkJhYzGVae3+22M8mmDdVb+UvNi4XII/ctUIQiDBiKpILcffeD0O82c73zk/rgxP8Y54shhQx1UNAqKgPmg851U0gPzW3FME9eVXgwCv0kIPuwwJSCI94ZsMPjPZO0ojK62yPnLuscz2kZHCMwRidF2OMfcSnThR0nOD3Il3yFuIAh+Z01X0b7VgDS1GOnchjjLsf+asaR/3w3Eq9OneviEdv1yGZ8rFlV+7GlY3kLKSNnpjPa/kRbC1yRMeFijhM93a208nmcCqVuPsmLvjXpVHBR5Glw4c7ELdwvdGDs1dDP1rCIyqAy1qiyo3D6hOdgQFwTjWPWBRGyNoy7ngLm4mTSVw2DSdrkQShQ+ayKhtB2/f+zO9G73WZNlpIIix4Ud3SGjQtBdDqm8oPAeOJ2/I7JnVKgk6FT+wzsHP03yQPagMAejeGceYZsqX9vAzNLwjBnExwRpR3718zghuVy3sGf4oQK2Ve/4PZbyTIlM9g7ekR31No6IILSWWgK1xfUd2YlxnjexkP9Hyo2F8plcltKXG+q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39860400002)(230922051799003)(230273577357003)(230173577357003)(451199024)(1800799012)(64100799003)(186009)(6512007)(44832011)(6506007)(2616005)(5660300002)(36756003)(41300700001)(66574015)(83380400001)(4001150100001)(7416002)(26005)(2906002)(66476007)(6486002)(66556008)(4326008)(54906003)(66946007)(6666004)(8676002)(8936002)(86362001)(478600001)(316002)(110136005)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?J/4/ouPq8ngCd8ideioTwVrNw9j/WaqfpfisQBF0kY+FJqX/Z24WvQOgPO?=
 =?iso-8859-1?Q?rXA1iuF9WZnab7gUa57jV5JmldfTA3k7mIcnehqlQjUI7f+ZvPAZqfWRFP?=
 =?iso-8859-1?Q?j/9xe+owbG0qfV/4xZwT+47lzhZvdf+LcU1Oo/eZudSktalFNdEtnBCFOp?=
 =?iso-8859-1?Q?yxrcIGMyRQLKsZWCl5uMU05VSbC+I+KsxVs4CglTpsVeM7H/wd73P+KdVF?=
 =?iso-8859-1?Q?clDxTy9WCvGf98YaA3/5UWNBQKm6munUCxQmkTHPtg7BvcWUtJ2vQu4iYX?=
 =?iso-8859-1?Q?Mq3QgXhB+h3hPbr0jf1wtK5H45xTso4fa1GnwfbYlU7MwcvNoTogzGZ7F/?=
 =?iso-8859-1?Q?r5qWPzqoRmuxAQcPOBF4owGxl0Ig9y9KYIXe/frEW7OMkjTvrOYX0t0Ec/?=
 =?iso-8859-1?Q?ak20Qf0kFJuLvCdcBFOM0oxBy/CxREf2Hv4F9jHOjwQd4P85fgUbaHBRct?=
 =?iso-8859-1?Q?0nKVFVMVaTxLKdDeyKMsAJoCxmdVKO5r1jIQzZlzcRParmkL+rmtN8SP06?=
 =?iso-8859-1?Q?fN7tYPuykVrBaDarp1oonKGNn/qOC+wwjfO/hLjtW2N32eraRgLhhoh2G8?=
 =?iso-8859-1?Q?tYz7y0sdjNvjudzkbOm0yiOnn4MgOHaggkeilb0mhw4DcDMq9X/Z4gde+L?=
 =?iso-8859-1?Q?rf63DJEkyOaKvj4lPumFimv9rXvoW9hLFyE6LrZvne3nuvkRQE8pO/28DP?=
 =?iso-8859-1?Q?Mi96JaNkJXxUJT3Fw+I/qAv+FRv048RSEsaVQgRzn6vm0gM5iKmkSf6jsr?=
 =?iso-8859-1?Q?FtVs1JY1EQvvVw4A4uZsVitomPzgsI0f8yTnuGf5pSKiG0Vwyh/mYpLKzW?=
 =?iso-8859-1?Q?hHZnNR26vVHK/4nUCeHw9IxBcR28W+61ybTB6uoDEqaE5ETXgdNvahYxXE?=
 =?iso-8859-1?Q?/nDPKm1YeSrxLANoPd8sCcEUOyB/7/i+C25/9vXByYm/NsaaY8LlbRhSGm?=
 =?iso-8859-1?Q?8eLO5ZehQ1S0wyRtbSP7P/nWrF3t0t0n77+KKO0V0kRtFFZHNAA8cxJFmI?=
 =?iso-8859-1?Q?WrfnqHmNzEpEZuonsKnmT+Yot2Pb1vVNVxaj7VygYb/QQIPvsO9cVJK3Iv?=
 =?iso-8859-1?Q?yE/KVmKmgXRDNaR5tWYrZFSnZL3YFKk9a4Kvft5Aix8hFtKl2hyfEclrMm?=
 =?iso-8859-1?Q?IEzhb3rxunA5EgX3/OagXMoqB/u9vLpBpamvtrPuPzXrWxS9feIAIldOPI?=
 =?iso-8859-1?Q?21Q0MrJiOBAIAt/OeApX27X3Ozv0ukjrlgDmNVc1UWtaEMtIlk0DJih/bV?=
 =?iso-8859-1?Q?ClPwD1lPzVuw+NZJXwDLE+PlfNQqNtSxPjhIke33mxrgDPawCFejss0Xjq?=
 =?iso-8859-1?Q?40EvCU7H93mSs4lu7OzcHZx3jFUH+UpfCXw0h7Ujx9NV3yxvE2Qopnw+yh?=
 =?iso-8859-1?Q?sWpAdZ8Ng1sC2Y+dLsnmpVjQFC7Wh+kS73zeUN59YyXZ56zhyR4MRXD9xF?=
 =?iso-8859-1?Q?dZQaXpSv/W8pniFikCmv3l8NIzjTnStnv6oXUA/GMDuNa1TrOLCTTUV/rs?=
 =?iso-8859-1?Q?cfJtT0YBdmaZSWSrGtLbNfOlzJ/whkpejwbeZQSuPPVK+LGmIAOvqCOIJB?=
 =?iso-8859-1?Q?AZXI6V7kepNJFAiSHGYlAroFdRm0jbQ0jTdXfIi/HhKDwB4OGSbiUd5Hp7?=
 =?iso-8859-1?Q?4Mjx+561BG3hrxu9Mta7AupOTG+t1sGwme?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e7c8e9-73de-4353-8735-08dbf756ad04
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 18:59:44.6948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYWX9ihFCHMmV/MxU6bZY0U7+yDbYTy7+oMZCxEDRsClDsA3NyKmTutOGaPmbu3eoke5nb6/T88RYjWriaEGqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7756
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes another pull-request towards 6.8.
We are likely going to send another one in 2 weeks,
but I'd like to get this in right now so we can
get a clean drm-xe-next on top of drm-next for our
first Xe pull request.

Thanks,
Rodrigo.

drm-intel-next-2023-12-07:
- Improve display debug msgs and other general clean-ups (Ville, Rahuul)
- PSR fixes and improvements around selective fetch (Jouni, Ville)
- Remove FBC restrictions for Xe2LPD displays (Vinod)
- Skip some timing checks on BXT/GLK DSI transcoders (Ville)
- DP MST Fixes (Ville)
- Correct the input parameter on _intel_dsb_commit (heminhong)
- Fix IP version of the display WAs (Bala)
- DGFX uses direct VBT pin mapping (Clint)
- Proper handling of bool on PIPE_CONF_CHECK macros (Jani)
- Skip state verification with TBT-ALT mod (Mika Kahona)
- General organization of display code for reusage with Xe
  (Jouni, Luca, Jani, Maarten)
- Squelch a sparse warning (Jani)
- Don't use "proxy" headers (Andy Shevchenko)
- Use devm_gpiod_get() for all GPIOs (Hans)
- Fix ADL+ tiled plane stride (Ville)
- Use octal permissions in display debugfs (Jani)

Thanks,
Rodrigo.

The following changes since commit deac453244d309ad7a94d0501eb5e0f9d8d1f1df:

  drm/i915: Fix glk+ degamma LUT conversions (2023-11-23 15:11:47 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2023-12-07

for you to fetch changes up to 10690b8a49bceafb1badf0ad91842a359e796d8b:

  drm/i915/display: Add intel_fb_bo_framebuffer_fini (2023-12-07 17:31:02 +0200)

----------------------------------------------------------------
- Improve display debug msgs and other general clean-ups (Ville, Rahuul)
- PSR fixes and improvements around selective fetch (Jouni, Ville)
- Remove FBC restrictions for Xe2LPD displays (Vinod)
- Skip some timing checks on BXT/GLK DSI transcoders (Ville)
- DP MST Fixes (Ville)
- Correct the input parameter on _intel_dsb_commit (heminhong)
- Fix IP version of the display WAs (Bala)
- DGFX uses direct VBT pin mapping (Clint)
- Proper handling of bool on PIPE_CONF_CHECK macros (Jani)
- Skip state verification with TBT-ALT mod (Mika Kahona)
- General organization of display code for reusage with Xe
  (Jouni, Luca, Jani, Maarten)
- Squelch a sparse warning (Jani)
- Don't use "proxy" headers (Andy Shevchenko)
- Use devm_gpiod_get() for all GPIOs (Hans)
- Fix ADL+ tiled plane stride (Ville)
- Use octal permissions in display debugfs (Jani)

----------------------------------------------------------------
Andy Shevchenko (1):
      drm/i915/display: Don't use "proxy" headers

Balasubramani Vivekanandan (1):
      drm/i915/display: Fix IP version of the WAs

Clint Taylor (1):
      drm/i915/dgfx: DGFX uses direct VBT pin mapping

Hans de Goede (1):
      drm/i915/dsi: Use devm_gpiod_get() for all GPIOs

Jani Nikula (7):
      drm/i915: use PIPE_CONF_CHECK_BOOL() for bool members
      drm/i915: add bool type checks in PIPE_CONF_CHECK_*
      drm/i915/syncmap: squelch a sparse warning
      drm/i915/rpm: add rpm_to_i915() helper around container_of()
      drm/i915: use intel_connector in intel_connector_debugfs_add()
      drm/i915: pass struct intel_connector to connector debugfs fops
      drm/i915: use octal permissions in display debugfs

Jouni Högander (9):
      drm/i915/psr: Move plane sel fetch configuration into plane source files
      drm/i915/psr: Add proper handling for disabling sel fetch for planes
      drm/i915/display: split i915 specific code from intel_fbdev
      drm/i915/display: use intel_bo_to_drm_bo in intel_fbdev
      drm/i915/display: use intel_bo_to_drm_bo in intel_fb.c
      drm/i915/display: Convert intel_fb_modifier_to_tiling as non-static
      drm/i915/display: Handle invalid fb_modifier in intel_fb_modifier_to_tiling
      drm/i915/display: Split i915 specific code away from intel_fb.c
      drm/i915/display: Add intel_fb_bo_framebuffer_fini

Luca Coelho (1):
      drm/i915: handle uncore spinlock when not available

Maarten Lankhorst (1):
      drm/i915/display: Use i915_gem_object_get_dma_address to get dma address

Mika Kahola (1):
      drm/i915/display: Skip state verification with TBT-ALT mode

Rahul Rameshbabu (1):
      drm/i915/irq: Improve error logging for unexpected DE Misc interrupts

Ville Syrjälä (8):
      drm/i915: Stop printing pipe name as hex
      drm/i915: Move the SDP split debug spew to the correct place
      drm/i915/psr: Include some basic PSR information in the state dump
      drm/i915: Skip some timing checks on BXT/GLK DSI transcoders
      drm/i915/mst: Fix .mode_valid_ctx() return values
      drm/i915/mst: Reject modes that require the bigjoiner
      drm/i915: Clean up some DISPLAY_VER checks
      drm/i915: Fix ADL+ tiled plane stride when the POT stride is smaller than the original

Vinod Govindapillai (1):
      drm/i915/xe2lpd: remove the FBC restriction if PSR2 is enabled

heminhong (1):
      drm/i915: correct the input parameter on _intel_dsb_commit()

 drivers/gpu/drm/i915/Makefile                      |   4 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |   8 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |   7 +
 drivers/gpu/drm/i915/display/intel_bios.c          |   5 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |   7 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   2 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |   5 +
 .../gpu/drm/i915/display/intel_crtc_state_dump.c   |   9 ++
 drivers/gpu/drm/i915/display/intel_cursor.c        |  42 +++++-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  11 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  34 ++++-
 drivers/gpu/drm/i915/display/intel_display.h       |   3 +
 .../gpu/drm/i915/display/intel_display_debugfs.c   | 165 ++++++++++-----------
 .../gpu/drm/i915/display/intel_display_device.h    |   2 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |   4 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |   6 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  13 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  22 ++-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |  17 +--
 drivers/gpu/drm/i915/display/intel_dsi_vbt.h       |   1 -
 drivers/gpu/drm/i915/display/intel_dvo.c           |   6 +
 drivers/gpu/drm/i915/display/intel_fb.c            | 163 ++++++++------------
 drivers/gpu/drm/i915/display/intel_fb.h            |   2 +
 drivers/gpu/drm/i915/display/intel_fb_bo.c         |  97 ++++++++++++
 drivers/gpu/drm/i915/display/intel_fb_bo.h         |  26 ++++
 drivers/gpu/drm/i915/display/intel_fbc.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c         | 112 ++------------
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c      | 115 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_fbdev_fb.h      |  21 +++
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   4 +
 drivers/gpu/drm/i915/display/intel_lvds.c          |   7 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  96 ++----------
 drivers/gpu/drm/i915/display/intel_psr.h           |  10 --
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   8 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |   8 +-
 drivers/gpu/drm/i915/display/intel_vblank.c        |  51 +++++--
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  78 +++++++++-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |  26 ++--
 drivers/gpu/drm/i915/intel_runtime_pm.c            |  24 ++-
 drivers/gpu/drm/i915/selftests/i915_syncmap.c      |   2 +-
 43 files changed, 750 insertions(+), 481 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_fb_bo.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_fb_bo.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_fbdev_fb.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_fbdev_fb.h
