Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B8269877A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 22:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7DC10EC2C;
	Wed, 15 Feb 2023 21:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D9910E0B4;
 Wed, 15 Feb 2023 21:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676497291; x=1708033291;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jlRA1jkt2gkiBrCTBouG1eqcRNGEfvZrgu6hRWtcUhs=;
 b=TGguhTT1X+F61OQQ4DVt95KbkNE8uv0uf3iUUPLo6XQ8fxGrhtflnRVN
 lJVQZI9j/3PeYhNnh3+t3uSS9e3oD8zxxmKsObZCZH97AP5SuN3WuwxZj
 D3FFC3Bupkc92PAp7W1C9MmvVEsu7Eh4tXqGrsS3T4WGL4JOtx7TWaaz9
 DfF7YI1kzrC7CpQPWLvYasg/GElpoXAMaMSbJu+vG+ECdzk/ICeKqup7A
 XXi1HcObjKyIJ2tglbTGTQOebZU4Ogi1rCWf5hP2d1SQkBGBu3ABitPKk
 cZYp+mIXjpadcpvLJwZGbCHkl99po9VFiNKYV1NmEMCGJwHZyYNzOUTk6 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="315220064"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="315220064"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 13:41:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="812692913"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="812692913"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 15 Feb 2023 13:41:29 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 15 Feb 2023 13:41:29 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 15 Feb 2023 13:41:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 15 Feb 2023 13:41:28 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 15 Feb 2023 13:41:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZS1hci0XVEYjUQOdV+bYv+ZfnzsWZj++oHICb/gc5Q9D0SYuSy13jshXbkqtUU9M9ladjL7CRiPQ8BkkVEhuHWQTXqQh0OTCF9y86TZ3/2gCWS30UC5I7P4KD/3Ue2CKrZczJ/EKIy7kZyeFthSshcrjGHFlflu0gbWRu3CNNNhuv1E4DD9Ep6OVTvWv4UwTGxrCJqdL/4/UQWDkBWsr+TO3kHxldB/5znHlsT8WDWD5G438lKyXxvmjTiRE02n7JnUeE8uncwSGpzOT9ccA1hAaDQydHi/PgWe7/dLBlOj+NFxfnrRLzwpQiaV5Jpb88VSV+OOjP4QvhK0U4f1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YoTNYR9hKXdK3Rz0v8huGRXmfvnkHMXR2CTBX1txmI=;
 b=iXTLpEkq1RjU1niOlJwBw3Jwki/Tevs6opdYMroEqaR0fKYqKbK9LQsWjtSCxnKhFe5g0rWSdreVr1bhE7kPdC3DRQXD+embYb04hjUSOqqtR/e7VMdMu/bjJzOGir2Ko2dNPb37y/WMGN9QhYn3N/aqSycApCpOn1SoO6x0kBhlBfwCZ9OYUG8ChhlhtnPvJoWrUR7D0UrVAyojrNcYVvuX56xy00cedjKhMD9Rm64r/pB3gKcOKXLjozIxqsge/kRWfBNnwRoPC0Mmqm9Mwj7qKOL+pT6w6Yucuq4Vxp/iVzx2eWoEJE4ItUBHXV+pzsDKXeEq6554y2u/CaU/eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB7787.namprd11.prod.outlook.com (2603:10b6:8:de::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.21; Wed, 15 Feb 2023 21:41:27 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 21:41:27 +0000
Date: Wed, 15 Feb 2023 13:41:23 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH] drm/i915/xelpmp: Consider GSI offset when doing MCR
 lookups
