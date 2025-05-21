Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02410ABEB11
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 06:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5771510E5ED;
	Wed, 21 May 2025 04:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yi7tqwKA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD6E10E5D2;
 Wed, 21 May 2025 04:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747803249; x=1779339249;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PJYYmOeuSfLiFHTE/pnmbsfK0pzh62+JhdhvBbJz7yA=;
 b=Yi7tqwKAfdSsfeZwYIfgtbLnyvw2odtIpdCqDuVVyU5FrHNp700sLelR
 U5vSYmgjcnuPB6uu+AWJzT3+lodVSrlzXD/sEuiY47sVm93+BPIl2YVwP
 NSbJ/TyIdIrbO3huArlo+HJshvxQhaxXxN06J196MK13/UVjob5WRl2Jm
 KvFI6M9rnxzQAIOmS2cDswM+XRTeBgjvg+cB+6YTt9yf6xNIHPyDObS22
 5mcE/FeUj13id/2wvScxjcnETYum4aucHoSAWMqvbLZ6gwJf2Voaz9dsy
 dd9HyTumwSiP4GYW8mraJzzxgw4M7QPgq2tDaVzQuyxAi49CipL7FVIGf Q==;
X-CSE-ConnectionGUID: vMr//ahwRSiTjcfSHOFJuw==
X-CSE-MsgGUID: Narcph6oSx+vFonF/RZCkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60801182"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="60801182"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 21:54:09 -0700
X-CSE-ConnectionGUID: YOKlMwArQ3COCjhiAKoxDg==
X-CSE-MsgGUID: FiVgxNf3ShS9ldtEMiuXqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140433773"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 21:54:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 21:54:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 21:54:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 21:54:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRJcoNz5VXeoyRdb23KTwRZi6J4WBrQtKsmQq8L21ewwM3Ch/zWAFzngbIHcRK+sscwdOR8HnuVWS68vuHKewHP5buYb+iL+dAsZKkI5aLj9vuPyBCpBXiauozY7DHMrSlxV28Yp/N7LKWIt9JWcc0Ncto/CiKgiIoHJCI9lbNQCgQHBEb4uUY3Tr1itIX2bdMzNa33pnXKpNAtT7pyj+E/mRXPLfXHZ+g4IUs49ijq5eIRGpVx0ZG7vmjrTkWF/0bk87FILiG1UYc1WtVwhFh8CCoLxAx+eLeMwQSlhM5JkKO1w8MjTlhrYER0+uJxeFuIlqcS6Gize9yxf1RCimA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cXPnzXlrbvramN5BD2unOfPhGlZ+rXi+M+Q7X8ddFs=;
 b=cryQsJP0/N0NHSOPFbA2XeS9fIjPHz2FnORFYCYMiYli2K4/KxFSIa5ydBR9wjRpINvLvNrrfqfbf5p6U3C4MMnuwpmGBQOL/G+yLkWUNnR86v+ddu5t3Z/MCGp9xdS1kDMdVm6hLkrqxflUQibHGPiugl/3BG0blcMbjTfTfH8PvliibUEyoI56w12XBUkJWD18DvIV+1GfUN+d9LXrGr5pm8sXYKBI4+rtOlXWlxjai5JF1E7l3L7Zpas6ZqMn7uu4Zs8EDVUTILCrFK6B6wI7dm/+nOJRyLDl5Toi7DRLz694AVcB/RAoo+TQYcPJX3n1KKovOMODAxw4626l3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SN7PR11MB7511.namprd11.prod.outlook.com (2603:10b6:806:347::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 04:53:51 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%3]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 04:53:51 +0000
