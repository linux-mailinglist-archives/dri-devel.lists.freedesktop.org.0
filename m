Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A58F5B3333
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 11:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F6510EC40;
	Fri,  9 Sep 2022 09:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEB010EC33;
 Fri,  9 Sep 2022 09:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662714826; x=1694250826;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7z+9DBqsgVIQUJQ6KLMndX5ZLbSxuawSWNQzPzqt450=;
 b=SmeJDfCoh4DDPu/FZTSG6Jm2YEfd/SvLgCY76OaLE796f/j8peUWTkpd
 CVpUUQFdGwGHROq6p5EKTehxGPM6AK0BvZClVen1PZtqWJVPhdFOkFrfH
 OB6ASRhpFfvq4D0nv+G+5Jr0i/llhagDLoUQb/K3XoqnkFQWh/+ioHgIV
 1fNAx3I6SjG7l7X1CRaDtPqKYuWjsTfV6jzU0qFIFJoUlLw7pzp15fuz3
 KI1WgO8NZ97sjQUBh6WgdA1ooRiNGAB0NEwG24oJYu5KCLTHQHrzyC0Ay
 fBJEkguWLgG5q5BS3UV6PpjjUkUlE0fWL3tB6ZYr1WC0xDvQUrKmFFJ15 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="361390468"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="361390468"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 02:13:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="648379203"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 09 Sep 2022 02:13:46 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 02:13:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 9 Sep 2022 02:13:45 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 9 Sep 2022 02:13:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTmiyFI6xA9+n+SDB2jNfFJQ3/QKGbhGtc73SuMS8SeDqlVETvzfUW+TovXhI4m8VZZ/Hco7FF/UtsweFblcRQgAiYs1sULuzVLe0KYut/lrOFvQRHSuLQy+vIE4CYXW7kpvyRRTKE6bmz0aQvsK2qTHolKjrqiYNxNr6GUhnxf34Hbcs+c3KtjJWv/5g/FaXxY5sVjpSnZWxhbNVJvtbBKNM2TQeZEP2OUfMmqpmu4HqOcBbP03CSeho/PoqiwRNc675tj6Z6Qg2z8n56fs2HtxH/qCnO9ngMhB3TCdUmh7qy2X6UjICuyOnNfE1Wz8hbkhz0F2LWTeC82o0goO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmpQHJN2+YbFYFu8LCrHxr1pd5qDHGVsVuHprv64/Cs=;
 b=DYwu6vIGYAF7n06HQmg1q6iIodAX7llzb5WudIVbJEJ8un5JTSJt9SEsPvH5y7cKLAvULDU/N9GZIJiDOK4YJughOK0EeYnUYw0T8+4p4nGLyakpI4a+XP3lRqxkSYUVyPAK7Pzt7c2cni8s74ptx24McVkEIdj+9fN2w4qAunYvkfQAvOQeBysdBS4SDu3R/5Vkr2kiGag+mF3jT3VqtGTHp45mxWmBfa4daTZNSkvZ+8wrnZxsYlHjdIEP23y0XbmjhERg2VGe6lJgz1AszIzpTmicjj0HwR7PlOzycaN75VtQhUXWPGzlIN5r2cOktw5/W+dneDnBfYGlmBiNpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4739.namprd11.prod.outlook.com (2603:10b6:5:2a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 9 Sep
 2022 09:13:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ce8:1e4e:20d4:6bd4%9]) with mapi id 15.20.5588.016; Fri, 9 Sep 2022
 09:13:23 +0000
Date: Fri, 9 Sep 2022 05:13:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3 37/37] drm/i915: be consistent with kernel-doc
 function declaration
Message-ID: <YxsDqAtAGCa6z7ZL@intel.com>
References: <cover.1662708705.git.mchehab@kernel.org>
 <b0caa1cfce522bef57351ac5bbaf1329eb05509f.1662708705.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b0caa1cfce522bef57351ac5bbaf1329eb05509f.1662708705.git.mchehab@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 445bec73-888c-4cf8-c20e-08da92438b9e
