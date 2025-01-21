Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AE4A187F5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 23:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72A510E1FF;
	Tue, 21 Jan 2025 22:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="feEZ3D9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE09510E1FF;
 Tue, 21 Jan 2025 22:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737500343; x=1769036343;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o+y7St2t5ysT/IqjyF1tzC4CYUTdGHo5zENVf3ZUIf0=;
 b=feEZ3D9s/dKQiyW/Rps/QKTo65xna96CSf4C+x+GrQNLgyBgoC8AwzLm
 aG2OL+psIfKC7vNKiEriKhIS8c89QOIj4jMeJdTmUunsFoBzzcZ3VaCd1
 HFGvAfCyGi0TiAVpdaV28fJJsrdB9eKTOLT6yYvvNo7YGFBtbrDlsEyO4
 ekkR56TNSwi3jV2AEBdJK0l3TjP5+oJSqPp3nPMYUWRSm34NDNeRq8/yh
 Hsz6wblTP5eE2loG/rps5Aq4RlZSZMTQ0YmypvGG2uSJtC/UbBnUYhsMy
 PVYLw3ZOt9kXE2GulGE6950wkNbB10lvNBpiL11leMLkRaDNMj/2xgatQ w==;
X-CSE-ConnectionGUID: qIzfkYQ5Taq0aIzRpYDwlg==
X-CSE-MsgGUID: EuqITKC+SKmR+7VHNZPcHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48534392"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="48534392"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 14:59:03 -0800
X-CSE-ConnectionGUID: fDk9/gjyRcGHP59JZi+VfQ==
X-CSE-MsgGUID: WjL7QEmIQHOlJIakNjxwAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="107064660"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 14:59:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 14:59:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 14:59:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 14:59:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YeHv1KscyCwyOFJ2ZESHACizVcYgEACCt7DxRVGA943Aouw2D0490+rowMAAd0YTyS92u9ImkGk4Ai1WbRWx/jELEzufrbO2+vvhg2ZscXqi3CIw1LZwemqQ+LzWJU5Ra1rdJe9Sd0W65+SuTGeOW7RwBMOUmI6mX1clREvnLWWnunFnHTAG96Y4DJy7G73Kv0jsj7DvZEkPN0sytslFK1L/m/dppd3I22vbGSKTzIKcDDfFUnQc6roxL9wpMmwHiCN3Fy5SwOPegO7t/Tr3+8CGxXs9suRsXtfUda8Nec7oQHMEjiTO25+kOCrShcOJCULK6q/YZyw6DSDdE/uf6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDycmrdeq8nfRpK3ZqmUT/OHJK1sh71gYGwyP4GclJo=;
 b=XU6WFP4KEx2rdrd6Qb1PBH6b3O9xEtZKuhHQi6fgDRsIAKQu3Qf3z3M/ud5duCRzCXRtXQAPCrH1yHLmuO+seeNj+yUNDpI3OTyqZK9SwTlkX0m2YtIY9UVB7jPMFtm0eA9oUn+dmnQk7/MbPGn2N+tzpHmwYmxneLX+yXIBpFz2quENkIG6gvnT2SEWQVEsf3EtcEH7h/oJI9i8gHe+RDxNzBH2NVITQ0U2AjkGMPjxBW2iyncKHh1QipA+XXxxcE+qQQsbRVggnECzKgHSqsXAF6FyAjBJAk+TYiYVKxB8oPHc2+rVQA6be/9LLzu/FOod3fsMCqTBGEe27RrIsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Tue, 21 Jan
 2025 22:58:32 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 22:58:32 +0000
Date: Tue, 21 Jan 2025 17:58:28 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Linus
 Torvalds" <torvalds@linux-foundation.org>, David Laight
 <david.laight.linux@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/backlight: Return immediately when scale()
 finds invalid parameters
