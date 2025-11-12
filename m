Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE6FC52881
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D80710E743;
	Wed, 12 Nov 2025 13:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e57IMpBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A520C10E737;
 Wed, 12 Nov 2025 13:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762955175; x=1794491175;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kNwxAqeWKoudj7dTJ0zgjEo6VQUCImNvxA2Q2HFPJZQ=;
 b=e57IMpBsMYefLt/aF1ZvcszsPCm+dbdcNVA70EfhP5pZfu2SH6ExfpZB
 26bYqACyKzrEC3phlOdPjFRUWGXk7vfDbZJIkQYwOQK9aqt+gcI5I9m6T
 DolaA8fs2mdZbcFpHe7yZS5JK0jwnCazFcwQQVqpWc6MeaMuY8up4MgOp
 Q0AsREInExdThnVN2wglx9YeybpUWMeq7C5ylJUaXbu466WiCIl0Avb0V
 ZyCuKxwUI7bbk18q8wxAwsL5fhONdiOm0raaScsE8NYDnFt5rw4cJdZTO
 U5/y9pOaJNviC7IEs1y1kFQ/MLnzPlubAybnYPxTOskSuENMYmJlHrgk4 A==;
X-CSE-ConnectionGUID: x+n0ei9XQh+tP1NiOKdY2g==
X-CSE-MsgGUID: yihH/MoWTZWl6VANGXG7qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64921978"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="64921978"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:46:15 -0800
X-CSE-ConnectionGUID: 02rbdkxqSriJHYNFwpYJhw==
X-CSE-MsgGUID: pcODwp31RNaZsPPdIFic6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188510964"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:46:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:46:14 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:46:14 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:46:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwsZEqNEpeGR5wWNnX9rH9XzUpxe3aQq3LrBq58/x+HsllylK+ipgrH33ynStxpQIIDd7g3xzPTlwYmePhPPv8li7zu2a5Mcx9gfohwcKPPn8DzgSDN9keQrNOJWcvkv4YvBrpxcAXk2EPsZTHpPKY8/IWVhWdHHnQYtYmEqAGuUZMocLBwq311Aytn9U3mH5+80SQMN1RLykL9376RwYq7C8kd4zhTLtElrrC39hjp/7ZdfzmkCy5AQrTdh7Loe5S3CDdJy/t1QvMLdfU/QQpcFaj7XsyHEfae4kabJiZ41S7bMLRIX4ysGx6s5waR4GYXBpwrg7ABMDlC+kUmDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7Y94JI3rtk5U/pCiWhDVcwwZ2abt4lF3pOklxZJNyM=;
 b=TL+o3NZRuwJ/w0pmJwLQ+rs7xjLLtHYPPcpzjrV2MsRqxEWB15G4YNt8kKlbhKtA8SvfTzQY7hPnug/ccswHm3aJsq7ItPf2JKoAfiXkPdMhqJ/cfGiZsmoUM6oDBbboZb51uPqf0r5f8wrLjbleXbGwDLuNaAPNSWb/IJGBYlCVH2uGAlWE9c9RPqLpe9Okp2tWOHPpIhEytCOpY71YILw3u3WnfRq2u3/RYAM8C2xA+QxQYRRfdc98WGHsox9RiU8NO+cwMQNRUdtnBKyqfrnFzPrwyk+dUHOVIQxc10ryZW9CFbDYPvHEKzTjtiqgzWIfxxmALCfgU5VtAFLLMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH3PPFAB4263235.namprd11.prod.outlook.com (2603:10b6:518:1::d41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:46:12 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:46:12 +0000
Date: Wed, 12 Nov 2025 14:46:08 +0100
From: "Winiarski, Michal" <michal.winiarski@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>
CC: Alex Williamson <alex@shazbot.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Yishai Hadas <yishaih@nvidia.com>, Shameer Kolothum
 <skolothumtho@nvidia.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, "Laguna, Lukasz" <lukasz.laguna@intel.com>, "Christoph
 Hellwig" <hch@infradead.org>
Subject: Re: [PATCH v5 28/28] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Message-ID: <ndd4kt4elbm7ixzyouhorgatjwv73ldyjo6bmrbipxvaqzccjs@ssavf6b5ric3>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
 <20251111010439.347045-29-michal.winiarski@intel.com>
 <BN9PR11MB527638018267BA3AF8CD49678CCFA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <7ig24norebemzdih64rcpvdj22xee23ha7bndiltkgjlpmoau2@25usxq7teedz>
 <DM4PR11MB52784CBB6C5AF6F19E373A278CCFA@DM4PR11MB5278.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB52784CBB6C5AF6F19E373A278CCFA@DM4PR11MB5278.namprd11.prod.outlook.com>
X-ClientProxiedBy: VI1PR09CA0148.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::32) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH3PPFAB4263235:EE_
X-MS-Office365-Filtering-Correlation-Id: 06aec29f-bf16-4f11-4035-08de21f1d799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajVnNHZaT1VFd2FocEZhUHRzaHRkZkFOcHZiN1RiS1laUzNuaWJmcFduSVZL?=
 =?utf-8?B?cStnK0swOHNzbkZ6cW8vbE1JYStXWFdsbWlnOVpWR2hNaHhBTXp4am5WVVBV?=
 =?utf-8?B?ejY3ZWg1RkdrMXZGWnJDRGo0cXB2aDhoVlJwSVpiNzVtWGpnK0ZTRWhZUi9i?=
 =?utf-8?B?SUZ1OCtySjRzckRXNFB4MEJxZEM5N2txYTF3RjNHajlUdXNzSi8rUVYvZk1m?=
 =?utf-8?B?ZTE0aFRBdERGQWdRK1NQWjhjTE9JZlVGQUlxLzFUUURiRitPYTFNR05Kd0FY?=
 =?utf-8?B?SFVOc3JjU05aeWhzYUlJNmVXSTIzRFM5Y0JrTVpIM3pKakhKL2xJMmw4UVV5?=
 =?utf-8?B?a29vY1hjUk5TZEVHSkpoL2plOTF3bzJ2dlBCdllQejRtRTU4Q2FabEpWZUw1?=
 =?utf-8?B?NFlLK1ovVEtXRzVSTTRmRDc4RXo0ODQ4UERjNnZhN05wYlBJeWhjQUhWY1FH?=
 =?utf-8?B?ajRXbkN2ZExvM0QrUmQ2SlFJQU9ZQkJ2U1BnR1J5Nkw4QXRRTEcvaXd3UGZP?=
 =?utf-8?B?MTJuWTA0Y1phZmF5cHNQdnNyNGRVellvbWFiS3dac3ZkYUhaa1l4SGdkM3Bj?=
 =?utf-8?B?cVc1a05IdDUrUm1CV3I0UWVWak4zcU03R2JJZmprRmdleWFzbnQyZTM4M1Nm?=
 =?utf-8?B?MnpBdndUbEM0Qm13bzc5ZTBTYVc5VTVwOTJrWGx1aEo4MU9CbldxeTUvYkJW?=
 =?utf-8?B?TW91TmQrRXlPL3JSWUtaSG1HSGxicG0yVXIzaHU0KytMK2xjcDhrTDFzQUNr?=
 =?utf-8?B?bitnVVBiL3JwdTcyeTZ5S1IwMzFzRjR2K01SQnkyKytoNDBDYXhuNVZBOGJI?=
 =?utf-8?B?WDk4cVFwRzBpcW82NmwyZHJ2T09hMmpybSt6eGpyekJ4VUdWUGJka2dDNGti?=
 =?utf-8?B?SnhPeUFQQ0ZIekM1bzlwSDBMWjVDQWZTVUtkNEtXa2tVODRIT2RMVWF5aGlJ?=
 =?utf-8?B?ems0TWdyMUladmVML0hVSEJBS3pqbjdpMnpkendJWkF5SUg4eGMraW5OVkM3?=
 =?utf-8?B?d0NHc25acVJ6ZGdJYzRNcFFRNHh3ZWZSb3RzeEFvSWFaNDhHemd1ek9KWG95?=
 =?utf-8?B?M29iU2twdDl3eENPbDZneXBGbjRTMFpZdncwOUp0bEJDaG9pOVQzWHk2TjhE?=
 =?utf-8?B?SDZkck51ejg3Y0NpMDZlbmFTU1dHZ3FOZ0NUcHJwbUtxeWRwellFMTMrbSs1?=
 =?utf-8?B?TVp4K1l3S3llRGJKYUN1VmtRTmJGclFjSFpnMldic2pDVHVWaGlxckczd1Fi?=
 =?utf-8?B?SmVMT25hQ1VRMEFyQTlQaWFkVDBMY1QrL2FraW9JWXU2OS8vT1JVSkVLSXZG?=
 =?utf-8?B?bU5CaUREZEJHYk5aZlFFT2NiSjhta3BaWWJzbUN3eXIrQ3QvM01yYk9LcHdy?=
 =?utf-8?B?VmlyVnZ0Mkw5VmJSOVhoYlFlcStiaC9XblZCd2xqSVQrSHRYMnVwY3RUVlM3?=
 =?utf-8?B?SHlXc2F6dlNLODVuN3ViQ0htMVJHK3ZJdHA0clRIZTdPR0JOZDlIdWZ3TXVI?=
 =?utf-8?B?ZTlYdXRlZEZLd1NSRGh2YmtxNjZkYkFvNXZERUwzbGlMQXAveEVmZDJtOHBk?=
 =?utf-8?B?enBZRld1dU9GcHI5MXQxWFFkOVdURU1JWldZTjVHTEgzQ21sdkhrQWFSK1o3?=
 =?utf-8?B?QTBPVzh0QXdURFp5UDZYb0pBNS9rajdtRzJISDRpc29PeW9mZ1BER1FpQnZp?=
 =?utf-8?B?dy9pWTh3UmxuZFl1NTRadmlaVkRtQ3pzSnZuQ1VnSDFHNzZacnh3M0FYdGRF?=
 =?utf-8?B?MXdDL3JZcUFtZ01ZT2tkMVZkVHJqcHRWSndreDNjVXI0MDNzVTU4VDBsaWlp?=
 =?utf-8?B?czNJRXZZdzYycy80allHRlNUVmw5eTJ1azFFa1N5bTlLUjJIQWVoV293TGM4?=
 =?utf-8?B?eGFaVWVUUXB2TWNCZWhEYjZSeUovNzRWS3lMZVJBOTg3UWJ2SU0vVDZxNEFs?=
 =?utf-8?B?Q2xWU0dKbkxMUklPdDI1aU5IRlBIVDMwbGcwNW5YRmtTdXZwRVVUWktvalEv?=
 =?utf-8?B?NDRDdmtiNkpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THp1RmQrck5WVExUam91V2w1dHp4dWJuaFlkektTb2d5YnZ6SFZ4SkJVNkpN?=
 =?utf-8?B?M0JUdzNqdDZqek9WQktJTGxqTHdJUXpJNk4wZGh6b0tZL3hrNG5tMENMemxD?=
 =?utf-8?B?VUtsWkJqaDFGQmRuY1Y4STFlc2crZ0FrY0J2MDV1cUNBV2xJTm9rSDcwMkVM?=
 =?utf-8?B?b3M4RzZleEgzV2h6dXFNWm1qRjU0dHpMQlFWM3l1Y0puVklKMWlFY3h3UE02?=
 =?utf-8?B?MTI0TEV2dXRkZXorM3ZFeThvSmRLVThnZUhERFBDNnp4dEtaWDZ1NHFSUExk?=
 =?utf-8?B?Y2hCWHd3L2tIQ2lJMkFFSjQ4NXVhUFp6U3FLNkJqMllKTllsYUttQlp6U1BH?=
 =?utf-8?B?WXlXK1JrMlFrdnEreWNRUm1aaWJUSHdCMUhqc0NRZWdDSE1HdVVhT1hsVE9Z?=
 =?utf-8?B?ZXorek9BcUZZK2JSWXI2dng5NG1STTBESE1NZDZJYnBOTUtHdlUrQng4NWJE?=
 =?utf-8?B?YWl2TlV0bXBjbDhmNVJ3alRzRXRCclp5cFRCWlFSNjVLUVh3ZSs2VHhSODhv?=
 =?utf-8?B?cTdFR2h2OXVXK3BXMG9vN0d4TWhBVzhvaWg4NGorZGdITzNpWjRtQWdhNUJk?=
 =?utf-8?B?VFpwN3RtT2d4dmowRzI2VFlZdEJrK05HSWJCU0lHVnNTRXZubVpNd3EyWUxC?=
 =?utf-8?B?SmkxQVdtQWIzUkxLaEowM2tPcVZsK0Noc0Y2Rk90K2pNL09MTmdmOW1rMnhq?=
 =?utf-8?B?TWJqWnI1Z3JFNlRrMGwyaU4wS1drUGxmV3NDUDlLN0xPNG8wOXBidklERHdT?=
 =?utf-8?B?Rjh6OVdkQnVSWThiQ1JLT3FhU25zZEVjdGhta3g4SVRnamg2SER4TjY4Zndu?=
 =?utf-8?B?dEp5UUJDMmkzK2pEY09RZklEVkg3Nm13OEpRcG9sUHdRVndPOWd6RkhVaG1K?=
 =?utf-8?B?UGFKT0FGWWdjejFlUkwyRTVuMnFHS3l1SzFDZlBUMG5yN01ldUhieVd6aE1p?=
 =?utf-8?B?UVNDT2EyYms1dEpGU0lucG8rOXd4OGdCV3U4UTBEUGlVVHFGdm1OdUtpdVQ4?=
 =?utf-8?B?S3J2WWxxU2svVDh6ZEhheVRsODRuWm9rQ08yZDVPOFVaeTdyMkdpZmdkUENx?=
 =?utf-8?B?eTZvRjRYQ1ZhZ3lHT3VLSitaMy9Lc1hNYXBjdG1pQS9EVHkyeDlTVEVtWXQ3?=
 =?utf-8?B?WGVKRGE1OUROdkVQdFBRemg5VlJhR1VoTndCMHBvTUNyRnZ2TnB2MnU4dncx?=
 =?utf-8?B?dDRYR3FydHpaN01tSUU5eXdrTTdadHRUQnNYdFUvdHNMZVBNT3lkVHFWbkpT?=
 =?utf-8?B?eUtrZEJBNStNRFFzOVdEWWFjSTlCdzZHOUM0eFVaS1pTeTVwcE1DekQ5V3NG?=
 =?utf-8?B?UVVjQk5sYWs3OXk1RCtPdzEzUlBIQTYzMm1BLzZ6MHkxWlF4V3Nvbk5zOCtI?=
 =?utf-8?B?WEEzQnk1VWl3R3hiRUdGUHYrTlFGYWNuRHZqd1pBbGQybXZyUGI1N0xRMEJl?=
 =?utf-8?B?NEpYYis1R2RJanE2MHU1b2ZTV05FNTFtTmh3SFkrbzJJQWxYLzMxdGVBTEhM?=
 =?utf-8?B?V2VqRkxhZ0hmL1BPNmZMY24xWVo1ejdibHJUSzNld2d4dVBaak9sRXhERWg0?=
 =?utf-8?B?ZWNmRGpDTGlJQjZZdnpicUdlWGJvT3ZJci9MUTBzNjFGWUh2QnFmelZZSXdE?=
 =?utf-8?B?bUpjOURDV1pNQ2V4NEJrZEZSSW45YWdjbEVHZmUvQlhmdmdsT2g5c1NlVHZ2?=
 =?utf-8?B?RzhtRmNPRnJrWGZDbUgzenhqZ3BsVU1PRE16NElZRjBmTEpjdmxKSzA0R1Bp?=
 =?utf-8?B?WllraWQ2V245U3o5Qkd4TWlKb0ZGVndIY1pkenplQy9abnlIaWlranFCNWJG?=
 =?utf-8?B?czk4ZGx6eHFVQnhXYnhTVXlCL0xNN1lGL0pBd0VJNmlzbVFIdTJ5UDVUK0JG?=
 =?utf-8?B?eHhoYTg4WWNLbEdRbjJkL0M4KzFiUmFlWHRudGlzZE5BMFNLamdtckNGbnFM?=
 =?utf-8?B?MEhNYzlvMnFSSDNqQ2RJbEkyQnhQZHJrMUZDaVdNOE5BOHdjMjdlOXZmc29l?=
 =?utf-8?B?YU1YTXRyUktpM2l4cGhRSGVDM0hadVgzRTU5cFoyd3NIOFBDeitlM01xSjd4?=
 =?utf-8?B?ZzlPRXM2TFFDRVN4aWJDLzV0eVlpQXV3WFVtalZIR08zWS9qRTlTdGpndURZ?=
 =?utf-8?B?OGxReFRRQjJYKzh1aGNLMXdCMkRGcGRwN1NxZUpEejM4bXVDTGdWMW04Z0dX?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06aec29f-bf16-4f11-4035-08de21f1d799
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:46:12.3691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFRIiiOPumdipXwp9sVVXMkYyXq6Teoc0k09On4L6KFvSArPtgV/rhpVQy18rNiEcUBuO9PrGmb39fixmbFPeVQLF1sjlcpDJRKtlAiAoSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFAB4263235
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

