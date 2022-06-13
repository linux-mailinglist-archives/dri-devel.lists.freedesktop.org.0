Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CFB548561
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 15:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9417710E660;
	Mon, 13 Jun 2022 13:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8418410E660;
 Mon, 13 Jun 2022 13:14:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxzPZMVIVP7vsXYuhLoTJq2954jDLAZ5GJHjgH69cBhTFOrii5fgaV5BFjVfIP/luY9tdXUQGAK1HUKqrjwHdaV4uryypT82U8jY+su4JK5kC1eVW4Q92x3/mOe/gbK4mc8L4TdHqSeCevbjA3HMF0KNzSiMupuX3HSDi7/7R9fqKMZ1Tf0X2Lnihi5JNAGB72JV/FS6sSp4Dsw1n0yzl0Z1HlW6ER5QJau417yzZ4MNDy/niQHDTX+wGjtzbfJdI9XqLoH1ByHkajxTQbXeNWP1ek3dGWqIaw+x2OP7tDnVbs56dtDmgoRusx9FuteDREpqiFg/JG5ZZHOPcFekpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoItBzFn2P4SvgbO30AMH4OrnHdlNdm6a8/G4mt5xTU=;
 b=CUzutci7WLgFIW1pzifRec1rY1TH6CBIzK47/0hiRffwI/q1jBHY87z/AmdW2gSTz3XcJ6xa3XNlRbxMxMV9JMVEX4YcXFTD4wr/SlLUsi4Sd0b9UcqyzEXAcDa8eTEaKIW5MNFNlrVOF+dW8reDDGOA054bdqW0xkmZBsZfmACM/jS5ALIkK/FVziK373MU6X4FBEhGh1I6XW67ITywkiHqo+bwf7TP0QyIIhZi00x6A2rcIt0Vtev2Us9/BsyvqrHepYfaGOUL/iIX75wUdEE7kOZtrcCPFqu07FHospemR0haHbR1yXMDHbwH3ejLgH8cl1vfzoLzto7FdCz+Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoItBzFn2P4SvgbO30AMH4OrnHdlNdm6a8/G4mt5xTU=;
 b=BVrY86ncm3XQ6qF5VBYLXHLxH9PGKShKc0crv20WffaMb1Hs5x1ijXW1Qyos/jEoA3+RU6xrFfRZHUn0TqcjiW7guQ1bN46O91VFavfMMdculJJkh9R/OhHuKl2BP2HQtjid36ILBCnrxR7QbuRNL+VB9tdHsuPF14r5M+Y6NEQ=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by BN6PR05MB3491.namprd05.prod.outlook.com (2603:10b6:405:3d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.6; Mon, 13 Jun
 2022 13:14:48 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02%3]) with mapi id 15.20.5353.011; Mon, 13 Jun 2022
 13:14:48 +0000
From: Zack Rusin <zackr@vmware.com>
To: "ppaalanen@gmail.com" <ppaalanen@gmail.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Thread-Topic: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Thread-Index: AQHYdpeKjA+fIeSl9UGD1Oezsoj+Fa09u26AgAqjB4CAAAUFgIAAWsyAgARENACAAF9ygA==
Date: Mon, 13 Jun 2022 13:14:48 +0000
Message-ID: <bcd08cc889e5861d39c115aaf3713ee4152faeca.camel@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local> <YqMH14MEqGZtujfk@phenom.ffwll.local>
 <efacab57ba2105c5b5faa49e85b9f582e0983332.camel@vmware.com>
 <20220613103310.4629f213@eldfell>
