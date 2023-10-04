Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3739A7B8281
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 16:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB8510E39C;
	Wed,  4 Oct 2023 14:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9342D10E142;
 Wed,  4 Oct 2023 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696430272; x=1727966272;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1/YpaC5SNnFS+thTryZS0yzsPXYE3u7NMvE3nVAc9YU=;
 b=h6YGdfYn80ww4Lr0zzF3px6jHxNa3ngcDfByNnxxyG68xEGJyrqBa3Yj
 taksLWEtjilOXH6fYMrRgF6zy0sO5/eB0Wo2DnW4Erv6iOnxtvKZbgXWV
 i3YdFzed0XfwSicY4PVMGo45ftjZiDXjk870fWH60xFCDUCV+IJixhzvc
 ovAf//3JF4EdQUat6ZW/+n8QlFXCaW3g37s+R+Kep8/eqi6IK0Q92a3F2
 xYZY10ZbyJFfNpmZ0ZzeMEvX22RXFsC02UH8DysElVjIF3gYbmK+bJpJ8
 aVueR+2R8bDkIdX4OFaWxm5nCScBSSESN8E0VbSAaSRjNdehDIFWQrPP8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="387053757"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="387053757"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 07:37:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="817124264"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="817124264"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 07:37:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 07:37:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 07:37:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 07:37:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbNkknx9pPPeLkWfsSYQy3yUCWZ+/3LqG0YTDCUaAVFvFo7aboy+MRB8UHCnrJRCfp6kljqFVRCnu1q6Pj9zbKpVdrgH2rY9bvxnkT0Zlknr93BsVvHWe+kLp629IL6s8zElkEb4ulPZYF3lBMigha9maBtp3cTxQx58ffgF/gH8sucDD587cDJwJcvZatVw5raaOP4Cm2b/seVhK7oJpp028adzFO7kVn0Y1sfDfTxUlvkWG9Q5HxYLBBMTZFZtxfQrUn6VMDSJrxAgBaMM58mmVvG0rwP6fdZoal7iBcBwonkERFeeaEMLp6iwkNSFvqJuUDmT77Vga9mcSIyK/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvOVajb/Tgwsb82OCC4U2uJueBVSnqgDHr/XJNOY410=;
 b=YOxh1jPgCvhu8CFxQiovJHfdIuTGqhqNH+uU+v6ZtWg9SUkVP/zt0DelhBz33mppjL6VUanS7sekp2/foxKvBbA4PubZHZclvh5vggkSng/eKMesnzLHFs3pXuZPIYuYYcZE/tfrKC1tAwly8+O/Ab0Z7oDk8GxqZm4BMC0GXdvyOZM6m/tz7tjeekMMBd3RCsRsq0SsMJlz5LlMlGCbbfoxU9Or76yuFWRXksmMhFxX1HXVBdmiuJqkigCU21BRqmV4/jLxwvSADsBEzPPCsb7ufHEcASRwYLpyUCx70LP06nIAE25052IUMTb1LLFzo3w0c77ErFkRbGEJnQOX6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6477.namprd11.prod.outlook.com (2603:10b6:8:88::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Wed, 4 Oct
 2023 14:37:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 14:37:33 +0000
Date: Wed, 4 Oct 2023 10:37:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Reduce MCR lock surface
Message-ID: <ZR14qGUlWRRIlREX@intel.com>
References: <20231004120407.12251-1-nirmoy.das@intel.com>
 <ZR1eOHqOFK57OURn@intel.com>
 <e01e301b-80a8-bf5c-b14c-695ab086d571@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e01e301b-80a8-bf5c-b14c-695ab086d571@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 66936df8-3c44-4a9f-e56a-08dbc4e771f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8czOh1NcahMbUvVXvD0i+ZCVLZvPNgJDPnblj8RTW92dU7tY7ioWFMFrga/hN/iiL5s6oIcV1mo38Sx/k127QhS+h8mS0iLr+xxDWT9aS9egGpbdJtJPZlxGlVTrcQKc34Tfxu3el3QMX4yy26qz8haig0ytFsxlUfs2b58oDeCan713fjBLn34rUCreVDOzp/3/ekBLuyqu3bE7u1JSJAd/A1c51INkBxOu0hO2IumsSvNZAZ0OEBJXrreGJxJ/XIBzlZZqEiWvnVNQ8XuwiApZ1NQIRNTiis0qP12KAld394bf2vYBfBS6qjU2hRQKOwGqTqCe4PAY7uGphud9t6eeO5usalK6mSq9LGeD7QjJGeO8VqoWbj+scNZeqfe1C2vLZ1hz+4jPN40AIZvLM8PIe7vBCZAh3GzuAZuu/p9pDMH9lmtlmeO4AuLao8GHWCbD4rGiTbVd56oeeTr+z8cMs75mm6lPVyOYn/lBa+CmT2m0iMPTmJDJrPYAXNtBtlxH2Z4wycfczknqexfBqhBZboYhO6E+1bg4fp3wg5U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(41300700001)(6486002)(966005)(2616005)(478600001)(316002)(53546011)(6506007)(66946007)(6916009)(6512007)(66556008)(66476007)(6666004)(44832011)(8676002)(4326008)(8936002)(5660300002)(26005)(2906002)(83380400001)(38100700002)(82960400001)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Z+uc6/dC+YRpNuu1nsQOrR2swJzznPhup2Vzr0jnrFcPsKyj/lMdj9JJ2C?=
 =?iso-8859-1?Q?oQU+d3xpWSpYj/6IegVzh53uhc9q+IMCcxuFbk1+rmezw6QcNlfom88MAY?=
 =?iso-8859-1?Q?mI8TQe1TL5I/dFBBdhKbWKg6jEFd6GS5MJG5ibDmkzOczkCEkChBi620tJ?=
 =?iso-8859-1?Q?/FM4aLeRh2ai+II0NcB+6wlkLQyfv8dl0ZsBuOi8IaPUhJchVDKxdcapK7?=
 =?iso-8859-1?Q?+0Ju7JItgJ/OSwPPoakI/5UhMA759ZXV9s2vnL1f6DzYWuOwmjrvamnWTO?=
 =?iso-8859-1?Q?UJ3OwuWipP052VdkLxrj5dDrVpYyQmJoaSZ24zTnCfW4C6AObGcivgRNSg?=
 =?iso-8859-1?Q?3qoUneDcZq+6p12Lb1zfwSUxJ3oARY40fefktQKhEeP6xbTpON5qraoh3A?=
 =?iso-8859-1?Q?J4m0p64aXvmM/xK4Lczsd//icX2DtROES4UJcryq3ZrEGLTA0nnQX4kPqg?=
 =?iso-8859-1?Q?3cCN9791a/pAOHQ3rN5OUieN52JrPLsMPKK2rN1hLzPSI9iL77IcRpGKpB?=
 =?iso-8859-1?Q?j22+zezaA4B0iAsnFiBjwxI5075yCsxdLeeE3/XpCHZvcsLz2x4ww5g8Vf?=
 =?iso-8859-1?Q?bSOrEMug9GpFfCNvC0BQvkzzUCQCIqRck+6ga5JhZCE5peGOFBJ2GJcKv0?=
 =?iso-8859-1?Q?A8wRgjqmBlVGO/I8Qjfg5oOKc4N5U2N35IFkdfkY/YIVG4C6/RwZ7LFvF7?=
 =?iso-8859-1?Q?XOTKy9pb3BLlytGJ1BkxT5J/o//5mP94hCLEw0CgkH2P8Z6pY8rbbXak7J?=
 =?iso-8859-1?Q?jN4rTxmSUCI1F2ZIOtEpUwA8DRdVGCyr9PJixT6IIs/qCZXkl295FxNf0A?=
 =?iso-8859-1?Q?/0sPokXeUHkZ/YVAYN8pEabgAiXLM/2y0EMeX5YuNFjpexiaPa0IKe5rbE?=
 =?iso-8859-1?Q?yhjZplzABZpiF6/4I0395xtlIwbxMy2V1tSF1EKVIIpOhmlbFz8GIiqhLy?=
 =?iso-8859-1?Q?K7wjcNO4789JFIRE4v+8IXYMFgdZ1J2VhTnCmWDAaPWkpnk45UlnXbab8e?=
 =?iso-8859-1?Q?nF7tHizgmI3OWVg6ceAScz4q/4da6HWhQewDJCwaJd9LWXr96DUmun3pmk?=
 =?iso-8859-1?Q?KHMgSq9BcXbmxsgb/78XVs5emyy1EFjuAQZmyqYP8LFN9won3pHRyR81B5?=
 =?iso-8859-1?Q?WbCPaCUkgXjmI5zT3FHyrpOgfZJABkQkCUKTooHWGbQG2fxeyl77FI7eSl?=
 =?iso-8859-1?Q?Fm6p7cOSmOYuzIeZ7qYg458aomT3hQP60yimqUNBDjWNUlLfuhQxIZfe3v?=
 =?iso-8859-1?Q?7PXZBa8dWgb7TxdboQPjY/rZjNxdtbrtVYU4u643W/X5X83iN05gBREsTO?=
 =?iso-8859-1?Q?batDVYcMnsqnZJ/BYKcrvWY0dnRUJPmt4AT0P0aRkzcrpSbfj93NisK/DL?=
 =?iso-8859-1?Q?S7kGEXFUQ7rSwVAWQdECo3cby0osZY+dt2rOE58P1PUZ3Uq04l2+HQvBBd?=
 =?iso-8859-1?Q?UycI+OyHjifyR3hUQtQuC4DY66H0ZGUHcNIJOS5dAY9RwzgqWVW0LNEOiS?=
 =?iso-8859-1?Q?iRyFN3skkG73mxCaZLL1ko7F+iybSv+NC4thz3JS2BK9RUjJ8iNX7qPefL?=
 =?iso-8859-1?Q?iUNWY4PK2uAiTt8Rt2vu4LavOdjZug1xa5347pT7mp7m07noGCzayBck+z?=
 =?iso-8859-1?Q?KBBZ7lOAAZWoOMlRxEW57EC9qajAgjEt2LhU54I4CuUmREJy1NLERYdw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66936df8-3c44-4a9f-e56a-08dbc4e771f2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:37:33.6611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y39Gyunq3zIpusX4eIgtPFmLiiijYCjcJAOKXlH4mdeQWQgREw5R1tfJncwagJbOT1BvNUjIcd653XqCWC+tHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6477
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
Cc: intel-gfx@lists.freedesktop.org, matthew.d.roper@intel.com,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 03:54:59PM +0200, Nirmoy Das wrote:
> Hi Rodrigo,
> 
> On 10/4/2023 2:44 PM, Rodrigo Vivi wrote:
> > On Wed, Oct 04, 2023 at 02:04:07PM +0200, Nirmoy Das wrote:
> > > Take the mcr lock only when driver needs to write into a mcr based
> > > tlb based registers.
> > > 
> > > To prevent GT reset interference, employ gt->reset.mutex instead, since
> > > intel_gt_mcr_multicast_write relies on gt->uncore->lock not being held.
> > This looks a lot like protecting code and not protecting data [1]
> > 
> > But to be really honest I'm afraid we were already doing this before
> > this patch but with 2 other locks instead.
> 
> I haven't thought about that but yes, the issue was there already.
> 
> 
> > 
> > [1] - https://blog.ffwll.ch/2022/07/locking-engineering.html
> > 
> > > v2: remove unused var, flags.
> > > 
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/intel_tlb.c | 13 +++++--------
> > >   1 file changed, 5 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.c b/drivers/gpu/drm/i915/gt/intel_tlb.c
> > > index 139608c30d97..0ad905df4a98 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_tlb.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_tlb.c
> > > @@ -52,15 +52,13 @@ static void mmio_invalidate_full(struct intel_gt *gt)
> > >   	struct intel_engine_cs *engine;
> > >   	intel_engine_mask_t awake, tmp;
> > >   	enum intel_engine_id id;
> > > -	unsigned long flags;
> > >   	if (GRAPHICS_VER(i915) < 8)
> > >   		return;
> > >   	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
> > > -	intel_gt_mcr_lock(gt, &flags);
> > > -	spin_lock(&uncore->lock); /* serialise invalidate with GT reset */
> > > +	mutex_lock(&gt->reset.mutex);/* serialise invalidate with GT reset */
> > I'm still looking at this and the commit message above and trying to understand
> > why we are doing this and changing the previous 2 by this other one. why?
> 
> 
> We need the MCR lock only for intel_gt_mcr_multicast_*() so I am not
> replacing the two locks here but moving the mcr lock down
> 
> where we were doing intel_gt_mcr_multicast_write_fw()
> 
> 
> why s/spin_lock(&uncore->lock)/mutex_lock(&gt->reset.mutex):
> 
> intel_gt_mcr_multicast_*() expects gt->uncore->lock to be not held

is there any lockdep assert or primitive that we could/should do
that to avoid this same issue in the future?
anyway, this is also another thing that it is important for the
commit message.

and why is that? what I have in mind goes along with the comment
above intel_de_read_fw():
"""
Access to registers should
 * therefore generally be serialised, by either the dev_priv->uncore.lock or
"""

> and to
> achieve this, I could do something like:
> 
> if (engine->tlb_inv.mcr) {
> 
>      spin_unlock(&uncore->lock);
> 
>      intel_gt_mcr_lock(gt, &flags);
> 
>      intel_gt_mcr_multicast_write_fw
> 
>      intel_gt_mcr_unlock(gt, flags);
> 
>     spin_lock(&uncore->lock);
> 
> }
> 
> Or take gt->reset.mutex instead which should block any concurrent gt reset.
> 
> If this is not acceptable then I can pick the above 1st option but I am not
> sure how safe is it do release uncore->lock and then take it back again.

hmm... probably the gt_reset one is better than releasing and grabbing it
again.

> 
> > 
> > >   	awake = 0;
> > >   	for_each_engine(engine, gt, id) {
> > > @@ -68,9 +66,9 @@ static void mmio_invalidate_full(struct intel_gt *gt)
> > >   			continue;
> > >   		if (engine->tlb_inv.mcr)
> > > -			intel_gt_mcr_multicast_write_fw(gt,
> > > -							engine->tlb_inv.reg.mcr_reg,
> > > -							engine->tlb_inv.request);
> > > +			intel_gt_mcr_multicast_write(gt,
> > > +						     engine->tlb_inv.reg.mcr_reg,
> > > +						     engine->tlb_inv.request);
> > you are already taking the forcewake_all domain above, so you wouldn't
> > need to convert this to the variant that grabs the forcewake underneath.
> > 
> > Also this is not mentioned in the commit message above.
> 
> intel_gt_mcr_multicast_write() takes the mcr lock for us, helps replacing multiple lines into one.
> Will there be any side-effects for that ?

hmm... I can't forsee side-effects here... but I'm asking myself why on the non
MCR ones we are using the global forcewake_all and the _fw to start with.
Maybe there was a reason for that? Because in general we should prefer the non _fw
variants to start with. Maybe we should dig into the history there to understand
why the line below started with the intel_uncore_write_fw below?

> 
> I should've added that the commit message.

I'm even wondering if this should be 2 separated patches?!

> 
> Regards,
> Nirmoy
> 
> 
> > 
> > >   		else
> > >   			intel_uncore_write_fw(uncore,
> > >   					      engine->tlb_inv.reg.reg,
> > > @@ -90,8 +88,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
> > >   	     IS_ALDERLAKE_P(i915)))
> > >   		intel_uncore_write_fw(uncore, GEN12_OA_TLB_INV_CR, 1);
> > > -	spin_unlock(&uncore->lock);
> > > -	intel_gt_mcr_unlock(gt, flags);
> > > +	mutex_unlock(&gt->reset.mutex);
> > >   	for_each_engine_masked(engine, gt, awake, tmp) {
> > >   		if (wait_for_invalidate(engine))
> > > -- 
> > > 2.41.0
> > > 
