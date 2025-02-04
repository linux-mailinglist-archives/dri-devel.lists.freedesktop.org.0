Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBE1A275CA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EDF10E698;
	Tue,  4 Feb 2025 15:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKIMM8wX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74C010E34C;
 Tue,  4 Feb 2025 15:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738682929; x=1770218929;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y0DjDBWdJh5F8PXFaJOJe+fnLGOD5fgD2SetHonCdBo=;
 b=UKIMM8wXq0pT+WvK9hasqbQIeeQSWsqVC9fNotbcr1ERj11a3WIT5C19
 aKodz1XdmiCzjxt60vayi6AASFDP8ZUlRUocoKjbNpbhansq94nxfirpB
 nkeasy1+tKt7+kIArQu+W+v6iI7J3lL5nARHOpeWu90/5qn9V9WMhwssT
 u7btodhD4Di0MNZekAgTkg6TUKGKuwZystFPDsne7RTGTiAU5OvIkTP31
 MMhTxYA2In0NzJzGqaMFTyIk83UKs+Eezlzkln/cAAeyhq8vHq+DOo1sZ
 Gh2XfWFRZYF3TZCixZOORJdjNQ8Q/zjmLkdYsTRDL5TQn30thx9Mm0LRW g==;
X-CSE-ConnectionGUID: Q+J3k4KiQjiNspazdzSR5A==
X-CSE-MsgGUID: wY/6ujzvRDqOP5upOWyBJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56752663"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="56752663"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 07:28:48 -0800
X-CSE-ConnectionGUID: wRaE2EQNTzqZ0u/Kt0yJdQ==
X-CSE-MsgGUID: ZHvlyaIeR2OsBz0N2E5rWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="110411766"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 07:28:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 07:28:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 07:28:47 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 07:28:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sImCEunJgpjsxVgxV4ReqapUxYWUIQEbckEAlmMKKykHfCOAP5dP6jQUkSazsGcTS/2lub0I0o+iqafAH0V6Gg3LJVE70HHBwuatyIQeM+CniDcwyK7v8/K+TlvqWAHJ+kGtLAsZM2+fGFeVNUaBLaB9tsRYaSRBirwgd22Zt+5wjIV0U583AAzyVO4NSE9saprrSAkebHyLS0gXD0PpaW/owkE6wElCsg6v2dfHpy9HXDb5TsYW6W+ZSCr3ljZ3AamkYeGktStiG6MTtu00EDxRNLlVMjrxDIj/SLsrB0LuDhFzrwhg7YyfdJ26yev3RQZS2G88VoaPy+Vnk8UF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1U/66YXQzTIsuxI/N0ToJPhsVAftxY8Rn7nuwbPcjYc=;
 b=vHeKfJjCv5pqYievzbe6JAi5cuh2gsgQ+k20HoF7EDcJpsTF+c57blA5jDCSOPGr/y3diLDzvx7Rqng8atcINSkPjjlRvRRhkm3EukJn0k85DvjpvcVpE145Ja1hMjGLVQf6d0RWsabpwLO0g8NaSChbl5SXxj+4EpkniAkNPUWIK0s4JTa70PWlCxwbpA2oj0i6aJCTqe6H0Z04ve2/2foFEH0PzJEYuO7YWvUby4lxDsGwZHj0MQphtKmRGq9I34ZYWFjmzdYPILWwDUafbmVgnD1XnOTSZXGeArHwbkkjDFRW6ZoGNggQkRjAHrRycdLRVtl+P/kJ1moWM/hK+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6516.namprd11.prod.outlook.com (2603:10b6:208:3a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Tue, 4 Feb
 2025 15:28:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 15:28:10 +0000
Date: Tue, 4 Feb 2025 09:28:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Peter Zijlstra <peterz@infradead.org>, Will Deacon
 <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng
 <boqun.feng@gmail.com>
Subject: Re: [PATCH-resent-to-correct-ml 3/8] drm/xe: Add scoped guards for
 xe_force_wake
Message-ID: <smlsfjxrukptsnkhb4wkoeb6wd4ze7p77lkakzktun2qsa5c56@7bxye7oqmawc>
References: <20250204132238.162608-1-dev@lankhorst.se>
 <20250204132238.162608-4-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250204132238.162608-4-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR03CA0207.namprd03.prod.outlook.com
 (2603:10b6:303:b8::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: a5153e83-e5a6-453e-5052-08dd45308833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rEB0qb0V6+PZ82VvW1iY6aj2RVLSG5ozsSv5jI4axdf/nDN56Wz5Osa2ZNso?=
 =?us-ascii?Q?726TO67e/zEbjbdxc1p0N5pvEVC/BaWwGZ+4RWOeEvJV3gqzWfeQ0Sle2H1d?=
 =?us-ascii?Q?IdIgGHinNjStd2xa1dm8iXbaejFV82mXPLdlz6GIs5fxdPKLJfll0BDOp07G?=
 =?us-ascii?Q?QxBRZ2FCYhJDdJJ0h1tmfUaHoi7bOCJ3vvTWzEnNwnTuueAGBq+9NbnvfV85?=
 =?us-ascii?Q?Iq7R+Y9qhSeSajo883mN1crldSWF1drwXN4tOB9DrLCnKxC7t9+qK5vAGPP1?=
 =?us-ascii?Q?6EShf0CrY0i9Jt3+k6fyyQtBxmBPyTMY5kn/aDZinPlPznH9CYDWPgOueCFM?=
 =?us-ascii?Q?jjJOI/mrktOYZuCFNSJra3kIjTqIys384wfTQH7sGXypGJZODJqfy1QBPDs2?=
 =?us-ascii?Q?MJmVDu40HKg8Z1NMcBtE+/qSMvhg4+M1kw6YpNjNo7Kt0DaYfv0zT0mLqNb7?=
 =?us-ascii?Q?5KYGVLZGclVe/VRCLiLfJ0QnjV146t+UdAdsg5422mL5hdfCB0Gzk6h20Gwo?=
 =?us-ascii?Q?gzr0aEqWZE/2jBVfBnvVgWUTU7mhZfBlxvmM0nVIHMQR+h/7q63TSsTj4DkD?=
 =?us-ascii?Q?38TpG4kA8YqlLFsNIWYFzTnr+GSS6hzpvkTweeGoEWjkCHrOkm6INbUa7odJ?=
 =?us-ascii?Q?GbgHdT3gJr7fuUKD11tw/ALfyFihJAKxC4ST+IegXXO0hvJWYvOiGBa5PorN?=
 =?us-ascii?Q?D3roxQ54k5g3bvxIki/zVIZmj7fcNEbH9zVG3GjswdeiiAAMzLfi5Vz06P9h?=
 =?us-ascii?Q?uqp9y1vDNA2neGRYxM4ehDWIYaOn2C33f4y3SbOZ9wP/FqwPIBbFZxAzAaOt?=
 =?us-ascii?Q?K0FQrxOHuORjjGgQ8RAJ6qP6npOzJ9q32HApmsPpI/bXahGXLJdhTLpRJM24?=
 =?us-ascii?Q?oT4dgxp03rWohnrTpHJ4+fA9v3dMFGsuIaofUATcaBAiLH74n1freHbiYR0l?=
 =?us-ascii?Q?TwH6GtFV+VpdaJZ66tokT4FPdvGec0NNj+Zns0UUmiU3DSWLGHkVmkee3NR8?=
 =?us-ascii?Q?mUMBxpx6TbKAyblNQ/oReulMrIMJmecb7yc0d5AjzTJmkYX7mCf90NqWKh6q?=
 =?us-ascii?Q?CgVY+dzrNRThhqPhxpfGWFAwuLHF6DzTQf7UaF0x6wt7lRxSR0cS5seUJEdK?=
 =?us-ascii?Q?mEiVrQBXjWR530RlSwZSOap54j8m7menmt3php1VonT8V1E6LMFPEjGzWmcw?=
 =?us-ascii?Q?uR4yt1ZIqfmljD6XtcuC+0hIOm5sQgwCuDLxUDI1mrCrJYeJ6kby90uXfcX1?=
 =?us-ascii?Q?T+N23lpIzYUcN9lyi1n5Eu6NRejl9s7OgxEug9Xsy8Ndom8AanKgQ+7Kw+1z?=
 =?us-ascii?Q?ezxt0jwM5SanIk4OXI/Ekf8HsG7gKjGDhzbEGQ+pW63WGfBH3ZKNal6CiCJ1?=
 =?us-ascii?Q?qZt+Pcb7lvW421o8NgeCHWTWr5OH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jQ2+g/a8iMkVJx9IPbCM4RTmLr4+vT/JhCEPvND7L1+dCLVmAcDzulrfMSZT?=
 =?us-ascii?Q?698Pyyn9rtA13FluJblV9lFg91Y+ZNODvxaz0v3oUEKlqkFnmQxXunqXnwXh?=
 =?us-ascii?Q?y0YFZ7wu4HAE9cqZe0vC0z8B2niPfyPy6DwUKNVlCFGa6/9plwOF2/snU52w?=
 =?us-ascii?Q?PX/xDLMcfcPzhQ97OjXvg7DqWrSE6Kx2wXOohoJazBc/XChvj69uhwO/Ymle?=
 =?us-ascii?Q?BqMMA0v+74vvvyhfT3S5V6Fh36dMMk56STF9I3nC9qQvgePYcnhnW434V9+e?=
 =?us-ascii?Q?KjOochRj8jiGdsuQW2sc2/m2Jw3ESGiCSR5a1n/LN2ivkxmbhBOIqM/m5GgV?=
 =?us-ascii?Q?zM0HdMaiZ5sJwJGr8YE7krr6tFu45kVncHx7KmOsU5ZL5KrcbT2YfK4FuN2L?=
 =?us-ascii?Q?XGXkKcgMA5kTQpIrx5e7+ZLiyi73eJ68BqXhsGfSVAHKavfGb8ZZVG9oK478?=
 =?us-ascii?Q?+rUWKnKFl87Y5j/wVDaIS8Ns3OyA0faYN5HVUDnKyps0tVQBSmkYXld4GY/Q?=
 =?us-ascii?Q?X+BUS8VlZ2uFgt+hscSG/PnqsWImu1Vu5MNDsDMcHKsB+zxzWFpzdZF1zNYa?=
 =?us-ascii?Q?zncqWg5SACQHMSOQ17M6B+dYj6tqb0l2Do0t7PwibSvw9fQzAf4uWDvVVpTV?=
 =?us-ascii?Q?V4gd1bh6IyUARj3TimNP20AcY5rDc0D2l2kHopR6g/1tTi/Yvc0pQZT9Hneh?=
 =?us-ascii?Q?LNmA74HUSB20ybxmEJ+9hVOu0b050qRmok08CQKtf7FgrOJ45eAa2UCWwGOg?=
 =?us-ascii?Q?8AX6/e4AcCx0Air5Op+3Pdi7J0XSPIqEjUoc3vxcE4CL5STmnl2DUYu5F6hv?=
 =?us-ascii?Q?nis26xRE4aTK6V9EXyKdIxmAK3SCTVNs0ZVfK+G/W0YC2vXnkmFexcBn/UEt?=
 =?us-ascii?Q?qt1jxGRzdZ0lm47xIwJ2WndNuBK+UWZJ/OBYKyw2p88SZuAurHB/a+VYuz2Y?=
 =?us-ascii?Q?z6NWG/yH/PnmNk7jkMFvunvfk4GxsannnLnfp2Uya9547CkWYapcxUh0nv6D?=
 =?us-ascii?Q?+HHDFHq3G0jItEuB9fcEahCyhX+y6jD0J1EQ1LPs9RqketKKhuQhKlY8vMfl?=
 =?us-ascii?Q?xu80FKXY8WhqSPxyOkPFnz2Itd+wz6oh/KjEo+k8BcDVyuF+ChvhP6kordBb?=
 =?us-ascii?Q?HwNA7HsPB/Cus+vKLLj2T3wJyEsoAkrfD2b3gNitj//RWxMdBU2ZnPCHgN7J?=
 =?us-ascii?Q?CpGZnTJ2szWBXTAk/bMn+yuLKk14aiy/1us2FNYOadJF+z4G99//XHi/kR8y?=
 =?us-ascii?Q?/gHHrQRwQtA6zP0oyl3GeoJdI8+VixJtKVGUcmFa9B5KD78r1MYc1VaFarGm?=
 =?us-ascii?Q?p+geFC2CRqHeWLNzOHHItPUBpAgm1fAyEoGT0i8qL2tUb/M8saKJat5KjZ90?=
 =?us-ascii?Q?XD7XuPh53RYHz7Vs3FPS44wec/wWVcGZ3ZbjAY2qfkvTg6PeCJIBu/zYHHC0?=
 =?us-ascii?Q?YeJGPYHfGCItjtzs83I4fVWKrI1f5bNOJqFpqzCcBwnY+bUGceSFDKFVfu97?=
 =?us-ascii?Q?2ROOJT/k6+E7dupKtJQ9sNyRI6RKfdp0c3zyPR9mtiDD/p/tzkEOt2YtzVvH?=
 =?us-ascii?Q?IFVn72QnNPf1BS4ar5GuIEPcrb25TH/VSi4BMJiABiLHZGg9jHvFSv+21hn1?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5153e83-e5a6-453e-5052-08dd45308833
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 15:28:10.4042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9XUMTStcmt1Q50Wu36QYkijSSPXQTbRKZvu7Zd5apsArsi1FmpjajsbDEWVV9mC6Mv3d/vfkRSw474tnsb68ey4zao3beWsheIN6C8Tf/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6516
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

On Tue, Feb 04, 2025 at 02:22:32PM +0100, Maarten Lankhorst wrote:
>Instead of finding bugs where we may or may not release force_wake, I've
>decided to be inspired by the spinlock guards, and use the same ones to
>do xe_force_wake handling.
>
>Examples are added as documentation in xe_force_wake.c
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>---
> drivers/gpu/drm/xe/xe_force_wake.c | 51 ++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_force_wake.h | 15 +++++++++
> 2 files changed, 66 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>index 4f6784e5abf88..805c19f6de9e7 100644
>--- a/drivers/gpu/drm/xe/xe_force_wake.c
>+++ b/drivers/gpu/drm/xe/xe_force_wake.c
>@@ -16,6 +16,57 @@
>
> #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
>
>+/**
>+ * DOC: Force wake handling
>+ *

doc here should start explaining what is force wake, what it does, the
flags to wake specific parts of the gpu.

>+ * Traditionally, the force wake handling has been done using the error prone
>+ * set of calls:

I'd start with the new/recommended way rather than to digress on
non-recommended ways - this style doesn't age well in a few years.

>+ *
>+ * int func(struct xe_force_wake *fw)
>+ * {
>+ * 	unsigned int fw_ref = xe_force_wake_get(fw, XE_FORCEWAKE_ALL);
>+ * 	if (!fw_ref)
>+ * 		return -ETIMEDOUT;
>+ *
>+ * 	err = do_something();
>+ *
>+ * 	xe_force_wake_put(fw, fw_ref);
>+ * 	return err;
>+ * }
>+ *
>+ * A new, failure-safe approach is by using the scoped helpers,
>+ * which changes the function to this:
>+ *
>+ * int func(struct xe_force_wake *fw)
>+ * {
>+ * 	scoped_cond_guard(xe_force_wake_get, return -ETIMEDOUT, fw, XE_FORCEWAKE_ALL) {
>+ * 		return do_something();
>+ * 	}
>+ * }
>+ *
>+ * For completeness, the following options also work:
>+ * void func(struct xe_force_wake *fw)
>+ * {
>+ * 	scoped_guard(xe_force_wake_get, fw, XE_FORCEWAKE_ALL) {
>+ * 		do_something_only_if_fw_acquired();
>+ * 	}
>+ * }
>+ *
>+ * You can use xe_force_wake instead of force_wake_get, if the code
>+ * must run but errors acquiring ignored:
>+ * void func(struct xe_force_wake *fw)
>+ * {
>+ * 	scoped_guard(xe_force_wake, fw, XE_FORCEWAKE_ALL) {
>+ * 		always_do_something_maybe_fw();
>+ * 	}
>+ *
>+ * 	do_something_no_fw();
>+ *
>+ * 	guard(xe_force_wake)(fw, XE_FORCEWAKE_ALL);
>+ * 	always_do_something_maybe_fw();
>+ * }
>+ */
>+
> static const char *str_wake_sleep(bool wake)
> {
> 	return wake ? "wake" : "sleep";
>diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>index 0e3e84bfa51c3..0fb1baae0a3a3 100644
>--- a/drivers/gpu/drm/xe/xe_force_wake.h
>+++ b/drivers/gpu/drm/xe/xe_force_wake.h
>@@ -9,6 +9,8 @@
> #include "xe_assert.h"
> #include "xe_force_wake_types.h"
>
>+#include <linux/cleanup.h>
>+
> struct xe_gt;
>
> void xe_force_wake_init_gt(struct xe_gt *gt,
>@@ -61,4 +63,17 @@ xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains dom
> 	return fw_ref & domain;
> }
>
>+DEFINE_LOCK_GUARD_1(xe_force_wake, struct xe_force_wake,
>+		    _T->fw_ref = xe_force_wake_get(_T->lock, domain),
>+		    xe_force_wake_put(_T->lock, _T->fw_ref),
>+		    unsigned int fw_ref, enum xe_force_wake_domains domain);
>+
>+DEFINE_LOCK_GUARD_1_COND(xe_force_wake, _get,
>+			 _T->fw_ref = xe_force_wake_get_all(_T->lock, domain),
>+			 enum xe_force_wake_domains domain);
>+
>+/* Only useful for guard xe_force_wake, guard xe_force_wake_get gets all or nothing */

please add an usage example here is it's where people trying to use the
interface will look at rather than the kernel-doc. But this seems not
used

>+#define xe_force_wake_scope_has_domain(domain) \
>+	(xe_force_wake_ref_has_domain(scope.fw_ref, domain))

extra paranthesis here?

Lucas De Marchi

>+
> #endif
>-- 
>2.47.1
>