Message-ID: <6038d503-07ea-4085-973d-77224d45937d@intel.com>
Date: Wed, 21 May 2025 10:23:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] drm/i915/alpm: Move port alpm configuration
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20250520165326.1631330-1-jouni.hogander@intel.com>
 <20250520165326.1631330-9-jouni.hogander@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250520165326.1631330-9-jouni.hogander@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SN7PR11MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec167a4-bd5b-42e9-8c1d-08dd98237aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWFlZlNWN0lRTlh0aEsyRS81SXBuNmtYKzlsOThhS2UxeUZIR3lieEI0ajZu?=
 =?utf-8?B?RlIvTWhYdnpjQXlLOGFqZEN1VUcvVkFFNUFObnRsSDlKanRpVHlWUGh2U3BE?=
 =?utf-8?B?RWtXbVFPbzZyd0ZTK0ZNUUcxampGSU9PWEtRS3VoMVNZQ1hMT2srMDQ2dmNG?=
 =?utf-8?B?UWVkeGRNVWM5a0ZLRGY5SmVnSlNNYkdVQndRQ1JQNVV1QzJsQU4yTldRMzcw?=
 =?utf-8?B?ckxlS3Q0Y3NMRkFvZmhGdVJ0WmIxQ1o5Vjh2OWtLWm9KbmVrb3Z1Sk5zazY1?=
 =?utf-8?B?bHNLdndsV0NaTXVpQ1ZDNTlLOTNaSVk5dkJnOVZmR2UzZU1TYzVDckpISFNt?=
 =?utf-8?B?SExUNlRDWHdONkZuY1czK2pwcjQ5YTJYcVJpQ0xCYk5SN2RONTkrVWl5UVVU?=
 =?utf-8?B?TTQ2UEVMbURhM25KYk5DNjF6TndyaHBOdFYrNmFiV0VQSlB4Zm5YRHZNYWNV?=
 =?utf-8?B?R0FwQm14NTVPcWw3bHgrSVZTMjRsajRnYTFNZC9lUS9oSUtwMzhpTHZHd3hn?=
 =?utf-8?B?MUFwVjlqK24yOEk3K0VFd1VZUTkxNUJLM3R5MkRPNWtnREh2NXlNdE1iMnpT?=
 =?utf-8?B?dmF2eDAzU0FtdkZrNWVEaXhiSTZFSGhrVUpERGhxQ3FCMXoyNjYvTWh3NFJM?=
 =?utf-8?B?SkZqcXJ6UHkxRUxTaUdBTERyakVNN0ZTVVAxeHZPTk5uQk9TNnJIOUFjbjl5?=
 =?utf-8?B?cHYrMzRUL3pQNW5jZlpqbWtoT3RxMmtGMDVJallGMVdlSisyM2g2V3V3UFhw?=
 =?utf-8?B?b0RxV3I2T3ZaYnhPaWV3NTE4ZENUY0JlQXV3QTNDYzUrRW1maXg4TDFzdTdL?=
 =?utf-8?B?emVRczhvWHVDaTJObFhHc3A0NTducUZGZmZSaVpLQ2F2KzhrQTErL0hYbkha?=
 =?utf-8?B?TElRQzhZMlo3VGRSMXcrTXV6WlpOeDJLTDlRTWpid0M5djJhaGhUdGxMSVRJ?=
 =?utf-8?B?dUNLZGY1RjRjRENQMm1VZEs3NXZLNXc4dWVaTURiaFVXUjV2S0YyaFBLcUtF?=
 =?utf-8?B?WGdjdWNGUUt3Z29tUHYzbVBvcUJuNWY1bHVVdlAzekgzSGhyRXNhZnJjOUpQ?=
 =?utf-8?B?NlNNWVpRcWFvWmFabW9uOWdqTDhKbTdBN2xNUzdGV2l5QTNlSm14ei9xN3dW?=
 =?utf-8?B?NG1nbExwazZlVGtjbzV5UFlkc1B1bVY2NC9aUHFjNGZNOXl0ZmFzSnd6Nzlm?=
 =?utf-8?B?eWhzcERqc1JNMjZ0WVBoYTY0bnhLRHdOYTBORVh4YlcyenNydXh1ZCsvTXdN?=
 =?utf-8?B?bkR2VGFrQzhxb0l6VkpUWjQ5UVdSZEhVRkhCZ0IrZEo4RnZ0WGpMV3JqK3Fk?=
 =?utf-8?B?TzJUb2xpM0tUSnlIZXljekY4MklKRWh5NG5NSDhSUjlDQzVRczNkSGg1QUow?=
 =?utf-8?B?WlQ4LzV1d1M4bjlkRTZZTXRORGJ5dDBkNVQ3Tm9CWlNteHJ2Rjh6YzNUQmNY?=
 =?utf-8?B?U2FUMHQrM08rcXRQTUJHQTkyUXY2Uk9tYmhwME1rdEZqMU4yT292b1hjK1hx?=
 =?utf-8?B?WTlOcDJRaWZtSHYybzBCNXdQY1ROQmdxaFhrU1NvRlF3V0djYWRIWnpGRFpq?=
 =?utf-8?B?ZnpLWkdsUzVZTnQ0OGJEVkxpb3ZKbDBaandqbjJCamFwNURtSzlIb0hCKzRP?=
 =?utf-8?B?SDZsdnIyMjh1bW9yK0RFdlY4YzlVUTVHcG9waWhZa1JmclE1K0JLWmxCZjM4?=
 =?utf-8?B?ZVBCMTlzbVg4RDhQdm04Rk5UYm5xVlpZYUFoRSticHlPOTErT0VyNXhlTEdE?=
 =?utf-8?B?WWZreWNQcStIRHpiK2d2bjNpbmtSSDhGZzNRVlpvNW5YdTNFVldGN0JaTTdK?=
 =?utf-8?B?bWsvd0RXS2t1VnJocloydlEvdTVna0E4clJnYi9YNTF6cWtxOGpCUGxKb3Ji?=
 =?utf-8?B?NEJRalAwQVQwVUwvWmxydFBtek1GeUp1MGtPTjBNN0xEMXdLZHVvYXdNWFRI?=
 =?utf-8?Q?3l5eKuxlox8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW1MUFpyMzlaWUIrc0ljZE0xaVpDNW4zeUU1T0p1V1oySi8yWThZQkZRRkNM?=
 =?utf-8?B?ekxKSHc0TXdQY1B2WjllTE80ajN0UnBSN1BocWZxZDROTlB6REhDVTlvcHdY?=
 =?utf-8?B?OXA1empsaFpXRjJDSXRDZW5HL05HbFdkOVFXc0cxa0dXZEFONnVkTGxkTWhR?=
 =?utf-8?B?WndsNUVDWWRKTDA5WHFwT2I5MGlGSCsxVCtXdTNBRVJJYXhTeDhick04c3Uy?=
 =?utf-8?B?SlRMR3c1b3kvREtMV2xSek1jemNwdFVndFdtL0cvMUh0WW5kK0NWU2xNa0VR?=
 =?utf-8?B?Ynozak9mRGg3eDhhcFVGL2RGRFY5WjRIS09VS1hvSVR2YW04a21KMmRFRWY4?=
 =?utf-8?B?c0VWNG40Zk8yaWtrMzFqSGVndVd6OGF4S3hEallnUVpqVk41bzJjRU1JMEUw?=
 =?utf-8?B?SzE2aDlvQXhDQzBoOERINkhWMDB2UURNMXVOL2JGNjBnVnlSV2xwcGFZcjg0?=
 =?utf-8?B?bkhlc0V5VFBxZ3FVVWdaaCt2RUljbWd5V3NQV1MzUlo1RnVTZTFVaWEvc1Nx?=
 =?utf-8?B?SXlZV1NJRWYwMnpuaGtIQXFKSmUyZUNXb1hyU2dabWM4ZWRTV1MwanBhKzVV?=
 =?utf-8?B?NitlaEtweUNhU2JJcWc0MEo4R1JCOVZ6RFgxYjJrNldHc3orU3lJSWFCdGZr?=
 =?utf-8?B?WmJNT1pOUU8vcjBXZVBsOWhhOEc1aEw4YjRuMUZtdi9zMXBzZXVUTjN0eVZE?=
 =?utf-8?B?alpZbTAxanpOWG9OSlBUWEREdUFtTFlnTlhxa041VXE5c2VCV0RKOFF6SFlu?=
 =?utf-8?B?eEhBYVBEbG1OaDFWcVRwbW0vMytuQWxUTmE1bk11Q3IwS0cwQXA0M2JtN1Bo?=
 =?utf-8?B?Smh2ZjJPWFdvd1NWWUtLRXYyQjFBb2lFUjV3dldOMkRHSUJjUkVobERMOGsw?=
 =?utf-8?B?M0FEN20zNFkwUlBLTWI0Q2pmSGdmS0VWTVcwaW1sTEEveU5mQ1NTanF0T3JY?=
 =?utf-8?B?dFlDUGdnREExVjRjWlFmNUpIQ1pFd29MT05POTd2SUtrS29MY1JrT1ZJdThB?=
 =?utf-8?B?alBvY0hoMmhZeVphQjVtM1FQNEZZMjdwOFNDTjVsdjRXOWtzZFpSWDdBd1Y3?=
 =?utf-8?B?T3hPQUk0eWFsbk12d1I3cDNTNFNOTk5NcFg0c3pITEV4dWk3MVJBaXJXMldr?=
 =?utf-8?B?NUtMd0NIeFdKL2Z2QjVwTkQvY0xvQ1cyVWJhdHh2a1VONkxzOTdNZm9pNWZD?=
 =?utf-8?B?a2dndHhuT2xicmpMNkxpS0xBcjdLUjd5NGRnNGdZYnBtcGt2eUN0cGpsSE9y?=
 =?utf-8?B?T2NCTVNCbm0vNW11REtwUFdmYXNoT2J2aUdtZ0ZvVnV3ZzVBcGFBY1BaQ2dS?=
 =?utf-8?B?UGdpcU1XTlRxSXUvTEpTTHZaakZVTmlPOEJWUUhUZnhQRjdGN1JtRDM4ODVB?=
 =?utf-8?B?S2NlRFNHMkRJOVpxRVlGeXlvL0g0TThTVzRjWEhpWXlJbGVFUWlFcE9jYVRJ?=
 =?utf-8?B?blJqM1lEQVlIajFWWDRCTjJNbmx3NkpMVWxKRkY0cS9GaThMWndxb3lvcFdh?=
 =?utf-8?B?Nzg2YjBXTDJ1dStaSWdLend0a2U2Vkh3a1BiUm1PUE9YSi9yL2drRTd4TzZT?=
 =?utf-8?B?MWNwWUZmUWw1czRHdXdldDJqNDB5WWdGVG5acXE5QXRObHRUZDQ1WnBPdmMx?=
 =?utf-8?B?M3pubGg3ZWVhYU1UYm5Zcnd4c1kweU44VlNXRnY0MXpsbzBNbCt5RHlhTmM5?=
 =?utf-8?B?TE5qWlNTL085cVlhQ0o1TDIrWVNseUdVT2hxbEFaZWFTb0M0cUFyTGJPQmFD?=
 =?utf-8?B?cEN1N2huUUt2RVlWQTlDTEYzaDIwQlYyN0J0UlU4ajFOVmdHRVRzcnNERFA2?=
 =?utf-8?B?TVV5c242dVhuQjc1SWR1cmtmK1R0QytaNEJBTjk0VCtSREdvU2ZsSWhUalJP?=
 =?utf-8?B?ek12YndNbCtnVU1nRUpPT3FxS0J6M3g0cUxyM2djanBYeDlTcit2YnpJT1Rq?=
 =?utf-8?B?N2xZay9QRzFrZFdZQ2VQQnJIM1RQVjZvaEdTakVva0xLUkJQa2dUeUUxempm?=
 =?utf-8?B?cXhKTlhQUUNKWndWRHA3b3g0WGxvbkwrZUR4NFVla0R6TCt5VDg4SnMyNU1k?=
 =?utf-8?B?SHV0K2ZOdVhqaTlGQWVyMWZENUhIN1pFTDBwSXkvR3BGQkRER2xDdlZQWkxl?=
 =?utf-8?B?YVBrb0VqK2ZnWGlZK0E2UG9vV0pzc2ZreWg2WVByM0RITy9iSzZiL0wwbVd4?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec167a4-bd5b-42e9-8c1d-08dd98237aff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 04:53:51.4764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sIJoSd7SuVgRPM/alNZwmZhj7bpSjqOjBKBXud91x5IVyBs+2h140LrSibV0YgAaiWI25AJAGqleKekOc9yXrRs3FZ6MdS/47HWOegb4cNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7511
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


