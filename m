Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DBFCD6E88
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 19:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BE010E71F;
	Mon, 22 Dec 2025 18:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dt7PLn1v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD4D10E321;
 Mon, 22 Dec 2025 18:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766429904; x=1797965904;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hq4RU7YfEv/v6Js1dOo2lXuuKRCOVMffX2jIPINBmRc=;
 b=dt7PLn1v3N7bAn3l42IG+cZXtZNpsf16ZJC+lry3e66itIqH+8SAS3mg
 jvYYwrbxs3imIStM83IP8Ya6s8eNR52DfFB1QOIG1jv/KJwT2ChK2mBgS
 WfOecXpN89IK+2LDdwlq8ZQUOuvOw5cy5/vCVzheC7g8pVDXJG6T39o3C
 46EpDzVhBoA5VS34PUfH18HSO54C+pKeLRN5DXZMbtn9/OrculJXK3Qg1
 F4AyTnXNXfpgvGL3SOZZgxC3VfdpEnOM7dcj03S7eYGzFO58T0MKcMbvt
 1e7SXXIXjy7drmBr6mryZ9lR8VkpPEAJ2aVeWdUJ7Bx2Nx+z4ooj0Yd/7 g==;
X-CSE-ConnectionGUID: WlTjbGiRRXWRhO9kWJSeqA==
X-CSE-MsgGUID: XQHJ4S0+RnWj5FkULFeo4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="70864983"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="70864983"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 10:58:19 -0800
X-CSE-ConnectionGUID: oKAHubG/S3uHP1OGEhdpIw==
X-CSE-MsgGUID: pP3k6AbdR4uEe9zM9Q6+gw==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 10:58:19 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 10:58:18 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 10:58:18 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 10:58:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2+DH/UZAyHjgzrGEhpQvLF7hugUlOPj/3+w3OcHhOE/or/c1HWw1/kUJn0UPgacBVBGKeQMd2JpYI2FVlUZex21t0W0xQWGAm3LXHhJH06eC1Adr4eVzzwAEdAEDSeHf2AnSa0XhEP/iSr/3P1wS5dCyXb/MIA/KJ4tbOceon8TMGBkKiVJ7vuOMsAHtRQ2OMdwO6JJZ0duW/oFoubJJlv4Avi3iDgr26jWnxDHC5FqNf7nBM7na+XoOpfhcJ8D9UK0PNDO7IRD1hHqGWIczRQk3klAsTRzUPjdHGNd3YvjXZgBK5LJ29BOEpZC05VJdrMFQ5JlbKY9zTxSuvzJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8B7nQPkUeNVe5ENeCbyFKarg7x1Mpn3KV0w3jfmBeA=;
 b=a9Ka1uvqnsM+8pZCKuFah1ihy3DkrYeX2IazJ+JLRns4MR0YawgbnzrloBjbGZ0xxK5b6jLbbZ8Aj5bS5bMf/U0xQXHfOBTDPisvRY4/ryet54E80Pdkf+w5L4/Ovvyv/6e+UbXzCgbycuvIw0S1Adrl7kUNbLF1jOPfIuDpnxb6zOufRrevDPxp5dxIjzn4Oz1gk9fU8Nepe//uxs6vQoNmB7l30nkejVH5th2xJqu9rWfCg7Ow3opqtNjhYPB10ltcBOz/3ZFKn5zPl8Bp2HdUjyNnvjHTHQAQY4ZAHk1kVuuwcktA5JYBCnHMvVug8p0bc30KCAcf9lZa/BDd7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7948.namprd11.prod.outlook.com (2603:10b6:930:7f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 18:58:16 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 18:58:16 +0000
