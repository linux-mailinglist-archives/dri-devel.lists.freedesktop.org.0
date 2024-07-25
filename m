Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F0893C577
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 16:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABBA10E839;
	Thu, 25 Jul 2024 14:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pnlk+z7Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D24810E256;
 Thu, 25 Jul 2024 14:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721919112; x=1753455112;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3gkil9GzVMJ6UxvSmdzPRncHT6TpWqiFkADCkEunNAI=;
 b=Pnlk+z7YyZ46kvg5Q2AFvbfR4gpqIUYxoYtZ1AJPdONzyn/KbYZnH+Uv
 PID84j2wFh0D90wKnsvKU5woWqP/ZILGlIbuzTMAupjyIX3W5vrHe1PWF
 H2ovyJ2Ab+evsfn/dnP+gQB4KSe3cQa/iHLXsllpr+KPJiq6Gr3Won+jL
 3yrh7VC96Z8X93mmAFB2r4AYUIm7bJ0Wfk4Br1YRY8WpfGptK6am0if9D
 JvJ3sOZaVls47JAATCG7DNE1/HMEIgKWwmrf6GM2WfqcAX7eLdX27CpZM
 GeHw7GkfaN85XDBd4tJXQjST+4lwPonWlGEuBPgyDCVcR5HmS9rYAVaFA g==;
X-CSE-ConnectionGUID: iK+mfpdhTeGn4vB3CVsRtg==
X-CSE-MsgGUID: hk2E+sCZRx260B5HkYFANQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="31077900"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="31077900"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 07:51:51 -0700
X-CSE-ConnectionGUID: 2beXTs3WTWmY2eA0CGutjw==
X-CSE-MsgGUID: JDDesVCNRBGRWSJ7n+AeEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="57743933"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jul 2024 07:51:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 07:51:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 25 Jul 2024 07:51:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 07:51:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A352QmhxKshKC9nVkfu9+ogx32hj+57mIBLtdY/wSedBRQvKohubrsUEfuxlj+8qzFk89ZVbjZqea3YucRSd3jQ3ktOLYEm7uFtKeuxXUNkYk/rCsPVHotkz1R71UTxv2JMBbkav/h57N/FSTC8d2eyhAYPyWABSDa1TTAKb/QHIPxE3XG2m6XTogKb0jEYN29hsP9iD2p0KiWl0JBJ1nAt801PuUdoz4TuB0gnPH/HuGWGcWWv+qnZ8hbtyv0gyRw5MXc84HSPqW6Mik+91ZJQ0g8LiCpmruQOvVEIbMGPN90BJbtH16awIjJX+8evVVHrb5kyv4VnnTKBvW9JQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXmHE10T1U/jGYx88Nv5P5Jt+Tm4M+H9n3gA1xgMNiI=;
 b=EbR6gqOf6c9QF0ZNw131jPRiXHZk3FVrkHDwehLQAh24fH4YmOcU9VzVUdfpC/zcNYAsiRrf4xRTmglVjTHuTjoorIyyJ3tIqfwaOWkUqmbTPpaExSjBYqPQgXCltvGd6woNWb2v+IFED7TPFbkbKLnaCiktZcEnGjEu//xyOIwqxwpKrVv1mpSDxVzJPfobb0YWz+ZRw4kkx9RKoHGtUiW2ZyOr2dUN12/W/p9GWVCOPhN4UkG1mN1LCLFEAcD0d1Fnze5IzI0oH4EbPNCtC2FeLaigbAFxSFzi4/XSJCoQXaasVWH8Jme5FRtdoy3gKRoo7pXp5ZfLblnE8j4HxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 25 Jul
 2024 14:51:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 14:51:45 +0000
Date: Thu, 25 Jul 2024 14:50:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <ltuikov89@gmail.com>, <daniel@ffwll.ch>, <felix.kuehling@amd.com>
Subject: Re: [PATCH] drm/sched: Only start TDR in drm_sched_job_begin on
 first job
