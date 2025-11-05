Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDCAC3726D
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 18:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3678410E2E8;
	Wed,  5 Nov 2025 17:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SgOT/3zz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6386410E1ED;
 Wed,  5 Nov 2025 17:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762364577; x=1793900577;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=x+BXsgvuJALhBTZvckFe9DKJ2d1CMIJP+D2bZNxCQF0=;
 b=SgOT/3zzUcA9VE36/IkijHdakPKFsUM+pIMYPpxeGI/RstzkOe0GURAH
 NrbSntTgL7/Zbt66utD1uDqdwvmEK5uY9N3GbNR4JlLTcVkRIYqu8dT7W
 3VK+iUzmsgJ6L5JsoFKma6aNqlqV3FV84/j0PFosCH5eLmlfUFyv7o8jv
 3/Fq1N+gY8QiTK5RMIu8oOO7OGxZ7x62bCAb/4vVeTspbL9uDLUhN3PyB
 HX3Hb3irRwDzoOW11knXk0chDIV4VK4mkJ63vlCA1TwumSvGJMBhvzhza
 FMQg9mfBPMCy5mQaYVqrnsAxubpfAAO7ji+BAm/sbCyyyP3ga7e2BVPFL Q==;
X-CSE-ConnectionGUID: Vw6daeH+RjSFeij7twpD3w==
X-CSE-MsgGUID: jp7Nq/1eRuCLPDs/RBezXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68326253"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="68326253"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 09:42:57 -0800
X-CSE-ConnectionGUID: /Ywg7r8aRgKREJ5rOVGhhw==
X-CSE-MsgGUID: sYP5tkyPS5Cv2ld/vla2Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="186771726"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 09:42:57 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 09:42:56 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 09:42:56 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 09:42:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2FmNDY819lHxrdBhMEpy9W60Y7w+KycojP1elJ93awGckjouSlwR527mY8E0ybQFQvcxf1lKEshkdCZnlpOHE33fqgBl0izsqIM9h736G6/P2sHVR32RbjlL9lGUQZ+VsnkHUW1fZZ+pC5JG97tzME72pkHnVaGQucX69odNTIkYkVbDr7ErZI+LJRNCqx92HZKoW+NJmJRIxCi1oX2EaRkdCuzPfAYG61aPlmEb8Q0gy+sLraa50J5/CUUnJg9Tir3e/Ptvr8dzdkfGtvdsF1ASKgmAbCTPHvfmskfJ5uZiEvlujw2DhRosZE48NEIGftmmMyQmyjnQgLSiyEV3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbNKMz8p2LLqabQh3lhPKZcMaY+aHnz1xgrUssdCYwY=;
 b=Ct1+/yLKvFg6UXFY3wi+xnE6CTh7EyyFcI9gfmUqG432yRx4DPAlhyxkQye1fXUZnlhVIVLIcy89jYH60CEBqZhARoYJY7Drq1lAHIWoiT2xgvrpA+JRFrC0HFiw2It8hGGkd/V62mbgAItkMcdRrlhHOuB1kiQZGZXMiStSKXBs96MLwsPtWSjaUdg183W7G4O4ceevS4m/DKKUf5pgslboHpfKAnrMqz0e98fGRF33f+LZfXwNlM9AEeyX/cCppt973CAucAOC3ZaDHif9B2v4wQyCd8jR43SVSWADclx9DUrtJ8XfIDbuP8pj+dbiIBUjlM3r0N2s0Bsm2U1pOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6421.namprd11.prod.outlook.com (2603:10b6:8:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 17:42:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.013; Wed, 5 Nov 2025
 17:42:48 +0000
Date: Wed, 5 Nov 2025 11:42:44 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>, Alex Williamson <alex@shazbot.org>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 27/28] drm/intel/pciids: Add match with VFIO override
Message-ID: <mmbnihltfw76n3yrydcamss7hglr6f6h4yxlcgrdydfmdlpoks@nq7ppnq2znvm>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-28-michal.winiarski@intel.com>
 <cj3ohepcobrqmam5upr5nc6jbvb6wuhkv4akw2lm5g3rms7foo@4snkr5sui32w>
 <xewec63623hktutmcnmrvuuq4wsmd5nvih5ptm7ovdlcjcgii2@lruzhh5raltm>
 <3y2rsj2r27htdisspmulaoufy74w3rs7eramz4fezwcs6j5xuh@jzjrjasasryz>
 <20251104192714.GK1204670@ziepe.ca>
 <r5c2d7zcz2xemyo4mlwpzwhiix7vysznp335dqzhx3zumafrs4@62tmcvj4ccao>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <r5c2d7zcz2xemyo4mlwpzwhiix7vysznp335dqzhx3zumafrs4@62tmcvj4ccao>
