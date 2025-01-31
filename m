Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF60A24300
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 19:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5424D10E424;
	Fri, 31 Jan 2025 18:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5Rx2RfS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B554110E43F;
 Fri, 31 Jan 2025 18:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738349777; x=1769885777;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YhKwHDFbrqWOmhdh1x6DxcLgnK/85V58gYj1gt4zosU=;
 b=I5Rx2RfSHz6GpPZrPVUbMtyx0+Ict4mf4oRidzoWPtdLomDR2UCFOyvO
 h4VmlVfOY4n9FPEbbur6Y09eSLaYtCFNZneius4bpEppZ0ZUszhQadSDJ
 RGEVxHZO4ukxdKEXqJg5KLXZc0G3jnu9E50MJZLEszZbQz8bKVSS7vYm2
 jXNgn/TcdHdQ/bTXLA8RIEszNvyDlCWD0DS4VlsmcPosmaAPHAYZTY0GA
 aFWmmrKWM+Fn5fpfEJxLbh5JhvcI4pjxuSS0w7tnGMRWFPPPZjdzOTvLo
 4KusZUEnXAtGRQ3ONoufAQe2tUloY9m2b9HdGi+zfvi7KLWw+Rr5vIYzc g==;
X-CSE-ConnectionGUID: AklcOTQMTE+uGI3hW52q2A==
X-CSE-MsgGUID: C8Om3eBCQ3m9aFqVJQMmnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="39084345"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="39084345"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 10:56:16 -0800
X-CSE-ConnectionGUID: BdWwS9QORY2gL84m7BrlMw==
X-CSE-MsgGUID: x2BACz8BQMGNdfb1YEwwog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="109598929"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 10:56:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 10:56:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 10:56:15 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 10:56:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=su3hhPbtTNliLJYhhEhl5MHWqpgzV1LTnqhjlqLA79NaIbuPM3fpOoyYB2y9o1IY7/x3jpPzERBlrVxYlkWxvLtyaNnI5OhXpowxO/5IjhLLv1Yv5HE6hgIyVqCWAu4No/INBYVeAY0E/5PDdn7eeIQlpG3/H9IJwCZam/2CRcoF6untlNaL0CcU0cBGqMyChcBEE9bdgxxw7O2eAhAls5K7d8tXG02URF1ge8Fs1v949eQIZ/d2EHDfIv1+LkSKYe7Vt88diLU3FLggfkmK+ScXXOEmlXO4VewqdR0FNBOUhmffhRLIYWNaC1o0yQoxne9gWhqIMs1ZTT0IYF2wIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhKwHDFbrqWOmhdh1x6DxcLgnK/85V58gYj1gt4zosU=;
 b=fE2JRHo5zAQclvEJiQDkagIz00on05OV8AQS8j1NpGrtRtM71PdG8I+W8LAKW4VMoPlufuXgOX9xAD7N00M+71mQJFC7sxPBDtvU/bc5c+nR/2BY+IHqT9nDIJrcwPgWdRe+5jl/WS9HvsfBpJL0D0Wqlwk/hHOqCaPutoxufCWJwE/sR1Kcf8Ek7043rgax8kBrJdrp7HmwQCQXKCFetxu8US13nBr8zNNCCEBuRyHY2gW1XLbMX8GuUtygpq6wQdtlOHqhKZdQVU0nsK9VRqCRemOISWaXu3x6OBtmoArsWUCWP0N/870cz+8uQ24UFx8SHqRrc/sYvruhkClbtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 18:56:08 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 18:56:08 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v6 4/6] drm/xe/guc: Move xe_hw_engine_snapshot creation
 back to xe_hw_engine.c
Thread-Topic: [PATCH v6 4/6] drm/xe/guc: Move xe_hw_engine_snapshot creation
 back to xe_hw_engine.c
