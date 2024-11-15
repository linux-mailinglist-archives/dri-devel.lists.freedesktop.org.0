Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149B29CF389
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 19:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2612810E18E;
	Fri, 15 Nov 2024 18:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZIWAfl/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E331A10E18E;
 Fri, 15 Nov 2024 18:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731693856; x=1763229856;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mN50RIYXX1ARr/rNVuYZQCVtzOTHPQlI5Oij0sMwZ7k=;
 b=CZIWAfl/80RaRFk5Hve/f5StJJ08ujTAoYQi1Mw8MkuxRKsDLpWw0l4H
 Duy46JBUdSzCAnkHEGmPuN4KI7dZkimLJbel/CuWYIlPLZKW/7pcNgqXv
 js3xC7WTx6n67DSarMG8PXqeQ/eKkfB0y4gXQsXU0qsz4rLQxS0vb+bQ7
 PsSUjEUETMOD4QyCKNaSA79FiFN7nmrce12BForkgtHl/xTuf06Dq63FZ
 z3Rhp2yrmcDPGQrBMDfErsbfSUvPcdaexFD2YAU9PPmDakaFFwDCvrfOd
 9CjR0MerFsQn6b69mmsDUwzzHwxycTpMZhNb77fN4iW45y4Wna4TMcSrR Q==;
X-CSE-ConnectionGUID: 9Gb0U89ZQ3y+VGXYW38I8g==
X-CSE-MsgGUID: Yxsf14btSYC59mRsVhIA7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31095196"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="31095196"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 10:04:08 -0800
X-CSE-ConnectionGUID: ++6jkSkRS3ysRNjAvGsX9w==
X-CSE-MsgGUID: j68TWkw0RsW22WFeeUGc8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="92708522"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 10:04:08 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 10:04:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 10:04:07 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 10:04:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YlGQ8S3axwXROpNCTxEVE0NxkOj79049u+qlh2sz7ElgShXb/xdPKUWSsGaPVhtfRi9TWexcCPVM0xwzCepRqPt+9wBghO/2s2zIX0UPoz4/sVT9GTLPywbdENekVNo6WYFp0r8M9E122XbtHU9umebG2lYzh20Mc0DtwcyUMgZcI7oguh4AQR4YI5/CuRj4enQSpD4EemXI3AC5lR9KqcCX5DeZ3zXBY/nEri+X2DnWU7kQ7lyiY4MEQYD+MuLS3sDzkQuW9nz4QJb1txjN9mT1ez02NeeiP7THuSbsR2oFUo7OfzRBtpxKcIpvHQbDzUWf7hj+MhOROL01dJqQWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lCbDgVBvMU65XY312NU73nW/BJz97hO77RcbKA1asw=;
 b=aiJ9qsFRA+0nZKEQPYo2ji25rkmcEeIb3H9cpyvHjiXpVKV5GM433x5ogWqdlvrlKT/8iQfYu1Lmq2fKqgCswE8HNlAO2EhYZe+5/OZgoH0BD2k5tcjb82j8YhicLF8lgW8YU9V9VUxArvU79uwZILXHaaQ92eQQcQuw0vx2W6dkmKIA89sV8Kwmmn4q0xjaqnCbEoZSu33U7rhahq5X5HbVQGpNLiyj6QS7EY+NtgVPYXuDbI+PFs83IZ387IjzaiVE9eqtFoC2FXAcdnPyo/Xtpyh4EbF/H28QUwYTlgPBp/meLSVc3SfpqXpPuxTwjc8VOsSZ6+IDp9NBNxIEWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB8187.namprd11.prod.outlook.com (2603:10b6:610:160::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Fri, 15 Nov
 2024 18:04:03 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 18:04:02 +0000
Date: Fri, 15 Nov 2024 10:04:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Su Hui <suhui@nfschina.com>
CC: <balasubramani.vivekanandan@intel.com>, <lucas.demarchi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nathan@kernel.org>, <ndesaulniers@google.com>, <morbo@google.com>,
 <justinstitt@google.com>, <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2] drm/xe/hw_engine_group: Fix bad free in
 xe_hw_engine_setup_groups()
