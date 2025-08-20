Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB64B2D4D6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 09:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7503F10E354;
	Wed, 20 Aug 2025 07:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A64imgfl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05EE10E162
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 07:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755674883; x=1787210883;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=MDOcAXSnzWBCU0cKUjcotjcSDSGhHkkyCi699hzVt5Q=;
 b=A64imgflvdrB8cg4gG/HnZ4T5urK2982iq6yXfrfV1th4514GLImja3L
 gqJws+ZwfMeKW/kSXwOCtpUYMqNRis5Ip+ol49DcfEGXmKUCDeh6EIMcr
 k2uBD/sCDAoGFU53jy46dLMmFIF05q/UwxGi1NaA280TGu2lNm0jCL9Ta
 CPmENKoi0cwaPNW8Vwwy/q7udYS71qwZLggKR5qnAF04S0x+tHqRig5r8
 daf9mNjbn/phLvRMgQZ+DqjC1TNBy81KfP1CsH6r/T45kuEcWifCmdLUM
 TvjgOOthZrEE2Gn850sdviRg3umMt/TKHjgXr8x4zHTQSq1VsJC5UnKr0 A==;
X-CSE-ConnectionGUID: UJaVIo/0S4OnMiU4Q97LQg==
X-CSE-MsgGUID: 1kGCAN7QQkGMHGE0nvyqzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="69382065"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="69382065"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 00:28:02 -0700
X-CSE-ConnectionGUID: aXMup+BQQa++hCfE3nVtuQ==
X-CSE-MsgGUID: fsM5h8rQTHSSJl29GJ88RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="199058321"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 00:28:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 00:28:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 00:28:00 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.80) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 00:28:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKFkGoKkXWfkcCs5q4ZsMaM32tEfOhUU5iQ1NNkcxBp7ExN55BvYWrb86W1hafG7nYCfWaiWAroVjAGaNRoTfl9un0ZejzO1GrzhykicoDtapBqJGaBJnVaiQ7SzROohsqOLS2dnUxhDSkW/wNkMsG+xBBMX7ZAXbbh37VBwy91MAHcAGR9tEyJ9p9ZwWHQThdHGQeTayMPiMJU9Fb1gnI0JD41OjpdNzr3jHIcGvvCHpm6kWGmpEFJZYjCCXJJznHKRZICCgLzFGrb62lo8+fHWwqA1uXxWOjhRtI1haqviKJk0ThtNjr5dY/mUeLWUh8B+q7/CbXfjs7Ao2y6bfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzHe7TCnQ2N/5qagXF1NICuSNu20ywpV4qrjXG7qpPc=;
 b=pSmWNbwJOPfHSQJcAL3aGGVn2b6ioOq2smUszudOKX77STHN9yOVh52HAeX5esOBDPZ88geNC8yVr/Ub+jrRwn2CVHBOTAeAO7apK8JbnZANjKJCnYex1IOj5oqsfsa7BkwKNiG9YgBmHCLuB7op+w9AK+bKdVIFuMaoevxH+8Yrl6dzIMFbAuPY4mm7BmRzR7awXyepKGeSho+bq/E/0Zx/EXAFmb0PDBEge0YOovJIPrHkD91klktwe76G1L6FX0qwcu0+cWCiJMFwpCtAeRgBlCs3ktfi1MeoNX4KSkOrwSSdPW3SO6NdJworXung9FFLuxDJWP2ODZNG2tUgBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS7PR11MB6151.namprd11.prod.outlook.com (2603:10b6:8:9c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 07:27:57 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 07:27:57 +0000
Date: Wed, 20 Aug 2025 15:27:47 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-media@vger.kernel.org>, 
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <ltp@lists.linux.it>, <simona.vetter@ffwll.ch>, <tvrtko.ursulin@igalia.com>,
 <phasta@mailbox.org>, <airlied@gmail.com>, <dakr@kernel.org>,
 <sumit.semwal@linaro.org>, <oliver.sang@intel.com>
Subject: Re: [PATCH 2/2] dma-buf: add warning when dma_fence is signaled from
 IOCTL
Message-ID: <202508200843.8b006132-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250812143402.8619-2-christian.koenig@amd.com>
X-ClientProxiedBy: SG2PR04CA0191.apcprd04.prod.outlook.com
 (2603:1096:4:14::29) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS7PR11MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: 1581b411-860e-492a-dd3d-08dddfbb15a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X0R9v52VPvoGVUiwlzROkEk3W4zhNIgDLAibFGz+CzSnYQbZFTWLTaCxDc9T?=
 =?us-ascii?Q?j/aj0HUpyWdDFAKlYoTvZDLiAd0JlUE2Jp76xVEV8hk+UphxzvpJxIQ38ZQ8?=
 =?us-ascii?Q?CFw6nKFWDm6QbTzhzEPbbUwhkLyxXlmeLwbaPkrgXt1UR9apzaW+l0YF0fEn?=
 =?us-ascii?Q?4OWwEUtkX2FNZQGZ0jyG+D8C90ksU/caQGeReRXYS/lFAVkgKEBA+oxbQ91Y?=
 =?us-ascii?Q?3mWTi/sXhIRFLFdLb9V+VSz7DcJwtosMP3ZjMWN0j31fXrF7NymzkaGBhnBW?=
 =?us-ascii?Q?AFVyvB12qCpVWPhaHZPOu2XHSVidnXtYM+HAS3FdXl7pABR93tOmVJ08KrdX?=
 =?us-ascii?Q?S98putHWoKfPuYnpbwNEdP/r2AeTpCUPGyj2WVvio+AkEuLtTb3QTjshb85y?=
 =?us-ascii?Q?toq8HMpoQvRjCdYm0lvQ3M5d3cnFfNgEdZm2jwEbuLVjpAErSmOQK65Iztff?=
 =?us-ascii?Q?wB2sZODpZQYF4FiR67tRK4Kv8lyn89E19pH4/H8Yc5rj6cv93jw8RhLvB4UV?=
 =?us-ascii?Q?jTom+eJsV6/o3ePzzE/u6g6jL4KaPPqWC5f7i2wObSN0Ne2/7siy362v8uhm?=
 =?us-ascii?Q?ZLnGkl+H6m7KqQk7evL7RkyHkjONOMrnwYyPB7UD2j40+MAOhQMxwRLStPzc?=
 =?us-ascii?Q?mgZeHae5Jp90xsc0L4cLey3vBqyjY85Sh59l2PeqB0Tf5UqPKkFALmqeE0mj?=
 =?us-ascii?Q?XcXouLUBTP0JPFlu9eULxB/Wy9lcfvV4gzPAvWPGmkmLMOmWDQFOeENYVboB?=
 =?us-ascii?Q?+Bv0col6WRnewJhOf4SoTcfB8jEJ4hHwshprXNAErIdeYSXMC/LEEwBD1Oc3?=
 =?us-ascii?Q?pZmt+TnwXhDP1uib/a1ILlVgsABw8MjiyWXMmIur3E7U5ZVSE64TQ8jk+rZ1?=
 =?us-ascii?Q?A/DAQeGKPh7M7oUGpihrPpUHlZoqMdE8rEHDnr+iOmScMLZwI2fC59h4V3iD?=
 =?us-ascii?Q?ug6lnMaMCUPRfb/+lNxeY+YezxjE0MerrPkxDbBmPAs3wyHtMnWIfxNyvCRt?=
 =?us-ascii?Q?Ygq86omnSZSJH2G4XFACDX9KmOxE/VtOC6wJvA1U1Z3b/AB1D5Nh3i09+7BA?=
 =?us-ascii?Q?05PD667o6A2L9yxB1cTVzsEW0IIJi/EMe3kb6wK0Ffmy4AdDsb7V9EcJrYGD?=
 =?us-ascii?Q?Q+ScVchXrTn93y96121JjFPjqNLg7PUT9HJTZqw8lhM5g/NkrbI2ccNUrSdg?=
 =?us-ascii?Q?fKwUZcEkvNqfLFEIUerAJEHK6xXNY7xB/umX/6SI0rL+wwRN5Gq+ZVGLAGPa?=
 =?us-ascii?Q?TX3Ru2yt73yXDtzJc62Bk0txZNtgnqs/p1hsf4p541sXUiwu92CDAxLx6CGk?=
 =?us-ascii?Q?RIsiG1Y0xXLQXK9sQ/9ep+ZOO8jQO9wT6gTCRwttgPpE56KI67AItO41P0uW?=
 =?us-ascii?Q?cZ1Tsu3YoPc6DGBIL15CMNABRSZW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0+ywhKjjuCbhVzdffArqh32MkJJKk4WbI8tA/BpWrzBPc1EnU/zNTLPkwEl6?=
 =?us-ascii?Q?VSarzDLYEhIpEyrdcvl2DfaKW/IUXT3weP4Wn+Pq1q2Af61KrXJRh1dMuebY?=
 =?us-ascii?Q?hc9pzx15QpLtJrzHhHRjdOBI9kIijpIx4xxz+xUOmlWzneX4KaOEEGCxu4y8?=
 =?us-ascii?Q?UL5X7ZzeQwTwNwgwmCCbcWSXD4G3BiGLf+0Lfajpq789zODgXgeMnGR8nHVa?=
 =?us-ascii?Q?ZKgQD2E1pzggMjLz/gXmwH1a28dvwtWg34RkXjdLroYlOmZe9IGHZzZelvz/?=
 =?us-ascii?Q?+O3SnNfF6yEW8VUvvP/Kl/we96KYDwgmF/NRSgwVDe3E1VeyiZ2+k/6oH5Q4?=
 =?us-ascii?Q?P9rF6mwuvQFnCVwMrDUZw3fKcaUwP5qxZM19NjpXXewnh1QSOz3sT04GfKmo?=
 =?us-ascii?Q?Ljp8ZQlJB3g2R4EmKTkyfEpJrlzrTMG3QFD+zmKY/6y1u2tZA3MQpb8URyAr?=
 =?us-ascii?Q?N7i+BJlIVNG6BgeyptrtNCbL9of4cDB05VjJ/xr0N37HhOgQFogqplYTKfqh?=
 =?us-ascii?Q?D1D2LNJmrU9YKxNzs1iw7cyxc98JkTAgMIVv3XU8Mjtxd+hsGW/f/Zd8KEZ0?=
 =?us-ascii?Q?PGvd46WglQrX35Gt5vP47tatGB99sgo0oehcpAbfAG3HldkQFF6TbMjPIf6x?=
 =?us-ascii?Q?l5AdXZmMhFcEAjNdfdK0C30z17X7Xsw2MWtFxyGv5CRa8KmoJGJDX+/71NO2?=
 =?us-ascii?Q?X/enTLjcld2iTpy9990SOsoGGU0EoYkaEpZ+fUFqmeJ94yFSzYCfk4thxAAW?=
 =?us-ascii?Q?z9XAcj6404cp7J0G5B3Mc4JfZ8KXCkxN5+LWA1cGKgdW0MwWbqltsXK6GsNG?=
 =?us-ascii?Q?vFXzF1Ih1dZol7ku9okTDNsDQ98A/bA8LuPz0XfXbhFY7FVtBOsnhdwsAl0B?=
 =?us-ascii?Q?OMTnrUaFsMda/GKNWOlS8VrJ80bGm0kFDC3eH7mh2oqSIg06ghfLQluzgYNO?=
 =?us-ascii?Q?1DIdQq3bags9tacZRKgwiX/5PDgm/BvMYW6bmP1rwfY3h5yO0yLhGt7NP3Th?=
 =?us-ascii?Q?vVndcYrhcLZp+/6IN9sMmSvRI66ABRRoSL6pkTMrdCDmNqZkt36Javhbif/9?=
 =?us-ascii?Q?qjNvo/sF8/wSqVwVxAa17GeEE2pmftVhFYT7pcBiyiB8BxQ9sao+IrcsOSlw?=
 =?us-ascii?Q?cO6M809aSS+NK24qF3i0GAcOicfoi5VvXDuy651V2M83EDsoZKGf7Os2NjS8?=
 =?us-ascii?Q?J1Sjc26gCWh7I3Za/rHUrQuw92mYCWQi33gT+AgM2WHpQOD713SwJbGHiOD4?=
 =?us-ascii?Q?14NkJdhsL3YkxL11JmZXfFXSrlx7r6e7og3zMvpWuUzUXNBIQIqV/Lh2g+O9?=
 =?us-ascii?Q?P+nNL9RwFBwg1dZNr9vk3URX67mjMUIhreCZ1EskYNPkW6dDTTMm+8VWVBuv?=
 =?us-ascii?Q?rCzajHuT+Rwnd8aGKRJLspGSv2ocfrhz600u07DAt9Ecx9z+t9ZXF93XhMvw?=
 =?us-ascii?Q?hLtS73xi6HJWB4vlm8mZXGfvWk/4heGYaorwxO5iy1DvMWgRgb0VVctKJ9vO?=
 =?us-ascii?Q?DiwSLfyAsvRBgyP21ZQgqCREFT8AsC1/f5CJ/w6G6/6IE8pAFCMw5LosqzyQ?=
 =?us-ascii?Q?WFmyX8zYyqncHpqzn9K9l1mTmLlPRFZr/LOj1i7VqDUAPIkNE9FbEYtxEY08?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1581b411-860e-492a-dd3d-08dddfbb15a7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 07:27:57.2659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Yu0tJxzqhttjT2c9nqyieqWO5bbqPONo93cONKEoA6mWvpmp8zzPoKjtSG0D9qRX8AMVptwdoJus2R71GUndQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6151
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Hello,

kernel test robot noticed "WARNING:at_drivers/dma-buf/dma-fence.c:#dma_fence_signal" on:

commit: 409db68e04bdf052bc03f620e70339764b598ade ("[PATCH 2/2] dma-buf: add warning when dma_fence is signaled from IOCTL")
url: https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-add-warning-when-dma_fence-is-signaled-from-IOCTL/20250812-223543
base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git 53e760d8949895390e256e723e7ee46618310361
patch link: https://lore.kernel.org/all/20250812143402.8619-2-christian.koenig@amd.com/
patch subject: [PATCH 2/2] dma-buf: add warning when dma_fence is signaled from IOCTL

in testcase: ltp
version: ltp-x86_64-9f512c1d8-1_20250809
with following parameters:

	test: syscalls-ipc-msgstress



config: x86_64-rhel-9.4-ltp
compiler: gcc-12
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Haswell) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202508200843.8b006132-lkp@intel.com


