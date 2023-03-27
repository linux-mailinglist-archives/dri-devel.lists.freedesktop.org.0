Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC066CAB5A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 19:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC46C10E67E;
	Mon, 27 Mar 2023 17:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BD810E3D1;
 Mon, 27 Mar 2023 17:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679936594; x=1711472594;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Btopf8wUrz5OPQYVLIyGIy0UJ4IHlE9PFaH8H4xpVBM=;
 b=kQ8YgCVqTt5fF8qYuLO0GNqjBbCdUOU2T7wafz+miqH1mKb8k1n9E5qa
 OM+OycnYAILAToknVtygbXIdFDPNBf8PSKWQqKBCccL/lsTLL4T+cnh8G
 AHCl5S89rGCstGHxUS+qrVhqZqQgZnD33jo7q/OMXBQT4eo9qxlTp+LFS
 WyTTbjIhRG+bqkBeNzsy7yQzAdVy4Q1BAspeZArF7b1UyG+zC/xdbj3RQ
 vCIoItrPQeMX0ZMnWpLDZbhqccaz4G2WKos4vd+OEdfQmucPED8EJ3kHS
 U2VCGhyrM9tgLTfKqvLf1srJKQ/8jV/Zp+KcdaIfYQwh4CYVqIFjUH6eB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="402932145"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="402932145"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 10:03:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="748072169"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="748072169"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 27 Mar 2023 10:02:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 10:02:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 10:02:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Mar 2023 10:02:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 27 Mar 2023 10:02:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TE9DsQHldc1lCqeLqyxtAxeQ1dg0i4/SiTPe5wQ/NN0HauldKfNPasTylw5L2ZSKpIi54eJXM31mB+vbZoZLHpBUyMFsjwtPD8OgE+bW7poXFbc4rpF8RXtvgmST010tiT+mgpUqZ8tRthQ9yPNhzvZQD6ZDqxBQQDKX+dSRN+dCjnG0XyJVBQ9hxQS0OH/IpPRxqFktJgcdMtKTKiFK4x6Z7RXN15V/qaVEBhfhxai36pfbRcd6HAkbjW79M6IXQTVPgky7M89NU1h0W+HDE9TLCnO7Ov4TovaPOlP3WVH/NpLuEfkFYpu/BHWMDXyAN3OOwvQbm05V5dMtNjDfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+9VDWr2pVJ48r5zUyJfEC9f5vRwYIIinFNc2pCi5Ik=;
 b=PG39ToDZGDual6sK4euaH1SdvyAAOoZDNoGYFjpXUEEH/Fpd27CitIzj9ruoR7QJ+To8bGbmxKA4nGzX31rZJKHOTpKzH08fm7qRz8pJEHhi9TbqV6Uugmvardxkuv/rAWi9a12snaoNEou7v6i8D33D+wGUYFbeQAgj2a3tsyj+JnThHmzvpPPA/jAztjN5P+yI5gfJMb3AGTQnCJPQDUWwgio1S5FcEDjBt815Q6LyJET68juaBjUugW8YSt6JBIfFI8HhHpHpevdLgtLpl2gSJC96Vk4xyKUqJlIGADrcujnvo07fmWS8Zy7mbJ8+AtIK7JMx8VcD0Ys9KlYqTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB7373.namprd11.prod.outlook.com (2603:10b6:8:103::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.30; Mon, 27 Mar 2023 17:02:41 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6178.038; Mon, 27 Mar 2023
 17:02:41 +0000
Date: Mon, 27 Mar 2023 10:02:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Fix platform order
Message-ID: <20230327170238.GJ4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230324051754.1346390-1-lucas.demarchi@intel.com>
 <20230324051754.1346390-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230324051754.1346390-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0186.namprd05.prod.outlook.com
 (2603:10b6:a03:330::11) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: ed4ae178-dfec-420e-e32a-08db2ee5138c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: buBRlk79f8mZJafYqfNNBx9z0Af4iWciZ8UCmpijQITPm59mP3JHfNjbLQ9roiY/bQIQi6HGKx8kZqDYrcfOjf39fMp0K/BHvN+aQLCDEKl8809+q230hx0oNkN2e6y9Vk68MuWjzGm5S6tIrdDHh18pd8AFkp+3NTsKcApOwcpvDrt3/iLIVVuCfyAPC3O4Dt9IEGcNODljLDf9DNyjZ0hVHgkYRWPZ/VIo8rwQHbMfqpUwkDUZrfzKZLitnqTPPCZfD/gG7lFkm59LqM2YRawejc86QA10gsWGCisiEO+EYFk9PyHrxjCz5pK2Q5WtezK8B0zVbHG5oM/Sl2O3YPXQ6hpJIVooRudYMoldzI/NDOcjH7ysWm/dBqj+OgSoQz+WfwAIRwVXZuYSBO/z21oPJtp0W85VCBbxaJWIfvTQlXHaIPi0BmbKXW+YaJslLu5xVR2xkKt13xSIblgMTEqLIxV8oLDsFqS+xxVGS/dHjxWdJ6JhjcHJdckAy64kYiBoXSOd/YBoPfNFVizuoRSj8XE9ZUjKu0fWe3nRxvCKXbTq6XT00nqs1KoO+mJS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199021)(26005)(6506007)(6512007)(41300700001)(1076003)(186003)(6666004)(6486002)(83380400001)(478600001)(54906003)(6636002)(316002)(4326008)(38100700002)(2906002)(66476007)(66556008)(66946007)(8676002)(33656002)(82960400001)(86362001)(5660300002)(8936002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SYbJHydFVFlTWHaq6WH44mIqWcmxu1ixI6d6dEoUqKB+avRS36Zf4MlznxBf?=
 =?us-ascii?Q?bdJn38Yp3tVbTspxgeVqHj1wN4bjFhpPkS39LMWOv5NT/8c8Axi48PTKiNQL?=
 =?us-ascii?Q?+C/mT3DAgQZ/duZPXFzvalGjgSvehVpucALTf/QgRBzWW06jswdwXdwf7k6i?=
 =?us-ascii?Q?dr+iAKybD2QaBsdhyZ5U2T+6o0jyny2BJsT1qUNPOr6F0lfikyxS+gwc/NUD?=
 =?us-ascii?Q?FvQEPDwOPgSRQkZaIgqx8At3yw1OJDBp8yybPyKEEk0AE6DWraNCj2cM/d6s?=
 =?us-ascii?Q?b3gdacQNheSSLG0Loctb22zpbGkb1AReA7iqdIOOHArkXuFqeesRfSGSoNHk?=
 =?us-ascii?Q?JAeEc1Chw11e+zkzIm1SbDDPLi4B0rfy8lNLTwXNsrOYRPkFnPsLcGE9rSP/?=
 =?us-ascii?Q?njpuw5lM1aM3aWOO0SajEqNsrB3XOgN2HshMaqrzFky1SJ5I1ttatgIS984q?=
 =?us-ascii?Q?06uRXkPVjOyt2WIb0HzaL6vzazA1fXFwVzSAM60QSkToSV3cqNwvn//5CuPo?=
 =?us-ascii?Q?wN+0k6zu/+Pfknl6eSVVzlsxstR2ebf7IgS+zXBnchCuYf7Ruyx8klLQIRiD?=
 =?us-ascii?Q?hVfOoEScFRPlVf2hRaLHe5gXr9EygG/6U9couTON7m7HA/NyCG0qj6A1/kbF?=
 =?us-ascii?Q?PtqySxp2ncM025GT08ohEVtenbxgWOEL17Ek7ZKnK8aW0i9fldgyQM8JKI9e?=
 =?us-ascii?Q?+wOFsh6rs9N7GRyGtmuVByaudazSh4b8mXoBJH3a3ZYouipNjkXLn1PTR+eX?=
 =?us-ascii?Q?niNPVjSjhMp64HOELnaNjaJq1rVyBj+4psd+tVknKasRxskwgUOD12o3AzMa?=
 =?us-ascii?Q?HltsEvtxzPjP5EQ0ZMHn8NMbR0Znw9pOXV57V0lf1OsMti9feSLCgyR4rKQc?=
 =?us-ascii?Q?PZozvx8U/fIh9U0w6thNT1CEEfkg2QVYWCEFfgAFJ1s1f/dB0L5EmT8Q5B8I?=
 =?us-ascii?Q?8A59PGkVK//Fy5Z0wHEuisPSfYYj5A1UDDKOf2+Lz82tveLwkqD4YtMQIY+j?=
 =?us-ascii?Q?DsrfGm4x/iuUza5LsYsVg0KBFNfnfKQQTj7/flF+Vl6dQHd070KDig/JZng4?=
 =?us-ascii?Q?JXhhwDTzcMu7ABG6SGjtzhaEsUnonYq5Xrem9PrYi6WyktAWWQcpUIWzTUfY?=
 =?us-ascii?Q?8QzHMQRzenHzBtxQ4y2KdnLFKjxMXeYgzb4uNhFGOffHDa+/pS4WlAO+lZmD?=
 =?us-ascii?Q?gsinn4bV9lJUL+ixRudvwZjCZtCt1mWY2Ketp8wnrqqrVxxRTLS+hCQjaFGW?=
 =?us-ascii?Q?sYpq1FS/Biw0hG84V+QfZ01xD2rE7U0Ah6dMEAlhl8SEpldQK2EnmFCUY0HO?=
 =?us-ascii?Q?cPK6eT5mYNZ4Bii7vYdaoYEcIGOYAk8p8yr8lrbZ7fo9S5TF1RnoIZ52sraQ?=
 =?us-ascii?Q?ZS/L31SP/CP7ayueKK12p70CpvWxlb/igxVYjxfrhB51GJlyzTVSIVHEOw59?=
 =?us-ascii?Q?LTscBUXfoI+vEquwaaOuAtpj4JFgizn/2KLToO32iWUzQydIqbQUhnwUE4w7?=
 =?us-ascii?Q?jBddyo3EnVvZoJf7vYXXNwbgKkcj1e8E15+E1ySkg+7FIBkGefpBzabfqBas?=
 =?us-ascii?Q?o+c2ZjYQR8c3wSkzPc5gP7htRcJYK0/gU8DCS/V3PffG3tsLhCBrFFOWDfcf?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4ae178-dfec-420e-e32a-08db2ee5138c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 17:02:41.5489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfCsCFvyzLTI9LXnM8tA2PQGwx2Q/QTruPHVY1oQSls1TeJdYIFsrLHUQZFbG4uXzSkowFjSA4SWm+y1KWXv96WANneFaPXwqOIydeK+EL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7373
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 10:17:53PM -0700, Lucas De Marchi wrote:
> Platform order is important when looping through the list of guc
> firmware blobs since we use it to prevent loading a blob for a newer
> platform onto an older one. Move PVC after ADL.

Shouldn't we be moving the ADL platforms (graphics versions 12.0) higher
than DG1 (12.10) and DG2 (12.50) too?


Matt

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_platform_types.h | 3 +--
>  drivers/gpu/drm/xe/xe_uc_fw.c          | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
> index 72612c832e88..10367f6cc75a 100644
> --- a/drivers/gpu/drm/xe/xe_platform_types.h
> +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> @@ -9,14 +9,13 @@
>  /* Keep in gen based order, and chronological order within a gen */
>  enum xe_platform {
>  	XE_PLATFORM_UNINITIALIZED = 0,
> -	/* gen12 */
>  	XE_TIGERLAKE,
>  	XE_ROCKETLAKE,
>  	XE_DG1,
>  	XE_DG2,
> -	XE_PVC,
>  	XE_ALDERLAKE_S,
>  	XE_ALDERLAKE_P,
> +	XE_PVC,
>  	XE_METEORLAKE,
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index e2c982b37e87..174c42873ebb 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -43,9 +43,9 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
>   */
>  #define XE_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
>  	fw_def(METEORLAKE,   guc_def(mtl,  70, 5, 2)) \
> +	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
>  	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
>  	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
> -	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
>  	fw_def(DG2,          guc_def(dg2,  70, 5, 2)) \
>  	fw_def(DG1,          guc_def(dg1,  70, 5, 2)) \
>  	fw_def(TIGERLAKE,    guc_def(tgl,  70, 5, 2))
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
