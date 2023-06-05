Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A79217233CA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 01:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3FD10E0D6;
	Mon,  5 Jun 2023 23:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B85210E09A;
 Mon,  5 Jun 2023 23:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686009119; x=1717545119;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AKxJOrGaqYjYU9ireh8i2yhjPcYg/stYOoNWpu4Sxeo=;
 b=mJn0ZMA3THNIFF+q3YR0PG/HiTKKJji4tk2B5F6GweouLztvKMghVcq2
 famitsvYE1HQU9pb6w143SUaxUkONbWs40tQ9N3KQsQfd1b5DBSBDg5VK
 UenBFbT6al/LCxvRtutDqMldtKwGXrgO+IL1ThXKBTOZiIWHpoeq9spjF
 GnsHz/AL10s62ryEEHU0IWSLEeTYTrI04f+2GXh1sOUyKFhkgIax06cZp
 tvqTg9ed1dQKGmm/tDpH1dttd4W6s7nR4H63eG4Q6NLsOLiNSjPDmTrIG
 i+zXQ1kp3FwYsM9AluhmRVtMgQaQLQoCdGqMfVeFlR69oLJDjScKDvnRm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="354011671"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="354011671"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 16:51:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738544676"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="738544676"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 05 Jun 2023 16:51:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 16:51:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 16:51:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 16:51:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 16:51:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSkbrzZwyqpOPo9R9S2KN+UG6AZF527SCN/N4fv2fXWSYHxOWVosjMhuMETFZ/DhgNWBM74OTI/5Z3xiremnhM9qfes3Tqq6wW3lbd0h5/FVF+IumfQbn7ig4b7FUQN4UaLeui02uEERzMvgOgwJG4mSsi+4AN3Ov4h+k4JTm6uMnP9Yp31jebbCuTTp/e4C25ky0UcmCLRutL0nhZNYFHl0tPoJSI7r8XpYstAFYs6e0N7dXO2xca0gy5zy3AgzV4vaJ1o6TYK+MaOCEiIqkeD136WAegypy7cvaBbrkTP9QXkxSt/aTsg8ApOClat/432LB6pCeJwJmuXZ/G3BfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKxJOrGaqYjYU9ireh8i2yhjPcYg/stYOoNWpu4Sxeo=;
 b=bNEJBSU5LB6V8t9MSrZcnJJzuANISgFNTFGKxcz/ra0J+uD7SBdr8/c7ViGYSEJ7bMSXSL7E7f1+lBZ9MTnNJnXtbUE+jwVbOa7pD/6g+VJW8FuOfDQpU3ipUyEjbWCI+o+mXfj8asUQVS3OPa/e8FVNA9NTFUGmWm8Q6o0IKTdU7DO7sNvTb74UFs+eis8FxlgmHYsN6lDmwkfw6JI4BPtJYcd241GjNKvAsUjcVigG0hFa+elwfd5m031w12znWTfxxTEl/1NUwMUKgUiBrW/ebCC6ny10+IemKOUAijTVzBB2+lPOJZJ80jZGN9WRZj2TnzzqAecWTI6nb81IFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DS7PR11MB7886.namprd11.prod.outlook.com (2603:10b6:8:d8::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.32; Mon, 5 Jun 2023 23:51:55 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::11d1:e192:b174:e851]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::11d1:e192:b174:e851%4]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 23:51:55 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/6] drm/i915/uc/gsc: extract release and security
 versions from the gsc binary
Thread-Topic: [PATCH 3/6] drm/i915/uc/gsc: extract release and security
 versions from the gsc binary
Thread-Index: AQHZf2tRh28FsVjDD0GOD8EX4/J13q9qkJ4AgALleACAD5x7gA==
Date: Mon, 5 Jun 2023 23:51:55 +0000
Message-ID: <77d3d1a1cfb58b256204cc656ef9f82768580226.camel@intel.com>
References: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
 <20230505160415.889525-4-daniele.ceraolospurio@intel.com>
 <674e85c47cd29b39ad902e5445234b93b2f99883.camel@intel.com>
 <0b37018d-2805-bea8-085c-1deede3f102a@intel.com>
