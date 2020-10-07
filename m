Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0F62861CF
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 17:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9056E8FA;
	Wed,  7 Oct 2020 15:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37ED6E8FA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 15:08:16 +0000 (UTC)
IronPort-SDR: 5fFjoBBYZQ0YfimkaSadR0NXUvHoPQkir7EbMS7USJdQsgZ/Xx8IGV/5lqI55bOOJYCYCguMpd
 GK/OhwF7FHQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="182449611"
X-IronPort-AV: E=Sophos;i="5.77,347,1596524400"; d="scan'208";a="182449611"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2020 08:08:16 -0700
IronPort-SDR: y71o1ezEBiOTt0t5C0d9vzYHhD21ipA2P6hCbJygqol70mQu4uaM7PR8TR1f/SDcqqIcYC1Riz
 aTm3c5ZJWJsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,347,1596524400"; d="scan'208";a="354932754"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga007.jf.intel.com with ESMTP; 07 Oct 2020 08:08:15 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 7 Oct 2020 08:08:15 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 7 Oct 2020 08:08:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 7 Oct 2020 08:08:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 7 Oct 2020 08:08:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgOIOblKDrmiUR2C16/lyUyao7/YP45l22JJTq5szXBeBhdUu3OQSpqsdBLp9GDTZTMoVCO7S/NpEdysY+lE/SHflFZbT4Qv/34GoqTVEUW2hB+KfQr0kqMlSQGGIVbwWczSImfucoXlVgOj6SyOhnf/JeTyXyPO5z0DI15MUl6V1dNzg0IN+XjHO7DzrAeoTaNI/xuYgpkh8NU2mRcRtWH2OK6WpCDUr4Tn4aNitlIjNUX9hN9chfElfnk8fO713gmXGUlzSo0HpbYnifPGydG42a0z7hsE3Qjq59gik9AWTXXR1yNWls2jV2AQn4Xq9efl2+GFztCjl79TG7L0GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLYp4Fu8oNwR/bmKkXHKOhdOletzl47W2DaO6aPIK8U=;
 b=LLS24GGGd/UT9z0pu8CKrt/Td3NO4FfsBFH8MV8yjOkjOwIExPttiBnJVBd8Tatfq2r4yaMkcVoPcNF1NLuNSHSyrsqxqZ6//gvWOQWSmT7sRf4PaMy73lbru5yCT5U+Y7Yayv2uoYKrflFO+Pq5E/Es5yN7nUWWK0ohhoTk6PF8y+yrZ0RTmctooUu3xDrL3z/AgkNRGLjc5QtnV1xB64QdAQJVAhlmTY1qkaSnAhmJMOzxmaRIXZuMCgAATJpCgkYEJbGhuHK+op2x1V7hTNVlDWgKw8el6zqqFbh0oOMqfg/gLZTCxOpCs12ph1dZ3S51tcLBky99fRAY4zIiXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLYp4Fu8oNwR/bmKkXHKOhdOletzl47W2DaO6aPIK8U=;
 b=rQ5SwGMAGi3F8JiUOouSp1W09F3FZdFa4/tzytzEbBwQFn6kIlic07FQHPOthWhWpOj4JJXO0js2JpUq8h7kL432d7bOKfVfDyO1fELHUZLxTiyQDYXFkEwNXFtoU+Z/7sAvf9ZjAyZLgpM7kypUUNtSNwYAMydnkTYHVnyuudY=
