Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76A15B347F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 11:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E1310EC51;
	Fri,  9 Sep 2022 09:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8E010EC4F;
 Fri,  9 Sep 2022 09:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662717049; x=1694253049;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fIeyLl3nfvMm+RnI5EgQP0yMd9p5Q/uFuibHqinfeuM=;
 b=EIRA16+7MOIFsXaZaa6qMw+qHvWv4ZA26LTLrM9T3JIkYSun2RxQ2Sho
 7wjXT26wC8kLwk+vG2dnzMTYvUtKPUN5LKLV20MLWSX6RlnM0bJK1ESXB
 2z/+8T1gSb65EKXzrsaAp5sXU7ANm3b+DAYkgAlqFl+UZLZKUaraBJto/
 3D0DFxykZYAw2hblJNwO9pv2tWtWKJCk84BGNqfFImYwPAbXv/Ku7+EE9
 5Fp+2qWXyuktmSV7vRSS2tZZ40nKKAOyRkrsQfgI/Szch/D+/xK2OPgSt
 yzUIJSRsYsFUig/Fi/IJb059mB1Wn7/vbSLi9kgcXO0ObruiozXeSGrLi Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="297439855"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="297439855"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 02:50:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="704353760"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Sep 2022 02:50:48 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 02:50:48 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 02:50:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 9 Sep 2022 02:50:47 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 9 Sep 2022 02:50:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpcKiN2EJ8AtsVjscKjc6vcICbeR8NYJl9lTG2mGmTsF5VZ4JIT8oOoe5xB/s2jQfNAOxmsAiJDoKsuPjRd2R2FbIA+3jRinE06rQkiDvuQssgwku9JQllJ3CmelOY8LM3deVF8xTOOixpr3tU2zoShROe79DArVHNEEHQD73bgr1n9R4aIeAxaDMF4HST0nuwTrlRmy7aMb09ZF+MRiUf7/TRni3ezQxvTW90d3n95m6FYedfDOdBuXag28eLhbilgdlx7KJ1wKMZoUHy1mk0c51YaYLqc/be1CXRtcqMo7Fe07MbdfFtr33WHeo/o0AdgYfKsgZ5TTPJ6KZeedsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/BNkQb4b7YP+yesG9wsnH60UvBfAVmNw4OHKDL7jbA=;
 b=hKTUQnzhbHMbOoMiki70kTZrvFCOaV201ok+gLHEpYDlBb5ikI6xbTyHVwukIEN3YAxeKW71nQP2/z/WFu+p5rQ4pd5i0o+tYbQ3OHHddFo67JZQFykLputKQLpX7IlJZMhtr2SMoMJi5X4bqCMJdpQqoUO9f1+qw3fesXg6ouVl0gTyvS1ubru6mdWO5ZSEGcxajOqNwfNrj219ySygxJMgVe6N+jygUfuAayU9ioOb7+x5NqcdDEzomxURADukvsFz1YTB55FgCUTHuJMlTaZFOPMDaUuQkTW6/DdQLD5VvD71YFAIx0waeU7Xj+aM3Q9DvmoE7QMR48Nzi9+DoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5127.namprd11.prod.outlook.com (2603:10b6:510:3c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18; Fri, 9 Sep
 2022 09:50:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4%9]) with mapi id 15.20.5588.016; Fri, 9 Sep 2022
 09:50:45 +0000
Date: Fri, 9 Sep 2022 05:50:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Aur=E9lien?= <aurelien.intel@ap2c.com>, Hans de Goede
 <hdegoede@redhat.com>, Lyude <lyude@redhat.com>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] Developing a new backlight driver for specific OLED
 screen
