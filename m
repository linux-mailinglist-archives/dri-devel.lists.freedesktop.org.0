Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45861A9BB21
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 01:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC79510E882;
	Thu, 24 Apr 2025 23:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZOUMuCf/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2697D10E15E;
 Thu, 24 Apr 2025 23:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745536606; x=1777072606;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=J1qwQlpCbs5Ke57QO4fHfusVS4KBp0H9dXbCc+sMJ5w=;
 b=ZOUMuCf/+af6C6tlUGj2/m93KIpl9mrfN8osQX8OXTSgQXd/tfEpeLzD
 kaalZUYiIoMMQEMqYeGAhSPYnIgrMIDjHQF8nbFvdj64iEK9HKCX3JNqH
 19hpci8gWOkXg2xQJW97n6vwWmGfE03XskwmDiNTOyAcPnZgceDfnzvrI
 EtpiJYTOqjFEDOgcVv1LIngX9WDkHzhtf9/fHloA+jkKwGLAtcqoYE8rt
 yF5ZABKWxGqL7zfWk7dukQN2qMIS9QTA+bbbDP2Ldk0DvEih1rKN82lFR
 fBVtdoaWRWB+fvh2aM18rBDMlvufQxPJUUyfWUvOL9wiWKi/P0pkyfCeI g==;
