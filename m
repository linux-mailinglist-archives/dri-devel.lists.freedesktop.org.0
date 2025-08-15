Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F7FB2883B
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 00:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A296410E9C3;
	Fri, 15 Aug 2025 22:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1VHVlAT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B7410E9C1;
 Fri, 15 Aug 2025 22:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755296137; x=1786832137;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QyXG4smKZpokx7ESoQntG4XXUDNT41xgV7LxAlu6UqU=;
 b=B1VHVlATwgPa+f2mVC0EQRSsKN0o5KdELwaWR4tMi96tKlfPRqt4YbVI
 /L8mlFydirm9gRdoSRYzQJZ2nXgZpKM2Cq35Cnc4SfhbCU8496AeO7XoM
 CBvzWdefqXAwhH5nT5vHZ5YHCQO9VPYxNgnrU6aep6Ucp3lgzPOx1JXwR
 4hHl5ZLWtnyR6yvESAhjjlDsCbAimL/k/bg6BoLwqkKbyX0Nc/562EvuS
 o3OqCyY+sk654wxMETpv7kwpARPd3bWUKUjHSnzNt6uhKsS0I5sthH0QB
 nRALN6WHmV7FJ4VzqkA3I32zRJ8vtMOwGqBhsxTc+5/pPnpJqOC+Jl5Rx g==;
X-CSE-ConnectionGUID: ePMp6tABQGOnndOGfoMwCg==
X-CSE-MsgGUID: h2VUxfD8R7aY1v3MJwbw1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57546371"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57546371"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 15:15:37 -0700
X-CSE-ConnectionGUID: AaP8Kp1mRyCtoh1h8bcJuA==
X-CSE-MsgGUID: romqZrAoQhWbSODIfuq53g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="171360493"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 15:15:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 15:15:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 15:15:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.76)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 15:15:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/bGOgu15P0FWfI3dizYNpOqkvomFAFEWDemrXXFnFh1r+R2p7A3xnjzWSJ6tKBrPuweBtJ4ZeagkyBlUtI/LneQkqmDNiaSavoIEvCq/PXqKp6Z2+DbWqqOpTQYru4vyPe0ywZjb3QIifrdi2MZN+kWc7Uzn2PaysCEULTJvh5PugehGoeEG2MeoGozxToMW3lRhlZalJ8W0orJV4NfFe6/RvuKkJjKZBXxHvXVnGtnC3CgvHob/RtBoyiZcGw1cViHWGvIqC5ywrP1mTRQzeUmTkP7x66OoewZ72JoghIobPvl7DXkYk5+AR+H5ZN3IPg8TIBIGIM2FgqTed+3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2MpCrtS31sBH/yAOb1wAOZbcSvWfd4ukL2T53BZJuk=;
 b=DziEC8nc2GzlCHCQhfLyvdV9AnSl5tDqJJr5Z8r+Y+VhfviXJqSameEzzJvap18k+AYt+NfzL4JRPamNHJX3RihyxAgUfUdmF0utpLSPoO5HzdzEAFnxRVWLri0gn3IDMdHwcSKk4gdFa029+ejahbpHyZc7dAd5vf+91NFcP2UTwpTNjSQlRRjfVpbNo0OldeFJotqNTdF9lHFasCt/uART103XRVlVlgV30+SVVIRJ9oR3Tx4HbOMi7bOIzltvIOLjJ3Z3KvBWKJFw+rkXsaxyxZFhbk5nD2LGf+vOlmj20EvqxTeYejKXzLMM/CtBp08J9czZKZDNbRlVniq3fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by SA1PR11MB7132.namprd11.prod.outlook.com (2603:10b6:806:29e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Fri, 15 Aug
 2025 22:15:33 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%6]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 22:15:33 +0000
Date: Fri, 15 Aug 2025 18:15:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>, Thomas Zimmermann
 <tzimmermann@suse.de>
