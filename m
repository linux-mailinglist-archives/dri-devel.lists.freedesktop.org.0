Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEC0A3C654
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 18:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB33E10E86F;
	Wed, 19 Feb 2025 17:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q6wz0FZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E1A10E86A;
 Wed, 19 Feb 2025 17:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739986705; x=1771522705;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RP5rZKK7tV+ymFzz1xHGNbEQefGjR8pc8iSuoHQkjeg=;
 b=Q6wz0FZOexXpkJrTpj9eYCg0Npw06YS9KM+FbAATRdTF9OHX5EHU6aty
 F9CKnO4YCp9cTWJ7UCec77sN3vp03/tmXxbb0VATX4kWYSkOtu6v+297A
 zMDr/by80/odtJIWYimLATdMb6NwiwgyeThndrDhfoYZCRdTbGHf5/K7/
 RkFp5xSruOmLNFS7tVMXoWga2KQIRAlGTkBl6iDYDATS/988Y9DUOGvj1
 3l0E6iiHzriylxC0LezsZ+NiSHaeQjVNQ0ayWTT0flW7W0k4hlTY/0n51
 dDVl5QRlnML20IlbGaqV3zeknTDqYSZ3JsrHq2F8DQmX0pt5bThzxY4kC Q==;
X-CSE-ConnectionGUID: HP241o/pRMaKHn7qtN6yYw==
X-CSE-MsgGUID: y3lnkahMSf+WWkzg0E8UgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="50952080"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="50952080"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 09:38:23 -0800
X-CSE-ConnectionGUID: YZbR4ziARUK1JG2VIZp1ew==
X-CSE-MsgGUID: 2jaqlbcyR666kq6xCn7TxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="119708516"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 09:38:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 19 Feb 2025 09:38:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Feb 2025 09:38:16 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 09:38:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dEbSGrZS3obOUmt/MIP2NKTvpW44DyOHwIvcTFclurPqnfr5MAQvRofJnTV0/cZ0c4d9obZnwJsiFU4KXKGfQEiRwBALIE5MqFPmt/QVGbcvvUpxQEg1bZbqp2q+dC7v1LrkDf1DcupNtAeBEaEa9TmiP5wXarC17QUx+tZY5wI32lwsyKHiKxhiqX428DeGkA5h/LJ8u9KC4tl2Zeot4Lir58s+fcOq2hV/vxcVnb2lVCX7oaXqspzM//0dLZBtPdNE2rztdccJbHq2y76A6lTWkA4bObTHxmcQHkAtI78wnKK2z+Qx+nDJOMN7oDT63xt37kjzTtCJJ/jmzmd5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0q0DBHliu45p6I+e60vzWyIJ2nNtcv494nEUgOAY80=;
 b=w7tBuj1BZT06wQ0ANk/LEF4YLSmQpIQ46YUTpSID5nNKg3GakHrP3CWp5HZ6tEk917Rg9WafC6g/qYTO8POCU6oF6I22xFC3gB+HoZxfgtUnGY7vfNxaI7UP4qDVWywls+VNyUnpyKwMTzRNpOguuEvbyehU2mNTn8kO9dJw/MdXyoXoZFcRG3800wkVOPqyOyyAseI3YT7cqfARvFUgomhdhiMQ0Xs9xSAycc6zAlLr4YBPhRfttE9V+XQ5OpD8y+zRkcjSludNpwVVCSAsiy7mhHuPAPov239ip6Ru9mGgvl8aPULLGy3pukrwgME7uKKEbWOglS1TuyS7FXD1Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4942.namprd11.prod.outlook.com (2603:10b6:a03:2ac::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 19 Feb
 2025 17:37:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 17:37:50 +0000
Date: Wed, 19 Feb 2025 09:38:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v5 27/32] drm/xe: Add SVM VRAM migration
Message-ID: <Z7YXLPmJhSTBGqCc@lstrano-desk.jf.intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-28-matthew.brost@intel.com>
 <55808e272d7d8e9302912f236c249fea11422061.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55808e272d7d8e9302912f236c249fea11422061.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:303:b5::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4942:EE_