Message-ID: <Z5AmlJ8stVQ4L5jS@intel.com>
References: <20250121145203.2851237-1-linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250121145203.2851237-1-linux@roeck-us.net>
X-ClientProxiedBy: MW4PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:303:dc::33) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|MW4PR11MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dfc1102-b213-4eca-c2d4-08dd3a6f2101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IV2HyZKyO61wudH/HfSd/woVcbnPngjLMDofllzXbcs1ENFvIRc9RNK8znWd?=
 =?us-ascii?Q?kazFP/Ikc503gri3e0pUk1EKZSArFI5RJT3QzRBnKnW4ac1PUrDAm6qycSaf?=
 =?us-ascii?Q?FfyKfsLQYHmNgvZo68Vmecy61NT+JP63FsOcvddBOg4qbmdxiD9I0x7rB7bb?=
 =?us-ascii?Q?C/I4m1rGA/NS3P7WDwh1S8zUNEAN2PebE8488U4lG21Px8Og5qkiz+909VRn?=
 =?us-ascii?Q?VtnIgEA+u6LovJ+1cI2jj2ZKic6akR1gpYmxTuN7tSu0yK3PM8kKS2oeRuAU?=
 =?us-ascii?Q?fCWYxVF3H2Y4z4/wMkvrEsY1KKtu9tksDz9cYTSGiqBB/GD8VKL0IqIlz2ZM?=
 =?us-ascii?Q?IZN0KuMnDr79eMKvYrCRLgRxOvnr3Kt7ll8nX2wPJMIWkwkntP0vODS4xJPZ?=
 =?us-ascii?Q?Rj4rPWdAwZY9+mFMudefb1Pfg9LwkQeRXJWFFaFam1HusG7Sgm9J63b+JpWJ?=
 =?us-ascii?Q?WmsIFTcOsqKM0KtBxPm/+IaboZzQc4E2FsQxscjLAt02jDJApf7Vqsgr4g6I?=
 =?us-ascii?Q?1HEOCHLsotaoqFaIVdw6DMYx4IZlFW2TwUe3ANVYAYps9x6K+sSVJcWcJgUC?=
 =?us-ascii?Q?lrcvXfn1Y4iX4JWlqXpdc/UkKX1xbVk7qSu1V0UiHxtS4kItOGFfSdZLdpXy?=
 =?us-ascii?Q?Dv89RmIPnqJWVNR446IAbvM5jMWXG0vz1dNZUOHYSOwxi5MGgfI5IdrQUFBl?=
 =?us-ascii?Q?mHNfHW5HBSFlugyjiFGQMo3SfRZEvadVGe0OmvqhuEQ4com+Zx+wUrPIVMLn?=
 =?us-ascii?Q?unwBMll2Snd+sBBh2inpQU4s795JffWpAz18MjG9qLiqA924wJcOK+PVOj4O?=
 =?us-ascii?Q?8QfoNKVySKBghZE2fZ54jQivHizRnCwGs1Y5g94UpzlrtxmtSa04dNA28vdD?=
 =?us-ascii?Q?AjBeO3VGlbqrA/HN8uoqr0f4InRY6Q4z7ZuEbO6ZhYmlBNxfE3xViFyR+Pgy?=
 =?us-ascii?Q?hE6DdcU4lS7Wq9EpoXkyOZbLHclrl1GJ0WzoMkHhOsuqyeWCd6fQ8z7RwDjU?=
 =?us-ascii?Q?EZxltGvFHm9DygibS0lno2wQQN4UfOM5fX5xGAsmqV9DRCD2uVmDYFzo/f1v?=
 =?us-ascii?Q?peYE+tK3KzPDBDAHhyagXKhPJejuxeF++1BnTQgmxjqu3Y79+PwzDR+nGGSq?=
 =?us-ascii?Q?zNsJt+vDb42izwQFWcDEYA+jetKUC+ymmEcf5pDCw9x9nrM0PMH8/03/lfjH?=
 =?us-ascii?Q?StffPTvLsZIEJ0BmnTuvDOAWdRNB97j5pVKomxRn+TETC8JFGSNXP3aWduRt?=
 =?us-ascii?Q?6lqt1HGunh8OhA7Olv27Bd6UE1u/KRLPwiGGfBcVzwfQmJiNSWSRcxeTDtc/?=
 =?us-ascii?Q?ZtiAh4I248zCaypL/0CR6YNr1drX55RXuUtnvBm7V9Hf300UGQursnrTW0AG?=
 =?us-ascii?Q?XCvKKMeOC2sTnVrZ2E/8LhCwBiyD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E/yGOx7D8IldAq3dBkeSaT65+y/jlz0yqPf4RgAHei7EZdA+SMyxDPsyOzR5?=
 =?us-ascii?Q?r/lxcsM9kuN9SQ+8NF1LoGG/cL7vNR/0eY53mqTaV0PPkaEJ3l0xgcfVRbEn?=
 =?us-ascii?Q?BGR2zDGT4iyQEvZzFBZXjSc9DKz8kOtk3SoG7lRkZJzgsqcdM91asNCyoPIz?=
 =?us-ascii?Q?jK9C8lbFmxe3+O+hEA7DBRXTUziVFDSA1C6cSP1vdDNH/5SfDPDaMVrBCuSv?=
 =?us-ascii?Q?JfqK9as2xkHWWXDy8VMd+NRHd5RPX1GRgvrB0xtI/lIDDBWWbE+tgmH4Dqcz?=
 =?us-ascii?Q?LDa3WIhZ9LREwZFhkdFGhijCrB2bpw36Gvlos0/m+t2L7MTpKW7s4TpIln0o?=
 =?us-ascii?Q?eZtjXXdvOzVi50yMU49VbLb+yQjUiHmZRrRq0CIhuxWRWNU4fsKcmQIAEgLz?=
 =?us-ascii?Q?AecArJnm5hd6TpRMy6AicZLm7Fd+/AToN2A52mP7rQGEzHnErpoueljTKWUT?=
 =?us-ascii?Q?3MipLyqwdrDmUXvgqUSeZ08XzICn+U7EC0XPNepw9stdEtYNIk5cO75ltwd4?=
 =?us-ascii?Q?Xm5SjLh/CY4ngV/Q4lbFd+691+VXR1HWcxqPj3fcXlTWv4JwMmhqHLKvqtxA?=
 =?us-ascii?Q?GScLvDYBeXhk/dIPqMgC95cIh4wcuBIRiHRKTQv5Ch/6AOcNeAcA5qRh+Xen?=
 =?us-ascii?Q?wfiIVV0mgyKDKZ41NP+heBQlCfQsUJI3jhSuWXuic0kHSbOmjJo1fI2/UB+h?=
 =?us-ascii?Q?KWY7ffQGAG/I3s1trIFnctiz59IS2Ia0IrYC2QsBUI8XVRBYN01Zqy7jLZ81?=
 =?us-ascii?Q?npIpwuVsaas8wk5+89Y94OuJouci8TwPKFpsgTfGqG5jtSXlJp7ruavviOrB?=
 =?us-ascii?Q?UGhWrYjAUYfWMeMFoROe9hj00iMwQYrIUOJjmLgJY7crrq55mEkRu1/B2C/0?=
 =?us-ascii?Q?7xB++5tCQdrISn26bIkiJQzPpN64qvlR8pzbAKV4vxjFyWuKdtMFJ4ovjmb3?=
 =?us-ascii?Q?4h1R67e2j2T3p92Dxz/oWgnp61K33MbDGmaBhzDOCKY4GT2QSfULOCMng4lX?=
 =?us-ascii?Q?xWSW3FdiFVOxRi748XmLDPhZFA9WxkISM5xkQ6s9owLp5k1SEVhOY7Yw+5np?=
 =?us-ascii?Q?95vPIuvSrPfs98xKKnP21FUuiga1HOKgBvbcui2/lO5lTaCqzPH44ALUvAJ7?=
 =?us-ascii?Q?dzM1RhG1EV4kPE7wQnUBap5pkFeXj8zRFmC8j5O5eKap/ZnXZf0QvP1X9jdI?=
 =?us-ascii?Q?WHJixezQREjLeUdfYd51raey7l86rLjd/PMoe4DonDayABXBX3fueeIMEaAb?=
 =?us-ascii?Q?o0XsJehHz1h84TcZ8jJ9ycp7VFvsETHmh1z9/vP1M4LGnsY4QnusltVBTBVl?=
 =?us-ascii?Q?ubAhom4uN4oo8iTuwctsGzF+Sh8Lrh+rjcN4IAbtkVLjX8EjvkQCF1HIYRQq?=
 =?us-ascii?Q?F8tacxcinFL6QnDwLjiZcXOebF1b2KZd9oA4WTRUT5B6eh1BClcoKKQVj9vP?=
 =?us-ascii?Q?klXA3jUU0kOdNrtRK4+qMzip3/u4YG0Hcw+/Qax5+KgzGj5puoan6CBKPAah?=
 =?us-ascii?Q?N927COApullVMZa/AbUCic+mA7EmcsH4iFRw7EkHAp8wZJLK+VAQR4OjNCfw?=
 =?us-ascii?Q?lrx3fWH/bYoIf/mrjj5JoOXxmPqPZqgaunngPJ7JQFV511iJgL0czWgKVssh?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dfc1102-b213-4eca-c2d4-08dd3a6f2101
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 22:58:32.7821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fVJef2KboinSY+AzNLNBLwxz9USZKt3kwaN2Vk1BncTY/nRgMAHmJ52V7p/Pk8bRhrEmLWoKX0Nd2clkW64sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5821
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

