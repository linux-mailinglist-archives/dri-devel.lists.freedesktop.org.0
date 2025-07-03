Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB28AF8429
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 01:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3E510E917;
	Thu,  3 Jul 2025 23:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yt6f2XFD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634E410E917;
 Thu,  3 Jul 2025 23:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751585105; x=1783121105;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=4v7TVLCL24DiRMnxWMpQbnVVVMGCLRMEm1unXJC44Yo=;
 b=Yt6f2XFD1oJf5bCr8rCfD90CwQY2AFc/c8FIxG7b39F698tcOZ5l4tYd
 WaV869LAPxSljyLTXoxJr0FGw+j1JreNxF3/NvA4DOH/DwQ0g9Emv3V7v
 wxTvpWc6kIda2s2XptNMnET+QRDoQw2IxISwiX6MqwRNYmcg5o2bF51PD
 qojtD4Mw4MMPPJnoGNRoZB0pfdm5/cs3rkstAK2VL0iCACMFjz7QzLQgd
 mtAPAYTw6uMqmqjBPSH5RU/09ifCPy1ejLUbsfgx/dRHairtAeaeSQ57Z
 9OZSPlSSBAw+9U8NRY9SM0b8rwas/LUXgT6GTzJ2jD2/orjRHMF3QApy8 A==;
X-CSE-ConnectionGUID: fSk2ChkoRlOjohU7dQv0cg==
X-CSE-MsgGUID: tdaYRhH+SMGp6GxI+DsuBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53894904"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="53894904"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 16:25:04 -0700
X-CSE-ConnectionGUID: DwY7mEm/Q/+t0mex2kDF0g==
X-CSE-MsgGUID: otmET7WhSvm6hZP/lpmvMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="155255301"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 16:25:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 16:25:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 16:25:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 16:25:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQCgf766lSMwpptUePJ/MazuYr713DA5+EjsDMMctonptCDUr1lxqwosoKnUH5doSe3/QsAv/Bck1P+G9z9mTguX+zp2sK9lzf4PkOMHbkNmXPqBlw+TIw+kVoKs01dYEswm+S5jDqBE0OFJvsjlAG/uIhdTZjjpZQhPil0alFJSptCbVp0eRKebDtNY+Y7nN2Ua+nfXKbFneFy1wmGTkqbgF8L1Hm7bTPv4LZ4SSWBICCcPM8tZjM2miWeZYoZgmRQjzRWevS9Ld9U/zmsg/q0wsy8SpxVmoBoZl0ErF+oAXsw9ppfpY2ejMANCOolTY9SM0YP/JLRCmMtv0sI1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojbMuClR4n3QC2po8cNKYu6sRIesgNx5Sb4LLLnmt0g=;
 b=L/25cQ/phdsufxMsE1AnC+V+FfROXCfTUjBelLTGpVKaem8Q7GEoqIXYmkEJccHAvTAnil+hSMMf++zADlCndQxVbecrkPmi7kjXOyF7Ygni6ndY5hPCx36hgOZmfPae4Q6QOYl77E9FjxatlaMtL4Hx9cW6ZA7cgCH8yvk7xm6s2W+p38BXqjyCl0xAr7PrQcHtPGsgWeK6cT+DZ8/ANBK9gM2yz5tnnzJmxssQG1AthuP61teES88ncVLBinvjR9WGhAkgNgu9L9w/GaQQzRmQt7tlLY27+x86JG39+ObBgc/eqBsNb1+UaophILZy8Z+LrEO/GgIn/QwtUBdU1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 3 Jul
 2025 23:24:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 3 Jul 2025
 23:24:55 +0000
