Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E2EA08717
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 06:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD07D10EFC4;
	Fri, 10 Jan 2025 05:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ixti4OUt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC4F10EFC1;
 Fri, 10 Jan 2025 05:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736488744; x=1768024744;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sOhNAjowd4G2VHbLA/4Ygr+vjLGdFSlU6TDY0qxJXoA=;
 b=Ixti4OUtLSX/R7+T3yQAPZ+Vupy6Y1VqNjBbCtwZeXBQia8gYsEFasMa
 ZNpljsJng3ZbCWctyf6a0vh8bO7qkOOyz/AZb2kxbfsXZxgqWPeLWhcFl
 P+hU4uMXSiobLbveqWLX6V7HlqYFEjRBuFbcO8n5Poz6g+kEOhMG8F7RO
 2k8QJgbkr8tanCOt3I0q7p+rzljnhOo5kgzphb0YDmECAqwMa/8B0Y+6n
 i0V+J5NL8HjDaekMhfjABVgy/yOq9CRtCENqFzHdt286yETVJzekEZDky
 6TjveReRYlBKI/Pe3ZyxOnyVNNGJm2GjjtAKUMCMLr/TYWTCacvkGEeY7 Q==;
X-CSE-ConnectionGUID: au8CqsvrTnamcHDI0NKJXg==
X-CSE-MsgGUID: e3IbgO65Qiq2BE4ZSU5hcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="24376971"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="24376971"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 21:59:03 -0800
X-CSE-ConnectionGUID: Eq6zLytyScqq+e1BSOvlOA==
X-CSE-MsgGUID: +9vgufnDQ4ClXaeY3TD8/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104516023"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 21:59:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 21:59:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 21:59:02 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 21:58:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ba6f1lCl1wT7gP+i3ffA4SrGPBkiM0UGHXy4MqREHTM637cRs2LFaYyTgD2Y6nKj1AewH8AvE3TlOYorXFaFhkMgr3GsXvuc3gejzcc1o4bFPlsHNAaodNNLz4tFotHCNmubVCiQ4Nh5iKM4aaSMsnKwqh8iEzyi4YRspgt1TTYPOIsycckNPNmDnTh4oWxV0FeZHZ/277VOPT/vkf4ILR4quaE+Lr3WI1iCU/i14cbgWeMBXi1MpDlQ3r4PZgZHVxyMNk8Ioy0+pfv/G7XigczLXeZkRm+6feYfy4qnZafftmSPeIAnxkqJZNimIKtz/1EUxNLs/bdTpQrqOereag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOhNAjowd4G2VHbLA/4Ygr+vjLGdFSlU6TDY0qxJXoA=;
 b=usWtnIeR9qzjvNlmh8KAbcBxYl1kDajR4fPocatDoVzfayfVwVgXDBmRT56WhSBx7Ssf085qMeIF/rPx7pFd/+58KcHu77TcLNCj25loDlIgTJfQ4APktPEvFnMvwP8YNfeFKhUbh1VSJujukMG03Jy0l3fUc6IuB3qDgLPYcHSNQSA/CQYZKZWXYlN1uaqzR7NmHhizooO9ZMAvrUaHmNr4NZyxixC3om3Dnlj73rYsNl6N4haqzJGReecZiu3GnyI/v2eeUOF0mGg+lXtgIAd8apRs8vQ4M8M5sJWCmb/+sQLdCcMY7Y9gon0awNTBpOQi7/eMc5lCKbxg7zI39A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SN7PR11MB7537.namprd11.prod.outlook.com (2603:10b6:806:348::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Fri, 10 Jan
 2025 05:58:46 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 05:58:46 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "Shankar,
 Uma" <uma.shankar@intel.com>, "\"Imported from
 f20241218-dpst-v7-0-81bfe7d08c2d\"@intel.com"
 <"Imported from f20241218-dpst-v7-0-81bfe7d08c2d"@intel.com>,
 "20240705091333.328322-1-mohammed.thasleem@intel.com"
 <20240705091333.328322-1-mohammed.thasleem@intel.com>
Subject: RE: [PATCH v7 14/14] drm/i915/histogram: Enable pipe dithering
Thread-Topic: [PATCH v7 14/14] drm/i915/histogram: Enable pipe dithering
Thread-Index: AQHbYtFYS+slMqsgy0GY/BukIYGDVrMPg6sA
Date: Fri, 10 Jan 2025 05:58:46 +0000
Message-ID: <SN7PR11MB6750FDDE7822EB44AEB4E486E31C2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-14-605cb0271162@intel.com>
In-Reply-To: <20250110-dpst-v7-14-605cb0271162@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SN7PR11MB7537:EE_
x-ms-office365-filtering-correlation-id: 195416fa-e20f-4377-c18c-08dd313bd8ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UkpzQ3pMdHZTQUFPdHl2OU00bmlSeWRDUlpMWms5Q1JnUEVCdmFmajF1b3Ft?=
 =?utf-8?B?NkN5UENoK2EwUXVhNXNXWU9qS2FWRWZQZHNzRGw4WFFrSjBMTEZTUWNHekEz?=
 =?utf-8?B?NTRQRDBuUnVYZjNBM0ZEZk44WlV6QWV6Snhwa1E1SElLQVM5OU1EY2xhNGxP?=
 =?utf-8?B?UEtMa21Ud05ndUZ3VmhWUzRzdGcvN2c3MlFnbVcrYzQrMHBaVnFGODNDaHlE?=
 =?utf-8?B?VXd3ZFordjZBSGRjVlNUd1RYeGVYejUyMTRJTDRjL0REd1BhcmxUektoT0NK?=
 =?utf-8?B?aGRyZTFya1VKNUd0a0t4d0tiYzZPT0dOaWJ3NDllT3F2M0xXc20rb3BZd2Ru?=
 =?utf-8?B?QlR4c1Y4MW5oN0JJVGVuTzVvZGxHN2FHcGRkL05kdjB0TWNkTkZGTThjYWdH?=
 =?utf-8?B?elBzeXV6TnB0L01VT0hoaWhzRXNjUHVUMWxBVUZUbFZUV1N1eGJVQ2drcjJE?=
 =?utf-8?B?Mnd1MndMU3RDcDlUK0FicWVsalkrSFZUZFVLVWVtU0RST084Ly9hZkh6a2ZJ?=
 =?utf-8?B?QjY4bDR2ZzZRVUI1bVp1QVNVYkx2ZDJ3eHRwMkcrR3FwUjBzWlArWWt2VDJo?=
 =?utf-8?B?c3VGQnA4bzFMTjNIK3Bud1NSYmE4WDluTytnZk9YYWdVenNuZkZJTmZMVGlC?=
 =?utf-8?B?QUhMcUFYalV1VzREcUhBWXN1SHdZN1IvN0JJaXlPWFI0aXA4L2FGSWsxakFI?=
 =?utf-8?B?MkxleFBxNTlraGlpc2EvQUxkbEhSc1djVEgvRW9La1ptMmYxSHdkaUpsWnNN?=
 =?utf-8?B?ZDV6WUVxYXNmek95ZTBvVUVCeC94c3FqS0FHNFBYR2xXcE1GNXMyNUNvM3px?=
 =?utf-8?B?TzcwbUxsanRFSnBibE9WLzJ2d3M1M1FmZ01ra3JsRlR0RHE3MXlxbHhOcys2?=
 =?utf-8?B?eXFjdWF0dVFVNUZqckdsZys2Qi9NMVhRZVhLNmJ5V1J1Q3hsTXlUSDA2TU5K?=
 =?utf-8?B?NjZkbzZmN3Jsc1J6b1plb2NRNHlLUS9KZ3RpRThXNm1RaTVUMk5CK1E5Q1lH?=
 =?utf-8?B?WWxNWU9aSExwUi82K0h0M2FtenpISDlDSTlCVHlGMlhxVlI2T3pMWWZjcFJG?=
 =?utf-8?B?TGRyemRtVFpVbVhDaDVXTkhzRWFiUE5HQ0dQUnNCWGN4d1lpV2o3R0FKQnNZ?=
 =?utf-8?B?L0hickMyOTIrQVJ6Q3VSaEhIVkFGcU1NSHdrOXppY2o1SWxQSlh4dStPMzdK?=
 =?utf-8?B?WHhvUVAwUEkrWDZyTzdZSWsvRDBEa1BFMW5qMk51Nklya3RsenNyV2VTSWRN?=
 =?utf-8?B?QzV0VjlFNXZoLzlHSzd1RG1YbHU5REpjalFhN0tRdUUvcmZKU3J4SkF0aGdK?=
 =?utf-8?B?dTZaam9YRGJYRUVBdThlc3ZSM2U5dEZFTGQ4ZWJFRm9lQVZHNHQ2WGlhZ2k4?=
 =?utf-8?B?bnZXZHM2WFh5QitSYU4wOHNZd0hEa3h4RXR3MU5wZ094NFFsUjZqUEJCdnZz?=
 =?utf-8?B?bTlDS1lIQmpNL3JURC9vaWk4bTBjSkdFbEhOUjJ2TCtMRjg2TDM0bVhLa00z?=
 =?utf-8?B?UGdZTk14RS8rMWMzZTI1N2pCSFpIMzVlZWZBL3JwYm9OVDg0eVBqVnFPaTc0?=
 =?utf-8?B?OXpUY0NuMWFFcEI5a2VjTldsNlk1NUpkdDgzMTduNW00eWgxSGpQUVVBQjRT?=
 =?utf-8?B?VjFxZVVlWU9RRCtHL1NPdUE3VG1WK3RqV2s5OE16VGg3akZ0a2V6NmFkS0J6?=
 =?utf-8?B?dDhobUpSTFc2T3BRblVBRTJkWkt4TUdBRlNCYTVDSlVjb21yZVhBY3VKQlFJ?=
 =?utf-8?B?NFFBK0pPR1FrcXY3RVEySnpiVGZtMm9WQkFGR0lDT0tyOU1FQytxQ0pxYll4?=
 =?utf-8?B?czFCamFOazdCTjBMcmwyNDBXVkN0eE1JcWVXTjRPWEFvM0o1OTl5RFBmTEU1?=
 =?utf-8?B?ZDJXcTF3VnJYRzVPS1lMSGQ5NTVkbEdVbVErYUF4QWlQMFZ3S05vcE92MjVN?=
 =?utf-8?Q?R/kEXRC0FbyBzU+TUpVpUytU1UN2zuwF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OThieGlMRkkzaGZRak1JNGthNVhZd21WL0VGQm1aNmNkbDJjck14dGlEY1Nz?=
 =?utf-8?B?Ym11WUtYeUkvZ0FVdWlqaTMyM3Awa0lSSVNWQ3Z5YnlCVkxRSFEydE9yK1U5?=
 =?utf-8?B?MVFlSng5KzQvWUJqRERBVFE4bXhkU0J4L1grREw5TnRiK2ZVYW5rUnE2c2hG?=
 =?utf-8?B?VXVzT0xaMUxUN1ZTaHY3WC8zNWppQVBSWE94dWhFTUxZL1B6YUlPU1k3eStL?=
 =?utf-8?B?c0RIeE11aGlWMngxTDEvTURsWWV1UXl3RkYrMWNRZ2c0aWp3Y2ZyUmZzcjlK?=
 =?utf-8?B?RlNRbFU2ZjZMYUQ3MmRJdmRPbWk0dm9JMTloOWNtZy8xaUNmK3hwWVlXUmhS?=
 =?utf-8?B?MVVZcENOZnFZZFZsWXc4M2JOTnYwMWV6QjR6TXoyUUpkZkR4ekpHaWZ0ZmU2?=
 =?utf-8?B?aVRjRGxBM1cxZFlXdndHa2ZQZDFQdjNkZGFxWjBmYXEzYVdLdEx5NDhnRW5q?=
 =?utf-8?B?NVdOMHU2eS9nSXBURFcyWkFkdGRRbHU5blhIZHZnWWo1YXdLMFc4OHU0M2VZ?=
 =?utf-8?B?WDNwNVgrRkNLS1M1dTlHUGp2YVJjeC9FRjBPWlRQbWorbmtJQktKSGdCUFlp?=
 =?utf-8?B?ckJFbE5qNWx3R2w4dW9DN0tFSGh3aWtqamRzVkxkUzltSUtnVWo3cnNhNEYr?=
 =?utf-8?B?WHpmbEdqQmxhZHl3OFVOR3ZuZTlQNU95c3Q3b0FuZkJ6VThOQ1pBVFUrVDE0?=
 =?utf-8?B?dG1UNS92YU9XWTk3ZGhEM2JSczZpVGViV0czMU5TbWxvUGUyTWFmcHV5UWNZ?=
 =?utf-8?B?T0ppWjliVVNZa1pCYzZLK1BQNk11T21nUUVTQUVlL3RWaEY0NHhMbFNJeXZo?=
 =?utf-8?B?bTVMZWd3U3RUaUdIYkZZRXZxd291Rm1NM3hRcXA3U0t6eTNzTFprNWtjc2tt?=
 =?utf-8?B?Nm1MSGhTU05tVDBuOEtOSHJpT3hTbksyb1ZtSURBOEJjeFF3bjAxd1hJSTMr?=
 =?utf-8?B?NjRjMFQ0U2ZKK1dWYkRiYnFvcHMwSldyeHZMUE9qNXpVNXZRMExqVWZxcXB3?=
 =?utf-8?B?akdFbDJoTUxqMDNOMWFTRXQwOE5hUUtIeWJibmgyNGQ4cXI2MHJsNGNFeWZ0?=
 =?utf-8?B?YTh5VU1WY2FMU2FuWHBNV3lhZzM2ZHV3Slc3ODV1V3dLTEJ2aTBTVEJEcFdW?=
 =?utf-8?B?T3VGUXptU0dSbzNCemJ2V3QvdHJmUDFCMXlkYjNLZzhWYmdCbk5yWWhNQUtz?=
 =?utf-8?B?akpnOHhXNmtZeGRlb1owNUJJaVIzdWdkemRRY1JjNEp0cXlxV0ZOeFlQNldC?=
 =?utf-8?B?b1dyV0N4QW0zL2J6dU16N3ZvanJaVkI4eGRHUjJIOFZLRmw5dVR0aS9kdmtH?=
 =?utf-8?B?V0lWWVlTYzVwL0NDSHMrZDRFS3hMYjZIMGJmUFJyVlpjbXJFdTUwREJQelh6?=
 =?utf-8?B?ODNwYXhHSmZiTmU2NE5vbTBPK2xpRGdJTlpGaFgxZnhQRVh0K1pFV05OVlZq?=
 =?utf-8?B?ZFpUZjlTSmZwRHc1OHd3RTlPTnEvRFliOWhpZERvc2tVWmoxSWd2OUt0UDZD?=
 =?utf-8?B?dXRGL3NWeHJKcWhiMXVWa0diSGxsUWw5VFBVV1JiMkd1WUhJUmovdS9kV0Qw?=
 =?utf-8?B?QWExTVJqUng3KzRIbHZDUEZzY3c0NWJRM2laazNZRkZCc3N2YWExT1JMVC9k?=
 =?utf-8?B?THE2L051YWg1MHBlRmIycEtmUDZhMkhQaFJncUZUZjFJOWNZZ2ErOWlMK1FD?=
 =?utf-8?B?NHFGU2JXSFJ5TWllWDdTMEUrMFFVMnRLZHBIaER0anQ1Y0hlL3RUOEdYTTFl?=
 =?utf-8?B?b3JtT1VXQlVMbTdOSExPalFXb0RCOVFyODRYRE1pVGcwRUgvSmFkSUNTdkJs?=
 =?utf-8?B?MEh6ck5GbTJva1pqM1EzRk1GakFGb1NheGk3K09EZlkwdFIya3hZQ2g1ZURJ?=
 =?utf-8?B?UHdJcUFUaFBtR2tQKzlpMm1NNlRaUDRGamdpNTlPZ0wrRXRqR2lIQ3BDTHJP?=
 =?utf-8?B?WVBlNzVVM0x2VEJoWXA2QjBnYksrVkFaZFVFNGRoalVGcHVuOS9KNEE1b1JW?=
 =?utf-8?B?Y3NTQXdLUW1CWUhwWUxucU5lR3FBUmdjN1d4am42NEVENTlXV3R4OG5zVitN?=
 =?utf-8?B?L0NWVzNKUmUvWWQvY25uTU91QTNJMHdSNW9TcVhrRi9FSk95SjZaMUp1alo3?=
 =?utf-8?Q?2isiPpl3C1moISuUwTJhJnpL3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 195416fa-e20f-4377-c18c-08dd313bd8ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 05:58:46.4288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qEx/3HTAlL+sz6GupWq96NlY48FsPLOK6wvqbSMAMWU9FxtC0OG+kEvrdwYM5aD4/YM9v/mMCder8kJ/wbeKfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7537
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEphbnVhcnkgMTAsIDIw
MjUgMToxNiBBTQ0KPiBUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiBDYzogZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnOyBLYW5kcGFsLCBTdXJhaiA8
c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+Ow0KPiBTaGFua2FyLCBVbWEgPHVtYS5zaGFua2FyQGlu
dGVsLmNvbT47ICJJbXBvcnRlZCBmcm9tIGYyMDI0MTIxOC1kcHN0LQ0KPiB2Ny0wLTgxYmZlN2Qw
OGMyZCJAaW50ZWwuY29tOyAyMDI0MDcwNTA5MTMzMy4zMjgzMjItMS0NCj4gbW9oYW1tZWQudGhh
c2xlZW1AaW50ZWwuY29tOyBNdXJ0aHksIEFydW4gUg0KPiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5j
b20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2NyAxNC8xNF0gZHJtL2k5MTUvaGlzdG9ncmFtOiBFbmFi
bGUgcGlwZSBkaXRoZXJpbmcNCj4gDQo+IEVuYWJsZSBwaXBlIGRpdGhlcmluZyB3aGlsZSBlbmFi
bGluZyBoaXN0b2dyYW0gdG8gb3ZlcmNvbWUgc29tZSBhdHJpZmFjdHMNCj4gc2VlbiBvbiB0aGUg
c2NyZWVuLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRo
eUBpbnRlbC5jb20+DQoNCkxHVE0sDQpSZXZpZXdlZC1ieTogU3VyYWogS2FuZHBhbCA8c3VyYWou
a2FuZHBhbEBpbnRlbC5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2hpc3RvZ3JhbS5jIHwgMTEgKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxMSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9oaXN0b2dyYW0uYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfaGlzdG9ncmFtLmMNCj4gaW5kZXgNCj4gZDAxNTM1MGI1N2VkNWM4ZTlhYWFi
NzEzMTExNTliZjUxZTE1ZTljNy4uN2QwYzVkMDcwNDJjNWViMGUzM2MNCj4gOTVlN2NhZGFjNWMw
ZDFmZGEzNzkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfaGlzdG9ncmFtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9oaXN0b2dyYW0uYw0KPiBAQCAtMjIsNiArMjIsMTMgQEANCj4gICNkZWZpbmUgSElTVE9HUkFN
X0JJTl9SRUFEX1JFVFJZX0NPVU5UIDUgICNkZWZpbmUNCj4gSUVUX1NBTVBMRV9GT1JNQVRfMV9J
TlRfOV9GUkFDVCAweDEwMDAwMDkNCj4gDQo+ICtzdGF0aWMgdm9pZCBpbnRlbF9oaXN0b2dyYW1f
ZW5hYmxlX2RpdGhlcmluZyhzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSwNCj4gKwkJCQkJ
ICAgICBlbnVtIHBpcGUgcGlwZSkNCj4gK3sNCj4gKwlpbnRlbF9kZV9ybXcoZGlzcGxheSwgUElQ
RV9NSVNDKHBpcGUpLCBQSVBFX01JU0NfRElUSEVSX0VOQUJMRSwNCj4gKwkJICAgICBQSVBFX01J
U0NfRElUSEVSX0VOQUJMRSk7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyB2b2lkIHNldF9iaW5faW5k
ZXhfMChzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSwgZW51bSBwaXBlIHBpcGUpICB7DQo+
ICAJaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpID49IDIwKQ0KPiBAQCAtMjAwLDYgKzIwNywxMCBA
QCBzdGF0aWMgaW50IGludGVsX2hpc3RvZ3JhbV9lbmFibGUoc3RydWN0IGludGVsX2NydGMNCj4g
KmludGVsX2NydGMsIHU4IG1vZGUpDQo+IA0KPiAgCWlmIChoaXN0b2dyYW0tPmVuYWJsZSkNCj4g
IAkJcmV0dXJuIDA7DQo+ICsNCj4gKwkvKiBQaXBlIERpdGhlcmluZyBzaG91bGQgYmUgZW5hYmxl
ZCB3aXRoIGhpc3RvZ3JhbSAqLw0KPiArCWludGVsX2hpc3RvZ3JhbV9lbmFibGVfZGl0aGVyaW5n
KGRpc3BsYXksIHBpcGUpOw0KPiArDQo+ICAJIC8qIGVuYWJsZSBoaXN0b2dyYW0sIGNsZWFyIERQ
U1RfQklOIHJlZyBhbmQgc2VsZWN0IFRDIGZ1bmN0aW9uICovDQo+ICAJaWYgKERJU1BMQVlfVkVS
KGRpc3BsYXkpID49IDIwKQ0KPiAgCQlpbnRlbF9kZV9ybXcoZGlzcGxheSwgRFBTVF9DVEwocGlw
ZSksDQo+IA0KPiAtLQ0KPiAyLjI1LjENCg0K
