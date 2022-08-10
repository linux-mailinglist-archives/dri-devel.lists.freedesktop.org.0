Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A076B58E66E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 06:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B03E8787;
	Wed, 10 Aug 2022 04:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E27E86B3;
 Wed, 10 Aug 2022 04:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660106171; x=1691642171;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=II3Fd8EtLu20FDXZprYePwBL8n9Y+GIvG1KuvfCjSCw=;
 b=Q9A7X6F+oXkoFlf+pt/KKz1648c4qjgx3GB8zlBtoGdb/IxNByi0yJBb
 D4UKUH1hFE3/Vhw/8Lra+8sYY6IrqhTy8YkbETiFc8JRT1k11SOW/WWpt
 DN7JV2lVLWs5OV6mtTupIAgYofuKaQLNmEgZGnMHpmU1iP8grltlRhkWh
 2gVGjymS4PVaoXOmgXb/VbRBpn4oxiru8Wid3zLlaCRBAfPxgMAJJAFFk
 KhHzUcvu3S9iNbdZxr19bLtTFay/iESUmb8iaK3/ZBawjGY7PeJA0mzks
 cxYYmtJoytZ2dUYDU5Kc8y8yNR3BUBL2be/krkMcpdAQVlf5LiyXP1KpT g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="352725953"
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; d="scan'208";a="352725953"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 21:36:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; d="scan'208";a="673153222"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 09 Aug 2022 21:36:09 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 21:36:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 21:36:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 21:36:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 21:36:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0ScHBBdF6jPnRoUMxG5pAf8jmgE3JV9tJRgpZAoF0lwLVkVtFsznDeZVPBOtR+tgLgXyGU9KWxROt8d20Rl0R73etp+s1BEF7quLb+AfIymkBiISjydIJYKZMy6XXMnPYKDiIS8/fkLulHHN2qzMtA4Uw4MyX2Vre/E5IRd1Kw0L57OJJZjtPNXjXORhafHltGbdhXaLeEuwHLSx/hz4rjV7nE8LkbfiS1sIBDMXaUqXuKLvn7JGN9Qlkli76nxBDTe9NXhulFrHWic0R/10JOv5/rq3eUd2CIPLEuILareJ+aDXO2IoV6e5xCs64hQ2vWQTdpX9b4YoGeWjx9Nog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=II3Fd8EtLu20FDXZprYePwBL8n9Y+GIvG1KuvfCjSCw=;
 b=l/RaAbMZJBiXn0yK5/rs8k+nZWgEXXkPojGJE4U4pt+jmb7WB3eXxGlbr0q12aX0hVI/GMaLTLuH8dFkpqT58KcaX6YckXaFjQygoHAoe3gaZRLqKKV9FfVwTJDJXXhosj9zIbI9WcdXpxPDdujET5AyBOWn3AVtaoSpo6WSE4unveqeL+0prE6oTOToGUyBF50ZTRC6ftyvG1QZ3FCUdDBJ74Phx2HtWTD0Ng5JN06DlmgECIjRQVaBh5/wiG8fNBOf2r3b6izQdBrnBEohV9lyf8GAm9QNRKplC6wNPl4Ejru30gOAfnndwT8UD7jh8qBDKnzYZ12wuQCwjGBXPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SJ0PR11MB6813.namprd11.prod.outlook.com (2603:10b6:a03:47f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 10 Aug
 2022 04:36:06 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::b1a6:2b63:7c49:5cc5]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::b1a6:2b63:7c49:5cc5%4]) with mapi id 15.20.5525.010; Wed, 10 Aug 2022
 04:36:06 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [Intel-gfx] [RFC 1/1] drm/i915/dgfx: Avoid parent bridge rpm on
 mmap mappings
Thread-Topic: [Intel-gfx] [RFC 1/1] drm/i915/dgfx: Avoid parent bridge rpm on
 mmap mappings
Thread-Index: AQHYqxK1ywwgylcI/E63sKkFz7gtXq2mrNsAgADdvCA=
Date: Wed, 10 Aug 2022 04:36:06 +0000
Message-ID: <CY5PR11MB6211FE42B77A07642D23A6D695659@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20220808103555.345-1-anshuman.gupta@intel.com>
 <20220808103555.345-2-anshuman.gupta@intel.com> <YvJ3ykH0MS+i1jp2@intel.com>
