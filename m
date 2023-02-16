Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC180699B4C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 18:30:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BC410EE48;
	Thu, 16 Feb 2023 17:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF0410EE48;
 Thu, 16 Feb 2023 17:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676568649; x=1708104649;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FLvniJSHHz3fZvxB0yFI2a/qbTgZZD92SnfcCunhw74=;
 b=REcJAWUiG8H/g8qazYEmdGBzfo2GVbwQ2u00zcNKD6EAzlEPEzHvkwhb
 +MR4S5vBV5VLymXcJ2bED+siBEfFhHz8Tg+NeHqHY9qW+mslLMgB24qPV
 lhiKlLydWTIrPkazmkpWR7y6c3Rv3vd0BNNcD9fC/6x3/D+KoE96gKMyn
 N3qgyzxHIC7i9wXR58DLb5XsGLFkCqtIEYYcpk54DjwIrc+hs0hope1l+
 FPMTdn74OaSo5sATiYvxik/FhlLQz/DTCu5WupYN8eTvSbBM8yhml/Hy0
 bmjHq8yuwwT9OgH3u0sU7HDpUxSPoNqXtOydJu2lGL8ckZ6VWENoVZJvx A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="394237374"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="394237374"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 09:24:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="844232777"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="844232777"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 16 Feb 2023 09:24:47 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 09:24:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 09:24:46 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 16 Feb 2023 09:24:46 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 16 Feb 2023 09:24:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efKvf2naIEXjKdSrVnhdGYy5EWN/SaUTmCXJ6RaJSjSHXZg6TVrOjGaGbK9FeJuNuCR3/bpdpQWVFH1fwxGGzUOo5G3jTyLxLKyVkuqnmugOAKPn/5wLFqG7We0gOt/s5jq3TmpkeP4/QucaY4D8O3hEXSxL1L0SnSs3xxVdPTziU7uOdOXNlC0T3aGLIFt0o7NKQf2pHbB/MXLUhX/5sTtmQi1epJpGtxbBIxPl0yQRB102/84NIhBEGI2MxJbdHcDrEVqlK2szMR9x2gqcyX+5Phkyyun4U2qBSxMdQYWWKaCTwM6pyu1jN0iqzWBe7Og6LEPRfoFcH8UBSFuvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OKkFzzbGd/nE56alXRWIqLjJWaGAHD77TVpj5ovow0=;
 b=JfF3Bh89iRcIN17+jFizH8UNlAHDImU3mohLoq4ULl0IljdEqWid9pqqYBVUSyhtRjd/Jj0d3yTJCZGM75uoqdw4OLr9XNWhXU6Wy3RlkBwb6Ku7mtsRiJpkKDQeyUMg69IxyZYOOmgAB2etLeRFQFqoH++wJJ18YZnwKXFKAuaIndokUXyvDx9V9I20DDfXle2I9IDsjHygFuDq//sRVVLE8gpsLnNBuPBAETAjBJdKUq7KpMnlBUIpHYV4I82xU5YWxaJruli6G2YqPsJWhCnglA7QmMCyK7XydxMm8LChOE697zH8Mr+cNS39H/9IU1P36yz+WYkxEIo1UiCDnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by SJ0PR11MB5040.namprd11.prod.outlook.com (2603:10b6:a03:2d6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 17:24:28 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::84dd:d3f2:6d99:d7ff]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::84dd:d3f2:6d99:d7ff%6]) with mapi id 15.20.6111.012; Thu, 16 Feb 2023
 17:24:28 +0000
Date: Thu, 16 Feb 2023 09:24:24 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH 0/9] drm/i915: Replace kmap_atomic() with kmap_local_page()
Message-ID: <63ee66c8787e3_1a960b2943d@iweiny-mobl.notmuch>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
 <63ec5ea4d162d_18bf5929443@iweiny-mobl.notmuch>
 <Y+yGIPcTfirmdIdK@liuzhao-OptiPlex-7080>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y+yGIPcTfirmdIdK@liuzhao-OptiPlex-7080>
