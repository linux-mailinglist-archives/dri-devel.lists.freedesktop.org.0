Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 460E549DE10
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 10:33:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9ED10EFCD;
	Thu, 27 Jan 2022 09:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2F510EFC7;
 Thu, 27 Jan 2022 09:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643276022; x=1674812022;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NQnA6jqvGVWiEmeUAZWSz6z9uNDeQMM+Ww3mo1Vqlo8=;
 b=h5PCGoo04U9AD1pVxmeAFDNF98fhgJBKQv7yfFWq/gaX1eWc7+Rzru2W
 6ms39hZ2nWSwZdWlMwYQSzkC0pfXvPeKvuo9Ie3T2YNjXqHqdK5UGbb+u
 pZiu3ihBnqnzBjOqyvImBHf2RDGnXiC9SuTCNe+FHDi1dOxro1fUdEcbb
 3IPdtzMeGIMXL8mYOWOQu3GwtWacqc+P7P1/gwJ4uwZn4CJbQAJmrbjn2
 Zx5aNT2+0DDxL15dX072e2EoDAM0oX4/Yk1whB4WHFUucD7Y4wVnJeyd6
 QBafqwGdW7gwTtYW0IVQ6rRJ68jhe5JbWxnwwRdO30Yc54Lf1yWHfV5e9 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="244400109"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="244400109"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 01:33:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; d="scan'208";a="581413003"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 27 Jan 2022 01:33:41 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 27 Jan 2022 01:33:41 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 27 Jan 2022 01:33:41 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 27 Jan 2022 01:33:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2UWXR2iezExqHoJRoN3GnLDi3S9OJlUvKfDpgW/4xAqCKymaW4OOrwTUyadKEL8sSR3goQ7f3EShB+1pr+gbGlqLjnnLKZCD2BiJddxRfRym3zIXAPP1Rv2HE12WY6Yc1XC+SGTwqJ59fi1sJjoHJ9JKrFaexAwRL40G8WQP9YrMS8NMg0C0iBQBStdw9wtYpKKayP9h0X4ygBp4Tgc5vwiH8DXcZ3xB1brS3UerqYD/etWn9GeZ6qGGE+Xz0E0nlzGiYESSnzmKW4paPejQVcQFS6mcpkwRXF5qqMrJzJT17ZYFAF1GPY3Cf/C0BQgncZCexLV0M8q5Ums2++SDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQnA6jqvGVWiEmeUAZWSz6z9uNDeQMM+Ww3mo1Vqlo8=;
 b=N38Bw99c0xTptNMoC6j/omFX1HsryDiJ3xQsGLuwo5KB1yMRbYmMt/IVhqAZCV9c+pDUDi/F8P+1T4asV7uPP5zcdBvGoMZhK7SoYdMKD/JYDMohfi8aDK1IjK9h6O+WM9JBf3ejZ3I0rZ8ck1czKAgSMeKLd93k5pWzwwvw8Ek4yKyovSaqHOKGgNPbUHtoOHH/y6rmC/kEsSJmAW0okTdSmwcwgy5mkzDyNEMxJlT/9b6H/sdo31rtlJIZ0h6u1SnVyyjCL2R0yWJClsuz+yWn9V/Yb/xjGy+GJ0H+qaPCYYOYVHHtI/y4IEvL+4QqfXyj3YQ8AswjHKrQRROyLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CY4PR11MB1352.namprd11.prod.outlook.com (2603:10b6:903:2a::23)
 by CH0PR11MB5563.namprd11.prod.outlook.com (2603:10b6:610:d6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Thu, 27 Jan
 2022 09:33:38 +0000
Received: from CY4PR11MB1352.namprd11.prod.outlook.com
 ([fe80::fdaf:f5ea:bd3b:21ce]) by CY4PR11MB1352.namprd11.prod.outlook.com
 ([fe80::fdaf:f5ea:bd3b:21ce%4]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 09:33:38 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/3] drm: add writeback pointers to drm_connector
Thread-Topic: [PATCH 1/3] drm: add writeback pointers to drm_connector
Thread-Index: AQHYBtNdIb21OQQo5U+3y7l+Bb32AKxt2tOAgAjNZLA=
Date: Thu, 27 Jan 2022 09:33:38 +0000
Message-ID: <CY4PR11MB1352DAB3BD614093B5154C10E3219@CY4PR11MB1352.namprd11.prod.outlook.com>
References: <20220111101801.28310-1-suraj.kandpal@intel.com>
 <c797223b-47cb-3fcd-0a1a-b12fd2c2c0da@quicinc.com>
In-Reply-To: <c797223b-47cb-3fcd-0a1a-b12fd2c2c0da@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c6a087f-54c0-450a-b147-08d9e1781964
x-ms-traffictypediagnostic: CH0PR11MB5563:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CH0PR11MB55633A9B1340A7BCBE34FCCEE3219@CH0PR11MB5563.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vtT1sURQWP5bH/x9Q2pMHpociNitVDkhAVfh853K5f5pk0DE6XP72BUhoW4gCZOueOfHZwlexoWCZz90gIyMcLOoQeHVk2lMgq11rXTspEUrlgDcX97YcLVVa4RSfo+5LGlk6R2OvbTx6kcCMenTvE1WluyCN6M/06RZOuh/sNOSILDtIrwlXDc3Bohq1qEDczGXvH82VwmC/1GyqqO9xW9i2yzt1V/9SdTxwMeTh8tjdYrXyrK4hBjI8iLL6jdEKRPIkR8GFvVjJZzbgG5fZu8I9IiAMGFDwUS1zkjnk7p8f0rzYBYaIBO3ucPwTRUOLwnyAq1CVUBp+XLQ5CYDePntVcPoEEcGZSTy9U/EjeCG5r+nnZ7L1X3scA8BHs2C9QNQEEu0S+OxJZz/fvKkTW0RiwkYEickj9wlmzv9kN43dAtN9gfwCvuL2OL6OaImWUsn6U5g3WZpQgmfVRZ+ohy5OI0QbmMgLqkmIcCRrgU8/Szg+3PQc+Pvj9028p3MZjULHGLhhDZd7r953NtXQcwVD8EFfKjhVItoSpZvWasuLSjIkfLR/mNACoZNeaUPdHvGYoCRLrQc/lXUdBr0bdw/A09JyyAqJmX0WSpcYfYt/Ff0sE9B4KPTJE9ZeQs/ILJtMQQUtJZBUYhpsj38yT2fTgYhyTsunovpBNbcC9vZ1f+7UUoxgeG3UHR3XrqaS4s1eM4ByKOsO5HSVUBHxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB1352.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(110136005)(2906002)(9686003)(122000001)(55016003)(66446008)(26005)(33656002)(186003)(83380400001)(76116006)(82960400001)(66476007)(66556008)(64756008)(38100700002)(966005)(8936002)(86362001)(508600001)(71200400001)(8676002)(52536014)(66946007)(38070700005)(7696005)(4326008)(54906003)(6506007)(316002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzluTTlzTFQzMFM3NURNMTZpSjBKbmtvUklyVWJZQmU5SGlycnFLKzZKeURS?=
 =?utf-8?B?dkdoYUd5aUQxV3FrR2RteEZuL0xjRFdEZ3JoR21NSHJSQmVYSHNaeUJCY3Fr?=
 =?utf-8?B?bk54SWZhaER5Z0s4b0tsNnhqazdQeDhFNWVaK042U3RFSWU0UlpEeXNDRWQ0?=
 =?utf-8?B?TDFTbXN0MnZRYVJHQTVuRUxObGRTSVJYK2U3S2ZMT1M0VmlYRTByZUZVOW5F?=
 =?utf-8?B?S095OEtBYVBIa3Nha1RCODU3a1FRUEt4N3ZkdTZuQlVqVmVGZ0Z2bHV1a2hx?=
 =?utf-8?B?TUdRRzJaTWtOYmgwM1JpaW5jNCt2MTBacFVoa2hvSUJJb2FrRmNOY0VuTjlU?=
 =?utf-8?B?MlJ6MmI1aGRRVm1OQi81aVpQWXpTVlhETVNRcFhDT1pEZU5taVprVGZhS1NG?=
 =?utf-8?B?dmlNU3dsUlFrK3hJZjlqbjQvNTBOSzg5SmF3dXZ5cFZqenQxcDJzQXE4QzE3?=
 =?utf-8?B?Y1RXMEp5S0NLUS9mT3NQeVNQSDQ2U0dCbWYvLy9KbTNRR2ZTc1E5dDRhVUhI?=
 =?utf-8?B?YzdJMDY5SGpDTjZBakdzY3BObytFR25rMkRkemNwZHM5QWI4N3JpWVljOTgx?=
 =?utf-8?B?Umw3SFZsMlA0Ry9iSm93RTdxb3ZvU0RhSG04MUJJVkJZTVRsZVVHSHV6YWJy?=
 =?utf-8?B?SmNKMENCdEh0WjFJZW9la3VRTXpLVlo4bW5YcTBSZi9qUW80ZkJFS2MzT2w4?=
 =?utf-8?B?ZnN5RW5kNDNBSFdYMy9vQlhGRnhMTTZDUTAzenlCWVNqN0dJTEJxY0UwV29V?=
 =?utf-8?B?OExlV1lwdGxBR1hNUEt6ZGlIbGhXajVBb29CQkprcGRhcnIvQ045ZTR5NTQ1?=
 =?utf-8?B?NHdxR25qNVNiU0hFTEkxdjJxMktFZmh1MzdxNUoxdVVlZ0IwdTd1M2llcE1a?=
 =?utf-8?B?WkNnWmdmMXBXa1FJS3BBd3NEUXZ3aW5ZU0cyR2wrUWg0SjhOUldleERETjhW?=
 =?utf-8?B?ZjBWeUEyd25uc21LN0xEdUc0WjI0Z3kyQThEZmZYRVFDRHRJSkhuTTJvQlNH?=
 =?utf-8?B?SDZGZEhsbFVZT3VFa2o3Vm1ERlZUaGhuZmJuMWZhUElsM0RqbU1IS1pYVk5u?=
 =?utf-8?B?S1RRem1Wbk9PaUlqVmw3akNaUjNtOUVzdjZLbFNQNXpDZ0czZXNtaWMydFFk?=
 =?utf-8?B?cmtxbG9wVi81d3VKd2ROa0hML3p0d3pQWTZqcmE2eHRUOHpxUnVVa3dYMzJx?=
 =?utf-8?B?ZnNKYVkzRE1zSGhDczM5TXZxWHdQTjZjSlczZmh0WXhoWHhLYXBObFRtRkli?=
 =?utf-8?B?SGV0Zk1CeXZKclVFd2h1MFd4U3JvNVhaa0Y2SDZ6SklJcFh3bktxZzZNTld0?=
 =?utf-8?B?WWFVbjJXcXZ4YkdRNmhiWm1pWTRWNWRvTzc0RnY4T1h3UDhqZFVWS1NCalUx?=
 =?utf-8?B?S0NsR1J3RXpscXNOaEVHdmNnS2syOEk4c0t5OVZ3WXRqME1uY1YvRUE1Rmdl?=
 =?utf-8?B?N0p3Z0wwbUF3MlF1M0JtdmRUWVZmbXVMdlVoL2F5OHVMcTMxejhOMk9SeGU3?=
 =?utf-8?B?dWxRZTVRRldlNkxRaWZkcDRORlc5UDRHQWtaQWEzc0xlNFNRTWs4Um80MW1T?=
 =?utf-8?B?QnlkSE1pQ09pcHdtaVJMejUrM2JLK04vZ1VRTmVDSWlOazdHZHRyOXgvY0F3?=
 =?utf-8?B?Wk9EZ1R1bmR5eWNEQWliZnpMZ2Z0VTNCdkZuNXc2QUZ5b0tPUjExNTBMZ0dj?=
 =?utf-8?B?Z3pBRmxNYnRkZThSbGxsNmlpWE9qdkJMTTdOUjEvUlYvU2cxOFcwZUI4UDhL?=
 =?utf-8?B?ZFM5d3lCL1FYNXJPRkFQVjJQSUtSV3lMbXExVXJuRk9WTWg4b2RqeFgwR1hv?=
 =?utf-8?B?RHR3b3p4TjFIRnZNMGIvYzJkeTliZlFoZnFVdkFkWTlHcTBOMlI4aDFKQ1dr?=
 =?utf-8?B?VEhjekk2VTNlZkIxVlJmQUFHN0VYa0JXSkZHTW9OcVR3VSs2WWZjOGx6Qmlw?=
 =?utf-8?B?T2srbkc0Wk41MWJrUE5PUmh3bDVTamlsQlZWaDZyQmN2WVBXMllDdFFVN2Nx?=
 =?utf-8?B?OU9IekxWMzBVSHlCMTlTZ3Q5RVFPQ1A3Q2lTWGpoclQrd01HR0pZWk9WSXNW?=
 =?utf-8?B?cmhQUElDMjZSbElPWmczT3ozcUs3MmVOOTFMemtHdFNkWEp4MU5ESGdsV2lt?=
 =?utf-8?B?a2wySThMcm0xa3U1RjVTeGU5ZzlMdjZwR3FwNG5RaTh2RlFidXVCYnlYbmZ3?=
 =?utf-8?B?aWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1352.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6a087f-54c0-450a-b147-08d9e1781964
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2022 09:33:38.7052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IT8ABUjb+INHeEiX/C52++4Xtgln3sR723MApcoDC99PYj93+15m3OXfjD8f+dXKL1+IG4zf1B2QIHWUGEqZ3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5563
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "Kandpal@freedesktop.org" <Kandpal@freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiANCj4gKyBsYXVyZW50IG9uIHRoaXMNCj4gDQo+IEhpIFN1cmFqDQo+IEphbmkgcG9pbnRlZCBt
ZSB0byB0aGlzIHRocmVhZCBhcyBpIGhhZCBwb3N0ZWQgc29tZXRoaW5nIHNpbWlsYXIgaGVyZSA6
DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC80NzAyOTYvIGJ1dCBz
aW5jZSB0aGlzIHRocmVhZCB3YXMNCj4gcG9zdGVkIGVhcmxpZXIsIHdlIGNhbiBkaXNjdXNzIGZ1
cnRoZXIgaGVyZS4NCj4gDQo+IE92ZXJhbGwsIGl0cyBzaW1pbGFyIHRvIHdoYXQgSSBoYWQgcG9z
dGVkIGluIHRoZSBSRkMgYW5kIHlvdXIgY29tbWl0IHRleHQgYWxzbw0KPiBjb3ZlcnMgbXkgY29u
Y2VybnMgdG9vLg0KPiANCj4gT25lIHF1ZXN0aW9uIEkgaGF2ZSBhYm91dCB5b3VyIGNoYW5nZSBp
cyBzaW5jZSB5b3UgaGF2ZSBjaGFuZ2VkDQo+IHdiX2Nvbm5lY3Rvcjo6ZW5jb2RlciB0byBiZSBh
IHBvaW50ZXIsIGkgc2F3IHRoZSBvdGhlciBjaGFuZ2VzIGluIHRoZSBzZXJpZXMNCj4gYnV0IHRo
ZXkgZG8gbm90IGFsbG9jYXRlIGFuIGVuY29kZXIuIFdvdWxkIHRoaXMgbm90IGFmZmVjdCB0aGUg
b3RoZXIgZHJpdmVycw0KPiB3aGljaCBhcmUgYXNzdW1pbmcgdGhhdCB0aGUgZW5jb2RlciBpbiB3
Yl9jb25uZWN0b3IgaXMgc3RydWN0IGRybV9lbmNvZGVyDQo+IGVuY29kZXIgYW5kIG5vdCBzdHJ1
Y3QgZHJtX2VuY29kZXIqIGVuY29kZXIuDQo+IA0KPiBZb3VyIGNoYW5nZXMgZml4IHRoZSBjb21w
aWxhdGlvbiBpc3N1ZSBidXQgd291bGRudCB0aGlzIGNyYXNoIGFzIGVuY29kZXINCj4gd2FzbnQg
YWxsb2NhdGVkIGZvciBvdGhlciBkcml2ZXJzLg0KPiANCg0KSGkgQWJoaW5hdiwNClRoYXQgc2hv
dWxkbid0IGJlIGFuIGlzc3VlIGFzIG5vcm1hbGx5IGRyaXZlcnMgdGVuZCB0byBoYXZlIHRoZWly
IG93biBvdXRwdXQNCnN0cnVjdHVyZSB3aGljaCBoYXMgZHJtX2Nvbm5lY3RvciBhbmQgZHJtX2Vu
Y29kZXIgZW1iZWRkZWQgaW4gaXQgZGVwZW5kaW5nIA0Kb24gdGhlIGxldmVsIG9mIGJpbmRpbmcg
dGhleSBoYXZlIGRlY2lkZWQgdG8gZ2l2ZSB0aGUgY29ubmVjdG9yIGFuZCBlbmNvZGVyIGluDQp0
aGVpciByZXNwZWN0aXZlIG91dHB1dCBhbmQgdGhlIGFkZHJlc3NlcyBvZiB0aGVzZSBhcmUgcGFz
c2VkIHRvIHRoZSANCmRybV9jb25uZWN0b3IqIGFuZCBkcm1fZW5jb2RlciogaW4gZHJtX3dyaXRl
YmFja19jb25uZWN0b3Igc3RydWN0dXJlIA0Kd2hpY2ggdGhlbiBnZXRzIGluaXRpYWxpemVkIGlu
IGRybV93cml0ZWJhY2tfY29ubmVjdG9yX2luaXQoKS4NCg0KSW4gb3VyIGk5MTUgY29kZSB3ZSBo
YXZlIGludGVsX2Nvbm5lY3RvciBzdHJ1Y3R1cmUgd2l0aCBkcm1fY29ubmVjdG9yIGJhc2UgDQpm
aWVsZCBhbmQgaW50ZWxfd2Qgd2l0aCBhIGludGVsX2VuY29kZXIgYmFzZSB3aGljaCBpbiB0dXJu
IGhhcyBkcm1fZW5jb2Rlcg0KZmllbGQgYW5kIGJvdGggaW50ZWxfY29ubmVjdG9yIGFuZCBpbnRl
bF93ZCBhcmUgaW5pdGlhbGl6ZWQgbm90IHJlcXVpcmluZyBleHBsaWNpdA0KYWxsb2MgYW5kIGRl
YWxsb2MgZm9yIGRybV9lbmNvZGVyDQppbnRlbF93ZCA9IGt6YWxsb2Moc2l6ZW9mKCppbnRlbF93
ZCksIEdGUF9LRVJORUwpOw0KDQppbnRlbF9jb25uZWN0b3IgPSBpbnRlbF9jb25uZWN0b3JfYWxs
b2MoKTsNCndiX2Nvbm4gPSAmaW50ZWxfY29ubmVjdG9yLT53Yl9jb25uOw0Kd2JfY29ubi0+YmFz
ZSA9ICZpbnRlbF9jb25uZWN0b3ItPmJhc2U7DQp3Yl9jb25uLT5lbmNvZGVyID0gJmludGVsX3dk
LT5iYXNlLmJhc2U7DQoNClNpbWlsYXJ5IGZvciBrb21lZGEgZHJpdmVyIGhhcyANCnN0cnVjdCBr
b21lZGFfd2JfY29ubmVjdG9yIHsNCiAgICAgICAgc3RydWN0IGRybV9jb25uZWN0b3IgY29ubjsN
CiAgICAgICAgLyoqIEBiYXNlOiAmZHJtX3dyaXRlYmFja19jb25uZWN0b3IgKi8NCiAgICAgICAg
c3RydWN0IGRybV93cml0ZWJhY2tfY29ubmVjdG9yIGJhc2U7DQoNCiAgICAgICAgLyoqIEB3Yl9s
YXllcjogcmVwcmVzZW50cyBhc3NvY2lhdGVkIHdyaXRlYmFjayBwaXBlbGluZSBvZiBrb21lZGEg
Ki8NCiAgICAgICAgc3RydWN0IGtvbWVkYV9sYXllciAqd2JfbGF5ZXI7DQp9Ow0KDQpzdGF0aWMg
aW50IGtvbWVkYV93Yl9jb25uZWN0b3JfYWRkKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLA0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga29tZWRhX2NydGMgKmtj
cnRjKQ0Kew0KCXN0cnVjdCBrb21lZGFfd2JfY29ubmVjdG9yICprd2JfY29ubjsNCglzdHJ1Y3Qg
ZHJtX3dyaXRlYmFja19jb25uZWN0b3IgKndiX2Nvbm47DQoJDQoJa3diX2Nvbm4gPSBremFsbG9j
KHNpemVvZigqa3diX2Nvbm4pLCBHRlBfS0VSTkVMKTsNCg0KCXdiX2Nvbm4gPSAma3diX2Nvbm4t
PmJhc2U7DQogICAgICAgIAl3Yl9jb25uLT5iYXNlID0gJmt3Yl9jb25uLT5jb25uOw0KICAgICAg
DQphbmQgdGhleSBkbyBub3QgZGVwZW5kIG9uIHRoZSBlbmNvZGVyIGJpbmRpbmcgc28gY2hhbmdl
cyB3aWxsIHdvcmsgZm9yIHRoZW0NCkFsc28gaW4gdmttcyBkcml2ZXIgd2UgaGF2ZSB0aGUgDQpz
dHJ1Y3Qgdmttc19vdXRwdXQgew0KICAgICAgICBzdHJ1Y3QgZHJtX2NydGMgY3J0YzsNCiAgICAg
ICAgc3RydWN0IGRybV9lbmNvZGVyIGVuY29kZXI7DQogICAgICAgIHN0cnVjdCBkcm1fY29ubmVj
dG9yIGNvbm5lY3RvcjsNCiAgICAgICAgc3RydWN0IGRybV93cml0ZWJhY2tfY29ubmVjdG9yIHdi
X2Nvbm5lY3RvcjsNCiAgICAgICAgc3RydWN0IGhydGltZXIgdmJsYW5rX2hydGltZXI7DQogICAg
ICAgIGt0aW1lX3QgcGVyaW9kX25zOw0KICAgICAgICBzdHJ1Y3QgZHJtX3BlbmRpbmdfdmJsYW5r
X2V2ZW50ICpldmVudDsNCiAgICAgICAgLyogb3JkZXJlZCB3cSBmb3IgY29tcG9zZXJfd29yayAq
Lw0KICAgICAgICBzdHJ1Y3Qgd29ya3F1ZXVlX3N0cnVjdCAqY29tcG9zZXJfd29ya3E7DQogICAg
ICAgIC8qIHByb3RlY3RzIGNvbmN1cnJlbnQgYWNjZXNzIHRvIGNvbXBvc2VyICovDQogICAgICAg
IHNwaW5sb2NrX3QgbG9jazsNCg0KICAgICAgICAvKiBwcm90ZWN0ZWQgYnkgQGxvY2sgKi8NCiAg
ICAgICAgYm9vbCBjb21wb3Nlcl9lbmFibGVkOw0KICAgICAgICBzdHJ1Y3Qgdmttc19jcnRjX3N0
YXRlICpjb21wb3Nlcl9zdGF0ZTsNCg0KICAgICAgICBzcGlubG9ja190IGNvbXBvc2VyX2xvY2s7
DQp9Ow0KDQpXaGljaCBnZXRzIGFsbG9jYXRlZCBjb3ZlcmluZyBmb3IgdGhlIGRybV9lbmNvZGVy
IGFsbG9jIGFuZCBkZWFsbG9jDQoNClJlZ2FyZHMsDQpTdXJhaiBLYW5kcGFsDQoNCg==