Date: Thu, 3 Jul 2025 18:24:51 -0500
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
Message-ID: <o5662wz6nrlf6xt5sjgxq5oe6qoujefzywuwblm3m626hreifv@foqayqydd6ig>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:332::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 0efe2f01-ab05-442a-7422-08ddba88d16b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XyH8Ty+WdVPKa/HTFz/y8XPf3gczxICTcLV3KFA+c4IRsDygMbmOPnyUfXpW?=
 =?us-ascii?Q?U80d96rmsPLXzuZejSQVXaRa3SeAnwUlQkwOi1OshzPX7dC2iHTDjhW/QKhS?=
 =?us-ascii?Q?S1eOu3CMHnCfpNKBf1miPI6pFRlQOpgbf43v472KbkjS1u/gc2NedyY39b/2?=
 =?us-ascii?Q?xElLPubzPw6RQPqnk89LKQMy93rix6MtVR9Y2+OHkrYWLYZZHy/Q2B/Zn47p?=
 =?us-ascii?Q?ljpnfSS/H20DbLifqp14bzQw5RkeFiUinkS+QIc1s3l2HcDHApSr0UrOLP34?=
 =?us-ascii?Q?fZ3xDkL2KWIZSk0ZH2w0hjzAYfWVmdtIg0kvvftMYDNvkZkZY4C3QMZLDcsH?=
 =?us-ascii?Q?Cb3py/xgmZtlpwkZzLC2nxdjUVkAHFJQzdn8FVhrzWVaBHw4kmYBqyfw6399?=
 =?us-ascii?Q?jfDW2o0QudfWHaZOSy/jhw6h2yXckRuVHjSQJoUPOpevZi9cP0DHrCY+5BBy?=
 =?us-ascii?Q?wm2MlmSlsVvWWR7vOhlcvPk68aS2+osgbl1gc9IdKSCsAza6x3nT8dQX2zDK?=
 =?us-ascii?Q?8a845CN1NawY5ATq8qlXwKzU7RVAqs/rfb1lBjiDc1UOvVejzb562LNVX51j?=
 =?us-ascii?Q?MNU+IRsjYdz55uAqIn3TbutI0+Infen5YCocsAg6VpuAn0FcVnRWWUFjZI5R?=
 =?us-ascii?Q?ccVZFe2sWDvRNPyMQ0WOgJCw+tvlcy+q2Rn5LQN0rvgCLebAiJhhSkSuL6aq?=
 =?us-ascii?Q?uxt2i2vk0rQKUsmLm6JxqFp5P0uOa8P58Xro9oBY1NqNEuYP8cRe8575JJ5p?=
 =?us-ascii?Q?DBVPU+VNI+0TBoDsY5EMJaq5hRizrxjTrV6V72MiX40SE3FSGvC9blvAD5YK?=
 =?us-ascii?Q?owCU8x/AncSGo3HuR58HTzpMEOrtwnfuT/3UK5bvdJiB6b4aNZRHQyt+JfWS?=
 =?us-ascii?Q?pnM3tZDyy7QmeWI5lJMyeMR+6VZOSWSEz2cKcRVHnv8JEySkIoEa1exuH1T1?=
 =?us-ascii?Q?lrJIPZR/Ba9x7IcxIccby57kkaOLUlOTSrKokzZum+nKwahRRU5PGjWH+JwV?=
 =?us-ascii?Q?rmszdFliJQyUuPwe2NNtdJpXY8/DAvlOgtZQ4B7x/SJHcB2ECMz1QpdV/kk7?=
 =?us-ascii?Q?vSGHwilvSg3+FRrIgq+IYVisR3wTKCkwq3U53Ps6oGvhJN1Eg7A2tbYWTw7L?=
 =?us-ascii?Q?QV/N7gY31Cv/m7IbwS9aLofZY1US9PgLP5F+L++CN8EpB4zyUOhtAt1QBVWm?=
 =?us-ascii?Q?AWuz68kyd5FUvWShYnADoYNLX8abZD6pOOFpo41WoAEEjowgsQK3FrLwBFRZ?=
 =?us-ascii?Q?bUUOH36oHuJqRPYMxPFye7W9TWKWRIQVAviW0+UOEKDzlnw380QJHJqJt1jD?=
 =?us-ascii?Q?Zxdj9lATYRdN0jb7ahvDG8QZkuEc3D2BvsOVKHj6VoZqaUkrIOnPuRVwKK93?=
 =?us-ascii?Q?fQNoxkc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gzT77dRr0T34DvwhermsU2n3HU5k7SeZ6BrB8tq+EUQ0DIxqGANcEADNjd7A?=
 =?us-ascii?Q?i0rv39smd8w6KAwSSmHnTVeIdalNBGBeoIh+Thp/yi642FvQqsQ/OfXtB/q3?=
 =?us-ascii?Q?LKafumjExoAGA0jer922vbiPVuzhWeU5n5GaRkTi/CbIA2q7YrNeCHbecpIw?=
 =?us-ascii?Q?AI2FBBg8EebH5LLH57nwCPCoLAA1IFrFPKpl22sZK0m5RfSK0ogq7B1yZBRq?=
 =?us-ascii?Q?/JPlmYUEnUJ5zhLcQjRUUqkCWYdDcrSsUvSjO8Q0Y9vTiz/ge1lrNH4Pr4Fm?=
 =?us-ascii?Q?kTvs/Llgt4nOZnjrAKzcJDj72f5Wjg2PTxQqusJ/56clMDLz+vZsWFR0ZJah?=
 =?us-ascii?Q?RTCcDVnTfDMBKWV5j9k/7uMPaWCbdOpUleEFUVbPpoy+Qj1+xdvNXcELsO7w?=
 =?us-ascii?Q?TTDatYa7ao5c33WYFYMwggdmSONJGrpUlpGqUx/v2M89IyCFW7BksyotaiBR?=
 =?us-ascii?Q?KAiK128XV8RkrpswGd0ZlpK519T2rZcnKwWBkxusxaiNYy8iUCP50OU949Nr?=
 =?us-ascii?Q?+C4xUI/r7LlImaXrw7bXyqekYpsJmr39yaDHQlsD+9LjGLRsmzR1QzaAHHd4?=
 =?us-ascii?Q?RZUcCEOztLXU78JUJskoNnxXpGNBZ+E/7WtniMXddoQe8ZMJR3dB67ynluNO?=
 =?us-ascii?Q?8ZYi5/7YBXOhSGRzvP6n7BNnnBGSkzkzHF6mrcdmJtM+DwHv5r5QbhO5sQ3D?=
 =?us-ascii?Q?tHRmyWQPfRN+M/uhpeevnSYpFtEgWHzqOYUQ9QXg/oiIwGcqG7kG57bZAK1j?=
 =?us-ascii?Q?Be/9jIfTDQ/RSD9NMBfcRC1F4f/xAAMS8eg24ZuLFE9SL4WfIuPVkE/gPkFs?=
 =?us-ascii?Q?qaa3Ao58QYk7Lqzu/4Zt0wan9cPup6qydh2wPUlgyTq+fHGbgssbmV5OzJwv?=
 =?us-ascii?Q?hgbw6yyrl/E4/1WGF83KdD+bT7GYtWcXeTZorHpNF+XEopSfv8a+1jyjyvsn?=
 =?us-ascii?Q?XkgaaSrR4fqKp3yKIxH3GvChrO2jgNDF2g2w5W5vTNasFxteP5V8lKqoTnhW?=
 =?us-ascii?Q?aZeJVRJF0E5PmkbwIYgqFH3vYTbJUYPo/wHVDmPJ3/loNXGsO1Re+TGi0FAf?=
 =?us-ascii?Q?cvjyPGFrl1IQc9NBVUZHwzQozJR0pCIjRwuVrqR/fDUutdPJdmayDoxKO3AU?=
 =?us-ascii?Q?EJpz/smF+tT6OdV87jU8EqxT2VqiVI0voblBVeGjwBB7Z7cI8ivUXlBCho+p?=
 =?us-ascii?Q?IQcNCblniwIsVDn7bPFP7HQUgAahfqO5SxDEaX3MPU2YrgIEKm9lzf74pM5S?=
 =?us-ascii?Q?81vOEKCBQy0x5WiiYNiF+O4eoT5pnXPubZlH/eptiVX9ajl7Ai+3o2uKT8UB?=
 =?us-ascii?Q?RvtNf9m/+DXA5DNiNTL6F95/zPNftW0kpF/YMD1WU7C2sY15J68ImfarO8M9?=
 =?us-ascii?Q?ECEftFWIoEgCc9h3K7stjIqtHQhdwENCeNq0g8OnraR1r8ilsebHDW1t+PCJ?=
 =?us-ascii?Q?FpliYa2GYsZM6sHiEmkcmX16ZW+tjQMAm/ggegWsAGaNYqSxILb6YNGSq2S8?=
 =?us-ascii?Q?eQO3Axj3vnkhmugTGXwRjG9uAIlxB8NEECzGHaXwndMEhxA1DiK4u26eP0RJ?=
 =?us-ascii?Q?zZeEUKMjsEF2eepx3N2T0Rc3ni62rObOS/pH53AKuCeCYwjhB0YMYVmRnn8P?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0efe2f01-ab05-442a-7422-08ddba88d16b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 23:24:55.0324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AnlGGy5uhSkiYQM6QjmEiYMnbLvjtemoXWr+5Cp0C+X/b0URkBRFy+bqmIIR1Az2oXBWNdsJFq3yRT9diKX88MGs4rMed59eXxuUyHDLjsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
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