Message-ID: <ZzeNM5dmKb22VoRw@lstrano-desk.jf.intel.com>
References: <20241115024941.3737042-1-suhui@nfschina.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241115024941.3737042-1-suhui@nfschina.com>
X-ClientProxiedBy: MW3PR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:303:2a::8) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: 18e3ed5b-d5d4-4d0e-9a34-08dd059fe31f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnNta25QZmJaeE1XdFplS2ZMV2NXS1E4Tlg0OEhqY2ZpcUVsUXAyS0dOMngw?=
 =?utf-8?B?SHhtVEdpdWdCL1BqZndrbzZaQ2xmaGRycDRiYlMweGczakRUbW44VElrdHcy?=
 =?utf-8?B?ZXUxZy96ZmhaZnl4R1dvc25Xc0lFdXF2Qm4yY1g3alNYcXRTN0ZwK05KWHln?=
 =?utf-8?B?ajkwRExQbHhQc2RVd1hyTWxWYTk4alJENDJJRzBuVXJGZVYwdmhtdmYraXRL?=
 =?utf-8?B?d0tZM2ZudEt0VmJnT1dVRWFqRGJIZWZTYmQ4TzZ4VVBFWEpYMWlhQU9KVC9Y?=
 =?utf-8?B?dWtJRUlhVE1XaXYrYzlmQjJBQ29JQlhEcEtkL1I1Y0h4RHNUa1I5ZUIzbXRt?=
 =?utf-8?B?VUxZYVBSZDNlaDFrRFBYSG9uWk9BY2U3RU42MkQ5amx1ME1sTUxEaGNrUVVT?=
 =?utf-8?B?a1daeUhXM2dSNzFkZGZmaTJxQzRwQXR4TG1CYkhIS0s1SVdVS2VldHU0ZUxU?=
 =?utf-8?B?ZWx0Q3FoaG9pSzJnUG1sc0hMdUg3djlkK1NQM1VzQk5iR3ZtUlU4UDJGM3l0?=
 =?utf-8?B?Qm9KYVhXVVN6Y3pWd2NzNlkrR1M5aWd0dE1TaHRDRFk5cUxNOG9QRFA3ajBp?=
 =?utf-8?B?L2RoU0l6TEFFUG1VdWJETzQ4cFN1ZlNUQ0o5K1NXVERBblFVVENMQ3NEemZQ?=
 =?utf-8?B?Q2xCWm0yaWkyTzE2RzlTZnozUGJhdWxaMGo2VXF5QVNSa0dhamNyWm50cU9W?=
 =?utf-8?B?OGJwRHY5UlNmZlF5Sk0zWnBpa2xDQlpQRnFFYjJDQzA0bkZ2aWJ6a1ZFQUhS?=
 =?utf-8?B?WFRyclVDTTdQWCtxbGxBWm8wQzcwQnhyNVdtYmg2NGxmQlJTd0VKQjJ1OVdr?=
 =?utf-8?B?YWdFVSs5SGk5V0QxdUhGVUFkTmk2N09OeFBiZ0tjNEV6NTBOY3RGS1BPNFRK?=
 =?utf-8?B?UGxXa0swNnBBWk9EQldQN0paYkI2M0U4cEJnWnEvUGtUTmVSeSs0aERXck13?=
 =?utf-8?B?YXJKYnczT0pLbXJPOVdiaTMwbmVUcDFnQVpVMmlaaThleEY0SUg4V3pCTTZr?=
 =?utf-8?B?VGUrc0M2RG10cWhtVHp1dVpXRUJ6ZEgyelRjcTNJblk3Q0RnZjAxbjJwS1FJ?=
 =?utf-8?B?Qk1KVUw5SGNSNCtha0ROL24xL1RzaExsQXdZVDNZQnBMclhRKysybDl4Sk5J?=
 =?utf-8?B?RCtsMkJwa2JhaTZycVYzaXFPMExNY3R3UyttVm1kYkVYeFgycGdCQTNvajFC?=
 =?utf-8?B?L3BCUDBPckNDSnQ5Wk5UNFljbW5QT291MS92bGtzZUNUU2pNMk5XVE1qY2xU?=
 =?utf-8?B?WTkzT1crMVdSSTc1eFc3ZmFrRis5RzdZRkZDK1VhR0xsS3lQNE9hSElqYmNH?=
 =?utf-8?B?Q0k5Ym93UHJ4ZUpNRXhMWDFGbE9HMmt4Ry9HOStmZHFHcGZZbllQUFBBbXRY?=
 =?utf-8?B?U3NrN1N6VENPSW9TNnl6dS9rK2tpTms3R3JZSHJyQ094Wi9ZclBNaE8wck16?=
 =?utf-8?B?TWFmZnNVSGd6TmVkV2hZQUtIb1BSQ20rZDV6WDdiQ21VaWptNXZHR2xTdFF5?=
 =?utf-8?B?OFpUc3FzS0hPR25ocDlCL2k1ZmV2RDRwTGpPRHVVcnVkU3hmdTRSUU11NGhq?=
 =?utf-8?B?cjNTTUQ4L3puN0hDajRxY3BWOTdDaDdLY1F1b0RVTkU2OFd1WGRraTRMcDhF?=
 =?utf-8?B?MnQ1WnllL2ZzSk5wQmdXS2tFZDBIVEJ5L2t0MUhha1FwT1pYV01PcFBEbUVt?=
 =?utf-8?B?RkEzNEVia0piMkJkS0ZHYnl5MFRNdWYxSjVSUmJ3dmYwalBscTZtakthcTdm?=
 =?utf-8?Q?UqXv79gU1WNd4EdOfo+51M7QTtXCOXiNqPtNJ2O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWFlVmpNcm53bnp0dVFrU3RsdGN2dVY3cVlWckRQc0xKNzVORGMyVzRqRy9v?=
 =?utf-8?B?Si9hS3U0TEZRa3R3L21FVm4zV0RmZi9ITDRTWmVhdm40N255dTRCcmZ3dWlW?=
 =?utf-8?B?TURkcjJSOEhJaDNwOXpOL3BaOFZwK2tzNEFuR1JEM25UMzBGSWVaeTgrMUY5?=
 =?utf-8?B?VWRiRU5rb3BJZld6b0pHa3JTdmFDRXZ3enZaMlRJUk1lTFo0OUR1Zzh2QXNl?=
 =?utf-8?B?bm00UktINDlQemVpSCtIejR2cU5QdC9iOHlJODRzY3ZJc0NUNkRlY0VvWURF?=
 =?utf-8?B?a3FNT3o4K0VZZmd5YkFSSituWTBtWVY0L2M5VWp0WkV0ZGN2VFAxd0tiTUha?=
 =?utf-8?B?cVF3b2diM2tyUUJ2SXl4OEJ0WVdOWSt0Yk4vQzBQUzZEeXVaZ2Q5R2NuVmZI?=
 =?utf-8?B?UjNwOG9WckVsaERMaUNmZ1A3dDAybTErTnZGRkIzWm5kdU9CVVhqenhKY3d4?=
 =?utf-8?B?ekN4MU5sTE5GcmxzandNOEZzM1ZTbWVsbFFmZklEWHBXbEU4SWJiRHdkRjRS?=
 =?utf-8?B?WnNvRGVoQlFqejFGekgwSDlFQ1ZrdytFSXZucjI5U1JKenR1RnhJamlsQVhu?=
 =?utf-8?B?Z0xIdml2UncyRkd3OU9tcFo1MmlKcUJPaGQvMDZCamNTK09DdnVrSHk3WlBT?=
 =?utf-8?B?TTdiZU1jUUg5MkZXaDdRZGtTRkZWazRMRUp1SVRKZjRCcFhGRVZQN0hlcEU2?=
 =?utf-8?B?NGZPc1FERDVxRVczKzZZR0wvT3JFd0E3NlRaQ1VlTVNEekNyaDJzdzlLeGdq?=
 =?utf-8?B?NjJSYW9laUV3b1RHeFY0aklGM1RBQUs3N0FIODFRdGd3Y2xIWkcrMjY1QUtR?=
 =?utf-8?B?YnVvTDFIR2szRlVrM1Y0YkFEc2ljSlh3SlZBMmxvVDJOTFpRMEZlejVIdVJt?=
 =?utf-8?B?ZG0zU3Y1SFVRcEZCRGNON3ZGK2ZvaUpyeHR2d0ZPdVlyb1E5ancyL094SVhM?=
 =?utf-8?B?OE1LbEVWTDFuS2s2Q3FKNWF2aGR5eC91L2ZrMjZXckIxUkN6Sm80c2Y5SVd1?=
 =?utf-8?B?TWhhUXk0ajNEMFh0VmR1N2I2QzhiSzRuN1pIWFcyaTZJNFVnZTdRbEtmNHhl?=
 =?utf-8?B?aVFaRk1xNjVDb0tOd0RERFNjS1hVQTlrZkgzR0tSbFhrWWYydmpEVVFENGtm?=
 =?utf-8?B?TXpKTTNoNTMwWjVGemladGJWbWRMT2N0OFcwVlZ2RGlOdVVkOGFzVEp5RGFa?=
 =?utf-8?B?MnYvZDhGK21Nc0F2Z3hwclRUT2hzZEdjS2I5ZkhhdVJQd0tQeENCWHZoanRL?=
 =?utf-8?B?L0FYN0dJV1RxTURjU2dCRzhuWmI3V1VBUkU4MUNHMEtVcEloZVZxOWRyU0po?=
 =?utf-8?B?MzQzT3BmcGZvQXJQejQ2eTJuVWlTNTYrWlNqVDRvVWEwZVJDdmFVcDVaQXZk?=
 =?utf-8?B?Zk1iQ3pHWmk4YWFsNDE1L3RJMk8rYmFWaGJBcTFBZEtzdTU3aW82bHZmT245?=
 =?utf-8?B?WlNWNE9sdXk5NmVNTlFDNDlJdks5S3cwRHFHcVJmQUE5Y2U0bkk5UkdYZjlX?=
 =?utf-8?B?cWZSa0hrOTdoY2VFdjgyMHpLeTVIMUxmWlJiL1JiOHhXclhDNEdrZWNDYWJR?=
 =?utf-8?B?Y0d0N0IrWFptNTJjeloxVFZSaU9xdzFBNlVjN0t4SXRrY2M2RHRvVENYZ0ZX?=
 =?utf-8?B?K3d5dUFPTXdtVGNlQWxOL0hVV2pLRmhXL05xYituRjFZSFRZUkVuQnBEaWxn?=
 =?utf-8?B?ejE2WWF1dmF1Zmx3YXg3aFIwZUlnZDJGWkxhS3JQdmorK0h1QVBVcGpQeWpr?=
 =?utf-8?B?Y1ErWEU0aVpCcTROR2FqMmFWY0hHSFI5N1dLbGZrb3ZUY3d0Y2VzR2s0cVlm?=
 =?utf-8?B?V1p5cW84NHZxU2ZGYTJQS3ZES1ozRFZJUUdWcXUxQkxuaXZEejJnZU13OHkv?=
 =?utf-8?B?ekpmdXZwTmtHVksxdE1ybXAwY3BaWnFqZmpFN0dDaWVEbUdmMDFtZlVlNHNr?=
 =?utf-8?B?TlI2V0V1eU9wZDh0WE1vcDc3QjdFaWFwTlpXRXlmSnZlUVRwV0daMjUxSG1W?=
 =?utf-8?B?eUNaTnZBQndiczV5c0h5by9tMDdBZ0xLVllOUWpKWVJrbWprdjFla0RlRzc5?=
 =?utf-8?B?TTR0NytOZHV0QVM2a3dDbnY4NmJuY1VuKzdQSjQ4ZGl1S0pjQWpxRXdYdFZz?=
 =?utf-8?B?aEtjOHYwMEw5VkpUaDdUTDdpay82ZkVaaFJrTDAzWFNHbkx2MDhXNFpic2xs?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e3ed5b-d5d4-4d0e-9a34-08dd059fe31f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 18:04:02.7357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QEkEc+3JFsjiQdsT3R8ax+5+29l8yjnmGdJCuNeVfsA9tKJMO4wqoP4A03Q9CjBbH5CkOyL9DKlCG0Q4ulTZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8187
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

