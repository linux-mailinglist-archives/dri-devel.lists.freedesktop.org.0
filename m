Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8FE68A8E1
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 08:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBC610E9A5;
	Sat,  4 Feb 2023 07:55:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524F410E9A5;
 Sat,  4 Feb 2023 07:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675497327; x=1707033327;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7UPqH7LaAz1xQEZhfO0r1j2/UyQQpVlSUYkisoOPprI=;
 b=BgT8SaI9T9tAabzlygdn6m9nc1gPVnjVvLAf2F6OZmG8eW38g9G/FDAx
 yM+4R9S07DjYgrj7jxqTQaYYRVJ1hrDinqbqyxs0foW9EgUmQhntWVXE+
 PPRAIrRJDJBazNdMH/x+LlPieJCmFBo0+iJC6zSC3QMYNpjaYvB/Obj3a
 ThBVzHfCatdtTQ6UYZ7tO/zibFtIwBOrtoCsljR+AFrB/sltLQWQ09TVO
 A5iCm0BgXYNniDcfbwydiXMz2BEfs36rQZCGq0SjsyqUrpNB7Mirnho3r
 OuuBxrO7ULbYtc9+MDk5GQNtaoZpDdSnY2pc7pR+E1ieLGqshaB71uh6+ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="328942382"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; d="scan'208";a="328942382"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 23:55:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="774594255"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; d="scan'208";a="774594255"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2023 23:55:26 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 23:55:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 23:55:26 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 23:55:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7rRlLqVh+d6zCKScoKKbnqMA+omDEgM3A0SNaj/Z2dyM0SRxcRVA6+6t3puvqzge+Jpg6vnrC3xs+okPRTeQkLFxl3QQG5llur3vONGCH86Ev4Gd0CB+EkLQkJUdQZTYHmOFXnoQJAAd6Cn4L8Wv0eSEVdLB1KgdsfAk4bL6thcHTKOqQtiLOla7k9QO5X/GhfvLBeHgRJo1qqIeWd5G8GGn8ccyDh3W42Ve49yVxFbdPSsvEUCV9XdHK++tRrxJVoLR+QHXL62onWvmrrxHfP3FXG5m5vQlqCOyUd8Ey8g/r/67jUi+azkC7swj5ipYsEe6eaYB7vviOyPusJQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UPqH7LaAz1xQEZhfO0r1j2/UyQQpVlSUYkisoOPprI=;
 b=ODeVwJKGMx3h91TA0rb6e9zlEC0Qfs8WFYQhkGgr68l6Hur2renWlK5T399z/3ZgjoRdCR9T94OlkC2lmZ5DjC7qqFQuCS4sg7gLB78ZzmHCrYv3TKsoXMzuq/Wj7LSqZ8f5FWzoFKXM7aknfmQVOlJ5LDlLVU93WmUmbQICMNola4fBkUoSLbU7luOfVGkMZKgB9vFUzxkAUGPY1tIz0yzEWsISFIU15FnHIqcxQxI8gzVSWatIkhKpWHVgfSwxg7EXLSBJeBj/+q2gBzM4o3N1BvOkbMPrWa53KTUdi9sitFFGRABKqHhgRyc4lrMxOwgiDdxblQGwTKK4dn1sqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by SA0PR11MB4575.namprd11.prod.outlook.com (2603:10b6:806:9b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Sat, 4 Feb
 2023 07:55:19 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::17f6:2dff:ce11:ff0d]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::17f6:2dff:ce11:ff0d%9]) with mapi id 15.20.6064.027; Sat, 4 Feb 2023
 07:55:18 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [PATCH 1/3] drm/i915/guc: Fix missing ecodes
Thread-Topic: [PATCH 1/3] drm/i915/guc: Fix missing ecodes
Thread-Index: AQHZN2xY4Rrwal+5tEabt6GJywPHH66+bTGA
Date: Sat, 4 Feb 2023 07:55:18 +0000
Message-ID: <3aa6e8f8d22aca62f504f912ed3787028866e620.camel@intel.com>
References: <20230203011043.3427096-1-John.C.Harrison@Intel.com>
 <20230203011043.3427096-2-John.C.Harrison@Intel.com>
