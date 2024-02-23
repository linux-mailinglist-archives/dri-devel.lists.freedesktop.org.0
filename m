Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADBB861C9B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 20:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5B210ECA5;
	Fri, 23 Feb 2024 19:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFC3a6Ou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFF110EC7C;
 Fri, 23 Feb 2024 19:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708716917; x=1740252917;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aeczCJuKc63iFp9tnnBWseHqtDZUJDrYqQs4Tg/AnoE=;
 b=jFC3a6OuJyP9lHsT2OiNrHwVgZ3xlss/5DAjP8O6O7h8rX4VlPFjvyOi
 GhDs3Zgd7rtjETcTAc/VerrqD+GCgwk5nK23g9rDFTbCmAW6ozwhbb5m9
 VvpuX3zDjvWWXpJCFoEB1SIfGN3t/m5FN0D8ahvr2JnwpGW88+TVsejYA
 Th2IjVtUvW6TFO1Numll+VGsASn/hzccWeFdDrj8Dp71kk1LjzQyw2MIA
 DPmVO8bO920Z7u18hCmNKoxOAZHkyZXFCFWPNdsO2/6Zvd/J35cwPLv27
 RPUVjlngaE8lSrLKc9u31RSvxVBFxJGt3FIs++YZLsHwbZsm6wbdBare8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="20495662"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="20495662"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 11:35:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="10668838"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 11:35:15 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 11:35:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 11:35:14 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 11:35:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VixlfwUXzf9M4iZ7bXdJrKcob8VJ4hzf8JK7gJBCT1KZR8Xc0ELZal4ZeqoH3jNZwOKToKLcQ2WLSNNuqXE3Jcd9xHHfpp0ttOoD5uc91v6BhR1bPsMTG1xFKeLS9v87fxhTXH4HeLq+Ic9u6G2kCa/tN0WphYkhSmUt24CLBfQOr8XUmXdnQ21It4PU2GMKTWssFBCgrSxY5G8fpZdR3jWsrw+UWzoHq/y3IAe2G3rb2Da8ES1f2Bg8HebKa1Gmtwbcuu1ZZAzpBQ+W49B/gSCfmEIGwTfDlEkcPYMJzRFbpadAPtqRb76zd6ZN8xfI3PliC8IJYjTNPizwKE3dBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oj/4ttWEMH3AHFdcf62eF+8GZbYcsh558Up1kDrcy7Q=;
 b=O1MUHmwkIzLudZvzKsx9LeyAugobR2NLoJ+EyTq5PreXis8UZB3EGM7qBH0vKEGFBazip8TyHxdj3gDfrziGNIwqOo87vSkPZ0t2r7bViowy/q8l2uDVyLVUiKlWBdYR7jExhQ9gwDAqlqb1W8KgXjCIwVaho9tf3Kmg7zdRs7lclRD8aR6m+KcD541k85FiN3Skt2s5XktjO2dOszv4mvg17iT4/6b9o6Or7+Xk61/6owMJRfvMKE/3mAz+GUjG/FIcIkQPD81rWFj9K5sUwDYCO9Nbp6keqKATA3+XETZOYEBdQFGCW7Kh8BVeN8QpGR5MmbK/gvF0Gf4GMM1IFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4929.namprd11.prod.outlook.com (2603:10b6:303:6d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Fri, 23 Feb
 2024 19:35:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Fri, 23 Feb 2024
 19:35:12 +0000
Date: Fri, 23 Feb 2024 14:35:05 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Dave Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: Jeffrey Hugo <quic_jhugo@quicinc.com>, Jouni =?iso-8859-1?Q?H=F6gander?=
 <jouni.hogander@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>, "Tvrtko
 Ursulin" <tvrtko.ursulin@linux.intel.com>, <intel-gfx@lists.freedesktop.org>, 
 <intel-xe@lists.freedesktop.org>, "open list:DRM PANEL DRIVERS"
 <dri-devel@lists.freedesktop.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
Subject: Re: i915 build error on drm-misc-next
Message-ID: <ZdjzaesUVxF-V5qQ@intel.com>
References: <fe8b2841-cbf0-775e-6e74-50476b652f9f@quicinc.com>
 <ZdjPRzGLfV7RAEYu@intel.com>
 <6ee1af5a-413c-1c09-5234-ceb8d8e605ad@quicinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ee1af5a-413c-1c09-5234-ceb8d8e605ad@quicinc.com>
X-ClientProxiedBy: SJ0PR13CA0077.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4929:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d4c5ffa-4f0d-4245-52f0-08dc34a68d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DvZk1DHhHdr1CiCFvn6v+d/4eT7GBO99Aqu6nmA9wuXdffbL/F+/Kv9o71a4a2SRudzcvDZ0AB+BUbwh22kiYxsYWjiUYImYLjT+W8JwHQB+iomVbhr6zaTaiIhnttfzru8tcX/NCuh6hhkhomU5KEbgkxYStfshi10QB3F+IqasA9raM/i0UhoG15xK1PyWiUMbUidRojHS5vUAm2YgMEW2GiduNPHC8ue2GvdhC+GOm8H+iEHoOQwh8TngIEOoGzF8vpjTwuvrWYxnX6mGFF7OPsTc/We9DOy3vFnrrPA+wXVaTFX2z0O6hJnA0E9aqbwMvv803Msq329JuFOtNUKUfNbwdTpIHakVnMZBxYR+bvxvd57rD6IlH/WGcoTbO109MsOWZI3u5uGUiQT/Uu8ywXpYgZu/mLBCxKrYFPsLNt2tSvh6yUDikeRxFDIC4fUGSXvIWYHihFL0MNxj9EmdEOXvlc06mqfkm1jIgaYqdRBRWJDYPCWu6x619CMwt+mnC59A+A6yRQwLLIDqqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm1qZ2ZVL3pRdjZldmh2akVWQm9pdW5qQXZka1JBaTZsbGlPR2ZHUjVxNGZx?=
 =?utf-8?B?UkxTd2VFVGVuZ0dIejYrMnFuREZiclJDeWloaGt0SWZSOE5HUGlPZGJPTGQ5?=
 =?utf-8?B?SnJUc2lPdnZEUlFTZ2FTWVNNVi8xM1BZZWlnWWVObU45OUpub2hLUFE5N2No?=
 =?utf-8?B?STRtYjRjRVZZdGE0V1BSS2lpUEFXMzN5VzR5RUF6NVZTdllZejJvTFd3SEVL?=
 =?utf-8?B?eXlKcWdkY2xjS0NrYXZKNGlISHgrQWdLYWxNcWZVeGlrdEI0SERFajMweXpW?=
 =?utf-8?B?Y2FMS2syV0oybUdvQVFZdjdhT3pmclZJaGtjOWJMUGJ1anZJMGhUSlNiZmJv?=
 =?utf-8?B?LzFLblRVSjkyYi9ialBjekxzeFlJRFBpa2x4K2pWOUs2eHQ2Z0hyQUtoY0hr?=
 =?utf-8?B?WWNIYTF1WWtNSG45MDdUeDNUY2grbk1ObGlEYzZTZ0lhNGxsWSt2SENNVVZ3?=
 =?utf-8?B?aDg4dm4zQkx3ZDZoenFWYWJ3c0hTNVJUYVJZelZEY2dROGRkNzZxTCtQaVRl?=
 =?utf-8?B?M0NWMjdtdi9sWnlTbWZCSHhXanZqVi84bXRGKzJPQjNwSFhERDdXZEtxa21a?=
 =?utf-8?B?MlU0V0xON0RRdldIcWI0cmh1TmptcUJ4WjlMcGcyZzNwMFFoelRsMFl6SW5T?=
 =?utf-8?B?eDlOcHNQc2JieE5QMmNQVnpxTjBZQzNBYndBa1M1RitxMG1DcGc0dTNSQ2xI?=
 =?utf-8?B?L0Y5dzNVbTlEMkhqcXQzWDBlMDVtUEdzUGlFNXZ6elhaWG1yVDUwam1pK1Zs?=
 =?utf-8?B?YjQxOGl0WWo0akdCaUFyL3NPN3JDclBoNzgzN2VMRlYwa1NhdHUyQ0NmTnlz?=
 =?utf-8?B?ZnFTcmMvcDZac0hTTmNHSHNlVXJmTFVwYzR0aGhlK3diUS9MUTBVMnFwS0E2?=
 =?utf-8?B?Zy9EdEh6MTAzelNEUkNmV0xhZzlNc3BWbmUzS3pvbEhhMk84emhjbFNnSWQ1?=
 =?utf-8?B?dnpJYTVubWU5amcxWWU3YWF6Q3l0dXlJVzBNVURaRnMwRkJRQ0d4Y2JQYmZ1?=
 =?utf-8?B?Z3E3ckcyYVd6WjFGNzIyTSs1SjJDdGhXTlZBZngyY3lXcTN1VTE2ZlVSVk9O?=
 =?utf-8?B?Q3QzYUorMHJ3bE5QQ1NGb1NqcmNQRHZGZExwVXorOXAzWmg3by9ETnk0QWdk?=
 =?utf-8?B?TDVwdVUwdEhDVzczTG9HeWgzYXFFN1dLT2ZBci9nTE8zS2FvOENETFFSUEtU?=
 =?utf-8?B?TzZhaUNleE5IckUxb3pZeE80SFlmZFdycUpVaWU1OHgvd3JpZXV0MHdsakZz?=
 =?utf-8?B?TG5tRFJSQjFWZjAxa2RlOUxnU0JtZ1g3M1k0TndoTzNwVjhYdDc2bGhCVElx?=
 =?utf-8?B?RGt4TlpJZVcxU0k3TXJRUEpWdlk2OUhod3VzS0RJV0ZmRG5Ua20xTWlLSmda?=
 =?utf-8?B?SzQxRlFzZzlTbTR6TGNEWVpsZUl3T2FBeHhnb3pPWjdRbWd5cVJTQU9VQXpT?=
 =?utf-8?B?UmYxR0MyVWlHeEZkaTF0OG9vWG5OY3BlWk4xenhrUnBPSkJIeEhFRTdJVVVp?=
 =?utf-8?B?V1hLbEFiNUJldHFWMEhGTFE1UFhLZWxUTlRSOVJ6RGIrZDhHRGIxZlMySVh6?=
 =?utf-8?B?bnJSVitIbS9VU0VVK253ZWJGemdpT2EzK0c2aHRUT3RjbU1Wem92NnJKK0V1?=
 =?utf-8?B?WEVHOEMyUjREZzViTWlSL0pSZE9qM2JGTXpZUWMvNklmQmNrNDdyUktKdU9R?=
 =?utf-8?B?VXdFREVqTkhaQVNkUXBGTUZQT1FKTUZpamhSYTEraGdNUTdXR1RBOEZQMkdB?=
 =?utf-8?B?NUNaYUVlQ2FjUmNvbEVVYzRUV3pjcjRyVTF6QlA4a1RCQnVZSDNPMkpEYnJP?=
 =?utf-8?B?K0laZXdYY1p2VU5rUktVNTRTWHdIU2ttOE52ZGEySzRVNCtoSnRHdnBLdHVj?=
 =?utf-8?B?akZQbVdVV0ZZM1UxZHh1dU5zUmxwSnd1cUxaR1RTK3hTZW4rZ2FMNFhWS1Z2?=
 =?utf-8?B?Y1ZnRHJrRnpnc1VrV0lYRWNXMXlHamQ0WjNuQnREYW9KQnNWMDN1T0NyYmVR?=
 =?utf-8?B?M3JVejZ6UnRmUFdsdGJ0TnNaS1MrVmMrQTl4NXZXTjYwT1lDTUF4ZHBzT0hu?=
 =?utf-8?B?YjljUVBJM3grcmVuVEpMOTVTZ2E1b1NPWnoxNTNUQTNtbldSb1hqSkdFMXp6?=
 =?utf-8?B?YldhUlowWXZiMUo3dW95bkRRZHlKc3JWdWhNeEFHL2c3cUZHTUFmRVJ3ZFBz?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4c5ffa-4f0d-4245-52f0-08dc34a68d6e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 19:35:12.4745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhZhbwNFmI/fE7PQqO1EdZetWAxwDqi2IhKVKC0DIfh+oEnQndB+N3Ahg96BrCJkPxnpF+2SJj0ebr5Ix0Y3FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4929
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

On Fri, Feb 23, 2024 at 09:47:11AM -0800, Abhinav Kumar wrote:
> CC Dmitry
> 
> Hi Rodrigo
> 
> On 2/23/2024 9:00 AM, Rodrigo Vivi wrote:
> > On Fri, Feb 23, 2024 at 08:50:06AM -0700, Jeffrey Hugo wrote:
> > > With the x86_64_defconfig I see the following when building drm-misc-next:
> > > 
> > >    CC      drivers/gpu/drm/i915/display/intel_crt.o
> > >    CC      drivers/gpu/drm/i915/display/intel_cx0_phy.o
> > >    CC      drivers/gpu/drm/i915/display/intel_ddi.o
> > >    CC      drivers/gpu/drm/i915/display/intel_ddi_buf_trans.o
> > >    CC      drivers/gpu/drm/i915/display/intel_display_device.o
> > >    CC      drivers/gpu/drm/i915/display/intel_display_trace.o
> > >    CC      drivers/gpu/drm/i915/display/intel_dkl_phy.o
> > >    CC      drivers/gpu/drm/i915/display/intel_dp.o
> > >    CC      drivers/gpu/drm/i915/display/intel_dp_aux.o
> > >    CC      drivers/gpu/drm/i915/display/intel_dp_aux_backlight.o
> > >    CC      drivers/gpu/drm/i915/display/intel_dp_hdcp.o
> > >    CC      drivers/gpu/drm/i915/display/intel_dp_link_training.o
> > >    CC      drivers/gpu/drm/i915/display/intel_dp_mst.o
> > >    CC      drivers/gpu/drm/i915/display/intel_dsi.o
> > >    CC      drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.o
> > >    CC      drivers/gpu/drm/i915/display/intel_dsi_vbt.o
> > >    CC      drivers/gpu/drm/i915/display/intel_dvo.o
> > >    CC      drivers/gpu/drm/i915/display/intel_gmbus.o
> > >    CC      drivers/gpu/drm/i915/display/intel_hdmi.o
> > >    CC      drivers/gpu/drm/i915/display/intel_lspcon.o
> > >    CC      drivers/gpu/drm/i915/display/intel_lvds.o
> > >    CC      drivers/gpu/drm/i915/display/intel_panel.o
> > >    CC      drivers/gpu/drm/i915/display/intel_pps.o
> > > drivers/gpu/drm/i915/display/intel_dp.c: In function
> > > ‘intel_write_dp_vsc_sdp’:
> > > drivers/gpu/drm/i915/display/intel_dp.c:4232:15: error: implicit declaration
> > > of function ‘intel_dp_vsc_sdp_pack’; did you mean ‘drm_dp_vsc_sdp_pack’?
> > > [-Werror=implicit-function-declaration]
> > >   4232 |         len = intel_dp_vsc_sdp_pack(vsc, &sdp, sizeof(sdp));
> > >        |               ^~~~~~~~~~~~~~~~~~~~~
> > >        |               drm_dp_vsc_sdp_pack
> > > 
> > > Is this a known issue?
> > 
> > o.O - what a mistery!
> > 
> > it looks that drm-misc-next has only part of the patch:
> > 31a5b6ed88c7 ("drm/i915/display: Unify VSC SPD preparation")
> > 
> > without the patch itself...
> > 
> > I couldn't even trace back to understand how the declaration is
> > gone from the drm-misc-next...
> > 
> 
> Looks like the issue here is that the below patch which landed in
> drm-misc-next
> 
> https://patchwork.freedesktop.org/patch/579128/?series=130145&rev=1
> 
> was based on top of drm-tip because the intel CI runs on drm-tip and not
> drm-misc-next.
> 
> But, https://patchwork.freedesktop.org/patch/572622/ is not present in
> drm-misc-next.
> 
> Hence this broke the compilation.
> 
> How would you prefer to fix this? We revert
> https://patchwork.freedesktop.org/series/130145/ from drm-misc and land it
> through i915 tree and can you provide us a tag from the i915 tree to rebase
> our msm-next tree on?

The revert from drm-misc is a possibility, then you squash
https://lore.kernel.org/all/20240223191548.392185-1-rodrigo.vivi@intel.com/
in and merge it again.

or if drm-misc and drm maintainers are okay we can simply add
https://lore.kernel.org/all/20240223191548.392185-1-rodrigo.vivi@intel.com/
on top of drm-misc-next

and on any conflict later the resolution is simply deleting this line
anyway.

> 
> > > 
> > > -Jeff
