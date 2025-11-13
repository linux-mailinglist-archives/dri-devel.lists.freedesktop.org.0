Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BBCC599DE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 20:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0D310E925;
	Thu, 13 Nov 2025 19:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/o0Oi1n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3B310E924;
 Thu, 13 Nov 2025 19:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763060830; x=1794596830;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=J4wqne1xRgsYUECqvaIV06c/Gejdyz3dpsORd+6XJxA=;
 b=k/o0Oi1nt91s2Ly54M74MqUjrjKRVaExSukmWtc4SptbbWLkExCoivip
 EG3yAX4O+h9PevckCEF/OD6jGVm2R5Mfq2cqNkaP8ZQnse7JAAo0aSLcg
 PLm3GG16/w6h3/7soG8b9UU4Zv8qsVL8Q9UIiIH8/DxVLEPKazd4HexVD
 6NSpeAERU9taWsuBBt3dhQPsF1D3qzQ8KVhAERLe5b8/NZaMbG/hR3b3o
 BxEiWLFnOsZT02MMGVwKlV6HoARNMzydZKvD6BKwXXUYEGrhoCmVNmcDE
 CI7pia7lwOkfmcqE97fscsGcb6a5zK613RX9zp9hrYFu6RfGNy96Enlcs A==;
X-CSE-ConnectionGUID: rHw0/W0TTWmTkKQM6xo0xw==
X-CSE-MsgGUID: dcqjwukjTluJEIlaQPG7nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="69003335"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="69003335"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 11:07:10 -0800
X-CSE-ConnectionGUID: Zrm+tU2US8OPrxs1GULI/w==
X-CSE-MsgGUID: u2mALPHiTQKWdMIYK8ZuBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="188860154"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 11:07:09 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 11:07:08 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 11:07:08 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.54)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 11:07:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NF0EAY9zWDQ7P0c00dMH43Eu/A/9gqi41eaMdzjfHrqE0k2e9wFq6MxrhxJIhtZ0VmH+wpgzXzROVoxS5TqFjFpCxfY092+4IKpkjZcR1dutGoKVBoJw/bdWd3q0L02doEVzhWtv3xEyDzk2M3XtDQXWHoIECfb+yRoXn5ywmCtMRvlOYPR/83EZJLrzxvC+Zk+KdXkWdQ22bCmd93ThLosG8xuzIeFD7yC10YjIqSq8Af+IO3yJno2fvNJZVWtFbj0+6G0oLa/i85nyUUGsL/ehMc4EqUgyHgb+igPALBYequHV0BaStgUv4khN7SUtuMeo7ucVQ5pBREt5QA9j7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsQTS5pnMH0RoihqSHZG24ra5Bm7N18rHCM4PABa21Y=;
 b=Q/YC07zqaJwXl7xQ+dfTpf2WzLht/U/7EW2+kAe0ULGCBYjrqaglsMuJA46dQMsvRtaTQsMrbHSChew/HNEBtjs0ZBs+g0OJv4TrMaVwcMDYsdU3+AAxuJdYWklcqw0Crku57kVfffg9Vbg5z2MR/P1R4gp3GaDvQe4w+iozQ4eahlSoeq/ywG35dku0oh9OepyEbDFG/fI8RSkTAZ7SCtiCH0iFvWphgf5UxiJ4fiGP9dUBZcvynOWAivXG49tTqwe6xSdJyjxlmGpRgSvmPb2u3rCZ5SFLTXclfT4cnDS8JrgNuoJLFNZnefnpzr6kNgP8/ZnybJ/vsUsJxOPgOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7856.namprd11.prod.outlook.com (2603:10b6:208:3f5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 19:07:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 19:07:03 +0000
Date: Thu, 13 Nov 2025 13:07:00 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <ay2qztgonodwson6tuzcv5napjmqbgwzv27so4ybfola34guux@xgufrrmbzyws>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:332::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 99821929-1f15-46de-5693-08de22e7d479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|27256017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?76tmv7bUabAK6re3JhCAHnisooOl09zWEqzRLBShNDxFaeDMfZfE/W80EnNQ?=
 =?us-ascii?Q?cfzM6fUFj8v+HEWbUnpakYMKn/QyItXn1215JOV/OsUAmFM1r1Lf3saNxz4E?=
 =?us-ascii?Q?DtYAfMJrVYbBOsjXpVjDpWvdiEkmZA7R1FzIueKwTU3o6KJM0tizaTUJpVsf?=
 =?us-ascii?Q?7rxxvndC2HHYNs4mcdO8gOtdKzPKEtQ3TIU/fw68s3XLtOi/Hrjy0ZgvHk7v?=
 =?us-ascii?Q?3wC2vecLEkPlIsK17oC+iY8DP1dkY577/wBKtpySp5Pcqa+Y/d7ReeLf8ztc?=
 =?us-ascii?Q?s2Ldoxc/W55cB8yAy3bWZe2CCYDehECvR8gMnD3EJ113nrs+KeuZ0skBeBif?=
 =?us-ascii?Q?ISCESZDE92451TQ3ECAz9wXhwPB24z7fmex3w7pjGUxItuyxmJsFVRZyuyrC?=
 =?us-ascii?Q?2Drv+oxnXft2VmgcC0T4ledaV2HeEtVLzFDIggS62muMfqEjeFx6TLmgYnEO?=
 =?us-ascii?Q?iwWx4AqxIdwxcp8njZFNAcBmsdGPbxoIkce0az7QX3NPx/Zr8s5qcFILnZTi?=
 =?us-ascii?Q?NX6dGvRMLY5CLdu9n9NaWetU52GUlblohdL6iIlIqcaiDHDqUl8nNz7Mh/Ob?=
 =?us-ascii?Q?bHHfO0fqwOusEU2D2nanWsqXp70z1Vyk67/uFzBwPad06lQZKaoSYvsxSWie?=
 =?us-ascii?Q?Pv3gj3YUsePQnDw89CAKSJu+dSUGC8shDBQTykal8GwBnj+1i+uYfQdrJMaG?=
 =?us-ascii?Q?fk8V6eTvd0EQ4PMUVg9BUp4C16GgNcchA5XgpDFjgNgOm+iwo47WeDEO4gBp?=
 =?us-ascii?Q?Z01OSfPc8qe1anhbzsAnibk1ORwUEi0kc31v00v0gaOsmOhKxA7lPVaajxSy?=
 =?us-ascii?Q?U5BiATaw0hjWtIkxHrB/ZpeVUKSLuP7kk/rdx4sXVjrZEwkHJBda0mocu5RO?=
 =?us-ascii?Q?NYtE6kpBp/ENodxRTa9gXlnLypVKSVqX+iZLHRkgXQrO6KOJW8Wbv2JyUVOB?=
 =?us-ascii?Q?gbcyBcatEDYgS4v7CcSHdxewYjnbTvoE3s/frfjtHqnGd2lxZCyM29Usk3nF?=
 =?us-ascii?Q?3wfR6M/QzU7t0grx5O6nC6gUizFNfl/K5dR9fdaRkhyM4CR8VUEeKOJWJFSH?=
 =?us-ascii?Q?1sck08A+YPFZbu6S8/r+TlkJ6qprSmN52ZEFsZPPl5yJjQHzZNvS7aqUKtHw?=
 =?us-ascii?Q?2pcNBPxpArsK3g+4DotX7qI0yXQm4BBeYDmxdHN5DGlGzSPTNabrjc/yVdQ+?=
 =?us-ascii?Q?SrMsnvbIlICFEJwWHM0A3l3zB7tgXBFQB12rwAhOcdR8vkgoRtelmY4qjGi+?=
 =?us-ascii?Q?whaLfXI1482vwD8v0FpKPi69hUOrWlQnGvEhoiqq+yzpOlEE8h3vVmfzttWJ?=
 =?us-ascii?Q?E1wYzuRlTQCK8Lk8eBnvThBZLFdOnKEWwrwKhh1ecTL0lRhoKlPiu2w8zomN?=
 =?us-ascii?Q?MkrH0wUWDa6JpJ8OM8RRl8itwRRdT9tWF7rH/GGvi4BgfePFDkg+Q14hu6Vt?=
 =?us-ascii?Q?IPVOrCGSbNCdxGs0vscq/HOXcXR9ZoFn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(27256017); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b7D3UYQAdXf2Nwf9E+fHxnM49HvSmqAQ/TdEg+YVbGp6auzBUMICLd70UwqF?=
 =?us-ascii?Q?J9f0XhvxdCORL8X/xS47zB3Pwd7v8cg91/XrBl9Biz13fv8oXCKzZTo9JmR7?=
 =?us-ascii?Q?WWNacjmIbRpFSolY9EBpbfU37zu289rZhUIBduU3k2iAG0Sm+8L0+98DUG5m?=
 =?us-ascii?Q?5PjdG9MB1yQaPEEsPJVJwAbl/zcBWnYJ6LSiQ0gYuJAk69/aD2MdJ8aWY+X+?=
 =?us-ascii?Q?fa2VCWXuvsmyD/yxAERZi+XI+ZMQR9ZDbDHcBEKvGEp4WMjl1WfQ9QUFRPIw?=
 =?us-ascii?Q?rzhp5IXRRAWXYztz0pXk8tNNzbtIJnS6xQzlerbqjo+VApDXaYwewQVaJiYs?=
 =?us-ascii?Q?znPXKyzkX3W65+q9anKBzbDduKLL3jfMmPqkXEY62i8djaTZhAHDSa1ORnX9?=
 =?us-ascii?Q?a5vHUjI+O7hOF5CFedlSd9tyOlZqZrbERfieopVqd5t7CvoujimsgMzb4NKZ?=
 =?us-ascii?Q?LRjRMTspMa51wcJ2pXME8Uqrij09WkfgkmQ2CmkN8laRh0mazi1EM4FKPY86?=
 =?us-ascii?Q?9K7YyneH+mWnbj/LhmHxxyBGljMo2RXSDywNpEs8hS+8sCCZxRAQLPs78+w3?=
 =?us-ascii?Q?8oJ4VNVev8Id1I9HsMzT8LrJNUVNO43H1lft8pUrCG4UVemeSvN8unm8D8rH?=
 =?us-ascii?Q?7UM7EhGtgqBDa3uPX2bbWGGwOTxP50VmgcG/x4FHqnqXKrmRtR+OHJt3qzm3?=
 =?us-ascii?Q?1AY3mpMoGwJ0a/NEo6IvOsaEmH+kDHcIP/rsUu+2KhmR2ovuuyfzl+4QbA0w?=
 =?us-ascii?Q?KSxrqRHPRCDCe9HONmnxrtGRNwsZF8/9J4/BLn06BgKt1SdEAONdmL/Y7Wlg?=
 =?us-ascii?Q?04Ub+WdZizh5PhlqR9FySMrysvedYm0Y8P0UnoeaTudFyztZ0xt1PcYGT6UZ?=
 =?us-ascii?Q?kMJ1s5OGBK9CyIEf9UJlnErdMrHY3iVoIcMezsaYvP4yf2uSMTXLtgA8GLGV?=
 =?us-ascii?Q?H64etIeK3Dc1mEJbddqcJZ91AiHJAhetvO6SGgTZhgyuKxmT9BRT9eGdbsCi?=
 =?us-ascii?Q?0ncXB66RYNEMhG9fRrvMqNJQ1Ae5huKRX6x1oKHHjU1HOM1IhmC6yy7VYt6Z?=
 =?us-ascii?Q?27GY9zM/2JcNELCD/X8oV+O63ucOh6IpPXIWS9qKdzGvPqakdYM+fhCE4xO1?=
 =?us-ascii?Q?AkJbnEXuI7U/j2V7C94LnyVEc+po84bJLm7LFWfjj1VSyY8cLxuSZfddwUGl?=
 =?us-ascii?Q?OisWPLnYsATHKamHfZRp9uOCDGhrqVA1sNex2sJymu+NMSEI5OIoPu5IjyK5?=
 =?us-ascii?Q?DOYRnHZea5hl66/xIbeUy4j8DeCKGq+j03+C2uvl7l94tgzXv7+V1SbHsW08?=
 =?us-ascii?Q?XsPJhqf09ghJLEckyb8MysfM+ShPaQwz5lSF9nSv6N+HfsLcEXpL/wU4xpms?=
 =?us-ascii?Q?2oIQluqFgFxGxCvRIo382fXiCzIjs3V/ccOrXN1CgtV8Gu670RGsyQW3cbyX?=
 =?us-ascii?Q?5Cv2Z/AiYSFZf0d8TkZuiWWqXpvTSppU9uA4pFJBEkMjv/+0Cam7nsklO4EE?=
 =?us-ascii?Q?g0uPqAg6dpk8QxfMDaAGrTH1DhQ7djjAbdWIOF27f3SmA9XN+Tcjv5crKxBT?=
 =?us-ascii?Q?vSmsSyKvPBCT2GsbkNeGPgG2EbA4SZ0LDWCrA5iw9xEiI5YjJPh3YIzpf60O?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99821929-1f15-46de-5693-08de22e7d479
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 19:07:03.2451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuBLSLKUGP+R6kZep+eLCOYdax+MXbQzJ+q9JZFaYMXT4wmPBemNOOnOT+ndef6tOmO9QGVIc6a6dWye1u1xT+zmzMGaOCFYu9ZoaP3PU/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7856
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

Here are the fixes towards 6.18-rc6.

drm-xe-fixes-2025-11-13:
Driver Changes:
  - New HW workarounds affecting PTL and WCL platforms
    (Nitin Gote, Tangudu Tilak Tirumalesh)

thanks,
Lucas De Marchi

The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c:

   Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-11-13

for you to fetch changes up to 240372edaf854c9136f5ead45f2d8cd9496a9cb3:

   drm/xe/xe3lpg: Extend Wa_15016589081 for xe3lpg (2025-11-10 09:41:44 -0800)

----------------------------------------------------------------
Driver Changes:
  - New HW workarounds affecting PTL and WCL platforms
    (Nitin Gote, Tangudu Tilak Tirumalesh)

----------------------------------------------------------------
Nitin Gote (2):
       drm/xe/xe3: Add WA_14024681466 for Xe3_LPG
       drm/xe/xe3lpg: Extend Wa_15016589081 for xe3lpg

Tangudu Tilak Tirumalesh (1):
       drm/xe/xe3: Extend wa_14023061436

  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
  drivers/gpu/drm/xe/xe_wa.c           | 11 +++++++++++
  2 files changed, 12 insertions(+)