X-MS-TrafficTypeDiagnostic: DM6PR11MB4739:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RzigjIS7sLm69VjSnahoChyXqidMQDCtpkrBK2Jad7MJjB1MEIsYe1/cjfeqYtOqL21Ajx8e5X+HrdryApvOIOiWj01yfT1NN9dEnDr42drDQPL5nRHMvpkXqDY0tAlPu1c5fF7xaB32NL3naW9Q4UpWZBd7ybZrhuFyS5L9aPc9vD2TBLx1heGZ05gRBnYwq9LUBSZJ9rBsMtRbMy43E6fR4KYcOYYiYD6C56UR5JzsGOpWR1siWJ1ebe6VTTrko52aWzt2N+KI5KUS/jDpaVpyEYx+TLzuE9jnTWV4VOydLlTWM0XtkpUEwvulGzmdX//pKdwqxRlxpWX/TYZe6OCRkNPWAgTqcxvuhKRPWKuOrw8WaujMi//eEC7tgtEhApaCTGsPao29BFMXbS+V7TFvs+eQkYQd0BIDlXjeBnLVTEIefbY84PkuLjJ19njCfGBYmFDTMXg1bN5vaPy2JnlCm25ha0qk98H6nUw7NMJSzDarOiFwPja0kXL8GifqnQqFQkmEivsbY5FyPFTfFa5Y5hvpRYfQYXk3+lloLpLMq5tOe6IzJyt7K+DA+5faQYPVv385CU16I6nOP3XoTa99BQ0jJOiZOKaySI7awYznJJKgJJpp6s7z1hc9quT29gsGO/mFsYJmPcg6OVyewlSs8xsn4mFGNfCAWsW1JAXZ3QDCR6IPmVGPmptu1K+VUaTa8tx0qUlO2AxCyyh3nPWLhhE7bdMRVu+k9JoJdKI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(39860400002)(396003)(376002)(346002)(44832011)(7416002)(30864003)(2906002)(8936002)(6506007)(6512007)(5660300002)(83380400001)(26005)(86362001)(2616005)(186003)(38100700002)(82960400001)(8676002)(41300700001)(36756003)(66476007)(478600001)(66946007)(966005)(4326008)(66556008)(54906003)(316002)(6916009)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/TIsTFYAWQGyTa+N/Xk4I+dwwVsObj4+GVhbMCZHzagVbBWKHzbP3gdNtIVz?=
 =?us-ascii?Q?MiKFgnBCcG3yvYrFm/dDvuHX4nQU9G2Dden7chXPojylHZWUE+YBRYw3YgNa?=
 =?us-ascii?Q?Tw7e66EcmDkjKKNLexgTWNWAtO5tbe3jpYIjpBF8ff6KBrHMQAC8EN7uZ+sW?=
 =?us-ascii?Q?wAT3glkpRz4gDDLOEJ5yIvtxidZky5hnaKnsEmyc8INIElsiFTCjYicGcvVj?=
 =?us-ascii?Q?6Te8gNEYNIEi6W3f0PySCyuQ7yL4CdRFJwfUgHD+IgXDoM0ujZNZJxUctYxD?=
 =?us-ascii?Q?W1hj8mS7F0EHt8aVdBKId228eQr0JC7p1uMJHMPzYXbl5mESlL/C+r00U1Ff?=
 =?us-ascii?Q?j0a9XuiJaW4R2GUSio6frV0tLJCvuBxnKzfzUW0NlDY+LeopOJkOfRcrEMx/?=
 =?us-ascii?Q?Joi5NAIwBDVQGlX8U6atBNPE6XOAXuvvKqft/dPqkKBel587do/Yjrc6hkhK?=
 =?us-ascii?Q?gvbn2ofPUX13Va/5jCdW5E6NaRstecokhWmqODfUsG0ZSblFuedVWgNDDLG/?=
 =?us-ascii?Q?H56g2Src94tFGj8zkAx7OwsUV4AJsgdd1OkO7Vwpa1SABM4zaVL2WBgZqJNk?=
 =?us-ascii?Q?MNA1NVH/QxrtREktE64/MVEhriQKNXqGfOE9H3G93MMECt4PlsgSawvHVcmz?=
 =?us-ascii?Q?xY4qNcbXspzJ9oy7G/thUU4rTM3UPprzmCG2pzl+PSCb+dKv+xfZn3anqEHB?=
 =?us-ascii?Q?3eTKIqtKYbuapFVYSIzp42DlITW3+LSaXP8RxXziFtDHwa/8y0N0kzc/hS74?=
 =?us-ascii?Q?yZyqtvzpsS5XoEynzPn9ei+KxSUg1mqJJ2ufrXIU4UVEVIlqPDA+jWS8ymlq?=
 =?us-ascii?Q?uf3IDhw0TI9mmhZmGI81C+AsG9HeB7cA/STBazST3fUteaGW0MGrMEpet+oZ?=
 =?us-ascii?Q?6BJmQ5TnswzCfA38j/Huwt1M1julFB9gREaK8mriNhx7uw+ruGL+wZNpgkaw?=
 =?us-ascii?Q?lEDaUXBlRtVnHQag2/tHk/tq0aOFH/wmZ5j4032jtQIxsQ6RcDRPQSSF4ftb?=
 =?us-ascii?Q?6JcKdCw2tRfVgv/57saIMG0kVdjkO6MmI5/uvQzFaB+wKDsTZVG5mvARg3PI?=
 =?us-ascii?Q?+eVeJrfWui1S7UHhi3Q3rfirlFLE2QNvnPtd1K47+INobEWy2HqeHrXXnMDL?=
 =?us-ascii?Q?ovoZSc48g2o8jJ9g27w2TYj++rpIoeGunOBV1+mEf5jIE4Huq4tFl42/q1SV?=
 =?us-ascii?Q?JKV95NYR0S7LsBHsRxwaKJwMq6uUx/f3gziIn7fyEgKX7MoqFO+9/aXPrppG?=
 =?us-ascii?Q?zqgKoXJGy6zkDMN9quOniDYueJYH2bBV8YD10j0E5EHRBdE2WqA+oS2pdGjQ?=
 =?us-ascii?Q?fWBGVIlUwwhdwaeB2Oqk5nXHTUh6gHzrm+iwySxdnWUoNm7xbXkCc2tVWZi3?=
 =?us-ascii?Q?ecw8et2FD1BATQFjawFd3jKaxsE/eVn3rzinpGG/0wDncoWg0KhbdNiTS5Kd?=
 =?us-ascii?Q?hG7lgHh87UTejzgvphUle1DubnRjrr+FuoOz4kEW6xs5sNc56xzUCMdixUST?=
 =?us-ascii?Q?cTsfoFwtwyHznwCAkLqPhWc6MKf1j03Rvl4nhu/aWGKEHxatXRYyTfAiHXE1?=
 =?us-ascii?Q?5ejD7SIJrE5DR7laYAseOa3K9pP3CHWI+StlYyzUe0ppCPpCYc/thp2gZdWS?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 445bec73-888c-4cf8-c20e-08da92438b9e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 09:13:23.3152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woDy2Po6LWOecxIHszqAZiq5sgtx7Cocz1E6cI0BJV3iQMq5l6M4fFGoAlixIoHVv7W9QUPhwlI7G35LxjY6ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4739
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 David Airlie <airlied@linux.ie>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Fernando Ramos <greenfoo@u92.eu>, Matthew Brost <matthew.brost@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Uma
 Shankar <uma.shankar@intel.com>, Matthew
 Auld <matthew.auld@intel.com>, Dave Airlie <airlied@redhat.com>,
 intel-gfx@lists.freedesktop.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 09, 2022 at 09:34:44AM +0200, Mauro Carvalho Chehab wrote:
