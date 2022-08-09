Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBD258D6F4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 11:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7786892C1B;
	Tue,  9 Aug 2022 09:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4429287F;
 Tue,  9 Aug 2022 09:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660039089; x=1691575089;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=duDb1F+W1FSZUSAPpuLz3bWd8m+wQZOq9/B4oqr/kB0=;
 b=iCCOYonjSw9/3MVoYJ3nVT3ZJSYMQTf8z7C+9/MhEyKK4lvMqbBMSN7g
 aSAfehCr+PQycrMxGqrfSbB2IxAaUicyuIoPHvFBYqcsv8Uv6ZUK4LEuA
 1tBMITEJE+n8T9TXXqzWbpA+GMEtNXnBjaCLhf/8+VwyD/ADkdWPDmLuf
 ZENdUutTS4unNl6jH1GQP9LdSUG9voj32zwpACmQ1mr8jt76VSyyPjeAN
 36lsebR2F7S0XO795INkwf+kFc0GAkeuEEDb6KuJsYEM0rB6c9zr/KKmi
 DsRwMw4QMJeDjJimwJpBLjmazaMWFvoXo4tgMxEv4kpggxfdZFELz7VH+ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="354799893"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="354799893"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 02:58:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="664373027"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 09 Aug 2022 02:58:07 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 02:58:06 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 02:58:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 02:58:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 02:57:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKn+NiVAx2F+qramWAnD2uZgi0PWcbSvbcIix/g3tgV5cq7roBcZS9J8pGCURUxMqV79XhDDiY+Nsl+kMxcmqL8QLmUzbRWy3Z8GIseNQWZ5tasNx1uzyOpEbd41+rMu43jqsQVJdy6svBQoaKfnhgjjqVodHSeDMWwCaiHfbQeEWi0UZrkciOzKobEDZIgiBEbMpPihp+zpGWxw5X+o7IfpKB7F6x0DszPy4xvmfojo9zGyFd63ghzU/DYOKKITbStJDFDpSoPVu/majsFqIDQHVIH2Vu30OH/rPR3Fxt5Ty2YQ76msCkhQZg/6vKH8hCsv/ygSmkp5csE5mwbBOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YN2948veH/K8kxDbmBcPsYzphCvpDDfRwks8Xf1tdg=;
 b=Wrxlfgba8hH1VZEo7w9K/IyNkwnGnlriNtzFcB8opJJSMPMLp4a341Q2QwfgHXM8z8lgVgqMPyJNmdr1Y5WkhB0AmMDOx/fxjeCC1cWt05RHBC/I/yXy4g6FMwsWSASFfZvA0/gRwgVxjE09ZBv9Ezv28hud7vHu6Se9BT0TterrIqbeC94psoLX8Pyy95lfhd2fzr+z8sxyFlB3nKapALyS5RUov3cyDaF9q/hAGDKeNd4xV0+vXcgsvg/eR87SaSX0+ZjWd4CqKczNlO7ZlFYRjXJeiwAuJVJYDY1D7VRImvivwovPJJrIYhnhFXGA2QdTGCyEGh0zxYgPnN41DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4958.namprd11.prod.outlook.com (2603:10b6:a03:2ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 09:57:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Tue, 9 Aug 2022
 09:57:50 +0000
Date: Tue, 9 Aug 2022 05:57:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 29/39] docs: gpu: i915.rst: display: add
 kernel-doc markups
