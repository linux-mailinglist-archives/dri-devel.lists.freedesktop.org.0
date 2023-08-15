Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A2677D2FA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 21:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E0810E26D;
	Tue, 15 Aug 2023 19:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BAA10E260;
 Tue, 15 Aug 2023 19:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692126499; x=1723662499;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pcOk16Rsdf2IdFmKi5nbK2mCt+4la7FFKyte+DyHDDA=;
 b=dqCYjP6zr5C7VopSlZofdNr1JGWTdWOhc3V2WbfnY4HSIlzpIckBDygv
 G5Q8/h6vYfpXNcvvWOYJFMOadTj3Sh+Qdgd+qII2hqBApE9+3llzCuEYm
 J3k4Q0uQ2QdtbZUjc7I6J2hShjo38jImlIsTFKy4CqM2B7J0WpgbdvbU+
 NQhGi7/pptTzxAJGMF24Zru7e69Lkb6r6cCwNX2Uwk7AFv2nt6RaOCjt8
 3uZM7XANZw8P6aRsOKMFHeMHR24rEm6B7c9DBLvFZQyb2vNoc8vq2I9Ax
 5W1UCst+9kXO046vHubLJ/5iGl3uqDPycvGwoxPZNSfqKz3xgcJq6PhIl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436251281"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="436251281"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 12:08:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="980443090"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="980443090"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 15 Aug 2023 12:08:18 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 12:08:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 12:08:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 12:08:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwTAN0/hXjD65cQ3H9P9eXzl6CptxmwRIGJBf/K+PhI7fG+C2G6Y6C72+gYDJJt9CFuUdY+JZgN4RyjePtskTt1QAcqObsuntHdkuwajgcjbUCcllFg8Iojh5g5iMXrD1RzAabMWqBLuu7jviiOcAVYlo9it0tbTS3LdrQug8aotIca4X/YOo+/OVDXrfVy6liuq9lHO/3yRJKG2GWjTpriHmD8hRudxYiAyO0ojqhQurLaSr3ZcyUHve3Cfas+WERygJEE1SXc+J9AUd8QvoHJr4hvDVe2RQNfJ7OsC8LdprgAPB10B/c5TKixFF7RY3f5zTRDfHEtYmp5crDwX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcOk16Rsdf2IdFmKi5nbK2mCt+4la7FFKyte+DyHDDA=;
 b=fRy+e1sny9TWbM8d7R67QoTJqiuiQyZSAMSUVPrNKukqsJkvvQQxr3aClu2M8w2sjzd4IdPuvKal7xPrr46yI6+Fb4Nb9lg/k8JkZ6tQt1EluzfyfD1ETjE4ULlpNfTPKTPuCLnt862dpgW+q9FIfUaLlQArCTTxkWvWIAYCpX9pGQFa7o59ZawTsc4quhBBbd8aP1wUDVbkLrh5hV9KuamsiXGo/tRyjjwhV4ZJmGW8G+i9TIZufWpYbGujNxZ4ZKKaFNypyw5ZuhzhM6ctaHO2iXPnf2WFPs1hYqg0AsWHm4RL5nW30soP72PHvU3XzukdWwa+EThBP/VJ3AdVgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MW5PR11MB5883.namprd11.prod.outlook.com (2603:10b6:303:19f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 19:08:15 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 19:08:15 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 2/3] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Topic: [PATCH v2 2/3] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Index: AQHZzxWOM6RDYlL2zU2EXxVkEb9vJ6/rYksAgABXNoA=
Date: Tue, 15 Aug 2023 19:08:15 +0000
Message-ID: <c890d7338f2c30818d313b34a02eee1ba0842261.camel@intel.com>
References: <20230815011210.1188379-1-alan.previn.teres.alexis@intel.com>
 <20230815011210.1188379-3-alan.previn.teres.alexis@intel.com>
 <ZNuD9JdmoYhYJ+G5@intel.com>
In-Reply-To: <ZNuD9JdmoYhYJ+G5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MW5PR11MB5883:EE_
x-ms-office365-filtering-correlation-id: 04e3f4df-70d1-459c-f17c-08db9dc2fa91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +9WHoQv2KOXKmYFDY9r5gjjdpSj7bTRts97tKeju0LboovoWyVuXF1cVo/L1BX0VcG4uQilScRmNR/6lb/WhFWUFGhZpaFKi8G5Ksx8CoUTEyHQdrkF0cmku70GOvgqu4KKFMrleRDGJG1A2cj0/1h6LLNrcbIYKeH9+0uf3w7nQaCi7a6GCNXkQfg9+2fMXk0otV/N5RMIXWCahIc+aAg0azKH7tms/FE4FmL7D0h36S7TdHmYANW7VDQRG1NeX+PZgRFdEPHimmDlCwkT/l4wNa6+tQaT/bnarsM00VII8D0nYaqudXua6Bcb371vEsj6/bELibR5zG8BYu6NPzm0+1YhIEbh/ux/RvJ4+BAxKAzJNRTyZxNkicfsJRY2+MgVwOdc3gFc0dpLQuuEEl1olS+OiffZaqbv0zDSI5hZ8YCdvci8FMzY9hrm88v5jHhdZCElNiG9soqZGYtwr4N2oYb1jnOL3v2XjvXCfZ9l9ZJEO8MS6Nytf8shJ2xsgfy5dttV0QPfA/DG5WM+ymP3lrDXxHO3X+UZ0MO4+gqJToPgtdhZMx5SPRttBtIrJoY9tJHN1Kr395Cayz8buGBDzhF9aT5ty6HdMXPHioEXXD7avv8rXaetzYpBOHYTP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(346002)(396003)(136003)(451199024)(1800799009)(186009)(107886003)(316002)(8936002)(6862004)(4326008)(450100002)(5660300002)(6636002)(66556008)(86362001)(6506007)(2906002)(83380400001)(38100700002)(76116006)(82960400001)(38070700005)(66446008)(64756008)(2616005)(41300700001)(66476007)(54906003)(8676002)(91956017)(122000001)(36756003)(37006003)(478600001)(71200400001)(6486002)(6512007)(26005)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGI5RTZYcTZlTlVORThTY3JNdkdYemNCVitSZEoydnRDd29UcEtmWElXL1BB?=
 =?utf-8?B?NjlacVJwK2V0KzJYbGNVWExRcHV6MTVXc1ltQ1ZuNUt4bm82eTRyRUFnSGR4?=
 =?utf-8?B?RTBrbTNWQmxUcWl4OG5uSWNpWk9FckZmQTZqcHVIb1RhS0tKTTRXWGswMk1x?=
 =?utf-8?B?di84MUY0U1g1L3RScGFPTkFJeVJnakU3bFA5TVhlMGZ3ejFZdU1STFJ5bGsv?=
 =?utf-8?B?eFVJNHU3RGNoRG1iaEJMNVIwNEhmdTNCemo0VitBS2IrQ0lST2cwS3Z0SnA4?=
 =?utf-8?B?L1hRL2Vyc3VrS0l4cDJsdCs5anFobWgrZllkUlNNejhwUnBlOUtDSlNlcGg5?=
 =?utf-8?B?cnNkcXhZNE94Y3plWTAvZkJZS01sd09FMGdURVNnNmh3czROa0gxdW1neWF6?=
 =?utf-8?B?U29UNXNNSXNCNUEwSzRFQUZyZWpJbTZPeTk4TFRmTGdQQ3pmb3h5NXBsL25B?=
 =?utf-8?B?N3hMNzVKNGNpdk85UWF4cjA0WDZlcjJRdG1WY3pJcVY3ZERraGFVdnhPNlZZ?=
 =?utf-8?B?ckVnUHg5ZVYwNHVZbVhiOUpJV2JDaldOei9sUXJJOHd5ME9HRjJEVmgvMXBy?=
 =?utf-8?B?cXNZQm9MOUNvWmozaFpzcjlCUGVBTmZmOENEaC80aG5zL1ZlZGV4MGJHYTlo?=
 =?utf-8?B?dXIya3FpSmNFTEh2VWVGeGJvOGYvaVNPVlRETXZnRXAwRDRhT3ZKYWg5TTJG?=
 =?utf-8?B?TG9rNG5PUVc1MjIxeFhUU3IwbGIwb2oxWnBPMWdMdEE5NlhhN1VhcVAvQWlP?=
 =?utf-8?B?WWRuang5RTN1eno1Z2VMY0pjVUsxcEtNbDg5eUxFUGt2R0RIbGVPM3k3dThz?=
 =?utf-8?B?cXVXRnJXaC9heTc3NGVoU0tDZ1k3SWgzZTJCenhrUUNPWjhLcmhEQmhpcEF1?=
 =?utf-8?B?U0swNlVrT09jQjYzOC8xUGVjNlVUMDB2NTJuemtockxURzd6TzZ3T3ViQllH?=
 =?utf-8?B?V1YrVU1EZWIvdld1akc3anNVZW5UaG9YZmJhaEtyRUdCaXd1a3R6Yk9qRU1j?=
 =?utf-8?B?RnJaOTQ1V01nZkoraTRlVXNkWFVBalZKNFRJR0c1OXUxNHRBazJ1VTFGUE5I?=
 =?utf-8?B?b2xwTDZCMGVyN3Nja2VGa0luTTNHVFFuZUlwSkxaNGw4MkpnY3lNbktnd3kx?=
 =?utf-8?B?TitoNjFlNGg5clFPOSs1MUhTeGduQXl2b1lDRUJ5Tis1ZVNHbVhUdUMrQXNw?=
 =?utf-8?B?QXgrRFlEZEREZ1BMMzk4RGVUWmMyL2Y5SDFnMmpYejluK04rWjkyNXYvSzU3?=
 =?utf-8?B?VEp1T3JtdmRacTNqYS9uYThZME1Xb2hod2ZLZk1jclgzUkpZSVYvMXZDYmIr?=
 =?utf-8?B?VjdIRUcvb0YwelZ0VnhLeGl5UEdrOEVwZHRkbkttcjkvaFRXanN3bUNyNVJV?=
 =?utf-8?B?VEhjaVhpNnd3UEdOQkxEY0FjUjF6L0JCUWRUbk1ucDBiT0dsNHk0eEVYelA2?=
 =?utf-8?B?OHk3YXlaRXBmVm1OemlKbzlDazB0WURHTDgxS2o0NGxwbU5la0pyRGxDR0s0?=
 =?utf-8?B?LytCQ1RreXY0UlBQTWVqWHJJWkVkNXlQYXE0ZjJEc09TUUpFMkxFV0FVN1Jh?=
 =?utf-8?B?SmJSb0s3bmZqKzRDSlFPR0ZxMENweDRMaW1SSTNLZlBaMkYrUG5qMUFCTzFH?=
 =?utf-8?B?WW5hRHZYZDhSd2hNK2xFL0NTQWVTeGJaRzlheEZsT3ZqVEtkdE13NFUyYi9k?=
 =?utf-8?B?SkxZd21PNjFvWGxYUFhYc0pmSGRNdXFXN0J0eXh4RkZKSFlNQkJYM0IwMkRs?=
 =?utf-8?B?Qmd5OWJvSUlhMXpNMDhoelRnNzc0aDlGVUV5bkFGOEoxaEh1aEtRdDB1WmRl?=
 =?utf-8?B?NktOWW00ejdiMU5sQUJ6Lzg1UDJtemJYUnhGN1dTMGJza0lMclpyOWpyMFdu?=
 =?utf-8?B?QmluTjhQaVQ4Sng4RHRyR3BZT3Q4WnlQUDZUVkJ0b2U1KzFEWUczWHpVa1dj?=
 =?utf-8?B?Mi8xcXo4THI3NkRyTENWanVyYVVyZndrVXhBUDNzTHNOZkkyaW1uODZhTE84?=
 =?utf-8?B?Q3lLRW9ZUWlxSG1SMVdiQm5IdDh2RjluZzNsa2o2UkdVVS9sK0tFeEU1em9N?=
 =?utf-8?B?SmhoLzA5cmVYdFg1cUd5MlByanFhYTVBaG9Ud25MeXNmWDJvbFJHai9MK0tn?=
 =?utf-8?B?QmQ4UDdEWXdHSmlRai9Bc212UFZRMDgxb2VxcFRqWDVmckZPbE9PaUl6RDR4?=
 =?utf-8?Q?5pOZLdzAe4Phu6ZGPDumMDo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC37CE603DC57944B5E61D75DBECE3F7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e3f4df-70d1-459c-f17c-08db9dc2fa91
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 19:08:15.5599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PaMl+bqBDegPkoI5wt7KfROg7G4ChG4TfMeWKkMA862NQNK00n3SXdVKrVgSkHc4PRidTi8XJYE8n7en68j6UT4sS89TQAKrG3NssGYLZO49buXPvayymPAbvkkvmmqC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5883
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
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA4LTE1IGF0IDA5OjU2IC0wNDAwLCBWaXZpLCBSb2RyaWdvIHdyb3RlOg0K
PiBPbiBNb24sIEF1ZyAxNCwgMjAyMyBhdCAwNjoxMjowOVBNIC0wNzAwLCBBbGFuIFByZXZpbiB3
cm90ZToNCj4gPiBJZiB3ZSBhcmUgYXQgdGhlIGVuZCBvZiBzdXNwZW5kIG9yIHZlcnkgZWFybHkg
aW4gcmVzdW1lDQo+ID4gaXRzIHBvc3NpYmxlIGFuIGFzeW5jIGZlbmNlIHNpZ25hbCBjb3VsZCBs
ZWFkIHVzIHRvIHRoZQ0KPiA+IGV4ZWN1dGlvbiBvZiB0aGUgY29udGV4dCBkZXN0cnVjdGlvbiB3
b3JrZXIgKGFmdGVyIHRoZQ0KPiA+IHByaW9yIHdvcmtlciBmbHVzaCkuDQoNCltzbmlwXQ0KPiAN
Cj4gPiBAQCAtMzE5OSwxMCArMzIwNiwyMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZ3VjX2xyY19k
ZXNjX3VucGluKHN0cnVjdCBpbnRlbF9jb250ZXh0ICpjZSkNCj4gPiAgCWlmICh1bmxpa2VseShk
aXNhYmxlZCkpIHsNCj4gPiAgCQlyZWxlYXNlX2d1Y19pZChndWMsIGNlKTsNCj4gPiAgCQlfX2d1
Y19jb250ZXh0X2Rlc3Ryb3koY2UpOw0KPiA+IC0JCXJldHVybjsNCj4gPiArCQlyZXR1cm4gMDsN
Cj4gPiArCX0NCj4gPiArDQo+ID4gKwlpZiAoZGVyZWdpc3Rlcl9jb250ZXh0KGNlLCBjZS0+Z3Vj
X2lkLmlkKSkgew0KPiA+ICsJCS8qIFNlYWwgcmFjZSB3aXRoIGNvbmN1cnJlbnQgc3VzcGVuZCBi
eSB1bnJvbGxpbmcgKi8NCj4gPiArCQlzcGluX2xvY2tfaXJxc2F2ZSgmY2UtPmd1Y19zdGF0ZS5s
b2NrLCBmbGFncyk7DQo+ID4gKwkJc2V0X2NvbnRleHRfcmVnaXN0ZXJlZChjZSk7DQo+ID4gKwkJ
Y2xyX2NvbnRleHRfZGVzdHJveWVkKGNlKTsNCj4gPiArCQlpbnRlbF9ndF9wbV9wdXQoZ3QpOw0K
PiANCj4gaG93IHN1cmUgd2UgYXJlIHRoaXMgaXMgbm90IGNhbGxpbmcgdW5iYWxhbmNlZCBwdXRz
Pw0KYWxhbjogaW4gdGhpcyBmdW5jdGlvbiAoZ3VjX2xyY19kZXNjX3VucGluKSwgdGhlIHN1bW1h
cml6ZWQgZmxvdyBpczoNCg0KCWNoZWNrLXN0YXR1cy1zdHVmZg0KCWlmIGd1Yy1pcy1ub3QtZGlz
YWJsZWQsIHRha2UtcG0sIGNoYW5nZSBjdHgtc3RhdGUtYml0cw0KCVtpbXBsaWVkIGVsc2VdIGlm
IGd1Yy1pcy1kaXNhYmxlZCwgc2N1Yi1jdHggYW5kIHJldHVybg0KCQ0KdGh1cyBkZXJpZ3N0ZXJf
Y29udGV4dCBpcyBvbmx5IGNhbGxlZCBpZiB3ZSBkaWRudCBleGl0LCBpLmUuIHdoZW4gZ3VjLWlz
LW5vdC1kaXNhYmxlZCwgaS5lLiBhZnRlciB0aGUgcG0gd2FzIHRha2VuLg0KPiBjb3VsZCB3ZSB3
cmFwIHRoaXMgaW4gc29tZSBleGlzdGVudCBmdW5jdGlvbiB0byBtYWtlIHRoaXMgY2xlYXI/DQph
bGFuOiB5ZWFoIC0gbm90IHNvIHJlYWRpYmxlIGFzIGl0IG5vdyAtIGxldCBtZSB0d2VhayB0aGlz
IGZ1bmN0aW9uIGFuZCBtYWtlIGl0IGNsZWFuZXINCg0KPiANCj4gPiArCQlzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZjZS0+Z3VjX3N0YXRlLmxvY2ssIGZsYWdzKTsNCj4gPiArCQlyZXR1cm4gLUVO
T0RFVjsNCj4gPiAgCX0NCj4gPiAgDQo+ID4gLQlkZXJlZ2lzdGVyX2NvbnRleHQoY2UsIGNlLT5n
dWNfaWQuaWQpOw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gIH0NCg0K
