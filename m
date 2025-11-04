Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19969C2F41F
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 05:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C6D10E236;
	Tue,  4 Nov 2025 04:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnQRr2R0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98CE10E22F;
 Tue,  4 Nov 2025 04:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762229335; x=1793765335;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/Z2tkvu/s3HbEbjmUSNp6+/GZ8SevvOfYUMrZew1Glo=;
 b=ZnQRr2R090j52xE2kNlNVODLzY1WBeB3j4YfjCTF+D19id7BVhl6wlPK
 u/WkkcYupkcWJ3haiErJ2JlsXv2FIoGy+L8OcWK9uNgdYQ/bp2296dDEi
 x54RQ/Z5njbuPhGmT3Og2GgLTymKkPhEBsYJ857PWtxNOfTJPZtX3bBK6
 LdDfQJ2NUlCA3zOLCsl63MVH8c/ccfUQoNURs9lrdpr+4a6Rn/flgJ00h
 Df5wRETi2qnI785fE2S2qh8fvaZFAk42J4JMX4BYKycfEhHcJYnFFPcYy
 3z9j226XN1SaK9jH54NcrUV1KbCrQ2U3o0IWqY9khzFUSKBQqy/KAo2+F g==;
X-CSE-ConnectionGUID: u9foEqhZTmS/5ZmVoKPqJA==
X-CSE-MsgGUID: 1tZ6MvOdRSSa2p3lt0bqFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75667318"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="75667318"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 20:08:54 -0800
X-CSE-ConnectionGUID: CgeyQGBGTXiZNb1oyXtDVg==
X-CSE-MsgGUID: dHpkP922R0yv1T+w3fpCaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="186908942"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 20:08:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 20:08:54 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 20:08:54 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 20:08:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsT5M0iLIFLtzxlTOaxxiZhDOXVLcFZqjZfYV1IFYJeViO/c/Zo6sPIEjJsRDCqO23PLwjjrdeM8sJ0rRqEY+syeeFSaCPhxXnFGOkmlLpaQDmoziYIuOT8ygBVGGrZMsl66uV/mydVsMvpCLsisiyCUd+C3z9FQ5xze3rAEO0CHFfjwcYWNzh2n/JvUWch0DrmQorrlLXO+D8d/aRElfWhRVmjjSK23DHSjkQ2Q2m2qaF8kYkANI5uly9/FWxa0Sabdd++GFUTFubU91uSBKwFdWMVWlPnxOwUeJ0P4lqV1karsb8BYx5XSu0lTxb4pOJ9CUFGCNtzTm5Ztrr6+MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Z2tkvu/s3HbEbjmUSNp6+/GZ8SevvOfYUMrZew1Glo=;
 b=ThS0tO6b+RHiybkeD94ByO1T0gQqWTsM/ojjXACqSb+RU2Fn/RWNRy88NqKM6muHYW2SVtIlTV3IT0iqU11wIvRIaJV2wmTbG67uoYDjnEzAsQiakJWI4tWeGcWPV1wJ5PjzCMFI2mz0mvppcN1ANg71KyWC62mbtZa3/h1yOCYGb60UK1DltTw7hfJnDGOG4sIlGGTLz9+/EaBbpU/AZoE2PFPR5PXu3Q2IRrKJcefdDl9J8Tp3pCbcxBxVe66BMnvpidjqWRE77RPZZafPVfNIcilOPIXlJcWtW+hvxCFKWfmnXqL/DSV69fRWpaDnPlt0ja9QIcDxej8ploafwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 04:08:51 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 04:08:50 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>, "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: RE: [PATCH v2 03/10] drm/i915/alpm: Enable debugfs for DP2.1
Thread-Topic: [PATCH v2 03/10] drm/i915/alpm: Enable debugfs for DP2.1
Thread-Index: AQHcTRJ9Qo1OkzDh/k2wdi8Il+8TMbTh5yHQ
Date: Tue, 4 Nov 2025 04:08:50 +0000
Message-ID: <DM3PPF208195D8D7A77194E437D5185CC83E3C4A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251103220957.1229608-1-animesh.manna@intel.com>
 <20251103220957.1229608-4-animesh.manna@intel.com>
