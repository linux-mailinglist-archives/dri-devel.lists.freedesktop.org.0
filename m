Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D8390DD12
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF42410E011;
	Tue, 18 Jun 2024 20:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4VzF83B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4259510E011;
 Tue, 18 Jun 2024 20:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718741413; x=1750277413;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Bb2jQU2dv7NoPSdS9VVz5Z9G6Sc9bb1owTO06o7qcrM=;
 b=R4VzF83B/1fqH+sa8dzLiHmsmUAvJEa0VTFDTs3TfOaNJPxS+uCpC5nZ
 OEDMYmbQkaxlJZLup8WvLEI8FZh61PYPgw1B03VRt/rtw4QHzin8Nr12x
 xf7MprGM5tkecvbXlO4QO7F5uD0/Q1R0aZfqbilW552w3oPvLQUFpHdlU
 FXwplhsBHZiho6UNIvqoTLVPmmLVavpVLkiCAKoJ1XzvJuhwFZ67OwCIl
 kZ60mtstjN4h4yWeMKxqxTwuWy6IDmF5YwVJKkb2izsEfjh1GWfY/YxGc
 zmq3nc36Kncwpmp9wrXnW5yoKfv6gvASKKgyq0A5zdeymlpL2nFn5/W37 w==;
X-CSE-ConnectionGUID: I3CU8zUUTp2wOp3jTj5FBA==
X-CSE-MsgGUID: rqVI5ZBKQ+meGY83XSJdkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="19519450"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="19519450"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 13:10:12 -0700
X-CSE-ConnectionGUID: ZrbCjKqVTLWGLhbKGcV0Jw==
X-CSE-MsgGUID: aCKwVedySL2BUumAV1hqEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="64912537"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 13:10:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 13:10:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 13:10:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 13:10:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmDMZ235IWeux7mfHxFGc8K6EDuifKHZxAVba0fqaKMbvMM34VHZAHfbzXMxFPo3kO+xg1cfKtCheBv5NT16Th7f0RVQ26+03MbkzkF+dm7aa+8Iv42XFyr3xphUNhB3jaN2o8t/aSoi+IgMpMeSWUBtblQGxgag/vHryhoWhcvBKwaExJUTHag3CPmEm/eVs6xXh8LlaY3BFC0PUbQLVF5ckxsWDVR01aiOKkaGeV0bSsMjmqFb3AEF7tR8LMazJNuKBNyG+t8c1PxUqI8LkhWaoHl6OC9H/ZRUQBjAAW4GrNgM4LXlBlvvLvVOjsNQX/ayXo+Ol1mCzEgsku4fwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mCDXJ5jEFMGZJbD6moESl3pAlD1p0SW1lPdaF5ihZI=;
 b=PetO6gJP726mK/C5Na8P6njLyC5D2WIavw249hfhRjxdugu3b5tr0KLTmEZp77z34onkODnif577ET7/owY+DjZ05r2tjmz3uJELwFWH66MyzN/4aRqdnJJX15lgiO7apaFkN7Qq/v9QVqJTy1Ri+lQsV4oA8a0/5ne+QJXSHm9ADiqaw5VDAJJkh/Ri78pukoSAKsFIipnWJ1F90KJxkO5PPy8lz+8DbWeus10nKNujNuQWQk7WoReXQTz6OAKFtoMMLPwRnTFpxcF2Y6SxU4zy4Mbxg3mIUrU/hYRE1cq4m+lMbO2lTtyn4bOrY8E7zwhHIQLzD02jNInAZlVNXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB6325.namprd11.prod.outlook.com (2603:10b6:8:cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 20:10:08 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 20:10:08 +0000
Date: Tue, 18 Jun 2024 16:10:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <ankit.k.nautiyal@intel.com>,
 <suraj.kandpal@intel.com>, <jani.nikula@linux.intel.com>,
 <sfr@canb.auug.org.au>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 1/2] drm/dp: Describe target_rr_divider in struct
 drm_dp_as_sdp
Message-ID: <ZnHpm1NJDiBlZNdz@intel.com>
References: <20240614042558.376983-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240614042558.376983-2-mitulkumar.ajitkumar.golani@intel.com>
 <ZmyfoMYRfKJv16KD@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZmyfoMYRfKJv16KD@intel.com>
