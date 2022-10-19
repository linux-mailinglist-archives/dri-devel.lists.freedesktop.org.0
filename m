Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAEE6038B7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 05:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D45510EA5C;
	Wed, 19 Oct 2022 03:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FCB10EA5B;
 Wed, 19 Oct 2022 03:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666151210; x=1697687210;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rFGZKy+ObBX94ox7iw5G+nrDknAchdsmTfoMEFb0V+g=;
 b=hTibatpap9fQV43LzN2cI5f28NPgq0iPHLDmWCsYFOvx2O8CqXwmgdKS
 gLRhYBZ5siGZQHxk/ZIM0+ZdxQrBpb/Y8mULbSgsF1d//gRDJg0sjQvVO
 PQY3a9UZcO8EL69LELY08pnj3XdK0PmBaVOFu8NJKzsRXl05LMCfHFhwQ
 GtCHYj3x4PkBw+80fdCpCBobusXpd5Z6pX//eOUgV/HKtoBCNsmINLmNm
 piw/+D5tGbcE5o8jy4O895INchTGD5cUxBPh+AV6BrAL0KK6CLq6nRg9h
 62iUaajSanOBX8EJVgJ3RzNQw1GDTX8i1lqRXuc07JFJrdV/QRcNWHqIo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="303914038"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="303914038"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 20:46:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="754376842"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="754376842"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 18 Oct 2022 20:46:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 20:46:49 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 20:46:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 18 Oct 2022 20:46:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 18 Oct 2022 20:46:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jpf1RzN1FBxgFdvA9ebAf/KrDHr6InETkU8+UEFnMvZRtNdliOynE+HdrGqswHdTJnIwdPC9orQANoAZufX14FXKhZzCID5ItOW1Q83ytsJNY052ic+7vQ5fsgh4mwrnWYKWzpxBwDvCE3IjJJSDOTl8Qy8Xenwaqd0BQXpWIeoTqtEQie9/J2mVzHqbPvx8aZ2HS0WSwyqJzDqA7K2uXn/Joy0nIPqCIyEb0QdkdxNtuD6ei71aGQHQ31hBJC+Sf6yxndk+ze1aYoK6Pey8YWI5ArwoQ1q+14xvk/fq+BThV67MyzckcjnNYO00xwVx9aWzb9cPC+9LL5V9GDQKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SahEDfFwp/FS55DuhKU/gplwVkzURMPUxSJDMvcJyac=;
 b=AijSZIZAgoak/0AtlGhqYJcZ5C6WhWaOCl9k7wC7GlGLNVuzjTzX3NotHCoLjYTZzKlbgoOVY3mDHZWzPSow4pgjTlP3l6iowaoGipj5FsC4BzVfHkhUxZPOJoiKmlfd55Nh/XrMAt3wHGsk6oWRt5rCBoMeedcGHtUzYuDg7z2Ksf9weaPREXfBiWoOEFxkgK8GQe7LEX3IjFlapWmHeEKfnot+myt8YVngK/KCMuettG3ZWvgJ0TXtRkEvj6YzZ5OpFHOtBdvleY7/hRAbcFbWQlrTLe8SPNYmgPk/xuq4eyb6lB8KgtqigZqI1qhjQ9IUNbuo1MLVbZ6twAYYPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by CY5PR11MB6284.namprd11.prod.outlook.com (2603:10b6:930:20::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Wed, 19 Oct
 2022 03:46:46 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198%8]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 03:46:46 +0000
Date: Tue, 18 Oct 2022 20:46:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH v2 5/7] drm/i915/mtl: Handle wopcm per-GT and limit
 calculations.
