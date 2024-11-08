Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A3A9C2057
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 16:28:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F8510E9E7;
	Fri,  8 Nov 2024 15:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jy4HELAS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7115910E9E7;
 Fri,  8 Nov 2024 15:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731079716; x=1762615716;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=r9fud3JS/dG3n3SnWm3M2fEOQvWLDvMj3JTYqpfWhCI=;
 b=Jy4HELASfI8DyqVWOZIiMSQ6BvKkmVKVFbp/kSjHVGqXlRLqK8SwUMgu
 BkUjr57ebtzvPIzLaPKFKVwxsUbK02rP8hYUkuoZvHolhDmHnt8ViPta9
 PI3apy9QFaAxO99Rjr3HL207vHBZrQs3iJEK7WauDjH9qtGNYD7M5vR1Y
 dWLMHqpsempsgx6C2q/d041J6VOcDKkUF88bpQqagpT+scaNSu8oGAvkw
 DKadbYNnk0AfG+j58Vnn2/0xmKKmuRnzAC/suyJsWYMOgLRqzIGoRuOEq
 b1/+1gkJbWsd2MvdJSAjbAK5g4+vG99z6+CryyuW2jG/BGIj1eG5pXkKg g==;
X-CSE-ConnectionGUID: 6XvB0pfgSbKvjWAjqBSbhw==
X-CSE-MsgGUID: QaceJ8paRMmJtstU+J6sAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="31194125"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="31194125"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 07:28:35 -0800
X-CSE-ConnectionGUID: v1ZQ/aFLSnOs7pgyxT8XoA==
X-CSE-MsgGUID: csXIFbQEQpqDEwuiazv3HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="85519645"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 07:28:35 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 07:28:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 07:28:34 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 07:28:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBkNyYNn5mmw23n7oqgsJNplhkS1phs7q2eAUHRcY+/GStf8h6ROciWVLcG78XR3Q1xJtqk6V2NLqwawVI3LVIYm2zF1VdkpIGeBHaSo/3JRQ6vhxGh4C9qPfA0aNBweuMLGpfkrs4K1DzPgaXnNMa7f7GlGMNeFkkBS+4b+dQToCssPpOUrCeg2BGRFB832UxhRNijTnBH4VJtOghk/0snPkIeVYD2VeiJ2xV4MrrrE06A+BYA/dK3a1ox9l1OVa8D8PHPei5TarU8aXioluPB3bQT/plj2B7af7mosNzXIzthzDTiILKepDgyUqFd5ZvFwZhRsJveg/mlvXlanUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVIE+xpaeynv/RGYyU1HZMU0Wxq8uANSIMWGwbjjNwU=;
 b=BdbSqPOcDzFEqbYS1ivyk/TqoxfBH2dbhXVrSV8GX7mOXdVjnCD6gk4TCGMXgZ7N7hZPPwQCccyJ8vgJ4Q7uQmuepLXLxecK8cBkAJoVvKD81xh6MzOdP+uRE8WFbCo7TI4BmZn2Zc/OzT7b/9nbLkWqc2cYQGeeyKlLLtBiVwMPbxm/AdRP06Y4h5ixpmlMSrwSKaYvRu1mXYXSUNJODr+DSxSnCryqxKgsxAJ2jNkXGPXULiUAC/deWZEqCe4vQPgxwOrYdXnwuN0+f59LAr9KB32ahY05NLX39UGdaR1NavYTgL3b7F17hw5H2ReJth4ClsoeF7ux2pjbZTJ8mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5284.namprd11.prod.outlook.com (2603:10b6:610:bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Fri, 8 Nov
 2024 15:28:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 15:28:32 +0000
Date: Fri, 8 Nov 2024 09:28:27 -0600
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
Message-ID: <4ffcebtluaaaohquxfyf5babpihmtscxwad3jjmt5nggwh2xpm@ztw67ucywttg>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: MW4P223CA0014.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5284:EE_
X-MS-Office365-Filtering-Correlation-Id: 66eb749f-1981-47f2-fa74-08dd000a00a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?clwJW9m1hBADWS04e1eloCoQ3lg47UqX9bKkXyIcTAIMhM/VNe9Y2YZFpgID?=
 =?us-ascii?Q?UfcOvbLmfq6o2caqckQeKDyES7RsqDhKuYbL4Mc8bQJB+ZNgQtjW0E5dl6VW?=
 =?us-ascii?Q?RGPLdA0PlPs8aoKFmBk6Y3x8/0ng6fjOfAX9bZNdP/QsqK//3gyvlIHis0/M?=
 =?us-ascii?Q?m7wj4BuLk+7XSwqzH7WSukoG8Jd7k/YEluwFnhThDb7DwRaTKy1aoZsZo5qP?=
 =?us-ascii?Q?z2qJPmBE6F66mK+IO3GBqP1NuxI+LOgzLig2AOe84W+DnxUq3oOZLQ+awqOD?=
 =?us-ascii?Q?p+F+eDMDPZDTXlDmr4wnAUPOgVS+FKhbmsenBgdmuAKOtKRU9ZRepe5dn6IU?=
 =?us-ascii?Q?FdN9AgxdTFVJk0SsQVPRAn3HVrneyBRissGC3Iu8BGNdHbSt/qVPWNfz6ITy?=
 =?us-ascii?Q?Vdh/DwdCks4JA0NCV4rZw6f3roPaIqZUea+yCSb4P8EwJRmlNiqd+az82xpm?=
 =?us-ascii?Q?J0csUVO5/kxYVj/n1SJr/ZW16lZRw1xkz6Nd1BaemGfKhJoXgQYsxGm/1Pjk?=
 =?us-ascii?Q?3RYL/ooqYUg+1U0zIHVtT8wknGIw0TCwhuMfZ07wRxnBIKB+uAJOtfL7Ec4h?=
 =?us-ascii?Q?5F44fNBc38Y+hzBCrGRdAAAgcaKf0ays7kN4v2R994jbyiSnkqb3IVw5EPEz?=
 =?us-ascii?Q?gSIJEnn79uaQcmXN2PDeB8JwXdRQB37Ap/dG7Mx0fxJ/wJ0RCAOGM0kuhdx+?=
 =?us-ascii?Q?diTiZzVHqKMBcxWgBy296+MeJRa3MndN3CbUZTOhcUzeL7V3AzX1Cqvi3RJ0?=
 =?us-ascii?Q?Z9CFP/fpQtKYjBwTaeghv2Dv5NTJRWLxHvwbFcJd7SS+8DS1rjjR9+j8N3H2?=
 =?us-ascii?Q?Q+53IZ7DCUdbqX6PYyo6ZI/ENiymMuJtVZ7BocaG2s4QXB/beksI2ArW+up3?=
 =?us-ascii?Q?pFE8ylKJN9pISoNaoA6DK4P874GjGeMXED/mFAX/Wcs3WmR9S1Wsyw+Ftm82?=
 =?us-ascii?Q?Vjk4upq1VYKDhwLVOkZWCUMXmDqUrqZTqaPTBk4wI1SuXnGUMf+gynf3MTxG?=
 =?us-ascii?Q?EZScq7PMBTRrnfZqhNDDp3fqrg3EKbDUPkZl1W++R39Yh4bN0g4as6qJhZj0?=
 =?us-ascii?Q?dJKsbKLFDU18xPvfzv3N3nfje5bKrwf/wMKsVjkSMZt9aLjLx7MVWZQ5Hsnn?=
 =?us-ascii?Q?ju9x43Wl+jY0ToYF3AVA23gqW2hpVdEcY1EGP153+QAbib+ap5z7bzU3DyDJ?=
 =?us-ascii?Q?fvjEp1BTCjhc2bNt0hgQbhuoc7bEk5EN5B5ov3Q/RKvAaOynewI/Kav7jkTE?=
 =?us-ascii?Q?Vy6kNuqSuOAzJctaOi1S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7NR22bg5Nin6Zdu4Hz+sQO04pA8GoC+iD0SsvxafPONbbnfmZE4RB8v0xSSv?=
 =?us-ascii?Q?rwrMD0mpLHY9Zuv0c88BWCXk53k2tx9MHcWC3THFAxV5s27bcWnNKsaQMGP8?=
 =?us-ascii?Q?DzJ4l154IkTKTRI4b0YqNPc5UJId/H7I0iFAThGlMPrPCNfn8l9S6JbNuldo?=
 =?us-ascii?Q?6HBrhAqSMWgUeibBPwI36JwvGuSm3XTQIKmXQYAvenjWfe2icHaiVQau8AT1?=
 =?us-ascii?Q?rW4cpdlYLtyU19yuw7w0j9WMh8lUQC+LbnYyNAEfp9tXhkoxPN2igxJmyydX?=
 =?us-ascii?Q?O7ELD1X59SQdiaINmTnXdDAVspjprASpSvozE4J+H8lkzv6p6Lc9ZhyjKsHU?=
 =?us-ascii?Q?ZGdxAL4rfWH2eiZOIyjfIP6KAQa0EI7xoihtQi+hj98HV2TUSxPJYREtlkip?=
 =?us-ascii?Q?mejskMFB4GqaedFYBC9HdWfuINjYNZsqQ3ErU6Hl+dqdPFecxfXHNE0pSMCk?=
 =?us-ascii?Q?YRV0NyaTwnAK29PGYp3q4JrFg4rwyEQhP+lpjVQx/VSwlg/lM4IZaPNaS+VV?=
 =?us-ascii?Q?t+9adQCdJr2LUwiGJkmiTUHtVQMey9VTJ1T2kM31uOJXSmX49sIjHsZ8B7B4?=
 =?us-ascii?Q?iN764VJic5kxFyt74hmeM1QkQ5DeT5P72Q7BvPfF7lyIs32ShhN9l+ROZChM?=
 =?us-ascii?Q?1QNZv0FyNFXknju1m1QFg2BmWShQ3Ws1TLPAO3gnxzHy5lktHOE8Q2BnGlJj?=
 =?us-ascii?Q?rXQRomMJBbOGpoUNwCfIXkNu1B7mIYkbQ7FaUBej+AxwoacDoWieA5bkVJ1M?=
 =?us-ascii?Q?enj9Q38K3yClGZxzuQSP1iCxmwrX9yjciTM+Wk9Mqd+W2e3BQIuu3dvf7ZpS?=
 =?us-ascii?Q?ON/99aIwr5VkD7bWKzcvt2Weo4IdCWoJPcZG1AnUVfPd+p/W0LiBUFJlVgrJ?=
 =?us-ascii?Q?VRoQ5LPoAmUQ5ayIIfdTrWJ6pZrqbZGvb4Og4Z1AvqZtbIi2r43ttLvpfXQ9?=
 =?us-ascii?Q?FRka/7MZN91occKFmrDNbRuP3Al898Q22kanmmqRm/VwJ+3eUxiR7Gbave2L?=
 =?us-ascii?Q?NZgTvt6ulH0t3ByZzriFNSCawytYjjaZQ+lS657drgnaJq6i0+Y6kw3DJvYI?=
 =?us-ascii?Q?DQJBe58k77fkIkhvYaiRL6Y76/drpFhQPpeObKPSuMiBJ2N0LsTRk8eytM8P?=
 =?us-ascii?Q?IpkObe8VbeI2dBdD3nrXKJZ9wSIDR2ORrrScSnAXCsJyouFB25aWEcy5Wari?=
 =?us-ascii?Q?mE6LRWQK29CzVMU5mseY2bd0RKCctn2QXUo5ccd+3juJK8KHtNI/FSHM3HXX?=
 =?us-ascii?Q?I0z8Mca070LLnHXAJKxiHFbVBPLXWc3UJbFVpn85JNvzQK5IvgmJwowUCsfP?=
 =?us-ascii?Q?QdGBm0Pt9X1POwhknnsJ0T4scNv5p1fNj0M6mPvSnyTk+/Mjs0gz9CPra86Y?=
 =?us-ascii?Q?w7gLMXE+rKj02jfm0setOc0AExlRpjG0c4NTLEzaQzTxuxclNHYbwS3aA4LW?=
 =?us-ascii?Q?n7ivh9c/LSr0RUYD6Bg0fNqSgyjPNT0zHXMLS3wwz6iqktu9rI4iJtzu08Ra?=
 =?us-ascii?Q?ZonBz3Y/mj163Ule6yROXOxugFpwFIM5YpQD49Hzunby7fHCVVZ3yHD+UR5+?=
 =?us-ascii?Q?R+4bS8OSixI4Y1OIGI+UOfSg7DZo1MMAyHM4DPhdGR6AnDxfRO9Z/kkAF+F1?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66eb749f-1981-47f2-fa74-08dd000a00a8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 15:28:31.9454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fm4629prkLkxiFigpti89OaHKL04Zab0QOjDdjo53VnwOvlCtGmTlSaVC953VPHRGjoJydwIH4Oop7PyWLM2eV0PZsBqrhWxPVI4CVHTLl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5284
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

Hi Dave and Simona,

drm-xe-fixes for 6.12-rc7. Still busier than I'd like for an rc7, but
needed particularly for LNL.

thanks,
Lucas De Marchi

drm-xe-fixes-2024-11-08:
Driver Changes:
- Fix ccs_mode setting for Xe2 and later (Balasubramani)
- Synchronize ccs_mode setting with client creation (Balasubramani)
- Apply scheduling WA for LNL in additional places as needed
   (Nirmoy)
- Fix leak and lock handling in error paths of xe_exec ioctl
   (Matthew Brost)
- Fix GGTT allocation leak leading to eventual crash in SR-IOV
   (Michal Wajdeczko)
- Move run_ticks update out of job handling to avoid synchronization
   with reader (Lucas)
The following changes since commit 59b723cd2adbac2a34fc8e12c74ae26ae45bf230:

   Linux 6.12-rc6 (2024-11-03 14:05:52 -1000)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-11-08

for you to fetch changes up to 514447a1219021298329ce586536598c3b4b2dc0:

   drm/xe: Stop accumulating LRC timestamp on job_free (2024-11-05 15:40:13 -0800)

----------------------------------------------------------------
Driver Changes:
- Fix ccs_mode setting for Xe2 and later (Balasubramani)
- Synchronize ccs_mode setting with client creation (Balasubramani)
- Apply scheduling WA for LNL in additional places as needed
   (Nirmoy)
- Fix leak and lock handling in error paths of xe_exec ioctl
   (Matthew Brost)
- Fix GGTT allocation leak leading to eventual crash in SR-IOV
   (Michal Wajdeczko)
- Move run_ticks update out of job handling to avoid synchronization
   with reader (Lucas)

----------------------------------------------------------------
Balasubramani Vivekanandan (2):
       drm/xe: Set mask bits for CCS_MODE register
       drm/xe: Use the filelist from drm for ccs_mode change

Lucas De Marchi (1):
       drm/xe: Stop accumulating LRC timestamp on job_free

Matthew Brost (2):
       drm/xe: Fix possible exec queue leak in exec IOCTL
       drm/xe: Drop VM dma-resv lock on xe_sync_in_fence_get failure in exec IOCTL

Michal Wajdeczko (1):
       drm/xe/pf: Fix potential GGTT allocation leak

Nirmoy Das (3):
       drm/xe: Move LNL scheduling WA to xe_device.h
       drm/xe/ufence: Flush xe ordered_wq in case of ufence timeout
       drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout

  drivers/gpu/drm/xe/regs/xe_gt_regs.h        |  2 +-
  drivers/gpu/drm/xe/xe_device.c              | 10 ----------
  drivers/gpu/drm/xe/xe_device.h              | 14 ++++++++++++++
  drivers/gpu/drm/xe/xe_device_types.h        |  9 ---------
  drivers/gpu/drm/xe/xe_exec.c                | 13 +++++++++----
  drivers/gpu/drm/xe/xe_exec_queue.c          |  6 ++++++
  drivers/gpu/drm/xe/xe_gt_ccs_mode.c         | 15 +++++++++++----
  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |  4 +++-
  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 ++
  drivers/gpu/drm/xe/xe_guc_ct.c              | 11 +----------
  drivers/gpu/drm/xe/xe_guc_submit.c          |  2 --
  drivers/gpu/drm/xe/xe_wait_user_fence.c     |  7 +++++++
  12 files changed, 54 insertions(+), 41 deletions(-)
