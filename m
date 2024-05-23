Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357D28CD92F
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 19:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23E010F188;
	Thu, 23 May 2024 17:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ko9WJlB8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC88510F186;
 Thu, 23 May 2024 17:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716485754; x=1748021754;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5gUV9eumuGrILIfTjd4HwGuaNDsxVEVW8kX1kteOULQ=;
 b=Ko9WJlB8dcJDOH3EzQda3kGLJt5PEhhEfmB7ivmJHh62OKR6tJ+l/9Tf
 LVhqHdnpsBozEwGRbhvGY2LU6I6LeiKFZqvWCmmy295Lz4+LrOu5AKXJP
 WHS8A6juNTRi3O6n2VZSG5EmO2vs8cekAJVmiw4lMqEy4UuJYRWo2cgfV
 H5v2dHH/zbVDIPQdT9JztzCfGChNuanp4IEg8w7ARtzDzKiYWrZcqR2s4
 7Hh0XxOVvfkfOeh3GFeWJfOCRBQCUCGiZPjLgj1l1kA/W4qcKtwsFUlkk
 iq0xt4GijSqTWycnD4Q/3uuOzr6ifmIRLL76ohABRYS4nFPbawxGLuG0R A==;
X-CSE-ConnectionGUID: qrhl4LZgR6ezm0XokT+S4A==
X-CSE-MsgGUID: jrllNyQRQvielKU24pf0rQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12673847"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="12673847"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 10:34:56 -0700
X-CSE-ConnectionGUID: vdzQZvnMQ4qBAtrLkloTxw==
X-CSE-MsgGUID: 8h4SMbUFT/u50lXV5SjdOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33713946"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 10:34:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 10:34:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 10:34:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 10:34:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDvB2BXNiGvhdEtaeqFVtNxMSD1PxQB96WrB4ej80uJUbAm8F6F6PZ54OSfe4sYiUF8em1JPm5dst4TYaSRm4GykcrrCEeoOW0bv5AFFRloLyjfhg3linjsDOgR/wqvOwVC8SH19Bm8vRcg2TYhKl8yXvTit45tjPv6Di5Pv0HemCpa+wPK4sUenYfLEwQRUmyyn9cjJ8vxbU4YWSyeenZ102FiL9HdPjk09r41ck5QEeaP5K6dJ8GZkeyR5nWD3Cc1So8cU6zGUhJRIkiV0NTl243R3k/8vOTq8uMJ+5luQ53cu4n0lZrPh/xIUj2bQU+RLZt6gNG6KPy/+zwvCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OV3pF6NO9AbCASyoWNwv7x/I5suTyAE4TrPEy2/GMJ0=;
 b=eGuGihU510/VATmq/iwIa5JwN7BxANMcVkHqmB37n+oJCr9rSV9dfKVzEN8DkVUk7sKzDoZNVk8SWl3OSiC9+XWo1WLNRV14rNxVHh0/XHE9LAU0LZ7IqIPBfvtpxpuEDne/VS3ZuT4sHq1b6ews7mAu6LxAS4v/bA2kIbIT9D3L+EeRZYQf8Ivm98dmyGOYtpu5+TR2JzqVDGIAHfr3YlUu8e3AwTsSgBw28et++6wkgMXwj1ys/jK20SGxjeQFxI7KUNU+Boq+Fo1XRyoYDhL0JyU2wiNTi+TYgSaOhxM5KRy2UO6ARFVbaW8SGBro+1JyOPw+Mlu2Y8OGvVkhKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB8073.namprd11.prod.outlook.com (2603:10b6:806:301::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 23 May
 2024 17:34:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 17:34:47 +0000
Date: Thu, 23 May 2024 13:34:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <linux@treblig.org>
CC: <matthew.d.roper@intel.com>, <lucas.demarchi@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <airlied@gmail.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: remove unused struct 'xe_gt_desc'
Message-ID: <Zk9-M7T05wbtNzsD@intel.com>
References: <20240522175840.382107-1-linux@treblig.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240522175840.382107-1-linux@treblig.org>
X-ClientProxiedBy: BYAPR07CA0095.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: 080067fa-a9b3-4a27-1115-08dc7b4ea473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5rDgkdKNB0bAMJzL/EC3nSp/wruqLrImhItl9rRHihzZm0eP0UQTNyQdfpOk?=
 =?us-ascii?Q?kzdkPqB0eN765kA+7ZjQhOoHxiFTOpzNvXAGQmLp5CWo6EIVqc9wlSHBanVu?=
 =?us-ascii?Q?iOsbFBYUrKdSdoDOaO3e4ZyL1yLdQzi0GPZn6W7PeUogI26a1Z4Ge4sLBZwE?=
 =?us-ascii?Q?k91w3WqMuLNqGzPAsc2Vssq8PpwN4oq/oN1B8Dseu569wmXH3YnNZfrB3y1N?=
 =?us-ascii?Q?qI9U1pCdVSKORa3SziZTDYle+Q9wcOFMYGzVKm7VreDhIvjRM/WC7wIJPTRN?=
 =?us-ascii?Q?5TcvqbPbfxWyUm4t76S1W0GagDmRIt7iQGbk3JRRUxhFfV0vGVS8w7SbdhlT?=
 =?us-ascii?Q?A4N7ZLXUpr9WXfoeMhxiZ3BCymUGD+SvpdHAHJkppIvDnOGB9wKAvd0sc9yH?=
 =?us-ascii?Q?8NQ88FKrHy3AMT/8pMloQ8Ac17RIkGAjI0p7Bu2M8G11Y/IFGkOt+paYpQL6?=
 =?us-ascii?Q?aFTuOfkRs3jz1W/eFQQOE7G7on9pr2pZzaJ1gIuiid3jE45Wslpb5v2ALbx9?=
 =?us-ascii?Q?0/5zaNjrZ/m7NPCIvQu2yxyJ48W/ZQ67YHaLnR4/0LYSWQ3Y9x0HrDk7UZXI?=
 =?us-ascii?Q?TMXku8Sopbuvex0u0hjdvMt+Eu7wqVvf/Y6yTusI6kqmYWEqJKjEYgtsPPCy?=
 =?us-ascii?Q?R7dwgdmAKsTS/JAx5JpqmuwopWJAuzDFinkGEp0El269TYrDyrEGmcT0K2Wy?=
 =?us-ascii?Q?FoJ7G956fKuUeGzPlyC65cg39kI+6Bt1Kf9SfdlIrsNSSH4e7DVilioJHEjB?=
 =?us-ascii?Q?tILifsXrT2YstvZOz2JsGISet1q+QQs70lv8xh0iRS7BJsT5sTz2zaVvXYtl?=
 =?us-ascii?Q?4aFaDI/tyYnVlrav6vKYi/59UU59i5Ipy4tswHTn/VOE5ARpCKoxlbvKG+7o?=
 =?us-ascii?Q?VzW9YHoKPSdcYSiMD+M+gFEJVwe4r399e3XNNQHzKBg7FWZN8m5xDtVyekuR?=
 =?us-ascii?Q?JuvpP8gXIYms+/8aL0CczmBLrBigEvzHU9kgjGLSpJNI1Cucym94rHxAOyY2?=
 =?us-ascii?Q?Y5CvD/Da9HjHCnqaUBqiiQzkAEe46RLqsLdijjZ92t69WGfveYiG+djJ99L2?=
 =?us-ascii?Q?07HfgckknhurSM5oV7/rNGerX/0tOdK9+vK0H7k4f6fEaKTAbIZvqtyQa59Q?=
 =?us-ascii?Q?YbWM1Nm+QptuubiSW4TQfdlfbJ1OjPEt7IxY6g+pu+1Op46cOmu41bMenrs9?=
 =?us-ascii?Q?3+mtfYfe0TtgAFSemUOVTkyq7Oxn8X00p8SpXEFLHaqY3sBVwjojGIVgb52u?=
 =?us-ascii?Q?XCKfSPoxZcKvrIg8AkmY+gyEzDpW+uFSvkGqRA21cw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zpe8t+m9kDddccHLA9Al2lKDfxRVacPf1Yi4AWs4cQaU5ZEyNqjnw7yKTPjf?=
 =?us-ascii?Q?PBScOGsDOHqyk0LaforosRHRSwwj4Aqk8wG+haBfZeUdsRcVqD5UdsAPXHTh?=
 =?us-ascii?Q?XjAVAOYpt7F4Uhh1dcL12jeyNoMKqkoM+Fjd0NgCe/frYfzwTsNjHsxMLX4k?=
 =?us-ascii?Q?3x+30yyuktX0iSBSoGyrk748DU9f1rH//5jfaaa/DzzWZO5YV53ILVWh2Hg+?=
 =?us-ascii?Q?2v9+V55bICP+IifPGQ63xidWtU/zNSY9PJDpHuAWNIG4/wcd8Fks0qKzn+X9?=
 =?us-ascii?Q?qY5w24bmrsRIkzTULeKFqsx2GZ0P3Yt6nBurhfYAkx37SDV7OKq554EPabtg?=
 =?us-ascii?Q?rS4VhShcCRCocrfKtMNUL08QvQV4KY2lcaRhW7bB1GCNWVxQ314CWZndeVEI?=
 =?us-ascii?Q?MUaLsVx2R+E9YTmXd0ePCJC/mxstxV1ZxUpFMRhsxs3t2vmD/xx8zjoy1tLa?=
 =?us-ascii?Q?7aihx+NuyKMJpGgZb027lxqbpsw2yy2x6nHDrdtw1DShdT5PJnXYNVLy8eZI?=
 =?us-ascii?Q?ALE5ceTEnzIkwFqcy+u8vUyJO+Iy5TgfN+tLpE1KVA5n6v3zUKLx4YgjvAWM?=
 =?us-ascii?Q?TkaBk+eBfbUwhB9hGmMVDT54w3OWY8RvXcO+BYUY2OVkyIWjKIdsh5U5sIU6?=
 =?us-ascii?Q?c2X2HMd6D6Fv1Vrtz1/ivPr10FFB7fGq/HJSoJVNxdreUqL4yO4zPSwDllo1?=
 =?us-ascii?Q?QiYb40Ikw7CnuufW2DCOkXDY1gy0H4qHQZrHKVSUYhvO48TFgJGAsUlRY0Z/?=
 =?us-ascii?Q?sMMdfH71iKY675+zkbPiKhUpma7ChEA5dQ1uvhcRxwBi1HXBZThIyf3lM125?=
 =?us-ascii?Q?ClcvNLFbGKuRr/Rp4uPQVK7c+gGhW62DwgESOkyG9tH2HNYEaBZv9d7pqSyj?=
 =?us-ascii?Q?D0KJcL07S0W4DaiHWFw9j1We0fVYeoVQpYH9M8Zp2URSoPZFvwbBSmVj4+Jg?=
 =?us-ascii?Q?KpJDA0/ONviY+cKZg2pMekPthdrQzv6Ww1TiSv6Hwk//UQ4CQr8XQpDl2pkh?=
 =?us-ascii?Q?7RibuYFn5oh8CcueVcpSb52/OvSWa5NjE7nOygyvYJJ9vtAWbfDB6/se89t0?=
 =?us-ascii?Q?7V+0eic0v6bx+1cKMaYTPBakZ3GV3FUxjocOWVnkKM3suEX0wlBL9yVkQwC2?=
 =?us-ascii?Q?jAPTxMQtA0+Ze26nzhIe26n94jaAJ9yH+o4ndB4762zTsueBeeGqRMy8RUz4?=
 =?us-ascii?Q?SZIiyBxv26sr2f36MfyvdttnLCKSVF9SoRWcHhGtqvfh+QCM5kmVsWhCGeX1?=
 =?us-ascii?Q?/is1S8PfkdadgFDDDl4eMJOljQW8rgblCE7ZJOukUBTpUfS0r2DVcqs1MpK7?=
 =?us-ascii?Q?tiSnuQoIkC0Y+dxahuinNW6Aii7hvWl8ZaCjRI3O60QJrronPes4M/wkFLPL?=
 =?us-ascii?Q?U+Qu2h1QFXW0yMLwFTDwASXDp3cy+qVlS7+Ji5z/5t1huqKBAk+egNboNfmU?=
 =?us-ascii?Q?ibcZK7stj8AL9DIs769RdDBmH83bsy0oNybU0h+ZhtiQ5VuW064kN2cei6x3?=
 =?us-ascii?Q?aVd3tHB7idBMd7Pf41Sza/MILvfGHSIb6LcNhzuwEMT+63lyt2GqikjPaah/?=
 =?us-ascii?Q?nDPIGm1VvdXg8rmwO45LYT/p3Ov5hPBPNBTs/x+vxgA62NkubJ2Lf4oO3B3z?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 080067fa-a9b3-4a27-1115-08dc7b4ea473
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 17:34:47.8069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OntBkCj64eEaKZJ7rDvPERO1JG4LxJLE+1DnJcGif0/Oja3HL2vOw4PW+q50o6vDfQ1JxbMlBIUF4/kcL2AC5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8073
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

On Wed, May 22, 2024 at 06:58:40PM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> 'xe_gt_desc' is unused since
> commit 1e6c20be6c83 ("drm/xe: Drop extra_gts[] declarations and
> XE_GT_TYPE_REMOTE").
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and applying it right now...
thanks for the patch

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index f326dbb1cecd..2ca210480bd1 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -40,12 +40,6 @@ struct xe_subplatform_desc {
>  	const u16 *pciidlist;
>  };
>  
> -struct xe_gt_desc {
> -	enum xe_gt_type type;
> -	u32 mmio_adj_limit;
> -	u32 mmio_adj_offset;
> -};
> -
>  struct xe_device_desc {
>  	/* Should only ever be set for platforms without GMD_ID */
>  	const struct xe_graphics_desc *graphics;
> -- 
> 2.45.1
> 