Thread-Index: AQHbcbOgXdRhp7aKZkOdnbCkV2SvV7Mv7XuAgAFSrgA=
Date: Fri, 31 Jan 2025 18:56:08 +0000
Message-ID: <2df2e1ac9bbd72c9766e7fffdfe4c6e87489b219.camel@intel.com>
References: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
 <20250128183653.4027915-5-alan.previn.teres.alexis@intel.com>
 <Z5wAq14aXXIccYhI@intel.com>
In-Reply-To: <Z5wAq14aXXIccYhI@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB8035:EE_
x-ms-office365-filtering-correlation-id: 42a55ee2-7450-4517-6af4-08dd4228ec49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MGRUMCs4WjFEajc4UEFqRm5RVmpVM0JUQW5RZlorVVdaMnRQc0hsV254YzIw?=
 =?utf-8?B?eGNma1BjTDFKMEhSQUE0MmhRODl6dnF5UThhbmV5RVlNbGlsOUVFMmlSek5C?=
 =?utf-8?B?K1pwU1BYZzVDMCswa0dLMFZiMS9USllwejFNVU50cm5JT3pPWVdncUhnL0I1?=
 =?utf-8?B?Z3VIc3dkVjJvM0V3Y1Q2M21LOEVEYnFHOVNmSzdGMGplTjhyWURwd3hnMThh?=
 =?utf-8?B?WjI0WDRDSnMyVGVpTUdscE91NTBpRiswWUlKbHhvM1RmdHM0WDRSRE1aN3Fs?=
 =?utf-8?B?Q0M4SFA0ZnF4cSt3eG94TWFtRFg1WXNoNUJMTGl2UEJWTFNLbndRVjI1aHB6?=
 =?utf-8?B?dHYzamNadzRYdUViTU1LdWZBSDlhb2ZERE56ZWJ5bHhVU3l2M2E4V25yU2Ru?=
 =?utf-8?B?UXloVkFqb2JYTTdUYjlkT1B6aFUzL2JLNHJySzhaZlZuempyTklJWkNqK3ht?=
 =?utf-8?B?dlYxNUgzWTAyRTNnbmRJem1ya2pGMmMydVBwNnRjajRFdmtPalllc1dtN2hy?=
 =?utf-8?B?SkxKdHhFcE4raFNUd3pOM2VBelRUemk2Tzlpek1naEZ5Sjh3d1NsMFlwSzBo?=
 =?utf-8?B?VjhWQU1BNitMdlhKd3ZSZElBRkxNd0JEWjkrYktaajl3c2dvTmJlZU5MME1a?=
 =?utf-8?B?bWdqeVlWYUV3M2l0VTlDV1hyaU1BeXF4VHFLVjlmd1M2eHBMSkNBMnUwWHo1?=
 =?utf-8?B?bUJRdTh3S1hzK2FsKzRoblFTS3pVbG5jN2g5T0JyQmUxcWRUamlVVXdtSmJD?=
 =?utf-8?B?RHc5aEE1RGVDVjNYR1lsUVAzQkhGT2pIbXlDWWFiUG94WDZQaHJCR1F3U2U3?=
 =?utf-8?B?WHREb2FPQnhRTXRMWGdPVEloUVB4ZHU2MXlkN2U2dDdCN0pJQkROeWh5eGFZ?=
 =?utf-8?B?NFFNZk5kNGJINk5DZGtQMHZDMW9yNDFsTXlPTXMzMHNnWEY3cHM1bUtUM0hq?=
 =?utf-8?B?SksxUDhNWDBBUzZGa0VpdWg3OSt0SGkxZHh1aDU2cXdjYlVyMEZKK0xOcnd0?=
 =?utf-8?B?THBFWWYvVnE4L29oN1JlR0pIL1JRQjhuclQ3STR6VmtnSFlFcXJkVm9QNnln?=
 =?utf-8?B?ZnVDU2tQM0h4L2dIS0RYbEJVLzdwVkhSbVJ6S1ZKYTRMNlZHMTZoWkVJU01M?=
 =?utf-8?B?Ti83b3E5TEoxeDhrTmtyRGw5V05uM3Fackd6c0p6VW81UXUwNXRsR29xOEY1?=
 =?utf-8?B?U012bm9JY3pFWGlNVWZvL1Y3bndmcERua056MUU5dXYrWmhZazNnUDBGOFps?=
 =?utf-8?B?dlNrblVrN2hyMjN0VFo3YzZjRVd3QW84TyticCtWMHJ3emdYYXRBdC90dFU2?=
 =?utf-8?B?ckRubXkvNm5qcS85aW9TWEVmcWY0blByZ21GWjhmSTlBSW8rRlQ0QllXcjFz?=
 =?utf-8?B?K09YTytNejlKWHFGVnFUQzl2MkgvcFFyMUEyYlhIQVovbFE3d2lDTzE5Y29C?=
 =?utf-8?B?RkFUZUE2VUlHeUtNYXVvTmIzbk1rUXdoOGVLT2xmSVYvN1pXL1RkWHhZblpt?=
 =?utf-8?B?bVgyVUpwYTVoc3Z2SGpxOHZLbHVsNzZqWDlWZG9IS3Y1aU1jZytUb3FhUmRG?=
 =?utf-8?B?SUZnMEZ2UGorSnFBZEk5aGtabUQ3cit3Q2kzYlJVZkF0d0hoVWJRWFkwc1FO?=
 =?utf-8?B?enZCRUUrb2lSekhjYndVMlRBdE0zNGYxSWIySm5IaWcxNzRSNzd6c2JLZ1pn?=
 =?utf-8?B?YXFxRW90a01HSmhNUzdUZHlMSkUzUnVSVGJIMkR1YW9ibXhLaHROSXNpeUhI?=
 =?utf-8?B?OEc1MkxzU3A4MG9GR2xEM2tHK1RDa3Fmc2hKbzR0V2ZkWjdOYTA1cWQ5OFFZ?=
 =?utf-8?B?OEhhWXNnWTNiNmlzaE9tT1VwSlY3cjJJNVFOZHhEOERqR2tjM3FVL1RsSFU0?=
 =?utf-8?B?b1FTb3JpWHBXLysvbGQxdWJhZlJBdWp5MDhjODJPRGVlUFRhakNPY3d4TGJL?=
 =?utf-8?Q?O+W4AQVc8c24AizwpdRRndQKI91g5wqu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHl4VncyNFFnMm5IZHRGUXorYlV4RDQrR2Z0VjB5b3RNckFFOHRCQUxYL05S?=
 =?utf-8?B?ejMwRUNOQysveXhXSkVFMmZUaS9GV1BpNmsxc1VFQkcrVmZpak9qK0RQaDNX?=
 =?utf-8?B?bm5PK1FsZForYlJxYTY0dXhkMjU3SGpPeW53d3laMU01elJCZTJaR3JYMkt6?=
 =?utf-8?B?UUZIUE1vVkVxcEY1d2FtUllVbDN4Y3JHS3FPbEVLMGlFT3lCRXBKNlo0YjRC?=
 =?utf-8?B?RGJnZlNFY1pUR0pFajh2bndidUFPSTU4elcyY3RvNEJ2Q0FKd3NuTE4xYVlt?=
 =?utf-8?B?SXhSR3JyWEFXRXRoTXVpQkN6aWNJMWxOK2JiN3N4MUFDMkVxVFFGWUJkaXdy?=
 =?utf-8?B?TS9ycStnOXJXNGFJWkhKWFhvR2lWbWlqMTBZSDFoeUVCLzUxWEl2Vy9Selk3?=
 =?utf-8?B?TlRyVVhoZmFIN3JoRFJITi9DanN4dE5Xbi94OVgxVVRTb2lwL1JIMDc1ek53?=
 =?utf-8?B?ZXl5c2lFZUo0ODFXY0MwcnloRUw5WWo1QW9JSFBqbllpdEM4dTNDWFF4Vk5w?=
 =?utf-8?B?T3F5NmxEUGNvLzhCWjhSUU8zVTZUbWRzVHNDNmViSitBRmcwRys5bTJCUURy?=
 =?utf-8?B?aWIvWnRhaGwvZGJTMXo1YXgzTDNlb3ZFVVpLWVFOaVBPZGFuaFZmQUFBWTNz?=
 =?utf-8?B?YlZiWE1idWRCYi9uemhzSm1FYlRCemVEUFN1bDlqcmc5SGVBWFRrd2twQnlt?=
 =?utf-8?B?ZEFMM3UzcXYvSDZEbWpiMlhpWGZKbXVmZzd6SlBqNkZ4bXNqYURrZjQ3d1pL?=
 =?utf-8?B?TUpqOEpJK1dXV3E3U2hLUGJORTF5U3l5cnJCRlpxcFFodDJhSXpLTkdrcGZM?=
 =?utf-8?B?Tmw2a0pRSE9zZjk1aXNsM0RiKzRJZm9sVmxwSkMzS2pXR1pNM3dCL2VqUncv?=
 =?utf-8?B?TlNRL2tNVnVlald0b3YydXUvdTFHa3RBQ0JZQkNlUHZET2RkYXZ3VU0zcmNm?=
 =?utf-8?B?RW1Bc1JpZjBDbFVUZ0hHeU9mMUtYYWVpVExYY1o1RnVydGFFRHZRTldaWVJH?=
 =?utf-8?B?SjVzUWNlZ29LSHg1WncwYXJQNWJxTHVudzIxZXJLOGZobEhrRUpXajdsRVJT?=
 =?utf-8?B?OHg0NGxsS1d1K3MyemVxQ3ZSNEJCb3JjMFk3eXlzTWp6ZVFzYnhjd3JGOFVZ?=
 =?utf-8?B?TGdqMW5UbW9qaFAyZVFUeEJoRnFyWVNaRlZ1OEtxWG9iTXl0cnd0UkpIU2lG?=
 =?utf-8?B?N0hrMm5OSEVLdlBodWJSSURkU0twbTVtYnREaXNkNktpQ2FEWDJNQ3N3YWt1?=
 =?utf-8?B?bjNQbUIxUUZWeTV5aldmNFBJTUhIb3lBcjU1djFLWklmVXVGSnBmSlhtZVJa?=
 =?utf-8?B?VlVtb0QzMjYrdjJPYmFsQ1BGVHlrdE1sU0NmNVMrNHN0SkJCdEErTkJWY2ZB?=
 =?utf-8?B?ck04K3E3UUFTd2FZOS9udFJhOURaaTZhSDdTdk02S1ZXMVlTR0QyajUzN0JD?=
 =?utf-8?B?MWlZK0liVE81NS9GeWhiTzY2TTY1UzJVNjBuSG94RjhKRjNsQ0RrSVBQUlEz?=
 =?utf-8?B?RkdlTUFrMW1iYVdKb3o3eUsxNVphbXFGdzhIdjc4YW5iaVdteWJrUndwWmI0?=
 =?utf-8?B?eWx4WjhiRlBQQmtsVW80dFFhWkd0MitrNncvNHBCQlRRK1JJaGxrYUFNNjBO?=
 =?utf-8?B?Vk9aY1lEYWRnaHVkTWFOOFJNaGxLYlJ1YytWeWhiMnVxVSsrUjEzRUFrQjA4?=
 =?utf-8?B?OVRTeWMrUVRXZ0d2NzN1UFpEcGx4U1NCdW5sK0ZKb1BJemlQRmsvSkZkOHp6?=
 =?utf-8?B?Vlg1dGFZbE0wbFpHZnQ5a1VodVJFc3lzS0ZqMWpObWxsTUVjVzdBb0hMMmlx?=
 =?utf-8?B?UXMzQ0NCNDR2aFVKU1FxZGJXMHh2TUpDMXdTelZEKzhHb3NtMVRrajJsZTkv?=
 =?utf-8?B?WDd1bmhJZTliVUtnRXpHR3Y5QURLUXJvVzFPMzduTTF4aHpkcU9FdEkrdysw?=
 =?utf-8?B?THY4YTA4VFpPY1p3ZS9nbi9GaTNGRWhON3d5M2d4ZkFGM2FlL1h4Rnp5N201?=
 =?utf-8?B?aElCOXVsYklMRkx4NkwyaEZEaTBEb3RmZEZFWFduUWVJbUFEUmQ0THlOS3d6?=
 =?utf-8?B?S2MrWFlMN2p0d1VIQ1ZGM05oSHMrM3J4ek4xUC9CRjQxLzhaNUxXU2g3T241?=
 =?utf-8?B?Q0dDYzUwRmd3SHFzcXNOYXRWUUJBa2lHczAvQjB2S1RWbXcwV2lpNlUyV29Z?=
 =?utf-8?Q?FZeoqTyD4njsFgFuxKu3jA0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC6C0B3C2DE6C142A1E20652C0653790@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a55ee2-7450-4517-6af4-08dd4228ec49
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 18:56:08.6597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NsLR41A5mlok01a89W4AdXIvJ52WsgMYcZTsVFu8wRJWfmUhhY+f9cvmBFDy2daUIfWtNbFA2WHFMsxdY0rf5wNSqhOrg2Z8pHvaoFsgg10N30D2tHYGt2yqTLL8733b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8035
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

