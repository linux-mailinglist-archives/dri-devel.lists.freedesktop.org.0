Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 263D46D299D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 22:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A41F10E431;
	Fri, 31 Mar 2023 20:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0466010E431;
 Fri, 31 Mar 2023 20:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680295647; x=1711831647;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3jl4xVmjaIGFyJwnLitPGrve8y1XN+Yfzx31pouPJNY=;
 b=nJl0Go8JAgm2QHxgHrs6lIX5YFf4hLkfI3N1drmMqvwVgXn1nLitw7bs
 17ST51vOmMdPm54tgtBl6+keFrfhN5OLjsK9zCX1Ev+xcZ51ViGgoizpa
 Qx7LW9TlRNc7D44+dVnML0QzC5WQaEYWiYkTBcvHJrfdMnEiJx5mWHc8Z
 rS9PVeT21dlfCrgwPCznDxFO+M9/mS0qviU/4nDZrKjHrj1BV+w1/YKAW
 adcxF3H1/j14cVAI69NlyxwJ3eiu3YVQm7Wtj6oJBGt1osGgAyrwDhK5o
 42bOcyETMRRu2qSavw6PixyI7W3Ib1erpkjvSXodFXfqNqX6yr6EZQDs4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="339051301"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="339051301"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 13:47:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="635417737"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="635417737"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 31 Mar 2023 13:47:26 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 13:47:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 13:47:25 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 13:47:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y//uc7ZFcUI6z/DF9i6FdSaQLnwvl1h3Dmc/tve9Ppt/xTNDIrG4zGcKTNdVSwuaSAvlj/h0XRDhsnXhRbwdXha2XfCQ5TfhGCBk9IiGXQ7eV/f1GosGPBNar2in+ZXR5snlER4HCHafzMd90EjY6QXh9cBpGLxeZDD7ov7+8LGBB/PdPDiqP0ZHl2prCMuTero+xsZj8rg4KQ+g6Zyrl00oStXbOdxlOm3CJhd3zJX9Hes1fmU4n8+QQBQ1URUPOuD1Qdo3KTTrqQ3zjlONI9/I7tcXKUT9tM0mGRBWUNQAtlTbkkxvcdWVMzannyypP1ba8/zZVkvMzTG3ZnXXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69dfTOw3cz73pghqbI6Ixxk8ariGOJsnqdfAHR4fPy0=;
 b=aNLBqiBzgkfjHPBu86mLR/S2ocHiIUbvKg6ZJo+YhCfnV7bwAFOnZ+7pINBVNZORVkYB+PU3wXF09Mzo+MhI/N21BH7ZPKgVwPdrEpq5Y+uiR840qGSknNZIU1ELoHO0xgsBC26xj06Tt2OfSmnRlA57CIrP9NfYUIihxA9Ff86YhCsMcUeRhbAG8UOiX4nguWyhceJbqfZCE6foOUcJHCu0xwWQARalcyHcx7Jc/SICCat2BPu514O5I4ItDNVwab9gIQCRbODnsVwwUMK9LWKOaVT2cKzjW600YGBWnKQphYM/0+rVjjedAuOMuYD+DwdGrvXZzcGuH+hyDeIBEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA0PR11MB7882.namprd11.prod.outlook.com (2603:10b6:208:40f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Fri, 31 Mar
 2023 20:47:23 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6254.024; Fri, 31 Mar 2023
 20:47:23 +0000
Date: Fri, 31 Mar 2023 13:47:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Fix platform order
Message-ID: <20230331204720.GS4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230324051754.1346390-1-lucas.demarchi@intel.com>
 <20230324051754.1346390-3-lucas.demarchi@intel.com>
 <20230327170238.GJ4085390@mdroper-desk1.amr.corp.intel.com>
 <20230331131955.qunxulyrz2ruddja@ldmartin-desk2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230331131955.qunxulyrz2ruddja@ldmartin-desk2>
X-ClientProxiedBy: BYAPR06CA0068.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::45) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA0PR11MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: 5714c5e0-4a59-4c70-9279-08db32292110
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XjHMFgTC3kOJRsu0o6PR/uehTA3l3NS4dlJ+4KHUAGbrYB/C0ewHfYEipR1Pq8Cm9KlJCgnDrOJhw3rE70yKsfU3Ix0jUyhbj4FU7dGLHojH3BXfvJ7Gpie9azYGIYxAmG9kenc2r4p8pPO+E9DbL1225U1Xn6XgtTUdtQHSRWIl7FH4mddZ9RY9SG/+vh66+Rr3TaNeVx0EAKp5F8HDgK0Ipb0Ar9KlxtJvhqvbmbQTTaKeFMxfZnNHz+/2ogTWb5QvSRwpc79FJ+ZvGSA/dDWAO0MfqO/pyNsHK6Jwu3SgjUAJCC2XKIPOqJu019TchJnPOq02mB6pLjWM8vxcgK5Bh0Zafxpj7+DAD+QMEYhw7+F0SMkSYTcqK8KtZGZ9IwH5Oo0Fpbb0gLHFoHY9m/Be3J4y3i/iLGVxG0+4+JjBNjIoyDqQSnyhoJrEhAWdP6hFNmSgSPxRIMSeO5Wgck6wKFWjywv919SjSbkWLO4p+iofqmr4yxg0LrQcMsqZXyrLTJmDt0O+WdYirwi9OVdKCfh56dL448wcxfCakV6dEpJ0sC4SqE13HPzDPCFk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(39860400002)(396003)(376002)(366004)(451199021)(33656002)(6486002)(26005)(82960400001)(6636002)(38100700002)(83380400001)(41300700001)(186003)(6506007)(86362001)(316002)(6512007)(66556008)(1076003)(478600001)(54906003)(8936002)(6862004)(4326008)(66476007)(66946007)(5660300002)(8676002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JgqGpRdJNq01EqSYhDAkT9FZLEedrQZxHKqxs/OC+6zOXCjyxc2Rv0D+APdG?=
 =?us-ascii?Q?ARkfrWHwPEiZdVZBLQcoVaIFZhoYUs9PIq1I/cpP2Ff8ZHbhZrn0mWUGUWEL?=
 =?us-ascii?Q?gRe6AII8wbuspZf6BhlkV9nb3W2rWu13bP5pYaxd/kWzYld2CH4bGx6vXIWQ?=
 =?us-ascii?Q?NYM/pVzH8F7UgO7PA9LvIUJn/KyuIP0RwBzHzRdE2mz2Bl3H3wZfHg91xyZY?=
 =?us-ascii?Q?rPMoe8Kzhh378juc3Io+MnTOmzCQZ49hBOsy538ZtaeKL4wFRLxH7zOOFRnT?=
 =?us-ascii?Q?c06LId+LPZVLV3XFaYKZcjinsoFQyY2GkHO+mU4jcbgQayEE9fShj0pz7cIP?=
 =?us-ascii?Q?n3s0u+9j8ry0+8Tf7pOBufeiA4djsBLmdmv0uZn1dJYGWNwJlL2p4Grqbmzb?=
 =?us-ascii?Q?4ftxjaBCi7S5pxVvph7VjQslAMb/eASNch6ntnViJqp4ttlxq1eUEJedg82T?=
 =?us-ascii?Q?OtEQgXPY8mSzKNiXo6Yu/cLSsXu76ubLEBNQTKRetMzXFHaudtUAkU8Tsyh/?=
 =?us-ascii?Q?58jGfBl69lLy/xr8S3oR3ZHCWp9SZlTsr+5TI9tYI0qqX287Zx+o5UDlwRfI?=
 =?us-ascii?Q?TEzwOWQnHv8iSqJi/iLpWAh7LYAmSm+ngRDscAJ+5H6TRdqFX/qQBqgygxox?=
 =?us-ascii?Q?AjGeA0PMo0x0ZCaG9Bs3R1szvGnJ6cPDTB2LBQMiKhYw0Y1beBmtbKTENW9K?=
 =?us-ascii?Q?bje3gQoF/PQq7rP9nee23FlnGdfkNStoP3g+0tDebM7bdz8wRztB9wX8oF5N?=
 =?us-ascii?Q?VcIhQuwxbm3J0nuJR+IPoYn9s5bFHGTpUWY2YN+4aOJnH+/f5oaSdxSWAJW5?=
 =?us-ascii?Q?Gouz9F71Ewf2etyHU0SuEaRh14btg/hGg5tUU44WhLGF6Yht5fFMD2uvRNm3?=
 =?us-ascii?Q?3eTix8QepmMB3O9GDDlLa6Qj6ZXvLDBXq9QF3EDjpZmGOywvjL7unc34IHRh?=
 =?us-ascii?Q?xrlrBtOKFa89y2RamH3T85C1xs0+WcJgO3q/EQjGpYF+EY/58Ecm1HP+DV39?=
 =?us-ascii?Q?qZ/XH9J2EQTEtRvgAX8V5oL3z+itEHL4JMULdKltpQSkEDE2XwmPBvBkLtEl?=
 =?us-ascii?Q?mOSRw3rJEbV8zi9ktumxCMFJztxYu0tSJfiZkl6GCb4yennCdN+nBdccklI/?=
 =?us-ascii?Q?RepLet4J3SnP5BfrF2Z4U+ONjy80+pRvcJVSs1ITiQnCx9JOYnQF2pPGyWPJ?=
 =?us-ascii?Q?YQml2G4Jj0JGxCdL0vPxdIf3f1qDLDc1eYZ34yfX936IVPk8BDA1dnMjERF2?=
 =?us-ascii?Q?whUfbndLu9NbsLrkWomZqThwkxj6mwlNdUugMOkq3cphA0cHUgJLTbtjU27y?=
 =?us-ascii?Q?/gxeqsAVB+7FQVafBi4mmnvrkK3e4iqSDnKeE7nMru1/nAWq7IDhVCHLh/Hj?=
 =?us-ascii?Q?xDiR4RGpCE/GaV+HDOxVLCoTmAwcJI2SY/NEk4GWqJP+0y/7SuJ6Z7VfWl6O?=
 =?us-ascii?Q?m/OuEfEOdDsdTuONe2GcBj+5LMYMm/FKJu3umSFpXUOOXPHZfBeF0SuMLHbr?=
 =?us-ascii?Q?6EkenokPCNm1+/LWNxtqHbW0gdRpczHccf2wr/m8yTjD9KZyJQ5uAh44+gYB?=
 =?us-ascii?Q?n+Qq8m29bQgdSu6Cg4+7/jtH+2kLZN2YTxarLswz/8qH2st8RrmX9mXG316d?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5714c5e0-4a59-4c70-9279-08db32292110
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 20:47:23.4354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5neEeWloLeIdBV0DWsVq0lbaA/QSrcJVn7eraNnFgKImgyyAhy4EPOtkoDSa9Qepn+FMToaoZQ0BnQz7c0p5axfB6cer/LoAG0mygszrgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7882
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 07:22:06AM -0600, Lucas De Marchi wrote:
> On Mon, Mar 27, 2023 at 10:02:38AM -0700, Matt Roper wrote:
> > On Thu, Mar 23, 2023 at 10:17:53PM -0700, Lucas De Marchi wrote:
> > > Platform order is important when looping through the list of guc
> > > firmware blobs since we use it to prevent loading a blob for a newer
> > > platform onto an older one. Move PVC after ADL.
> > 
> > Shouldn't we be moving the ADL platforms (graphics versions 12.0) higher
> > than DG1 (12.10) and DG2 (12.50) too?
> 
> question then would be:  would we be ordering them by gt
> version?  Or by when they were introduced?

Since all of the platforms here have the GuC inside the
graphics IP[*], then the graphics IP version seems natural to me.

"When they were introduced" would be identical for all of these
platforms for the Xe driver (since we just dumped a big megapatch that
contained all of these platforms at once).  But if you want to match
when they were introduced *in i915* that would be reasonable too,
although the ADLs would still need to come before DG2 in that case.


Matt

[*] MTL has a GuC in both the graphics IP and the media IP.  One of our
questions early on was whether the GuC IP itself would differ between
the two GTs (requiring different firmwares for each).  The response that
came back from the hardware team was that that's technically possible
with standalone media, but at least for MTL they'd keep them identical.
So for now, just basing 100% on the graphics IP version seems fine.  In
the future we may need to stop tying GuC to platform at all and instead
match on the appropriate IP version for whichever GT we're loading on.
But that's a problem for the future...


> 
> I think it makes more sense to be by when they were introduced as a
> platform in the driver.
> 
> 	1) what about media/display?
> 	2) allow us to always be appending in the enum and elsewhere in
> 	the driver.
> 
> Lucas De Marchi
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_platform_types.h | 3 +--
> > >  drivers/gpu/drm/xe/xe_uc_fw.c          | 2 +-
> > >  2 files changed, 2 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
> > > index 72612c832e88..10367f6cc75a 100644
> > > --- a/drivers/gpu/drm/xe/xe_platform_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> > > @@ -9,14 +9,13 @@
> > >  /* Keep in gen based order, and chronological order within a gen */
> > >  enum xe_platform {
> > >  	XE_PLATFORM_UNINITIALIZED = 0,
> > > -	/* gen12 */
> > >  	XE_TIGERLAKE,
> > >  	XE_ROCKETLAKE,
> > >  	XE_DG1,
> > >  	XE_DG2,
> > > -	XE_PVC,
> > >  	XE_ALDERLAKE_S,
> > >  	XE_ALDERLAKE_P,
> > > +	XE_PVC,
> > >  	XE_METEORLAKE,
> > >  };
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> > > index e2c982b37e87..174c42873ebb 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > > @@ -43,9 +43,9 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
> > >   */
> > >  #define XE_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
> > >  	fw_def(METEORLAKE,   guc_def(mtl,  70, 5, 2)) \
> > > +	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
> > >  	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
> > >  	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
> > > -	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
> > >  	fw_def(DG2,          guc_def(dg2,  70, 5, 2)) \
> > >  	fw_def(DG1,          guc_def(dg1,  70, 5, 2)) \
> > >  	fw_def(TIGERLAKE,    guc_def(tgl,  70, 5, 2))
> > > --
> > > 2.39.0
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