X-ClientProxiedBy: BYAPR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::49) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|SJ0PR11MB5040:EE_
X-MS-Office365-Filtering-Correlation-Id: 63866ef3-ed8f-480a-3c9e-08db1042a87e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: koMNd/TsUDA0hF8T4oJjSvxB1rA6uNyqw6L/0k4CE2arQlbzKuTp3eec9UpO8mr41NeSA1FDbvvJ+KGb9vCmXKr6QA3JKsucwGmCVhqudrCVvzJwIdmQy7t6USlUuKfCizN3Q85NICfuy54hE+yzqQl8af93HjlT1kMPFb32TrEBiZQYqgCyExx0ppyKJF52sq9NbvyefU+B5nTQypfgsTua0w7j0+/pcz7WJtf0ouk1X2GlpqCdmmM+QgE0n3QFUQVnSaCHzQajPjKmSoRe2vLpWbKNV3kJhUOCK4X2feZfbfVMe9khb2/TvphdiVlhpZSbTix2Os5J4Gzj9XNvarXGNfmo6hG8+1oO+X+0pthXEJ4w+GU7sBQUdTdnQLHCQe85UcI+anGP2WKou9WCSJ7KWkTLlkI4nRo7rueyrbPSLO8yIW/6RX+NqVAzhtngsPgb9F4VwI/ckX6urSa5/tNXK8nmw8lX1DwnveJnF97cQjvvDx+7qrgzEKoHR3NbCGw+BPoRYBqq2dmY9Pw10GiQDGQ1QiclHl8i6Lbq7QsY5kJCJTTirbSbJNMOubdXxULaVbYCkfvYeJ57iitcMYpB9L4ELXQUANll2nwIOnogE7aD2GZVLM1KjK5GzGPYt3Msn+VJ9xgpVlc0PZuJIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199018)(82960400001)(54906003)(44832011)(2906002)(316002)(7416002)(110136005)(5660300002)(8936002)(66556008)(66946007)(66476007)(41300700001)(4326008)(478600001)(8676002)(4744005)(6486002)(6506007)(6512007)(186003)(9686003)(26005)(6666004)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Ez39WCiZgYf0k9I+orAIGruHsuuwkf907fuhKB21qE62f0/mIRal+nDgA/n?=
 =?us-ascii?Q?YKgfshpcmbv/h8F5MTJhbILoYjRqqIijs9mKBGIUGoN1miCVuRphNHnQ/BEF?=
 =?us-ascii?Q?AqZW05LGFHz22o0gt6Dg7y50GGJSAg0uqO+mO4uavttb8FjrYyxtqnpM+pj0?=
 =?us-ascii?Q?On3+4k00d8Vl9wbJZchyAqT99ikqXfI39u/TUhHbMW4BgJbLpQR6spPLpvNT?=
 =?us-ascii?Q?LxMl8JUDKakeNiKae+GjtDQGr0kfKSMdEF90HOCbHm55bxXE3t49GnS9WPFh?=
 =?us-ascii?Q?LzbCT/Aq6cisl9zmDDnedaDir6tw8dXkBPYSH63PvIAUm8yHI3NsnpfRxSOk?=
 =?us-ascii?Q?Mf2S2s882YqjF7Vb4YSreOxH1f6kPeqVt1C7R1EvAGl3QtO+K6W9+FWDlrvm?=
 =?us-ascii?Q?pDU2fDIagUcaPXpJAYuW0zNs9fmUqq9Rg7BzibfDSimfWbo5KfHgS9SgKF/A?=
 =?us-ascii?Q?LLBR0UKfVRTDEZ76a55FYbQLGvJICawg/UpkMpFFalm3143tOQH2RIw32snn?=
 =?us-ascii?Q?m2XAKbGpUrXZwW/4LdACqpF6Q77P+7CBbJkJEf9/w5NrlLy8/I339xO9G5ie?=
 =?us-ascii?Q?6eHS87C16Yml4QYdy/TlY69XfNz4KAUEmvDg53otod2Q5J5t9iKWM9XI7Zlc?=
 =?us-ascii?Q?Puv+EovYyropms4AMXR+G6mQG8iLcMWKtWgMt8A2W3cthQ9ojz0cIijtrFVG?=
 =?us-ascii?Q?0QjpuN6980bWOQWgbVCd2ULNL1vh9kViBtfgvaZvkD8ive0MajEu5SH9OeX4?=
 =?us-ascii?Q?rs9YBYSEqf7B6At/zcjb2m6MOtyfwD5FP0uJLtoQd0kx1NNF+m4ANc0+dekv?=
 =?us-ascii?Q?3tarBb8HZi+QQaEhzQkoLAEIMDuKr/b8bVuQkA0FDbMImR7mI/BW56pZUm+/?=
 =?us-ascii?Q?nkyX1xkgzMhC/og3icZHDfUBTNHZw1AJOUVHGxkXM2i/vg0fkoFK8xDQRy9s?=
 =?us-ascii?Q?RZudgdkrUyRecRB0eExN7Rqxr7jRFm636j3EKmrsoEmvdSWsCw/H2b02KKi4?=
 =?us-ascii?Q?LcmCALx5tN3khDa8IRjesS0fALvuJ2DLaJTj93NlYI0m/RpOWpELEaSybwpK?=
 =?us-ascii?Q?vvuNgkLt93OpaNF44C6knwIFwU2t/UO3fvumYMdLinuG9mj13HqgnM3ovIN4?=
 =?us-ascii?Q?yxbf+ZaK70Kl7KyJPpxw5aQZ+D6buFsFInHlhz5MNaaVwPiJCVoaRgIccYEj?=
 =?us-ascii?Q?weyWEUHr6/5lXRsbhyXcpOvrDSfE/e3DHh1fx77PnytXkmEaif+f/g3sZKhS?=
 =?us-ascii?Q?quFgITiO7QSLlhG3zbVce2V+0at69wUSedFiLXN1Tfjdetf9YxZfByAQEVF1?=
 =?us-ascii?Q?IgqfUkPzXjWr0/65U6fIXgaYlWXAOSNGVCWqNW8hzNhG0XL+5cp9uNGMY/iZ?=
 =?us-ascii?Q?Sw8PwgcIurVM4ktphv3Sh8qC0pa1rgbWwHZYCuD+Vg6OmU761SIWlHA9G6V+?=
 =?us-ascii?Q?0jgRvQIsv1Mk3EvyimorbKtiKFv4Kn7pMfpBxdec6KXmZoS///cTK27dm14S?=
 =?us-ascii?Q?Wdy26mzKTJ9Bj4xTMfRMLl/SumQK7xfVezLI6D6QOS9rXwh7goElQSS77SHW?=
 =?us-ascii?Q?Db1UMIrn4IrQI6b4lDa14lZF4ph8Yu60m647bhwR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63866ef3-ed8f-480a-3c9e-08db1042a87e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 17:24:28.6132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yr0Y1pq++orRfxh7MlPVpD2NNUv7gTo0hB4TR1FXo9Y90JXI8viZpfr2mct/NWH91DR7XAI80rL7OJd7TVi+zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5040
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Thomas =?utf-8?B?SGVsbHN0cu+/vW0=?= <thomas.hellstrom@linux.intel.com>,
 "Fabio M .
 De Francesco" <fmdefrancesco@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Zhao Liu <zhao1.liu@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Christian =?utf-8?B?S++/vW5pZw==?= <christian.koenig@amd.com>,
 Zhao Liu <zhao1.liu@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zhao Liu wrote:
> On Tue, Feb 14, 2023 at 08:25:08PM -0800, Ira Weiny wrote:
> > Date: Tue, 14 Feb 2023 20:25:08 -0800
> > From: Ira Weiny <ira.weiny@intel.com>
> > Subject: Re: [PATCH 0/9] drm/i915: Replace kmap_atomic() with
> >  kmap_local_page()
> > 
> > Zhao Liu wrote:
> > > From: Zhao Liu <zhao1.liu@intel.com>
> > > 
> > > The use of kmap_atomic() is being deprecated in favor of
> > > kmap_local_page()[1].
> > 
> > Zhao,
> > 
> > Was there ever a v2 of this series?  I'm not finding it on Lore.
> 
> Sorry Ira, my delay is too long, I was busy with other patch work,
> I will refresh v2 soon, and push this forward!

Awesome!  Thanks!
Ira

> 
> Best Regards,
> Zhao
