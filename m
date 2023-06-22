Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC50873966B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 06:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F131110E375;
	Thu, 22 Jun 2023 04:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11011003.outbound.protection.outlook.com [52.101.47.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155D510E04A;
 Thu, 22 Jun 2023 04:29:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvlaGF7yXvKS7Dz6TXE80pnaQz99LAbmJR4rxWw+gZQW2UywBOZa9KrBn3oM8xZTgJ9rZJchyghNzqorQ5YbFjxV3nTfngblDF/fdVTbXguymCxhU15UM74WFJJ34MkUYVfXKB87vOebJcirROfJqOZ7JgNkoUSLJ8Ovmwq6roIImq0P6sWnVeC7r7GUwsxyM0Vhh7U9ScqnizYGTY5ZTkRKP5LDk81R48/mn2gcfEb+IA8sfXzsjyqZmYNZcpcsHdb1/D+gO0ZzAm5syzRZbv9Irair5QqWGRrfTKW4r2BGXmBjuw4PzuGRDo+SkjW2+0bgtiZySrnLVU5B4/I34Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kg1fQ4V8vktPyLH+fpa4XMnp1dQYVPlGxlN1347mDWs=;
 b=gdlbsanbiA/Oj7y+8lWPdAg08HeWaBq1g7ixVqOL9sD4KyGmyxOZhZrwfE4Q/4IooX3wU0TbywxD+KFWnW4V1vWzIWihU9YRuWJtXi0Twhs6oU3X9ek2Fk+SnVO9ZispKTcMwjKhnrSml/gYlCRTU6BZ/RCnOFEuYfxUBqi5R4mjdkO2UnGR5vyQu1pRY9pn2498XbfEwVLYwZANgxVLDJh4L17j1jonnNdNCsgmChheQKd8ybURBhuTF/4V+lmddcu/02GLyRoK6fXw2ou7LI/UHGEMT9e/VGI0NWls+pKJFsee+qmGHAp0/USdQgg9yr1xfvRKCW9q+MvQZhuwmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kg1fQ4V8vktPyLH+fpa4XMnp1dQYVPlGxlN1347mDWs=;
 b=gtV7DnSB9VGLQ9UF+O14jMBWVlDiWw+RrxMkAG6n1J4GEPMbpYz7JFn7vuVAExoL/hxcbsQhRRp8zlGNLyCzF9FIr0CbZtXYp+2eACyJwIJCVNvFheZFES+2nPg5LerJ0Rjse1hcPs0fsMQXcw3lEeVwBMpUv8kX7J/M+42AUw0=
Received: from IA0PR05MB9832.namprd05.prod.outlook.com (2603:10b6:208:404::6)
 by PH0PR05MB9747.namprd05.prod.outlook.com (2603:10b6:510:280::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Thu, 22 Jun
 2023 04:29:39 +0000
Received: from IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::ae06:b40c:b514:83fa]) by IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::ae06:b40c:b514:83fa%7]) with mapi id 15.20.6500.036; Thu, 22 Jun 2023
 04:29:39 +0000
From: Zack Rusin <zackr@vmware.com>
To: "javierm@redhat.com" <javierm@redhat.com>, "aesteve@redhat.com"
 <aesteve@redhat.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Thread-Topic: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Thread-Index: AQHYdpeKjA+fIeSl9UGD1Oezsoj+Fa09u26AgAqjB4CAAAUFgII8exyAgBJTIACAAWVqAA==
Date: Thu, 22 Jun 2023 04:29:39 +0000
Message-ID: <53f4fe46502841ed64d404e23d08b4280cb9b72c.camel@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local> <YqMH14MEqGZtujfk@phenom.ffwll.local>
 <3ef205a7-f418-e22d-6bae-7be08f60d2f8@redhat.com>
 <87legdi93z.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87legdi93z.fsf@minerva.mail-host-address-is-not-set>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR05MB9832:EE_|PH0PR05MB9747:EE_