In-Reply-To: <0b37018d-2805-bea8-085c-1deede3f102a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DS7PR11MB7886:EE_
x-ms-office365-filtering-correlation-id: b866b87c-cb01-4045-62b2-08db661fd7b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WHR4FBCpSv3v8guKjIx9KKl1aIx9Cl9Gd03ZlHPsCb6zE4AozP7wo+mR34YqbeRtMartvWHIh76V7l/8KH0jfGJaVvTxUxcX46UbeeOLM97utLxBTARDsf25nSj6Tw4BMXBRlFZZn1Wffk3f4BBLQ+lCd6KQ+oVV6ZUXlwhx0Z0g+ciNlB3s6Csw+pHhQ5E0NyvKw7N7zUfilEcScFSBADVyu4TNbcl/oHQzVjGHHgOD2LdBNhpVbtAVHFpk3JDXcnqeoNeJSvoOCD+5N2oN5PnvQm5Bq5XuRnAGdFPuQPXgK2IQJK/LbX/RTKNTKTKp1+O4+AGOL3IM7STZ13eynMZrsa+5q5XUsSjh+uzhRlKycJKo6ME7X7KbRHVSMnUK9zXXgH7gD3Cptzk4WFVgFLuDFDJ9zKgYExT3yFNUrWZPVMS9Tb9UFpAkjSXx9tK141HuSXFQdrweJDkFZAUdf7Iwi40/2qHSOzCGV0ZEK1eTHZGq7iLx2gr9LBmwjkCOBP48o6DH/qn3h+nG5jJOnzZtoIbtieyqH25Z/2HrXTn/eLtiZf/2LfEw70I/I/S0ei4eKh/2lTG/2ayU9pxovgmgyWnRnBtD7j33RZN6zuJ/dZSpuFsjaNtS4Vje7V5m
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199021)(110136005)(82960400001)(71200400001)(478600001)(8936002)(8676002)(5660300002)(36756003)(38070700005)(86362001)(2906002)(450100002)(4326008)(66446008)(66556008)(122000001)(64756008)(66476007)(91956017)(76116006)(66946007)(316002)(38100700002)(41300700001)(2616005)(6512007)(6506007)(186003)(26005)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q00wNXdxbXAzYlpqNnNrLzlmbDdFUldlU0RHdWpYOTJvbUpUUGRBeUFCMWor?=
 =?utf-8?B?eXVOS0c4THpJNjN6a3pyUlU2UlY0MzVlNnRHd1NoRkdRMjdTUlBpakh3SjJW?=
 =?utf-8?B?ZVJlanB0Nlc5NmNUeVl6YXByeEQ4bXFrc2pzQVN6eGt1bHBIak1JOE9HZ1NO?=
 =?utf-8?B?bHhEaG5tSFU1cTBLbFVILzZVeDkreXFQY01rcTI1TlRFMUtaaW1tVXp0ZTZi?=
 =?utf-8?B?ME9rQ2o2YXJqUWtLM1FOZ3ZXUVEvYUp2Q09BSmxHb2VkQkF1VTYrSU5GVGY1?=
 =?utf-8?B?bGVMM04xRmlwaGJYR1VQb0N4Ly8wOEhTTC96LzY5ekU1Lyswc1pZS3IyTWpm?=
 =?utf-8?B?Nk9jOER4c3dKVXcyRmR6K0FhOTFSUmd4Uk1HY1RweFp0WFluaHRLVE9WdEw4?=
 =?utf-8?B?ZVJmMjR6OXBzUWxSMHZWaUlyR0kxRk54d1hPRVlMMzJDUEVEU0NqaDZvVzlE?=
 =?utf-8?B?a1FXS1BOR2taNFdvMC9oY0FDQnpFRUk1d2FUZ3NUQXlFVnpIbzV4SXJVYk4z?=
 =?utf-8?B?QXFRU1dxVVFQeWhoSEhnVnlHdjlkQzR0d2F6RVlSQTV4UGVuWjcyai9yQys2?=
 =?utf-8?B?VG5ZQWY2ZXdCM05HVHEvblVUZi9aYmxtRkVrOUZwVm1vMlN3T3krUFZOQjhL?=
 =?utf-8?B?N3MzNkpVcm1HUkR6QXgwMVVPR0pjLzlpUHByUHBDYkUwa2N3SllBTTByazZm?=
 =?utf-8?B?bnZzblRmcURIaXRwYUxwRG4zWnUwUnI3c05tYjVIcHF3Wk5HRkhNR3pvSjM2?=
 =?utf-8?B?MDZVTEdMeUNKVEE0SVRjaGVRSXQ0RnBDVlBRbFVmK1UySXZGMmZJaDJ1NnYz?=
 =?utf-8?B?UG9VNVdWMktkblEwZkZYbE11My9aYVdsQ2x5S2JIQlJHYkQ4OEJqTFZsbGI4?=
 =?utf-8?B?Yk1yaU1HWFJxSS9OYzNwL29sQUVZZ1F4UnRlWlJ2dkM0RHlRT01PK1oyWW9C?=
 =?utf-8?B?dXR4Tno4RmFOWjRvNGs3YWt5SEJUSW9ZMWZ4aFhsVEszVkEyMWt0NzdROHNo?=
 =?utf-8?B?RG43YjVxUlNlK3JkZjA0MWdiaXMrOUREd3duTjJrZExPMjd1Um1Ha0xOVzV0?=
 =?utf-8?B?dFNkK3NqTlBlSkNvTUQwenkrdFR5MExiUHNkTEJVaGV6Lzd4MGF3M2ZGQUdX?=
 =?utf-8?B?ZUxyOGhZTS9aYTVFclNuQlE1MWZUWDQzTHZEOVZXd2ltWXNQSFQ3bEppZ3BM?=
 =?utf-8?B?dUhuN09zZ3N6UXpXeHNkYm5PR3dqWmcyUGd1czhEMlpnZDdiU1FWV2FZakwx?=
 =?utf-8?B?OExoMEZMTTlPRUlxRHdnOWhlZ09IcU1Mc2hvQTFDaGhtb0VVZWttT0luaG1y?=
 =?utf-8?B?bWpaTDEzV3dmQU5CNzRMYVl3M0dSalFRY3V4dW1nM3ZPTXYvU0VMZVUxRVB1?=
 =?utf-8?B?ODBmK2Q2Z2JZYlZDekdJQXhyUFVBRVF3SllmRzRqZkFrZVNWRG5ZYjRYZWhU?=
 =?utf-8?B?TEF2enFWRmZrait5M0tJWGdnTE1EL2c2TzgwbFhnUUdwUk5TY2VBamZob1lC?=
 =?utf-8?B?aHNIbUtQTEhqR3lkQXIwRFlGK2dMb2EwU3czWHJwUDBFanJFVU4zVklCTW5N?=
 =?utf-8?B?NVpPTnRLbmxtSm5iMlVZRERZbzk4ZGJ1YzFPTVRrZWFwZFR6OFUyUkdXV25L?=
 =?utf-8?B?YU95N0NTQWprbEFJOG0zNDh2UzhFZjdxQng5cTBZQmxxc3pRamxRYU5kSUIx?=
 =?utf-8?B?S1Y5NE5DeTNNVk0zS3dGVFJEVzF1WjAyUGw3SHNWbFk2NTl2ZDNMZkhJZnBM?=
 =?utf-8?B?M1Blb1BxcVFWZ1lPS0J4SC9WN2dheTdxcHVJRXNTZmtPTThGeVVBeTIwREFX?=
 =?utf-8?B?cDdiVWpKWUozYTdMczJwN1BoNmIwQi91RzZBaGZVR1dqaUF4TWtNK3ZXUmkv?=
 =?utf-8?B?VHp0aUpVOEJYTEEzd2NEWG1ma0tXZHN1Rk4ybVVCdHJnSXd0aE5aaGlMWFBr?=
 =?utf-8?B?eGRNOElmSTYrc0pyVEl2MkZqYU9Uekk3OEpycFFkRXpNZlJXMk1vTHIya0xr?=
 =?utf-8?B?MUpzWDBGZStuRHBBRW5WR0dNMHV1SVJwRWhVZEkyQ2tkY25GVHZlb2gvNkJo?=
 =?utf-8?B?cFk0a2R4djFzdFlVUU4yZEJ2R2xGbk0yWHRlZ0hJSnd4Y0RLK21nWGJwWjlO?=
 =?utf-8?B?QThaMmo3TXZqQnBmVGdKK1FKVVA0T1UyQXo0OVlSTUwwa1RRWnlsK0M2alBp?=
 =?utf-8?Q?OkDBhqiakZpORBTNe0AVLZk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA1B68BCE63D0448A07C2AD73A9C6B91@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b866b87c-cb01-4045-62b2-08db661fd7b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 23:51:55.2094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bxU9o+qJ6h+jTwp+U6rj6CzUANyR0zEN/6950iHPW84DSgQuznwJ7TbFYnD0lggMAiTpEHVtgneAVuglx+rP3zCluiZygvFy5IkbqEHegnAt04MMTm82XTAK/nO/cv/x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7886
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

