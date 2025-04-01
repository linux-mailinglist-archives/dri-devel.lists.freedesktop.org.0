Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DF1A773D2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 07:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066BA10E4E6;
	Tue,  1 Apr 2025 05:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOayyake";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2848110E25B;
 Tue,  1 Apr 2025 05:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743484961; x=1775020961;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sAgiBy+v9ZWZI5aT5SsWtEazpn+laj0VdBkGYSO6efA=;
 b=aOayyaketeXmqUg4/SYtMIHyt7cqFkDk3pPUnMvBjh8+aVJ11cCeJk7Q
 guaWmbqHsAGdVdAwDMpro6Pv/45PKI+utV41SYRJnCSAKZkbEtc1XhoHQ
 lKIJmFHyLshvh1D+A0LVhcqUt7vWbVhJIwHuV7y39iYQHJKdCa70jJQgc
 16GuOUF2qwLnXTqvS67kkpCkGD2nRMMbBXZToGkCSMWGrV5Ii943tUPbq
 CoGdF7uua/e3v7cVCNccdy+IVYlc6Kt7bFTbQPgZS0SgcGH7PFFQCiYR5
 mfTm6Xwqyd3P9isXToW35k7zZKsGr1twXyt3tDuKQy8NEqO+4AupdR7Ou Q==;
