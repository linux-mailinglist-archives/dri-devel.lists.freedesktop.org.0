Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB707FE19B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 22:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11E210E67B;
	Wed, 29 Nov 2023 21:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C834E10E67B;
 Wed, 29 Nov 2023 21:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701292435; x=1732828435;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=EO2mat17HNHgKbIPSrD1ugvrUzSmoDXtnG92xRw9qM0=;
 b=D1O+ieT64erJvquU4MqELzk5iI6E25pMk8efuzEiYZ9pdY+TlX3E5Jpk
 TDNUM6v1iG77t8DaF9JRVP/2qsNCnYUY8eCRrhSp8xiLDRziKUeEd4Xpb
 LPI6XidZAq7RExbe3u7huyORvVEyEUSjMQUNKZj1ZhKYn4P6FtyEngsB3
 Id6hDjqLVvudf2j2/P6DldxHgfPb0YPremDxt26Al2aEy52wu1zp60T+S
 nI9scYoknVkTltSOUK9ESRdqmIKyo/VnCNU4zkQa88Vg+7qRsw7RZ0i7h
 Dpdf43Rs6iQiUizensgi04tSG7dNO6RS3oNy61sCuA90RBiYG5Vrgnnaw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="383623890"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="383623890"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 13:13:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745395541"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="745395541"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 13:13:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:13:54 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 13:13:54 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 13:13:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VH7Xs2pKHZda+cDFe4dH1CcECMfclk7qqjqK66BCgWciIAa/A3fkZQXi+K/6TpvdJdBCHqBRoPMKMjXajcPaZvw7kkl2srZYYkeZ3d7ncmHGr866tiTxkHuzJImFFaTIRcJtVmrAMZxEvrTNgwZEs+nGD+UYnj0oJlnq4WKSFl8cyX4ZXLixi6ywdJxirqo85Gzw6OgRhRWT7F3A+kXSNLP7Zq6wW0WwR9Yn1rJFk/0RqI4HdQoU3IS9uTs+7MvaDjkI2RBnJ7EHNNLO6rO9MCKDdDdTbtZhCw+BELRiKRIcld8wq8vCYJWbavErtoCyxtBSF7zIGdwvjyI/Eo2XaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EO2mat17HNHgKbIPSrD1ugvrUzSmoDXtnG92xRw9qM0=;
 b=FwQwqRBjSY6d390mIY7tSmyGnimQUfuqAEPkFRnMvkXKRbwJiUQKRqPeLJrpr4ARbx3lJLmcT42p+AbDzvKInLdF7f9ifeH9jZVIMZHWSFP8omlvM0nFVV1EOWHHvH9mx4oIiWUeIZp/Uwmm1RZ/cKNGSWy2zzmodYZDt1k5eqXLWmR+rU7rvM/otCiTHhtIos1eO0gTPU7rXqVRq5XzRnHSNGzwk6+tz4jOuaUvmd1SWlFh2uYOC2m+jGIgbc/FS92VzRsTU4zlCzfCx560FhVsqSOwdvIhRO7rIAZkSCKdzs0xNbTLq/6dt7UekLSi6gIFIQ9AMcsfxtSFUmhZiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MW3PR11MB4683.namprd11.prod.outlook.com (2603:10b6:303:5c::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.23; Wed, 29 Nov 2023 21:13:52 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:13:52 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/1] drm/i915/pxp: Add missing tag for Wa_14019159160
Thread-Topic: [PATCH v2 1/1] drm/i915/pxp: Add missing tag for Wa_14019159160
Thread-Index: AQHaHYK6hL0AgLMvsk6RiwIyyLCmr7COpH+AgAMyYQA=
Date: Wed, 29 Nov 2023 21:13:52 +0000
Message-ID: <c38b5486ed98e04ce2369a0dc29c14ab9c7d3961.camel@intel.com>
References: <20231122203003.65735-1-alan.previn.teres.alexis@intel.com>
 <ZWT7DeeS4svpw4PQ@intel.com>
