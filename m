Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9AECF4974
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 17:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C9E10E493;
	Mon,  5 Jan 2026 16:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdForLSj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7684B10E14A;
 Mon,  5 Jan 2026 16:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767629387; x=1799165387;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Gc3g0W/eo5dFzU1f+QRzV11KmwV3uENbTS//+1kILiw=;
 b=VdForLSjgZb4YzOcDiMdBGTRjea7sqipuxcunUptkWmeMfwOATddIiDP
 pO+UUTb6IfChSXV62E3DsUfM9t1vzEEsrWkrZnO7I3UG34Cc3Cp4/mr9G
 JpkfzXZ0CElueNQY8Hy/5OkzLd4WrOs0T46TsD8Rcxt+rme2rTUbrhmpY
 +hK3EcN7xq8DapblXsnD5QXPt4Mg33VPkFfQagsJIfV48bSPmCDv+PxZi
 wTi5EQqqJYGPng7GN6UGSpV79u9X+beFUmSoz13higifY6raf4UWQv90E
 Bu4gltm0S4SYlcSyR/5LY7chm8x3KUsYSGOUFg2D/nmylpU/C6b3XZVWN w==;
X-CSE-ConnectionGUID: +XvU/3A8TK+AStHvIjX7Wg==
X-CSE-MsgGUID: o2o/26iLTbS0oA2KUqYUJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="79629765"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="79629765"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 08:09:47 -0800
X-CSE-ConnectionGUID: yz5h89EgSSqRzaqILFdQtg==
X-CSE-MsgGUID: eabebcbFQEeEZyl8AMczdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="233562664"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 08:09:47 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 08:09:46 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 08:09:46 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 08:09:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUCP1W3y6tLU+n+5Cyt79bG/m0i8EsJMDTux4FVgR908evnUiaYr1jQrEc9yP26WkN6YTnboAxRO/ftVpWPiYKmEuC7Le7kMuQRScbymM+nNwG2XBkqam4zmSZMal51zzUAig0YzzTd/JXpYYJP1EWtOB8TeQ/2v/88ow70QfXBvPbmV3ehwB81UrRn8iHrNogX7NwvSZRbMsSzcpQ39zLbq+eEkUtAOQ3QqTTWLiAgJJOhl35lnAOHOxS5/mLCqA5nWu8v3oXsje6wTOm7MiXo6CMp7K1mtRrlkysq92qmA+n+mrouwze6y3M1oARgLCepw+mbIWt3Czcyp56PTvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUbtHyH9EpjTzIOGMz+bmEQcFo/DRpn3nzgVg+DJiMM=;
 b=xcfsyUw1gtNR8Sb4b+4X9wJ/3ZwG29Au5G1nLfgaC1NnfRuKSUtR3S/3aW3nUYnR7BtfdayXNs1K9cUi0f1EFWcZdLFbcGy+2/RfsQrkXBHJlxT8On6WlEAp5ZlRV3kQxljBBdeHdy7nrzdFLBXfyeZOQlFxBtMY2Gb1jpSz/vGBA4fGBEmteO55awMGPAD54sCbPrqc6pHkejVc6QOjFfniLLxfboDOxSSBomnWEb7bKRW/o8RE9SV0HOaj58sZQH6QOcUTNAwcfXyVNgtFfyGmwuSQzaaxqadHbj4+dr/4snuAYz/xRyEQXfcETOVQwmwr2NfJUGtSG6Nb4D0bhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6395.namprd11.prod.outlook.com (2603:10b6:208:3ac::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 16:09:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Mon, 5 Jan 2026
 16:09:41 +0000
Date: Mon, 5 Jan 2026 08:09:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>
Subject: Re: [PATCH v2 5/5] drm/pagemap: Enable THP support for GPU memory
 migration
Message-ID: <aVviQ6VcADOqiG/j@lstrano-desk.jf.intel.com>
References: <20260105111945.73292-1-francois.dugast@intel.com>
 <20260105111945.73292-6-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105111945.73292-6-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a59f636-bd8e-414d-a73a-08de4c74d577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?tn1ra85NN8h1vVUaRZQkCFpGdArVt+6LHMoYW6nMxcmRB16E+VJ8cRPY+A?=
 =?iso-8859-1?Q?nu7hi1uWZch5W0fCt5NzNVKfMymaCl/uJXzsyUWGHs3jGgYgiRc0nnJ6rh?=
 =?iso-8859-1?Q?947QVIWCzpeKqi9UF3wR8y36JDO/anRjD/BkM1Zgf3bPqz7qbIoVLPlt56?=
 =?iso-8859-1?Q?AiEVp8DwyXt4g4heSZM15iGrpn6vjdYc0V54Npp+fE37MrXq3GXAfttXdj?=
 =?iso-8859-1?Q?Ftjn0ZlYbygpWO6sBXyybwkD9qkXjLN0DkmcaPBBess6pSX4ZPQD4qxAgh?=
 =?iso-8859-1?Q?rdZu3iq2XnipFTeCadckhsyviElQnqjyS2WrFQSxwPYupZneY0yfAuRH/a?=
 =?iso-8859-1?Q?g7XMOMo2t0BVDmVKJCpAOl+Iw5Gq6BMxritMOV8Jr5ISuNXJEOmdwNoNot?=
 =?iso-8859-1?Q?/5hMFQV29ptGnNQTUqAvzNF6jxngYuDttPvLC1gpGAaYQglh1zthcXvOZu?=
 =?iso-8859-1?Q?j2ti2xyXlxH8EvxayWnK8TPLgpUzjB67eAxxK+Eni3op4FKFyF7vI/dYsv?=
 =?iso-8859-1?Q?jT4u8b8ng9AsBXfnPwGfzN5bPT8AvUxCozRA604SJPWSLZgBP2/NS9YPhx?=
 =?iso-8859-1?Q?en6lS1XVZWT3rSvs5ZFu/ZhRcW8Vu/JJtqb8yjyD0W1fdVRDBQTjeke4VN?=
 =?iso-8859-1?Q?cznSAo4yLmS7BJq15kdJKWP0vk8hwxsdv+vi8u1PICL0KCo0csGXPpmVK0?=
 =?iso-8859-1?Q?zBlx0tPj2xN88C8dOJHJc7mspvlkaWOOF7UFhMKgxGcX5FU7FDulWYa2/o?=
 =?iso-8859-1?Q?jm5o1HTcJVCVtCgE3EhZVEbh9zxT/M55ntVgtxYcIv85ifvQmzOmaz/uti?=
 =?iso-8859-1?Q?0Ljn2/RDZF4DEZYNoxjcE8f6i0lk0iAAmGJ/lO0/1AWQknnHKf6rrFSjKl?=
 =?iso-8859-1?Q?REoUgE9Dv95OF6xJPduI2W5MNC3+ibUZEb+CCvilZRd+3KkhdA3N7v1dJq?=
 =?iso-8859-1?Q?h2ByJ2o4kFI+jnWgzcKMZq7NFBb2xbQMcjdzWmTwduB9wuEQQiatPQKUHc?=
 =?iso-8859-1?Q?toFTENWqCVt/2lJ7aKgoVGIeVxPanLntlyEzL3nYNzKWt/xqWig/UmM4XK?=
 =?iso-8859-1?Q?wuvgi512IpTTpjT+SiL8rgBUxev1pIPD3vUYw1/ynZ/4gTsnavctekBsT/?=
 =?iso-8859-1?Q?HwcA4yiIRC+Vhs0nfgPlIoQomXuky+zTXZPmTegvO3a5imXSCSRqJrvjLx?=
 =?iso-8859-1?Q?LnNlMiarA021AsqUVLmkQP63fJRJlOdqF/7c8GpwF+4ozWzMNj837KvaSd?=
 =?iso-8859-1?Q?9XA/xM2vGPnW5n7bzd2JxeSn765/p3MLv7NSvPMm9iHX4l4poiSNIPA4cU?=
 =?iso-8859-1?Q?1dVF+AbXjh3JfejBv5gQUH9lFENEeR00warp2WLsbZsXRCx0OBp/olq7Lr?=
 =?iso-8859-1?Q?qNLdt7cKpJpqPzEfm0wH6yrZwDpnp9B3rQnnaCmBEfD629LmHYwOOuSDKL?=
 =?iso-8859-1?Q?J6spvezDKEulB16BsTR6pH6hkaZYmFKmcGlJjHNdwXvCNg/raIy3O0UHhT?=
 =?iso-8859-1?Q?Y2E9/xteAL+6Cev/0UQDhZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?78Eb5hq1Wh4SogQV44TTqwReij53mQFBoQ7eAfNhVMZwgOPtLhddgaCZLA?=
 =?iso-8859-1?Q?zRMvW0CFsMgWTUrBYpfKYggmLizBuEvpG1MMQuQQZuqOWWkJIvtqrfHadT?=
 =?iso-8859-1?Q?JgzQnFFbPJwqim7Xjgl/91tv2nHdhu2RzD80zbfRFfvd7agTozXSK8d4TM?=
 =?iso-8859-1?Q?fDimZ08ZnhVulwtVDFaGYCd8prTaQesBY4LhB+wdRmRpEtpDRoV6E8lCw7?=
 =?iso-8859-1?Q?0pMMcesd78i339dA3LCTaHndaCizkp7xwYB4ccjgSsaplMcHw0vFloTQhK?=
 =?iso-8859-1?Q?1zcFhKDUhzj6CCqi/2r37RyJ1jiS5wkqlPPXE1sgo9FnL9TddanNo9Skzn?=
 =?iso-8859-1?Q?/o/K1xeDMMf79E/khTNWooYIK27z2HSmC6oQO+gg23LnsqD0FmE56mrRA7?=
 =?iso-8859-1?Q?4TuynWHXSKszMB8VxkxObNCFB2MAYEV49A9qEY3ae6a3maRatbZWv181da?=
 =?iso-8859-1?Q?2+MAFUOKFLi4mvvT7NVf3RFOny7NZ68s/Cl8PQEqawMCKiLIKwZbMNXGUT?=
 =?iso-8859-1?Q?imCyss9kf9xyryoZ/bY4VhiGEzjbqWXir3w+cqg6ATwE1kaw6k3CovKTLr?=
 =?iso-8859-1?Q?lpEypvtkOLgJO2U5WgNReAYagvbJjLkqexLnhUCPmggnn/AyT1VVNuyyO+?=
 =?iso-8859-1?Q?uFK32EGf1B8dQkb1v+0tcLeRTeEg7q/HDGoJmw/QwtW52dI+gNxtMjRxum?=
 =?iso-8859-1?Q?YNBaytOwolUyKgdOs4adTYIp3gdwG+lF0YCq5rBE7AA64I5WaJf/AZ6Vql?=
 =?iso-8859-1?Q?WeZaE0Gb3DnD7tTWTC2wWdI3RxftnioRaFXwn4omScNHDaN6jbcbtOCfJy?=
 =?iso-8859-1?Q?jgHFI/7JaIivvIVeX/5cnnq7prr4xuDUk2/qrmk3tRi12EIxubRVpwnASc?=
 =?iso-8859-1?Q?PbQz3H5SqGk9GRclCq0M93YVr1a5PLK3TjhyKnd/cn293kEjM3wUO4EW3O?=
 =?iso-8859-1?Q?5EfHmWMQqj50pLlbHHOfiPC5SKjF+LJpF5CD06ZB3/Vza1ox4x0OmMBTdL?=
 =?iso-8859-1?Q?0IMUQP5LCbtHTFSPZ4UBeXjmeM3/LuiZ+2/Ttnp50KMSIylN4WI9izcQj6?=
 =?iso-8859-1?Q?iP9EKMoSD9D76ktR380KRKDymqNGZZNrvM5hMX3Tqe7CUaX5MP8zHAAw/V?=
 =?iso-8859-1?Q?6CLJhainp0gcF6srMI3cumsBWh0TIFcnX6RspVDQ3bJRDjf5gdPeZmVweH?=
 =?iso-8859-1?Q?G5mSdmsfsrAcUDt53oFrCd2wtevGp5bbvNDGOfUatHzWMCg1iesUOpZh6P?=
 =?iso-8859-1?Q?0s6g20p6dd8eZOWXOwm5KfiScd5xy2b3cWy1Vo/tBuxgAOdfcE7aVx7X0z?=
 =?iso-8859-1?Q?K6KtvJz1qERSxYCRM5gkRWlg+TiHfk8Oygx5xXucRTS4BQU1/OXYFu+OiQ?=
 =?iso-8859-1?Q?Mh0TIWQRxXwmDbzGM3fwuVjHCxdgat5RPueU0+fQqHeei+JWaPhpx+zQ79?=
 =?iso-8859-1?Q?HWbDgyCIQtcOK+mEfqfNvIe7LHh2+j+ia3UbuVR1xww40dz29hzXTWbWgD?=
 =?iso-8859-1?Q?N9BULA9rpQAUP90T7fb21eqqx+xcQmaj5psxVCnV6g4XUKBqf6dFwoUKhC?=
 =?iso-8859-1?Q?cHaw/Y7pksTp+wG4sC4LkHBmI9vhqvNZ+Vygt2MJsHilKjR+FC54K3pF0C?=
 =?iso-8859-1?Q?DbkvVUycCfdLFDgcb/cJnlJa9JuARxoWU9S3e4IKpd3NU/HAkNWQ6VR+Jn?=
 =?iso-8859-1?Q?W/cocKAoygxEokGE8KkDDuhRx7pz4tcaN98uv1ZtC2YlE7LmwEi4bQ2lAr?=
 =?iso-8859-1?Q?8NCWc9OpYfiA3cPwW2SfE5GPBGYRlJ/4PtotJDimllWZ32NlDAS+HnVxdf?=
 =?iso-8859-1?Q?Qi6MlDRL6z1Fvt1WZDLQAOzem/OTp6M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a59f636-bd8e-414d-a73a-08de4c74d577
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 16:09:41.7552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/jJS8oIquq7k+Hv4X9K66+BBthopP1pQZY+nKs0mxdFyjmftYUxIJCPbKaWWn5zgADifel31Poek6/LrGOl4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6395
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

On Mon, Jan 05, 2026 at 12:18:28PM +0100, Francois Dugast wrote:
> This enables support for Transparent Huge Pages (THP) for device pages by
> using MIGRATE_VMA_SELECT_COMPOUND during migration. It removes the need to
> split folios and loop multiple times over all pages to perform required
> operations at page level. Instead, we rely on newly introduced support for
> higher orders in drm_pagemap and folio-level API.
> 
> In Xe, this drastically improves performance when using SVM. The GT stats
> below collected after a 2MB page fault show overall servicing is more than
> 7 times faster, and thanks to reduced CPU overhead the time spent on the
> actual copy goes from 23% without THP to 80% with THP:
> 
> Without THP:
> 
>     svm_2M_pagefault_us: 966
>     svm_2M_migrate_us: 942
>     svm_2M_device_copy_us: 223
>     svm_2M_get_pages_us: 9
>     svm_2M_bind_us: 10
> 
> With THP:
> 
>     svm_2M_pagefault_us: 132
>     svm_2M_migrate_us: 128
>     svm_2M_device_copy_us: 106
>     svm_2M_get_pages_us: 1
>     svm_2M_bind_us: 2
> 
> v2:
> - Fix one occurrence of drm_pagemap_get_devmem_page() (Matthew Brost)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 77 +++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_svm.c   |  4 ++
>  include/drm/drm_pagemap.h     |  3 ++
>  3 files changed, 76 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 05e708730132..1ea8526ce946 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -200,16 +200,20 @@ static void drm_pagemap_migration_unlock_put_pages(unsigned long npages,
>  /**
>   * drm_pagemap_get_devmem_page() - Get a reference to a device memory page
>   * @page: Pointer to the page
> + * @order: Order
>   * @zdd: Pointer to the GPU SVM zone device data
>   *
>   * This function associates the given page with the specified GPU SVM zone
>   * device data and initializes it for zone device usage.
>   */
>  static void drm_pagemap_get_devmem_page(struct page *page,
> +					unsigned int order,
>  					struct drm_pagemap_zdd *zdd)
>  {
> -	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> -	zone_device_page_init(page, 0);
> +	struct folio *folio = page_folio(page);
> +
> +	folio_set_zone_device_data(folio, drm_pagemap_zdd_get(zdd));
> +	zone_device_page_init(page, order);
>  }
>  
>  /**
> @@ -522,7 +526,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		.end		= end,
>  		.pgmap_owner	= pagemap->owner,
>  		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
> -		MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> +		MIGRATE_VMA_SELECT_DEVICE_PRIVATE | MIGRATE_VMA_SELECT_COMPOUND,
>  	};
>  	unsigned long i, npages = npages_in_range(start, end);
>  	unsigned long own_pages = 0, migrated_pages = 0;
> @@ -628,10 +632,13 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  
>  	own_pages = 0;
>  
> -	for (i = 0; i < npages; ++i) {
> +	mutex_lock(&dpagemap->folio_split_lock);
> +	for (i = 0; i < npages;) {
> +		unsigned long j;
>  		struct page *page = pfn_to_page(migrate.dst[i]);
>  		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
>  		cur.start = i;
> +		unsigned int order;
>  
>  		pages[i] = NULL;
>  		if (src_page && is_device_private_page(src_page)) {
> @@ -658,7 +665,23 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  			pages[i] = page;
>  		}
>  		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> -		drm_pagemap_get_devmem_page(page, zdd);
> +
> +		if (migrate.src[i] & MIGRATE_PFN_COMPOUND) {
> +			order = HPAGE_PMD_ORDER;

Can we assert the folio order is HPAGE_PMD_ORDER? Eventually mTHP could
be enabled on device folios where the order could be different than
HPAGE_PMD_ORDER. I suspect we will need some small updates the GPU SVM /
Xe to support mTHP and this assert would pop telling us we need to fix
GPU SVM.

> +
> +			migrate.dst[i] |= MIGRATE_PFN_COMPOUND;
> +
> +			for (j = 1; j < NR_PAGES(order) && i + j < npages; j++)
> +				migrate.dst[i + j] = 0;
> +
> +		} else {
> +			order = 0;
> +
> +			if (folio_order(page_folio(page)))
> +				migrate_device_split_page(page);
> +		}
> +
> +		drm_pagemap_get_devmem_page(page, order, zdd);
>  
>  		/* If we switched the migrating drm_pagemap, migrate previous pages now */
>  		err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
> @@ -666,7 +689,11 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  						mdetails);
>  		if (err)
>  			goto err_finalize;
> +
> +		i += NR_PAGES(order);
>  	}
> +	mutex_unlock(&dpagemap->folio_split_lock);
> +
>  	cur.start = npages;
>  	cur.ops = NULL; /* Force migration */
>  	err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
> @@ -775,6 +802,8 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>  		page = folio_page(folio, 0);
>  		mpfn[i] = migrate_pfn(page_to_pfn(page));
>  
> +		if (order)
> +			mpfn[i] |= MIGRATE_PFN_COMPOUND;
>  next:
>  		if (page)
>  			addr += page_size(page);
> @@ -1030,8 +1059,15 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	if (err)
>  		goto err_finalize;
>  
> -	for (i = 0; i < npages; ++i)
> +	for (i = 0; i < npages;) {
> +		unsigned int order = 0;
> +
>  		pages[i] = migrate_pfn_to_page(src[i]);
> +		if (pages[i])
> +			order = folio_order(page_folio(pages[i]));
> +
> +		i += NR_PAGES(order);
> +	}
>  
>  	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
>  	if (err)
> @@ -1084,7 +1120,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  		.vma		= vas,
>  		.pgmap_owner	= page_pgmap(page)->owner,
>  		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> -		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> +		MIGRATE_VMA_SELECT_DEVICE_COHERENT |
> +		MIGRATE_VMA_SELECT_COMPOUND,

