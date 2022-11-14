Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF6A62894F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 20:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB1210E30C;
	Mon, 14 Nov 2022 19:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8F110E10A;
 Mon, 14 Nov 2022 19:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668454152; x=1699990152;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4wH9jhETq03LzXdJ+aaDZnidmeU96AGC4NpugypESxo=;
 b=RSTaDYjF3GfvZaepqRFgHMxH42J9n1nLgn0zp8Nqu67FzVzyPGFM6d0C
 TEQbB6ZQ6o8uWGa8zAIGx22+lf8CwWsnp+xwpOJPBwkZGzDzzDGZtA0J/
 yO9Z32hgEAhm+aQ6iJkDtMWdr6c48uvU0hm2t5MKfvUd9d40kf/IoM+Hz
 7JR3v1rN+O5sH6Ar1sBbCSlBL/ejPmb57IkrZoyl0P/DAD7jZ0pB3mftw
 zFPwQdR1obo2VH09pM3pYKbvHHHUvA17Jm5Yb9upPBe2l+S3cMyHgO/LT
 hh5XORAA12ra906fHgabmztyhD143nOeH0fRDCxkmv1BDmjxKS7SmBizC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="313209424"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="313209424"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 11:29:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="702135890"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="702135890"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 14 Nov 2022 11:29:10 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 11:29:10 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 14 Nov 2022 11:29:10 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 14 Nov 2022 11:29:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjwXaOR7+Q0bcdhhuTsy8aaFf5xc/Mh7806YTxSXyc/ia8HS9n00t0VS4TdxWOX4S/0MzTIi8UeQVnCfNIHA808beJVc7OY8fKsmXYimGW9HxHvilzJlySdNVoq12ikXy4E5LNSDUMJxvQwyBXKnpcdOZPnIFignSJJf1G4z6fK5nS2IcVGcbh1fSoNFbXbXfDIC5HUHRWD0oj4OmyIOqi6L8cjUPwApl2M/nq1D1YtmpFibgN6l6TANcMoVBErVFaBib21Xrm9b6ZeucBMmH9vG9NVNR7Zzkp8nh7aeHYU9UZK5EsReby0RqhalgcMgGs9YGA7LxdWYLflspWLgLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hETWmZjSzGscCCYqEcGDSrEoZ3Aytvl0WPLwzUSGRI=;
 b=lOGKbb1lybfui5Qzzx5jTB28jWm3KHXYsfM2Kv/PF2alTvG95GdnAI59T5SQzBnXQYXH+4FAZzuqm0wf3nJk/RlTIFNhd+Ee4KXki0sH27nzEg2L+7J9T4W7f6E1eHu/v/tO1/NPF9/HpGCGFbBE/2TxGI34zr+HgYXt36q9ejGw0En4ZT/vLcF+3xxv1PlJFXFHAvcRvSNKd4L25RZ/CeyUIHvszNQa5/m7xEI4D4Qf4h4N6YlYE3h34oHm+rypdsHTJKEa7RB9BN6KafePMVYeYBcz/bxZX5uNX1q4DVn4uRqLraubCU7nxemTvUnis8DrYKlen2Grx7p+YWINBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5110.namprd11.prod.outlook.com (2603:10b6:510:3f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 19:29:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%4]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 19:29:06 +0000
Date: Mon, 14 Nov 2022 14:29:01 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] linux-next: manual merge of the drm-intel tree with
 Linus' tree
Message-ID: <Y3KW/aBrF0YQQ8fd@intel.com>
References: <20221114102327.6d53341e@canb.auug.org.au>
 <33ef1207-aad7-b7cd-61ac-327e9afb0699@redhat.com>
 <87cz9p4zj6.fsf@intel.com>
 <57f57c29-cf48-67c1-b6b3-0e50e7105031@redhat.com>
 <878rkd4x49.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <878rkd4x49.fsf@intel.com>
