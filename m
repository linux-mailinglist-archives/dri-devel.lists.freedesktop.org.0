Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7395FF670
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 00:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C3E10E113;
	Fri, 14 Oct 2022 22:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D1410E00C;
 Fri, 14 Oct 2022 22:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665787585; x=1697323585;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MlJ3sNTYNX+AkQpAfVjCyte5szbUj4CRpPwioMn6FGQ=;
 b=bpttRbMBWNuyZhWL9CKcBix7NEMLIQttTZduUdPOPA6qD3W2xMJiWaM6
 7akI6mO3EcqeerCsqBZYZMp5/bG6y+uCnxg4G8l+CGMx84fyGMGgs7nFN
 VhH3OhrFDW6KnkojscLbgeyIKRgztyFpQGte5MWbtpIrrPFy5vOMvAiyC
 mYsTOuJ/5pCUheuvIZJ/NwMvtuOoAFRqoP164qZcJCZBJqS3Sn7pER+9u
 Be6h4y6OtCE25qIn959iILOv9KZxOUcWpSgvOHplULJ4VXrsI8Tllt3JB
 60lNN+iYEM+63TSUjfdPoFsWh6l8IBFseYAhK0Mia0hDz1lx+uKntd40d w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="306570529"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="306570529"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 15:46:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="716907452"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="716907452"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Oct 2022 15:46:22 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 14 Oct 2022 15:46:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 14 Oct 2022 15:46:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 14 Oct 2022 15:46:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSfEqIoKgeJXSpOvpCrT5EekteOGn3YTNvINTL++WUQayL9dhqxC/f5Q1NXQ1ePY+lMdIwi4fTjSKW82/d7Em1bS/jtBh1f4K2qEzCHKgqMcUr3c+NPJSrkAefpWampdRl11E0a0sY5V8Mf9kEZDtn47ntg9m1gFK91b7gg5L3jvXhBbQyTi1eSc6fpTGqEdztBmGIgXILmddcWjdsBWxMw5jRnT3idA7wcOjZ5mqSaOIcU0eDLVUwOKcKHr/0tgCueWnIxx8FY/jWbraOgzIOr7cZGh10HFJAtpu5+ACUBrw8XLUd1Y3rQcoLnHYoHXO+y1ELJqqcUaSwsAppFBWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfcgS24R7Q0h85CFAHmcj8/ZENzk5cB2SZrMdLmc2Oc=;
 b=AbdRU3WVKPphG9VvEvzNJf0Dan/ZDKmH/L4v10vImkDQwvMdUlR56Ur+soH+R45DV0WMW+WlQVGmZ7bMAI027zne/7RBc566i6wyGwFoKi5EpqMp7D8JoJG8TEVn7O8RNdqtGQWL0VJFpZY6ZCnsYA1M9Cc04nRrm/YbPbjNviGNCG2+KHhOKDxZHHo3cju2KYyCZn5+5rvUT8iH0hm8c3/CP7DGe+2obZCXjIYJxfJGEcqsjfi2BSLULfYqq4Vz8iprrdcvSgvINrtLPVrGBBoJ5wZgfvi+t4JPZoBSOMGNbaMTzaYxPVwrPvJfFubjTd97kuPq3X+3IcDUFSs9iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by CY8PR11MB7292.namprd11.prod.outlook.com (2603:10b6:930:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 22:46:18 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198%8]) with mapi id 15.20.5723.029; Fri, 14 Oct 2022
 22:46:18 +0000
Date: Fri, 14 Oct 2022 15:46:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH v2 13/14] drm/i915/mtl: Add multicast steering for render
 GT
Message-ID: <Y0nmuA5BmW/Bo4Hp@mdroper-desk1.amr.corp.intel.com>
References: <20221001004550.3031431-1-matthew.d.roper@intel.com>
 <20221001004550.3031431-14-matthew.d.roper@intel.com>
 <Y0mILx4Pm9kGQxs4@bala-ubuntu>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y0mILx4Pm9kGQxs4@bala-ubuntu>
