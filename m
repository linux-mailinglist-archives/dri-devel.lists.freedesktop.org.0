Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C86C66B32
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 01:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C783B10E034;
	Tue, 18 Nov 2025 00:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y90jMSnw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0DC10E034;
 Tue, 18 Nov 2025 00:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763426976; x=1794962976;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=M60e27uAANrB5CRRz5vPqaGw4QeST0UUZFQFd+g0VNk=;
 b=Y90jMSnwAXqStnp5DDEOrP84K5/jEVsv0Pw40Ygqq9BB144U1ro9km4/
 Dv62r+u72/iaV4WL8GHdUiP3FkbrHDM4RhsIpUmV4rIHAlmP4HjRlKSt+
 EI5EI/xu3H809sB6vfm+q7gM/eYsPh7GcFAZER351/n2kdNknOVnfCwAI
 rnAZK4HbEp6CS9Xmd8wzMKW3eZoeAsVfoUNSdavpSMOk6PjgED83Q1beZ
 JbskSNRTlb/SFiaw/+zRGyOHGbVAAn5x5HlBasYcV6OLiYlpRFDppySNJ
 H8fOov/2w5yjfsSBH9hVGTzB82lECcrEopZTYMOe4mdXieiR5y8TegJKc g==;
X-CSE-ConnectionGUID: Gnq6mKTcSoSaqyaG5+NZkQ==
X-CSE-MsgGUID: n73Pg861SQ+80NRdDGfWzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69290551"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="69290551"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 16:49:35 -0800
X-CSE-ConnectionGUID: fc9/5ToWQdKifmOwyhnfkg==
X-CSE-MsgGUID: M2yqNSxKQmil4i6akwK1YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="227934736"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 16:49:35 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 16:49:34 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 16:49:34 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 16:49:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsLw+qCO3ag1uTYoa6uA+nMxY0U+ew0WzoIROjwRs0+seEKmLoElqDC/yTuhoutU1/1IOFdhRK6skBv1GCfpxfH709jfBNAnK/2kG+NjJezlKMLF7emPasee/OzqAuIZ4xBbmhEJbarstei+5hiVjO+3EcpOk69wuUCSJ+YP4KFEg3PN0Jv9d9AGL/Niw0m/sf9JwxDjWU/YyD9GidDSw24sqp+M8VDzUrnbotTQXAAldGepWntjL3oBel3O1KNgrdyVNy9OqkDjRpprFo7PSI5LZ1Y6XMdwkYrMoiPrJVJxeZhRBQNjP5+pE12hwJNCF+oIKGkHBsQHtjfP/pTxuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Vq81ZUowhT6AJ/mMFT/JWgmq+HAlwYxwNZjy2DH6qw=;
 b=XEd9d7v3umbBqmwvh/d7ckza+08toQ93PFeGl1QSM2+vvaTZ7DgktFjl6soq1MBJOr25dJBy61eQKz2Hw1Zu5xcmiImQB5OOtMG271S4KNmL1qFmwiBZM0FZynOlwZ0TkX7UeS/Zr15osu7r0vUSr/h/2NA6Wg5FcLPtBtkhBnkOKohPJV4sLVYm4eOYJRPzaaiAMvgWuF56viivuDw1lYbxYYYjGZp2m9c22MMK+QLrmBssnC4PRwLJkihvjzOcBI50/TVwgeM/lHYjzEt/DibLrr8HEydzwIqueM9nE+WOITvactJAgvslXeAJHg7yyHaiccaGySfiMisLMiPc6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6291.namprd11.prod.outlook.com (2603:10b6:208:3e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Tue, 18 Nov
 2025 00:49:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 00:49:31 +0000
Date: Mon, 17 Nov 2025 16:49:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 17/17] drm/xe/svm: Document how xe keeps drm_pagemap
 references