Here is drm-xe-fixes for rc5. A little on the big side, but number of
commits is more due to splitting the logical changes to fix some HW
workarounds.

drm-xe-fixes-2025-07-03:
Driver Changes:
- Fix chunking the PTE updates and overflowing the maximum number of
   dwords with with MI_STORE_DATA_IMM (Jia Yao)
- Move WA BB to the LRC BO to mitigate hangs on context switch (Matthew
   Brost)
- Fix frequency/flush WAs for BMG (Vinay / Lucas)
- Fix kconfig prompt title and description (Lucas)
- Do not require kunit (Harry Austen / Lucas)
- Extend 14018094691 WA to BMG (Daniele)
- Fix wedging the device on signal (Matthew Brost)

thanks,
Lucas De Marchi

The following changes since commit d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af:

   Linux 6.16-rc4 (2025-06-29 13:09:04 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-07-03

for you to fetch changes up to 5459e16b215c18529782e7746992653f00de0779:

   drm/xe: Do not wedge device on killed exec queues (2025-07-03 06:42:22 -0700)

----------------------------------------------------------------
Driver Changes:
- Fix chunking the PTE updates and overflowing the maximum number of
   dwords with with MI_STORE_DATA_IMM (Jia Yao)
- Move WA BB to the LRC BO to mitigate hangs on context switch (Matthew
   Brost)
- Fix frequency/flush WAs for BMG (Vinay / Lucas)
- Fix kconfig prompt title and description (Lucas)
- Do not require kunit (Harry Austen / Lucas)
- Extend 14018094691 WA to BMG (Daniele)
- Fix wedging the device on signal (Matthew Brost)

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
       drm/xe: Extend WA 14018094691 to BMG

Harry Austen (1):
       drm/xe: Allow dropping kunit dependency as built-in

Jia Yao (1):
       drm/xe: Fix out-of-bounds field write in MI_STORE_DATA_IMM

Lucas De Marchi (4):
       drm/xe/guc_pc: Add _locked variant for min/max freq
       drm/xe/xe_guc_pc: Lock once to update stashed frequencies
       drm/xe: Split xe_device_td_flush()
       drm/xe: Fix kconfig prompt

Matthew Brost (2):
       drm/xe: Make WA BB part of LRC BO
       drm/xe: Do not wedge device on killed exec queues

Vinay Belgaumkar (2):
       drm/xe/bmg: Update Wa_14022085890
       drm/xe/bmg: Update Wa_22019338487

  drivers/gpu/drm/xe/Kconfig           |   8 +-
  drivers/gpu/drm/xe/xe_device.c       |  72 +++++----
  drivers/gpu/drm/xe/xe_drv.h          |   2 +-
  drivers/gpu/drm/xe/xe_guc_pc.c       | 288 ++++++++++++++++++++++++++---------
  drivers/gpu/drm/xe/xe_guc_pc.h       |   2 +
  drivers/gpu/drm/xe/xe_guc_pc_types.h |   2 +
  drivers/gpu/drm/xe/xe_guc_submit.c   |  10 +-
  drivers/gpu/drm/xe/xe_lrc.c          |  37 ++---
  drivers/gpu/drm/xe/xe_lrc_types.h    |   3 -
  drivers/gpu/drm/xe/xe_migrate.c      |  18 ++-
  drivers/gpu/drm/xe/xe_wa_oob.rules   |   7 +-
  11 files changed, 312 insertions(+), 137 deletions(-)
