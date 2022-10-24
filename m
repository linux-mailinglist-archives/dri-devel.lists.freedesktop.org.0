Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B7260B880
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 21:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5667E10E0A6;
	Mon, 24 Oct 2022 19:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69B810E0A6;
 Mon, 24 Oct 2022 19:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666641003; x=1698177003;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9LrywJjV+cSDqqWs3TdA0oKU2dvTHS3cozfJD+zMdpY=;
 b=P2DQbzv2V+7/gyIxkYNls8dfbHnJO+kJR8p5ad8UQqLucJ/5g1DpiJ6h
 IetMy13Xv6WVLa5e/qTfhCO+liJ2+L1HkSqJREz6PPLehB4Lte4dWktZ5
 VWWh5WAW3MaNwHtkK2I9+q1PHfaRqIyR8kWNDXFOYdpJxpVGlL70/JPCi
 wl/6Wvgl5fNVYc7YT3/ps4zptmhaA0xfO0KHvp1qHHYcTek1kCEPX0bfp
 NHRaEFwfTtXj3EbY+AC+fgbD2CQpSKGqzI21GB7G73mMuDLmiHsnuzG5h
 T2HDwSBMaA0hRkC4c7Tf6nq6ml8wtNkrjOpWMUtyXwyWIZ1k0h/cTVh7p A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="393823383"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="393823383"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 12:50:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="664656990"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="664656990"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 24 Oct 2022 12:50:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 12:50:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 12:50:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 24 Oct 2022 12:50:01 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 24 Oct 2022 12:50:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPZR8Zlb0dPiU/rzUNXum4DSK2N+D4QDZoNK8/OY2LlsM+LPWec2Hc2ah8K6SG0eO5vjPSFD9M22zbKis6u4eJr3+sOvtFoCSr9Hgo4vX3H8KJLVNRKp3akHr2I3xUdssnWYy+pUFVrAaC/Kwv49PiWbIzJBdXpLrZcWyirvUelOfqn2d6O69md/kPh7b3rPOkmQzlxS727WwXE49kS0N7dN/47jpQTlGzJVu3JJGaO3LRl+ZRXETZzyOtLorb0yUQ6jG9GuemLl3xOOPmY/wRfDUSXXPo1n3PNtbllTi2TcSJIHSl3kEKeUVALgL3hSgrhL/sK/TEtXD6Cloj6uLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vopY6dSwGRvAAbPJMkMEf5WEzlAZDRk4dkOsIphHWc8=;
 b=eGku3f3gOMV19lbjbzPB9lj+Wxa/1P1bRcXfgAjG4K3X4IcltBB984hUgSa64ribPHCDCAh+nXUzq6WnXCRY+g7D3Ygn0OXGX7sN2FD6UCWDZ1NglxVsw9TBRNuT05l5vyMJVyX6XSe+DOi2D8CDPxkL8PDyqEJG16C2Dpw77l2WWJkZQRSZmc7agSvp7Kl7ekFw1/521XGGZG73y8BG3+HJUPRdBxNy/JsgbflR214z7krJqgelV8t/6MPLUBoA3abvWjxqLw32KjM5ao3bVxUyruo/ixBAQo+GV1d6zb9yE6E6aDpOXcsUpx7r0RQvF2XUrUvtrEI7AOWh/imJ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4560.namprd11.prod.outlook.com (2603:10b6:806:93::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Mon, 24 Oct
 2022 19:49:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::29e1:56c3:823b:45d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::29e1:56c3:823b:45d%4]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 19:49:59 +0000
Date: Mon, 24 Oct 2022 15:49:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 5/5] drm/i915/mtl: C6 residency and C state type for MTL
 SAMedia
Message-ID: <Y1bsY41GelQ8NTdV@intel.com>
References: <20221019233721.3270601-1-ashutosh.dixit@intel.com>
 <20221019233721.3270601-6-ashutosh.dixit@intel.com>
 <Y1LKVLXFJ46PDFRK@intel.com>
 <87pmehowvn.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87pmehowvn.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4560:EE_
