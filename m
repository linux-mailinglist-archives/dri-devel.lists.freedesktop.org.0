Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0012CAAEC60
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 21:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB0910E886;
	Wed,  7 May 2025 19:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BTC+bt6Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A84710E884;
 Wed,  7 May 2025 19:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746647045; x=1778183045;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YA9pKOdPSYEKrNtziSGYHii796s9kdt4E0Y2WdHPy04=;
 b=BTC+bt6ZruvTgojrQ05SULK6hUJscAPHa+O3LMyhPBVFDO0i3niVmHcR
 I7pN1V9Koq1/lF7FnLUsp/4FlpJpjMK7fUD2OarM9y0eM78FO+jUt3lCY
 aWu8yWvsRM9MIJURN9nRX11XqoZx9UDaiYIFa06ISESUM3Y7Hkx/Vnq4r
 W/wLhddAu3Z2OE1+6172KDJj9k5Ka5cbe9nRS2wezhxsoPdRbx03QBUDK
 dPfNBwI5Wcw+uIHc3ecMOyhuerFC2qmRVxXlUnC/IOdinsmIpEX2e26RY
 AeMupiodN1y1zoFr1xOb+AlpBVZXv1BKFr6ZDbYL5Fa2BPzKGTgHnRaN8 Q==;
X-CSE-ConnectionGUID: ET3saLbUQT+1/IFjTX1cyA==
X-CSE-MsgGUID: t8IfzZiGSwS8qF1rCqf+JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48559526"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="48559526"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:44:04 -0700
X-CSE-ConnectionGUID: hec5+jZJT+O3fADEc8FiVw==
X-CSE-MsgGUID: sWTCIXLqRy2S8hOQOug0dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="141258214"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:44:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 12:44:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 12:44:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 12:44:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ET9YoK0TkmCPyEE116ThWYK7TxFoFRrDBnMX07W0Gt2M7HpvdFaNiL5VV1R+ZhFmSF17ThkQhu7JOcLRkblgF8XCMTY3QkkKAYoXHTWmaeNot9mtLjsQaJzEdxYKdHtRm9i7PQ+tpIw3lFnkFBg9Yw0gM0wuvDrDkPTyq6eldBP/WQ13gTc57Hek8SPdeRmNLJnP8Ye/SWBGY4ubKPfFQ/MnFspms3p0alQy6xxCTOqcW2UMCnlCUrlTTV+7oDDh6+//52ZEEfc4wPrTzIxwVlTfXkMwyt45YWOrT32OVMjPfppMh5ILKVIrL/0mTyoWSuTk3gQDRQ8jn39wfC8ocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iv4s1mhkj8QZK13Yo2FNljciOmcA4OHm7Z6ZjRB6Mvc=;
 b=wk9ZCHVRfzv7XK+0t1HXQJa4GdvgFLZffAtBOguPLdl5GoG7fFHKTECaBFos5aMYlmKveTpCBwcgITeDHzbpNkYKmslT1OhFJLgBsQbP4ZoKuMSJ/3SN6IQRo2ruyyMZ8ELKemRPt5I1zB27bTeuXtruZBJjLWLtFLpykKAEK1TS49XX3VzqvGY83s1UiF2fn0EqIw+QWxsCUGpSaHE7hdQvWH75FYA6tfD0jlNZwmniHV/KYcE4HiWIVA5RuQbleND4s7KwjDb9Z+E5EtO+8o4TZTR8GfLOTqOKMgEkGyzVcOHDcD8X2yWN+AiXOQ9HK/tC3KoXQdHFy8tL986Oaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6865.namprd11.prod.outlook.com (2603:10b6:930:5f::15)
 by IA1PR11MB7918.namprd11.prod.outlook.com (2603:10b6:208:3ff::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Wed, 7 May
 2025 19:43:41 +0000
Received: from CY8PR11MB6865.namprd11.prod.outlook.com
 ([fe80::3918:9807:8667:3b73]) by CY8PR11MB6865.namprd11.prod.outlook.com
 ([fe80::3918:9807:8667:3b73%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 19:43:41 +0000
Date: Wed, 7 May 2025 12:43:39 -0700
From: <ivan.briano@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Gupta, saurabhg"
 <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Zhang, Jianxun"
 <jianxun.zhang@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "dafna.hirschfield@intel.com"
 <dafna.hirschfield@intel.com>
Subject: Re: [PATCH v24 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Message-ID: <wlxdywvybzrf35x6n7v6mz7fvdhqbkwqmljldz244bg6nc46ib@vr4zivarpz5j>
References: <20250507155727.130444-1-jonathan.cavitt@intel.com>
 <20250507155727.130444-4-jonathan.cavitt@intel.com>
 <aBuzU7zfg41-F_ya@intel.com>
 <CH0PR11MB54441C9BE476FAA329E98673E588A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54441C9BE476FAA329E98673E588A@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::16) To CY8PR11MB6865.namprd11.prod.outlook.com
 (2603:10b6:930:5f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6865:EE_|IA1PR11MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: 00704328-3e6a-450e-b8c3-08dd8d9f7827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vueWmde/CxQcyjDUl0OsOAGg4cCfIR3uy+QC3GUvGcRU4t8WFprVWYvlz3aD?=
 =?us-ascii?Q?vfnjlVz6Psqkba1P56Ul8gEijUPPB94A87xUyjksyCFzPiw8Lyx+t4Q3kTDh?=
 =?us-ascii?Q?M2dpi2mfhPoaYyBCbeGThbOuHgiIpHtUH0ZDcE/nUTJAVmrGR67U6VuN+XeR?=
 =?us-ascii?Q?aQTw+ahQuGhtpl1aaHMQHdhfkD+MpVVrQg3hDE0sp+dIW+60lzNrlAMQL1pS?=
 =?us-ascii?Q?zdM12cFmJA5enSTKylutRNolUxqrJXfGgfTGb2Zm74OQVFJqY+mq+muJATnK?=
 =?us-ascii?Q?tb9rtjyQIKIRg0AZVP7ZiNkU6DOB4uHmSsby7KFh2QYfmO/wj8IKq+MqU1jz?=
 =?us-ascii?Q?3oEaxI2Uvclvm1yp7fmdztnOlSNKJY9atXmVAGZ05kJSpUBCdzZbhk4+s/MA?=
 =?us-ascii?Q?XCwy3Fl3UTnKmeyy/9Tgsvn3rcxC0nIOpJc5BlHV4imgiopga7opA+uxnpnZ?=
 =?us-ascii?Q?CGFcliQgOX/2gsZa7hr59wNZj+HCdPbea5fQj/4IGCSBYMRVWEAVWFsY5W3X?=
 =?us-ascii?Q?fIlAbALVzdx0t6Sfi1GmX/oTOnjjbT/+Ic2g69t/yQJlNU1PMU1N8RulwVkO?=
 =?us-ascii?Q?Sl3NLN1YatQ+38rLqoNzLqc2Pl73GMz6xNQRI3zrJd+SnR3UwmNQTL/NOCLf?=
 =?us-ascii?Q?kl8mhvenp9a8kaXwz1GFiMaNjCffbxLw7kQ2kclTk6RN8xao3Y9sOzlyJ37I?=
 =?us-ascii?Q?xwRwq6gSPr1mpbnZ3lD8gM3q7Bw62JStpGIYORo+dsS5+hnE0BDD5d1m/dqV?=
 =?us-ascii?Q?UkhWtYMv+YnRrcvEMbQ60/YgwUzpY9JP4/VXgsEbxeQXfrn5ZOLLlGpjfP32?=
 =?us-ascii?Q?s8gNHgIkCFj+3oo87JU9BcWTEblmctQo0vtEwvOlv8XVMjgDdT4OF+ttIyKw?=
 =?us-ascii?Q?OzwL66LEMy8WnsrLJK0iDeRXHEuH7DvZugXsdV7+xy5Qj9qICkMl+7Y4rfeC?=
 =?us-ascii?Q?36pD2WE5iL9vgCKK2o1a4ti5fGUKcVPoffcNWFDgVUwn4ttsSCsGZTfZCe6c?=
 =?us-ascii?Q?9k/hUzYqBpEieU8qt9NSzOep8fjVL/b06IgFWBVlC+htXojn+rRI4w+CdFcm?=
 =?us-ascii?Q?KVs4gz27H3Qh9/Xshp/C/Qzt53XQWt3D/7kULRIB2V7PlfRZLz/xV7nZPmDo?=
 =?us-ascii?Q?3mzCpJn9/IlBB3FJ4swi17Jx3bVJm13Y89IY1rjGFdB9aF/N0wwHYuHq+QLy?=
 =?us-ascii?Q?CV7h4GQ3s49KFY3nexyWJK3k19+SZnU1HRhCVYcqoeQQqR2V1/iWEDVNfvTS?=
 =?us-ascii?Q?8VENj3PxDuKxNHE44Ehz7DcM81gGK3mjj+5KWHSjKf/kMMg7SbEgc30J8kJP?=
 =?us-ascii?Q?gL/+CGxB63w+BtOtOYccLOFEFHQz76HIrU6kIMVcV55GuahGuam66dND5D8o?=
 =?us-ascii?Q?XdemIrQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HxCqTudoh4sW7/CgBmhr9YPlEcr8hTCFkr55WS0tStFHMimMkVuZ3r5ZKf7r?=
 =?us-ascii?Q?1Q++G1gFAeP/Y1anvzwUHTKZ+lMqlTp81JpKwAMgOtpUMNbeCDVxLCnDswx5?=
 =?us-ascii?Q?grgY6nfmK01/+fIU9t8dCJi11EGSijUFJHV5oBEF5ldoCrDUqdcQ3r++IjtA?=
 =?us-ascii?Q?0AznOYUryLJ1gvS+zmYheb11xeKnFPJjOmTSbtPZC9aSrF0wDCZURUmDH17y?=
 =?us-ascii?Q?eU98eBbK2+sucMOcaY+3iIZB2lZJwQokeR/M9jAoNhyrI0rtJDbseVhHWkL0?=
 =?us-ascii?Q?ESljfPsDcBWeE5J3JAvzHwswJHx/agdW0dAoApVG7Jkq9cG+65k6YZPDnm4N?=
 =?us-ascii?Q?P8WhUSvFb0PLiuxJ08VNR+dAGRyl1ISi5J2Ya5+FsCtBJxeJcAvo/mYguARM?=
 =?us-ascii?Q?uTRTTjvRWHVypdtsfxccrPeoQd0u27dxWQsbIRJdek986g01Qqe09zRsTqd+?=
 =?us-ascii?Q?Xlerlsu2/QxUvC44fxMXsjiVHiSRMCou/FiozkLmZuWoKF67w9a+tCja5ZQq?=
 =?us-ascii?Q?iKPWz/hF/hgKxD3jQWPpM0FKb2az9RMERQAaj5SneAfWciLNCevhvu556nmE?=
 =?us-ascii?Q?EL3la7iF//nr04cfbCZpyx7SKhxl7TVBc+pwgMkmabYtrcls8tHgUW8VDfm/?=
 =?us-ascii?Q?qhfD4+EqaPxIlCxnp91Em3FvxHmH6Pz0Vp5a6K01CfWxY59M6dTUHlbLXK0l?=
 =?us-ascii?Q?bLOUemGAPso2pTPRqpdGTSrC0TR+QTi9ClIwHqFxDFzjJFoSX83nyTkazVaC?=
 =?us-ascii?Q?iAXjeozhiVFxjcuXCpUMyrz02tE71Xg21wpuWfzsKrD3k2ePlM+OQZhVEved?=
 =?us-ascii?Q?xQoAvVEFmPWpA+OTStM9V0gN1CrEOcoNMWFB9Pza6y27+IUcSrUX5rJb5Gdb?=
 =?us-ascii?Q?xzvzMwSBgTRDoqVbrFUkUy6wrpdKm8BBiI2iJarwHpr3IBKTvEyXs5NPX3qk?=
 =?us-ascii?Q?A70Y1vnSuXVVAl0L+PfM500TdzKBjAgGlH3wQcutLLAX0WqiKy04gQwBjnWj?=
 =?us-ascii?Q?aB8RFH96lpqPNoZoRvuCa4Z3Xgy6pcM6bd/tARpm0pJmQ5tQp0ZMm8VhB3W0?=
 =?us-ascii?Q?Q4fP5MdHI5Q2VApxo1bv0JyoYKYlDry+glltODpGyevsnHuJeoVcMfta7LTD?=
 =?us-ascii?Q?XPQvGB6VVFY9aaMoDNNS3qWJzDkVsNXzliX3sNRbS58RoZ3XmYz2NXSyCcRu?=
 =?us-ascii?Q?PNwvho3GExG7Pn3iwdB+atJBz32YhZ9H13ByYB2NgIZC5mUoQ5VuhYWa/djv?=
 =?us-ascii?Q?0myOL8sZhNCG8jfNZtxyil+7ORTvJ3sv28CaW6hOzIs0J+8KDYY6B7zpYhu4?=
 =?us-ascii?Q?gTUUtxBhnQTWq7RPpJK083UE0Afy63JVpLkXPlX95ETfPcZGZbrNFdfWywtw?=
 =?us-ascii?Q?DKQdt4P6tSa6mgyXY7SuTQBjZk/iQx1YSTMB0rKF5Q0yb1a0CsJ+OZzX5LZH?=
 =?us-ascii?Q?Y+/M4NdrMHOK7NvDFaZ+6D2ukEkv6Qvy9X0Tn+B+O/+Kacq3wddKFADhR5tj?=
 =?us-ascii?Q?l0aYMTVaIN3lMiAOslGnmPjGa2aaAPU228iG5gb1AzRq5N2MtJ+Npg67aWXm?=
 =?us-ascii?Q?bG5LrRGCJ04CQdy3KqHkEgAMRo7g1c8i2qf8DAKW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00704328-3e6a-450e-b8c3-08dd8d9f7827
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 19:43:41.3680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UAhpz3BxhJs0ZJMDDA3xZg6Rc2rs0p17MjJouTN7VkFYs8f9lwGQGYwh+CIuZ2zsrr+m4h8h1WhbAp5MAN/nuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7918
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

On Wed, May 07, 2025 at 12:32:49PM -0700, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com> 
> Sent: Wednesday, May 7, 2025 12:24 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.org; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <michal.mrozek@intel.com>; Jadav, Raag <raag.jadav@intel.com>; Harrison, John C <john.c.harrison@intel.com>; Briano, Ivan <ivan.briano@intel.com>; Auld, Matthew <matthew.auld@intel.com>; dafna.hirschfield@intel.com
> Subject: Re: [PATCH v24 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
> > 
> > On Wed, May 07, 2025 at 03:57:24PM +0000, Jonathan Cavitt wrote:
> > > Add initial declarations for the drm_xe_vm_get_property ioctl.
> > > 
> > > v2:
> > > - Expand kernel docs for drm_xe_vm_get_property (Jianxun)
> > > 
> > > v3:
> > > - Remove address type external definitions (Jianxun)
> > > - Add fault type to xe_drm_fault struct (Jianxun)
> > > 
> > > v4:
> > > - Remove engine class and instance (Ivan)
> > > 
> > > v5:
> > > - Add declares for fault type, access type, and fault level (Matt Brost,
> > >   Ivan)
> > > 
> > > v6:
> > > - Fix inconsistent use of whitespace in defines
> > > 
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > Acked-by: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Zhang Jianxun <jianxun.zhang@intel.com>
> > > Cc: Ivan Briano <ivan.briano@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > 
> > We are already in the v25 of this series and we still don't have the userspace
> > PR/MR to reference here and no ack from the user space?
> 
> The userspace PR/MR is in the cover letter:
> """
> uAPI: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32987
> """
> 
> > 
> > Sometimes faster series iterations are counterintuitively slowing things down.
> 
> Who should I be messaging to get userspace acks from?
> -Jonathan Cavitt
> 

Acked-by: Ivan Briano <ivan.briano@intel.com>

Do note that the MR you point at was closed for reasons, though we can
certainly just reopen it and update it to the UAPI changes since then.
But the actual work to get rid of the scratch page that is a
pre-requisite to enable this extension is not done yet and will still
take a bit. We do need the page fault reports for it though.
