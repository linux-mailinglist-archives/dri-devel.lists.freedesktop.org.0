Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3522ABF37B
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 13:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED03810E73D;
	Wed, 21 May 2025 11:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fi7QoVZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7972610E73D;
 Wed, 21 May 2025 11:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747828521; x=1779364521;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=UqmICb7IBTOcHfUfGmFliTP7Cu/ZWvpiioQIokqVGVA=;
 b=Fi7QoVZEk+jye7LAXgEc7z90UnCL8YbR5uOGMqqrF90hzxZLtBj30WwS
 1+hcG2DvC6vYArqyM5AXgwBkqcPHGfBOVnoYCiuTuVaMBD9mMXAYZj3PF
 JGos1JahPkYwCqC2Ale8B4gsvHsorRDmZGCs1Slq1ZEWdUQt2NT14ju7j
 kh/ByZyZiCHGTMuNYJCbUG8dNk025WmyRK3XMtN+nMrIlwWwo72TKUQof
 F5pxuTgnARWDav3Kxp1yLd1R+SbgoAawRFFZlrYKCUvjmPtaGIrxoDlTi
 DAw1MSdaxHn2joVybOUFQaEKBcgEcHQ82ZaeP3/TjWeaQAOK+veqvsP+E Q==;
X-CSE-ConnectionGUID: sqxTQ5+OQ1+5LUMgDqqJQg==
X-CSE-MsgGUID: eMRE4WCmRLqt2mfPIDPIXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="67217977"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="67217977"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:55:21 -0700
X-CSE-ConnectionGUID: mtNYv4mhTcyaPfad4WiRaw==
X-CSE-MsgGUID: UREMObyMS0qiww4YknGvMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="145012108"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:55:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 04:55:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 04:55:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 04:55:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHv/gVHQ+Vs/5cg4sRk9ODiV0aHTpADWZVqK1OVUJjYqBHenvs2Onu9GOuN6VzPz8F47kvhCzrrsLY07QZLR/wkOdFD99pd8ZlEICo49jeJv0mb8i2DwJ00Zzz7/a/TvgmDyr6ZDdu4l0GLNp3liAsiheEHMsTmbfMDCVKrpYckgxVUvIq/kgT17daTX3pk2umGsNV5oUJFM+CPnzC/vXc86M+tStvqRc32m6V+jZ6TXk1qB/zYvph16aOpKpZDqw5Bd34XR5FAFXL8vHexX9e46k+BmZc0+78wFBu2POhnHL9WkTygwMw7/y15fHzY1pfziV0B4zsQ3oPbt6N77Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqmICb7IBTOcHfUfGmFliTP7Cu/ZWvpiioQIokqVGVA=;
 b=fKPOqI6CqSgHE+/DPbM2WmxCskoYVIXybCiQ8BZ+1t6Ywp4NaWdMjLWW3SW3V8vT8oppwZzKSKIa4xF04GZ1Srv4wGLsOHGn0NHR2olsH5jBxMYee1jnuGfTZrg2ymB4tU3rTnstA8/WyKPtlEcHV/V7N5dbnnJKKofp4jN6nI5Hqjz6/16x02gYO/D1noeHmqeTaNKJHehPWK5dFPCCALhLm8hjlPQjoVWbkQCYs3sns4y0oBT4xzS08sqp8swM8Z8rzsXleLBOuyqjj07y/vPq2iW/jAfIFZoesmPPP1LKrU3MAT2OIgdUgtNi9Svg1MSd/zsx3GgsTnFdH1ttLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SA2PR11MB5115.namprd11.prod.outlook.com (2603:10b6:806:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 11:54:37 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.8722.027; Wed, 21 May 2025
 11:54:37 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 02/12] drm/dp: Add Panel Replay capability bits from
 DP2.1 specification
Thread-Topic: [PATCH v3 02/12] drm/dp: Add Panel Replay capability bits from
 DP2.1 specification
