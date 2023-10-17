Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F7F7CBE0E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 10:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CE510E294;
	Tue, 17 Oct 2023 08:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089C610E213;
 Tue, 17 Oct 2023 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697532539; x=1729068539;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Rjtkw4gowAp29aYcz8cdK24SWVWl1lcefhpbx/R6z+o=;
 b=X7Ef937d8c2nuFyWAPQio1Rziawz/vvJdtClfANJtk1q2lv6olqMhiky
 hQmJE/urUsaBX40QkibW3/zcAM9NmsGpJz9yK7KLNVYriVD6mz+1FjDa6
 gZYp4NCs3aLtYSi7+Vunh4s4zHkDvpLrqJvIxg0RODoCGgrnoYvVOtVHQ
 JhDs5n+2MIVwweN90cOm3xjcDbHV8nlMwykk6zkRIY/xcY/CHNM3FNde1
 RcBpwfvLTFKbAGyJxxOFrKasV5uQ9k9fEVTt6vy1g9hakvy4sAcicz3DS
 9tD1+OLzz2LMdJ8n1y8+WHUN4SlfELMMV/q7kThX8kZP1DoEE6KqZBvSl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="382954138"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="382954138"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 01:48:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1087420549"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="1087420549"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2023 01:48:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 01:48:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 01:48:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 17 Oct 2023 01:48:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 17 Oct 2023 01:48:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERSSiTYDYXtkaXz3u+BzIADRT+uaEu0PAysR2O9TZcwOILBEBRHYJ4tOD3vtaBYxLT1/g99iOyg+hraKs+deJxs8VddhkAZaqBPvoUhj29d2r5QL+cTBYRQ6SB1oH23kpU2b6EOXF3sLib4kJyY1zIqplFtCKJpF72jeY4vekga88eOFxvE7ATrwwaGZlqTTpwkcjI0IFnY4ygJB3WK6K5TbT/qDAUdYIEVX+k6twI1uYa/XT7nVAhBisCChHjG+e+B8Z8iBF87jerrrljJ19VX9grFdMx58w2TDnYi3UdhqwKZqiSi+s4WOBedWipt3YcwoZs50571OVE5wYkPY5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBMX1VpmzBJ5yV52C5vIc4+euQ0vcu7gsHqe+5qJCzw=;
 b=eXX4V/kC2llMd2QE62uss736nbLC+ujSLx0DzwA7zAMDgsm3XkIfLBtIGsEigIFeywEwcgnkLJwlDKfu6n8G5bD0f6ScfK8hoGhm0lSgwsr5oYoPpUayMwZJ+YaK7/xUxxAlEtyDd+EGACta6ALTAC517t+QenxqJj3LQB2g0ipgciYFYTsLugeMsnNPPa/UJczrlfYYJooGI9CAd6l4hMMZ44oZqkvwHbx4y1jdaqq66ohScwUfb7/7WYX7DIw0rtGtFc2zpbmTrK2u7cnALa/Vrfkgg6XlQPvOY8OOu9C573LpWXgaaTk0bHbFhVfTDqYR2lGV1CYffqrvuFnCpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH0PR11MB4904.namprd11.prod.outlook.com (2603:10b6:510:40::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Tue, 17 Oct
 2023 08:48:53 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 08:48:52 +0000
Date: Tue, 17 Oct 2023 10:48:43 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH] drm/gpuvm: Dual-licence the drm_gpuvm code
 GPL-2.0 OR MIT
Message-ID: <ZS5Ka4WZLkmf5ZQ8@fdugast-desk.home>
References: <20231010142725.8920-1-thomas.hellstrom@linux.intel.com>
 <ZS49uJq9kqJ2ueOv@polis>
 <05ad4ca8-be19-ce78-7e71-48a02dd265c5@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05ad4ca8-be19-ce78-7e71-48a02dd265c5@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR4P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::12) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH0PR11MB4904:EE_