In-Reply-To: <YvJ3ykH0MS+i1jp2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b29db47-925f-4777-3e37-08da7a89d749
x-ms-traffictypediagnostic: SJ0PR11MB6813:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TGyN3zhiKbxa4j0089JEvmVLH7lODtW+FSpZYjnDvNAE+G9irgJH5T7csxyTgxwngaFPUnz+GUClvuuTYzeWetunp9rVzyElP8cypqdluNnueahjmnfHK0P1sli6fsQuee7R2N8xxm5+jlFY/qJIDUKEb2eF6adOTARMNjfdzSjCGcG1J7vvr2jbAWr0yGv2wjto2YJ7uBCO7XC8hSCM7OCl0P9AyXi5ak/3sNe7n7GHMS2FsEJuB3U2v6WUi+fppxW/xe2DAYeOu+YJxz9Xxa1lPah0cjN2vAjJTdiPaMGdXKoAuP/OOsyeVbT0gajv4Xi+6sVv26DA6Q7XPO/RGvzL+9lH28EtaHij/49zdG7bp0pbBAWEKOS7soyZNBlx/9ZMESxYDwRQNCxuoN61Xjz4/XceTBOh8Qp7UiO9TWJ565zov/L5f+a1PDOwo8MUTIElAbgJHIiL+3dok7n7YZc3N3Ohj/xZFawV7B/hwb04/WPPQzquQUID3QvPYlTjwskwMq1zGX8KTsVcbSIu1xgaBQArfmmMwbLyfg23ygHNwLu+k4oHuEjY3ksYSCw5amA37eTs9283WGS2CITOfss75kQwtv6ht2D0VvJ0Z/pnqcBfC0zxHFF+iKHj5c/tHPVkSvDYyYbYzysGcZbF1S+SrAeu3mfOSNwnSTQy7mtVbOZwn2rzV2J0xl3xV25XAAG9dXCS6QSHwDn6h2HsnSRjueCFdsNdg6MsMyfrAPpPk+7QesJdM3jC7N3azApGMjO/jti/3IVlgsRL0R3H0rhHXHlieDkpA2JxQh5SWWA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(396003)(136003)(376002)(39860400002)(86362001)(82960400001)(38070700005)(26005)(83380400001)(186003)(9686003)(478600001)(53546011)(6506007)(55236004)(41300700001)(55016003)(66476007)(8936002)(52536014)(6636002)(71200400001)(54906003)(316002)(33656002)(66556008)(4326008)(38100700002)(66946007)(66446008)(7696005)(8676002)(122000001)(2906002)(5660300002)(64756008)(76116006)(6862004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWhGc3VvS0FNMG4zOGk5UnhhR04zNGEvcmJpMDFGMXZSNE9kQXJiTlAvSTdV?=
 =?utf-8?B?eGQvYXp3UktCV1RRNE5PWnJ6enI0cDYwYTFkMGE1c0RxZU1TaUVVTHhONXhY?=
 =?utf-8?B?a0w0L2hmK0t0MjYzMythODVOYjhSZUVianJIVzZYVHk1QTkvempUVVM2Y3pq?=
 =?utf-8?B?MDhTUFhsZ3BERGdwQk5sMlpxRVpoNHdsZnpxLy91ZUZqa1BFTDhuSkJKRm9q?=
 =?utf-8?B?V1dZODJ6eS8xd3ljNVdRd1ZrQjNoY2tiVTdpSmI2MlFseGxXNFgwNDJJTXJO?=
 =?utf-8?B?RkJ4NW4xNXJjMXViQ2NFWWx3aUtSdjdJM3RINUxCbUdSVE1iNHZucHJYV3Vx?=
 =?utf-8?B?bzNtZDlmWlB5ZnY2OW5RUm5mVEFmeHRJWVM5bkkwbTRyb1c4NFQ2K0MxbDQx?=
 =?utf-8?B?TzhLYnFUSUxlS0Q0RVlDODFHVS9Jcm1OcXVTWkZGTnZWODRTWmtudi9td0tt?=
 =?utf-8?B?VEpEaDdtWlRyVmE1U3I3aUNIeTBKTWxjT2h5eTN2ZWttVWRIamM2VWxDZGZV?=
 =?utf-8?B?MTd1RzIyamJBVHhXd2wwMkNYc2ZhVmlvYUp3Y0ROZ0J1VE04RnAvUW4zMVhx?=
 =?utf-8?B?MmdhZkp2emRtOW84QkJNR21ZM2RITTNiS080QTV1Y0J1SzVybTdvd2J2S1hP?=
 =?utf-8?B?VUNEODZSdW8zd3NwdlZybVVXbjEwNjRTWUdCUnNUUTk0UFJpOUR6aXFUWWdQ?=
 =?utf-8?B?ZXJmUVYyM2pVc1NjYlJzbWhwaTFSYzFELzk5cmptcHNoTDhXQi9RN0FQOXNl?=
 =?utf-8?B?NmMyalVwOXRJUDVPTzJmRWxmMTZwbllkWWxOVDhML3BSRGFVN0luZ1k2Q3VS?=
 =?utf-8?B?Y3h2ZldIa1EzSFVNVmxCN0lickJianpNQ0YzczZMRWZiSU5aTGdObjdtZTBr?=
 =?utf-8?B?eEY0NUE3cXJyODhoZCtJVVY3YklSTmZZNmoxRklKZTU2OTNoK0NuV1lhWHNv?=
 =?utf-8?B?UDVvbDdodmJkanZsbi9TZVRYR1MyRkM4c2ZHMDFlSjhOSHplWEhuQy9FaGFP?=
 =?utf-8?B?NlJ6ejdTaXVWNURPZmQvejlSdlB1TjgwYXVWT21QclloQUpZYm5FeUlFME53?=
 =?utf-8?B?M09TZFRFd2xzdmNYRm1qTGo4K2ZQQkFyTVptOUtza09XNjBSQlF3dUVLZUdu?=
 =?utf-8?B?SFNITVd2YzkwVkdWZGYreGI3Q3UyRVhEMUFQT3k1VUlTektibFBJcFBKb29m?=
 =?utf-8?B?czAvYjJrdkJ4RGV6MkRWN1ROV1dQTE8vN0dKOENoUDZYK2Y4V2tITkxsOXh4?=
 =?utf-8?B?Nlg5dTZXU2lyNVRaY1FucGFWa1Q1ZVVJTEpaZmU1RGdCVGtFalBFMldZMWFt?=
 =?utf-8?B?REw0Uk5ycG5ybWJnK2J6azhlUVArVWRDWE5zbHRRQVRUaVpIRXJ1K1FqOFpu?=
 =?utf-8?B?dmFlM0hyVmdhQ1Rkcjg1TnA4ZVpnS1ZuaDZuMitGK2dZTWtkV1RLeEgrcUJ1?=
 =?utf-8?B?RmI5ZXRWOWhtWkp4bWRFNWZaT1pLSUpsUFFuSkhVR3pSaW9YdXltQW42anlB?=
 =?utf-8?B?dTBvTG9QY2lyVlN1cnJQV1pjbzRrL3BSTUwwT0hHTTdEMnM1cG5KMzc3dGhi?=
 =?utf-8?B?TnJmTXEvTkUwam94R2hWR2FOb1Z4OEoxNHB6Yk0yK2dFZlh5L2gxcGcrZ0NS?=
 =?utf-8?B?cThtcElhalY3TnJXbFVDeWtZTUxaQnFrRDY4dXMxTmV4ZFJnVDBJVXBKTjgw?=
 =?utf-8?B?ekNsMnl4VlRuRXR2dlBTUnRkTnVOWXVVZzhQMkgxUDMxdjFzemltcHJIZUNI?=
 =?utf-8?B?RXQ2bTZ0RFFLSnczQzFjSTNiWDl0dkJYKzJoNGZEem90OHVUcXdvKzR3bzN6?=
 =?utf-8?B?QUdlZ0MxVDJwL1hBWGo2QVFjQjJ2cm5QN3F1engwZlBGS0hia1RlbG05VCs3?=
 =?utf-8?B?UG54RHJZZGNlOGE5V1dhai9MRmRZckllZHVQZlVFdzczMCt4anlkMFpjVUZl?=
 =?utf-8?B?RG1mNXkvSDFaalFkUDlWT29wSHMweDIweFpxWUdQaHE2SDY5cUR3T040SjNk?=
 =?utf-8?B?TnZQc21rOStqQndQcjhMWENzOXpUbEJoMmJ1RG9aUEEzV2VlMXp2R0ZJU1Nr?=
 =?utf-8?B?ZG5tOUNSN1htd0M2MENvcjFPZk1RYjRXODdQWW4zek8vZEp4YkRiZDV3WHJX?=
 =?utf-8?Q?MVIxE6a8Sf2OMJM220U50BRuE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b29db47-925f-4777-3e37-08da7a89d749
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 04:36:06.7199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rRQ0PmZbPH0I/lOmofv5aZDx7aeWkBxIgR8V+hxPH8DiwiqItSVQsLALCzCJM2r+GlHlyj/vA5KhB6B8jMUvifKlMKWUKO8VwEXUd+RBERY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6813
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVml2aSwgUm9kcmlnbyA8
cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDksIDIwMjIg
ODozNiBQTQ0KPiBUbzogR3VwdGEsIEFuc2h1bWFuIDxhbnNodW1hbi5ndXB0YUBpbnRlbC5jb20+
DQo+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkYW5pZWxAZmZ3bGwuY2g7
IFdpbHNvbiwgQ2hyaXMgUA0KPiA8Y2hyaXMucC53aWxzb25AaW50ZWwuY29tPjsgZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW0ludGVsLWdmeF0gW1JGQyAx
LzFdIGRybS9pOTE1L2RnZng6IEF2b2lkIHBhcmVudCBicmlkZ2UgcnBtIG9uDQo+IG1tYXAgbWFw
cGluZ3MNCj4gDQo+IE9uIE1vbiwgQXVnIDA4LCAyMDIyIGF0IDA0OjA1OjU1UE0gKzA1MzAsIEFu
c2h1bWFuIEd1cHRhIHdyb3RlOg0KPiA+IEFzIHBlciBQQ0llIFNwZWMgU2VjdGlvbiA1LjMsDQo+
ID4gV2hlbiBhIFR5cGUgMSBGdW5jdGlvbiBhc3NvY2lhdGVkIHdpdGggYSBTd2l0Y2gvUm9vdCBQ
b3J0IChhIOKAnHZpcnR1YWwNCj4gPiBicmlkZ2XigJ0pIGlzIGluIGEgbm9uLUQwIHBvd2VyIHN0
YXRlLCBpdCB3aWxsIGVtdWxhdGUgdGhlIGJlaGF2aW9yIG9mIGENCj4gPiBjb252ZW50aW9uYWwg
UENJIGJyaWRnZSBpbiBpdHMgaGFuZGxpbmcgb2YgTWVtb3J5LCBJL08sIGFuZA0KPiA+IENvbmZp
Z3VyYXRpb24gUmVxdWVzdHMgYW5kIENvbXBsZXRpb25zLiBBbGwgTWVtb3J5IGFuZCBJL08gcmVx
dWVzdHMNCj4gPiBmbG93aW5nIERvd25zdHJlYW0gYXJlIHRlcm1pbmF0ZWQgYXMgVW5zdXBwb3J0
ZWQgUmVxdWVzdHMuDQo+ID4NCj4gPiBEdWUgdG8gYWJvdmUgbGltaXRhdGlvbnMgd2hlbiBJbnRl
bCBER0ZYIENhcmRzIGdyYXBoaWNzIFBDSSBmdW5jJ3MNCj4gPiB1cHN0cmVhbSBicmlkZ2UocmVm
ZXJyZWQgYXMgVlNQKSBlbnRlcnMgdG8gRDMsIGFsbCBtbWFwIG1lbW9yeSBtYXBwaW5nDQo+ID4g
YXNzb2NpYXRlZCB3aXRoIGxtZW0gb2JqZWN0cyByZWFkcyAweGZmLCB0aGVyZWZvcmUgYXZvaWRp
bmcgVlNQDQo+ID4gcnVudGltZSBzdXNwZW5kIGFjY29yZGluZ2x5Lg0KPiA+DQo+ID4gVGhpcyB3
aWxsIG1ha2Ugc3VyZSB0aGF0IHVzZXIgY2FuIHJlYWQgdmFsaWQgZGF0YSBmcm9tIGxtZW0sIHdo
aWxlDQo+ID4gREdGWCBDYXJkIGdyYXBoaWNzIFBDSSBmdW5jIGlzIGluIEQzIHN0YXRlLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gR3VwdGEgPGFuc2h1bWFuLmd1cHRhQGludGVs
LmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX21t
YW4uYyB8IDExICsrKysrKysrDQo+ID4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
X3R0bS5jICB8ICA4ICsrKysrKw0KPiA+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3J1bnRp
bWVfcG0uYyAgfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9pbnRlbF9ydW50aW1lX3BtLmggIHwgIDIgKysNCj4gPiAgNCBmaWxlcyBjaGFuZ2Vk
LCA1NiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ2VtL2k5MTVfZ2VtX21tYW4uYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtX21tYW4uYw0KPiA+IGluZGV4IDBjNWM0Mzg1MmUyNC4uOTY4YmVkNWI1NmQzIDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9tbWFuLmMN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fbW1hbi5jDQo+ID4g
QEAgLTg0NSw2ICs4NDUsMTAgQEAgc3RhdGljIHZvaWQgdm1fb3BlbihzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSkNCj4gPiAgCXN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmogPSBtbW8t
Pm9iajsNCj4gPg0KPiA+ICAJR0VNX0JVR19PTighb2JqKTsNCj4gPiArDQo+ID4gKwlpZiAoaTkx
NV9nZW1fb2JqZWN0X2lzX2xtZW0ob2JqKSkNCj4gPiArCQlpbnRlbF9ydW50aW1lX3BtX2dldF92
c3AodG9faTkxNShvYmotPmJhc2UuZGV2KSk7DQo+ID4gKw0KPiA+ICAJaTkxNV9nZW1fb2JqZWN0
X2dldChvYmopOw0KPiA+ICB9DQo+ID4NCj4gPiBAQCAtODU0LDYgKzg1OCwxMCBAQCBzdGF0aWMg
dm9pZCB2bV9jbG9zZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkNCj4gPiAgCXN0cnVjdCBk
cm1faTkxNV9nZW1fb2JqZWN0ICpvYmogPSBtbW8tPm9iajsNCj4gPg0KPiA+ICAJR0VNX0JVR19P
Tighb2JqKTsNCj4gPiArDQo+ID4gKwlpZiAoaTkxNV9nZW1fb2JqZWN0X2lzX2xtZW0ob2JqKSkN
Cj4gPiArCQlpbnRlbF9ydW50aW1lX3BtX3B1dF92c3AodG9faTkxNShvYmotPmJhc2UuZGV2KSk7
DQo+ID4gKw0KPiA+ICAJaTkxNV9nZW1fb2JqZWN0X3B1dChvYmopOw0KPiA+ICB9DQo+ID4NCj4g
PiBAQCAtOTcyLDYgKzk4MCw5IEBAIGludCBpOTE1X2dlbV9tbWFwKHN0cnVjdCBmaWxlICpmaWxw
LCBzdHJ1Y3QNCj4gdm1fYXJlYV9zdHJ1Y3QgKnZtYSkNCj4gPiAgCQlyZXR1cm4gUFRSX0VSUihh
bm9uKTsNCj4gPiAgCX0NCj4gPg0KPiA+ICsJaWYgKGk5MTVfZ2VtX29iamVjdF9pc19sbWVtKG9i
aikpDQo+ID4gKwkJaW50ZWxfcnVudGltZV9wbV9nZXRfdnNwKHRvX2k5MTUob2JqLT5iYXNlLmRl
dikpOw0KPiA+ICsNCj4gPiAgCXZtYS0+dm1fZmxhZ3MgfD0gVk1fUEZOTUFQIHwgVk1fRE9OVEVY
UEFORCB8DQo+IFZNX0RPTlREVU1QIHwgVk1fSU87DQo+ID4NCj4gPiAgCS8qDQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV90dG0uYw0KPiA+IGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3R0bS5jDQo+ID4gaW5kZXggNWE1Y2YzMzJk
OGE1Li5iY2FjZDk1ZmRiYzEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL2k5MTVfZ2VtX3R0bS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5
MTVfZ2VtX3R0bS5jDQo+ID4gQEAgLTExMDEsNiArMTEwMSwxMCBAQCBzdGF0aWMgdm9pZCB0dG1f
dm1fb3BlbihzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QNCj4gKnZtYSkNCj4gPiAgCQlpOTE1X3R0bV90
b19nZW0odm1hLT52bV9wcml2YXRlX2RhdGEpOw0KPiA+DQo+ID4gIAlHRU1fQlVHX09OKCFvYmop
Ow0KPiA+ICsNCj4gPiArCWlmIChpOTE1X2dlbV9vYmplY3RfaXNfbG1lbShvYmopKQ0KPiA+ICsJ
CWludGVsX3J1bnRpbWVfcG1fZ2V0X3ZzcCh0b19pOTE1KG9iai0+YmFzZS5kZXYpKTsNCj4gPiAr
DQo+ID4gIAlpOTE1X2dlbV9vYmplY3RfZ2V0KG9iaik7DQo+ID4gIH0NCj4gPg0KPiA+IEBAIC0x
MTEwLDYgKzExMTQsMTAgQEAgc3RhdGljIHZvaWQgdHRtX3ZtX2Nsb3NlKHN0cnVjdCB2bV9hcmVh
X3N0cnVjdA0KPiAqdm1hKQ0KPiA+ICAJCWk5MTVfdHRtX3RvX2dlbSh2bWEtPnZtX3ByaXZhdGVf
ZGF0YSk7DQo+ID4NCj4gPiAgCUdFTV9CVUdfT04oIW9iaik7DQo+ID4gKw0KPiA+ICsJaWYgKGk5
MTVfZ2VtX29iamVjdF9pc19sbWVtKG9iaikpDQo+ID4gKwkJaW50ZWxfcnVudGltZV9wbV9wdXRf
dnNwKHRvX2k5MTUob2JqLT5iYXNlLmRldikpOw0KPiA+ICsNCj4gPiAgCWk5MTVfZ2VtX29iamVj
dF9wdXQob2JqKTsNCj4gPiAgfQ0KPiANCj4gd2UgbmVlZCB0byBlbnN1cmUgdGhlIHJ1bnRpbWUg
cG0gZ2V0IC8gcHV0IGF0IGRtYSBidWYgYXR0YWNoICYgZGV0YWNoIGFzIHdlbGwsDQo+IG5vPw0K
QUZBSVUgZG1hLWJ1ZiBpbXBvcnQgZG9lcyBtaWdyYXRlIGFuIG9iamVjdCBmcm9tIGxtZW0gdG8g
c21lbSAsIHNvIGVmZmVjdGl2ZWx5IHRoZSBtZW1vcnkgbWFwcGluZyBhY2Nlc3Mgd2lsbCBiZSAN
CmxpbWl0ZWQgdG8gc21lbS4gU28gdGhlcmUgd2lsbCBub3QgYmUgYW55IGlzc3VlIGhlcmUsIHVu
bGVzcyBpIGFtIG1pc3Npbmcgc29tZXRoaW5nIC4gDQoNClRoYW5rcywNCkFuc2h1bWFuIEd1cHRh
Lg0KDQo+IA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVs
X3J1bnRpbWVfcG0uYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcnVudGltZV9w
bS5jDQo+ID4gaW5kZXggNmVkNTc4NmJjZDI5Li5hNTU1NzkxODY3NGYgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcnVudGltZV9wbS5jDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcnVudGltZV9wbS5jDQo+ID4gQEAgLTY0NiwzICs2NDYs
MzggQEAgdm9pZCBpbnRlbF9ydW50aW1lX3BtX2luaXRfZWFybHkoc3RydWN0DQo+ID4gaW50ZWxf
cnVudGltZV9wbSAqcnBtKQ0KPiA+DQo+ID4gIAlpbml0X2ludGVsX3J1bnRpbWVfcG1fd2FrZXJl
ZihycG0pOw0KPiA+ICB9DQo+ID4gKw0KPiA+ICt2b2lkIGludGVsX3J1bnRpbWVfcG1fZ2V0X3Zz
cChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSkgew0KPiA+ICsJc3RydWN0IHBjaV9kZXYg
KnBkZXYgPSB0b19wY2lfZGV2KGk5MTUtPmRybS5kZXYpLCAqdnNwOw0KPiA+ICsNCj4gPiArCWlm
ICghSVNfREdGWChpOTE1KSkNCj4gPiArCQlyZXR1cm47DQo+ID4gKw0KPiA+ICsJdnNwID0gcGNp
X3Vwc3RyZWFtX2JyaWRnZShwZGV2KTsNCj4gPiArCWlmICghdnNwKSB7DQo+ID4gKwkJZHJtX2Vy
cigmaTkxNS0+ZHJtLCAiRmFpbGVkIHRvIGdldCB0aGUgUENJIHVwc3RyZWFtDQo+IGJyaWRnZVxu
Iik7DQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCXBjaV9kYmcodnNwLCAi
Z2V0IHJ1bnRpbWUgdXNhZ2UgY291bnRcbiIpOw0KPiANCj4gd2Ugc2hvdWxkIGFsd2F5cyBwcmVm
ZXIgdGhlIGRybV9kYmcgaW4gb3VyIHN1YnN5c3RlbQ0KVGhpcyBwcmludCB3aWxsIGJlIHVzZWZ1
bCBpbiBjYXNlIGFueSBsZWFrcyBmcm9tIHVzZXJzIGFyb3VuZCBtdW5tYXAuDQpUaGUgZGV2aWNl
IGJkZiB3aXRoIHBjaV9kYmcgd2lsbCBiZSB1c2VmdWwgaW4gc3VjaCBjYXNlcy4gDQo+IA0KPiA+
ICsJcG1fcnVudGltZV9nZXRfc3luYygmdnNwLT5kZXYpOw0KPiANCj4gd2h5PyBJIGJlbGlldmUg
dGhhdCBncmFiYmluZyBvdXIgb3duIHJlZiB3b3VsZCBiZSBlbm91Z2ggdG8gYmxvY2sgdGhlDQo+
IHVwc3RyZWFtIGNoYWluLiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHRoaXMgaXMgc3VjaCBhbiBz
cGVjaWFsIGNhc2UgdGhhdCB3ZSBkb24ndA0KPiBzZWUgYW55IG90aGVyIGRyaXZlciBpbiB0aGUg
bGludXggdHJlZSBoYXZpbmcgdG8gZG8gc3VjaCBhIHRoaW5nLiB3aGF0IGFtIEkNCj4gbWlzc2lu
Zz8NCklNSE8gYnkgZ3JhYmJpbmcgb3VyIGRldmljZSB3YWtlcmVmIHdpbGwga2VlcCBpdCBpbiBE
MCAsIHdpdGggaXRzIHBhcmVudCBicmlkZ2UgdGhlIGdmeCBlbmRwb2ludCANCmZ1bmN0aW9uIGNh
biB0cmFuc2l0aW9uIHRvIGQzKGQzaG90KSB0byBzYXZlIHNvbWUgcG93ZXIgPw0KDQpJZiB3ZSBh
cmUgc3VyZSB0aGVyZSBhcmUgbm90IGFueSBwb3dlciBzYXZpbmcgd2l0aCBvbmx5IGdmeCBlbmRw
b2ludCBmdW5jdGlvbiBpbiBEM2hvdCwgcHJvYmFibHkNCmluIHRoYXQgY2FzZSBpdCB3aWxsIGJl
IGNvcnJlY3QgdG8gZ2V0IHRoZSB3YWtlcmVmIG9mIG91ciBvd24gZGV2aWNlLg0KDQpUaGFua3Ms
DQpBbnNodW1hbiBHdXB0YS4gICANCj4gDQo+ID4gK30NCj4gPiArDQo+ID4gK3ZvaWQgaW50ZWxf
cnVudGltZV9wbV9wdXRfdnNwKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1KSB7DQo+ID4g
KwlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoaTkxNS0+ZHJtLmRldiksICp2c3A7
DQo+ID4gKw0KPiA+ICsJaWYgKCFJU19ER0ZYKGk5MTUpKQ0KPiA+ICsJCXJldHVybjsNCj4gPiAr
DQo+ID4gKwl2c3AgPSBwY2lfdXBzdHJlYW1fYnJpZGdlKHBkZXYpOw0KPiA+ICsJaWYgKCF2c3Ap
IHsNCj4gPiArCQlkcm1fZXJyKCZpOTE1LT5kcm0sICJGYWlsZWQgdG8gZ2V0IHRoZSBQQ0kgdXBz
dHJlYW0NCj4gYnJpZGdlXG4iKTsNCj4gPiArCQlyZXR1cm47DQo+ID4gKwl9DQo+ID4gKw0KPiA+
ICsJcGNpX2RiZyh2c3AsICJwdXQgcnVudGltZSB1c2FnZSBjb3VudFxuIik7DQo+ID4gKwlwbV9y
dW50aW1lX21hcmtfbGFzdF9idXN5KCZ2c3AtPmRldik7DQo+ID4gKwlwbV9ydW50aW1lX3B1dCgm
dnNwLT5kZXYpOw0KPiA+ICt9DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2ludGVsX3J1bnRpbWVfcG0uaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcnVu
dGltZV9wbS5oDQo+ID4gaW5kZXggZDkxNjBlM2ZmNGFmLi5iODY4NDNiZjRmNWQgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcnVudGltZV9wbS5oDQo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcnVudGltZV9wbS5oDQo+ID4gQEAgLTE3Myw2
ICsxNzMsOCBAQCB2b2lkIGludGVsX3J1bnRpbWVfcG1faW5pdF9lYXJseShzdHJ1Y3QNCj4gPiBp
bnRlbF9ydW50aW1lX3BtICpycG0pOyAgdm9pZCBpbnRlbF9ydW50aW1lX3BtX2VuYWJsZShzdHJ1
Y3QNCj4gPiBpbnRlbF9ydW50aW1lX3BtICpycG0pOyAgdm9pZCBpbnRlbF9ydW50aW1lX3BtX2Rp
c2FibGUoc3RydWN0DQo+ID4gaW50ZWxfcnVudGltZV9wbSAqcnBtKTsgIHZvaWQgaW50ZWxfcnVu
dGltZV9wbV9kcml2ZXJfcmVsZWFzZShzdHJ1Y3QNCj4gPiBpbnRlbF9ydW50aW1lX3BtICpycG0p
Ow0KPiA+ICt2b2lkIGludGVsX3J1bnRpbWVfcG1fZ2V0X3ZzcChzdHJ1Y3QgZHJtX2k5MTVfcHJp
dmF0ZSAqaTkxNSk7IHZvaWQNCj4gPiAraW50ZWxfcnVudGltZV9wbV9wdXRfdnNwKHN0cnVjdCBk
cm1faTkxNV9wcml2YXRlICppOTE1KTsNCj4gPg0KPiA+ICBpbnRlbF93YWtlcmVmX3QgaW50ZWxf
cnVudGltZV9wbV9nZXQoc3RydWN0IGludGVsX3J1bnRpbWVfcG0gKnJwbSk7DQo+ID4gaW50ZWxf
d2FrZXJlZl90IGludGVsX3J1bnRpbWVfcG1fZ2V0X2lmX2luX3VzZShzdHJ1Y3QgaW50ZWxfcnVu
dGltZV9wbQ0KPiA+ICpycG0pOw0KPiA+IC0tDQo+ID4gMi4yNi4yDQo+ID4NCg==
