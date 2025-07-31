Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3600FB176C3
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 21:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C9210E7DA;
	Thu, 31 Jul 2025 19:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BoZvaPMk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D3210E2A6;
 Thu, 31 Jul 2025 19:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753991181; x=1785527181;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=D2R6NdyD2l8r/gqWmBueAmnpMWsQj9BAumWZLuEqXgA=;
 b=BoZvaPMkDjTMNJ8ZgPDNiBTSXUB4bLEaPbO2Eb9Z+GfFXgirts+nUXl7
 wIGWnj4RC3bf1GRjPW38y7fNxTvLfQ0JYquI79ao+NI06Ptq59yKoPjJM
 0dAAJjR/i64Mel7XYfLpuyqMXP4WJ0t0sLIw29ZY6Qcs5VVaCUxkvy/gs
 Qsv9WY0X/nJ5hJusLsVR3sTfK1iK5QWArOrVJJ9yyhCkL/emLuWzVw/+S
 rzftdEWPFay887T9/Ds0/bnKnfYlCiykJdreDLIkFi0K5TxqIeaYGj0Yq
 54tNzgsoWUk4JAN9OgGK49/mBPzvJKDRIE8H+DiDT1jP9ydG18zrLtaq1 w==;
X-CSE-ConnectionGUID: eDNxupkmRz20EaDxby9fKw==
X-CSE-MsgGUID: 38ngaSFbTMqcE08fVGX0sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="78877170"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="78877170"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:46:20 -0700
X-CSE-ConnectionGUID: 5pZTKqGrS0OdGyzwI7RoHw==
X-CSE-MsgGUID: uQOBef3oQ2yTY7UoyepAyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="164147420"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:46:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 12:46:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 12:46:16 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 31 Jul 2025 12:46:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6adaHUM0Wd6z5N9WzfuSZCkEJz1OkACnD6NAvtQHF7BE1yNkGLYGBfrJ7pDH4vhgQi6fekSFIVwfr6UAr3ce3rR3ixGQdNvRDDH/W12xG/nJaDkECb47DeagM8KotabcJKAtzVwqrZ++wH5M+6ZCMmkmycoTxlWe3GFzP4IqMz3X3lKTh9bHg1K4NEzWmUJatby/yaQdOyPhqWX8yHDpUm4dVc1Cu/Utjw5mdOu9O2uvLogqvj8KD3gLmoqpWTVoMuPyxUyzq6qpxldwOT06u20wp9j0aeIrSXNdxUfX2/1Pu+3OsxTyTDVIly1gPtDtf2H1Ei43IzgqJuq9bSCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAG4mxTDfdyJh2GYlnozpO5PtzRueEP1672sz6hqUos=;
 b=sxjrjzLyYA+cQBiP5oPclt9oLDSnVQZYBtHGUCsh9YjqVJWNQcfw+PYmhs28dJB1CMI89FPQU5Qu0vETiDDB0vaAdU1fcZDUNl8YBX3AlbE41no18lCVpTDwNxkFH8cQMf2UzUVL11SBhNFA9aIeU46PIEwxJgLz9ICGoGFUoKSo0jqnma5kIjrqbmwe60JuAW+7gXQzRDpctS1rIr6rdIx+SvEZni12N03i43pJF0m60hndep2hOM1R/Xj1L26TicSMFz4YQtSr9/MtQyWqtuLDWzDCUESMW4IDOmuCdZS0OGMDIhZt9UTHKpwhc6VKX92vsUJqZizT8WvpvvRDLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH8PR11MB7047.namprd11.prod.outlook.com (2603:10b6:510:215::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Thu, 31 Jul
 2025 19:46:14 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 19:46:14 +0000
Date: Thu, 31 Jul 2025 15:46:08 -0400
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
Subject: [PULL] drm-xe-next-fixes
Message-ID: <aIvIAANnXv-j_bNA@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BY5PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::25) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH8PR11MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: 15754cad-9017-490f-c60c-08ddd06ae886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EYDWKoRLxxGL5CXhvIUizBVgLLNbmfjk1G2hybRKZzKpAUCai/6fX137Y61+?=
 =?us-ascii?Q?TNf8vrE7BDdYyy990aPeSIZpOdolmBWcjafESwGlentpYAsz5k2MkfLdnneZ?=
 =?us-ascii?Q?TJdJBgiMGW9P1Lt/dXHCNXWlbuTfObVsR/7sJ1DBfnWcb3UglRqol1DjHpUm?=
 =?us-ascii?Q?3ADc7kr0gO33FEmE8qGppJR0BB0ig6v0sUREVeE9bHt08VCG2+sEn96+DIza?=
 =?us-ascii?Q?QeE0fBakAW8xxmK4DKfr1MJpHAQdkPfdg7JZBYzDwP7j+2y51RMMPl4zRyA6?=
 =?us-ascii?Q?SifTfdFrHPld4i1GyEsvIHr+J7K5F7aAEB5w+IVM+6KCTQAswMITh1JV0tH5?=
 =?us-ascii?Q?9cR+2pd+JNaiiv1DPIzsLXCn4SMcP0FY6dbgDaTSAPh1IuvmjuxQCfBP4niM?=
 =?us-ascii?Q?XDKZejg9j7XXyWkxlTecyzeVdeLtl7Nic3PFSaKMgJEjws3W+xFyhbS3sFts?=
 =?us-ascii?Q?K8xCN8XotiACDOx/rFWamhieuVm28jB1Ze19k59vVWveGjIAn2c3qZ/ZX9lm?=
 =?us-ascii?Q?jH/95Wk+yTZvd/ubRAvCRZPWUWwk9AhqbZJroQ/Ad5BxGxjYAlVb/EVoXgwY?=
 =?us-ascii?Q?vPB/yRBUo2rJgYf6aQ9RroiMaL/CDDryM8B99fGEx8hsozKKG2UuiSZMlHGu?=
 =?us-ascii?Q?W0g+8grF0uxW1WHzPgt7m3LnqOZYsFCI/i7xFUN77ZfJ2Jrrl8adPqIzpXs6?=
 =?us-ascii?Q?zSa25F1W/Hn7fMKSpUmf18Il3kkERXEyXQxyoEOTGWJ9PNrT2HBnJ7bVEupO?=
 =?us-ascii?Q?R0jcWqZvxP2BsKYEe0BxGpmjjqfDVGNlQ47PQS04Xbmt6kKd28ng3A6Vbh1p?=
 =?us-ascii?Q?kh4NNSHK8rNJMCWzCz3udUoUL8H2fHXAc9S+BVEaW6PrB5H53ccqSS6ACn+D?=
 =?us-ascii?Q?QJf/aEBkb1UzSjVsHodE4SqIDdPGRSXXB+ZH366DzIMgxk1icxnMy1v6Qv0O?=
 =?us-ascii?Q?Ky1r9mSDZa+l3IlCMnzG+mG29+s25IhbvF0VE8EUpcQtKy3yQ4Up9Yc6Giwq?=
 =?us-ascii?Q?gcUQM3iTKudOs1brqgTK9HlG2WQ14Sdz11fCNhYG55C8crP5R4ygw9Q/GrFo?=
 =?us-ascii?Q?yFdZy/VWapWADa1GZmSfz9g0nh9+369t0w1DeraM/aUcppel+dKF3dUIuT+e?=
 =?us-ascii?Q?z/xfEvOw4M1FJPBv+6oIbWN5cVt165Fge9Dlxb3GuXGurRaFH6rntkzocFKT?=
 =?us-ascii?Q?Di7MUXuoTUtKsXpG9J4uBLOOoacVMGdQOU5RrqL0uwCbrsbQZekn5+mC7kIb?=
 =?us-ascii?Q?d1ikb4CwHluxpb7dVoJqekarOuK99svJhd0iIAYOgaR21RISAAZx2lATHzfo?=
 =?us-ascii?Q?4Pf1H4Xl4qf4OMlnG5sgZdzrtdDkLL4rHmFD6vbELb372uItAK1G8dmzhulQ?=
 =?us-ascii?Q?fi6DTX4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q9mdjtF+BzveIIwv1wvrzJvhX68PTx+nGy/cRjD+mR3l45oNYwNydYD4T5yV?=
 =?us-ascii?Q?+inh5ItRp/4ca38rK5u28UcGPpSu7waEA0OtCmJPhlPYMSsVrffF6hJoLxil?=
 =?us-ascii?Q?iJoMTnPEQ2AZvm4GTVTMvwnoE+YrBiT2sjtWr/E++0HQAkasz6Bpi57SMV/x?=
 =?us-ascii?Q?+1VO7uIS6WtDlLQZdpsl30LX8qPg1+H041iSWXNmWnGxRcW7LpGkMakpftEC?=
 =?us-ascii?Q?4bdLfXEMpqgL21o2gs/YRyU4kAVFu3YqwDtOeVsgvGzAT8HSXT89ztqN0geT?=
 =?us-ascii?Q?0XZSEJOn06MhoxB/qMx0g6g1xMBkFK6C91wUby7JneOljcAu93oP9G4AhGII?=
 =?us-ascii?Q?Nc/BkSk6+VAqnNLQMotMJKKCeKDyY5Lgp0eCiGZlmBBx8QVq25tNDeD1AFUL?=
 =?us-ascii?Q?mAxrns4z5lAqh5HaHGFNSvx7mVPmIW6GFxx8qmxq/71uGHOfYUWycm46++Cm?=
 =?us-ascii?Q?W2WW1x6qGNfUnwMjPnkPc3bX2aV6WucFoTm+ZZ3SnlfQoCI9QdEW8ZUYG6Fa?=
 =?us-ascii?Q?ESfsVIe6ohZ38lmtz332ox0OfLjvz/D6xgF6HR67Z/0w2QPGR/mr3egZYVkD?=
 =?us-ascii?Q?sh4zZWHjdnWCTvsb8HNtS87JI/xioc7hfnodXl9e2zD7PcF/0iFPl5eftQsF?=
 =?us-ascii?Q?IOgA2/lPhn2ksr1nC0K3XzNLIuOfgqmkmjz2YHFTVA2IJgHEAkUzF1XSghHu?=
 =?us-ascii?Q?VqOk22udSMR2Ekg2SxuLxRShjObQxsUbon8PckEQTRasuvGZW2SZsdUYAdgK?=
 =?us-ascii?Q?gZg6jzkHiUkNl6L3FMl8TAUYIlcU7yZ0r/3j+J9bD4+XeZ7XMh97ybo7RWjT?=
 =?us-ascii?Q?Oki7LXOjVLR/mJDk1lA7WyWYFvaD9kvQvn01V342CCTaX8quYxd5XmYI81Xk?=
 =?us-ascii?Q?YQ9j9we+TxRGdXPVnk5xwXD9qhT4eVXY9jdbuGmJPPd4bfeZ416SJKROHK5Z?=
 =?us-ascii?Q?dHOcxt7aJHPLKOzVoRs9DIGstKYVn61cKnQhhdH97LGNX0dES5P9ld3ag2Kh?=
 =?us-ascii?Q?CMYR063tQDoU5xaegsJmPr2bhaXXR+bTXD7DidNihnLuB0YMNo5FKL+PwMug?=
 =?us-ascii?Q?GwA85PEamhOpbsnJ42BZwQRxVVpBYv1x8VqSHYSR2wrLen0ID+8l3pqtyI7E?=
 =?us-ascii?Q?mDgDKYP8g2FifAUzkoh3CQHQ1voimFEuBgpKCi+lLElmwn++aouwusbUSwRD?=
 =?us-ascii?Q?CTvfJu0MUsoNE2Mkr9pX0eiieIwTQ4nhHY14SFl4V1D+rJHrQqR4Q9cvJVFE?=
 =?us-ascii?Q?pp9l8CfQjV8gDelcJKSr2/YNDsoIiclkzXBO2EWFQ89n6JeZFFyTlEAoFIug?=
 =?us-ascii?Q?8MdIta+c69Dk7GEP0frbU96pzr/WeYU33PGYWZtB80/loUeec/bhuL2mnuOf?=
 =?us-ascii?Q?ApRiRTorPpktfOK9scP4qdNvQirK+WaKjDK4Ip0mClIP69l4Eu2/2KANjW73?=
 =?us-ascii?Q?Lxo3o078dDoHuT+IdyPh4qnKHIwVJyM2DYMz4Mf+ufouWtS/S3KRuFiSV3gj?=
 =?us-ascii?Q?FAKsOG0pH7p2jFxeOgfgMVJJgA9fG1Rax1z05McTXDizhw5wHlh0b+QSlGWG?=
 =?us-ascii?Q?RLUIcdsgox4XmeC7lOJxtd1s89ksN7jarmTJw2AE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15754cad-9017-490f-c60c-08ddd06ae886
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 19:46:14.5231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18h/v/QY85uJahz0/iNe5cS6aMh4/frzy5bfh4/dgHYZmNEVYhSBjIH5v29AXHKKkExqMy5zkZSErujk9LiG0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7047
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

