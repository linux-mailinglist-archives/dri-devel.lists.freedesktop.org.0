Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6CF5AF8DB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 02:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8016A10E07B;
	Wed,  7 Sep 2022 00:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E950110E074;
 Wed,  7 Sep 2022 00:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662509298; x=1694045298;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+bwoW4u43kOj87EDy1fw27IZtRjKTqID48IWYL7NVd8=;
 b=Ph4ET1cMjTODJ7WPWMdumb3dJH6saCavYcAbgOaLMZjIzSrIWPk2O+hl
 rHiufH8efEQ5tHpVH7EQTdSB/rIHNAzmxF9IyXeEroKYqS2fJfPaMMH2+
 qsvkB5Yva4BVfFdpxPY069Wm5wSxcK9yqYMNXq0XLFI3e7f4TKLW5VXAz
 OkALbOF3GqJNRF8Hq6JYjSBb2QuTHmQ4UKQL3FoljdSszhNDQpV/yyGdu
 kHLo0DXsoHcuHTBkIn5LfvseVJ0QUcfjZutVT4k1TX4x0l64vfwlIv6OP
 FRreVAPklxZukqKBIxx4Jziy33hQ7DJcepi/VHatpFd2b+YlevumznBu3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="358457448"
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="358457448"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 17:08:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="610133538"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 06 Sep 2022 17:08:18 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 17:08:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 17:08:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 17:08:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 17:07:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlABx/iQVkb8W8x+UxdgeXhOOtjm/c20XK4mRq6L2LC6dq3MHR4cL9KuACNmgtiN4CdAYX3NPZ/5x51IiyWU5QoO8TiuwZ62HMU6olXntDx3YAgV7vBHqy5h+pouayNtJtM8bJUBn4PAkaJ9QG8rnSmEZgmKs6IguBjL8E+fq6wfmI0MK2bHMvyvsJ+0LRXVWEtYfT1escy7WqInWhZaWye3WhT3GsPM8TV/aHGoBfjryGoB+1UMBATgIaIqwAC+JRacVCvEivr5eh37NXMoAA0CoSqYa/wWDMXNjWk1fHjr8mFms1GPKmaItMLF6ziaYZh8AkNumdbAGHoz88Og1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PM4TsA4tJFN9jcTNF8aLec34P8uRQdiHopYuOUYHVl8=;
 b=m6nQT1YZviTl1SpTGNK2bbPvBa9ioKby8jpRwN/gwuFWPwjKsM9skDHmbFkUgkyhAwehJ+UCHhzuE0IjSmTCyuUmt6ow/a7L95zxUp1L/YTvWwVjUA34z5+bGpoIQjrK35s+yztBK0SyZ1ltbUcKu1WB7vEBFRB5s4g589AGcjg8jio7ztclQHZnmBtZEi9EPROAagpo4pmmZRP7TIs30Z+zdGwdbxz2TF+KFxlZF8mT0JbYUmnyNNEzvDKfV1xEa7Umqa6hWxXmIDYN47R71cql4IrlvAh1JbTqILWU14hnHgfKSM1HJ7BXqWNlOIlwDFRQSvoZy57WytVYjGg+FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH2PR11MB4405.namprd11.prod.outlook.com (2603:10b6:610:49::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 00:07:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2%5]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 00:07:21 +0000
Date: Tue, 6 Sep 2022 17:07:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 04/14] drm/i915: Drop intel_gt_tile_cleanup()
Message-ID: <20220907000719.low4sfm2y6wmlps4@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220906234934.3655440-1-matthew.d.roper@intel.com>
 <20220906234934.3655440-5-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220906234934.3655440-5-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0111.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58b2ca30-1747-469c-726e-08da9064ef3c