X-MS-Office365-Filtering-Correlation-Id: d0d1fbb9-38b0-4636-7ee8-08dab5f8ef09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GHfo68VZDGYBflkg0y8b2tg5o0Rl13YtdOsaSwCc9Lu8wfxFzpBGc6vlOCYZlpDeCwQUGLnihRXrcafUqjts48brgCPw+sdqLldjJxsoB6AWPwqNajwZF18P+FzO2Kk9PIYQjvcsEy+vvLkg3vH31i+oTeY6jCn3DaczeqCViLmGhIXNb20j3C7G0tVC2l5nU+J7uXN7o/BP/bdedgJGq9n7vP5AAhmdYRm5W2ZU24w5IfcwaB+a7evg+dqx2gkm9iKF1madi+wKG140BGBbPOvUpDSSCBLAef17dsqIcp0Myo8dxpK0VgzTg9YsALxGH6oHT/Y4N1FBMPpIiTOoXQDhjfh/0Kh0e2sIrEOUxDlf486uNG8ybHp5sySMaZo8O1/uFyQOm7+pC6SEXSEF9scyUpJK7VKk4JpNW63H/8AvdqNrxrZh8BDzo5IuAkuQjzksb9HbBLV40WlT4r5ZBFIdBzM4MzqneBsF2lTdfwdIDlJlhb4wHgG1ydwxtjTAvFGiEriUxqLfer3l6+nOIDOUjsIm7A1uQ2gO260gOO654cZWYdD4inb2spcRwJrwohjTGPzuOgfP53FMhQ+3rHc00G0Ul98K8PPdBC2LPhKUn9arr+G4wEX2Ag4ZeLOCpyPbbMUQ8C5s+YENtohyGWo2S/9+yMSadg6jZV01uQo2aJfg8XoW0039hOX/vFoJIHkE30uIdBWUZu4MwxwMOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199015)(6486002)(478600001)(38100700002)(82960400001)(5660300002)(6862004)(54906003)(8936002)(6636002)(37006003)(4326008)(316002)(6506007)(66556008)(66946007)(41300700001)(8676002)(6666004)(450100002)(83380400001)(66476007)(2616005)(86362001)(6512007)(186003)(26005)(44832011)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?int0fJ1x69ogRlu17pnLHTu9KFg3rUo66Mi1hlUGvumeHAdxhLJrD3Pc3krn?=
 =?us-ascii?Q?8/QFJCDlvJe3PwjRQHjBT/ox1V2qLd7mba+p6pRMbGfpTUuHw+ccN9lj85A7?=
 =?us-ascii?Q?5OiqK2bnsIMFvjKgEjonCgznKNfCRiAz5nNhQTULGlD5n71mqAJ0bKV/V/xm?=
 =?us-ascii?Q?IJd8zwzjP03cvCbThH9LC4qjhR7jlGgYIfWAFUgHjMJx/INHrcLVFwa8UdTW?=
 =?us-ascii?Q?IpKpYQQedSibJJ86nkUiUTYfpXWXeUp6BIDc8iNIN+BP0aAlvAzF8mELOGjz?=
 =?us-ascii?Q?gLzxgTYoU8h4nGh7pwXR0pl8aIhG72lSF7Rul5uNiwosB2Oqdy/ysaOQMJ0G?=
 =?us-ascii?Q?wvDs+9zdEuTOf104C+DUeZZaIfY1iyIG0F9u4Ybm5VreNNCl+d7wNB14QRx/?=
 =?us-ascii?Q?VK60FK/5qChmL3VE4E7zhI15ghQJ5yEWeoWCxoOf+gw95f3xA17Zd8Cw+nTX?=
 =?us-ascii?Q?Tdz8pyuaidfTCi0dHBG3fI6GDEKK6rKaM1QmEdbLeZpc/3517F5t8XiI3VOT?=
 =?us-ascii?Q?prjAYPFH5m6HdMVyjsfVhUh1AJATS7zB7/zvoLAMT170Tpg2pAc/PNuif2y6?=
 =?us-ascii?Q?AOBFHbmfF2HY+DhsUqHQF7EyG5+Gk/b40e1qHDwYN6TcwzQlI4bu68mowxKk?=
 =?us-ascii?Q?Ii4h4UZ4AvaY8f1SwKyZuMhosS+7egXtiwKqKln+Rzl/oq9B2FXRGqKu79pN?=
 =?us-ascii?Q?MBNA+HzCTtj0gF0dI6Yqj5XWBdgJ9LL7lg9AFFmxmOtB5WSSF9GgMpOHNvXM?=
 =?us-ascii?Q?ZJOkPWNnTVgsSayoGBu+XvKosgmO+PkIV40h6T6HsDm/6GXIF8Q7a2o2lyDI?=
 =?us-ascii?Q?99Si/kS8+nl6QpMC+o+is30fGG/YlND5jpBHKTvbttY3fsrz/yl8MyM1m913?=
 =?us-ascii?Q?GyTnehqfZSnK5pQjTSbbhDofNgpSxIJKP0escLICgm6YtrhPzHPqHO9OyRVy?=
 =?us-ascii?Q?lgAvh5vZOY+yFM8Kbk4R2C8ZzAHDoyHFMAWuM+m2EfqfFVQDAq972iDWhkeP?=
 =?us-ascii?Q?ayoQKh858Cs0lr3jca5jMoPEaif6bB/Wzlvj6MOg3XCbrrfAcuVFNbELZL8b?=
 =?us-ascii?Q?JZweX0XvYfzttBhmRGkEpC/LjTci3LX39WehccBR+iNt1YrOmLkQ3JZkBLVE?=
 =?us-ascii?Q?jnkGEhdsUSGl9i9VCpREwMcta6vmAAQ03426/JVz2zD7JAka4ih0E6d/stCe?=
 =?us-ascii?Q?c+iDFsLqxNdIO/oe45/+mFbO26ObQ8I90d0lA8osCaAfkoBoyVkqmVw9ODTG?=
 =?us-ascii?Q?lQixm7ouDfEJUFVVbpso5hmVy1PLEVWrD5sHJb/Rkltnh/GmoASM3QLFls7s?=
 =?us-ascii?Q?iE+8GFAO80Pr73Em4ZJpH2KkvOiaI9wJh6oq50PtVrwHt24riZqgyZY5CltF?=
 =?us-ascii?Q?m1PG3CzMWQcLVdEwJHijCQuPEOTvSOGeT0EZFl48PAGSroyVezLalf6YpxTP?=
 =?us-ascii?Q?vbXkGoqAYO3he6csvuNz7qGpDp6HbmawC8v0Bceost5RuGdyamBW+RARACPy?=
 =?us-ascii?Q?VIRG9YuEz9VInzxxYnywUgnJrSTkNpRwX6knXPlktiXrxBvaDuYDBuIlNshs?=
 =?us-ascii?Q?XuyIxu3kX4RLaaeYe/QTGXJc3lj9xxXztD9SU97mSMa+q1xe89jLjgPbjs2C?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d1fbb9-38b0-4636-7ee8-08dab5f8ef09
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 19:49:59.6364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rFigvStiDcplaHt2V7RZrFdJLtaVFg9BoYCuEuVj5s3FMQQTX/NeHpPYKIfGZFCVkcGMSRAsJz4YGIbhULhJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4560
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Badal Nilawar <badal.nilawar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 24, 2022 at 12:16:28PM -0700, Dixit, Ashutosh wrote:
> On Fri, 21 Oct 2022 09:35:32 -0700, Rodrigo Vivi wrote:
> >
> 
> Hi Rodrigo,
> 
> > On Wed, Oct 19, 2022 at 04:37:21PM -0700, Ashutosh Dixit wrote:
> > > From: Badal Nilawar <badal.nilawar@intel.com>
> > >
> > > Add support for C6 residency and C state type for MTL SAMedia. Also add
> > > mtl_drpc.
> >
> > I believe this patch deserves a slip between the actual support and
> > the debugfs, but I'm late to the review, so feel free to ignore this
> > comment...
> 
> Sorry didn't understand what you mean by "slip", you mean the patch should
> be split in two?