Date: Mon, 22 Dec 2025 13:58:14 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/configfs: Fix 'parameter name omitted' errors
Message-ID: <aUmUxUMarbc50eKQ@intel.com>
References: <20251222175006.9706-1-michal.wajdeczko@intel.com>
 <20251222175006.9706-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251222175006.9706-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY1P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::6) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cb9bc0d-5404-4cd3-3fa4-08de418c10c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BoElMWMGjzKFPQcAuKE6SWz7lXBBqWACHXveuy0J8uVzuTcFRnygmv6ff8ii?=
 =?us-ascii?Q?nnm2Z11bPQvJAA7Hc8+iEM96VIxJlVDur4p6genzsncchuKNHpFTqN9uDlCi?=
 =?us-ascii?Q?K42h6EE2eq0bjHRjJIiaQM/Cyozk3wzAp2tbUC2plB1l/nRpjUPPymFSdSVp?=
 =?us-ascii?Q?1Q/UQT4ilJkQf7U2s9tm5ieNto1f7GyB/AoSeSR+U5vDaVgjB7F75dGDppTp?=
 =?us-ascii?Q?Yb9dCHVeHCcALUmv9elYwg300xtakCCQsSjhaNMjf2gCEOcTznUH9D3U7tzd?=
 =?us-ascii?Q?GN58HErkZRwgNYVRHTvEW07p2skPU4Vym4jEo4e9mK/0ex7K0dUgyFYhGyqY?=
 =?us-ascii?Q?BYJZCthRd0co2dnaijgzivxQYbDmnm7rqZMwep50k4K496P+gIRrzV5oEd0k?=
 =?us-ascii?Q?a6vWUEYcSIAyBDvzhDXe9UBWVsMxfNLcS2FjABEcrsFMAq2kU1Lq10DE2dci?=
 =?us-ascii?Q?bmztD9gToak1Oy/vUJDIIuZLY+b9Y9rkFeogu+opD8fPUvWST5Ca84JctG3z?=
 =?us-ascii?Q?fx4+3Lt5yx61ZtdfaDA/H69FYx5/uquJ9mfeoh5JCjRhEXl+S23gZALLKspS?=
 =?us-ascii?Q?dJJbaZ4M0D+zPV88grG2FZ7WPWQgRItHddnOOqHEoA+XydHJy4KEDpQ6AX1H?=
 =?us-ascii?Q?5E0Ld32KQR2pjmoutAKxu85zkKm9VbEW7t/uHHUN18vv0dIkVgNICrb2o+aJ?=
 =?us-ascii?Q?aFKOKprz8xFjxo7UI7Vc+dqNCtGoofUVZfu9gOVSIQFmYVEgtxDKh20ARnF6?=
 =?us-ascii?Q?+GdJE+nG4jYi4nbA9VXSZwtTFflGUeKNX/6ccn3TqAN+9u6b2a3Mv+J9GJtQ?=
 =?us-ascii?Q?Lj0w4nndLXbsVdyMLCsxqf6Xj4U97tI3X+Ggd4Ii6zEiZLloFVDfOKgtJAs4?=
 =?us-ascii?Q?xVU9aN1+J0ovrIZPLH1qMmm94Q+HWWUwLkwBxLi5P25TV6bJVjzf/9vgsvHp?=
 =?us-ascii?Q?2a0b49cgTYT/TPnARGZ2dbtvv7DJfwiIDZP+s/qRE3xwgf5JXAG2H0M52XEs?=
 =?us-ascii?Q?zyYfFGSJh0/QWE+U29ghSVlF17YdnxFh6rzD+KjCF0ctPhSE5uETW+DTzZhp?=
 =?us-ascii?Q?x766XnN+T8b3PViJNmn3vX8WcLTJduxbX02SFiAdu+AfDdcNJ5gDFYQ2Y3y4?=
 =?us-ascii?Q?ur0lZRgxHpsL+hqJbKe8D0ikT0C8zQLcN1gi3PxF7NsKtsGCkvKrZwY7yhPd?=
 =?us-ascii?Q?MuDlAG60C5IVFs6PnsaWIVD/NNHA+w47TwA3l+7Ss/65nH90y7yrWzD5M217?=
 =?us-ascii?Q?H0G6qsiE3gsV/KyVXEu3ibFP1ocs5yHD+cypCQC8k+h/6xBDEBV++rKcYAW2?=
 =?us-ascii?Q?tvOZWW80roSe9fQnq5WwilNzhJLlN25oTbt3PdGY4CxheLjCTbr0z/NsuIkD?=
 =?us-ascii?Q?wiGe5dzb+kumMfVsPflAJ6GK/+Eup8s7egY0mpUIyvDRBl+zVWEP/Ksyeo7k?=
 =?us-ascii?Q?4EjAb8NaRrDBs8N2qfVeSEByvNG0/4KC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fOpN+fgAcBntGDcfZSc/ZJHkUz1za2CY7El5zrasWIJuEP0197yB6n3lvZPi?=
 =?us-ascii?Q?N965k1Vip6BXHbPXxesZXrHye/B9xPzS9oYkDmamkE90MGhz9nJDRJxE9oTs?=
 =?us-ascii?Q?eRCVAeZ8mK2rsh8L5NMjkpP3tiaW2eQCYsPcEw8CFiq97sOjtMUvNTA1Zcd4?=
 =?us-ascii?Q?scCjWyrLEM0BIp1OZcjWdRtndMx38t6xKb4N3wIjMwaPMA30bz4PNdMZuQDc?=
 =?us-ascii?Q?ARPbTfp5fnjEoLDbzIU6x8B8+7/BLVaWKgIT20EPo7ooTC4WDOEUjwNtzWXC?=
 =?us-ascii?Q?Kb9VgUvT72OxJQ8fFGRwZh7UWaLP6VbU1aeRcRJb6XKrk7j+Mnc7sURR3Pfc?=
 =?us-ascii?Q?rWwD/DcgXmTsP7448PyhuPSbbTjiwVeTvuD4K8sSMdz42s9/68FzpTJDjbjr?=
 =?us-ascii?Q?TzwtEilhlKQc508cOQjbHst6aImJUd6PmJIqm1rkkF0r3illVDsm/CoMBl7o?=
 =?us-ascii?Q?VtYetG9oUuvdlsr2mp0HwJ+F6I7p2XU2LrjlZ72IJc+I32BAiIciuTmJFWT0?=
 =?us-ascii?Q?gOGAyqvsyvHOcfFc6zKVILQ8McylzpgT3cFppSrBIO4vrFzlNh5I1c710Dgb?=
 =?us-ascii?Q?UuzbB5OszuKBytoQs46Jdpi14iezfvsFBT+uydvy2g8QEKDPn1l0+udeUjd6?=
 =?us-ascii?Q?oG3YDakuP2KpyJzvZeliS/hOAzN0oiToS79n2zLxMjeDUsIA4+/FwVrxL9xw?=
 =?us-ascii?Q?ksXzTL1MB3lqRDyp7burCe6rv8QHAWC/M2NrmWBKN7Zm565ZzXaDRZwdSRYU?=
 =?us-ascii?Q?1PiiIphVp8+YCKv28FBPocyWyhEwDiIIU5/z2dgd93kMb2IOqZ0A19hdSQso?=
 =?us-ascii?Q?tJbmSTx+zhJT0sfRTGcRfz4nx1V1xDrX5lFyR7weAPNjZ24qlpfdwBysCCLw?=
 =?us-ascii?Q?E5ItDyAoCsqaCkxxh+txBlpy8sMA4hMTScOIMpafPh3ISt3UPqX0OWeI8FmW?=
 =?us-ascii?Q?7nDzGJzw/zxdGo35RA8JhjjYgh0HaQPowP3jrhNlHz3HtJeLrI2fwcsFk7u7?=
 =?us-ascii?Q?P1iMZhCsl0vetLpzJpUS4yk8jfFuBFdabKXs6z36cIDlqR8A3CVlNfgSOMBD?=
 =?us-ascii?Q?JwhgRh1XyvyN/MZ8mZnWjgEHuE53Q0b9Vl+dkwSOFvAzm2vfCCtG8AXw+UzZ?=
 =?us-ascii?Q?vWSEchKUIFkKMsWDoznCux7wrRw3hnkbDG/EHs0BmbVI+X4iJIIvRCCtsGP7?=
 =?us-ascii?Q?BmbFaeisn/+3llqa0gjALihuh9CkPwfbpS6eYIv1eYgR9U0bVsayzr+b06u1?=
 =?us-ascii?Q?PuT9PQZWbVFlODJ7ewGU4iTeWXNvm6+iCKR20Xj0f6NBvIU6AxdlxkD1cGVU?=
 =?us-ascii?Q?K4rNBbrGURG7hssLd9XC5wT0nGnJpp0zeqy5zDqxv0g5tKGaX9RSGV0M5eiM?=
 =?us-ascii?Q?NZ6XeSifOhRpP0w3b7IUYT5vZTtaEfNjpZKkAupdvDxnj6Jz+4OH0d8ZyXMi?=
 =?us-ascii?Q?JhLhsNIuGyzg3OkHKHqPwyDMvuFnd+XuYMp7x6ROBQOGCAxg3jh763AAwlJ4?=
 =?us-ascii?Q?Kw6Hc9uZo9wzfb4jaHoabrEPlLuFGzBt0woCOExI11KoYxi0pHz6j1zK9UhX?=
 =?us-ascii?Q?jOk0rzsTRpEi3clVPgVfcfSewduKdI35pvCoiwQ9ED1il/XRPh8bjKqPHUXQ?=
 =?us-ascii?Q?qK8n/JEissClDKob1b7c91raYelD4UAwnrY9tyA0kzmZz61214MseVTHbcNH?=
 =?us-ascii?Q?fyLFCQ6qPVdgyS4WR9zSfkCndXOembOgZw194c2a1Yi/LcRmbMa7dvwjKFns?=
 =?us-ascii?Q?YUCoiA3ebg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb9bc0d-5404-4cd3-3fa4-08de418c10c6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 18:58:16.8296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5HAkKn6bMDlcBjzvn6l9isbVbpkvPzdF024KkhiEX/GUGHeriNU3sVQ7QpmZSgYaAJJbI0fWJnBPPRT0hU6HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7948
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