On 5/20/2025 10:23 PM, Jouni Högander wrote:
> It is specified in Bspec where port alpm configuration is supposed to be
> performed. Change accordingly.
>
> v2:
>    - drop HAS reference
>    - ensure PORT_ALPM registers are not writen on older platform
>
> Bspec: 68849
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_alpm.c    | 48 ++++++++++++--------
>   drivers/gpu/drm/i915/display/intel_alpm.h    |  2 +
>   drivers/gpu/drm/i915/display/intel_cx0_phy.c |  1 +
>   drivers/gpu/drm/i915/display/intel_ddi.c     |  6 +++
>   4 files changed, 39 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
> index bbcf510b0c25..dfdde8e4eabe 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -336,7 +336,6 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
>   {
>   	struct intel_display *display = to_intel_display(intel_dp);
>   	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> -	enum port port = dp_to_dig_port(intel_dp)->base.port;
>   	u32 alpm_ctl;
>   
>   	if (DISPLAY_VER(display) < 20 || (!intel_psr_needs_alpm(intel_dp, crtc_state) &&
> @@ -368,23 +367,6 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
>   				       pr_alpm_ctl);
>   		}
>   
> -		intel_de_write(display,
> -			       PORT_ALPM_CTL(port),
> -			       PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE |
> -			       PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(15) |
> -			       PORT_ALPM_CTL_MAX_PHY_SWING_HOLD(0) |
> -			       PORT_ALPM_CTL_SILENCE_PERIOD(
> -				       intel_dp->alpm_parameters.silence_period_sym_clocks));
> -
> -		intel_de_write(display,
> -			       PORT_ALPM_LFPS_CTL(port),
> -			       PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT(10) |
> -			       PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(
> -				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms) |
> -			       PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION(
> -				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms) |
> -			       PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION(
> -				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms));
>   	} else {
>   		alpm_ctl = ALPM_CTL_EXTENDED_FAST_WAKE_ENABLE |
>   			ALPM_CTL_EXTENDED_FAST_WAKE_TIME(intel_dp->alpm_parameters.fast_wake_lines);
> @@ -408,6 +390,36 @@ void intel_alpm_configure(struct intel_dp *intel_dp,
>   	intel_dp->alpm_parameters.transcoder = crtc_state->cpu_transcoder;
>   }
>   
> +void intel_alpm_port_configure(struct intel_dp *intel_dp,
> +			       const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(intel_dp);
> +	enum port port = dp_to_dig_port(intel_dp)->base.port;
> +	u32 alpm_ctl_val = 0, lfps_ctl_val = 0;
> +
> +	if (DISPLAY_VER(display) < 20)
> +		return;
> +
> +	if (intel_alpm_is_alpm_aux_less(intel_dp, crtc_state)) {
> +		alpm_ctl_val = PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE |
> +			PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(15) |
> +			PORT_ALPM_CTL_MAX_PHY_SWING_HOLD(0) |
> +			PORT_ALPM_CTL_SILENCE_PERIOD(
> +				intel_dp->alpm_parameters.silence_period_sym_clocks);
> +		lfps_ctl_val = PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT(10) |
> +			PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(
> +				intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms) |
> +			PORT_ALPM_LFPS_CTL_FIRST_LFPS_HALF_CYCLE_DURATION(
> +				intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms) |
> +			PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION(
> +				intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms);
> +	}
> +
> +	intel_de_write(display, PORT_ALPM_CTL(port), alpm_ctl_val);
> +
> +	intel_de_write(display, PORT_ALPM_LFPS_CTL(port), lfps_ctl_val);
> +}
> +
>   void intel_alpm_pre_plane_update(struct intel_atomic_state *state,
>   				 struct intel_crtc *crtc)
>   {
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
> index 86f4d5ab1981..a861c20b5d79 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.h
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.h
> @@ -27,6 +27,8 @@ void intel_alpm_enable_sink(struct intel_dp *intel_dp,
>   			    const struct intel_crtc_state *crtc_state);
>   void intel_alpm_pre_plane_update(struct intel_atomic_state *state,
>   				 struct intel_crtc *crtc);
> +void intel_alpm_port_configure(struct intel_dp *intel_dp,
> +			       const struct intel_crtc_state *crtc_state);
>   void intel_alpm_post_plane_update(struct intel_atomic_state *state,
>   				  struct intel_crtc *crtc);
>   void intel_alpm_lobf_debugfs_add(struct intel_connector *connector);
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> index a82b93cbc81d..91118d115fd3 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> @@ -10,6 +10,7 @@
>   
>   #include "i915_reg.h"
>   #include "i915_utils.h"
> +#include "intel_alpm.h"
>   #include "intel_cx0_phy.h"
>   #include "intel_cx0_phy_regs.h"
>   #include "intel_ddi.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 0e6d618b5356..65ab012c3eae 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3743,6 +3743,12 @@ static void mtl_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
>   
>   	intel_ddi_buf_enable(encoder, intel_dp->DP);
>   	intel_dp->DP |= DDI_BUF_CTL_ENABLE;
> +
> +	/*
> +	 * 6.k If AUX-Less ALPM is going to be enabled
> +	 *     i. Configure PORT_ALPM_CTL and PORT_ALPM_LFPS_CTL here
> +	 */
> +	intel_alpm_port_configure(intel_dp, crtc_state);
>   }
>   
>   static void intel_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
