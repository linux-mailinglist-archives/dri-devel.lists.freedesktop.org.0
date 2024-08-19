Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE13F956548
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 10:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C944910E1FD;
	Mon, 19 Aug 2024 08:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XgN2U1Ld";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D97810E1EC;
 Mon, 19 Aug 2024 08:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724055109; x=1755591109;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VSTAEZ1jHRXTg80cEvy7HKnJxfYPExE0zrX8/jmY/1M=;
 b=XgN2U1LdYJxFtgh5EJoP7TCn2DGN0UcdMOjW+VgrojUkLY8QY6lJezGd
 n8Kh0RNJahMKSLtM9AYd8OyJRM4tGPzweISV4xcf1latW8Fe/5OJ0B64U
 2h5Cd089I7nVLOuBJbAHgyq3KqXemRKoEsHxkB4hO89lxpMT9VpLEIwA3
 Jmxp8kUF/ou8TLsNnQB8b33+UlyhVDZm7dpR7nVpTIcBLUsmxJMToAyeh
 quNPyQOwqoX1p2WnXOnSOgB/d1QX6JxEpulzOs0yAZLzzDOkuVkjSKN/1
 zuG9ijB9cUSAmdBUoMdH0ugkWhLpo2CAR7AedubEywLoeP7+BALOupYNd w==;
