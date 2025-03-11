Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4EDA5B845
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 06:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950B410E084;
	Tue, 11 Mar 2025 05:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OlJzhKm9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA69310E084;
 Tue, 11 Mar 2025 05:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741669918; x=1773205918;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TysfqwSU5JAUAl2HeGEfktypsgak4J9jQIUIHL5tVS0=;
 b=OlJzhKm968VkrToxmkX/lkrhC4PsWOaeNAe38g9yXeybAvW86zxUOva3
 f78KxANSpkHiFr/zPz598hFi8hOxJGE6WPsbtZ5Or47xj64YTVZHa3ikc
 mb7JnE+hjFv6dDFh21VEzSqT9T6jr2sHBrFi6hDqt80+sxL9OWd/870JS
 2x09LZSGldOsu9siAwthPnWql7X+z7iJT3vJRtJtDFzA/oPuxU64y8dDV
 vE2VBrW0pxj73Cg9Xos7XuIubFpnNmXx1e9ppONrnTiP2JSuD6JzT4Nl0
 mTPWUyjLNIDvJEflmMRowl05QsLI4UQ64kSXmrumox2RM2Guupqrl+tne w==;
X-CSE-ConnectionGUID: 2WEmtejJQ5yNvaRdcBsVqQ==
X-CSE-MsgGUID: b5MyVAmFRIWET71uqWdShw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="30267243"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="30267243"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 22:11:57 -0700
X-CSE-ConnectionGUID: zIxHA6kHRDi/1AsYu99KlA==
X-CSE-MsgGUID: lBWKCbqzTZmSwy6pPqu6oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="124371294"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 22:11:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 22:11:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 22:11:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 22:11:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADpN2QjA4cxZgWFlfk0LGs9w+JrdreOeY9EsyOTa3KBUT1fGMB6ydhflgbbWdBZDPZspL8lNq5RbbXt/4G3fUWwrLkENE+agc+e77dEuDqmExCgjhLq2SSEz3LL6kOmZeoL3uVdn96TeTEAtmIhiHNqee0aBr32yG6deQzjdUDm2rzJQ9xLNRGmb2UuHitJlV97F1fjiQotqZRpAGd3j0CaxNR/7H/hphQ8x3WGWGkEvtYvPrQdS8slpE6q9FCFJrAJyyY4dh8trEDIX2J8e/CnGcUQArOf1x6BIw825HJ7z//4m2tY1mXdWPeJohPbEZw33q1H/v44GjUHJJqiZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiDSm7HZwNKgByU3n1PNZZdJk1mU21tEJqePiBA/D3Q=;
 b=SsHVp5EmmhIPMSIrekNxULEsgsBn0NpsMHz+Ca+QLTQ0lv51btTa9Ad6cLuKquGjK0EpOqM3jqrriteF5W0w53UEATJyur3SGk7uzYeq68bJRhzGFZFNK1Fo5aRqPdS5gbrs4IB/TCQFXGUPUk1ANb9h8lOtdoxnUZeHWOKeHiBk2k6oh8Zb+d+yhBOh/w/tGJLvgoXOhf/MMvAbBzi3RO6qwgLdd+syWszTN1JdTJgO/fO+lmUqVgEGrUeHccFBkvWKWZZaweG2Cc5NCozVyhhp2o7rALaV0bJaQE8kmiDDzrKVCUFLOalHcRhBFgAGqL8Kf7/xXGuRYmzqTfHxCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6461.namprd11.prod.outlook.com (2603:10b6:930:33::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 05:11:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 05:11:07 +0000
Date: Mon, 10 Mar 2025 22:12:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH next] drm/xe: Fix uninitialized variable in
 xe_vm_bind_ioctl()
