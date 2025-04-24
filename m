Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09064A9B856
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 21:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E167E10E856;
	Thu, 24 Apr 2025 19:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IN+E+16y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554A310E856;
 Thu, 24 Apr 2025 19:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745523297; x=1777059297;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rojSADyUl0THEpzC4K3tOnUn0+eIZaKaEcTJtPtDpAo=;
 b=IN+E+16yRZf8HhZH+RvLIwqGdaJTELjLbvrW7LNMhRb3bRUy8zqdPB6h
 H3LXgwy7ctsB1WvezK5MeNCIlf5BBf3tPJvSqRED7ZCDpJfbvZJn0/V7J
 3RgoMiMzZAzVlNu8Yv2ZFpvOhTQE/zEeIzzzLd+BXDYLB0ZHp2LNxaQ6h
 170P6XbmJc0h8XgDmMJxNZH8KSjpkCOjca8rO6aeM+IBTd7v/mKbRNzn2
 8oAF+Ty7OZzRdNVABJu+noKHC3tLa6ID0tLKwqIBJY90avQ88S2fa6LII
 vojstQL8+DY1R8bnONvMSEi/UWaApCb9EGWddHiKzQntjsdPoPGoZjMxN A==;
X-CSE-ConnectionGUID: 759D2uqXRbqAg5Sb425s1w==
X-CSE-MsgGUID: JJPKrXdlQ8OlImkk3me3Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="69668339"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="69668339"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 12:34:57 -0700
X-CSE-ConnectionGUID: dLULjCfORVqOutoeVCvB+Q==
X-CSE-MsgGUID: OShajWQgRRWSYyQoJMsvfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="133236330"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 12:34:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 12:34:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 12:34:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 12:34:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6oj1o8yO9wrPrcb6bZhO000Otj84btrduUgniA5S4CXERS7ylJfc/bl3P4TXltJVlzSliPux0G3/ncQVm6BtbXtFlC4Hc1tew/F00YERIiMmeYESc4aEIY/4u9WKySpmQwP+wmlVuGK1yQsSZlZjQednwU7/eMtN1bc7wgtaEa/mMHaXZ+IcPgNnpx3wUULoz19sroS3X+lCAmq7FRLsfBC6S/B7wHShymO68fbWVJdfJcW/AcVUgCsyNnnWdYm2jB5elwul0iuIjN3YoWDcKTZ+ASV9KUWZFkBVenqCL4V4eJyOuaUfbyN7COOkNSXpZax5oMj1QvKtePRoBNrew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yi0shtoTLWF+nnHR/S29+o81bhzTml/Wk2fyhVAHxI=;
 b=iQCQvdTdJ3k1fYoP044E5a77iLk0wpkhY5x/GnBxZeKU5V4keIbom8VeAFoAzoRH7t3bBapgYdtk/tLXueAkn5heRoYL+YGTj/h4+JbFRxS6wS9Hq2dib0Ar1uK0AZnHsaacmiKQCP8IQXmgj/tsMWnEJuDgD7L8GBnVW/pFcAL0PJVhjz/p6DGVlu4wNc7Psyxf5VMV8KP9PtW3gmBbSmDRVlA56RsZg/pg8e6Esw/G9IZ9Jdb7ci4e7hh/GyUe1btoWPVOFmWoDCpPrNhFwTIkuDti19KDfBLkD3RXAD7qSUThCV1vSI5KG7ATqyQLF6K3dspzdLoS/gS4MtE2qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB6001.namprd11.prod.outlook.com (2603:10b6:208:385::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 24 Apr
 2025 19:34:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Thu, 24 Apr 2025
 19:34:38 +0000
Date: Thu, 24 Apr 2025 12:35:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>,
 <john.c.harrison@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH v22 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Message-ID: <aAqSn94hX71kF1zp@lstrano-desk.jf.intel.com>
References: <20250424143812.11210-1-jonathan.cavitt@intel.com>
 <20250424143812.11210-6-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250424143812.11210-6-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: d00fdfa6-baa8-4eb5-9020-08dd83670d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J6EzI0V1oYjhvKFu+bckmaTH/LdEPXhbkuPUOsxodslAdx2LtiV134sC3qJa?=
 =?us-ascii?Q?7JPt0U/AZduTedOVK+opuq6OR2eJzSwGZYMAGEmlrbTzRcqNXaVisqyOKvbF?=
 =?us-ascii?Q?9RN1XeOigNpsip225BsXk+3xHo2IIPjTODhkxmcwQKnULpoRfdLoMjebaR4z?=
 =?us-ascii?Q?gkQk0KcSqhs/Xr1bITwolPe82oAYn9DfCLqkFIL1caovm51TPEfHxF3EdXB7?=
 =?us-ascii?Q?+YV7ae96U8vAekzBdClh+u9M4hZGUZbzfEkdCsba3ikgsTCZfz3vkZbXvT9Q?=
 =?us-ascii?Q?gyge1Ddhb/SOrGCZaBBng7LgfaFyNQt24jaxA7mICne4KBJA6wbj2ukplbNM?=
 =?us-ascii?Q?12WpECo5zKIcsvCezKb6Ro8Vld5kp3FTUHW+rlrz9WHDQ2ddQwuiqfl/hTO2?=
 =?us-ascii?Q?4TvN1t40VKihjaZi17fD8xbw7kQKIwYl1XXe8HTNIb6srBDcqHXx9ApHW9UW?=
 =?us-ascii?Q?TF2/FM/25/Ow3h6malo0chMZnPLdvOPRG5mDHw+swD5ZFIKWD1cPFHGiGb3Z?=
 =?us-ascii?Q?If0aLHxf1nerIE7HGNWBnazmMf0E5eB7kAUPzNyvVIScnSkichka3+OKzLNG?=
 =?us-ascii?Q?ycITAdOmnY96lvjgXr4UZEbXGabIueu0k7fYL9uGQoXQhOjUDooPwPYmo6ZV?=
 =?us-ascii?Q?C3ZtgiySWNIyqVFQAZeigrDuiS0oBfZu72KUMyZC6bZyDqtRp/luUDEr1+//?=
 =?us-ascii?Q?jXKebSX4t220dFK0vZIiZiTPQQ8VoHrlvK8FAx8fiOYThvJ37E87GEA5eFQs?=
 =?us-ascii?Q?Qpxo7g5tjB7eRxfLlPdA6kdIJhGnTvYTTiTs+SY7Q6M62ktd6UImvuvRmVqy?=
 =?us-ascii?Q?VAkyoYSFQET1ZMp32z9tM/b4MT+TaBrTSFXYLzNFN0DEs7GUKPRM2adsj0Gi?=
 =?us-ascii?Q?dZYv9KAVPVn9zmpFZot4OpHx5ZbuARgSXU5Fp/O564WBoZTl6ARrui8TmIxD?=
 =?us-ascii?Q?9rjdouOnLQDqO4ByDsxo/MKxWJdNonE0W76Hcw4mOqq7mmmO6CQ1pYS+yJ+U?=
 =?us-ascii?Q?LoUCEmnrZn29IhdtcZEfi22ZCLQSEUkYXP6Jj0cHmuVec7rghPCw91YLBcgx?=
 =?us-ascii?Q?Y2fdtNrpXPIgztiPHSK7g4O8IkfXZjK4URE/PGJMAH8TqcboJSuTD0m5t5k0?=
 =?us-ascii?Q?AaHeJWzVynT9z2WpZjnBLenMG781a7Sdu7r3PwDR5YHoPkVzys7fvkh8RhYr?=
 =?us-ascii?Q?3HpHduV5b9noBjeZqEuZcaf4jLsImOL0CW84ZihixRv4okI926bX13knYTof?=
 =?us-ascii?Q?SUSDfdfqtTLhHMt8uHPmFEBFcBu74oZeuhjuwcE2UTbNDtEkovPZvnbYq30K?=
 =?us-ascii?Q?7mtP1s1nUVA1J5OdpwTsE8rpyEHUn/xArp9dC9sAtd7FTYzsPH63ePWFgKtA?=
 =?us-ascii?Q?a4JqTpyQMOVSHIe1N+4oRag/1wdOocj8PPnvDoG8HQnhJKWTXAONCPRyoWtG?=
 =?us-ascii?Q?LUUHQpPMNck=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T68KibCuEy2VIUlQyHQVuRuin8TheGchxvTzhBV9r0SgRCn28gMUMCFpRs5P?=
 =?us-ascii?Q?62Oj7tCjaS/dVjbO1nGDvCBTE3c7Sz7p51/pY4FxArGrInV1C0J6u3MkNBfT?=
 =?us-ascii?Q?crRYuieWiLkwbBYuUGg+kBkVbcKnqkrnr344yxXGTaZnNVWtHPDADbHgfNk9?=
 =?us-ascii?Q?3mgGPbAaKACy3XHKlvgxUi94WlTw/D2mwTbymwjQK72k0fH1ctQcXQTuzLfg?=
 =?us-ascii?Q?bnnB6Q5VOK4DDgZmOVCLOJLfr/YSHusZ3xtwiSmMAw1AYA9EEB1Iz4aKsBks?=
 =?us-ascii?Q?kiLjCMG01TY2Foc7OySDYCW4MQZbK5ZzOW8bHPmc0N59KqPoFGlYOBkZHnnV?=
 =?us-ascii?Q?YNmoTOxlhOb4MjXFmu188wFe404pR8vqZ2xxFXT4DIMvL22VZI0gGUZ21UjO?=
 =?us-ascii?Q?ymbUTCvjFqMznMfud0q/p8A/LQ7oRnzVrWSTtwJBuuOruomXokAzhSBulimP?=
 =?us-ascii?Q?xu/WncmI8LzCqn7gVMWeKdDO8690IRuwkg2FX/s1W2rMTjpJ3hD63U24sXXh?=
 =?us-ascii?Q?JQAcy578FN5QuxXBIjeHtMSrx9yI6oFQqf2c+t3qqsc7XXIF2LB5QTDT6cUp?=
 =?us-ascii?Q?dRx+mlNX5W5OWw+B/isq5Ds3jEnn+bSDNsEaipg2ca8L0R2ZtYB1Ed93b4Zy?=
 =?us-ascii?Q?oxFS0EIvNlTg1uCNsZ1/CzqcCyt7Ibtx06PcnHUAjyvYa4p3HuiF9brs7AVI?=
 =?us-ascii?Q?YM5NBrZOb2AdG+RButdC6/bkowfNbbnPhv22FXzhfUWXVnCFtbvxAdA3zvzu?=
 =?us-ascii?Q?FzUzqVZDLYSp15oN3c8IoEUqCzxcpexsXTKvV1bGYjIFAt+bpyw9b9A6AMlQ?=
 =?us-ascii?Q?fStmdWHwkJBgmd0wraQPHrmKILR/WkIJxVyOoe8wH/nFaulQhDSDrULRevXq?=
 =?us-ascii?Q?n3j1/ov4QjxXK3rGztMOZyHTERt11d3xYtvMBuE7V4GRsCqpELAfAS6DnZkm?=
 =?us-ascii?Q?/9nQFFQtu7V1s7bWESrtnUCrqw3gpCoF9zkEMuaZb8gwMwh43G1T8Cblc1SX?=
 =?us-ascii?Q?HAeyrdiVHaJYmb2PDsb9SinTGk+axg4LbMX0t6s2pwdh3MlE6wUQkbGBrmSb?=
 =?us-ascii?Q?+Nfd/c2xZBeWBtybnaXr4vvTQjG/+yMjqmPMsDXNEJ2r953pKS93E836EM8b?=
 =?us-ascii?Q?q7Pf1dlcfYmKxwritn4ym6BBeN9eR9oUdCXPS52Nt5ezNvShgJlV2t5pPqdy?=
 =?us-ascii?Q?dnAvb/9aAiH0i1P44X95P+KOQgAox4oz6s6gv819xMB/z3rDa3WkW3vjRqbi?=
 =?us-ascii?Q?g7e2Vh9byrVDBfc3AjukrGGrqRscbeqLK/vOhq2SQ2TTVnfYpN++8virHCZe?=
 =?us-ascii?Q?7v1xzFuytTbEkyPsQrv4qzFNeoyrf62ghDyq7dGs3HO5zygM7WEETVf53mRI?=
 =?us-ascii?Q?R/PE+di8IbjfghXuylH5E5sKgWF9VfW4PMzpTPBmPZ3JUrw68tVJ5tpkUF5L?=
 =?us-ascii?Q?R9VdPmJ+5Jj/MZdHepzhPwXDAnVtQ9OsoVNbOpi6CdDLN8Rkc0tpBUiEPt72?=
 =?us-ascii?Q?iu9fZp+W9NxetNWPj1u+IQyBpUW0AEXQeGDqNsFrrHN92N6AQQFXIKuMhGeU?=
 =?us-ascii?Q?2/KhmU2t6QL+TewOgAzTJAB/Kn4STTENG7DjBcQyUEJ7t+EzTk51ggw5QDnv?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d00fdfa6-baa8-4eb5-9020-08dd83670d5f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 19:34:38.7572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRtLqJQLgT1PhN3fMbw3INR9bqV4q31EA44xIR9/3L+SI4o259EmyuK20Y9nnUJVVmpRkpTUIi+tb+A6hA0pJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6001
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

On Thu, Apr 24, 2025 at 02:38:10PM +0000, Jonathan Cavitt wrote:
> Add support for userspace to request a list of observed faults
> from a specified VM.
> 
> v2:
> - Only allow querying of failed pagefaults (Matt Brost)
> 
> v3:
> - Remove unnecessary size parameter from helper function, as it
>   is a property of the arguments. (jcavitt)
> - Remove unnecessary copy_from_user (Jainxun)
> - Set address_precision to 1 (Jainxun)
> - Report max size instead of dynamic size for memory allocation
>   purposes.  Total memory usage is reported separately.
> 
> v4:
> - Return int from xe_vm_get_property_size (Shuicheng)
> - Fix memory leak (Shuicheng)
> - Remove unnecessary size variable (jcavitt)
> 
> v5:
> - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
> - Update fill_property_pfs to eliminate need for kzalloc (Jianxun)
> 
> v6:
> - Repair and move fill_faults break condition (Dan Carpenter)
> - Free vm after use (jcavitt)
> - Combine assertions (jcavitt)
> - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
> - Remove return mask from fill_faults, as return is already -EFAULT or 0
>   (jcavitt)
> 
> v7:
> - Revert back to using xe_vm_get_property_ioctl
> - Apply better copy_to_user logic (jcavitt)
> 
> v8:
> - Fix and clean up error value handling in ioctl (jcavitt)
> - Reapply return mask for fill_faults (jcavitt)
> 
> v9:
> - Future-proof size logic for zero-size properties (jcavitt)
> - Add access and fault types (Jianxun)
> - Remove address type (Jianxun)
> 
> v10:
> - Remove unnecessary switch case logic (Raag)
> - Compress size get, size validation, and property fill functions into a
>   single helper function (jcavitt)
> - Assert valid size (jcavitt)
> 
> v11:
> - Remove unnecessary else condition
> - Correct backwards helper function size logic (jcavitt)
> 
> v12:
> - Use size_t instead of int (Raag)
> 
> v13:
> - Remove engine class and instance (Ivan)
> 
> v14:
> - Map access type, fault type, and fault level to user macros (Matt
>   Brost, Ivan)
> 
> v15:
> - Remove unnecessary size assertion (jcavitt)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Jainxun Zhang <jianxun.zhang@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |   3 +
>  drivers/gpu/drm/xe/xe_vm.c     | 107 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h     |   2 +
>  3 files changed, 112 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 75e753e0a682..6816dc3a428c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -196,6 +196,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
> +			  DRM_RENDER_ALLOW),
> +