In-Reply-To: <ZWT7DeeS4svpw4PQ@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MW3PR11MB4683:EE_
x-ms-office365-filtering-correlation-id: d19e54b5-ceb8-4463-c02e-08dbf1201699
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0i9E+GOUX9o9hdZg2lfKF8pUDl1st1luijutaG+22S3cYbBCqId5IaRQ7TCvJ1NldK7qXMmqyfyry9ob9V0RpmTOXFNqpjDSN9h8OV7Xpv7nLA01rhU15GDTAQuZUBEz/l75ft9a0ybEMnM6jAcCrwozjX9vSQQy/l16LsH84AZOMgO1ilS0e32vHJQLKzQXdoQgYNgBv0obTS2XE0mL9S2fCx68pluxhn8vrYCp37M55/B1nmhPEZS1b1MkO/RfZ1b8mmzf6bcyh48l6WByFztjduG2UJHsThodgxl2VjnUokmOHm2tHFXaidW1/qI4vVYkM/j6Ig32SRViFHGl10s9B+0T1S0e8EbyRWU8fe9JkzW7GA58IwVU3bv8XTZaf9plBtkmfFvfHqUDGVqcMD67R5RbgLQkrPWbbrfg2bXq5WXiEx4uzexTBHv0/fNHtsanhm4FgNap4Do+K05Q//8mhO8DArDyWML7rQfeWKry32XSPM9AVTZ/QxqjKz9ofE+WKD9heM0wHjhKgqof3DbDNmLI4qT5ii2VQn5WE56/7LXrEfbT2I585e/aZZL0wlWvhnMQQERa75XZml1OfCLbGagfro7WfXgVXpiUwNZlkqTQx0/AHnWww5Yyw8nSg7J/VNa5RILr9g5RWVxa3xRe/zIUqkIpsLL+bkA6tsw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(376002)(396003)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(6512007)(6506007)(6486002)(26005)(2616005)(478600001)(71200400001)(83380400001)(2906002)(4001150100001)(5660300002)(76116006)(91956017)(41300700001)(6636002)(64756008)(66446008)(66476007)(66556008)(66946007)(54906003)(8676002)(8936002)(6862004)(316002)(4326008)(37006003)(450100002)(38100700002)(122000001)(82960400001)(38070700009)(36756003)(86362001)(202311291699003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wkp5YUx6V3ZRM21MeGUrQzdMT1hvMS9SWTMwdFJUbWVuMTZweGxoRTdodGNE?=
 =?utf-8?B?V1d6dWo5WGk5dnExVk1iL3kyeHVFNVdjaDBxWWtmeFZQcktPQXMvaW5rT0RX?=
 =?utf-8?B?Tzh3NCtkelJoTFVITHZjOFhUQnJsRjdPY1RnWnV0dDhzeS9jK1BVWG1RZmx0?=
 =?utf-8?B?d0lVM1lWTEx4eW0wL0hBUi9jUllyR0l1RU16dDkyRFlNZ3lHSmdRRXp3bTdC?=
 =?utf-8?B?RW9objF0OEJ4eVlhYVpnMDlQemUyNVdWbjJUZVRYR1VReTFPMTBtTjdSUXJZ?=
 =?utf-8?B?SDVPN3RxVHhNMXIrKzNTcHNNM1MvUlRqZ0Y5c2N0dHl6eXNiWmFkSEJheVky?=
 =?utf-8?B?aWdmcVBWc3ZZd1d5NEIwOUNVa0RzMzIwQ2d2SWlYMTd0cUlBOXZKTlRQQ3Y2?=
 =?utf-8?B?YW9BRFpCUFRTelhYUkp1RjRMdW5CVzRlWGIrUDZaMmZ4NVNIQldNb0J1OWI5?=
 =?utf-8?B?WGN4eEFQVEJNRnR2VjdIRmhnYUNMbXdlMEluWmJXUU9WbmNFamduSVhBRmZr?=
 =?utf-8?B?M2R1T0Y1b0FibVRxeWJjZXh6TmFqMWJpVXM1aEtlSEwzY05nZldWa2pTSTZl?=
 =?utf-8?B?WDZiZFZBaXllQVlsdlUwMFpodS81bzhqOGV0ekxNellIU3duTkExVm96c1hP?=
 =?utf-8?B?VGdDNmlTMVgwaHh3ZjBwaVpPWXV6NXN3eXNqZFd1N2NPWVR4Z1RNMnZoUHZS?=
 =?utf-8?B?bHJFcU1zbHZIcFNrM3ArZHNYM3hoejgwczl1R0JJcEs0cWtlT1dnMFQxUHFo?=
 =?utf-8?B?OGpvZll0eDc5VklVZmZrTCtkOFdjVkNHdFNsMCtNeHozMHdITlI0YkdLcFoz?=
 =?utf-8?B?Y3FNaEg0ZEFDa1V0dzBweEY1YjRrcnRvTUVFcWovTDRBampHSTF2dlFSQjc2?=
 =?utf-8?B?KzRFZko3anA1ZjdUdCs1UG1mV1E4N005TU9NUXZ3d1lSQlRCbUFqeUNWams2?=
 =?utf-8?B?RmoxTXBubTBMaEV4alpvTHRtdlVPQVlObkg5ajYrRFdKL1pNQVp2d3VRTWw4?=
 =?utf-8?B?NzJua1J2SHRncVBzbDIyb1BacHJPdHdzQ2VjdDFhTWNvWER3WFZkcmlOL2cy?=
 =?utf-8?B?aXBycWZqU29jVWRUV3VyVC9TU1FyVTNWMjFVUmVhaW1oSWNUR0RMekhxT2lJ?=
 =?utf-8?B?Z2lJWWlGWlR2MjlyNFEvKzVYbWRFWVE5TlFzS0Ura2pIZVdObUo5d1ZqRXhW?=
 =?utf-8?B?WUsvem13UTFFV3ZNSUkzQkp2OXJ6eUFUY3AyUS8xTVlxeGVrZHBzdmxMZXZK?=
 =?utf-8?B?VFM2LzRhRUlUQzM1S1dnejFjbGQrNFpZaC9QT2w4T0wyUThCd0hleEtGMmo2?=
 =?utf-8?B?UUNZb0xzaWxkMnFjak1hcDF2RFdLVUtPR1dySzZTM1RRR2xjNUJCNDBrNmto?=
 =?utf-8?B?YWNZNW5sY1Irbk5jY09MTnpOOGh6dm0wL1RrMC9pUkd6b2M1QmxRamNzbGFE?=
 =?utf-8?B?RzRDVWkxYUpieG1xaUZzL3dEbzcxN0JWeEdMeHNUK2dZK2Faais0ekpNaTAv?=
 =?utf-8?B?ZmFiV01sVGdTQjFQa3Zwa1hWTjJvNSsxclpoVm5HSVNxQjRSWnBMTit1cVVW?=
 =?utf-8?B?QmJLU3JFWURBY1dCNmlKWjNJRTZ4Y0Z6S1Ywc2diSGFPazV0cEYwVjRPZk81?=
 =?utf-8?B?Y280Qkp0K0FUb0h5V0NEVCtiZ2JiSnpsM0MrNlJpQUNwdHhkZDNqRlp0clJj?=
 =?utf-8?B?TnRKQ1JSWG1xcTN2eFQ0eFFLRHZxUWpBdjF0NkcvK3UvOFkwOU9vN01Fanpk?=
 =?utf-8?B?SUJqa2ZBZmRJS3RrY3c1QnFUaTAzVWNJaEM4RkVLUXNnNVpvK0NKSENONktz?=
 =?utf-8?B?ZzF5eXcrTG82cGRiUnp3LzBnUVFkb1M4NlRFWTR1WDNpaEF3MDlzemlGNXFj?=
 =?utf-8?B?L2VtdUM1QUlCdDJLWVVsY3l0RGticnBYYmVkM3lJR2I5Yk8vdVVRU2tlUElD?=
 =?utf-8?B?QVVmQU16MTNtcmE1RVVmQWZqdjNJdU1zT1JGQnZmWW5tSHQwL1hvZ0ZNdWlj?=
 =?utf-8?B?UFJCT3Ixd0lRZ0p5MlZTeEp2czczdU1wYXN2V0g3RjQrTUZNNXd6UUZTT3JB?=
 =?utf-8?B?Rm91YnNYQmk3SmtFdXI5Tk5yODdXTDlKZkJCdmozUERvNlNRZXpuamU2UUFF?=
 =?utf-8?B?WkVYTHArQllNRThWejlFTTdNWmhTNGJFUDRPVGxCVys0VW5vQWFOQXhmUytF?=
 =?utf-8?Q?AJ+sPLIIGNeTGSLC/npRuAU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4115C01665FD9429DCB7B905A4CC870@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d19e54b5-ceb8-4463-c02e-08dbf1201699
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 21:13:52.2982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RJDGr+fs3XNGSuaNGmIn/fkGb+RE6hwtIXIz/Q+DSOBfjf+dOO0A88KQ1G2z/lM/Td+/HBmG+NE2yBsGmlDTpZK+5saj6qNHhPY2L8IWMmhRVshwnXs+jsOBhmd1exj2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4683
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTExLTI3IGF0IDE1OjI0IC0wNTAwLCBWaXZpLCBSb2RyaWdvIHdyb3RlOg0K
PiBPbiBXZWQsIE5vdiAyMiwgMjAyMyBhdCAxMjozMDowM1BNIC0wODAwLCBBbGFuIFByZXZpbiB3
cm90ZToNCmFsYW46c25pcA0KYWxhbjogdGhhbmtzIGZvciByZXZpZXdpbmcgYW5kIGFwb2xvZ2l6
ZSBmb3IgcmVwbHlpbmcgdG8gdGhpcyBsYXRlLg0KDQo+ID4gIAkvKg0KPiA+IC0JICogT24gTVRM
IGFuZCBuZXdlciBwbGF0Zm9ybXMsIHByb3RlY3RlZCBjb250ZXh0cyByZXF1aXJlIHNldHRpbmcN
Cj4gPiAtCSAqIHRoZSBMUkMgcnVuLWFsb25lIGJpdCBvciBlbHNlIHRoZSBlbmNyeXB0aW9uIHdp
bGwgbm90IGhhcHBlbi4NCj4gPiArCSAqIFdhXzE0MDE5MTU5MTYwIC0gQ2FzZSAyOiBtdGwNCj4g
PiArCSAqIE9uIHNvbWUgcGxhdGZvcm1zLCBwcm90ZWN0ZWQgY29udGV4dHMgcmVxdWlyZSBzZXR0
aW5nDQo+ID4gKwkgKiB0aGUgTFJDIHJ1bi1hbG9uZSBiaXQgb3IgZWxzZSB0aGUgZW5jcnlwdGlv
bi9kZWNyeXB0aW9uIHdpbGwgbm90IGhhcHBlbi4NCj4gPiArCSAqIE5PVEU6IENhc2UgMiBvbmx5
IGFwcGxpZXMgdG8gUFhQIHVzZS1jYXNlIG9mIHNhaWQgd29ya2Fyb3VuZC4NCj4gPiAgCSAqLw0K
PiANCj4gaG1tLCBpbnRlcmVzdGluZyBlbm91Z2gsIG9uIHRoZSB3YSBkZXNjcmlwdGlvbiBJIHJl
YWQgdGhhdCBpdCBpcyBpbmNvbXBsZXRlIGZvciBNVEwvQVJMDQo+IGFuZCBzb21ldGhpbmcgYWJv
dXQgYSBmdXNlIGJpdC4gV2Ugc2hvdWxkIHByb2JhYmx5IGNoYXNlIGZvciBzb21lIGNsYXJpZmlj
YXRpb24gaW4gdGhlDQo+IEhTRD8hDQphbGFuOiB5ZXMsIGkgd2VudCB0aHJvdWdoIHRoZSBIU0Qg
ZGVzY3JpcHRpb24gd2l0aCB0aGUgYXJjaGl0ZWN0IGFuZCB3ZSBib3RoIGhhZCBhZ3JlZWQgdGhh
dA0KdGhhdCBmcm9tIHRoZSBLTUQncyBwZXJzcGVjdGl2ZS4gQXQgdGhhdCB0aW1lLCB0aGUgY2hl
Y2tpbmcgb2YgdGhlIGZ1c2UgZnJvbSBLTUQncw0KY291bGQgYmUgb3B0aW1pemVkIG91dCBmb3Ig
Q2FzZS0yLVBYUDogaWYgdGhlIGZ1c2VzIHdhcyBzZXQgYSBjZXJ0YWluIHdheSwgS01EIGNhbiBz
a2lwIHNldHRpbmcNCnRoZSBiaXQgaW4gbHJjIGJlY2F1c2UgaHcgd2lsbCBlbmZvcmNlIHJ1bmFs
b25lIGluIHB4cCBtb2RlIGlycmVzcGVjdGl2ZSBvZiB3aGF0IEtNRCBkb2VzIGJ1dA0KaWYgZnVz
ZSB3YXMgd2FzIG5vdCBzZXQgdGhhdCB3YXkgS01EIG5lZWRlZCB0byBzZXQgdGhlIHJ1bmFsb25l
IGluIGxyYy4gU28gZm9yIGNhc2UyLCBpdHMgc2ltcGxlcg0KdG8ganVzdCB0dXJuIGl0IG9uIGFs
d2F5cyB3aGVuIHRoZSBjb250ZXh0IGlzIHByb3RlY3RlZC4gSG93ZXZlciwgdGhhdCBzYWlkLCBp
IHJlYWxpemVkIHRoZQ0Kd29yZGluZyBvZiB0aGUgSFNEcyBoYXZlIGNoYW5nZWQgc2luY2UgdGhl
IG9yaWdpbmFsIHBhdGNoIHdhcyBpbXBsZW1lbnRlZCBzbyBpIHdpbGwgcmVjbGFyaWZ5DQpvZmZs
aW5lIGFuZCByZXBseSBiYWNrLiBOT1RFOiBpIGJlbGlldmUgSm9obiBIYXJyaXNvbiBpcyB3b3Jr
aW5nIG9uIGNhc2UtMyB0aHJvdWdoIGENCnNlcGFyYXRlIHNlcmllcy4NCg0KPiANCj4gPiAtCWlm
IChHUkFQSElDU19WRVJfRlVMTChjZS0+ZW5naW5lLT5pOTE1KSA+PSBJUF9WRVIoMTIsIDcwKSAm
Jg0KPiA+IC0JICAgIChjZS0+ZW5naW5lLT5jbGFzcyA9PSBDT01QVVRFX0NMQVNTIHx8IGNlLT5l
bmdpbmUtPmNsYXNzID09IFJFTkRFUl9DTEFTUykpIHsNCj4gPiArCWlmIChJU19NRVRFT1JMQUtF
KGNlLT5lbmdpbmUtPmk5MTUpICYmIChjZS0+ZW5naW5lLT5jbGFzcyA9PSBDT01QVVRFX0NMQVNT
IHx8DQo+ID4gKwkJCQkJCWNlLT5lbmdpbmUtPmNsYXNzID09IFJFTkRFUl9DTEFTUykpIHsNCj4g
DQo+IFRoaXMgY2hlY2sgbm93IGV4Y2x1ZGVzIHRoZSBBUkwgd2l0aCB0aGUgc2FtZSBJUCwgbm8/
IQ0KYWxhbjogeWVhaCAtIHJlLXJldmVkIHRoaXMgcGFydCBqdXN0IG5vdy4NCj4gDQo+ID4gIAkJ
cmN1X3JlYWRfbG9jaygpOw0KPiA+ICAJCWdlbV9jdHggPSByY3VfZGVyZWZlcmVuY2UoY2UtPmdl
bV9jb250ZXh0KTsNCj4gPiAgCQlpZiAoZ2VtX2N0eCkNCj4gPiANCj4gPiBiYXNlLWNvbW1pdDog
NTQyOWQ1NWRlNzIzNTQ0ZGZjMDYzMGNmMzlkOTYzOTIwNTJiMjdhMQ0KPiA+IC0tIA0KPiA+IDIu
MzkuMA0KPiA+IA0KDQo=