Message-ID: <ZqJmTpuTiYYQxXjA@DUT025-TGLU.fm.intel.com>
References: <20240724234417.1912357-1-matthew.brost@intel.com>
 <b3efa6b1-1078-4b1c-bdaf-d8774b0d798b@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3efa6b1-1078-4b1c-bdaf-d8774b0d798b@amd.com>
X-ClientProxiedBy: SJ0PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 12bb36eb-49a7-4f5c-6b4a-08dcacb94d7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Vh068U1NdaUPyKPfEMKzvuFwSUSenT09SLySdMRNg/DO4iuNifBOQOTXdT?=
 =?iso-8859-1?Q?Xh3LGVpRMK/Kun9oKQShaNr8chxuWsKvrNfkztpvWv2xE9A45xvaKqRJHf?=
 =?iso-8859-1?Q?GSH8mNjxxD12qnpEMIvlwJoA0awy+u4ZkS7IPGpNtAbuQ3OvpwCxVcZSU6?=
 =?iso-8859-1?Q?2yIo8X+X+cM0LIyWEE2pN+RKf4TGd2mwsoHBkpzeo1rTRTllCYjsL2tA+6?=
 =?iso-8859-1?Q?Z4Adc5NQ5W0rdGJpBe55CWD4oKOdLAdgrt5BUn1KF4kVfSUAL6v9RWes9V?=
 =?iso-8859-1?Q?E1hGWCKQYEi3xXaXutEC0dI0YvSb2o4MHSEPIB5XWaYg7uprQVxwNW4/3K?=
 =?iso-8859-1?Q?jhYJq7wQJz7Cy2Gy1/UREFpRYrwinSsPiy3XoqFYGrV003M15i1F9M+gka?=
 =?iso-8859-1?Q?WS07a/OIOllzliAiQNTjisgf5pHZvnU9e48MgG/VHJohLRD/civZTXPFbI?=
 =?iso-8859-1?Q?d17YMin3LupwtwyGmQ4+dvItOWVgcRIwAAHhvdvkBmBz3vnj1P6ejdBJvB?=
 =?iso-8859-1?Q?55FpqurRZl50RnT9HKDcvx202qzQcCLMBv3lpXV57iJDxMpVzEB9R6t9xa?=
 =?iso-8859-1?Q?0bBymaKaxks0N4kdEgWKEc9+TOu0DbPo/3xitzA0CB609DFL2K+yX/hSJy?=
 =?iso-8859-1?Q?YkO1lYMmppKlIW8wo8i+v7V/TIuS0mEsQtZWPJuhL8hFcQNM3q15RVIAga?=
 =?iso-8859-1?Q?uezh5fQnsrDwDbi4Cqx4HKLO9slIChmRJ5Slpy0876eFSLOCvvBcZS6JO+?=
 =?iso-8859-1?Q?v6YR29syPgyGBUrXUDb/MsaNw7qiMfEgYqKAroWJnBbEWG+KGMKqUId/az?=
 =?iso-8859-1?Q?kBWonYHr3hK/U97c5F+qMhb4XjHVocVDBQz1SS8u5+jDR6ghTie180mlgF?=
 =?iso-8859-1?Q?WoVki6j+oxvwy89zfHz0yx0iK9AQ5oIw0vdgdo1WKlj/LPn1Y/2RiraSG8?=
 =?iso-8859-1?Q?cJ6LEkJ8flT6NPQzvFI7MB524lnZh4k6VoTvgSN3D0CJZyyifpIVKXjhYK?=
 =?iso-8859-1?Q?/SBe9ucwk7zfQnBc1ry3xJgzxmDL/bB+oKHYVBHLZFqJFsE+Y/pMlTzBdb?=
 =?iso-8859-1?Q?I5uaSlJxwKNHThdDw/e4WbQmQmyAD7JeVT+wkEqZ5aILvEUyhXzm7G794E?=
 =?iso-8859-1?Q?Ajigpi20WVWdm/8pxuK7S3aicDBSCuoV7PhM/v4Vospi0xNHOgimmukuUA?=
 =?iso-8859-1?Q?b/RQqa1UcAmMODGmPyJKTA6ACqFV1tGBacnValzTiutw+RvSQAFDy0+kOU?=
 =?iso-8859-1?Q?nLSX4jf+VkVeFXYPRY6S+ER2hyaKgs24gWQcyBCGv9BMaOacW47D7eK52w?=
 =?iso-8859-1?Q?+foHDJjOP1LACETZmpC2OGnGtBoos3bXUYdpF2STbLhC5JOgS2MKyto47M?=
 =?iso-8859-1?Q?ruXPkOlfj+fmlVjIDaQ2OSe3DhKeFbFA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FbN6Rh1WxcVi4jc6hJqoQke9SDWfK4jCyZdpobqvi+7M5Bestb08h5fWO/?=
 =?iso-8859-1?Q?QGI6FmJYbX7DbR7Am4rzpEnvidYpUys6eL1E1FnIVfHCRqF65jeSY8ob9v?=
 =?iso-8859-1?Q?RYY0aVJGzk0iYdxOVLXuCh/zRlvaDKEtnMJhrqBNSbTNRJaxDxeNCPzgUB?=
 =?iso-8859-1?Q?4W8lvsrkHCxiguhjEXEqLEVqyzMVrn7SNXiNwT+H2TUWK0KxRBTtE3ryrD?=
 =?iso-8859-1?Q?cFEog64cstV5gZ/660JzF4r1iamqDJD/IfeZkCkRBJeViV2apFrUiYd+zr?=
 =?iso-8859-1?Q?jzDKpvFx//Axt1MtHCEIabpXadegkkXFyQQw3bwZVKuFUecs0W9v0lXEdB?=
 =?iso-8859-1?Q?UP9rRydZWJ5VpfKgMdlNul4cwq8H7sKBTs7CtLg10NcnHcXdFipKjaBZB7?=
 =?iso-8859-1?Q?D0l1tRx4MVC8GUvY5B6M8AhvFXcn3txyTiUgILZ7fyXU3gu8b2fb2pvUbt?=
 =?iso-8859-1?Q?P3G5YLVAHKcOlOtP7ZpC3JjOT5/sb2K0at6XBtnIN0xGT1OoENU7Ysfij2?=
 =?iso-8859-1?Q?ku2WQk3FEsZ6OB/yEXc34XX/xnKzTFBXWioxqdIRR4/Xw/YyFh8yD1/2nx?=
 =?iso-8859-1?Q?cofzimy17K84nICAnSmX7S9oOtV5iRPMECtXHgA2bGEla+rrGvzPF6nemr?=
 =?iso-8859-1?Q?VogbHZRQdkNCZ33QCYPSEHSjhjYIAR/UhittB+ZB9fG8HHVBt05iw9oDHi?=
 =?iso-8859-1?Q?kdAEWdI1Klp+4f8wapkW3GY9J7Yve10VICMxo0Tdr2hGZ1AwPOowq/9UIe?=
 =?iso-8859-1?Q?EL3DdOOrsXJSEOvqZSxkCx4M0jIMo7wJVjV9gFCivV/c5qTK4zUnkjkjVr?=
 =?iso-8859-1?Q?Ic38gHNyL1SpRGluXwBqrygNITDXVWKQt6O4wXznufEQT264OaLfwc4NXv?=
 =?iso-8859-1?Q?gziA0ICnUIwWvXEFEoPkQZ94jjaeD78HnVOpNjL0h98ANPpTF9z4pH6khb?=
 =?iso-8859-1?Q?pIxkU94MGC64yUXVTqLfLBltMjO/n6n+I94NxDUVI54HNbOFLvnitV/tI1?=
 =?iso-8859-1?Q?W8vHD2VjxYpfJe8OBiEoMt2h9e3VcaRp0MKa9qwC2oTksnRVcDA8Hbcl6n?=
 =?iso-8859-1?Q?W5z3Rl/geKRrZ2nqeUGMlP/4+WlkX/fzCsh4ZM6WHMWcEN/vXyTzjc2Xw/?=
 =?iso-8859-1?Q?kuSuw9WWcI+vxse1T+HMGUdzp9fof0DIdo3idg6ewwXNjrtSMR5cXTKX0u?=
 =?iso-8859-1?Q?6KaL7ZoA140KTcedCG7Z+uIu2Ey2Balk0v2kUD+LwmR7dc+W2+pWJ1nAvK?=
 =?iso-8859-1?Q?id2lhxqj2S5XH4fyNCj5btvZvL+Gyxfn9oMcYZv01m3Y+1xMKL/Gl1XseB?=
 =?iso-8859-1?Q?0RlfpVYAqYtT2Sk8XaWOjwv8Sd009vuI3U5BiJVU/sWmi/HQgeJU/2reC+?=
 =?iso-8859-1?Q?Pi20EpbE7gqpwrdyHpsk4BE4DVunaxvsPiaHbV9noZYlDrrz0BjCnGsi+z?=
 =?iso-8859-1?Q?LVxOAdDSiQEMSJB0Je4+zbuYnSfN68mKhKhyCELpUaNtX3umtPp0t40TUj?=
 =?iso-8859-1?Q?aQW+BBOK3oL6pW7UyPd3ibLY5Mb9yjd/VFeEICcLgPpklHRv5hvHCx8s/j?=
 =?iso-8859-1?Q?rec4P+2C7lnW3SqfERgECSuSypGq4Au89bgb5BG/v3otYE2VCor23/r4t7?=
 =?iso-8859-1?Q?f2H48wm2GxRgiWCFo5Yw7w78dGlz132y1TpBacNTKrHPiTWCcvAYdmFA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12bb36eb-49a7-4f5c-6b4a-08dcacb94d7d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 14:51:45.0172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBIAoX1bxN81VOoJCAhKo5BSzq5XXR/RfYgcoSxuk+WqwhR5Px/FcZoQe4iIURTO/wpqnlr5GmYtwFQXuKH3Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
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