[   51.636268][  T218] ------------[ cut here ]------------
[ 51.636273][ T218] WARNING: CPU: 3 PID: 218 at drivers/dma-buf/dma-fence.c:420 dma_fence_signal (drivers/dma-buf/dma-fence.c:420 drivers/dma-buf/dma-fence.c:502) 
[   51.636292][  T218] Modules linked in: coretemp sd_mod snd_hda_codec_realtek_lib snd_hda_codec_generic sg ipmi_devintf kvm_intel snd_hda_intel ipmi_msghandler platform_profile i915(+) kvm snd_hda_codec intel_gtt dell_wmi snd_hda_core drm_buddy binfmt_misc dell_smbios snd_intel_dspcfg ttm dell_wmi_descriptor snd_intel_sdw_acpi snd_hwdep mei_wdt sparse_keymap irqbypass drm_display_helper ahci ghash_clmulni_intel snd_pcm libahci rfkill cec mei_me rapl intel_cstate dcdbas snd_timer drm_client_lib libata intel_uncore mei snd drm_kms_helper i2c_i801 i2c_smbus pcspkr lpc_ich soundcore video wmi fuse drm loop dm_mod
[   51.636385][  T218] CPU: 3 UID: 0 PID: 218 Comm: (udev-worker) Not tainted 6.17.0-rc1-00006-g409db68e04bd #1 PREEMPT(voluntary)
[   51.636395][  T218] Hardware name: Dell Inc. OptiPlex 9020/0DNKMN, BIOS A05 12/05/2013
[ 51.636399][ T218] RIP: 0010:dma_fence_signal (drivers/dma-buf/dma-fence.c:420 drivers/dma-buf/dma-fence.c:502) 
[ 51.636415][ T218] Code: 00 fc ff df 80 3c 02 00 75 36 48 8b 3b 4c 89 e6 e8 10 33 27 01 89 e8 5b 5d 41 5c c3 cc cc cc cc e8 b0 2e 77 fe 48 85 c0 75 bc <0f> 0b eb b8 0f 0b bd ea ff ff ff 5b 89 e8 5d 41 5c c3 cc cc cc cc
All code
========
   0:	00 fc                	add    %bh,%ah
   2:	ff                   	(bad)
   3:	df 80 3c 02 00 75    	filds  0x7500023c(%rax)
   9:	36 48 8b 3b          	ss mov (%rbx),%rdi
   d:	4c 89 e6             	mov    %r12,%rsi
  10:	e8 10 33 27 01       	call   0x1273325
  15:	89 e8                	mov    %ebp,%eax
  17:	5b                   	pop    %rbx
  18:	5d                   	pop    %rbp
  19:	41 5c                	pop    %r12
  1b:	c3                   	ret
  1c:	cc                   	int3
  1d:	cc                   	int3
  1e:	cc                   	int3
  1f:	cc                   	int3
  20:	e8 b0 2e 77 fe       	call   0xfffffffffe772ed5
  25:	48 85 c0             	test   %rax,%rax
  28:	75 bc                	jne    0xffffffffffffffe6
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	eb b8                	jmp    0xffffffffffffffe6
  2e:	0f 0b                	ud2
  30:	bd ea ff ff ff       	mov    $0xffffffea,%ebp
  35:	5b                   	pop    %rbx
  36:	89 e8                	mov    %ebp,%eax
  38:	5d                   	pop    %rbp
  39:	41 5c                	pop    %r12
  3b:	c3                   	ret
  3c:	cc                   	int3
  3d:	cc                   	int3
  3e:	cc                   	int3
  3f:	cc                   	int3

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	eb b8                	jmp    0xffffffffffffffbc
   4:	0f 0b                	ud2
   6:	bd ea ff ff ff       	mov    $0xffffffea,%ebp
   b:	5b                   	pop    %rbx
   c:	89 e8                	mov    %ebp,%eax
   e:	5d                   	pop    %rbp
   f:	41 5c                	pop    %r12
  11:	c3                   	ret
  12:	cc                   	int3
  13:	cc                   	int3
  14:	cc                   	int3
  15:	cc                   	int3