CC: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona@ffwll.ch>, <airlied@gmail.com>, <tursulin@ursulin.net>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <mairacanal@riseup.net>
Subject: Re: [PATCH 1/9 v3] drm/i915: Move struct_mutex to drm_i915_private
Message-ID: <aJ-xgHEZEw4am8-i@intel.com>
References: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
 <20250813135035.144762-2-luiz.mello@estudante.ufscar.br>
 <aJ8wYnTKv9_0udT2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aJ8wYnTKv9_0udT2@intel.com>
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|SA1PR11MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: bb029987-da23-4e4b-7b49-08dddc49409f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?whSXk9liH53mnZHj0gDQvX9BTmVTOUfneMoXZCMiRGYimLSU9X2aThMtUEQn?=
 =?us-ascii?Q?HkztF3pD20TKC3S8TBgoXTjA3wL1IP4aUYcIAEezr+0f2Oy2JtHIYc0QbXFw?=
 =?us-ascii?Q?4ofVOf3Hl1zAoTJY4Bjdf05Ay0ZGdihqL1Z7nrFBLqDnlUOsEcQ4JOq+FOtj?=
 =?us-ascii?Q?BnR1KP0TxLqFVKD/gVHqyP3eqqusLxmr3wy1l1hDu7wcFACsUKG1evi4/jAh?=
 =?us-ascii?Q?PH8teYKCzEhgxzsD3xTSBqpa0rM00UBZAjDuo7sX54/ueelW5zx8fW7YWaPL?=
 =?us-ascii?Q?Q7wMxVO61f/zz75LZkCvw17X1w4txNH3pG6TUQ4BWdocxJ96TFt7B1sLM/ve?=
 =?us-ascii?Q?B1+GOWTclP6jGqu7jL4ViG62uWXRvnFV+FGIyT9GdCih6IoXx/qA4jBDgfgt?=
 =?us-ascii?Q?p7JxNxhmGS/Ag4ik29bqpafamJ5ruzb8RvWphO0XiM6n6hEsY9iUXkUY7lqi?=
 =?us-ascii?Q?YNTrWJBPSXzaPa/17oYkzx31M7Ei0gH5fqviIdATaIODxGi0+4ghw5Y3cMAu?=
 =?us-ascii?Q?eNyAJA0O/yJZnjUXHsXQjTBlKFkeZ7UqLSoAkvKh0WqLFXFU/3G0o6L6UdQb?=
 =?us-ascii?Q?dsxm0Utnmf2dFNWn/eEHUwrGZKppY76CRDsxAnOKg4DZ1KzaX+vL2YoI+mFp?=
 =?us-ascii?Q?gQjmpJ+glwcNBQlRaDBr1cxGOFlZAbGAImDU4RWF0+e4kRtM905s6jEavGCn?=
 =?us-ascii?Q?kf10KjSHZZBMIt9+S3CWNxRkfQY1M2elwqHFEfwpMgBpNkAGvFExa4BOr4WV?=
 =?us-ascii?Q?g6aL1zhkJWPt4gmIz5xWdQR2BGM/foBFg24JEqewlUnW4V5K09OPKyCbIbWl?=
 =?us-ascii?Q?2/lH5a0ISxK53OK0X8JEzws+onWTrKY7fMcRu1nIE7881OrwQBDdyqmKCQEt?=
 =?us-ascii?Q?III9fkrA7bgPPmt4f/SvYP8mak15m9DDrGkVpTRNFPiFrbInBmLO5A43xAv0?=
 =?us-ascii?Q?/1QyDylWdMCK74h5zJTixi6iwFdDkSEz+Yg2nASi6+ZNK7ydGtS2dPUqdAth?=
 =?us-ascii?Q?x5JPblJgcIv+JjehE8Vu7ighFMX9XKUp/FyaOP/qzYCO6uThWuNYE+Reu4nJ?=
 =?us-ascii?Q?djiZS/pIqaxlskpGUY8H9bAJaYunoyJQieu8qoMSmYLe7sKALCK3oJvu3vZg?=
 =?us-ascii?Q?RkuhJplgIjDvKqGs6aL4hyAAZKW2OqCWzTdA3wI5WH4iF3mIjl1ZbPwewAuG?=
 =?us-ascii?Q?3DOfSf/1dTVU7etMIyNYezNunl0+9jJ//CSM+dF8K0//5fNR7fAwaY6odRxz?=
 =?us-ascii?Q?9qn0C4LeEbs7eoQzwDjkVKArc1/SgJRn5MOvvKapQS4c4b4Pm4w3YLOopsmz?=
 =?us-ascii?Q?I3AHwRnwG91GwV0LUFg3pxo0OYtS7IZ8Mkve33o9pZerkZTiuftJZkt+nkr2?=
 =?us-ascii?Q?GjTGwtFjx/ZWDsGUqx0UtEFzNzPYzQ2yTSCcFRBbBXcaJ5cqPg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dQNa1vgEKvYIVR933qfDuWoD5MWBuyo8SjaUgO14lCwzMtvTM+oW+zG5dNRe?=
 =?us-ascii?Q?GRjdfcmplwQFAeGwNMnhpDEO6kVkC13uCV9b3xNJoPkEXrUEw1Sx3Fcl9Nb5?=
 =?us-ascii?Q?B/TK+3c6lyD5IxDQ/Qk72z4QEEzK1ygMYol88p8EBjKLn/FQcbJLoGs8P4pf?=
 =?us-ascii?Q?NxezOsWzBqzUJoMQ9fesGDtgA7Q6SuvLhxujPb2PWZvhZEt97ywL6w6QIaQw?=
 =?us-ascii?Q?98ttxD8Pz2wUMwbus/MXMcO6QZYl4coUbUJSrguObFf/+O6B6XkP+c//zxGR?=
 =?us-ascii?Q?AI0QPcrZkWUkd7+FZ0fMYRI0GNf6OCOotKkkUlSfmpRI87ae365cK4FCZDFp?=
 =?us-ascii?Q?qOcH3SWg7mHHBKuxPsWGak8i7LhZeeJzkCjxPTa59P87Fl02LHF34Tpwd6/O?=
 =?us-ascii?Q?F2SG1VhZzhKaqZSwaIGJfLOZTkZZTHV6wcLXZnCsv5B0AFrgufLNmG9TYWAt?=
 =?us-ascii?Q?XxOuMJsJZ/fP6fOFurpNWnvNB2ztBbyb/wq8n5n+GCGGmnWvPiGzW2d3aaLx?=
 =?us-ascii?Q?73ZOJBEFfsU+QDmqv87fuozHiW4JpRgDFwOAELZxnN/xInxYcL69T8uF+dCW?=
 =?us-ascii?Q?eeuPing+4z73WOqogk4L/0AUVK+m6JeKwJ/DKr6SJeH+VYFksBspXcCSbUhY?=
 =?us-ascii?Q?b+NpQtEOP6mWeUrXz5cWg4aI9hcypaq8mgTLfajl8aLtOXAbGp2RX+ps+xCO?=
 =?us-ascii?Q?3cHmkhZ6gHgbBXrhyq2V2hcmetl1F0lnFtvAPufqKtXnQoJyVa6FmlCRP7QM?=
 =?us-ascii?Q?bOn7zNJPxKgdIkAm1bqbb/QrNQ4iYyNQFoTzrjf6yRdBc8XsDd4siggW40c2?=
 =?us-ascii?Q?wlT3fuc8XHyAegGLwNvT1/phk3wtshucHsVuMZruvUgnhlScWAwQYzfJmczO?=
 =?us-ascii?Q?KLgScMpVBTyR+KyFuUvn1zd9uRyfaSs0Mmt9cxCpwu0TeFsx0NqvVqQRse5h?=
 =?us-ascii?Q?MAyfQjt7PqtNYhC6/gfKhbn3lZWDVucpCBXc0nE9Xl4kYDgQ9WFhePwBGcON?=
 =?us-ascii?Q?kgt0qyTvXcur3ajzqP08VK/2B3V53Z7ieyplKjQhMV3+FHS99Y4R75LBvLfA?=
 =?us-ascii?Q?JWBNY3BRpZsVwR7YLkVeir6o8T7yNE1qoa0lGOSl30Kq91m15wITgglyrYWb?=
 =?us-ascii?Q?5wr6ai6/CBfTnQLk7DvarCj2c9B4yik4PXTk5Xxs9ovkK72yKFwUDtV0rwEm?=
 =?us-ascii?Q?Yz3Hs6vUtGAsBdpRgZ10cIszCzYUY11mnZOmUdl4YV4j6mHQnPETrJ05hgN0?=
 =?us-ascii?Q?vGVGFg7q8RSd17NIz4+nyywX++A2D3s20qVV4X5EmSFQl2e18omkZfLCu3G9?=
 =?us-ascii?Q?y34E9WJl6tCnDJOLic0BtBrCAQWpPbx2NG42pIB4+z9vA2R3/QlyfNGjZjpH?=
 =?us-ascii?Q?gGfMN0mL4g44EEqwKIARL02du30MIsPyAhe5NuSdMQV27bSwaTsy2hMd5Z2m?=
 =?us-ascii?Q?gKW3TqyP0rBtg0yxMQ/H8sbthwecPo2ZNvoLVc/Ae+Gk/ziioEHAhbhlXba2?=
 =?us-ascii?Q?ZLiBg5WQQVWmu+4Sl0a+XwnTG39/r0LeUwezmYmhcsZ0Op/lUD7ElXGk174v?=
 =?us-ascii?Q?CKHQdNZ6b07l00lnux/C0B1hnI4vwJrmhfqqbrxy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb029987-da23-4e4b-7b49-08dddc49409f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 22:15:33.3559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eC0CxrBwGGR+6M6GPirggsYBwCL9nbL8aO/bG0FSTLPelLskD3d/E/BJA3wDFruw594WcQg6F6jwh83kPTx7MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7132
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

