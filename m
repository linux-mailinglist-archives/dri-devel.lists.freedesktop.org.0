Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED20C8D160
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 08:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C4410E061;
	Thu, 27 Nov 2025 07:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J59eYf/v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437F510E061;
 Thu, 27 Nov 2025 07:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764228407; x=1795764407;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WQJxNc/b/CGBzaxOK8akO7unb1jzTYxj+3hxSyoljgE=;
 b=J59eYf/vwIcnvaNaHMRcS2pWClELAWxv/oauVGWBRVepWx6lrygFq6q5
 IDyNKNLuISuH41J1vOrrJPAgxGStpuvw91ivhOpUScLQaPKSo9nE8hUZE
 Lx/IgIzJ2+Jto1dfyIap2muhrvPBv43WWl4ENrZlD2fwO9SOeHf//E2pB
 wg1D1RD8plGS1os7LIIq1erG9dthxIWyAUUtNc6PJgvgC6u2xnAC+/+ad
 fHyddmBqK1Q5M6VUO6dg5BcxO2buMyg33oA8iscnHOckeJZk67FP6FO9E
 KZc2thNCklvdLiGIHd7YXRnC+gcUajlAJFOGHu46ZrZwuyCrxPLOHVkIv Q==;
X-CSE-ConnectionGUID: ecaA5R4dSkSJok7KaLQskQ==
X-CSE-MsgGUID: ugJUHjWoQZuwQj/omIYpeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70138534"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="70138534"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 23:26:46 -0800
X-CSE-ConnectionGUID: AssLi6UhR82W/Zj8H4qPCA==
X-CSE-MsgGUID: qWr1yDWpSe+90p9dBxJeZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="216512728"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 23:26:45 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 23:26:45 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 23:26:45 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 23:26:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPX6jDlENcHkI6py29bvOmfKM9kewQF3iajzhGzPcnlW9deb/DfG7pJ3NxjlYKqLK9AtQK9JFHYXRMBgAjODb/1wsZIn7IyvOrqFiclGTy3fe7UVxlwc2gqqaFlC1MkfHPsEGpcTVunAtxgZKDv3lEkBiIQGSNqf5RUsex3ZiCNVoE2MiW9Qk3GhRgorN9lCxjaff6bd2p/dO5BTDVfl55qHNIzDNUAEsT7nYss5kel57IWEqqFMd75/7JUXUcXRalaakvhhduV5r3408XEKIGO7eoMgEMTy6eP+ZeZkk8Af/XxxkCDU15Lf73aC6kbUmouK4MDuT9hLUqcSyA1zcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQJxNc/b/CGBzaxOK8akO7unb1jzTYxj+3hxSyoljgE=;
 b=FWbPHls3XDxxtaKzetScHs26UyALLXpYP2pYgP4PtE1QAA6gwZPEv3sYI+GsYp0ZvSMNSxBeayofJ1rLJt+HPbUOza3bD2/XJ/KsxMD3+xtgg2K2XDBG1NF+c9t2rZwM/RnJnlPGVaMOn1MVh2HYgunWtfVIF/8clkAyONuEP7pI2hYToW6GwhEnxjIgy7QZE4dL8vfan1qX8Mgiluwld+JlvYSi48kmvMwwSgWEfeGIY2emXzkhhC54CKa8v+0/f46vRa5lM3TkJkwghVwlnGEE7n3uasiu8TJMoXFcTtSBuHEJfHDgt8mxed4Mx4UfPljgWPzwLPALMouykWIIOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SJ5PPFBBB839A03.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::84d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 07:26:43 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 07:26:43 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/i915: Expose the IN_FORMATS_ASYNC blob for all
 planes
Thread-Topic: [PATCH 2/3] drm/i915: Expose the IN_FORMATS_ASYNC blob for all
 planes
Thread-Index: AQHcVCxsa5Hgecoc4keyVK4PRA7jK7UGNgCA
Date: Thu, 27 Nov 2025 07:26:43 +0000
Message-ID: <3d19cee37e2af9b6310b23660d41b81ed15e55da.camel@intel.com>
References: <20251112233030.24117-1-ville.syrjala@linux.intel.com>
 <20251112233030.24117-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20251112233030.24117-3-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SJ5PPFBBB839A03:EE_
