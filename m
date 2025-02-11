Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DCDA316FA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 21:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B058710E751;
	Tue, 11 Feb 2025 20:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bn96I0g7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D72B10E314;
 Tue, 11 Feb 2025 20:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739307397; x=1770843397;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d8GjtewfkMa/1NE0GDcNoLbWceueFspOvAIKjInPxjM=;
 b=Bn96I0g7xn0YR4taAj+FrHVZpQMdt3Q8gQ+8mMvhRlbrxZvsdTuBuvDo
 Zvy2rukyS57FONQLbA9XWozczzePInUvT+ZzLWtsZiG/X1Bobg6yC4/c+
 sKjSgUe6kHweS2kHf+2wRlY7FVSHwrFjiaFO1yKRuBrAmNYic6O4baITt
 SIxgUt3kQA8HK6FKWnh2nrcDnGD5uqrGGH/GWSbs4DQcO6JsKdz4r8Whk
 XoJMGCEF1Wy2/aiZkCbcSqnmMuf9LC09ffeMhlhzWHPHiwbKlNJhX8oIc
 OnRhuB7gZXiK1MbxT4WZCYaoWn/+DarGP+/ltDoqWUe/xornOdCnb8So7 w==;
X-CSE-ConnectionGUID: fxoUY/ALT/qCzNcvvFEtYA==
X-CSE-MsgGUID: EwNfU++pRc+c9tA/r9lyAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="40087166"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="40087166"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 12:56:35 -0800
X-CSE-ConnectionGUID: Aug5Wn/IR/2DKgfUu8MG9Q==
X-CSE-MsgGUID: dq+deZKySoqSBHs9fd6yMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117559787"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 12:56:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 12:56:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 12:56:33 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 12:56:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wePjtXo+hsICL7XWsvudBNHxNuife4ZmAhP/qlpRUlPBQKSBju+VxbDFnqRb0kN8Hl3J+WEXQCj2V93b35k19QYwh+wfOAazvOKp1PQSNLvHPx1UMZLkcyBL/UWZD7isUwda89nUvCLrr1oNlo1ftH1L7xIKGTR6tK8jo3bTNKK+MmP3pKpIgOQkF8cgNxU2/+Pvh2itngeKTNAEmpaVnIkWSTqlSovCGe1ud69/8OHGjkllTKEyYlEIeKEcK60B9I3V9bSV/vSwzQtfcuQLCB7NgKPmUxqfy9j3W69RtsCCRZgDQancoSfiZXnAdUnwd3TTWm09fXmacWqIw9+rrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJ/i7HSfVrWCo+XFlnqKUqGBJvSeSdfz4iQHnnRi8as=;
 b=mt1WlJmB4+nZfFTV4gTSGuvahjFMKBWIQhJrXac1GvydTDbsLPXNMDjTTCS2jwDFFAa9u/UpVvGcAoZd1V5w2rdfR/dy6G63OLekREWtvZP+nU+onyjfjU9ePSKvvAw43vUT540vd26fi8fz6GPIYXgcgTtUOyZM1thgSS+LdhksvLUml0Qm33blX+4p70X9cc7S6ipuN9lG5PZ3U9kzYZZcxqJz7ZBlInnNH5XoSn8kMFys92R7xvpXe/M8azAQ7TSOxgliIjfXMWO2mVT8kno+AeeGz5GA1l7w9e++KiLbFYCQCLeynNpp9x0Gm7YBxpV2gTnaKmdX1bBCag9XJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by DM4PR11MB8225.namprd11.prod.outlook.com (2603:10b6:8:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Tue, 11 Feb
 2025 20:56:02 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 20:56:02 +0000
Date: Tue, 11 Feb 2025 15:55:57 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <lucas.demarchi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <mripard@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <jfalempe@redhat.com>, <javierm@redhat.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 01/12] drm/{i915, xe}: Suspend/resume fbdev emulation via
 client interfaces