On Fri, Aug 15, 2025 at 09:04:34AM -0400, Rodrigo Vivi wrote:
> On Wed, Aug 13, 2025 at 10:50:25AM -0300, Luiz Otavio Mello wrote:
> > Move legacy BKL struct_mutex from drm_device to drm_i915_private, which
> > is the last remaining user.
> > 
> > Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/drm_drv.c                  |  2 --
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c |  4 ++--
> >  drivers/gpu/drm/i915/i915_driver.c         |  2 ++
> >  drivers/gpu/drm/i915/i915_drv.h            | 11 +++++++++++
> >  drivers/gpu/drm/i915/i915_irq.c            |  4 ++--
> >  include/drm/drm_device.h                   | 10 ----------
> 
> drm, drm-misc maintainers, ack to merge this through drm-intel-next?

Thomas, I'm sorry but I had forgotten to cc you in this patch as well.

is your ack for the patch 9 also valid in this patch 1?

> 
> >  6 files changed, 17 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index cdd591b11488..ad3aee354ba3 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -694,7 +694,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
> >  	mutex_destroy(&dev->master_mutex);
> >  	mutex_destroy(&dev->clientlist_mutex);
> >  	mutex_destroy(&dev->filelist_mutex);
> > -	mutex_destroy(&dev->struct_mutex);
> >  }
> >  
> >  static int drm_dev_init(struct drm_device *dev,
> > @@ -735,7 +734,6 @@ static int drm_dev_init(struct drm_device *dev,
> >  	INIT_LIST_HEAD(&dev->vblank_event_list);
> >  
> >  	spin_lock_init(&dev->event_lock);
> > -	mutex_init(&dev->struct_mutex);
> >  	mutex_init(&dev->filelist_mutex);
> >  	mutex_init(&dev->clientlist_mutex);
> >  	mutex_init(&dev->master_mutex);
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> > index 09a64f224c49..65ffcaeee4b9 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> > @@ -677,7 +677,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
> >  	if (level < GUC_LOG_LEVEL_DISABLED || level > GUC_LOG_LEVEL_MAX)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&i915->drm.struct_mutex);
> > +	mutex_lock(&i915->struct_mutex);
> >  
> >  	if (log->level == level)
> >  		goto out_unlock;
> > @@ -695,7 +695,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
> >  	log->level = level;
> >  
> >  out_unlock:
> > -	mutex_unlock(&i915->drm.struct_mutex);
> > +	mutex_unlock(&i915->struct_mutex);
> >  
> >  	return ret;
> >  }
> > diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> > index c6263c6d3384..d1559fd8ad3d 100644
> > --- a/drivers/gpu/drm/i915/i915_driver.c
> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > @@ -233,6 +233,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
> >  
> >  	intel_sbi_init(display);
> >  	vlv_iosf_sb_init(dev_priv);
> > +	mutex_init(&dev_priv->struct_mutex);
> >  	mutex_init(&dev_priv->sb_lock);
> >  
> >  	i915_memcpy_init_early(dev_priv);
> > @@ -291,6 +292,7 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
> >  	i915_workqueues_cleanup(dev_priv);
> >  
> >  	mutex_destroy(&dev_priv->sb_lock);
> > +	mutex_destroy(&dev_priv->struct_mutex);
> >  	vlv_iosf_sb_fini(dev_priv);
> >  	intel_sbi_fini(display);
> >  
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > index 4e4e89746aa6..15f66a7d496d 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -222,6 +222,17 @@ struct drm_i915_private {
> >  
> >  	bool irqs_enabled;
> >  
> > +	/*
> > +	 * Currently, struct_mutex is only used by the i915 driver as a replacement
> > +	 * for BKL.
> > +	 *
> > +	 * For this reason, it is no longer part of struct drm_device.
> > +	 */
> > +	struct mutex struct_mutex;
> > +
> > +	/* LPT/WPT IOSF sideband protection */
> > +	struct mutex sbi_lock;
> > +
> >  	/* VLV/CHV IOSF sideband */
> >  	struct {
> >  		struct mutex lock; /* protect sideband access */
> > diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> > index 191ed8bb1d9c..cdfb09464134 100644
> > --- a/drivers/gpu/drm/i915/i915_irq.c
> > +++ b/drivers/gpu/drm/i915/i915_irq.c
> > @@ -167,7 +167,7 @@ static void ivb_parity_work(struct work_struct *work)
> >  	 * In order to prevent a get/put style interface, acquire struct mutex
> >  	 * any time we access those registers.
> >  	 */
> > -	mutex_lock(&dev_priv->drm.struct_mutex);
> > +	mutex_lock(&dev_priv->struct_mutex);
> >  
> >  	/* If we've screwed up tracking, just let the interrupt fire again */
> >  	if (drm_WARN_ON(&dev_priv->drm, !dev_priv->l3_parity.which_slice))
> > @@ -225,7 +225,7 @@ static void ivb_parity_work(struct work_struct *work)
> >  	gen5_gt_enable_irq(gt, GT_PARITY_ERROR(dev_priv));
> >  	spin_unlock_irq(gt->irq_lock);
> >  
> > -	mutex_unlock(&dev_priv->drm.struct_mutex);
> > +	mutex_unlock(&dev_priv->struct_mutex);
> >  }
> >  
> >  static irqreturn_t valleyview_irq_handler(int irq, void *arg)
> > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > index a33aedd5e9ec..016df5529d46 100644
> > --- a/include/drm/drm_device.h
> > +++ b/include/drm/drm_device.h
> > @@ -188,16 +188,6 @@ struct drm_device {
> >  	/** @unique: Unique name of the device */
> >  	char *unique;
> >  
> > -	/**
> > -	 * @struct_mutex:
> > -	 *
> > -	 * Lock for others (not &drm_minor.master and &drm_file.is_master)
> > -	 *
> > -	 * TODO: This lock used to be the BKL of the DRM subsystem. Move the
> > -	 *       lock into i915, which is the only remaining user.
> > -	 */
> > -	struct mutex struct_mutex;
> > -
> >  	/**
> >  	 * @master_mutex:
> >  	 *
> > -- 
> > 2.50.1
> > 
