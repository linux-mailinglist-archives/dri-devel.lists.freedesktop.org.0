Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BBE6747EF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 01:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE67610E9E9;
	Fri, 20 Jan 2023 00:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654D310E379;
 Fri, 20 Jan 2023 00:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674174039; x=1705710039;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cD5umtDeyM4d5Dmki/H2t5qv42LMVerHYLaNee60DpI=;
 b=CebOIuM3ayP8W4I5+sy3/CYYGzNvIIviOfwVLaqU1di6/sk/pxt5gCgR
 /4b0MXPFFkbmq4dSyffJRLyvmJe7QQbTPjdXUN3BYLmmMIX7/UyAkmket
 wjMntKMqUkB3Z/uQc49tWyXn7lCEms5cFjz24emMsbSa0KbAQnRqB+gHw
 jw5agBYNsN56hsc2XQcgEzG2rF8cuxonjgSWxuDPwAR9Mo11hh9k/bK2k
 /NLFLai7vLcOoTUGEUCihyZm549LXiGoSKuDqcGHOflpRYT8TA21uQ69Q
 kEmughPgpMBkK5kWFdgA3zQn9KwbZhlMnNsjzdabaS8a+mgPS47yHj1L7 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305145149"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="305145149"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 16:20:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="660408753"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="660408753"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 19 Jan 2023 16:20:36 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 16:20:35 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 16:20:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 16:20:35 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 16:20:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaOpx/unXJnA/TJIJ3m8bgSkjoNaXrHhxIptZpWdKIBk0ENUcCUmOqCo9mvVCqAEOx72JbY+A/MsOLw+PWZUDBS1outnX54nNGjwwfg9SareAXFP9bEOquZ0mloC//cLH1aBRFBrcTP6HPODwP//0h5c8JVECn/6pb0FeOCqKMCg86OddVXb+GBTLKqOVSqB9eIyrDxVs7MI7Nc1J2P+02iy/5A5bhTyLKIbXYPCPTNxCz3Xyhe6mkcVppyve0U2bJJtF4RtwCpc0NCy0oJ7VOXhtRCcQDTOy/YO5MF+lskHU94h03sNhPSjc39Y/gOCssp0wH4oN5nblUzNxjP8ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cD5umtDeyM4d5Dmki/H2t5qv42LMVerHYLaNee60DpI=;
 b=b8VGOYg+88J0vCxeO43SKZKVjqNzm6Za8LnpFQqny8ZnQuAegYvA4C7MP76WVP/+nM829wQeeYTpkKkelmbbn+mfS+GPvxWYQbYESFsJALj0s5PVwjF8/0Q+3GVGYCjNzSZWFeXoBtcXcNZF5iWhCuK5RzE/iJTTZ4RFXc4WrfoQYTt0NokdQJ4lZgA+7mCeLsnbFzFWDSQsVP1b3mbWCh02TxEhzE+/0iZZTDpsd5ni95Xx/DLsivjWqzoYpj3mRW0ky1NIx2aPxOKfl2NOyjCl5shzAMcw3i67/Vu+mA1cse8LM3ZrF1dfHbKpJMH7ibWtgtXSSs/VblGgUtfmTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BL3PR11MB6460.namprd11.prod.outlook.com (2603:10b6:208:3bf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Fri, 20 Jan
 2023 00:20:33 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%4]) with mapi id 15.20.6002.025; Fri, 20 Jan 2023
 00:20:33 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/9] drm/i915/pxp: Add MTL PXP GSC-CS back-end skeleton
Thread-Topic: [PATCH v2 1/9] drm/i915/pxp: Add MTL PXP GSC-CS back-end skeleton
Thread-Index: AQHZJgWfmmYtr0w8EkC7Jp8V1ahbs66kft2AgAH/GoA=
Date: Fri, 20 Jan 2023 00:20:33 +0000
Message-ID: <1af2d00c633e04cfa046665fae1d24dd5cda2e13.camel@intel.com>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
 <20230111214226.907536-2-alan.previn.teres.alexis@intel.com>
 <52edffe9-6fe6-ffa6-202a-4126390e6b61@intel.com>
