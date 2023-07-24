Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B032E7600EF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5239F10E359;
	Mon, 24 Jul 2023 21:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C883E10E356;
 Mon, 24 Jul 2023 21:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690233315; x=1721769315;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=B6id4GPlRwNQMBPfGUFjOIgWBk04MtAGDGnMFKfF4U8=;
 b=ILABV0PgswBThC5LSVT4+KM1tGcfEddSNDuDb+Qpj7sa/z0ANi0LUCrB
 OEucB7/mmiCOB1P6BUbIC1WOxXrFjJKz7EP4ogrr3E3Sedn/p9qYJAkv6
 oYEjL2vIT0A1V/SgIrWCtS+fvUpOsdGvprjNw0MUrC1JMZiNb4v+U0V54
 BFPuGbUZA98ULyzZ/4KpYE/knrCk6nIlBHClpaCEVaa/EvFO+j5HEnj1F
 LrLLdbNEnWymv9ea7HR2xn1FjplCkL5n1NG/F34GpqiYTozHKy88dAIyc
 D6z9O2cTrDrATP1ITHdBgCyqFluiuJV0a5ZmWrennTVdT4p9DsxdMuxVG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="367579156"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="367579156"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 14:15:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="791111256"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="791111256"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 24 Jul 2023 14:15:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 14:15:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 14:15:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 14:15:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 14:15:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnTppDci07MNFg+G5Em+o1IaXQQhxk+7MwFJGZMMKSXL+4afw0lLiC7DIYyytu8zifzVjt6vXhC//2KHfDM8IGOGHDulxv6iYXfwB8PmW5Xde6N8N2x/RMlcMwdtmY0KSxEqS3APGhGT/0ZwitM/WSfTPraFh/4ejEkBUVAY30i9/jkPl7AGO+p9G4blHtoGobtZuU8cuIBcC4Zz9IZlIVW/t1mbfSEQEDnI5wSJ8LruC/R1T2uDHcaC0/Ub1y4UJw0ZrSXnp/m6oR9WXGlVcyBRboniX4M4ZC2vnPIuk3fsdKRzsH5XU8M7hsukjASbJ0LHIXkBhAaRSL3CkcqHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0ySB63ikAtIPbbSJkzGZy5qAk+y2IDV6KCkuJ8M//E=;
 b=NHRh6q5oTS0e91yz971bj+UzWg9GeVuiT4fqGbg+Aatci322NF79/gKsvUxk7U2qBmBCFTR8S1KPrzSPK0/SLPR78en5638k5w6B6lgSHcMQsxNUq07NeuHWWyJf0dAdJg0YvsSe9XHhBwt0wny/Efe/tQH7JZ0WankzTZYgfPanRi/NQemnfRuTWxlVwVqy+7BwsqEAVwq3PY0w9GKfdg8sy3BpyK3p09LQQxmKZlntZTKX4063xwaVvR5Ep8LvTBO4JKFpUa89QonFIVTx3/8ZxGdf1CiNkeYv+0aQt00oyuoKyz0GDLFRz5qVKxAU+SaoJwUI7UsChluc0KsvEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW5PR11MB5809.namprd11.prod.outlook.com (2603:10b6:303:197::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.32; Mon, 24 Jul 2023 21:15:12 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::1127:c109:d888:f6d1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::1127:c109:d888:f6d1%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 21:15:10 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v6 0/4] drm: Use full allocated minor range for DRM