X-MS-Office365-Filtering-Correlation-Id: dd7630a4-8230-4946-1376-08dd510c21c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?jgl54QRTMK5dgotywFhciiC1qeprwYCkMTtsT84XzCA/iWosL9EeGot8AV?=
 =?iso-8859-1?Q?13QH/yt5yKfUamUGzb8RmkvcNw6UnZpIVtt9bSDRLo4JA6Y8FdAmkH2WoH?=
 =?iso-8859-1?Q?coz2P6n8f0w/MmC6RgkGqrBOQVeH37xf9VXCu2eNQtaglsP/9gAM1NrJSh?=
 =?iso-8859-1?Q?nbT0ZMyzsjkATJRAg8XOrvRAhHhc9Eqr5x9BKIFXbsTegCOlLPDKBphlsR?=
 =?iso-8859-1?Q?SN2Zxy4EE01TJ57kEgoxdxx7fmnV/zh0eUDomn6Y5oslKJCwkJrsL2bMgy?=
 =?iso-8859-1?Q?EXyBGtgRJyADbz3EzaOxxh9t1nBL4cxac2OhmqM0mxvB8mZU2c76wynp7x?=
 =?iso-8859-1?Q?TCgYLHejQS2Ywmfstmhe9jk3k27umcz08aaS7BvJMqA5V8I94nx0XQW64h?=
 =?iso-8859-1?Q?3yjiM3oyL9dZs16UUqt7v4YkTjNRaThsSWazaxIQTch+EGwtCc0lsyZG3b?=
 =?iso-8859-1?Q?iKE5/qMVR9uZwJkhtTOEn/mssj9ZNX/HJ3Nbxb2I6mwUMoLACqKhrPkvnr?=
 =?iso-8859-1?Q?T1jZIKdadgmLgqjodp6wUPNE2AmB1wrt728t/dTAoGHsROJCcZTi86hs+Y?=
 =?iso-8859-1?Q?PRMXX6oUaBvp3CZsydJCGbXAaJhL+gGrtU6xidotEixRcgJKaMR66RMEdR?=
 =?iso-8859-1?Q?gJcT7jjhOhdBo2XZVRP72nVHBQlKRUVH1UNtWMaM7J4b3GazcAGUihlcc0?=
 =?iso-8859-1?Q?tQu5GTXr7wFnf4d8HXt7sJMNJe1HqJk5fbB5EOX5fanUKV5hfDj6iqsOEw?=
 =?iso-8859-1?Q?xCyZztBK1Eyi9acf/h+kYwH0FpNR2yy1a3GIJFbKPpmtklKf7jYzYFKBPw?=
 =?iso-8859-1?Q?Jqggj+CImGDTLcLzrcNkT1E5PNDu2l7hUN8ILoffjGIpBZl2GJ6S43GIv3?=
 =?iso-8859-1?Q?5023Yo/6bb31+ybGnCCX5i3V4LnRFGRfFrv+aJrB2sLrov8R3qtybzb6kU?=
 =?iso-8859-1?Q?o+FgUYzaF0GX2yg25QogSP9vHfQHygFYDTj5giGi5FKc0KTGRGkOlKa4ll?=
 =?iso-8859-1?Q?0IYPCAceis5h8Ln9HjBL3CXhDZw67xq6kN60RMYBBVBO3K2f7yyYahS3L+?=
 =?iso-8859-1?Q?NgTgvheigFENuoGJSZxk/7YrW+1cISg/pTr3bvnzCE5NcSJrmMZm1EwJDC?=
 =?iso-8859-1?Q?S+LYplml3+68xKeEvizTLcA7VAY1SUEY3WIm2cKQCiR6oJ+GTPnamYqVev?=
 =?iso-8859-1?Q?IEB0/JfeHm2cGrUmjSmLiaTgeFrrc56Qqf8pRBHy9dWrBaxWKl1q/WgZw9?=
 =?iso-8859-1?Q?4lDvNqErM2L/dj/iuVsfgvjaZk+5jPTHtFuTXK7PjCJum1q5y7ec1lm3Nf?=
 =?iso-8859-1?Q?43xjCvub6ntNhFKtHcyXed1XV56lELZWfRyHhpln/SXq3BC/5Vo9ilFreN?=
 =?iso-8859-1?Q?hkx9wggDhHA3FGwFctjS7LGX3pVmI8UA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DJloKh9flMVkgkC+YQSmvK/RD6xeYAriAV7f9ScyzQMcd1NZe9TnP3KpV1?=
 =?iso-8859-1?Q?CcNsJbB8iNP6dUABPUqMl9YhXs/oDNac0JFgzYR30iA/Q45m/i8fxmQP5K?=
 =?iso-8859-1?Q?44P0mcisSmRPUWWq1Lb1qNQW3P4HZZq3PFHHfoNdAQfTJG+hOuwF1JPwSB?=
 =?iso-8859-1?Q?Zf4DGImtW9BoyoAqjDH6zVAD1NYAjbBT6Mq2qU5M00De1Fm/yI1iBHs+Ly?=
 =?iso-8859-1?Q?lSQkBRtl3GIcSsV8I6Wz3HqUcf6BpjCCOyruqipB/MWHZjTrPW/CHORNsu?=
 =?iso-8859-1?Q?GJvfJa5SQuUQMB5FU76cDMGHMNWsnkxjicQE2RvSIBpKzd6zcS7QYOtMmV?=
 =?iso-8859-1?Q?dWi1t92VMsZH+9+vYdc9wXiecRSJreDIqXoUzLLWE4CM/Br/U/ZXDNc5sI?=
 =?iso-8859-1?Q?RhBvbuadz5NQXu3LsycUhaF5WSHWdkjVdP2MYhdW7iE5gKOZyO7C8ALfIV?=
 =?iso-8859-1?Q?5iOnYHQRYxm4RgC5GEctCb9SbgoZ4qPSQBGcAgZJpnnYsbad4ABJygdZi8?=
 =?iso-8859-1?Q?C8Yg1hQiDAqxlkBrFvks/holQpeIHdtmiD7FBnN8n3PqvD6aUvTwUC2NwX?=
 =?iso-8859-1?Q?AsYO1+qGMuTEBhL1RwGBXSJaMHNsPAkafHh1j6FvG0r2Mj6VShGXaZ03XE?=
 =?iso-8859-1?Q?mJe3Bl672xaqpp/3kdRaV7hIZab+bzkrwsFpWC0HvHThzWa35WdKKA5qzJ?=
 =?iso-8859-1?Q?hVGfhclCun1abWmRVKzFYO2KipEVnNrYYgrqm8AcNn4fb63YHajprhyZJ6?=
 =?iso-8859-1?Q?Dij7wsWivCx+oAnTVmHvIdmNtBsDkX66g7MX1OONJlGBEJBfeko74/ijzR?=
 =?iso-8859-1?Q?OhhWSKbwELVyRGfZ7NLlchbUTyFaMYK572xy+kkMVzMVnB1dGT3YOG5Z6p?=
 =?iso-8859-1?Q?ikl7AYFraAEkgKw28G8MIsXukVKE/U57PzTFIqUg+3Hu7e8dzI/ljOFcT6?=
 =?iso-8859-1?Q?zmdC+ySzRq3e5uIIV5wCs4w+qKPDsFfcccRZezY7a3NhN91JuqXZ0urmsa?=
 =?iso-8859-1?Q?5DgRWwwJo3SsfqcyUB4qzevC7wD9uNyWkeFlXAM3pVt8/+ZEetEqBykGWM?=
 =?iso-8859-1?Q?WSzQmIJMcE2mFoPbxof6LkH07Smo18eae1oC76kSseNw6K/i4zkVcQQD56?=
 =?iso-8859-1?Q?pTJO7rWt43+lBbn8Ue45YRnmvHW2WigrxfMmiOBa0bXzSwr2st3vFtGTVD?=
 =?iso-8859-1?Q?Txab1G6E47jPeh/iwNp3tPORaZ9FnznIaoc7n9iroB+C8nVa72GDDxsWdy?=
 =?iso-8859-1?Q?jRiF5MtTc4j7bmTcKxeGal0JIUaKTTBAes0mj6rIpn1V9qGrIyUFPQpBtj?=
 =?iso-8859-1?Q?Krt5ROsvloRmhinyNM52o2Iv2g+eQf1p8NWo3gGs6nInFrnSspLVtKVB8n?=
 =?iso-8859-1?Q?6IG/uQcuQbbYaTafimK86Pi/Bfy+jo1ES9wFUxg7Ec+GHWuo1ysHqLt4WH?=
 =?iso-8859-1?Q?dfnoKOORFdV4PuX6iUDilQpI8OIFyfGd51KYviYb7pSVw8pMMAzwCnUEh4?=
 =?iso-8859-1?Q?jMdvRMp0Bg2jm9FC1up97D41Qs10t+SGEzAzEkPVJqnY8FoCXDNdTBBfdh?=
 =?iso-8859-1?Q?I8ivJdSejOLDvVBNjAhP4nAOTeXCMVJevqTzijwME2YDifTBEsoHauWFV0?=
 =?iso-8859-1?Q?ETQ57/Io3KkEYSQALINANk+KS+rr8kmyEOP2LC9vXeBVWTkuzpUbcszA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7630a4-8230-4946-1376-08dd510c21c3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 17:37:50.5986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHVM7rKfxTl9rTb+t5kC3w+pkpGhQjYbj6lJK3HA87EEBkYE5h4cfzocnzPvzf7m5uxKyYYUqqOkHSYZD57sHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4942
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