Message-ID: <Z6u5Xari1HKZ4gz8@intel.com>
References: <20241212170913.185939-1-tzimmermann@suse.de>
 <20241212170913.185939-2-tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241212170913.185939-2-tzimmermann@suse.de>
X-ClientProxiedBy: MW4PR04CA0215.namprd04.prod.outlook.com
 (2603:10b6:303:87::10) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|DM4PR11MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: c7c74a66-a1a8-41e8-f9d7-08dd4ade7e98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BMi5am18CotgHsbbkIo307aCLdjRXl+GYEiO0xfkR/Sy05cjn+kRGaT0iCkn?=
 =?us-ascii?Q?f662RaTQIYw0j8B2tDwFdPd1/k05XgVXwLfC0ExHq0oMCFsfGV3zW45PrNRH?=
 =?us-ascii?Q?lN/6kWQhmD3pB3Z2efmyhNhUhd6yHY7Hs42e81RzWR9leTl8odtsw6EcuD2F?=
 =?us-ascii?Q?V3lts6h1YQUdr6lb7r3jj/I38PUo6RRPBRMRYlY1UIYmfWkDQBj8F318F05O?=
 =?us-ascii?Q?B9S0PhlhX5z2ityxdQGrY5kV2XgVlMFVv79/Lf5M4N+DQJB5QXMKjtQltYO4?=
 =?us-ascii?Q?wD2q/3yN+MhZ29TF6VqKKZbnpSqTs6kQceGAxpf6t3YyacndhZ3T9TLpzsUK?=
 =?us-ascii?Q?xgbgAiB2Q2O80p3R6SwpmkJPHwKdQmC/Y2wWkHtvmAJZ+0QSK/xyzCdT3PBC?=
 =?us-ascii?Q?z+ZYRloltZ6SsSQlqUmgeemjfSZHUHmV84S7JtUAhAC9FUirD7EbaBGGvxor?=
 =?us-ascii?Q?1+HzFD48sClt0tHsD0Oe7sfYo4hvxQfLGoAmP88zdDVPjSxfu5KPkA3o7byv?=
 =?us-ascii?Q?v3zB/Li1FfzJBWKWopa2SXQm2ut93wLMR6POy3fPcwmDRU+5N0z7mPK99sds?=
 =?us-ascii?Q?IGnUCIYPWmJGXfOMisr7pNRHEq/3A6Idrcr3vtWS57Vqfe0gq3QeCTtvw8Ri?=
 =?us-ascii?Q?ERJbkxX1BmmSMHF0mbSdoOTzARWtS7k9nmViqRo9k7oEOsYP9pM7T35Vp6nN?=
 =?us-ascii?Q?vxmGN7VccQqj1MpJfuAdF2fvyVr1kqfRGIWUIOKSzncxXT55IqBgKko5v5BE?=
 =?us-ascii?Q?NiSvhJHy5bEVoASmy2OE8cKaoSUYXDQEXZAZFyTXpUzxFr7iccHxYDYTbTEc?=
 =?us-ascii?Q?FOYG7euS8spQdMCXtWHwGBfSAOPwV2RYNOW0HGBHmOZCfWVvGro424R6ypdI?=
 =?us-ascii?Q?fYpWXwHJfXBWSHzanVDYRWp8vIDIDQkwEpzX2T93VdauJNqqdrw5WQRWJhXG?=
 =?us-ascii?Q?/cAlzVpGi0ljbnXd34wQX0roBzP2F8z0o04uJsuDtruacVCtkbGOIom02qDH?=
 =?us-ascii?Q?xUECaOh3J9n7hhoWNhWVSUV9NFeiFMGrZYCHv5u/pleSAzEShgqigrvH+rkP?=
 =?us-ascii?Q?vzLGfTXLNlnUL2fs75VZzDW9mFZSnGEUsaNRvuu18tlbKFNXIZNyVNUjop7V?=
 =?us-ascii?Q?HTq2+FemqnHW17jPeCMCQ31lX3F01WXdjYNQJyN/iyUep3BuOJpz2E8HVP1A?=
 =?us-ascii?Q?csRkXo35XxLVuBIvi5oJrNMv1U2pAiDfeu9YpHHpuBazz0taztUwWXeBnc5H?=
 =?us-ascii?Q?A3e0iHOYsU583n3xLofZsGiVvQkZFhg26MTcQvKJufl5ek7RZvRD8OKDUavR?=
 =?us-ascii?Q?HJMD4JNQ1/N3F8jpqsYo/CmNkFPxcvvEVIwZbZIxzykfZvE8H5n9NwlBYHNL?=
 =?us-ascii?Q?dDGyugvfKzDfI3R+6Q/m3kmLRE0A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RCxoAGJqT6D9cr+lA2OdcAeMjqqLyGtOBOHMVVHdcZqtQDJP0LgqMagGIPfb?=
 =?us-ascii?Q?5NwNsA4I0YXVI7qTt2QOWhWaDKcdggHSCcVBdmk6QdzVJJSEuGMscVmcOtlv?=
 =?us-ascii?Q?cC9AIzALegDrav7Qi5sAarNIgCQhsy0/nfGKfOfQI4xiVe/fI42d9np33RkN?=
 =?us-ascii?Q?yMcXopet7fFFlnwfoLkIGNXb2HgLQFzhVSFa7o82Bz4rysDz2vZhQTWzrUII?=
 =?us-ascii?Q?RAZm9rNQAvaff5tS9X2t/8iUDqJSFCzG9CWboBZm/9/Fq7O3BD7OtnlMpinM?=
 =?us-ascii?Q?3hLElftWnMLfW42BHMvfE2W2k+XYpk9Ap1hNo2tBdRlMn6cVO6zyj4eVCK9+?=
 =?us-ascii?Q?6qi5qf/ca+sC7OwSKznW5WmsOXaE9zR1bSlPUXVR9q3+sHRG39nSFr0Ri4bA?=
 =?us-ascii?Q?iNHeI7bTAwZWlJccZJpdul/aJL7R7xsJTwz4eDUlZiXHnMaYU+Shce4B9v12?=
 =?us-ascii?Q?uDyN9Zfj4RqNfe9mbNZlFWWDiAKulAExnBfFyDheCNNL+mJhCyAbmgI+uBsv?=
 =?us-ascii?Q?jW5KdhNbEPJOKSDU/jtJH8qMoXPqA8YEXB5rANCPx6VhEcsI70wO6CmYrWjP?=
 =?us-ascii?Q?YOzhgLwVabOaCpLiUcWezCcX7Iy9Gff0BXZfURbDbG7lgO5Xbzg9dumyDhMW?=
 =?us-ascii?Q?dh6uumpzky7XxbavJEVYCZ8aYiHWeScBvnNcZqBua2ye/5XSzsV80mIUPDzw?=
 =?us-ascii?Q?ZxdtZUoVpYURQY2qwf0KkmH0sRD+GKq+0DX+eDxPDPu8sMX7ftI7zZavlCuy?=
 =?us-ascii?Q?Zj/07OJHgWbPbGzc2UqQoRA5V23lttQgeFsdJtakrGQzdVr/Nk6qHz9LRli1?=
 =?us-ascii?Q?YAoSsIKoOZEWRqkKk92UWSZZaSDd4xo+ECvyn0R31i2kW0gnd7NWtvcbPswp?=
 =?us-ascii?Q?Qf2wgwEcLHqkY5etsWiQoET88mWCdFUZOV95rn1KeUEli+4XorWI9hcliS6q?=
 =?us-ascii?Q?oPrmS4skB63W46VYF1J1uBTUtTcWzA8qbqnprDY7vQxNe5KG8C9vxmxv9g++?=
 =?us-ascii?Q?1xO1lNWvjVtAAcyovyKy+QoVddZ4usUrWhcWrhPwvyEKrgXB4X5mWy4bKJod?=
 =?us-ascii?Q?B77rI+jgrYzfm5/f47/wExX37/wCG/brP60kjUzUJy/ndYvacpI1dyB2bsCt?=
 =?us-ascii?Q?11dnNL5OwdXB2gXBOKXtyNd410/KnOQxa+XuIq62KqdCPnA14AOKLQfQ7Ipt?=
 =?us-ascii?Q?FC3kLFDHl3r0GNNTkAmrP3q5wEydXG9pumnVnX40GufLfRA+rOCKJrejwjJ0?=
 =?us-ascii?Q?unEAtfxsqWfSwIQvH4WScqRn3YE+Zt51e2ZMAXYrV+hdyFRshbpmTDxOTqSF?=
 =?us-ascii?Q?+/6/bP10yvQqycsDI1c5dvZVcFbOcL+XVotGSPfwC2sQOfaIQq1HMl+7XRSW?=
 =?us-ascii?Q?H9TFKka6GQrZAfp9wHlhwOrt6K9ttqp2t9JRq0ZxwWBIaj4KOx65SFGZTUpU?=
 =?us-ascii?Q?wgT+4IqKhZ77l+TPGT/WeJ+SEgVkGv3An7xfbFaCwbtNb2496IXAg8V3y7it?=
 =?us-ascii?Q?NpC20ZH9xYBqOQMeiOcavj2UQTdMrT7kIBN5osZjHWRurLBAMB1qeL23El/q?=
 =?us-ascii?Q?N3DiabVHdm+CP1guUDqCucGxs9ebVJOwiTqD7n2w+4o82zlT6hrtY/0Ghp2m?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c74a66-a1a8-41e8-f9d7-08dd4ade7e98
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 20:56:02.7061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3KQJIZEtDxhqrb1L1BplEh/nb4lmE/ycH3AINKgmMoweWHilIt1dQ6A6uSf0dhumKT11tNZQ1vFWnoY5vWEbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8225
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