Message-ID: <Z8/GLyjqHlAOMhoM@lstrano-desk.jf.intel.com>
References: <4a74b296-8b51-4dab-a2f1-69919da1ca62@stanley.mountain>
 <Z88ZzoFA5KpQTLmH@intel.com>
 <95a4da90-dfa0-4033-aba5-276b3d9a1824@stanley.mountain>
 <Z8/EVnqZoYamdjTy@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z8/EVnqZoYamdjTy@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:303:b9::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb0cbd0-a7bc-4cd3-db72-08dd605b2179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bENYaHBrUDFiamM4VzB6QzZqRFQ3T3d4b2NTS2JpSjNPUnBTTnIxTzBjL1Zp?=
 =?utf-8?B?NjIzZUpCeTZ6QnYzYUhRWU1xaXppNi81cTV1cVh1ZFJqWmtTS2tvbk1iaG5h?=
 =?utf-8?B?SzFBNnNYUk1ZMDRLcEpXY1o3M2RUaldlZ05kUHlTdWRraUpJWVZvVnc0UWwr?=
 =?utf-8?B?VUxBS1ZYNi9jeWZIWlhscTlKYksxVDNMcTdENjZFa1dzL3ZOODhvWDdheVZo?=
 =?utf-8?B?MU5idldKc1JvU3dsa2NZVVdrK09hMDI5Z1ZaKzRXSHhJNXhTcTFnb1d2S2RF?=
 =?utf-8?B?VW43L2FVR2hRWVUzYml1b1FtVW80NE5MdTJUUjA4YUxtQ1V2VnRGZnZnOE81?=
 =?utf-8?B?RUlWeGlSRW9HUzBERW5WalpDTU1FMEM5QUZwdUx4bVUrckNReWZTMm5HWlpW?=
 =?utf-8?B?SW82SEg4S1dUNUZQcUtzUjBRRXcyZndGVG8xVnN4T1lISElYQndZZ3VRSTBP?=
 =?utf-8?B?NHpjUUdXNnhrRTZSY0grY0pnSTU5M1ZLU1hvZ2FSMHNRdWJSeEVjU1hFTTJX?=
 =?utf-8?B?QkZDbnBucnNlQWkzeGtoWGVlTFpmVTdFbFIvZjVPdlcyR2IyZlRlN2JwZWZC?=
 =?utf-8?B?cVdncU1pR2ZYOGVUS0hvYkhueEVod21kY1hjbHk0bktTSTFEeVVUMWYyRjdT?=
 =?utf-8?B?c3hZa21TNWpZNmxYRjZhWG94eTJQWmVpV25taWlJTHRHVC85dFBOY1BkWGNn?=
 =?utf-8?B?cmdVd1RhOHBnZWpTK1NudlpJZ20yMGtUb0dGdlM0RTRvNlYyNHRoVU14bHBI?=
 =?utf-8?B?NW1HQTRZT2NqZDNIKzNnYXhUcXJwVWNzOUc4K2pkZVRUQlV2RWF4Tks3bzYz?=
 =?utf-8?B?bUJJMTlvYWJ5dXVkWXNtcjBFdTVlaVZSZEVFeDN6RmJGMVE5aGxESUg5SXY2?=
 =?utf-8?B?WWNkQnZkWGUxRUtodEpCc1RncmhHcnFFUmxqTzRSa242Vk0xL0FHVkpFWlFW?=
 =?utf-8?B?VHV0U0lSd2g4WHhRelRuRmhjc1ViYllnM3dsLys1WThab20vTTJXcGVLU3Fj?=
 =?utf-8?B?SWtBVEZpbG1vRjlldlFFdk1LYVhqVEFHZnhkU3YrWGFCaVZzb0VxaVh5RE8v?=
 =?utf-8?B?RXJFZGJHOXdrU1Qzc0tSN3oyengzQWNlUy85azAyd1BTeXhNUXhiclBsU1Ax?=
 =?utf-8?B?by9oWkJCZXJWTkRVRisrOWZSNzRCdTJKMW5kdEkzVXRiZ2JneVp3Qjc5K0Zm?=
 =?utf-8?B?UW9GSmtKN1FXTjlRaUZRQzhDb0ZlVi9qR2pkN0M4emUxaVRHcVF4TTc3dERT?=
 =?utf-8?B?YnZ5dHJPTGdwNUJhZFhDcDExSWFmZ2RwbTM0amJPM3Y4dDd1UG9JdjQzdG1q?=
 =?utf-8?B?cUpuemhKWVJzcUVjS0NvMjN4TXcwMmk0YzR2RnZSclI3NjVMYnBhT0hRTGtD?=
 =?utf-8?B?Y3Z3VzVIWHFiMzdSYXhibklGY0l3VEt2bE8yQ1JpdGNreGNWdXFqZzlzRXZM?=
 =?utf-8?B?R0M0bkJtU3MrWEZ2KzlCRUpicTA5bktXWFplWmhQcHJ4K0Jkb01RWCtqMWZK?=
 =?utf-8?B?bmpDK29TY294ZXlsWGFHNzhKWTJYeldTN3hubzdHdDhyWDRjTTl5bFhHajI0?=
 =?utf-8?B?a0tVNElNUUpNcnhFcm51YjdSbnJsdEd6WjVrcWZUTVB4UWZNWSs3OVBCMkhl?=
 =?utf-8?B?ZlJvN0pNWlAxY3hkWUx2a0RGMWIxRVVOOE5LbFVDdDBtOEVKdkZpWEwyc2Ji?=
 =?utf-8?B?bmU1ZGZTOWdzdytUenFCS3k1Uk1rQVR4emFud0MySFlJbE9oSExScTVqUitI?=
 =?utf-8?B?emdmbmo4WWVQdlV0MFNwM1RPbkJHUk4vS253WGxOR204R2FHRnNFT2oyZit6?=
 =?utf-8?B?NVBCbTNiQitZZyt1TUc4Y2h5bnpKM1MvdEhoTEFIaGxxRXFNKy9wdFlwRVl2?=
 =?utf-8?Q?h8khy0MreqYnO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWxvNHFLVFYwQWhQVkovWUo2dUxXN05RRmYrUWpOdERXT29vc1RGellHNXdr?=
 =?utf-8?B?cGVJc01qZjBhNHhFOUFhM2xmTVBNWlNUeElNenk2NWRjd1ZCSXRaK01oWEhN?=
 =?utf-8?B?VkhYenhxRkVBOUVDeHBZNGZBVm5FNGV2RjRoYlNrOFYzay9UYjNadjRtaEdz?=
 =?utf-8?B?V1RSSmlCRFBUQ3pwY0E5bDh2WmhJd3U5bEJzMC9yWko1TnE4aUdGYStLaWlW?=
 =?utf-8?B?ZjZqemR5Q0NBT01vTzJVclJSR0FhQ0JzZzBnT2hiUGdhakh1R3U5b3h5Vkty?=
 =?utf-8?B?bThoeTFSNFJkMUZZRzVkYll0OUVBTWdpVTc5eHBzSndKeXE2bE9JZnFKNmJH?=
 =?utf-8?B?SlB0T1BFT05pMW0vYXFRTzZ0YUpzUERrdTdGRDR1cTVFN21yUlNKY3VHTmFj?=
 =?utf-8?B?NHN2NDNkb0p4K1BycXBmRnN3YlZIeEQrVmJEZzBqcGVONEVQU1p6Tk42ZjlT?=
 =?utf-8?B?QnhOL25tbWN4R1FkNFFZVkwvTktweHFTaTI2WXF2QjFlcnQyUmgzNjExTzRB?=
 =?utf-8?B?cGZ5ZEpibzJ1b0lOOHRQMERKQWNpSS9VWHZzcUJob3AxNnZlVzVxNnB2Umsz?=
 =?utf-8?B?YzFLN0loVHR3c0RqZnZCcWJYZDRTUFJ5eS9SZU1ka2dJbUREd25hdm5HZlU4?=
 =?utf-8?B?VENTU0xpU3IrdXdwbWtNWEd3b2N2RERHLzFpVGtwSlNJSGIzbHVFUFZ6TWhE?=
 =?utf-8?B?ZWxEck5Gak1xVnR3aDRncnJmRzVGWTFxZnBDUG5QYjhHZ3Vaak55TGI1N0FX?=
 =?utf-8?B?ZTdoS0RCVGQ2WWZKdVVBeE1DRDR3b0VoeFQ3M0NjVkEwdzN5ZFVSQi8xbUtJ?=
 =?utf-8?B?dmhIWmJGeVVDM0duRmpCcS9DRnpUL1E3a2Q0bG1HZjZmdlZtRVNtS01OelMz?=
 =?utf-8?B?L2R6aTV2Z1ZHYkJpWXV4djMvQWFJUXBwdFlCMnB6NmtuYlFKMDFEM1B0d3BR?=
 =?utf-8?B?NVhCTEJXcWFkZStSdTlGWEdoL1oxb2dWVXZ6RjlmbjZsL2VVLzl4dVFHVnY4?=
 =?utf-8?B?cVFGMnBUbDA5L1BTSGZjMk9XRTZPZS9SbmM0d3NTV0d0aStyOFh6aVRpM005?=
 =?utf-8?B?cmswa1hRSGFjdFdNTmxTbjhQTGNGN1VTa05tR012OURKeEg3N3d2UzZ6LzVh?=
 =?utf-8?B?bTNNankrR1NGRmdhM3BiSDJKak9Sb2JpR3VuVUpScytpWjR3VkhyL3FKcWhD?=
 =?utf-8?B?NE94QnI1RWR3KzNEeFpRSU1SYzk0Qy9YZGZtYTRpblBhdjNnclI2U0R3VG9L?=
 =?utf-8?B?ZVAva3dITXFZT3NIZzV4K25oT2lSUlhURnJ2UFNRbE1iVVVWRWJMbTVtZjNm?=
 =?utf-8?B?SGdVM05TZDAxZi9zSVdTN1g0V2h5RXk5by8xdGFDV3QwcHBzaTE2SE1IS1Nt?=
 =?utf-8?B?UUpmNlI4VEZkYlFBVGsvTjlsREpHZlBIOENlTWM5TnNYRS9kM3R1bEtKVmhW?=
 =?utf-8?B?bzVuc1NLVlQ3REpCYzdaR3dhWUtjeTUyVWwwc2hmNEcxTEovYXlQZFljUUpZ?=
 =?utf-8?B?NnRLQWNVS0tOOFlnNVpEcVptWjE1djdKVW9ZUk9yOThoWmUxaXR5Q1J0MVdI?=
 =?utf-8?B?MTNOVVZKWGpQRTh5a3lzYkxPdFFkbGxZM0g5cjZ6am5rb21wOXdWU1FvMjZw?=
 =?utf-8?B?WFNyeU4wQU5MQ3dYTG1yWmczZGZVb2JrQkNPd2xncEk3MEcraUdQRXZwUkNM?=
 =?utf-8?B?VTZaYmVhRHNLcVZBMnRuWjFObXdmVWR4M0NoZ2JGV1ozWjB4NGhUd2VoMi82?=
 =?utf-8?B?enhmUGtEY3RqczVPVnltQUt5eHV4UGo0TTY1UGFwZ0labFdIa09ieXpVZlFR?=
 =?utf-8?B?ak9pbVp6MzJaYjV2KzVPT2E1QTZQUThiWGhlMTQ5OE11RE1PQ25NcFpKUDRS?=
 =?utf-8?B?aEFjUisxQU1oUTlMNjBPQ3Fwak5Ta0FpNVJQOHBmMGUxMTNnZDFSOUlIT3lt?=
 =?utf-8?B?ZW5RUERWYjBWU1VzM1lFZFZCSzl6LzMwSlMyWG1xdEp2SThZSHJBdUVGcjFh?=
 =?utf-8?B?OC9zSnQ2dmZQRXl0dENJaWE5SGxoMGhVR3U1Q0Ewemc5U0tlR3F3RGhydWl5?=
 =?utf-8?B?eFZVZjk2MURsTzkxTWlwOFY1SU8rUlVyOWc3cDlzOFlsMjdFVVVmMXlQMkdB?=
 =?utf-8?B?YlRNMkdtTVVRK0RSQUZxSGUrYWMxR2QyMjQwZ25nUmdKZnNNeVgvY0FXZEdr?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb0cbd0-a7bc-4cd3-db72-08dd605b2179
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 05:11:07.8058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JPbMTrw3d5wmz36ak35Y/vCVsCB8rkSdqYqBOyiakxyhp+6sZ5tNNzskp1QrUPscIbn0IvDF4YVDGqGJJxxB8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6461
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

