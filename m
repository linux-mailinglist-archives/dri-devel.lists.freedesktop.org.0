Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C90A8818D1
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 21:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631A510FB66;
	Wed, 20 Mar 2024 20:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jc+b1dnD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC86310FB30;
 Wed, 20 Mar 2024 20:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710968012; x=1742504012;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F0C9XO9R9f96wkALjJ1YSzAJpQ+tRvWhMuNFc3kKuOI=;
 b=Jc+b1dnDo/qk6pEJgWUmeNZN5qGCbZmb4bFR/EJLUp4aEwkxd2nNBYBB
 uzVKgmpTvKzaY5YZ+LzeD/7McoV7CdoKwqSk83Tw8gn7ZOspS3lNFPjyA
 Tp1hfgtKZ6R4GiiAKQeHAU/VwzkxVHF5rZ1L03VY0akEeIUb9dydPFGp1
 aEgVI6jw7N0CdDcbOjntQoz3tjn1OHTiZ0KyeHi6i2Tbg9vFdC1B6WJjC
 X/9XDVzX4YIQ7E4ZBO3VGDW5jEPlFCCXIZdFl2Giop6yvHNQkZAQveq9J
 9VR1D4PmL2PvoBitbGEcUPlb1jKV4yLU3OdP8kJ4BIiYmRhxqln0K0PwW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6041552"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="6041552"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="51725596"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 13:53:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 13:53:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 13:53:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 13:53:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+dlRFgNO3LUKIRk1U5CsT3WifrY0jF3Hhc8O4op5MbdEzfqEDbvBjYDyNX6ETZvnh59GeIYfuIvkyFlypqiau4IVHoDaJBchra8rA5QSz17RdFkPQPNKfMHwQtxTmYxxxWYiYm+rCB7F8Athh/kQLLWlCmdpQNG+9B4eCuVW6HZh6rQoV4ELvd/XwmaDkTMXnmY720dJ2Etd2CWqFAQI5p5bQAhPtDZ4aZ7rIunBLr2Yq4NAdenqCPPi33XVBBqRqi9WVR6VEhU1NqgVBiqOkVTuuTRoSxeVsQk6dgNY5TxnxFl4WyUdeo4kTN6H1hXGg0U8/5va+HP0QlRO255MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXn1bTk1cLY8wRVdP2Xp/3M6CwZDMOZu7QPEM6Gos8I=;
 b=Yxt60GNWCFIWmObAZC5asUEpUl9qY5ol2f7Dfu4N2ElzzFfLIw1MAF9x/GWUlGg0Il94lTgv6Wg/V5TxjGyU3avbQ0f9wgx9780iCUFoImvOiavUUzAeT8ZUPkk9vLj0cRSyWhv0tqPKt9pmBKDU2ZFx3ORUBK67XV1CeNPl7gEEMJIz2ZMsWFoCHuxwF7Z5sqPTw3agG0p+pXARBo6psIQu8HDyZ5a20n6pWZUVmaEJctFeIe1sT/x0Bnp6FM5fL0fXl+7i8eQXTGik8soswlqohrofCPVjk7oblh0oeO4NvN1huL0SfSdLNEtlNduyPOMt86ArSSImOlmRoUEBMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6860.namprd11.prod.outlook.com (2603:10b6:510:200::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Wed, 20 Mar
 2024 20:53:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 20:53:27 +0000
Date: Wed, 20 Mar 2024 16:53:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC 1/2] drm: add devm release action
Message-ID: <ZftMw_911HrrzJTj@intel.com>
References: <20240320104426.1592959-1-aravind.iddamsetty@linux.intel.com>
 <20240320104426.1592959-2-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240320104426.1592959-2-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: e874a7dd-9154-4545-4fd2-08dc491fca63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lRf1FFZ8+5FYPQGO5DJH+YCCHf7pfaoe9iSvzUJ6AVO5TCTeTmagfqpTyUMUf2lQVeWqELKs2BlPVk9o4uqqtn6EahH86ZJRWpkRjfbSpcdbH2KjnqduQE7ghK5kXc5VlTs974wu7Pt9sUv0bAFoLTM/XRL1fuB9zY/XjWxORLZxrcC+e32XSqBtQgsHVPyvmcFfGKeX9wnBe6JQ5Yx25FuEI2r7EYQ8cF488ku2+hzBb0GdYzHLXMCZRznoSCZMkNdSLO/QTSzoF+O0Rm/jbhdePyfXJLU02w+otiiiSiJrIrZ9sLKax6QLZKbUA+iA6v3pcI35A8FBeG2kdx66HnwSfrfD6it1KqtMixwvj2DzPV9L/gRp5H1xBiBP+tLH6mgNZc78t6Nzl2SJu/+j54OEGx4IA7ipBvuBuAGymNdScEDVGC6AcQ9PUEx8KkI8xDH6Wt+5cwHZirO0UmR0kLjDYlMRcktwZ61j1xyA8GVm4w2an96YYEEti0FwtFlK86fcJVQLzxXMv6Hy3NcMkeasiwbSjSYaqqIH0qEpmd7/d2p0zdSELKU4QZR4lYdd9UWgH3swsLSAc3ecNLBFtdZ5j5vzue03kRIG+7hA2j5cKOVVgCQLgZ7wsWMQP+fDh96OOpmY3UwgYFTsjA84tSNgt0hOdcQc7Qqsd4kF5Mc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ry+2YdnGoOVae1X2w2OZDyJ2IIVJXGqO4lCHTDKLC4A6oHu7ZVn1cW9KV4Jw?=
 =?us-ascii?Q?ZRnHzLkz+U4hiLkfk6CP+l+YaWF/exDj40dCpa9YjQuPVZyMtyDslKwnTxfU?=
 =?us-ascii?Q?s9c33Jrz+FhwUgDt1P/zfGSchaTOo0EYXHOnOwFK6gNO9iWMQKGYvrvv62kg?=
 =?us-ascii?Q?h4Sl5s4Fuysh0iowFUORDLVDYyHuISfghqBprABHMxN4HdjoQoHRiSqp7fQY?=
 =?us-ascii?Q?AtQOdioeMHVSgJAwJE5q3sKAGuS5JMFGQ+EqRhk+j85Ut1QuQiJtauezVfbH?=
 =?us-ascii?Q?0LpoXRXtkYAO4OeSR2Kp/hm7IJvT3Ju2dOMSWeK7/pUgjPdhjpyFZw6dpmFO?=
 =?us-ascii?Q?aBP/apzrCyqS71M1jaqvWb7DPvSclC1WpfK8ibWSTSiZjNJwwRJgV6lzHaQm?=
 =?us-ascii?Q?qOjLycx8mwty2JFAIn99h/wAWhFaeD//kCWnlOufwHQGVchK/5PUar0ZHnWU?=
 =?us-ascii?Q?9ethTyJy39TH61mFbo7J+57dBS4L2Ymn824aJbCh6a7QXFWnhS+hYx6YwHLR?=
 =?us-ascii?Q?S+NO1RjNRCnjLBAfKOuw98JfFab3rz+9lcPxoP9gEnpV33TaeePcyXRyZspn?=
 =?us-ascii?Q?6gziRmO84MpJV4FIb0I1FWKN++SSzqo5x8Sz+ZBybnRbtvpkQiz+CwJk2lJi?=
 =?us-ascii?Q?/lmH1bQ7yxzXbuOkUsibdpASbSgzjVlImmsljbm+WyyqgBPEzSB114f3p840?=
 =?us-ascii?Q?Nf1g2hDsmwzxb/YmuLGIFvNVmq6/CPqtu6R0MwDp77AyF3LZpnUgoMLN/DuH?=
 =?us-ascii?Q?Duky1ePR89Kw3qgG/JtY6MD4nsLH/ZOSHlosk15gpupMU4MuSAYMsnuTncof?=
 =?us-ascii?Q?sKH+jTRjHArpx7PGIbEV+R+JgRVcmeLCZA4TVFGskHx886fJYiHR6LjlgbrA?=
 =?us-ascii?Q?PWyj/oDBHpTIN9SvcqRYqGiWOxHYgauAjFkT/6SoUx5/etQgtU7495fD7rr+?=
 =?us-ascii?Q?oKcea1YsuWRqve4KhCsEFD1MWV0jbBpAt/nrpMNSIu7n19hckKAzDgYkbcwD?=
 =?us-ascii?Q?jhnFdgSaPteZj5vFO4NxTYWXTRsQHqC1JbkHbhqXI7KnSNzubnUlP1jN7BLN?=
 =?us-ascii?Q?cYGI1WmJ00oAgJEq3W1fEr8ilxO9mtXOvgqbvzKyrILnw3EorexZgE7bGS6F?=
 =?us-ascii?Q?Vr7RPm2GkcVXwQDb1avXbxiOnLfDyoXHQJfvPmb5pxfAru+9/QDS3C98PNCo?=
 =?us-ascii?Q?eZyPA3wl5L4/laRf5eduGdjynfZtsLKWiFKjnvlnTlnlG34NmIYqDW0jud6H?=
 =?us-ascii?Q?GMC5xBIqnX/1WDcSD8DGE772clEl8KLnwu0yoBPUZpfYy1OWvd7Ms2UyaeZ0?=
 =?us-ascii?Q?Uvay0vHQ6K0jvsu6fmEtgNlRVw5sPyQOK+TD0UIunWmPEXrsoDRHHYvo+5uU?=
 =?us-ascii?Q?S8uFPwv2NAXheHaDCeeUiD/X8k27wlKhMvYPJDV+BOqD/C9AelLqYScteq9C?=
 =?us-ascii?Q?3J/FckNdLw9pKFV0bKaRlMVe/60w+hesEFOq+J6MumQm/Ry8U4TKKMOlgVjO?=
 =?us-ascii?Q?be/AGa0cgxuRkWhWNq3AVXB4wtUMb0XP2olojTzHA7ojNdvWQwdbeQ3nCbps?=
 =?us-ascii?Q?2pZCRCEb0Y13/wyp6eeyCsqQUEBJMMM6duOyHQPn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e874a7dd-9154-4545-4fd2-08dc491fca63
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 20:53:27.1454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjeNfvkAYP0ko3astVVSQVuAJkALGCeDJByatXhFpn9IRA8Z313JUhu36zpNZhNFca+TejhjlgCml0juST12qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6860
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