The alignment was off here - e.g. my vi settings make the original code
look like this:

                .flags          = MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
                        MIGRATE_VMA_SELECT_DEVICE_COHERENT,

Since you are changing this line can you fix the alignment?

>  		.fault_page	= page,
>  	};
>  	struct drm_pagemap_migrate_details mdetails = {};
> @@ -1150,8 +1187,15 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	if (err)
>  		goto err_finalize;
>  
> -	for (i = 0; i < npages; ++i)
> +	for (i = 0; i < npages;) {
> +		unsigned int order = 0;
> +
>  		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> +		if (pages[i])
> +			order = folio_order(page_folio(pages[i]));
> +
> +		i += NR_PAGES(order);
> +	}
>  
>  	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
>  	if (err)
> @@ -1209,9 +1253,26 @@ static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
>  	return err ? VM_FAULT_SIGBUS : 0;
>  }
>  
> +static void drm_pagemap_folio_split(struct folio *orig_folio, struct folio *new_folio)
> +{
> +	struct drm_pagemap_zdd *zdd;
> +
> +	if (!new_folio)
> +		return;
> +
> +	new_folio->pgmap = orig_folio->pgmap;
> +	zdd = folio_zone_device_data(orig_folio);
> +	if (folio_order(new_folio))
> +		folio_set_zone_device_data(new_folio, drm_pagemap_zdd_get(zdd));
> +	else
> +		folio_page(new_folio, 0)->zone_device_data =
> +			drm_pagemap_zdd_get(zdd);

Is this if statement needed? I believe folio_set_zone_device_data can
just be called.

> +}
> +
>  static const struct dev_pagemap_ops drm_pagemap_pagemap_ops = {
>  	.folio_free = drm_pagemap_folio_free,
>  	.migrate_to_ram = drm_pagemap_migrate_to_ram,
> +	.folio_split = drm_pagemap_folio_split,
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index fa2ee2c08f31..05dba6abbcc8 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1760,6 +1760,10 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
>  	if (err)
>  		goto out_no_dpagemap;
>  
> +	err = drmm_mutex_init(&xe->drm, &dpagemap->folio_split_lock);
> +	if (err)
> +		goto out_err;
> +
>  	res = devm_request_free_mem_region(dev, &iomem_resource,
>  					   vr->usable_size);
>  	if (IS_ERR(res)) {
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 736fb6cb7b33..3c8bacfc79e6 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -161,6 +161,7 @@ struct drm_pagemap_ops {
>   * &struct drm_pagemap. May be NULL if no cache is used.
>   * @shrink_link: Link into the shrinker's list of drm_pagemaps. Only
>   * used if also using a pagemap cache.
> + * @folio_split_lock: Lock to protect device folio splitting.
>   */
>  struct drm_pagemap {
>  	const struct drm_pagemap_ops *ops;
> @@ -170,6 +171,8 @@ struct drm_pagemap {
>  	struct drm_pagemap_dev_hold *dev_hold;
>  	struct drm_pagemap_cache *cache;
>  	struct list_head shrink_link;
> +	/* Protect device folio splitting */

I don't think you need this comment as we have kernel doc.

Nits aside, patch looks good.

Matt

> +	struct mutex folio_split_lock;
>  };
>  
>  struct drm_pagemap_devmem;
> -- 
> 2.43.0
> 
