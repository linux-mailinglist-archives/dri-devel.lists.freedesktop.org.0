Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976B48C4467
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 17:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F19B10E2EB;
	Mon, 13 May 2024 15:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFMJU7Ep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111AB10E24C;
 Mon, 13 May 2024 15:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715614708; x=1747150708;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QJN/e916mE5XXRcujzr347WV91aNa+10sYl8n2XAURA=;
 b=oFMJU7Eptaq3d2p8tBHhA8z5XCqKr6zyi7GaBmTwSSQtDm2ud6vAuvju
 /IDMp4k6WaZnTa0ihLQxAcousQdXFuzY0E4KamVpHfAO423VNXPakePR+
 2aPxe2Sq6C7bia99SR/59miULnn63D3qPxB7TCQzU4aCQ1rmeG7T7McMz
 XyKFoqcOPARGCT7ZrS+OHvEkkcPh4hnoN13/D/3ZoLXejPmNdEqanfzWS
 Ccuxb+A6SbvRgU/Vb3sdSGyFpAO2ZOf+m5MtqSfopute8bx1ZFFPIMZV+
 qMwgSeDHiChzTQU3rIyxYFR3oCrPoMVPprWmrbIgw/+5SOwXHBb6feKPQ g==;
X-CSE-ConnectionGUID: LuzXEFMuQbmNHUXwKK3b0g==
X-CSE-MsgGUID: Efe6Ks0ARfmoUQ0xZqg91g==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22131818"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22131818"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 08:38:27 -0700
X-CSE-ConnectionGUID: dWszlMsGREyy670bxaXy+Q==
X-CSE-MsgGUID: yCdE2b3ZTJygtJRnV6Ex5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="35127877"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 08:38:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 08:38:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 08:38:25 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 08:38:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVJ0GurxpEAwr8ihU1zV5lRpMD6ZGAeF7HhO9wGEuCZqP+8oFX0eQDpUD12w4rKs0bwMYxKVt+Rh24/jw+puaBxthGUGVsZ4Ok3I3F2DdcJDOe/iQy6Xn9b15PtFZyrdXULEMwg/U2T4vgJbOvKC7ho3903oTKUDoTnlugF/XpbNIYG499pEWkwk075x4TKnTw0LycFyuw6bZ53dE9GdluAGRpbGOqXprLUbzxOWvil4vvNuRXuaHAbRZaEzuTtsCB6R1SaDeKYL4kIgUWXEDiXfqV7vrWhkXbHBp7p0+ddgosZDOAR83/UaEx6Gvdn1KZjvCbwDb+H79cjZSjuhxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOVLY7+nCpn3m354mMQG8Jr1r1JZ0DBmLwRocGLfOm8=;
 b=hxShHHN1bnjagPLsbxquRaNgpCDoCfwYBk+RzUmzTdHTqi9MQVJlVHKvEa6GnZpHzBb9WuhMRmChSNHIJ7FROlvx2pmWibXMvBqfIkxXgHiOFwr1OviSLW3V70SMiAylfRa4ENcNpDun2a5P9CqbfvXugQx2SvQi9pBJS3kadc3wg+dS2bW2m8CKzCT/qa9CEJM1uuLW5l2Y8eMyywKcINGNFuf8d9STQ4twV+aXG6vv7bfztjvaQ6eys6eoe2ITca1UaSNyx9EYl8FvxC/D0LMP5AoVcg4/GDS6Abklxd7cyzi/WkH9eEKWuH2ANBqtwkt9f905vLsZVYJ0q/sieA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB7157.namprd11.prod.outlook.com (2603:10b6:806:24b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 15:38:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 15:38:23 +0000
Date: Mon, 13 May 2024 11:38:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 01/20] drm/drm_managed: try to improve the drmm DOC
Message-ID: <ZkIz6zLbwiXy8hEx@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
 <20240510181212.264622-23-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240510181212.264622-23-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0182.namprd04.prod.outlook.com
 (2603:10b6:303:86::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e7eb71-a071-4df4-8cbe-08dc7362b937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?olRzWPCGVg1Q7TQbWumFST3UKVzxkt0Ln1gpOSXiXSrnEEtkwoBhm92q+Hyc?=
 =?us-ascii?Q?hMgVfwVU/D9T9LpobQB6O1R9sLbiS6NQPPnT3YQO73DQ+1HVb9CRi10mBGyi?=
 =?us-ascii?Q?0YrCXorTCdv9lQWLpmhXJleMj05WuhOcJf+zYC4EGuDrydkd4Z9kZxz01c+n?=
 =?us-ascii?Q?So540+pdwaPVC0icfa/LZjZG2d+T837zm807T1KWKL6Fla2ng+UwA9gwTc2x?=
 =?us-ascii?Q?lVEqPbfLzmSsWAe49XnBG0WAIXWhi3LNi4Qh/24mjpfGgaUeBBhjc541fNtk?=
 =?us-ascii?Q?y9d0OitolCn/97wA6IR+RcM9+ud+qFEievKk0tC8Zf+6aHfTokd5mwfQ9zuj?=
 =?us-ascii?Q?C3fC6/bIE6PKtGOHnkthL2a+P1Exz8AmU/AMJdkAkuZtQpzEaCEaunANsQPu?=
 =?us-ascii?Q?aNFy9A8wJ8BPVFtQVJyTIEjxFspKAHQi52hbRgwUDvnRfvsIsHazjzVQ7jVN?=
 =?us-ascii?Q?tz1X3p3vgUYoJaQOSbxd2QuVJFivrcBxPpZuwjBGtSY9wYdmjAQjg8lTzbd4?=
 =?us-ascii?Q?HCHnvhHbrB3jbpinzmNm6YfisrGpGRpCKf2hFlaMFnm2q2lmJwjngm8babwQ?=
 =?us-ascii?Q?3oJReP5rhrSmVYnFstO+LbuvCt8TwBr672oaIerwp6BWXkZiTd9BupoVIB2+?=
 =?us-ascii?Q?0WNoIsZZ+sjMmcVTfXdLEogl2/IDlxwxnh+5xx5VfHsIuFLEE4RlXa4IieBI?=
 =?us-ascii?Q?kDkAAIDmveD/XY0Rfs2saGKX0Ajqsvgul6VEosE/BtUrzckN0vAzAYgAQYE5?=
 =?us-ascii?Q?i5Mhxtc/slYDIrJalBC4k0Je+m+dgg71SaLcV/qF0BbzkfsQRU0XHy917mc8?=
 =?us-ascii?Q?CfO9xh6wR1CYEXFphweLXN09K3rNd7FbLyFSwgmSnfvKNCKAWjxqNNRACuJn?=
 =?us-ascii?Q?tiFKHNnTB4kLWdL1R/5OSe1nItBr7AzEAf48niyubWf6Apl0MUAtPPV5s25v?=
 =?us-ascii?Q?KsPnnPugzIVZsJBJ3CNK2G9pKapRtbR1ca5g19wZTEjn7bz9CSB5cH+lPSw8?=
 =?us-ascii?Q?J+O4qqnX8wDZVM7uAJxEzPa/lYV9kewghIKAn8dP37cPD0i48goUFjGX/eh+?=
 =?us-ascii?Q?UGWxdT5itQsZjAGKbgbOLXsFu7Ixp+ykDabe/r5lVUULM65JZlAeZw85fPAB?=
 =?us-ascii?Q?nPwXh9ia3KghD6IZhGDHwWU/J7UH/pti6A31gvSoPZgIfPI3rnZTAeb9pTZX?=
 =?us-ascii?Q?IObWA3st7/A8tcXU/nfU++KLomfWyAqlwRek+fJVuRrNBBQTcIdYeVzEbxUf?=
 =?us-ascii?Q?ik3hr+TyhZxK4Zi113DfqphNVfKV3+bFVYRzspEtng=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L7o4wStxu8m99i+qw1ueSUvLfbCYseHeVzk5lvwhNPOPu4q5Ztz8ElGYPbO7?=
 =?us-ascii?Q?7OlxkhPjEz49FtMv2fg0NqkycvfjqPlyCfqhiqSeeemCZQtXZz00eNstXlGB?=
 =?us-ascii?Q?ItIIRT2EJLFGRfpjDUcBybpvUiWM1VaOFOqDMnHYTaiQOdmi8MysbkYxNbEH?=
 =?us-ascii?Q?8796+YgQ7x44F/Ti6a7IIsKb6t3sfir9C5Tzd5ZYNomgjWiUN/fGaRycy0Q4?=
 =?us-ascii?Q?aiinU3Br3hQ7VLE3olhkWFYR24bLjT7u22I7KME58yttaeHPXAGLH0ZojEQo?=
 =?us-ascii?Q?iN3tD1/cEXJd3iVZAtvB0ERbcGTyMbYFn9OXQwenc1Qws548RaWOYMGLVLtK?=
 =?us-ascii?Q?bcAbYzgYTv9xzKng8WTKOPhFD97btXeJrSRbouHKyPhjI5cVsrrSQHSRBdbn?=
 =?us-ascii?Q?bMi49p3A/ep/26lP5/uMNpG0tqlv1vlBUNsQwV7WGh7OOCN0ZMK5boZbRXBR?=
 =?us-ascii?Q?8f0IG33pywurjFan+BX7I+yQc0WztJdfnQhgkfl/TaXRw2jvf33t/r7y3N7y?=
 =?us-ascii?Q?wsLE9RZXg7hwgQLBoM71/gDLh0wrUIt8G74rFHLDxDSk2DetK4mz+IHGNckC?=
 =?us-ascii?Q?ST1GkGmgjzmgCal89h1HnqpxW+5QBU/CBWLYb2jDilg7fhabNNwc6L9I6jsz?=
 =?us-ascii?Q?YrAQAKAzIJjW6cHRt7EAoptTUSXVVCXNfWkhbQHvRcO/KxbHi9o2oImgOsSu?=
 =?us-ascii?Q?b6MhZr4DbYPemcvIpPFZrJffcIuDPA0DoSVcj9402/421ZtSUME0o1/D8Ohj?=
 =?us-ascii?Q?Hk+EqtPFp3sOkaSKRVXk/YmXzLr7g9yml3AAJ4GbzhLH+B7C8q2BVe0w3WPK?=
 =?us-ascii?Q?5SElKK8R5EWDX6lDGy3tE5gppmMBQRigylB8BNlrI5pzyJv8+NVOPffs19BW?=
 =?us-ascii?Q?Dn5ljxVPnUrHZgB/jUi4nMm4B3Ft1jiY+8Q9t+92eA78ageoaYEUo2ODRDge?=
 =?us-ascii?Q?bCA2rygRU4xzoRIRzGsJgKwb0cF+YN37kYyR6aPOrkXDvW39uSwiLiXAEhrQ?=
 =?us-ascii?Q?IrPbj3dfCIS4x7gqanrSe6Nh+8CIixvKrS/fI3k1Oxit9zzIZbLmx75FhT8S?=
 =?us-ascii?Q?RUrOTJkQTNnkDylGdmGKf8eFe3Kb18tl29/AYbsUx3Z7OgOhWJmdBNqY3emD?=
 =?us-ascii?Q?1T7iafjEAOb0htTM97dC/MGQLT8bqIqTEmPvkPS5IJ+mf+ah4mtfCbuirVaQ?=
 =?us-ascii?Q?3tDYa6gcNtrepnScekGtEh5ZaqfQ0Qm0V7Y0lmF/8IYO2Q+T1yLQZn0qBHYC?=
 =?us-ascii?Q?IpC0hggUQDlfaluqH94cat9/Ofe1IG10HjuSHEwHwJDrbyG7KITa4/whbsL2?=
 =?us-ascii?Q?xNXUtRnLRfJMWKKmF7EfCHON/KaBcmGeT/easuzAD9C1BnCZnjEdsJzHxr77?=
 =?us-ascii?Q?un9W0LDllW/sQmcLhHn4E7+wKLXI5wAnwbSBD0BluvmFmxDMmkJ9Vx/WCEZI?=
 =?us-ascii?Q?DnyM3I6ldyfMNVCsu5vh6VOag674b3HlpHshbioDX/MnHMYYLqfkGQn1+vpJ?=
 =?us-ascii?Q?s7EeXZCRey0gbxXZ5izxnO3Geb/mge+R8d35eTvRLSsoCIAq7LvbJWbFTPf1?=
 =?us-ascii?Q?m75epd2JJ/Kz2JuYz5NKzfviiuByvzKhz7ewvwHa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e7eb71-a071-4df4-8cbe-08dc7362b937
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 15:38:23.3687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R76mGG56ZHDOnFm9uoXvT7/++4OdZCWG54CpkHpG2fYF11qhFh2JryoNkcSO+eTCv7UL/kuRmCHHq1PNwwZzdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7157
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

On Fri, May 10, 2024 at 07:12:14PM +0100, Matthew Auld wrote:
> Hopefully make it clearer when to use devm vs drmm.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/drm_managed.c | 42 +++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index 7646f67bda4e..20d705bbc0a3 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -34,6 +34,48 @@
>   * during the lifetime of the driver, all the functions are fully concurrent
>   * safe. But it is recommended to use managed resources only for resources that
>   * change rarely, if ever, during the lifetime of the &drm_device instance.
> + *
> + * Note that the distinction between devm and drmm is important to get right.
> + * Consider some hotunplug scenarios, where it is valid for there to be multiple
> + * unplugged struct &drm_device instances each being kept alive by an open
> + * driver fd. The driver needs a clean separation between what needs to happen
> + * when the struct &device is removed and what needs to happen when a given
> + * struct &drm_device instance is released, as well as in some cases a more
> + * finer grained marking of critical sections that require hardware interaction.
> + * See below.
> + *
> + * devm
> + * ~~~~
> + * In general use devm for cleaning up anything hardware related. So removing
> + * pci mmaps, releasing interrupt handlers, basically anything hw related.  The
                                                                              ^
Extra space.

> + * devm release actions are called when the struct &device is removed, shortly
> + * after calling into the drivers struct &pci_driver.remove() callback, if this
> + * is a pci device.
> + *
> + * devm can be thought of as an alternative to putting all the hw related

nit: perhaps s/thought/seen ?

> + * cleanup directly in the struct &pci_driver.remove() callback, where the
> + * correct ordering of the unwind steps needs to be manually done in the error
> + * path of the struct &pci_driver.probe() and again on the remove side.  With
> + * devm this is all done automatically.
> + *
> + * drmm
> + * ~~~~
> + * In general use this for cleaning up anything software related. So data
> + * structures and the like which are tied to the lifetime of a particular struct
> + * &drm_device instance.
> + *
> + * drmm can be thought of as an alternative to putting all the software related

nit: perhaps s/thought/seen ?

> + * cleanup directly in the struct &drm_driver.release() callback, where again
> + * the correct ordering of the unwind steps needs to be done manually. As with
> + * devm this is instead done automatically.
> + *
> + * Sometimes there is no clean separation between software and hardware, which
> + * is where drm_dev_enter() comes in. For example, a driver might have some
> + * state tied to a struct &drm_device instance, for which the same cleanup path
> + * is called for both a plugged and unplugged device, and the cleanup itself
> + * might require talking to the device if it's still attached to this particular
> + * struct &drm_device. For that we instead mark the device sections.  See
> + * drm_dev_enter(), drm_dev_exit() and drm_dev_unplug().

perhaps open up a bit more here?

anyway, everything looks good to me.

Sima, thoughts?

>   */
>  
>  struct drmres_node {
> -- 
> 2.45.0
> 