On Wed, Mar 20, 2024 at 04:14:25PM +0530, Aravind Iddamsetty wrote:
> In scenarios where drm_dev_put is directly called by driver we want to
> release devm_drm_dev_init_release action associated with struct
> drm_device.
> 
> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
> 
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 6 ++++++
>  include/drm/drm_drv.h     | 4 ++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 243cacb3575c..b23c5081812b 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -714,6 +714,12 @@ static int devm_drm_dev_init(struct device *parent,
>  					devm_drm_dev_init_release, dev);
>  }
>  
> +void __devm_drm_dev_release_action(struct drm_device *dev)
> +{
> +	devm_release_action(dev->dev, devm_drm_dev_init_release, dev);
> +}
> +EXPORT_SYMBOL(__devm_drm_dev_release_action);
> +
>  void *__devm_drm_dev_alloc(struct device *parent,
>  			   const struct drm_driver *driver,
>  			   size_t size, size_t offset)
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 8878260d7529..a1d12cb72088 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -444,6 +444,8 @@ struct drm_driver {
>  	const struct file_operations *fops;
>  };
>  
> +void __devm_drm_dev_release_action(struct drm_device *dev);
> +
>  void *__devm_drm_dev_alloc(struct device *parent,
>  			   const struct drm_driver *driver,
>  			   size_t size, size_t offset);
> @@ -477,6 +479,8 @@ void *__devm_drm_dev_alloc(struct device *parent,
>  #define devm_drm_dev_alloc(parent, driver, type, member) \
>  	((type *) __devm_drm_dev_alloc(parent, driver, sizeof(type), \
>  				       offsetof(type, member)))
> +#define devm_drm_release_action(drm_dev) \
> +	__devm_drm_dev_release_action(drm_dev)

why not simply renaming the original function?

>  
>  struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
>  				 struct device *parent);
> -- 
> 2.25.1
> 