Date: Mon, 24 Jul 2023 23:14:24 +0200
Message-ID: <20230724211428.3831636-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0323.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:87::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW5PR11MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: bff82bf3-b5dd-4a6b-3086-08db8c8b1048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xlcYFWwlg6ZYRvSsQIvZiSoXFEAY3JYAQBvshUNsihQIjz675qM0hllqYTeWHI/rU8mjNwJt1hm6kms+W1QSv754g3h0s0mYDtighVbRn6lSpwaf6S9AizuiOv4Qn/u95AxJXdWPZOfLReF+jq0YZaDNFuRCulfWLthZ/0LiF6d/RBat4x7hsxFGI7/zoqcQEAHFxQJEdhW3TJSZrvXPXSbMoLEAxAMYnmo8dLnjcJccFiebnoB85OmSF1sleRAzAW9uN7DABRx5i7P2yx2BC4fcqqYFDziORM6u+gSXoSl7E24OUTh3sFg+6+JuFvnbJREN5sCJruHhGFv1Y9aZB4q1QqSDrKERYLLB/l25RCNlA4iRIGKNQaivdBlFGjXiKxKP+BYpNrGLn+jmpBP6QnA/4vwG4oyiw6cL2KOgERODcK/VTHJxv0u7FdFS5X8K7k+jlsGehVYB3srFZ7VrzLs5QRejtUX89fKT0aTDIv5ynr1sp2KmzH6BEwLiLSyaTOsArgRMQ8ddED59qbdZVTzg0LbCk+KXlc4nUFy+5MM9K/EBGoV7ENvm0uUG4esy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199021)(83380400001)(38100700002)(36756003)(82960400001)(86362001)(54906003)(2906002)(186003)(6506007)(1076003)(26005)(6666004)(6512007)(6486002)(8936002)(5660300002)(8676002)(7416002)(478600001)(316002)(41300700001)(66476007)(66946007)(66556008)(4326008)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEJPK0d5SU1scm90U2NCWk8rVnpBWWtZS0wxUForMW1taS9VdEp3SHl6Q3pq?=
 =?utf-8?B?T2w2WVRpL1ZhWXh4RVpaRHV2M1JYQjRoQm9NTFJ0YWJEQ0JtUWVLUTBMcUJM?=
 =?utf-8?B?UU5LZWQvUlFtNmJEL05YODR5YTJNdklNMXdjTnVMbGU4M3lncmlRckhqdjJH?=
 =?utf-8?B?aWY0ZFoyTldVSEpGRE9jbjI4M1JoeTIvOER6MTB5RW9nOEc4REZMUk8zam1V?=
 =?utf-8?B?WnplR3JzL2hhMllweEhlbWk5VnFibFNBUFJESmt5UzNZb0cxTHVxRFF2WVc1?=
 =?utf-8?B?blRFWXpubDBCY3NWeEhQUmtlc3hScXpzRmhRNm9La01GZ05VcXFTdDU2VFJY?=
 =?utf-8?B?QVZTM0owUmVOL1UrMEIyZS8vU04yMVV3ZnY1bFl1dzkxczZaZjZQTzRWUWIr?=
 =?utf-8?B?aGVNbzI0RmNiaGsvUndQZXkwUlBSaGNOb005YlNGUEhvYmZha1dtYnU0ckpJ?=
 =?utf-8?B?MCt5ZHdMMUVFL3JVMkRuN3Zyb3M2Rm5JZDFmYXluamtlT3ZCZ0tNMXZHRG9C?=
 =?utf-8?B?c3dmbko3UE1EbFloR3Z6Sis0cUJBZmJnVE9vMjFXYmR0U0lZZnRvcWtlQXNQ?=
 =?utf-8?B?VmNWbnBtdEtmQVhIblVKczR6dmR6TXJRek1YRUpjZkxETWh6U3JvQm5DS0Fs?=
 =?utf-8?B?dVBkcGdYUzRXZGplaStzeEE5R3NqMXQvYzNGSy9ueElORGt3SWpSd2tNYjNV?=
 =?utf-8?B?azdXaENTcjlmK3FnN2swVytQTlZIeEFnNVludzBiSnpyYVFUdk9yL2tUL1ls?=
 =?utf-8?B?bDBIRjJmQTVoMEF5WWRBRndwWngvcVNWU2k1NXZVRG9MRHE5SU5mWG5NaUFk?=
 =?utf-8?B?OGFBa0VHNkFYU3ptdSs4T09iazkweERxOExqYjg0bzBDSkIrVTYxVXZieFhE?=
 =?utf-8?B?N2RlODNxRklwQWtvSkk0cTdMRTQ0TFNIYUdwcWhCdlU5T3VFNFkydjFaZE9a?=
 =?utf-8?B?YTlrdjh3WlFKM1E4QjhOYy9BZzJFRW9CZjJqMlJrbkNvRGhzL3FlUDBlR0FG?=
 =?utf-8?B?UVBiYU0vQlh2K1piSCt0ZDhta2RNUDNOd2h0akZocGJsSDBhNGtmN1dUTkU3?=
 =?utf-8?B?RU1lTjBPZmx3aXpmNk1KU3YyRjdUcmh2NnNLdmlHM0h3cnZQakcwY1JBRGJp?=
 =?utf-8?B?cCtXSkcrUTJ6elk5UkdFWWlib3pDcERFamFJaXV3WGtmSzA2b3dmTDZLM21H?=
 =?utf-8?B?MW1lT0IzcEhiK1VwaHE3WGdueWpMdzdTbVhDc0sxUGRTK1JmcXFPU2VQZGRU?=
 =?utf-8?B?SitDOUdWSVNNbmMyOW9waEx0aTJHKzRmVHNWKy9oRlhNTHBUb1ovUk5hazlG?=
 =?utf-8?B?QnRTM3BHZ3NxcmRHem15dWFvcEhiWjJsSTZoaFVPNFdaRlduZzN5T0lyNTNR?=
 =?utf-8?B?ekpnQi9lZnhZZkd1Y2J0RE9hbmpSMDFSajIvQU9DUUNsK000NXNVa1ZORTZ4?=
 =?utf-8?B?Q0U0ZUJyQjdobmZxWlVPMUo0WGtYTXRwQXF2eEZVbWdPYUZHazBEMVhaTWZT?=
 =?utf-8?B?TDg5L3hzUkZjSkp2aVp3ZXcvM2dYS0xCUXROalN2NUF5SWpTUi9JdHkybUZ2?=
 =?utf-8?B?R095OVFXQTBrSDlhZk5CTlJVS3VJd25jOUNSVVJKV3NiNGlVWFVDL1JvSVlx?=
 =?utf-8?B?dkFGSTN6MXpydU0rWXNpNlV2NXUyeE1HMFUwbWw4WE9DdDJFREE4dDhwY1hO?=
 =?utf-8?B?dHgyNEpENUE1VnpCVC9Hc2UvNGpyMWNiVkQxTUcyMXRVKytWZDVpR1JRZTFt?=
 =?utf-8?B?V0xncEhWanZsSnFTOXhVOEx0MzJ4YUVEZG0zcEV6Kys4SUR5SzlUZ1YxUVBh?=
 =?utf-8?B?d0JhWlVIODRNRE5sNkE5ZjBoMTZRdW5HNlh2M296U1NuV2QrTVpIbVFNWEdR?=
 =?utf-8?B?NzJsTVZGd3lza2t3V3podzZzeEthL0ZVYmZ3eVpuU1dwMzhIUkgxK1cwVnRN?=
 =?utf-8?B?RVF2a0gzRjQ1ZHhZK3VCYnZpcjJ1Sy9nb1RTSjE3VVptb2RqR0Y4SU1UTm4z?=
 =?utf-8?B?WTJtR3Eyck9hQlo2MzNEMEFaMGdsVTU0MmkxZElWODE0MzB5aVlHeER2MCt1?=
 =?utf-8?B?SDFudW4zNnhGaWpQUmo0Qm4xRVRsQ1ZsZGRQR0RsckhPR1psaTFoRGoyMDNj?=
 =?utf-8?B?V1JncS9Odk9FMzR3Um5IV1ZtZHJXRnA5a3RjZWRsaXIxMW1UTU92T1VQTXFJ?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bff82bf3-b5dd-4a6b-3086-08db8c8b1048
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 21:15:10.6054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2nSljDzDgpTW+SdOQEagzR+D3ls0d91AXLkeMYBH/N14x47tXy7oLfHZGubu5P1BAN5t/iuXjnvt//X0V4dU0AtxLmWRYz58VweTN5yxVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5809
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Oded Gabbay <ogabbay@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 James Zhu <James.Zhu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