In-Reply-To: <20251103220957.1229608-4-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SN7PR11MB8282:EE_
x-ms-office365-filtering-correlation-id: 8d2cbaee-e32c-42fb-8636-08de1b57dc76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cENHVlZiTkE2TVQzbWEvVUQ0c2s0UVQyV21JSW1BTkhiUy92SHphY3JsbFda?=
 =?utf-8?B?dERYYmJiMjBQZ0h4K05DaTBvM21ZM0VZamFaV0JHTVlRRlJzSENsZmFOd2dn?=
 =?utf-8?B?dW5VbDNZdHJlRnY4WGxyR0M2UXZ1aDUveWFuV3htcUZpUW5Ra0FRRHNELzIy?=
 =?utf-8?B?WURQYVRaYUYyVStER0ZOcXNsQzAvdm9FNUNWdDc1LzA1cVVpcm53VXdGYXh6?=
 =?utf-8?B?cnlocjIvM283N2FveWo0aUQzOHdSTVpJOHVUaUNEcDduaFhFV2srSHIvVXdE?=
 =?utf-8?B?b0RLZUI5S3JFNnUzcjZlbit2dndyM1pnekVOeFhtZWpEK1pkWkh6blpnRFdC?=
 =?utf-8?B?Uy9QTXlEL1V5UzdLWXRRTjJqc251d1dNbGRoS09TbXhncW9OU0VSZEh0S2Mz?=
 =?utf-8?B?WnIvMXpuL1ZPbDNyN2RQbWhKK2lhb2tOWStzcUs5S2FjZWNuYktoaUpXTlh4?=
 =?utf-8?B?a1lOVXFRKzlxcHlNektPbGlsVnlrbDB6Q05ZV3NZbXlvdTFPRHlhaHljTTQz?=
 =?utf-8?B?TmVxS0dNbmF0TUdqR0tFT0hSWFF3OUJMTzIrYWI0VGRRSXNFa09BcTdHdlBY?=
 =?utf-8?B?OUo2K1V6VWprdkRHNk5sUWxFQkhUMlovK3dSeWEvWTVaWlUxOGJiYXpsTFlI?=
 =?utf-8?B?dlNWclR1dUk5ZGZURmwwMVZtK1F0UURqTGI0R2JDUUxncDdDN3JGdmJKNTUw?=
 =?utf-8?B?VmVRQk15Qk43YWhVZ05seXNpVWRLajB6a0tTWUQ4WGMzRnd6d1lWVDRvcEk1?=
 =?utf-8?B?R3N6VXZmcHNzd3ZCa0k2emJkbnFMVGE2R3pkYlJSQVlMT1dpaFhBZDQ2cFVu?=
 =?utf-8?B?dkFid0tYck5XNUYwbEwrNmZsZzY5ODNTdWZubmpyU0M1QTB5bjB0VVo0ckNP?=
 =?utf-8?B?MUI2bmkxVm02OU5oNSt0dGU5a3c4SlBnTmRaeDIzK3FTb01wblZISDI2SjRH?=
 =?utf-8?B?SEs5RCtYd2cwMThLb3NRR0E3VFJGRWVPWVZpeGN4NjdaRGl5UThhM2NxSG1l?=
 =?utf-8?B?ei92aVR2T0lnMXI5Qldad29rS21jdFdzMGwvYUFkZnEzTHhmb0x6Yld6bUFS?=
 =?utf-8?B?Zk1FTy9rL1hDMThnNTVBUmVNTU1yTnFReU91V1pHR3p1M1JtNWozaUtXTjcz?=
 =?utf-8?B?Q0lQbDNvN052d0FvNjB0VUEyeDRETWdYcnViaW04QVJ1Q09pemtvSjA5TGFD?=
 =?utf-8?B?clZXemtCRm51ZWlLNjh2dGcrZm81MWVOQ081T29Vd1NudTI1c05VUGpjQmtB?=
 =?utf-8?B?ZjR0ODBHVkFicXVvRUFHNVEwVkJLV1F6eEtxNHhOR1ZsRG5HTEVROGtPVnBZ?=
 =?utf-8?B?WC9UWEczYkJZQTd4cy9xdWY0cTdyN2tCWmUzVUJSUG1EcWZPYmFNSFptaVRM?=
 =?utf-8?B?R1BlZDEySHJRbFhGZnYrU0xSV2taZHIwQzFPcEc1T0xvOGJ6TTU2d1h5N3Zw?=
 =?utf-8?B?N2VoZ2dYMUxiL2dkcUFMclQ3T0RzTGdiSjJYeGVLREtmQUFram9lRmNGcTFQ?=
 =?utf-8?B?UklDdW1yTENLYVo0R3kyZE10NTBlVlNwcjF4aEtORjdKTjh0ZU5BZFg2Vkla?=
 =?utf-8?B?cGJ5TENyTStKRTZ3VVZRcGNtMys1Mk9sT3ZpZTRCdFZLRE5KMlZMc2txWW14?=
 =?utf-8?B?UnhEeDRFQVpLUEpOUncxWDFSRTVCZHJBZXNhL2RFeG51QWhieUpZMG84V0lU?=
 =?utf-8?B?TDh5ejlMblZDaitDNFF3NXpsM29nb09UQ29HaG4wT2RmOVI1Z0d5eVF0Rmd6?=
 =?utf-8?B?OGhRUi84YXlManVvVHQzanBjVmxqMWlkQkhFQXJad2thdWpiemFIZk9sYjBl?=
 =?utf-8?B?T1Noa1NuRlhWOHVWVDg2cnc4ZmlCZ1UxZlZGaWs1L3VSb0pTNVkzTHMrWmdK?=
 =?utf-8?B?UVozZy9ob2FkY0FITFREUE9vWTVvUFJudmtLWm1tU3phVW9FOGdxVjVNZDNh?=
 =?utf-8?B?NjU1S2RJUEs5MlBEdmNmMGpnTDlhTkZlRmtxYmpLUWNDSjI4NlBqb3ZDM1V6?=
 =?utf-8?B?dmZxRmZMWmFhcHYyemVHa3VhaG9lSHJRV29zSDdPRjdhNHdpSndTZ0tZb2ZO?=
 =?utf-8?Q?bG3ebO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2JQMHQ5d0pHc2NJYWc0T3doY0ZNYUFxQlBySkhYblE5YzRJZ0tuamw3L1Jr?=
 =?utf-8?B?VGFWRm8zeUxDbDQzZ0QxdXEzN29RZHgwUTJZWDJNUHFrOEFzVUJwdndJMlk1?=
 =?utf-8?B?VFdVSnZpNDBGMi8vSUhIbloyTk9sOVM5SmxQY2lsVEMyMjM3L2dTdmowaU90?=
 =?utf-8?B?U0kvTmRsbC81bmcrVklOeGN0VUFaSmFBSTc1WnlKR2tXZmhNWUplYWZyMFIw?=
 =?utf-8?B?SnROSTBZTDlKR2tDR3p2cS9pdHkxcVhYS0hReitsdk1FTGxWZjkycDY0MDM2?=
 =?utf-8?B?OU1hdHNXQlVBSWpXT3dGSVdweVR1ZXA3cVppallRLzNNWjZnY3E3R1hMTmtI?=
 =?utf-8?B?aFdvWHRIbVFXclFaWVRGS1dBeVFzVFFodlloYkYrZTNYUmdKSG50MDZvMHRH?=
 =?utf-8?B?eTJtOFBIRWYzSkRXaGJSYlRSak8wTjY0U2FGQUprNXNBVEc3cGJ4SytmV3dw?=
 =?utf-8?B?OUtWWlFWOVhKUUdad0xZL2RoVmsya0gwQXdpUjNadTViazlFVDYzM0F0c05L?=
 =?utf-8?B?V0lrTEcrQTdvN1lZcmhYdVE5Y2x5dCsxbkI5UEZiaTZLTzhPci9vem85dUk3?=
 =?utf-8?B?Nk1lWnFDV1ZQWWsrSUJKeGNQQm5ybnV2R2t0dks0VURQZkRodnBTQUZOdis0?=
 =?utf-8?B?ejBGWjZ6a3RjSFpJZlhmQ3NJcTEzYUFBVXpkWDFJQ3JreWI1OVBaZFNxeisy?=
 =?utf-8?B?TFdCaTNqWjRYTEdYS1VpTjN5NTlvM2EwRU9iWTBiNW1mRndsZk1tLzhTSkJh?=
 =?utf-8?B?MXN5UGd2c3AwQ2RyN1RkUHBpRjZGMnlXTkV6Z0FubTRmc1J0N0R5a01BOWxK?=
 =?utf-8?B?SlB0cWpPMjUyWGxvYmdxRFpPSHdsbEVST2FCUUd4YTd6NEk4VzJFQVEzODVR?=
 =?utf-8?B?a1BsTzJoWldVbGlPRVNJOFRwVy9XOTl5Vm9RNHZqanY5enF5b3ZseWJ1UXl3?=
 =?utf-8?B?MThraENtdDRDNXVTNGMvcnJFNXVvYlNXUEFsdGRSRUp4TC9OUjk4V1VCeHJW?=
 =?utf-8?B?ZDd4T1o2RUQxUFcrRFFpSWNzR2VZZ01vbFJFbE5JVk1TZmNLNURuTnlqQUxp?=
 =?utf-8?B?WjZiMnFTdVV4a2tFQUJDN3JTS3pmRHNhNk1tRkloR1BFWlllbU5QeWcybmRV?=
 =?utf-8?B?TFZ2cTlnN0VMYXRBZGJ0bDVLcGtWUWdOYnN1cjlLRkNPRGFMN3NrdVFsSU5r?=
 =?utf-8?B?bWllRThlSHYrN2VuOWRUZ1k1OFFHRHFrYUhXTlNkeHd5NGJFdzFJSklLbWJn?=
 =?utf-8?B?ZEJ4alRnd1pIL2lqZU5iUzJPQ1R0MzZSczFUenNzdVo5THJwb1JaRFdwK3Vt?=
 =?utf-8?B?K1ErZGkxK3pxTm02aUhrWGp6bHErOGk5dUlKSncwNVorTytUOEtUeXZieWYy?=
 =?utf-8?B?Y2owM2ZWc3ZUNll5V1I5anE5REYzdE9zb29STXRXMlJVWDl1R0ljS2wzM05u?=
 =?utf-8?B?M2FuU0JsTEtHWUdsNEFGMDNiNmtWcFpFUFQyMXkrQmFoMCszUmJ6OFhYVVhz?=
 =?utf-8?B?ckIxYzBNTzRqQnlaa0FvRmJPRG1WYkNPTnpLZ250NkVqR05LQWoxSGcwRFc3?=
 =?utf-8?B?bE5iMlR6bHVpWTdTVVhLTFVVK3R6S3JiTkpDa2Ftc0MyY3NBUG02dURYbEk3?=
 =?utf-8?B?dEU4L2kxVXNmZGM1ZVpyeHJXNnhuN0c3MElIaFlzQzVCWTMwc2hTbVJyNHFK?=
 =?utf-8?B?eVV2bUVuM2RodmZIeGVQT3VLSDlodnIySDlQTmRreTBMQS9DZURpZ3BOWWFo?=
 =?utf-8?B?aHRvWTRZUHgyWlpweW1JamNHdnVOOGZIUlB4dWNDc29RQ0w5Smxjd0h5d0lO?=
 =?utf-8?B?emF3dm9lb3Eramk2MXpTT29wSkdRcEZjWkswRHlUMjV1TzZSYWJYREdNTjh3?=
 =?utf-8?B?eENSekU5MG9pY1NGZnJrSTRaVERaZklKVmNkQjUwalJrbVY0SmMrTkZBRlJV?=
 =?utf-8?B?UHR2UTFabmpvMWFBUU92dlE0SXdTNU05SmN1Q2FjUVpwT1hMcmZlL2NpekhJ?=
 =?utf-8?B?MDhkcmpYSC9NcE5FSGVJMTAxOU5hT2lJV3pwODJvTFZqZktFczZ4aW05dnRw?=
 =?utf-8?B?RVorek1wLzdaL1RTOHRUN0I1K2RWRmg5SnduN0RJWnVHYzNzb0w5bE96VzBO?=
 =?utf-8?Q?31Dc4JG0KtABsj3/ijI8nYxTK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2cbaee-e32c-42fb-8636-08de1b57dc76
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 04:08:50.7491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l20i5tS7yMF2OPGUD7RQo1/0js1vjJLPjUKKwykpeJXRpJ9+cpLfBwcymbdKTg3bsWd4F09IWgTgPi0HOuwB1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8282
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMDMvMTBdIGRybS9pOTE1L2FscG06IEVuYWJsZSBkZWJ1Z2Zz
IGZvciBEUDIuMQ0KPiANCj4gRW5hYmxlIEFsUE0gZGVidWcgaW5mbyB0aHJvdWdoIGxvYmYgZGVi
dWcgaW5mby4NCj4gDQo+IENjOiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVs
LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5pbWVzaC5tYW5uYUBpbnRl
bC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBt
LmMgfCAxMCArKysrKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfYWxwbS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9hbHBtLmMNCj4gaW5kZXggNjM5OTQxZTMzMmYzLi43Nzk3MThkMGM4ZGQgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+IEBAIC01NDEsOSArNTQx
LDE1IEBAIHZvaWQgaW50ZWxfYWxwbV9sb2JmX2RlYnVnZnNfYWRkKHN0cnVjdA0KPiBpbnRlbF9j
b25uZWN0b3IgKmNvbm5lY3RvcikNCj4gIAlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9
IHRvX2ludGVsX2Rpc3BsYXkoY29ubmVjdG9yKTsNCj4gIAlzdHJ1Y3QgZGVudHJ5ICpyb290ID0g
Y29ubmVjdG9yLT5iYXNlLmRlYnVnZnNfZW50cnk7DQo+IA0KPiAtCWlmIChESVNQTEFZX1ZFUihk
aXNwbGF5KSA8IDIwIHx8DQo+IC0JICAgIGNvbm5lY3Rvci0+YmFzZS5jb25uZWN0b3JfdHlwZSAh
PQ0KPiBEUk1fTU9ERV9DT05ORUNUT1JfZURQKQ0KPiArCWlmIChjb25uZWN0b3ItPmJhc2UuY29u
bmVjdG9yX3R5cGUgPT0NCj4gRFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0KSB7DQo+ICsJ
CWlmIChESVNQTEFZX1ZFUihkaXNwbGF5KSA8IDM1KQ0KPiArCQkJcmV0dXJuOw0KPiArCX0gZWxz
ZSBpZiAoY29ubmVjdG9yLT5iYXNlLmNvbm5lY3Rvcl90eXBlID09DQo+IERSTV9NT0RFX0NPTk5F
Q1RPUl9lRFApIHsNCj4gKwkJaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpIDwgMjApDQo+ICsJCQly
ZXR1cm47DQo+ICsJfSBlbHNlIHsNCj4gIAkJcmV0dXJuOw0KPiArCX0NCg0KSG93IGFib3V0IA0K
aWYgKCEoKGNvbm5lY3Rvci0+YmFzZS5jb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNU
T1JfRGlzcGxheVBvcnQgJiYgRElTUExBWV9WRVIoZGlzcGxheSkgPj0gMzUpIHx8DQogICAgICAo
Y29ubmVjdG9yLT5iYXNlLmNvbm5lY3Rvcl90eXBlID09IERSTV9NT0RFX0NPTk5FQ1RPUl9lRFAg
JiYgRElTUExBWV9WRVIoZGlzcGxheSkgPj0gMjApKSkNCglyZXR1cm47DQpSZWdhcmRzLA0KU3Vy
YWogS2FuZHBhbA0KDQo+IA0KPiAgCWRlYnVnZnNfY3JlYXRlX2ZpbGUoImk5MTVfZWRwX2xvYmZf
ZGVidWciLCAwNjQ0LCByb290LA0KPiAgCQkJICAgIGNvbm5lY3RvciwgJmk5MTVfZWRwX2xvYmZf
ZGVidWdfZm9wcyk7DQo+IC0tDQo+IDIuMjkuMA0KDQo=