Here goes our xe-next-fixes.

Thanks,
Rodrigo.

drm-xe-next-fixes-2025-07-31:
- Fix BMG probe on unsupported mailbox command (Raag)
- Fix OA static checker warning about null gt (Ashutosh)
- Fix a NULL vs IS_ERR() bug in xe_i2c_register_adapter (Dan)
- Fix missing unwind goto in GuC/HuC (Zhanjun)
- Don't register I2C devices if VF (Lukasz)
- Clear whole GuC g2h_fence during initialization (Michal)
- Avoid call kfree for drmm_kzalloc (Shuicheng)
- Fix pci_dev reference leak on configfs (Michal)
- SRIOV: Disable CSC support on VF (Lukasz)
The following changes since commit ba0f4c4c0f9d0f90300578fc8d081f43be281a71:

  Merge tag 'nova-next-v6.17-2025-07-18' of https://gitlab.freedesktop.org/drm/nova into drm-next (2025-07-21 12:56:39 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2025-07-31

for you to fetch changes up to f62408efc8669b82541295a4611494c8c8c52684:

  drm/xe/vf: Disable CSC support on VF (2025-07-30 15:09:27 -0400)

----------------------------------------------------------------
- Fix BMG probe on unsupported mailbox command (Raag)
- Fix OA static checker warning about null gt (Ashutosh)
- Fix a NULL vs IS_ERR() bug in xe_i2c_register_adapter (Dan)
- Fix missing unwind goto in GuC/HuC (Zhanjun)
- Don't register I2C devices if VF (Lukasz)
- Clear whole GuC g2h_fence during initialization (Michal)
- Avoid call kfree for drmm_kzalloc (Shuicheng)
- Fix pci_dev reference leak on configfs (Michal)
- SRIOV: Disable CSC support on VF (Lukasz)