X-CSE-ConnectionGUID: LSZoJ8yfQkazxH7HTqqirg==
X-CSE-MsgGUID: pbyFGHoyRmeod3aekBnkFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47326064"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="47326064"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 16:16:44 -0700
X-CSE-ConnectionGUID: A560u3pjQruHOlOXEv6wZQ==
X-CSE-MsgGUID: XhzOM/axSlixSYqlH22bmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="137742092"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 16:16:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 16:16:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 16:16:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 16:16:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHFO3Hr9XTrqQkr0p2HnmtTKn8dPzM9dylmx+VzLTGEyAXIMK47BFJELjLmYtI8xGld5xSc56iYbedhCJrvJh5jujIMFbWmYZGvnSOIXmAB9SH0y/X64Ty+raIdqaRIPXsMTyCwzxnbftRvA2qn1Aj0BcAasnS4uYzwdWl55jvS9EnLI1ulMqZgxHzj4FYYk8GQT3P4mJkRLSCQgCc2bErkMATm0GkLIwM1+41SbTSmUa8kvl+sMgxn0LoGysBGYBNfnNGZShZSaUVNgDjWRVKss72v7DJOFNtsuoc6fkBGp7gQbSE/klUkmIn3LH3UWx8+JZPVJia1vrVCcM5BTjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXXeMFcCrUKd5d8RGUBSUmMysVfCZRM3+3MegXpn5kA=;
 b=vQJrTYQbjxhikxSDrnkBEW6JTpNd6TimdJ7Z4F57nO/dauUK1ZynTnFaL7fCL7fI5lUeCMMgq6xKDtEmVgumyOQt6cEcqMdH5RCCqDfGsFae+9y8NPE95P2KnE0I5NDox9r4xVcDts1Lz08NOiOkQy+UO1AhPLUnmChXcPjQPdpHVo37bRjBOLF4GVIVGib5ajWpFVHOlIFaFWsBT1Bn1EkqEUw7sw4uWuNmnE42Hihlwhq0VWJiwCIP6ruppDU0SMcrHpDA8Kuh1pc3eC2K3GTruIfAImPgm4Ia1/CPihPG/mK52s7eXeBTPLAb0tQzarQN7PoasArcBN6Kg0QDWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB8045.namprd11.prod.outlook.com (2603:10b6:806:2fa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 23:15:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Thu, 24 Apr 2025
 23:15:58 +0000
Date: Thu, 24 Apr 2025 16:17:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 6/7] drm/xe/userptr: replace xe_hmm with gpusvm
Message-ID: <aArGf44w69mlVRHJ@lstrano-desk.jf.intel.com>
References: <20250424121827.862729-9-matthew.auld@intel.com>
 <20250424121827.862729-15-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424121827.862729-15-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0178.namprd04.prod.outlook.com
 (2603:10b6:303:85::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 659dd81d-3d92-4fca-8ea5-08dd8385f8b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?YZ2+hgK37IjhyyT3KaJlx/u4Wct2P5z0hgmizKVcUrpuI6nuGhXK3/tCwS?=
 =?iso-8859-1?Q?/bc09jWo1LpH87qyZRMZQoJwpQOdwfm4cNnvWVz6DlU4RqAGS+lqjavEUN?=
 =?iso-8859-1?Q?nI00Fo1qKP2j6Op6KFHpLlWJXIxIfFG9ZujcHrSjbLZTowG3fI5zwJfvIF?=
 =?iso-8859-1?Q?Ah3Z14tnGSaEB+GOgWSdqWs1msgbtz2zBj899ujUrgkLjdWm8rbBiyhGyN?=
 =?iso-8859-1?Q?ib3N+cDf+qaaLDJrXxd4wcMM6BnsBIpHzvxj+cq6+QwssEvFIZAA/kHZTO?=
 =?iso-8859-1?Q?FP7ZrvUTVWDgLmb2xA7i3oBNT3o7Fru5YafzMr3+OkpZQPMBjTAXamZJFG?=
 =?iso-8859-1?Q?qWaz3pFtPSuW9leFzjEKhPhHcKJ7VVi2DnlvhcIx57ua7IbCmDwf0JRYra?=
 =?iso-8859-1?Q?zRgB8LTPITsHe5N4MINdEc5Afmw69ugvRrGuLPihQFC22islS5q2Wgseei?=
 =?iso-8859-1?Q?yaHUmkz5R3WP2907HLoXVZ6YD6QeCL8V2tI41X8mxrI3fdIoBoejJZ0yWR?=
 =?iso-8859-1?Q?KfvG53DgZFQSiBeWjyq1L5PcB2xg6vMfa81kDTGR6zSolewpGP8vefb8XW?=
 =?iso-8859-1?Q?t9/MjxFzISjZIZuziP7s4CdtaIkdsQgeHwujNAI0ESNrJFm/qTcGTuAWrs?=
 =?iso-8859-1?Q?JmKGwAn/Jaj3dtYensITS6wZJjw9SP2fog6Nn6AksR/VYIoR+fkB4rum29?=
 =?iso-8859-1?Q?2kp6APhqN/OKoCJkE/5Ka7Ja8gNI1o+55zrQN8k1hP/L5G2yP1febEsh9M?=
 =?iso-8859-1?Q?cw7E57WfOAASACD90JGTZANzzFnVPmjU5FmU0jbgONDHpyKWacRxdlumji?=
 =?iso-8859-1?Q?LKrojkWTzmvkcLSJ5Vx0ueZ9lCLD4OtjYlTkKw/5T+S2y01T/gKLlQCL2m?=
 =?iso-8859-1?Q?fT7Ltv+vvij4GX8nIaXntPryabbX/T3Wsw4gLR0xiUGRN3z1KiK2YsB0s7?=
 =?iso-8859-1?Q?Vv2L2KLsEK5RKN/QgBQ8QUclgS2az5JVw93TlPSsDuYSwJRsdgIlUBHZjP?=
 =?iso-8859-1?Q?9hNgZFu9vVXOTmBZ701qMTnh/bGWm7i6UPSFi9DEncBlthrfWieFyKL0BQ?=
 =?iso-8859-1?Q?WZ6jCqdfW1zM/xSTQkkYUb3sdIbo3N3GNBTFUH6eecwaXaXf0xkmUGwOXx?=
 =?iso-8859-1?Q?9uVGB1lnZ7ULGKOMxaElsIAIRg5I/lOjhn80KhGN0cTgrC9t61aZp7yfNv?=
 =?iso-8859-1?Q?OMluX89fFFx9xRE+HxM2IrrXphcaMJPwO/EG9jCQbJ7yya+kvxXnd+wONP?=
 =?iso-8859-1?Q?OxPY9g/vbPF2X7XGiIhcEnNHQrzoluq3PrdNbI0DbH/iAOkm5+UIX+YYCY?=
 =?iso-8859-1?Q?3bZTVALXzyF3L1VWVRNoV4YuQHj4/nuaZz6L9E+FHdEjj+CWOW25IwuCEZ?=
 =?iso-8859-1?Q?5uPO+Q+B0RM8ObSNzXLXPoscb7qUx2h33kw4h+PFBwq3bWt6ARIhYxJiDY?=
 =?iso-8859-1?Q?cPignlzMzUqscWGti8r3tBAUZmlkVDXnqlmmGWKj4axuIOgLuRr8JkXegI?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?E1QbTEwIKSACYQwTeuKn5dF/EWpOaOG/dogykmIgVIBYNq0ViZcD/37o0L?=
 =?iso-8859-1?Q?Dk9tLOJMpAALgbBDj2r+5CLGFlDsCXZnjYTXgfi85LkjEdyg49UeLsXr1D?=
 =?iso-8859-1?Q?HLYaStRgHDUhozLyZ+bAm1v8DoSrRsAhDxygHE7yukfODDq+kC9RhmRsjI?=
 =?iso-8859-1?Q?7H4m1Ul3yxuuTNMJEqVjU1kwcn73kkr+WMYXZeBkrb4emopm+63opLyCEO?=
 =?iso-8859-1?Q?SAAghqcOl259/Wk5rkGwhUymzg8PQ2Rn/BIMuvaVnQ3O8T8JWh32aWnDCt?=
 =?iso-8859-1?Q?DtMe1qU3BYEshMbCCCgRBANAu9/6BtPZ54H41cw7l/Gi3a1yvVKvk4UfPK?=
 =?iso-8859-1?Q?7Rpx26ngpMfSwnZykO8MjECEGwkKJAkrrjIzDlMtmqt6i+zUUsDSKek+r6?=
 =?iso-8859-1?Q?YVJmmEkDcVnlCOh8uUOaF8ojRUA02Sdaocs6SfBAvHMa5t9H2TJJL06xVE?=
 =?iso-8859-1?Q?M65hLqFCJk6P0yU2sA28ZKcm4su5I0rsIP2Jl0kTUFDlkPotag1I/ZzPwg?=
 =?iso-8859-1?Q?X6CJb7j7q+d5atKn7lj7vYH4Jsl3Nd5rfdkZpbYjKSjyEGV/EbshuTqKfK?=
 =?iso-8859-1?Q?QMBnLACNoLyTxB4fVmEDzbryr4AYAdBERIfH+9Dpz6GYmk6IVpDGRXJ5kA?=
 =?iso-8859-1?Q?MKiPmz6Yz8wZlVQ6XlMlHUqv+lIOVjEv+ASVPpzMtOcoaalRMSH2RxeFtu?=
 =?iso-8859-1?Q?rj4KJ7/oFYeX6qMddfEKk7o5N+bSh1+jE7UJ229jqSa9gq7DyHBR2NTX0v?=
 =?iso-8859-1?Q?sVV697t+xSslxamsQeiBAcj7IOk5p5bTn7zgGg8nRMCe3jkhSkBm0DtEd/?=
 =?iso-8859-1?Q?OMncbJyCDcdvo9xpYQR7DNI4IiLlj+/VaB6eXnfLOcV1NoWx4vumWLIHbq?=
 =?iso-8859-1?Q?EOFlLMs3LSi9rZHK7ktwE5KdmQSEo1+LCE98qjAd1vFp5+GUpN2Dg+azyV?=
 =?iso-8859-1?Q?JiUucHgEcJ13mYihp9uYZvH+aFg3DxwDBdVz/1QnNruIbtV8sd5UMvMDWZ?=
 =?iso-8859-1?Q?Je0m0mokssdtXjBqLWHRinHyCgZwZqmqwdFLbxNVP+hcWP1bs8zFOBXpIf?=
 =?iso-8859-1?Q?oqhcc2+xuHQeRKUYpLgxwYBgKZWEEu/8dhaZG+YlCOPiuUI4yqTuYBZGZc?=
 =?iso-8859-1?Q?EUzVwcJbu6+UkkT63u+rbMBmfADrGN2QfQDgkJyNwoyyt6T27AD2rqIQE0?=
 =?iso-8859-1?Q?cti5A9fwMvyYPEaEdRZmn6+IvJa9h7h3DvR7ZfahcBQVai1ATwZDxQuLMC?=
 =?iso-8859-1?Q?Jnc23QpEhmqNuUJ5V44ATXczp0AFNVjQi+5Qcim1r0ocWUdy+B6H+CiF3x?=
 =?iso-8859-1?Q?6Xm+EGxbSlzC+WilmaQQNInh+weDi65inD0Mk83At2JcXlEXYC0ZJnuAnO?=
 =?iso-8859-1?Q?cFd09Osj6Jx+5DXk4InAEcLxoH7uo1AlftujF2xfbLMhuUXc4QEeOAv5g/?=
 =?iso-8859-1?Q?OGum8Ir87UztGRu2RW0kbRGOOc+UWtTyXk+I0siWrugupxv+rT7pdRlxHl?=
 =?iso-8859-1?Q?ih57f1PkFVD9Rf9A7u/KZ+EjVHnQZmtXztp/lNd3J1OFxW4CbD/Jj2d6dO?=
 =?iso-8859-1?Q?Nxl9LmWcYEJB7p0xm6KhNjAAGyG60WGBSkjQPyJXZcIhrNwilFCUMVec9j?=
 =?iso-8859-1?Q?A8XEn8myWxrHNmLzxnzDKLt2ORnj4JaLSnuB/817MplRQMWYFA8p9R5w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 659dd81d-3d92-4fca-8ea5-08dd8385f8b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 23:15:58.5164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vB+f2dNAp/1jfv6/lDS4iSZFPoFmQLmw17fCMSW0/bWkh2Gi5Je3RWs0P/luVFUB3RlIvdAuTd3Zr/tptm2WhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8045
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

On Thu, Apr 24, 2025 at 01:18:34PM +0100, Matthew Auld wrote:
> Goal here is cut over to gpusvm and remove xe_hmm, relying instead on
> common code. The core facilities we need are get_pages(), unmap_pages()
> and free_pages() for a given useptr range, plus a vm level notifier
> lock, which is now provided by gpusvm.
> 
> v2:
>   - Reuse the same SVM vm struct we use for full SVM, that way we can
>     use the same lock (Matt B & Himal)
> v3:
>   - Re-use svm_init/fini for userptr.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig       |   3 +-
>  drivers/gpu/drm/xe/Makefile      |   1 -
>  drivers/gpu/drm/xe/xe_exec.c     |   4 +-
>  drivers/gpu/drm/xe/xe_hmm.c      | 325 -------------------------------
>  drivers/gpu/drm/xe/xe_hmm.h      |  18 --
>  drivers/gpu/drm/xe/xe_pt.c       |  22 +--
>  drivers/gpu/drm/xe/xe_svm.c      |  32 +--
>  drivers/gpu/drm/xe/xe_svm.h      |   6 +-
>  drivers/gpu/drm/xe/xe_vm.c       |  86 ++++----
>  drivers/gpu/drm/xe/xe_vm_types.h |  26 +--
>  10 files changed, 92 insertions(+), 431 deletions(-)
>  delete mode 100644 drivers/gpu/drm/xe/xe_hmm.c
>  delete mode 100644 drivers/gpu/drm/xe/xe_hmm.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 9bce047901b2..1e63dde76c55 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -43,7 +43,7 @@ config DRM_XE
>  	select MMU_NOTIFIER
>  	select WANT_DEV_COREDUMP
>  	select AUXILIARY_BUS
> -	select HMM_MIRROR
> +	select DRM_GPUSVM

select DRM_GPUSVM if !UML and DEVICE_PRIVATE

GPUSVM won't compile on UML. That might have other implictions
throughout the driver (e.g. compile out parts of userptr, disable
userptr if at IOCTLs if DRM_GPUSVM is not selected, etc...).

Rest of the patch LGTM.

Matt

>  	help
>  	  Experimental driver for Intel Xe series GPUs
>  
> @@ -79,7 +79,6 @@ config DRM_XE_GPUSVM
>  	depends on !UML
>  	depends on DEVICE_PRIVATE
>  	default y
> -	select DRM_GPUSVM
>  	help
>  	  Enable this option if you want support for CPU to GPU address
>  	  mirroring.
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 3ecac0a38b82..f1123be158f8 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -124,7 +124,6 @@ xe-y += xe_bb.o \
>  	xe_wait_user_fence.o \
>  	xe_wopcm.o
>  
> -xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
>  xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
>  
>  # graphics hardware monitoring (HWMON) support
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index b75adfc99fb7..c0ce681076d5 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -294,7 +294,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		if (err)
>  			goto err_put_job;
>  
> -		err = down_read_interruptible(&vm->userptr.notifier_lock);
> +		err = down_read_interruptible(&vm->svm.gpusvm.notifier_lock);
>  		if (err)
>  			goto err_put_job;
>  
> @@ -336,7 +336,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  
>  err_repin:
>  	if (!xe_vm_in_lr_mode(vm))
> -		up_read(&vm->userptr.notifier_lock);
> +		up_read(&vm->svm.gpusvm.notifier_lock);
>  err_put_job:
>  	if (err)
>  		xe_sched_job_put(job);
> diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
> deleted file mode 100644
> index 57b71956ddf4..000000000000
> --- a/drivers/gpu/drm/xe/xe_hmm.c
> +++ /dev/null
> @@ -1,325 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright © 2024 Intel Corporation
> - */
> -
> -#include <linux/scatterlist.h>
> -#include <linux/mmu_notifier.h>
> -#include <linux/dma-mapping.h>
> -#include <linux/memremap.h>
> -#include <linux/swap.h>
> -#include <linux/hmm.h>
> -#include <linux/mm.h>
> -#include "xe_hmm.h"
> -#include "xe_vm.h"
> -#include "xe_bo.h"
> -
> -static u64 xe_npages_in_range(unsigned long start, unsigned long end)
> -{
> -	return (end - start) >> PAGE_SHIFT;
> -}
> -
> -static int xe_alloc_sg(struct xe_device *xe, struct sg_table *st,
> -		       struct hmm_range *range, struct rw_semaphore *notifier_sem)
> -{
> -	unsigned long i, npages, hmm_pfn;
> -	unsigned long num_chunks = 0;
> -	int ret;
> -
> -	/* HMM docs says this is needed. */
> -	ret = down_read_interruptible(notifier_sem);
> -	if (ret)
> -		return ret;
> -
> -	if (mmu_interval_read_retry(range->notifier, range->notifier_seq)) {
> -		up_read(notifier_sem);
> -		return -EAGAIN;
> -	}
> -
> -	npages = xe_npages_in_range(range->start, range->end);
> -	for (i = 0; i < npages;) {
> -		unsigned long len;
> -
> -		hmm_pfn = range->hmm_pfns[i];
> -		xe_assert(xe, hmm_pfn & HMM_PFN_VALID);
> -
> -		len = 1UL << hmm_pfn_to_map_order(hmm_pfn);
> -
> -		/* If order > 0 the page may extend beyond range->start */
> -		len -= (hmm_pfn & ~HMM_PFN_FLAGS) & (len - 1);
> -		i += len;
> -		num_chunks++;
> -	}
> -	up_read(notifier_sem);
> -
> -	return sg_alloc_table(st, num_chunks, GFP_KERNEL);
> -}
> -
> -/**
> - * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
> - * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
> - * and will be used to program GPU page table later.
> - * @xe: the xe device who will access the dma-address in sg table
> - * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
> - * has the pfn numbers of pages that back up this hmm address range.
> - * @st: pointer to the sg table.
> - * @notifier_sem: The xe notifier lock.
> - * @write: whether we write to this range. This decides dma map direction
> - * for system pages. If write we map it bi-diretional; otherwise
> - * DMA_TO_DEVICE
> - *
> - * All the contiguous pfns will be collapsed into one entry in
> - * the scatter gather table. This is for the purpose of efficiently
> - * programming GPU page table.
> - *
> - * The dma_address in the sg table will later be used by GPU to
> - * access memory. So if the memory is system memory, we need to
> - * do a dma-mapping so it can be accessed by GPU/DMA.
> - *
> - * FIXME: This function currently only support pages in system
> - * memory. If the memory is GPU local memory (of the GPU who
> - * is going to access memory), we need gpu dpa (device physical
> - * address), and there is no need of dma-mapping. This is TBD.
> - *
> - * FIXME: dma-mapping for peer gpu device to access remote gpu's
> - * memory. Add this when you support p2p
> - *
> - * This function allocates the storage of the sg table. It is
> - * caller's responsibility to free it calling sg_free_table.
> - *
> - * Returns 0 if successful; -ENOMEM if fails to allocate memory
> - */
> -static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
> -		       struct sg_table *st,
> -		       struct rw_semaphore *notifier_sem,
> -		       bool write)
> -{
> -	unsigned long npages = xe_npages_in_range(range->start, range->end);
> -	struct device *dev = xe->drm.dev;
> -	struct scatterlist *sgl;
> -	struct page *page;
> -	unsigned long i, j;
> -
> -	lockdep_assert_held(notifier_sem);
> -
> -	i = 0;
> -	for_each_sg(st->sgl, sgl, st->nents, j) {
> -		unsigned long hmm_pfn, size;
> -
> -		hmm_pfn = range->hmm_pfns[i];
> -		page = hmm_pfn_to_page(hmm_pfn);
> -		xe_assert(xe, !is_device_private_page(page));
> -
> -		size = 1UL << hmm_pfn_to_map_order(hmm_pfn);
> -		size -= page_to_pfn(page) & (size - 1);
> -		i += size;
> -
> -		if (unlikely(j == st->nents - 1)) {
> -			xe_assert(xe, i >= npages);
> -			if (i > npages)
> -				size -= (i - npages);
> -
> -			sg_mark_end(sgl);
> -		} else {
> -			xe_assert(xe, i < npages);
> -		}
> -
> -		sg_set_page(sgl, page, size << PAGE_SHIFT, 0);
> -	}
> -
> -	return dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
> -			       DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
> -}
> -
> -static void xe_hmm_userptr_set_mapped(struct xe_userptr_vma *uvma)
> -{
> -	struct xe_userptr *userptr = &uvma->userptr;
> -	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> -
> -	lockdep_assert_held_write(&vm->lock);
> -	lockdep_assert_held(&vm->userptr.notifier_lock);
> -
> -	mutex_lock(&userptr->unmap_mutex);
> -	xe_assert(vm->xe, !userptr->mapped);
> -	userptr->mapped = true;
> -	mutex_unlock(&userptr->unmap_mutex);
> -}
> -
> -void xe_hmm_userptr_unmap(struct xe_userptr_vma *uvma)
> -{
> -	struct xe_userptr *userptr = &uvma->userptr;
> -	struct xe_vma *vma = &uvma->vma;
> -	bool write = !xe_vma_read_only(vma);
> -	struct xe_vm *vm = xe_vma_vm(vma);
> -	struct xe_device *xe = vm->xe;
> -
> -	if (!lockdep_is_held_type(&vm->userptr.notifier_lock, 0) &&
> -	    !lockdep_is_held_type(&vm->lock, 0) &&
> -	    !(vma->gpuva.flags & XE_VMA_DESTROYED)) {
> -		/* Don't unmap in exec critical section. */
> -		xe_vm_assert_held(vm);
> -		/* Don't unmap while mapping the sg. */
> -		lockdep_assert_held(&vm->lock);
> -	}
> -
> -	mutex_lock(&userptr->unmap_mutex);
> -	if (userptr->sg && userptr->mapped)
> -		dma_unmap_sgtable(xe->drm.dev, userptr->sg,
> -				  write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
> -	userptr->mapped = false;
> -	mutex_unlock(&userptr->unmap_mutex);
> -}
> -
> -/**
> - * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
> - * @uvma: the userptr vma which hold the scatter gather table
> - *
> - * With function xe_userptr_populate_range, we allocate storage of
> - * the userptr sg table. This is a helper function to free this
> - * sg table, and dma unmap the address in the table.
> - */
> -void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
> -{
> -	struct xe_userptr *userptr = &uvma->userptr;
> -
> -	xe_assert(xe_vma_vm(&uvma->vma)->xe, userptr->sg);
> -	xe_hmm_userptr_unmap(uvma);
> -	sg_free_table(userptr->sg);
> -	userptr->sg = NULL;
> -}
> -
> -/**
> - * xe_hmm_userptr_populate_range() - Populate physical pages of a virtual
> - * address range
> - *
> - * @uvma: userptr vma which has information of the range to populate.
> - * @is_mm_mmap_locked: True if mmap_read_lock is already acquired by caller.
> - *
> - * This function populate the physical pages of a virtual
> - * address range. The populated physical pages is saved in
> - * userptr's sg table. It is similar to get_user_pages but call
> - * hmm_range_fault.
> - *
> - * This function also read mmu notifier sequence # (
> - * mmu_interval_read_begin), for the purpose of later
> - * comparison (through mmu_interval_read_retry).
> - *
> - * This must be called with mmap read or write lock held.
> - *
> - * This function allocates the storage of the userptr sg table.
> - * It is caller's responsibility to free it calling sg_free_table.
> - *
> - * returns: 0 for success; negative error no on failure
> - */
> -int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
> -				  bool is_mm_mmap_locked)
> -{
> -	unsigned long timeout =
> -		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> -	unsigned long *pfns;
> -	struct xe_userptr *userptr;
> -	struct xe_vma *vma = &uvma->vma;
> -	u64 userptr_start = xe_vma_userptr(vma);
> -	u64 userptr_end = userptr_start + xe_vma_size(vma);
> -	struct xe_vm *vm = xe_vma_vm(vma);
> -	struct hmm_range hmm_range = {
> -		.pfn_flags_mask = 0, /* ignore pfns */
> -		.default_flags = HMM_PFN_REQ_FAULT,
> -		.start = userptr_start,
> -		.end = userptr_end,
> -		.notifier = &uvma->userptr.notifier,
> -		.dev_private_owner = vm->xe,
> -	};
> -	bool write = !xe_vma_read_only(vma);
> -	unsigned long notifier_seq;
> -	u64 npages;
> -	int ret;
> -
> -	userptr = &uvma->userptr;
> -
> -	if (is_mm_mmap_locked)
> -		mmap_assert_locked(userptr->notifier.mm);
> -
> -	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> -		return 0;
> -
> -	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
> -	if (notifier_seq == userptr->notifier_seq)
> -		return 0;
> -
> -	if (userptr->sg)
> -		xe_hmm_userptr_free_sg(uvma);
> -
> -	npages = xe_npages_in_range(userptr_start, userptr_end);
> -	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> -	if (unlikely(!pfns))
> -		return -ENOMEM;
> -
> -	if (write)
> -		hmm_range.default_flags |= HMM_PFN_REQ_WRITE;
> -
> -	if (!mmget_not_zero(userptr->notifier.mm)) {
> -		ret = -EFAULT;
> -		goto free_pfns;
> -	}
> -
> -	hmm_range.hmm_pfns = pfns;
> -
> -	while (true) {
> -		hmm_range.notifier_seq = mmu_interval_read_begin(&userptr->notifier);
> -
> -		if (!is_mm_mmap_locked)
> -			mmap_read_lock(userptr->notifier.mm);
> -
> -		ret = hmm_range_fault(&hmm_range);
> -
> -		if (!is_mm_mmap_locked)
> -			mmap_read_unlock(userptr->notifier.mm);
> -
> -		if (ret == -EBUSY) {
> -			if (time_after(jiffies, timeout))
> -				break;
> -
> -			continue;
> -		}
> -		break;
> -	}
> -
> -	mmput(userptr->notifier.mm);
> -
> -	if (ret)
> -		goto free_pfns;
> -
> -	ret = xe_alloc_sg(vm->xe, &userptr->sgt, &hmm_range, &vm->userptr.notifier_lock);
> -	if (ret)
> -		goto free_pfns;
> -
> -	ret = down_read_interruptible(&vm->userptr.notifier_lock);
> -	if (ret)
> -		goto free_st;
> -
> -	if (mmu_interval_read_retry(hmm_range.notifier, hmm_range.notifier_seq)) {
> -		ret = -EAGAIN;
> -		goto out_unlock;
> -	}
> -
> -	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt,
> -			  &vm->userptr.notifier_lock, write);
> -	if (ret)
> -		goto out_unlock;
> -
> -	userptr->sg = &userptr->sgt;
> -	xe_hmm_userptr_set_mapped(uvma);
> -	userptr->notifier_seq = hmm_range.notifier_seq;
> -	up_read(&vm->userptr.notifier_lock);
> -	kvfree(pfns);
> -	return 0;
> -
> -out_unlock:
> -	up_read(&vm->userptr.notifier_lock);
> -free_st:
> -	sg_free_table(&userptr->sgt);
> -free_pfns:
> -	kvfree(pfns);
> -	return ret;
> -}
> diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
> deleted file mode 100644
> index 0ea98d8e7bbc..000000000000
> --- a/drivers/gpu/drm/xe/xe_hmm.h
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -/* SPDX-License-Identifier: MIT
> - *
> - * Copyright © 2024 Intel Corporation
> - */
> -
> -#ifndef _XE_HMM_H_
> -#define _XE_HMM_H_
> -
> -#include <linux/types.h>
> -
> -struct xe_userptr_vma;
> -
> -int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked);
> -
> -void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma);
> -
> -void xe_hmm_userptr_unmap(struct xe_userptr_vma *uvma);
> -#endif
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5cccfd9cc3e9..ff898e518afd 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -756,8 +756,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  
>  	if (!xe_vma_is_null(vma) && !range) {
>  		if (xe_vma_is_userptr(vma))
> -			xe_res_first_sg(to_userptr_vma(vma)->userptr.sg, 0,
> -					xe_vma_size(vma), &curs);
> +			xe_res_first_dma(to_userptr_vma(vma)->userptr.pages.dma_addr, 0,
> +					 xe_vma_size(vma), &curs);
>  		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
>  			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
>  				     xe_vma_size(vma), &curs);
> @@ -1028,7 +1028,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
>  	xe_pt_commit_prepare_locks_assert(vma);
>  
>  	if (xe_vma_is_userptr(vma))
> -		lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +		lockdep_assert_held_read(&vm->svm.gpusvm.notifier_lock);
>  }
>  
>  static void xe_pt_commit(struct xe_vma *vma,
> @@ -1368,7 +1368,7 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
>  	struct xe_userptr_vma *uvma;
>  	unsigned long notifier_seq;
>  
> -	lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +	lockdep_assert_held_read(&vm->svm.gpusvm.notifier_lock);
>  
>  	if (!xe_vma_is_userptr(vma))
>  		return 0;
> @@ -1377,7 +1377,7 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
>  	if (xe_pt_userptr_inject_eagain(uvma))
>  		xe_vma_userptr_force_invalidate(uvma);
>  
> -	notifier_seq = uvma->userptr.notifier_seq;
> +	notifier_seq = uvma->userptr.pages.notifier_seq;
>  
>  	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
>  				     notifier_seq))
> @@ -1398,7 +1398,7 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>  {
>  	int err = 0;
>  
> -	lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +	lockdep_assert_held_read(&vm->svm.gpusvm.notifier_lock);
>  
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> @@ -1439,12 +1439,12 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	if (err)
>  		return err;
>  
> -	down_read(&vm->userptr.notifier_lock);
> +	down_read(&vm->svm.gpusvm.notifier_lock);
>  
>  	list_for_each_entry(op, &vops->list, link) {
>  		err = op_check_userptr(vm, op, pt_update_ops);
>  		if (err) {
> -			up_read(&vm->userptr.notifier_lock);
> +			up_read(&vm->svm.gpusvm.notifier_lock);
>  			break;
>  		}
>  	}
> @@ -2171,7 +2171,7 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>  	if (invalidate_on_bind)
>  		vma->tile_invalidated |= BIT(tile->id);
>  	if (xe_vma_is_userptr(vma)) {
> -		lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +		lockdep_assert_held_read(&vm->svm.gpusvm.notifier_lock);
>  		to_userptr_vma(vma)->userptr.initial_bind = true;
>  	}
>  
> @@ -2207,7 +2207,7 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>  	if (!vma->tile_present) {
>  		list_del_init(&vma->combined_links.rebind);
>  		if (xe_vma_is_userptr(vma)) {
> -			lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +			lockdep_assert_held_read(&vm->svm.gpusvm.notifier_lock);
>  
>  			spin_lock(&vm->userptr.invalidated_lock);
>  			list_del_init(&to_userptr_vma(vma)->userptr.invalidate_link);
> @@ -2456,7 +2456,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  	if (pt_update_ops->needs_svm_lock)
>  		xe_svm_notifier_unlock(vm);
>  	if (pt_update_ops->needs_userptr_lock)
> -		up_read(&vm->userptr.notifier_lock);
> +		up_read(&vm->svm.gpusvm.notifier_lock);
>  
>  	return fence;
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index f60c7f587cd6..10ec237ec88c 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -606,22 +606,26 @@ int xe_svm_init(struct xe_vm *vm)
>  {
>  	int err;
>  
> -	spin_lock_init(&vm->svm.garbage_collector.lock);
> -	INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
> -	INIT_WORK(&vm->svm.garbage_collector.work,
> -		  xe_svm_garbage_collector_work_func);
> +	if (vm->flags & XE_VM_FLAG_FAULT_MODE) {
> +		spin_lock_init(&vm->svm.garbage_collector.lock);
> +		INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
> +		INIT_WORK(&vm->svm.garbage_collector.work,
> +			  xe_svm_garbage_collector_work_func);
>  
> -	err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
> -			      current->mm, xe_svm_devm_owner(vm->xe), 0,
> -			      vm->size, xe_modparam.svm_notifier_size * SZ_1M,
> -			      &gpusvm_ops, fault_chunk_sizes,
> -			      ARRAY_SIZE(fault_chunk_sizes));
> -	if (err)
> -		return err;
> +		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
> +				      current->mm, xe_svm_devm_owner(vm->xe), 0,
> +				      vm->size,
> +				      xe_modparam.svm_notifier_size * SZ_1M,
> +				      &gpusvm_ops, fault_chunk_sizes,
> +				      ARRAY_SIZE(fault_chunk_sizes));
> +		drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
> +	} else {
> +		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)",
> +				      &vm->xe->drm, NULL, NULL, 0, 0, 0, NULL,
> +				      NULL, 0);
> +	}
>  
> -	drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
> -
> -	return 0;
> +	return err;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 8bc83de87250..923cb074d0cb 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -134,12 +134,16 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>  static inline
>  int xe_svm_init(struct xe_vm *vm)
>  {
> -	return 0;
> +	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
> +			       NULL, NULL, 0, 0, 0, NULL, NULL, 0);
>  }
>  
>  static inline
>  void xe_svm_fini(struct xe_vm *vm)
>  {
> +	xe_assert(vm->xe, xe_vm_is_closed(vm));
> +
> +	drm_gpusvm_fini(&vm->svm.gpusvm);
>  }
>  
>  static inline
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0c69ef6b5ec5..b900afe61931 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -40,7 +40,6 @@
>  #include "xe_sync.h"
>  #include "xe_trace_bo.h"
>  #include "xe_wa.h"
> -#include "xe_hmm.h"
>  
>  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>  {
> @@ -53,7 +52,7 @@ static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>   *
>   * Check if the userptr vma has been invalidated since last successful
>   * repin. The check is advisory only and can the function can be called
> - * without the vm->userptr.notifier_lock held. There is no guarantee that the
> + * without the vm->svm.gpusvm.notifier_lock held. There is no guarantee that the
>   * vma userptr will remain valid after a lockless check, so typically
>   * the call needs to be followed by a proper check under the notifier_lock.
>   *
> @@ -62,7 +61,7 @@ static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>  int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
>  {
>  	return mmu_interval_check_retry(&uvma->userptr.notifier,
> -					uvma->userptr.notifier_seq) ?
> +					uvma->userptr.pages.notifier_seq) ?
>  		-EAGAIN : 0;
>  }
>  
> @@ -71,11 +70,22 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>  	struct xe_vma *vma = &uvma->vma;
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  	struct xe_device *xe = vm->xe;
> +	struct drm_gpusvm_ctx ctx = {
> +		.read_only = xe_vma_read_only(vma),
> +	};
>  
>  	lockdep_assert_held(&vm->lock);
>  	xe_assert(xe, xe_vma_is_userptr(vma));
>  
> -	return xe_hmm_userptr_populate_range(uvma, false);
> +	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> +		return 0;
> +
> +	return drm_gpusvm_get_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
> +				    uvma->userptr.notifier.mm,
> +				    &uvma->userptr.notifier,
> +				    xe_vma_userptr(vma),
> +				    xe_vma_userptr(vma) + xe_vma_size(vma),
> +				    &ctx);
>  }
>  
>  static bool preempt_fences_waiting(struct xe_vm *vm)
> @@ -249,7 +259,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	++vm->preempt.num_exec_queues;
>  	q->lr.pfence = pfence;
>  
> -	down_read(&vm->userptr.notifier_lock);
> +	down_read(&vm->svm.gpusvm.notifier_lock);
>  
>  	drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, pfence,
>  				 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
> @@ -263,7 +273,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	if (wait)
>  		dma_fence_enable_sw_signaling(pfence);
>  
> -	up_read(&vm->userptr.notifier_lock);
> +	up_read(&vm->svm.gpusvm.notifier_lock);
>  
>  out_fini:
>  	drm_exec_fini(exec);
> @@ -305,14 +315,14 @@ void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>   * @vm: The VM.
>   *
>   * This function checks for whether the VM has userptrs that need repinning,
> - * and provides a release-type barrier on the userptr.notifier_lock after
> + * and provides a release-type barrier on the svm.gpusvm.notifier_lock after
>   * checking.
>   *
>   * Return: 0 if there are no userptrs needing repinning, -EAGAIN if there are.
>   */
>  int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>  {
> -	lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +	lockdep_assert_held_read(&vm->svm.gpusvm.notifier_lock);
>  
>  	return (list_empty(&vm->userptr.repin_list) &&
>  		list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
> @@ -546,9 +556,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	(!(__tries)++ || __xe_vm_userptr_needs_repin(__vm)) : \
>  	__xe_vm_userptr_needs_repin(__vm))
>  
> -	down_read(&vm->userptr.notifier_lock);
> +	down_read(&vm->svm.gpusvm.notifier_lock);
>  	if (retry_required(tries, vm)) {
> -		up_read(&vm->userptr.notifier_lock);
> +		up_read(&vm->svm.gpusvm.notifier_lock);
>  		err = -EAGAIN;
>  		goto out_unlock;
>  	}
> @@ -562,7 +572,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	/* Point of no return. */
>  	arm_preempt_fences(vm, &preempt_fences);
>  	resume_and_reinstall_preempt_fences(vm, &exec);
> -	up_read(&vm->userptr.notifier_lock);
> +	up_read(&vm->svm.gpusvm.notifier_lock);
>  
>  out_unlock:
>  	drm_exec_fini(&exec);
> @@ -589,6 +599,9 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
>  	struct xe_vma *vma = &uvma->vma;
>  	struct dma_resv_iter cursor;
>  	struct dma_fence *fence;
> +	struct drm_gpusvm_ctx ctx = {
> +		.in_notifier = true,
> +	};
>  	long err;
>  
>  	/*
> @@ -625,7 +638,8 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
>  		XE_WARN_ON(err);
>  	}
>  
> -	xe_hmm_userptr_unmap(uvma);
> +	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
> +			       xe_vma_size(vma) >> PAGE_SHIFT, &ctx);
>  }
>  
>  static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
> @@ -646,11 +660,11 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>  	       "NOTIFIER: addr=0x%016llx, range=0x%016llx",
>  		xe_vma_start(vma), xe_vma_size(vma));
>  
> -	down_write(&vm->userptr.notifier_lock);
> +	down_write(&vm->svm.gpusvm.notifier_lock);
>  	mmu_interval_set_seq(mni, cur_seq);
>  
>  	__vma_userptr_invalidate(vm, uvma);
> -	up_write(&vm->userptr.notifier_lock);
> +	up_write(&vm->svm.gpusvm.notifier_lock);
>  	trace_xe_vma_userptr_invalidate_complete(vma);
>  
>  	return true;
> @@ -674,7 +688,7 @@ void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
>  	/* Protect against concurrent userptr pinning */
>  	lockdep_assert_held(&vm->lock);
>  	/* Protect against concurrent notifiers */
> -	lockdep_assert_held(&vm->userptr.notifier_lock);
> +	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
>  	/*
>  	 * Protect against concurrent instances of this function and
>  	 * the critical exec sections
> @@ -747,7 +761,7 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>  	}
>  
>  	if (err) {
> -		down_write(&vm->userptr.notifier_lock);
> +		down_write(&vm->svm.gpusvm.notifier_lock);
>  		spin_lock(&vm->userptr.invalidated_lock);
>  		list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
>  					 userptr.repin_link) {
> @@ -756,7 +770,7 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>  				       &vm->userptr.invalidated);
>  		}
>  		spin_unlock(&vm->userptr.invalidated_lock);
> -		up_write(&vm->userptr.notifier_lock);
> +		up_write(&vm->svm.gpusvm.notifier_lock);
>  	}
>  	return err;
>  }
> @@ -1222,7 +1236,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  			INIT_LIST_HEAD(&userptr->invalidate_link);
>  			INIT_LIST_HEAD(&userptr->repin_link);
>  			vma->gpuva.gem.offset = bo_offset_or_userptr;
> -			mutex_init(&userptr->unmap_mutex);
>  
>  			err = mmu_interval_notifier_insert(&userptr->notifier,
>  							   current->mm,
> @@ -1233,7 +1246,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  				return ERR_PTR(err);
>  			}
>  
> -			userptr->notifier_seq = LONG_MAX;
> +			userptr->pages.notifier_seq = LONG_MAX;
>  		}
>  
>  		xe_vm_get(vm);
> @@ -1255,8 +1268,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>  		struct xe_userptr *userptr = &uvma->userptr;
>  
> -		if (userptr->sg)
> -			xe_hmm_userptr_free_sg(uvma);
> +		drm_gpusvm_free_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
> +				      xe_vma_size(vma) >> PAGE_SHIFT);
>  
>  		/*
>  		 * Since userptr pages are not pinned, we can't remove
> @@ -1264,7 +1277,6 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  		 * them anymore
>  		 */
>  		mmu_interval_notifier_remove(&userptr->notifier);
> -		mutex_destroy(&userptr->unmap_mutex);
>  		xe_vm_put(vm);
>  	} else if (xe_vma_is_null(vma) || xe_vma_is_cpu_addr_mirror(vma)) {
>  		xe_vm_put(vm);
> @@ -1657,7 +1669,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  
>  	INIT_LIST_HEAD(&vm->userptr.repin_list);
>  	INIT_LIST_HEAD(&vm->userptr.invalidated);
> -	init_rwsem(&vm->userptr.notifier_lock);
>  	spin_lock_init(&vm->userptr.invalidated_lock);
>  
>  	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> @@ -1757,11 +1768,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  		}
>  	}
>  
> -	if (flags & XE_VM_FLAG_FAULT_MODE) {
> -		err = xe_svm_init(vm);
> -		if (err)
> -			goto err_close;
> -	}
> +	err = xe_svm_init(vm);
> +	if (err)
> +		goto err_close;
>  
>  	if (number_tiles > 1)
>  		vm->composite_fence_ctx = dma_fence_context_alloc(1);
> @@ -1867,9 +1876,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  		vma = gpuva_to_vma(gpuva);
>  
>  		if (xe_vma_has_no_bo(vma)) {
> -			down_read(&vm->userptr.notifier_lock);
> +			down_read(&vm->svm.gpusvm.notifier_lock);
>  			vma->gpuva.flags |= XE_VMA_DESTROYED;
> -			up_read(&vm->userptr.notifier_lock);
> +			up_read(&vm->svm.gpusvm.notifier_lock);
>  		}
>  
>  		xe_vm_remove_vma(vm, vma);
> @@ -1913,8 +1922,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  		xe_vma_destroy_unlocked(vma);
>  	}
>  
> -	if (xe_vm_in_fault_mode(vm))
> -		xe_svm_fini(vm);
> +	xe_svm_fini(vm);
>  
>  	up_write(&vm->lock);
>  
> @@ -2145,9 +2153,9 @@ static const u32 region_to_mem_type[] = {
>  static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
>  			     bool post_commit)
>  {
> -	down_read(&vm->userptr.notifier_lock);
> +	down_read(&vm->svm.gpusvm.notifier_lock);
>  	vma->gpuva.flags |= XE_VMA_DESTROYED;
> -	up_read(&vm->userptr.notifier_lock);
> +	up_read(&vm->svm.gpusvm.notifier_lock);
>  	if (post_commit)
>  		xe_vm_remove_vma(vm, vma);
>  }
> @@ -2643,9 +2651,9 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
>  
>  		if (vma) {
> -			down_read(&vm->userptr.notifier_lock);
> +			down_read(&vm->svm.gpusvm.notifier_lock);
>  			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> -			up_read(&vm->userptr.notifier_lock);
> +			up_read(&vm->svm.gpusvm.notifier_lock);
>  			if (post_commit)
>  				xe_vm_insert_vma(vm, vma);
>  		}
> @@ -2664,9 +2672,9 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  			xe_vma_destroy_unlocked(op->remap.next);
>  		}
>  		if (vma) {
> -			down_read(&vm->userptr.notifier_lock);
> +			down_read(&vm->svm.gpusvm.notifier_lock);
>  			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> -			up_read(&vm->userptr.notifier_lock);
> +			up_read(&vm->svm.gpusvm.notifier_lock);
>  			if (post_commit)
>  				xe_vm_insert_vma(vm, vma);
>  		}
> @@ -3648,7 +3656,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  		if (xe_vma_is_userptr(vma)) {
>  			WARN_ON_ONCE(!mmu_interval_check_retry
>  				     (&to_userptr_vma(vma)->userptr.notifier,
> -				      to_userptr_vma(vma)->userptr.notifier_seq));
> +				      to_userptr_vma(vma)->userptr.pages.notifier_seq));
>  			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
>  							     DMA_RESV_USAGE_BOOKKEEP));
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 1662604c4486..b57c4299875a 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -52,26 +52,21 @@ struct xe_userptr {
>  	struct list_head invalidate_link;
>  	/** @userptr: link into VM repin list if userptr. */
>  	struct list_head repin_link;
> +	/**
> +	 * @pages: gpusvm pages for this user pointer.
> +	 */
> +	struct drm_gpusvm_pages pages;
>  	/**
>  	 * @notifier: MMU notifier for user pointer (invalidation call back)
>  	 */
>  	struct mmu_interval_notifier notifier;
> -	/** @sgt: storage for a scatter gather table */
> -	struct sg_table sgt;
> -	/** @sg: allocated scatter gather table */
> -	struct sg_table *sg;
> -	/** @notifier_seq: notifier sequence number */
> -	unsigned long notifier_seq;
> -	/** @unmap_mutex: Mutex protecting dma-unmapping */
> -	struct mutex unmap_mutex;
> +
>  	/**
>  	 * @initial_bind: user pointer has been bound at least once.
> -	 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
> -	 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
> +	 * write: vm->svm.gpusvm.notifier_lock in read mode and vm->resv held.
> +	 * read: vm->svm.gpusvm.notifier_lock in write mode or vm->resv held.
>  	 */
>  	bool initial_bind;
> -	/** @mapped: Whether the @sgt sg-table is dma-mapped. Protected by @unmap_mutex. */
> -	bool mapped;
>  #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
>  	u32 divisor;
>  #endif
> @@ -109,7 +104,7 @@ struct xe_vma {
>  	/**
>  	 * @tile_present: GT mask of binding are present for this VMA.
>  	 * protected by vm->lock, vm->resv and for userptrs,
> -	 * vm->userptr.notifier_lock for writing. Needs either for reading,
> +	 * vm->svm.gpusvm.notifier_lock for writing. Needs either for reading,
>  	 * but if reading is done under the vm->lock only, it needs to be held
>  	 * in write mode.
>  	 */
> @@ -243,11 +238,6 @@ struct xe_vm {
>  		 * and needs repinning. Protected by @lock.
>  		 */
>  		struct list_head repin_list;
> -		/**
> -		 * @notifier_lock: protects notifier in write mode and
> -		 * submission in read mode.
> -		 */
> -		struct rw_semaphore notifier_lock;
>  		/**
>  		 * @userptr.invalidated_lock: Protects the
>  		 * @userptr.invalidated list.
> -- 
> 2.49.0
> 
