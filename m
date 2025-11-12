Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA63DC5232A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 13:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0362210E704;
	Wed, 12 Nov 2025 12:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fyyxiGWz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEC310E6FA;
 Wed, 12 Nov 2025 12:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762949540; x=1794485540;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UOBSrj00TO0Vuy9i7iKEDLylykvgqDoJsqFOGLywaO8=;
 b=fyyxiGWzZiybWM6MmzbViwLsDcd04Omm+v+kORjkSUHTnBmNEbdtw/+T
 lebgotAoS0rALAWlNCz0B0nKXi/ode9so0yoOh9JcQGGrAQVKHmp48y4G
 cqQRiV2E5M7J1zBeoCttRqr+cS9wH3UhQZzw7unqUdzWgYHlxTx9QqK5t
 h6dDqNvPzdbbqOUXsbJ9zxVp2RIVptP9HgRfJfyWMne791Pb6NLuNEdo/
 o64jh4p+igBaY6F75tnpct3JEkdTAFO6LZuYNCfIwz1Ak69pKtAjFN2tM
 oOXvZG5ShB8GH72gROy1R3Iya/8Wo8olYcPRgwmHQJB09JCKvGX20/Mzm g==;
X-CSE-ConnectionGUID: BA47GdVkTHyzSPhb00l4ig==
X-CSE-MsgGUID: gKkToQMUSFiqxlI54Jvu8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75316991"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="75316991"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 04:12:20 -0800
X-CSE-ConnectionGUID: 5G53blD6SK6RKIujGfyBMQ==
X-CSE-MsgGUID: aEIK4zCGSSaU1QA7eYhzag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="219866318"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 04:12:20 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 04:12:19 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 04:12:19 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 04:12:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCDVeAMaOPAExLrqzM6reR+qg1v9M7P48oohUbGU6GFiwDEl0R7zdYaZHCJ/6Er4paF4J79+UDdqRUUNp8BgpeGL35sTYUG0JAPqdetsw3Z05XzmwhnBqA0vBOdCWzL2pT7IBuEkDeFI/leyKWjYsbpTxNEw9uNWNPrrj6iMQAb1TqwthSpBf0dX7QMDSYjbZ/y4uaM7E52U4CY3N5SBHmiWkKDLjDEFvDktsyzSw171lUJrEWdWbwsvwQPwEXborIxAfkPHRBhjhBApkemrU9Di+VLq8VwLENa01T2H0QEi/BBY2B/QvBchhs7WJMS41Du/O57aBw4SgZEqMdV2kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noAV49lgvbp5NtKWd82rM/TVfAYeBvmKyfjtVKuxCqU=;
 b=x5xZ/a4CbiSJ583GO8WogciqbcGKXsf5oKXgU9hMGpklg4QfBnlLOM6tJ3Ab+GqqaG5Llh8EOrz3i2VjkECnyKAksgtJ8jASdHuaTuwjyq+7/Us+7nrm1MHZldFDr0/3JezoNJQrBz+ZO040xV16QnrRgfCbMv4V2krf18FWV13czKQp8IWmlIzINa+oau+VPAYv8Qn2Bpa2WvTq32RAeTw0MV+HEz2AprgP6hVQSMqjhOXNIWHta7wOxCe4hjoJGTFvgvrVPwEilQ281syJsVJ3UcRukfwor4B/Mf9GrIEmFDh0vBAMZx9Bes45xmQRRdrrPlAt/+MBK6WdKOBT8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.15; Wed, 12 Nov 2025 12:12:17 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 12:12:16 +0000
Date: Wed, 12 Nov 2025 13:12:12 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Subject: Re: [PATCH v5 05/28] drm/xe/pf: Add data structures and handlers for
 migration rings
Message-ID: <7sbwylpfenys7vl7nasoj45plgfnks2ek7h2dv767p3jjzd4x2@l3de4wr4qqlb>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
 <20251111010439.347045-6-michal.winiarski@intel.com>
 <3d63dc80-73cb-4952-a61f-b07399385b10@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d63dc80-73cb-4952-a61f-b07399385b10@intel.com>
