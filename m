Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC91AA694F
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 05:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB97010E897;
	Fri,  2 May 2025 03:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CDdwsxR2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026C610E0CC;
 Fri,  2 May 2025 03:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746156220; x=1777692220;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=LC//Vw5DFk9X3A8Ixc5CHm3hf5KSElEjyNg9MYEBLo0=;
 b=CDdwsxR2k+gW7J5tAOukJ6gscsQ5i8ZnZ5tmdCUaIWWE5RZ3kEzIm5K7
 lVJkJoIyNM0k/7dFrTa+WG7/PK+P37N/QbiAg7XLjOdEM3E8FpvClCfCN
 JYkJBqE8L82SPIq9hM39cGlDfVDRazqVs/16Wz4M7eql3+bEjM285ZNwD
 VEEAPNhC/6RFBpJeqLlHb1KiiBeGVbI49DtzUusK0rVAinsI/5iV8eZaD
 YP6F2xxeaAUQ4n7l9nnPE/ijF/G3FwU0c7DssY1OS3qKJtvALnbkiWddL
 LPbL90biTqWIoVdoMQvzto5cOx0Oe4CnzkTjShLbws2q4Oa9SmoPekk6z w==;
X-CSE-ConnectionGUID: vu+RX41JS3GkEC0vryxFvQ==
X-CSE-MsgGUID: osxuE/4HSlGOFmSjqWet8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="50493778"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; d="scan'208";a="50493778"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 20:23:39 -0700
X-CSE-ConnectionGUID: Qf+6hdwZT/q1E2XhJ2Yxqg==
X-CSE-MsgGUID: QURwhBDBTK+80AWGR47qXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; d="scan'208";a="138556053"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 20:23:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 20:23:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 20:23:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 20:23:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWb+pUYsmMm7f76ZwRYzSyYTUh/Xv4GywOcbkYLCDUBivv1A2VThbnIVToE44ikSbKpIK0dSeW74kosg4y6kdQTIn2+FMOBuQS4nUnrei9f0TIHa0km75TlzN3Oy7uO7BgOoNIET+DHoXmFc//c63EG1Nl8xkM+/JmGuIC6gb9S5GKdx4j5IxvMlXaSJNjdmCslJqRd4v0ACEkARPO1PEs1jI195D7ofCaV4cmbzr8beJ3bVFA6WtbdzLMJZFcWFnI/sDUi1OvR/FvpZLs6KMvb0bbBeEaS4Dpz862eIYQUKiKp5xuCX2IaGef46EpWUlWvN3m5PuxbRvFnGbVfklA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKxJ/48aPXypaQ1wKkDb6p2tZGOpV/VUD18vUfTOAgg=;
 b=aitr+VuvgnBfaVqsTRRLPGHIBFsVDPaYdFV6U3eY+d9yiPskolU8WA1zqxwRYwgC0tgHtbbgoNe7xRXLsKn7/5JPwp8DiN4iwH3gZppkJg47EnKoFM+OZJCtn5s9NGFvMoxJ0/lszq/szkRx2v5hCsKFRXwNFHQftxhznEaX5zuxLHqTQyE8PqWe8jvNzakWWyU/RCpCGVTsLf1ZsmvN8+Z6vm3lQpmS7/u+57nyv4JUKlUPUjSpKYfIo0J84eMKkHBlyRh66xIYVFEifXSijQbQNPCUFHEOFl4dOPXE6mPjJhRHt6+2Q5juwQ3R2h8pu/68b1hiDdfPtyWySH7lqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8524.namprd11.prod.outlook.com (2603:10b6:806:3a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Fri, 2 May
 2025 03:23:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Fri, 2 May 2025
 03:23:34 +0000
Date: Thu, 1 May 2025 22:23:30 -0500
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
Message-ID: <fqkoqvo62fbkvw6xoxoxutzozqksxxudbmqacjm3durid2pkak@imlxghgrk3ob>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: MW2PR16CA0009.namprd16.prod.outlook.com (2603:10b6:907::22)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8524:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b22eff1-5dc1-4b20-3ea9-08dd8928b8a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KAwUkWWo9nZZ/aAGfze/hHu08ZvT6YDCU8SyHOJk1xKeJaNLMOoM2WnbwczF?=
 =?us-ascii?Q?yJV8RZ2bHW67CzERj3WJtyyMW+EhVBl9ZtZsCYmg7A6hQkpDfpy5TmjyZVQm?=
 =?us-ascii?Q?kbXSsF/CI8xBrogBUoVE+9bHTiZMPVnbC2GYH1wlBvWR8DSQpC3B7ikbK8UK?=
 =?us-ascii?Q?q4Np3Qqj1dNWZasg2yTFqLofzF0j0g4rPzvibla66nzeinuTRx3FaMasmlTK?=
 =?us-ascii?Q?s2FvJzC0M4PRCFNw5iYNQb35S/MifOqo8KXnGaRTCb/DYDKraSTwKu9pColA?=
 =?us-ascii?Q?JURszxNgG5dG5g857bOIGmauJ7gk2f3nzeqcnZUeRJkncMM3v5zOclA0YZ+H?=
 =?us-ascii?Q?jhqjd5ZJqT1OAlWrQLyaBKvLbyhDvp9dC4Sd5QW3ftEJLa5gVqa1ftZiEmmM?=
 =?us-ascii?Q?FQwI8g3OCgoOsEO7cue136abkjc3gfi2fcUHzht9zBkEN5U+Ui+SA7I6+oa1?=
 =?us-ascii?Q?g9PE/gXkaD09/wM6VpNlo0xTzYBGcqK4aDdQRKJDLkTDk4i/YDBrT4N2mBEb?=
 =?us-ascii?Q?t52qGo3vIKHR4fJAr2Ov8dLRj8arijBal3tggz4TwFCsMthIYcOqjjPCY/fH?=
 =?us-ascii?Q?GpHeIcKrpbsvbL0c710rEITPUGc9wMZfjK9+U4BUOJDfKvfnvXD74HMBCF4y?=
 =?us-ascii?Q?rzwB73YZK3Qp/a3W26jKWudhbHPw11CcTIBJ4QuC0YOOsUzrtAZsml41Egmn?=
 =?us-ascii?Q?BX0RQG681mSyOQ6tG29wbsNKLIFYE1V3IIWAfLtt8/BjrmwmmxnNSRDbNTd6?=
 =?us-ascii?Q?tjWRSoosriOOF8oftUr8BjsPF24ZiTtnso+6pZ2D/+Ioj7rKA2f1TkqJjW05?=
 =?us-ascii?Q?SnpgRDHpjqwKy/V69WWTbTNDDrymmF9ogHbdnvPV7zPEOZ3hFMIZKPqK4gnO?=
 =?us-ascii?Q?SSBbDZRRjVK6WHM9YDWq+h6RSqcr1YKb2Xwf2MAqOxmFCec2/Rau8BVKLS4q?=
 =?us-ascii?Q?vf/M7S9tzLZFN2sZB/o5yLVSGEVnOGoE/80oNkpe/Nc6ncS7tt5xAluCcXty?=
 =?us-ascii?Q?f6Kx82zmCMkXgt6Ce6Zvtz9CXf631J14rQN9eGdiLZTZ/TvS+53i3wCi0AbN?=
 =?us-ascii?Q?Shocy4OaaRc7u8kJ1FdV46xW3D1h0KtGwVpnWv/6aH1jxQDeTlzNNBpr0cVZ?=
 =?us-ascii?Q?b+irGEq8Tu4HWJija7r/1D2xpTs+pYk5UbPd4ZhHhHtCjETW7q5MQGobfwDf?=
 =?us-ascii?Q?XbP9AhJwL8Dj1gClnxGhP23qUr6SMD6zC3sw1w7Qb2VdoleW/2sE6OUTMD+n?=
 =?us-ascii?Q?EaOguqXVp4tSZRj4vz4cBmLTXjvHCpc7S9OHZn7Z7z/nvuup4V9Oe42cA9NF?=
 =?us-ascii?Q?WpZONnB1hsHJpJhNk8JXgWejQ/jxmFWZjvgS3vFAc8krG81/zokellhMW4c6?=
 =?us-ascii?Q?dKBkHbo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xbOCnQwN/CMqaGhGQuFgDrH14uttK+DIA6v2GGvQype/8z5Uw7xdhgnRCD6H?=
 =?us-ascii?Q?zTBzQI+gqnr1Z1iMaM2seYKfN0JKoltfK4vE8PL44NCcxaJO4vQNmKH+LmX1?=
 =?us-ascii?Q?H7FjUPSkezRv7Ftel2ZTdnw4yNSjjHkwFxvgubC5XmTMdOkict2esBNZMlpC?=
 =?us-ascii?Q?dTdnDFKNsM95wRrZstcxqPi3xgHFbMwBSC22BLnpyw4edqvSlSBy4x+lDEoP?=
 =?us-ascii?Q?NtSTGjR0jolcXvEQjdB+xVRXKjvb/6wliMOWEhfPlFJ0WtmN1hPCKYF/dzjr?=
 =?us-ascii?Q?e3aHDMqmXbitskUDuRRWFQ51Mp3hBqMWovsFMZUls5z8FJVzsi87jGo1N1Bf?=
 =?us-ascii?Q?GRf/yK3A8U9pygnRUBAlp2XyM3ts4z3vjBNjpYCXrm9CsVXPBZgBPBMgbYVh?=
 =?us-ascii?Q?gzOmj/yTOESwoQWWOIJp6Ql8tvGlgkx7fsFlpF37sD9eTNOfFUThdEDN4oq4?=
 =?us-ascii?Q?FVnwOS1OqAWWXjqbn+NS66pR8xhBxpuIlh3skLUGB1MbAsuNQcM3ksSsJ62c?=
 =?us-ascii?Q?9TgtlBOMzLs6JT9uBgjwIOIXXGtIR47e3p35HZNTuXkQXyQ1byNYHVh2S1VF?=
 =?us-ascii?Q?/euNaKgwtByYhmN9Z3LLKBATcSgqLq06J0lv7Tqgx8LOPsUL0bVzMjcyzR4d?=
 =?us-ascii?Q?freDB1nVLFK0FWPOg+o5kLZu9ox1y5e0KdGrW6cqM4BuwrQSYS3CGWA+o8e6?=
 =?us-ascii?Q?8PUDGEHEPxKMeECzOuSXetxBs37vmeW9v68dTJy4eY9vdDO352z1tD1Xp9Pe?=
 =?us-ascii?Q?oQCMrOijrbij/NN/mCrgUb4RkcFYei6BjKOBYbZ5Ju9fUFaIu6wKHTwIUsUJ?=
 =?us-ascii?Q?dfJxjJJGIz7diHuWGc7jrH/3CZXWetwl82kxBDXDS0ykpTflRqZ/Xz4VRDBc?=
 =?us-ascii?Q?CKxoHzqnHYsOohXP+IM8B7ZobA9bVBYeMQZhJ1KUe9kAyk/Kmjh2CcQroUCE?=
 =?us-ascii?Q?oO7zfbHZvJIwV910WcFe4eZv8iE5q4XfgaQVdih0XnggaVoOUMliNtJg0Cya?=
 =?us-ascii?Q?1+S8J2XtNtIcapro523Cx5OqIpON1bvG88sDAtoUhLv0n/Cun5L+rO55Zue3?=
 =?us-ascii?Q?CM4ocp8Vs2VcSsGJZ9pYpEgJhofSD997U38kG6rDut4g/Vg1w8H7s8vVqxNl?=
 =?us-ascii?Q?Aqnhi1PYSKDmxBMgBGU10KVpv4LHqyfJTCd6jll+oHaTahiaQmQlJ6kZsFHu?=
 =?us-ascii?Q?jVZtk63zSHK0Vem+YDCmVZeVlDLRW8CzyBMB4H1+e4HT9muwhjC0JPon882q?=
 =?us-ascii?Q?HIr/Nwtj2Humnc582bjsWESJksi/mBKJ230nqKFPSDDmBkBmhKVpmFGfpq9v?=
 =?us-ascii?Q?M7WIyx2EgSKgE1S36a/wtlCzPRPR8umEMl4kiVd+Wbu5zo5rJKUCLw3h8azL?=
 =?us-ascii?Q?gJ8gHas4vkX8PyQo8OBP+xgOp2BswYh9Cd4U3i7LjUDmCoSmYkkRw3e8G3c/?=
 =?us-ascii?Q?quB7nNbq2RRJSr04BHXezQeGIXn6hG2skF3JS8j07ukMYhaLma9E0V2v17on?=
 =?us-ascii?Q?D+UuaxVSuYbIb+jAwHoWDEVpSUu0qB5ShM49MqhgrB9wPWb4F5yR4XBIdFHQ?=
 =?us-ascii?Q?p6JwKME5Kkg/i3evitHzoOOkthiF21+aksZgf/S4P9EVr15NtMAvj8fxQ4ca?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b22eff1-5dc1-4b20-3ea9-08dd8928b8a3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 03:23:34.8324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sVU+GcySmvcCUWn/gdm5mPIRkkjQGHE+ANghAWRtOlTn8ghkdmrAiqHBXEWcyt6jZphlvfJgYxhy2VdwxhBA6AbcuJVaB3Ofym3Jk4YCSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8524
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

Here are the drm-xe fixes for 6.15-rc5.

The commit touching drm/gpusvm was wrongly pushed to drm-xe rather than
drm-misc, but the fix is good and would otherwise be missed in drm-misc.
So I'm propagating it through our fixes branch.

drm-xe-fixes-2025-05-01:
Driver Changes:
- Eustall locking fix and disabling on VF
- Documentation fix kernel version supporting hwmon entries
- SVM fixes on error handling

thanks
Lucas De Marchi

The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add530e:

   Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-05-01

for you to fetch changes up to e8e3a804f3845a147fbdf73f910c12ddb3a2a86f:

   drm/gpusvm: set has_dma_mapping inside mapping loop (2025-05-01 21:45:31 -0500)

----------------------------------------------------------------
Driver Changes:
- Eustall locking fix and disabling on VF
- Documentation fix kernel version supporting hwmon entries
- SVM fixes on error handling

----------------------------------------------------------------
Dafna Hirschfeld (1):
       drm/gpusvm: set has_dma_mapping inside mapping loop

Harish Chegondi (2):
       drm/xe/eustall: Resolve a possible circular locking dependency
       drm/xe/eustall: Do not support EU stall on SRIOV VF

Harshit Mogalapalli (1):
       drm/xe/svm: fix dereferencing error pointer in drm_gpusvm_range_alloc()

John Harrison (1):
       drm/xe/guc: Fix capture of steering registers

Lucas De Marchi (1):
       drm/xe/hwmon: Fix kernel version documentation for temperature

  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon |  4 ++--
  drivers/gpu/drm/drm_gpusvm.c                          |  2 +-
  drivers/gpu/drm/xe/xe_eu_stall.c                      | 14 ++++++++++++--
  drivers/gpu/drm/xe/xe_eu_stall.h                      |  3 ++-
  drivers/gpu/drm/xe/xe_guc_capture.c                   |  2 +-
  drivers/gpu/drm/xe/xe_svm.c                           |  2 +-
  6 files changed, 19 insertions(+), 8 deletions(-)