yeap, I meant split.. sorry for the typo...

> 
> > but I do have more dummy doubts below:
> >
> > >
> > > v2: Fixed review comments (Ashutosh)
> > > v3: Sort registers and fix whitespace errors in intel_gt_regs.h (Matt R)
> > >     Remove MTL_CC_SHIFT (Ashutosh)
> > >     Adapt to RC6 residency register code refactor (Jani N)
> > > v4: Move MTL branch to top in drpc_show
> > > v5: Use FORCEWAKE_MT identical to gen6_drpc (Ashutosh)
> > >
> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 58 ++++++++++++++++++-
> > >  drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  5 ++
> > >  drivers/gpu/drm/i915/gt/intel_rc6.c           | 17 ++++--
> > >  3 files changed, 75 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> > > index 5d6b346831393..f15a7486a9866 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> > > @@ -256,6 +256,60 @@ static int ilk_drpc(struct seq_file *m)
> > >	return 0;
> > >  }
> > >
> > > +static int mtl_drpc(struct seq_file *m)
> > > +{
> > > +	struct intel_gt *gt = m->private;
> > > +	struct intel_uncore *uncore = gt->uncore;
> > > +	u32 gt_core_status, rcctl1, mt_fwake_req;
> > > +	u32 mtl_powergate_enable = 0, mtl_powergate_status = 0;
> > > +
> > > +	mt_fwake_req = intel_uncore_read_fw(uncore, FORCEWAKE_MT);
> > > +	gt_core_status = intel_uncore_read(uncore, MTL_MIRROR_TARGET_WP1);
> > > +
> > > +	rcctl1 = intel_uncore_read(uncore, GEN6_RC_CONTROL);
> > > +	mtl_powergate_enable = intel_uncore_read(uncore, GEN9_PG_ENABLE);
> > > +	mtl_powergate_status = intel_uncore_read(uncore,
> > > +						 GEN9_PWRGT_DOMAIN_STATUS);
> > > +
> > > +	seq_printf(m, "RC6 Enabled: %s\n",
> > > +		   str_yes_no(rcctl1 & GEN6_RC_CTL_RC6_ENABLE));
> > > +	if (gt->type == GT_MEDIA) {
> > > +		seq_printf(m, "Media Well Gating Enabled: %s\n",
> > > +			   str_yes_no(mtl_powergate_enable & GEN9_MEDIA_PG_ENABLE));
> > > +	} else {
> > > +		seq_printf(m, "Render Well Gating Enabled: %s\n",
> > > +			   str_yes_no(mtl_powergate_enable & GEN9_RENDER_PG_ENABLE));
> > > +	}
> > > +
> > > +	seq_puts(m, "Current RC state: ");
> >
> > (Just a "loud" thought here in this chunck, but no actual action requested)
> >
> > should we really use "R" (Render) for this Media C state?
> 
> This function is called for both render and media gt's. But let's think
> about this. We can call easily call them e.g. RC6 for render and MC6 for
> media too if that is more accurate and descriptive. On the other hand, do
> we really need to introduce a new term like MC6? Maybe we just stick to
> RC/RC6 terminology for anything on the GPU?
> 
> > But well, MC6 seems to be a totally different thing and CC6
> 
> MC6 is not the same as RC6 for the media tile?

I saw people using this in some bug, but I thought this was for the package
since they were refering to the rc6 as well...

so you can see how  confusing this bad naming is by itself... not a single
document or bspec page that put a good name we can use... so let's not
invent it here and move with the RC6.

> 
> > and CC6 is really strange because the C stands for Core and this can get
> > very confusing with the SoC or CPU C states...  :(
> 
> Yes Bspec 66300 refers to these as core C states but refers to GT and
> IA. So it's confusing.
> 
> > At least with the Render we know which level of the IP we
> > are looking at when looking at media...
> 
> Yup that's why I've left this as RC/RC6 in Patch v6.

ack

> 
> >
> > > +	switch (REG_FIELD_GET(MTL_CC_MASK, gt_core_status)) {
> > > +	case MTL_CC0:
> > > +		seq_puts(m, "on\n");
> >
> > maybe "*C0" instead of "on"?
> 
> Done in v6. Though this string is "on" also in the previous function
> gen6_drpc. Also, if we are calling this C0 we could call the C6 state as
> just C6 (which would mean RC6 for render and MC6 for media). But I thought
> RC6 is better for both render and media.

oh, now that we agreed on staying with the RC I believe RC0 is better.


> 
> >
> > > +		break;
> > > +	case MTL_CC6:
> > > +		seq_puts(m, "RC6\n");
> > > +		break;
> > > +	default:
> > > +		seq_puts(m, "Unknown\n");
> >
> > maybe use a MISSING_CASE() here?
> > or raise a WARN?
> 
> Done in v6.
> 
> >
> > > +		break;
> > > +	}
> > > +
> > > +	seq_printf(m, "Multi-threaded Forcewake Request: 0x%x\n", mt_fwake_req);
> > > +	if (gt->type == GT_MEDIA)
> > > +		seq_printf(m, "Media Power Well: %s\n",
> > > +			   (mtl_powergate_status &
> > > +			    GEN9_PWRGT_MEDIA_STATUS_MASK) ? "Up" : "Down");
> >
> > gate is up and power is down or gate is down and power is up?
> 
> Yes name is confusing but is the same as Bspec and also gen6_drpc. So the
> prints "Media Power Well: Up" or "Media Power Well: Down" are correct (0 is
> down, 1 is up). Similarly for Render below.

:( oh, indeed!

Let's stay with it.

> 
> Thanks.
> --
> Ashutosh
> 
> >
> > > +	else
> > > +		seq_printf(m, "Render Power Well: %s\n",
> > > +			   (mtl_powergate_status &
> > > +			    GEN9_PWRGT_RENDER_STATUS_MASK) ? "Up" : "Down");
> > > +
> > > +	/* Works for both render and media gt's */
> > > +	intel_rc6_print_residency(m, "RC6 residency since boot:", INTEL_RC6_RES_RC6);
> > > +
> > > +	return fw_domains_show(m, NULL);
> > > +}
> > > +
> > >  static int drpc_show(struct seq_file *m, void *unused)
> > >  {
> > >	struct intel_gt *gt = m->private;
> > > @@ -264,7 +318,9 @@ static int drpc_show(struct seq_file *m, void *unused)
> > >	int err = -ENODEV;
> > >
> > >	with_intel_runtime_pm(gt->uncore->rpm, wakeref) {
> > > -		if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
> > > +		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> > > +			err = mtl_drpc(m);
> > > +		else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
> > >			err = vlv_drpc(m);
> > >		else if (GRAPHICS_VER(i915) >= 6)
> > >			err = gen6_drpc(m);
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > index d8dbd0ac3b064..a0ddaf243593c 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > @@ -24,6 +24,9 @@
> > >  /* MTL workpoint reg to get core C state and actual freq of 3D, SAMedia */
> > >  #define MTL_MIRROR_TARGET_WP1			_MMIO(0xc60)
> > >  #define   MTL_CAGF_MASK				REG_GENMASK(8, 0)
> > > +#define   MTL_CC0				0x0
> > > +#define   MTL_CC6				0x3
> > > +#define   MTL_CC_MASK				REG_GENMASK(12, 9)
> > >
> > >  /* RPM unit config (Gen8+) */
> > >  #define RPM_CONFIG0				_MMIO(0xd00)
> > > @@ -1512,6 +1515,8 @@
> > >  #define FORCEWAKE_MEDIA_VLV			_MMIO(0x1300b8)
> > >  #define FORCEWAKE_ACK_MEDIA_VLV			_MMIO(0x1300bc)
> > >
> > > +#define MTL_MEDIA_MC6				_MMIO(0x138048)
> > > +
> > >  #define GEN6_GT_THREAD_STATUS_REG		_MMIO(0x13805c)
> > >  #define   GEN6_GT_THREAD_STATUS_CORE_MASK	0x7
> > >
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
> > > index 6db4e60d5fba5..2ee4051e4d961 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_rc6.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
> > > @@ -553,10 +553,19 @@ static void __intel_rc6_disable(struct intel_rc6 *rc6)
> > >
> > >  static void rc6_res_reg_init(struct intel_rc6 *rc6)
> > >  {
> > > -	rc6->res_reg[INTEL_RC6_RES_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
> > > -	rc6->res_reg[INTEL_RC6_RES_RC6] = GEN6_GT_GFX_RC6;
> > > -	rc6->res_reg[INTEL_RC6_RES_RC6p] = GEN6_GT_GFX_RC6p;
> > > -	rc6->res_reg[INTEL_RC6_RES_RC6pp] = GEN6_GT_GFX_RC6pp;
> > > +	memset(rc6->res_reg, INVALID_MMIO_REG.reg, sizeof(rc6->res_reg));
> > > +
> > > +	switch (rc6_to_gt(rc6)->type) {
> > > +	case GT_MEDIA:
> > > +		rc6->res_reg[INTEL_RC6_RES_RC6] = MTL_MEDIA_MC6;
> > > +		break;
> > > +	default:
> > > +		rc6->res_reg[INTEL_RC6_RES_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
> > > +		rc6->res_reg[INTEL_RC6_RES_RC6] = GEN6_GT_GFX_RC6;
> > > +		rc6->res_reg[INTEL_RC6_RES_RC6p] = GEN6_GT_GFX_RC6p;
> > > +		rc6->res_reg[INTEL_RC6_RES_RC6pp] = GEN6_GT_GFX_RC6pp;
> > > +		break;
> > > +	}
> > >  }
> > >
> > >  void intel_rc6_init(struct intel_rc6 *rc6)
> > > --
> > > 2.38.0
> > >
