Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 670586AF7FF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 22:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6515D10E03D;
	Tue,  7 Mar 2023 21:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B785910E14B;
 Tue,  7 Mar 2023 21:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678225813; x=1709761813;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CDeV2X6hMH4JXpGEUl1N2hBjvew8qlxBkS1evjQP/5w=;
 b=mXKPcIYVS2pq0gxoxa32Kf7EZ2NMQiaPIuc404ikQ0q2vLcoG/qBBtQH
 m8ADgThCSY/GSSVMn/2L0ibg5d9J6hTWMEn2I+V8LTNCfjkC0hwLHJd5B
 8JNDFD+/fhTHRgVIZIhAakMAlViaLU6LXliHBj/njXRqlCgZ4SsHJMrLG
 mG0FaQthxpY8ek79sJz8Q/cccHmLwl8I1FbfLvXsd7QJRYhceuRxgNFo+
 VOtO6bFhWJLbekfoFvflewshWtwO3yix9o0ZviQo8NjV7jjEWFmUYiV3V
 q/ZI207pNYQYR/BpwJSIxXBFDYJoWtlMbw12KDHwEVNYMyKIwuYrM9jgK Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398561957"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="398561957"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 13:50:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676713848"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="676713848"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 07 Mar 2023 13:50:12 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 13:50:12 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 13:50:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 13:50:12 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 13:50:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eO4YC1ErbxNNus+uKKFqFEE80Bf+InvDzNjdWViu36vWOSeJp4bBdZ7KRbEgpWtO1c1j3vLDw7PKKTxbisOJykTpzV6kFLJFENkPhqg7iNTERE71U5H1mImizEtEedkCq4I/Tk5PNCLm3VkzPZcmw0jtlobFzomhK/E/Kp3DARcCjuM4M7U9+uSjdED2+avPiRUQ6su+FMFl7aBDxCjmGSW6eKpn7eaIPBz6J3veB2l0eY4zPbbPtbVVFlrZravw0/2jDbl/qlvQGKn4EHgeNpG2gnmtkUnT3Vgo6Jpr7rQUIFzojwLxz+zqjU63QzAqBVzCinxWJROcm8EzDusl6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDeV2X6hMH4JXpGEUl1N2hBjvew8qlxBkS1evjQP/5w=;
 b=EuXTtoAHPfkpWpf7wQba2aF4VJKYRGtIDhzEPawKlxrtl/ait9qveYqHsNlM2eEtAQcFyhBk3Lg4EfY6Rdmals2bjWyuAA4/GxCIDZl3ZqcvmavhW37vZj4hiXZbbGziLIPV7EiIimlW/JtTnobjrhPx9AaU7hbehTJv4b7+0Gk4ZmAPYxURjscKTxLHESwN5rkatYLME329oXZwVElnv+oFiYpj58IqNm2lOLNHWPWueWgZsXu56JU0jVrVrIIOAEpv37LjD7wMtfJIVcWdfooKhaV6ow/BYQKOvXV04NNZhCB37mobSG2ATejyp6cc4vrU3kHsW5jcvfWW9SF23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA2PR11MB4809.namprd11.prod.outlook.com (2603:10b6:806:112::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 21:50:10 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%9]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 21:50:10 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/i915/gsc: Fix race between HW init and GSC FW load
Thread-Topic: [PATCH 2/2] drm/i915/gsc: Fix race between HW init and GSC FW
 load
Thread-Index: AQHZR6pFTLzBZyIWbUqVpqnwCcjFlq7v7jwA
Date: Tue, 7 Mar 2023 21:50:10 +0000
Message-ID: <b1f6719d7dc086955c29fc0a8cffa002896ce3b5.camel@intel.com>
References: <20230223172120.3304293-1-daniele.ceraolospurio@intel.com>
 <20230223172120.3304293-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230223172120.3304293-3-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA2PR11MB4809:EE_
