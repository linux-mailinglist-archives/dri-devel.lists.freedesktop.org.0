Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B75716EA089
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 02:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAAC10ED6A;
	Fri, 21 Apr 2023 00:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC6F10ED67;
 Fri, 21 Apr 2023 00:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682036250; x=1713572250;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9UCd6mZFBy6kada95WWAKS0S1g1Q1VLEurcDlT9JyHE=;
 b=g0pDTrRpUh1SmkXrLeRZJFtZi7vGSDAngj1mrmOkoC6PFg967XLjidMU
 Xh+xSGUl1wGcneSWxpxWwee/sxF84dH6gYhNcIew9gscyxFhMT/OAayU3
 /5UoL79PJvJPcOYauMTxafMjtMflGmAtYJn++JuwOkkNXhprGAs0yKWFa
 aSYtP8/uJfaGAUF8Fpi6dFH15BNmJzxAf7kZM0BaxST1cm2c5AZ04x00m
 xO7emt914Bo/kYl4g3eO3KZiubhnbkm1jB1VlrSrGVedPVFnQw1ix4bnn
 eB++4QSiCGLAE5TrAZRthZ8vF5ZOPOepk0BWzcJvEGng+L0LjEHWJtH5y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="411148080"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="411148080"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 17:17:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="642328405"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="642328405"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 20 Apr 2023 17:17:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 17:17:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 17:17:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 17:17:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 17:17:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9gBBo3BCarK24g4SpaVjOLdH9jAG4vZdmhsW4wWOOR2o7mCHsdbHGgHfcZZ7oP6YHCWifp9uxtXOUg7T4Mv+3g+zq+PoSCbPDi92Yi1zHNvwzcdblA4LsHVx7J0/8ettP5JWB18wMeadbu/w5EtxRrr6kWFfuPAaIfOP2OOi6SWIKk+yBIGRK6HTduN4z4UJ6b263qyUd8UajOQMK1HvYG6pWiptGv3kslF9Jixbk5q1sgOIJuD0cd09PTUjK4qBNKhDh+f1ncBSvDbBUYZyRXOzZxu0g+OzlHMSAOQ8Id6naXPS3Vv1mNiUB4tuDuf7gorEXZIQaecfeZToP8iBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UCd6mZFBy6kada95WWAKS0S1g1Q1VLEurcDlT9JyHE=;
 b=egKZU4fHtfBnuBbb4x0kn52UyZDLbUAYNcPC1t2i8GYAzR9mYKOfgNpJq+ZwTqKjydFWqz8DdnQDU5ERmVAbkZx/PFRUOFVnFod5O+d67FZJs70xcbdstF7ZnY9FI/t68KCtmwPsRbSUbQtQuiDhyTtfV8XksWvK//7OTDEiZu+4XM3EEhrbVSSSCyz77Zj03hBT1VnmB+fs1HZ1/nyoteizbSlyNqpgAjHu4RedzJtO3TuYargkj6zQPU05awMUlIai+TpDNQHy8JkgVzGQMHXyzbLJP0pxTJmK2P5gg2gTWn4TtvQ52VAZ/ztJ9Iyrq+l/W+Cxr1/yvZM7po4mTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.20; Fri, 21 Apr 2023 00:17:21 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%5]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 00:17:21 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/i915/gsc: add support for GSC proxy interrupt
Thread-Topic: [PATCH 4/4] drm/i915/gsc: add support for GSC proxy interrupt
Thread-Index: AQHZYl+KP3is+l5OyE2WmbED0vtIra80rOAAgAAZp4CAAEH9AA==
Date: Fri, 21 Apr 2023 00:17:21 +0000
Message-ID: <2999c2be4aff1915fedc64cf51f59cd711e1e322.camel@intel.com>
References: <20230329165658.2686549-1-daniele.ceraolospurio@intel.com>
 <20230329165658.2686549-5-daniele.ceraolospurio@intel.com>
 <ace7fa99ea2a38f605a3fe514ec39b372537a9a9.camel@intel.com>
 <6f30d4d4-f24e-00dd-8bad-c338ea6ed4dd@intel.com>