X-CSE-ConnectionGUID: fcQEUTeHR129YfOkmpCYVw==
X-CSE-MsgGUID: LrNbUJRST+WJ49Em+EnbnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22104660"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="22104660"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 01:11:48 -0700
X-CSE-ConnectionGUID: 18b40DTZSTOddMAf3rlxbw==
X-CSE-MsgGUID: 3BPUvV4ZRMurCXN+xSzqEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="65261058"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 01:11:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 01:11:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 01:11:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 01:11:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgomWrKXaXu0Lo7/Kz627Mc+FhR80fJlamr9NXY8zD132vUBmYoDFGSVGTkL9/kaNONyxfQr9nxvzLOfHqHQhS0AzAIs+a1X8FanWTRnnEba8q2msQsMnvEJHsJizh88jD1hVpsAt2BIk1s3Nut6Gb/CZC245T9VgOUHqjjfGuxcMuXZu0htVVbYC6zq5MLwVG/4H3sGnadzxCtF7vzFBanJlj2a03TvdwmqLBei2Nk8iv4v9k+sLDaRz+VHWB6aY4a4G6rhTUSwwP+Gk1+i540r95IiNiPIp5mkp/SseJOxp2JyxfjuEzOQsPeLORW/eMabY3/4BgN1EMbPtycKAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QbY2UgxkO8ASGwLpo0IdlcvSS7+vDJp4wlum8ZjZYQ=;
 b=IG5b+qKeF5KtvsDXZa3bnf4RQrFPed1imdlXE3uynFre2PYzKAI608uc7mO20OWVWGs8hh2K2z6wjjYJ5DWa+F2SpH6IBp5A30A+Yd8Z4qia8O7FMrmIamj7RzYIeq/K1bhYDA5sripNuehKsczvGLs9joCX1SgogfJrvUPNAMfXV5m0eW+SgOUhPnbE3m3WKDKKZMOZpziLKYzKBGWZDS38GdZchI/5CwKoC7ShomA7biZXIwWIRJYlDgxdPiKrrJBlayZcByaKOVHj5/EjrkKwJa1L9oT/ypLGepSYxkgLRFxVYTj27u1VXTnpAIdhRfMyX/bZQDlioHaB6cIgqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by LV2PR11MB6047.namprd11.prod.outlook.com (2603:10b6:408:179::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 08:11:45 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 08:11:45 +0000
Message-ID: <b3025ea0-6573-4e78-b921-131ab6711c9c@intel.com>
Date: Mon, 19 Aug 2024 13:41:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/sched: Use drm sched lockdep map for submit_wq
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <tj@kernel.org>, <jiangshanlai@gmail.com>,
 <christian.koenig@amd.com>, <ltuikov89@gmail.com>, <daniel@ffwll.ch>
References: <20240809222827.3211998-1-matthew.brost@intel.com>
 <20240809222827.3211998-5-matthew.brost@intel.com>
 <8b9928cc-dce9-4cfd-b1a9-0112266d60df@intel.com>
 <ZruxG8YaHqV1CAgS@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ZruxG8YaHqV1CAgS@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|LV2PR11MB6047:EE_
X-MS-Office365-Filtering-Correlation-Id: fb6fad39-cef1-4e59-0c5b-08dcc02690b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1VmcHoyZ0cyelUvemg0anhNajZWKzNDRGk2bzJ3enpoNkoyVXE2V0NxY2NQ?=
 =?utf-8?B?MUdLcUptNzg1Zmw1emd0UUdLMm91OE81TUdqeVNlZHplYUoydDhHbEIzeStX?=
 =?utf-8?B?bWZiRHN4WGoxWmlQNS9jTVk5M2FtSmJpa2ZXdG1KNmhtekkxdGFKa1BvNis5?=
 =?utf-8?B?VlV4ZzBIcmxpUXdtTThuK25KMzE0Q1ZUWWhIVXRhY0FlMXVJZGx4RTFOdGJn?=
 =?utf-8?B?ZWpPRUp5YzhzbWtpYUUxOEx0ZndFOHA5c3lxYUNKcldKUUNNcCt4b3pTTndr?=
 =?utf-8?B?Rk1EMXUzZlEzalBqYzBCbnc4d1pUd1BaM1hYUnB6OFprYW5pMHlRUXA3Rmxs?=
 =?utf-8?B?SVIzTlc1NVQzNm1qZzNtZHAxZXZleXBkbkI2ZzNGVGlFNmxmOEQ1Y3JCN0RH?=
 =?utf-8?B?MmhUOFl6ZE1ldXVaanZrYmwxS215OEZoeDNKTUlGaHEvWGZEeW00VEltZllT?=
 =?utf-8?B?TTZwOEU3WDJoRnZkUXZoSVJRWWNCdUQyeUpkRzBzR3NqbW95KzF4bUhldDFY?=
 =?utf-8?B?MERPS0lQcUdHZGVxTVNHRTRwUDdhZUJqN2ZMU1hFTkxuRGJHRzArVEQ5YmNa?=
 =?utf-8?B?NnhQMjdNaCs2RGRjUlZaZEJxTlRDU1dINVdRL0x0Z2YrR2I5SThCRm0zRjlK?=
 =?utf-8?B?RzBvL2NXdnN6by9vZlRYa0hySHhSU1V3ak9LRU1qZ1pOM0FSd1A3eUl5YWpY?=
 =?utf-8?B?R1l6MThYQlZqdFVDWExuR0hRaEZwNzZGSVlXcW16TFZVUG9yL3ZkQmJ1Y0dz?=
 =?utf-8?B?NUNERExraTRvbHI2OG1XaXBmc0Q3WkFHRDFIMjlsak45KzB4RFBIVE9XeXZr?=
 =?utf-8?B?amdTYTVyZHA2K2pPNzAwOUU1aHVEa3BSa2VDWE05clZMRGovdllXaDJmdXQ5?=
 =?utf-8?B?SnZ6WEJtODRweW1SQ0tpR3l2emZOUFlKb2Q4Skc0TE1rT2luMk1iVllXb3Bw?=
 =?utf-8?B?UG1oQmc1OW5oZnNCdHZhRllRY1ROelppRTYyZjkvdld4N2s1YXp0SVJRSmFE?=
 =?utf-8?B?TEg0dmNpSXVtRHpnUElVUHduaTZqak1SVmJueUZFdkp5NDNhdU80VEFvaWd4?=
 =?utf-8?B?UTVVT2dlVzdxVnMxV1N1Z2FHRElMTmJtc293ZWdpQWRlb2dEaVd1dFpnNVgw?=
 =?utf-8?B?UVMyelc3ZGFVYTZ5N21LQzEwM05qRTlPUHJvdG5EeTVuODAzUnhFaUJtTi9D?=
 =?utf-8?B?RS9SLzczeWRCaWpjSGhzSnlRMjRTMDJKb2xRNTg5cHEwcy9JOUx2ZElJeWxy?=
 =?utf-8?B?QjFDS3N6TW1KVlhLMWZ1cDZpZU9OQytGdDBhY2RadVREY3dFdTZNZnh5bG1N?=
 =?utf-8?B?Sm91V1pMbmJaTHFlMlovMGg3MlBwZFNZQ0h1ZVlRN21yUmJyangxTXdtT2gy?=
 =?utf-8?B?bHowUlNURSs4akJMMG52eWwxNUFBTFZ4ZlVGQzVtSnpiTjNtcGpTcUFFajBw?=
 =?utf-8?B?K1FpbDY2VG9NNm9hNzNDSFRPNDJ5N3AxV2drbWJ0N2ZpbHYxV2Z4L0tEQ3Bo?=
 =?utf-8?B?VFBUa04vTW1IQ0tKRVpkTDdSdkhkSS9keEFGcTlsaVE1MGhya3JLeFBDdk1p?=
 =?utf-8?B?eTJuWWk0TGNTN1dQYlpEcEtRUVVLZ2luSitJZHREbmUxZm9Ld0loTWRIaHl5?=
 =?utf-8?B?dHlGZkh5M2t6Z0JocFRVSjh5WVhIaW9xRnJpWFduL2dtN1U2WFhQSGZ2WUdG?=
 =?utf-8?B?QzdTaDBVWmtxai9KQ1k5c2lJQmFWMGc1dnQzYVFDVUMzRjk4dFBiaHpxUUli?=
 =?utf-8?B?TjUrMkMxOUN0SnIvTWJrRjE1Si81cVNNWDRQbHEyTWlva0Evd1NlNTRYT1Zu?=
 =?utf-8?B?ZndySnpuMnIvYk5IWWJTZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1publpicTlwNjZyY1BMemJtV1RrZ2NlcUowZWxhcGtYTGxwMVBLUzJCQVZp?=
 =?utf-8?B?N2tTR0Y4UzV0ZzlNR2ZnUWxGc3VPbVl1TjFDMDU0bzBPak5sMTNjbXRURlBv?=
 =?utf-8?B?WVUvdkJUN3BQK1ZpT1ZGL0tpUi9GMnBITmg4ei9IY0R4OWhuYS9qbjJCUzZH?=
 =?utf-8?B?YlhHWG1FZGFJaHlqQ05NbnVLVm14Mk4vRXA2eHU4U1ArOWk3VEtYdzlaVWlN?=
 =?utf-8?B?UVBSa0t3UU9PVk1ZWUkxb055SVltL2ZhNFA3QlhxQzJnbFJKSkhWMWJmU0tq?=
 =?utf-8?B?ayt0d0Z2VzlBR1RFNmxUTkJ6eFhCYjVUdjA4UWVaOTBPWDcwQkxCUmUyaGlh?=
 =?utf-8?B?bUVaTXphRW9rdXY2Rmt2TzlvV0Z3K3JMa2xHbHRCbVN0d1NSRElmcG5ENnBm?=
 =?utf-8?B?eEc1K2szWmk0RWE3T3QvL2x0eGZFQk1Bdzk5VW9wY0hyRW9VTWNqdllzMGdq?=
 =?utf-8?B?azFpMUlrSDgwbkhNQmVJUUNYby9KMk92UTNWM1NSdUpyektoZFhwd25lMmNp?=
 =?utf-8?B?UWZ2TlZkaFp4L1daS0ZnRi91Tlg3NnF3bHZ1VzNaU0ZoR1NLVmVUTkNiK01Q?=
 =?utf-8?B?dVB3S3dTMjRiaTJsVkhIOU85OUlNU3JZN2VBS1JoRTF3UVpONFNwV29GSW55?=
 =?utf-8?B?V0lSbGxjcVEvZHRVeDZZYlgycWpRdm0veGxhZ1dncDNLLzhTc1Z6dk9Oamxi?=
 =?utf-8?B?K2QxVHIyUXJjVi9jdC9ETEl1MWRBZjI5TmoyNmZoNTAzUi9NV01LdDB3QmpI?=
 =?utf-8?B?WmNJbDFWazg2bEtMK3BxRUJOeWczMWRUaTFZSFJ6ckkzL3NGTE84MEQxWnZW?=
 =?utf-8?B?MG1YSk8zd0RTbkJVL2l5d29hbGhVeDNMTUVNZ2NJZldibStLN2gxR1MyUzda?=
 =?utf-8?B?dUJwZHhHck9KeWoxSExrbEk0ZE5BOTltK3BSanpVOWdJR1dNVkF5cWtPSkRH?=
 =?utf-8?B?OVVBNEkvaWJOQVlWSFdjNE1kYjNFS1dLd1Q5KzBHYUd5MDYybjJRanVyQzdn?=
 =?utf-8?B?YSt4Mm5EZUZJUjFVQzY1eC8rUEpEa3ExaVVWWWdMa2NiYlVTY1NONXEyNWlG?=
 =?utf-8?B?MjlsU1RRRERHRFB5MGdhUlVpb2RtNmlGSWlCU216Z0czVnQ5S05objQ4ODFn?=
 =?utf-8?B?VmFqbHhMVFBobHdzQkppaytRY0JvSytMRktUbWQ1NGJ2TU1ISDFVdjF5TDNK?=
 =?utf-8?B?RGF2dXVvL2ptRHdnUVRDQk1CVnFrRUtQMVphaHUwVDFjcXllMERDR2lLcWox?=
 =?utf-8?B?UDduWk5IZHc1VjhsWHhETU9WSHl2S0tUWkVPYjhucHBFYVNFckNzRG52ZGpu?=
 =?utf-8?B?Zy92M21lMGhUeWt1L2RWeU9EbWppNlRXc1p4dWs0RlF2c2cvOEwvbW9qV2dn?=
 =?utf-8?B?YllLc0VJbmNnTy9CL3BkRjFhYjFSdFI1ODhDWUxrN2JHVDBJK3dBT29Iem9r?=
 =?utf-8?B?YVRFTDY3MFdBSENXdTQ0Z1AzWmttY2Z5c1VDTkJLYUFpaVhSKzNjUmFrbHNV?=
 =?utf-8?B?d2lMcHQ5K2ZKWHVaQmhMVEtFQWpWd2NMWkp1QmRZSVE1djlpL0swbUZNVXhj?=
 =?utf-8?B?djB3ckVldHU5QjIxWDlLdEJ2TTFIWUk2TTkzemlIL0xIT2NVS2xPa0I3c2JY?=
 =?utf-8?B?bm9FbDQ0OFZjQ1Q0aWQwNUp6d0llTUhlbVdZWDFSTzllT1czUVV4cDcvRkdo?=
 =?utf-8?B?Y08rM2tyaHpvSVo3azFXNWh0RXRPYnNwdzQxeXdCS1BaQWlmRGJWc3lsWUYw?=
 =?utf-8?B?eGlsa3IyR09SdE1pWGRpZG5TZHU2czFCcFlPRVhMN2RhL2pxaENUb2hzU3VL?=
 =?utf-8?B?T0NYQkZ6c2NTWmNqbTZFVE5NMFR5VGE4WW1XdjcySVFtNFNVbkQ1djNzdDdm?=
 =?utf-8?B?RXlONzBXZktPQTI1cCsvVDVsa2FNM0V6Q01oc01adnFqTVVRdXM3K1NqNnEy?=
 =?utf-8?B?WFAyaWhxemNkL05YTHhCNDdLOUM3SFp0RkRpeUkrMm5KM1BGN0JsQ2F3VnRD?=
 =?utf-8?B?eCtPOGp1MkxwM1BEMHJJd1lkSkd4QVRGWmJ1UzgwM1hrN3MzY0VTOUFMQWxv?=
 =?utf-8?B?NnRoMnMrQjNPSVl5SDQ5UElOMk1jU29kUDJwd3IrbVI1RkxLSzJhaUx1OVdu?=
 =?utf-8?B?N1dMQUxDNkxlTytGUnFmVmRXczdZZlNEZnd5Wm90djN5alR5VGViNFZ0QkRx?=
 =?utf-8?Q?ECsST5aCgiCKnolVs/m3ERQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6fad39-cef1-4e59-0c5b-08dcc02690b0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 08:11:45.1842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWssf200jomWvrpXXdd8QTVZznSyJxe1CNvBEICo+UDQQ5Q/UB7b3WddhmDP+J9pX3B9kFqzIiwKj5srnf/nX2xqChUJn8RNIy7TunRiCNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6047
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



On 14-08-2024 00:46, Matthew Brost wrote:
> On Mon, Aug 12, 2024 at 11:05:31AM +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 10-08-2024 03:58, Matthew Brost wrote:
>>> Avoid leaking a lockdep map on each drm sched creation and destruction
>>> by using a single lockdep map for all drm sched allocated submit_wq.
>>>
>>> v2:
>>>    - Use alloc_ordered_workqueue_lockdep_map (Tejun)
>>>
>>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index ab53ab486fe6..cf79d348cb32 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -87,6 +87,12 @@
>>>    #define CREATE_TRACE_POINTS
>>>    #include "gpu_scheduler_trace.h"
>>> +#ifdef CONFIG_LOCKDEP
>>> +static struct lockdep_map drm_sched_lockdep_map = {
>>> +	.name = "drm_sched_lockdep_map"
>>> +};
>>
>>
>> will it be better to use STATIC_LOCKDEP_MAP_INIT ? Initializing key here
>> instead of while registering the class ?
>>
> 
> Most existing design patterns in the kernel define static lockdep class
> this way so I think this is fine. But honestly don't really have an
> opinion here.
> 
> Matt

In that case, I have no concerns with the current initialization.


> 
>>
>>> +#endif
>>> +
>>>    #define to_drm_sched_job(sched_job)		\
>>>    		container_of((sched_job), struct drm_sched_job, queue_node)
>>> @@ -1272,7 +1278,12 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>    		sched->submit_wq = submit_wq;
>>>    		sched->own_submit_wq = false;
>>>    	} else {
>>> +#ifdef CONFIG_LOCKDEP
>>> +		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name, 0,
>>> +								       &drm_sched_lockdep_map);
>>> +#else
>>>    		sched->submit_wq = alloc_ordered_workqueue(name, 0);
>>> +#endif
>>>    		if (!sched->submit_wq)
>>>    			return -ENOMEM;