[   51.636420][  T218] RSP: 0018:ffffc90000a9ed30 EFLAGS: 00010046
[   51.636428][  T218] RAX: 0000000000000000 RBX: ffff88811750fc00 RCX: 0000000000000018
[   51.636437][  T218] RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffff88810691512c
[   51.636440][  T218] RBP: 0000000be56b1408 R08: 0000000000000001 R09: fffff52000153d9a
[   51.636445][  T218] R10: 0000000000000003 R11: ffff888108145000 R12: 0000000000000246
[   51.636452][  T218] R13: ffffffffc1c9b060 R14: ffff88810406ba0c R15: 1ffff92000153dc2
[   51.636455][  T218] FS:  00007efd90c038c0(0000) GS:ffff8883e4077000(0000) knlGS:0000000000000000
[   51.636459][  T218] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   51.636462][  T218] CR2: 00007f5bd8238c20 CR3: 000000040ed8a005 CR4: 00000000001726f0
[   51.636466][  T218] Call Trace:
[   51.636469][  T218]  <TASK>
[ 51.636477][ T218] fence_work (include/linux/dma-fence.h:272 drivers/gpu/drm/i915/i915_sw_fence_work.c:23) i915 
[ 51.637304][ T218] fence_notify (drivers/gpu/drm/i915/i915_sw_fence_work.c:39) i915 
[ 51.637827][ T218] __i915_sw_fence_complete (drivers/gpu/drm/i915/i915_sw_fence.c:201) i915 
[ 51.638300][ T218] i915_vma_pin_ww (drivers/gpu/drm/i915/i915_vma.c:1601) i915 
[ 51.638763][ T218] ? __pfx_i915_vma_pin_ww (drivers/gpu/drm/i915/i915_vma.c:1434) i915 
[ 51.639218][ T218] ? i915_gem_object_make_unshrinkable (include/linux/list.h:215 include/linux/list.h:287 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:500) i915 
[ 51.639648][ T218] ? i915_vma_make_unshrinkable (drivers/gpu/drm/i915/i915_vma.c:2292) i915 
[ 51.640091][ T218] ? intel_ring_pin (drivers/gpu/drm/i915/gt/intel_ring.c:73) i915 
[ 51.640505][ T218] intel_ring_submission_setup (drivers/gpu/drm/i915/gt/intel_ring_submission.c:1290 drivers/gpu/drm/i915/gt/intel_ring_submission.c:1421) i915 
[ 51.640918][ T218] ? __pfx_intel_ring_submission_setup (drivers/gpu/drm/i915/gt/intel_ring_submission.c:1349) i915 
[   51.641232][   T65] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[ 51.641321][ T218] ? intel_engine_init_whitelist (drivers/gpu/drm/i915/gt/intel_workarounds.c:2104) i915 
[ 51.641735][ T218] ? __intel_wakeref_init (arch/x86/include/asm/atomic.h:28 include/linux/atomic/atomic-arch-fallback.h:503 include/linux/atomic/atomic-instrumented.h:68 drivers/gpu/drm/i915/intel_wakeref.c:109) i915 
[ 51.642126][ T218] intel_engines_init (drivers/gpu/drm/i915/gt/intel_engine_cs.c:1514) i915 
[ 51.642521][ T218] ? i915_gem_object_make_unshrinkable (arch/x86/include/asm/atomic.h:93 include/linux/atomic/atomic-arch-fallback.h:667 include/linux/atomic/atomic-arch-fallback.h:1119 include/linux/atomic/atomic-instrumented.h:524 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:498) i915 
[ 51.642929][ T218] ? __pfx_intel_ring_submission_setup (drivers/gpu/drm/i915/gt/intel_ring_submission.c:1349) i915 
[ 51.643331][ T218] intel_gt_init (drivers/gpu/drm/i915/gt/intel_gt.c:719) i915 
[ 51.643728][ T218] i915_gem_init (drivers/gpu/drm/i915/i915_gem.c:1191) i915 
[ 51.644140][ T218] i915_driver_probe (drivers/gpu/drm/i915/i915_driver.c:831) i915 
[ 51.644524][ T218] ? __pfx_i915_driver_probe (drivers/gpu/drm/i915/i915_driver.c:780) i915 
[ 51.644903][ T218] ? drm_privacy_screen_get (drivers/gpu/drm/drm_privacy_screen.c:169) drm 
[ 51.645047][ T218] ? intel_display_driver_probe_defer (drivers/gpu/drm/i915/display/intel_display_driver.c:84) i915 
[ 51.645483][ T218] ? i915_pci_probe (drivers/gpu/drm/i915/i915_pci.c:995) i915 
[ 51.645876][ T218] ? __pfx_i915_pci_probe (drivers/gpu/drm/i915/i915_pci.c:956) i915 
[ 51.646267][ T218] local_pci_probe (drivers/pci/pci-driver.c:324) 
[ 51.646283][ T218] pci_call_probe (drivers/pci/pci-driver.c:392) 
[ 51.646295][ T218] ? _raw_spin_lock (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154) 
[ 51.646308][ T218] ? __pfx_pci_call_probe (drivers/pci/pci-driver.c:352) 
[ 51.646321][ T218] ? kernfs_add_one (fs/kernfs/dir.c:834) 
[ 51.646337][ T218] ? pci_assign_irq (drivers/pci/irq.c:149) 
[ 51.646350][ T218] ? pci_match_device (drivers/pci/pci-driver.c:159 (discriminator 1)) 
[ 51.646362][ T218] ? kernfs_put (arch/x86/include/asm/atomic.h:67 (discriminator 1) include/linux/atomic/atomic-arch-fallback.h:2278 (discriminator 1) include/linux/atomic/atomic-instrumented.h:1384 (discriminator 1) fs/kernfs/dir.c:569 (discriminator 1)) 
[ 51.646368][ T218] pci_device_probe (drivers/pci/pci-driver.c:452) 
[ 51.646377][ T218] really_probe (drivers/base/dd.c:581 drivers/base/dd.c:659) 
[ 51.646391][ T218] __driver_probe_device (drivers/base/dd.c:801) 
[ 51.646404][ T218] driver_probe_device (drivers/base/dd.c:831) 
[ 51.646416][ T218] __driver_attach (drivers/base/dd.c:1218) 
[ 51.646424][ T218] ? __pfx___driver_attach (drivers/base/dd.c:1158) 
[ 51.646428][ T218] bus_for_each_dev (drivers/base/bus.c:369) 
[ 51.646441][ T218] ? __pfx_bus_for_each_dev (drivers/base/bus.c:358) 
[ 51.646444][ T218] ? __kmalloc_cache_noprof (arch/x86/include/asm/jump_label.h:46 include/linux/memcontrol.h:1714 mm/slub.c:2210 mm/slub.c:4190 mm/slub.c:4229 mm/slub.c:4391) 
[ 51.646456][ T218] ? klist_add_tail (include/linux/list.h:150 include/linux/list.h:183 lib/klist.c:104 lib/klist.c:137) 
[ 51.646468][ T218] bus_add_driver (drivers/base/bus.c:678) 
[ 51.646482][ T218] driver_register (drivers/base/driver.c:249) 
[ 51.646490][ T218] i915_init (drivers/gpu/drm/i915/i915_driver.c:1428) i915 
[ 51.646891][ T218] ? __pfx_i915_init (drivers/gpu/drm/i915/i915_config.c:13) i915 
[   51.647101][   T67] sd 2:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[ 51.647277][ T218] do_one_initcall (init/main.c:1269) 
[ 51.647292][ T218] ? kfree (mm/slub.c:4680 mm/slub.c:4879) 
[ 51.647304][ T218] ? __pfx_do_one_initcall (init/main.c:1260) 
[ 51.647315][ T218] ? kasan_unpoison (mm/kasan/shadow.c:156 mm/kasan/shadow.c:182) 
[ 51.647327][ T218] ? __kasan_slab_alloc (mm/kasan/common.c:329 mm/kasan/common.c:356) 
[ 51.647340][ T218] ? __kmalloc_cache_noprof (mm/slub.c:4180 mm/slub.c:4229 mm/slub.c:4391) 
[ 51.647352][ T218] ? kasan_save_track (arch/x86/include/asm/current.h:25 mm/kasan/common.c:60 mm/kasan/common.c:69) 
[ 51.647365][ T218] ? kasan_unpoison (mm/kasan/shadow.c:156 mm/kasan/shadow.c:182) 
[ 51.647377][ T218] do_init_module (kernel/module/main.c:3039) 
[ 51.647388][ T218] ? __pfx_do_init_module (kernel/module/main.c:3011) 
[ 51.647402][ T218] ? kfree (mm/slub.c:4680 mm/slub.c:4879) 
[ 51.647414][ T218] ? klp_module_coming (kernel/livepatch/core.c:1317) 
[ 51.647426][ T218] ? load_module (kernel/module/main.c:2468 kernel/module/main.c:2463 kernel/module/main.c:3504) 
[ 51.647441][ T218] load_module (kernel/module/main.c:3509) 
[ 51.647449][ T218] ? ima_post_read_file (security/integrity/ima/ima_main.c:896 security/integrity/ima/ima_main.c:878) 
[ 51.647466][ T218] ? __pfx_load_module (kernel/module/main.c:3353) 
[ 51.647478][ T218] ? __pfx_kernel_read_file (fs/kernel_read_file.c:38) 
[ 51.647489][ T218] ? init_module_from_file (kernel/module/main.c:3701) 
[ 51.647499][ T218] init_module_from_file (kernel/module/main.c:3701) 
[ 51.647514][ T218] ? __pfx_init_module_from_file (kernel/module/main.c:3677) 
[ 51.647525][ T218] ? mm_get_unmapped_area (arch/x86/include/asm/bitops.h:206 arch/x86/include/asm/bitops.h:238 include/asm-generic/bitops/instrumented-non-atomic.h:142 mm/mmap.c:805 mm/mmap.c:871) 
[ 51.647540][ T218] ? _raw_spin_lock (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154) 
[ 51.647547][ T218] ? __pfx__raw_spin_lock (kernel/locking/spinlock.c:153) 
[ 51.647560][ T218] idempotent_init_module (kernel/module/main.c:3713) 
[ 51.647573][ T218] ? __pfx_idempotent_init_module (kernel/module/main.c:3705) 
[ 51.647582][ T218] ? __pfx___seccomp_filter (kernel/seccomp.c:1244) 
[ 51.647590][ T218] ? fdget (include/linux/atomic/atomic-arch-fallback.h:479 include/linux/atomic/atomic-instrumented.h:50 fs/file.c:1167 fs/file.c:1181) 
[ 51.647607][ T218] ? security_capable (security/security.c:1142) 
[ 51.647615][ T218] __x64_sys_finit_module (include/linux/file.h:62 include/linux/file.h:83 kernel/module/main.c:3736 kernel/module/main.c:3723 kernel/module/main.c:3723) 
[ 51.647627][ T218] ? syscall_trace_enter (kernel/entry/syscall-common.c:44) 
[ 51.647640][ T218] do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94) 
[ 51.647657][ T218] ? fput (arch/x86/include/asm/atomic64_64.h:79 include/linux/atomic/atomic-arch-fallback.h:2913 include/linux/atomic/atomic-arch-fallback.h:3364 include/linux/atomic/atomic-long.h:698 include/linux/atomic/atomic-instrumented.h:3767 include/linux/file_ref.h:157 fs/file_table.c:544) 
[ 51.647668][ T218] ? ksys_mmap_pgoff (mm/mmap.c:609) 
[ 51.647682][ T218] ? do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94) 
[ 51.647694][ T218] ? from_kgid_munged (kernel/user_namespace.c:535) 
[ 51.647708][ T218] ? _copy_to_user (arch/x86/include/asm/uaccess_64.h:126 arch/x86/include/asm/uaccess_64.h:147 include/linux/uaccess.h:197 lib/usercopy.c:26) 
[ 51.647722][ T218] ? cp_new_stat (fs/stat.c:471) 
[ 51.647732][ T218] ? __pfx_cp_new_stat (fs/stat.c:471) 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250820/202508200843.8b006132-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