Received: from BN6PR11MB4180.namprd11.prod.outlook.com (2603:10b6:405:7c::13)
 by BN7PR11MB2643.namprd11.prod.outlook.com (2603:10b6:406:b2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Wed, 7 Oct
 2020 15:08:04 +0000
Received: from BN6PR11MB4180.namprd11.prod.outlook.com
 ([fe80::94b4:34ac:278c:79de]) by BN6PR11MB4180.namprd11.prod.outlook.com
 ([fe80::94b4:34ac:278c:79de%6]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 15:08:04 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v8 1/4] drm/kmb: Keem Bay driver register definition
Thread-Topic: [PATCH v8 1/4] drm/kmb: Keem Bay driver register definition
Thread-Index: AQHWmStdX6pCasYRwkq10QwzhGbhnKmMLd6AgAAWt8A=
Date: Wed, 7 Oct 2020 15:08:04 +0000
Message-ID: <BN6PR11MB41800DF50D59F9749396C4D28C0A0@BN6PR11MB4180.namprd11.prod.outlook.com>
References: <1601691422-12851-1-git-send-email-anitha.chrisanthus@intel.com>
 <1601691422-12851-2-git-send-email-anitha.chrisanthus@intel.com>
 <CAL_JsqL9Wf4H8NQeu2Qe-zeCVk2A=XVY6kC2nUTdQ0M6qRphMA@mail.gmail.com>
In-Reply-To: <CAL_JsqL9Wf4H8NQeu2Qe-zeCVk2A=XVY6kC2nUTdQ0M6qRphMA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.151.242.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94311e64-9bc8-4902-290e-08d86ad2ca84
x-ms-traffictypediagnostic: BN7PR11MB2643:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR11MB2643B08975C1EDA767DE00888C0A0@BN7PR11MB2643.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cy2MOcSDb1pHOkrtPv3JFoxAuUOsjYLmyRZ2EeLHjTlDZj2qEceQnZCVnYF6nTmHee+ZnUBDYQhz8IG/uiWcu2rJ0aV1DSoTeql6HpQZDE01yUPS57JEl6/rU8vAxXirPd85qSN69dXP+yS2uMLZ5/uDzSNqRNV5r3fseIv4Ezdi3ufQHeR53uI3R7hZe80ft9kXG13gLohRKGPVhZtDDVrOB9BU1KPMMN+/bi5yS2sr4YY32anUdMAq0NeYq0BZq+XK3LEG43t2yKQmYI89ABgEw4T7T8co/H8d5Ho4/MXwiIn84RNgXLFQXK3Ct5S/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(86362001)(5660300002)(2906002)(8676002)(6916009)(53546011)(6506007)(33656002)(83380400001)(8936002)(55016002)(186003)(7696005)(26005)(71200400001)(9686003)(54906003)(478600001)(52536014)(66446008)(66556008)(64756008)(316002)(66476007)(76116006)(66946007)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: hNgI8NgMuzMZYrY8tLWKWvauYvWVtXRCr5KkGXmKYpt/SZDbLwk+sOHjHbJrBK81IN6v18jaTOqLlSWtpnk1+parfoeF2uieOkSruGQRS+tB40OIG5mLbQYM5Y+qIgvNT7weUAxlwSL0Q0D+boLso/m/UjgPlCfxj8gRMqiWO02sLysS84Aucn8/qC/iP71Y/CuZzf3cgr0X8fr36vf6aV88PnWJ1TowTw/5RpwjKGoqJfwahgKKoTI2aV6nfrkV+fpiy+2S888/kTxBxbDL3njRasHQH5HDjkoQEVcmNttWN9D/sSVUwMqu/9K2K9QkOX5K/O6Yr3veSE+sJNJuAf1JP8FSTbki0tAmgkkD3yRhCyKq9vkkTmG7wMP+DV99uBkkfKMJGNHmzoNwguvgVP1ps9pgvRpAcFxwhz1plUNWBvQYVz4rDI6ju4fmAvRAYiXcoTL0a6kHlpPHm5IisDeDGafOFYwzrcB4P6I2T8yqBz6dGd7ePvQ30FCJ5xdixImsC6vet8Wc5ABS9YR6Ls2uUMFtwNln5PbOnI3m9MaUGgQY4GsNvU1yBNzzOWOuQf5pD0TwSbJ3UK7hhP+IO6kNXdz2aecIknrmA11qsP8wP8N8LdGcxAjBhwzrAZCLMqsnzyzMutLNcZKMmljJjQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94311e64-9bc8-4902-290e-08d86ad2ca84
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 15:08:04.5830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 71X8xP8JijIwaWCiTmb7K8TfxHCwg3+q3jbd8Y6qZFowUw9O0o0KIDCj7/6z/mb0ECQz2UuJrWdMDpO8RKAlabbL19VHa46eCX3AZ21Y1TY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2643
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
Cc: Sam Ravnborg <sam@ravnborg.org>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "Dea, Edmund J" <edmund.j.dea@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDcsIDIwMjAgNjo0NSBB
TQ0KPiBUbzogQ2hyaXNhbnRodXMsIEFuaXRoYSA8YW5pdGhhLmNocmlzYW50aHVzQGludGVsLmNv
bT4NCj4gQ2M6IGRyaS1kZXZlbCA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IFBh
YXV3ZSwgQm9iIEoNCj4gPGJvYi5qLnBhYXV3ZUBpbnRlbC5jb20+OyBEZWEsIEVkbXVuZCBKIDxl
ZG11bmQuai5kZWFAaW50ZWwuY29tPjsNCj4gVmV0dGVyLCBEYW5pZWwgPGRhbmllbC52ZXR0ZXJA
aW50ZWwuY29tPjsgU2FtIFJhdm5ib3JnDQo+IDxzYW1AcmF2bmJvcmcub3JnPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHY4IDEvNF0gZHJtL2ttYjogS2VlbSBCYXkgZHJpdmVyIHJlZ2lzdGVyIGRl
ZmluaXRpb24NCj4gDQo+IE9uIEZyaSwgT2N0IDIsIDIwMjAgYXQgOToxNyBQTSBBbml0aGEgQ2hy
aXNhbnRodXMNCj4gPGFuaXRoYS5jaHJpc2FudGh1c0BpbnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+
ID4gUmVnaXN0ZXIgZGVmaW5pdGlvbnMgZm9yIEtlZW0gQmF5IGRpc3BsYXkgZHJpdmVyDQo+ID4N
Cj4gPiB2MjogcmVtb3ZlZCBsaWNlbnNlIHRleHQgKFNhbSkNCj4gPiB2MzogU3F1YXNoZWQgYWxs
IDU5IGNvbW1pdHMgdG8gb25lDQo+ID4gdjQ6IHJldmlldyBjaGFuZ2VzIGZyb20gU2FtIFJhdm5i
b3JnDQo+ID4gICAgICAgICByZW5hbWVkIGRldl9wIHRvIGttYg0KPiA+IHY1OiBjb3JyZWN0ZWQg
c3BlbGxpbmdzDQo+ID4gdjY6IGNvcnJlY3RlZCBjaGVja3BhdGNoIHdhcm5pbmdzDQo+ID4NCj4g
PiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IEFuaXRoYSBDaHJpc2FudGh1cyA8YW5pdGhhLmNocmlzYW50aHVzQGludGVsLmNvbT4NCj4gPiBS
ZXZpZXdlZC1ieTogQm9iIFBhYXV3ZSA8Ym9iLmoucGFhdXdlQGludGVsLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL2ttYi9rbWJfcmVncy5oIHwgNzQ4DQo+ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3NDgg
aW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2tt
Yi9rbWJfcmVncy5oDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2ttYi9r
bWJfcmVncy5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2ttYi9rbWJfcmVncy5oDQo+ID4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwLi5mNzk0YWMzDQo+ID4gLS0tIC9kZXYv
bnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9rbWIva21iX3JlZ3MuaA0KPiA+IEBAIC0w
LDAgKzEsNzQ4IEBADQo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkNCj4gPiArICoNCj4gPiArICogQ29weXJpZ2h0IMKpIDIwMTgtMjAyMCBJbnRlbCBDb3Jwb3Jh
dGlvbg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpZm5kZWYgX19LTUJfUkVHU19IX18NCj4gPiAr
I2RlZmluZSBfX0tNQl9SRUdTX0hfXw0KPiA+ICsNCj4gPiArI2RlZmluZSBFTkFCTEUgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIERJU0FCTEUgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDANCj4gPiArLypmcm9tIERhdGEgQm9v
ayBzZWN0aW9uIDEyLjUuOC4xIHBhZ2UgNDMyMiAqLw0KPiA+ICsjZGVmaW5lIENQUl9CQVNFX0FE
RFIgICAgICAgICAgICAgICAgICAgICAgICAgICAoMHgyMDgxMDAwMCkNCj4gPiArI2RlZmluZSBN
SVBJX0JBU0VfQUREUiAgICAgICAgICAgICAgICAgICAgICAgICAgKDB4MjA5MDAwMDApDQo+ID4g
Ky8qZnJvbSBEYXRhIEJvb2sgc2VjdGlvbiAxMi4xMS42LjEgcGFnZSA0OTcyICovDQo+ID4gKyNk
ZWZpbmUgTENEX0JBU0VfQUREUiAgICAgICAgICAgICAgICAgICAgICAgICAgICgweDIwOTMwMDAw
KQ0KPiA+ICsjZGVmaW5lIE1TU19DQU1fQkFTRV9BRERSICAgICAgICAgICAgICAgICAgICAgIChN
SVBJX0JBU0VfQUREUiArDQo+IDB4MTAwMDApDQo+ID4gKyNkZWZpbmUgTENEX01NSU9fU0laRSAg
ICAgICAgICAgICAgICAgICAgICAgICAgKDB4MzAwMCkNCj4gPiArI2RlZmluZSBNSVBJX01NSU9f
U0laRSAgICAgICAgICAgICAgICAgICAgICAgICAoMHg0MDAwKQ0KPiA+ICsjZGVmaW5lIE1TU19D
QU1fTU1JT19TSVpFICAgICAgICAgICAgICAgICAgICAgICgweDMwKQ0KPiANCj4gV2h5IGFyZSB0
aGVzZSBkZWZpbmVzIGhlcmU/IFRoZXkgYWxsIGNvbWUgZnJvbSBEVC4NCldpbGwgcmVtb3ZlLCB3
aWxsIHNlbmQgdjkgc29vbi4NCj4gDQo+IFJvYg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