Message-ID: <YvIvmY1FP0XAIyLw@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <f612d5d73c6972693a71140bb247e861a1670919.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f612d5d73c6972693a71140bb247e861a1670919.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0177.namprd03.prod.outlook.com
 (2603:10b6:a03:338::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93b50029-1b8a-406b-bd6f-08da79ed9ec3
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4958:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KnRpbnewuHD5HGG0TBdMQvPK49332R8VKwLogvzv/lmu/L2cMkSPjRFf8S0A5g/QYT6jetyv5NquTy8V0wo9zLo8aNdw5lXDLB3ezwub/S3gIR13oaSwVPp4hhoQtSKZrV7zzRy/yXwJK0EHDVe7xR6SgmqDGj3hBFH4+JFBOxDE/3LgU/snbd3Ljqws0SoEriYfhwyUJJIMVxPhpfTvfmnAc3M9nBrsEMpLXg/nItItnXC6KccBfDB1v6n9klPqFDhcERmJiwQDvdsFLJ+HcQLusE4ovHPmkQ5eP/Olt6YkLEdUfrOqgJLh0PUSJPWMq5QwZ89ikin3JxzLvhejQYmKyaP0N6YlWJZWOtU9OcYPAH3yjYLbBo2MAN+57yeenfSKfkYpzxk1tCgpnfg0XXAU8YUzlTqM9YxVjouhU17jguyn5qJGdnYvYkxK9rWBh2EDJoNMH7i6f3VVcAMhWKIISs9AwTLGA13WXpcZXS5w76na+eBiIDuCWFprJlS63fz/yQMNwOgQFGYByXM5pcslKcvxIRxb/QMprakCWDsvjyUT1nRlFOLMexw160MDE4gvsmoY09X+s3wXkuW7U0UjCqTMQe3Y6ElyF4TlS+1AzTeEQwLJRiqbS/zPrJOGuAQVSasKHe5kIDF3XeCRBpZErEYGYlCoQdN3z72rIRbQ7Wpkli5HkZuKkWqhxYfAo5Vttf29P4PhLNYSGxbTvX0uczDrIVEDUg9Gg+rAVlhz9JgRs2b9GKxtkMeqHlwV4v+RzcbfqOFtdGg1dOeC9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(136003)(376002)(366004)(346002)(36756003)(26005)(6512007)(6506007)(41300700001)(38100700002)(6666004)(966005)(6486002)(478600001)(86362001)(186003)(2616005)(82960400001)(8936002)(8676002)(2906002)(4326008)(66476007)(44832011)(66946007)(316002)(5660300002)(66556008)(54906003)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qd8dnPIMnLD5RTQf08VDMKbN1jTb8Rvi1iLlBSknvHUCYlRbGqzd0fA0+TmJ?=
 =?us-ascii?Q?YMq37AN4NF6TYvrp0SDlJlMkLUyw0YJVpYVaszrrCWym5SlLt+6N3WyNNbA/?=
 =?us-ascii?Q?59UVAs+mjT5MAC8d8HPGedg1JDIHnpWc/b2y4JgzUF3of2YKlNJo/3R9ZmfA?=
 =?us-ascii?Q?yN+Dsa1tvpazw2wpQe7/+OW/cIgrNbbr3We7rcwXwmVOMsZOaDjN6tBHrOeh?=
 =?us-ascii?Q?EeYB9RxJNZ6kNlkxeifOv1L5cJri1m/FBi1CPpQFpwsMrN/M3x8IAg4We36W?=
 =?us-ascii?Q?yT8KPfGlHc52yQEN8ybLKuT5/K5G8ZGQMxm8E6qgn6l3ANNDorH1cjHcuzmj?=
 =?us-ascii?Q?T4D5ih7jha9SFqLmMffzlQGgtS6bBPa0/jwInvQdP6+eahk/NU2V920VjeOZ?=
 =?us-ascii?Q?qZqoHXozhEl5iwnlKUnARRaAAOhyh5p9t5mDztokUeY0bCMA8nVIgNpqKfBF?=
 =?us-ascii?Q?31aVolgQTBZc1/zLocQIIenM1faFXlgZzecFPdejsUAWIzdsRKeDlMOam58s?=
 =?us-ascii?Q?3fUqUZHLru2wOizIXh7LA+1Z9/4EG50GjibvlYLjLl+x1d98cSqUplgqAWkh?=
 =?us-ascii?Q?ljzVzmnI/rGnuXvYFjLq2bWAFAu1paP6JqNOX58LfLpl6Ni5t9bzCcimXUzK?=
 =?us-ascii?Q?g5P77UMLlHR3b2ZjZZWXv5+jZq7K9oAEQwGiPNRFjMvlo2tjmi/7xW8dKZFH?=
 =?us-ascii?Q?iUuy4rc6ZysdsUEltRYr8ZWMuw2LSEbAisV+1Q/DTPjANVdoPWfPCRvuzDi0?=
 =?us-ascii?Q?rHzc+b+uszhD/9iyGQsyI12WKQ2qqRoav7jaRdy/nThE6HS9L4bHORvm34fA?=
 =?us-ascii?Q?aoDmcIhBKlcHhSKYgok+m1pDp4WcXTP7NuPJwwUSuom41SD9DekdyBJCc6Ti?=
 =?us-ascii?Q?ZoAGiuxW4iEEFp/Knjwe+Nmp0SWVfMisqcr7jCbvt37OLmYN0T5oMQb3IwmS?=
 =?us-ascii?Q?2WqrLAsI6OP6EdmP53xZmYeo4sKGVcj1R+Tz78nX7rrLjoHmYecejDrIRUH3?=
 =?us-ascii?Q?qmtD29H1hvZG3FomZMM/BUJfl8CYVRJ60V5NXynOZHYriWrBQBSfkeZG0JvJ?=
 =?us-ascii?Q?GVXYVmgpJiOJzKELVhWJgrzrQwv4pAmNkymQWchkYt3ARNoKSQTs8mTqLURX?=
 =?us-ascii?Q?OVJIb4zbPYA9UenWs8GuJVTKEWFTRreCVi6nAkCmyM20+wWZdJ8AqYKNV/BH?=
 =?us-ascii?Q?U/i0LSycl794vT0ugen5wrGMLf+oRnMUdCN84loiDDqVNGIKx3tOoeMrjanI?=
 =?us-ascii?Q?giDAK0EEqGsb9GEsGaJVl1v92duw/8mBAJWG7EqKky4CpioieId//rSaoc68?=
 =?us-ascii?Q?zh6xrCJBHa+2/fIM7GJNSbVRBxfEOlTEwnJoIG5OcUoIIct/wjlK0rsnxegq?=
 =?us-ascii?Q?dvqKbUcEqXji/uDIIWafA0vkC/cMJt69MeDY4Rmc2vU9riyc7Vt6n6PIv41l?=
 =?us-ascii?Q?xqF5h+oQYW61uYZtSjPBDPYINGixN+l1fuuk9nu4gXUUGM3GsjH/DMwqJj5o?=
 =?us-ascii?Q?6UZfVwgdxdsxQCNkyBEtCYiQ9kFtSDgTthcHV5pDKKFtg6UjqYGB1QLlFfIi?=
 =?us-ascii?Q?IKWUcl5B7eCk0MNAZfldDGsmDnOWZh4ytcnh5J3+pdOkDeibdFkI7tv/wgUh?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b50029-1b8a-406b-bd6f-08da79ed9ec3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 09:57:50.7465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LejeUc//GHxu7X+b6N/p46VugzEKB5l6xLQfqkBJoYIq8ErDp3iSWplcZOqMLxEUMuopBWnS+NLROwKA0/AABg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4958
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:17AM +0100, Mauro Carvalho Chehab wrote:
> There are several documented kAPI at the display side that
> aren't currently part of the docs. Add them, as this allows
> identifying issues with badly-formatted tags.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

same here, not checked if these would be all the files, but it is reasonable

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  Documentation/gpu/i915.rst | 50 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 4e59db1cfb00..2ad7941a79f2 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -100,6 +100,56 @@ Display FIFO Underrun Reporting
>  .. kernel-doc:: drivers/gpu/drm/i915/display/intel_fifo_underrun.c
>     :internal:
>  
> +Atomic Modeset Support
> +----------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_atomic.c
> +
> +Display Power Domain
> +--------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_display_power.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_display_power_map.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_display_power_well.c
> +
> +Misc display functions
> +----------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_backlight.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_crtc.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_connector.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_dp.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_dpll.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_dpt.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_fb.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_fb_pin.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_gmbus.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_lvds.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_opregion.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_snps_phy.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/intel_tc.c
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/display/skl_scaler.c
> +
> +
>  Plane Configuration
>  -------------------
>  
> -- 
> 2.36.1
> 