x-ms-office365-filtering-correlation-id: 352b762f-dd08-4e27-00e4-08db72d94ade
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fU8sbIDAAimRAaDLIYqA8yjJHiAChefkSk5KBHq50tBYDSfBmJa7l+sXnP0f0Wq6rn5v0vZl8Dmw5enx8OV2RTElMVaI98anJWOsQOCBrkYxhcm6lPNsPVzJZsFYO9h5j/t04pFQsRTtBaBi8tcggyDuDUtcJA1EN1sja4OQ7a7byud3oC6Mx3KovOQpw+8LWSzlFgca5JLQ3s43Hzue652Ug+Q0kOXAB89eo4ebigRYKkFRztIbaqE90VgEdvLSJ082DCzptsZO2Rm9lNs0LXaYecx8Hpzr5rX0H89HLWP++DVmFzvwbM+haYAvCSvfxIskEwt5GkR5sLLsDfcvgs9dFFOigUX8dgug/D/QD4xyS5gasTIfbFtXfvd4ttwr0yxg3w0Su5AX0Bi11LRbqaalX7UsrrBW8c5ad9j4pPjPjP/2QkG2xQ3TUtLjAjPvlagiq5dSVLI+8OxQciR+P55b2nhz6ew+Xrzw9koFEQ02TzT7b4wsV+MxSGSEGOErYTQOKoiAcXP6aqJauqUUIAlb6U9VbT2rYoz/cwzhdhkKJzQD4k9T/KK26ndb8Fi2xmjtWAU+hqjMzpurqjzmIzymlsg5+HPUtrDwwPAldXXpuGyOQZ6D+mEa8bGznyizTYnloezIrHRNiCehv7XdeeGe/C/GWwVMUgZGbUggvsv4lclBx4qvzMyt1HFez6q1PGNzn+paU8m1mvjP1U9Mpw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR05MB9832.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199021)(316002)(5660300002)(7416002)(478600001)(26005)(66946007)(66446008)(66476007)(64756008)(110136005)(66556008)(54906003)(41300700001)(4326008)(76116006)(2906002)(53546011)(6486002)(8936002)(6506007)(8676002)(186003)(6512007)(2616005)(66899021)(122000001)(38100700002)(71200400001)(36756003)(966005)(86362001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZU9MWStjMkdzVzB4QjFqUHVOdEN6cWQwQUU4VUZrai9XZU9IbGIrTFlIVEMy?=
 =?utf-8?B?cGwrYUp6aldoak1aaUw0SlhNZEIzcU1heC9wK0lya3QvOE81SDM1QWlQMjBz?=
 =?utf-8?B?dzFjbW9nUFc0bzFGWWtYNDcwWDgvSW9wbHpRZ21qOVgrV1RMRGRXdWRJbzFJ?=
 =?utf-8?B?M0ozZUFtRDlyMWRzOUJVSk1DaHRNUTd5U1J2M0lzaVFiUjYzWWlkaytWc29K?=
 =?utf-8?B?ek1HQjRBRkxSMjRQK3pmODl0TDNZN0cySDlJdFl4dHYyeGJZc3RuRklxMTNt?=
 =?utf-8?B?ZTZ5a1RHd3M0blpDb2tGR2M3M3RWYnRCME5CV2xYTFZOQmlqNWM1TnlaRHdi?=
 =?utf-8?B?QmV5KzlqYzQySS9pd1ZhV0d0SGdDNWZNOEk4RmJDVnpJa2g4OW1ORk05WFFJ?=
 =?utf-8?B?d1VUS3ZWdS9EZkxXSEVHRkNodHN3WHRKNHRVaVM1RjlCTENqVXYrekRCY2Rw?=
 =?utf-8?B?dHV0WGVzZEdFclV5OVJic1BBK0JYaTVKaTZZcEhLSDFsZUtmNzcxRnFWdkJO?=
 =?utf-8?B?OEE4eXZEb1ZubkdSbnZ6dEpkRjQ4Q1lZNXJSOFhOR2swenVjMC85NjNUZzZ2?=
 =?utf-8?B?dG93alEyYVhnL1Y5NDBzcllDeERsenZ0M0lpU3RFUEtneTJSWTA0V0IrcVk2?=
 =?utf-8?B?QldTQ0YxcERYNENXVW9DSlNGZmgyN3ljMWV2L216R3dVZjRSam9mMDlyd3d3?=
 =?utf-8?B?djNiVVJueWRtTHJEKzNBb3M0TTlyVjlaU0U3MTcwbENQdU9TWWNTbE56Yi80?=
 =?utf-8?B?OWhqT2JWK1B6MTVzRzNva1l1TkZVaHFOVGx5R2V2VDVwOEVaTXZ1eEV1YXF0?=
 =?utf-8?B?RFhmY2poa0RySmFqSmRmVFRhVkdWZzY0ZzVYV292Q2Fza3cvVW0xSDhURk9v?=
 =?utf-8?B?OFJRK1JYK3JubjNReFVERy9PbjVIS2ZYRWI4UCtEdUNSTHY0MC9UVDNtWlVS?=
 =?utf-8?B?Rlp6VzVmYzArZTFpY3U3YmJvNUVjcU9vaHZXbEtvR01hdjNsNDlDOWp5bFg2?=
 =?utf-8?B?bUE5MmtYVjY0OHNVZlFQcllUUE42c2hhcVVlaE10OTdxQU9RWEFwaElNTFcz?=
 =?utf-8?B?YW1LWFVxQVR3RThleWFIRHdXM0czamxOYkxtMTNLUFpZbVRFS3VGeWV1Mksy?=
 =?utf-8?B?VUhCZE1KM05ZNTBWQW1IRW8wZjYzSnNMK1BmVkVnNTA3d01SVlQ0bDV3U3pL?=
 =?utf-8?B?YTZ5RDN5Q2p0bGJYRUxudk9oQStiWGRxaG1heTE0YzVaaS9oVm1xay9oL3Mr?=
 =?utf-8?B?VTFsR0VBT2Jxc0ZmQXJJaVN0QlFQd2Z1TkZ4ek9oSmlYREZub0xZOTA2TnhM?=
 =?utf-8?B?T244Vy83WVVxazUyVGZkMzRMTkJHRDUyb2poR2Q5dG1tYzF4VmNVdVpYWm9N?=
 =?utf-8?B?MXFKSXVsM0hlNGpOTlBlT3lKS1pFSExCOS8rM1dtWmhYL2FyeHA0ZDg3aEFO?=
 =?utf-8?B?T3lHdGNwWTBOeW1mbkp5c1NacHlZTjZnVmpCVFA4YnB6Y3NOeStUbjZXUHBO?=
 =?utf-8?B?TzRLNkNlN2FwYUg2WFptbi84TllubGtRUjMrMTF3aFpoL0Z4YnEwR0V2NmRC?=
 =?utf-8?B?cU5SZjQ5d0dnbkZIVGlLRlFvMjVOWEFzV21KUzlMSnVBWEU5RHo2RXgyNEkv?=
 =?utf-8?B?dUNhdDJORHRCU05zLzJYdlVwSng5WHNIRlg4dzF2Z0tmbjhBc3h3WEFsRVYz?=
 =?utf-8?B?Rk40SXk5WHZhSkN1NXYxUUNQMmRmUjVSNzRLT2NFTXhWbmVFMUhNMVlSTzRl?=
 =?utf-8?B?YWtROWpyYTByZGNVWnlWWHhVSW5QWWlsak5ITHB5Vmp5L0kyYUFHZnFmSEt5?=
 =?utf-8?B?Y0tiQ0hWbXc0NExnRVo1OVNkZytoZ0VITnJOOGwyd3NZMWpSZS9xTEZwUHZJ?=
 =?utf-8?B?Rnd0NlNsaUFvRk8wOGFxVWhWRVVMSHhiTXQ5TWZBWHpZcjlQMG82NEp1Z3Er?=
 =?utf-8?B?YVVMcERpTzIrQmFicmRHOGo5c0NUdUNJazdvWWRDL2trQk5JbDVlQzJsU1g1?=
 =?utf-8?B?SVQ0N1N5YkhPZjBsdHBQc2cwajFtRFZBQTloNmdVOTNQdTJQT0lYSFdFN3Jh?=
 =?utf-8?B?VXZYUUtoVDBPaUQzUjJLK1E0SEFyZGVwaDhMUjlsV2YzMDJxTzdSNlRFa25N?=
 =?utf-8?Q?KrVJ9lIh9bUEOzeeUWrrhv1/Z?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7524A5A446603A4EAF92496D49AD4CD3@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR05MB9832.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352b762f-dd08-4e27-00e4-08db72d94ade
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 04:29:39.2083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nCTE0NLWlRqjP17Nx/i2nkz3cotVQj1+/XxnagI1ZxuhLVxafBGGnDi/zY0WYRUS47sv/Qh7FrXfwKvaX3/Vsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB9747
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
Cc: "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA2LTIxIGF0IDA5OjEwICswMjAwLCBKYXZpZXIgTWFydGluZXogQ2FuaWxs
YXMgd3JvdGU6DQo+ICEhIEV4dGVybmFsIEVtYWlsDQo+IA0KPiBbYWRkaW5nIFphY2sgUnVzaW4g
YWdhaW4gd2hvIHNlZW1zIHRvIGhhdmUgZmFsbGVuIGZyb20gdGhlIENjIGxpc3RdDQo+IA0KPiBB
bGJlcnQgRXN0ZXZlIDxhZXN0ZXZlQHJlZGhhdC5jb20+IHdyaXRlczoNCj4gPiBPbiA2LzEwLzIy
IDEwOjU5LCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPiA+ID4gT24gRnJpLCBKdW4gMTAsIDIwMjIg
YXQgMTA6NDE6MDVBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToNCj4gDQo+IFsuLi5dDQo+
IA0KPiA+ID4gPiAtIHRoaXJkIGlzc3VlOiBUaGVzZSBzcGVjaWFsIHZpcnR1YWwgZGlzcGxheSBw
cm9wZXJ0aWVzIGFyZW50IGRvY3VtZW50ZWQuDQo+ID4gPiA+IMKgwqAgQXNpZGUgZnJvbSBob3Rz
cG90IHRoZXJlJ3MgYWxzbyBzdWdnZXN0ZWQgWC9ZIGFuZCBtYXliZSBvdGhlciBzdHVmZi4gSQ0K
PiA+ID4gPiDCoMKgIGhhdmUgbm8gaWRlYSB3aGF0IHN1Z2dlc3RlZCBYL1kgZG9lcyBhbmQgd2hh
dCB1c2Vyc3BhY2Ugc2hvdWxkIGRvIHdpdGgNCj4gPiA+ID4gwqDCoCBpdC4gSSB0aGluayB3ZSBu
ZWVkIGEgbmV3IHNlY3Rpb24gZm9yIHZpcnR1YWxpemVkIGRyaXZlcnMgd2hpY2g6DQo+ID4gPiA+
IMKgwqAgLSBkb2N1bWVudHMgYWxsIHRoZSBwcm9wZXJ0aWVzIGludm9sdmVkDQo+ID4gPiA+IMKg
wqAgLSBkb2N1bWVudHMgdGhlIG5ldyBjYXAgZm9yIGVuYWJsaW5nIHZpcnR1YWwgY3Vyc29yIHBs
YW5lcw0KPiA+ID4gPiDCoMKgIC0gZG9jdW1lbnRzIHNvbWUgb2YgdGhlIGtleSBmbG93cyB0aGF0
IGNvbXBvc2l0b3JzIHNob3VsZCBpbXBsZW1lbnQgZm9yDQo+ID4gPiA+IMKgwqDCoMKgIGJlc3Qg
ZXhwZXJpZW5jZQ0KPiA+ID4gPiDCoMKgIC0gZG9jdW1lbnRzIGhvdyBleGFjdGx5IHRoZSB1c2Vy
IGV4cGVyaWVuY2Ugd2lsbCBkZWdyYWRlIGlmIGNvbXBvc2l0b3JzDQo+ID4gPiA+IMKgwqDCoMKg
IHByZXRlbmQgaXQncyBqdXN0IGEgbm9ybWFsIGttcyBkcml2ZXIgKG1heWJlIHB1dCB0aGF0IGlu
dG8gZWFjaCBvZiB0aGUNCj4gPiA+ID4gwqDCoMKgwqAgc3BlY2lhbCBmbG93cyB0aGF0IGEgY29t
cG9zaXRvciBpZGVhbGx5IHN1cHBvcnRzKQ0KPiA+ID4gPiDCoMKgIC0gd2hhdGV2ZXIgb3RoZXIg
Y29tbWVudHMgYW5kIGdhcHMgSSd2ZSBtaXNzZWQsIEknbSBzdXJlDQo+ID4gPiA+IMKgwqDCoMKg
IFNpbW9uL1Bla2thL290aGVycyB3aWxsIGNoaW1lIGluIG9uY2UgdGhlIHBhdGNoIGV4aXN0cy4N
Cj4gDQo+IFdoYXQgaXMgbWlzc2luZyBmb3IgdGhlc2UgcGF0Y2hlcyB0byBsYW5kPyBJZiBJIHVu
ZGVyc3Rvb2QgY29ycmVjdGx5IGlzDQo+IGp1c3QgdGhlc2UgcHJvcGVydGllcyBkb2N1bWVudGF0
aW9uIHRoYXQgU2ltYSBhc2tlZCBhYm92ZSA/DQo+IA0KPiA+ID4gR3JlYXQgYm9udXMgd291bGQg
YmUgYW4gaWd0IHdoaWNoIGRlbW9uc3RyYXRlcyB0aGVzZSBmbG93cy4gV2l0aCB0aGUNCj4gPiA+
IGludGVyYWN0aXZlIGRlYnVnIGJyZWFrcG9pbnRzIHRvIHdhaXQgZm9yIHJlc2l6aW5nIG9yIHdo
YXRldmVyIHRoaXMgc2hvdWxkDQo+ID4gPiBiZSBhbGwgbmVhdGx5IHBvc3NpYmxlLg0KPiA+ID4g
LURhbmllbA0KPiA+IA0KPiA+IEhpIGFsbCwNCj4gPiANCj4gPiBXZSBoYXZlIGJlZW4gdGVzdGlu
ZyB0aGUgdjIgb2YgdGhpcyBwYXRjaCBhbmQgaXQgd29ya3MgY29ycmVjdGx5IGZvciB1cy4NCj4g
PiANCj4gPiBGaXJzdCB3ZSB0ZXN0ZWQgd2l0aCBhIHBhdGNoZWQgTXV0dGVyLCB0aGUgbW91c2Ug
Y2xpY2tzIHdlcmUgY29ycmVjdCwNCj4gPiBhbmQgYmVoYXZpb3Igd2FzIGFzIGV4cGVjdGVkLg0K
PiA+IA0KPiA+IEJ1dCBJJ3ZlIGFsc28gYWRkZWQgYW4gSUdUIHRlc3QgYXMgc3VnZ2VzdGVkIGFi
b3ZlOg0KPiA+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9hZXN0ZXZlL2lndC1ncHUt
dG9vbHMvLS9jb21wYXJlL21hc3Rlci4uLm1vZGVzZXQtY3Vyc29yLWhvdHNwb3QtdGVzdD9mcm9t
X3Byb2plY3RfaWQ9MTI3NA0KPiA+IA0KPiA+IEkgY291bGQgcG9zdCB0aGUgSUdUIHBhdGNoIHVw
c3RyZWFtIG9uY2UgWmFjaydzIHBhdGNoZXMgbGFuZC4NCj4gPiANCj4gDQo+IFphY2ssIGFyZSB5
b3UgcGxhbm5pbmcgdG8gcmUtc3BpbiB0aGUgc2VyaWVzIHNvb24/IE90aGVyd2lzZSBBbGJlcnQg
Y291bGQNCj4gY29udGludWUgd29ya2luZyBvbiB0aGF0IGlmIHlvdSBwcmVmZXIuDQoNCkJlc2lk
ZXMgbXV0dGVyIEkgd2FudGVkIHRvIHBhdGNoIGt3aW4gYXMgd2VsbCwgYnV0IEkgaGF2ZW4ndCBi
ZWVuIGFibGUgdG8gZmluZCB0aGUNCnRpbWUgdG8gcGF0Y2ggaXQgYXMgd2VsbC4gSSBjYW4gcmVz
cGluIHdpdGggZGlzY3Vzc2VkIGNoYW5nZXMgb3ZlciB0aGUgd2Vla2VuZCBpZg0Kd2UncmUgb2sg
d2l0aCBnZXR0aW5nIHRoaXMgaW4gd2l0aG91dCBrZGUgc3VwcG9ydCBmcm9tIHRoZSBzdGFydC4N
Cg0Keg0KDQo=