On Tue, Nov 11, 2025 at 10:53:16AM +0100, Tian, Kevin wrote:
> > From: Winiarski, Michal <michal.winiarski@intel.com>
> > Sent: Tuesday, November 11, 2025 4:26 PM
> > 
> > On Tue, Nov 11, 2025 at 02:38:19AM +0100, Tian, Kevin wrote:
> > > > From: Winiarski, Michal <michal.winiarski@intel.com>
> > > > Sent: Tuesday, November 11, 2025 9:05 AM
> > > > +
> > > > +	/*
> > > > +	 * As the higher VFIO layers are holding locks across reset and using
> > > > +	 * those same locks with the mm_lock we need to prevent ABBA
> > > > deadlock
> > > > +	 * with the state_mutex and mm_lock.
> > > > +	 * In case the state_mutex was taken already we defer the cleanup
> > > > work
> > > > +	 * to the unlock flow of the other running context.
> > > > +	 */
> > > > +	spin_lock(&xe_vdev->reset_lock);
> > > > +	xe_vdev->deferred_reset = true;
> > > > +	if (!mutex_trylock(&xe_vdev->state_mutex)) {
> > > > +		spin_unlock(&xe_vdev->reset_lock);
> > > > +		return;
> > > > +	}
> > > > +	spin_unlock(&xe_vdev->reset_lock);
> > > > +	xe_vfio_pci_state_mutex_unlock(xe_vdev);
> > > > +
> > > > +	xe_vfio_pci_reset(xe_vdev);
> > > > +}
> > >
> > > Jason suggested to do this in the core given it's common [1].
> > >
> > > If you disagree, then please raise it and get consensus in that thread
> > > instead of rushing to post a new version...
> > >
> > > [1] https://lore.kernel.org/all/20251108004754.GD1859178@ziepe.ca/
> > 
> > Hi,
> > 
> > I agree that it should be done in the core eventually.
> > I didn't view it as something blocking next revision, as the discussion
> > was in the context of converting every driver, which is something that
> > probably shouldn't be done as part of this series.
> 
> well it doesn't make much sense to push a new driver specific
> implementation when the core approach is preferred.

