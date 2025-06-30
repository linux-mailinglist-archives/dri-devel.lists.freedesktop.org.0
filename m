Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4166CAEE9E4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 00:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D2810E4CC;
	Mon, 30 Jun 2025 22:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="InliV42b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D840110E121;
 Mon, 30 Jun 2025 22:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751320884; x=1782856884;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D5/Hduw6U+EOyW7+qojsuVaZmcQot/e5c41FfAQujlo=;
 b=InliV42bkM4btLmfZyUA34jw5ud5q22XRGYhZ29JTROswEzbqd17hmlK
 XBUn8MemOlHiDnT+Mhmu0/BqNr/jynurZbiLhtDo3ZWz9dmYEfScuBa9W
 pnkcLwdgXptnuMQwa2GbS6eyUH0QRxcDTjPdYIq5+He/bwCqSOxrG8MkJ
 V8MUfSTJ4UPNwv/Axc98zwneGgR/d0xFcwHUXSJN6ELtdnX/dtRTfXsxY
 JmvsgziK2OHp92InhG2dnmRTT4iymmwmkRAU+ktebddjKy3XL0RcC+qHO
 A88qbWgMg7l1R21xshaw783hi7ath/XBy1jCKbKQy/lm0oEE29Gx2KRAC g==;
X-CSE-ConnectionGUID: YgUGuSGSQ3+4sN8nbukNzg==
X-CSE-MsgGUID: v4yLlnF0Sia05b+Rhzfb0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64162331"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="64162331"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 15:01:24 -0700
X-CSE-ConnectionGUID: 7GJvrWh7S6W/Hpeaaynn7Q==
X-CSE-MsgGUID: lYSyWaSdQxS5i+xJ2fynTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="153325955"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 15:01:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 15:01:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 15:01:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 15:01:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHMZAytK9cxUZJauD+L8rNDXRuzosqmDfFe+t7QRRGBGfcM7n2X/Jy5BTGmd0eqRIJeeBAp23Q7EKQrVWavwf4mye4VKH0QvfofrzgHsuKmgKZ/u7lIbRWLLXBN7IuOVfkhgcITep7b/E+mIbFRk8KDE40Nf40squu4CmyavL16tK0WaYGSbFHOoHyBO2hm7m9POEx7CWmDFoQPIgea9fHmJW5wyYup5/IfHbbCBvGVWGpVWziP7qJp48vspHkTT7UnDuhmcLG+PWbVOfKNvqVdzS36/o1muUVOOobUh+59Ry7sUFflT1uTE+ori6q+2cfG3SfSy0BUEVqEYYoc9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UXH+MeKyk818yIbJ+wiV/RxRBEY4wLIvcpa01D+YSU=;
 b=tPiKKzu5oiWGgXmOK0Oj3v3f9S1uyjhNH2KQBa3r0zwjt4sYDkcsvCCIEuk6xFN+LSPZOr2q9F0515cpvkywFmRZRXIeKgg0jSB1IbpSzRgJ2jbbIChmFIXCPwT+np0F5/zoYHMcstoCWdoqhTg9YpX0sgSid0UDGZQafpLT+nWqLDWQfJ7pjqRCIVUC8D9Qh83VaE8dg7fRhAPZ5kAS3L7cZAeEm5WEw2a1vDZ7DMtc+/udbAOAaMsHNniKduwPPFu3OYVwlf2NMFppSMb1or04VyHVdqa7pbgi88d6mpBc1ntSyxYR5KXiEJ0kJ5Qm9uK7gT5BDjcepWgI2ifk9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CO1PR11MB5139.namprd11.prod.outlook.com (2603:10b6:303:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 22:01:18 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Mon, 30 Jun 2025
 22:01:18 +0000
Date: Mon, 30 Jun 2025 18:01:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>,
 <daniele.ceraolospurio@intel.com>
Subject: Re: [RFC 9/9] {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl
Message-ID: <aGMJKUeri98Yjkja@intel.com>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-10-badal.nilawar@intel.com>
 <20250506181353.GA89958@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250506181353.GA89958@nvidia.com>
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CO1PR11MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: 1779a809-263c-4f56-666b-08ddb821a419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hRAvwoeK6kzkHSRs26faXvayUMqsME5o6CzwhN+oRATka3C4J8VctTTKp5Zl?=
 =?us-ascii?Q?YaIUY34fK6UXDpNOGCaJ1dybR2FWg+0Qr8YAd8yROwKeO/4l5SemYaDCkAb4?=
 =?us-ascii?Q?drQxbVs1Jwk6CYc1vFdL2plgLHOFfb1FPLj4UcxaRc9HeQlSlq2znv+2kP3/?=
 =?us-ascii?Q?gX0UB3zpoDQxs1SvDitp1XjBFjyRw5hNzV8SLG+rEgymBU7+1zbBDSbZsXNa?=
 =?us-ascii?Q?D7mqJwW/83effFkdFFhgJddYl9E4vqY8AVf5gnowNaUU7UUmtgL0NuNIJjxl?=
 =?us-ascii?Q?UTWBdn0mpD2iOP/GuN/badCBALGkukk+3jCVPgzLKr1UDoe3unuUdQoAm0t+?=
 =?us-ascii?Q?J9j/wxgyV7Wd9YVKMsM0uGZAiEGCruC+5Fmo/dXk8+jxchDyMbL7FgCWI6CP?=
 =?us-ascii?Q?Fol8AyePK1XVqkF//3S6QDRTyZ+pnJJkzA0frhgTqbDGI4MiuwoJpf0GhYPd?=
 =?us-ascii?Q?8Jy+gwk/LqmwFcxdph6l7FQm9IfscERnJaX4hWjLMLr7Fw+Aq6id4JgG1qgu?=
 =?us-ascii?Q?qZ7VB85L4rp5slFNXWferiD3XqS2jJ+wpi803uqPRvrF9q92x1pNOX0f7fwh?=
 =?us-ascii?Q?5iMFEPEetYaCAeNIONCgoYEczIA3jdXPkfCVSAIjWiRDTeIq9PXJxPLCwSGW?=
 =?us-ascii?Q?xMoyZ+4G2QTq994JnhVFDZRniT625CdhpnTimx0vPv55iY/VWlwJATV5Qh+s?=
 =?us-ascii?Q?2qIbQBbKr1gK/s+/3VIh9vCJh+RJeHlIInlqagU16Nv/n7uMR8OGuSJXlhsL?=
 =?us-ascii?Q?7poYu7/qJYOi5YLmfC8C0S3wouHFrNDBrrRIbrdQTnUYh5ApRekyWvovF5RR?=
 =?us-ascii?Q?RVdE60dQz9nYVQzS3m3t/UzvfJb9b9ROZNdCdH44woSq1kJsGzxO8gHQdyZv?=
 =?us-ascii?Q?nJVcaXEHVToSeZofUZhxppH78oiVEVhWYDneHkVpm+aK6MeWkWymfmUSk8v1?=
 =?us-ascii?Q?X+Z1uq54T2Vn0mntfkbLcl+RkUbbXUOccwAKEjjy+ngVPZxOZngH7srHPWLX?=
 =?us-ascii?Q?UG4WbSuoNrcgIfzJSLBi8U5HJJQG1DoGbsa0riQHYPAxt3b1kq+Ua7u0btbO?=
 =?us-ascii?Q?tJG1PQY72AvGhurH2a8CHLyl3rj6vQ2hhxVWsXFmMDMbr9WgGMrefbDX5KJV?=
 =?us-ascii?Q?l8t8ifmc0fS4D92S5yCiNQJEGnK+OMSiPAfIYBFphpFQIMUEzrIdNVXjCVi0?=
 =?us-ascii?Q?dnbjpR6Pdndzdxg8dU+f9nRrfqmlkDZ+MxqLBo2G8FmFORaOIoscGHODjMUX?=
 =?us-ascii?Q?WyhtqtE80J4OWZl9L2foBq2EwsfBTyxyuiQ74aB10rWykIjqHlUh7Xjps6bc?=
 =?us-ascii?Q?4fGxbeS8LXJws9wmAGw44EwES6UoEfkhahm8nOzs4AvKmn6YNee7Z+Cq61Uv?=
 =?us-ascii?Q?xf+o/t4Q60PRRPtTWqlFdyY60NMp0tmDBFo1FroflOQk1YsiA0xUp85O2mIm?=
 =?us-ascii?Q?4cCXFD2oCeo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nrozML/iF1Vrd/rzY3uxzSstghF4kLIzr9AnbBZAiDQGrB8BkA0NjZcXmyYG?=
 =?us-ascii?Q?IsKqbn9Nj32ptXmAMjGFrGOpOe1BYPMfdY0ro5zOghIeYjjYHEeg/fLhvQni?=
 =?us-ascii?Q?02syTqJFpcpkF4ME/sfb4Ubz/ieGbSr1f7nEnY7sJ0TRO6zzQ/PEW2brdy1Q?=
 =?us-ascii?Q?fBsJDvwfOUgq3Ev5E2n2sbR2wtJuN+4MMfMARP8hNbW9gHw2kr2UCdwRQUF4?=
 =?us-ascii?Q?rNr0rvKtDA/n3TSN2ZZtu+MnqqPW3VEVM+wXNvcxH8fsE/gS/A5TBNDDm6C4?=
 =?us-ascii?Q?S9Neg2zncQErQ6hO5f5GCoapt5IDNDkUv2HunnBPEwXn1+9jACdSYEjfI37u?=
 =?us-ascii?Q?BeW25xU8KxujuMfy22zxSJAlYJCTI7AIbvFjxSnN8AZAxUsQXw854Sph4/hX?=
 =?us-ascii?Q?DeiiKbPLD6ueaPAf4E/PfKprTNPpQgDa5ByWl+mvD/MMFVI4hUXyBXKYrPkr?=
 =?us-ascii?Q?aWL1fxdPHfEi6bwxL9vt7Kj+mUwDwUfEt9VLwFJPKu80niWJggWIcWmCi/na?=
 =?us-ascii?Q?GOa5B8HWudhaX1Ppeokhuy1KbDu+dcJEizyukc57j8fIgoIoY6ezDiwX44p/?=
 =?us-ascii?Q?I0zsTEfe+iYsEBc+WnNymjscabkfYolUomVvA2kH6tFAVH9s1FmqAxzlmcZe?=
 =?us-ascii?Q?8KgBmuw0kOtJf8TKM/Tak1fMqGbIcMKotDQi6tQX1g+qORkgybjqn4gahJEI?=
 =?us-ascii?Q?gVPz11rqFsJ3SnrD5Ch4Ty0+ncY0SicNilyMAZjQgAlUBga1BjGtoXasGS0I?=
 =?us-ascii?Q?Ko27OzKYi/Nj4AulrL831d2K7mJMTIDrsBB5Rjq3S5EjGIztt9OLSEd9BuGT?=
 =?us-ascii?Q?X43qv9vq35ACojyJDfn9ssqQpGPi/wrKhKnpdMm+z7KzpitxSUuRV5n7giyZ?=
 =?us-ascii?Q?bdO3UesowzHkbBG9cgAb5q0eMyyQkkYef1dl2QvGeFdb8L70ViIqgeCU1Uao?=
 =?us-ascii?Q?Lt/tOkaKNK3OYEXsyPIBlBopf++csLaiiWwAWN3qhBXBdymz3cXRmHfb/vmI?=
 =?us-ascii?Q?JqnAkTqPSKlpnsoszB38QmrgheM9er6ohbutsEWZssZEh16wvpszHp/1DXGi?=
 =?us-ascii?Q?qaJXprLjMX1VEe0KVod4ryw/v3AJU0dSkCJFTL9nujRbx41JzUew/yRzdh/X?=
 =?us-ascii?Q?9Fmy25M+G2jXEBB+z7b1pRl6Yar0iI3L2h9v8Dl7IkHzRIOhfnPs2tz2Hsbh?=
 =?us-ascii?Q?hbVOnQ8LBQSi4wCBAXFEmURO9X4YPhBx1QUUVRf7FZNw6W7GC1DLmNOCfDp6?=
 =?us-ascii?Q?IZbS9jCetLiaJX/6x4462N2Nt7neS7fK18jZWSWQ/cGKx/MwK91NJwbAOoFe?=
 =?us-ascii?Q?ldLMeNMwgX4OVWTey522kRWJArE72xknCog+T7qUmkgQ0ExHw8u624nT/MJQ?=
 =?us-ascii?Q?sbKX5EFE0FrHz14nmevRXSeHU7VajPlBK0EVfEWMN3etU4avr62aocVxzLGK?=
 =?us-ascii?Q?IWURB3Ti6/SD74xEE0RKFBv43kHAqGKDQcy0G+D7rpRxP+z7qog79etIlLyn?=
 =?us-ascii?Q?0LMszQCnyuV8cThBg0GHlSLYIbP+wOO+Tbjsw8TyvJ63iyWYltD65RPDtNeL?=
 =?us-ascii?Q?jpSulkXepOVNT5gswI5dlYazbyAEqFFnlN/0Cfh6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1779a809-263c-4f56-666b-08ddb821a419
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 22:01:18.5465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cKpRnWVR3MSNEt7ELq3K5qF8sfwzDq+H7vci5sV1/bNDikJP6Uw4DRopm3ZbFKov3kR5RkzWCqWnHi5Vcp9S5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5139
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

On Tue, May 06, 2025 at 03:13:53PM -0300, Jason Gunthorpe wrote:
> On Tue, Apr 29, 2025 at 09:39:56PM +0530, Badal Nilawar wrote:
> 
> > diff --git a/drivers/gpu/drm/xe/xe_pcode_fwctl.c b/drivers/gpu/drm/xe/xe_pcode_fwctl.c
> > new file mode 100644
> 
> I really do prefer it if you can find a way to put the code in
> drivers/fwctl instead of in DRM subsystem.

Hi Jason,

Bringing this point back...

Is this a hard request from your side?

This fwctl here is mostly the front-end mirroring FW, but still using directly
the xe interfaces there for the communication with the pcode FW.

Also, there are changes coming to pcode interfaces there to align better with
i915 and xe code sharing. I believe it would be easier and beneficial to have
this under DRM subsystem near xe and pcode code.

But, please, let us know your thoughts here.

Thanks,
Rodrigo.