X-ClientProxiedBy: SJ0PR05CA0067.namprd05.prod.outlook.com
 (2603:10b6:a03:332::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: 80327b48-ae26-4d0b-7838-08de1c92bc21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a05lMEFZaS8wbnZZZ01VNVZtSGNodlI1Q0k4Myt6ejRDMG1SbjhhcytOOWd0?=
 =?utf-8?B?clhpM2J2UlUxRHkwWkI3YnR5R2s3eDFyWkJydUVDMEFvMDN1cXE4bW4xcU1a?=
 =?utf-8?B?aHVmbDcyRFA2NENYRW93M1BiOWdheURoTm13ZzNLVFlOS0FWRDlYVUJiN3hG?=
 =?utf-8?B?ZHZtQ0tuQXI3OGRwQisxUzF0QkFkbklkRzE0MFZGcGxweDFxcVU1MlFLcktj?=
 =?utf-8?B?TjN2OEFTcG50dmI3MWx0OFhod2hVN1RwRFBGVzgraUR1cU1JdldvbFVlcUpX?=
 =?utf-8?B?MnNnSFRQWVptVkhnUkxRbXVYU0VJUzQvU1pXaW5mdU5SYURWNXlndm9HSXB3?=
 =?utf-8?B?S0pRa296azJ2QVJsc0Y2WXUyNTYrNTVlSHMvZ1g3dGdHaW5YSkxheHZLMW93?=
 =?utf-8?B?M1dTUE1sWGdweVFpUUdTYUJ3eHlsYTNtVzV0TjIwaHo3TWloMVEyQ2lNem9Z?=
 =?utf-8?B?Wjg1dFBCZnNLT3U0VjhFWEhYTkQ1RTRXa2lpMlBuL2ZnUGw3NTJ4MDM2dThX?=
 =?utf-8?B?T25pQnltKzJzQzFUTGMvWW5JWWlPWXRrc0JIOVFISmlicUtHRFVlUXkzMWtx?=
 =?utf-8?B?eGRrNlV1R05aUFJvZmN1TTU2UnRTclZqMVNOcnYrS2VyeTh6N2xzMytTWWZ5?=
 =?utf-8?B?Sjc2UHVNbG9iL3l4S2NKeHlpMEV5ZmtOTU0zNXpzeHE5U2VCNjBkKytWRWN0?=
 =?utf-8?B?UXRKSFJER0xubVNxRVZkdE9aMEZmZFNDYnNDcW85SkxzNlZPQ0RwS0xidUx6?=
 =?utf-8?B?azErd0JBQlp2Z0lsalNmdkVCYzY3ekRoNTU0dmhvNTJUdERYUUl6bmJiZW40?=
 =?utf-8?B?VWt2VTI5RVFCcTVYRHdmQnhyWmpPWFpBdXI1ejgvWlZzSllwM1ozKzk4WitH?=
 =?utf-8?B?WkorN1ZiN2xnV09iQjgzSkQxQVRBb0UwSEVXR0JJOTI2S0Q3TXRzVXdGdWJh?=
 =?utf-8?B?dHFVMDAyTkpoeGwwb0lhZ0pZVVBGM3pCRWllZzhiT1lpbFhUQmhFcHlmSnlM?=
 =?utf-8?B?V3hVcnlCZHF4Q3BHdFFiam1MQXIvczBkeU1VRjJKS0QyUVZ5UXM4cWh4cXMy?=
 =?utf-8?B?NUxROTloNXh3TmpaWDNQUEFxdGRsclhYcnBsM1Z0K2lhdm5TQUw2azFFQVFy?=
 =?utf-8?B?VEJCeXFGWFNuU0RrZk9ZSGpxRkFVL2lrMlEvYkRRMmxJOHdLTFhPRmIrMVJl?=
 =?utf-8?B?N0lwb1A2Q0IwNndWMlpFVGh1ZzJGcEJOWThST3JjMkV5K1AzdUx3NVRrVkZn?=
 =?utf-8?B?MisxRXpHSW4vUEZoNnY3d2sveXN0UWdBTmhOSVlKb2U0a29MYU1rTi9meUlv?=
 =?utf-8?B?N1hJNVlnM0VjNjRPQWt5NVJsMGFqSkVSS0dySHBtbEppbUs5dXdyM2NUejJs?=
 =?utf-8?B?UFN4V3BIN1YwREQ2NG8yZkt1eUZ5amdCNHl1dWpRRVJMWmw4YUpBUExSMG5y?=
 =?utf-8?B?NFRlVFpnZWk3RGJSRWZ3MDc2K3FpU3FCWUsyVDIwZFZLUWNKL1ZpcWVqSVR0?=
 =?utf-8?B?TXVwUFdJMHhrajY2Q1Qra0FPZFJGSWhTSGNadFAzV1I2by9Dd3pUR0srV28z?=
 =?utf-8?B?aUh1NjJOdVIwM1h2MFNQc2dmN3I4cmN3dkY2U1BaQ280bnEvTjduZHVRMkdh?=
 =?utf-8?B?T2N0RG8va0J6V0hmM285WUk0d3BqcmFTWjdGZEdXTThlcStpaktlZFFZSndu?=
 =?utf-8?B?bXBFZWRwUVcyeFdsUWlXaklBTnJCTWFBNzR4dmdlenA0N0YvM1NpV2t2azlS?=
 =?utf-8?B?Z2RDK0lPWXJZVlJkbGk5WTdzWHlranFrTEo4UEVkR2t1WXdkbFM1YzFaWEZB?=
 =?utf-8?B?RWsvRWk2aXc5TTNwOVEyRTYyeVlqVFJIYTNvRDg1eHlOZngrT204WDZIS3Vi?=
 =?utf-8?B?RTdxNGtUcHA2Q0hwQTMvUXFFSHJpa1Q4V3NMR0s2TmNQY1FSSUhaV0VvTmFu?=
 =?utf-8?Q?ORbVp4opnxUs9rbm6GnLezV/rz9hqdaL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1hFQm1DWnR6ckxINFVNd2FlRUpGLzB6cTNYZzZaVjRnVkZiZndoUW54dzRZ?=
 =?utf-8?B?NEZWZXJtOE1ocWZRMllFekp5YkN2Zjh5T242VVV1SEUrTGQxdllwaWZWWGxm?=
 =?utf-8?B?OFUyU0QzOW5QRFo5WmNFZWNIZnJjRDdlWTh0Unp3Z3FQUm9zcTczaVZROHFl?=
 =?utf-8?B?M1YvM2Q0MlRPUzBCNGJ1eFJPY3UyVm5obW5jWEp2NkpKUTU4TVljSkhvTkkx?=
 =?utf-8?B?ZnpCSXRNSkpFSVZGTElRc01INzFIYVB6VkIzUnlrVkVZOGJ3OXhIWjI4dWNK?=
 =?utf-8?B?OHVJOTloU1Y0QnJFQ056QWl6Skl4TDlJWExlMER2VnVERGdaeHdDVXNMV1V0?=
 =?utf-8?B?Y1dnREpIMmZldUowT1FjNUIzeE1lang5STMrdVBtaEpLS1VFZ0h4ZWVzdmFY?=
 =?utf-8?B?R2haV2tTTmw4Ri9tSlk2MGxCTU1TZEZJS2taYVh2eURtUGxYcGxyQnlTN2d0?=
 =?utf-8?B?VWNSRmppRmxKcVFIQXYzYWdpZW50bkdBdU0vZHRnQlNzQXZQd2t6NUtvTTNC?=
 =?utf-8?B?ZThUZThiSVhHVmliNk1Kd1VLR0dxa2ZvdEhFbU9JWUs0dzV1WVRZeFR5a0ZX?=
 =?utf-8?B?N3FrTUhYbVpGbG02VUwzN3V1eWxwTWJRVmpyNFlvVlFtb0RRbkx0eGJJQzZn?=
 =?utf-8?B?Tkg2aHpDM29vL3BvYlVIa2dSZ1BKdmtMbVNKZGZGMEJEWFJjMVFScjVQa3Bt?=
 =?utf-8?B?bVhqak51R2JiblRwN21vRGg2RFJROEJ6YTNsU1ZCTEp6QVREUEpaOUR5bmc1?=
 =?utf-8?B?b094amJwbEpJdlY1NFJWTkVPZ2FCY1ZzNzZLeUFpbWdpNmNFdExjNjVaK1pL?=
 =?utf-8?B?Tkc4bkRZSm55bEVxMFg0Mldiem8wL09lVXNHdGFnLzdGaGNhK2N5dWJRWEtS?=
 =?utf-8?B?elB2Tk5NYVVldElIV0RRaGFRMTNNOUZnU1VyU2FMUFZxdWU1ZnpQaFpHS280?=
 =?utf-8?B?aDR4ODNxTE1OaG5nUkVJRWxNUHlHRkV6bE9BM3JPN2ZoOE9sYkdUSWtIZis5?=
 =?utf-8?B?Vmkzc3djZWdRQXEvbndVakRpcUlEM0ovbFZGNTlsWlFOREFkbzFSMEQyMWdN?=
 =?utf-8?B?a2dQNkdCSURhTjVWaVY0bzNkQ292bWpvRFlBSjRaTGRpelY0eG5xbFMrOUcv?=
 =?utf-8?B?NUVJeSs0diswNWFxUjdLVERtSExadjRBU0ozVmpMRWc2L2xqM0FMZmQvNzl5?=
 =?utf-8?B?R2dRdm1hdmRQRXQvQk9mTGxpWGNUeE5pZ3R3OFhZaGp1T0hVOEpSTStjNnhk?=
 =?utf-8?B?c1pMR1dGZkZSb214REtDK2pBRjRyUTI5bjZ5RWtuNUpCZURsSjJKMWROVXNm?=
 =?utf-8?B?QkJEMFA2MEhReFpXcTY3MDZGdGNsNWNmZnZmUEUrTzJGOFZLa0tKWUJ3Tnp3?=
 =?utf-8?B?TVhwMjRBQStCU1JtZjVnNTQ1eUpBQXBtcGFPN2Fmako5RGlOU2Vzb3o0YmxY?=
 =?utf-8?B?eUZ4U1NETC93UFp6QlVjWENVVzRmeTkvV09IbFV2ejEzOUVBcHJiZjAzN3Ri?=
 =?utf-8?B?SURGYXE2bTRRZ0xQQXpKUTNuT0svT2hFdlFjN3dhT0tEMDRENVBqNjk3V0Fm?=
 =?utf-8?B?a3hCTFd0dWo1R1EwNnAwbThvYXA3UWZRTmlONEZucjI5SVJ2OC85c0J6M3Qy?=
 =?utf-8?B?QWhkY1luWlgzMDNaS3NCVXlQVGxLMDFqQnlWUTR1MnBpem9QMkg2dG1hSFg3?=
 =?utf-8?B?dWh1dkFBbE9MTVFWSmxTcURQMThUUDlla2lSUnJnc25SVjRMaHpYdjdQVDNF?=
 =?utf-8?B?Z1o4Q3FaT2xYdEtTRXI1NkJDZkE0cmYwM3laRmY1Y0dVendnWndMbVltR2tx?=
 =?utf-8?B?KzZlcFJEVitraUJsMzMza0VNUTJjczZ0QXk2RVg2R3JzWm1wQzFIaU14YnF6?=
 =?utf-8?B?Z2RqL3hFVlJwOU5MbUZJdnFiSWpOVXEvT0wyZnlHL01hRmlLeVJTRzJGR2hB?=
 =?utf-8?B?MFZhdzFDTHh5bFlmSDczR1dSRjBGdDUxelZqWFNhZm0yV1BrUHFpM2QvaWx3?=
 =?utf-8?B?VWpzcVRkNjJkU1Z4SjZQVkNYdDI5Z1JuYXlhTStJTUV6eEhsM0RzVkNNNTdn?=
 =?utf-8?B?NUU3SjNDUlhLMGdudVNTcE9YcFhwTWxKYURIMEt5L1pHSWl0Y2dEbzJLNVBS?=
 =?utf-8?B?ak9YbWxXU3ZMV2V1OW9tS1pmTmM2TGI4d2RacDlSQ0cyOE9raWNqaVZWZzVT?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80327b48-ae26-4d0b-7838-08de1c92bc21
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 17:42:48.3077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKNjIHFsvtmV24AUvBG5RBYbG0sIHbstk/y2NZPG+R1puL77YNSH4oeB74Ccrz8Gmo+JE9ZR79/ZmpxKRpSH4Kotv79W1a/S1d0te2+zKOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6421
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

On Wed, Nov 05, 2025 at 04:20:33PM +0100, Michał Winiarski wrote:
>On Tue, Nov 04, 2025 at 03:27:14PM -0400, Jason Gunthorpe wrote:
>> On Tue, Nov 04, 2025 at 11:41:53AM -0600, Lucas De Marchi wrote:
>>
>> > > > > +#define INTEL_VGA_VFIO_DEVICE(_id, _info) { \
>> > > > > +	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
>> > > > > +	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
>> > > > > +	.driver_data = (kernel_ulong_t)(_info), \
>> > > > > +	.override_only = PCI_ID_F_VFIO_DRIVER_OVERRIDE, \
>> > > >
>> > > > why do we need this and can't use PCI_DRIVER_OVERRIDE_DEVICE_VFIO()
>> > > > directly? Note that there are GPUs that wouldn't match the display class
>> > > > above.
>> > > >
>> > > > 	edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
>> > > > 	5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")
>> > > >
>> > > > Lucas De Marchi
>> > > >
>> > >
>> > > I'll define it on xe-vfio-pci side and use
>> >
>> > but no matter where it's defined, why do you need it to match on the
>> > class? The vid/devid should be sufficient.
>>
>> +1
>>
>> Jason
>
>I don't need to match on class.
>
>With PCI_DRIVER_OVERRIDE_DEVICE_VFIO it just becomes:
>#define INTEL_PCI_VFIO_DEVICE(_id) { \
>	PCI_DRIVER_OVERRIDE_DEVICE_VFIO(PCI_VENDOR_ID_INTEL, (_id)) \
>}
>
>static const struct pci_device_id xe_vfio_pci_table[] = {
>	INTEL_PTL_IDS(INTEL_PCI_VFIO_DEVICE),
>	INTEL_WCL_IDS(INTEL_PCI_VFIO_DEVICE),
>	INTEL_BMG_IDS(INTEL_PCI_VFIO_DEVICE),
>	{}
>};
>
>So, no matching on class, but I still do need a helper macro.

yeah, that lgtm

thanks
Lucas De Marchi

>
>Thanks,
>-Michał