X-MS-Office365-Filtering-Correlation-Id: a77ea7c9-fdb7-4a89-49ef-08dbceede3c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: regW9EmuPo6YQg7SpUxNqhhfPsyiOKuw2KpHOSfyfHnnyk9GNwNkXt894CPo515uAvtHGbfEJLx0l/eXZJgdq9FX+FDDMaofZhbHfryOqhhm0aa4mNGPCiaeq02AotE5GRQniI4cutcFtIdLi4anwiuZ8C4HDO86UJOzCLJZ0D3HAv6G2uE93aNklcEBSOUZJnIoim15WFnOF2JzztEC9CqVpZnaoPl9L6yd/pb6asFTyfHomBSEbzudJNnFkpvR/qd0fYqfGcHgcID9Dhb3GFlQRkXsAy0wc0HKx/N4sqfbseGaZZQlT7He5ZLy9HZVpeayICQQeXeuH/6jdDwjQuujqaaDz0pdiCuVwHFUlDA41YHPEDeJK+qPbPMnjIClF0efSCOodiRYUMIWe2IuVZWBWOS/Um4jUefLfggDu6FCFSG66ULzTeEmObrj5tk1Ba34q5xl4MM2dr28VU1LTVygabspYv94n85GtV4WqqScgdKCSpaZExPTd9/HVBeZ8OG6vaVL6tBczfG9NQufMyNuMun/gmzhIWTBM/i4qGt2t0QYlV+apn1/FT7d2fU/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(86362001)(82960400001)(36756003)(6486002)(478600001)(6916009)(316002)(5660300002)(66476007)(66946007)(66556008)(38100700002)(6666004)(6512007)(6506007)(9686003)(53546011)(36916002)(26005)(66574015)(4326008)(44832011)(83380400001)(2906002)(41300700001)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?S4xnPA9J7/x6nSOzwQm/Y2qwMn/Q9HM1GUrtxkQGHpyJUmp33dZWDDbmD3?=
 =?iso-8859-1?Q?qvFtPTF9JQPbKb5I07FEUJrRR+IZ/NAwJKHbWeZPmXE9gxFnwhUXN9kxmm?=
 =?iso-8859-1?Q?xH80o9QPkqLa23+O4R/qQ8Bv1jjF53WGCrAdWrfxPlH2knI3Nm9q/1ffCj?=
 =?iso-8859-1?Q?ddpEaZZtKIW2mhqLWm/YvjD3pZwLR4pAo2xAJ5r6ZUUe5Kw7ZM9CJF5QO+?=
 =?iso-8859-1?Q?M2oufTNz41Utnw5p6v955/dfV58NiZ/rU+aJKKfqGXvyvTlbJUYbchffKH?=
 =?iso-8859-1?Q?eaQmbowhc36hGPl1ZR9+lCe5kP9y6lt4/Il8JAIEsq6Q7PX5Pv81cNFydM?=
 =?iso-8859-1?Q?r0i23NOl0xCki/Z6+/0ANC1/5kCM4EJ72F0K0Hqd4tR/Xb/sLs4VC6It5v?=
 =?iso-8859-1?Q?WgciyL5/jYtC+gw0cdNxT1hA81SEEewA1iQ4mtN47n/EPOM43s4M7Qn2on?=
 =?iso-8859-1?Q?gOS0XWWZKEbS0/3iXRksHqAQuE688hqQmbrHIWvZQ3StF36cI5dixyJJFl?=
 =?iso-8859-1?Q?fH19LpIPKD5J2pG6roMc/XS6viJ70qqs5E3kYmDcszv35/wFKPp1CAujFk?=
 =?iso-8859-1?Q?YGgraq8pTHE4V+ALsx7mIFu+FuhTBwZLZEn+K1olYsQs9mvklZAhZQ+jJs?=
 =?iso-8859-1?Q?DtNYJYB+YBcUtZnPUGW/pzu+ey7pcX0vq/MJVipMWBb8ZJYiNn5Dp6YZZx?=
 =?iso-8859-1?Q?UZs6blScU8sWuySz1e4sf1l+zj1SgF+0YxNZq60NHV5Y2ArFpb2g+Ufhwb?=
 =?iso-8859-1?Q?h9xyWTHZv9HjA01OtPHpdCzcNfARGQYmylUc/E+om3hGZ9s54v7NV0HsFh?=
 =?iso-8859-1?Q?59oSrlpabDpuo73MOcXesELcVRA1y1C7wQBeKRgHajjoMLtKBWFxV7Y9OJ?=
 =?iso-8859-1?Q?5OAf0CPXFOZqKYnZFfRH4dJT5sIPWY9iY3kj5rfmSKAGgoXETAHgXCuoo5?=
 =?iso-8859-1?Q?1sc7jmpOP/MjEHV6s2ro3Sy3YFEOnHd0E+7xVsgZQ8DaK+0QYb04YpWv5V?=
 =?iso-8859-1?Q?vCETOIRa9fIlV3Xq6oGnaCkwgPxUp7SHCKRrh74aEE4VJ3Jb1lBbKDBbUm?=
 =?iso-8859-1?Q?NzSkstTe+tLTd8sfRV5yCxU8oi6Sao7SOYjoRt/nc85pGYf+thXNcaqQnL?=
 =?iso-8859-1?Q?id92PSV19nTkHz25aLcXqsG8usjRKvB3hY+2vfGyRoXJ+eLuFd5W6fTaRB?=
 =?iso-8859-1?Q?E5NDaeOc38sprHRk+sG3rIa0zkx/0ih8y2ipuBWNt3TfjmqwqIBNbedMvC?=
 =?iso-8859-1?Q?3oZCJ75SccjTf5HpP60y42COOANVMgCRK+zJccSaCr0GkBzR9IxWAzjNs/?=
 =?iso-8859-1?Q?v9gSCaqS873hPOUT1F66ODPJqKLuNTIyQfg1zi3QcMbVaCHO/L2q9xe54b?=
 =?iso-8859-1?Q?B+W1HVn5i7EbpdZLW47N0PchiVJCfSGrL323D15wayRWt4C3LfkWpIK+K4?=
 =?iso-8859-1?Q?XY4hm2SALtARe7kjDmQXzKju+rD8soiBEa0NXsuN4WOJ6iBbeGzZwAfRzo?=
 =?iso-8859-1?Q?27LJ1uRCyBG79rt+Z8aI24R4AtBDuqoAc4mJ1y1OJd+Bdno4xPEl+td+YW?=
 =?iso-8859-1?Q?xqiD+KoFzdg0n8jjPiPfLcc6HK025Tq07aQcVrJhK1iq4/Cbb4lC9EMTc9?=
 =?iso-8859-1?Q?LPjicSi4lJcf02FSg+0dGy7m4BXZn/XvdRCdUVQZ79H4WeuoP+WQo0QA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a77ea7c9-fdb7-4a89-49ef-08dbceede3c0
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 08:48:52.7762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2c6atAGoMZYGcUsLhC9uQCJ0Gl2oRouJ4D2Z07XXOGYBBWVLTpNWtGOHa2OKrQoTXa/w1QSa1Yw53vuZhNxjzp7NIGc53EC0FNyXDihIyXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4904
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 17, 2023 at 10:14:59AM +0200, Thomas Hellström wrote:
> 
> On 10/17/23 09:54, Danilo Krummrich wrote:
> > On Tue, Oct 10, 2023 at 04:27:24PM +0200, Thomas Hellström wrote:
> > > Dual-licence in order to make it possible for other non-GPL os'es
> > > to re-implement the code. The use of EXPORT_SYMBOL_GPL() is intentionally
> > > left untouched to prevent use of drm_gpuvm as a proxy for non-GPL drivers
> > > to access GPL-only kernel symbols.
> > > 
> > > Much of the ideas and algorithms used in the drm_gpuvm code is already
> > > present in one way or another in MIT-licensed code.
> > > 
> > > Cc: Danilo Krummrich <dakr@redhat.com>
> > > Cc: airlied@gmail.com
> > > Cc: daniel@ffwll.ch
> > > Cc: linux-kernel@vger.kernel.org
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Acked-by: Danilo Krummrich <dakr@redhat.com>

As this was acked by author:

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> 
> Thanks, Danilo
> 
> Thomas
> 
> 
> > 
> > > ---
> > >   drivers/gpu/drm/drm_gpuvm.c | 2 +-
> > >   include/drm/drm_gpuvm.h     | 2 +-
> > >   2 files changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > > index 02ce6baacdad..08c088319652 100644
> > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > @@ -1,4 +1,4 @@
> > > -// SPDX-License-Identifier: GPL-2.0-only
> > > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > >   /*
> > >    * Copyright (c) 2022 Red Hat.
> > >    *
> > > diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> > > index 361fea5cb849..21bbf11415b3 100644
> > > --- a/include/drm/drm_gpuvm.h
> > > +++ b/include/drm/drm_gpuvm.h
> > > @@ -1,4 +1,4 @@
> > > -/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> > >   #ifndef __DRM_GPUVM_H__
> > >   #define __DRM_GPUVM_H__
> > > -- 
> > > 2.41.0
> > > 