X-ClientProxiedBy: VIZP296CA0006.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::7) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: a132ffc5-df93-425d-fd0b-08de21e4b7e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d29peTlwOHN0cXBXaWIxdkplVldKY0hwUEZDSWRvWDRUenN3Z1luNm91SExG?=
 =?utf-8?B?VGV6dTRRM1RReTBPWVZOcG1pUFdKVXhMd0lrSGF5Q1VmTXNkdENjQ1hwZFNX?=
 =?utf-8?B?MXhOUXUzdTlrQVVDdXh4TXlaa0VyQ3N6MVdGNkRDdVdCNVVseW0xNGp0bENn?=
 =?utf-8?B?K0RDMkc1WGRBTTd6RlExN0FoNDdLL0RVVFpLSUtKTHVuVFNWT1JDakRwMEVn?=
 =?utf-8?B?TkNpMXJyclNtR0Jsbk9RQzNxZ1UySGdza2k1RGtUQzRTREd1Q3VaeEFhanV2?=
 =?utf-8?B?RlFDYlUzWkw1eU50U0NhUndCdEVLWDZ1VitYQVBRci93end1dDJ3K0VSeEpV?=
 =?utf-8?B?NVA5WGQzUlB6TnFFR2Q1aHViTmtFbWZETzhObTFVaG9yd1V3dG9OcUdrQndq?=
 =?utf-8?B?V1FBVDZtM2Q0Ny9zSDFUMkxkTElERWFnMDMwTVd0SW0ySWlPZFljc1M5L1VF?=
 =?utf-8?B?V0wvUW9QOVhHU3dNS3dkVWtCbG1kU2NBUEovb29zc25IamtIVzdmNWRjcTVr?=
 =?utf-8?B?NGFYSnNXazYydHZOdlhOWVdTYkZjQ0oyczU5clNPSTBWVVBJL0M3TlBhWjMv?=
 =?utf-8?B?MURVRGZTcitZbWtUdVB6L1NPSEMvaEtDNkk0VmFkcXJHN0lpWFFzQXRRZUc2?=
 =?utf-8?B?SDJyVWMxT1IzbXdOcFBQcElTL1JUeUFpTU44SzM2K1huaERhMW1obERqVjU3?=
 =?utf-8?B?c3p6Ky85WjdjcGg5Wmp0RlkvYlJEMGN0ZGFQZ3o3dUN5ZXN0VkE2YjRwZnhB?=
 =?utf-8?B?Rk8wR0czM0EzdUh6MW1hMzgzQTVRc3h5bnpwd2tqTVF4UkVEWk1sTVQrT0ti?=
 =?utf-8?B?QmQ5N1prUW1RdWNXdVFjaVlrb0doYTVsN0lma282WVBLS2lCaXd1ZUxtcnht?=
 =?utf-8?B?SFlyQjh1dDRyV3JoOHlTb3IwaW9nRDlMVnBnYzRvbDdKNjVPU3Z6MFhWQVN6?=
 =?utf-8?B?dXc5SjNyM2xpSUVCemM1anFqMTRCOFp4bnJiVGk5ZmJHS200MzFxd1hzNnNx?=
 =?utf-8?B?RCtaUDZocGhkdzViTFBpLy9nVFJBOXNseFl0MkdjNEdEdXZrZ1JtVTNYYnNm?=
 =?utf-8?B?NGVjWlQ0SHhKNHN0ZENTbzFBNUF6NkhaZzZBelIzMUpMOXlWSFZ2SGV1RjBp?=
 =?utf-8?B?dVZZSzA4Z3ZiQmdNcDdSRWg3cGh3TWlDaHRyS2hWRUs1bE1SczFGdEs0WWY0?=
 =?utf-8?B?Q1BvWEp3M0tjRjgzY1BJb1NwOTlxaE5oRFBTRTNueGVhZUM1RFB1cjM1TmpK?=
 =?utf-8?B?MWlMS0Q1RklURktjK1hsM05sWXFrb0RCdGoxcGh4aWk0NkpYYlhib21QWm91?=
 =?utf-8?B?b2ovSmdaTEcySlJWU0Y5aDFLZEZwcmZrMnRsZERiTXREUTROYU5pRjFiN2lX?=
 =?utf-8?B?ZjBqYjhVZlFPVG4xZ3lEVERVR1J6LzY1ZDZMdWFJNmtDNUVnYk1XN0gxelMx?=
 =?utf-8?B?dWFBeEl2djFaMHpmSVZ1emxkWHB3cE53SW5rVFBUU3Z2YldaMnltckxXZzhP?=
 =?utf-8?B?dWFsMWZJbmVGY0RoaEhKNERUQ1JFL3RHU0UvaTN5YVRDcVducmFXdXkvM09h?=
 =?utf-8?B?TkdtN3NlMkRsZ0JkTlRmZHBpMmJHUHNIczFHMlhXMFV4ejRndG9zRzBLdndh?=
 =?utf-8?B?K2s3OHlmaVJpWkVBekxjUlhQdDhtZVFxcmNpY3IzRllOVjJDNTJZOGVQVVVX?=
 =?utf-8?B?RElwWUFpdmE5aGtRSnQzN3NQRE9jK0xUNGVUODN6bGdWNHJicGxPMGZiZ3Zz?=
 =?utf-8?B?RW1NTDNORFFQSU5sdXJNOTlFQ0pxQ09lVXJBVmM3UkcwL0xwa3ZMMnhHRmR0?=
 =?utf-8?B?NHNqcytVTmgzZGlNYkNUQ3pkRk9aREE2cVozeVJXeG1KZHYwVkUxYnRRcmNY?=
 =?utf-8?B?bnlGQzVtRUtxMjFPdDZCVmtaM3dzSkUrOWFMZnJRcU96NVZGNUx1MGpLRlla?=
 =?utf-8?Q?OI+qrhvoATa/UoTJjdaXLgphA3agvnws?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nkk3NTU1bzdsS0ZCTDlpc25pMXpucTJHNlBXVnRRR2wxbDJqK3lBcVkwTjll?=
 =?utf-8?B?eWg5czNoK1RQbE1YWjhXMXlYV1Q3LzZIWGk3RFVUTWpNTlN0ZFlLK2VPdFM1?=
 =?utf-8?B?NDNvOUV3eDdPUm9xUVRqRVhodnVENWl4dXRwYlJnOVVSbDQ4THhYTTlQOUVQ?=
 =?utf-8?B?ekFjcmN2a0JSUDM1U3pmWUZVRFZiUWp3NzUyQVhaQmV6cElVVnlBU3JGTWpm?=
 =?utf-8?B?bktRSTJmNkUwNm1DTncySmY5d1hSY3MxOCszaDJucVdZc00xNW1MVm9MMWpa?=
 =?utf-8?B?S1N6eXA1WXQ0MDE3d3lab0ZKUFptUkJ0MkdKTTc1SGo5VW5QRWs0a0E0UkV3?=
 =?utf-8?B?THo3dmNib2hhZU1STWJsbWFvWE1PQnhVN1hlSkRtaDRrWVFuSC9xZXE3SVdz?=
 =?utf-8?B?RWVkZkFDcER4L2FEZHRFbC82YVlyNUpsSDdWVXhNZ1doM284SXpETjdUNnE1?=
 =?utf-8?B?dmdMQVVEVDUzZ2RPc1UwenVCbmR1Q09sN1R1N0ZzcXVlNlE5Z25KekpjKzcx?=
 =?utf-8?B?b2RxSHhjQUxTOXQ1Q1Z1Y20vblNTRE9yRGt2bys3VFRickoxVGtNcHlVb0VL?=
 =?utf-8?B?VVJpN3l2NWNJOWdlL2dpeEJIUzl5am85SUJKTEs3MkNOZ0dXUHlmN2Q3VGc4?=
 =?utf-8?B?cjBwdkpYZ04veGxqZ1BCcDFKRWJFMjlDWGtsbEx1WlZGTkswb3BMSWpUbkV6?=
 =?utf-8?B?c2VNTTJHN2VyejZraFNNTFREeGEybkkxVjM0cWJOaTc5S1NZc3g0ejJQb2ZF?=
 =?utf-8?B?cFFFaWdTdFBUTWZqOUtIRTJ3MzdGb0M4U2ttUXVJWWxqK0hLMWtzaVhQRzVz?=
 =?utf-8?B?SVFIR3NjQWhJcGUxUWxOUGwvbUJqMFhkeElxZWthc2h4V2pGaFNDSS9tUmNE?=
 =?utf-8?B?azBJM3JJc2txVGk3QkU1MXpucmlCQkszMnk0NFdoK1NWVXJra3prZU8wcjlI?=
 =?utf-8?B?bzlDLzBYazM0ZnpNNVJKZWVQZjVXaVZjSG9qa3c5SDhXNUtTN3o4Sms3cVh2?=
 =?utf-8?B?b0FtOG5RYUIrdW1adUMwdnZJRmJHVStzL1FCRXluSlpRb2FVZXBic3JBbVhH?=
 =?utf-8?B?Vk83WERUVlluMTBYc2NUN01hRmsvK1dFcVpTME52dEcxOGNEZm9mZmJKT1dG?=
 =?utf-8?B?azlwejRjTE02ODV2UlRSSHR4Wjh3UVRDWWFDa0ZXZVMyS2FMS3E3UlFXTE9K?=
 =?utf-8?B?a2pleUtEZWgwZXg0OGFZYmpBOHhOdlM2TGVLTmJOQThNNEsxbUpPaXlGOFVB?=
 =?utf-8?B?RTlaYy9IUmpqS3V3ZjRIcjlTSlBjZmtOay9ZTkRKbStGWEQ5eUdqZWwvbzYz?=
 =?utf-8?B?UE9XOCtZTnZyNVlIMkJNdmw1MU9jR01IWVJxb1dNTDI0ZVpWKzF6cytHZmdC?=
 =?utf-8?B?ZWwra0toYUpDN1p0bS9Db2RrUGovbGtyUGVkdW1RTnkyc2x4TjE3WGh2WGhC?=
 =?utf-8?B?VXIxOFBXaGFOTVRLRUxSUGJLWTRHR3l4Uyt1eDlVSm56clhpUjcvK3lKbkJa?=
 =?utf-8?B?bEZFTzU3UXNyY3ZRZGkraFQ4RU15SllWQTY3TlIvSzV2R2psUStyRVV2UGZD?=
 =?utf-8?B?TGxrWjZ4Mm85bklIdGt6Wlo2NjI0WkJ3L0s1bjR6SDBDZE83UTlPejFSMVZS?=
 =?utf-8?B?elhCK0VvRmczVlFEaFhGMkRCdDFrWUJrTkRMZ0NtaDRuaHhodldIaVA4Y2dK?=
 =?utf-8?B?UkduN2g5d0tNVkU4aG8rbjRTM0dtZEp2U3laL3I4amV1ejI5L3BQakkxN0I3?=
 =?utf-8?B?aHBsNG9mWitJQnpMYm1nNmM4am1MSGNuWnoxemJzSjJGK25kVlVFZ0JkNWhL?=
 =?utf-8?B?cGh5SlU3Z29qNDlxK3g0WUVLWlJPUlNwUVhOYnUzRElvbjhjQzMybFZhRTdp?=
 =?utf-8?B?S1Jlemg5L0NsMnpublRlYVYvRGtsazZPKzFUZjAzYUtuK3pQSVpHNllLK3pC?=
 =?utf-8?B?L3g5c290bHNzRVdlZWZhK2ZnOEhVUU5vdUpxaXVZN3pWR1ZPejBnU3dwQlZ4?=
 =?utf-8?B?cHBQOVNjRW9ZN1RJWkJBcGFERnZZVlJ4enhac0E2SnQzWEsxc2E5d2dBSXcy?=
 =?utf-8?B?dkd3TmZXdmUyUXdpLzkyL3RkbWJlU25GQlhicHpxUHZnVEVCcUVmU0p6eVJI?=
 =?utf-8?B?MFEyNWM4SVdsUHd5RS95NzVmSTA5RElyWHJ5QWJ0b1VpWGdrVHRGMUEwWk8w?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a132ffc5-df93-425d-fd0b-08de21e4b7e9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 12:12:16.3580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8A2jAtYPRf6QGRdnbUDGwAsFnBYlnpjVOrTEQOVX1LyJrjImxfqrDUFX7KJ8JQkVdB0nT4lu76hyD4GaIP7ghCt190ma2bzdOcBPwsB280=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7621
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

