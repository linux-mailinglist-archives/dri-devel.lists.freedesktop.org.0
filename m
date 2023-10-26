Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA887D851A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 16:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDF510E7FF;
	Thu, 26 Oct 2023 14:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FAA10E7FF;
 Thu, 26 Oct 2023 14:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698331693; x=1729867693;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=5GdQv6CFfnF4569qtXcU0wHQSoNXy0LcQVKsbwzTVJI=;
 b=ONNlZUu3IJpQsEVh3SFAjRClIR4nwjBXTmufh5+fihO2wEwcN/ImZJmX
 e7tmSxV9FsE6VePV+itMRHyBDnu/PhCQROuY1h6hBefFh2vRs/sbqdVhj
 diTje45ed9xtqU//i9uOJrjr5IE8zfMR5P2/IkfEpQxKju9r2bpS8wueq
 WSbvgP4z4zqz/x1KIpg54LVUzWnAlmJfmAlRbVA33IqnC6cnzRf5psM7v
 2z1kHxtnqNhWcqIXT7bj+Lfzcn3r+5NJnx6LMJLfr9e/q/z7Ih1n+uHb2
 JFh7/eQVP4uGhoy2wmxTn6geYkBDedyE3SXkwwrXoVM9qrx57zucOUi/a w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="384770744"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="384770744"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 07:48:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="932761300"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="932761300"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Oct 2023 07:48:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 07:48:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 26 Oct 2023 07:48:11 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 26 Oct 2023 07:48:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9mgbLdN/3w9vlWp2LCQqBt6sNybR1EXp1uTFkD2hkjt5mF4sirX1seMOmKM5qvkRZsSatTC+UrD6Za/OvlQSscwTDiJyNno2Mj8mVwffr4BoZtglTDqiRAO6vojErHyfmPLVTXP6sb6+giFyoyZ6moPo1w55LSohvdLPwtovh+AMSWyg7ZHyBQ7/o2P+zGIUxZ8NRvRkm1EIHpoJ8UhzyDLLxp9r9GgdxrGyVSp5qZN7AsdZMTqouNdqJcr/sGNaKTf/EJGy2/jWIaYv1rwEWThHZXb0zWXvN0hQIyS0+q5M7w2SURUZ1xevlSb0sayn7xk6zamylsge+kacPMbew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33FhrqtL71MZvHL44AqITPhEA86LaaY1smSYPbbKcsE=;
 b=LpKq6mwo/LMk2uNDBmf8fMFcFRLnRf0g2ArNlyX8jUKqf8m6e04BkoLfoThIT+/gPXKuY8Dutyej7hoX/b36gYh/h5439NTaFmrIeCft0v1OXE6ZVrejqdotsPMe0KPLLwGKnotW78TUfBRbvema3/7j0jlsH3M1Z5pJIeX5i7heFMI206JDuapDmEu7nnPwt4MBtbOmJNnNLvmBpnTwiTGcUy7+1SytO1W1a4dk0Wt/hFBvOIS9va/fXRePtIAUu2eLRHEGe8KDwBMZ0PkpqjCoAk1qiTuT/DYQgKtCz3pwgW6gamB6qqt0B2du/ViP5eD6UkAW2bWvv0s94vnLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB5924.namprd11.prod.outlook.com (2603:10b6:806:23b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 14:48:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e%6]) with mapi id 15.20.6907.025; Thu, 26 Oct 2023
 14:48:09 +0000