x-ms-office365-filtering-correlation-id: 4ae8107f-776e-4a9a-1d8e-08de2d865094
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?SlAzMG9EV3lDWkF3emdxTGpjNDJvR1p4bFE2ZGgyeS9CR3FBczFlL2J1N2hT?=
 =?utf-8?B?RDdiYkVOMTkrRHNsb3lqandReDZ3U2hJVlhLNW5mbXk0SGxaZVFnZXdMRmNH?=
 =?utf-8?B?R0pKQUkwTC9SdGFESGhncm00NW5qaWdvNEtIc3hyVzE4MHpKM3d0dTNOMHZB?=
 =?utf-8?B?NlNMd3JOaGc5SkVrT0ZCNUo5ejNpTHhqRWxDVGhmczhVWTBxSUgrakZBY1Iy?=
 =?utf-8?B?SlRHdGZjUDByS3ptLzBqWVFZZ215Vlk1dHc0SThFR1MzdHZvcThFa2FaL2dh?=
 =?utf-8?B?YTVtUEo4N1gzeFlFL0F6RVhTWEp0a0ZLK0JJV1loM3dUSzRudlpOZks0cEgx?=
 =?utf-8?B?Zmxxb2srRFMxTkhVQklzSklqeGtxMyt4YndLRk9LQ05rVlFqNC9aMmNnQ0Vk?=
 =?utf-8?B?OUxJUzhSTFJ0Mk5WazJRZW1PNHNnaFJwVU9RdDQwZUxtbXZzY0lmNHp5UjJo?=
 =?utf-8?B?QjQ3WXJOcVZqWkVpSXJpS25KSm5aV2lmMitnS2JUamhMQ1VERDdJR2RHSGlR?=
 =?utf-8?B?Vm1hNDVLVjR0REY5dkpWazg4U0J0ZkxCR2cxUnlFNnRpMnV3NW1jOEk5NVRk?=
 =?utf-8?B?SzVaT0tTdzgvYld1UHdHandlcDljbDlZdm1CUkZZNlNXeFBKeGZMZ1lEbjQ3?=
 =?utf-8?B?N0ZsM3JNSjU2NkFiU3EvMDI0MWdMSTU3c2gzN0tiUDcwaDNKMisxOENLWFRz?=
 =?utf-8?B?R1B2dWhJdm55c2xLYnIrMGZSRnZ0anUxQVVYd29DOWFrNmZpanN3aUErUFdN?=
 =?utf-8?B?a0U2RzE4eEtYWGhwRlNhZWFQY1UzWndqTVBIWW15d3lEa2l2KytpbThkMmNR?=
 =?utf-8?B?cE5raURiNHd4T2J1TjdaaVlNZC9ML3UyZnc4QVhNRFVNejhFZ2tuZXpQQTVy?=
 =?utf-8?B?SjJpR0N6bS9DRnJvWG83MldzeEFVRkR2d2RTTmNkckE5cWJ4K0JHdXlockow?=
 =?utf-8?B?aHd0UEQ4VlQyaTRYNW9xN2xQbEhuR0Nza2E0QjlqL3F2V0k1dVlISG1rM01C?=
 =?utf-8?B?aVRhMlFERHRlZGxIbXNDS2prTVRNZVVsL2M1OExxSVM4ZUlNakJDL0lSWERO?=
 =?utf-8?B?L0U4UUdEOHRGeVpnYmx5VGJiMUloeFR6ZXNtUnU3QUpQMnhGSmQyWjBtZ2pT?=
 =?utf-8?B?VzR5cmMxL2ovTEdBK252WjY1M1NZb0JoWE0wRmUwYk9YV3RoblhYQWJWSE5n?=
 =?utf-8?B?TWg1bDBNb2ltWXhWKy9rcjFyL0tWd01tREd1UmpXQ0lxQnE1eTdoMzFOejhQ?=
 =?utf-8?B?NEZsc2dyM0FnMmRreS9EZmMxb2NvczAxMkNCSFlzTDdPYWJPZ2Z5SkNOZnV2?=
 =?utf-8?B?RjdCMkszWEwyc3F2Qi9mSmc0U3RnVm01aFQxVVdlNTAvdnMyM0l1MGNWeXhD?=
 =?utf-8?B?UTJPMEl4MUxpU2d1UWJnWldrSGJLUzBRRzlDOUlQTWIrZkZGTG55WDMvNUhL?=
 =?utf-8?B?K2IzTHhKaitJaE04bEE0ZXdaT0pWbjNHRjVOWWxzT1BjR3VOeFpNVElsOFZM?=
 =?utf-8?B?TEJwWXNpQ2F4K1BvUXFaaXhQOTcrcTQwZ09ocWoxcU1rbk5GSElrTzBQUThh?=
 =?utf-8?B?elhkVU1NMy9aRzVCYUcybW9YbkZKVEpQSzBjVGlJTzB2VldlR3E3L0dmZWcw?=
 =?utf-8?B?cS9JMjhLaHNKUnBkRTBLNk5HamxQTnlra05pb211Smh2YkV0cUhMN1NNem5p?=
 =?utf-8?B?b3BsQ2FjMnBXNlJjQ0JTVWpjNTlDdlE0QnZQRmRlV1FJSTBscDFLSVJ1eENy?=
 =?utf-8?B?VnJjMUdxTGVMRWZkZUtCSkw1SElJUHN2dVd6ZGZtbG9Hays5dy8zeEFWRklm?=
 =?utf-8?B?ODVyT1E0dVYzUXc5T1hFU1ZxaUY4S3Vna2NDMm1DWFBocFY5T29aNEN6TW4x?=
 =?utf-8?B?bzZXQjlrRmpDL1dGdVV4TGpCOFJ4T2Rwd3R4RHdYTjBsd0hUYStBbmxaSTlr?=
 =?utf-8?B?bHVmNndDTGwrNXVrSzNvVmJaTXBUcmlCQzZ6SS9uNlgvM01xSnYxdDEwVzkw?=
 =?utf-8?B?NmpDeTlreUttc0tjL0YxRGkwdGlmekdPdForMXQ1SjVBbkJTV1RXWWp6UE5k?=
 =?utf-8?Q?nzI0nO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHM5WmNockxuYm1TWit3bUYxR0IwM2txa3hFSnlpR0ZEbi9xaFA2Y1lTQkxw?=
 =?utf-8?B?eVFnVVR4WVNxQnlOTlNsMUFVanNnbm0xK2FSRktGUnZ6WE41TzI2Uno4RlNo?=
 =?utf-8?B?R0p0Y3ZudE5ROVMwSEZMT0pHMGNkczFiZGNmUXRNTi9ad1o5UERheENoS3Jh?=
 =?utf-8?B?blIvNGNJdzZQL2pPdTltVXJsd3NoVCtKZ0RuNVM1aU4xK3prc1oyK3B2VFhy?=
 =?utf-8?B?RVBXdjFMVnppVHF6WFpjdjRhOW9qeXpCKzhBbkZBNHA3YUh2enpGd00vS0FD?=
 =?utf-8?B?eTVUTlRvYS82VXdaemtBQlBUbVJ1Q3J5c0pUQm5tdHE0ODVLeTBtUXhEZkds?=
 =?utf-8?B?K2xWeWp3Wk1wbjB6Y0ViMmhoUUZ2Y0IyaWp3ZktLck50NS9QRlN3YWVlYXVu?=
 =?utf-8?B?OEFicFVMeWFHd1Q5YnBQK1JSTldWNVhrYjBQRjR3aWhqY0tFUVArUGhvMnRW?=
 =?utf-8?B?N2wxaHE3a09XVGJwS01tWVdYdnJtSWc5c0ZSeUVPdXdkRFFjUlY2YThqcEFD?=
 =?utf-8?B?bHlmUnE2Z05qNEhKK2FZdzBOZ3kwdXBNdG9NbEdLWmJoN010eERFQ1BVTUpV?=
 =?utf-8?B?QXRqNFpuNVR6eGZQMW9ZU09NbmtSZVpVS2dxZHdHcmVqaWZaVFVvc0ZtWFFa?=
 =?utf-8?B?K2FmYitEODAvUksxdVFCQlZ4dkJVczhmOG9tUHo2L0R0eUswWHFBdWsxRXJm?=
 =?utf-8?B?eExLYnJ1YWJyY2tQRnpIRFJwYkJvV1FULzN2UGxUem1pdnBSZVF0em9mSk1n?=
 =?utf-8?B?akJ0TCtVVWgvOFk4Mit5aS9qYUZPWCt3SHI0MTNyN3I0QWxwVzdUdlUyY1pY?=
 =?utf-8?B?WVMvWk04RFVlUUhnR20ycjE5ajlBN1I0RzRTcFBvSHJBelByMGd1aGZnMVpl?=
 =?utf-8?B?VklFVVFmWHp6Ly9JeWlkVVMrKzR4bTlXbExHQXhNM3JQckgwNXU1ckF3cXFI?=
 =?utf-8?B?bEx5R3pJbEEwSDRMV1ZoUlJHUW8zbm5XeFJaK3VYdXhpd1hyRDFxeTNGZ2NE?=
 =?utf-8?B?ZjZ4U1hUR1BqTnBTRVlSSHNyUUMxTi9TN2NYZ0Nzb204a3pVUUl0bXZoSkg5?=
 =?utf-8?B?WnlKVGFVNUROMzhNazg2eXB0WENqdDZtbHY3TDIrbzJGcjN6d2pQUVJOaUFP?=
 =?utf-8?B?dklSOW51dlpoNDJvbUxWNi9YYTBXZEhIOXhDblVtaUNKVmx5bTBUTlY1Wko5?=
 =?utf-8?B?b1owZXN1cUlUYUtnczhVZGUyTHd5VS82NUpPanpjcm9QZXlmZUhWckVkd3Zv?=
 =?utf-8?B?UVEyeXYrZ0xYdzhsaVV1a2FVMEkwYzBNT2pITldNbTV4NDZaaTJBL3hQNHVi?=
 =?utf-8?B?cElNdVo4Q09RaTErcndJc2VTUXVzRWtiOFROYmR1b2ROOWZ4UmV2YkZITnlK?=
 =?utf-8?B?dng4QzJPb045NUZVSDR6YkkramI5MTIvZTVENEJzWTZsd2sxNDJzd3J5dDAr?=
 =?utf-8?B?emVwYTFSZ1pyVlpNaEtoblBaSGJMU3k0ODZiSVBXZk81Z3pjamN2TUJzTFlQ?=
 =?utf-8?B?aEJKMG9UVDdUOTlHTHQ0bGFWQlo0RGh1aHVMNU1kNHF0enhiYStUandrSm4r?=
 =?utf-8?B?cTF5WldTUjdnbWJ4dGpyR2thK2VEeGk3NDQ4RDNHNzYzV1pJVnoybFArL2pP?=
 =?utf-8?B?S2x0UjFYeGpyNFJxbmM5QVh1N2lOQzBwMTNHSzQyYzhMUUNycXFyRitnRkxT?=
 =?utf-8?B?b3kzME1EYVRTMXpwV0U5cFVjMGFibXhrbnl6K2kyL3IzdXN1eG5tekU3aTlE?=
 =?utf-8?B?bUtCd3VBZDJObnRCd2RTVXNzT3R6bDJRMkFQdnhpeUR4VDloUWpGVTdaYmlJ?=
 =?utf-8?B?QVNzNjFhM0g2Q0RxN1NYTEZSc3BFNURyR1VZUFZzODhBZEw2UXo0Y1RseU1J?=
 =?utf-8?B?YlZMemdRU2tFUEVtcGYzY2IvU2hPNFBUd2k4M0JjeHhSS0N6OElLL3hqVjcx?=
 =?utf-8?B?V2NFb01jdFhZK3VxYmY5L1hpOGRoY1Jnc21SUHZqQmlaandHdXlhaTlQeE5K?=
 =?utf-8?B?OFg4N1AyUHk0ZE1ab1VQYXkvQ0VGZUdlN05lV2VyUmlvbWhZYlZsZTdpcjRq?=
 =?utf-8?B?RjNOMlI1WHhzc292eklTOWhiaWtUVWJtZVlqRTgyaTJKZnZWOENmOU5PL2c3?=
 =?utf-8?B?eGhhdWl5a3h1QXd6OGFzZ0lFY1lxOVUveTNiajRsL3o3MW11cWsvM1hDclJN?=
 =?utf-8?B?cHQwamtqRkk1LzFDY2g4TXlRWFNtbEorZVNwV0h1aVJHUGtOTGlLK0MwRGNz?=
 =?utf-8?B?ZllOZWRsUGJlSUFGS1pxaXZ2Tmt3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABD3FE1BCE63FB4D9092B6BF0F64BFDB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae8107f-776e-4a9a-1d8e-08de2d865094
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 07:26:43.3847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bTHI0r6dUOE7zUnmW5+DYewLH69kHDdPEkr85brMbpLXerHFcFYxIlZ9Ax/jiHlJr79ue4flF4e4DGHT6vp5s9rVFpl31NmFvceoxNNftLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBBB839A03
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