T24gVGh1LCAyMDI1LTAxLTMwIGF0IDE3OjQzIC0wNTAwLCBWaXZpLCBSb2RyaWdvIHdyb3RlOg0K
PiBPbiBUdWUsIEphbiAyOCwgMjAyNSBhdCAxMDozNjo1MEFNIC0wODAwLCBBbGFuIFByZXZpbiB3
cm90ZToNCmFsYW46c25pcA0KPiA+IEBAIC01NSw4ICs1NSw3IEBAIHZvaWQgeGVfaHdfZW5naW5l
X2hhbmRsZV9pcnEoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlLCB1MTYgaW50cl92ZWMpOw0KPiA+
IMKgdm9pZCB4ZV9od19lbmdpbmVfZW5hYmxlX3Jpbmcoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdl
KTsNCj4gPiDCoHUzMiB4ZV9od19lbmdpbmVfbWFza19wZXJfY2xhc3Moc3RydWN0IHhlX2d0ICpn
dCwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZW51bSB4ZV9lbmdpbmVfY2xhc3MgZW5naW5lX2NsYXNzKTsNCj4gPiAt
c3RydWN0IHhlX2h3X2VuZ2luZV9zbmFwc2hvdCAqDQo+ID4gLXhlX2h3X2VuZ2luZV9zbmFwc2hv
dF9jYXB0dXJlKHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSwgc3RydWN0IHhlX2V4ZWNfcXVldWUg
KnEpOw0KPiA+ICt2b2lkIHhlX2VuZ2luZV9zbmFwc2hvdF9jYXB0dXJlX2Zvcl9xdWV1ZShzdHJ1
Y3QgeGVfZXhlY19xdWV1ZSAqcSk7DQo+IA0KPiBoZXJlIGFzIHdlbGwuIHBsZWFzZSByZXNwZWN0
IHRoZSBuYW1lIHNwYWNlLg0KYWxhbjogbXkgYmFkIC0gd2lsbCBmaXggdGhpcyAoYW5kIHRoZSBz
YW1lIGluIGxhc3QgcGF0Y2gpLg0KDQo+IA0KPiA+IMKgdm9pZCB4ZV9od19lbmdpbmVfc25hcHNo
b3RfZnJlZShzdHJ1Y3QgeGVfaHdfZW5naW5lX3NuYXBzaG90ICpzbmFwc2hvdCk7DQo+ID4gwqB2
b2lkIHhlX2VuZ2luZV9zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfaHdfZW5naW5lX3NuYXBzaG90
ICpzbmFwc2hvdCwgc3RydWN0IGRybV9wcmludGVyICpwKTsNCj4gPiDCoHZvaWQgeGVfaHdfZW5n
aW5lX3ByaW50KHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSwgc3RydWN0IGRybV9wcmludGVyICpw
KTsNCj4gPiAtLSANCj4gPiAyLjM0LjENCj4gPiANCg0K