In-Reply-To: <6f30d4d4-f24e-00dd-8bad-c338ea6ed4dd@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CH3PR11MB7177:EE_
x-ms-office365-filtering-correlation-id: 699242c9-8b56-4f7d-f7fc-08db41fdc63a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r0Rit3f8e3qBsrPB6WwBv3c72C8M91BUaDf9vbT9cO1GZIa2tn2mks43ArnBKz2KfMMyDkQfuOnpo4Puo9Lcw9b2XMHPiRfIaIWVC2rOPiSugToRrvdy54p7SDnCXtHguE84qwbjnAfXl2dUyOnaPX2m0AbAq+0i1+97tV5CsCIQyxUPaWS1RcWp2LiQwYup9Drp+vGf7sQ1nEUwGyhv+bCGXkzSqccjijgZDvoDUAftB6APBlyPh7KLYsJgqQIV4inn90LEfPfdIJJi2fGiDITzoeeWSki75wcuUMDfnkHvUoFett/8EdbWBrc/erGFWNewo8NXa9cNiZaIs56vsYAE5ncigvu17ooh4vBHn2hK/u4VoHIYoJIJgjDXGAhWGHosLUi9glYTHtenfv3MbyWKrI3lMOMHyKfvfYFp7j80w3QPac7NlUo0lYSJsP/RBB+emU4MnwrJ+/YBgp94Qg4kMsS6I2UgPb2J0bhZaiBwl8c/NxXH8xtZkJK7ouaqyRM+i8wnyYFUtOaEj/HqVaI+k/BxjhZeXQx136hKWOP7n5MYD0fh/0qgiKoXZuZY/4Bhd3M2u1X5wFGx1Uz2jFVeZrhiSERyVw9Cmk2N5HLmxr0R627A88iOEdo1l8wh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(346002)(39860400002)(376002)(396003)(451199021)(2616005)(36756003)(186003)(478600001)(2906002)(6486002)(71200400001)(38070700005)(64756008)(110136005)(4326008)(82960400001)(66946007)(66556008)(91956017)(66476007)(76116006)(66446008)(8676002)(8936002)(316002)(38100700002)(122000001)(83380400001)(41300700001)(54906003)(5660300002)(6512007)(6506007)(26005)(53546011)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3l6VVY4WnBvUGJaOXozQjg2emhIU0ZELzVhb3RZSkFGOVFQZXhkZTljNitG?=
 =?utf-8?B?Q0lONDB1aW84TnRBK2MxdjQxeWlIbXh3QVZvcVcyMHJJVWdGQXpOTzBqbDhs?=
 =?utf-8?B?VzhOWW42U21ueERKZ1pOMHhxSWFGN2hLMEM4M09sUWRYVXNqSGwvWkJPRW9D?=
 =?utf-8?B?QklrNDk4WHlvOU1DL0dudHVRckhaalJ5WmF5NU5SOHJwZ3g5ZXA2T1lqWFNE?=
 =?utf-8?B?TzdpZGtSdFNnQ2h6UjlsMDNSTGg1ZVpXVUN0aHI5ekw3dDJjbVBBREVZblNX?=
 =?utf-8?B?STVGdXVYajdKdlhOa0ozK0NqTVAzL1lOSkJsc1lMUEsvVnpXcnA2NDRlK3p6?=
 =?utf-8?B?aHAxSHRCWWJtbFdRdTl2eTZWZjVvSG9rdzVSeEx0RWZrVmZZWHlRME1UNFVZ?=
 =?utf-8?B?YW1OaWo3RHVmQUp6RFVuMzdtRzJMRkkzU2ZMRExITkpIZmVNVzRxNWRqMEp5?=
 =?utf-8?B?V3RLOUJrMWNzZnJ1YXFKdEgyY3hJME1LNml4MzE1bWtkYjkrTXJLNDI3M1d1?=
 =?utf-8?B?VmNCU1BpNDNLRDFjTGVZN2lRdEFXK081dzBkQ0N5dzJ3UGFvU0pFU3VSTzlr?=
 =?utf-8?B?T2pmeXExZjZ0a216cG4rTEdSOHJuY3JTVk54dHlpSUs1NnFZYUxyajZvZ3or?=
 =?utf-8?B?bmlraitlc0hJdFdacTBseWFBaWZBTGQyRTNJVVUxZ2RROFRxSEQyOVo5dENM?=
 =?utf-8?B?YWFrS0hKNWZ3dVQyRDB1Q2wyZ3NwaUc3aUR1VE9PdEorVWhKWUlTMXZYMlp6?=
 =?utf-8?B?cEtuWVREdU1JSzNjQW1vaU5lK0NCczgycUF0TTBWMzNlU3hYUEhxU0piRGdv?=
 =?utf-8?B?YUpDUERkV3BWaEtFZHVoVzRjOUYvT21iVmIzZ3JOWTVLbHRYOHJRcEszT0Y4?=
 =?utf-8?B?Z0hxTWlRaUpHdEtDcHhmSGpBWStkNUY1U01yQ3FHS1Z6MXJFbkszYmFvcXZV?=
 =?utf-8?B?eTNRYml2WkU1Mng3dTVMWGg3ZmgrTUFyMGN0MG1ERmR1cFpBcHZaaHk3d0Y1?=
 =?utf-8?B?azZ0aXBXY1NTVFZYc2lsc1E1bkl0anZUQUMyWW40VU9ubHdSYUdZVnh6U1A3?=
 =?utf-8?B?NVFHSWt4NmF0TDRSQVJwNnN5ZFFwcmJsT2ZiUEJNTVh1VUQ1MUJMekZXclNa?=
 =?utf-8?B?UVRUb2tRZ08wbTFOR3gxWjBUc0ZTamU5Q1ROYVpSR2pjdkc1VXhBRmlpQU1H?=
 =?utf-8?B?b1liU281VUt2OU5WTHE0QmJicEpPZEU1UThrREpROU9USTljeTBWRWxZSE50?=
 =?utf-8?B?K0NJTC9BVlE3OTAzWFJEbnNmSDdqb1ZwbG9LRjdnRUQvenVWSktKQy9lcGY3?=
 =?utf-8?B?aTNGeXpmU25rV2dQMGIxZlNQbTloNzlkMHZ2SjJESGFkZFFYbzJES2taOFJZ?=
 =?utf-8?B?MGZ0dEdmanFOWU4wRWNEUlduUDk1QjhnckxCRjBkbjYxUnVxYllYSFpCanVx?=
 =?utf-8?B?UHMvM29YbXp4Mi9PS1ZYaFRCaWxnazljMDhsbVRDS0dTbUpxZVpNbjRqYklz?=
 =?utf-8?B?UmtmY25QTjZHamxUVmxrV1QwdEM1TG0rNENVdWhlNG40TWJlUWNHM3daYTBT?=
 =?utf-8?B?eHRWRzZ0UlpiclRoY0R1cU9FeHpicXd0eVVXREV1UjFtWWFlU1E5U1JvK1lQ?=
 =?utf-8?B?b0pNeUVqVW9idEFMNmRCUlVGK0JOOHR5VERwVjczWVJycFovK1hqTEc1STAr?=
 =?utf-8?B?VWJkQ2J2Z285MldkNEsrd01FaHJINDlaSWlvYXpjUVBscndJSS9sVU9mTTB4?=
 =?utf-8?B?WHZGcjdBTnVvQ2w1ZXlSWFRIYzNOSWZneElRcmpPdEFISE1CRVhmbkFIaG5n?=
 =?utf-8?B?cEJBOXdlTU9helhvTDQ3ZXFZdlZNVG1hZ1YvUEhST1E2ekR2R0V1K0tZR3Ja?=
 =?utf-8?B?OEd0cWlPL3liYUdsMnRWVTYrZE81U1VITUhhZzFIU3M4eGorVFhudGlyUFo3?=
 =?utf-8?B?R2xzKzh6MGRuNEw2Q2pzU1ErNXNHSjVuL0NBbmFlZ3F0UmxRQUE2QXBvVlp6?=
 =?utf-8?B?VHNiaVo4TFVTcGQxeUMwMXAvYk95QzQyZXhWSmEyUWlaYnp6WjkrNWJOVk12?=
 =?utf-8?B?Q1Z0bDN3UDJDNEoxbW51SE84REN0WDNZZ250dm5lTGdkeHdRMDYrWXNuTmRu?=
 =?utf-8?B?SGVtdnpBbzhEV3NSZ1VQU3ZuUnBuZ3BNRnlkb3UzZVBldTVRbjlvamhDcGg4?=
 =?utf-8?Q?qP4xCDISB4QHWzVvEkXBQGQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A93DBDF4129EE546AFD847BAAB90E8B0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 699242c9-8b56-4f7d-f7fc-08db41fdc63a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 00:17:21.0856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7U1vhmwXHPAJAm0j8uhb5K59L9LipqcQEutCtcGsLy1EfuQzATuyjwMEco6tPibWiqSX9dYZeFfenviyNDf2oNVjWsRZ4NQZVISvB8DZhIKPFgWZor6/b+vBBB5+GHws
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7177
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSB0aGluayB3ZSBhcmUgYWxzbyBib3R0b20taW5nIG9uIHRoZSBvcGVucyBmbyB0aGlzIHBhdGNo
IHRvbzoNCg0KDQpPbiBUaHUsIDIwMjMtMDQtMjAgYXQgMTM6MjEgLTA3MDAsIENlcmFvbG8gU3B1
cmlvLCBEYW5pZWxlIHdyb3RlOg0KPiBPbiA0LzIwLzIwMjMgMTE6NDkgQU0sIFRlcmVzIEFsZXhp
cywgQWxhbiBQcmV2aW4gd3JvdGU6DQo+ID4gT24gV2VkLCAyMDIzLTAzLTI5IGF0IDA5OjU2IC0w
NzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVsZSB3cm90ZToNCj4gPiA+IFRoZSBHU0Mgbm90aWZp
ZXMgdXMgb2YgYSBwcm94eSByZXF1ZXN0IHZpYSB0aGUgSEVDSTIgaW50ZXJydXB0LiBUaGUNCj4g
PiBhbGFuOnNuaXANCj4gPiANCj4gPiA+IEBAIC0yNTYsNiArMjYyLDcgQEAgdm9pZCBnZW4xMV9n
dF9pcnFfcG9zdGluc3RhbGwoc3RydWN0IGludGVsX2d0ICpndCkNCj4gPiA+ICAgCXUzMiBpcnFz
ID0gR1RfUkVOREVSX1VTRVJfSU5URVJSVVBUOw0KPiA+ID4gICAJdTMyIGd1Y19tYXNrID0gaW50
ZWxfdWNfd2FudHNfZ3VjKCZndC0+dWMpID8gR1VDX0lOVFJfR1VDMkhPU1QgOiAwOw0KPiA+ID4g
ICAJdTMyIGdzY19tYXNrID0gMDsNCj4gPiA+ICsJdTMyIGhlY2lfbWFzayA9IDA7DQo+ID4gYWxh
bjogbml0OiBzaG91bGQgd2UgY2FsbCB0aGlzIGhlY2kyX21hc2sgLSB1bmlxdWVseSBpZGVudGlm
aWFibGUgZnJvbSBsZWdhY3kuDQo+IA0KPiBUaGUgbWFzayBpcyB0aGVvcmV0aWNhbGx5IG5vdCBq
dXN0IGZvciBIRUNJMiwgdGhlIGJpdCB3ZSBzZXQgaW4gaXQgaXMuIA0KPiBJZiBmdXR1cmUgcGxh
dGZvcm1zIGFkZCBiYWNrIHRoZSBIRUNJMSBpbnRlcnJ1cHQgdGhlbiBpdCdkIGdvIGluIHRoZSAN
Cj4gc2FtZSBtYXNrLg0KYWxhbjogeWVhaCAtIGltIGdvb2Qgd2l0aCB0aGF0IC0gbm8gY2hhbmdl
IG5lZWRlZCB0aGVuIC0gd2FzIGEgbml0IGFueXdheXMuDQoNCg0KPiA+IGFsYW46c25pcA0KPiA+
IA0KPiA+ID4gLQllbHNlIGlmIChIQVNfSEVDSV9HU0MoZ3QtPmk5MTUpKQ0KPiA+ID4gKwkJaGVj
aV9tYXNrID0gR1NDX0lSUV9JTlRGKDEpOyAvKiBIRUNJMiBJUlEgZm9yIFNXIFByb3h5Ki8NCj4g
PiBhbGFuOiBkb2VzIHRoaXMgR1NDX0lSUV9JTlRGIG1hY3JvIHN0aWxsIG1ha2Ugc2Vuc2UgZm9y
IHRoaXMgbmV3ZXIgcGxhdGZvcm1zIHdpdGggR1NDLUNTIC8gSEVDSTI/DQo+ID4gaSBkb250IHRo
aW5rIGkgc2VlIG90aGVyIGJpdCBkZWZpbml0aW9ucyBmb3IgdGhpcyBtYXNrIHJlZ2lzdGVyLCBz
byBtaWdodCBlbHNlIHdlbGwganVzdCBkZWZpbmUgaXQgYXMgQklUMTQ/DQo+IA0KPiBHU0NfSVJR
X0lOVEYoMSkgaXMgdGhlIEhFQ0kyIGludGVycnVwdCBvbiBERzIgYW5kIHRoZSBiaXQgaGFzIHJl
bWFpbmVkIA0KPiB0aGUgc2FtZSBleGFjdGx5IHRvIGFsbG93IFNXIHRvIHJlLXVzZSB0aGUgc2Ft
ZSBjb2RlL2RlZmluZXMsIHNvIElNTyB3ZSANCj4gc2hvdWxkIGRvIHNvLg0KYWxhbjogb2theSBz
dXJlIC0gc291bmRzIGdvb2QuDQoNCg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d0L2ludGVsX2d0X3JlZ3MuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVs
X2d0X3JlZ3MuaA0KPiA+ID4gaW5kZXggNGFlY2I1YTdiNjMxLi5kYTExY2U1Y2E5OWUgMTAwNjQ0
DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndF9yZWdzLmgNCj4g
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X3JlZ3MuaA0KPiA+ID4g
QEAgLTE1NzcsNiArMTU3Nyw3IEBADQo+ID4gPiAgIA0KPiA+ID4gICAjZGVmaW5lIEdFTjExX0dU
X0lOVFJfRFcoeCkJCQlfTU1JTygweDE5MDAxOCArICgoeCkgKiA0KSkNCj4gPiA+ICAgI2RlZmlu
ZSAgIEdFTjExX0NTTUUJCQkJKDMxKQ0KPiA+ID4gKyNkZWZpbmUgICBHRU4xMl9IRUNJXzIJCQkJ
KDMwKQ0KPiA+IGFsYW46IEkgZG9udCBzZWUgdGhpcyBiZWluZyB1c2VkIGFueXdoZXJlIC0gc2hv
dWxkIHJlbW92ZSB0aGlzLg0KPiANCj4gQSBmZXcgb2YgdGhlIGRlZmluZXMgZm9yIHRoaXMgcmVn
aXN0ZXIgaGVyZSBhcmUgbm90IHVzZWQuIEkndmUgYWRkZWQgDQo+IHRoaXMgb25lIGluIGFzIGEg
d2F5IG9mIGRvY3VtZW50aW5nIHdoZXJlIHRoZSBiaXQgd2FzLCBidXQgSSBjYW4gcmVtb3ZlIA0K
PiBpdCBpZiB5b3UgdGhpbmsgaXQncyB1bm5lZWRlZC4NCmFsYW46IE9oIGkgYWN0dWFsbHkgZGlk
bnQgbm90aWNlIHRoYXQgZWFybGllciAtIGluIHRoYXQgY2FzZSwgcGxlYXNlIGtlZXAgaXQNCndv
dWxkIGJlIG5pY2UgdG8gYWRkIGEgY29tbWVudCBmb3IgYWxsIG9mIHRob3NlIHN1Y2ggYml0cyAo
Y29uc2lkZXIgdGhpcyBhIG5pdCkuDQoNCj4gPiANCg0KPiA+ID4gK3ZvaWQgaW50ZWxfZ3NjX3By
b3h5X2lycV9oYW5kbGVyKHN0cnVjdCBpbnRlbF9nc2NfdWMgKmdzYywgdTMyIGlpcikNCj4gPiA+
ICt7DQo+ID4gPiArCXN0cnVjdCBpbnRlbF9ndCAqZ3QgPSBnc2NfdWNfdG9fZ3QoZ3NjKTsNCj4g
PiA+ICsNCj4gPiA+ICsJaWYgKHVubGlrZWx5KCFpaXIpKQ0KPiA+ID4gKwkJcmV0dXJuOw0KPiA+
ID4gKw0KPiA+ID4gKwlsb2NrZGVwX2Fzc2VydF9oZWxkKGd0LT5pcnFfbG9jayk7DQo+ID4gPiAr
DQo+ID4gPiArCWlmICghZ3NjLT5wcm94eS5jb21wb25lbnQpIHsNCj4gPiA+ICsJCWd0X2Vycihn
dCwgIkdTQyBwcm94eSBpcnEgcmVjZWl2ZWQgd2l0aG91dCB0aGUgY29tcG9uZW50IGJlaW5nIGJv
dW5kIVxuIik7DQo+ID4gYWxhbjogU28gYWx0aG91Z2ggcHJveHkgaW5pdCBpcyBvbmx5IGEgb25l
LXRpbWUgdGhpbmcgKGV2ZW4gc3Vydml2aW5nIHN1c3BlbmQtcmVzdW1lKSwgd2UNCj4gPiBrbm93
IHRoYXQgcHJveHkgcnVudGltZSBpcnFzIGNvdWxkIGhhcHBlbiBhbnl0aW1lIChkZXBlbmRpbmcg
b24gb3RoZXIgZ3B1LXNlY3VyaXR5LXJlbGF0ZWQNCj4gPiBzeXN0ZW0gaW50ZXJhY3Rpb25zKS4g
SG93ZXZlciwgd291bGQgdGhlIGNvbXBvbmVudCBkcml2ZXIgYmUgYm91bmQvdW5ib3VuZCB0aHJv
dWdoIGENCj4gPiBzdXNwZW5kLXJlc3VtZSBjeWNsZT8gSWYgeWVzLCB0aGVuIHdvdWxkIHRoaXMg
Y2hlY2sgZmFpbCBpZiBhbiBJUlEgZm9yIGEgcHJveHkgcmVxdWVzdA0KPiA+IGNhbWUgdG9vIGVh
cmx5IGFmdGVyIGEgcmVzdW1lIGN5Y2xlLiBJZiB5ZXMsIHRoZW4gc2hvdWxkIHdlIG5vdCBkbyBz
b21ldGhpZ24gaGVyZSB0byBlbnN1cmUgdGhhdA0KPiA+IHdoZW4gdGhlIGNvbXBvbmVudCBnZXRz
IGJvdW5kIGxhdGVyLCB3ZSBrbm93IHRoZXJlIGlzIHNvbWV0aGluZyB3YWl0aW5nIHRvIGJlIHBy
b2Nlc3NlZD8NCj4gPiAoaW4gYmluZCwgaWYgcHJveHktaW5pdCB3YXMgZG9uZSBiZWZvcmUsIGJ1
dCB3ZSBoYXZlIG91dHN0YW5kaW5nIElSUXMsIHRoZW4gd2UgY2FuIHRyaWdnZXINCj4gPiB0aGUg
d29ya2VyIGZyb20gdGhlcmUsIGkuZS4gdGhlIGJpbmQgZnVuYz8pDQo+IA0KPiBBIHByb3h5IHJl
cXVlc3QgY2FuIG9ubHkgYmUgdHJpZ2dlcmVkIGluIHJlc3BvbnNlIHRvIGEgdXNlcnNwYWNlIGFz
aywgDQo+IHdoaWNoIGluIHR1cm4gY2FuIG9ubHkgaGFwcGVuIG9uY2Ugd2UndmUgY29tcGxldGVk
IHRoZSByZXN1bWUgZmxvdyBhbmQgDQo+IHRoZSBjb21wb25lbnQgaXMgcmUtYm91bmQuIFRoZXJl
Zm9yZSwgd2Ugc2hvdWxkIG5ldmVyIGhhdmUgYSBzaXR1YXRpb24gDQo+IHdoZXJlIHdlIGdldCBh
IHByb3h5IGludGVycnVwdCB3aXRob3V0IHRoZSBjb21wb25lbnQgYmVpbmcgYm91bmQuDQphbGFu
OiB0aGFua3MgLW15IGJhZC4NCj4gPiANCg0KDQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC91Yy9pbnRlbF9nc2NfdWMuaA0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvdWMvaW50ZWxfZ3NjX3VjLmgNCj4gPiA+IEBAIC0yMyw2ICsyMyw5IEBAIHN0cnVjdCBp
bnRlbF9nc2NfdWMgew0KPiA+ID4gICAJLyogZm9yIGRlbGF5ZWQgbG9hZCBhbmQgcHJveHkgaGFu
ZGxpbmcgKi8NCj4gPiA+ICAgCXN0cnVjdCB3b3JrcXVldWVfc3RydWN0ICp3cTsNCj4gPiA+ICAg
CXN0cnVjdCB3b3JrX3N0cnVjdCB3b3JrOw0KPiA+ID4gKwl1MzIgZ3NjX3dvcmtfYWN0aW9uczsg
LyogcHJvdGVjdGVkIGJ5IGd0LT5pcnFfbG9jayAqLw0KPiA+ID4gKyNkZWZpbmUgR1NDX0FDVElP
Tl9GV19MT0FEIEJJVCgwKQ0KPiA+ID4gKyNkZWZpbmUgR1NDX0FDVElPTl9TV19QUk9YWSBCSVQo
MQ0KPiA+ID4gDQo+ID4gYWxhbjogcGVyaGFwcyBpdHMgdGltZSB0byBoYXZlIGEgc3Vic3RydWN0
IGZvciAicHJveHlfd29ya2VyIiBhbmQgaW5jbHVkZQ0KPiA+ICd3cScgYW5kICd3b3JrJyBpbiBh
ZGRpdGlvbmFsIHRvIGFjdGlvbnM/DQo+IA0KPiBUaGUgd29ya2VyIGlzIG5vdCBqdXN0IGZvciBw
cm94eSwgd2UgdXNlIGl0IGZvciBhIEdTQyBhbmQgSHVDIGxvYWRpbmcgYXMgDQo+IHdlbGwuIEl0
J3MgdGhlIG1haW4gd2F5IHdlIGhhbmRsZSB0aGUgZ3NjX3VjLCBzbyBJTU8gaXQncyBiZXR0ZXIg
b2ZmIA0KPiBzdGF5aW5nIGluIHRoZSBtYWluIHN0cnVjdC4gSG93ZXZlciwgaWYgeW91IHN0aWxs
IHRoaW5rIGEgc3Vic3RydWN0dXJlIA0KPiB3aWxsIG1ha2UgdGhpbmdzIGNsZWFuZXIgSSBjYW4g
YWRkIGl0IGluLCBidXQgcGxlYXNlIHN1Z2dlc3QgYSBuYW1lIA0KPiBiZWNhdXNlIEkgaGF2ZSBu
byBpZGVhIHdoYXQgdG8gY2FsbCBpdCAoc29tZXRoaW5nIGxpa2UgaGFuZGxlcj8pLg0KYWxhbjog
aSB3YXMgdGhpbmtpbmcgInRhc2tfaGFuZGxlciIgLSBidXQgc2luY2UgaXRzIG5vdCBzcGVjaWZp
YyB0byBwcm94eSwNCnRoZW4gbGV0J3Mgbm90IGNoYW5nZSBpdC4NCg0K