X-ClientProxiedBy: SJ0PR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::32) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|CY8PR11MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f873025-0ed8-4235-c8c0-08daae35e87b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oFI45ke3HCnlhKUu7hwPUQbXPeP0WgSenWKNbBQswYKhDCqxjKEKIaaqiR2lYdt3pvhn1mVYu9jciOCac+VzQWppXYyZ7a7mmQgkO0WMuvMzw4Q2ow5dCwPMozEwAPuiZas/4tv2XhUrifuvua9joVBJHWHWAIuNL7YFHGGaC4s+eW1KBtF8mTGDcKc/8QHxVQrGcTtFzHWOMTG84J37ABpCOyi5cJ1A0j3e226g/qJ5PE173f5+LuFlJnPoRv0tBdd/EVgyXiZJyR4lL3Wkn7ObZThjKbAz06wRuVmLNeFPaI1iOPb+DwSCSYMjhhGtPGxMZi+d+U7UyG/VM8ZvY935lqCbPPnWdL2NjAP2g3ucFTaJfFohdsJ6K06bUh2P+zxSiEzWPRRyQiOkdkHcTHgUaUtMeDjQr8hsIPl19xDTtjc5suAVRilNGqveuzJ3YXP0WBfgC9D0DO/7yl/eio8IJ5maF59Vgzki67TAoShAz/YVMpxlCi3Rv6jzuONjJWd2QQCZyvL5LjVGhL+AOI3zuR2COnH0e4jf76fiV5BCuZ1UvopkIaX4kz4WGMrdz/8FvEl+SKuyaWkJOnbuyWsb4DswG3+zh+/KiOLqBLjAGh+pxQlHRhwigr1wHRixhrbhx/KO1Ieqwf0GouHuh6fcvbxbxpsU2Dl45EtkkHGNQW7GjOGjODm+OgTrMuHqP9f51nSEYLLNifJUWR43LQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199015)(38100700002)(82960400001)(316002)(86362001)(450100002)(6512007)(6506007)(26005)(53546011)(6862004)(41300700001)(4326008)(8676002)(66476007)(66556008)(186003)(66946007)(6486002)(478600001)(107886003)(6636002)(2906002)(8936002)(5660300002)(83380400001)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tkqIP54BHClmNAOuyByLnkedjBfg3G0R4teyalmYhkzqCfR5fiTcB9giQ0gG?=
 =?us-ascii?Q?3GWCooqQgejzed8+w2w8c7Jdxg+p/Fle677UqkQfWDfzngIonOPUbyzl/P01?=
 =?us-ascii?Q?NL6AMNqYUxk7LVKNqRPLEAB8T1GLncHv6fYTH0vrlurWu0mC12DcOA8TW9WE?=
 =?us-ascii?Q?2JE0Q3rCwmFEW94YXbADgNd5wOZWPqSrDphcBluLHlzRSR02Wq0RTN6lhQ0t?=
 =?us-ascii?Q?5HZAZBU3jyUW92jTl+a68Uid2O1Up96xiIoXx8vdsUeGluBCY9zYLpvpMIPb?=
 =?us-ascii?Q?whgey6p/z/SpLf5yytCP4fOlIETPwgg67J/jNDHLttprGlgwhKCLXw/bYrwt?=
 =?us-ascii?Q?EYkKAOCwaNrESYfiVMgWa26hUBW/AfiEaEO19c7XbRxsthF0RDuFIRnCXuor?=
 =?us-ascii?Q?BRY52j4SBlLuvDGPBSEwdCtun7aHBin7jEgMAN2AVcSmj5RqNgsFztZ1ZExy?=
 =?us-ascii?Q?Nf7UlcB5Wa3sjzx/rSfDBko7kadBRsb9R1Imdac3tWRJrWEVG70MKvyvZ+d+?=
 =?us-ascii?Q?6TVka5Ch+5tYLadcu6Dk4YB/Pb3GcOg61P5NJfBRDpq7Jw0jH+i1gZbI0fyV?=
 =?us-ascii?Q?WMekXQu3Y+e7HtGKCnfhW3Roe8n1hKBKEGTWNQwhx6WSVeMFczdLf0nVqRdW?=
 =?us-ascii?Q?CZkZxQ64Cwl6ACObXpxzCEC8d1VBYSUrnPZ8aaPdEWS3R400mD1LN1Q3Mwq6?=
 =?us-ascii?Q?RNGG1jkBbXgUkkwWAx13XbRUkl8hz/FOYOQxjsr54h/sfbAIGAG64hxidB9X?=
 =?us-ascii?Q?7d6UHjQwPt6hRE0IRl0vSFxPQF2OZf5uFR6jMENL24ZfZz/ww7mweQuISStK?=
 =?us-ascii?Q?8MTyPVJNn7sPgJffsAZ8iVr5pRWi1QmcLo/AxYQFJNwAEMTag5kEKZAXCcuG?=
 =?us-ascii?Q?MF3kl+P/wB+AnymLw5rJA+Db0iNK/bEGRjwJKkq6H36mbvsWaKAz6gqHLSEK?=
 =?us-ascii?Q?pjs8gXmoBwxtTDDcc9PxRDtOIDkm4JmLEVOwGLqwprrEoURM1lNGPULZqhTn?=
 =?us-ascii?Q?4OGuX3GvjVcN4b8VnRFTfDhXgrSJe9/5RbIaqMKmeE/AcWlp5du12AQe4zR0?=
 =?us-ascii?Q?lM3e2yjnmpoiNFKGSXrtIZrST5xHlNrPY3B6yYSknpsGkTIwwQZDGxzL95xW?=
 =?us-ascii?Q?2uAxBvpGcd4zRSVyOxkvfu7QHD9cNK2Zs+qnYMNeypvRLZX83MR7QWkX7+fz?=
 =?us-ascii?Q?ZeS627VFfqPq8+FPmxktNe5lZs/d5yBllr/gGHYxcXuRx36QZjSUi9MEtBZo?=
 =?us-ascii?Q?P3NBVOxcrdUpTevUBb7ydGVI2dTetg6fhsHs4CXtm1kBRg/6OkEnZDkWyZr4?=
 =?us-ascii?Q?iz/k74mpEoN2+T76bZeVW+94S65aSyrm6GWurAm+aaZmtdfJexefrpIoaq+5?=
 =?us-ascii?Q?a5iLkl6AaCEpRJCkbMwfnuCP8+vcupp2cYisaZl1BjSwQgQcdA5Nug1g0l4l?=
 =?us-ascii?Q?4U7NmISdgcQOxbdJHW71+pWs75zghKYYZuynTxDYdWnoqw6CZEAI0nMsmU+Z?=
 =?us-ascii?Q?5tTI4x97BFpG035MeGTZV5+AYH8Ui/fwGgv47BFfyMhmcmArC0uLkGCkRMwd?=
 =?us-ascii?Q?fZUHrHlUzeCmG68DqYRJr9eMOyjjwW41kUWLP50I+Jpt8HN6wGPF4SkAPeoJ?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f873025-0ed8-4235-c8c0-08daae35e87b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 22:46:18.4835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AsePMej5/ES6zVVrGkSMna7JiUurXjSLATDve/OH3+H44jAYZrQ0k/yRXqx0jBWtjz1am/HJ5vxd98Ug79V6X7M2c1YG0Gjwskam4Vr0sBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7292
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
Cc: ravi.kumar.vodapalli@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 14, 2022 at 09:32:55PM +0530, Balasubramani Vivekanandan wrote:
> On 30.09.2022 17:45, Matt Roper wrote:
> > MTL once again changes the multicast register types and steering
> > details.  Key changes from past platforms:
> >  * The number of instances of some MCR types (NODE, OAAL2, and GAM) vary
> >    according to the MTL subplatform and cannot be read from fuse
> >    registers.
> >  * The MCR steering register (and its bitfields) has changed.
> > 
> > Unlike past platforms, we will be explicitly steering all types of MCR
> > accesses, including those for "SLICE" and "DSS" ranges; we no longer
> > rely on implicit steering.  On previous platforms, various
> > hardware/firmware agents that needed to access registers typically had
> > their own steering control registers, allowing them to perform multicast
> > steering without clobbering the CPU/kernel steering.  Starting with MTL,
> > more of these agents now share a single steering register (0xFD4) and it
> > is no longer safe for us to assume that the value will remain unchanged
> > from how we initialized it during startup.  There is also a slight
> > chance of race conditions between the driver and a hardware/firmware
> > agent, so the hardware provides a semaphore register that can be used to
> > coordinate access to the steering register.  Support for the semaphore
> > register will be introduced in a future patch.
> > 
> > Bspec: 67788, 67112
> > Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 85 ++++++++++++++++++---
> >  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  5 ++
> >  drivers/gpu/drm/i915/gt/intel_gt_types.h    |  8 +-
> >  drivers/gpu/drm/i915/gt/intel_workarounds.c | 18 ++++-
> >  drivers/gpu/drm/i915/i915_pci.c             |  1 +
> >  5 files changed, 102 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > index 9e2caba64f19..a1fa71b47831 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > @@ -41,6 +41,7 @@ static const char * const intel_steering_types[] = {
> >  	"MSLICE",
> >  	"LNCF",
> >  	"GAM",
> > +	"DSS",
> >  	"INSTANCE 0",
> >  };
> >  
> > @@ -99,9 +100,40 @@ static const struct intel_mmio_range pvc_instance0_steering_table[] = {
> >  	{},
> >  };
> >  
> > +static const struct intel_mmio_range mtl3d_instance0_steering_table[] = {
> > +	{ 0x000B00, 0x000BFF },         /* SQIDI */
> > +	{ 0x001000, 0x001FFF },         /* SQIDI */
> > +	{ 0x004000, 0x0048FF },         /* GAM */
> > +	{ 0x008700, 0x0087FF },         /* SQIDI */
> > +	{ 0x00B000, 0x00B0FF },         /* NODE */
> > +	{ 0x00C800, 0x00CFFF },         /* GAM */
> > +	{ 0x00D880, 0x00D8FF },         /* NODE */
> > +	{ 0x00DD00, 0x00DDFF },         /* OAAL2 */
> > +	{},
> > +};
> > +
> > +static const struct intel_mmio_range mtl3d_l3bank_steering_table[] = {
> > +	{ 0x00B100, 0x00B3FF },
> > +	{},
> > +};
> > +
> > +/* DSS steering is used for SLICE ranges as well */
> > +static const struct intel_mmio_range mtl3d_dss_steering_table[] = {
> > +	{ 0x005200, 0x0052FF },		/* SLICE */
> > +	{ 0x005500, 0x007FFF },		/* SLICE */
> > +	{ 0x008140, 0x00815F },		/* SLICE (0x8140-0x814F), DSS (0x8150-0x815F) */
> > +	{ 0x0094D0, 0x00955F },		/* SLICE (0x94D0-0x951F), DSS (0x9520-0x955F) */
> > +	{ 0x009680, 0x0096FF },		/* DSS */
> > +	{ 0x00D800, 0x00D87F },		/* SLICE */
> > +	{ 0x00DC00, 0x00DCFF },		/* SLICE */
> > +	{ 0x00DE80, 0x00E8FF },		/* DSS (0xE000-0xE0FF reserved) */
> > +};
> > +
> >  void intel_gt_mcr_init(struct intel_gt *gt)
> >  {
> >  	struct drm_i915_private *i915 = gt->i915;
> > +	unsigned long fuse;
> > +	int i;
> >  
> >  	/*
> >  	 * An mslice is unavailable only if both the meml3 for the slice is
> > @@ -119,7 +151,22 @@ void intel_gt_mcr_init(struct intel_gt *gt)
> >  			drm_warn(&i915->drm, "mslice mask all zero!\n");
> >  	}
> >  
> > -	if (IS_PONTEVECCHIO(i915)) {
> > +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70) &&
> > +	    gt->type == GT_PRIMARY) {
> > +		fuse = REG_FIELD_GET(GT_L3_EXC_MASK,
> > +				     intel_uncore_read(gt->uncore, XEHP_FUSE4));
> > +
> > +		/*
> > +		 * Despite the register field being named "exclude mask" the
> > +		 * bits actually represent enabled banks (two banks per bit).
> > +		 */
> > +		for_each_set_bit(i, &fuse, 3)
> > +			gt->info.l3bank_mask |= (0x3 << 2*i);
> > +
> > +		gt->steering_table[INSTANCE0] = mtl3d_instance0_steering_table;
> > +		gt->steering_table[L3BANK] = mtl3d_l3bank_steering_table;
> > +		gt->steering_table[DSS] = mtl3d_dss_steering_table;
> > +	} else if (IS_PONTEVECCHIO(i915)) {
> >  		gt->steering_table[INSTANCE0] = pvc_instance0_steering_table;
> >  	} else if (IS_DG2(i915)) {
> >  		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
> > @@ -184,7 +231,12 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
> >  
> >  	lockdep_assert_held(&uncore->lock);
> >  
> > -	if (GRAPHICS_VER(uncore->i915) >= 11) {
> > +	if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 70)) {
> > +		/* No need to save old steering reg value */
> > +		intel_uncore_write_fw(uncore, MTL_MCR_SELECTOR,
> > +				      REG_FIELD_PREP(MTL_MCR_GROUPID, group) |
> > +				      REG_FIELD_PREP(MTL_MCR_INSTANCEID, instance));
> 
> I think we need to clear the MULTICAST bit in the MTL_MCR_SELECTOR
> register here since we are doing unicast r/w.

Since this is a write operation rather than a RMW, the resulting
register value is exactly the fields we set here (group and instance)
and the multicast bit is guaranteed to be clear after this.

However that does remind me that even though we don't need to restore
the original steering target, we do need to restore the MULTICAST bit to
'1' at the end of this function:

        "Prior to releasing the semaphore, multicast is returned to the
        default (1)."

We haven't implemented use of the hardware semaphore yet (that will come
in a future series), but in general any agent operating on MCR registers
should be guaranteed to have multicast behavior by default.  I'll make
that update in the next version.