On Wed, Feb 19, 2025 at 11:30:31AM +0100, Thomas Hellström wrote:
> On Wed, 2025-02-12 at 18:11 -0800, Matthew Brost wrote:
> > Migration is implemented with range granularity, with VRAM backing
> > being
> > a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of
> > the
> > TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
> > SVM range is migrated to SRAM, the TTM BO is destroyed).
> > 
> > The design choice for using TTM BO for VRAM backing store, as opposed
> > to
> > direct buddy allocation, is as follows:
> > 
> > - DRM buddy allocations are not at page granularity, offering no
> >   advantage over a BO.
> > - Unified eviction is required (SVM VRAM and TTM BOs need to be able
> > to
> >   evict each other).
> > - For exhaustive eviction [1], SVM VRAM allocations will almost
> > certainly
> >   require a dma-resv.
> > - Likely allocation size is 2M which makes of size of BO (872)
> >   acceptable per allocation (872 / 2M == .0004158).
> > 
> > With this, using TTM BO for VRAM backing store seems to be an obvious
> > choice as it allows leveraging of the TTM eviction code.
> > 
> > Current migration policy is migrate any SVM range greater than or
> > equal
> > to 64k once.
> > 
> > [1] https://patchwork.freedesktop.org/series/133643/
> > 
> > v2:
> >  - Rebase on latest GPU SVM
> >  - Retry page fault on get pages returning mixed allocation
> >  - Use drm_gpusvm_devmem
> > v3:
> >  - Use new BO flags
> >  - New range structure (Thomas)
> >  - Hide migration behind Kconfig
> >  - Kernel doc (Thomas)
> >  - Use check_pages_threshold
> > v4:
> >  - Don't evict partial unmaps in garbage collector (Thomas)
> >  - Use %pe to print errors (Thomas)
> >  - Use %p to print pointers (Thomas)
> > v5:
> >  - Use range size helper (Thomas)
> >  - Make BO external (Thomas)
> >  - Set tile to NULL for BO creation (Thomas)
> >  - Drop BO mirror flag (Thomas)
> >  - Hold BO dma-resv lock across migration (Auld, Thomas)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_svm.c | 111
> > ++++++++++++++++++++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_svm.h |   5 ++
> >  2 files changed, 112 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 0a78a838508c..2e1e0f31c1a8 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -32,6 +32,11 @@ static unsigned long xe_svm_range_end(struct
> > xe_svm_range *range)
> >  	return drm_gpusvm_range_end(&range->base);
> >  }
> >  
> > +static unsigned long xe_svm_range_size(struct xe_svm_range *range)
> > +{
> > +	return drm_gpusvm_range_size(&range->base);
> > +}
> > +
> >  static void *xe_svm_devm_owner(struct xe_device *xe)
> >  {
> >  	return xe;
> > @@ -512,7 +517,6 @@ static int xe_svm_populate_devmem_pfn(struct
> > drm_gpusvm_devmem *devmem_allocatio
> >  	return 0;
> >  }
> >  
> > -__maybe_unused
> >  static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
> >  	.devmem_release = xe_svm_devmem_release,
> >  	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
> > @@ -592,6 +596,71 @@ static bool xe_svm_range_is_valid(struct
> > xe_svm_range *range,
> >  	return (range->tile_present & ~range->tile_invalidated) &
> > BIT(tile->id);
> >  }
> >  
> > +static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
> > +{
> > +	return &tile->mem.vram;
> > +}
> > +
> > +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct
> > xe_tile *tile,
> > +				       struct xe_svm_range *range,
> > +				       const struct drm_gpusvm_ctx
> > *ctx)
> > +{
> > +	struct mm_struct *mm = vm->svm.gpusvm.mm;
> > +	struct xe_vram_region *vr = tile_to_vr(tile);
> > +	struct drm_buddy_block *block;
> > +	struct list_head *blocks;
> > +	struct xe_bo *bo;
> > +	ktime_t end = 0;
> > +	int err;
> > +
> > +	if (!mmget_not_zero(mm))
> > +		return ERR_PTR(-EFAULT);
> > +	mmap_read_lock(mm);
> > +
> > +retry:
> > +	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
> > +				 xe_svm_range_size(range),
> > +				 ttm_bo_type_device,
> > +				 XE_BO_FLAG_VRAM_IF_DGFX(tile));
> > +	if (IS_ERR(bo)) {
> > +		err = PTR_ERR(bo);
> > +		if (xe_vm_validate_should_retry(NULL, err, &end))
> > +			goto retry;
> > +		goto unlock;
> > +	}
> > +
> > +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> > +			       vm->xe->drm.dev, mm,
> > +			       &gpusvm_devmem_ops,
> > +			       &tile->mem.vram.dpagemap,
> > +			       xe_svm_range_size(range));
> 
> The way this is done now looks good, although the corresponding multi-
> device commit
> 
> https://gitlab.freedesktop.org/thomash/kernel/-/commit/1f204b5d05896e5cf63ab54a679ee343e76600ff
> 
> Goes one step further and removes the bo return of this function to
> favor an int error code. The caller doesn't really use the bo, right?
> 

