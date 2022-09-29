Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1925EF99E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 17:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DB910EABD;
	Thu, 29 Sep 2022 15:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E51010E616;
 Thu, 29 Sep 2022 15:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664467097; x=1696003097;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=GN5HIyZTqc+TQjoWlAnDKi1ThFNaKC+XMJpPghhzWhM=;
 b=TysMnkPDt35dWIzDj36000S3U3uRfWbwp1OMgujzHOeoUB07fltUnXyY
 oJe8VPIL/SaRVoc78xD//0Dnp7axlKkBFOK+0NB9NDk2Fr9p3GJle5kjJ
 I9N/D+JG3cPSsm1ICo+qc41jjcUkndivtkZVznbuavtpCxPVd/M3cy3jI
 LHRAcEIBEdqfux+FnoHoTArvmZDT1gegjQrP+nnztbb2qMu/RoMwFRZ7l
 xj6ChRFkNNu4OYXWI246sJXZdcL9E4ka9schDR0dB9o9u44c2Mo+uk/Fd
 rgydqMOSwU5H60BRGG/Gb/kdhEsbsleHTrev97IEzZqt1J7f9qcLSFlVc Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="303427270"
X-IronPort-AV: E=Sophos;i="5.93,355,1654585200"; d="scan'208";a="303427270"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 08:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="764768756"
X-IronPort-AV: E=Sophos;i="5.93,355,1654585200"; d="scan'208";a="764768756"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 29 Sep 2022 08:58:16 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 08:58:16 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 08:58:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 29 Sep 2022 08:58:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 29 Sep 2022 08:58:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gx/7zJGoEPexYzKyAtPck4BipmJkMbh9HyUg51T7EnI1+PnsZSRlDq9HN5/c1hQAN3xiItscsgGnOrif6X5igJa7vF6cA/M8PrzRMniI1zwaT2sHVafErEoT4LyFxOCDOxuM2bponAF5Wunjhhj9E1Ge5dBPaLiIj7z7NyDdX1gImgOoRITLqsz/p/SrWjJ1WrqUbD/BuBiXWedDQEudXRmxcGEEsu9rMJt/aSbOxHhKhhGP33tXg10A4McqQVb9cTZCqi41alCb3A/LPJUtCSRNAyPSLAJgQ64QjUUgP7FCO9jCoeNdOkxbQEAKwh5zZwNQFgKqgYXND8PBAFlqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKQPTFn7uLwOT6nTKAEPT5G6Oh7DuXikQr0CL+/KRVc=;
 b=jEtl3q73uMPDG8WFstMarloEMGBq7KpFQWeJu4BBULhNgjI9ekwck1MiiXKWNP6qgbqni3he1yb6STqLrCwuZWJuPqpFdzuNvNSXkiEBpRrzylrYHpxahCULH5NxM7ZghH5rSHxv0JWlWpLmbcGILdeM0E61z7FayiDdgLR+lMTqdZ4s/+pLhwI6MH9/K8cJH8mjhFljDn4COB5EkargPwsgmMVpSvIFqWbjHOj6yOBJ7+RVtMzWz0xYQAhSqZH0io68ZDwyEhYe6YiZ0CO2enQzgZHG1p6kVjkYkVUYUifr6V83oDKivbJXs+KiW6b30PHwEyHEoOl2uiKIr0PO6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6380.namprd11.prod.outlook.com (2603:10b6:510:1f8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 15:58:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7%3]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 15:58:13 +0000
