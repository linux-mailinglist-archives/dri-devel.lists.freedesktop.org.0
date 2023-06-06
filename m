Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891AE7233DE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 02:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F9910E18B;
	Tue,  6 Jun 2023 00:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B44E10E18B;
 Tue,  6 Jun 2023 00:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686009635; x=1717545635;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Qmk5iSFsZii+v//NcdlxgciyEh9Jpd7pqEieEnfrJCo=;
 b=VImls+QPf81S0ccqrAGsmXtAV7brhZ77sXWMVNYzESmYm06P7jD/cWqb
 XR5eqiIQvhXcTzJ85fClMsqMJ8RdPgUtDsFeiM1qjIlPAZFoWsKC/Z9b9
 Xn0jhcPHDXxIIKJkYxI9mNBWK48xOSqR1Wysem1VT/EQuB+Ei0L9hDWkF
 2GG9yXYIEv18gDbP6sEHTSebRTb5ctK4TeNMSUVIJZtwZGUOjFRdFeGjE
 TO8tE6+dwTOEDjfLGMXCe0P62HNed0xufiA/XzzAAoxkN7yfn3ioL/uMs
 0pppVQfiHALOwdFc2HrhNuUAGcB+8WtGMNRzP4RfLYqvw2X1DPIF+MbRy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="356523892"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="356523892"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 17:00:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="832996437"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="832996437"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 05 Jun 2023 17:00:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 17:00:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 17:00:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 17:00:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 17:00:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhn84DQOeEflwqX5l4a0BmZqKWPE85hk/KgDrUz1+eUjiKv82r+UiIbXeebp70Qv0oMABwfKt5dqOWC1zp+Syu0ZB7j6ryMu4MV62Hc67WDEjleVPfwPapGR/3xNO9xMM+z6J2h3HHCQbr8gwk6XHB4LxwRBF3H4ye5EQL7UxcPtq80Y4oHoFkOcYbPYXtN6+uPolejeHgvx4i0Q2MFi1ql2yyyU+v/JEE9IgKMzB7rJrhHXVmgZsMN1qNf4cm0g2raRINbo2Mfu0oqvNSUiDOcrxe/QRSiAtZMhgrrsAPUpewp4PTSR08sN/6A/j9DtI3In1PhGZgzmJQfl7AYc4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qmk5iSFsZii+v//NcdlxgciyEh9Jpd7pqEieEnfrJCo=;
 b=H5alkQxuTs7tZNlEzp6uR7tqrKIu2ghJBlQ6rrsCpOoAbZ6IwH3EzVWSrpxjFLPbFwcXdL3tGG5K9Eo6+cpjRUNZF4H42jpWMalgGlqqABirfMCmPwzlGFy2508gQ4ROMSnzeaomPPW3wGGPP1J8uJkNP9Stbu5qSsOSzbSIQ3YqKEuCCRa97U5pffiLzLybA6sjZbRl8Z/wKroWodXCAdbq+4O4u08NrgfHpgAunzu5B9COBcpVeQ4YOmko3f9Wb5m4YYRbG622Mz0RKzoODuAnhSezZ6CXWin2J+ch/Bfq/MHUIBfdiz1nSs+KKXXOa5tM47liJkwJyZEvRWfDjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB5501.namprd11.prod.outlook.com (2603:10b6:5:388::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.32; Tue, 6 Jun 2023 00:00:31 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::11d1:e192:b174:e851]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::11d1:e192:b174:e851%4]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 00:00:31 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/6] drm/i915/uc/gsc: fixes and updates for GSC memory
 allocation
Thread-Topic: [PATCH 2/6] drm/i915/uc/gsc: fixes and updates for GSC memory
 allocation
Thread-Index: AQHZf2tKJVttuq6OLk6EO4uhdG+8Jq9nGA0AgAD9mICAFP9TgA==
Date: Tue, 6 Jun 2023 00:00:31 +0000
Message-ID: <306ad921b5a36c7fc29c1113c113c4caa6a4135c.camel@intel.com>
References: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
 <20230505160415.889525-3-daniele.ceraolospurio@intel.com>
 <dc45dc7e07ebbbf5a0e40831ba44c206d86cc93a.camel@intel.com>
 <35b5ccc9-95a5-ce54-7db3-e1f78cb96e28@intel.com>
