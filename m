Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEB58A1CF7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 20:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FB610E820;
	Thu, 11 Apr 2024 18:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bq5wOXfy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E1310EDC8;
 Thu, 11 Apr 2024 18:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712858446; x=1744394446;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=D6bT3gfhouLmYBT6jnjL9Z9u9HanO4tUjiNMaAREzlw=;
 b=Bq5wOXfyzbif8dpCzNdfPlrxyHPaeVR58Foqi4wVouDuYlfkDQt1AMGD
 40JQ9Lr9iVA2fkePrcim2iXJvmqgkcOR0fkEkIAgE+UFaCL8EXcl4sCZE
 gMs5mJqmlqY2bQFaSnHgo1+aW42nlTXZ9L0w8iHomxuQWd2LMa5ENLVH+
 VEYSVNwXtIJchn56bkp13CU6xFnhDNSwhhJ92mfXfo8xBF+25i/C3FjoF
 zkT2M7r9/34DiLuGgOLeG22aUyiGib8gFGRFLvwzOeIbvNWqQ/HvuDx0Y
 0h2BpAqsuTplNANyZsOIxS15FJTTr6WlB92sQx9sNDJkRbS2OemQg92NK w==;
X-CSE-ConnectionGUID: nUp+inN0RISRZ3R4tbfiMA==
X-CSE-MsgGUID: WCl0z/REQNyfSuwt5Bb94Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18997548"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="18997548"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 11:00:41 -0700
X-CSE-ConnectionGUID: Cdq3vmaWSHOKiFYiONmF0Q==
X-CSE-MsgGUID: WuZZnfZhTDyLIk6lVWNNhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25775430"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 11:00:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 11:00:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 11:00:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 11:00:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVkEcBmOPIkxjea8RSgatLw8ChIrHEhEYEeZH/MLPZuFgISVPvGsuv2YMQgs1aBAmSj4mRkmFXDtfqMVD4c0ZqlKMItrknIhkLRm5CGywEBcwg1TsanKPhNvT99xGo78v5B55/HIMfoElOAFzpO5OVH+aiRx20V+8y5/koCj622tQu34/jER9qIKQ16IEhN1h5Hr84L1HMhnRUZrp8xCS/EH/86SI/SNYO2xc5lpfkN5x9FqrFKfcXcKGjAi2vWXd2fmwe+IGKDDvSWUhv43/LqHbJKWfzsTVR8ieokjJTGT+lP+/ASrrDLe5/CNaRWdubxyPOw6pwW6x0AiMXhWcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/QWsSYyPcDOUxtrlEPh3iyyxHG2rpLIo+QHzQpNkzY=;
 b=iEJd2CUgO2jLqH3A4fICZJcEC3P9j9zFk/BcDXC8bUCYskQ+XbPt71G8uC94BTLbl0paJu/DZrBJev1JMNbvk/qgqROPpx6A/+FPiyennmxEvWm8IUAPLmejgM5NbxrHVngtB2IaNKJZX+tJrIgYekzrAbNTV7FYTmuSKUoBATnaUxq8UIre2XOfzO214X/mVwRh0kDMsP1HYlQWDVeyxkSP0dTMKGiubbRFfWIWpqbC9N90EoFILLGuhLlNggPgayM7nyUNRDoYNNBzApWvHyRi0sle/56bQs0KFlaAnGK18rubNkNhOyye/qUYTF21Inl8l7dTvDejs3OTIB7ebg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB8041.namprd11.prod.outlook.com (2603:10b6:806:2ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Thu, 11 Apr
 2024 18:00:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 18:00:38 +0000
Date: Thu, 11 Apr 2024 14:00:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Tvrtko
 Ursulin" <tursulin@ursulin.net>
Subject: Re: [PATCH 11/10] MAINTAINERS: update i915 and xe entries for
 include/drm/intel
Message-ID: <ZhglOmNAcaiFB8ik@intel.com>
References: <cover.1712743191.git.jani.nikula@intel.com>
 <20240411154503.342217-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240411154503.342217-1-jani.nikula@intel.com>
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: 492dc904-4060-4790-e916-08dc5a514add
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u4N/a1SzSgxajkoZApk/0sLgq2dv6sHxuk4K46FcJhgC0ZNNwtYw08lP5WnepzXayWw7ui41xvrmEfcEzCatLlpnBbi9q4BbsFf3w3j7ZksIjJdwK2WrOkdzYkzVBZGKVsaF23K41SqEF8h/fu0HVKO4us1bEPSU1TjPkJCyBdebZ/JIkVqGC9LPenPA2Lk1vKSpPv5jj5OKwHLc36Feum8YqUwXs1YsB+WubtpNRxxuxTVHwTlU/JKueg9F/5XhQuyeWa+YoWgProikJ7FzJgLfCS1NX/Pm5fOle/EfofzXWVRA7DpNA9z/8MkOR0DuzmgSgDB81gC3vFzppz+fIxnGP5zHWoGb2DYZ1DjFZiLZPzx7ABz2NWMxgz+4v7soaLtCNCC0kKRj/Vsn8d3/25Nu2sIclUoCNyOJY62Tc/4q496fYMLOSQHK15IlPC3bOgERGjrpFGZt2pqdYOJ3xkoKZrzpo67V4g3iIHtbN6EaFoSxuxJkbGSyJ41CbbAp34SqaL1X3WmeRMBI3cE2ZH+p1hWqONW0uLrxMbkYIGtK8xcnfD9AT4CrHmXmxes6G714EJw5HWgV354YklLT4G6juM2XsOQ64wGJ4fHDq0M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gJXdVe5hNG3KP9omTdl+Kw5RBkW8tO519KrA/6l1GazXCxz5JfHKiF0GjK?=
 =?iso-8859-1?Q?Zv21T0vonW7Ro8puLmqh6n2dOUhxjrenIIWkovKmWeyaUTBEeaDPWomjbD?=
 =?iso-8859-1?Q?OwahCLWuP5ciTsrgFPWD3jMOpRqWe+ziPygxY5xvK+vXl5P7r54ht9HDs+?=
 =?iso-8859-1?Q?Zy2auR5OZBAZYdIBKOjTE2IuYBk+pPkJbbwA1PVwKAkakHmBlCGu8RLbPw?=
 =?iso-8859-1?Q?wA0hKyh3X/FqqsR5mZBVjHClau4D1vu3z5r4l3C7i/9iqm5shmp77dRSsZ?=
 =?iso-8859-1?Q?0N6VlvaTg2jDdLcTXUPb/lIa8oXMOVaxG1q1/bYxeBH8uVsEwSVw+BLiaC?=
 =?iso-8859-1?Q?6PCXcMD9jt12wrmN7cxCOKAP1Kdb5sHzRHkuxcsr/QGEurwRjH25ykSoz4?=
 =?iso-8859-1?Q?QD9u7BZDf9TUlOOLssEe/hawv95Kqv+dcXKJnLJwcANJ+959BHaNDwWU6P?=
 =?iso-8859-1?Q?BlH8BFF1P2JVeAB+QUxG/zGMBg91ynogHzwztfve7lFi6mVfIEa9VBMg2T?=
 =?iso-8859-1?Q?2x7W7ayJSVn1fScox/WScwIUey2yNYAnDBQk+x+PPqucpsFAvEIMrUKSuh?=
 =?iso-8859-1?Q?kpC0NJrwhK9pQOPYd6E1QrjaY7zKjvQCuQ1ny0bKGdzXFUyRzQnPNpfhHY?=
 =?iso-8859-1?Q?x1c600Dg9eD9sno6siOKsmowR4uBFpGzVUtk3wsWwjcs0pJ8R3eEAdOut/?=
 =?iso-8859-1?Q?t84MckYEilqXCt1ciGdlpVLTAmWc2gm9MlAkRbD0tyKmHVTm45d4uEf5WO?=
 =?iso-8859-1?Q?fD2g+LbQ/y4zZDme8evRNLpGmLHxTBc2yP9MZF7FWg9uUnEAPICBrhiBbd?=
 =?iso-8859-1?Q?u+jijoqdRnK5zINtjmt2D+3ykjyCDjb2TDapU0a+h87sAfBbYpONghwPsN?=
 =?iso-8859-1?Q?T+V22/cN+Ihinh/bv8c9Sxw9IxhzgEJQemjvW5VQtWdQB5bNsyTGAP3s1g?=
 =?iso-8859-1?Q?j4hxLkdjhAk1BsBIDFSYHsaUcsFNfkiovFrw8V3GI0Af2hcNvObkiVR6UT?=
 =?iso-8859-1?Q?1abWQwHtdmdbmTNW+vWcIgEpXCJ04L+WCOXIml/wqMFCb4DNoV5qjQd1/B?=
 =?iso-8859-1?Q?xfvUeTNf5pPoKsafXQDwiztdWJU6ZbOsx31DDXlHo9O88ls+N++/Jkm7ta?=
 =?iso-8859-1?Q?0dJrkK2ARTO42eEkkSLNn/B5+9DngbeJM+yDRIsvNZjaRkljrHJDh4K9Y2?=
 =?iso-8859-1?Q?2/DPjDr4B8PsC1bL9IoP4j3cOVyUeD28IUp6SaJJRiolP1yA/GRVjwyWzi?=
 =?iso-8859-1?Q?XZtkxbUkxGu9GsWactWCYd3mfKbhXgcHVarR4+sASJuizR+U1eJ1HgCAfn?=
 =?iso-8859-1?Q?r/YDaX5UizJOzGPpVv2xK1OkFEo6Ih92KZaDaB/u79YKJuhqj+rEMNkHWv?=
 =?iso-8859-1?Q?FTmS51XCRR6VcmY4jvWCBn7COAGx3gTppNw5XufNpylnidnEUUfC9jJywr?=
 =?iso-8859-1?Q?pASp9we2rTuxqK3oVjd2TqaXlTXMLy6giBZ4OnX9RiwuRdsJfPjP3C3qlV?=
 =?iso-8859-1?Q?IOA+hyJkX4Q+yrAGnWvJOH8IpWbgd6vh18MdmqdofTnKmlO76p9VAAWXUz?=
 =?iso-8859-1?Q?6JFEjMrQ+3ZL2f60Tj6os79dSCas29VQJH6fxrj+LJSQvJZhaeHwuBl96r?=
 =?iso-8859-1?Q?hEXPuyxuBfKbV7GDCUOjmW6rRKRoQ6hEBNc/M+5qGkOWQk98hYNEd7dQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 492dc904-4060-4790-e916-08dc5a514add
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 18:00:38.0215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QC2z5nBu3Ij2sMXIMRoGuhZ4JxBGXKoc0UtpgPil734xzBdP9YcytM849Wu+jIAdRjpFvLzopCiI3VlPBRvPRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8041
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

On Thu, Apr 11, 2024 at 06:45:03PM +0300, Jani Nikula wrote:
> With all the Intel specific drm files under include/drm/intel, update
> the i915, xe, and the shared display entries. Do not discriminate based
> on file name pattern, just add the entire directory for all three
> entries.
> 
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e7a511b443af..a71254fdbf4c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10841,6 +10841,7 @@ S:	Supported
>  F:	drivers/gpu/drm/i915/display/
>  F:	drivers/gpu/drm/xe/display/
>  F:	drivers/gpu/drm/xe/compat-i915-headers
> +F:	include/drm/intel/
>  
>  INTEL DRM I915 DRIVER (Meteor Lake, DG2 and older excluding Poulsbo, Moorestown and derivative)
>  M:	Jani Nikula <jani.nikula@linux.intel.com>
> @@ -10858,7 +10859,7 @@ F:	Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>  F:	Documentation/gpu/i915.rst
>  F:	drivers/gpu/drm/ci/xfails/i915*
>  F:	drivers/gpu/drm/i915/
> -F:	include/drm/i915*
> +F:	include/drm/intel/
>  F:	include/uapi/drm/i915_drm.h

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
on the whole series

>  
>  INTEL DRM XE DRIVER (Lunar Lake and newer)
> @@ -10875,7 +10876,7 @@ T:	git https://gitlab.freedesktop.org/drm/xe/kernel.git
>  F:	Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>  F:	Documentation/gpu/xe/
>  F:	drivers/gpu/drm/xe/
> -F:	include/drm/xe*
> +F:	include/drm/intel/
>  F:	include/uapi/drm/xe_drm.h
>  
>  INTEL ETHERNET DRIVERS
> -- 
> 2.39.2
> 