No it does not. I was ref counting the BO in prior revs where the bind
code using a hack to look at the BO to get physical VRAM address. This
is gone so dropping the ref counting and returning an error should work.

> > +
> > +	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
> > >blocks;
> > +	list_for_each_entry(block, blocks, link)
> > +		block->private = vr;
> > +
> > +	/*
> > +	 * Take ref because as soon as drm_gpusvm_migrate_to_devmem
> > succeeds the
> > +	 * creation ref can be dropped upon CPU fault or unmap.
> > +	 */
> > +	xe_bo_get(bo);
> > +
> > +	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range-
> > >base,
> > +					   &bo->devmem_allocation,
> > ctx);
> > +	xe_bo_unlock(bo);
> > +	if (err) {
> > +		xe_bo_put(bo);	/* Local ref */
> > +		xe_bo_put(bo);	/* Creation ref */
> 
> Strictly, with the drm_gpusvm_devmem_init() succeeding, this bo put
> should be an xe_svm_devmem_release(), right? While equivalent here, if
> devmem_init moving forward sets up other resources that are expected to
> be released at devmem_release time, they'd be leaked.
> 

We only call 'zdd->devmem_allocation = devmem_allocation' upon success
of drm_gpusvm_migrate_to_devmem. So if drm_gpusvm_migrate_to_devmem
fails we need to drop the creation ref. See above, the local ref can be
droppped when converting this function to return an error code.

> > +		bo = ERR_PTR(err);
> > +	}
> > +
> > +unlock:
> > +	mmap_read_unlock(mm);
> > +	mmput(mm);
> > +
> > +	return bo;
> > +}
> > +
> >  /**
> >   * xe_svm_handle_pagefault() - SVM handle page fault
> >   * @vm: The VM.
> > @@ -600,7 +669,8 @@ static bool xe_svm_range_is_valid(struct
> > xe_svm_range *range,
> >   * @fault_addr: The GPU fault address.
> >   * @atomic: The fault atomic access bit.
> >   *
> > - * Create GPU bindings for a SVM page fault.
> > + * Create GPU bindings for a SVM page fault. Optionally migrate to
> > device
> > + * memory.
> >   *
> >   * Return: 0 on success, negative error code on error.
> >   */
> > @@ -608,11 +678,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  			    struct xe_tile *tile, u64 fault_addr,
> >  			    bool atomic)
> >  {
> > -	struct drm_gpusvm_ctx ctx = { .read_only =
> > xe_vma_read_only(vma), };
> > +	struct drm_gpusvm_ctx ctx = {
> > +		.read_only = xe_vma_read_only(vma),
> > +		.devmem_possible = IS_DGFX(vm->xe) &&
> > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > +		.check_pages_threshold = IS_DGFX(vm->xe) &&
> > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> > SZ_64K : 0,
> > +	};
> >  	struct xe_svm_range *range;
> >  	struct drm_gpusvm_range *r;
> >  	struct drm_exec exec;
> >  	struct dma_fence *fence;
> > +	struct xe_bo *bo = NULL;
> >  	ktime_t end = 0;
> >  	int err;
> >  
> > @@ -620,6 +697,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
> >  
> >  retry:
> > +	xe_bo_put(bo);
> > +	bo = NULL;
> > +
> >  	/* Always process UNMAPs first so view SVM ranges is current
> > */
> >  	err = xe_svm_garbage_collector(vm);
> >  	if (err)
> > @@ -635,9 +715,31 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	if (xe_svm_range_is_valid(range, tile))
> >  		return 0;
> >  
> > +	/* XXX: Add migration policy, for now migrate range once */
> > +	if (!range->migrated && range->base.flags.migrate_devmem &&
> > +	    xe_svm_range_size(range) >= SZ_64K) {
> > +		range->migrated = true;
> > +
> > +		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
> > +		if (IS_ERR(bo)) {
> > +			drm_info(&vm->xe->drm,
> > +				 "VRAM allocation failed, falling
> > back to retrying, asid=%u, errno %pe\n",
> > +				 vm->usm.asid, bo);
> 
> Typically we use drm_dbg() to print error messages to avoid spamming
> the logs and facilitate dynamic debug. Should we change this.
> 

Noticed this too. Will change debug statements in the series to drm_dbg.

Matt

> /Thomas
> 
> 
> 
> > +			bo = NULL;
> > +			goto retry;
> > +		}
> > +	}
> > +
> >  	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> > -	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU
> > mappings have changed */
> > +	/* Corner where CPU mappings have changed */
> > +	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
> > +		if (err == -EOPNOTSUPP)
> > +			drm_gpusvm_range_evict(&vm->svm.gpusvm,
> > &range->base);
> > +		drm_info(&vm->xe->drm,
> > +			 "Get pages failed, falling back to
> > retrying, asid=%u, gpusvm=%p, errno %pe\n",
> > +			 vm->usm.asid, &vm->svm.gpusvm,
> > ERR_PTR(err));
> >  		goto retry;
> > +	}
> >  	if (err)
> >  		goto err_out;
> >  
> > @@ -668,6 +770,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	dma_fence_put(fence);
> >  
> >  err_out:
> > +	xe_bo_put(bo);
> >  
> >  	return err;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > b/drivers/gpu/drm/xe/xe_svm.h
> > index 0fa525d34987..984a61651d9e 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -35,6 +35,11 @@ struct xe_svm_range {
> >  	 * range. Protected by GPU SVM notifier lock.
> >  	 */
> >  	u8 tile_invalidated;
> > +	/**
> > +	 * @migrated: Range has been migrated to device memory,
> > protected by
> > +	 * GPU fault handler locking.
> > +	 */
> > +	u8 migrated	:1;
> >  };
> >  
> >  int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr);
> 