Date: Thu, 29 Sep 2022 11:58:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YzXAkH1a32pYJD33@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BYAPR08CA0042.namprd08.prod.outlook.com
 (2603:10b6:a03:117::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 872cae09-0366-4df5-0ff1-08daa2336a1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /bRJ232sJCYUNmj/s1qtku+IhD3KsgiyuDOFOadONMbDHZ78MxoNkYGvrur2r/UwQf6qbpqKoDvS5SpKl+3XNoPO0GY6Gz6Feh5hMrC5/ANaXyUvBjzZXv/ZoDIPWcGwE90BIgi+eSdKF8BGcBRahhpUwYVLLo0lPy3dtL4T7Ei4r/t7nkjM+EBR3q33tfx9ui3Jv3PSVWPH+nU4xH/Ysd2JDJv0tfPXMcsX2rVjn/2s1fOEGVeyk4gBy8LKaI/opKxlmOknYMEVyF1Srvhwk3mbPNZ6Om+bjyni5DBVkIM7NMlkIakJlk7yZM3rAfgc5cJcSPIFK+xLUNfDFJropQNHu1mjRfEgqvpC5Xm74ASikgQUBpD5isTVvXGNfpmu9CR9/qgxNSnJ0PgZAl+PTdVp3TX31LmO5qqWOxeoXBIFSMIJCMWOC+iR8x/yrbM6HNO5+MtaMlmQZo9VIzYZb1C3m/nlc25K9rz0VkO0xrsAZ7371Iwb0YKCZCZYYls8xrkMKb2P9G2neoK7g5HYmSzoQ9Um7DseAQa2iRBBeYf+/A98k2M3Dj4OuKV9Nj0984Ui8Dutw55ePv2FHKUkLD+e2o6k3ktOuIadtIU3z0QS8zhs6JaiVLn+pwnGO4EtGTUkPuP4dmN7IoRKOG/DeGbb1lmsLWZXx5dn4gFTfN8xUAv4RsIAfMmr4EpumRmMJHQhIZE5qQzSwaoZn1tjtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199015)(26005)(6512007)(6486002)(38100700002)(478600001)(86362001)(41300700001)(8936002)(316002)(54906003)(6666004)(110136005)(7416002)(2906002)(6506007)(83380400001)(5660300002)(44832011)(2616005)(186003)(4326008)(36756003)(82960400001)(8676002)(66556008)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uXWZ4h9Ufu+f6Q7IRvukfrNqCRTkN5RIf3HWsOOGu5+V7Cvb2c2SO7GlR193?=
 =?us-ascii?Q?ZC0CE0iEXNW8t4MATtoSi9iyp0ob8ZSsJFafePtOzydMRc/b+FeqL/bG/N8c?=
 =?us-ascii?Q?mcegrpIsZmOac++8j4NdHuIG7g5skS9iIbQsVp8slMVYqD6cqeIiSs9a7v5t?=
 =?us-ascii?Q?KuOanmSDUbKYOPdncKxNHVhRd6xtOGiZSYfhNHORt/boQjfHOxUVb5aJ9hdU?=
 =?us-ascii?Q?zammFiAKY+ZgI9fU9wPssmaIfnmTLcGP9kbpejSDMzoqL+snYhDC5ahDozWD?=
 =?us-ascii?Q?4r7i4u6b1MpU4Z0GusoQbAvcH1ghOBpdUD/Ow/LsTkLIMBfTUj7xyAZsU3cV?=
 =?us-ascii?Q?1dRv/BuBHQw0or+iH+nexNT8VfUBBLaoLPFd53P9bjV9UU3ajqJJEUCwanuZ?=
 =?us-ascii?Q?iU/EIgnN7GuhzMbPN7eh2ORFUT6ilNZlypGvE9JaTPgP5EE+kBi/M+FBhPjB?=
 =?us-ascii?Q?esx3GD7mk8X+hpvZ2+3HVVwRihsaKP19NDzUnSjcyWH3Amh2BsSoKE9vGZkt?=
 =?us-ascii?Q?IR8lLOqp8Wp0Bc5HZiz+R11Ynz5ZTwdcTvNxFbSM5gWPbS+iMDrSah89BOvH?=
 =?us-ascii?Q?4qfQe4ih83NBjjVnslHm58ocgr6Fp0xMq0OOkclOhUcoIiQE7rLZn+Xw0g2T?=
 =?us-ascii?Q?7+Mk8P8QYgOaLEpt1hSPP3064h99rWtMuuqhRS9FEqwIUIlMojEt3p2N2CTQ?=
 =?us-ascii?Q?CmcHR0YkfkkmRYid38kVaPNdecvZORsz0BXcUcdHQVuU+lYFmm0yW4eV8CVE?=
 =?us-ascii?Q?iKZn3srKY5U7J4MY1XBl3WQTxYsmNBTLTr8ARv2dGSaV1sh/R3r8HXlp8N4p?=
 =?us-ascii?Q?SlUpNY4OYfkH36e2TgOXTYmdqJXd9s8aiAQbeEVIz27tQ5SjWEeU/yLuB9fZ?=
 =?us-ascii?Q?o34RIiSZvDF491smRIYIYmBjVFwFyWXMnTT0zhx7O1WZAw8nzCWX7UFQSxV2?=
 =?us-ascii?Q?IXhEYG0GxmSFmx8uX5cl7c+lCtsVeNq5g5ik6kJyu7F3ZHBzyZXmn8niC1px?=
 =?us-ascii?Q?yGvr/hlptjG3TDBvvsjJGnhUtdldlOc9vCvfZnZQFUHw+kbfxd8NzsY319zc?=
 =?us-ascii?Q?DxBdq8/dQujw0VcKe86E++cBRNm4GGNkD4prJ1EKoepxlvxN1AkTE9YyJ9ax?=
 =?us-ascii?Q?6K7U/c9xif9n87mHNx3FaGH1p/neMOFU2nSrT4LRdAll6M7Ka7hTIzhK2z+S?=
 =?us-ascii?Q?u0UO+GfMjkQFqdw3v8AjMXSvdJrB/RUuRjF8+cf583MbUIiNyvdmVmh3hoT6?=
 =?us-ascii?Q?XHcydSjxAID7CmHGBokbCLO3DRRuDwFXwgSEFKI4tluqt2jb7YuJtvcZkm+I?=
 =?us-ascii?Q?jcUGTXIwOdIpCCDiFo8lUmjnxC7aNDzEiwOgfS++8FIumBtumK1P7ZattQVG?=
 =?us-ascii?Q?04C2aamfuBTRNhLP4EHUodUmb8KRYqNmj1FK+TkBxzYQREU1P/XlgfZ6oFYG?=
 =?us-ascii?Q?bnuVhWsh7GW54779cIe9VLN05NY6HKXHf+nxQEUp2RsnM3DWMwdsghGPc/HY?=
 =?us-ascii?Q?25JJF+BqBShHJC8YaQVn5fJ7g2U+sVz5gVtEbA98oT4M3RoFCpZYbFITJiWD?=
 =?us-ascii?Q?n+fOm74faHxD+z1UluQnj7e+4BumjrG1rhB/j+gDzpqfbYqTz/hq1GC2h4Vi?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 872cae09-0366-4df5-0ff1-08daa2336a1e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 15:58:13.6402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXVmdw6rDSwkk51bdD+MaOmx9QCSc7S69ieYBlriK1+7GItAirYbNVFj+sLXqmA9NwWtc5xY1BCKg0lWZn0M5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6380
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
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes drm-intel-fixes-2022-09-29:

- Restrict forced preemption to the active context (Chris)
- Restrict perf_limit_reasons to the supported platforms - gen11+ (Ashutosh)

Thanks,
Rodrigo.

The following changes since commit f76349cf41451c5c42a99f18a9163377e4b364ff:

  Linux 6.0-rc7 (2022-09-25 14:01:02 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-09-29

for you to fetch changes up to 7738be973fc4e2ba22154fafd3a5d7b9666f9abf:

  drm/i915/gt: Perf_limit_reasons are only available for Gen11+ (2022-09-28 16:39:26 -0400)

----------------------------------------------------------------
- Restrict forced preemption to the active context (Chris)
- Restrict perf_limit_reasons to the supported platforms - gen11+ (Ashutosh)

----------------------------------------------------------------
Ashutosh Dixit (1):
      drm/i915/gt: Perf_limit_reasons are only available for Gen11+

Chris Wilson (1):
      drm/i915/gt: Restrict forced preemption to the active context

 drivers/gpu/drm/i915/gt/intel_engine_types.h        | 15 +++++++++++++++
 .../gpu/drm/i915/gt/intel_execlists_submission.c    | 21 ++++++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c         | 15 +++++++++++----
 3 files changed, 46 insertions(+), 5 deletions(-)