Date: Thu, 26 Oct 2023 10:48:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZTp8IQ0wxzxVjN7J@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4PR04CA0323.namprd04.prod.outlook.com
 (2603:10b6:303:82::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: fed867dd-b358-436e-4c14-08dbd632916c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HSajlCtQlXwR60K7bxRXFnwmocweGInKnCwWxJGGhNNU2BfeEdvXej6cIDAddubYQ/i1+9x9vf1k+7vm78FfqmG3zV9slnwVPvftGVzOdSIJ+WNKQpTyxhBxULZxCbPDSc/DSuJY6XUqv1fRD7EYcIVql30zcoUYsHMohRZK+4DioB2th/sL/00XMRFAbkVkJHhQN+BqNgKscujqi4Urk5ieyV31KjNhcl0a2Z5TA0fOeP73JhF2ht/5ck5ZIOmzKX83ZmBv0EY4YrgpGHBoMjf00S3Gp4v+E9sZfW0tNyYQbx5NAgmklhmzDh27+w6LkUS/y8yJwQyucK088VUAONN/G8iREyZ5jnBtGwGuZVKYQaUZ65qYPPLHTMleXl0NGzfsy+F/njQHqyWCsb3MRN6/BXKwJ4Wzyp4wNOLW8L2vBcMom+EB74mvxKKBB8HDRzxl+9DSijjQZIcXbV8xm/2BCaapr1rcVaE9bCizeMaWdCcuDrJ5VnY+OnBa2VtiyP4ywvfOxHizz1Oyu0HoJPP0uxNLs0jCdQEdlVw19hPsCAysUkIHlU5UThr2WNiM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6506007)(478600001)(41300700001)(5660300002)(44832011)(6486002)(110136005)(2616005)(316002)(66946007)(6666004)(66476007)(54906003)(66556008)(6512007)(26005)(83380400001)(4326008)(8676002)(8936002)(36756003)(2906002)(38100700002)(86362001)(4001150100001)(7416002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?as5b+L9NBKMiry/zpRimLvcE+KYuLvNfQUUX+Q/vTTOfeaW2TheoDxjFCqKj?=
 =?us-ascii?Q?GuWUgg9qMMhGXcf7Dz8CV39aJPPL7Xr35LWq7PY1cqnY4biKIJ/Q0yov5Rd5?=
 =?us-ascii?Q?z4XSrmp/DGV7YXpDb3pJfFDZXTNQuPVhRjkYnZPjO0kzUrvOoiQOR0o6udam?=
 =?us-ascii?Q?4rb5gFj0pJ8pH8UVe05dZPps7wEjb6cqiZYHurGJxERYRoE7MboMX9+UGzEG?=
 =?us-ascii?Q?8C6J79HlWEtoMxsHSoSLZ32GjmqVb35jAm/De4gn9NUZKnMcy51HHpOCFax/?=
 =?us-ascii?Q?A+iBhmYc0O/jq06m7xBjAYdgPNMLFKFKfcqZ2E/OV/LHRNXrRmtdm6urA9Is?=
 =?us-ascii?Q?OJPr77IdEQntIn7Mbx9FF/uVwn6nQhrRTJuVqgK5wI/4T9uYV89HmjuLyVfn?=
 =?us-ascii?Q?0NOaOmYmJZuDR+tgVaGs8bUxlNqcJpQiEplA1bjct69QVJu24TNK7NzRqEX/?=
 =?us-ascii?Q?xCR/VSG8HfHFXSl4feuEFHRLGP9me8UUAEzwkmEsiewNi0IDR/TNbkJSP57p?=
 =?us-ascii?Q?IHMUGC+EQBXibwndW6Y7F7I8V4sSW5oe7scHkrK8l4syPy44AqzPuTqkU/QQ?=
 =?us-ascii?Q?r6zidohWm7Qr+rHgVJ8pKo7/5egezuSLeB+8O3a99E36NiGbve+w8u3Qx+3P?=
 =?us-ascii?Q?jGxgenC/3v4sncpi+IWsNfox+Pzx9IvhkrNuJ4ZSNDvYdB+7t5+WFNerVHKr?=
 =?us-ascii?Q?hPmjhSMRkUP6lBE4HQDrJzwasHT4a0AunGeVM+epJV8UpKVCfzAvPNwLLLNx?=
 =?us-ascii?Q?iKAZqyqjdlGQCdtATGqxBt78Hryb5xg4w1ownPDBSOu5UlgMqn2Lj0ihO7CK?=
 =?us-ascii?Q?n8YCuD+TsAMfizY0Bg9TqC1WjWisyVNN9RzeKUNCPlq5X9AiR5cPaYBFbQP0?=
 =?us-ascii?Q?/qbBquC4MizfQoXO8in1MCNXoX8OoUwegb+XlZIuBp7PtystqNQ62BFBK+TS?=
 =?us-ascii?Q?CIDazKa9W6EEQLt1ahxYN/MbfIIJzwJxp9hSyioTdOn6rvPbXlP0MzWiDQWx?=
 =?us-ascii?Q?YUU4jFv+5EBfVFNTqENWbJhC2DumpIinauJiTe2bWYBjCVrsbqIpx1UvSgtS?=
 =?us-ascii?Q?iEhdz/4UekTECsHOsPLUfZBRUbirfBYBIppyDB0aBhbk3XtbCG5U5/e23CRe?=
 =?us-ascii?Q?LvNk/+WDya1drHcrlk0bL7OmqbpYY0q3lrpwxShTtO93zZUYAMtsc2odNdJL?=
 =?us-ascii?Q?q5oGVNfMjgrb7LOH0rpdxkl1vurYs8tyk2FxlikpYgNYDVq8XPyew0HT0a+Y?=
 =?us-ascii?Q?MHJUWGkMWnb+22or9KHRGJYVwu1R4OuXY+1Y0SfZpvU8HMQQvHpJnUIlXpir?=
 =?us-ascii?Q?7fe6d+9qBTmnU4QxD9rVtGW8RjEOtOkk+vxLspoigRngtcximf+XKpPHvitx?=
 =?us-ascii?Q?Ee2B3IRpzfLLMvcvFEVLL9wBGF91eR7VFIvcqfgTCZjChldvHFgv8+M2nxgb?=
 =?us-ascii?Q?f+dnIeYNHNILm5HlMJJhyYF70JNi2ib9MgFCX0qJ5mH7rNGHI5QXLAcPwnH9?=
 =?us-ascii?Q?iCSki6qTw+6EQUzK1myLvqyaI4pK01pALeWbH9ko4BDFE3SJcPCrNcJTe+Ji?=
 =?us-ascii?Q?h3AzAaXtYJGyRRDdXvFY7wVfPYmq42F81c2t/OSh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fed867dd-b358-436e-4c14-08dbd632916c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 14:48:08.2651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ugQthJmUqyjMzoiNYcmaoFgIVie7SYg96o7SrWrIl1Fa3GkcdRxJcvMiYgKd9yg5EnMmlhhAircd6/N+ZVNzDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5924
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

Here goes drm-intel-fixes-2023-10-26:

- Determine context valid in OA reports (Umesh)
- Hold GT forcewake during steering operations (Matt Roper)
- Check if PMU is closed before stopping event (Umesh)

Thanks,
Rodrigo.

The following changes since commit 05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1:

  Linux 6.6-rc7 (2023-10-22 12:11:21 -1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-10-26

for you to fetch changes up to 4cbed7702eb775cca22fff6827a549092cb59f61:

  drm/i915/pmu: Check if pmu is closed before stopping event (2023-10-25 08:44:30 -0400)

----------------------------------------------------------------
- Determine context valid in OA reports (Umesh)
- Hold GT forcewake during steering operations (Matt Roper)
- Check if PMU is closed before stopping event (Umesh)

----------------------------------------------------------------
Matt Roper (1):
      drm/i915/mcr: Hold GT forcewake during steering operations

Umesh Nerlige Ramappa (2):
      drm/i915/perf: Determine context valid in OA reports
      drm/i915/pmu: Check if pmu is closed before stopping event

 drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 24 ++++++++++++++++++++++--
 drivers/gpu/drm/i915/i915_perf.c       |  4 ++--
 drivers/gpu/drm/i915/i915_pmu.c        |  9 +++++++++
 3 files changed, 33 insertions(+), 4 deletions(-)
