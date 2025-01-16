Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351C4A130F6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 02:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3963010E181;
	Thu, 16 Jan 2025 01:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYcKf7Ns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FEC10E181;
 Thu, 16 Jan 2025 01:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736992601; x=1768528601;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=J4hDD0zLiBSUtMKxMsV6IUuf/DVXcB0C3oAC0iz8qec=;
 b=FYcKf7Ns25BWhDlgRaUPaMgOfvx0Q/d0L6xG9iOcFUwsqF3HWoe4O8DS
 LKzwc+drxGNy+JOLziER6b/z6tn9R+1LcZUK8pSMdlVGWyLrsEu7ZJkV7
 4P19IVdb+rtInPavVZTqRbdKGz4PTInPJyGKwexSlXKXdAA3N58j8UUZz
 TS07wcryTXEteZQT9+quX1Zcfx4zOLnMxA4xrHWygLQHBsILAtP3+Nl7p
 g6L4n4Eo+IMLaue8U3mINFw2fdEFDuIZf997S2VOEKnED3FQ0b67KGcT6
 0QqZ/dSqc8gt7Roso3ZgIgbIe7JoU+Q6yeGbV/TFBLpbd+GJQcTJm9Fkk Q==;
X-CSE-ConnectionGUID: krCoiQWZR1SL4UoIk+jnsQ==
X-CSE-MsgGUID: kek+qShmS9OXXinsUqy1XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37047316"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="37047316"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 17:56:40 -0800
X-CSE-ConnectionGUID: F3ghi8wZR9O+ofbd9O0n/g==
X-CSE-MsgGUID: cfEQuomQRCS1dPlnWcxBYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="105480161"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 17:56:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 17:56:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 17:56:39 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 17:56:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5++/3x7WucjjikyUdLNbf+SuNUE/HsoY9Lgkj26bMwjZb3Hr6L/GBhKFEYR+7uJLd8zm865p1UE5Q2HInAuT9AQElNVwmG6t2pt1VJhqU7lUOBEedDBeG5i0PYmiEihG0sJpCq3meZubLuYTyxwVLPa5dkA/2E55oPOf5dZc7mBhzixYBlLFs852TO3oU22xdhKM7bNswL6CsxHxfWE+RhkN577f1T7qK6qVlg8gE2VjOrv894b40SQPTkG19YtSEwURrYMif5QHa3Nb6HH0yxLgA1ux50T/cRTnlVax0yR2t7cZV4KwQukIccbTr/Qpv28N3jRfmAn5vzvBfJOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfhjBQqyO5CHIrNN310AWk/fC3SRu8L1TvrmxDMmW/k=;
 b=x6Svihoi0W5zOyL9zYStPuTY3VTJeIclpHsnhPp4dX5D1NubSdhE79vrpmwlIaiaETa8KWlPWUvDIDXFBxMX0vFPC2AAQy4xWJE5LNfWF77KMA+MmaHWnYhUMbZ0gbGnH1o9oF6cO5ZPmJUkYIIecFrDyYQBaUBuI6euogKbZxWIeIoKQMvJ9rklInLOUiwlZ+OsAJV7mYfZvdVPUmkNmAzKVqQUvoReq31smfFy88LqdgB8mWt32F3rKyCaQZ0yhQGnaLe3XkxAWla3DsQN9VUtfM9BzAaoTa9uBNYF9zNRD1LqBZjFJIf60Mr4ZSpwZ7JAKtlvBZqS0Cg6Uf584A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7046.namprd11.prod.outlook.com (2603:10b6:510:216::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 01:56:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 01:56:36 +0000
Date: Wed, 15 Jan 2025 17:57:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>, "Paulo
 Zanoni" <paulo.r.zanoni@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v15 4/9] drm/ttm/pool, drm/ttm/tt: Provide a helper to
 shrink pages
Message-ID: <Z4hniP6TdhBgVV+V@lstrano-desk.jf.intel.com>
References: <20241217145852.37342-1-thomas.hellstrom@linux.intel.com>
 <20241217145852.37342-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217145852.37342-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0092.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: 800e6df7-7ce7-4a86-785a-08dd35d10227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?sEJH+f73sr1Mwu7O2XOAa3OjKHDWFyfNuYzZt5GxDgFVCGUV+DMu0nuB6/?=
 =?iso-8859-1?Q?lAAMX8q7zDdUyzQt0TlSHLbLYhEhKW1uYM+CGel/44jDy+VMOsjKEjZygo?=
 =?iso-8859-1?Q?ewWENVaK5JvBGwT2p64PT4KcbqZobUXW9vNAWZ4YyVZaRwXrvLjQWyr9w9?=
 =?iso-8859-1?Q?Y+nMzV2C5BjDtB0tjpoNDL1OH+Rpv26P0j0WW5kEaw8166C1cPclu2Y9v8?=
 =?iso-8859-1?Q?BesK9s/BqoG86Z0UO/Na9HhebkNUQvdABMfmxVEmCyfjyHMTO0myd9sdjy?=
 =?iso-8859-1?Q?6nOY9ma1aGu/XiCWfI6wQZtcbcZbCggMgVQVEW2XyMfVMluqQEhbQZ4iqd?=
 =?iso-8859-1?Q?eJrGYUifLBVK0Sjp5udIkMNujfLA/Es0skHyjKXjllcPKyYHooVpO/xrhi?=
 =?iso-8859-1?Q?xF55KDtDtYqQGhrXQRI4UgmcvT8Y6aVc7auUx9ZSvPcPRWs38Zc/SiAXYj?=
 =?iso-8859-1?Q?aWwnBgpuSoNIsalAwehEmcuMF8FjhkNpdLTqDhfJ4+dLk2No7s9Y0Qlx8+?=
 =?iso-8859-1?Q?5jBnoHT60t4NOiOF5Wt0+PHsfXT1JcbLheiihpzw5QKuCiyN/KY3pBkaVT?=
 =?iso-8859-1?Q?rCXF6AzAf+wJo8Er20eeKFRuqQ+0aakG/4/Ok+gK536pgwjqJEgtgjtD8X?=
 =?iso-8859-1?Q?zkIA2Q0/MF94/MIPwszm4TblBfjDS/nppKs7XkYsTysXZRcjSJKZnobe59?=
 =?iso-8859-1?Q?pwyLutNbzCT8eQQEWvPmAyk7VISpRo+0Tr2qnT/8n+I68qiNIY7uiomw5d?=
 =?iso-8859-1?Q?dFZiZwdtnDwyBQhU9naknobyAoWAdHpNzzzswY+lv5PlO+kbZwnm6zWEMr?=
 =?iso-8859-1?Q?D1bkgDcPmXZJYzNjF9gnM8AwTS0gOTaTGg7owg3o2hOFXBfT8breQN1/M1?=
 =?iso-8859-1?Q?ltgraj/seC6rwkajzmqHB/YKckygHYwEQPMxIfE/rJpjcac4cKvjMYPJvQ?=
 =?iso-8859-1?Q?91MG0CouN8aPjy1/uG4gLdBAOYV4rvvc3Mx/kqBJw9kqvINRyH4U+s27Td?=
 =?iso-8859-1?Q?SfSCGvkts4ig3Udrn85YDFXbSkvR2n6/jFPglklXTc5+/BpRoHR08pZYrS?=
 =?iso-8859-1?Q?TxJ8NcE9IX/5sd6DJw9mWzqubdMfsfGA5eGzWeG7pZ0O6s9ulp32iXz+wy?=
 =?iso-8859-1?Q?CKY9zqBP312JG4ROuVmaO++nn03sXLIWhMGBIg5OuKaEiGjWCZb6eN1RTw?=
 =?iso-8859-1?Q?Z7L62BSkxlFxBiT0smItDsC5B5G9pFX/ZGQBmdFa6SvGUuc1Dru5Qa1Gcy?=
 =?iso-8859-1?Q?MgHBGNlhpSrk8PWM1k3XLNcMmX77xcbPXdBroy3QvlSgIeI+D2krqfvr/S?=
 =?iso-8859-1?Q?bJUZ1+av+EaEWlzoezz+zcnw7Pj5uuLLsLeS+lmSeBywOKWK9f9Bl2TZOe?=
 =?iso-8859-1?Q?ptMfqq5qd9WL7kgqGBuOdkg4m5rPcSOpdTCHq1KpiU1O9ht0SIKC6e3wkW?=
 =?iso-8859-1?Q?c9JRqYdWvjbpQW4u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LQ2YsXbSB7KQkFQbANu7q/ip3S5noJOmyzlCvPXp3Ep7uu72MDi7sgc5BO?=
 =?iso-8859-1?Q?2mLslONc8XBHtk0LZsqr/ZLNx+9gRH5zVJcyOwjBfyMoHxigIXzy8mSPbp?=
 =?iso-8859-1?Q?awFJ6L7QWw2zBmaNG5xh0QEnKKDPfNEthjZ01csKy45ksCGkkmI4R+m02x?=
 =?iso-8859-1?Q?OH6qySlilT9PiMSrjb2LHA/vPVCPJ7Y7Hbw8hicgV5fD6ZD1YgTp4uL0H0?=
 =?iso-8859-1?Q?lC67nXRPTXKBbyEF0iP23zeOBGHuswzQdUpJbbZ394xCwJgfouPS2pdV4s?=
 =?iso-8859-1?Q?vV1oIChDDqKgSM5DAP0+tfN6WJdRJfW4uERjfWcqp8msraFkJ6wPET50OK?=
 =?iso-8859-1?Q?vvX5GZEgE2VeATDWmMxET1PU/JaOHE/y1oKT8n6NlCspqc4U5gEvmUyK+p?=
 =?iso-8859-1?Q?ujB7aOKOmVjg8rCSZKnAxd2PCdVD5rb+zRP3agES6INkoUTSCAG9k0i8A8?=
 =?iso-8859-1?Q?5ylYoxue4mabf9SBKVQJpDSKscw8XVVUENmi3gpCGxqNVGfwHilntMKTNL?=
 =?iso-8859-1?Q?V3WFKupxnup/2+V/Fl9lN+anl1tlLbxIn1RfI3lPRp2iK+yfTWXss9Xlca?=
 =?iso-8859-1?Q?RHbkslR5hbl0MH5vOCpVKnBXz91UXzoyFlQ4dKEqHWNbu5GIbeQ+slr6vq?=
 =?iso-8859-1?Q?91KWbyU6z+i5OR+jzieCOHuvsFJ2zpmEo2QtbkSXIcApjdlBlNnSi7yD+5?=
 =?iso-8859-1?Q?WSFfIC7oGodLlZEIEIxJ2NLDfqGilB6hwC8qL2flnfyaGHEBR9fo+1J+cO?=
 =?iso-8859-1?Q?S9iO4xsT3AO3Lx9ZFU2Q27LHYYhjPXF60pA3sDQkDOGMAp3TOabDMiDLP5?=
 =?iso-8859-1?Q?CGlYwh9pYQvYvFND1VJecyJvN3pQwPnhaD+f7DUg4FrtbNauVVSolOKamO?=
 =?iso-8859-1?Q?Vksy4YzBtqo3083QWPs+XIRqD8S9wMQ/RTbW94Tq3J5M06hOWrvqz2GNa6?=
 =?iso-8859-1?Q?pvnBynE+05pyt5YapdiHiBlgUBOSNYYUB1TIU51p0f62DmtoEt+UBQ09V9?=
 =?iso-8859-1?Q?PmaSQM5bEQRhCUQrjECmjeSYv4POXMlo8VhxtU3rZK1/Xu2MXgHf2EuZ+c?=
 =?iso-8859-1?Q?LjyI290ljVAArhE9XVvimCOeb2rqYf0HmgYP6wr/caBdn1wb/qtNLQxpFb?=
 =?iso-8859-1?Q?w+SncNVD/v5CulGwq2GvHemNdCtKo+25qBOCNQvhF2+g4PRpc7/BoEu7mp?=
 =?iso-8859-1?Q?xSlvN0EA2n7EBJ9bX6UTvYpLfNb7cTkgSQrSDzdZzm1nai0VfHj7W3xtmb?=
 =?iso-8859-1?Q?E5VwbX5Q9ftZ33OKsyhQ5DRdMw64MokqtEnyYmB1ylCiRSSNEooku/zh79?=
 =?iso-8859-1?Q?Rvs6aPhXNjlnjxImhMlmo8jPMbs42EgkkBoeVARsHWv4tUHbMWFiZ6EUx2?=
 =?iso-8859-1?Q?0n2hBbQekL3nbEZIWV1rBh+y5Ll+R8WdIKtPtkk/0ghZjIsHVBtyjLBr8g?=
 =?iso-8859-1?Q?oiEQnXs+OL74mChEVTvzyLjk77v2nrqq26dhQPu3qjLp2cYxc6N1bdeUwX?=
 =?iso-8859-1?Q?jiqIOZtQIUaAq8Y47OCbJCy/sPbA+TeGQaGQA6+zuqdnltzT97I1SGL4tK?=
 =?iso-8859-1?Q?VKq0O+T5dJwcOBdLu/AKO3BmiLU42tC+8VCbxMW4NXqxcIBVpOKJFxLplR?=
 =?iso-8859-1?Q?FAzskbSrkApVSQtmU+iKb1Q5bnU1DLpbLRYnAXMKTXhPJnI74zBelJow?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 800e6df7-7ce7-4a86-785a-08dd35d10227
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 01:56:35.8969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ioyd51WUbRGMINNOr8/LMZootGQ8yIPK1mXCzWqIiDSSY1Nw+FfGpcFBbYijrjnMVHbHg8GOVwKfnYL3FAE1Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7046
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

On Tue, Dec 17, 2024 at 03:58:47PM +0100, Thomas Hellström wrote:
> Provide a helper to shrink ttm_tt page-vectors on a per-page
> basis. A ttm_backup backend could then in theory get away with
> allocating a single temporary page for each struct ttm_tt.
> 
> This is accomplished by splitting larger pages before trying to
> back them up.
> 
> In the future we could allow ttm_backup to handle backing up
> large pages as well, but currently there's no benefit in
> doing that, since the shmem backup backend would have to
> split those anyway to avoid allocating too much temporary
> memory, and if the backend instead inserts pages into the
> swap-cache, those are split on reclaim by the core.
> 
> Due to potential backup- and recover errors, allow partially swapped
> out struct ttm_tt's, although mark them as swapped out stopping them
> from being swapped out a second time. More details in the ttm_pool.c
> DOC section.
> 
> v2:
> - A couple of cleanups and error fixes in ttm_pool_back_up_tt.
> - s/back_up/backup/
> - Add a writeback parameter to the exported interface.
> v8:
> - Use a struct for flags for readability (Matt Brost)
> - Address misc other review comments (Matt Brost)
> v9:
> - Update the kerneldoc for the ttm_tt::backup field.
> v10:
> - Rebase.
> v13:
> - Rebase on ttm_backup interface change. Update kerneldoc.
> - Rebase and adjust ttm_tt_is_swapped().
> v15:
> - Rebase on ttm_backup return value change.
> - Rebase on previous restructuring of ttm_pool_alloc()
> - Rework the ttm_pool backup interface (Christian König)
> - Remove cond_resched() (Christian König)
> - Get rid of the need to allocate an intermediate page array
>   when restoring a multi-order page (Christian König)
> - Update documentation.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 554 +++++++++++++++++++++++++++++----
>  drivers/gpu/drm/ttm/ttm_tt.c   |  54 ++++
>  include/drm/ttm/ttm_pool.h     |   8 +
>  include/drm/ttm/ttm_tt.h       |  67 +++-
>  4 files changed, 629 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index c9eba76d5143..ffb7abf52bab 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -41,6 +41,7 @@
>  #include <asm/set_memory.h>
>  #endif
>  
> +#include <drm/ttm/ttm_backup.h>
>  #include <drm/ttm/ttm_pool.h>
>  #include <drm/ttm/ttm_tt.h>
>  #include <drm/ttm/ttm_bo.h>
> @@ -75,6 +76,35 @@ struct ttm_pool_alloc_state {
>  	enum ttm_caching tt_caching;
>  };
>  
> +/**
> + * struct ttm_pool_tt_restore - State representing restore from backup
> + * @pool: The pool used for page allocation while restoring.
> + * @snapshot_alloc: A snapshot of the most recent struct ttm_pool_alloc_state.
> + * @alloced_page: Pointer to the page most recently allocated from a pool or system.
> + * @first_dma: The dma address corresponding to @alloced_page if dma_mapping
> + * is requested.
> + * @alloced_pages: The number of allocated pages present in the struct ttm_tt
> + * page vector from this restore session.
> + * @restored_pages: The number of 4K pages restored for @alloced_page (which
> + * is typically a multi-order page).
> + * @page_caching: The struct ttm_tt requested caching
> + * @order: The order of @alloced_page.
> + *
> + * Recovery from backup might fail when we've recovered less than the
> + * full ttm_tt. In order not to loose any data (yet), keep information
> + * around that allows us to restart a failed ttm backup recovery.
> + */
> +struct ttm_pool_tt_restore {
> +	struct ttm_pool *pool;
> +	struct ttm_pool_alloc_state snapshot_alloc;
> +	struct page *alloced_page;
> +	dma_addr_t first_dma;
> +	pgoff_t alloced_pages;
> +	pgoff_t restored_pages;
> +	enum ttm_caching page_caching;
> +	unsigned int order;
> +};
> +
>  static unsigned long page_pool_size;
>  
>  MODULE_PARM_DESC(page_pool_size, "Number of pages in the WC/UC/DMA pool");
> @@ -199,12 +229,11 @@ static int ttm_pool_apply_caching(struct ttm_pool_alloc_state *alloc)
>  	return 0;
>  }
>  
> -/* Map pages of 1 << order size and fill the DMA address array  */
> +/* DMA Map pages of 1 << order size and return the resulting dma_address. */
>  static int ttm_pool_map(struct ttm_pool *pool, unsigned int order,
> -			struct page *p, dma_addr_t **dma_addr)
> +			struct page *p, dma_addr_t *dma_addr)
>  {
>  	dma_addr_t addr;
> -	unsigned int i;
>  
>  	if (pool->use_dma_alloc) {
>  		struct ttm_pool_dma *dma = (void *)p->private;
> @@ -218,10 +247,7 @@ static int ttm_pool_map(struct ttm_pool *pool, unsigned int order,
>  			return -EFAULT;
>  	}
>  
> -	for (i = 1 << order; i ; --i) {
> -		*(*dma_addr)++ = addr;
> -		addr += PAGE_SIZE;
> -	}
> +	*dma_addr = addr;
>  
>  	return 0;
>  }
> @@ -371,6 +397,190 @@ static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
>  	return p->private;
>  }
>  
> +/*
> + * Split larger pages so that we can free each PAGE_SIZE page as soon
> + * as it has been backed up, in order to avoid memory pressure during
> + * reclaim.
> + */
> +static void ttm_pool_split_for_swap(struct ttm_pool *pool, struct page *p)
> +{
> +	unsigned int order = ttm_pool_page_order(pool, p);
> +	pgoff_t nr;
> +
> +	if (!order)
> +		return;
> +
> +	split_page(p, order);
> +	nr = 1UL << order;
> +	while (nr--)
> +		(p++)->private = 0;
> +}
> +
> +/**
> + * DOC: Partial backup and restoration of a struct ttm_tt.
> + *
> + * Swapout using ttm_backup_backup_page() and swapin using
> + * ttm_backup_copy_page() may fail.
> + * The former most likely due to lack of swap-space or memory, the latter due
> + * to lack of memory or because of signal interruption during waits.
> + *
> + * Backup failure is easily handled by using a ttm_tt pages vector that holds
> + * both backup handles and page pointers. This has to be taken into account when
> + * restoring such a ttm_tt from backup, and when freeing it while backed up.
> + * When restoring, for simplicity, new pages are actually allocated from the
> + * pool and the contents of any old pages are copied in and then the old pages
> + * are released.
> + *
> + * For restoration failures, the struct ttm_pool_tt_restore holds sufficient state
> + * to be able to resume an interrupted restore, and that structure is freed once
> + * the restoration is complete. If the struct ttm_tt is destroyed while there
> + * is a valid struct ttm_pool_tt_restore attached, that is also properly taken
> + * care of.
> + */
> +
> +/* Is restore ongoing for the currently allocated page? */
> +static bool ttm_pool_restore_valid(const struct ttm_pool_tt_restore *restore)
> +{
> +	return restore && restore->restored_pages < (1 << restore->order);
> +}
> +
> +/* DMA unmap and free a multi-order page, either to the relevant pool or to system. */
> +static pgoff_t ttm_pool_unmap_and_free(struct ttm_pool *pool, struct page *page,
> +				       const dma_addr_t *dma_addr, enum ttm_caching caching)
> +{
> +	struct ttm_pool_type *pt = NULL;
> +	unsigned int order;
> +	pgoff_t nr;
> +
> +	if (pool) {
> +		order = ttm_pool_page_order(pool, page);
> +		nr = (1UL << order);
> +		if (dma_addr)
> +			ttm_pool_unmap(pool, *dma_addr, nr);
> +
> +		pt = ttm_pool_select_type(pool, caching, order);
> +	} else {
> +		order = page->private;
> +		nr = (1UL << order);
> +	}
> +
> +	if (pt)
> +		ttm_pool_type_give(pt, page);
> +	else
> +		ttm_pool_free_page(pool, caching, order, page);
> +
> +	return nr;
> +}
> +
> +/* Populate the page-array using the most recent allocated multi-order page. */
> +static void ttm_pool_allocated_page_commit(struct page *allocated,
> +					   dma_addr_t first_dma,
> +					   struct ttm_pool_alloc_state *alloc,
> +					   pgoff_t nr)
> +{
> +	pgoff_t i;
> +
> +	for (i = 0; i < nr; ++i)
> +		*alloc->pages++ = allocated++;
> +
> +	alloc->remaining_pages -= nr;
> +
> +	if (!alloc->dma_addr)
> +		return;
> +
> +	for (i = 0; i < nr; ++i) {
> +		*alloc->dma_addr++ = first_dma;
> +		first_dma += PAGE_SIZE;
> +	}
> +}
> +
> +/*
> + * When restoring, restore backed-up content to the newly allocated page and
> + * if successful, populate the page-table and dma-address arrays.
> + */
> +static int ttm_pool_restore_commit(struct ttm_pool_tt_restore *restore,
> +				   struct ttm_backup *backup,
> +				   const struct ttm_operation_ctx *ctx,
> +				   struct ttm_pool_alloc_state *alloc)
> +
> +{
> +	pgoff_t i, nr = 1UL << restore->order;
> +	struct page **first_page = alloc->pages;
> +	struct page *p;
> +	int ret = 0;
> +
> +	for (i = restore->restored_pages; i < nr; ++i) {
> +		p = first_page[i];
> +		if (ttm_backup_page_ptr_is_handle(p)) {
> +			unsigned long handle = ttm_backup_page_ptr_to_handle(p);
> +
> +			if (handle == 0) {
> +				restore->restored_pages++;
> +				continue;
> +			}
> +
> +			ret = ttm_backup_copy_page(backup, restore->alloced_page + i,
> +						   handle, ctx->interruptible);
> +			if (ret)
> +				break;
> +
> +			ttm_backup_drop(backup, handle);
> +		} else if (p) {
> +			/*
> +			 * We could probably avoid splitting the old page
> +			 * using clever logic, but ATM we don't care, as
> +			 * we prioritize releasing memory ASAP. Note that
> +			 * here, the old retained page is always write-back
> +			 * cached.
> +			 */
> +			ttm_pool_split_for_swap(restore->pool, p);
> +			copy_highpage(restore->alloced_page + i, p);
> +			__free_pages(p, 0);
> +		}
> +
> +		restore->restored_pages++;
> +		first_page[i] = ttm_backup_handle_to_page_ptr(0);
> +	}
> +
> +	if (ret) {
> +		if (!restore->restored_pages) {
> +			dma_addr_t *dma_addr = alloc->dma_addr ? &restore->first_dma : NULL;
> +
> +			ttm_pool_unmap_and_free(restore->pool, restore->alloced_page,
> +						dma_addr, restore->page_caching);
> +			restore->restored_pages = nr;
> +		}
> +		return ret;
> +	}
> +
> +	ttm_pool_allocated_page_commit(restore->alloced_page, restore->first_dma,
> +				       alloc, nr);
> +	if (restore->page_caching == alloc->tt_caching || PageHighMem(restore->alloced_page))
> +		alloc->caching_divide = alloc->pages;
> +	restore->snapshot_alloc = *alloc;
> +	restore->alloced_pages += nr;
> +
> +	return 0;
> +}
> +
> +/* If restoring, save information needed for ttm_pool_restore_commit(). */
> +static void
> +ttm_pool_page_allocated_restore(struct ttm_pool *pool, unsigned int order,
> +				struct page *p,
> +				enum ttm_caching page_caching,
> +				dma_addr_t first_dma,
> +				struct ttm_pool_tt_restore *restore,
> +				const struct ttm_pool_alloc_state *alloc)
> +{
> +	restore->pool = pool;
> +	restore->order = order;
> +	restore->restored_pages = 0;
> +	restore->page_caching = page_caching;
> +	restore->first_dma = first_dma;
> +	restore->alloced_page = p;
> +	restore->snapshot_alloc = *alloc;
> +}
> +
>  /*
>   * Called when we got a page, either from a pool or newly allocated.
>   * if needed, dma map the page and populate the dma address array.
> @@ -380,10 +590,11 @@ static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
>   */
>  static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
>  				   struct page *p, enum ttm_caching page_caching,
> -				   struct ttm_pool_alloc_state *alloc)
> +				   struct ttm_pool_alloc_state *alloc,
> +				   struct ttm_pool_tt_restore *restore)
>  {
> -	pgoff_t i, nr = 1UL << order;
>  	bool caching_consistent;
> +	dma_addr_t first_dma;
>  	int r = 0;
>  
>  	caching_consistent = (page_caching == alloc->tt_caching) || PageHighMem(p);
> @@ -395,17 +606,20 @@ static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
>  	}
>  
>  	if (alloc->dma_addr) {
> -		r = ttm_pool_map(pool, order, p, &alloc->dma_addr);
> +		r = ttm_pool_map(pool, order, p, &first_dma);
>  		if (r)
>  			return r;
>  	}
>  
> -	alloc->remaining_pages -= nr;
> -	for (i = 0; i < nr; ++i)
> -		*alloc->pages++ = p++;
> +	if (restore) {
> +		ttm_pool_page_allocated_restore(pool, order, p, page_caching,
> +						first_dma, restore, alloc);
> +	} else {
> +		ttm_pool_allocated_page_commit(p, first_dma, alloc, 1UL << order);
>  
> -	if (caching_consistent)
> -		alloc->caching_divide = alloc->pages;
> +		if (caching_consistent)
> +			alloc->caching_divide = alloc->pages;
> +	}
>  
>  	return 0;
>  }
> @@ -428,22 +642,24 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
>  				pgoff_t start_page, pgoff_t end_page)
>  {
>  	struct page **pages = &tt->pages[start_page];
> -	unsigned int order;
> +	struct ttm_backup *backup = tt->backup;
>  	pgoff_t i, nr;
>  
>  	for (i = start_page; i < end_page; i += nr, pages += nr) {
> -		struct ttm_pool_type *pt = NULL;
> +		struct page *p = *pages;
>  
> -		order = ttm_pool_page_order(pool, *pages);
> -		nr = (1UL << order);
> -		if (tt->dma_address)
> -			ttm_pool_unmap(pool, tt->dma_address[i], nr);
> +		nr = 1;
> +		if (ttm_backup_page_ptr_is_handle(p)) {
> +			unsigned long handle = ttm_backup_page_ptr_to_handle(p);
>  
> -		pt = ttm_pool_select_type(pool, caching, order);
> -		if (pt)
> -			ttm_pool_type_give(pt, *pages);
> -		else
> -			ttm_pool_free_page(pool, caching, order, *pages);
> +			if (handle != 0)
> +				ttm_backup_drop(backup, handle);
> +		} else if (p) {
> +			dma_addr_t *dma_addr = tt->dma_address ?
> +				tt->dma_address + i : NULL;
> +
> +			nr = ttm_pool_unmap_and_free(pool, p, dma_addr, caching);
> +		}
>  	}
>  }
>  
> @@ -467,22 +683,11 @@ static unsigned int ttm_pool_alloc_find_order(unsigned int highest,
>  	return min_t(unsigned int, highest, __fls(alloc->remaining_pages));
>  }
>  
> -/**
> - * ttm_pool_alloc - Fill a ttm_tt object
> - *
> - * @pool: ttm_pool to use
> - * @tt: ttm_tt object to fill
> - * @ctx: operation context
> - *
> - * Fill the ttm_tt object with pages and also make sure to DMA map them when
> - * necessary.
> - *
> - * Returns: 0 on successe, negative error code otherwise.
> - */
> -int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
> -		   struct ttm_operation_ctx *ctx)
> +static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
> +			    const struct ttm_operation_ctx *ctx,
> +			    struct ttm_pool_alloc_state *alloc,
> +			    struct ttm_pool_tt_restore *restore)
>  {
> -	struct ttm_pool_alloc_state alloc;
>  	enum ttm_caching page_caching;
>  	gfp_t gfp_flags = GFP_USER;
>  	pgoff_t caching_divide;
> @@ -491,10 +696,8 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  	struct page *p;
>  	int r;
>  
> -	ttm_pool_alloc_state_init(tt, &alloc);
> -
> -	WARN_ON(!alloc.remaining_pages || ttm_tt_is_populated(tt));
> -	WARN_ON(alloc.dma_addr && !pool->dev);
> +	WARN_ON(!alloc->remaining_pages || ttm_tt_is_populated(tt));
> +	WARN_ON(alloc->dma_addr && !pool->dev);
>  
>  	if (tt->page_flags & TTM_TT_FLAG_ZERO_ALLOC)
>  		gfp_flags |= __GFP_ZERO;
> @@ -509,9 +712,9 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  
>  	page_caching = tt->caching;
>  	allow_pools = true;
> -	for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, &alloc);
> -	     alloc.remaining_pages;
> -	     order = ttm_pool_alloc_find_order(order, &alloc)) {
> +	for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
> +	     alloc->remaining_pages;
> +	     order = ttm_pool_alloc_find_order(order, alloc)) {
>  		struct ttm_pool_type *pt;
>  
>  		/* First, try to allocate a page from a pool if one exists. */
> @@ -541,30 +744,120 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  			r = -ENOMEM;
>  			goto error_free_all;
>  		}
> -		r = ttm_pool_page_allocated(pool, order, p, page_caching, &alloc);
> +		r = ttm_pool_page_allocated(pool, order, p, page_caching, alloc,
> +					    restore);
>  		if (r)
>  			goto error_free_page;
> +
> +		if (ttm_pool_restore_valid(restore)) {
> +			r = ttm_pool_restore_commit(restore, tt->backup, ctx, alloc);
> +			if (r)
> +				goto error_free_all;
> +		}
>  	}
>  
> -	r = ttm_pool_apply_caching(&alloc);
> +	r = ttm_pool_apply_caching(alloc);
>  	if (r)
>  		goto error_free_all;
>  
> +	kfree(tt->restore);
> +	tt->restore = NULL;
> +
>  	return 0;
>  
>  error_free_page:
>  	ttm_pool_free_page(pool, page_caching, order, p);
>  
>  error_free_all:
> -	caching_divide = alloc.caching_divide - tt->pages;
> +	if (tt->restore)
> +		return r;
> +
> +	caching_divide = alloc->caching_divide - tt->pages;
>  	ttm_pool_free_range(pool, tt, tt->caching, 0, caching_divide);
>  	ttm_pool_free_range(pool, tt, ttm_cached, caching_divide,
> -			    tt->num_pages - alloc.remaining_pages);
> +			    tt->num_pages - alloc->remaining_pages);
>  
>  	return r;
>  }
> +
> +/**
> + * ttm_pool_alloc - Fill a ttm_tt object
> + *
> + * @pool: ttm_pool to use
> + * @tt: ttm_tt object to fill
> + * @ctx: operation context
> + *
> + * Fill the ttm_tt object with pages and also make sure to DMA map them when
> + * necessary.
> + *
> + * Returns: 0 on successe, negative error code otherwise.
> + */
> +int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
> +		   struct ttm_operation_ctx *ctx)
> +{
> +	struct ttm_pool_alloc_state alloc;
> +
> +	if (WARN_ON(ttm_tt_is_backed_up(tt)))
> +		return -EINVAL;
> +
> +	ttm_pool_alloc_state_init(tt, &alloc);
> +
> +	return __ttm_pool_alloc(pool, tt, ctx, &alloc, NULL);
> +}
>  EXPORT_SYMBOL(ttm_pool_alloc);
>  
> +/**
> + * ttm_pool_restore_and_alloc - Fill a ttm_tt, restoring previously backed-up
> + * content.
> + *
> + * @pool: ttm_pool to use
> + * @tt: ttm_tt object to fill
> + * @ctx: operation context
> + *
> + * Fill the ttm_tt object with pages and also make sure to DMA map them when
> + * necessary. Read in backed-up content.
> + *
> + * Returns: 0 on successe, negative error code otherwise.
> + */
> +int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
> +			       const struct ttm_operation_ctx *ctx)
> +{
> +	struct ttm_pool_alloc_state alloc;
> +
> +	if (WARN_ON(!ttm_tt_is_backed_up(tt)))
> +		return -EINVAL;
> +
> +	if (!tt->restore) {
> +		gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;
> +
> +		ttm_pool_alloc_state_init(tt, &alloc);
> +		if (ctx->gfp_retry_mayfail)
> +			gfp |= __GFP_RETRY_MAYFAIL;
> +
> +		tt->restore = kzalloc(sizeof(*tt->restore), gfp);
> +		if (!tt->restore)
> +			return -ENOMEM;
> +
> +		tt->restore->snapshot_alloc = alloc;
> +		tt->restore->pool = pool;
> +		tt->restore->restored_pages = 1;
> +	} else {
> +		struct ttm_pool_tt_restore *restore = tt->restore;
> +		int ret;
> +
> +		alloc = restore->snapshot_alloc;
> +		if (ttm_pool_restore_valid(tt->restore)) {
> +			ret = ttm_pool_restore_commit(restore, tt->backup, ctx, &alloc);
> +			if (ret)
> +				return ret;
> +		}
> +		if (!alloc.remaining_pages)
> +			return 0;
> +	}
> +
> +	return __ttm_pool_alloc(pool, tt, ctx, &alloc, tt->restore);
> +}
> +
>  /**
>   * ttm_pool_free - Free the backing pages from a ttm_tt object
>   *
> @@ -582,6 +875,163 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>  }
>  EXPORT_SYMBOL(ttm_pool_free);
>  
> +/**
> + * ttm_pool_drop_backed_up() - Release content of a swapped-out struct ttm_tt
> + * @tt: The struct ttm_tt.
> + *
> + * Release handles with associated content or any remaining pages of
> + * a backed-up struct ttm_tt.
> + */
> +void ttm_pool_drop_backed_up(struct ttm_tt *tt)
> +{
> +	struct ttm_pool_tt_restore *restore;
> +	pgoff_t start_page = 0;
> +
> +	WARN_ON(!ttm_tt_is_backed_up(tt));
> +
> +	restore = tt->restore;
> +
> +	/*
> +	 * Unmap and free any uncommitted restore page.
> +	 * any tt page-array backup entries already read back has
> +	 * been cleared already
> +	 */
> +	if (ttm_pool_restore_valid(restore)) {
> +		dma_addr_t *dma_addr = tt->dma_address ? &restore->first_dma : NULL;
> +
> +		ttm_pool_unmap_and_free(restore->pool, restore->alloced_page,
> +					dma_addr, restore->page_caching);
> +		restore->restored_pages = 1UL << restore->order;
> +	}
> +
> +	/*
> +	 * If a restore is ongoing, part of the tt pages may have a
> +	 * caching different than writeback.
> +	 */
> +	if (restore) {
> +		pgoff_t mid = restore->snapshot_alloc.caching_divide - tt->pages;
> +
> +		start_page = restore->alloced_pages;
> +		WARN_ON(mid > start_page);
> +		/* Pages that might be dma-mapped and non-cached */
> +		ttm_pool_free_range(restore->pool, tt, tt->caching,
> +				    0, mid);
> +		/* Pages that might be dma-mapped but cached */
> +		ttm_pool_free_range(restore->pool, tt, ttm_cached,
> +				    mid, restore->alloced_pages);
> +		kfree(restore);
> +		tt->restore = NULL;
> +	}
> +
> +	ttm_pool_free_range(NULL, tt, ttm_cached, start_page, tt->num_pages);
> +}
> +
> +/**
> + * ttm_pool_backup() - Back up or purge a struct ttm_tt
> + * @pool: The pool used when allocating the struct ttm_tt.
> + * @tt: The struct ttm_tt.
> + * @flags: Flags to govern the backup behaviour.
> + *
> + * Back up or purge a struct ttm_tt. If @purge is true, then
> + * all pages will be freed directly to the system rather than to the pool
> + * they were allocated from, making the function behave similarly to
> + * ttm_pool_free(). If @purge is false the pages will be backed up instead,
> + * exchanged for handles.
> + * A subsequent call to ttm_pool_restore_and_alloc() will then read back the content and
> + * a subsequent call to ttm_pool_drop_backed_up() will drop it.
> + * If backup of a page fails for whatever reason, @ttm will still be
> + * partially backed up, retaining those pages for which backup fails.
> + * In that case, this function can be retried, possibly after freeing up
> + * memory resources.
> + *
> + * Return: Number of pages actually backed up or freed, or negative
> + * error code on error.
> + */
> +long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
> +		     const struct ttm_backup_flags *flags)
> +{
> +	struct ttm_backup *backup = tt->backup;
> +	struct page *page;
> +	unsigned long handle;
> +	gfp_t alloc_gfp;
> +	gfp_t gfp;
> +	int ret = 0;
> +	pgoff_t shrunken = 0;
> +	pgoff_t i, num_pages;
> +
> +	if (WARN_ON(ttm_tt_is_backed_up(tt)))
> +		return -EINVAL;
> +
> +	if ((!ttm_backup_bytes_avail() && !flags->purge) ||
> +	    pool->use_dma_alloc || ttm_tt_is_backed_up(tt))
> +		return -EBUSY;
> +
> +#ifdef CONFIG_X86
> +	/* Anything returned to the system needs to be cached. */
> +	if (tt->caching != ttm_cached)
> +		set_pages_array_wb(tt->pages, tt->num_pages);
> +#endif
> +
> +	if (tt->dma_address || flags->purge) {
> +		for (i = 0; i < tt->num_pages; i += num_pages) {
> +			unsigned int order;
> +
> +			page = tt->pages[i];
> +			if (unlikely(!page)) {
> +				num_pages = 1;
> +				continue;
> +			}
> +
> +			order = ttm_pool_page_order(pool, page);
> +			num_pages = 1UL << order;
> +			if (tt->dma_address)
> +				ttm_pool_unmap(pool, tt->dma_address[i],
> +					       num_pages);
> +			if (flags->purge) {
> +				shrunken += num_pages;
> +				page->private = 0;
> +				__free_pages(page, order);
> +				memset(tt->pages + i, 0,
> +				       num_pages * sizeof(*tt->pages));
> +			}
> +		}
> +	}
> +
> +	if (flags->purge)
> +		return shrunken;
> +
> +	if (pool->use_dma32)
> +		gfp = GFP_DMA32;
> +	else
> +		gfp = GFP_HIGHUSER;
> +
> +	alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN | __GFP_RETRY_MAYFAIL;
> +
> +	for (i = 0; i < tt->num_pages; ++i) {
> +		s64 shandle;
> +
> +		page = tt->pages[i];
> +		if (unlikely(!page))
> +			continue;
> +
> +		ttm_pool_split_for_swap(pool, page);
> +
> +		shandle = ttm_backup_backup_page(backup, page, flags->writeback, i,
> +						 gfp, alloc_gfp);
> +		if (shandle < 0) {
> +			/* We allow partially shrunken tts */
> +			ret = shandle;
> +			break;
> +		}
> +		handle = shandle;
> +		tt->pages[i] = ttm_backup_handle_to_page_ptr(handle);
> +		put_page(page);
> +		shrunken++;
> +	}
> +
> +	return shrunken ? shrunken : ret;
> +}
> +
>  /**
>   * ttm_pool_init - Initialize a pool
>   *
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 3baf215eca23..00b7c28f2329 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -40,6 +40,7 @@
>  #include <drm/drm_cache.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_util.h>
> +#include <drm/ttm/ttm_backup.h>
>  #include <drm/ttm/ttm_bo.h>
>  #include <drm/ttm/ttm_tt.h>
>  
> @@ -158,6 +159,8 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>  	ttm->swap_storage = NULL;
>  	ttm->sg = bo->sg;
>  	ttm->caching = caching;
> +	ttm->restore = NULL;
> +	ttm->backup = NULL;
>  }
>  
>  int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> @@ -182,6 +185,13 @@ void ttm_tt_fini(struct ttm_tt *ttm)
>  		fput(ttm->swap_storage);
>  	ttm->swap_storage = NULL;
>  
> +	if (ttm_tt_is_backed_up(ttm))
> +		ttm_pool_drop_backed_up(ttm);
> +	if (ttm->backup) {
> +		ttm_backup_fini(ttm->backup);
> +		ttm->backup = NULL;
> +	}
> +
>  	if (ttm->pages)
>  		kvfree(ttm->pages);
>  	else
> @@ -253,6 +263,49 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
>  }
>  EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapin);
>  
> +/**
> + * ttm_tt_backup() - Helper to back up a struct ttm_tt.
> + * @bdev: The TTM device.
> + * @tt: The struct ttm_tt.
> + * @flags: Flags that govern the backup behaviour.
> + *
> + * Update the page accounting and call ttm_pool_shrink_tt to free pages
> + * or back them up.
> + *
> + * Return: Number of pages freed or swapped out, or negative error code on
> + * error.
> + */
> +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
> +		   const struct ttm_backup_flags flags)
> +{
> +	long ret;
> +
> +	if (WARN_ON(IS_ERR_OR_NULL(tt->backup)))
> +		return 0;
> +
> +	ret = ttm_pool_backup(&bdev->pool, tt, &flags);
> +	if (ret > 0) {
> +		tt->page_flags &= ~TTM_TT_FLAG_PRIV_POPULATED;
> +		tt->page_flags |= TTM_TT_FLAG_BACKED_UP;
> +	}
> +
> +	return ret;
> +}
> +
> +int ttm_tt_restore(struct ttm_device *bdev, struct ttm_tt *tt,
> +		   const struct ttm_operation_ctx *ctx)
> +{
> +	int ret = ttm_pool_restore_and_alloc(&bdev->pool, tt, ctx);
> +
> +	if (ret)
> +		return ret;
> +
> +	tt->page_flags &= ~TTM_TT_FLAG_BACKED_UP;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(ttm_tt_restore);
> +
>  /**
>   * ttm_tt_swapout - swap out tt object
>   *
> @@ -348,6 +401,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
>  		goto error;
>  
>  	ttm->page_flags |= TTM_TT_FLAG_PRIV_POPULATED;
> +	ttm->page_flags &= ~TTM_TT_FLAG_BACKED_UP;
>  	if (unlikely(ttm->page_flags & TTM_TT_FLAG_SWAPPED)) {
>  		ret = ttm_tt_swapin(ttm);
>  		if (unlikely(ret != 0)) {
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index 160d954a261e..54cd34a6e4c0 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -33,6 +33,7 @@
>  
>  struct device;
>  struct seq_file;
> +struct ttm_backup_flags;
>  struct ttm_operation_ctx;
>  struct ttm_pool;
>  struct ttm_tt;
> @@ -89,6 +90,13 @@ void ttm_pool_fini(struct ttm_pool *pool);
>  
>  int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
>  
> +void ttm_pool_drop_backed_up(struct ttm_tt *tt);
> +
> +long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *ttm,
> +		     const struct ttm_backup_flags *flags);
> +int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
> +			       const struct ttm_operation_ctx *ctx);
> +
>  int ttm_pool_mgr_init(unsigned long num_pages);
>  void ttm_pool_mgr_fini(void);
>  
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 991edafdb2dd..c736c01ac2ca 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -32,11 +32,13 @@
>  #include <drm/ttm/ttm_caching.h>
>  #include <drm/ttm/ttm_kmap_iter.h>
>  
> +struct ttm_backup;
>  struct ttm_device;
>  struct ttm_tt;
>  struct ttm_resource;
>  struct ttm_buffer_object;
>  struct ttm_operation_ctx;
> +struct ttm_pool_tt_restore;
>  
>  /**
>   * struct ttm_tt - This is a structure holding the pages, caching- and aperture
> @@ -85,17 +87,22 @@ struct ttm_tt {
>  	 * fault handling abuses the DMA api a bit and dma_map_attrs can't be
>  	 * used to assure pgprot always matches.
>  	 *
> +	 * TTM_TT_FLAG_BACKED_UP: TTM internal only. This is set if the
> +	 * struct ttm_tt has been (possibly partially) backed up.
> +	 *
>  	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
>  	 * set by TTM after ttm_tt_populate() has successfully returned, and is
>  	 * then unset when TTM calls ttm_tt_unpopulate().
> +	 *
>  	 */
>  #define TTM_TT_FLAG_SWAPPED		BIT(0)
>  #define TTM_TT_FLAG_ZERO_ALLOC		BIT(1)
>  #define TTM_TT_FLAG_EXTERNAL		BIT(2)
>  #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
>  #define TTM_TT_FLAG_DECRYPTED		BIT(4)
> +#define TTM_TT_FLAG_BACKED_UP	        BIT(5)
>  
> -#define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
> +#define TTM_TT_FLAG_PRIV_POPULATED	BIT(6)
>  	uint32_t page_flags;
>  	/** @num_pages: Number of pages in the page array. */
>  	uint32_t num_pages;
> @@ -105,11 +112,20 @@ struct ttm_tt {
>  	dma_addr_t *dma_address;
>  	/** @swap_storage: Pointer to shmem struct file for swap storage. */
>  	struct file *swap_storage;
> +	/**
> +	 * @backup: Pointer to backup struct for backed up tts.
> +	 * Could be unified with @swap_storage. Meanwhile, the driver's
> +	 * ttm_tt_create() callback is responsible for assigning
> +	 * this field.
> +	 */
> +	struct ttm_backup *backup;
>  	/**
>  	 * @caching: The current caching state of the pages, see enum
>  	 * ttm_caching.
>  	 */
>  	enum ttm_caching caching;
> +	/** @restore: Partial restoration from backup state. TTM private */
> +	struct ttm_pool_tt_restore *restore;
>  };
>  
>  /**
> @@ -129,9 +145,38 @@ static inline bool ttm_tt_is_populated(struct ttm_tt *tt)
>  	return tt->page_flags & TTM_TT_FLAG_PRIV_POPULATED;
>  }
>  
> +/**
> + * ttm_tt_is_swapped() - Whether the ttm_tt is swapped out or backed up
> + * @tt: The struct ttm_tt.
> + *
> + * Return: true if swapped or backed up, false otherwise.
> + */
>  static inline bool ttm_tt_is_swapped(const struct ttm_tt *tt)
>  {
> -	return tt->page_flags & TTM_TT_FLAG_SWAPPED;
> +	return tt->page_flags & (TTM_TT_FLAG_SWAPPED | TTM_TT_FLAG_BACKED_UP);
> +}
> +
> +/**
> + * ttm_tt_is_backed_up() - Whether the ttm_tt backed up
> + * @tt: The struct ttm_tt.
> + *
> + * Return: true if swapped or backed up, false otherwise.
> + */
> +static inline bool ttm_tt_is_backed_up(const struct ttm_tt *tt)
> +{
> +	return tt->page_flags & TTM_TT_FLAG_BACKED_UP;
> +}
> +
> +/**
> + * ttm_tt_clear_backed_up() - Clear the ttm_tt backed-up status
> + * @tt: The struct ttm_tt.
> + *
> + * Drivers can use this functionto clear the backed-up status,
> + * for example before destroying or re-validating a purged tt.
> + */
> +static inline void ttm_tt_clear_backed_up(struct ttm_tt *tt)
> +{
> +	tt->page_flags &= ~TTM_TT_FLAG_BACKED_UP;
>  }
>  
>  /**
> @@ -235,6 +280,24 @@ void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages);
>  struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
>  					    struct ttm_tt *tt);
>  unsigned long ttm_tt_pages_limit(void);
> +
> +/**
> + * struct ttm_backup_flags - Flags to govern backup behaviour.
> + * @purge: Free pages without backing up. Bypass pools.
> + * @writeback: Attempt to copy contents directly to swap space, even
> + * if that means blocking on writes to external memory.
> + */
> +struct ttm_backup_flags {
> +	u32 purge : 1;
> +	u32 writeback : 1;
> +};
> +
> +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
> +		   const struct ttm_backup_flags flags);
> +
> +int ttm_tt_restore(struct ttm_device *bdev, struct ttm_tt *tt,
> +		   const struct ttm_operation_ctx *ctx);
> +
>  #if IS_ENABLED(CONFIG_AGP)
>  #include <linux/agp_backend.h>
>  
> -- 
> 2.47.1
> 
