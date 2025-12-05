Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E86CA8C76
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 19:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33D210EB98;
	Fri,  5 Dec 2025 18:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZWp/2dk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9260510EB98;
 Fri,  5 Dec 2025 18:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764959129; x=1796495129;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p9JlC0EgrAS9W3FrsBsaKX2dNEWvttare864SBOu//8=;
 b=RZWp/2dkbamNktEueA0nx7jZDYo6O3tf0QK8irzp6FSywpV5rAZkVwZd
 R+NDb81+2Cyb7oNkulSa0r5gchffXHZ6ZJeVpS9CxqKs9qj6viRRRFOi3
 mhnQppNgyUG0916SsIM7MiCxRdkrFkIRaqMAtVKPeTwrb/iFRZEYeOnqn
 T1/xhj6kqUFtjmGJZBqZ8n4vqCJJb9B+CwRTGGhS68/HbQfmswirRSjjr
 ZSpDf1mAaFdLrKu+eN+HZXUk0mNYw0J9KJofR7beWXRbfHOR5+ndpYDIL
 RtjtcsvHTstJ8mkRMiMWBrMpxAWNs5ciPaSM3dvmoowLKkMwYP5AfzPAD A==;
X-CSE-ConnectionGUID: 2HNXMBfoRFKdSnNINCCiVg==
X-CSE-MsgGUID: vEOvRs2lSxeyW5t+L25RbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67158833"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="67158833"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:25:28 -0800
X-CSE-ConnectionGUID: lujbYFt/TbOhuLSOgcbHDQ==
X-CSE-MsgGUID: uNqMbAQhS+yovNBhGelfLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="199788857"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:25:15 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:25:14 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 10:25:14 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:25:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnNmUe/pd9X+ruRMXZihGiAfk/yDKnl/EJw1LV01SQmsY1iT3rc9ETE1kEAMj5G0q1p00vtZXoI0Zd1026XY3j2bnEhlmtAFKH/pzZP7ew+HMpSfYJfdKUSFCFUeAB67kHaTDmwikLs+mG4qgA45LxEmR32yLfCsmpe0aFvo5bZ+VlqYlG4RKKlucNe4G4HqD1bEZhAz687vUB/RM0vtWeLF651E1jzrw8oiA9q7zxqkTDV1PEiQC3d311jwtPBtLMKXkb0UMoRBEMOP2FhP/GDKbJxWSF5rFFTvt7getRiT+KUhcDbo88wqe+XFftDjyggr2xlxFGYj3JjrgYsE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CbeY5ayevefKxT1Ymf2pzZtkQekuONFrGUsF/y7W68=;
 b=TZ9+x6HVGUOf9kps5I0U2I+NWNSyoKuUJBZyfxmiYjuLs5e6igA/6BvMkj6IWC1WsHjFb+hNjYxzvD8sT5i0MCY+eZ+jBvLN5Su1bTL5fVdgV+FLUtslTdg+YrfBf/SbYJCPDjOcBJ9uFQnlcODwV2eE8wE5gjgf4k90gA+oayDN1MQgYXMZFHlBVhfHpPWwMuidaOs6vWh5h4GXM8tcVJJ1CynwAydQZUUlBuAmAMc5RBwq08QKRQDmJpqsHqkWP6+gkKDMsyiNTkoir/B/msD5cHicYxXE78Dii3wsG69k/QcJ+Q/6FBaEZEBEOA4K++Zr/cOMVfeaNXXvaccHWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6862.namprd11.prod.outlook.com (2603:10b6:303:220::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 18:25:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 18:25:12 +0000
Date: Fri, 5 Dec 2025 10:25:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: Simon Richter <Simon.Richter@hogyros.de>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>
Subject: Re: [PATCH v3] drm/ttm: Avoid NULL pointer deref for evicted BOs
Message-ID: <aTMjhaq3mJdPsHAa@lstrano-desk.jf.intel.com>
References: <20251013160311.548207-1-Simon.Richter@hogyros.de>
 <20251013161241.709916-1-Simon.Richter@hogyros.de>
 <aO0oXPwaRa3RfmCU@lstrano-desk.jf.intel.com>
 <DM4PR11MB5456F9CEB1B89BC3187E9B55EAA7A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5456F9CEB1B89BC3187E9B55EAA7A@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:303:8d::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: e281fffe-9688-4ca1-9b79-08de342ba0fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HLkk0b3ejCQJdju00TyctSQmQ+ZA0CQvwqyjIMZTCFmhBwsMGoNLfgoaSxMj?=
 =?us-ascii?Q?HhAW1uwyROcaG5vgXtxUhUQoH3XgsqcQVhKghPjA2IEiwExNBjiGnGO06YD2?=
 =?us-ascii?Q?Hc7EuqXzbvxvt/w6YX4HyWGJI9GJvn3UY/DmriXQOdUBor5zLmNUDK1Zk9Jm?=
 =?us-ascii?Q?Hme5vP9g0z3gedI1+tWuaKfU/Xg9/ngQQRLIRcgkoSz+Xp2MlBLVz4sX1vNC?=
 =?us-ascii?Q?jXr9n2t7sznyV8NDVY6Ruih++qVCIrjmeK7q4976rb4hawAdjq4TMuRwPAfA?=
 =?us-ascii?Q?2d0A1nXOazmp3CdXFfbEpg38v1I1dDb3CwL27gCa1mYehwUBi7q228RFyE1H?=
 =?us-ascii?Q?DP+i/ivrUbnp7kxDZTrCi66fvAhYHNuBWpwW3QHMZR5jgrfTtVwb7TihV/tr?=
 =?us-ascii?Q?H8QJe0xGNjMPsuGlpFJmRyQiaJI1j5Nr1TpNqbj7HrptTht12sCZYWiizCrJ?=
 =?us-ascii?Q?OtLFnqLEqkmbg0DsenaBX9pwPTjCxA9tlmm/AKjv5I9VkYJMsIVRHA3Jga3h?=
 =?us-ascii?Q?21cJ2ZSL9du5HRiYplg9qqnzvZSmkw5v0e1+j8QP8IFSEMjZF+lQS3/gKCD1?=
 =?us-ascii?Q?1S7LxOQDM68GhwPLcV6jF7xcLfW3/71mDBZ6jIJqXDssQ5GydwSHSqz4qOGh?=
 =?us-ascii?Q?TzaU1zCPBD+IzhKEvBfOjGJTFf0Qm6nJEoMl4UAOTJvzIFZfgdlinEgiORG+?=
 =?us-ascii?Q?VGe3HNjJmcvRtulAA1062a4O6lY5Uvwpgy5V4YAZ/lVaDdcT3MoJyzPxyINx?=
 =?us-ascii?Q?5+rAUXTqSk0wsycVzW/FfCColUwv8a5853JHQW7SWfOMY68ZUc05q0v+rdF5?=
 =?us-ascii?Q?68Kg7OKzbId7l4sNe8dViIyRd5T7jLy5ffPNH217QwwWHcBOv9YP6CjIj3g2?=
 =?us-ascii?Q?f95L99maIN5Z4Z82d9H1bJjrwOyfV7gHpQ1YFLk/9aBJIZ1VK5ET7v8qg9HB?=
 =?us-ascii?Q?bE5GtNXGmC55lwkgyu6XIzu49qGotPytRF5O2WkeljeK8gh4tTHgiKEHcLU0?=
 =?us-ascii?Q?AEsiVgIelifWvjF58K0j6bH1QaFxvLY6Zwh60rjw86pf2o7r0VEA3wuNaO1O?=
 =?us-ascii?Q?166RLKqsKy28WX2Jr4C9aPwisaZ+K0pn45nXKtrJ4KRZ29O6jbsBgGI16SZG?=
 =?us-ascii?Q?KoDgdfAHCg3ip9Pq7O1ywlxopkkuRzst3psqWV2TaDBd+FhHtcSXKjEBD3+W?=
 =?us-ascii?Q?s7zF+Dqr33udPQPHChKDfvqTjM3pLAS99BeV0aOQ3IWcHTTKJE40xBrs4nEj?=
 =?us-ascii?Q?OvRgkgu0D5jVTF2P9paG8YzyHalLyhSnL47Kjw/ds4ddFaTuyRKlTYMnULsL?=
 =?us-ascii?Q?nlxHdO0ke0RgfSK4uAsI9ZBT1JzVx1Br3Gcu5S9NGyme+rrVnHU/F6rmQWZK?=
 =?us-ascii?Q?+NoVR4fTRECOGXX3HJf8ptgkhL2/LkUnC+sBgcdZPjrK9LAreNAvivVuFwNv?=
 =?us-ascii?Q?OTGSr4ukAEIT5QraHKdNrwRvLbeYM8yV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4PzXa6sloxZyaEFj6AStvm1N7s75yAi+JW+1TMDhNkn0i0KoNGQElUOtYIDF?=
 =?us-ascii?Q?91K/HRcAV2SX9qXe6V/J4x4CjV3TEH6muhiSa50mFwznLZNnkiq5zkRJD8lo?=
 =?us-ascii?Q?Gl5By+hsc4wHIDsxzDL9HIf3XELsssUHtWoHXNjj66p6EZWqISPvQzm7jAYx?=
 =?us-ascii?Q?WCdLi9E/OXYZmLwzYuH2qpmgfJqpFPyNdQYOtdLw9TOdInAta3iN1ITFHfEy?=
 =?us-ascii?Q?Y7FGLXWpcAdrHxb4NhCr7y1YgtWc1OMWzfVKLo5JypQLdiiVerhdWLi1UuVZ?=
 =?us-ascii?Q?DsILsJpkbPmeLcjLdps84sElX7wLHdHRT0Fwn9fbj0X+SPDTRfSDWMxHiLK7?=
 =?us-ascii?Q?ZeLb3lNCh3MMkP2Ts/JqPuee0Bnkzz0gVhsbQTqGMfiL3IZZlJALZbef7jrf?=
 =?us-ascii?Q?Nb9xghC742S5cL6VeiWjFR8uqyaFiEwOXEy/40SgSkC9M1MR79QVJ3YM8CSC?=
 =?us-ascii?Q?VqGAaiHDolu9u5k8XY9hLKQ+eV7N4B/pGdKOvkCr56qKuxktWHX3BkVhBoqk?=
 =?us-ascii?Q?Um3bnKPXzCV0BqzJOYd4f0WSWUhKIalQStJJ2/9rjNgiAKYNWdRtBZ2hNh2D?=
 =?us-ascii?Q?61q8yDXFa91Jc96hLl/FdGNALOH5KjKbHkQFIrLvAg9dRRUJg2MWADRo9NMF?=
 =?us-ascii?Q?FVlKfiTmBYCTYwht7qMfxI/VSRMXF22hTHOakFeItCXs254w5Rs48LKFl9GW?=
 =?us-ascii?Q?/GUUQLLUf0uyP+zRCxzWgyiEAy6P4HAllKKEY4n1ffLR7IO355BoDObJwoi7?=
 =?us-ascii?Q?QqCoKM2wjr0L5AdeEnj8Q6DM0D542stxW5sVxnQFKpt+kdlk4lmHL1HcbOvk?=
 =?us-ascii?Q?ESdUBCp/E6y0b33b3w+fgOVcRFSRY93yfn60OrHyE9lzAc0RUz54QYkiGwrK?=
 =?us-ascii?Q?l/MPRSg3EtQOQMNqrP+y9iIU8U1CWHect3azmIdR2z47VAhfGVJs4d9AI2gy?=
 =?us-ascii?Q?4IBnMuG4UzpYVkM1fNhaQoVcfEUJAxtMkTLy3Tmmh1ndXi+j+79LV1PRWoPT?=
 =?us-ascii?Q?lSrr0nsPKMpK8htCNey6538b+ymxCgRjD7MqzDa41P9hrKlX4Ddle1KXhTso?=
 =?us-ascii?Q?ZnYQlb9Wf+QGeTynrRQnE3GAkMzR3c3ON4kUIdrTRksepCrsvOXzvJfwUZuc?=
 =?us-ascii?Q?Hb7lKwPtjiMW5zKyxJCyBDfd9knbnVDbNAA6JXpXFTNcR4DbGDricediQD1x?=
 =?us-ascii?Q?EjCzRzN/O+VX2Q9Z+v3eP3umP3fym5tNojp+iicYmBJEuBpCstWtFv2GhL/m?=
 =?us-ascii?Q?YUiAT7/uYJQ7U5S62FtteJa44VSH7JE76o31sM5fmBr36WR6sVjNRWN+3M+k?=
 =?us-ascii?Q?ULHdNR0fGKanUdz/BKsgpCg1aLgUHYy9VvmGQnTOiHn+gW9UOYRCVymdz1dz?=
 =?us-ascii?Q?aRr1IMmnfTzyqhSsAjp34FmLZ6iQskMjTxizgDYuLMZ4iE+cNP2lq7mp8E8C?=
 =?us-ascii?Q?HGyam82p1N0P0rTzusH4WS9zs/Xtx7OBLr33OL/NrpAxbSUiwr2u7oMlGn34?=
 =?us-ascii?Q?iSM85cQjoQFYcjUJ8DcHCnwcRhqaXONg6ef0VOV/tg3pKJrXdDKJoV185lPQ?=
 =?us-ascii?Q?qu/lNv/1JGWwcXMzC8ZmFjpj0n0p6Lx8LxzR6eSq4W0JGjQbThS+fDR+bqIK?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e281fffe-9688-4ca1-9b79-08de342ba0fd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 18:25:12.4003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnBq0hMsbKRnm8+0HgMjDmczkZ3OMbO9Du8iDCM0Bj9zKLx/GlCNJCVW2kzZASpnjHy3zpZaJgQHB5bur0xJag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6862
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

On Fri, Dec 05, 2025 at 10:46:34AM -0700, Lin, Shuicheng wrote:
> On Mon, Oct 13, 2025 9:27 AM Matthew Brost wrote:
> > On Tue, Oct 14, 2025 at 01:11:33AM +0900, Simon Richter wrote:
> > > It is possible for a BO to exist that is not currently associated with
> > > a resource, e.g. because it has been evicted.
> > >
> > > When devcoredump tries to read the contents of all BOs for dumping, we
> > > need to expect this as well -- in this case, ENODATA is recorded
> > > instead of the buffer contents.
> > >
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6271
> > 
> > I think we need a fixes / cc stable but I can add that for you when merging.
> > 
> > Anyways patch LGTM:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > > Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
> 

Christian - any objection to me pushing this patch drm-misc-next or
would it be drm-misc-fixes? I forget the flow here.

Matt 

> It seems this patch is not merged yet.
> 
> LGTM.
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> 
> > > ---
> > >  drivers/gpu/drm/ttm/ttm_bo_vm.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > b/drivers/gpu/drm/ttm/ttm_bo_vm.c index b47020fca199..a101ff95b234
> > > 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > @@ -434,6 +434,11 @@ int ttm_bo_access(struct ttm_buffer_object *bo,
> > unsigned long offset,
> > >  	if (ret)
> > >  		return ret;
> > >
> > > +	if (!bo->resource) {
> > > +		ret = -ENODATA;
> > > +		goto unlock;
> > > +	}
> > > +
> > >  	switch (bo->resource->mem_type) {
> > >  	case TTM_PL_SYSTEM:
> > >  		fallthrough;
> > > @@ -448,6 +453,7 @@ int ttm_bo_access(struct ttm_buffer_object *bo,
> > unsigned long offset,
> > >  			ret = -EIO;
> > >  	}
> > >
> > > +unlock:
> > >  	ttm_bo_unreserve(bo);
> > >
> > >  	return ret;
> > > --
> > > 2.47.3
> > >