On Tue, Nov 11, 2025 at 07:35:35PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 11/11/2025 2:04 AM, Michał Winiarski wrote:
> > Migration data is queued in a per-GT ptr_ring to decouple the worker
> > responsible for handling the data transfer from the .read() and .write()
> > syscalls.
> > Add the data structures and handlers that will be used in future
> > commits.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 311 +++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   6 +
> >  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  12 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 200 +++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  14 +
> >  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  11 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   3 +
> >  drivers/gpu/drm/xe/xe_sriov_packet_types.h    |  55 ++++
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 144 ++++++++
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |   7 +
> >  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   9 +
> >  drivers/gpu/drm/xe/xe_sriov_pf_types.h        |   2 +
> >  12 files changed, 761 insertions(+), 13 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_packet_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > index a571e1c02a3b4..bea19e7a4d18e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > @@ -18,7 +18,9 @@
> >  #include "xe_gt_sriov_printk.h"
> >  #include "xe_guc_ct.h"
> >  #include "xe_sriov.h"
> > +#include "xe_sriov_packet_types.h"
> >  #include "xe_sriov_pf_control.h"
> > +#include "xe_sriov_pf_migration.h"
> >  #include "xe_sriov_pf_service.h"
> >  #include "xe_tile.h"
> >  
> > @@ -185,9 +187,15 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
> >  	CASE2STR(PAUSE_FAILED);
> >  	CASE2STR(PAUSED);
> >  	CASE2STR(SAVE_WIP);
> > +	CASE2STR(SAVE_PROCESS_DATA);
> > +	CASE2STR(SAVE_WAIT_DATA);
> > +	CASE2STR(SAVE_DATA_DONE);
> >  	CASE2STR(SAVE_FAILED);
> >  	CASE2STR(SAVED);
> >  	CASE2STR(RESTORE_WIP);
> > +	CASE2STR(RESTORE_PROCESS_DATA);
> > +	CASE2STR(RESTORE_WAIT_DATA);
> > +	CASE2STR(RESTORE_DATA_DONE);
> >  	CASE2STR(RESTORE_FAILED);
> >  	CASE2STR(RESTORED);
> >  	CASE2STR(RESUME_WIP);
> > @@ -804,9 +812,51 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
> >  	return -ECANCELED;
> >  }
> >  
> > +/**
> > + * DOC: The VF SAVE state machine
> > + *
> > + * SAVE extends the PAUSED state.
> > + *
> > + * The VF SAVE state machine looks like::
> > + *
> > + *  ....PAUSED....................................................
> > + *  :                                                            :
> > + *  :     (O)<---------o                                         :
> > + *  :      |            \                                        :
> > + *  :    save          (SAVED)    (SAVE_FAILED)                  :
> > + *  :      |               ^           ^                         :
> > + *  :      |               |           |                         :
> > + *  :  ....V...............o...........o......SAVE_WIP.........  :
> > + *  :  :   |               |           |                      :  :
> > + *  :  :   |             empty         |                      :  :
> > + *  :  :   |               |           |                      :  :
> > + *  :  :   |               |           |                      :  :
> > + *  :  :   |           DATA_DONE       |                      :  :
> > + *  :  :   |               ^           |                      :  :
> > + *  :  :   |               |        error                     :  :
> > + *  :  :   |            no_data       /                       :  :
> > + *  :  :   |              /          /                        :  :
> > + *  :  :   |             /          /                         :  :
> > + *  :  :   |            /          /                          :  :
> > + *  :  :   o---------->PROCESS_DATA<----consume               :  :
> > + *  :  :                \                      \              :  :
> > + *  :  :                 \                      \             :  :
> > + *  :  :                  \                      \            :  :
> > + *  :  :                   ring_full----->WAIT_DATA           :  :
> > + *  :  :                                                      :  :
> > + *  :  :......................................................:  :
> > + *  :............................................................:
> > + *
> > + * For the full state machine view, see `The VF state machine`_.
> > + */
> > +
> >  static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> > -	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
> > +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> > +	}
> >  }
> >  
> >  static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
> > @@ -821,20 +871,58 @@ static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
> >  	pf_exit_vf_wip(gt, vfid);
> >  }
> >  
> > +static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED))
> > +		pf_enter_vf_state_machine_bug(gt, vfid);
> > +
> > +	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
> > +
> > +	pf_exit_vf_wip(gt, vfid);
> > +}
> > +
> > +static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	return 0;
> > +}
> > +
> >  static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
> >  {
> > -	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
> > +	int ret;
> > +
> > +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA))
> >  		return false;
> >  
> > -	pf_enter_vf_saved(gt, vfid);
> > +	if (xe_gt_sriov_pf_migration_ring_full(gt, vfid)) {
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> > +		return true;
> > +	}
> > +
> > +	ret = pf_handle_vf_save_data(gt, vfid);
> > +	if (ret == -EAGAIN)
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> > +	else if (ret)
> > +		pf_enter_vf_save_failed(gt, vfid);
> > +	else
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> >  
> >  	return true;
> >  }
> >  
> > +static void pf_exit_vf_save_wait_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA))
> > +		return;
> > +
> > +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> > +	pf_queue_vf(gt, vfid);
> > +}
> > +
> >  static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> >  		pf_enter_vf_wip(gt, vfid);
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> >  		pf_queue_vf(gt, vfid);
> >  		return true;
> >  	}
> > @@ -842,6 +930,53 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  	return false;
> >  }
> >  
> > +/**
> > + * xe_gt_sriov_pf_control_check_save_data_done() - Check if all save migration data was produced.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: true if all migration data was produced, false otherwise.
> > + */
> > +bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_control_check_save_failed() - Check if save processing has failed.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: true if save processing failed, false otherwise.
> > + */
> > +bool xe_gt_sriov_pf_control_check_save_failed(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_control_process_save_data() - Queue VF save migration data processing.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED))
> > +		return -EIO;
> > +
> > +	pf_exit_vf_save_wait_data(gt, vfid);
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_control_trigger_save_vf() - Start an SR-IOV VF migration data save sequence.
> >   * @gt: the &xe_gt
> > @@ -887,19 +1022,63 @@ int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid)
> >   */
> >  int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
> >  {
> > -	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED)) {
> > -		pf_enter_vf_mismatch(gt, vfid);
> > +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE)) {
> > +		xe_gt_sriov_err(gt, "VF%u save is still in progress!\n", vfid);
> >  		return -EIO;
> >  	}
> >  
> >  	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> > +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> > +	pf_enter_vf_saved(gt, vfid);
> >  
> >  	return 0;
> >  }
> >  
> > +/**
> > + * DOC: The VF RESTORE state machine
> > + *
> > + * RESTORE extends the PAUSED state.
> > + *
> > + * The VF RESTORE state machine looks like::
> > + *
> > + *  ....PAUSED....................................................
> > + *  :                                                            :
> > + *  :     (O)<---------o                                         :
> > + *  :      |            \                                        :
> > + *  :    restore      (RESTORED)  (RESTORE_FAILED)               :
> > + *  :      |               ^           ^                         :
> > + *  :      |               |           |                         :
> > + *  :  ....V...............o...........o......RESTORE_WIP......  :
> > + *  :  :   |               |           |                      :  :
> > + *  :  :   |             empty         |                      :  :
> > + *  :  :   |               |           |                      :  :
> > + *  :  :   |               |           |                      :  :
> > + *  :  :   |           DATA_DONE       |                      :  :
> > + *  :  :   |               ^           |                      :  :
> > + *  :  :   |               |        error                     :  :
> > + *  :  :   |           trailer        /                       :  :
> > + *  :  :   |              /          /                        :  :
> > + *  :  :   |             /          /                         :  :
> > + *  :  :   |            /          /                          :  :
> > + *  :  :   o---------->PROCESS_DATA<----produce               :  :
> > + *  :  :                \                      \              :  :
> > + *  :  :                 \                      \             :  :
> > + *  :  :                  \                      \            :  :
> > + *  :  :                   ring_empty---->WAIT_DATA           :  :
> > + *  :  :                                                      :  :
> > + *  :  :......................................................:  :
> > + *  :............................................................:
> > + *
> > + * For the full state machine view, see `The VF state machine`_.
> > + */
> > +
> >  static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> > -	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
> > +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> > +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE);
> > +	}
> >  }
> >  
> >  static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
> > @@ -914,20 +1093,64 @@ static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
> >  	pf_exit_vf_wip(gt, vfid);
> >  }
> >  
> > +static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
> > +		pf_enter_vf_state_machine_bug(gt, vfid);
> > +
> > +	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
> > +
> > +	pf_exit_vf_wip(gt, vfid);
> > +}
> > +
> > +static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_sriov_packet *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
> > +
> > +	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->hdr.type);
> > +
> > +	return 0;
> > +}
> > +
> >  static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
> >  {
> > -	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
> > +	int ret;
> > +
> > +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA))
> >  		return false;
> >  
> > -	pf_enter_vf_restored(gt, vfid);
> > +	if (xe_gt_sriov_pf_migration_ring_empty(gt, vfid)) {
> > +		if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE))
> > +			pf_enter_vf_restored(gt, vfid);
> > +		else
> > +			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> > +
> > +		return true;
> > +	}
> > +
> > +	ret = pf_handle_vf_restore_data(gt, vfid);
> > +	if (ret)
> > +		pf_enter_vf_restore_failed(gt, vfid);
> > +	else
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> >  
> >  	return true;
> >  }
> >  
> > +static void pf_exit_vf_restore_wait_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA))
> > +		return;
> > +
> > +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> > +	pf_queue_vf(gt, vfid);
> > +}
> > +
> >  static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> >  	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> >  		pf_enter_vf_wip(gt, vfid);
> > +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> >  		pf_queue_vf(gt, vfid);
> >  		return true;
> >  	}
> > @@ -935,6 +1158,58 @@ static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> >  	return false;
> >  }
> >  
> > +/**
> > + * xe_gt_sriov_pf_control_check_restore_failed() - Check if restore processing has failed.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: true if restore processing failed, false otherwise.
> > + */
> > +bool xe_gt_sriov_pf_control_check_restore_failed(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_control_restore_data_done() - Indicate the end of VF migration data stream.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE)) {
> > +		pf_enter_vf_state_machine_bug(gt, vfid);
> > +		return -EIO;
> > +	}
> > +
> > +	return xe_gt_sriov_pf_control_process_restore_data(gt, vfid);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_control_process_restore_data() - Queue VF restore migration data processing.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (!pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED))
> > +		return -EIO;
> > +
> > +	pf_exit_vf_restore_wait_data(gt, vfid);
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
> >   * @gt: the &xe_gt
> > @@ -1000,11 +1275,9 @@ int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid
> >  {
> >  	int ret;
> >  
> > -	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> > -		ret = pf_wait_vf_restore_done(gt, vfid);
> > -		if (ret)
> > -			return ret;
> > -	}
> > +	ret = pf_wait_vf_restore_done(gt, vfid);
> > +	if (ret)
> > +		return ret;
> >  
> >  	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED)) {
> >  		pf_enter_vf_mismatch(gt, vfid);
> > @@ -1705,9 +1978,21 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
> >  	if (pf_exit_vf_pause_save_guc(gt, vfid))
> >  		return true;
> >  
> > +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA)) {
> > +		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
> > +					control_bit_to_string(XE_GT_SRIOV_STATE_SAVE_WAIT_DATA));
> > +		return false;
> > +	}
> > +
> >  	if (pf_handle_vf_save(gt, vfid))
> >  		return true;
> >  
> > +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA)) {
> > +		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
> > +					control_bit_to_string(XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA));
> > +		return false;
> > +	}
> > +
> >  	if (pf_handle_vf_restore(gt, vfid))
> >  		return true;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> > index 0286536375d17..c36c8767f3adc 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> > @@ -16,8 +16,14 @@ void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
> >  
> >  int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
> > +bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid);
> > +bool xe_gt_sriov_pf_control_check_save_failed(struct xe_gt *gt, unsigned int vfid);
> > +int xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid);
> > +int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid);
> > +bool xe_gt_sriov_pf_control_check_restore_failed(struct xe_gt *gt, unsigned int vfid);
> > +int xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > index c0ce05818e24f..0bee910bdf07e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > @@ -32,9 +32,15 @@
> >   * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
> >   * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
> >   * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
> > + * @XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA: indicates that VF migration data is being produced.
> > + * @XE_GT_SRIOV_STATE_SAVE_WAIT_DATA: indicates that PF awaits for space in migration data ring.
> > + * @XE_GT_SRIOV_STATE_SAVE_DATA_DONE: indicates that all migration data was produced by Xe.
> >   * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
> >   * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
> >   * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.
> > + * @XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA: indicates that VF migration data is being consumed.
> > + * @XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA: indicates that PF awaits for data in migration data ring.
> > + * @XE_GT_SRIOV_STATE_RESTORE_DATA_DONE: indicates that all migration data was produced by the user.
> >   * @XE_GT_SRIOV_STATE_RESTORE_FAILED: indicates that VF restore operation has failed.
> >   * @XE_GT_SRIOV_STATE_RESTORED: indicates that VF data is restored.
> >   * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
> > @@ -70,10 +76,16 @@ enum xe_gt_sriov_control_bits {
> >  	XE_GT_SRIOV_STATE_PAUSED,
> >  
> >  	XE_GT_SRIOV_STATE_SAVE_WIP,
> > +	XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA,
> > +	XE_GT_SRIOV_STATE_SAVE_WAIT_DATA,
> > +	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
> >  	XE_GT_SRIOV_STATE_SAVE_FAILED,
> >  	XE_GT_SRIOV_STATE_SAVED,
> >  
> >  	XE_GT_SRIOV_STATE_RESTORE_WIP,
> > +	XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA,
> > +	XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA,
> > +	XE_GT_SRIOV_STATE_RESTORE_DATA_DONE,
> >  	XE_GT_SRIOV_STATE_RESTORE_FAILED,
> >  	XE_GT_SRIOV_STATE_RESTORED,
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index ca28f45aaf481..47f1d85341f7f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -7,14 +7,27 @@
> >  
> >  #include "abi/guc_actions_sriov_abi.h"
> >  #include "xe_bo.h"
> > +#include "xe_gt_sriov_pf_control.h"
> >  #include "xe_gt_sriov_pf_helpers.h"
> >  #include "xe_gt_sriov_pf_migration.h"
> >  #include "xe_gt_sriov_printk.h"
> >  #include "xe_guc.h"
> >  #include "xe_guc_ct.h"
> >  #include "xe_sriov.h"
> > +#include "xe_sriov_packet_types.h"
> >  #include "xe_sriov_pf_migration.h"
> >  
> > +#define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
> > +
> > +static struct xe_gt_sriov_migration_data *pf_pick_gt_migration(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > +	xe_gt_assert(gt, vfid != PFID);
> > +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> > +
> > +	return &gt->sriov.pf.vfs[vfid].migration;
> > +}
> > +
> >  /* Return: number of dwords saved/restored/required or a negative error code on failure */
> >  static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
> >  				      u64 addr, u32 ndwords)
> > @@ -382,6 +395,178 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
> >  }
> >  #endif /* CONFIG_DEBUG_FS */
> >  
> > +/**
> > + * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * Return: true if the ring is empty, otherwise false.
> > + */
> > +bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	return ptr_ring_empty(&pf_pick_gt_migration(gt, vfid)->ring);
> 
> nit: maybe it's time to add helper:
> 
> 	pf_pick_vf_migration_ring(gt, vfid)
> 	{
> 		return &pf_pick_gt_migration(gt, vfid)->ring;
> 	}
> 
> that could be used here and few other places below
> 
> and btw, maybe
> 
> 	s/pf_pick_gt_migration/pf_pick_vf_migration
> 
> everywhere, as we look for the "VF" data ?