In-Reply-To: <35b5ccc9-95a5-ce54-7db3-e1f78cb96e28@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB5501:EE_
x-ms-office365-filtering-correlation-id: 942b54bc-d481-4972-1afb-08db66210b56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z84CmD4BL8An5vL9k3zAEQTwVRpE3JHZTItcvsU74VO/rRnEN5y2mLKxvvUJuKcBiiOz5hFyr9SKYUgrCA8zqnXlxgFMsh5FnOEiTCedRRdSofXwv001exMPto5/3F9pWN9P2zN/FE9QAUioceqpB06iXgKVEXu9PIij5hDohLf1oA9cK8tX0eUsYntcTFe9EZ7u9giw3rFTOyr4zW1FyF6fBfzbIYFOJJ+79VNEcqff4GOcSYkGTAZIBfpUok3LcApyIIw6F0VU2phtNJMLs4fVjqI7YUNzS7JB0voKKGdaXLsdY97vNgu0pbRQTwTDvFhBQLIxsjNwboAH/Awp9ImQyVZI6SfWqX1XBe4UhTRI8TqZlrgK5o5NLcVQak+iQB3Y9zBx18DloQI6lwDcwxfOfTSWNiXCJ9KmKFSI0FS3C5vQFu4iSXxAauFwzUtfwoeCFZ9mBu9wA3S0Z5bLKE0W8BTGBCYJnPvt5aJxAsNXJV4xVtPxiwlUdGGH1rnVVKWNNSACGwXBJI6tnWFyV19WrzLftKDLoxyhXbOBLkpn27YZkRbhE7wRlS2BoBfQ/JDsaXwTwGUHFyPd0W5e11ubDDw3R9pfa2HhjzhhhF+7e9uYFmGWvHOkgvESTnA4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199021)(107886003)(6506007)(186003)(26005)(6512007)(2616005)(82960400001)(83380400001)(6486002)(36756003)(2906002)(71200400001)(8676002)(8936002)(110136005)(54906003)(478600001)(5660300002)(122000001)(86362001)(38070700005)(66446008)(38100700002)(4326008)(316002)(41300700001)(450100002)(76116006)(91956017)(66556008)(66476007)(64756008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVJYb25PYjRVR1ZkV2NtYWlBYzJrWmhIZzVDbnowNmVNYkM4ZDQ3WjF0aSts?=
 =?utf-8?B?RmJxRlVreWdQRndobU1DT0ExcXUza2NUMFZ1Q0dER3BVcUJ1dFBlcmxWSjZn?=
 =?utf-8?B?bCtSbFlaTjNVOVJWNGNBMXZncnBLSjA2L21tSWFpZzZINElkZWtwUUJCMFhO?=
 =?utf-8?B?STRiMjc4UFVka3QvRTBpYU1aZ1gwWEQ0MXQ5bHNaTmVxL1pKS3UrMnhUOCty?=
 =?utf-8?B?VEtiUDdJZG14MjlVV0FTNTNlMlEyazVJdEFVeFlKdFJMcW1aQ3JETTRIYzZX?=
 =?utf-8?B?NDZjZmRjOTRQZFNBbHNWaGRSd1UwTkIvc0NWR1FWTlV2bEQrem1zREpnejFv?=
 =?utf-8?B?WmZzZFZMNHYvaE90MThQMy9CbytWMU40dngySzZJT1NJbkkveEM5Z0RKc1Rv?=
 =?utf-8?B?b3Z0Ulo0TFVTa2pzZjJMWHo0NmhpaWxHZ0U2b2poRWQyNDloZmo4N1ZQWEJJ?=
 =?utf-8?B?d0lQUWxuMmMyZVMrZmxxRit6UzdmajJpTmJ5TDdsZnk4dkNIZ0hLZUs1cXZs?=
 =?utf-8?B?ZG5MSEJQdGVEUndvTjIzVnBRM3lraXBCYnZYczY4MllXcUtCNE5MUmxOeFkw?=
 =?utf-8?B?RW0rbU1Pd1YyK05jVGNMendqYVEwaytvMlRaYUJYRlZiRzZlQllzdFp3L2w4?=
 =?utf-8?B?djZiRHFHeWt6LzVRWWhOTytvenREUDFocVNqWDZVUi83N2VhUzVKejlYWElK?=
 =?utf-8?B?WXA5ZG90REZiU3QvYnFGTDZDSXloNkIwdUFQSTNrd2szYmhvVm90MkZyZFNh?=
 =?utf-8?B?aE5zLzB5aS9kMXJ1NmI2d0xsZDNYQ0ZndWRwS21NazQ2VmVPWEZzSlpFUnE5?=
 =?utf-8?B?eU1GZXJJWXVRSkh5T3AvQklzYURlSW9Pdm1vdnRPNUlhZVVid1BWM0NOdXF2?=
 =?utf-8?B?SElGQnA1bGlDOU8xUzJRaW9rQ28vWG1haS9Bb3FFUGFzTnVDays3aUdHSnN0?=
 =?utf-8?B?emtuaWtCZUxsS0pBa3VucHMzc04wNUhNblN2K1J5ZnFQdERZWDN0MjROb3dr?=
 =?utf-8?B?VXhEaUF3dkFUYkF6b3hkRzN6clZvWjg1cWoxS1BRV1NTdU1IM3FKMkpXdU50?=
 =?utf-8?B?RTdOYmtzVnJHbE11ZmkvdTFlak9vL3NCN0hpWXViblVZcUFBRHd1ZnFEQWlh?=
 =?utf-8?B?c3M2WDJHOHJHZkpaSktzRXRXdzhlV2xuQkM5eE53NmVxSitwdkQxSk1ja2Zr?=
 =?utf-8?B?U3g4S2djcFF0bm5KYkIyUjV2S3c2SlJ5d2FNeG96b01abmNPVEpONzR1NllV?=
 =?utf-8?B?NlNnSEZTNmVad2txYlBudnU4TGl0cTlKZEt5U1VYMG9FNGV5UUdUbE9LakUr?=
 =?utf-8?B?Z3BNNXMxR2kxWUxWMHFjWDRncThVVFBla1JKdTdDV1Njb0NqNUFwZG9kWUpJ?=
 =?utf-8?B?c2E5c0dDNisyei81VDRFUTFWbzRoMG50Z3p0UFlKaFpHcFNqc1R6Sy92czlQ?=
 =?utf-8?B?Q3Q0dFpsMTdocHJDNlVUMDI2Rlh2QUVjYy9MMXcrL3BIRk5NbGNCUUxJVU9N?=
 =?utf-8?B?cDN5UWtONFczU3RYeGlNMkp1ZjhJaDRCdE96bURjdmp5RzZUSDhMaGx2ZFM3?=
 =?utf-8?B?bytITXJLT2lzaDBNQUc5M1UyM0FmVXhMeHhMSXliRXhmVU9ienNBV0o5bGNi?=
 =?utf-8?B?aFNuN2QyOU5vYWZLM2YyS3ZvRlJQSEpvV0JtN3dRRktlY3VHd1F6MG5xY08y?=
 =?utf-8?B?cmpLWnBlcnBPSkQxUGx2Njg1QTZxTUNtMFdNT2tGTVo2aGRHNlVZOGVKamZX?=
 =?utf-8?B?dTNnZGU4OHlRbU44TDRPYytQRnYyNUJCTFZGNFR0YkxVcnpGY1J6SDFNQnFW?=
 =?utf-8?B?ajFCMUdLQWVDUUlWTHVpVndBWUU5c3FRT0NZSTJRa3l3NjdQYzZ1WFlDYU5W?=
 =?utf-8?B?Q0RBYzJUZVJmc05rWG5wRzFPeFJwZDRvODJWdFVrN1g1RDllc2huanMxdi9V?=
 =?utf-8?B?WURtbUNlQlFJSFc1NWNHa2J1b1M5U28yb1JDWnN0ZFMyZ3JXWTJ1TWZ1VGli?=
 =?utf-8?B?M0RheDdyUC9xaDdEbHMzVGZLRWtRL00rYy9PUTFkNElqbmZFb29XWVdEa1Nx?=
 =?utf-8?B?ZnpNYWtiSHJwbTROTlVBSlJ6MFRrREFTVmVnb3ZveFZ0NmRodDVQeityT1h2?=
 =?utf-8?B?OVFDS0lUL1JBMjBYa0luMDZvdmltU1FlN0RDUDVLQ1VoeTE5UGZscHVkdnlL?=
 =?utf-8?Q?WUe2S2gp05gkYL3cdMVOmkk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <299A23A8F958584493DF1C8637BEFBC8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 942b54bc-d481-4972-1afb-08db66210b56
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 00:00:31.3015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fe96+Ou3kqjzUn+Mm0V5XMTSuLHZKeN2GCm7acNmn9is/ZjE3EwvKMEhl514SZZfdy60ig2zo8lD25TPBG89o6cFmQO9qe/QN+be3id0uDa+nvDP+shyJO6eEGbMETWU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5501
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
Cc: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA1LTIzIGF0IDA4OjIxIC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gDQo+ID4gDQo+ID4gPiArc3RhdGljIGludCBnc2NfYWxsb2NhdGVfYW5kX21h
cF92bWEoc3RydWN0IGludGVsX2dzY191YyAqZ3NjLCB1MzIgc2l6ZSkNCj4gPiBhbGFuOnNuaXAN
Cj4gPiA+ICsJb2JqID0gaTkxNV9nZW1fb2JqZWN0X2NyZWF0ZV9zdG9sZW4oZ3QtPmk5MTUsIHMw
aXplKTsNCj4gPiA+ICsJaWYgKElTX0VSUihvYmopKQ0KPiA+ID4gKwkJcmV0dXJuIFBUUl9FUlIo
b2JqKTsNCj4gPiA+ICsNCj4gPiA+ICsJdm1hID0gaTkxNV9nZW1fb2JqZWN0X2dndHRfcGluKG9i
aiwgTlVMTCwgMCwgMCwgMCk7DQo+ID4gYWxhbjogc2hvdWxkIHdlIGJlIHBhc3NpbmcgaW4gdGhl
IFBJTl9NQVBQQUJMRSBmbGFnIGludG8gdGhlIGxhc3QgcGFyYW0/DQo+IA0KPiBObywgUElOX01B
UFBBQkxFIGlzIG9ubHkgZm9yIGxlZ2FjeSBwbGF0Zm9ybSB0aGF0IHVzZWQgdGhlIGFwZXJ0dXJl
IEJBUiANCj4gZm9yIHN0b2xlbiBtZW0gYWNjZXNzIHZpYSBHR1RULiBNVEwgZG9lc24ndCBoYXZl
IGl0IGFuZCBzdG9sZW4gaXMgDQo+IGRpcmVjdGx5IGFjY2Vzc2libGUgdmlhIHRoZSBMTUVNIEJB
UiAod2hpY2ggaXMgYWN0dWFsbHkgdGhlIHNhbWUgQkFSIDIsIA0KPiBidXQgbm93IGJlaGF2ZXMg
ZGlmZmVyZW50bHkpLg0KDQphbGFuOiB0aGFua3MgLSBzb3VuZHMgZ29vZCAgLSBpIGZvcmdvdCBh
Ym91dCB0aG9zZSBkaWZmZXJlbnRpYXRpb25zDQoNCj4gDQo+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfdWMuaA0KPiA+ID4gQEAgLTE4LDYgKzE4LDcgQEAg
c3RydWN0IGludGVsX2dzY191YyB7DQo+ID4gPiAgIA0KPiA+ID4gICAJLyogR1NDLXNwZWNpZmlj
IGFkZGl0aW9ucyAqLw0KPiA+ID4gICAJc3RydWN0IGk5MTVfdm1hICpsb2NhbDsgLyogcHJpdmF0
ZSBtZW1vcnkgZm9yIEdTQyB1c2FnZSAqLw0KPiA+ID4gKwl2b2lkIF9faW9tZW0gKmxvY2FsX3Zh
ZGRyOyAvKiBwb2ludGVyIHRvIGFjY2VzcyB0aGUgcHJpdmF0ZSBtZW1vcnkgKi8NCj4gPiBhbGFu
Om5pdDogcmVsb29raW5nIGF0IHRoZSB0aGVzZSB2YXJpYWJsZSBuYW1lcyB0aGF0IG9yaWdpbmF0
ZSBmcm9tDQo+ID4gbGFzdCB5ZWFyJ3MgcGF0Y2ggeW91IHdvcmtlZCBvbiBpbnRyb2R1Y2luZyBn
c2NfdWMsIGkgYW0gd29uZGVyaW5nIG5vdw0KPiA+IGlmIHdlIHNob3VsZCByZW5hbWUgImxvY2Fs
IiB0byAicHJpdm1lbSIgYW5kIGxvY2FsX3ZhZGRyIGJlY29tZXMgcHJpdm1lbV92YWRkci4NCj4g
PiAobm8gc2lnbmlmaWNhbnQgcmVhc29uIG90aGVyIHRoYW4gaW1wcm92aW5nIHJlYWRpYmlsaXR5
IG9mIHRoZSBjb2RlKQ0KPiANCj4gSUlSQyBJIHVzZWQgbG9jYWwgYmVjYXVzZSBvbmUgb2YgdGhl
IEdTQyBkb2NzIHJlZmVycmVkIHRvIGl0IHRoYXQgd2F5LiBJIA0KPiBkb24ndCBtaW5kIHRoZSBy
ZW5hbWluZywgYnV0IEkgZG9uJ3QgdGhpbmsgaXQgc2hvdWxkIGJlIGRvbmUgYXMgcGFydCBvZiAN
Cj4gdGhpcyBwYXRjaC4NCmFsYW46IHN1cmUgLSBzb3VuZHMgZ29vZC4NCg0KDQo=