And I guess we should probably also _set_ the multicast bit when doing
reads since reads don't actually care about the value of that bit
(they're always inherently a unicast operation), but based on
Wa_22013088509 it's safest to just leave multicast enabled at all times
except when we have a specific need to clear it (i.e., unicast writes).

> 
> And in the functions intel_gt_mcr_multicast_write() and
> intel_gt_mcr_multicast_write_fw(), we need to set the MULTICAST bit
> in the MTL_MCR_SELECTOR register for MTL since we no more rely on
> default values for the MTL_MCR_SELECTOR.

Based on the above, the one thing we're supposed to be guaranteed is
that the multicast bit is always set, unless we've intentionally
switched it to unicast mode temporarily (and in that case we're supposed
to switch it back to multicast at the end).  But it doesn't hurt to
explicitly set that bit, just to be safe; I'll include that too.

> 
> Can I also suggest to optimize the groupid and instanceid calculation
> during non-terminating unicast MCR read/write by caching the groupid and
> instanceid in some variables instead of calculating it everytime?
> Because from MTL we have replaced all MCR register reads with implicit
> steering to intel_gt_mcr_read_any/_fw call, and each call of that
> function does groupip/instanceid calculation.

Are you suggesting that get_nonterminated_steering() should return
pre-computed values rather than calculating them on each call?  We could
probably do that, but it kind of seems like a micro-optimization that
might not provide much actual benefit.  The heaviest steering
calculations basically boil down to an __ffs() operation which should
already be super fast and assembly-optimized.  And given that most of
the places that 'read any' operations happen are stuff like workarounds,
error state dumps, etc. that aren't on a hot path, I'm not sure if it's
worth adding the extra complexity unless we think there's a place where
it could measurably improve performance.


Matt

> 
> Regards,
> Bala
> 
> > +	} else if (GRAPHICS_VER(uncore->i915) >= 11) {
> >  		mcr_mask = GEN11_MCR_SLICE_MASK | GEN11_MCR_SUBSLICE_MASK;
> >  		mcr_ss = GEN11_MCR_SLICE(group) | GEN11_MCR_SUBSLICE(instance);
> >  
> > @@ -202,26 +254,30 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
> >  		 */
> >  		if (rw_flag == FW_REG_WRITE)
> >  			mcr_mask |= GEN11_MCR_MULTICAST;
> > +
> > +		old_mcr = mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);
> > +
> > +		mcr &= ~mcr_mask;
> > +		mcr |= mcr_ss;
> > +		intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
> >  	} else {
> >  		mcr_mask = GEN8_MCR_SLICE_MASK | GEN8_MCR_SUBSLICE_MASK;
> >  		mcr_ss = GEN8_MCR_SLICE(group) | GEN8_MCR_SUBSLICE(instance);
> > -	}
> >  
> > -	old_mcr = mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);
> > +		old_mcr = mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);
> >  
> > -	mcr &= ~mcr_mask;
> > -	mcr |= mcr_ss;
> > -	intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
> > +		mcr &= ~mcr_mask;
> > +		mcr |= mcr_ss;
> > +		intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
> > +	}
> >  
> >  	if (rw_flag == FW_REG_READ)
> >  		val = intel_uncore_read_fw(uncore, mcr_reg_cast(reg));
> >  	else
> >  		intel_uncore_write_fw(uncore, mcr_reg_cast(reg), value);
> >  
> > -	mcr &= ~mcr_mask;
> > -	mcr |= old_mcr & mcr_mask;
> > -
> > -	intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
> > +	if (GRAPHICS_VER_FULL(uncore->i915) < IP_VER(12, 70))
> > +		intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
> >  
> >  	return val;
> >  }
> > @@ -385,6 +441,8 @@ static void get_nonterminated_steering(struct intel_gt *gt,
> >  				       enum intel_steering_type type,
> >  				       u8 *group, u8 *instance)
> >  {
> > +	u32 dss;
> > +
> >  	switch (type) {
> >  	case L3BANK:
> >  		*group = 0;		/* unused */
> > @@ -408,6 +466,11 @@ static void get_nonterminated_steering(struct intel_gt *gt,
> >  		*group = IS_DG2(gt->i915) ? 1 : 0;
> >  		*instance = 0;
> >  		break;
> > +	case DSS:
> > +		dss = intel_sseu_find_first_xehp_dss(&gt->info.sseu, 0, 0);
> > +		*group = dss / GEN_DSS_PER_GSLICE;
> > +		*instance = dss % GEN_DSS_PER_GSLICE;
> > +		break;
> >  	case INSTANCE0:
> >  		/*
> >  		 * There are a lot of MCR types for which instance (0, 0)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index b7341f01ec9f..c5b9671097e3 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -59,6 +59,7 @@
> >  #define GMD_ID_MEDIA				_MMIO(MTL_MEDIA_GSI_BASE + 0xd8c)
> >  
> >  #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
> > +#define MTL_MCR_SELECTOR			_MMIO(0xfd4)
> >  #define SF_MCR_SELECTOR				_MMIO(0xfd8)
> >  #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
> >  #define GAM_MCR_SELECTOR			_MMIO(0xfe0)
> > @@ -71,6 +72,8 @@
> >  #define   GEN11_MCR_SLICE_MASK			GEN11_MCR_SLICE(0xf)
> >  #define   GEN11_MCR_SUBSLICE(subslice)		(((subslice) & 0x7) << 24)
> >  #define   GEN11_MCR_SUBSLICE_MASK		GEN11_MCR_SUBSLICE(0x7)
> > +#define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
> > +#define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
> >  
> >  #define IPEIR_I965				_MMIO(0x2064)
> >  #define IPEHR_I965				_MMIO(0x2068)
> > @@ -531,6 +534,8 @@
> >  #define   GEN6_MBCTL_BOOT_FETCH_MECH		(1 << 0)
> >  
> >  /* Fuse readout registers for GT */
> > +#define XEHP_FUSE4				_MMIO(0x9114)
> > +#define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
> >  #define	GEN10_MIRROR_FUSE3			_MMIO(0x9118)
> >  #define   GEN10_L3BANK_PAIR_COUNT		4
> >  #define   GEN10_L3BANK_MASK			0x0F
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > index 30003d68fd51..77ecbd6be331 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > @@ -60,6 +60,7 @@ enum intel_steering_type {
> >  	MSLICE,
> >  	LNCF,
> >  	GAM,
> > +	DSS,
> >  
> >  	/*
> >  	 * On some platforms there are multiple types of MCR registers that
> > @@ -255,8 +256,6 @@ struct intel_gt {
> >  
> >  		intel_engine_mask_t engine_mask;
> >  
> > -		u32 l3bank_mask;
> > -
> >  		u8 num_engines;
> >  
> >  		/* General presence of SFC units */
> > @@ -268,7 +267,10 @@ struct intel_gt {
> >  		/* Slice/subslice/EU info */
> >  		struct sseu_dev_info sseu;
> >  
> > -		unsigned long mslice_mask;
> > +		union {
> > +			unsigned long mslice_mask;
> > +			unsigned long l3bank_mask;
> > +		};
> >  
> >  		/** @hwconfig: hardware configuration data */
> >  		struct intel_hwconfig hwconfig;
> > diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > index 174c74dcda99..9be048da7fb3 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > @@ -1581,12 +1581,28 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >  	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
> >  }
> >  
> > +static void
> > +mtl_3d_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> > +{
> > +	/*
> > +	 * Unlike older platforms, we no longer setup implicit steering here;
> > +	 * all MCR accesses are explicitly steered.
> > +	 */
> > +	if (drm_debug_enabled(DRM_UT_DRIVER)) {
> > +		struct drm_printer p = drm_debug_printer("MCR Steering:");
> > +
> > +		intel_gt_mcr_report_steering(&p, gt, false);
> > +	}
> > +}
> > +
> >  static void
> >  gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
> >  {
> >  	struct drm_i915_private *i915 = gt->i915;
> >  
> > -	if (IS_PONTEVECCHIO(i915))
> > +	if (IS_METEORLAKE(i915) && gt->type == GT_PRIMARY)
> > +		mtl_3d_gt_workarounds_init(gt, wal);
> > +	else if (IS_PONTEVECCHIO(i915))
> >  		pvc_gt_workarounds_init(gt, wal);
> >  	else if (IS_DG2(i915))
> >  		dg2_gt_workarounds_init(gt, wal);
> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> > index 38460a0bd7cb..bd1d8e0205a6 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -1145,6 +1145,7 @@ static const struct intel_device_info mtl_info = {
> >  	.extra_gt_list = xelpmp_extra_gt,
> >  	.has_flat_ccs = 0,
> >  	.has_gmd_id = 1,
> > +	.has_mslice_steering = 0,
> >  	.has_snoop = 1,
> >  	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
> >  	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
> > -- 
> > 2.37.3
> > 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