On Mon, Mar 10, 2025 at 10:04:22PM -0700, Matthew Brost wrote:
> On Mon, Mar 10, 2025 at 09:22:50PM +0300, Dan Carpenter wrote:
> > On Mon, Mar 10, 2025 at 12:56:46PM -0400, Rodrigo Vivi wrote:
> > > On Mon, Mar 10, 2025 at 01:48:00PM +0300, Dan Carpenter wrote:
> > > > The error handling assumes that vm_bind_ioctl_check_args() will
> > > > initialize "bind_ops" but there are a couple early returns where that's
> > > > not true.  Initialize "bind_ops" to NULL from the start.
> > > 
> > > It is not a couple, but only the one goto put_vm where this bind_ops
> > > gets actually initialized, or not...
> > > 
> > 
> > I'm on linux-next.  I'm not seeing the goto put_vm...  I think we're
> > looking at different code.
> > 
> >   3063  static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
> >   3064                                      struct drm_xe_vm_bind *args,
> >   3065                                      struct drm_xe_vm_bind_op **bind_ops)
> >   3066  {
> >   3067          int err;
> >   3068          int i;
> >   3069  
> >   3070          if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
> >   3071              XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> >   3072                  return -EINVAL;
> > 
> > One.
> > 
> >   3073  
> >   3074          if (XE_IOCTL_DBG(xe, args->extensions))
> >   3075                  return -EINVAL;
> > 
> > Two.
> > 
> >   3076  
> >   3077          if (args->num_binds > 1) {
> >   3078                  u64 __user *bind_user =
> >   3079                          u64_to_user_ptr(args->vector_of_binds);
> >   3080  
> >   3081                  *bind_ops = kvmalloc_array(args->num_binds,
> > 
> > Initialized.
> > 
> >   3082                                             sizeof(struct drm_xe_vm_bind_op),
> >   3083                                             GFP_KERNEL | __GFP_ACCOUNT |
> >   3084                                             __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> >   3085                  if (!*bind_ops)
> >   3086                          return args->num_binds > 1 ? -ENOBUFS : -ENOMEM;
> >   3087  
> >   3088                  err = __copy_from_user(*bind_ops, bind_user,
> >   3089                                         sizeof(struct drm_xe_vm_bind_op) *
> >   3090                                         args->num_binds);
> >   3091                  if (XE_IOCTL_DBG(xe, err)) {
> >   3092                          err = -EFAULT;
> >   3093                          goto free_bind_ops;
> >   3094                  }
> >   3095          } else {
> >   3096                  *bind_ops = &args->bind;
> >   3097          }
> > 
> > > but perhaps the order in the exit is wrong and we should move the
> > > kvfree(bind_ops) upper to the end of put_exec_queue?
> > > 
> > > Matt, thoughts on the order here?
> > > 
> 
> Rodrigo – I think you are looking in the wrong spot in the code. Dan's
> subsequent reply, I believe, explains the issue correctly, so I think
> the patch is good.
> 
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > 
> > I feel like ideally vm_bind_ioctl_check_args() would clean up after
> > itself on failure and, yes, it should be in reverse order from how
> > it was allocated.
> > 
> 
> This is a bit of goofy error handling/convention—perhaps it could be
> cleaned up in a follow-up.
> 
> That said, this patch is correct. However, the 'Fixes' tag looks
> wrong—it has been broken for a bit longer than the tagged patch. We can
> fix it upon merge.
> 
> With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 

Actually, we have another problem too. The 'free_bind_ops' label in
vm_bind_ioctl_check_args() either isn't needed or it should *bind_ops to
NULL after kvfree to avoid a double free in put_vm label in
xe_vm_bind_ioctl().

This patch is still valid though.

Matt

> > regards,
> > dan carpenter
> > 