X-ClientProxiedBy: BYAPR06CA0069.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::46) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: 36174ebd-4dfb-4f8e-2eb7-08dc8fd2a670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k1Vmhp4opDF/8W8hSUj2xq2GU1QwRg6uZwzecDEaMqsDgnH2pwD3Lh8Yz639?=
 =?us-ascii?Q?QAYBxTW6NArhrKn4UnWLB8dfvV6TSlt1m9nhE5zVc3R+o4x4LmK2qSe+iQ8I?=
 =?us-ascii?Q?PS8kjsg2wphAHe+WTILpKPGCi+t0GR3mC85KLvZJL0AwiVT7LjnsRCKaeJMp?=
 =?us-ascii?Q?ekR1RPA5egpz48JTh98tcfnli7m+7pwZCm9f2iyi6AZIjFrjXGopxFlUJZSN?=
 =?us-ascii?Q?khVLM0T0kpvK8vbiDxMEuTC8K1FKG2iP7yvSmdj6K0HyQnngXWMTZuwNBjU9?=
 =?us-ascii?Q?uUT8njF21mbHTGXOF2is9FolLSwvBCwDT3I+ZAS0WpmJkKuyiG3SmGjtJ+1T?=
 =?us-ascii?Q?OjMMp1sUkSm6Eugo3fFRMEk0A+GnZcxeazU698EAieckYMr+LVVSxIBlUjz/?=
 =?us-ascii?Q?CpZTtFXpXxBGhYaKKPtjtAOGCMHob6LGksx3kQA8MRo64yqoFqOMdDFoSK7m?=
 =?us-ascii?Q?8OE5nbQnRqoVFmI0wkGer88c4Pn+XZacMza2odor1MkTf8plyLW1dMUwFyeN?=
 =?us-ascii?Q?icdkc60Ac3EFG5uCxFn672QPOx0GL/adj6qIQpOhwb+PK3IeapMyL0qK/hEu?=
 =?us-ascii?Q?Negxzo08OJdQxOXN5Sggq4e/dDSX2jGboBO8RV4T1zXQfOpr1bzwZIT/evr7?=
 =?us-ascii?Q?YFY91ZL8Aw+8ubvdmKpZrAH3BEtWdB5u2O3VWeFMKyqeh24t/ose2QBtbI5K?=
 =?us-ascii?Q?wi7s2MM7P6BdATqDz4nqRPcGfOgfBiHQhetyN9Q6MLaGj90izdLBChEZXKcw?=
 =?us-ascii?Q?8rFSv8rtzluNHd8a3YOL/tBV/OVjmeO5CaQ2/vjk2iXgUbtzTimoWjf/SPvA?=
 =?us-ascii?Q?NTnJPGbllcEFHdePAzTvz3kccHrvxKQS+UVopqrdpq/ARBCleF9Bh0LJWqfJ?=
 =?us-ascii?Q?mHlsYbgXB0Dj926saCIJeBr+qfavWtU/w/UXeUKUQeqsIyaJPbv/uaqVyHdO?=
 =?us-ascii?Q?dA4FBimZxWLF5LpMRkHhncBDZLVqvragzITx8QEtc8RMdQBonGx5dY4QzUaZ?=
 =?us-ascii?Q?WJ5g6obxbkigB5uCagUSERe5qqNY4Hv9cabKQH8eVFHga82476sA4T5pbkAG?=
 =?us-ascii?Q?LFXZDsLCPFtTBHLEB0mzvN/iPkCqM3KDOdJV+Ya2YSwaiLmCyZEsunmCntAe?=
 =?us-ascii?Q?m0XOenjOu/aVsyAfnpP4T7ZNgrB6Ac1JwuQeFJ8Smn7J7ynKDXEmOSTVPr2c?=
 =?us-ascii?Q?wIj5erOBRWtWh4kLCV33z4miVnTtHewID3PH50sVf8mn0/F4+kzGpei1ExUt?=
 =?us-ascii?Q?T06+Yn4HYOQxsBsEDlJLn4xjN3GNXN8slv5kRTwObyK9G4nq/iEh00xI4k3U?=
 =?us-ascii?Q?CBwefbyulSj6yfkawkg/IWA9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q1/LEeNUourdHJvApH4Okorv0x+PiDZxjmwRUwOZPqIMg7clUlO/Gi1LSIEq?=
 =?us-ascii?Q?bVUuXDB4weBVfUcYF3XMwpeU93JQjWgC699Csinxe5HwYb1ajVk4pFyiX6BK?=
 =?us-ascii?Q?HtEJDzfNE2FEUA2fNcuasHGmKWuaMSCStIuH7QQKJG5qa/DpEBEHAV/xvyE1?=
 =?us-ascii?Q?eYB9KErESbz6Ma5XFQiv+VUlw6guQZxJbcMYY+8vEmz3qCW823mMr2AHlW0b?=
 =?us-ascii?Q?sJnqp15wJ3mRfPZbzSj8qUDrdB3zs+NbOigCYcUqIE/EIFWEb4VyVuT7R1SJ?=
 =?us-ascii?Q?eaUMvr5zcDVWJADb8sXNP+ZiUgicOAJGVBMzEExReIwZtA7JLnw8ONoaoLzx?=
 =?us-ascii?Q?jFnTjHw0wUz6FHTW5lISoLyPJkPcHFu9tw19bSb4HonKbGpQKCYiTGFk1jpc?=
 =?us-ascii?Q?rsYiOcvEcRX5GppRM/dERi+Vx9Ej0vl0MbEAWoN0N61kfZmsMYUpDvN9bTnp?=
 =?us-ascii?Q?ZIwQhMUMarYkQAKDZLQXrHL7MVWXtOUQveYJOKEeaVMBvXIkkD8PirhB7W4S?=
 =?us-ascii?Q?InJXSlZudjnFVVJgzjgIPcRUmEoAXCvytrOHfQIPSTOtT1JhUhZ5n2oEGiGj?=
 =?us-ascii?Q?1YydQuIK4V+GSIKRGjVwYGNlmoagn00clizv2AruQBUSF9J2chzr5zDqd+EL?=
 =?us-ascii?Q?Zwk4rbFKDyIALWCPMvbgW661+/bbmJUz7khcVZTFhRrXyT2x7RLVuRMtUUDM?=
 =?us-ascii?Q?gcJAdfXT5kJFjI3UaHBtQzfCk/pgLbh+7R0DtmVkTNWsXuUANjqQD/7321Xb?=
 =?us-ascii?Q?0t105XlhYJEiOvE+GQin38fCoRFfIdZ91IAtVhG/HibrpSVNmdxnYjMsYlZo?=
 =?us-ascii?Q?G+3+h6KEklAe8Zu0gfT5umtjJOIh63Nebf2obIVEFOnFpGMWvrMgXLRDnJU+?=
 =?us-ascii?Q?DB3yXEFt9E7LSJlSFGn8SmyA5pKzldl3WI5YProhGFzPyxmW9sNJ5FJfPrwa?=
 =?us-ascii?Q?CW6Ky7SKj9MkB+CEn6KHoMYL5TD5+5Hb+G+TGDcSXxCM4HM5qLFgLTDNkYCq?=
 =?us-ascii?Q?N9DrK8Rv7Eon6LAVuqD0V9w0Vgz1RQLpLt3rKyy7UEEe5Zbw/IbA7RWZ6/9z?=
 =?us-ascii?Q?u3VoPfwKcJV99b7KiIUHa4gO5T3+v5gH7dM1bSRBq8ipr59KkwUHKo/49eUp?=
 =?us-ascii?Q?oe7H6g+HiQ0lEkt9DQF3VrMznH9YCj+yzOOH/RBfHhdU+80QLRd0VoMUe48C?=
 =?us-ascii?Q?skezbrdrfyx1Vg+Ac92lc6ufw2OJtJIlkQhFAuEP9UNBpgOpk4TmxEDVDHHO?=
 =?us-ascii?Q?HYaaHrOgLm8uq8WR8qIvr8f+9H/I2xGImLDzCRR5g35fdJ5WOybJcRrcGIIL?=
 =?us-ascii?Q?JW83+qgpffDJXWM1axcQa9eCMO6HXrbquPT69nyzvnJ1J4f6H8ChWCSsZUU6?=
 =?us-ascii?Q?DsRB/uhhfgsG4ejVKBfsbHMwkLkPTE7+GKJwNpDzI7l3HdokgZiQZfAhC0pC?=
 =?us-ascii?Q?dh1JyMmTmLSM212gO0pQsgM8Bwys6+XewfF9IAR5ont3Imf8/T+E3VXinRvW?=
 =?us-ascii?Q?DsJSaXZ4DiYH2MH8Ek9IO4plWc0Aj6gcX2g/BLy1yVCaqHgfgR8gaIXfZ2ln?=
 =?us-ascii?Q?1sBKTb2ZAK3PEOrZQwk3/Un3RD/m/1FRrFxEax5l?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36174ebd-4dfb-4f8e-2eb7-08dc8fd2a670
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 20:10:08.0417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMBwBkVr3/v/qf6A12oQ2knHyA4rOzHsYXplM6lzhL5jUC7llAWHxTh14EoO4ghCg66egC+cCNOW9MYpVMwD1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6325
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

