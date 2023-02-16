Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D51699710
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 15:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6254810ED85;
	Thu, 16 Feb 2023 14:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2683610ED73;
 Thu, 16 Feb 2023 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676557188; x=1708093188;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=cjNx7CfLydnXZfaW//Q7IX829ZlEDo7ukiGXeX/EBQ8=;
 b=cpzebRr64ySdLGbJa6JOjY8ilcd6sxhDsf5gQn86UjJ7fwN8+OY1ALFP
 u3tScU7znxcFmmM9+2sKL50mVBV2k9roHI334zf3KDBEeIewML29Rv+Gn
 dYqdccm1km6xcQGvrnvh+a9aEGairiuD3D5PxxsU3egDHyqqidnEFi/vy
 kefzzZn86wQ/gFYUMJjfoCN/sevRiXHznPVsmmCwqSkkDObgqc4JL3KUY
 hXzoBd/YEdI+k2VFhDdlQH0gbCEMgexTo05CUCwM8TCLvuCZbTfgyOI8x
 Y/MVUgb8BUV4wmzICYDNFM3SYlBb69AXoR5a3pF1E5wAXLjZqVzb/gcg8 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="417945997"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="417945997"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 06:19:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="915675625"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="915675625"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 16 Feb 2023 06:19:47 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 06:19:47 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 16 Feb 2023 06:19:47 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 16 Feb 2023 06:19:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=er8pcEVFONU93UaWPOjwKXBV7vdUCv163sFQ9XFQuFH5SGuwYnUkYbJ+XSJAhQymiad+JAgRX39hUz+glsD0HQdo+fO6hUMuYtKB3JYdchqc2T+a/qpc1iuKIKp2AgjT8R9X6S82lpk6S5ctTGtuolWmrNpTX7GfLkFHh41zt5SLvmtoEbYxv90bkikrmxf1GYXox9XgcHfEOO/gCGxXZzwUB6UosXvVWGdkG+5JCBroXgBZzNi+vEmya8OUIibmKZKpyWuw2FBe5HUoPZ1WN/fMogWOcogTlAiPr0MYvgOz7IQqLYQ1k6YrLdS++VPQ1vo7+3FMjIG96F1RLohOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmFlqUyCaBbJDbxapV3+Q8L14QDcg1AmE/4m4y1ZXrg=;
 b=mJlk1upYlVrG+fjp1aadoFdkT6Es0U4GpND0lsqOYl45VlxfXSoZs4RG6oEHDgvtgbGZenomQ/Mb1617Q1rgiR5hUGEQow3EhaZKF3ZDQ5ByrmUC0kUp7fSNbxWE7QMuly5fYmhw06msLXVnheZaJLWyCHD4q8ZoYzXDvJububTlPUArO23CxiOk3s1fmN6yEA6OoVwBdDmq73o3V0Nqnrm2ZUE1HH4iU7kG00nF7vYMY6DKcnzuh2LDRxSvlms73/hCgQ2lhZxpdqTy1J3RR5WvquUMsOqhXeQoaRQthTibj79BcwRvmci0teVymSKMaIdLnS3M7SasiCCLXdCa+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 14:19:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 14:19:44 +0000