In-Reply-To: <20220613103310.4629f213@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19c07379-f786-493e-d831-08da4d3eb14d
x-ms-traffictypediagnostic: BN6PR05MB3491:EE_
x-microsoft-antispam-prvs: <BN6PR05MB3491E1CBF104A272F6CFF77ACEAB9@BN6PR05MB3491.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZvM7lT5v1MD76wH/kkBoMJtqCbJ4ovCydc8DbEy4U24zSJT9MSPWhB7nW4jdB7wfGL2xN+sp+MvrBah2xf2LlLprZ9escCnYMKGF8QB/2htELDUOjKiG8Q3lRffi2QcmgLg0ruhV5EyOtMh1w+9sWCiGw4lEMyZP3+esEijNIzwHXO4ifP1fY6eteCigDljWakt1nxgcVs1eYUIAFkbdO1PO0FzB/Sv0fsC8WFquPH4CepS0y3Y/i22JdJeJswHTwh7aFfe96AI5EDL+2AtBbYKmTO+TiR68vegSbV+/cK+ATupR/bg5ahznxBEQ9YWZLvn5lfqiZ1X5UIax6T9yo1cVpAZRZSNrM0XlCkz2iHs11/9ogzXo16YT6zPzlyteQg3qKwo2WvIzWGAPLZqYRI3uKI/k/ok2OB0UatPzmElkK875j2Afv7ogFMdmeGJia2jl6I4xC48TTBuhSjWlAqVc0Y9+Dzh19Vvp28mtW/OHz1/hRXC/eelMh64WS/etOLFcUBGyPhfwu8vRwcP7u/tpsWlheb71Q6OwT88skFn7UtjpoDsuTH2NKznT2X4SOpNy1n7f+xhT3p0tc/s9rCh8L5yDGX0xl4pYGggcaXSfHUPoc6f+AVy3nco6oaZ++SpgOE47VLA1znLaqqtBYGVQfGepcU5e6Rbcvme6vA83dbs80gxZeIL672sx5cbF1Do72znzX8wBuhBbqs9G9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(6486002)(8676002)(7416002)(91956017)(4326008)(26005)(76116006)(508600001)(8936002)(83380400001)(6512007)(5660300002)(66476007)(66556008)(66946007)(66446008)(64756008)(122000001)(2906002)(54906003)(71200400001)(2616005)(6506007)(186003)(316002)(86362001)(38100700002)(38070700005)(36756003)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akxVTE9heU9YN3BaYW9XT3ZjbXZ2V3ZDVTViMGNuZnZJTWZ5YWgzL1NIL0or?=
 =?utf-8?B?alhmclNqZlVuOE5VS3NZUUdFajA4TGN3a1d2STVpdjBJVWNncVpMVGQya3Rj?=
 =?utf-8?B?bkpqdUVDbms4WDc1N1A4OTUwSmZEZW0xbWRwNlNoTVc5NDlTaG9TZFVXR2xj?=
 =?utf-8?B?Y0J0U3AyUDhWYmZaSnI2T0JRUkZ4SDlQbWw1WkFRUkcwNGtKUzFEendlZlRm?=
 =?utf-8?B?YjVVajd3MFd2OVU5b0pBTDhzOUxkZEZxTjBKRWFIMXJ5eG1LWU9MWTRlZDZ3?=
 =?utf-8?B?KzFRbzh6a3VFdjZ2TzF0WWtKVGZ0Qjlja1ZRdVA1WGtVekhVRm93ejV1SXpj?=
 =?utf-8?B?Tk1Pdjc3Y2xvZHFsQVh6cEJVS2Y3YkxZWnhtR0hpcFdoNTRPWmhsdk96OUhr?=
 =?utf-8?B?RkVkYllYVW5qTmVLZTlvc1NwSjUzbVlaUE9kaFhlOXEycUNqOVRKTVlieDJR?=
 =?utf-8?B?L0JJbUFWNkZRYkFHaVcvcGRReStKQzdTR1FSRldKYkhSOUtLUDlwU295ek9r?=
 =?utf-8?B?VjVaK3VqS3JLcjlmSXBqd3VoQ0hMT1lPYWtjeGlneVgvYTFpM3NKVTVTUHF0?=
 =?utf-8?B?SXplaHhxcVFzZVltNjYwMU4yUjZYMjVFdS91b3RwUG5iUHVGUmY5YzExZFNs?=
 =?utf-8?B?dGxhNnR6eHBzRHV3QUpCekxzcWlGUE1Rb0hVaW5La3FSWkQrY0NQS1cxK0lw?=
 =?utf-8?B?d25jSmpWbVlhcU8wenlZNlpXdGd5RUlkaEdBcEExWjlLbHlFc1RNdUFCLzNP?=
 =?utf-8?B?cWZwdG1nTWRJUkJ2V01pV0c1ZWtoZHdjQXg5MVgwTUl5eTE1N0hXclhvWmFl?=
 =?utf-8?B?azBPOWNsN3dRSGJ3UnpBTWwxQ00zUjl3aXJvQm9KQ3ZvMk5sRkZvd0R2Njdq?=
 =?utf-8?B?Ym5rdGMvYmlRSC85Tk1hdmppaDZDN2FUb2R4Z2h6NGNWelAwL3M2NkZ6ZCty?=
 =?utf-8?B?Q0xBZys5MkRvYm1NcW1rS3BNcGM1S0luSGEydjRjK2ZCWnE5VFgzVDgremN2?=
 =?utf-8?B?K3EraE9pK0dkVGlxek5Yb0hFYVRZcmlnNUhoSkxPUHFTdWdNaWtlelYvcmls?=
 =?utf-8?B?WTZ0aUlhT3pVVWNYUjVpaWcwS1pBcG11Y1NodGFzZnk3WXZXbVJkZFFCWWd3?=
 =?utf-8?B?Z3FnNzJKeEFab3kzZStVK0VFL29nT09OSVJZTForN3ZwR1g3MnpaV2s2SkVi?=
 =?utf-8?B?RHpGa2hTSUtPbjVEMlg0Ynk1UDRNemhwbjhtRE5WQUJEbnFtWmtCTFJnWXlm?=
 =?utf-8?B?R05sTUNURUhjalVaU2JrSzhlVGpTQlQzdEplTEhaRGpxNTFKRldLbGVuVDJH?=
 =?utf-8?B?L2wwVHlkZEloTGJTWmFjMUdZMUNjTktWSlFIOVZVWXgvSDlhMUt0WTYyMGZK?=
 =?utf-8?B?WDkrc0paTHEzbnRKbGxPa1JDVCtCb1JXWWlxODVuY1JibUhHVHowc0V6TUZv?=
 =?utf-8?B?eDY3QzNpOTMyRXNpVjRMempOc0w4QitNODhnNXloZ2p6NTEyUGhFdmVlY0tX?=
 =?utf-8?B?bisrM1JXZFkxdHRaK0JESEZtUDZUblhXOTl2OHg1UWJqWDlPc3UxSzV3L3E1?=
 =?utf-8?B?THI0WGdXSXNsaWtIc01MMERXd1BlRTgvb3FFTDNTRFVjaU1kMWFqMm5yU2lU?=
 =?utf-8?B?QnZ2M2VDdDh3MmtsbjkzU2dSVXhaN3BUWFJjMGgvVHFnTzl0eWU5dkFGSnJ2?=
 =?utf-8?B?RUljQjBWUW9xemxvZ3Rtb25PbzlUTjN0d2d5MU83NWZQaVRkNEVCbXl1SitZ?=
 =?utf-8?B?Yzhla1dRd3VnWWlyWHZGTmVCSnF3T0xvbTd0WUg3aHhnZ3FHdFF4eHcxUlR3?=
 =?utf-8?B?OVlMak1BR0tiS1NVVWl4em55MW83Z0pNWFBHdlhNQ0VWRTFsNUlsa2MvTmhH?=
 =?utf-8?B?OTV5U3JGb2VIc1NSSXl1dm4ybGkzTkx2a2JySmJicHF3V0FLMk9XRkxjbDY0?=
 =?utf-8?B?dGhrN2E5bUlVNHRVdkQrNFlJNjlLdjJjYzNDNlJBZ0ZLdk9pd1lLYTByUjV5?=
 =?utf-8?B?OHpDbEh0NlJ5dEpUVUlUYkNRazVxaTlIWW1lSVFQaS9ROHVPSDJ5Vi9FV2VV?=
 =?utf-8?B?ck5OTDQrUVQzbTZwVnNpRUsrOTJvcEpTZjcreHJxR0lhQ2RBcG9lT3hnTzFi?=
 =?utf-8?B?RzhRbWRvYjhkVURsLzhmMUF4N044YjBiN3RwY2xHU3RTQThjWlJPNlU0R1l4?=
 =?utf-8?B?UkxVTGZKbkFYcUdRaW8zK3YxMFNyTU41NXc5NWIzQ1lZUkNvYnVMemZ2NUg0?=
 =?utf-8?B?cFQyV20xUVF2ekppMVg2N2tsV3RJNmlYa1lnbXJzN1FpQlpvdFQvZHZ5emxu?=
 =?utf-8?B?cFN6VWJTYW1yM1V0S2k3UVRPbk55cHZCdDBhYTMyemNKbzRzcVpSUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BFD47B721510947AD106064E2E2C3D1@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c07379-f786-493e-d831-08da4d3eb14d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 13:14:48.4170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o1jqQbSxoW9UCRYtrW9/0ei1sgeXzLCS0Q+a+zgMEd6O0XJGH5g2XeL9m/w0e+pdLbyE35Q2inTkIth7cjnjMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR05MB3491
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
 Martin Krastev <krastevm@vmware.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTA2LTEzIGF0IDEwOjMzICswMzAwLCBQZWtrYSBQYWFsYW5lbiB3cm90ZToN
