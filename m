Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E62A426A7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 16:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DE310E3EE;
	Mon, 24 Feb 2025 15:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P36VI9B2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB9210E3EE;
 Mon, 24 Feb 2025 15:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740411811; x=1771947811;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fb8ixFPlvkwjadMVOsox5/bXywDyQCWi3Z3YxP8G7Xk=;
 b=P36VI9B2VahC6F7KJqYTnMhPivmHfwJche60tfgNsFRDkCp87w1YttKA
 p8FD/xpSNeIxKVbbICqBgW4w1eBQ2SyH9DNvqNAsQFTa2QGDaF/I+7sdQ
 irxMNsPo2pbi5Ee/ME7WKcm8B1Fz+4HMNrDb0H/64B6b9s/qqDfrH5ID+
 skSlaWopEu7t2AIPHgr5yhb/+0jC5xaXw/MrplHU9nJ0RlXh+2EhKecBA
 ZzrTNFDC7gD8X04S7tndM7fxGrwYgWyFMveeO3QFqbVRzWIyKmmSDiean
 1Qt2O/hdgHXNmAd/+6/DU19Pvk2jYGReJMUx9PTYQV7kPxWqpCohTFmOZ g==;
X-CSE-ConnectionGUID: v+YkwzGvRYWiIQYDQ+uD7A==
X-CSE-MsgGUID: Znj39PRrSoCjYIvaLad0IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41379680"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41379680"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:43:24 -0800
X-CSE-ConnectionGUID: POaGyIOhQdqxveeun8G67Q==
X-CSE-MsgGUID: BKcQllnKRW6Bif9rorlUWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="121189277"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:43:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 07:43:19 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 07:43:19 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 07:43:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=weJSFO++Z5H8d6CWcycPHmAfk0EJlKLTdMKFW3cF1JLQSscMD76LtFemv+gZv/5w0NeTuF1kjWTMEdbJMMVt4FAy05uw69qvtk14Ej7tcy92tV/dfC37a/c9LyaAMY0Pp9FfYiNpeg8heUgFN0oDAGGQpWNr6aS17qDglalugyrQxi50XPBEBYPIPfSPDDuLKud3AJUTcyyfyzvX3DnNNCNA5ZmhBlBJHKxsFFqfUlb8cmw4VNYcu5sAj7T54a/jRh/4OZk7jeIzG5u4CN44ybueTaXsJRbc0sSI4nlgAZqu7oBPtgNkvo1Kh/diZWneg5bWSMgctZ0v30tEMgoaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQQD4yvdee7AEGZhN4CMexmTIG8Yj4bYFRdKZrSzBu0=;
 b=XlK+mjdNnuBog1R8l63ge9PwFIWtckkVdtIWJdHcckmHv9r5XfvrokQJamKaUBq4aZRKcHqn1Umspw+Ya1qx/M1gf5poowOfPo7JDfNG7y0PQd2uIZt/byTi1usY8e7aaWG9UFbWScVgHE/pU5rTsLD3lnLkwLJKwkXKAPQShMlrBF6nhKltH8Fa8LHRy/AkhczaE1ASA29+dSF4SFrABv3JZf2JTcuP8FYuUiz8Up7mAYZcoN+JCecc03O7Ur78UniXuWCB9xQQJOASE2qIXUTHwIzFD7SSUrCPP4/+K7hgQs+/slQObGAYpkBQtJoJohD061qyhT1dXqMO3shw6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6239.namprd11.prod.outlook.com (2603:10b6:8:a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 15:43:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 15:43:12 +0000
Date: Mon, 24 Feb 2025 09:43:09 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH V9] drm/xe/uapi: Use hint for guc to set GT frequency
Message-ID: <zi3xuzjcih4ok6ce6znqzx4azkorwkvxyt6n45wzadzwaiialg@7fsjvbfkmdby>
References: <20250212113830.9027-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250212113830.9027-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR02CA0002.namprd02.prod.outlook.com
 (2603:10b6:303:16d::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e82da4c-8871-416b-2a37-08dd54e9f1eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bdz7jekRc5xlfaSHHbXkuWs1W3o3eOYeS/jYoTt5K7pj0d5bvR4RW2N9uzLw?=
 =?us-ascii?Q?8GCoOOvUJLXxhN1QkgOqJKzkhqQ4iRqTZCizTj4ZOlmulGGiVNDTPrA+GgqR?=
 =?us-ascii?Q?JKzgpUQt79RiADR/iIV3viyvfxoK/X6zA0VS5/jU/WnkryT4JbVXiCTiR4iF?=
 =?us-ascii?Q?xpVBXmTLhTXx8QLboOKw31UV+3tNpp7/bpJKM74Xkx6mljXTc1PzDp26KEhB?=
 =?us-ascii?Q?3d6IAP7fzng14qzWrFKGxIqG3uHFbQFLg0xVn3kEBfn54/ISeZOi0Lw2QFpS?=
 =?us-ascii?Q?oNCfdroxti+jTeN47WspaoqbM9yb6QEO3Bt0RHe1q0SkMWJlXeGLnSJBynUD?=
 =?us-ascii?Q?UWUNz8m7ZqYdytt0G5BzFRgtx1iZM7NIf2cYRN+wtjWTCf4kwasI/VIZ2FFB?=
 =?us-ascii?Q?r9qHjS17kfreupSM2ju/WjYr9Ml/4RXRsHbSgWynF7PF8RohMDVL+83xl9Dw?=
 =?us-ascii?Q?gfsa1N0dXgL1n3N2jJCsmFTNAO6qLTpI5zf+AbhvNXdwFH5PVJKtg8eh9bTP?=
 =?us-ascii?Q?LLuFAfLECx0BBX2xqgCwjwcBT/mjQgKrJQG/zfvU3FWgb59nBFoJJTaVgYqH?=
 =?us-ascii?Q?NeeTvfe/fBaN38yT5Enua1Tjg+5cHfRRrDH0JYUvXFA+ikB3p5Qqf/nd96PX?=
 =?us-ascii?Q?7eg+eF4/kVE/fYNG6fp4fgRBwFxA9dnCYzkjFbOFDwf184edkJhfl8ORQGJi?=
 =?us-ascii?Q?uM0T6dQqyK23AVSNTC/+QxNsrSavJ389cThk50zzySJl73eTJjDnzOMPmtSj?=
 =?us-ascii?Q?m4vrHdPdYA0ZpHgZam1b0y/SAOs1IVwExQudWhTfLCAsrkIfW9k/ct2QBLJK?=
 =?us-ascii?Q?w5xq7nmUsL5NXAI5tJU82W14bsXilqF5nISP5Um6SetPp3tMf+0Nvepyh8CT?=
 =?us-ascii?Q?DlzaIcsmbPyoFGSS6L6NgyaT8VglJfv4TVJro8Uo+UilgVvB/U7izyZsAgje?=
 =?us-ascii?Q?CEoOS2D4OOOLP95GHtOeV9T/sKHjLP9tTCb0YBQAe6Sr7ArFIUXFjkE7edQn?=
 =?us-ascii?Q?m0NiBXD9onEvm2k4SFoXW9EWYhCadgAyWQOx659LSn4B4g1uEdR8/z823xzI?=
 =?us-ascii?Q?BwPSsGTVs1r4oXs49OHTQUDUIOLH1tU2wGe+Ojpei3Z2M44P7U9TrKJbTCzK?=
 =?us-ascii?Q?42hlFBd3OuGIXPVBF3Nq8+YLn0HKvarKq/78hLKpAuk/wdjm9fw2udJxnr3k?=
 =?us-ascii?Q?/gwCcrQhgkC2nqdvpd2Dc1CfZ6Fpif9uzvlSaHF8y0LDLuE6rDl/YJAvOIuI?=
 =?us-ascii?Q?oLZzJ5KDY8BY4kHGClW0+BgSGl9z6a6NxABbdP5itLz3HpOqZSndiAQc+uiJ?=
 =?us-ascii?Q?ggJwndBE4YAnbaDU10pvreM3XCXY1zIt/gOPJIaT8/7J7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?33/tfoEK4qkkT28XcB/xvgbNPfvWlbvLSrTjXOz1SuSHZO7qERjbVuTdJxgv?=
 =?us-ascii?Q?JT1azv82mhiym4qB5yXIY3BBleuUOU1a6UEUTk/4OQxAbVueyLP9bivkaL2+?=
 =?us-ascii?Q?aXsbHdEBcszhnzl4S3iH0jxmG27ahbeu7UdOmzx6S/3snZKwCMduXg0qCQET?=
 =?us-ascii?Q?O3bVwU3D4vqsQKF6V+7RhjFR3S4ORQcRApZmJKmEQSef5b+6939zEaMiNOXd?=
 =?us-ascii?Q?Sp68/wtjJQaWPrimF9J89t6nmIu7lYc/Aw2lv3GoOqVdLpUmr0rQ08j2jJ2B?=
 =?us-ascii?Q?z8+pHkzAmonbpqEwp98UIdUvtg8POnxaf16pUDvRwspLdoKHAO811xD/wIG8?=
 =?us-ascii?Q?Qt3qm0NLgjcBtNQNUPIGiF+kaDGWUZEqnxzpGqyAboas1pgZG+o3EF5jgHrk?=
 =?us-ascii?Q?EnjNf3sKPCJZmCv7qwj5fH1jhxORs1TAeBHzf8pvShWmR1/Dg2isRT0OMYzW?=
 =?us-ascii?Q?CZhdTUj7H3LxMWLy7rfQnQ+n4T/6dMHuhWatWQwoFaEEVVM64GiUUJwlR+0Z?=
 =?us-ascii?Q?N/BL8heu9W1ml+K8P2WLNJhFo/u+nzni9kPZhy2rbnUPc5CT1IGelJeQfVx9?=
 =?us-ascii?Q?bHFGHuocx05tTs8ZdTzUVb3MN+0TP1iMt/1Iq5VvI3A/T2NDWud+w75CA1me?=
 =?us-ascii?Q?wIJY0/MKKyySxxZPqZkF5NZBQqt8QQzYEnJ/CY3sX5TxSi2uarxDEcXypzVV?=
 =?us-ascii?Q?I6dIxXKyhnIZw6ka7sjdFXY5oxdsYbfWxqVWBTET9/PCsRM0Sk1xxdCOe4PJ?=
 =?us-ascii?Q?281SKzW4jMoWjzeKYIv4GMAL4JoBhxNgqE+BASjueyJmXbjkbEvAlfebDLyP?=
 =?us-ascii?Q?rl7k25nuxf2bi+ahUxsM9ereHVDsf5QAl3tbTO268m/Emf+G3XMAN/wbHbLo?=
 =?us-ascii?Q?XYm6T/k4akJQq7DtP4s0EBcl8hwdBlNVlN81FFohTBxNkrNORiPEfgUuLnCu?=
 =?us-ascii?Q?xqjsR+p4C9bAw71fz79Ie3PqS+JSkQn+RjIZZMYhB66QZxrufF505TJoLtDm?=
 =?us-ascii?Q?Ot8Dzaiscqp3UQRgTdN46FswXqj4f8rPfoTvH/ev5Un8qAiHyHS1ys7lZWSw?=
 =?us-ascii?Q?mG92pUa30HzgeuL1ts71G0E0c9gQfNoheJrMwwDTojasIJ+95U1JfaA6vVds?=
 =?us-ascii?Q?VOfRXIvO3BNYz8kzUq7zXxrJpdX6aRmQqiufnfQOvEiyNmW+CPKrhF8SUrAM?=
 =?us-ascii?Q?hAnAaaH8S7/2TWbYkWD54mvZIoWkKP2GyWaOHkWmRLMbzyrho4/rq7MZ6khc?=
 =?us-ascii?Q?e4DpVByF1udzMNok47XhEqIKNfEzpo8oWitJBe5JMtFmEn0DH5QHS+TozPdG?=
 =?us-ascii?Q?tUNwN/HgsGhdnKTTSVQ9q9qlft3JW/OubT97YM6XDqjeEMnW/EhkWYQAt0OY?=
 =?us-ascii?Q?BU+lF7Lg8fjdkyDwCY9l+bq3GV3adGcthp8J9OQpgAQ67sfhEWG0ddoMNPtE?=
 =?us-ascii?Q?lxkAFajZlwD0LD4ZYD3I3ded9XAEui2D5ICu0lmcRIt2f+p+yc2VsC/dgbRm?=
 =?us-ascii?Q?+IV1OqaEpLqpRoMd5E6mndB6ZLtflpfOUQy8aP5ANfyPiLhdkUEJmAmB4zXI?=
 =?us-ascii?Q?6uFBXxG6DHeSpbrv15OX/nbAvY15CfuixJILIj4PczzbnIIkZfvNxWeriqjH?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e82da4c-8871-416b-2a37-08dd54e9f1eb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 15:43:12.3038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NQ6gamaRlQU+SUSqJmi9ZfEmMaM2I8Vdew5U3AXZbDx+mrUs2fUeJF9TjPjhDhiupHl8DRYBSVvYa4FZweIaJAkQtUE+x/zAs+pjlSPkUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6239
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

On Wed, Feb 12, 2025 at 05:08:30PM +0530, Tejas Upadhyay wrote:
>Allow user to provide a low latency hint. When set, KMD sends a hint
>to GuC which results in special handling for that process. SLPC will
>ramp the GT frequency aggressively every time it switches to this
>process.
>
>We need to enable the use of SLPC Compute strategy during init, but
>it will apply only to processes that set this bit during process
>creation.
>
>Improvement with this approach as below:
>
>Before,
>
>:~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
>Platform: Intel(R) OpenCL Graphics
>  Device: Intel(R) Graphics [0xe20b]
>    Driver version  : 24.52.0 (Linux x64)
>    Compute units   : 160
>    Clock frequency : 2850 MHz
>    Kernel launch latency : 283.16 us
>
>After,
>
>:~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
>Platform: Intel(R) OpenCL Graphics
>  Device: Intel(R) Graphics [0xe20b]
>    Driver version  : 24.52.0 (Linux x64)
>    Compute units   : 160
>    Clock frequency : 2850 MHz
>
>    Kernel launch latency : 63.38 us
>
>UMD Compute PR : https://github.com/intel/compute-runtime/pull/794
>UMD Mesa PR :  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33214
>
>v9(Vinay):
>  - remove extra line, align commit message
>v8(Vinay):
>  - Add separate example for using low latency hint
>v7(Jose):
>  - Update UMD PR
>  - applicable to all gpus
>V6:
>  - init flags, remove redundant flags check (MAuld)
>V5:
>  - Move uapi doc to documentation and GuC ABI specific change (Rodrigo)

hmn... that doesn't look right.

...

>diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>index b75cc9a70d1f..7337d1be45ef 100644
>--- a/Documentation/gpu/drm-uapi.rst
>+++ b/Documentation/gpu/drm-uapi.rst
>@@ -583,3 +583,21 @@ dma-buf interoperability
>
> Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
> information on how dma-buf is integrated and exposed within DRM.
>+
>+Low latency hint by user
>+========================
>+
>+Allow users to provide a hint to kernel for cases demanding low latency
>+profile. Please note it will have impact on power consumption. User can
>+indicate low latency hint with flag while creating exec queue as
>+mentioned below,
>+
>+     struct drm_xe_exec_queue_create exec_queue_create = {
>+          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT,
>+          .extensions = 0,
>+          .vm_id = vm,
>+          .num_bb_per_exec = 1,
>+          .num_eng_per_bb = 1,
>+          .instances = to_user_pointer(&instance),
>+     };
>+     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);

how does this driver-specific doc make sense in this file?

Lucas De Marchi