Thread-Index: AQHbyjNcpL/2UDwBPkS0WInU3UJKKLPc5oUAgAATUoA=
Date: Wed, 21 May 2025 11:54:36 +0000
Message-ID: <4a42fb09e6284842f44cc3a1042a97848251d385.camel@intel.com>
References: <20250521093240.2284835-1-jouni.hogander@intel.com>
 <20250521093240.2284835-3-jouni.hogander@intel.com>
 <132216ae-bc1b-40ba-878a-b6d250104882@intel.com>
In-Reply-To: <132216ae-bc1b-40ba-878a-b6d250104882@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SA2PR11MB5115:EE_
x-ms-office365-filtering-correlation-id: e58f5fc4-3e46-4a54-0aae-08dd985e42c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OStuMDdMaEtJSGJpd1NjK2FJajkvcDRWVE1MYWVLK0Y4UFlPRGVKR0lCUWxa?=
 =?utf-8?B?UTlwTzdLV3ZqQVd6Qm4zNjVrNGh2ZEVRTHB1eXVURE12NXpQVTNpdlgzL2Vo?=
 =?utf-8?B?dkk3dzZ3cEV5NGd2Tlo3a0g4bTFxV2VTRlZNQkhTb25xNFBRV2pseTBhem4x?=
 =?utf-8?B?WVc4Q0NRNzdtcUhoalFuL1A5ZzJQVzZxT2hNSFU2S3dxUGRvNmF6SlNnS1Jm?=
 =?utf-8?B?ZWh4OXJXaVJENmhFUjNrbTVpU2ErZktPUkowTjdwbkZJNTZnRkJLZy9LY0sr?=
 =?utf-8?B?akJwVUtjZk9oNXJuY1RWV0cwVmFZMmJCVFlzYUlteE8wVWhEV1hld2VQa0JW?=
 =?utf-8?B?cEF1UWhYU2RWcWFTa3ZXRXRXaWNpdFdHZ0M0Nno2cHdaanNSVjJQM0NXV3Ri?=
 =?utf-8?B?TTI5NFZNK3VqN3BLaWJyc010SFdpTXdXRG5pRzRDYzVJaGZybG5mVGdLalBG?=
 =?utf-8?B?eUdLdGdDUzhBMWxVQzRjcTBkcHg0M2hQeGk2OG1hdDVSV09yKzRMWmJzZ0p3?=
 =?utf-8?B?SzBSdURBc0FtN1RRTStULzJhbm82RFNQZ0NJbHpoWHY3dDdKRm5FVDd3VzVS?=
 =?utf-8?B?aUNQU05NaVJ2Ri9GbnNJTEVjeHRmVmxxSUpwQ0VreU9VNStId2pRVURsMnBJ?=
 =?utf-8?B?YUprOVMxWTZqVmY3bllnQWJZYmpxMm5rcXIrK3UvN0RSMzQxSm56eFlNMDhK?=
 =?utf-8?B?NmRqd2l5WmdlekRxZGNHSEdYTzR4SFJMVWtXRG1ud0FSYUFHVjdWNk5SV3hE?=
 =?utf-8?B?SDVTYlJ0V1o4S1d0SFY2NW9lN3Q0V1F2TlFiUXRYazA0b3R4V0ZxVWxEbG9F?=
 =?utf-8?B?L0RMVzJiNEJRTXlYWmpDdlgrQkFPNVpEWnRtcGswdlpqZm9kVEFMeDRVTlh1?=
 =?utf-8?B?TzBUSmU5RVBHZkhzS21jVm9EaldlNUJpczQ0ZFJ5alZOTXc5eDN2OEs3MTE2?=
 =?utf-8?B?WmxQR0tsY0cyTEhpcCtIYm02bDVYV3NkV1l4bkgyUnVjSVBxRCt4STc2SjRV?=
 =?utf-8?B?ek5xQ243dnFOVlJJUWlqMWlMV0gwOGpLeGxEZGMybjhPVDd1MSthdjZ1OFlM?=
 =?utf-8?B?YXROSTRnUEExbGg4by92T2dxcXhkODRPRW9xY1hmcE5SWSs4TXByZHBZQUZZ?=
 =?utf-8?B?Mm5PT2tpdE1tQ29vREQvNTlFdGFQTXJsY0ttendyT0o3RmduQXRQbTRsblFV?=
 =?utf-8?B?MXEzVzUyZ05iMUpxRm12QTZCS2xxRzd6TjU2ellhREV3VDhwYXNyQ0M2UzJM?=
 =?utf-8?B?RStYLzVaNUh0MXg2aC9mVHYxNE1LTkpuaGQxbm5JdGFTSUZnUFMyMjRGa0or?=
 =?utf-8?B?SFFSaXFaVUNuMlJrWEdaUXk4UGF4cDFHdW9LdkIwTHA4UEFrdmwzRCtuek43?=
 =?utf-8?B?ZS95NXN3cEVMSTZSSGVocEprc0cyTnEvN2QyWVZFVVJZYUhnYTYzWmg4OUl1?=
 =?utf-8?B?R01lbVpVYVFONDdqWWV1bWVoOGhWRjhGWnk3T3I3ZGplMDZzV0NYWUdBUnZh?=
 =?utf-8?B?a0YyVjEwbU10RHdoWmw2RlgvejhZMzJOMFJZSStKZzRFUHdBemlqK0JEaHJW?=
 =?utf-8?B?Y2VJdXhEa1JmWStwT2lmNERhcTdUOUhHK2hsV25HQXNqNmx3cUZTcUhoWHZY?=
 =?utf-8?B?ek11R2JNdFZqMzlKUEZyb3B5YXUva05NVTF5c1h0Ny83bWFkQTk3VmUyVnRP?=
 =?utf-8?B?VDV6V1N1VUllcXdadlJTVXVmakNDaTBhVkV1SFd1MFhGTXdZd1RJVkRnN2JX?=
 =?utf-8?B?Y3BnZ21KMFRqczBBUHZzMllJMmtoZG53ak9XdTg2RkJha3puWlNSbHhlajUz?=
 =?utf-8?B?bGd1UDQ4OWtCLzRURWF0Y0ZTaGFGMFBadGlTYVBvTXVTMDQxUzJmbElLRGs5?=
 =?utf-8?B?a1dNY2pCdFpSR3hEWDhLd01xaU1odGZtQzhGSGhSdjNXT1laMTdSWGJPYXhC?=
 =?utf-8?B?TnFNTGpiWk5Jd01QSXFaNE9MYVYxUGdyMzhFTkl2MWxiUjhvekNtM2lTRlg0?=
 =?utf-8?Q?+d+rLG/YDiR1y7kwgqiVjj6xa9plYA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVBCTEtTTHY2UnJxbm9BS1NwcFZTb09uaHNjcmo3QUU5bit4RTZCeGhJN0RY?=
 =?utf-8?B?RVBkWUpYenJqS2E1VWE4MG1NUVZPaWgzVTNTSlM0bThKREVxUGF3RVVUdXdm?=
 =?utf-8?B?U1AzKzNLVkJCMFNNY1BEcGx1Q0JpSUZ4bFFHRjFlM3crT0pwM2paYmdBcGd1?=
 =?utf-8?B?amQ3MHFmM0VuSk1TeHJmaENRbjZIc0dEaDFPdXBzNWJNelYyb3RIcVAxK05O?=
 =?utf-8?B?emNIbnZMMEtYVk00OUZ2eTJtbjBaaGxNU1ZBUGdyTnY5d2ZCcUxHSXE2dWc3?=
 =?utf-8?B?dVJFWG9TSm9NaHhGTytxT1VWTjFQaWtmZys5bWZoZlpTRTdhUVArdUgxVTlP?=
 =?utf-8?B?MkdxNFBIVmZBUDZXaSs1NWs3ZDBxRjgyVnk4Z05KYWhmVnhWOXJQRWJ2ZTdK?=
 =?utf-8?B?SEVnU0ZGMnByRzBNOGdkOVZiVnNBYkVnRkFZOVpOWWUwTU1CNGxETWE5Y0ZG?=
 =?utf-8?B?amtIUUxheVIzWHA0WlZpMmhYUHJxNGtuRTBBdU55N1ZuTXppbVVsRjdiMW1Z?=
 =?utf-8?B?R1IrM2FXWUxZV0NqUmFhcjRGaSswZUo4OFlBQU9oMGpyWEc1YmpEeGVNSnZ1?=
 =?utf-8?B?TmlYVXdrWXRKVmxXWWgvbkxLV3pHL0Zmb1A1WXFDOGQxRjd6OHJhOUlOTDc1?=
 =?utf-8?B?cWVzSHVNQUEyQ2wzR3RaY1JQRjlqV3BidVkzanRGR1pRcWNuY1dzbytkTE5M?=
 =?utf-8?B?YUxPdHdJZENhTzh0THlObzRFaEs5Mk9Nd0hlaEJWUVNyVzBmNFhkU0NPTVNa?=
 =?utf-8?B?azZHWktlMVljZzZxRnFWV3FJOGk2d2FrOStFTWlnSjJpSHlKTHFKQ1ZNTWVU?=
 =?utf-8?B?OE81ZVR0dkdPaGxIVE9oT3l3eGhJcWRic2RWbk8rb1M2Yy95MTUxb21XNDRh?=
 =?utf-8?B?aW94R0UzMkdxazBCM1RFR2FBakhzckJlR1pzSTF5ck1xSFhrOW00Y2s1Mkow?=
 =?utf-8?B?eXVycXdKRWVOUERvK2FtbmlMNXM3cjhxKzZBc2JEZWE1T1BsOXBtNGRhQVBJ?=
 =?utf-8?B?aDhublQ3K0djNWFCNUJndUVXRFdkNHlVSnBJZnZkWGhsanhVcGRyT1Q5TXVh?=
 =?utf-8?B?Z3ZLdTBzYXI2VFUwU0thVTQ0NkdabDZHYkxqRDNabmtBNjBvNnBBQWN0R3pY?=
 =?utf-8?B?cEd1cnNHemh4ZFhHVHUwRHllVVF0TUR2eFJGcXdiN0dLOVBVZktPUkNFaDZI?=
 =?utf-8?B?bUI0dGFFUHQyNDc4NHNjajN5cUFQOVd6Ykl5UHZrN3Bwd2xaSlRFQzBPblc2?=
 =?utf-8?B?LzBPV2JKRndxVW8wanJDWEo2NnBkL3VQY29IZzU2WURRKzFHd1FnazVMaVFs?=
 =?utf-8?B?Y21ySzJsOXYycVJZVzl4NkNUNERTVFBhUGR1UjVRdG5XYTY1ZWNwSjRhNmEy?=
 =?utf-8?B?RnNIV0Q5cTJSUzNoNWNBVEFyR2dkUkJMS0E1TVhFb3dpQXdlLzJsQXlLbmNR?=
 =?utf-8?B?SEhudHJlSStMZC90YjBaQXdJNjF4VGplYlFVZ2hWT0FUQVBMQ21EM3I4alc0?=
 =?utf-8?B?L1NGNGhIZDdGZ3N0OEJxL3dPSysySUgzYy9aMWFZVEF5d1l4Y1dQbWNUQWRz?=
 =?utf-8?B?WWRZR2IvWFhGVkwrcGxJT29ybXNxMllJL2VDZmljU0llbVI0NWhZNUJWSUhK?=
 =?utf-8?B?eC83R0JWMm13M2QvWm50K0V3V0kzOHNONDN1a2FxTys1VTEvNmNxcXE4eWIx?=
 =?utf-8?B?NFI3QS9DZ1Njb1puT1ZLSHF5SmJja2xkSUI4QklpbXdWbmh6NEVhTzRScDFu?=
 =?utf-8?B?NmM4bm9NcWVxWjB0UWg2dWlGNlAwUFZnQjFjcTU4Z2svUFRuQ00xZWVySnBQ?=
 =?utf-8?B?U28vZll1STRWUWJncE02NExvN2IxZWVmWTZEZFQrMVR1RjRpSmZ4cXVoOERy?=
 =?utf-8?B?YUsxQnFhMGJRVHZRZ2VxbFlOWWpDajY2OURsUGl0ejVBVGV6VEVONVNFSjBL?=
 =?utf-8?B?RUlJRnVKSFFJdVRzTDJBcmZaVHBQRTJIMy8yeFpiWnZsV2lyc0pkL2VmZzM0?=
 =?utf-8?B?Uzl6d0h4UWlxR05rN1VrazdoNTFQTm9tQzlkaUpPUk9QZ1NaZUw2RTFQcnUw?=
 =?utf-8?B?UjB1Z3RERDUzNXVOalBkdlg0LzlUSTVxTy83N0dhbmZTMVNqbHlIZjVpZU5C?=
 =?utf-8?B?eDJvWTE4Y2pDSzFoVm5QUlRNUGkvaHYwcmovMjYzNHlhdzduN2toOTNja2JC?=
 =?utf-8?B?QUxrRFRyT1p4dC9qZktPS3hoYWdEL3gzMnlZN1ExZ3ZWdlBXbi9vTmtKRFFY?=
 =?utf-8?B?OTBxRDRjbVBMd3gwQUxmem9FamFRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE5FE5296ADDF04595FF940CC0101D1F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e58f5fc4-3e46-4a54-0aae-08dd985e42c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 11:54:37.0499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jZtFWLF1rVpaOZIg3W9zRJwhHiP2y+/xGskznRmcSbHxBzDu/WaC+04SjV9T/mSh0lrdlVfeKwsGmfXvK5gTEM2OJASLmHbgVJygcBwh+dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5115
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