X-MS-TrafficTypeDiagnostic: CH2PR11MB4405:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5CPg2T2B6hFdAJHTIhYO1OLtBXs9quHrjB3LE0KqXCJ+NM08dYIrSn+3VYUKzfTYlZCsPVq+H15qng35beHfa84vazQr1D7HA1WUyiAMja0wOWlPUk1Ef65kXU9zEHDgIMVy2Uzi9sSXLfszj5lM3plTg6miZiXzJ1OQUpC4vQGyBFfMceFcexGdUbgjhEn19LocsY/ichsZPPKS+p5U4eoC7B73TzslN3SuDmZjRIdlc5GLjZeO4fZ4DrhJFt8J6jDuwMME3/nkc2YmhsnFu7WN7XJYxPr8LzGqOKoauLgFV0V1rEYL2nw20jJ9hcFOurI80OzWq4cOxssEk6eT3wmwaWbRN4CaoAgyKa+xS0uzAeu+JLq9ct675rzmSw9fkI9NIraNHtHOg3XN9O4HKXcr/DaUU4D3y7f0PCvafMS9Q+ZGA7k/SAprgkeBKGh4ZXT3v5oFZPxLcwRrxgzVSn9jgYXOy8Y12hQQ//3M8lRoFpBXnahXHDRdGJq1tfsc8cAL5v0+QDe3VBkL4R/r/Wg3oYNWhRRJlg298gBL98kes270RmOn1f1I1qDYRhV8lTRYyAtvVkpzGRbSkb4Fq4oLzZR7OTAr8O2qnx/ckV31d+2ZYEy9tBm4iFxwLxVUctXb/GmKnLENY0QL4mybGV4GSjZLrNSr32COpt6b4f9JLl7xT/+Ks5ICv8teiCFaR/jn1xkC232iEKvXiDb5dA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(396003)(376002)(346002)(39860400002)(83380400001)(6636002)(6512007)(26005)(9686003)(6506007)(82960400001)(316002)(38100700002)(2906002)(36756003)(6862004)(86362001)(8676002)(450100002)(66946007)(478600001)(66476007)(6486002)(4326008)(5660300002)(8936002)(66556008)(186003)(4744005)(1076003)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xM7ues+6m4Hk4/ow4A2ygj+O8xtsin+3RiOY9dajRkHmELB5IA6KVTLuYJRl?=
 =?us-ascii?Q?loQA4o85PAd79tuGeuElhHCJaeH1calRR1FEOEIRf3FFuMvHwhzO3qsHUcmZ?=
 =?us-ascii?Q?cqyZL+x5ZcEja6fD+Xp7D4t4b31N3K+Sib8uZhdPyicOqkGbbsXRkVnbWphf?=
 =?us-ascii?Q?x8v1RRacSf8yTa++KvaNRB8LsuTdcw6CGWWr0mkLAOFxEWV7Txnn98a1F+Wg?=
 =?us-ascii?Q?e5CEv6aechEypBiHOURxBvud3Rnwohn3wtbYzRGx1JBJl5RHnc2LpraecWWx?=
 =?us-ascii?Q?nPbkzpO+XEWubjH/Qzh5LtJYHUlKR0BjmWDV0GzNGf9ofokKr/0OgL8bcA1I?=
 =?us-ascii?Q?0hH70YZJTg5YF8FiADtJpmnXQUR/DCEoXZtf5gBMogRrWRJIcBM2hayvsVLM?=
 =?us-ascii?Q?J/q1A8EH0CWmIeOes32k6YFlJqGgBRb4wCA+YI7BRXytE/LPE9B3SWeNTxX/?=
 =?us-ascii?Q?9kparA835B29Prn/2Y4yGU07gjlllGBJL1vtG+ukWn+Tv7jZnuEGpqQ8xGFO?=
 =?us-ascii?Q?O/4J2TGrU+z1a7olLS9CE0NuKj62wdICO0IVwu8zjMxvsAMH0Dw+4kl6i9IX?=
 =?us-ascii?Q?jns2aZS9WXQJuSgm2tyM6CdNAxGoZAmMG3Kmv3m16oFLv6t1p7wBIrfWjMpS?=
 =?us-ascii?Q?fOFdjCqBFVkxDQJGdNQVXN2Cjvxlqu9KmXIg1SuhJIkhZ4I/P6PGWzBXcJjI?=
 =?us-ascii?Q?8ppNQJWwC+iTVoRP3p6xG5ouCBUr0HAGj3QAbQsGKPpi2RStKvx7cuQFDP0E?=
 =?us-ascii?Q?KWQRFeHB4V1nV5uGSrHn4Or8jIx0GeHBnrQl9M5aK0TG4mW2whaySAQYQLQ6?=
 =?us-ascii?Q?1ZyydWFXo1OulBE0K0XoKMyxzjC/mep63eYUiZpoHuHkJi+4dj+dt/kM6P4h?=
 =?us-ascii?Q?ZEtmC05Wk+YN4xDQ2USKqt2cbaksCTv/Wrp+9yUbkiPQalwLuuh1JGjbUDNo?=
 =?us-ascii?Q?kYAeM2x0XzIzWkiKnp2JyzAxHMFwX+rdqtkMgIdBqeUNTDFnHd0gj+s5cjB9?=
 =?us-ascii?Q?/1pONqESk83Xg0x/P9jXroL4+pBRnqivEyVI2IgFxDgXsxRlceF8uMSyumlq?=
 =?us-ascii?Q?Y8QQA8DTvwRHYzSvKRlJP2DYymss3/bFTjtInj41MiCJ4faCRuZ5goCzLKwg?=
 =?us-ascii?Q?TorVAud7Z4Q/OIf3OOvksqpT6IOSrlZyh07TidExeygnElH8Wps+VK0XPBlC?=
 =?us-ascii?Q?8XQzbitz+ycAy5/ryUSgMWbQHWt66eQPqIa292Tjbh/k9faT/ImtCC/WhPSi?=
 =?us-ascii?Q?Yx3c0gH+P2t8wiNOkjDsA1hhTk+sjXk/ejOfSF4kjtGN12thOAstJd/kn1xQ?=
 =?us-ascii?Q?0doLESiok8eU1HBBLN3W0nqO/taac4f1iMPnZtvK+r9NvXdkgIBWoAyXHraj?=
 =?us-ascii?Q?sOz6nYwSTyHMzHl1NgJyMPapwfI42MMs1AnVdeiKkgKLeOC31KWO1crVoGVa?=
 =?us-ascii?Q?tfbAa1uCUHVX0TImTSpxzmXnoNRARm6Z9fmoLzOZpdvoHSjn//nZRc4Cic2Z?=
 =?us-ascii?Q?Kd4N5b1OYZur7Jc4nAo1F9FwZ++Hn7HhNMR97qKoXs+9tq56wDc3tEs89Uzo?=
 =?us-ascii?Q?nXx6UkfV2UrtLHkomu9USAAVdAGZeQcOH+duGQEc8djAgtc0SbdGy9lWq5DA?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b2ca30-1747-469c-726e-08da9064ef3c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 00:07:21.4472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7zmHnoJO6RKEsC+jPkDMKixotFuxyRm1e8xs+dLysrrvZcBzG206APD4WSBm4SksnvHNpOIBCdWqtpisPe8+4Lp9dRBGZGvlwPGJfjYp24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4405
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 06, 2022 at 04:49:24PM -0700, Matt Roper wrote:
>Unmapping of the MMIO range can be done as a DRM-managed action, which
>will take care of the unmapping on device teardown and error paths.
>This will also ensure proper ordering with respect to other DRM-managed
>actions that we'll be using to clean up non-primary GTs in upcoming
>patches.
>
>We have not yet enabled any non-root GTs in the driver yet, so the
>kfree() of the GT structure is effectively dead code.  When we do start
>enabling non-root GTs in upcoming patches, those are going to be using
>DRM-managed allocations tied to the device lifetime, so we don't need to
>explicitly free them (and kfree would be incorrect anyway).
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