Date: Thu, 16 Feb 2023 09:19:37 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Y+47eUvwbafER35/@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bee4f46-3a75-4d53-bebe-08db1028d950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q3xih7Tfr+IeMW96SonUm9eMX6lAcaWh1qu+uJRLzhDaAxBKWmsGq6mey1MfbD+2PkM6zw3Yt/DURoM56JUlyD389pa8mk8jxlujEhpRJIseBZWIWfhRQILXY0d+MxTGF4PVN3VGPo6FO2frklmICwdOWVsZpEmAdfMcEce6Fi3R9x9j5haSnZCowdFkwLyqJ43oL2agx8F7FgcYEraSbIPDedA7TW8blLui0QVmInwqdS8ZeywpsE7Nw9/pPuABhbLzYZq/9mjsFfXL69xcUQ7sCIZk/zNLnBuuGHHM0km/02OA92VrQfmHwv/wMeGa84l/1t1Cb+aa9m+CjmzY5bOp48OnTZsUbTOQ6PYePJz2cEpCxNsjzAdxwcPcO98gaPWNyqxOgyfk3LKOE++vqfo+nABGYReSkZj4J4FUxrxIUVmnJdc3ZauOQrrspiHpwGJCu1KwRdFHuOTWKKocRJmXcQlvBOrgIyDKEJw08hlir8qTUdhHbXLwKdtJKsz4Qx1UkzNK05uGWqjeR8aqXBX5ZPplr2moSQhCruIuQAxonIfjbwMWQdFHgNu7GEO0+cuWmk5uFGti9ZEVQclz3dbPSdQ7NLjG5zamrEEM1w9Thq24rHuWziL/drXhdAJYa8YlL/E+BLMYvsh5w0nKkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199018)(6512007)(2906002)(2616005)(83380400001)(4744005)(44832011)(186003)(26005)(478600001)(8676002)(82960400001)(6506007)(4326008)(6486002)(41300700001)(6666004)(66556008)(38100700002)(8936002)(66946007)(66476007)(54906003)(7416002)(316002)(5660300002)(36756003)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FkmfH29lBWGMT/sahcYqA6aedPKmQXaGqJNY74DvpBofZuuPAdCfMBEixVrA?=
 =?us-ascii?Q?skiD5+kgS/NM9c9ibZYr8i/SxnXReTR2ElUTlQmaGa6ADJK/CQgFCgkdZ5mI?=
 =?us-ascii?Q?3/GlIjyxbPISmwRL0Q0YkRgzqPli0WjA3IRBM90o4Yn9wSWrHE/rjWOD/7PS?=
 =?us-ascii?Q?dXlHS/nlNG0JcEWtT8UwUOnDvteWFUiRcROdrAeQuNdg++M3Qy4+xDSSPwfT?=
 =?us-ascii?Q?2bG1ZZ30+YjaMjSOydSPuBIW13r3Ekq1/UxvOktZ5HgxWNG6mmKTMF5ZLjEe?=
 =?us-ascii?Q?JkyvaYJUuhLFC/K4aqs6mtqKK3shKWur+Kp/nOUvPy8Q+dtyPOol8iex9jw4?=
 =?us-ascii?Q?EDro8TyqB4iWX9PmAEBswPEToCQC9/0xbCa/WYPcovnCSD+iSNSReDmMdmsr?=
 =?us-ascii?Q?3mPzHJDatp1jOxKUtqdKM9WiZiIDU1lm8i4PoGUsDrn69lsm4vMRviqYIQjK?=
 =?us-ascii?Q?VBg2mYx7Kxo+p/0yXrKBH4sphXSppD2/umWuGz5o5hA/Wfws8kigFB1uPQOo?=
 =?us-ascii?Q?StKyhmsnc13juFWPF1sz75RT8Qf3DELC9H4ALiF0HayrDjNPCJ4u92qFef/y?=
 =?us-ascii?Q?2dlalPQ05DtovWMKQm6CBd+qXsIIzsf2Z4pgz7oOgoCKw0wM3I+SrtGaJXtd?=
 =?us-ascii?Q?wcpv9YpfP6ijdib3iH2o/OwyITCVcVrnaanM5dpgSqRTxI/sO1CvccW2nFUb?=
 =?us-ascii?Q?UcChVqAi/CR9wzxyhKJ3x5JTY3O9GrEq1b8NC2nuT7nsAxKv+CTHGymj1WgT?=
 =?us-ascii?Q?O/qq1ekEc6S7t5tx/85UKFeQIlwk784SKCE261vgO3RK5tfiCaTgUU/+lhQ4?=
 =?us-ascii?Q?TtjkG1ZR6M+OhO5HDaQG17p5CHSmaDyOUhes+xPNqPZ129iyGFa23ys8ws3q?=
 =?us-ascii?Q?ijQuam8seU71eL3sNALYXTNn86V5Hz6sVrjojkrTh37tPBTK9XK/uCMBq20r?=
 =?us-ascii?Q?KiMghN1Aye9zLewSr8yOlMNT8RaJJ1MCLFtiwcXwUeZ6fhShLUXIi0AFBps6?=
 =?us-ascii?Q?Fa6CknIvl5pwBIPnBG3I9AVa08Itfu7SYBPtumQ6O6grfJPkVDPNlsWbq0Wk?=
 =?us-ascii?Q?JtCdh1n1m20grO/l8yd8BbxtjJLeQNKrmPzcAjfnZARwdD0RTVAuvA438IXa?=
 =?us-ascii?Q?7BiAJfdTDc+YwP6kbVN5GEaEJOGYaz3EXIZJp3Jo3i6YOHb6W5tPqAOJUVO0?=
 =?us-ascii?Q?kUP9W4iykJi72D+GoVEf/AIbvXgmx9JOvAJsYA7qcByKn9KV5A8rVYPqPPbg?=
 =?us-ascii?Q?db3leBIMfHRhMUkQLoyO5wZg2nsR9Gt/1oghdiDWnFffccMP8oRC6Cp42FrX?=
 =?us-ascii?Q?dMM7ff9dMtrYuViFkwtWIHxxnsSKOYKmIRctIIiwXaGSIm3sjcBaOHCCBgg3?=
 =?us-ascii?Q?IS0l2Ks8KmevhQP5ZPirguvSSpnHLz7idb94HlXsWsJFXnH4UQvxPTfp69FX?=
 =?us-ascii?Q?K9kEx39LDRp4Zmh02kbNfKh/dmFjkawzKKhsSBmSKHaM3KudPDVrKX8CyKkr?=
 =?us-ascii?Q?t6FTSuKveOR2E3BsVXphdat2qnbHKC2tqpy3CmtpqdROkvaFyiCe4qZr+OUx?=
 =?us-ascii?Q?4LFoyiIAn5pxowJMgwVmbGqu7Sl7s3CL5sJeFP47xGYIQhjWdOHPEiGWe7cF?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bee4f46-3a75-4d53-bebe-08db1028d950
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:19:43.6708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shE2VKQA47JRtJVmoJekhmyg9DgbHPA+WajSzdhv7RrZIQl7U2WrzQ88U+3viTBSVAz6+C/RU1FZdANl9VqQOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7169
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
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Only 1 gen11 workaround fix.

Here goes drm-intel-fixes-2023-02-16:
- Moving gen11 hw wa to the right place. (Matt)

Thanks,
Rodrigo.

The following changes since commit ceaa837f96adb69c0df0397937cd74991d5d821a:

  Linux 6.2-rc8 (2023-02-12 14:10:17 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-02-16

for you to fetch changes up to d5a1224aa68c8b124a4c5c390186e571815ed390:

  drm/i915/gen11: Wa_1408615072/Wa_1407596294 should be on GT list (2023-02-14 16:08:48 -0500)

----------------------------------------------------------------
- Moving gen11 hw wa to the right place. (Matt)

----------------------------------------------------------------
Matt Roper (1):
      drm/i915/gen11: Wa_1408615072/Wa_1407596294 should be on GT list

 drivers/gpu/drm/i915/gt/intel_workarounds.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