In-Reply-To: <52edffe9-6fe6-ffa6-202a-4126390e6b61@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BL3PR11MB6460:EE_
x-ms-office365-filtering-correlation-id: 9fe83b2a-1dca-4e3b-0575-08dafa7c2577
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iAual/A+M1laf2TqwTzZTuoIA/qWGlUmV0PFQEqCdFyVzwHdL/lVKXmVSBDoBLVBeIqzH0IXClpyl5UCRHICMTZ93dDdwMI2CZ2Ng4lApurIkuw7YkdPWtESyLvlduwual/4FyxUwgxNRuhCXQX94qSEGnNdUF9Co8vjgX3hkKnwSBXQsOUcnrD5ZsLeW7/i17OXrKTtBAtsF8iDUMRDzcp8Mk1ingagRlZEVeTtfdOjMqfYFS+ZSmGONhjE9PItJR5rsH2nCXBkRCYnYjZR49Yj8N3qEvzaJll3JQfz/6ulZCjpugcd7isR6/3t0/ULVlLWDaJXOJWe2tcTAStXmZX1DkteUyVnL6v2qWIfM5DBB1tFAqJu9YRGBEcIGKGDvrh3Z9eRdDUE0Iwy+oubCGKkh0FSD+qS8M5jRENTKb3LAkrLNTcr3ay4qfMA8jEBrzyKtCWFUbytstJ9S+gT1mHVm+lZja6jKMUGD56/mhniUqcIWtEwXDiyPIgSQzWf3BIAJ+H1KitXfKhl5M6LyyBIPlFBHMj9jUwdYHKNeEc78wD1nFHfcNN9VX94GolLCIEYtcOA4i9Bq5kn5Id6nj5Z+EiznH1ixZqcNiAvG0R8Dg9ppA/QEJsSq/HPaqvVZMZgI9XJY+QB/5xfHpqw2Ee0J7Rzsomu7cuuf7Ud0NlTmg56fiXx7psjVJh3Huwp8lNE54NRXwftcA5S/039HQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(346002)(39860400002)(396003)(366004)(451199015)(558084003)(71200400001)(122000001)(8936002)(5660300002)(316002)(86362001)(6486002)(478600001)(36756003)(6506007)(38070700005)(2906002)(2616005)(26005)(54906003)(110136005)(38100700002)(66446008)(66476007)(4326008)(66556008)(76116006)(8676002)(91956017)(82960400001)(64756008)(186003)(6512007)(66946007)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1JteGlwdmxjaFVGVHlQdzlRZWFFKzBBdE1qM3BtSkJvUlVCSGpKVGZzVEla?=
 =?utf-8?B?b3hkZWxvaXkxTTVkK0lHS0UyQzNFU2ZuM1MvY01VbXpzMUNSbHd3WDNmNkNk?=
 =?utf-8?B?K2VjYXVvVVRwWlhWLy82aUxLQVN6MlExMmpFV3ViUnpPaW5IVTZ5NHFCTFN2?=
 =?utf-8?B?aHdkUVdWSDNJNmNTdkJhdHVVaFBjdDQzWUQ0MGRqWkduVEtWbnFVajkrVUhH?=
 =?utf-8?B?Uk16Y3BmTWtXbDEyZVFXS0dWRDFNVEpKdHd3ZmtWcnFHMCtjY3B1OTZZdnRK?=
 =?utf-8?B?dG9kSmxucFJDQU9FL05MTG1acEh5TGNySDJyRXgvMnpIMmNpTlBPZlhtN3RL?=
 =?utf-8?B?ZUMrL2RZa3p6MGpLQ3ZUNzJKSTFyWlE1RFhla3k1Q01nQTZDeFZvbzVUUVIr?=
 =?utf-8?B?MGR0ZHFRUlRpdTVyTndHb2ZCcSswVUtqQWdNZ2RYUVkzYVd1Ym5RRFJOOGpE?=
 =?utf-8?B?TmtVV3FtY1VNWHNhaGp1VDNENnQ4YXZhSjR4TXZwdVN6ck5PK2lSNjNtdHU3?=
 =?utf-8?B?VHBkTFg5ZFR3M1JQbVZVbS8zZkJpcFI4TjJWMkY3bnlwUXQ4blc0M09DcDFw?=
 =?utf-8?B?YnFwZTlUOTNrTEJpOExnSFc5VUVLeWNEZDdMQmlEWlNxVGJaNktIRmNjYzZz?=
 =?utf-8?B?ck9rWHFhSnB4NnRITFMxNG0rb2xqZGMveTEwMW45eGxpTDk0OGhxSlpIV0Uv?=
 =?utf-8?B?SU03Uzc1ai85VXFnQVV6Y0NJN1lUd2l5QVVLclNMeW0zZWg4L2FQWEZleFdM?=
 =?utf-8?B?ekRyTFlFYXN6TDc1Y1JhdTJrQlFvWk92ekFQZzkvck9vMkwxN0VhM1Q0Nk0v?=
 =?utf-8?B?V0M4ZzNzbTk3d3JzSnNZTWR1YSsyWW5iZTkzT1FZR09LMWJuNGMxaDFJNEln?=
 =?utf-8?B?YzZlVjRKWE9SSnNqWHVIbmtBdkJ3c1R5ZDNHcHZCUEQ4WjRqZW5Wa1ppdzdW?=
 =?utf-8?B?SjdhbnM2MCt5VlhSSVJzdFhzV2ZNSUJGd2REYlJjZkVxcjgxUEpsTVh0cTky?=
 =?utf-8?B?cUhwWjhrdTU3amdkTkRIdnFibmd0b3BOMkxEN2FPQ0xwdlZwSE9ZVDAyTDhR?=
 =?utf-8?B?emgxUW9zaEtHMjNYV0JPSldEZlhBMlg2QkRxc3lzTmVkemd6bDNvNEVkQ0Zx?=
 =?utf-8?B?ZUJsZEVaV2FjblFuYmQ3MCt2YjNQL1VhbUZKdldVZktsWWlydHRyWGQzejY4?=
 =?utf-8?B?TWlDU2Y1aDRsZnoxSVNMUjhySDcrRXFmSUEyYUNXNlZYaVVJOGJhcUxOKzlX?=
 =?utf-8?B?RkF5NTdvd25GZHFHZTFkTkVJUGNzUjBZTk5WM0EyL29ldUkrRFltZXRrcWlr?=
 =?utf-8?B?bXNUVHNRa0J6YzRhSWt2NDRrNUVLdWUzSGNZRHpBMHhyZnJQVnVDeHFIY1dz?=
 =?utf-8?B?RmZNMkVMeHBNRnUyZmk2WEU5dE9NYlpXSmdGbDBwQ2tDYlErNWFnTjNieDY5?=
 =?utf-8?B?dHA2RjdtbWlSZ1hvMGNFenk0KzJXVTdLeDVyL1UxdnlhUTdJcXJPODgyQ0cv?=
 =?utf-8?B?cFZ0WVBqeXNRbitYNlgwaURxbG50amhsQis4MlBTUFVQUWVONmMweVdLV3JH?=
 =?utf-8?B?ZWFIcC9lUi9ZTitBNjRreTR6Q2NYSHhiUlBScG0rRWxsaHYzSVB6NlhDTW5D?=
 =?utf-8?B?QXg1QjZLZFozR0RGS3NoUjNibThqUjZkcmIvUUdzZWVXVVJaaDVOMW1EWS9D?=
 =?utf-8?B?WTNBMndtMzRBTVp4QTR6ZEwyWFVQSTZuT2ZBOFA1TkdQUnZUblVKN3VhSlh5?=
 =?utf-8?B?TGp1aGhZSGU3RjAvb0gwTnNsaUw0TnJ1a0MxZWQ2R2NWcE8xRzQxMnVrUEJ3?=
 =?utf-8?B?R3dSWXk1RFpTUkVvZnNveXFSdmx6cXNuNGRyaXdZRlZpMzMvc2E4Y1hMNHJV?=
 =?utf-8?B?M09OS0dOQXNVM3dFYUNVRjVDVXRUSGlQcU9pSG1yNlorSW1pbmNzeXN4YmUr?=
 =?utf-8?B?QkY5YUF2UzM1dVU4L2JCUGhSaFVtMy9yUWFkeUswRnZwNXl1OW05YWJVZVdm?=
 =?utf-8?B?dmxHRUN6QWwzMW5xVlJhTnd1N0x4M1lhajEwWFV2K3NOeXk0NUs4L1NsSWxB?=
 =?utf-8?B?REQ0VVRzT052dnpkTUF4MFVaYmpjWGZzdG45dUVkOWNtZ1prYlVWR0o4ZUxL?=
 =?utf-8?B?ZGRUOGtXN1JEK1p4WklHa2RUYlVaVHBhOHZ5Z2hWaExiK3Y1bDZUditJSWFE?=
 =?utf-8?Q?NQ6URuxQBWe54xWw7NiKr8DRDzAAhSabubtMywpv832Z?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE904ADE73B72847B80B7D27FDE50482@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe83b2a-1dca-4e3b-0575-08dafa7c2577
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 00:20:33.7167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UkbBTYLYDHPHbPum9/OBYYUDaDAKf8cQwl3MK9KmFAz/SdjDCjYbjso3/uQor3DWd1y/UwqHDAlXhUiXVLcvcwFQo+nSRJvRd2YnjeUGJ9a0t6ESqvBH9KqEnU4Pm45B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6460
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
Cc: "justonli@chromium.org" <justonli@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciByZXZpZXdpbmcgRGFuaWVsZSAtIHdpbGwgZml4IHRoZXNlIG9uIHJlLXJldi4N
CkFuZCB5b3UncmUgcmlnaHQgLSB3ZSBkb250IG5lZWQgYSB2YXJpYWJsZSAiZ3NjY3MiIChzbyBI
QVNfRU5HSU5FIHNob3VsZCB3b3JrIGZpbmUpLg0KDQpPbiBXZWQsIDIwMjMtMDEtMTggYXQgMDk6
NTEgLTA4MDAsIENlcmFvbG8gU3B1cmlvLCBEYW5pZWxlIHdyb3RlOg0KPiANCj4gDQpBbGFuOiBb
c25pcF0NCg0K