On Fri, Nov 15, 2024 at 10:49:42AM +0800, Su Hui wrote:
> Clang static checker(scan-build) warning：
> drivers/gpu/drm/xe/xe_hw_engine_group.c: line 134, column 2
> Argument to kfree() is a constant address (18446744073709551604), which
> is not memory allocated by malloc().
> 
> kfree() can only handle NULL pointers instead of negitave error codes.
> When hw_engine_group_alloc() failed, there is a bad kfree call for
> negitave error codes in xe_hw_engine_setup_groups().
> 
> Free 'group' when alloc_workqueue() failed in hw_engine_group_alloc(), and
> remove wrong kfree() in xe_hw_engine_setup_groups() to fix this problem.
> It's safe to remove these kfree() because drmm_add_action_or_reset()
> can free these by calling hw_engine_group_free().
> 
> Fixes: d16ef1a18e39 ("drm/xe/exec: Switch hw engine group execution mode upon job submission")
> Fixes: f784750c670f ("drm/xe/hw_engine_group: Introduce xe_hw_engine_group")
> Signed-off-by: Su Hui <suhui@nfschina.com>

Thanks for thr fix. Look correct to me.
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> v2:
>  - remove wrong destroy_workqueue() and kfree() in v1 patch
> v1:
>  - https://lore.kernel.org/all/20241114063942.3448607-1-suhui@nfschina.com/
> 
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 32 +++++++------------------
>  1 file changed, 9 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 82750520a90a..3bfa002734ad 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -58,8 +58,10 @@ hw_engine_group_alloc(struct xe_device *xe)
>  		return ERR_PTR(-ENOMEM);
>  
>  	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", 0, 0);
> -	if (!group->resume_wq)
> +	if (!group->resume_wq) {
> +		kfree(group);
>  		return ERR_PTR(-ENOMEM);
> +	}
>  
>  	init_rwsem(&group->mode_sem);
>  	INIT_WORK(&group->resume_work, hw_engine_group_resume_lr_jobs_func);
> @@ -84,25 +86,18 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
>  	enum xe_hw_engine_id id;
>  	struct xe_hw_engine_group *group_rcs_ccs, *group_bcs, *group_vcs_vecs;
>  	struct xe_device *xe = gt_to_xe(gt);
> -	int err;
>  
>  	group_rcs_ccs = hw_engine_group_alloc(xe);
> -	if (IS_ERR(group_rcs_ccs)) {
> -		err = PTR_ERR(group_rcs_ccs);
> -		goto err_group_rcs_ccs;
> -	}
> +	if (IS_ERR(group_rcs_ccs))
> +		return PTR_ERR(group_rcs_ccs);
>  
>  	group_bcs = hw_engine_group_alloc(xe);
> -	if (IS_ERR(group_bcs)) {
> -		err = PTR_ERR(group_bcs);
> -		goto err_group_bcs;
> -	}
> +	if (IS_ERR(group_bcs))
> +		return PTR_ERR(group_bcs);
>  
>  	group_vcs_vecs = hw_engine_group_alloc(xe);
> -	if (IS_ERR(group_vcs_vecs)) {
> -		err = PTR_ERR(group_vcs_vecs);
> -		goto err_group_vcs_vecs;
> -	}
> +	if (IS_ERR(group_vcs_vecs))
> +		return PTR_ERR(group_vcs_vecs);
>  
>  	for_each_hw_engine(hwe, gt, id) {
>  		switch (hwe->class) {
> @@ -125,15 +120,6 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
>  	}
>  
>  	return 0;
> -
> -err_group_vcs_vecs:
> -	kfree(group_vcs_vecs);
> -err_group_bcs:
> -	kfree(group_bcs);
> -err_group_rcs_ccs:
> -	kfree(group_rcs_ccs);
> -
> -	return err;
>  }
>  
>  /**
> -- 
> 2.30.2
> 
