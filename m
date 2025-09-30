Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5C6BACB6F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C9710E599;
	Tue, 30 Sep 2025 11:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TC649S/R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDCD10E597;
 Tue, 30 Sep 2025 11:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759232298; x=1790768298;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rA3c6Kx6gUJ9aEF+pNla4xWt+k73tV3+WH7U7NM8LcU=;
 b=TC649S/Rfb/nCmoTRwhv1Tcp/2vnE8zoP8nHDgzLWNAlkgXdb0S26oXd
 WOnqP1GkjdQdG2cKGpdU5TLgPqeU7llMVi37BO0wtTvdqay/USyfJYH8w
 vcsubjXyi7uAR4bvIYYT85+e6B04ngN2ceGADCBgboK0Y+ZhmnG2kvHlp
 0ARyLj+vebWSF8PLqui6Dg/Xe7LdXHPWeJvunC8nY/NxtLJhoJUWtYQgs
 1HF1wyjK6yCGbiO51U7s50ayfW3/JGgbIQQLSEvUQt2bsRtv1foDtF6OA
 DytCqeXxSq2AWcyZTSoKqvczu5Ib9aJtrlvZYmpvqe0H5ekG+POle3ny4 w==;
X-CSE-ConnectionGUID: dAqP8LglT9CkgvN22Jbs2w==
X-CSE-MsgGUID: I14DNkqqSQCJg1CdObogqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72104725"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="72104725"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 04:38:17 -0700
X-CSE-ConnectionGUID: JZlkDy41RpmmsZwZX9MzdQ==
X-CSE-MsgGUID: rdV4fP4vTEia3lgaZYl81w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178904513"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 04:38:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 04:38:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 04:38:16 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.24)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 04:38:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gadpzFeTzuzqDPMUNOwrjyDJeFqjjQuc/MAMXE7e2SdbhhbkbiXlDLi9tFDA4cJ373S1g6U53lZcICbi1rCOD7yz8B7zJDW/xpPyLNjY93GDEko4Qfc0mwSyl01zi9nx1ykURIaQoHP89Qoz6fGxCOulFpGIDtZyROwKuAvLZBeH71KQWYT665zMwmSayoF1l29ZLlF1BEHjD867R9orfnutPC+UJfdgLxoHvEvzcY+EIOMNkIfFG9JYUbyS/cVmH2OwbYemyMq59Zmja3JWJ81JpZnxhBz1EMNl8VFOu0hfs3iI5HNPJDrNPZWBInOO0+NBx9lbIlJBfpqQkeT9Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCM1RAYsOMIHDVX8QE4NH2kKhQSAjBXXl1n8DCrlVuU=;
 b=pKGbpaxT1TAXLzFw01D6fA2gKmKwjC145hRsCvdwPms395xwlqWLPOEiCDmh5rURuBMqQ5ePvWqI/3tC415QVKSWd4Oee7t4W3akFzSha6zoQ9DYPlb8FEs1hA9xFsYgYrmCkiuTBqmiXsfVMyn1kwTYI/JCLt/9UKtl5Xj/Z06uRsJh6PDh1FuBj9W3j9q3es6/BwQ0EJpDikVUtx3zyTrxdx5rlqhAzw3jvtd3SRp0jMQrQhH1F855nwGbdHoQNFPennOMZz6zf/SQZyGT5+EwfEYpW1PHAh+z6RUK3rO/didsHMDKyko66H+pAMnOfEegPMkrxCinSgohuhNchQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SA1PR11MB8521.namprd11.prod.outlook.com (2603:10b6:806:3ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 30 Sep
 2025 11:38:15 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 11:38:14 +0000
Date: Tue, 30 Sep 2025 14:38:09 +0300
From: Imre Deak <imre.deak@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 2/6] drm/dp: Add helpers to query the branch DSC max
 throughput/line-width
Message-ID: <aNvBIdJbaCBzKVt_@ideak-desk>
References: <20250926211236.474043-3-imre.deak@intel.com>
 <20250929063644.533890-1-imre.deak@intel.com>
 <agzmuyty22gxtm7cwpdl7ynmrubot45e65tfavbq5muamn6qnj@2wsbjqlc3pye>
 <aNpbCWlluJfsjSE6@ideak-desk>
 <6qj46wruaj5k2ywepsrkzfyyq4bsvcfmg7jhvrk4w2jkhcyorg@llo7bzmlarre>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6qj46wruaj5k2ywepsrkzfyyq4bsvcfmg7jhvrk4w2jkhcyorg@llo7bzmlarre>