Message-ID: <Y09zI9SV8oYbr3Q5@mdroper-desk1.amr.corp.intel.com>
References: <20221013000332.1738078-1-daniele.ceraolospurio@intel.com>
 <20221013000332.1738078-6-daniele.ceraolospurio@intel.com>
 <bd37abdb-a9af-3f30-17ed-7a13a9652389@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bd37abdb-a9af-3f30-17ed-7a13a9652389@intel.com>
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|CY5PR11MB6284:EE_
X-MS-Office365-Filtering-Correlation-Id: 528e6520-af40-43f9-dcd6-08dab1848ba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KhnASoz0VZXruS/h0Jkoaq+EogLctaK/P8e1xTSWKpeUOhjUUfkIGh0oaX3SGef0j+eEuzgHVEV61t+GnwlMGN6RdSWDJe068Up7QFhgipODcuwV86Iu1NNoFrHAngimxmex+Af9tCaVZDK20za8RvCrtVbpRwruIXndzovznAhFR680c8b30OQrt3DVOOTmx2Yzv6rrx4n2GMFw7iCyuSJ5TVHOHOfPmyuoGQTMYKQn3EBcU1mU0MnS87Ua0UOBXuMp5uCAgKnxfK7fThFwhLT7LEy4ahx6X6QN/Xl+AfkVlvd8zzMhWYan2yzb/yypEv8nEuwUGTlhh1qvqfO4dSQL4jlVcwuCOTJE7pZpKxH//Myvzc+kwkmeNB4wI8Lo6/5AcNR5sUhzKfoyu4KPkL1Nh/58ZbfGoIfQTwMRrckrknyQX1NM/8l2rtckcp7D9SqLvGLwo07QHCdFYERl2pfqC6BNy+CGtOTbH27uPJHyuFt5Ba3GMxrG4o4H8T/DcwMOA8T+5ol/3wfStZvSuKPCOgp1Z1IjltN4aWJp0D/KAMoOAnK63LwVXftuHLYT6LXwG4UXyuYZ+7IANptZ955vDa0AOTKygvtD7IWeYhdwmgY+3G67drwV0l8X8aJxFIaUSh3zFcLXGuu8KEAOmJtT3zvBRRnTUYuBX04YBunGMm/7MqIKWEeX5I8i8eIreiWx0M2YiW9mpsBulElsGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199015)(86362001)(38100700002)(2906002)(82960400001)(5660300002)(8936002)(6486002)(54906003)(186003)(6636002)(478600001)(6506007)(53546011)(4326008)(316002)(26005)(6666004)(66946007)(66556008)(66476007)(6862004)(6512007)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6vPXKSb7F7sVtKG/pLUO+rkXRu1axmo5gcjaDo1VprBdpjMlDa+R4iZKSd5o?=
 =?us-ascii?Q?zvzlFjs4YokKLzXXjRpGHPJe/CpxR1WqG4KOxsQxaMnJBU3wRTayDsmxEt/Q?=
 =?us-ascii?Q?nijz+MEm8JkVJoki+Wz9FRFu67T6DrR4EU5x83dhKYG1lfUSyHpd3Tm2Cgx0?=
 =?us-ascii?Q?75ZSJNkUZHcjit6bAoOgfg/VbD8r4q08iLndtkF1huvY4Tmt2lfLAfu32Wgp?=
 =?us-ascii?Q?9Sj7tVCesdtb9b8P5kkvgKgQuJmUiIXL3tsgt+7/gOT+/t4M+AX01gM1z+yU?=
 =?us-ascii?Q?EwsZRdKhJyfCgldqYdcV5W0hIDembuY2D9VYgqLoaGxDpx+82+R2tLvjmqbC?=
 =?us-ascii?Q?UmQbHUspDKoF6EtoHj2eCls24y8Eg8DIigMCR+GXnmD7hkxJ0nnAtflYVnZQ?=
 =?us-ascii?Q?4DUmXTKqUMQkddiYlcxAju22CN4hfyZWT/L2ZbLQMJnOe5Mr4JKHO4OCVhST?=
 =?us-ascii?Q?mDKTNUGZqD7n1/jje9xM+buYvtbMFAfgYzcr807oyWR1nJGFczg94WPG3d1E?=
 =?us-ascii?Q?+cZXmpus01Fw2wiBHLK2mBcYV6un/VUq7xoDZkrKWiPyan8DU4x7XTbGJnG9?=
 =?us-ascii?Q?977LM1CvZtXt9du6ulC/GrAxv/RZnfsCFntEjRaWqIcYSJZecJ22c0dF+sMo?=
 =?us-ascii?Q?Y5GHrs4dtX/fbsvYbvCS4dJZ5siY6fy7PneguKzDnmqwo52SLkkYAnoznE8L?=
 =?us-ascii?Q?wfxhaHzrgk3oEibNK6w+Eezzn7DH/U5bbbWkBk7BoL6KtRFCmYoQ4hNnGwo+?=
 =?us-ascii?Q?7L97ZxyTECsip4XAXQCtbXG30pUTMpSOeukR762sAYXhak3YFN7uKSjFquNn?=
 =?us-ascii?Q?QMu43mLrzU0vwqIj41oknMRiqXgqJE6yxTWLlFG5X4ZzcQQLEhDw/Sk9Q4/W?=
 =?us-ascii?Q?/T1oxam9MzE9r4SF8rp3hPGo+RtkIdolamXtjFjXCNxBDWQoGhtAVFO1k8kh?=
 =?us-ascii?Q?zLEVjVrpd6u/lnxs6v9qxsYyBL6beTUfk5zqcM4G/9UM+OJatJumoC/2S+cq?=
 =?us-ascii?Q?Mk58rSS0LyAkfXgrzeORNAwn6770KORRXu8cHz0DvSuAl8iI57pq3q3z+0+a?=
 =?us-ascii?Q?6VARriOH49qEPYVnJNXvPL5+Karl83Dt1+IJNnPJdG3SwIeIC/fWCsTkDKuL?=
 =?us-ascii?Q?zMKmaE/AoIqqL8Sy+HEb1SWuCGkKOKPnt7BW3g88sOLjl3Znlvn18bgu90AI?=
 =?us-ascii?Q?i8liGA9Uf51H9bcpW8JzUfj0Yn2BIx1v1xGCYwY1QVgKxyNyi4xPgnJDaVaw?=
 =?us-ascii?Q?W09c1xhCPp9/CN3NKttJ6KlHIyCcQyoqL+PRPw/jYq1qfXG/XT3SsrfPRgUG?=
 =?us-ascii?Q?aFNkSkIy/ezeRlLyEcQFBmEbz266ekc9iaH1EuxRLtt2dfjtQ40GqhNtS/WX?=
 =?us-ascii?Q?PfXhjOiRUmVLeAEJ4LuJCvG3lBJu+dqH5H2j+Me5yJglA+t5DIlVgfS2S0Wu?=
 =?us-ascii?Q?v2Qi09LCSo4oyZ2DcZ27+tE/fv8W3TqEjSUeJYCfTLGs0raaUrM2rQG/JNhi?=
 =?us-ascii?Q?rerqtdZ0IlYKaAO969TZZ3bkwotarUuThYEzE0NCSQx23kptbpp0VKEzYOfl?=
 =?us-ascii?Q?mviM8Y7agQ0HCRU7ddz2cJ0l6Ze85pUUpk43bF/Fn+As9jigUExyak3YG0El?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 528e6520-af40-43f9-dcd6-08dab1848ba9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 03:46:46.4560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Qpv7X9T+qzdO8qtY3WqR+RzBgtKFDggp4AGiv8yIj/NJ0O8vzz6D9mxyE4dpvT2JB4RATKdMeKj3OMS3qBD6IQbT3nyUg6Vak9yEXRA/eI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6284
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 18, 2022 at 05:44:38PM -0700, John Harrison wrote:
> On 10/12/2022 17:03, Daniele Ceraolo Spurio wrote:
> > From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > 
...
> > diff --git a/drivers/gpu/drm/i915/intel_wopcm.c b/drivers/gpu/drm/i915/gt/intel_wopcm.c
> > similarity index 86%
> > rename from drivers/gpu/drm/i915/intel_wopcm.c
> > rename to drivers/gpu/drm/i915/gt/intel_wopcm.c
> > index 322fb9eeb880..487fbbbdf3d6 100644
> > --- a/drivers/gpu/drm/i915/intel_wopcm.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_wopcm.c
> > @@ -43,6 +43,7 @@
> >   /* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
> >   #define GEN11_WOPCM_SIZE		SZ_2M
> >   #define GEN9_WOPCM_SIZE			SZ_1M
> > +#define XELPM_SAMEDIA_WOPCM_SIZE	SZ_2M
> XELPM? Isn't it just XELP?

Xe_LP is the older TGL-ADL gfx IP name.  MTL's media IP is called
Xe_LPM+ (which we should label as XELPMP in code, so it looks like the
final "P" is missing here).


Matt

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