On Fri, Jun 14, 2024 at 03:53:04PM -0400, Rodrigo Vivi wrote:
> On Fri, Jun 14, 2024 at 09:55:57AM +0530, Mitul Golani wrote:
> > Describe newly added parameter target_rr_divider in struct
> > drm_dp_as_sdp.
> > 
> > -v2:
> > Remove extra line from commit message.(Lucas)
> > 
> > Fixes: a20c6d954d75 ("drm/dp: Add refresh rate divider to struct representing AS SDP")
> > Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> > Cc: Arun R Murthy <arun.r.murthy@intel.com>
> > Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> > Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> > Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > ---
> >  include/drm/display/drm_dp_helper.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> > index ea03e1dd26ba..7f2567fa230d 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -112,6 +112,7 @@ struct drm_dp_vsc_sdp {
> >   * @target_rr: Target Refresh
> >   * @duration_incr_ms: Successive frame duration increase
> >   * @duration_decr_ms: Successive frame duration decrease
> > + * @target_rr_divider: Target refresh rate divider
> 
> Maarten, Maxime, or Thomas,
> the patch introducing this target_rr_divider is in drm-intel-next.
> Ack on adding this through drm-intel-next as well?

I got Maxime's ack on irc to go ahead here. But I just noticed
that this actually conflicts with commit c7ce956bb6d0 ("drm/dp: Fix
documentation warning") which is only applied on drm-misc-next.

With that, I prefer to hold so the branches are in sync again
so we send a patch that applies cleanly.

> 
> >   * @mode: Adaptive Sync Operation Mode
> >   */
> >  struct drm_dp_as_sdp {
> > -- 
> > 2.45.2
> > 
