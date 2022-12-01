Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE57E63FABB
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 23:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BD610E67E;
	Thu,  1 Dec 2022 22:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAD410E67C;
 Thu,  1 Dec 2022 22:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669934436; x=1701470436;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lKUDl7Oaoy0XC5WzGtK2740CSfENkGsR/aSz4ht0ZwA=;
 b=YEH+9BfxIMRftwwEt31/3hc9bqfusSKqaKCZhZaytGpOIfqHQYAzzqqY
 LgrOBwDTYt0TpfohQvvDk4KhUUCMUdlWmem2J4SXvJSPBAar+otzabVzR
 l3OII1C8pkm6SIueDlwi77F+tEVpCZRyJ6xPnTdAxeRZL6ZkcAFEJFZtT
 6aDmg+QIexrKDAjD7vSB3GsC+CYc26a/baLcSnWIdmg5FwNzb9+J+mg8c
 aJZUPZVuSo4RdnCg03X9rTjS3bYRv4n5H8k+JTZokErRHCO7XJ3v8PisU
 wrGc2TEWw4yq1CcjKVxOwytOCYI+GARFuZOqAbJ8auHka6Mk0ij2Xfl7D w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="377973011"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="377973011"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 14:40:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="646934813"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="646934813"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 01 Dec 2022 14:40:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 14:40:35 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 1 Dec 2022 14:40:35 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 1 Dec 2022 14:40:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ez8drd1HVz9oC87DnUxIwOXbAPH1pBWq5XqM0zqnyA2FvqBxyLt1CNL28nyqCbbYW2vgfI9ReaGY9o0PpPLY3CrzlbbKFegX4wTnY4AJ6SPgpiSdBiRTj0Z6Xp58mKtse4z2TB7VOAIi3dLqpPhU2BTs6CR7xIecHS03vGW5UsnmVwe5J3MJ7UglXccrAZksjneGlb0WxS5F3mfD6UqxjC+ZYQn+Pm1I5Nlx4TnQudQv/sgKEGMmc0jhi2t0HWvAi2QXr2b5wkoFkEPxeAuj/Gn1Y5m9R+LerhhZYWJ6gmhxr1D+R8scfhSjMpU1KW6HSUCqD3Ttgak4s/gMNZ4y4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKUDl7Oaoy0XC5WzGtK2740CSfENkGsR/aSz4ht0ZwA=;
 b=ZWsCwq2/ZETOzVEKF4skmEWMQdVEFvGr0XTahKk5mmTQv3f5x6c8gtYmLOaMG3+0tJt5eZDc4S/GYo4USQl1iag8DUGhJ/6Xmph7aFMkQ4HZ1jwZz/wOQj2fDgUrSdLN7iyskvKz/1KFxFHPeSsGK7EYtTUom2qe0Z5a+5og8bmmA3oTHJOkKZw7NEMnteHF4IhO6Rf43OhNRrWRQwMzP36+jgCcluQ0pQ+W6yMPvBKYff68p8IztKygDiuPFLSKkNhro1hWog4bC8Va1CYa4EIlJKRBYiqNfH6MLLUKbm7ue2Q4wj6CYkDye8q6y68vF9jx6CruGYKftkMn+ls/Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.17; Thu, 1 Dec 2022 22:40:33 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6%4]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 22:40:33 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/6] drm/i915/gsc: Do a driver-FLR on unload if GSC was
 loaded
Thread-Topic: [PATCH 4/6] drm/i915/gsc: Do a driver-FLR on unload if GSC was
 loaded