T24gVGh1LCAyMDI1LTExLTEzIGF0IDAxOjMwICswMjAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0K
PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0K
PiANCj4gU2luY2Ugb2xkIGtlcm5lbCB2ZXJzaW9ucyB3b3VsZG4ndCBleHBvc2UgdGhlIElOX0ZP
Uk1BVFNfQVNZTkMgYmxvYiwNCj4gdXNlcnNwYWNlIGNhbid0IHJlYWxseSB1c2UgdGhlIGFic2Vu
Y2Ugb2YgdGhlIGJsb2IgdG8gZGV0ZXJtaW5lDQo+IHRoYXQgYXN5bmMgZmxpcHMgYXJlbid0IHN1
cHBvcnRlZC4gVGh1cyBpdCBzZWVtcyBiZXR0ZXIgdG8gYWx3YXlzDQo+IGV4cG9zZSB0aGUgYmxv
YiBvbiBhbGwgcGxhbmVzLCB3aGV0aGVyIHRoZXkgc3VwcG9ydCBhc3luYyBmbGlwcw0KPiBvciBu
b3QuIFRoZSBibG9iIHdpbGwgc2ltcGx5IG5vdCBpbmRpY2F0ZSBhbnkgZm9ybWF0K21vZGlmaWVy
DQo+IGNvbWJpbmF0aW9ucyBhcyBzdXBwb3J0ZWQgb24gcGxhbmVzIHRoYXQgYXJlbid0IGFzeW5j
IGZsaXAgY2FwYWJsZS4NCj4gDQo+IEN1cnJlbnRseSB3ZSBleHBvc2UgdGhlIGJsb2IgZm9yIGFs
bCBza2wrIHVuaXZlcnNhbCBwbGFuZXMgKGV2ZW4NCj4gdGhvdWdoIHdlIGltcGxlbWVudCBhc3lu
YyBmbGlwcyBvbmx5IGZvciB0aGUgZmlyc3QgcGxhbmUgb24gZWFjaA0KPiBwaXBlKSwgYW5kIGk5
eHggcHJpbWFyeSBwbGFuZXMgKGZvciBpbGsrIHdlIGhhdmUgYXN5bmMgZmxpcHMgc3VwcG9ydCwN
Cj4gZm9yIHByZS1pbGsgd2UgZG8gbm90KS4gQ29tcGxldGUgdGhlIGZ1bGwgc2V0IGJ5IGFsc28g
ZXhwc29zaW5nDQo+IHRoZSBibG9iIG9uIHByZS1za2wgc3ByaXRlIHBsYW5lcywgYW5kIGN1cnNv
cnMuDQoNClJldmlld2VkLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVs
LmNvbT4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfY3Vyc29yLmMgfCAxICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX3Nwcml0ZS5jIHwgMyArKysNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfY3Vyc29yLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2N1cnNv
ci5jDQo+IGluZGV4IGExMGIyNDI1Yjk0ZC4uNjNlNmE0NzY3YWE5IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2N1cnNvci5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3Vyc29yLmMNCj4gQEAgLTk3NCw2ICs5NzQs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9mdW5jcw0KPiBpbnRlbF9jdXJzb3Jf
cGxhbmVfZnVuY3MgPSB7DQo+IMKgCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gaW50ZWxfcGxh
bmVfZHVwbGljYXRlX3N0YXRlLA0KPiDCoAkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUgPSBpbnRlbF9w
bGFuZV9kZXN0cm95X3N0YXRlLA0KPiDCoAkuZm9ybWF0X21vZF9zdXBwb3J0ZWQgPSBpbnRlbF9j
dXJzb3JfZm9ybWF0X21vZF9zdXBwb3J0ZWQsDQo+ICsJLmZvcm1hdF9tb2Rfc3VwcG9ydGVkX2Fz
eW5jID0NCj4gaW50ZWxfcGxhbmVfZm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMsDQo+IMKgfTsN
Cj4gwqANCj4gwqBzdGF0aWMgdm9pZCBpbnRlbF9jdXJzb3JfYWRkX3NpemVfaGludHNfcHJvcGVy
dHkoc3RydWN0IGludGVsX3BsYW5lDQo+ICpwbGFuZSkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc3ByaXRlLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX3Nwcml0ZS5jDQo+IGluZGV4IDY5YjY4NzNhNjA0NC4uOTg4OGEy
YTQzZmM1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X3Nwcml0ZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc3By
aXRlLmMNCj4gQEAgLTE1NjcsNiArMTU2Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3Bs
YW5lX2Z1bmNzDQo+IGc0eF9zcHJpdGVfZnVuY3MgPSB7DQo+IMKgCS5hdG9taWNfZHVwbGljYXRl
X3N0YXRlID0gaW50ZWxfcGxhbmVfZHVwbGljYXRlX3N0YXRlLA0KPiDCoAkuYXRvbWljX2Rlc3Ry
b3lfc3RhdGUgPSBpbnRlbF9wbGFuZV9kZXN0cm95X3N0YXRlLA0KPiDCoAkuZm9ybWF0X21vZF9z
dXBwb3J0ZWQgPSBnNHhfc3ByaXRlX2Zvcm1hdF9tb2Rfc3VwcG9ydGVkLA0KPiArCS5mb3JtYXRf
bW9kX3N1cHBvcnRlZF9hc3luYyA9DQo+IGludGVsX3BsYW5lX2Zvcm1hdF9tb2Rfc3VwcG9ydGVk
X2FzeW5jLA0KPiDCoH07DQo+IMKgDQo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcGxhbmVf
ZnVuY3Mgc25iX3Nwcml0ZV9mdW5jcyA9IHsNCj4gQEAgLTE1NzYsNiArMTU3Nyw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzDQo+IHNuYl9zcHJpdGVfZnVuY3MgPSB7DQo+
IMKgCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gaW50ZWxfcGxhbmVfZHVwbGljYXRlX3N0YXRl
LA0KPiDCoAkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUgPSBpbnRlbF9wbGFuZV9kZXN0cm95X3N0YXRl
LA0KPiDCoAkuZm9ybWF0X21vZF9zdXBwb3J0ZWQgPSBzbmJfc3ByaXRlX2Zvcm1hdF9tb2Rfc3Vw
cG9ydGVkLA0KPiArCS5mb3JtYXRfbW9kX3N1cHBvcnRlZF9hc3luYyA9DQo+IGludGVsX3BsYW5l
X2Zvcm1hdF9tb2Rfc3VwcG9ydGVkX2FzeW5jLA0KPiDCoH07DQo+IMKgDQo+IMKgc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fcGxhbmVfZnVuY3Mgdmx2X3Nwcml0ZV9mdW5jcyA9IHsNCj4gQEAgLTE1
ODUsNiArMTU4Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzDQo+IHZs
dl9zcHJpdGVfZnVuY3MgPSB7DQo+IMKgCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gaW50ZWxf
cGxhbmVfZHVwbGljYXRlX3N0YXRlLA0KPiDCoAkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUgPSBpbnRl
bF9wbGFuZV9kZXN0cm95X3N0YXRlLA0KPiDCoAkuZm9ybWF0X21vZF9zdXBwb3J0ZWQgPSB2bHZf
c3ByaXRlX2Zvcm1hdF9tb2Rfc3VwcG9ydGVkLA0KPiArCS5mb3JtYXRfbW9kX3N1cHBvcnRlZF9h
c3luYyA9DQo+IGludGVsX3BsYW5lX2Zvcm1hdF9tb2Rfc3VwcG9ydGVkX2FzeW5jLA0KPiDCoH07
DQo+IMKgDQo+IMKgc3RydWN0IGludGVsX3BsYW5lICoNCg0K
