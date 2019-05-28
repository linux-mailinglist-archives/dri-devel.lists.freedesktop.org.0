Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F062CAA5
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 17:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41675895E2;
	Tue, 28 May 2019 15:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710048.outbound.protection.outlook.com [40.107.71.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44812895E2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 15:50:45 +0000 (UTC)
Received: from DM6PR12MB3163.namprd12.prod.outlook.com (20.179.104.150) by
 DM6PR12MB3818.namprd12.prod.outlook.com (10.255.173.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.16; Tue, 28 May 2019 15:50:43 +0000
Received: from DM6PR12MB3163.namprd12.prod.outlook.com
 ([fe80::bcaf:86d4:677f:9555]) by DM6PR12MB3163.namprd12.prod.outlook.com
 ([fe80::bcaf:86d4:677f:9555%6]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 15:50:43 +0000
From: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Thomas Hellstrom
 <thomas@shipmail.org>
Subject: Re: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Topic: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
Thread-Index: AQHVEkKKUtJTyHZOak+VJIfcFQoAYqaAKlUAgAAmFwCAAFo8gIAAAdIAgAAJNYA=
Date: Tue, 28 May 2019 15:50:42 +0000
Message-ID: <a1bdbae7-009a-85ad-beb1-f938995274db@amd.com>
References: <20190524081114.53661-1-thomas@shipmail.org>
 <f2c4ccdd-49c9-2188-3378-2f333a8f605f@amd.com>
 <d397836b-13a4-b6cd-e059-035203f2edc6@shipmail.org>
 <d59cb481-1360-25eb-a2da-1ae64c648daf@shipmail.org>
 <84fa57da-7bb7-8322-125a-89596fbb2145@amd.com>
 <33816cbd-ddfb-b47a-a305-2760f8568eff@shipmail.org>
 <79c8d26a-d2dd-3e2c-f0bc-cbfc47a67fee@amd.com>
 <deef176a-5467-5beb-7f1b-fcd7bd1deab7@shipmail.org>
 <CADnq5_O+L-aJ_WU4ZcBmLYOV3RqNouw_P-2wYfCoJwXxj6ny3g@mail.gmail.com>
 <52df61a9-028e-8ff6-0850-20ddddb11de3@shipmail.org>
 <5b1b3f22-beea-16c4-a98f-9e632b408020@amd.com>
 <6b9b8536-bfea-5817-06e4-23881b86ab31@shipmail.org>
 <cc1d736d-9a8f-03d0-26ab-60a686ad71bd@amd.com>
In-Reply-To: <cc1d736d-9a8f-03d0-26ab-60a686ad71bd@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR04CA0103.namprd04.prod.outlook.com
 (2603:10b6:805:f2::44) To DM6PR12MB3163.namprd12.prod.outlook.com
 (2603:10b6:5:182::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eea41a05-12c0-4d09-a8ba-08d6e3843d89
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3818; 
x-ms-traffictypediagnostic: DM6PR12MB3818:
x-microsoft-antispam-prvs: <DM6PR12MB3818990808D27AC402BA0F4AEC1E0@DM6PR12MB3818.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(376002)(346002)(396003)(39860400002)(199004)(189003)(51914003)(53936002)(6512007)(229853002)(6486002)(66556008)(66476007)(73956011)(66946007)(64756008)(66446008)(99286004)(14454004)(386003)(52116002)(6506007)(53546011)(6436002)(11346002)(26005)(3846002)(476003)(486006)(102836004)(86362001)(71190400001)(76176011)(5660300002)(2616005)(71200400001)(6116002)(31696002)(8936002)(81166006)(54906003)(7736002)(81156014)(8676002)(305945005)(36756003)(31686004)(2906002)(72206003)(478600001)(446003)(186003)(66066001)(256004)(14444005)(25786009)(110136005)(4326008)(6246003)(316002)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3818;
 H:DM6PR12MB3163.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JEm6SGH0DmLityAf3u+E8i/5pvHIdNcJZ5UEKKJtmsNUnbOn/J56shGCFYVJg7cTWmcEZg87DRwDkWlCGGjRX2jc4R/yGBrrmtZLCvmnCxj877OcRapxqV0JTFeVw7MRVRyW4uc0sMFXU9s+ufw56dhrxR1vhDwcH1QFmFgvWxCUTn7ptOgI7fiJnSToL2aQbk2j7HM7H7UkT0oa2tbqX07zpKk+mc9lOCwFcu+8saJbwvqLlZuDX4R1S+LgA4Ht6PHN27aNXiDi7blGU73PIG/AfJofMmr4yrj09vWWr8O3Ig7mTOAFwVpQOn0oVetZLYvQMYmdNW67e6S0fqAZWEmea5Zho/yPlMBjyUCLKKhpQ/lRGe6PGfbbVsUiuZGZM1tFgh+fBW3kq+zD2hxXysgf/zqDeYsFwSD+sjzW1Ak=
Content-ID: <9A16095452A57540B6AE206CD0F1A62B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eea41a05-12c0-4d09-a8ba-08d6e3843d89
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 15:50:42.9722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tlendack@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3818
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gw1wL7QmplM96C0MlGQhbOlzjLpRDCYeNhSoH27x3tM=;
 b=cu5tzUTcmLqzR5QpW86Bl47uw2pH55/pwNhsVHaxs7WwXTQtM69unZweVTK1byq6kLe1tTMsnf5IwcMS2gGR+iGhnuiRGHrPiP8gC2B26axRP+kkmrj25bWPcCNEZpoZUCLDqPRxfE6PeGv9O3rOLLys0AAP7/TdPJ8odI/P35g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Thomas.Lendacky@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8yOC8xOSAxMDoxNyBBTSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6DQo+IEhpIFRob21h
cywNCj4gDQo+IEFtIDI4LjA1LjE5IHVtIDE3OjExIHNjaHJpZWIgVGhvbWFzIEhlbGxzdHJvbToN
Cj4+IEhpLCBUb20sDQo+Pg0KPj4gVGhhbmtzIGZvciB0aGUgcmVwbHkuIFRoZSBxdWVzdGlvbiBp
cyBub3QgZ3JhcGhpY3Mgc3BlY2lmaWMsIGJ1dCBsaWVzIA0KPj4gaW4geW91ciBhbnN3ZXIgZnVy
dGhlciBiZWxvdzoNCj4+DQo+PiBPbiA1LzI4LzE5IDQ6NDggUE0sIExlbmRhY2t5LCBUaG9tYXMg
d3JvdGU6DQo+Pj4gT24gNS8yOC8xOSAyOjMxIEFNLCBUaG9tYXMgSGVsbHN0cm9tIHdyb3RlOg0K
Pj4+IFtTTklQXQ0KPj4+IEFzIGZvciBrZXJuZWwgdm1hcHMgYW5kIHVzZXItbWFwcywgdGhvc2Ug
cGFnZXMgd2lsbCBiZSBtYXJrZWQgZW5jcnlwdGVkDQo+Pj4gKHVubGVzcyBleHBsaWNpdGx5IG1h
ZGUgdW4tZW5jcnlwdGVkIGJ5IGNhbGxpbmcgc2V0X21lbW9yeV9kZWNyeXB0ZWQoKSkuDQo+Pj4g
QnV0LCBpZiB5b3UgYXJlIGNvcHlpbmcgdG8vZnJvbSB0aG9zZSBhcmVhcyBpbnRvIHRoZSB1bi1l
bmNyeXB0ZWQgRE1BDQo+Pj4gYXJlYSB0aGVuIGV2ZXJ5dGhpbmcgd2lsbCBiZSBvay4NCj4+DQo+
PiBUaGUgcXVlc3Rpb24gaXMgcmVnYXJkaW5nIHRoZSBhYm92ZSBwYXJhZ3JhcGguDQo+Pg0KPj4g
QUZBSUNULMKgIHNldF9tZW1vcnlfZGVjcnlwdGVkKCkgb25seSBjaGFuZ2VzIHRoZSBmaXhlZCBr
ZXJuZWwgbWFwIFBURXMuDQo+PiBCdXQgd2hlbiBzZXR0aW5nIHVwIG90aGVyIGFsaWFzZWQgUFRF
cyB0byB0aGUgZXhhY3Qgc2FtZSBkZWNyeXB0ZWQgDQo+PiBwYWdlcywgZm9yIGV4YW1wbGUgdXNp
bmcgZG1hX21tYXBfY29oZXJlbnQoKSwga21hcF9hdG9taWNfcHJvdCgpLCANCj4+IHZtYXAoKSBl
dGMuIFdoYXQgY29kZSBpcyByZXNwb25zaWJsZSBmb3IgY2xlYXJpbmcgdGhlIGVuY3J5cHRlZCBm
bGFnIA0KPj4gb24gdGhvc2UgUFRFcz8gSXMgdGhlcmUgc29tZXRoaW5nIGluIHRoZSB4ODYgcGxh
dGZvcm0gY29kZSBkb2luZyB0aGF0Pw0KPiANCj4gVG9tIGFjdHVhbGx5IGV4cGxhaW5lZCB0aGlz
Og0KPj4gVGhlIGVuY3J5cHRpb24gYml0IGlzIGJpdC00NyBvZiBhIHBoeXNpY2FsIGFkZHJlc3Mu
DQo+IA0KPiBJbiBvdGhlciB3b3JkcyBzZXRfbWVtb3J5X2RlY3J5cHRlZCgpIGNoYW5nZXMgdGhl
IHBoeXNpY2FsIGFkZHJlc3MgaW4gDQo+IHRoZSBQVEVzIG9mIHRoZSBrZXJuZWwgbWFwcGluZyBh
bmQgYWxsIG90aGVyIHVzZSBjYXNlcyBqdXN0IGNvcHkgdGhhdCANCj4gZnJvbSB0aGVyZS4NCg0K
RXhjZXB0IEkgZG9uJ3QgdGhpbmsgdGhlIFBURSBhdHRyaWJ1dGVzIGFyZSBjb3BpZWQgZnJvbSB0
aGUga2VybmVsIG1hcHBpbmcNCmluIHNvbWUgY2FzZXMuIEZvciBleGFtcGxlLCBkbWFfbW1hcF9j
b2hlcmVudCgpIHdpbGwgY3JlYXRlIHRoZSBzYW1lDQp2bV9wYWdlX3Byb3QgdmFsdWUgcmVnYXJk
bGVzcyBvZiB3aGV0aGVyIG9yIG5vdCB0aGUgdW5kZXJseWluZyBtZW1vcnkgaXMNCmVuY3J5cHRl
ZCBvciBub3QuIEJ1dCBrbWFwX2F0b21pY19wcm90KCkgd2lsbCByZXR1cm4gdGhlIGtlcm5lbCB2
aXJ0dWFsDQphZGRyZXNzIG9mIHRoZSBwYWdlLCBzbyB0aGF0IHdvdWxkIGJlIGZpbmUuDQoNClRo
aXMgaXMgYW4gYXJlYSB0aGF0IG5lZWRzIGxvb2tpbmcgaW50byB0byBiZSBzdXJlIGl0IGlzIHdv
cmtpbmcgcHJvcGVybHkNCndpdGggU01FIGFuZCBTRVYuDQoNClRoYW5rcywNClRvbQ0KDQo+IA0K
PiBUaGF0J3MgcmF0aGVyIG5pZnR5LCBiZWNhdXNlIHRoaXMgd2F5IGV2ZXJ5Ym9keSB3aWxsIGVp
dGhlciB1c2Ugb3Igbm90IA0KPiB1c2UgZW5jcnlwdGlvbiBvbiB0aGUgcGFnZS4NCj4gDQo+IENo
cmlzdGlhbi4NCj4gDQo+Pg0KPj4gVGhhbmtzLA0KPj4gVGhvbWFzDQo+Pg0KPj4NCj4+Pg0KPj4+
IFRoaW5ncyBnZXQgZnV6enkgZm9yIG1lIHdoZW4gaXQgY29tZXMgdG8gdGhlIEdQVSBhY2Nlc3Mg
b2YgdGhlIG1lbW9yeQ0KPj4+IGFuZCB3aGF0IGFuZCBob3cgaXQgaXMgYWNjZXNzZWQuDQo+Pj4N
Cj4+PiBUaGFua3MsDQo+Pj4gVG9tDQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