Cj4gT24gRnJpLCAxMCBKdW4gMjAyMiAxNDoyNDowMSArMDAwMA0KPiBaYWNrIFJ1c2luIDx6YWNr
ckB2bXdhcmUuY29tPiB3cm90ZToNCj4gDQo+ID4gT24gRnJpLCAyMDIyLTA2LTEwIGF0IDEwOjU5
ICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPiA+ID4g4pqgIEV4dGVybmFsIEVtYWlsDQo+
ID4gPiANCj4gPiA+IE9uIEZyaSwgSnVuIDEwLCAyMDIyIGF0IDEwOjQxOjA1QU0gKzAyMDAsIERh
bmllbCBWZXR0ZXIgd3JvdGU6ICANCj4gPiA+ID4gSGkgYWxsLA0KPiA+ID4gPiANCj4gPiA+ID4g
S2luZGEgdG9wIHBvc3QgYmVjYXVzZSB0aGUgdGhyZWFkIGlzIHNwcmF3bGluZyBhbmQgSSB0aGlu
ayB3ZSBuZWVkIGENCj4gPiA+ID4gc3VtbWFyeS9yZXN0YXJ0LiBJIHRoaW5rIHRoZXJlJ3MgYXQg
bGVhc3QgMyBpc3N1ZXMgaGVyZToNCj4gPiA+ID4gDQo+ID4gPiA+IC0gbGFjayBvZiBob3RzcG90
IHByb3BlcnR5IHN1cHBvcnQsIHdoaWNoIG1lYW5zIGNvbXBvc2l0b3JzIGNhbid0IHJlYWxseQ0K
PiA+ID4gPiAgIHN1cHBvcnQgaG90c3BvdCB3aXRoIGF0b21pYy4gV2hpY2ggaXNuJ3QgZW50aXJl
bHkgdHJ1ZSwgYmVjYXVzZSB5b3UNCj4gPiA+ID4gICB0b3RhbGx5IGNhbiB1c2UgYXRvbWljIGZv
ciB0aGUgcHJpbWFyeSBwbGFuZXMvY3J0Y3MgYW5kIHRoZSBsZWdhY3kNCj4gPiA+ID4gICBjdXJz
b3IgaW9jdGxzLCBidXQgSSB1bmRlcnN0YW5kIHRoYXQgcGVvcGxlIG1pZ2h0IGZpbmQgdGhhdCBh
IGJpdCBzaWxseSA6LSkNCj4gPiA+ID4gDQo+ID4gPiA+ICAgQW55d2F5IHRoaXMgcHJvYmxtZSBp
cyBzb2x2ZWQgYnkgdGhlIHBhdGNoIHNldCBoZXJlLCBhbmQgSSB0aGluayByZXN1bHRzDQo+ID4g
PiA+ICAgaW4gc29tZSBuaWNlIGNsZWFudXBzIHRvIGJvb3QuDQo+ID4gPiA+IA0KPiA+ID4gPiAt
IHRoZSBmYWN0IHRoYXQgY3Vyc29ycyBmb3IgdmlydHVhbCBkcml2ZXJzIGFyZSBub3QgcGxhbmVz
LCBidXQgcmVhbGx5DQo+ID4gPiA+ICAgc3BlY2lhbCB0aGluZ3MuIFdoaWNoIGp1c3QgYnJlYWtz
IHRoZSB1bml2ZXJzYWwgcGxhbmUga21zIHVhcGkuIFRoYXQNCj4gPiA+ID4gICBwYXJ0IGlzbid0
IHNvbHZlZCwgYW5kIEkgZG8gYWdyZWUgd2l0aCBTaW1vbiBhbmQgUGVra2EgdGhhdCB3ZSByZWFs
bHkNCj4gPiA+ID4gICBzaG91bGQgc29sdmUgdGhpcyBiZWZvcmUgd2UgdW5sZWFzaCBldmVuIG1v
cmUgY29tcG9zaXRvcnMgb250byB0aGUNCj4gPiA+ID4gICBhdG9taWMgcGF0aHMgb2YgdmlydHVh
bCBkcml2ZXJzLg0KPiA+ID4gPiANCj4gPiA+ID4gICBJIHRoaW5rIHRoZSBzaW1wbGVzdCBzb2x1
dGlvbiBmb3IgdGhpcyBpczoNCj4gPiA+ID4gICAxLiBhZGQgYSBuZXcgRFJNX1BMQU5FX1RZUEVf
VklSVFVBTF9DVVJTT1IsIGFuZCBzZXQgdGhhdCBmb3IgdGhlc2UNCj4gPiA+ID4gICBzcGVjaWFs
IGN1cnNvciBwbGFuZXMgb24gYWxsIHZpcnR1YWwgZHJpdmVycw0KPiA+ID4gPiAgIDIuIGFkZCB0
aGUgbmV3ICJJIHVuZGVyc3RhbmQgdmlydHVhbCBjdXJzb3JzIHBsYW5lcyIgc2V0cGFyYW0sIGZp
bHRlcg0KPiA+ID4gPiAgIHZpcnR1YWwgY3Vyc29yIHBsYW5lcyBmb3IgdXNlcnNwYWNlIHdoaWNo
IGRvZXNuJ3Qgc2V0IHRoaXMgKGxpa2Ugd2UgZG8NCj4gPiA+ID4gICByaWdodCBub3cgaWYgdXNl
cnNwYWNlIGRvZXNuJ3Qgc2V0IHRoZSB1bml2ZXJzYWwgcGxhbmUgbW9kZSkNCj4gPiA+ID4gICAz
LiBiYWNrcG9ydCB0aGUgYWJvdmUgcGF0Y2hlcyB0byBhbGwgc3RhYmxlIGtlcm5lbHMNCj4gPiA+
ID4gICA0LiBtYWtlIHN1cmUgdGhlIGhvdHNwb3QgcHJvcGVydHkgaXMgb25seSBzZXQgb24gVklS
VFVBTF9DVVJTT1IgcGxhbmVzDQo+ID4gPiA+ICAgYW5kIG5vdGhpbmcgZWxzZSBpbiB0aGUgcmVi
YXNlZCBwYXRjaCBzZXJpZXMgIA0KPiA+ID4gDQo+ID4gPiBTaW1vbiBhbHNvIG1lbnRpb25lZCBv
biBpcmMgdGhhdCB0aGVzZSBzcGVjaWFsIHBsYW5lcyBtdXN0IG5vdCBleHBvc2UgdGhlDQo+ID4g
PiBDUlRDX1gvWSBwcm9wZXJ0eSwgc2luY2UgdGhhdCBkb2Vzbid0IHJlYWxseSBkbyBtdWNoIGF0
IGFsbC4gT3IgaXMgb3VyDQo+ID4gPiB1bmRlcnN0YW5kaW5nIG9mIGhvdyB0aGlzIGFsbCB3b3Jr
cyBmb3IgY29tbWFuZGVlcmVkIGN1cnNvcnMgd3Jvbmc/ICANCj4gPiANCj4gPiBZZXMsIHRoYXQn
cyB0aGUgcGFydCBJIGRvbid0IHVuZGVyc3RhbmQuIEkgZG9uJ3QgdGhpbmsgSSBzZWUgaG93IHRo
ZSBDUlRDX1h8WQ0KPiA+IHByb3BlcnRpZXMgYXJlbid0IHVzZWQuDQo+ID4gDQo+ID4gSSB0aGlu
ayB0aGUgY29uZnVzaW9uIG1pZ2h0IHN0ZW0gZnJvbSB0aGUgZmFjdCB0aGF0IGl0IGFwcGVhcnMg
dGhhdCB0aGUNCj4gPiBoeXBlcnZpc29ycy9ob3N0cyBhcmUgbW92aW5nIHRoYXQgcGxhbmUsIHdo
aWNoIGlzIG5vdCB0aGUgY2FzZS4gV2UgbmV2ZXIgbW92ZSB0aGUNCj4gPiBwbGFuZSBpdHNlbGYs
IHdlIHJlZGlyZWN0IHRoZSBtb3VzZSBmb2N1cy9tb3ZlbWVudCwgdGhhdCdzIHdoYXQncyByZWR1
Y2luZyB0aGUNCj4gPiBsYXRlbmN5IGJ1dCBkb24ndCB0b3VjaCBkcm0gaW50ZXJuYWxzLiBJIGNh
bid0IHNwZWFrIGZvciBldmVyeSB2aXJ0dWFsaXplZCBzdGFjaywNCj4gPiBidXQgd2hhdCBpcyBo
YXBwZW5pbmcgb24gb3VycyBpcyB0aGF0IHdlIHNldCB0aGUgaW1hZ2UgdGhhdCdzIG9uIHRoZSBj
dXJzb3IgcGxhbmUgYXMNCj4gPiB0aGUgY3Vyc29yIG9uIHRoZSBtYWNoaW5lIHRoYXQncyBydW5u
aW5nIHRoZSBndWVzdC4gU28gd2hlbiB5b3UgbW92ZSB0aGUgbW91c2UNCj4gPiBhY3Jvc3MgdGhl
IHNjcmVlbiBhcyB5b3UgZW50ZXIgdGhlIFZNIHdpbmRvdyB0aGUgY3Vyc29yIHBsYW5lIGlzbid0
IHRvdWNoZWQsIGJ1dCB0aGUNCj4gPiBsb2NhbCBtYWNoaW5lcyBjdXJzb3IgY2hhbmdlcyB0byB3
aGF0J3MgaW5zaWRlIHRoZSBjdXJzb3IgcGxhbmUuIFdoZW4gdGhlIG1vdXNlIGlzDQo+ID4gY2xp
Y2tlZCB0aGUgbW91c2UgZGV2aWNlIGluIHRoZSBndWVzdCBnZW5lcmF0ZXMgdGhlIGV2ZW50IHdp
dGggdGhlIHByb3Blcg0KPiA+IGNvb3JkaW5hdGVzIChoZW5jZSB3ZSBuZWVkIHRoZSBob3RzcG90
IHRvIHJvdXRlIHRoYXQgZXZlbnQgY29ycmVjdGx5KS4gVGhhdCdzIHdoZW4NCj4gPiB0aGUgZ3Vl
c3QgcmVhY3RzIGp1c3QgbGlrZSBpdCB3b3VsZCBub3JtYWxseSBvbiBuYXRpdmUgaWYgYSBtb3Vz
ZSBldmVudCB3YXMNCj4gPiByZWNlaXZlZC4NCj4gPiANCj4gPiBUaGUgYWN0dWFsIGN1cnNvciBw
bGFuZSBtaWdodCBub3QgYmUgdmlzaWJsZSB3aGlsZSB0aGlzIGlzIGhhcHBlbmluZyBidXQgZXZl
biB3aGVuDQo+ID4gaXQncyBub3QgdmlzaWJsZSBpdCdzIHN0aWxsIGF0IHdoYXRldmVyIGNydGNf
eHx5IHRoZSBndWVzdCB0aGlua3MgaXQgaXMuIGNydGNfeHx5DQo+ID4gYXJlIHN0aWxsIG9ubHkg
ZHJpdmVuIGJ5IHRoZSBndWVzdHMgbW91c2UgZGV2aWNlLg0KPiA+IA0KPiA+IFdlIGNvbnRyb2wg
dGhlIG1vdXNlIGRldmljZSBhbmQgdmlzaWJpbGl0eSBvZiB0aGUgY3Vyc29yIHBsYW5lIGl0c2Vs
ZiBiYXNlZCBvbg0KPiA+IHdoYXQncyBoYXBwZW5pbmcgaW4gdGhlIHN5c3RlbSBidXQgSSBkb24n
dCB0aGluayB0aGF0J3MgdGhhdCBkaWZmZXJlbnQgZnJvbSBhIG5hdGl2ZQ0KPiA+IHN5c3RlbS4N
Cj4gDQo+IFNvcnJ5IFphY2ssIHdoaWxlIEknbSBzdXJlIHRoYXQgaXMgdGVjaG5pY2FsbHkgY29y
cmVjdCBhbmQgdmVyeSBkZXRhaWx5DQo+IGFjY3VyYXRlLCBpdCdzIHRvdGFsbHkgbm90IGFueSBk
aWZmZXJlbnQgdG8gd2hhdCB3ZSBoYXZlIGJlZW4gdGFsa2luZw0KPiBhYm91dCBhbGwgYWxvbmcu
DQo+IA0KPiBXZSBjYXJlIGFib3V0IGhvdyB0aGluZ3MgbG9vayBsaWtlIHRvIHRoZSBlbmQgdXNl
ciwgYW5kIG5vdCB3aGF0DQo+IHByb3BlcnR5IHZhbHVlcyB0aGUgZ3Vlc3QgS01TIGRyaXZlciBt
aWdodCBoYXZlIGZvciBlYWNoIHBsYW5lLiBUaGUgS01TDQo+IFVBUEkgY29udHJhY3QgaXMgYWJv
dXQgaG93IHRoaW5ncyBsb29rIHRvIHRoZSBlbmQgdXNlciwgbm90IGp1c3Qgd2hhdA0KPiB2YWx1
ZXMgbWlnaHQgYmUgc3RvcmVkIGluIGEgS01TIGRyaXZlciAoYW5kIHRoZW4gaWdub3JlZCkuDQo+
IA0KPiBJdCBkb2Vzbid0IG1hdHRlciBpZiB0aGUgQ1JUQ19YL1kgcHJvcGVydGllcyByZW1haW4g
YXQgd2hhdCB0aGUgZ3Vlc3QNCj4gdXNlcnNwYWNlIHNldCB0aGVtIHRvLCBpZiB5b3UgYXJlIGdv
aW5nIHRvIGhpZGUgdGhlICJyZWFsIiB2aXJ0dWFsDQo+IGN1cnNvciBwbGFuZSBhbmQgaW5zdGVh
ZCB1cGxvYWQgdGhlIGN1cnNvciBpbWFnZSB0byB0aGUgaG9zdCB3aW5kb3cNCj4gc3lzdGVtIHRv
IGJlIGNvbXBvc2l0ZWQgaW5kZXBlbmRlbnRseS4gWW91IGFyZSBicmVha2luZyB0aGUgVUFQSQ0K
PiBjb250cmFjdC4gV2hhdCB0aGUgZW5kIHVzZXIgc2VlcyBpcyAqbm90KiB3aGF0IHRoZSBndWVz
dCBPUyBwcm9ncmFtbWVkLg0KPiBUaGF0J3MgdGhlIHdob2xlIHBvaW50Lg0KPiANCj4gV2hhdCB5
b3UgZGVzY3JpYmVkIGlzIHRoZSB2ZXJ5IGRlZmluaXRpb24gb2YgY3Vyc29yIHBsYW5lIGNvbW1h
bmRlZXJpbmcNCj4gYXMgSSBkZWZpbmVkIGl0OiBzaG93aW5nIHRoZSBjdXJzb3IgaW1hZ2Ugbm90
IHdoZXJlIHRoZSBndWVzdCBPUyBwdXQgaXQuDQo+IA0KPiBJIG5ldmVyIGFzc3VtZWQgdGhhdCB5
b3Ugd291bGQgYWN0dWFsbHkgcmVmbGVjdCBob3N0IGN1cnNvciBwb3NpdGlvbiBpbg0KPiB0aGUg
Z3Vlc3QgS01TIGN1cnNvciBwbGFuZSBDUlRDX1gvWS4gWW91IGp1c3QgaWdub3JlIHRob3NlIHZh
bHVlcw0KPiBjb21wbGV0ZWx5IGluIHRoZSBWTSBzdGFjayBsZXZlbHMgY2xvc2VyIHRvIHRoZSBl
bmQgdXNlcidzIGV5ZXMgaW4NCj4gc2VhbWxlc3MgbW91c2UgbW9kZS4gVGhlIGVuZCBlZmZlY3Qg
aXMgdGhlIHNhbWUuDQoNCkJ1dCB3ZSBkb24ndCBpZ25vcmUgdGhlbSwgd2UgYWJzb2x1dGVseSBu
ZWVkIHRoZW0gdG8gc2V0IHRoZSBtb3VzZSBjdXJzb3IuIFRoaXMgaXMgYQ0KdHdvIHdheSBwcm9j
ZXNzLCBJIHRoaW5rIEhhbnMgbWVudGlvbmVkIHRoYXQsIG1vdXNlIG1pZ2h0IGJlICJzZWFtbGVz
cyIsIGkuZS4gaXQncw0KdGhlIGhvc3Qgcm91dGluZyBjbGlja3MgdG8gdGhlIGd1ZXN0LCBvciBp
dCBtaWdodCBiZSAiZ3Vlc3QgbG9ja2VkIiwgYWxzbyBrbm93biBhcw0KImdhbWluZyBtb3VzZSIs
IGluIHdoaWNoIGNhc2UgaXQncyBmdWxseSBndWVzdCByb3V0ZWQvY29udHJvbGxlZC4gVG8gaGF2
ZSBhbnkgaWRlYQ0Kd2hlcmUgdGhlIGN1cnNvciBpcyB3ZSBhYnNvbHV0ZWx5IHJlcXVpcmUgdGhl
IGNydGNfeHx5Lg0KDQp6DQoNCg==