On Thu, Jul 25, 2024 at 09:42:08AM +0200, Christian König wrote:
> Am 25.07.24 um 01:44 schrieb Matthew Brost:
> > Only start in drm_sched_job_begin on first job being added to the
> > pending list as if pending list non-empty the TDR has already been
> > started. It is problematic to restart the TDR as it will extend TDR
> > period for an already running job, potentially leading to dma-fence
> > signaling for a very long period of with continous stream of jobs.
> 
> Mhm, that should be unnecessary. drm_sched_start_timeout() should only start
> the timeout, but never re-start it.
> 

That function checks the pending list for not empty, so it indeed starts
it. Which is the correct behavior for some of the callers, e.g.
drm_sched_tdr_queue_imm, drm_sched_get_finished_job

IMO best to fix this here.

Also FWIW on Xe I wrote a test which submitted a new ending spinner,
then submitted a job every second on the same queue in a loop and
observed the spinner not get canceled for a long time. After this patch,
the spinner correctly timed out after 5 second (our default TDR period).

Matt

> Could be that this isn't working properly.
> 
> Regards,
> Christian.
> 
> > 
> > Cc: Christian König <christian.koenig@amd.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/scheduler/sched_main.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 7e90c9f95611..feeeb9dbeb86 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -540,7 +540,8 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
> >   	spin_lock(&sched->job_list_lock);
> >   	list_add_tail(&s_job->list, &sched->pending_list);
> > -	drm_sched_start_timeout(sched);
> > +	if (list_is_singular(&sched->pending_list))
> > +		drm_sched_start_timeout(sched);
> >   	spin_unlock(&sched->job_list_lock);
> >   }
> 