In-Reply-To: <20230203011043.3427096-2-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_|SA0PR11MB4575:EE_
x-ms-office365-filtering-correlation-id: e8782c3f-39f5-4561-2e62-08db068528ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SU8d/Qt2OiMAjjP/RxoVmEg3IjYUi5bv1daqZaF61JsHoOXHiVZDc5y7LWO5qYA5ap4G/peCIvOrbEz+BLuLzcdQatLDDLXd0z9sNsIHZF+uoZEnn6jpJ3teiLuQUIgI0x8VJsYXHH0RwyFVPHo4PGB5CE1YUDC5FxxUiUn9sRg87A1XM23Gmlg8ermG2qZjFA9sjOU+0M1m+/8II951NJJB0SNfuadkz5y6V8vGbnBY/Mi26h8vJH6QTgra5ffwirD4pozY5IS9X48knMlYB0bwh4l9K6SemG2BJe/9VvyTB/aXZCa4TyDzmSc/b+VnH/55yy3SHp7wxNSaKGiGq6J28aPSkqB6N3Q7nyVOOcTUY9rfO8B/2gprThMfMRL6P3vL0oGxcMD12sXzEo0ZYbjQ0St10kJg1OBt8TaXV30xtIvz73s/fiL2gGq2IO+nDPgjyU1vBEmphdYoYFbUZnd4y6u0cC3nr7w90nj4h+pqtI0AqyWIXYg8D0QLptYlZOD4hsWIbusLCpX1ofzfjDJYdaFfDSM6BbnZmpK1M41k+wpLCGqSuVLQ99Ul+wagU6KTxvclw2/Kveo9/cyLcEmsyuWv2unlcB1ckXGxuJrr5EzBvG48HsnRK7gW6e6xAJdFuU9F88PdUfZhgWSAmFtvDhboKQTxwScwt4wPP9xQy2BrjHlxjiK4ujtycfjfE0qVUO/2xGjjvPdKR1k80Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199018)(36756003)(86362001)(38100700002)(122000001)(38070700005)(82960400001)(71200400001)(110136005)(316002)(6486002)(478600001)(2906002)(8936002)(41300700001)(5660300002)(450100002)(4326008)(91956017)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(76116006)(186003)(6512007)(26005)(6506007)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWJTWDBUNHdOWWpKdGtVSlJmeWFHdFYxWVpVNGg1M05Lc3VXU1dZYmYyRVdM?=
 =?utf-8?B?NERSVUlhaVJ3QzhCOGN3UFlKdE43YVBUT1hLZU1UczlwdDlsRTFONk5ITm5p?=
 =?utf-8?B?Y3Q0b0RyZDhRTTFheWVtQjlucDFOaklRbFpkMEFxNUFBci92SlJqZW1HRXhr?=
 =?utf-8?B?bVFEZmN0WG5nYTBwZ2JJRDJSRVlFZlNROVVBQlViRjY5L0hOK1IvSzlSS3Rw?=
 =?utf-8?B?S2lPQllFVmpqdkVoTFEyMHh0bWxmRXRtMkpSYk1Tbk5NdmN4UW1SNUtnNFRE?=
 =?utf-8?B?cjduREM4MDBuYldQZXRZK1A5dXJlTW9wY0NRSGlWSDBmVGJRbGwydGZ0TTcx?=
 =?utf-8?B?YVVtT0ZOWENPTjU1d0tXZ1ZLUmdOeFlQZ0ZCWEViR1BKVXFOL3MreUd4bG9p?=
 =?utf-8?B?L2gvZ1NlbDVtRzlRZjdxUTdINnJZRVRmT2xLT0tDODN3WTg2YTFDT05tNHRY?=
 =?utf-8?B?UjgxK2NDd3hvemxhL0t0NzVXZm9OQ2JaZ2EyanF4U1ZUU1hzbGFSU1M3bWRv?=
 =?utf-8?B?WHhqU0dCcUJBTmZLWkJVTU9tU1RESG1OVDdzOGpGODViQVdJVmFSbjBRVDVh?=
 =?utf-8?B?aUN3N2diTEdoK1lNNTBZZGVpM2czd0pJZFZPWktRMVdVMHdqMksxNWplUHAx?=
 =?utf-8?B?bFJLR0tVT05kU082WFRYYW51MEp2dDFXR0FoL3oxczRPYnJQZWY4dTRDcFA2?=
 =?utf-8?B?YlR3TlljQm5nK3ZCUE1CZ3lPZFEvdlpnMWtBWVU3Q1YrMVFUNmlXYzBSREFI?=
 =?utf-8?B?a2kxTngzT3cxMnpTTVplNUJtenRQc3VaWkUxVFA0OFVxaG9pN2p0OXBHQWtU?=
 =?utf-8?B?dTk5Y09qWnd2WUNHQk8yaUZvTHVsTjFxWWRtb1RtQzYvWDVLNmdWUVRTUU5s?=
 =?utf-8?B?cDdGUXZsaC8rakRGNTdPMjVBRUhEdWxWUEd1VU5yekNNUEhiR1VubHJMK2ly?=
 =?utf-8?B?T2gxTkoxZ2E0YXcxZ0JSUkFFSHhWR2lZTTNVRWwyckJJOHFPdjhJdkhlV2Rk?=
 =?utf-8?B?MlpORSttZTA4OE40aEd2NEVYVzlxOTQrL1BHQ2tXMFZMK2F6WVhINHRCRWdh?=
 =?utf-8?B?QVcySFIvenBrRUdWZ01yWGY5ak54Z2dUY1I1M2hsWEUycmEyejJoT2tUaFNo?=
 =?utf-8?B?Z3JhTWQ3VW5vQXpTS3YzcFJEQ0lTc1Y4NE0zYzJPM0Q3V0dnazcza0ZUTFk5?=
 =?utf-8?B?OExyaVZibHpVc016ZENmK2kzRVVEUW01K2diS212bzVpU0NhRUZkRE9SdXVr?=
 =?utf-8?B?dHF4dnlNUGZ4bHk3ZlRRT0lseXU4NE9EbTNLUUFmZU9JVWljcmpQclljdnVR?=
 =?utf-8?B?ckhONTlWQXIwYm5Dbi8wWHZBWVdIMUtEZEtoVitQdTRjUmRJSDJ4cm9aZlJJ?=
 =?utf-8?B?RDR1ZUZCSWJIR2xySG5pbkRxVHVjbVN6UHVCVVNCdUR2MXJZVDN1UDloS1Nw?=
 =?utf-8?B?bkkxOWFiTmEyNGF6cUdXbkVhVTRTMWdmTVRGd05lQys0SXI1MEk4Q0lQZENG?=
 =?utf-8?B?Z2JmRytQaytvcGkyc3cveHlYRzdxUW1xQVQzSHVFN2ZUUytENndtRmVDeG14?=
 =?utf-8?B?MnA3L3VaN1QrQU5zUGRWaENaY2RGVlA2K3BhNVlOaWFIbU81TFlQWmdFcjR4?=
 =?utf-8?B?Z0loUkl6c3k2Q2lkQzFkdm5ycTdBZjYweXQrYUlidlVYa3AzN1Q4VCswNFVl?=
 =?utf-8?B?QW0yOEdMdnRXbGljT29Ldk4vSjMzMVE4cFFFY2w3VkR2R29vd0N2bTZLVStt?=
 =?utf-8?B?SDVmNkNLczg1MWxxYzBGUWYydTJlcXZ4ckplTWFqU2dmekVjTUNIS2dIV0Y1?=
 =?utf-8?B?V0JKNDRPTGFrcVJ4VDlrRlRxM29adDdTT3V4NlR0dDBJZ2RpeWlKd2pyUTI1?=
 =?utf-8?B?RFRZaFZSNVBtdy9LNFRlOXpxYk9qTHFTRDBBVGNDK25IQzFxRHNSWWJyVkVP?=
 =?utf-8?B?elRwa1o5NW12SzRETVdRcnlhb2J6WlFIZ1FJMHFobzM5ZTJsQ2tHbHptTHEx?=
 =?utf-8?B?OXN0OHlhRlB0TjRvMEtxWDRoVDdYekZDUHR0T3BPV0YrYVQwbk5BVVA3QjJE?=
 =?utf-8?B?SytuOEZ2cG8ydFpMMk4xNFl1QUhVNlZVUlYyVlhPWGZWM2hndDRxOTlrZ1kx?=
 =?utf-8?B?Sm5oaUlHUngySkxXSEFidUx0anptcEMyWjZSSGFNb0pKTUhqVTh2VGhTRDIv?=
 =?utf-8?Q?NrRoAUIdQ6w6EInPm0x9Tdg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C58EF9CA97F14348BC097D7298249725@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8782c3f-39f5-4561-2e62-08db068528ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2023 07:55:18.7762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aQriUdcUKGD2oHxgwp8kNAilCDyNBKiqA99qDYmDMbE1Uqc4yUxmacffPh3ZdszZ0A3nsxq0RRaR+3Ln4g6fV/5LSRGl1vTZBzoS7UBgvOFyd7cf+OxpZ1dZ8jRJ87g6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4575
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwu
Y29tPg0KDQoNCk9uIFRodSwgMjAyMy0wMi0wMiBhdCAxNzoxMCAtMDgwMCwgSGFycmlzb24sIEpv
aG4gQyB3cm90ZToNCj4gRnJvbTogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVs
LmNvbT4NCj4gDQo+IEVycm9yIGNhcHR1cmVzIGFyZSB0YWdnZWQgd2l0aCBhbiAnZWNvZGUnLiBU
aGlzIGlzIGEgcHNlZHVvLXVuaXF1ZSBtYWdpYw0KPiBudW1iZXIgdGhhdCBpcyBtZWFudCB0byBk
aXN0aW5ndWlzaCBzaW1pbGFyIHNlZW1pbmcgYnVncyB3aXRoDQo+IGRpZmZlcmVudCB1bmRlcmx5
aW5nIHNpZ25hdHVyZXMuIEl0IGlzIGEgY29tYmluYXRpb24gb2YgdHdvIHJpbmcgc3RhdGUNCj4g
cmVnaXN0ZXJzLiBVbmZvcnR1bmF0ZWx5LCB0aGUgcmVnaXN0ZXIgc3RhdGUgYmVpbmcgdXNlZCBp
cyBvbmx5IHZhbGlkDQo+IGluIGV4ZWNsaXN0IG1vZGUuIEluIEd1QyBtb2RlLCB0aGUgcmVnaXN0
ZXIgc3RhdGUgZXhpc3RzIGluIGEgc2VwYXJhdGUNCj4gbGlzdCBvZiBhcmJpdHJhcnkgcmVnaXN0
ZXIgYWRkcmVzcy92YWx1ZSBwYWlycyByYXRoZXIgdGhhbiB0aGUgbmFtZWQNCj4gZW50cnkgc3Ry
dWN0dXJlLiBTbywgc2VhcmNoIHRocm91Z2ggdGhhdCBsaXN0IHRvIGZpbmQgdGhlIHR3byBleGNp
dGluZw0KPiByZWdpc3RlcnMgYW5kIGNvcHkgdGhlbSBvdmVyIHRvIHRoZSBzdHJ1Y3R1cmUncyBu
YW1lZCBtZW1iZXJzLg0KPiANCj4gdjI6IGlmIGVsc2UgaWYgaW5zdGVhZCBvZiBpZiBpZiAoQWxh
bikNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJ
bnRlbC5jb20+DQo+IEZpeGVzOiBhNmYwZjljZjMzMGEgKCJkcm0vaTkxNS9ndWM6IFBsdW1iIEd1
Qy1jYXB0dXJlIGludG8gZ3B1X2NvcmVkdW1wIikNCj4gQ2M6IEFsYW4gUHJldmluIDxhbGFuLnBy
ZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KPiBDYzogVW1lc2ggTmVybGlnZSBSYW1hcHBh
IDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFAaW50ZWwuY29tPg0KPiBDYzogTHVjYXMgRGUgTWFyY2hp
IDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1
bGFAbGludXguaW50ZWwuY29tPg0KPiBDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGlu
ZW5AbGludXguaW50ZWwuY29tPg0KPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50
ZWwuY29tPg0KPiBDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGxpbnV4LmludGVs
LmNvbT4NCj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IENj
OiBBcmF2aW5kIElkZGFtc2V0dHkgPGFyYXZpbmQuaWRkYW1zZXR0eUBpbnRlbC5jb20+DQo+IENj
OiBNaWNoYWVsIENoZW5nIDxtaWNoYWVsLmNoZW5nQGludGVsLmNvbT4NCj4gQ2M6IE1hdHRoZXcg
QnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiBDYzogQnJ1Y2UgQ2hhbmcgPHl1LmJy
dWNlLmNoYW5nQGludGVsLmNvbT4NCj4gQ2M6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmll
bGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IENjOiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcu
YXVsZEBpbnRlbC5jb20+DQo+IC0tLQ0KPiANCg0KYWxhbjpzbmlwDQo=