T24gRnJpLCAyMDIzLTA1LTI2IGF0IDE4OjI3IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gPHNuaXA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvdWMvaW50ZWxfZ3NjX21ldV9oZWFkZXJzLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dC91Yy9pbnRlbF9nc2NfbWV1X2hlYWRlcnMuaA0KPiA+ID4gaW5kZXggZDU1YTY2MjAyNTc2Li44
YmNlMmI4YWVkODQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91
Yy9pbnRlbF9nc2NfbWV1X2hlYWRlcnMuaA0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvdWMvaW50ZWxfZ3NjX21ldV9oZWFkZXJzLmgNCmFsYW46c25pcA0KDQo+ID4gYWxhbjog
c3RydWN0dXJlIGxheW91dCBzZWVtcyB1bm5lY2Vzc2FyaWx5IHJlcGV0aXRpdmUuLi4gd2h5IG5v
dCAtPg0KPiA+IHN0cnVjdCBwYXJ0aXRpb25faW5mbyB7DQo+ID4gCXUzMiBvZmZzZXQ7DQo+ID4g
CXUzMiBzaXplOw0KPiA+IH07DQo+ID4gc3RydWN0IGludGVsX2dzY19sYXlvdXRfcG9pbnRlcnMg
ew0KPiA+IAl1OCByb21fYnlwYXNzX3ZlY3RvclsxNl07DQo+ID4gCS4uLg0KPiA+IAlzdHJ1Y3Qg
cGFydGl0aW9uX2luZm8gZGF0YXA7DQo+ID4gCXN0cnVjdCBwYXJ0aXRpb25faW5mbyBib290cmVn
aW9uWzVdOw0KPiA+IAlzdHJ1Y3QgcGFydGl0aW9uX2luZm8gdHJhY2U7DQo+ID4gfV9fcGFja2Vk
Ow0KPiA+IA0KPiANCj4gSSd2ZSBqdXN0IHJlYWxpemVkIHRoYXQgSSBkaWRuJ3QgcmVwbHkgdG8g
dGhpcyBjb21tZW50LiBUaGUgc3BlY3MgaGF2ZSANCj4gdGhlIHN0cnVjdHVyZSBkZWZpbmVkIHRo
YXQgd2F5LCBzbyBJIHRyaWVkIHRvIGtlZXAgYSAxOjEgbWF0Y2ggbGlrZSB3ZSANCj4gdXN1YWxs
eSBkby4gSSB0aGluayBzd2l0Y2hpbmcgdG8gYSBwYXJ0aXRpb25faW5mbyBzdHJ1Y3R1cmUgaXMg
b2ssIGJ1dCANCj4gSSdsbCBhdm9pZCB0aGUgYXJyYXkgYmVjYXVzZSB0aGUgR1NDIHBhcnRpdGlv
biBhcmUgMS1iYXNlZCwgd2hpY2ggY291bGQgDQo+IGNhdXNlIGNvbmZ1c2lvbiAoaS5lLiBwYXJ0
aXRpb24gYm9vdDEgd291bGQgYmUgYm9vdHJlZ2lvblswXSkuDQphbGFuOiBzdXJlIC0gdGhhdCdz
IGZpbmUgLSBsZXQncyBzdGljayB0byBhbGlnbiB3aXRoIHRoZSBzcGVjIGRlZmluaXRpb25zDQoN
Cg==