Let's do that when making further changes to the related code.

> 
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_ring_full() - Check if a migration ring is full.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * Return: true if the ring is full, otherwise false.
> > + */
> > +bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	return ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + * @data: the &xe_sriov_packet
> > + *
> > + * Called by the save migration data producer (PF SR-IOV Control worker) when
> > + * processing migration data.
> > + * Wakes up the save migration data consumer (userspace), that is potentially
> > + * waiting for data when the ring was empty.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
> > +					  struct xe_sriov_packet *data)
> > +{
> > +	int ret;
> > +
> > +	ret = ptr_ring_produce(&pf_pick_gt_migration(gt, vfid)->ring, data);
> > +	if (ret)
> > +		return ret;
> > +
> > +	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_restore_consume() - Get VF restore data packet from migration ring.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * Called by the restore migration data consumer (PF SR-IOV Control worker) when
> > + * processing migration data.
> > + * Wakes up the restore migration data producer (userspace), that is
> > + * potentially waiting to add more data when the ring is full.
> > + *
> > + * Return: Pointer to &xe_sriov_packet on success,
> > + *	   NULL if ring is empty.
> > + */
> > +struct xe_sriov_packet *
> > +xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> > +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> > +	struct xe_sriov_packet *data;
> > +
> > +	data = ptr_ring_consume(&migration->ring);
> > +	if (data)
> > +		wake_up_all(wq);
> > +
> > +	return data;
> > +}
> > +
> > +static bool pf_restore_data_ready(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (xe_gt_sriov_pf_control_check_restore_failed(gt, vfid) ||
> > +	    !ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring))
> > +		return true;
> > +
> > +	return false;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_restore_produce() - Add VF restore data packet to migration ring.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + * @data: the &xe_sriov_packet
> > + *
> > + * Called by the restore migration data producer (userspace) when processing
> > + * migration data.
> > + * If the ring is full, waits until there is space.
> > + * Queues the restore migration data consumer (PF SR-IOV Control worker), that
> > + * is potentially waiting for data when the ring was empty.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
> > +					     struct xe_sriov_packet *data)
> > +{
> > +	int ret;
> > +
> > +	xe_gt_assert(gt, data->hdr.tile_id == gt->tile->id);
> > +	xe_gt_assert(gt, data->hdr.gt_id == gt->info.id);
> > +
> > +	for (;;) {
> > +		if (xe_gt_sriov_pf_control_check_restore_failed(gt, vfid))
> > +			return -EIO;
> > +
> > +		ret = ptr_ring_produce(&pf_pick_gt_migration(gt, vfid)->ring, data);
> > +		if (!ret)
> > +			break;
> > +
> > +		ret = wait_event_interruptible(*xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid),
> > +					       pf_restore_data_ready(gt, vfid));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return xe_gt_sriov_pf_control_process_restore_data(gt, vfid);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_save_consume() - Get VF save data packet from migration ring.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * Called by the save migration data consumer (userspace) when
> > + * processing migration data.
> > + * Queues the save migration data producer (PF SR-IOV Control worker), that is
> > + * potentially waiting to add more data when the ring is full.
> > + *
> > + * Return: Pointer to &xe_sriov_packet on success,
> > + *	   NULL if ring is empty and there's no more data available,
> > + *	   ERR_PTR(-EAGAIN) if the ring is empty, but data is still produced.
> > + */
> > +struct xe_sriov_packet *
> > +xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> > +	struct xe_sriov_packet *data;
> > +	int ret;
> > +
> > +	data = ptr_ring_consume(&migration->ring);
> > +	if (data) {
> > +		ret = xe_gt_sriov_pf_control_process_save_data(gt, vfid);
> > +		if (ret)
> > +			return ERR_PTR(ret);
> > +
> > +		return data;
> > +	}
> > +
> > +	if (xe_gt_sriov_pf_control_check_save_data_done(gt, vfid))
> > +		return NULL;
> > +
> > +	if (xe_gt_sriov_pf_control_check_save_failed(gt, vfid))
> > +		return ERR_PTR(-EIO);
> > +
> > +	return ERR_PTR(-EAGAIN);
> > +}
> > +
> > +static void action_ring_cleanup(void *arg)
> > +{
> > +	struct ptr_ring *r = arg;
> > +
> > +	ptr_ring_cleanup(r, NULL);
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
> >   * @gt: the &xe_gt
> > @@ -393,6 +578,7 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
> >  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> > +	unsigned int n, totalvfs;
> >  	int err;
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> > @@ -404,5 +590,19 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
> >  	if (err)
> >  		return err;
> >  
> > +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> > +	for (n = 1; n <= totalvfs; n++) {
> > +		struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, n);
> > +
> > +		err = ptr_ring_init(&migration->ring,
> > +				    XE_GT_SRIOV_PF_MIGRATION_RING_SIZE, GFP_KERNEL);
> > +		if (err)
> > +			return err;
> > +
> > +		err = devm_add_action_or_reset(xe->drm.dev, action_ring_cleanup, &migration->ring);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > index 09faeae00ddbb..b29d34a835b71 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > @@ -9,11 +9,25 @@
> >  #include <linux/types.h>
> >  
> >  struct xe_gt;
> > +struct xe_sriov_packet;
> >  
> >  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
> >  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
> >  
> > +bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
> > +bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
> > +
> > +int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
> > +					  struct xe_sriov_packet *data);
> > +struct xe_sriov_packet *
> > +xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid);
> > +
> > +int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
> > +					     struct xe_sriov_packet *data);
> > +struct xe_sriov_packet *
> > +xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid);
> > +
> >  #ifdef CONFIG_DEBUG_FS
> >  ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
> >  						char __user *buf, size_t count, loff_t *pos);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > index 9d672feac5f04..84be6fac16c8b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > @@ -7,6 +7,7 @@
> >  #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
> >  
> >  #include <linux/mutex.h>
> > +#include <linux/ptr_ring.h>
> >  #include <linux/types.h>
> >  
> >  /**
> > @@ -24,6 +25,16 @@ struct xe_gt_sriov_state_snapshot {
> >  	} guc;
> >  };
> >  
> > +/**
> > + * struct xe_gt_sriov_migration_data - GT-level per-VF migration data.
> > + *
> > + * Used by the PF driver to maintain per-VF migration data.
> > + */
> > +struct xe_gt_sriov_migration_data {
> > +	/** @ring: queue containing VF save / restore migration data */
> > +	struct ptr_ring ring;
> > +};
> > +
> >  /**
> >   * struct xe_gt_sriov_pf_migration - GT-level data.
> >   *
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> > index a64a6835ad656..812e74d3f8f80 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> > @@ -33,6 +33,9 @@ struct xe_gt_sriov_metadata {
> >  
> >  	/** @snapshot: snapshot of the VF state data */
> >  	struct xe_gt_sriov_state_snapshot snapshot;
> > +
> > +	/** @migration: per-VF migration data. */
> > +	struct xe_gt_sriov_migration_data migration;
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_packet_types.h b/drivers/gpu/drm/xe/xe_sriov_packet_types.h
> > new file mode 100644
> > index 0000000000000..e6d097a1cd5c5
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_packet_types.h
> > @@ -0,0 +1,55 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SRIOV_PACKET_TYPES_H_
> > +#define _XE_SRIOV_PACKET_TYPES_H_
> > +
> > +#include <linux/types.h>
> > +
> > +/**
> > + * struct xe_sriov_packet_hdr - Xe SR-IOV VF migration data packet header
> > + */
> > +struct xe_sriov_packet_hdr {
> > +	/** @version: migration data protocol version */
> > +	u8 version;
> > +	/** @type: migration data type */
> > +	u8 type;
> > +	/** @tile_id: migration data tile id */
> > +	u8 tile_id;
> > +	/** @gt_id: migration data gt id */
> > +	u8 gt_id;
> > +	/** @flags: migration data flags */
> > +	u32 flags;
> > +	/**
> > +	 * @offset: offset into the resource;
> > +	 * used when multiple packets of given type are used for migration
> > +	 */
> > +	u64 offset;
> > +	/** @size: migration data size  */
> > +	u64 size;
> > +} __packed;
> > +
> > +/**
> > + * struct xe_sriov_packet - Xe SR-IOV VF migration data packet
> > + */
> > +struct xe_sriov_packet {
> > +	/** @xe: the PF &xe_device this data packet belongs to */
> > +	struct xe_device *xe;
> > +	/** @vaddr: CPU pointer to payload data */
> > +	void *vaddr;
> > +	/** @remaining: payload data remaining */
> > +	size_t remaining;
> > +	/** @hdr_remaining: header data remaining */
> > +	size_t hdr_remaining;
> > +	union {
> > +		/** @bo: Buffer object with migration data */
> > +		struct xe_bo *bo;
> > +		/** @buff: Buffer with migration data */
> > +		void *buff;
> > +	};
> 
> missing kernel-doc for hdr

Oops.
CI also noticed some other entries:
Warning: drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c:143 function parameter 'data' not described in 'xe_gt_sriov_pf_migration_ggtt_restore'
Warning: drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c:353 function parameter 'data' not described in 'xe_gt_sriov_pf_migration_guc_restore'
Warning: drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c:498 function parameter 'data' not described in 'xe_gt_sriov_pf_migration_mmio_restore'
Warning: drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c:697 function parameter 'data' not described in 'xe_gt_sriov_pf_migration_vram_restore'

I'll fix them in respective places as well.

> 
> > +	struct xe_sriov_packet_hdr hdr;
> > +};
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > index 8c523c392f98b..11bc2e33373c8 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > @@ -3,8 +3,37 @@
> >   * Copyright © 2025 Intel Corporation
> >   */
> >  
> > +#include <drm/drm_managed.h>
> > +
> > +#include "xe_device.h"
> > +#include "xe_gt_sriov_pf_control.h"
> > +#include "xe_gt_sriov_pf_migration.h"
> > +#include "xe_pm.h"
> >  #include "xe_sriov.h"
> > +#include "xe_sriov_packet_types.h"
> > +#include "xe_sriov_pf_helpers.h"
> >  #include "xe_sriov_pf_migration.h"
> > +#include "xe_sriov_printk.h"
> > +
> > +static struct xe_sriov_migration_state *pf_pick_migration(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> > +
> > +	return &xe->sriov.pf.vfs[vfid].migration;
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_waitqueue() - Get waitqueue for migration.
> > + * @xe: the &xe_device
> > + * @vfid: the VF identifier
> > + *
> > + * Return: pointer to the migration waitqueue.
> > + */
> > +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	return &pf_pick_migration(xe, vfid)->wq;
> > +}
> >  
> >  /**
> >   * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
> > @@ -33,9 +62,124 @@ static bool pf_check_migration_support(struct xe_device *xe)
> >   */
> >  int xe_sriov_pf_migration_init(struct xe_device *xe)
> >  {
> > +	unsigned int n, totalvfs;
> > +
> >  	xe_assert(xe, IS_SRIOV_PF(xe));
> >  
> >  	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
> > +	if (!xe_sriov_pf_migration_supported(xe))
> > +		return 0;
> > +
> > +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> > +	for (n = 1; n <= totalvfs; n++) {
> > +		struct xe_sriov_migration_state *migration = pf_pick_migration(xe, n);
> > +
> > +		init_waitqueue_head(&migration->wq);
> > +	}
> >  
> >  	return 0;
> >  }
> > +
> > +static bool pf_migration_data_ready(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_gt *gt;
> > +	u8 gt_id;
> > +
> > +	for_each_gt(gt, xe, gt_id) {
> > +		if (xe_gt_sriov_pf_control_check_save_failed(gt, vfid) ||
> > +		    xe_gt_sriov_pf_control_check_save_data_done(gt, vfid) ||
> > +		    !xe_gt_sriov_pf_migration_ring_empty(gt, vfid))
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +static struct xe_sriov_packet *
> > +pf_migration_consume(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_packet *data;
> > +	bool more_data = false;
> > +	struct xe_gt *gt;
> > +	u8 gt_id;
> > +
> > +	for_each_gt(gt, xe, gt_id) {
> > +		data = xe_gt_sriov_pf_migration_save_consume(gt, vfid);
> > +		if (data && PTR_ERR(data) != EAGAIN)
> > +			return data;
> > +		if (PTR_ERR(data) == -EAGAIN)
> > +			more_data = true;
> > +	}
> > +
> > +	if (!more_data)
> > +		return NULL;
> > +
> > +	return ERR_PTR(-EAGAIN);
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_save_consume() - Consume a VF migration data packet from the device.
> > + * @xe: the &xe_device
> > + * @vfid: the VF identifier
> > + *
> > + * Called by the save migration data consumer (userspace) when
> > + * processing migration data.
> > + * If there is no migration data to process, wait until more data is available.
> > + *
> > + * Return: Pointer to &xe_sriov_packet on success,
> > + *	   NULL if ring is empty and no more migration data is expected,
> > + *	   ERR_PTR value in case of error.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +struct xe_sriov_packet *
> > +xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	struct xe_sriov_migration_state *migration = pf_pick_migration(xe, vfid);
> > +	struct xe_sriov_packet *data;
> > +	int ret;
> > +
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +
> > +	for (;;) {
> > +		data = pf_migration_consume(xe, vfid);
> > +		if (PTR_ERR(data) != -EAGAIN)
> > +			break;
> > +
> > +		ret = wait_event_interruptible(migration->wq,
> > +					       pf_migration_data_ready(xe, vfid));
> > +		if (ret)
> > +			return ERR_PTR(ret);
> > +	}
> > +
> > +	return data;
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_restore_produce() - Produce a VF migration data packet to the device.
> > + * @xe: the &xe_device
> > + * @vfid: the VF identifier
> > + * @data: Pointer to &xe_sriov_packet
> > + *
> > + * Called by the restore migration data producer (userspace) when processing
> > + * migration data.
> > + * If the underlying data structure is full, wait until there is space.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
> > +					  struct xe_sriov_packet *data)
> > +{
> > +	struct xe_gt *gt;
> > +
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +
> 
> shouldn't we also check hdr.version here? and abort early if hdr.type is 0?

Version was already checked when the packet backing storage got
allocated based on header. I'll add a hdr.type == 0 check.

> 
> > +	gt = xe_device_get_gt(xe, data->hdr.gt_id);
> > +	if (!gt || data->hdr.tile_id != gt->tile->id) {
> > +		xe_sriov_err_ratelimited(xe, "VF%d Invalid GT - tile:%u, GT:%u\n",
> > +					 vfid, data->hdr.tile_id, data->hdr.gt_id);
> 
> hmm, the message will look like:
> 
> 	[ ] xe 0000:00:00.0: [drm] *ERROR* PF: VF%d Invalid GT - tile:%u, GT:%u
> 
> so it could be hard to match it with the RESTORE operation, so maybe:
> 
> 	"Received invalid restore packet for VF%u (tile:%u, GT:%u)"
> or
> 	"Received invalid restore packet for VF%u (ver:%u type:%u tile:%u, GT:%u)"

Ok.

> 
> > +		return -EINVAL;
> > +	}
> > +
> > +	return xe_gt_sriov_pf_migration_restore_produce(gt, vfid, data);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > index d2b4a24165438..d48ff2ecc2308 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > @@ -7,10 +7,17 @@
> >  #define _XE_SRIOV_PF_MIGRATION_H_
> >  
> >  #include <linux/types.h>
> > +#include <linux/wait.h>
> >  
> >  struct xe_device;
> > +struct xe_sriov_packet;
> >  
> >  int xe_sriov_pf_migration_init(struct xe_device *xe);
> >  bool xe_sriov_pf_migration_supported(struct xe_device *xe);
> > +int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
> > +					  struct xe_sriov_packet *data);
> > +struct xe_sriov_packet *
> > +xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid);
> > +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > index 43ca60b8982c7..5f2062c8c0c42 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > @@ -7,6 +7,7 @@
> >  #define _XE_SRIOV_PF_MIGRATION_TYPES_H_
> >  
> >  #include <linux/types.h>
> > +#include <linux/wait.h>
> >  
> >  /**
> >   * struct xe_sriov_pf_migration - Xe device level VF migration data
> > @@ -16,4 +17,12 @@ struct xe_sriov_pf_migration {
> >  	bool supported;
> >  };
> >  
> > +/**
> > + * struct xe_sriov_migration_state - Per VF device-level migration related data
> > + */
> > +struct xe_sriov_migration_state {
> > +	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
> > +	wait_queue_head_t wq;
> > +};
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> > index b15d8ca2894c2..d1af2c0aef866 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> > @@ -24,6 +24,8 @@ struct xe_sriov_metadata {
> >  
> >  	/** @version: negotiated VF/PF ABI version */
> >  	struct xe_sriov_pf_service_version version;
> > +	/** @migration: migration state */
> > +	struct xe_sriov_migration_state migration;
> >  };
> >  
> >  /**
> 
> the rest LGTM, so with at least kernel-doc fixed/error message improved,
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 

Thanks,
-Michał