On Mon, Dec 22, 2025 at 06:50:05PM +0100, Michal Wajdeczko wrote:
> On some configs and old compilers we can get following build errors:
> 
>   ../drivers/gpu/drm/xe/xe_configfs.h: In function 'xe_configfs_get_ctx_restore_mid_bb':
>   ../drivers/gpu/drm/xe/xe_configfs.h:40:76: error: parameter name omitted
>    static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
>                                                                             ^~~~~~~~~~~~~~~~~~~~
>   ../drivers/gpu/drm/xe/xe_configfs.h: In function 'xe_configfs_get_ctx_restore_post_bb':
>   ../drivers/gpu/drm/xe/xe_configfs.h:42:77: error: parameter name omitted
>    static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
>                                                                              ^~~~~~~~~~~~~~~~~~~~
> when trying to define our configfs stub functions. Fix that.
> 
> Fixes: 7a4756b2fd04 ("drm/xe/lrc: Allow to add user commands mid context switch")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index fed57be0b90e..9998ec7c9956 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -37,9 +37,9 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
>  static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> -static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> +static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class c,
>  						     const u32 **cs) { return 0; }
> -static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> +static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class c,
>  						      const u32 **cs) { return 0; }

Let's align everything with the .c signatures:


 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
-u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
+u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
+                                      enum xe_engine_class class,
                                       const u32 **cs);
-u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
+u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
+                                       enum xe_engine_class class,
                                        const u32 **cs);
 #ifdef CONFIG_PCI_IOV
 unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
@@ -37,9 +39,11 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
 static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
-static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
+static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
+                                                    enum xe_engine_class class,
                                                     const u32 **cs) { return 0; }
-static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
+static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
+                                                     enum xe_engine_class class,
                                                      const u32 **cs) { return 0; }


>  static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev) { return UINT_MAX; }
>  #endif
> -- 
> 2.47.1
> 