Thread-Index: AQHY/f7QFK6Cj+YpgkSNs406bmHQDa5ZsIqA
Date: Thu, 1 Dec 2022 22:40:33 +0000
Message-ID: <87488908f20f6deb85b2385d65a2cdd98560ae32.camel@intel.com>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-5-daniele.ceraolospurio@intel.com>
In-Reply-To: <20221121231617.1110329-5-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DS0PR11MB7802:EE_
x-ms-office365-filtering-correlation-id: a249990b-999a-4679-2d5e-08dad3ed0ecc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HNCxXy/0VyzrvZn6guocJU5DswzUYK5shnC5EdBK5BvG/XTKghUviqN3AwYiENpkwvlins81vQjTXFzJSFoZW9TVjqhqjZnNeS/vSRtWJaOp5aW1/5tskBzou9g95317QlK9m1HxD8s49JTwVR4oRiJu1wNFw76GRskTH/qt6fJ+3gp584FI9KNK+l6oB568P/yhUombugQrE1+uiEDnFZPa8588ipvC3jtV7/JD8f3zLX37dVIyLUIGAo9v03p0lWQoGUROL/kH9sBDsQHSNfb60sRXu9pmlAhbJh43U56XVQ7SUBaUTK2OqvWQrbKvOFKC9P0c6ZLeGB3puQz5dP/ntXgkzbNjlSVmbafHFVvHMAaaX1sjukQv8XFjXQ1DZJ6t+EJk+u1TXyHo9EHottqW2GOmXDn/KYoakZ1NOw50vbWrlBrUIFhNSJyh7YrHN39N71l4Nq+V/cTouewRri4ReUoGOAvfArFgiZxsgJ6glq3PY9oJIXFPf6VaXQzoMxHOZuJGiEw29uwjoonCBAITDs8h9jy7oRQEjg0miXUGZWGz611m8p3YN5BqOg5RzNWJDZgF+ly9PqzePMykP9GLvKdjveUbnuaCgbUhIr2cGeigPub9biOJPt0o3ANaAGW9KxO8PQDdQtk8EP77pwFIQeh1CqHK555G80UyjnkbwDoYf8FFRq4lpMHyvRhdaHomKzcDWM+NfUU7qzTEQg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199015)(66476007)(66446008)(66556008)(64756008)(110136005)(5660300002)(41300700001)(4326008)(316002)(66946007)(76116006)(4001150100001)(8936002)(8676002)(36756003)(6486002)(2616005)(6506007)(186003)(26005)(6512007)(91956017)(71200400001)(450100002)(478600001)(83380400001)(38070700005)(38100700002)(122000001)(86362001)(82960400001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enZ6YWtQMUJkbUVQS3B6QWM3bEZQZDViWmpObytnK3M0b1FxWFRpMEQ5UE1t?=
 =?utf-8?B?eHN3UFNucUQ4VFhSNCtkdXdkbTN0SWxIcE5XMXlQU2pORHV1Qk5mZEp5Yk1B?=
 =?utf-8?B?SGE3T01MR3pWK2tvVElDY280NFN6bmFyZUFKM0ZaVUpHK1pBdjNxaW5Na0lJ?=
 =?utf-8?B?ZEF0S1VZNVVHdlBKMElZUDI0MDhOTUE1OGkyV0toeXpFczl0ZWx6cFN0UW5P?=
 =?utf-8?B?dmRjZFpjOW5IREYzUkh6NzJ6TlBlcCswNVpHSmZiaEZ0ZURsb1JMZzJjbHRH?=
 =?utf-8?B?SElPUUttMWVPUDVBQmlqMHdPcC9RcXFnTzZ6a1hCMmQ1bFU4WVVCdDdnUzBZ?=
 =?utf-8?B?ZnN5VDIxdG1kdjR2cERCdWw3Rks2aE9wRk1WcGJKSFBLYjA1N1VNUUdXQXYv?=
 =?utf-8?B?OXN3WjZySmF6L3FvUEZzeDRGRk5RT0t0enowUmpSQXZBaHZza3Q3YUtPWFla?=
 =?utf-8?B?WkwzZUIvcmhaQkl1bmZDWTBTam9DNitQVDAzU0VWM3dLWlp1bHp3S0xyVGNi?=
 =?utf-8?B?VjZ4eTg5aFNyOUNHNFlaN2o3YW9JaEQwMWhwQUlMWG9YZkdDU3lvc2lLbTNK?=
 =?utf-8?B?N081QmZFZnVvS3JNQjBTc3hpaHdETmNlQW0yZ1VyYkhHaGg5YUIzTDVmRmcv?=
 =?utf-8?B?SGFOdmVzQjNxK2hUMkN4L2ZlSEcyU1lzelNHa1RQaDVJTG91ejk2Mm00aTVj?=
 =?utf-8?B?dWNjcHBPd3FYTXBZMzdqTXVCZytMVnBualJiSVZjV3JvM3VUdWI2b0FHcm9V?=
 =?utf-8?B?S3RhK2ZIR0lFRXkzQlVTdVlJL3VCMElleHdsclRFcmJ1OXVTM1RGL29YZjVE?=
 =?utf-8?B?TkVXZEs1eXRaOW9zeWFOeUI4UEpnTDlRMmtiN1lsakc1bVozTGtNQ2hiZ3BV?=
 =?utf-8?B?WkU5QW1qaFV4b2xQS3YyU2RaZGoyUFRhQkpkMTF3SmxsSmowN09hYjV4Vnc4?=
 =?utf-8?B?T3E4RnpydEM2VTBoYjN4NEZCd1A5NThiM3dFekdYbmkxcDh5Nmw3VkVyN0JO?=
 =?utf-8?B?dk9ERi9HUWkvTVc1VXFORlFuMU9QalFxc2Q3NlZRSkYrcStKQjNjbHB6RnJE?=
 =?utf-8?B?bituQWdGY2FTc2x6em8xUlFINW9wV01BYWtCR29Yem1aaHJ2cFVIOG9HcWZx?=
 =?utf-8?B?QVNXVmJPcVJaWnhZMkhsbDBjdW0vLzVVeXdxYldkOGFtVUhKSUk0TmsyQVVK?=
 =?utf-8?B?VkcydVR0K3NIV0ZDS0FhVWVSZEduV3RsOTZrR0g0dEdqSVlwaTk5endqSW16?=
 =?utf-8?B?NUVJUDgyZGJSdWpkSkhFZUxINlk4ekZVeTNoaENpbU10cS9raWFkYmF3c3Bh?=
 =?utf-8?B?UG45ajVYU28zZHlaZHBWNUJqWGVPN243OGJOV0Q2Zys2RmQ3QUxyT2dzZzhh?=
 =?utf-8?B?UHVadVdXS0RMVkpxZkNjY0QvSzZ2aTFlMUFLNitNOVJDOE0xSktXTzB4b1kz?=
 =?utf-8?B?cFR6YURyVjROZkR1VlFMZ3ROR0xQeml0UzA1Y1VobkJ0YmFBdnQ2UEp2UzlP?=
 =?utf-8?B?emNKUWdBNXltblkvYzRjbmRVand2emtUaXRMZjRkSkZGcS94MlpjaG5MRmMw?=
 =?utf-8?B?bUxiWTE2aC9JbXRpOUZYUllDRlVicEZ1clNxeitTYWFCcTNUalhETmpyTDNx?=
 =?utf-8?B?QzRnSFI0RDZhWVdrbmVlRTFjWDJLWXVvWWg0VGZPaWJMTXlOMHpCZzBFdW4v?=
 =?utf-8?B?Nm5BUWliM3o0MFNoaGVHSE5pNG1RM0RNdko4ZTJ1NUFoRWpSM25CVm5jblNh?=
 =?utf-8?B?MWdmN3U1MjhCTzdBS3VOTmdwNGNIZGN2YjFJY3NzRlphdm54QUdPdTZSZzFx?=
 =?utf-8?B?T0xrRC9hRW1UaDU5ZVNiT3Jzak13dDN6Yi9TZmx1RU9kdVNMa0tvMklmcXp0?=
 =?utf-8?B?UklxeElZMzgrRS9NSkw3MTZGYmJzVXF6S2p1SFo0azRBb2FmZjRvZExrRW1P?=
 =?utf-8?B?WmhCeE5DcEdKR21MVmQydUc1VEt1UzFIN2lYWDdjc3QrYmVjYllsY3ZNWHFG?=
 =?utf-8?B?UGo4QUEwRXpCdzN3MTV3TkdwMGtaaVZCcXRnZHJLaDhsbWhtdXNVVllmc2pu?=
 =?utf-8?B?L3NFSGRoQkR3bHVaREpJVXlpejZFNkJVZEs3S3E1S0tQcDViTnltMGhtU1RB?=
 =?utf-8?B?MDIzemhpcHhEOWJ6ZEhTVTdKYlVudWZDTllISFZKUlhPRE40TzNCVTgrZHQz?=
 =?utf-8?Q?blKtH9zbNG/sgVcRMzJzimg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <445EE71B1EF1284194D349165E26F28F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a249990b-999a-4679-2d5e-08dad3ed0ecc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 22:40:33.4850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iY0xSY6SMIir/DSeBVqd3+r9QdHplTaUrIn4mxOdndldt3b+fq2X9/ju/TwWu038XsQ7gVuf8G+0zeueu4FjzEa7GmE/FvHd86RUihW3cvnPk4PHSqJkB3zlwOnmhQQu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
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

RmV3IG5pdHMgLSBtb3N0IG9mIHdoaWNoIGFyZSByZXBlYXRzIGZyb20gZXhpc3RpbmcgcmV2aWV3
IGNvbW1lbnRzLg0KSSBkaWQgaGF2ZSAxIGZlZWRiYWNrLiBGdW5jdGlvbmFsbHksIGNvZGUgbG9n
aWMgaXMgY29ycmVjdC4NCg0KVG8gc3BlZWQgdGhpbmdzIHVwLCBJJ2xsIHByb3ZpZGUgYSBjb25k
aXRpb25hbCBSLWIgaWYgeW91IGFkZHJlc3MgdGhlIGZlZWRiYWNrIGJlbG93ICsgZml4IHRoZSB0
aGUgQklUMy0+dG8tQklUNCB1bmNvcmUtDQpmbGFncyBmaXguIE90aGVycyBhcmUgbml0cyBpbiBt
eSBib29rOsKgDQooY29uZGl0aW9uYWwpIFJldmlld2VkLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5w
cmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCg0KDQpPbiBNb24sIDIwMjItMTEtMjEgYXQg
MTU6MTYgLTA4MDAsIENlcmFvbG8gU3B1cmlvLCBEYW5pZWxlIHdyb3RlOg0KPiBJZiB0aGUgR1ND
IHdhcyBsb2FkZWQsIHRoZSBvbmx5IHdheSB0byBzdG9wIGl0IGR1cmluZyB0aGUgZHJpdmVyIHVu
bG9hZA0KPiBmbG93IGlzIHRvIGRvIGEgZHJpdmVyLUZMUi4NCj4gVGhlIGRyaXZlci1GTFIgaXMg
bm90IHRoZSBzYW1lIGFzIFBDSSBjb25maWcgc3BhY2UgRkxSIGluIHRoYXQNCj4gaXQgZG9lc24n
dCByZXNldCB0aGUgU0dVbml0IGFuZCBkb2Vzbid0IG1vZGlmeSB0aGUgUENJIGNvbmZpZw0KPiBz
cGFjZS4gVGh1cywgaXQgZG9lc24ndCByZXF1aXJlIGEgcmUtZW51bWVyYXRpb24gb2YgdGhlIFBD
SSBCQVJzLg0KPiBIb3dldmVyLCB0aGUgZHJpdmVyLUZMUiBkb2VzIGNhdXNlIGEgbWVtb3J5IHdp
cGUgb2YgZ3JhcGhpY3MgbWVtb3J5DQo+IG9uIGFsbCBkaXNjcmV0ZSBHUFUgcGxhdGZvcm1zIG9y
IGEgd2lwZSBsaW1pdGVkIHRvIHN0b2xlbiBtZW1vcnkNCj4gb24gdGhlIGludGVncmF0ZWQgR1BV
IHBsYXRmb3Jtcy4NCg0KDQpBbGFuOiBbc25pcF0NCg0KDQo+ID4gKwkvKg0KPiArCSAqIE9uY2Ug
dGhlIEdTQyBGVyBpcyBsb2FkZWQsIHRoZSBvbmx5IHdheSB0byBraWxsIGl0IG9uIGRyaXZlciB1
bmxvYWQNCj4gKwkgKiBpcyB0byBkbyBhIGRyaXZlciBGTFIuIEdpdmVuIHRoaXMgaXMgYSB2ZXJ5
IGRpc3J1cHRpdmUgYWN0aW9uLCB3ZQ0KPiArCSAqIHdhbnQgdG8gZG8gaXQgYXMgdGhlIGxhc3Qg
YWN0aW9uIGJlZm9yZSByZWxlYXNpbmcgdGhlIGFjY2VzcyB0byB0aGUNCj4gKwkgKiBNTUlPIGJh
ciwgd2hpY2ggbWVhbnMgd2UgbmVlZCB0byBkbyBpdCBhcyBwYXJ0IG9mIHRoZSBwcmltYXJ5IHVu
Y29yZQ0KPiArCSAqIGNsZWFudXAuDQo+ICsJICovDQo+ICsJaW50ZWxfdW5jb3JlX3NldF9mbHJf
b25fZmluaSgmZ3QtPmk5MTUtPnVuY29yZSk7DQoNCkFsYW46IE5pdDogUGVyaGFwcyBkZWZpbmUg
d2hhdCBkaXNydXB0aXZlIChpLmUuIHRoZSB3aG9sZSBtZW1vcnkgd2lwaW5nIGltcGFjdCkgLSBh
bGlnbnMgd2l0aCB3aGF0IFJvZHJpZ28gY29tbWVudGVkIGkNCnRoaW5rPw0KDQpBbGFuOiBOaXQ6
IE1pZ2h0IGJlIGltcG9ydGFudCBmb3IgZGV2ZWxvcGVycyBkZWJ1Z2dpbmcgaXNzdWVzIHRvIHN0
YXRlIChpbiBjb21tZW50cykgdGhhdCB0aGUgc2VjdXJpdHkgRlcgaGFzIGJlZW4NCnByb3ZpZGVk
IGEgZHluYW1pY2FsbHkgYWxsb2NhdGVkIG1lbW9yeSB3aGljaCBpcyB3aHkgaXQgTVVTVCBiZSBr
aWxsZWQgb24gdW5sb2FkICh1bmxpa2UgcHJpb3IgR2VuIFNPQ3MpLg0KDQpBbGFuOiBGZWVkYmFj
azogSSB0aGluayBpbnRlbF91bmNvcmVfc2V0X2Zscl9vbl9maW5pIHNob3VsZCBjYWxsZWQgYmVm
b3JlIGdzY19md19sb2FkKCkgKG9yIGFmdGVyIGJ1dCBzdGlsbCBjYWxsZWQgaWYNCmxvYWRpbmcg
ZmFpbGVkIHdpdGggYW5kIGVycm9yIGluZGljYXRpbmcgdGhlIGluc3RydWN0aW9uIHdhcyBhbHJl
YWR5IHNlbnQgc3VjaCBhcyB0aGUgdGltZW91dCBlcnJvciwgYmVmb3JlIHRoZSBiYWlsKS4NClRo
aXMgd291bGQgYmUgYmV0dGVyIHRvIGVuc3VyZSBhIGNsZWFuIHNsYXRlIGlzIHNldCB1cG9uIHVu
bG9hZCBldmVuIGlmIGdzYyBmaXJtd2FyZSB3YXMgYXR0ZW1wdGVkIHRvIGdldCBsb2FkZWQuDQoN
CkFsYW46IFtzbmlwXQ0KDQoNCj4gKwkvKg0KPiArCSAqIE1ha2Ugc3VyZSBhbnkgcGVuZGluZyBG
TFIgcmVxdWVzdHMgaGF2ZSBjbGVhcmVkIGJ5IHdhaXRpbmcgZm9yIHRoZQ0KPiArCSAqIEZMUiB0
cmlnZ2VyIGJpdCB0byBnbyB0byB6ZXJvLiBBbHNvIGNsZWFyIEdVX0RFQlVHJ3MgRFJJVkVSRkxS
X1NUQVRVUw0KPiArCSAqIHRvIG1ha2Ugc3VyZSBpdCdzIG5vdCBzdGlsbCBzZXQgZnJvbSBhIHBy
aW9yIGF0dGVtcHQgKGl0J3MgYSB3cml0ZSB0bw0KPiArCSAqIGNsZWFyIGJpdCkuDQo+ICsJICog
Tm90ZSB0aGF0IHdlIHNob3VsZCBuZXZlciBiZSBpbiBhIHNpdHVhdGlvbiB3aGVyZSBhIHByZXZp
b3VzIGF0dGVtcHQNCj4gKwkgKiBpcyBzdGlsbCBwZW5kaW5nICh1bmxlc3MgdGhlIEhXIGlzIHRv
dGFsbHkgZGVhZCksIGJ1dCBiZXR0ZXIgdG8gYmUNCj4gKwkgKiBzYWZlIGluIGNhc2Ugc29tZXRo
aW5nIHVuZXhwZWN0ZWQgaGFwcGVucw0KPiArCSAqLw0KPiArCXJldCA9IGludGVsX3dhaXRfZm9y
X3JlZ2lzdGVyX2Z3KHVuY29yZSwgR1VfQ05UTCwgRFJJVkVSRkxSLCAwLCBmbHJfdGltZW91dF9t
cyk7DQo+ICsJaWYgKHJldCkgew0KPiArCQlkcm1fZXJyKCZpOTE1LT5kcm0sDQo+ICsJCQkiRmFp
bGVkIHRvIHdhaXQgZm9yIERyaXZlci1GTFIgYml0IHRvIGNsZWFyISAlZFxuIiwNCj4gKwkJCXJl
dCk7DQo+ICsJCXJldHVybjsNCj4gKwl9DQo+ICsJaW50ZWxfdW5jb3JlX3dyaXRlX2Z3KHVuY29y
ZSwgR1VfREVCVUcsIERSSVZFUkZMUl9TVEFUVVMpOw0KPiArDQpBbGFuOiBOaXQ6IHdpdGggdGhl
IGN1cnJlbnQgZGVmaW5pdGlvbiBvZiBNVEwgcmVnaXN0ZXJzLCBub3RoaW5nIGlzIHdyb25nIHdp
dGggYWJvdmUgY29kZSBidXQgZm9yIHRoZSBzYWtlIG9mIGNvZGUtDQppbnRlbnQtcmVhZGFiaWxp
dHksIHBlcmhhcHMgYmV0dGVyIHRvIHVzZSBpbnRlbF91bmNvcmVfcm13X2Z3IG9uIGFib3ZlIHRv
by4NCg0KQWxhbjogW3NuaXBdDQoNCj4gQEAgLTE1Myw2ICsxNTMsNyBAQCBzdHJ1Y3QgaW50ZWxf
dW5jb3JlIHsNCj4gICNkZWZpbmUgVU5DT1JFX0hBU19GUEdBX0RCR19VTkNMQUlNRUQJQklUKDEp
DQo+ICAjZGVmaW5lIFVOQ09SRV9IQVNfREJHX1VOQ0xBSU1FRAlCSVQoMikNCj4gICNkZWZpbmUg
VU5DT1JFX0hBU19GSUZPCQkJQklUKDMpDQo+ICsjZGVmaW5lIFVOQ09SRV9ORUVEU19GTFJfT05f
RklOSQlCSVQoMykNCj4gIA0KQWxhbjogRml4OiB5ZWFoIC0gdGhpcyBuZWVkcyB0byBiZSA0IC0g
dSBhbHJlYWR5IGNhdWdodCB0aGF0Lg0KDQo=