This would generally mean that accepting any new VFIO driver variant
would be blocked until core approach materializes.

Jason, can you confirm that this is indeed what you have in mind?
Just to determine how urgent the core-side changes are, and whether
there's anything we can do to help with that.

> > 
> > Note that the v6.19 feature pull for Xe is likely going to happen
> > tomorrow, so that's part of the reason for "rushing" the next version.
> > I wanted to collect all the r-bs on Xe side to be prepared for that.
> > If any parts of this series need to go through Xe tree, it will need to
> > be merged there soon (or wait all the way until v6.20 / v7).
> 
> at least the v5 cover-letter should tell something about this plan.
> instead of leaving unaddressed opens in previous version not
> mentioned at all.
> 
> then I'll leave to Alex and Rodrigo to decide the merge plan. From
> my side I didn’t feel very risky having Xe patches and VFIO patches
> go in the mainline separately - the remaining open is mostly
> contained in vfio side. 
> 
> But now only one VFIO variant driver reviewer (me) looked at this
> series in depth. Jason gave some valuable inputs but I'm afraid
> he hasn't done a thorough review yet. Not sure we are at a point 
> with confidence that the interface between VFIO/Xe has been finalized...

I posted a subset of this series separately for inclusion in Xe tree:
https://lore.kernel.org/intel-xe/20251112132220.516975-1-michal.winiarski@intel.com/

If there are any changes requested to the interface and it impacts the
underlying implementation, we'll sort it out on Xe side.

Thanks,
-Michał