Message-ID: <aRvCmOMSNKXKaTvw@lstrano-desk.jf.intel.com>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
 <20251111164408.113070-18-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111164408.113070-18-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0170.namprd04.prod.outlook.com
 (2603:10b6:303:85::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 94c73484-debb-4ba1-6797-08de263c55bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?QJhtysKGS4PonYaAYEGwdSmsrnkwsSfYWBxNlGdXHCr7MV1Wp/YPOk9QK1?=
 =?iso-8859-1?Q?/eR43CthlaonS7dlAVaFAJceuFEfFu2rKKUZF3oR5OjHJij4bXX1lZOWdX?=
 =?iso-8859-1?Q?OkpIr/i1bfLL5Vs2bqB3daMYprM4vjhnoMcfwDLuMGtleLUYgtINHGoxiX?=
 =?iso-8859-1?Q?spfRzNRKgv0ALrPJ9v1F6e2xt9XqKqbZUUMuC40JdFMnlU0Av+hDoMSOW/?=
 =?iso-8859-1?Q?GyV5VaxlxiC+9Z+LR4HVAj1s8PlEGjkyWNfubni0flpmpDLu3vHU8xGxh4?=
 =?iso-8859-1?Q?ay+eEiGbsT86SbbAwmSNBkxsjuBqpqnz27SVIZ707LUaGiAjlerPvyKKTw?=
 =?iso-8859-1?Q?U/etI61/A6/8qok1rZIsZ80RTpg6vdmYLd1C2g1wO7RcXPEUz166wxQFFW?=
 =?iso-8859-1?Q?ttz29Z7HnhqBp6T1gX1wLJsedFqRwmvgZSzkAPSkOxN3zAjigVB63FE0Ep?=
 =?iso-8859-1?Q?S3EhlnJj+pn1CB7Tid5fS2ns/5PTBgSGQkIxLmvSleC0/x6ACUKDbxKC22?=
 =?iso-8859-1?Q?7OBIgfnPJp5Cqtk99b1fGBtnhtFTyiGcWIKWSORLdwxsTvJBdfsSJnZHdm?=
 =?iso-8859-1?Q?FOzAPDbNuIDjJERDNGB5T3geeqRAKJrvdWTdfhhOkUUCHk321afU7gUyZr?=
 =?iso-8859-1?Q?TU6KoI9rgXoUJwNmWct17YSFp/NwHjd4aO7p2chsROhv5TNdZn/7imQHJb?=
 =?iso-8859-1?Q?FgvDcbMwt9ZSRSKDAyfIa60x/JZgP1prFOcfrMD+MLk9e17CCOlrZqcqNg?=
 =?iso-8859-1?Q?OeVIKEbEEQ0FqpUApw3BChxoroyXYKuhHTDk5MO0CkSt9bfRUC9zuEggf9?=
 =?iso-8859-1?Q?qwgfMbhm68ZUHYoQFEfQmpvzucTDHAxQh/mPVwaT+U/CuunY1i8Amu3Owq?=
 =?iso-8859-1?Q?ACTQhDdMnyj3zc9lg7pHnnK/tucoQyH8lwQ7pLwXUoKTwul1BOrMD4BxEF?=
 =?iso-8859-1?Q?3HwfT/uPbAMGpjeop3NzMREVU7eGUBl9h9yNOL0ww7wrD7t6XHrHXiS2ZC?=
 =?iso-8859-1?Q?2ghkcIcKrhjDriICCCxUQGIOJ9f9wShxmH5/7i4NTucuNS2Y2JBx6UMa1/?=
 =?iso-8859-1?Q?j4mJ9MwF6hsIOftE+thGCnTVC9gWeVZnc/jGoJ0ZOlzkiWSa4m8ZkdA057?=
 =?iso-8859-1?Q?r4Qzk/04S/Dj45bAm/KRSXTXJVWchq7cJvoi6+lHjCXxjW4fXqS1lzsgBm?=
 =?iso-8859-1?Q?hc+OdDdOlTatnY8CqDXjgy4tdCpet39CwCv+CXLMJx0gNzeLs9K6Y+YlXU?=
 =?iso-8859-1?Q?0uHQT9cMExI8WmffhXVDGsvqZGor4lWwxvo9/jLQcmYv871Fu7hq+MDxsF?=
 =?iso-8859-1?Q?aZLGTFO3vPSVhSxKPZAktGYWGyrLAthrAh6xRPBcCcUaZ8IpOl59BtCZEd?=
 =?iso-8859-1?Q?RmKu+RmO8BVLrzAPuHlq4fojRrITLFqThD9O12RQa5g2HJHshTiGaF/XfH?=
 =?iso-8859-1?Q?J1ltsWUgHmL2DMu5pX+DzEm99RFfJZf6weK7GkwnWIw7BcHu+LaO1UUS30?=
 =?iso-8859-1?Q?19a4s4pDMcL0fXE0O2gXwT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CSrofmZi2ZeU1K2NZJV3SqdsRfDV32yWugKVTNWZYne8fy1fBkCc7/3IUP?=
 =?iso-8859-1?Q?1QfBdal7dPZTFmFWNDmnGq2InlBzgTvopfwfPIDpPmCeYyrCHeXV9ajfRK?=
 =?iso-8859-1?Q?Rkzq6tCg3/i7P4KVkvWGojc4Z+4KSZMRLaFqvAJxQ1OZxqggG4LWkrRIVN?=
 =?iso-8859-1?Q?IJ6unTrxqJKBzSu+jucIg9IQhI0Tlwgd7eN6ZxloRfOAtk31aApzolhJES?=
 =?iso-8859-1?Q?HMs28STjERQL+9mbWEpFRKrPe2mbzS0+fWQsBMjS1Rb6dQHmySnulU42fs?=
 =?iso-8859-1?Q?+Y7BYAW2Amn3FYDQumYcfEaM0ddiQ/eyMsDI7AcMlziHcmahQCqkpbOL5E?=
 =?iso-8859-1?Q?5GbdNuPayxwToKDo4+Yq9EE9Rggas62lUWe79qZqKfeRlGuRPesfTjVYhF?=
 =?iso-8859-1?Q?xceptOJLlXqsbhXusgd4EAZOotNBHRhAeJFrUof2mi6scOy8evYRUgOr/M?=
 =?iso-8859-1?Q?qYVVHk4tkSdmOoZQO9NPhQAC6UjrjleUlw4AjG5UM6Cbb7mgJmEZ7X5yw+?=
 =?iso-8859-1?Q?zWSUuaDYDiGszvjrzGHMfrFEwQ15Nhnp9ncZGSaTWVHRwrwnQ15ZV+Cihg?=
 =?iso-8859-1?Q?SfqNkLtPQVZmgFnQBlL97W6GPiEEfKV9umQ4WOQZsnwxd99Q62MtIrLksQ?=
 =?iso-8859-1?Q?MwuhelZmn3O4YrkvDEscciX2ifeFsbQ5X3/tFt5CXDWOhyxoS6oak6ULfC?=
 =?iso-8859-1?Q?zDID3c94tetS16MnCNut3rZGi1/kcjSY6/5DrTlsEMjJ/g5gozLXZtkEV3?=
 =?iso-8859-1?Q?lIPJeFE4m3yei0HLLjv3XMC+VrPYendeWX5OqMQ/k9Qzlxhha4rS/FIgd1?=
 =?iso-8859-1?Q?Aaxi/BVfLvpUzxQPEaThk1ggnZBkSz2OllYAXqRgxYZQ9CvHeKtSOtbG52?=
 =?iso-8859-1?Q?bjqYEPogJsusLHhpoaN7TlWlvdYPBMoXP408UPqn6YGK3bd/3nyVKHz+XF?=
 =?iso-8859-1?Q?w/ccJQbsIy40EkSAqlP4uvB2YE4oqijoFZH42/cHkpH5FmeDvS32gsbidW?=
 =?iso-8859-1?Q?qG1Jmu9mmDpWILV3FOjDLeiHqCo/Mnsr1VyAzWntnP/e+fVZ2DTrv0m17x?=
 =?iso-8859-1?Q?7tNwbWAJhWHEzbO5xfc4xmGPWWueKxdiUGrmApYHn7Rd6bixV+ymwmPiiU?=
 =?iso-8859-1?Q?qfyDG7dUURlvna5rpy35j4ux9K+FQHctOcA7CiNadCXJgNYy3OEMuN/d1m?=
 =?iso-8859-1?Q?irMvV2Y+bBmsjIqVZ1N3JT9ZOK7h0W6QSClN7QVCIZluwF/SE9kfDzjgVb?=
 =?iso-8859-1?Q?rVgiLB81b6GSJVK5qgSsvyol+PqtrjG3+jvhgtHzKo7nblg4eHb1isNBUC?=
 =?iso-8859-1?Q?kn5KMLHaipY4mf3bH65sXLV+j4+k8Ae/80/J+2O7I3aoFhotHLw1mLOR74?=
 =?iso-8859-1?Q?yOH4e+ePpS/6LFCacvb0nRffQMMhRyjhUMT4DFf7JJvCRNWl3H83DDHqe9?=
 =?iso-8859-1?Q?lnsmzb85H37hsJ8Wz26lUQvoy15/tIzj5LbFa/+mVlUEmyvutQiSZThRvc?=
 =?iso-8859-1?Q?qa3uZwaQBJUmdR26DIe0nOe5aDWyCbWQFzmWRVWrLGz9EepN0w6Ab9D47y?=
 =?iso-8859-1?Q?T68PSBtCSZrHenKkF23MrwhB0W18Ae/vU9y3swsHGWD16lptZ/jYG7dnc2?=
 =?iso-8859-1?Q?/V7d3szQ+RQQHqutU+of2oWyKig9umd8/B/qjRRB6oS5LYCCiB2clO2A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c73484-debb-4ba1-6797-08de263c55bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 00:49:31.3554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09Co8LRAbgrxBzA2d5IiNXX8tprAFgdGtGgaskC26TkMO6ZRW+VJDIp0ZcdZwfSKC/RVNh1FZpgn9oX8v04ezw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6291
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

On Tue, Nov 11, 2025 at 05:44:07PM +0100, Thomas Hellström wrote:
> As an aid to understanding the lifetime of the drm_pagemaps used
> by the xe driver, document how the xe driver keeps the
> drm_pagemap references.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 56bb3896b89a..c1d6eb2f97d1 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -28,6 +28,28 @@
>  #define XE_PEER_PAGEMAP ((void *)0ul)
>  #define XE_PEER_VM ((void *)1ul)
>  
> +/**
> + * DOC: drm_pagemap reference-counting in xe:
> + *
> + * In addition to the drm_pagemap internal reference counting by
> + * its zone device data, the xe driver holds the following
> + * long-time references:
> + *
> + * - struct xe_pagemap:
> + *      The xe_pagemap struct derives from struct drm_pagemap and
> + *      uses its reference count.
> + * - SVM-enabled VMs:
> + *      SVM-enabled VMs look up and keeps a reference to all
> + *      xe_pagemaps on the same device.

Nit: I think the formatting looks slighly off with some too early line wraps.

Aside from the nit, LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> + * - VMAs:
> + *      vmas keep a reference on the drm_pagemap indicated by a gpu_madvise()
> + *      call.
> + *
> + * In addition, all drm_pagemap or xe_pagemap pointers where lifetime cannot
> + * be guaranteed by a vma reference under the vm lock should keep a reference.
> + * That includes the range->pages.dpagemap pointer.
> + */
> +
>  static int xe_svm_get_pagemaps(struct xe_vm *vm);
>  
>  void *xe_svm_private_page_owner(struct xe_vm *vm, bool force_smem)
> -- 
> 2.51.1
> 
