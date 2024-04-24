Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972388B14EA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 22:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD311113DA0;
	Wed, 24 Apr 2024 20:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3l+HBJw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66472113D9F;
 Wed, 24 Apr 2024 20:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713991860; x=1745527860;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4t7gF7UOQ43HV3K+hQWHwVmXm/e6fV++oPCxz8DKbqw=;
 b=B3l+HBJwWvQRa4GJLO5iMnGWidyY8pqSM/Eh3jYZnWLcskw4eP4ndVpk
 Z4I3NOrSNLC+8FcKBkCfyHn/MBtKwdgK/RgN6A8WIGXAZ3pvJWyfWjxjy
 GBxO532UD1mWlZkRcS7reL9IBdh1d0+658Kv3cnYQ78PS8tB4h0qBZQDY
 T7JanpN2EmFRPcTpY8SSBz2aH+wH2+Mm89KbVSeG8JhUEKl+J0/ikOr/E
 kc4bsPNTyhrFINDy7jcXf4k8LqXHesRCWCBgEAr454Fh7cMv2g1kWhOf6
 os1tJ+P7uhBijw+2gGXT/ibFWR0/cjPc0MPoEDn9c9g9cTt1bZ/2xl0KI w==;
X-CSE-ConnectionGUID: A4PXYLbASVySXI+QcTbkzA==
X-CSE-MsgGUID: SgzFRkchTk2hxIHy8Tb4Kg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="12583405"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="12583405"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 13:50:59 -0700
X-CSE-ConnectionGUID: 96NYI9ScQkGaDfl1aDNCXw==
X-CSE-MsgGUID: IGcnE6UfT6+FuC89dJ3yFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="24909497"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 13:50:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 13:50:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 13:50:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 13:50:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLzDyPAd4kupL8IaDgNNB/iEkbDgPk2A1T110+j/zkdV/q/Q30cLSnlMw7VZrqdACW4x/DBUwk6mj0jM/J5wozaQhjS9ffKrLZroYiwzl9oc8x7nvbY/kUCy/1ho609HIqTaNm7iRfip2xc33y23f5T2xWai7lBuvMwNOOx+/v4TdAEvKJ69iDyQxYzKoYRBCEK2Wchj41f4/LzoyIEDp8GY/Gg0v2ARsS27HK6ra3h0FpyVVGQU2OAapYMy0wJi8WB2TgAwG9hZpeNY36Gb7G9bjcllN0ok2YHltyN4xH0l+qLKxlTPlPAEHnRyv3y+4bw7Mypp6XQww6vLrovNjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNlwE5M79KJKKdv3qKShREXIJPMqIqtb6EsYaLd+10Y=;
 b=Rrw7h7faCXcaJP/hpGy3Hxqborq494WlSq2wzCo95QWbTp5GWntq1xjk6mm3AlwP2yZHxc0J43jxpTsIKEd884nWsLuqPmgxVHf9d4ulDqkHCe+wfW2y8kXcz7M5dGu1V1WSEHimN10Xm8qxHvnenLp8gkCXZsAA9drUveV5257kb+lVcbGkPmfgtqaDH1aw6EZofEivQ1CSd8IXnNGM8AGorYNtcAUUJBHewLaNbVqDU5I7r+qkmqXlIARumxWXngX12ikeDcRK67n28lL9yLHV9V2DvxM+TkpEJsvZeC2zNVUWlUJgFxKzPlIu9XfsFiifhxlf+SrorieFlRUjbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4943.namprd11.prod.outlook.com (2603:10b6:a03:2ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 20:50:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 20:50:56 +0000
Date: Wed, 24 Apr 2024 15:50:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Maxime Ripard <mripard@kernel.org>, "Jacek
 Lawrynowicz" <jacek.lawrynowicz@linux.intel.com>, Stanislaw Gruszka
 <stanislaw.gruszka@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, "Lyude
 Paul" <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Huang Rui <ray.huang@amd.com>, Zack Rusin
 <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/print: drop include debugfs.h and include where
 needed
Message-ID: <7pqc75kl2gezmqc22nsdhaurepvlerglb3q6t5omnyst2wx3tt@uoyrm62dvhpy>
References: <20240422121011.4133236-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240422121011.4133236-1-jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR07CA0039.namprd07.prod.outlook.com
 (2603:10b6:a03:60::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4943:EE_
X-MS-Office365-Filtering-Correlation-Id: 6944de3f-efcf-4a22-61d3-08dc64a03d49
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|7416005|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h35WclnviN78GoQ9EDqxReHLUF4c5t1nemiAlrFIx8qQBkIbIz5NPhe+N2CU?=
 =?us-ascii?Q?HBuh2eq0tDTt/LHNOL+x8UV0iNs/8w7MMXccQLL26K7EiprkJ+3OLLsSHBbM?=
 =?us-ascii?Q?p1BMz0YlRxm8HX5fe8r6DmEXLdXJmlK93jyG+IqumrkW3cLOcnljkDvYqjGj?=
 =?us-ascii?Q?sA0hmQc2CeX7xdmSZcGxKkeQy7AfX1g5EPLuKcwKXQGGycsiG+JYuRfyr2pX?=
 =?us-ascii?Q?k1RU14ubE5fdrMXwta1+3tnXhmtoS6Cg+tqyKZx7LhuaI7ArD8VKJ+3YfR7P?=
 =?us-ascii?Q?NGJd+PoCFocwQMSR9clwJ9T25lL6GZEs7JlWxjjGnC8s4JzuLGfoVv2Dhl7l?=
 =?us-ascii?Q?pL48OTDK8dTc+5n2Ys5jDfuU8jO3byuA0XiR84l/RMdBrDegxyG48FsNXoch?=
 =?us-ascii?Q?yzTIcekdRbrap2SOrNNEzJyVMkD2jT62OATxTLMNdhggsi8fcuMF/5TnrXdH?=
 =?us-ascii?Q?j+jaVDbTGrGIyCstsk7nPcIpHUBnhjFLRixQfVgUty0avnFW36mLjI6J/CEn?=
 =?us-ascii?Q?hnOUL4bdVz21EefZIEIuBfTOz13bxxF5FPXCHwUEXQLt8S46Ubh8EY2ahuJU?=
 =?us-ascii?Q?bZxsyA24IOF/tlQX7noBmwS9enuW8KSIi5a4f8xTqAQnQE9jBftXVxG3wqU9?=
 =?us-ascii?Q?VdDGdAm2VfPzCSiw/H+yb4TSoOyQu0i3tDIAZni3zt5BUI2KyNhVlDpeLG6Z?=
 =?us-ascii?Q?Sd2oj172Vr/Dh3Bg/3ZinTutQpB0gxDwASLsZOhb/NhphAtAaeMxsGncuUJ1?=
 =?us-ascii?Q?p46lL+Xdo418j6UOQd+ChZyvBwMsDpgDTfpCcgUQfmsTCYJOXfZubugVnc14?=
 =?us-ascii?Q?fNA8qecwYeSMoKS/ZvFyFELR+gHloL9Hd9MeHxzCZLFuB9KlS5cZrvMUQ++p?=
 =?us-ascii?Q?hRr9cy0K26YjoeVFSQXNMz5MSnIl+hKfRyXlKKghTZ4Q+3UsVDxVAA8tEYA0?=
 =?us-ascii?Q?ykfiVQTf5rzaolcVWS4RXrJoz6ZVOxayqQmfJV68wGltsywsn5gIwaa3WkE4?=
 =?us-ascii?Q?i/NWaa6S6NRdlT99kr16r+rrmBdbdRPoIYSFbCVYnAGotNGRy1jTS+mSo3IW?=
 =?us-ascii?Q?oL9sul0IBVUsV4W2p9Vwns/I/pKJuZTNiOb6982D8tAJKzXnrP1c9vbzVwcA?=
 =?us-ascii?Q?g0VCMSwSMFYIJ9xmwtn0RP9HalrqPd8ugKH00cNmNXFPCWPTZ8E+UdHt9Ha7?=
 =?us-ascii?Q?1i+Gc9Uk3VnVEEvpDgOtB+NozAkx5kIo28ULFUgUiC1Kgpujqe01NExJBWV3?=
 =?us-ascii?Q?dXfUElfMMEsDRXfZbV5qsDc71icyJwRHFvudt2k7Rg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aMW9QMWzrChKFqrmeqtgzLdxa/the7RsupJfD0rPMUby5RNnqCU1ypVB7Q0G?=
 =?us-ascii?Q?HVgAB5406al7Mrij6tmONcdY1Lph2kPYp88R8AU1v9v95nbCr/oLeJ7W7xrU?=
 =?us-ascii?Q?/nlu14XP23xkVDMiOvELLHV+n0Im/ztUaFkVBo3Blqr22nfzd1W3BB+qCRgP?=
 =?us-ascii?Q?DbSS+Bv2SGTH+j4NxnXINjv8zWlVneVX0tl+Y19rlgYvbTNzahEUJfL3uMY5?=
 =?us-ascii?Q?7TQvBw6lhp1tngbduWBoYwRVgG93oS+2OJMWyaXeKbEXeiu8++dwphTunrr0?=
 =?us-ascii?Q?q669VwxE4RkbAF+pH6Y5wY5pY1+5wqIJsvjrXmKqQlIe3rQeKqImCr6YojgA?=
 =?us-ascii?Q?DOSxC9wWE6dkGr9MeyQHuCGnh4RHsJy1eyoVa9o1CW7PijIn0dTH1Zzy6qLB?=
 =?us-ascii?Q?4PoGtyYW/SW5ySC+YpNW5wxEED6XHoysGyETc6sTi4EhTedI7i7vEegEdH9e?=
 =?us-ascii?Q?0arkptQPLGSNK46E871Y8hCP+osR/alZGYLQzYS9v4rj/cP71LSWQA1174oj?=
 =?us-ascii?Q?sZKQs9uUgMHEuC36TjXelG/CZLa/ikg4wDv6ZY4udpmR10nrXJe3qbTW0Sxy?=
 =?us-ascii?Q?vptqkXYhiboGeCFllXIaauo2rmLWrKPeDZqw85X6pbsWOowGSHnyyoUfd+1V?=
 =?us-ascii?Q?wOMuM6+kte/lcm84oudz0Clz7NOXaBxSB+kiFONyu7XgF9J0KAwZDKpD5fhI?=
 =?us-ascii?Q?qSdDxeTJw3LQ4/YWASblGLmKyr3K1lWoc2sHYIIBTaC39FChm6eJbvU9ReQz?=
 =?us-ascii?Q?Betk2EITZVYKraQCDN3GrBO/NNbnV2O0hsmJpCMSEL3LXBrcWt2dmvx6CRjA?=
 =?us-ascii?Q?SDe5wfYWpRXWBq7q+plhyGAy2R3R/Gb3ZRKyUIdm9kEtCm5T9+RTdGRJr5GQ?=
 =?us-ascii?Q?f+2oTzz4O+xahmS536gyzSqFwwI9B+ZlIQICKkAHvqEEtfvdAhAH8VitRdxK?=
 =?us-ascii?Q?8PZ9Ge8zLWdu1E2C3LzQbG8oVuVDlSBESpSfvYU7gArIuzMQpHOeLT8XG0Pq?=
 =?us-ascii?Q?9Jcm5VPOHd+qH1HTaL/hLPYakaOCEfi6LhMelE1iaQwp59fxvXDbdNdNnEpv?=
 =?us-ascii?Q?k7/DoK0my4GC+p9I23cZymCq/kdyKT6iKpRYyste2B/mvYCMI5G78KOwCd14?=
 =?us-ascii?Q?74HywSItRqFPKExPoXNZlSydim8UiFj3UklJWI0EjCqVDatOEEVLDVZBJRDG?=
 =?us-ascii?Q?Lf4iUk2ew25rr6oCwcHW9n0IEjG5XZlRnmLcahWhj+0JycUs8noooNQk2TkR?=
 =?us-ascii?Q?bhr+2Ds8b8UxI60nc5Mi6DMIq/6By/EfVw5iHkd5uY7GKq1W+VRa7m7Qg4Ll?=
 =?us-ascii?Q?F/wfOOXmD6GYuIQ+DAuv+zM/6tDX1hbd39hUmo0yr9TkPLFtdVmXCFJm+dQF?=
 =?us-ascii?Q?8IE18cUK71yPFhFfyv7EWwAZzc1rPRKk18lLcz7ZTuz/tU22c7Ac4T+UDdRE?=
 =?us-ascii?Q?Ix7onVktuXmRxpVwcEZlevbcARc6x2zaTKn0bJckhJrrVZEbvIasUQAm7dLn?=
 =?us-ascii?Q?/kQCpv/5yT6MODwiG88b6vYRWFu0VadAT/hoLkDFuQHZ1+M3i2sBzaxBueV5?=
 =?us-ascii?Q?EM+/x8laE0o7LJeiozFTL8IN3QSC9b4HbnHBp+W5O9GE3MMfv71G80d6tIRc?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6944de3f-efcf-4a22-61d3-08dc64a03d49
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 20:50:56.7474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TgrD4p6I+vL1R6w2teHf9HSLl5chkKIcDERXNhzQjciVRR+2Si5RrG45aJNCrgNwMJ3b9UJNOm5//ywZaHedNW2MMF3PwdijreuwChoYNZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4943
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

On Mon, Apr 22, 2024 at 03:10:10PM GMT, Jani Nikula wrote:
> drivers/gpu/drm/xe/xe_debugfs.c             | 1 +
> drivers/gpu/drm/xe/xe_gt_debugfs.c          | 2 ++
> drivers/gpu/drm/xe/xe_uc_debugfs.c          | 2 ++


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