On Tue, Jan 21, 2025 at 06:52:03AM -0800, Guenter Roeck wrote:
> The scale() functions detects invalid parameters, but continues
> its calculations anyway. This causes bad results if negative values
> are used for unsigned operations. Worst case, a division by 0 error
> will be seen if source_min == source_max.
> 
> On top of that, after v6.13, the sequence of WARN_ON() followed by clamp()
> may result in a build error with gcc 13.x.
> 
> drivers/gpu/drm/i915/display/intel_backlight.c: In function 'scale':
> include/linux/compiler_types.h:542:45: error:
> 	call to '__compiletime_assert_415' declared with attribute error:
> 	clamp() low limit source_min greater than high limit source_max
> 
> This happens if the compiler decides to rearrange the code as follows.
> 
>         if (source_min > source_max) {
>                 WARN(..);
>                 /* Do the clamp() knowing that source_min > source_max */
>                 source_val = clamp(source_val, source_min, source_max);
>         } else {
>                 /* Do the clamp knowing that source_min <= source_max */
>                 source_val = clamp(source_val, source_min, source_max);
>         }
> 
> Fix the problem by evaluating the return values from WARN_ON and returning
> immediately after a warning. While at it, fix divide by zero error seen
> if source_min == source_max.
> 
> Analyzed-by: Linus Torvalds <torvalds@linux-foundation.org>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Cc: David Laight <david.laight.linux@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I'm pushing this soon to drm-intel-next, unless Linus want to take
this one directly to his tree

Thanks,
Rodrigo.

> ---
> v2: Simplify code to always return target_min after a warning,
>     and also warn if source_min == source_max.
> 
>  drivers/gpu/drm/i915/display/intel_backlight.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
> index 3f81a726cc7d..ca588bed82b9 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
> @@ -40,8 +40,9 @@ static u32 scale(u32 source_val,
>  {
>  	u64 target_val;
>  
> -	WARN_ON(source_min > source_max);
> -	WARN_ON(target_min > target_max);
> +	if (WARN_ON(source_min >= source_max) ||
> +	    WARN_ON(target_min > target_max))
> +		return target_min;
>  
>  	/* defensive */
>  	source_val = clamp(source_val, source_min, source_max);
> -- 
> 2.45.2
> 