Extra newline.

>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 107e397b4987..c20ac51d8573 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3600,6 +3600,113 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	return err;
>  }
>  
> +/*
> + * Map access type, fault type, and fault level from current bspec
> + * specification to user spec abstraction.  The current mapping is
> + * 1-to-1, but if there is ever a hardware change, we will need
> + * this abstraction layer to maintain API stability through the
> + * hardware change.
> + */
> +static u8 xe_to_user_access_type(u8 access_type)
> +{
> +	return access_type;
> +}
> +
> +static u8 xe_to_user_fault_type(u8 fault_type)
> +{
> +	return fault_type;
> +}
> +
> +static u8 xe_to_user_fault_level(u8 fault_level)
> +{
> +	return fault_level;
> +}
> +
> +static int fill_faults(struct xe_vm *vm,
> +		       struct drm_xe_vm_get_property *args)
> +{
> +	struct xe_vm_fault __user *usr_ptr = u64_to_user_ptr(args->data);
> +	struct xe_vm_fault store = { 0 };
> +	struct xe_vm_fault_entry *entry;
> +	int ret = 0, i = 0, count, entry_size;
> +
> +	entry_size = sizeof(struct xe_vm_fault);
> +	count = args->size / entry_size;
> +
> +	spin_lock(&vm->faults.lock);
> +	list_for_each_entry(entry, &vm->faults.list, list) {
> +		if (i++ == count)
> +			break;
> +
> +		memset(&store, 0, entry_size);
> +
> +		store.address = entry->address;
> +		store.address_precision = entry->address_precision;
> +
> +		store.access_type = xe_to_user_access_type(entry->access_type);
> +		store.fault_type = xe_to_user_fault_type(entry->fault_type);
> +		store.fault_level = xe_to_user_fault_level(entry->fault_level);
> +
> +		ret = copy_to_user(usr_ptr, &store, entry_size);
> +		if (ret)
> +			break;
> +
> +		usr_ptr++;
> +	}
> +	spin_unlock(&vm->faults.lock);
> +
> +	return ret ? -EFAULT : 0;
> +}
> +
> +static int xe_vm_get_property_helper(struct xe_vm *vm,
> +				     struct drm_xe_vm_get_property *args)
> +{
> +	size_t size;
> +
> +	switch (args->property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		spin_lock(&vm->faults.lock);
> +		size = size_mul(sizeof(struct xe_vm_fault), vm->faults.len);
> +		spin_unlock(&vm->faults.lock);
> +
> +		if (args->size)
> +			/*
> +			 * Number of faults may increase between calls to
> +			 * xe_vm_get_property_ioctl, so just report the
> +			 * number of faults the user requests if it's less
> +			 * than or equal to the number of faults in the VM
> +			 * fault array.
> +			 */
> +			return args->size <= size ? fill_faults(vm, args) : -EINVAL;
> +
> +		args->size = size;
> +		return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
> +			     struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(drm);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vm_get_property *args = data;
> +	struct xe_vm *vm;
> +	int ret = 0;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))

|| reserved[2]

Or reduce the number of resereved qws to 2.

Otherwise LGTM.

Matt

> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -ENOENT;
> +
> +	ret = xe_vm_get_property_helper(vm, args);
> +
> +	xe_vm_put(vm);
> +	return ret;
> +}
> +
>  /**
>   * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
>   * @vm: VM to bind the BO to
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 9bd7e93824da..63ec22458e04 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -196,6 +196,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file);
> +int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file);
>  
>  void xe_vm_close_and_put(struct xe_vm *vm);
>  
> -- 
> 2.43.0
> 