T24gV2VkLCAyMDI1LTA1LTIxIGF0IDE2OjE1ICswNTMwLCBOYXV0aXlhbCwgQW5raXQgSyB3cm90
ZToNCj4gDQo+IE9uIDUvMjEvMjAyNSAzOjAyIFBNLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6DQo+
ID4gQWRkIFBBTkVMIFJFUExBWSBDQVBBQklMSVRZIHJlZ2lzdGVyICgweGIxKSBiaXRzLg0KPiA+
IA0KPiA+IHYyOiBjb21tZW50IGFib3V0IERQMi4xIGNoYW5nZWQgYXMgRFAyLjFhDQo+ID4gDQo+
ID4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5j
b20+DQo+ID4gLS0tDQo+ID4gwqAgaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAuaCB8IDEwICsr
KysrKysrLS0NCj4gPiDCoCAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9k
cC5oDQo+ID4gYi9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oDQo+ID4gaW5kZXggMzM3MWUy
ZWRkOWU5Li5jMDU3OWY4Mjc5OTkgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZGlzcGxh
eS9kcm1fZHAuaA0KPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmgNCj4gPiBA
QCAtNTU0LDggKzU1NCwxNCBAQA0KPiA+IMKgIA0KPiA+IMKgICNkZWZpbmUgRFBfUEFORUxfUkVQ
TEFZX0NBUF9TSVpFCTcNCj4gPiDCoCANCj4gPiAtI2RlZmluZSBEUF9QQU5FTF9SRVBMQVlfQ0FQ
X0NBUEFCSUxJVFkJCQkweGIxDQo+ID4gLSMgZGVmaW5lIERQX1BBTkVMX1JFUExBWV9TVV9HUkFO
VUxBUklUWV9SRVFVSVJFRAkoMSA8PCA1KQ0KPiA+ICsjZGVmaW5lDQo+ID4gRFBfUEFORUxfUkVQ
TEFZX0NBUF9DQVBBQklMSVRZCQkJCQkweGIxDQo+ID4gKyMgZGVmaW5lDQo+ID4gRFBfUEFORUxf
UkVQTEFZX0RTQ19ERUNPREVfQ0FQQUJJTElUWV9JTl9QUl9TSElGVAkJCTEgLyogRFAgMi4xYSAq
Lw0KPiA+ICsjIGRlZmluZQ0KPiA+IERQX1BBTkVMX1JFUExBWV9EU0NfREVDT0RFX0NBUEFCSUxJ
VFlfSU5fUFJfTUFTSwkJCSgzIDw8IDEpDQo+IA0KPiBUaGFua3MgZm9yIGNsYXJpZmljYXRpb24g
YWJvdXQgRFAyLjEgYS4NCj4gDQo+IElNSE8gaWYgd2UgYXJlIHVzaW5nIHRoZSBzaGlmdCANCj4g
RFBfUEFORUxfUkVQTEFZX0RTQ19ERUNPREVfQ0FQQUJJTElUWV9JTl9QUl9TSElGVDENCj4gdGhl
biBwZXJoYXBzIERQX1BBTkVMX1JFUExBWV9EU0NfREVDT0RFX0NBUEFCSUxJVFlfSU5fUFJfTUFT
SyBzaG91bGQNCj4gYmU6DQo+ICgzPDxEUF9QQU5FTF9SRVBMQVlfRFNDX0RFQ09ERV9DQVBBQklM
SVRZX0lOX1BSX1NISUZUKQ0KPiANCj4gQWxzbyB0aGUgRFNDIGRlY29kZSBjYXBhYmlsaXR5IGNh
biBiZSB0aGUgdW5zaGlmdGVkOg0KPiANCj4gI2RlZmluZURQX0RTQ19ERUNPREVfQ0FQQUJJTElU
WV9JTl9QUl9TVVBQT1JURUQweDAwDQo+ICNkZWZpbmVEUF9EU0NfREVDT0RFX0NBUEFCSUxJVFlf
SU5fUFJfRlVMTF9GUkFNRV9PTkxZMHgwMQ0KPiAjZGVmaW5lRFBfRFNDX0RFQ09ERV9DQVBBQklM
SVRZX0lOX1BSX05PVF9TVVBQT1JURUQweDAyDQo+ICNkZWZpbmVEUF9EU0NfREVDT0RFX0NBUEFC
SUxJVFlfSU5fUFJfUkVTRVJWRUQweDAzDQo+IA0KPiBXZSBjYW4gdXNlIHNoaWZ0ZWQgbWFjcm9z
IHRvbyBidXQgaW1obywgdGhlc2Ugd291bGQgYmUgZWFzaWVyIHRvIHJlLQ0KPiB1c2UuDQoNCkNo
YW5nZWQgdGhpcyBhcyBzdWdnZXN0ZWQgaGVyZS4gUGxlYXNlIHJlLWNoZWNrLg0KDQpCUiwNCg0K
Sm91bmkgSMO2Z2FuZGVyDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEFua2l0DQo+IA0KPiANCj4gPiAr
IyBkZWZpbmUNCj4gPiBEUF9QQU5FTF9SRVBMQVlfQVNZTkNfVklERU9fVElNSU5HX05PVF9TVVBQ
T1JURURfSU5fUFIJCQkoMQ0KPiA+IDw8IDMpDQo+ID4gKyMgZGVmaW5lDQo+ID4gRFBfUEFORUxf
UkVQTEFZX0RTQ19DUkNfT0ZfTVVMVElQTEVfU1VTX1NVUFBPUlRFRAkJCSgxIDw8IDQpDQo+ID4g
KyMgZGVmaW5lDQo+ID4gRFBfUEFORUxfUkVQTEFZX1NVX0dSQU5VTEFSSVRZX1JFUVVJUkVECQkJ
CSgxIDw8IDUpDQo+ID4gKyMgZGVmaW5lDQo+ID4gRFBfUEFORUxfUkVQTEFZX1NVX1lfR1JBTlVM
QVJJVFlfRVhURU5ERURfQ0FQQUJJTElUWV9TVVBQT1JURUQJDQo+ID4gCSgxIDw8IDYpDQo+ID4g
KyMgZGVmaW5lDQo+ID4gRFBfUEFORUxfUkVQTEFZX0xJTktfT0ZGX1NVUFBPUlRFRF9JTl9QUl9B
RlRFUl9BREFQVElWRV9TWU5DX1NEUA0KPiA+IAkoMSA8PCA3KQ0KPiA+IMKgIA0KPiA+IMKgICNk
ZWZpbmUgRFBfUEFORUxfUkVQTEFZX0NBUF9YX0dSQU5VTEFSSVRZCQkweGIyDQo+ID4gwqAgI2Rl
ZmluZSBEUF9QQU5FTF9SRVBMQVlfQ0FQX1lfR1JBTlVMQVJJVFkJCTB4YjQNCg0K