64 DRM device nodes is not enough for everyone.
Upgrade it to ~512K (which definitely is more than enough).

To allow testing userspace support for >64 devices, add additional DRM
modparam (force_extended_minors) which causes DRM to skip allocating minors
in 0-192 range.
Additionally - convert minors to use XArray instead of IDR to simplify the
locking.

v1 -> v2:
Don't touch DRM_MINOR_CONTROL and its range (Simon Ser)

v2 -> v3:
Don't use legacy scheme for >=192 minor range (Dave Airlie)
Add modparam for testing (Dave Airlie)
Add lockdep annotation for IDR (Daniel Vetter)

v3 -> v4:
Convert from IDR to XArray (Matthew Wilcox)

v4 -> v5:
Fixup IDR to XArray conversion (Matthew Wilcox)

v5 -> v6:
Also convert Accel to XArray
Rename skip_legacy_minors to force_extended_minors

Michał Winiarski (4):
  drm: Use XArray instead of IDR for minors
  accel: Use XArray instead of IDR for minors
  drm: Expand max DRM device number to full MINORBITS
  drm: Introduce force_extended_minors modparam

 drivers/accel/drm_accel.c      | 110 +++------------------------------
 drivers/gpu/drm/drm_drv.c      | 105 ++++++++++++++++---------------
 drivers/gpu/drm/drm_file.c     |   2 +-
 drivers/gpu/drm/drm_internal.h |   4 --
 include/drm/drm_accel.h        |  18 +-----
 include/drm/drm_file.h         |   5 ++
 6 files changed, 69 insertions(+), 175 deletions(-)

-- 
2.41.0