----------------------------------------------------------------
Ashutosh Dixit (1):
      drm/xe/oa: Fix static checker warning about null gt

Dan Carpenter (1):
      drm/xe: Fix a NULL vs IS_ERR() bug in xe_i2c_register_adapter()

Lukasz Laguna (2):
      drm/xe/vf: Don't register I2C devices if VF
      drm/xe/vf: Disable CSC support on VF

Michal Wajdeczko (2):
      drm/xe/guc: Clear whole g2h_fence during initialization
      drm/xe/configfs: Fix pci_dev reference leak

Raag Jadav (1):
      drm/xe: Don't fail probe on unsupported mailbox command

Shuicheng Lin (1):
      drm/xe/hw_engine_group: Avoid call kfree() for drmm_kzalloc()

Zhanjun Dong (1):
      drm/xe/uc: Fix missing unwind goto

 drivers/gpu/drm/xe/xe_configfs.c        |  3 ++-
 drivers/gpu/drm/xe/xe_device.c          |  1 +
 drivers/gpu/drm/xe/xe_device_sysfs.c    |  7 ++++++-
 drivers/gpu/drm/xe/xe_guc_ct.c          |  6 +-----
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 28 ++++++----------------------
 drivers/gpu/drm/xe/xe_i2c.c             |  7 +++++--
 drivers/gpu/drm/xe/xe_oa.c              |  2 +-
 drivers/gpu/drm/xe/xe_uc.c              |  2 +-
 8 files changed, 23 insertions(+), 33 deletions(-)