x-ms-office365-filtering-correlation-id: fdf75141-6447-4eff-0dc7-08db1f55ec80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DdLfVQCEO7bHVUFng/eAFWftJfKw/dV2R3etGlnEP+ZPzsZFU0zaJ1m2/30bK8Yytui4D20u0S/SKF4FWwomXkkPQO8U6Ufldx3dlowhMO+VSlQT+Yssx1dIB4umbaROFdIrSx7GNjwQbGrfBsCsel9YQSMzgRmrK5ciT7GUBlBqjsmUe0L8BSieuENoZwPu77YyQ5ylQJcVZhcdgPYa5cRp4DAHHIQfK86rbqMvSVrEnisOxi5JDjjdsJQVSZ6FQcboggwunTSYnj1DKyW76A2eZccKi+64FI7FT1JnmtCGeEo/+1TYzf3IBLQ6zl10oiy0nqvselaNH7zrm8bJsk1yZBOvlC6KAPnkzWjKy/HutdFNTLEAPXk9k3OHvT2WiZhWQpJVYpIpyvk/jk+dfM+63IPZel8lyjHogtOvU7A94j5Shi22vj8IC3CT3uJYG3az/xxx4RIGAelbZLlCbRRrtYUsZ0YpoxM6QyduEjvYmtBpO1o6elVTN/EuTmAmtKJSCxVYhtRvR4lfEiOZ+yKRvlEfLC+r6qZnQrNlTdF6S2YL0bYmmXSYnOywhQkukhU8Y8EzLZlNEFpWFgn3uOthPzUbqy8g1G+58/KBwSwxhSuOU/IYN2MZe5ymOUF9hac5uy8/0tV8nR0H1RB8sxGdOmhZEHQXW6WfoTikR/XSODbWtMcvR59LkBwCDzwx7oMDAlGPzNSt2Wcz9nSUgQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199018)(5660300002)(478600001)(86362001)(26005)(186003)(6486002)(36756003)(71200400001)(2906002)(6506007)(6512007)(2616005)(76116006)(82960400001)(66476007)(64756008)(66946007)(66446008)(66556008)(450100002)(122000001)(91956017)(4326008)(38100700002)(8676002)(38070700005)(8936002)(316002)(41300700001)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVlYU3d5MmFvRTVKcnRnWlpoUHJKSk9xOWZ3MUpWNW82VGg2S3RpWHFObnZa?=
 =?utf-8?B?cjJvMWptWlkyaTVKbFRmNUJyWUsxc3lUL0ZITWg4UFB0dXNKODFuaDFvOUM5?=
 =?utf-8?B?b2hqeWxtWk03Rjk4ZUtDYUgrOUxUdnIrZ0hRbkp2RjVPRHB1WFpZUkFnanFl?=
 =?utf-8?B?NGdmQ0taeVp1Y0pETTlwV3Frd3VKNWgyUXFSejZXSmJucFY2N0ozajEvNlly?=
 =?utf-8?B?S3FMb2VyWTljTnNPdE5lM0ltYThJekRMbzVzREhoeGt1Z2huY216d24wT3RX?=
 =?utf-8?B?eXFyd21ya094dFNSVlhyTTFPYVd6VTVsOHhNblVScjB0a0VKSUpqS0hhMHN1?=
 =?utf-8?B?ZGVmRlR5VWswaWJrNnNZYmZTcDk4WWlKMzF5UzBaUTNWOVRST2ZydjJTR0kr?=
 =?utf-8?B?TzJkS1g5d3puK29vMTl5Y3RYdXdHZ1A0aTJHWUNOdFhVV0R4dUpsWFlzS09O?=
 =?utf-8?B?bjlUSFJTVXdwczE2a1ZFODdOVFlQRWh2dmVJSG1GZm1JQjF3aTd5Wm8rS2Ix?=
 =?utf-8?B?eVBta0prNXRHNnVIRnIwS29uNTM2aGVUKzd0bklaK2NGQkVVbWlVUk44R0tt?=
 =?utf-8?B?Q2JaOFZTNXFHM3JTVnJURXo0QUlnR2NSY3BOZkZleXBxWjVFNGR0VDI5a1o5?=
 =?utf-8?B?c05PbzZaZDhuMDREK0IvMG84akc3d0tMSFhnUVpJVnJCTDM3R2x2VGkyQTVQ?=
 =?utf-8?B?VFZZSGtJTnZ6RSsvVW1RbkE3MHpldE5PK2Y4R0NEc0oyNVpLNkNXQlNHQ2VJ?=
 =?utf-8?B?aDltbC82WS9yWVBkeHljcExSWFBRVnE0UXNVOE5hbDVzWFpScXNFUG9STVNY?=
 =?utf-8?B?TjNhcnBtZG0zNEs0NTRRNVprMUMyZU5SZTJoMGxNSDA1T0VaK3hDU1dHYWNN?=
 =?utf-8?B?QVBFSzZjRlBMWUd5OTBGNGdFRUlxSUd2WFB5aXA5ZTlzQ0dYUHJDOFRYVkV2?=
 =?utf-8?B?UDlSWVdDZWtjMCtOS2ovV3paUlpRdnBxSFpBeVJGcEZ6OGhVZUMrTVNDQTRM?=
 =?utf-8?B?Y2w4NVFjc0p1bXBJTUU3NWZvT2tGdmlOWXdpQ1p0ZHdsaWJJZCtsQ1pQaWVv?=
 =?utf-8?B?WHdRdnRmdjcyNWdYVzZ1ZjQ1dTRzU3hwcVFTeGdZV0ZSS3picUJxRzI2Smh3?=
 =?utf-8?B?WDlyR2haSHNScnJKbW9zWS9sZHEwUmFQQWc2OXI1UFdnczQ1dld2bDM0NEZR?=
 =?utf-8?B?SHFtYWZpT1liRVBYWVIxOWpmcFJLREpWdGVhT0ZPMlhUOVZybndYNDZsZlFy?=
 =?utf-8?B?RTJZNnVtZm9wRlVLQU5ZYjVUcnNldEQ0YVI3eFUzdkh5S2tjYUhGNHZKNk03?=
 =?utf-8?B?ZjBEMjdiWWxoNW1YSnZhTkZONkRUZkpxaWNTWlVycHhrK3hXUnRoTlN2RVZ3?=
 =?utf-8?B?ZDZIREdLTkFZcXdFTkp4NUswYkZzTlJRK1JUOW1WMnZzajBpK3dEeFlDdjRa?=
 =?utf-8?B?dkRySWZ5YXNodkswcXNML1dCQkU4VDB2UHZqL0g1eVZQUVJoR05nci9XY2k1?=
 =?utf-8?B?SmdFZnoyd0FvTElaV25HeHFScERwVjJqbWV5elNmNlgrdVk3WEFTWERFTFpR?=
 =?utf-8?B?dGN5dW53bEl4WG5lem9KaVhlZ01pTzRjSGtiZGl6YUs3NHEyZ0NQcjMwUWY4?=
 =?utf-8?B?ejBYQXBqNkFXdGNuOTlwYUhVeVdCRTBaQVF0VGFHaGlMeWN0SlcyTlh1aE1z?=
 =?utf-8?B?WGFSSXVJajZGaUU0N3RXdExlTWk1ZUNiSWJFUDlISDlBR0IzdnFtUHljMlNj?=
 =?utf-8?B?dmF3a2lQSDU1U3VOT01nM1RUOEJMdFVsYjRuM0NROEV2YXp3aFczM093d1dm?=
 =?utf-8?B?SFpacDNaSmRCUlhRQ3ZpaTFOSDBIWXZZY21hMEJMUExKRFpzU0JYYnpMbzZw?=
 =?utf-8?B?b1ltb2NVckgvMHBNM2VRbCtEZUkrV25IUk5pWU1pNnV1Z2k4dHpFdDFINlM1?=
 =?utf-8?B?QUJ0QlZNSXJsVWRTZnhqUDJtMzZaUG5xaDlOVU0wclZzbS9HOVpydXY3Zmxs?=
 =?utf-8?B?dUdWeDlEV2xtcDVUY2pIYTlCZlNBNWhza3NzNEZpTGp0emNQOVA2K2phTFpF?=
 =?utf-8?B?eFNMNzI4QVNYL2VKdkM5UC95WHBRZmM4UmxQWUxDQ3FSWGJnZlFEWWM4eWNE?=
 =?utf-8?B?WWdmOWdiY1pDYzJQL3ltL2lKSVN0VHBwUisrNnQvNjI4QVBIVlQwb1JuL2Nu?=
 =?utf-8?Q?Acvf6MHOvgVWUqr1gqyTw9k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECAA802D8656B14B92A978F62E96350C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf75141-6447-4eff-0dc7-08db1f55ec80
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 21:50:10.2916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 77SX7RFqMS/ZrIDjVQEI0ndMMKSsoAPCqKbCv60jOqfEh+51Cx6ABMUq83eY5WLw94/awWA7IOLUhAlkxtMxLoUyabBSXwGuH4nBwONZoz7CEMJkn559yeb7wNBcZaA0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4809
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTAyLTIzIGF0IDA5OjIxIC0wODAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gVGhlIEdTQyBGVyBsb2FkIGlzIGEgc2xvdyBwcm9jZXNzICh1cCB0byAyNTAg
bXMpLCBzbyB3ZSBkZWZlciBpdCB0byBhDQo+IGRlZGljYXRlZCB3b3JrZXIgdG8gYXZvaWQgc3Rh
bGxpbmcgdGhlIGluaXQgZmxvdyBmb3IgdGhhdCBsb25nLiBIb3dldmVyLA0KPiB3ZSBjdXJyZW50
bHkgc3RhcnQgdGhpcyB3b3JrZXIgYmVmb3JlIHRoZSBIVyBpbml0IGlzIGNvbXBsZXRlLCBzbyB0
aGVyZQ0KPiBpcyBhIGNoYW5jZSB0aGF0IHRoZSBHU0MgbG9hZGluZyBjb2RlIHN1Ym1pdHMgdG8g
dGhlIEhXIGJlZm9yZSB0aGUNCj4gZW5naW5lIGluaXRpYWxpemF0aW9uIGhhcyBjb21wbGV0ZWQu
IFdlIGNhbiBlYXNpbHkgZml4IHRoaXMgYnkgc3RhcnRpbmcNCj4gdGhlIHRocmVhZCBsYXRlciBp
biB0aGUgZ3RfcmVzdW1lIGZsb3cuDQo+IEZyb20gdGhpcyBsYXRlciBzcG90LCB0aGUgR1NDIGNv
ZGUgY2FuIHN0aWxsIHJhY2Ugd2l0aCB0aGUgZGVmYXVsdA0KPiBzdWJtaXNzaW9uIGNvZGU7IHdl
IGZ1bmN0aW9uYWxseSBkb24ndCBjYXJlIHdobyB3aW5zIHRoZSByYWNlICh0aGUgR1NDDQo+IGxv
YWQgZG9lc24ndCBuZWVkIGFueSBzdGF0ZSksIGJ1dCBzaW5jZSB0aGUgd2hvbGUgcG9pbnQgb2Yg
dGhlIHNlcGFyYXRlDQo+IHdvcmtlciBpcyB0byBtYWtlIHRoZSBtYWluIHRocmVhZCBmYXN0ZXIs
IHdlIHByZWZlciB0aGUgZGVmYXVsdA0KPiBzdWJtaXNzaW9uIGNvZGUgdG8gcnVuIGZpcnN0LiBU
aGVyZWZvcmUsIG1ha2UgYW4gZXhjZXB0aW9uIGZvciBkcml2ZXINCj4gcHJvYmUgYW5kIG9ubHkg
YW5kIHN0YXJ0IHRoZSBnc2MgbG9hZCBmcm9tIHVjX2luaXRfbGF0ZS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRl
bC5jb20+DQo+IENjOiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVs
LmNvbT4NCj4gLS0tDQphbGFuOnNuaXANCg0KU2ltcGxlIGZpeC4uLiBMR1RNOg0KUmV2aWV3ZWQt
Ynk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0K