Message-ID: <YxsMcH37rRkt0cfj@intel.com>
References: <183219aab00.2890.be34037ad6564a4fe81285fd91a8f407@ap2c.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <183219aab00.2890.be34037ad6564a4fe81285fd91a8f407@ap2c.com>
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6aff1c14-32da-434d-d5e4-08da9248c455
X-MS-TrafficTypeDiagnostic: PH0PR11MB5127:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S8yxd5L8iVfTsFhpQJVFmk2L4e1zL/gDG/2wDQBbAH/JRakuvotU/u0ZJjgmNoMudGidzIU9ILUjPqQJzjGW6Xn48acM66qOL25rRjeuzNuPINO6jiEePZKExRGTt390DyQt/RQnEKC3N76+cJN0fMBdPs+8I6ynCb/zRxgfDQe0lU/ACpEJVVM+Ipju4uxFLN/siDblqohP9ihlaMiDUjXrAUugEQbvDvJqRACeXpuyjBRJKtjVZ4DTa3/2aFEFNVRvW3hkjTdLwia5uCJOQJoicoJBfQpsMGz+vZw0fYp7yGezIY686RnR+EeB3nTeQyyuo1ruC85cLmO0FuM7D2XwwRaR0laqiOyr6OyoWwSFheZ7bEURjDZVoFsj+QQFJwoY8Kz5r+AL0Y29Lhq9pl28TX2cicIhN3E4Qg5KKD0KHBFxq1osyhD5FwTd/RMdgLFOiSKCTvjaRSLmhoMUfd3oBmzd5/PGXY+XdwKpj6nUVZ75pRYCRdoZizl7jnSUYvt16/DUbTZMaCzDGGX1r4gmAJuHPJHdbJVjVlpv5UwD/jF+epOzpXWBI3FcRzKbBtoZ12fgo1ggbdjxeepnYPdnUtCFtKMwdPgKFrFTL7B4hapY+81WDsZJOWY+4Sh7wo9XY0ms89uYwUaBtBLhj7N5TcTldmauaX3J3cV1NMlV/070Yrq95UKi1QjPlK18fGFuNyegPwF/oqJMHCWTZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(136003)(376002)(366004)(39860400002)(26005)(6512007)(6506007)(86362001)(6666004)(41300700001)(478600001)(82960400001)(6486002)(186003)(2616005)(83380400001)(66574015)(38100700002)(4326008)(8676002)(44832011)(8936002)(5660300002)(36756003)(66946007)(316002)(110136005)(2906002)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BnGlnH9gXf3mMZWd/Cmx6ws15NG0KC+cBkQK+yWkmKFJ86LISnTDLLl25R?=
 =?iso-8859-1?Q?rcUKfiuyI7REqv06v/QSxlyJ4xaCZyBgDW7L7vKMbM9oogXdvfqbxShtzq?=
 =?iso-8859-1?Q?7ATdJiPV3U2gBaDUhdMF2x+MvgS1eQEFvz5WbP1U9X5myvCyVteCQyOiNQ?=
 =?iso-8859-1?Q?oNjSEFDaU3O2MOziKt7qcP8Gu8whQDPjzTc5rGFp1DXvLBU6o0naaY5VQB?=
 =?iso-8859-1?Q?D7CC7zlVM913DPfdEGMqmPrH01tJxdBmEBT2ZbZs2QvYA/eA8dMP/H9qc4?=
 =?iso-8859-1?Q?GeLU7KZSOeAhukzTBD7aQI1GI/bC71JRd/2KaYFAlvD0iym7AA1dZjTiZK?=
 =?iso-8859-1?Q?//HfkD/z1qVod1Uz8fJty9XMAhYbgSoqNZyL5QtSwDFQPi9z7Cs2z+hSgb?=
 =?iso-8859-1?Q?df99IaINd3JR9X/P263MH6/lYTeTfmnc2mPUa0aceU7s1pBVVkWpPfy6d/?=
 =?iso-8859-1?Q?k8G0LyxYuPr8/YGJXsTc8E0Y9ayhQwH2CdjzhoVvIFpIQKLAsU2jdb3OM3?=
 =?iso-8859-1?Q?ennRFjhNHxar604Bo77iZI/pj0/uLQWpB2yi+61b0kaZ/226MDyLW27sXU?=
 =?iso-8859-1?Q?918ZHdTQ2x/7S+p7jVP7GRO3vX4gOr9AfaC9qpzaePzVkl54EMFtDM+LnZ?=
 =?iso-8859-1?Q?mtiG/R++E0TooKXQG5nxjA8xOK27iM9ujx+X3ibOtXcDoY8WP0W1c9gF0D?=
 =?iso-8859-1?Q?GqzLzB3AB5XuMH1Z36zUWqkh4GqlDtRJlSlKj+jroYNZ2M89+OcvQaOak9?=
 =?iso-8859-1?Q?9CMNzvr2pUDPuRuv1wf6imn8cnhUGfqkO0uSZusPYwaw+UJNj5p6uQFcWW?=
 =?iso-8859-1?Q?ZOdZHqiWPGZUZ4wB7KsHl8PcdMSG77Yl4KN/2FgTnwUaorx6E7Ev+3SJXa?=
 =?iso-8859-1?Q?a4Ho3MUZYF3zqcZHetqbJEcl1NWGMZ7cmnA30NOCFhl4wy2sdw8o49Qp5T?=
 =?iso-8859-1?Q?Ewbr5H8TbMPiwAv7QeFoVfTIdwYUbjvfIGRMOBpeBu36AImvV6x5r+K5np?=
 =?iso-8859-1?Q?B1mSlAuPb+Dz4f4xhTekK/6MQL6L09ZuN+gBgdEU+oI7qW+tCGWumPezHv?=
 =?iso-8859-1?Q?d9GzGln9CHkilzmqRhEUz4k//ENMF08GY6uW4fX8Oczx4IrJhyaq3wV5eH?=
 =?iso-8859-1?Q?aVFzzgCOM2LcbdV2OTXT3RMFUD6v6+eDgIX9OuQLaSQtf8Nb6F2S71lguP?=
 =?iso-8859-1?Q?PJP8BhQfLNQ44/4fTQF3OWuI3EuU2v9bDxcXBzbyo+kS947z3Dyp3SRVPb?=
 =?iso-8859-1?Q?IFwe0WLckUljjTo4BAF5GclwnYsoCQGiuikGJLC1fIsWU74p51juMihxrh?=
 =?iso-8859-1?Q?aa0G2PlLah/mhfy2aKKjhw7SYF2Rk13srjvT7MSI+qaLKaR6RU5RNa6ud2?=
 =?iso-8859-1?Q?39Ro670oTTAplqlMIclEOubQ5PqF3FY5xqYNcFD0qSsq0VZaDbxGp9g3jW?=
 =?iso-8859-1?Q?Gc3HnN+wQLk62k4f1amg0z43iTHE0w6Ohr0fjLf03wKfaE0wScN2o1bkUS?=
 =?iso-8859-1?Q?8K/AMrUJcvXYgNE+QiGDgb9YidVkVi1BFy3Cn2ogxZdf0hTr4bzf0Bdr/H?=
 =?iso-8859-1?Q?iNV1oAmdMedOG+UUAtj5E5xu/oPh8ub9dwXjmndv1+6R3oY5g6SOSSJVsF?=
 =?iso-8859-1?Q?BvD2ypdXHBNm3Sm2top/mrNwJImnVyA9W3mYRFlDbdnABIGE7bF4VofA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aff1c14-32da-434d-d5e4-08da9248c455
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 09:50:45.8418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4mS75sWgaPq2BFeqf5EAqb+lzkhkIb00+JO1QBWZNzoHUPoejbclGaCRLlkJeKtD6oKJBg7lG+msIYks+Dt5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5127
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 09, 2022 at 11:35:28AM +0200, Aurélien wrote:
>    Hi,
>    I hope this mailing-mist is the right place for this question.

+ dri-devel mailing list that looks more appropriated.
+ Hans and Lyude who were recently working to standardize some of the
backlight stuff.

>    I would like to develop a new driver in order to manage backlight for a
>    specific OLED display (Samsung one). For that propose I need to use the
>    dpcd aux read and write functions.
>    Since this driver is independent film the i915 driver I would like to
>    develop an indémependant driver.
>    So my question is: how can I use the i915 API (dpcd aux communications)
>    outside from the driver and register the backlight sys entries like the
>    i915 does (in order to have all the softwares which plays with the
>    backlight working without modifying them) ?

I don't believe you want to use the i915 API, but move the common functions
to the drm subsystem itself and then reuse as a drm device.

>    Many thanks for your answers
>    --
>    Aurélien