Message-ID: <Y+1Rgwchdcrx1nnV@mdroper-desk1.amr.corp.intel.com>
References: <20230214001906.1477370-1-matthew.d.roper@intel.com>
 <DM4PR11MB5971F28E15324881A9F8B70B87A39@DM4PR11MB5971.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5971F28E15324881A9F8B70B87A39@DM4PR11MB5971.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::30) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: daf6ccd3-c6ad-4e19-d94a-08db0f9d63e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y2U1BPgGjXVUUVnwCQ/78wTg2ykcYxVxbMytxXr5F77zncDh1Gs0yCZJQUmv+1sJkNIsD+5TV8m4djlarucWyd1+ut7ggvLsWM7tSqY74z687kKic2sSNHCkS1i4v0v2LmFyhFo4FsUq8xlefGuCfuyH01g4Rw8KHthElXzLCgYimoQaVGDrqA/w2Lr6I3hcFDRrab2qsFEfrC+SY468Z+lq+k2DRibOKPgm3M73v2FNcfWaWBCAsNgltb3WmHj5NFjVrfTUwCZPdW9NwE5Of76W/JAbChDbCoGuQ3VH/kaEgFKZb+YUVlzdUhEeYCPg+gAsVnOGlZ+6PhDWVB52x7r19hvT+o/PRr5B4exYQzyfJcwyi8RkJyIygKogKGHZ94DDNfJgwzqvci4RN0xyFM8q/Lk2OiB0C7Yxa6hLClpHJ2fK3H1L1e/TM7SRMOGvW1TVn0p282Q/nQu2jWcm7tfyVeolxmwETotX8SQlev53XwJG6bTY0Luv4/hLsapCxqSZkX3RKbLnaZBUo6n4HORB+WJVf6qX3XZHZ+p1C4keBfk3oSre0bEc+Fsasn7UTW6/7GbFrVumasU0FhJCi0slixO3yYfYJDp1LtSAIrYVkNPDjr5doLLCCm3JepqTlRtEFIQAvwRS4F1+1oumOSjaslOgkl0D1segtqqRuLkMgXa5m2l4Qd3/+zFhwej+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199018)(8936002)(6862004)(5660300002)(2906002)(8676002)(450100002)(4326008)(66946007)(41300700001)(66476007)(54906003)(66556008)(38100700002)(316002)(6636002)(6666004)(6506007)(82960400001)(86362001)(6512007)(53546011)(478600001)(6486002)(186003)(26005)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/a4xGbh0NDJciAuEyArvFyIgGyS0qwu3IjQL3w1sbUL0uRM3M3R8Otmojw0V?=
 =?us-ascii?Q?z/nXDqED9WBO7L3ewm4ZyoD3l5xx1SigLnIGIyvi/WWlGgJChQuWj5+Yl+uM?=
 =?us-ascii?Q?pnaKMEYBd4WnOWg5QfxLFfJDKom9pNRy/s03NpB8ERwT5rzBZkT3WoxVAH3D?=
 =?us-ascii?Q?rJeRE4NYQqVyeO1sPQhwwPLy1amfGGeItetC0nlhaLbrEAku4ORCDiibdzSu?=
 =?us-ascii?Q?7enCuUcS1v9m779LXpOz6cfdQrHs8120rLMxfYmWPvV7ZSjUn1zTpaeKOr3K?=
 =?us-ascii?Q?646NNiltOKH/rW3fF6ps8xAMZYYgiUv39VmGhifwtKh1lwG6OOLpi9lopDu+?=
 =?us-ascii?Q?K1IS6JV0TbCyCyiI9KZ2YoGmxQ9c8yHvsf57iwxmBxzVAg6JFsVH3VA4kFC8?=
 =?us-ascii?Q?Nmwte3ut6QgqWeIzVtmWV19byeGvM3EQsnbCHBf0ywrcJlDOAE7HW6bCg0g0?=
 =?us-ascii?Q?/R9Jq4PYktbif9J2z3Hi6qteJ5GsutTiy4Ir1yhmrI7HoVqd6C9XIPUoZ65q?=
 =?us-ascii?Q?6lkMuFl3rduL+F9GZG+G8BJcuy7g9T+tY4Gw1TPqphinhc64TPon6+VkFfwH?=
 =?us-ascii?Q?Uy2VDpt4c9xYGu0006yewzLP2NCFXawjohRRnh6xwmMxFzq3cJcewKZxt/SQ?=
 =?us-ascii?Q?EFVtXcReqAt/o8Y7RDxRFUYo7lj2wFaag3qhF4zHl6dmlMyUPpsbZnZbv2sz?=
 =?us-ascii?Q?iPE97O6HoVh+z/lbNelVmjMjAm97YIsqDn4LtrDZ8NbpFplLEaqjba/2TgxO?=
 =?us-ascii?Q?MMwkiwDxzYZ+aaGR+pj0VcO3CUwSnNtO6E28yA7oKinhZnjYqgaQUNbr9jz9?=
 =?us-ascii?Q?jQ7yzlK+S6NmudGpm5Bc7YZcE/EScSCax4SgyxzanMdXIP8C+PmQ7ItSnfmX?=
 =?us-ascii?Q?Y+h1EzZBlBOyZycYioqGcRZJpMetTjpiKof06pndQC9h9Gc+8iwe6Q4raTJG?=
 =?us-ascii?Q?gZZy9kKyPKmF+V3CfevZHTQsGUsJMhx97pUQ3OIu6eznUB3Y6NQRfg6CqAHK?=
 =?us-ascii?Q?ciJQCXrKJRd6l2oU4f5vmK3ilrFiACO5OPJ1DhwGSUAXdyGrkG55vYVNXOex?=
 =?us-ascii?Q?BfM3mEL/TjJLwAOm652Sd14Neg2Rsfmd/Ee2H9BxXDaxELE1ghos/lTtre1C?=
 =?us-ascii?Q?euXuV75V9NeqZwKXAUZ0IKL5kJdNgHMeA64lK1EG0cVlS0AOHndg36toAl7w?=
 =?us-ascii?Q?QtL2V7D5RJ+fgfs8vaU544MzqAcD2LjI4B6fAwXWRVVUGjyqbdj3x7yWoU5U?=
 =?us-ascii?Q?xkaTng2vbbQR6J+7G47Mw7ujUahmAxi7bRGHkXtjB7c3EBfAQlDHoJB2J0ML?=
 =?us-ascii?Q?QhxoIx2l5FFljsFQNnCnZ6uBVtFyLMCnCjuBxrnaOlq2Cet+PO63WP7Q4LUe?=
 =?us-ascii?Q?Pe8vpPxXf+gSUoswzPtAOCcBnxodFoVbH/vcFr2Mgq5G4ue6cmMLrLsoBahq?=
 =?us-ascii?Q?aD/C/RTaOoQ8p5QySBBM+2gjONdBdEiSU1M6coWDEsdQVb7xsTvxzUhqdrhp?=
 =?us-ascii?Q?rlerM+CplnC12jVP2a1HfayRm2xZNPeH7HfZqQwZwuw/D/zHEwI8oAIR8ZRG?=
 =?us-ascii?Q?741SJrFXdp2zOzmyesuJrRUic28DHa2KyvGPbcT1sgD4J4iiSSXdKEM0Qm5o?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: daf6ccd3-c6ad-4e19-d94a-08db0f9d63e0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 21:41:26.4894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQq21TmdAaQjShBMBv9rLGPuvsJBckSsbFEb8fm0G/BzZnYWzxajb3wDqRy3XSuxaMiwnwpHujTuv1tYk1lSRoTnN8a3SDwBMh9rpeF9260=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7787
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 15, 2023 at 11:48:13AM -0800, Sripada, Radhakrishna wrote:
> 
> 
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Matt
> > Roper
> > Sent: Monday, February 13, 2023 4:19 PM
> > To: intel-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Subject: [PATCH] drm/i915/xelpmp: Consider GSI offset when doing MCR
> > lookups
> > 
> > MCR range tables use the final MMIO offset of a register (including the
> > 0x380000 GSI offset when applicable).  Since the i915_mcr_reg_t passed
> > as a parameter during steering lookup does not include the GSI offset,
> > we need to add it back in for GSI registers before searching the tables.
> > 
> > Fixes: a7ec65fc7e83 ("drm/i915/xelpmp: Add multicast steering for media GT")
> 
> LGTM,
> Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

Thanks, applied to drm-intel-gt-next.


Matt

> 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > index a4a8b8bc5737..03632df27de3 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > @@ -561,12 +561,15 @@ static bool reg_needs_read_steering(struct intel_gt
> > *gt,
> >  				    i915_mcr_reg_t reg,
> >  				    enum intel_steering_type type)
> >  {
> > -	const u32 offset = i915_mmio_reg_offset(reg);
> > +	u32 offset = i915_mmio_reg_offset(reg);
> >  	const struct intel_mmio_range *entry;
> > 
> >  	if (likely(!gt->steering_table[type]))
> >  		return false;
> > 
> > +	if (IS_GSI_REG(offset))
> > +		offset += gt->uncore->gsi_offset;
> > +
> >  	for (entry = gt->steering_table[type]; entry->end; entry++) {
> >  		if (offset >= entry->start && offset <= entry->end)
> >  			return true;
> > --
> > 2.39.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