X-ClientProxiedBy: LO4P123CA0322.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::21) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SA1PR11MB8521:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bcc62e9-23d3-48cc-0895-08de0015d7c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?QmBTnYX0UrODlHNGAWTQOswI6NE6xZfT+bYWXPp8SLYXx4n/cReduFrkKb?=
 =?iso-8859-1?Q?j40x5MHQmrBgJMbJjpZJXv0GwkXgDltldXtp27CyhXX1FN+fgViMRhgKuL?=
 =?iso-8859-1?Q?pUoiBTfxYw3rfTLoRUWGxJuUbrWJtHxKihR+Ei7il8BUPPDIOru/SZYAcY?=
 =?iso-8859-1?Q?fgS6RBgbOseJKe6k5nlVXYlnuXjOaf7DSEE84g8abL50o7KNmAzZ6ZxCWU?=
 =?iso-8859-1?Q?BDwE0+esOzBqZsUf9zw1KLd4UgeCNhvqXK6aiLjaBX7CcmtlM2GMEFYcxR?=
 =?iso-8859-1?Q?+jMP25bzToKATyX0y+jWCq2r65U78u5THdd6aT2IFkQ+XSGtH4IyOLRhIX?=
 =?iso-8859-1?Q?B4P8uoFH/8+tPKRzEmjiU5VjucwyTNYZem2fhDdHHyKiRRc8astgl+g/cp?=
 =?iso-8859-1?Q?JiTNW8ukHF2on2k3nNsUKbpEBGuvkluNDn/MGSzso69lngimDOT/xvHvgV?=
 =?iso-8859-1?Q?WSPg/bnEa6NvH5elGHIyBDFFUvwGfGDnhL4adGTHOp4yBjFois64KjiI3y?=
 =?iso-8859-1?Q?+L3VjryMIPyrZTIyAPGUOZ03FeXdkIdn0wwJR9e8CcxyUcVcCh8yi+hbgo?=
 =?iso-8859-1?Q?HG++UAowc7Nar+qW1tSecKVPvnuvY+jJqoSr7zXSElpXj5xf3PpLI0nvmO?=
 =?iso-8859-1?Q?DuA0OcTGPucYJ4FNvbqxZ5+/qxkbcnB26n2ywWt5v8avabFNTJ28m6r1U/?=
 =?iso-8859-1?Q?+tt8kgX8JmA49Ro7n0fNU4uVnXoTSd3pKZBJwLcS9OXVHogeuUtUOW8L/U?=
 =?iso-8859-1?Q?fDgWt6qNLBDcpCJlj5vLkdnP3FuwO6pGYvq4FKTT9/DbWHfw/IYYrxwRLH?=
 =?iso-8859-1?Q?4QNDEhXmumay/zBjNTXOUJ4nMOq6tfhm5E25G/HtWQrv5QpmzLRHo6Ctut?=
 =?iso-8859-1?Q?WqLLCDfLYvLXkI/wi/GrgwBRI9oURIc2MbG162OEn8C7I/c7E83hCnMF6P?=
 =?iso-8859-1?Q?Nxc4tk+HHArFlphAst73I5Q95HJ8zqWf8b4iWLOUBzbQwas7sSA2fWQg6y?=
 =?iso-8859-1?Q?fruZbFoRkBlqy7rcJhhICaBVryVI7ZpnFnY9rnUmCDbWh7YmABGpSrUlmf?=
 =?iso-8859-1?Q?RJOgW5QmVBETf/9boZ8KEadAJWhUL4KltD7rRQFBL37+dg+lLfk33jUGU9?=
 =?iso-8859-1?Q?B+fGhPUC1weG21Rwep22Yld3myfXTzXrdufhBoYwFyptU3KDke0hJqA625?=
 =?iso-8859-1?Q?LBlV+cLkSZwHbA51x0gUge92L4gW7opCF960dstooC8ZVh1/Akn+Lx+Uvr?=
 =?iso-8859-1?Q?UZjz3NE3JdU7eUOW+JSg+QcdbQFc8pTyt0JpCwDYuWvxJlBMoBeXDV9mcX?=
 =?iso-8859-1?Q?E0/THxSN5qyQPR8y/WYMYTZk9fKQPETVF8FW48ySzcVHJck2hLguQCG0FQ?=
 =?iso-8859-1?Q?Zs8hSJhJ/LODedOLKBgiCOHyHGC9VKSNEZ4ed8XRFiNpXehWq3hZpWaarP?=
 =?iso-8859-1?Q?IsEL+Bvf0h/cVOv/x9aph+BvCj9/vLMNyZpfx1SzjpfY0ogncMTUp8tWHl?=
 =?iso-8859-1?Q?v3+IEdyIXGKwguoFQH3XRX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+c7PVwDT11/SVOQp/+lulm8p4rgs4aKmDQwuJd0kLMYw7rqlj+BXB60y3L?=
 =?iso-8859-1?Q?VmIOIOD80cO9X0gBu7YI+7nQOR28WD5PLXt+qxv7bYL7TxQCtKIWCb2mZE?=
 =?iso-8859-1?Q?zucs7UQ/UkGfyJlrEZq7PbQ5/aNxVOypwL3eA2nHS+H0ct0PkUnowTjqa2?=
 =?iso-8859-1?Q?J4a+YQRSgk5Un3lewJzpdr7015l6+MGIOoYhr+RvYkBRSmxgADfxMtRnAn?=
 =?iso-8859-1?Q?UqUrBeaWCQLNTOAwmaP/pJlZqHdJ6hetkCNeZd0qThEVmmvov9HUz3R/Ou?=
 =?iso-8859-1?Q?DjgYwbpWenc1lGVKAr2yS5aCHUFlgd7W+B5wcFymC3UuK+w/Uhhxr/6vlh?=
 =?iso-8859-1?Q?lFkVt8GKtBhhh4oH3mJx6VfIHWCC2R2YikrVmzdb2zmIHO6gZbyl7oVoUr?=
 =?iso-8859-1?Q?iqfdAAz5fQ5fKhV9vrT52b+36W2BZGX6bM9YhnbZ4F67a5xD6bj0jy6J3y?=
 =?iso-8859-1?Q?VsJ3mgIAL9pdKv+QPG1w7Dal7yFcHiYsVlps2WX3ouXZT+XBkocMFxM8Hk?=
 =?iso-8859-1?Q?dQXTRklHljOtIQlbAu7rH51S2epu8kz+9fOexzfpiCkfKpc10AgRpxiZ2x?=
 =?iso-8859-1?Q?VhpM60JF0S0nmnE5sQqatQvgp0EPQgsKl8WJi1LYMdDxapFSH2EU3EhsC6?=
 =?iso-8859-1?Q?KJwcFp+yCwuXIq+d346h8UhzCl/KGFKHYg/LWbqlFEZldPo9mjEXBIlbGC?=
 =?iso-8859-1?Q?1/0QZuEE6YVyVB3pU3jeoFkaeVEOh6T+xV308k7F3pCSq8ngsFBLrg61MA?=
 =?iso-8859-1?Q?HqZ+Ivj1DWkuWpl/nVz0tznuZgymEBpb384ji6gUtAeGP9mEjwJJE5z2KJ?=
 =?iso-8859-1?Q?jcSuxHnrHl433zDQRdgOfua7iHuHy42tMXlZXShKPiEmGy5ZSgGnVZY4lR?=
 =?iso-8859-1?Q?g1cZeNDjbhX4+gVmndBNreMOY8v8e6aNoUAqiy19qF2U28CQcZCDhEGwl5?=
 =?iso-8859-1?Q?2eIAiVfOfWSEs5YhEpaJg/BVAS1X1gn3GQZBUTFYvKyjpSohbVehh5wIBr?=
 =?iso-8859-1?Q?2lDIAImeIZke5FnV9YY4mMfmZW774/wdc7M04+6IkHeqMzqpnUaWSnZdO3?=
 =?iso-8859-1?Q?mCdVgrrGo7PtSSGIZZL6L/0tQm3oBsNW93SjTtVVPrN5TUYy4OB1O+9UIJ?=
 =?iso-8859-1?Q?hVENCX91pcuEGE/2S4eZs20nyor45YQYIYYQocjKyjA3l8PSKLrpDse57O?=
 =?iso-8859-1?Q?q010xgc4t03DhPGl4F8ZhZBB6U5CmGfyii74Mv/r+tWLG38NPCIzFUBe90?=
 =?iso-8859-1?Q?lI2tqDRMVNHIaf0ltV3Sc3StcFyRpbR0pLfTnHe1bmDh5JECnweMeotlAF?=
 =?iso-8859-1?Q?zUaqXpjZahZ8tXsjiNnBkzftTk613GgJUZWSPiLHtU/1jLrpwdP69C5DQP?=
 =?iso-8859-1?Q?gvsLFUeuo8YW0z2jX4nFeeSu/Ryt5YCE/L9c32axYN88hV1vxJW0pCfrgZ?=
 =?iso-8859-1?Q?4grYjKletjXO2Ymq0vHnRqQZkYUBHL2gewr7y012ZFXN6TA67GU5VXM4v7?=
 =?iso-8859-1?Q?8egKcEP57s7o+G5vi1tz5XlMctPdVpyMxQLvrkyaVfFpZlgAeEVbzhpqRW?=
 =?iso-8859-1?Q?vVNuIsmDOoEV9JSXuWA8WLpb7e9NPfc/Jb0lWYSMeCmmFLnASEsL75c/fu?=
 =?iso-8859-1?Q?q4fT31ipSudR/d75rhej27p8XjhkcSK11GRKVfBj8752pLNHLIMMoLqQJ5?=
 =?iso-8859-1?Q?G5glte6hlRMUnKRFSh0UN1iHF9n62Ubg+gnMiSJv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bcc62e9-23d3-48cc-0895-08de0015d7c9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 11:38:14.9256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wuu6dVvyGR6LQeknVfl55WICMCIYpWolPP0J7JwW/IftWyy1Vs+nHvpEm+g3xCw1JLaLUaGz3Ou/Ete4Py8XGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8521
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 30, 2025 at 08:30:10AM +0300, Dmitry Baryshkov wrote:
> On Mon, Sep 29, 2025 at 01:10:17PM +0300, Imre Deak wrote:
> > On Mon, Sep 29, 2025 at 12:00:03PM +0300, Dmitry Baryshkov wrote:
> > > On Mon, Sep 29, 2025 at 09:36:44AM +0300, Imre Deak wrote:
> > > > Add helpers to query the DP DSC sink device's per-slice throughput as
> > > > well as a DSC branch device's overall throughput and line-width
> > > > capabilities.
> > > > 
> > > > v2 (Ville):
> > > > - Rename pixel_clock to peak_pixel_rate, document what the value means
> > > >   in case of MST tiled displays.
> > > > - Fix name of drm_dp_dsc_branch_max_slice_throughput() to
> > > >   drm_dp_dsc_sink_max_slice_throughput().
> > > > v3:
> > > > - Fix the DSC branch device minimum valid line width value from 2560
> > > >   to 5120 pixels.
> > > > - Fix drm_dp_dsc_sink_max_slice_throughput()'s pixel_clock parameter
> > > >   name to peak_pixel_rate in header file.
> > > > - Add handling for throughput mode 0 granular delta, defined by DP
> > > >   Standard v2.1a.
> > > 
> > > This one got sent as a separate V5, without a proper changelog. What has
> > > changed?
> > 
> > This is v3 of the patch, the changes are listed under v3. The patchset's
> > version is v5.
>
> Ugh. How one does relate this v3 (which is not mentioned anywhere) and
> v5 of the series? This is totally counterintuitive. A usual
> recommendation is to send the full series and to send it as a new
> thread, sending all the patches in one go.

It's a common practice on intel-gfx to send a new version of one patch
on top of the last patchset version in that patchset's thread. For
matching the patch version to the patchset version I can change the
patch version log above to be like:

v2 (Ville):
- Rename pixel_clock to peak_pixel_rate ...
v3-v4:
- No changes
v5:
- Fix the DSC branch device minimum valid line width value ...

> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/display/drm_dp_helper.c | 156 ++++++++++++++++++++++++
> > > >  include/drm/display/drm_dp.h            |   3 +
> > > >  include/drm/display/drm_dp_helper.h     |   5 +
> > > >  3 files changed, 164 insertions(+)
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry
