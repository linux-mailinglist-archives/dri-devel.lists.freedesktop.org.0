Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BBF7A280A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 22:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6013610E678;
	Fri, 15 Sep 2023 20:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B310210E678;
 Fri, 15 Sep 2023 20:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694809556; x=1726345556;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=o5MwuDt0rNg5i3u1D9yrpnoCAEBn1HnY9qHXyXyT16I=;
 b=JA8wjE+vzoHI1RmzbcnnI8LOUxOxLpJ/jNQC8AbpcvzJv3fZM/VRE/IJ
 MICyR1ILzUePWe1Peob2BtL2YpOdOYTIjRUhWlUhLRldBvS/8W5bNSaDh
 jqVf6flt9BOfPeBmPCT+Yuj/zAnfRyFQpwiRLgOert1Pjyaa/SV3+YfKn
 EuHQEquvWq3ItuVnnhZJUkupZQm/awNTgt2M91uLxcDQgI3pnt3nZ2u4O
 2M02xK1b0R8tA42kDBCG8G542jZXTr3afzlwzdhXpDQ3rD7rdKQ2HaxOw
 HaXb4KG9XrkaNL9W/MKXRfF1r350Ig9NR+W3LAZoOzSKI9STf3MgOiFgz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="465695030"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="465695030"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 13:25:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="780223283"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="780223283"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Sep 2023 13:25:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 13:25:55 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 13:25:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 15 Sep 2023 13:25:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 15 Sep 2023 13:25:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qlw6O1hOvxg6dyNLWu4HqU8tyWg5t3fIPmJrE9grtwSmKGGKhIoev9eBd7qCnE2fh4AUINKklO1FEUuxPNLvyd4qmN40BepzIvc5ZBfNbbn5DMHjZkb85WQqAUbvOXlPIHAbZ1zjGznHZr1R/wCmO1z9Oc49fi3xMezoTKi1YfvmjrRnQcgEBAEK+8y1Eh6VxLM0nqOHXDRPgmHvyIdELeXwojABpqm59ZGj6VqybrQfsjX0D1aw2du9DOTkbI9clXw2QhyOTXsL35IDwvQgLOvZP9TRrfuZ+NsLzgGv2RUsUzsONajNl1S0xWFX8HwyHcujnhgA5+Apuz6Bj05wWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5MwuDt0rNg5i3u1D9yrpnoCAEBn1HnY9qHXyXyT16I=;
 b=V8hDDpiwyrWHnZUki2k5is8mbw+ROO5j7ZWvSC4q2Tm1NII7uBU0ZNWvDbNIA++U39lgwXN++ZQAqgsqpNoS/pK6YAkr+bCrT7epFbdVqmf6qBPyPOeINaOg7Mmkg/m8WX97VXXl5v8e+YieucxeBMfxxFEGzC3cDK4b5kTD2DQKpsdAVPDMVWFCgHWc3Cf4vj3WVs0Ng21HbLpNLgL+UmbnLtIHBhAjTpFRZSZF71YeQFJ5/MDkU5mnZ5DKOx7bbaayhE8xAuj5mIfF9UumASPurS+F4XNLgcvyGgp04q4zCwWhHpw+9DCkPEakgrPRubwAOEgzApbXcxeUsa7L0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CO1PR11MB4897.namprd11.prod.outlook.com (2603:10b6:303:97::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.21; Fri, 15 Sep 2023 20:25:45 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6792.021; Fri, 15 Sep 2023
 20:25:45 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/i915/pxp: Add drm_dbgs for critical PXP events.
Thread-Topic: [PATCH v3] drm/i915/pxp: Add drm_dbgs for critical PXP events.
Thread-Index: AQHZ6BFdd02CfzSLaE2Z8n1GBNH8l7AcVXgA
Date: Fri, 15 Sep 2023 20:25:45 +0000
Message-ID: <58a5d6827da2935f905eadf11804802b47994eac.camel@intel.com>
References: <20230915201515.1238771-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230915201515.1238771-1-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CO1PR11MB4897:EE_
x-ms-office365-filtering-correlation-id: 4212ac43-b14e-4b74-74c0-08dbb629f10f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hT2L+PxubaC0FfsX+xTxaH0CW0RuzevQMKEM4hiEYFkDCDyaSFGjxm5W3+1sjBmQZS2zpuCVRLq4MfyTvatvScGprhCwxHAk72Kd9FaEUsoMoOrKDhwfi/pMhc/M8mwA7h/o8j2ekiGM0HloE/kfWNP4qJhAFxjDaY5wfmWcQB3jkdKE8Im9CM6WEelaC8p9sOWrGvTR6nI0HOwqJqexPzICb4WzE5qrdj98j9BCCa3aJRmXTK8RuZTbICOXvb7IwsLEdONkVu8n0+0qEJzmzGguNJShK+bQeqJoztLVTZvqzh3xX0SUpvsdevY4x6bHSGlKd3L6EVLCBJoJ5b8m/V9GsM4ibjeMWgB3FfyFSUY2p4qw2VQzIVm3IGruJ2TbCWpbUNdtnL3HzGbwtFTUw0IVOyIUsQuZVVKNYluzDSmGa2vZt4tZPwB961+1Bdu5q7kZMzxhYTGbocOqzHaiy0vSVcTbIJqJ2cRkS/8cwzQOa7toMFA/0TlB8nFXoNnFCcDbN3HldUvTvD8594No9BwZq7hnWCR+4rgcCEZZBt52CZ+tHTaQpaVGnC3zGLQtZRuaDnBaxiw27omdXCzkppoRSlcoGi/4jVPkK+FCT/0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(346002)(366004)(136003)(186009)(451199024)(1800799009)(478600001)(966005)(4326008)(8676002)(8936002)(6916009)(316002)(54906003)(64756008)(91956017)(66476007)(66556008)(66446008)(66946007)(76116006)(36756003)(450100002)(5660300002)(71200400001)(41300700001)(2906002)(86362001)(122000001)(26005)(107886003)(38070700005)(38100700002)(2616005)(4744005)(82960400001)(6512007)(6486002)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZCtvV3E1VVBxbkw0NmIvNjRwTHdOSnArdXUzQ1F3MjlOMklVL3gySUJXYmZ5?=
 =?utf-8?B?TVhsSDFRenZlL3V3N1RTTHkyN3NJZXkxVmNPWlhYYnMxTVNON2ZQYjJNVlE3?=
 =?utf-8?B?aWk3ZU1EdVkrNGRBVWliYWZKREZDL0o0eEp3Yks1cC9mNmpEZVVHQmVpN1dD?=
 =?utf-8?B?SWdiaHhqK2w2RFFlWGkrTFdzQVdmVks5dzc4MkNwWnl2ZEg0MFhOK0p2NGZM?=
 =?utf-8?B?eXlJN0RZckRqc3RrREhoZW5SNlJaU1daVnh6ZXpNUDVKWUtXUTU3ZWVtQ0M5?=
 =?utf-8?B?dW54MnpxajllWmQwZS8zU1B3M0tLY0ljYnlmWmo2b2RpK05ISTRqQkZ6a1lW?=
 =?utf-8?B?MUZIeFhQRXZDMzFjTHVqemEzQUdNT2hYWXVLOVJDVmhLRVd0SEVjK2hnd1NR?=
 =?utf-8?B?SldFak1TNitIME1qU2xmUHhJOEhDWFZYZWJSM21CSkh1eHN5OU9hbU5sV0lM?=
 =?utf-8?B?VDhIWFhoaUZKbi9kc0RTbTQ1cWZlZloxNVpKUm9JN0VBWWF1SGF5ZC9FOHln?=
 =?utf-8?B?MW5LZzF2eThzeTd1L0RDdnZvbUJsWS94QkJjOHNUVHpaM1o0aFh1R3dKaENh?=
 =?utf-8?B?a0dkbCtRc2FwbEkxUXVtWmJuUThON05BOGtPTk40cmx2aSt3bTRSamlVS25Z?=
 =?utf-8?B?bmJsL1hnWHB4bzFCc0dEZUZLam53aUtna0dpMTl4WEVLRWxwY2UxV01aY0Vv?=
 =?utf-8?B?bFlSVWNqbTdFQkphV0E4akZHeE82QzVpWTc2UnJBVUNZc1ZiOEFGUmpaOTBD?=
 =?utf-8?B?d1RoeWJpT3dQOXFrMGhaeHg3NUhqM08wQ3M2MVIrTDJwNlkzWEZuOTk1dHBa?=
 =?utf-8?B?SkpiQnNaNk04SHB4SVY1eGJCRm12SWVORWoyRXBVYjN1T09QRDgrK2FXNU01?=
 =?utf-8?B?V2picUp0Q2V0U1JtZzdtNWdXaU5PQWg5VUhmUTErK05kMnRnV2hnK2hWaHZF?=
 =?utf-8?B?aVBJZmM5dEtGL1ZXcWRDYzVXbTUzVVhHbFc4cHQvVE9sYk9xckNnajVrYlcv?=
 =?utf-8?B?d2czRFRTeHRWT1BuaE9rQmRnZjhlSzdrOVdtNUFVeGJDSTRndU1SSkVkQzFH?=
 =?utf-8?B?MmdHdDlsbXU2NkROTFdOKzYveVlhYWhjTWZhTU1vcU0wVVNzdFROUmQvOXor?=
 =?utf-8?B?SlljTUFEZE5YVEx1dEhSTUdpSTdMVjUraUdiN2NXaFVObmsxVEFKV2MvUE9a?=
 =?utf-8?B?amt6L0gycjRnZ0o2Z2NuYkFGL0FyMUQ5UWZpWVlZK1YvS0xBWmIwcktFekNs?=
 =?utf-8?B?bWVkZXU4aEV1cUorY1FqUUhrTmZKU3FmRHlKUnorbGU5Nm5TWEcyWmRZZTUr?=
 =?utf-8?B?SDdJaGU3cElXQXFIZTJNY2NQQ3RMUncwM0FMMEVoVnU3NkVBWDdiNHl6OEo2?=
 =?utf-8?B?OHlBcWxIQ0xVVzlrV3BKTmZxekxkMnBWcnVKWStNUlBYclN2VWhPSlF5alZT?=
 =?utf-8?B?aDdVUzJmb1dUdXp5NkFOUkFLRk9nOHYxRmJ2NThPeWZQNkx0ZndwT0F0clE0?=
 =?utf-8?B?Tk1rVlY0S0RSYTQ0WEpiS0liV2ZBKzBxMHdBK3pMVGxSNjVhWVoxQ3NxMWV4?=
 =?utf-8?B?anBNSXIyMy9ZTm8rd1FUVktRVEZEa2tJWDAyMG5pNE90ZWFOWjZXREtuelQv?=
 =?utf-8?B?NTd4QWJwSG8zOEltYjVJQnZUcitwempGYTVyS1Y0TGhUYWJoVm9VcXlzallG?=
 =?utf-8?B?dTFOblA5WVp4cGY1cDVlWExOZkhBeGtVU0tHQ2VNS3RwY0FPUUtmRU80cXNr?=
 =?utf-8?B?eUVlcURqM3doczFTUFRCSFBqV3ZjM3MrblJWRlpwSlhXZlNic0gyYkZzM2pm?=
 =?utf-8?B?T0h4L0N2ODczd1pHQUpqY1Fscmo5NU1mQ2x3OW4vcFEzYWx2RFNNY0ZlN2Yz?=
 =?utf-8?B?d1llTmEvNUZ4S2M3ZnF6VjhGTVcxbkM1R3paTk1WZnFSQ3pTVVdkckF4OVJB?=
 =?utf-8?B?VUhGL09lK1BWSEZmOUFta052QTdpeEVEbDZJMXlCbzYwMzRHME44aU9DaEJz?=
 =?utf-8?B?cEJTd0dqRmtiL1ZPb0xURUNud1J3VU9LQ1pxdy9pR09CS05tcE9vaHVta3E3?=
 =?utf-8?B?KzVycisyK1RaU2lLL05WZVNWR3ltd2U2Vjhtai9iNTZTdEhvWWdMaUhYNlE1?=
 =?utf-8?B?ZVlpdTRJNkRYcitEbHVVMmF1aTdVTUI1TVVuT29QL2crT0w3TFUyb0ozUnJG?=
 =?utf-8?Q?duzDP9//aLH93DQfbW6dBAI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5428EC10DF4CA4C9D61BFB92A483FD5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4212ac43-b14e-4b74-74c0-08dbb629f10f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2023 20:25:45.6685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: evrrBFRNpqEVPqrUJxrbrvVIBBtz1eSeXQl+2ta2TJtXhq1F7KQHdhQPKKTQxSz+oTT6eOB56oaDcFgXrqANkkqE2G9l+de266DGEWKW+emy15Rxk3+KkM/EwqeJ7u7d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4897
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
Cc: "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA5LTE1IGF0IDEzOjE1IC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBEZWJ1Z2dpbmcgUFhQIGlzc3VlcyBjYW4ndCBldmVuIGJlZ2luIHdpdGhv
dXQgdW5kZXJzdGFuZGluZyBwcmVjZWRkaW5nDQo+IHNlcXVlbmNlIG9mIGltcG9ydGFudCBldmVu
dHMuIEFkZCBkcm1fZGJnIGludG8gdGhlIG1vc3QgaW1wb3J0YW50IFBYUCBldmVudHMuDQo+IA0K
PiAgdjMgOiAtIG1vdmUgZ3RfZGJnIHRvIGFmdGVyIG11dGV4IGJsb2NrIGluIGZ1bmN0aW9uDQo+
ICAgICAgICAgaTkxNV9nc2NfcHJveHlfY29tcG9uZW50X2JpbmQuIChWaXZhaWspDQo+ICB2MiA6
IC0gcmVtb3ZlIF9fZnVuY19fIHNpbmNlIGRybV9kYmcgY292ZXJzIHRoYXQgKEphbmkpLg0KPiAg
ICAgICAtIGFkZCB0aW1lb3V0IGRiZyBvZiB0aGUgcmVzdGFydCBmcm9tIGZyb250LWVuZCAoQWxh
bikuDQo+IA0KYWxhbjpzbmlwDQoNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMv
aW50ZWxfZ3NjX3Byb3h5LmMNCj4gQEAgLTMyMiw2ICszMjIsNyBAQCBzdGF0aWMgaW50IGk5MTVf
Z3NjX3Byb3h5X2NvbXBvbmVudF9iaW5kKHN0cnVjdCBkZXZpY2UgKmk5MTVfa2RldiwNCj4gIAln
c2MtPnByb3h5LmNvbXBvbmVudCA9IGRhdGE7DQo+ICAJZ3NjLT5wcm94eS5jb21wb25lbnQtPm1l
aV9kZXYgPSBtZWlfa2RldjsNCj4gIAltdXRleF91bmxvY2soJmdzYy0+cHJveHkubXV0ZXgpOw0K
PiArCWd0X2RiZyhndCwgIkdTQyBwcm94eSBtZWkgY29tcG9uZW50IGJvdW5kXG4iKTsNCg0KZm9y
Z290IHRvIGluY2x1ZGUgUkIgZnJvbSBWaXZhaWssIHBlciBjb25kaXRpb24gb2YgZml4aW5nIGFi
b3ZlIGh1bmssIGZyb20gcmV2MiBkcmktZGV2ZWwgaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMjMtU2VwdGVtYmVyLzQyMjg1OC5odG1sIDoNCg0KUmV2
aWV3ZWQtYnk6IEJhbGFzdWJyYXdtYW5pYW4sIFZpdmFpayA8dml2YWlrLmJhbGFzdWJyYXdtYW5p
YW4gYXQgaW50ZWwuY29tPiANCg==