> Currently, 91% of kernel-doc function declarations don't have
> parenthesis on it. Let's be consistent inside the driver by
> removing the parenthesis from the other ones.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/display/intel_atomic.c    |  2 +-
>  drivers/gpu/drm/i915/display/intel_audio.c     |  4 ++--
>  drivers/gpu/drm/i915/display/intel_crtc.c      |  4 ++--
>  drivers/gpu/drm/i915/display/intel_dmc.c       | 10 +++++-----
>  drivers/gpu/drm/i915/display/intel_dsb.c       | 10 +++++-----
>  drivers/gpu/drm/i915/display/intel_lpe_audio.c |  8 ++++----
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c      | 10 +++++-----
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c         | 10 +++++-----
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h         |  2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c     |  4 ++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c      |  2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c    |  8 ++++----
>  drivers/gpu/drm/i915/gt/uc/intel_huc.c         |  4 ++--
>  drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c      |  2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h       |  2 +-
>  drivers/gpu/drm/i915/i915_cmd_parser.c         |  8 ++++----
>  drivers/gpu/drm/i915/i915_reg_defs.h           | 12 ++++++------
>  drivers/gpu/drm/i915/intel_wopcm.c             |  4 ++--
>  18 files changed, 53 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
> index 18f0a5ae3bac..9b604a720ff0 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -373,7 +373,7 @@ static void intel_atomic_setup_scaler(struct intel_crtc_scaler_state *scaler_sta
>  }
>  
>  /**
> - * intel_atomic_setup_scalers() - setup scalers for crtc per staged requests
> + * intel_atomic_setup_scalers - setup scalers for crtc per staged requests
>   * @dev_priv: i915 device
>   * @intel_crtc: intel crtc
>   * @crtc_state: incoming crtc_state to validate and setup scalers
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
> index aacbc6da84ef..667fe9a8ff8e 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -1385,7 +1385,7 @@ static void i915_audio_component_cleanup(struct drm_i915_private *dev_priv)
>  }
>  
>  /**
> - * intel_audio_init() - Initialize the audio driver either using
> + * intel_audio_init - Initialize the audio driver either using
>   * component framework or using lpe audio bridge
>   * @dev_priv: the i915 drm device private data
>   *
> @@ -1397,7 +1397,7 @@ void intel_audio_init(struct drm_i915_private *dev_priv)
>  }
>  
>  /**
> - * intel_audio_deinit() - deinitialize the audio driver
> + * intel_audio_deinit - deinitialize the audio driver
>   * @dev_priv: the i915 drm device private data
>   *
>   */
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> index 6792a9056f46..507d7aec7b1c 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -463,7 +463,7 @@ static int intel_mode_vblank_start(const struct drm_display_mode *mode)
>  }
>  
>  /**
> - * intel_pipe_update_start() - start update of a set of display registers
> + * intel_pipe_update_start - start update of a set of display registers
>   * @new_crtc_state: the new crtc state
>   *
>   * Mark the start of an update to pipe registers that should be updated
> @@ -617,7 +617,7 @@ static void dbg_vblank_evade(struct intel_crtc *crtc, ktime_t end) {}
>  #endif
>  
>  /**
> - * intel_pipe_update_end() - end update of a set of display registers
> + * intel_pipe_update_end - end update of a set of display registers
>   * @new_crtc_state: the new crtc state
>   *
>   * Mark the end of an update started with intel_pipe_update_start(). This
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
> index e52ecc0738a6..2024884688f6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -408,7 +408,7 @@ static void pipedmc_clock_gating_wa(struct drm_i915_private *i915, bool enable)
>  }
>  
>  /**
> - * intel_dmc_load_program() - write the firmware from memory to register.
> + * intel_dmc_load_program - write the firmware from memory to register.
>   * @dev_priv: i915 drm device.
>   *
>   * DMC firmware is read from a .bin file and kept in internal memory one time.
> @@ -876,7 +876,7 @@ static void dmc_load_work_fn(struct work_struct *work)
>  }
>  
>  /**
> - * intel_dmc_ucode_init() - initialize the firmware loading.
> + * intel_dmc_ucode_init - initialize the firmware loading.
>   * @dev_priv: i915 drm device.
>   *
>   * This function is called at the time of loading the display driver to read
> @@ -973,7 +973,7 @@ void intel_dmc_ucode_init(struct drm_i915_private *dev_priv)
>  }
>  
>  /**
> - * intel_dmc_ucode_suspend() - prepare DMC firmware before system suspend
> + * intel_dmc_ucode_suspend - prepare DMC firmware before system suspend
>   * @dev_priv: i915 drm device
>   *
>   * Prepare the DMC firmware before entering system suspend. This includes
> @@ -993,7 +993,7 @@ void intel_dmc_ucode_suspend(struct drm_i915_private *dev_priv)
>  }
>  
>  /**
> - * intel_dmc_ucode_resume() - init DMC firmware during system resume
> + * intel_dmc_ucode_resume - init DMC firmware during system resume
>   * @dev_priv: i915 drm device
>   *
>   * Reinitialize the DMC firmware during system resume, reacquiring any
> @@ -1013,7 +1013,7 @@ void intel_dmc_ucode_resume(struct drm_i915_private *dev_priv)
>  }
>  
>  /**
> - * intel_dmc_ucode_fini() - unload the DMC firmware.
> + * intel_dmc_ucode_fini - unload the DMC firmware.
>   * @dev_priv: i915 drm device.
>   *
>   * Firmmware unloading includes freeing the internal memory and reset the
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
> index c4affcb216fd..2ce406f62d40 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -80,7 +80,7 @@ static bool intel_dsb_disable_engine(struct drm_i915_private *i915,
>  }
>  
>  /**
> - * intel_dsb_indexed_reg_write() -Write to the DSB context for auto
> + * intel_dsb_indexed_reg_write -Write to the DSB context for auto
>   * increment register.
>   * @crtc_state: intel_crtc_state structure
>   * @reg: register address.
> @@ -158,7 +158,7 @@ void intel_dsb_indexed_reg_write(const struct intel_crtc_state *crtc_state,
>  }
>  
>  /**
> - * intel_dsb_reg_write() -Write to the DSB context for normal
> + * intel_dsb_reg_write -Write to the DSB context for normal
>   * register.
>   * @crtc_state: intel_crtc_state structure
>   * @reg: register address.
> @@ -197,7 +197,7 @@ void intel_dsb_reg_write(const struct intel_crtc_state *crtc_state,
>  }
>  
>  /**
> - * intel_dsb_commit() - Trigger workload execution of DSB.
> + * intel_dsb_commit - Trigger workload execution of DSB.
>   * @crtc_state: intel_crtc_state structure
>   *
>   * This function is used to do actual write to hardware using DSB.
> @@ -254,7 +254,7 @@ void intel_dsb_commit(const struct intel_crtc_state *crtc_state)
>  }
>  
>  /**
> - * intel_dsb_prepare() - Allocate, pin and map the DSB command buffer.
> + * intel_dsb_prepare - Allocate, pin and map the DSB command buffer.
>   * @crtc_state: intel_crtc_state structure to prepare associated dsb instance.
>   *
>   * This function prepare the command buffer which is used to store dsb
> @@ -316,7 +316,7 @@ void intel_dsb_prepare(struct intel_crtc_state *crtc_state)
>  }
>  
>  /**
> - * intel_dsb_cleanup() - To cleanup DSB context.
> + * intel_dsb_cleanup - To cleanup DSB context.
>   * @crtc_state: intel_crtc_state structure to cleanup associated dsb instance.
>   *
>   * This function cleanup the DSB context by unpinning and releasing
> diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.c b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
> index dca6003ccac8..078a14e991a0 100644
> --- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
> @@ -250,7 +250,7 @@ static int lpe_audio_setup(struct drm_i915_private *dev_priv)
>  }
>  
>  /**
> - * intel_lpe_audio_irq_handler() - forwards the LPE audio irq
> + * intel_lpe_audio_irq_handler - forwards the LPE audio irq
>   * @dev_priv: the i915 drm device private data
>   *
>   * the LPE Audio irq is forwarded to the irq handler registered by LPE audio
> @@ -270,7 +270,7 @@ void intel_lpe_audio_irq_handler(struct drm_i915_private *dev_priv)
>  }
>  
>  /**
> - * intel_lpe_audio_init() - detect and setup the bridge between HDMI LPE Audio
> + * intel_lpe_audio_init - detect and setup the bridge between HDMI LPE Audio
>   * driver and i915
>   * @dev_priv: the i915 drm device private data
>   *
> @@ -291,7 +291,7 @@ int intel_lpe_audio_init(struct drm_i915_private *dev_priv)
>  }
>  
>  /**
> - * intel_lpe_audio_teardown() - destroy the bridge between HDMI LPE
> + * intel_lpe_audio_teardown - destroy the bridge between HDMI LPE
>   * audio driver and i915
>   * @dev_priv: the i915 drm device private data
>   *
> @@ -311,7 +311,7 @@ void intel_lpe_audio_teardown(struct drm_i915_private *dev_priv)
>  }
>  
>  /**
> - * intel_lpe_audio_notify() - notify lpe audio event
> + * intel_lpe_audio_notify - notify lpe audio event
>   * audio driver and i915
>   * @dev_priv: the i915 drm device private data
>   * @pipe: pipe
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index da9cd41c45f1..0ac813422809 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -247,7 +247,7 @@ static const struct engine_info intel_engines[] = {
>  };
>  
>  /**
> - * intel_engine_context_size() - return the size of the context for an engine
> + * intel_engine_context_size - return the size of the context for an engine
>   * @gt: the gt
>   * @class: engine class
>   *
> @@ -576,7 +576,7 @@ static void intel_setup_engine_capabilities(struct intel_gt *gt)
>  }
>  
>  /**
> - * intel_engines_release() - free the resources allocated for Command Streamers
> + * intel_engines_release - free the resources allocated for Command Streamers
>   * @gt: pointer to struct intel_gt
>   */
>  void intel_engines_release(struct intel_gt *gt)
> @@ -846,7 +846,7 @@ static void setup_logical_ids(struct intel_gt *gt, u8 *logical_ids, u8 class)
>  }
>  
>  /**
> - * intel_engines_init_mmio() - allocate and prepare the Engine Command Streamers
> + * intel_engines_init_mmio - allocate and prepare the Engine Command Streamers
>   * @gt: pointer to struct intel_gt
>   *
>   * Return: non-zero if the initialization failed.
> @@ -1631,7 +1631,7 @@ void __intel_engine_flush_submission(struct intel_engine_cs *engine, bool sync)
>  }
>  
>  /**
> - * intel_engine_is_idle() - Report if the engine has finished process all work
> + * intel_engine_is_idle - Report if the engine has finished process all work
>   * @engine: the intel_engine_cs
>   *
>   * Return true if there are no requests pending, nothing left to be submitted
> @@ -2203,7 +2203,7 @@ void intel_engine_dump(struct intel_engine_cs *engine,
>  }
>  
>  /**
> - * intel_engine_get_busy_time() - Return current accumulated engine busyness
> + * intel_engine_get_busy_time - Return current accumulated engine busyness
>   * @engine: engine to report on
>   * @now: monotonic timestamp of sampling
>   *
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 24451d000a6a..d969005a857c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -599,7 +599,7 @@ int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
>  }
>  
>  /**
> - * intel_guc_auth_huc() - Send action to GuC to authenticate HuC ucode
> + * intel_guc_auth_huc - Send action to GuC to authenticate HuC ucode
>   * @guc: intel_guc structure
>   * @rsa_offset: rsa offset w.r.t ggtt base of huc vma
>   *
> @@ -620,7 +620,7 @@ int intel_guc_auth_huc(struct intel_guc *guc, u32 rsa_offset)
>  }
>  
>  /**
> - * intel_guc_suspend() - notify GuC entering suspend state
> + * intel_guc_suspend - notify GuC entering suspend state
>   * @guc:	the guc
>   */
>  int intel_guc_suspend(struct intel_guc *guc)
> @@ -657,7 +657,7 @@ int intel_guc_suspend(struct intel_guc *guc)
>  }
>  
>  /**
> - * intel_guc_resume() - notify GuC resuming from suspend state
> + * intel_guc_resume - notify GuC resuming from suspend state
>   * @guc:	the guc
>   */
>  int intel_guc_resume(struct intel_guc *guc)
> @@ -706,7 +706,7 @@ int intel_guc_resume(struct intel_guc *guc)
>   */
>  
>  /**
> - * intel_guc_allocate_vma() - Allocate a GGTT VMA for GuC usage
> + * intel_guc_allocate_vma - Allocate a GGTT VMA for GuC usage
>   * @guc:	the guc
>   * @size:	size of area to allocate (both virtual space and memory)
>   *
> @@ -756,7 +756,7 @@ struct i915_vma *intel_guc_allocate_vma(struct intel_guc *guc, u32 size)
>  }
>  
>  /**
> - * intel_guc_allocate_and_map_vma() - Allocate and map VMA for GuC usage
> + * intel_guc_allocate_and_map_vma - Allocate and map VMA for GuC usage
>   * @guc:	the guc
>   * @size:	size of area to allocate (both virtual space and memory)
>   * @out_vma:	return variable for the allocated vma pointer
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 804133df1ac9..04b0cecf12bd 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -325,7 +325,7 @@ static inline void intel_guc_to_host_event_handler(struct intel_guc *guc)
>  #define GUC_GGTT_TOP	0xFEE00000
>  
>  /**
> - * intel_guc_ggtt_offset() - Get and validate the GGTT offset of @vma
> + * intel_guc_ggtt_offset - Get and validate the GGTT offset of @vma
>   * @guc: intel_guc structure.
>   * @vma: i915 graphics virtual memory area.
>   *
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 74cbe8eaf531..77204382cc44 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -786,7 +786,7 @@ static void __guc_ads_init(struct intel_guc *guc)
>  }
>  
>  /**
> - * intel_guc_ads_create() - allocates and initializes GuC ADS.
> + * intel_guc_ads_create - allocates and initializes GuC ADS.
>   * @guc: intel_guc struct
>   *
>   * GuC needs memory block (Additional Data Struct), where it will store
> @@ -871,7 +871,7 @@ static void guc_ads_private_data_reset(struct intel_guc *guc)
>  }
>  
>  /**
> - * intel_guc_ads_reset() - prepares GuC Additional Data Struct for reuse
> + * intel_guc_ads_reset - prepares GuC Additional Data Struct for reuse
>   * @guc: intel_guc struct
>   *
>   * GuC stores some data in ADS, which might be stale after a reset.
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> index a0372735cddb..bcdc37e6d9c9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> @@ -151,7 +151,7 @@ static int guc_wait_ucode(struct intel_uncore *uncore)
>  }
>  
>  /**
> - * intel_guc_fw_upload() - load GuC uCode to device
> + * intel_guc_fw_upload - load GuC uCode to device
>   * @guc: intel_guc structure
>   *
>   * Called from intel_uc_init_hw() during driver load, resume from sleep and
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index fdd895f73f9f..288db5ada139 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -381,7 +381,7 @@ static void slpc_shared_data_reset(struct slpc_shared_data *data)
>  }
>  
>  /**
> - * intel_guc_slpc_set_max_freq() - Set max frequency limit for SLPC.
> + * intel_guc_slpc_set_max_freq - Set max frequency limit for SLPC.
>   * @slpc: pointer to intel_guc_slpc.
>   * @val: frequency (MHz)
>   *
> @@ -418,7 +418,7 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>  }
>  
>  /**
> - * intel_guc_slpc_get_max_freq() - Get max frequency limit for SLPC.
> + * intel_guc_slpc_get_max_freq - Get max frequency limit for SLPC.
>   * @slpc: pointer to intel_guc_slpc.
>   * @val: pointer to val which will hold max frequency (MHz)
>   *
> @@ -445,7 +445,7 @@ int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val)
>  }
>  
>  /**
> - * intel_guc_slpc_set_min_freq() - Set min frequency limit for SLPC.
> + * intel_guc_slpc_set_min_freq - Set min frequency limit for SLPC.
>   * @slpc: pointer to intel_guc_slpc.
>   * @val: frequency (MHz)
>   *
> @@ -498,7 +498,7 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>  }
>  
>  /**
> - * intel_guc_slpc_get_min_freq() - Get min frequency limit for SLPC.
> + * intel_guc_slpc_get_min_freq - Get min frequency limit for SLPC.
>   * @slpc: pointer to intel_guc_slpc.
>   * @val: pointer to val which will hold min frequency (MHz)
>   *
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 3bb8838e325a..127f7b952646 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -126,7 +126,7 @@ void intel_huc_fini(struct intel_huc *huc)
>  }
>  
>  /**
> - * intel_huc_auth() - Authenticate HuC uCode
> + * intel_huc_auth - Authenticate HuC uCode
>   * @huc: intel_huc structure
>   *
>   * Called after HuC and GuC firmware loading during intel_uc_init_hw().
> @@ -194,7 +194,7 @@ static bool huc_is_authenticated(struct intel_huc *huc)
>  }
>  
>  /**
> - * intel_huc_check_status() - check HuC status
> + * intel_huc_check_status - check HuC status
>   * @huc: intel_huc structure
>   *
>   * This function reads status register to verify if HuC
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> index 9d6ab1e01639..1fb05b45a8d2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> @@ -8,7 +8,7 @@
>  #include "i915_drv.h"
>  
>  /**
> - * intel_huc_fw_upload() - load HuC uCode to device via DMA transfer
> + * intel_huc_fw_upload - load HuC uCode to device via DMA transfer
>   * @huc: intel_huc structure
>   *
>   * Called from intel_uc_init_hw() during driver load, resume from sleep and
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index cb586f7df270..b14c82e17a6c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -250,7 +250,7 @@ static inline u32 __intel_uc_fw_get_upload_size(struct intel_uc_fw *uc_fw)
>  }
>  
>  /**
> - * intel_uc_fw_get_upload_size() - Get size of firmware needed to be uploaded.
> + * intel_uc_fw_get_upload_size - Get size of firmware needed to be uploaded.
>   * @uc_fw: uC firmware.
>   *
>   * Get the size of the firmware and header that will be uploaded to WOPCM.
> diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
> index f93e6122f247..1929aff97fee 100644
> --- a/drivers/gpu/drm/i915/i915_cmd_parser.c
> +++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
> @@ -945,7 +945,7 @@ static void fini_hash_table(struct intel_engine_cs *engine)
>  }
>  
>  /**
> - * intel_engine_init_cmd_parser() - set cmd parser related fields for an engine
> + * intel_engine_init_cmd_parser - set cmd parser related fields for an engine
>   * @engine: the engine to initialize
>   *
>   * Optionally initializes fields related to batch buffer command parsing in the
> @@ -1059,7 +1059,7 @@ int intel_engine_init_cmd_parser(struct intel_engine_cs *engine)
>  }
>  
>  /**
> - * intel_engine_cleanup_cmd_parser() - clean up cmd parser related fields
> + * intel_engine_cleanup_cmd_parser - clean up cmd parser related fields
>   * @engine: the engine to clean up
>   *
>   * Releases any resources related to command parsing that may have been
> @@ -1422,7 +1422,7 @@ static unsigned long *alloc_whitelist(u32 batch_length)
>  #define LENGTH_BIAS 2
>  
>  /**
> - * intel_engine_cmd_parser() - parse a batch buffer for privilege violations
> + * intel_engine_cmd_parser - parse a batch buffer for privilege violations
>   * @engine: the engine on which the batch is to execute
>   * @batch: the batch buffer in question
>   * @batch_offset: byte offset in the batch at which execution starts
> @@ -1578,7 +1578,7 @@ int intel_engine_cmd_parser(struct intel_engine_cs *engine,
>  }
>  
>  /**
> - * i915_cmd_parser_get_version() - get the cmd parser version number
> + * i915_cmd_parser_get_version - get the cmd parser version number
>   * @dev_priv: i915 device private
>   *
>   * The cmd parser maintains a simple increasing integer version number suitable
> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
> index 8f486f77609f..ce859aedfd01 100644
> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
> @@ -10,7 +10,7 @@
>  #include <linux/bits.h>
>  
>  /**
> - * REG_BIT() - Prepare a u32 bit value
> + * REG_BIT - Prepare a u32 bit value
>   * @__n: 0-based bit number
>   *
>   * Local wrapper for BIT() to force u32, with compile time checks.
> @@ -23,7 +23,7 @@
>  				 ((__n) < 0 || (__n) > 31))))
>  
>  /**
> - * REG_GENMASK() - Prepare a continuous u32 bitmask
> + * REG_GENMASK - Prepare a continuous u32 bitmask
>   * @__high: 0-based high bit
>   * @__low: 0-based low bit
>   *
> @@ -38,7 +38,7 @@
>  				 ((__low) < 0 || (__high) > 31 || (__low) > (__high)))))
>  
>  /**
> - * REG_GENMASK64() - Prepare a continuous u64 bitmask
> + * REG_GENMASK64 - Prepare a continuous u64 bitmask
>   * @__high: 0-based high bit
>   * @__low: 0-based low bit
>   *
> @@ -58,7 +58,7 @@
>  #define IS_POWER_OF_2(__x)		((__x) && (((__x) & ((__x) - 1)) == 0))
>  
>  /**
> - * REG_FIELD_PREP() - Prepare a u32 bitfield value
> + * REG_FIELD_PREP - Prepare a u32 bitfield value
>   * @__mask: shifted mask defining the field's length and position
>   * @__val: value to put in the field
>   *
> @@ -75,7 +75,7 @@
>  	       BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))
>  
>  /**
> - * REG_FIELD_GET() - Extract a u32 bitfield value
> + * REG_FIELD_GET - Extract a u32 bitfield value
>   * @__mask: shifted mask defining the field's length and position
>   * @__val: value to extract the bitfield value from
>   *
> @@ -87,7 +87,7 @@
>  #define REG_FIELD_GET(__mask, __val)	((u32)FIELD_GET(__mask, __val))
>  
>  /**
> - * REG_FIELD_GET64() - Extract a u64 bitfield value
> + * REG_FIELD_GET64 - Extract a u64 bitfield value
>   * @__mask: shifted mask defining the field's length and position
>   * @__val: value to extract the bitfield value from
>   *
> diff --git a/drivers/gpu/drm/i915/intel_wopcm.c b/drivers/gpu/drm/i915/intel_wopcm.c
> index 322fb9eeb880..c66b3c173ed6 100644
> --- a/drivers/gpu/drm/i915/intel_wopcm.c
> +++ b/drivers/gpu/drm/i915/intel_wopcm.c
> @@ -70,7 +70,7 @@ static inline struct drm_i915_private *wopcm_to_i915(struct intel_wopcm *wopcm)
>  }
>  
>  /**
> - * intel_wopcm_init_early() - Early initialization of the WOPCM.
> + * intel_wopcm_init_early - Early initialization of the WOPCM.
>   * @wopcm: pointer to intel_wopcm.
>   *
>   * Setup the size of WOPCM which will be used by later on WOPCM partitioning.
> @@ -217,7 +217,7 @@ static bool __wopcm_regs_writable(struct intel_uncore *uncore)
>  }
>  
>  /**
> - * intel_wopcm_init() - Initialize the WOPCM structure.
> + * intel_wopcm_init - Initialize the WOPCM structure.
>   * @wopcm: pointer to intel_wopcm.
>   *
>   * This function will partition WOPCM space based on GuC and HuC firmware sizes
> -- 
> 2.37.3
> 