X-CSE-ConnectionGUID: jDpJRBrNRoCU8ukXn43wXg==
X-CSE-MsgGUID: d1pzPBPLTLaymC5gFj2gqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48578868"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="48578868"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 22:22:40 -0700
X-CSE-ConnectionGUID: MigODe1fRSW8Lq/DaDnVrw==
X-CSE-MsgGUID: mxkHAn3LS82Uo5MmgaXsjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="130400602"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 22:22:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 22:22:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 22:22:39 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 22:22:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ts2G/BRywZBDXHQmdwv2i147LKcbazWme6xl0FkL1bpCM1mZt82A4FVg7sQG4akpv64EIUgyczp3DiXCjot8yXmO0mM3u96/88ZHGUyI+2riJnsZw3y0CCCVIRLxCWI57lKOyR8A64Hy2lF/kpxmkH4J2t2zZSYtZemkms8Jztbf7q2TmHs3NgG1iOVLF2MIja/D0atrMkeYHtIrK2Y2tI16DLjUiG2mZFFhYr7MYa3/XwfqggF6bcI0xRWWuVRZAKUJWoREcwV2UgUcZFT4y23yidBqJMYXZqLTGdAdXebK5CDP039GPRdORmhOUp9ApOAtUBUGX2CWr11F88g2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3lvtKjIIom3Fg5A/t1reodECQ1TBlt3zpuKQuuvQ6Y=;
 b=UO+cio8VnrpMvR1sR5NqQbx+EONo8ya4kfGfunymcaA94WsBS1D5a92SuIMmuRZ07Qqrvda92oSNXMRA+TvSi9C1nUO2MxVhve+43p0ZLP7iOTgV+kTouOnmeatVScnj8huA2DDw/kS+7cr8xhaGVJ9W0xJtcyCr/REwFczrcRNGfpkfTnZWys6z1tN6cWFwNgfDxoUucgphbcZjKvo8EeY96RY0hrrtoLP8P7bseZIzqKvkGAw6CAEUMWKd0iCRmk+KP2NBLohCpzqc3MgJ5niZpYZHpoI3cFPgtsYRxi7SUbA3pAVrTKBtiy9PdVnG/cHELDeTwlw0ctMIa/h/Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SN7PR11MB6678.namprd11.prod.outlook.com (2603:10b6:806:26a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.53; Tue, 1 Apr
 2025 05:22:10 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 05:22:10 +0000
Message-ID: <88b7b291-977a-40e1-a857-4708fae516c7@intel.com>
Date: Tue, 1 Apr 2025 10:52:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] drm/i915/display: Introduce HAS_CASF for sharpness
 support
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250321160628.2663912-1-nemesa.garg@intel.com>
 <20250321160628.2663912-3-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250321160628.2663912-3-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::18) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SN7PR11MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d2b32fc-82d7-4fa2-1e43-08dd70dd26e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlZZZXY3Z1pURElEOEowNmwzczVTdUY2ZmNISTFnQy9QVkZvZFBmeUVYQ3FS?=
 =?utf-8?B?SHJrNWxTZDYzWWJKUUVvclVBM3NSRU1kNDdQR3l0Ky9KSXEzbi9WYVcxTEhm?=
 =?utf-8?B?T3poQ3RzUkNjNDY1YlAwSWg0WXFZV1JMUzhjQ0xZU245MDNaMVZnVm56Mmhj?=
 =?utf-8?B?WDNxbmRLSEh5ZlhxenNNdFhOa2hmK1diSzVpK3pIRHlNVlZZVHZtTTZRVDdB?=
 =?utf-8?B?TEN2U1hVRDhSRXVkWU5wQmRaMC81OTJQaTFkNHhMWlBnOUtXK0swUzhsSmFm?=
 =?utf-8?B?SVl3SnA5NGtQS1p3VWNPUnYvSHhYWmF1K2t5d0ZscVN4VFpmTk5BTEd6MFk4?=
 =?utf-8?B?ZEFTRkdvRklOOGs3MTFGSjJ3andOTk4xL3MrTTQ1N1RNcldJSzI3MHFmMzFp?=
 =?utf-8?B?NERvU3BOcGhJSWtPV2xlUGxpcEY3bVM0K1pLb24weUo2dXlzaDZoL2VZNzVl?=
 =?utf-8?B?YTdpRmZyNm9RUDByOFpzQXUyaEZZTWYrSC9lV2szcFdHZHVqemdEWUVsU1Nx?=
 =?utf-8?B?b1lZR29XRnhZa3ZKRUF5bVBiOVRXdjRuRWJncWxveTJ1NXB6WTQzUnFMcUJz?=
 =?utf-8?B?OXhIRUNBc1pMR25KTlhQQXgxQzNjU3VHSTc3d1FKeHZGbHNRZ0NyZ29PNWNL?=
 =?utf-8?B?UXhoQlJWdVo1Titvd1Y4YWFISUZQMTVoNEtvVXdyN0czV0Jqc2VjNFpyT3Fm?=
 =?utf-8?B?N3BqUTRva1NpR2l5bXNWckJrMVdjUkk1eEE2VEk2dzhHSGJEeW8wbHF5NWRh?=
 =?utf-8?B?VjZTQTQwZnZxVWxDNHp6Z3dSWTErYzR5cWx1L2g4UU1mM3FZRS9Ia1NJbUdU?=
 =?utf-8?B?RjVScVpxQ2RUdXZGbEQ2MEV4eU5mMFd2V0xoV0p6VGdsNlB4WG4vRlVtNDVV?=
 =?utf-8?B?L0VUaWtTdE9pSjIyb0RRQ1liRldmVlpGdVJCdytXeWpxVkNaNWRCSjJZVis0?=
 =?utf-8?B?WXc3eExkUnNQdDRJUmt5cnJQSkVGc2c0K25aN3NSUSsxamFlV1k4UUhRb1Ju?=
 =?utf-8?B?ZlBua0F3YTh3MFRCNU1nZTFWSDZ2WStFb3dVaWl0b2l2NFJqSFE5RUNoSlpC?=
 =?utf-8?B?dEQ5NnpGQ0NQaGR0MzBpTDhsRkR2RHZkWEhiNXQ1b2NvZVQrUTNXREU1OCtI?=
 =?utf-8?B?MVpjWXNRTGc3aUxmYVRTZjZsMlhOcWhEdTRNQ0NuNGNXRkdDNEdHcDZpV0RT?=
 =?utf-8?B?UVdiNDVpLyszeGhEcXJtWUNvUWcyaklZWFVjbWJqNnBENHlMYVRDMzJwbGNB?=
 =?utf-8?B?cVNDOTlNQjV3TXlYQ1djVkVKcjd6TFh0cXBiSGJKWTlpa1JSSUNjK3VsNmtw?=
 =?utf-8?B?ei8xK213WU9iSkU3TjhQaWtDRS9pWTB0NUxwMmd5bFF6ZjVFS3BBSGovT2gx?=
 =?utf-8?B?SUxNNXpCWnU3R3l1b0JHWUdGTS8vOXZWL3pZNFVod010dkVZNTNqZ0gwbDg4?=
 =?utf-8?B?UjlrWjJiWjhYd05Bb2VmdXlTN25NNTJwUkppOHZLRUtSc3YrSXZuNWlDNnJV?=
 =?utf-8?B?cXc3S0VwakdCdDJlTWhaVW5Pa0xGVFZkYVFlRXhWdmRhQkJxS1pwelhGMTAw?=
 =?utf-8?B?NXhqdUduTFd0OHFQWUV4dEl3ckgrb1Npdnd3eHZxQy9tL21KaHBJMGtNdTQ0?=
 =?utf-8?B?OVhTdVpXNVJqc0lBb01SQlFtMzk4QjBhQnFMNTJhQUM3ZHR4SGxldFBINGdU?=
 =?utf-8?B?Y2JuQmZBbElyVFFXaG14TEZ0a252STUrTUlCQmlLUTZUcFdLTFE3QXpmTjRm?=
 =?utf-8?B?dktjaEpZY2FHTXV2RE1mRGpVakRDNFJPTGN2TkEwelhiRDAzd3JSNW1TWldn?=
 =?utf-8?B?ZGFWeDFOQkY5aTBIQ3JkTUxwWW9CZ0VHckw4Ly81ZVU1YWRZMCtoU3Z6blBo?=
 =?utf-8?B?MU9EMEN2MnBDTlZoZ2pMZm40dThldi9jSys0NHVBMkxJeTJERnZGRUVaV3Vi?=
 =?utf-8?Q?I2BGqjgeOCw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUxwUHFSRlBIVW16QlZiWXdzODRKRDJmK045cml6a1VmNnhHdVhkM0F6Y3JC?=
 =?utf-8?B?ZkVybWJiSVU1RlNTQVZBTG5iUU5aNk9BdjhsRnpnSXpkU09VRllBcWVaMWk3?=
 =?utf-8?B?enh3K3Y4Q1VodnZsSFY1ckcrNFk4aG1MNjVxMHVIaFRZaVUzRWptdVFKdG1T?=
 =?utf-8?B?MFVhY2tQVFZvUVR1K3o1STBqcXhXT3llOUxZdTE4ZUxwY09mNVpzcUkwelYr?=
 =?utf-8?B?YThBV2FjUnlBREw2dENUR0NHSmk0NlowSlZSaGJCM1VNY0cxalhRUXNFR3R2?=
 =?utf-8?B?V1VOYk4xc2V4alFHbGVLRkFWMjh3YVVqZ2pCdXpJOXN1Q1EybTduZm9LMnB3?=
 =?utf-8?B?K21IczgwN0pLMk1tNFR4MmpHb29JM2tPbG0zV0pYalhlUHJ3WUxmRU11anRq?=
 =?utf-8?B?dFEycEplNFdXdFNGeHI3cWRMMUpWRHdzNVJKRFQzWHFnUXlCMTdvZjRacjNW?=
 =?utf-8?B?VGhoNTdnMnE1TzRySlgrN0NGWFZBYXZHQU5idVY3RDJBSzVCdnlYQVpLUkZk?=
 =?utf-8?B?RjhsQWFrVDU0WWJHYkIrUzZGSUNLUENRUy80NURBL2pNVGw0WG10RGRFbnJq?=
 =?utf-8?B?ZTJCSko3MDUydUVUa3Q5Yk9wQlc0RCsvSXJiSmJ0U3VSMzZMWGNnNFRxYzJE?=
 =?utf-8?B?V1h5SEdJOW41ZkdLREkvdlNVUzV4bW1rdE9tYnh3N2FhVmJpWjhwSHFHT3hl?=
 =?utf-8?B?a0FLb0p4SDkrRnhWcXZBOXdJbjNPSjdlMmNscmxTYTBhU2l1SldIc2lSZkZQ?=
 =?utf-8?B?bkJlOGR0Qkc3c29BMDYweFBQSW9aSVJieGpWeWtNWDN2elZWVG90WEdrSENR?=
 =?utf-8?B?eVFUSnQ2cEZoTjcwZE1naDA0eCsrWVlPV01OR1ZDeFgrUW5CM2FSK2JrNmFM?=
 =?utf-8?B?WWtoQnV4SG5EdW5lUTBGQVQrdGpoMGovVjFuakJWa1p4QnNNOGJNNE5EYStR?=
 =?utf-8?B?QzdoMHg1TitVUldQT3V3TVpseHdEOHVkUUhGaHN6TDVSU3lRMDJSMUdCb3Ft?=
 =?utf-8?B?ZnBGbVVPMVRsOE9EYUkrZXV0OE14OWFibytFSW1kanFIcDdlenRvY3RxU0hs?=
 =?utf-8?B?ZzJ5Njh4NUtrbTNMck5rcUFrdy93N3htemFkbDJqS21KOUE4SmRNMDlVenh4?=
 =?utf-8?B?TXJXYUVTMEt3Qmtia1VQTFhzcTFIWENDcGNFc3dwQkJDMU5yb0J6eDByQU4v?=
 =?utf-8?B?dmFGWUh5Wk5BYngyWHFkVmtmSUlPamdWbFBsYm1TeWdmaVRrMEVRM1kwNUU5?=
 =?utf-8?B?UVFhTXBMSUdDR2hnai9DVTYwTlVwbE41NlA5RkNmY0gwU0dRZThhaUo3a2Q5?=
 =?utf-8?B?MStTT2p2eUpWa05Ra2tZMlE3SnRwdGcxRmIxa3k1YUcxamFtTy9IZUJyejFV?=
 =?utf-8?B?ZzZjTXFSbkZ5YjlpVEU3elM5Z256dFdwbjNvYXVUdkhxRHJCQWZQcC9nTDN2?=
 =?utf-8?B?V0g3NmprMnBWNnpFbUlzTU5qWWwzNk5WS2YyQkpNNVFPVFZTQjdiNjBtcUpP?=
 =?utf-8?B?WFBtRXF1aXhvUE1sSFBqamNYS0lBYUpQYmNGQTZORitibjdidGV2RlBZY1Ev?=
 =?utf-8?B?RHFJbTBWbFRjcm9xZHltRjRYU1pTdE5aUUJNdHJHMnZBQzRIOXBvaDVpR2Ny?=
 =?utf-8?B?WElFbUlVbm8wQStDZ2FLeU0yRkk2VkVIOGZqYkpsbHFCeGhEY0dKR1JXK0JH?=
 =?utf-8?B?S05zaklPQjltRVZlNlFXb2o4WHA5Ryt1bXViVmRtb2U5cFovSUJseFNwbUla?=
 =?utf-8?B?aklPT1RlL0lvSXZRYVRBOHREQVFFR2xSTHFSWWZ3R3BUcC9tRWlobWxDK2VK?=
 =?utf-8?B?aDNUM2N3RktXNlgySGRYZ3lvV05OSW0yQjU1UXlkUlBXcHEybnVvMUNjWHVz?=
 =?utf-8?B?Qm9YNCtQcmIwblh0VFVKeHpwUDRSUzBkMHpxSlQ5Nkh4UDJPR2huY3F3VGt3?=
 =?utf-8?B?WTR4MWFPYzUyUVBsRUdONEpVMmxKdXJYSFRYd0MvN0h1WmRXZndiRkFNL3lK?=
 =?utf-8?B?SmNCY3B4eXgweWFtTWU0eXVFU3J6RS9zbGltQTdBRS83NWh2S25ObG1NY3Ax?=
 =?utf-8?B?VDl1YytwQkpoNmZFRzJ5QWJHalZUVDU3bktzajJhU29wekF5TDNpYUFudlZw?=
 =?utf-8?B?cmF4ZEVTaVU5Q0tIMmxvQTVMbEk5NTVJNUJpeWxxUEs2ZHhUUHo5anBtSVlp?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2b32fc-82d7-4fa2-1e43-08dd70dd26e8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 05:22:10.0590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGFb95yyJoi1UMfOpMXTvlL4vI97j4sjO/u2HTp9A87PZJDZo4svS65QQsez5pFUlO66MyeNZ2m3DmCDhwm404T0DPRk3Y4I6htvHUGpry4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6678
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


On 3/21/2025 9:36 PM, Nemesa Garg wrote:
> HAS_CASF macro will be used to check whether platform
> support the content adaptive sharpness capability or
> not.

Perhaps reworded to maintain imperative mood:

Add HAS_CASF macro to check..

Otherwise LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

>
> v2: Update commit message[Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display_device.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
> index 368b0d3417c2..09b9991beffa 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -145,6 +145,7 @@ struct intel_display_platforms {
>   #define HAS_ASYNC_FLIPS(__display)	(DISPLAY_VER(__display) >= 5)
>   #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >= 13)
>   #define HAS_BIGJOINER(__display)	(DISPLAY_VER(__display) >= 11 && HAS_DSC(__display))
> +#define HAS_CASF(__display)		(DISPLAY_VER(__display) >= 20)
>   #define HAS_CDCLK_CRAWL(__display)	(DISPLAY_INFO(__display)->has_cdclk_crawl)
>   #define HAS_CDCLK_SQUASH(__display)	(DISPLAY_INFO(__display)->has_cdclk_squash)
>   #define HAS_CMRR(__display)		(DISPLAY_VER(__display) >= 20)