X-ClientProxiedBy: BYAPR05CA0105.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::46) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5110:EE_
X-MS-Office365-Filtering-Correlation-Id: 52dac06a-5402-491b-7370-08dac6767eca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tXrJ2UCYsmpTYs7LALsXvLVQExBJ1lxkh2ArUz3t1R5x6mu+iK2VFvSGMPkOHLGOIfT3IGa75SNygi+anibfg92HbZn0b+cGFsIVpVPLUUFnJx00zdXxcA1hMSP3p/Oc/RXDUvOM+XHlKnGNKGwSDtA3BlNnwR/JoeqwGDD/v/vVFLJoJfUJLqO+4+mF73mrpdwKSSxm7BASARL/qwFGjbEjEuHS0oET6Z3BSg9FmRYEbo2epuxLE5+t2rtl8bzU9YoWlnKRzkwskMtn9hRd0oJjRJB94jA8ocL6zqz6vkcwHsUBHQL320KAUM4N/yxvSX9kblYJY49HIVmqBODM40SKtVuxp2LlDSHVNj3iWrpURNr5yDWt7171mAAZX1bq0ox4hOraUmZqtxR3TVXjrMlIVlD+h8tUrB7qtAHvayzkMkcUj0EXnTdfZ5TDVmcYxEAUvVsFZUY21K4eGlHmZA8s1yTd2Xbs60G1R1h0X/Lotnj/ubhuD7z/ccllo83ElnBQcqB6tPA0MsJ4LrwXg+vJuuI2xWLsM5b7KWmXpW9CxvLIx2If0aUTFM+FVDSRc2dHgUfjlQAYjUO1Pi1MUeJ/GpDJd4WJFvWWHqzkIHul/OkNySElhJzLqP3Me5BSdp7JopRNE5EQbWL6H/UBPBeR6Sjz6itW6FyJmX2VPziJIFH2rqjcdDRbgSOws84UZ1ewzMe6hF0f27oXgFU6Qw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199015)(2906002)(41300700001)(6512007)(86362001)(478600001)(36756003)(186003)(38100700002)(44832011)(8936002)(6486002)(26005)(6506007)(5660300002)(54906003)(316002)(53546011)(66556008)(66946007)(2616005)(82960400001)(6666004)(6916009)(8676002)(66476007)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aFUznKrb83nwtc0tczV2uXtNHci5/atgzBuyCGBqAQ4O94+9X1MZSiZMxg4G?=
 =?us-ascii?Q?1lpOYfW6tnuA6pm31OtyCrBOiVqF87luNeKm+Fdow9KLRAUdYnGuyRyvGF/h?=
 =?us-ascii?Q?NFcCnB8SF6PyRSFlOACpQZkrVo4KcWCJ2bPH+FU+wgeNiYMp4eW9mR6khLc7?=
 =?us-ascii?Q?wqMpQT3o674eRFyvB3vvjjxvE7TcA7IBqR8uiHtBvbTXNaaPcsjDW23vP7Y+?=
 =?us-ascii?Q?eNOjcqFc8/iT6eFfsZqOoJN/0LPqwPVbSpwKcWVlnw76EQDEXgq87jCRAkpN?=
 =?us-ascii?Q?L5dJS/YmqTy+AaYwJIRGhXMTf5facVW7gBmPn7ecI8JVsN9z3/ritadaFU/A?=
 =?us-ascii?Q?R0oenNmCLVRJSD2dwQO5RKJO8/pyujCXgjhzuZN6g3lNFpyF6NIMbwkhJBcZ?=
 =?us-ascii?Q?8n4n3ChG9lDwAeIDtPIs8lVQHvSHahc1clpw0w8BmD/uNTnXOmXw/11LNcNq?=
 =?us-ascii?Q?LOgXCVX19D5mK2SOt/FSYaTpg5/WymE/fjzx5S7ao4c55Qgmz996/QtnwV9H?=
 =?us-ascii?Q?CGJy1OOAS+IaAx1X4U/DT1IeE9NdXorR8X2pbCITzzCnpO6dmk9IC2X3Gf63?=
 =?us-ascii?Q?4MV9V0fTl4oWf4x5DbiG3HEKC+NuTJezMGJZiNmLXx2U/LeuCmNEhtA81EHU?=
 =?us-ascii?Q?Ouc+48Z8HAWbg2pBmB2IWlyFoVHEiSOv4V+Ot9vPpi9AJ+lwfFA6823CLoYR?=
 =?us-ascii?Q?cAyhljCCFoLO2moFDklGsbE4VUPwEpO5JbpWUY3ouDOnpm9Ewi4ZoFVUudyX?=
 =?us-ascii?Q?bh4UcqVXMJllNu5HLzNV3lTO1OanwU3fekmLT9ExUg7P/BdqNpPu1PlpQzpV?=
 =?us-ascii?Q?UwxscBYe6QfiMDpeVMSA3Z3b0SRPH2OFQfTk0o2MfSRPw4Yu5Mbzw0p+fWB4?=
 =?us-ascii?Q?nkB29Uy2PbzlvD6s5u265wu/usfnpsmw8KFYmqwl7hnQl+ATp2CvRaUBSIfO?=
 =?us-ascii?Q?kMCPNTS27T1QH3MENwGwMOiaFGblkAv24gl2utn7RHe/wjkvhOMZTKtlihdB?=
 =?us-ascii?Q?mumRdi4f/LyblRjsmHT85COcn70ZZr2IUVwRZm5Qqz9ocfysCoF5jHghP9Hv?=
 =?us-ascii?Q?a7Ki5RjYlHQadpRgCCObV4AjvhhvMcek0jXi2rALxglL7jO0daYRAJnJOQLp?=
 =?us-ascii?Q?Mhdn21ECf6U2rfwyG+nExNa+C+gkCAjK2PX7wK2ZfVCAQiLUvQHhyj3YRd5/?=
 =?us-ascii?Q?S/BX8l3RSIh90QwBxPHFL3cjo5vbA523HxwpDdhBJ/4KtPi1FXuSYZS0VvgP?=
 =?us-ascii?Q?qnv8lbB6HSJS/8ej9y516Om4bUdcbASiLud1H03sZwtF6wv5Dd1OTYTwdfie?=
 =?us-ascii?Q?6lddAM1DCf1Ip2HDg11+QePLV62GpjOut1tVQNmQi0b32AUSpa7iRey0++bL?=
 =?us-ascii?Q?1Nbow9+/CXAx1kHwpbFpIGdFwPH1zEs4TgIxEz5ANDq3NiyvB9jFYLy4CT8v?=
 =?us-ascii?Q?lOsfQCNAi0+bVObg7tVY0Zr9VWxjUamQgR15RQTb4a9kS7Oh/zrF14bTY9hZ?=
 =?us-ascii?Q?h1bs1PriEzXXpaFadclXgtbrQOGb6ZvIciSWgWK7/S1jzU5RLTtEIoqqZELi?=
 =?us-ascii?Q?849U5j+NAGmhNzbo7tpsuyRgYHT8VhmQzGcEeG0iku4IQHOke45mrRxMhVnC?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52dac06a-5402-491b-7370-08dac6767eca
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 19:29:06.4639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Urjm871euR9dMmbEozZQzaQzFGlW2ZR+UCh2nbVp6C3zwpD/BEz+IkI+RccfSXWcfMMiNvn6lazfJnyfjdrSyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5110
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 14, 2022 at 01:02:46PM +0200, Jani Nikula wrote:
> On Mon, 14 Nov 2022, Hans de Goede <hdegoede@redhat.com> wrote:
> > Hi,
> >
> > On 11/14/22 11:10, Jani Nikula wrote:
> >> On Mon, 14 Nov 2022, Hans de Goede <hdegoede@redhat.com> wrote:
> >>> Hi,
> >>>
> >>> On 11/14/22 00:23, Stephen Rothwell wrote:
> >>>> Hi all,
> >>>>
> >>>> Today's linux-next merge of the drm-intel tree got a conflict in:
> >>>>
> >>>>   drivers/gpu/drm/i915/display/intel_backlight.c
> >>>>
> >>>> between commit:
> >>>>
> >>>>   b1d36e73cc1c ("drm/i915: Don't register backlight when another backlight should be used (v2)")
> >>>>
> >>>> from Linus' tree and commit:
> >>>>
> >>>>   801543b2593b ("drm/i915: stop including i915_irq.h from i915_trace.h")
> >>>>
> >>>> from the drm-intel tree.
> >>>
> >>> This is weird, because the:
> >>>
> >>>    b1d36e73cc1c ("drm/i915: Don't register backlight when another backlight should be used (v2)")
> >>>
> >>> commit is in 6.1-rc1, so there can only be a conflict it 6.1-rc1 has not
> >>> been back-merged into drm-intel yet ?
> >> 
> >> That's the reason it *is* a conflict, right?
> >
> > Right what I was trying to say is that I am surprised that 6.1-rc1 has not
> > been back-merged into drm-intel yet even though it has been released
> > 4 weeks ago.
> 
> Right, -ENOCOFFEE at my end.
> 
> > I thought it was more or less standard process to backmerge rc1 soon after
> > it is released ?
> 
> The delay may be because v6.1-rc1 brought in more regressions for us
> than any other -rc1 in recent memory. Our CI's been suffering, and our
> folks have been spending a lot of time debugging, bisecting and
> reporting. (And before you ask, yes, we're going to be more proactive in
> reporting issues we find in linux-next.)
> 
> That said, Rodrigo's been in charge of drm-intel-next this cycle, maybe
> it's time to backmerge drm-next?

yeap, I'm on it...

> 
> 
> BR,
> Jani.
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