On Thu, Dec 12, 2024 at 06:08:42PM +0100, Thomas Zimmermann wrote:
> Implement drm_client_dev_suspend() and drm_client_dev_resume() for
> i915's fbdev emulation and call the helper via DRM client interfaces.
> This is required to convert i915 and xe to DRM's generic fbdev client.
> No functional changes.

Well, there is one functional change that is the clientlist iterator
and the clientlist_mutex hold. So I would avoid the statement of
no functional change. But indeed it seems there's not relevant
functional changes...

the code itself looks right to me:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c | 16 ++++++++++++++++
>  drivers/gpu/drm/i915/i915_driver.c         |  9 +++++----
>  drivers/gpu/drm/xe/display/xe_display.c    |  9 +++++----
>  3 files changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index 00852ff5b247..a51d1dfd1b58 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -642,11 +642,27 @@ static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
>  	return ret;
>  }
>  
> +static int intel_fbdev_client_suspend(struct drm_client_dev *client, bool holds_console_lock)
> +{
> +	intel_fbdev_set_suspend(client->dev, FBINFO_STATE_SUSPENDED, true);
> +
> +	return 0;
> +}
> +
> +static int intel_fbdev_client_resume(struct drm_client_dev *client, bool holds_console_lock)
> +{
> +	intel_fbdev_set_suspend(client->dev, FBINFO_STATE_RUNNING, false);
> +
> +	return 0;
> +}
> +
>  static const struct drm_client_funcs intel_fbdev_client_funcs = {
>  	.owner		= THIS_MODULE,
>  	.unregister	= intel_fbdev_client_unregister,
>  	.restore	= intel_fbdev_client_restore,
>  	.hotplug	= intel_fbdev_client_hotplug,
> +	.suspend	= intel_fbdev_client_suspend,
> +	.resume		= intel_fbdev_client_resume,
>  };
>  
>  void intel_fbdev_setup(struct drm_i915_private *i915)
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index eb3fcc9e77a5..e385e4947a91 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -41,6 +41,8 @@
>  #include <linux/vt.h>
>  
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client.h>
> +#include <drm/drm_client_event.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
> @@ -55,7 +57,6 @@
>  #include "display/intel_dp.h"
>  #include "display/intel_dpt.h"
>  #include "display/intel_encoder.h"
> -#include "display/intel_fbdev.h"
>  #include "display/intel_hotplug.h"
>  #include "display/intel_overlay.h"
>  #include "display/intel_pch_refclk.h"
> @@ -958,7 +959,7 @@ void i915_driver_shutdown(struct drm_i915_private *i915)
>  	intel_runtime_pm_disable(&i915->runtime_pm);
>  	intel_power_domains_disable(display);
>  
> -	intel_fbdev_set_suspend(&i915->drm, FBINFO_STATE_SUSPENDED, true);
> +	drm_client_dev_suspend(&i915->drm, false);
>  	if (HAS_DISPLAY(i915)) {
>  		drm_kms_helper_poll_disable(&i915->drm);
>  		intel_display_driver_disable_user_access(display);
> @@ -1041,7 +1042,7 @@ static int i915_drm_suspend(struct drm_device *dev)
>  	/* We do a lot of poking in a lot of registers, make sure they work
>  	 * properly. */
>  	intel_power_domains_disable(display);
> -	intel_fbdev_set_suspend(dev, FBINFO_STATE_SUSPENDED, true);
> +	drm_client_dev_suspend(dev, false);
>  	if (HAS_DISPLAY(dev_priv)) {
>  		drm_kms_helper_poll_disable(dev);
>  		intel_display_driver_disable_user_access(display);
> @@ -1227,7 +1228,7 @@ static int i915_drm_resume(struct drm_device *dev)
>  
>  	intel_opregion_resume(display);
>  
> -	intel_fbdev_set_suspend(dev, FBINFO_STATE_RUNNING, false);
> +	drm_client_dev_resume(dev, false);
>  
>  	intel_power_domains_enable(display);
>  
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 317fa66adf18..bc73c9999c57 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -8,6 +8,8 @@
>  
>  #include <linux/fb.h>
>  
> +#include <drm/drm_client.h>
> +#include <drm/drm_client_event.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
> @@ -25,7 +27,6 @@
>  #include "intel_dmc_wl.h"
>  #include "intel_dp.h"
>  #include "intel_encoder.h"
> -#include "intel_fbdev.h"
>  #include "intel_hdcp.h"
>  #include "intel_hotplug.h"
>  #include "intel_opregion.h"
> @@ -336,7 +337,7 @@ static void __xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>  	 */
>  	intel_power_domains_disable(display);
>  	if (!runtime)
> -		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
> +		drm_client_dev_suspend(&xe->drm, false);
>  
>  	if (!runtime && has_display(xe)) {
>  		drm_kms_helper_poll_disable(&xe->drm);
> @@ -374,7 +375,7 @@ void xe_display_pm_shutdown(struct xe_device *xe)
>  		return;
>  
>  	intel_power_domains_disable(display);
> -	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
> +	drm_client_dev_suspend(&xe->drm, false);
>  	if (has_display(xe)) {
>  		drm_kms_helper_poll_disable(&xe->drm);
>  		intel_display_driver_disable_user_access(display);
> @@ -494,7 +495,7 @@ static void __xe_display_pm_resume(struct xe_device *xe, bool runtime)
>  	intel_opregion_resume(display);
>  
>  	if (!runtime)
> -		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
> +		drm_client_dev_resume(&xe->drm, false);
>  
>  	intel_power_domains_enable(display);
>  }
> -- 
> 2.47.1
> 
