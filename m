Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FB480FFE
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 03:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8594189C60;
	Mon,  5 Aug 2019 01:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820071.outbound.protection.outlook.com [40.107.82.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7654689C56;
 Mon,  5 Aug 2019 01:21:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMQytuQC8j4YORt9KpjAlt58kZDdFJL9BVnAqsLWTpCcxEI1iE9jh4WLsZq+WG3+BAkVUM+Zfp9k1AAwhk9JPx+PWQ1yQHlrb2n5p9rbi02lpIThCuYSq9G4sVaA0C4RokfyiddnPcuFhizt1xUb4ZFQYKSdkfiY93wuRQulPOFBCc3qwjjR4GNXU2ckiIlppjT6ezX3cSok49zvHzF5cLt53VqlkjGX2k4mJ3KOvfDytmu+8WrURUNViBmDg+CuH515DV3IEaJjObl0r3Kz7KrJHjQYnDaEoaQmP1FAq2jqTcf+6klTnqzRbYqn2Kol8fN5t/CKZgtDb77qSDOzaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//eIfGumUqGY4eS+WJUNWHG4yIQcggsiHZv79Ti0IXA=;
 b=ngYlFbC2wcl91dztVKfMieO3Rmm42B4eBMziJU2uiGhJJLy2Lu+PW9A2X0tfu+tRqVkTQuP3bldtj3SI807eE8qVnVPkQsGbUuezYonP8bfh13rAd4zl6nXVZwW7Fqigpkyd7QQ2fnLVmHoWOEVzwV583LYcX1M17WQQqm1v85v5YJt+XlffQewgej67q3mu5+wBoY8y93/njmEbddQNMjPo4ZodH8IgCodDBJHfTa+7cS/jJlq3Omd2Wc1pAuhUTx5mT/X1DODyL93DcF/f/WHqg32sg2Y1/NIY0WvysaorGUA55i5spRf4pxDN6A/ckGmJTVGlFiZmOqTr2r4NKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4208.namprd12.prod.outlook.com (10.255.224.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 01:21:06 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 01:21:06 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Nathan Chancellor <natechancellor@gmail.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
Subject: RE: [PATCH] drm/amd/powerplay: Zero initialize some variables
Thread-Topic: [PATCH] drm/amd/powerplay: Zero initialize some variables
Thread-Index: AQHVSwR3BVBtbsqdn0qOQ80AgffoNqbrwc9Q
Date: Mon, 5 Aug 2019 01:21:06 +0000
Message-ID: <MN2PR12MB3344B936DC2DBD85443C6AC7E4DA0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190804203713.13724-1-natechancellor@gmail.com>
In-Reply-To: <20190804203713.13724-1-natechancellor@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d641ff65-0108-4a77-f91b-08d7194330b1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4208; 
x-ms-traffictypediagnostic: MN2PR12MB4208:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB420862FCBC030A25B98CF4F0E4DA0@MN2PR12MB4208.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:390;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(199004)(189003)(13464003)(6636002)(305945005)(68736007)(6506007)(102836004)(53546011)(76176011)(186003)(26005)(33656002)(8936002)(81166006)(81156014)(8676002)(486006)(446003)(11346002)(476003)(14444005)(110136005)(54906003)(7696005)(5660300002)(99286004)(14454004)(966005)(256004)(3846002)(6116002)(7736002)(316002)(71200400001)(71190400001)(2906002)(52536014)(74316002)(66476007)(66556008)(64756008)(66446008)(66946007)(76116006)(478600001)(6246003)(25786009)(4326008)(86362001)(229853002)(6306002)(9686003)(6436002)(55016002)(53936002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4208;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PCxYWwZaQcgzMm1pp9eEwQJd8E+IQUOx54dc8fvHOAT4SoxPoZuYt1yLeGxaeRZVgquq87+43HCxRU7hwqEHpNVwldIR163u68cWF170ey7zMWFsL2lrGh2ygwrkuLmVwP42O1GAy7ox3lc4Hl64L8P+mDAwZkbALhXsaSRcacilCSud6PvtWvBEGGmlI+75r1vgCJgPNqOG0L5dGXfVPCRrrc9xCbhkiE98fULEDMoeQ4duJF0D/RA9RUr+lUBqWIfxIKqoL8LepB1rXScTaCzVrSnttwSR67jY0arjKdbediuczH0Nec9t6mvS5pyuOqon1fbbrwtORH6Rtpt3OPiijfnv15CPhplMFyPP7CLJKMguZHND1gaNkSCP5Huig984WrvokNEKRYX8PoKmyu/FJJ/uJMafHOK/UN+vqR4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d641ff65-0108-4a77-f91b-08d7194330b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 01:21:06.4738 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//eIfGumUqGY4eS+WJUNWHG4yIQcggsiHZv79Ti0IXA=;
 b=K4A4n8xhcz5xoX6HcUzxk27hMhiF5SKektFdFNchUb9H3fSyLHPmnUKCnaCMyIKHEOBKDWxPsX5xyfLLjeo39rvSTv0vFI7zB2vap35dDXqjTjBFtbKLjz/8LKQlXKYPIvrVe/886dG3SPos4aj+oGWQJCA9rOirixYwvHcCVKw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIE5hdGhhbi4gVGhlIHBhdGNoIGlzIHJldmlld2VkLWJ5OiBFdmFuIFF1YW4gPGV2YW4u
cXVhbkBhbWQuY29tPgoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IE5hdGhh
biBDaGFuY2VsbG9yIDxuYXRlY2hhbmNlbGxvckBnbWFpbC5jb20+Cj4gU2VudDogTW9uZGF5LCBB
dWd1c3QgMDUsIDIwMTkgNDozNyBBTQo+IFRvOiBRdWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNv
bT47IERldWNoZXIsIEFsZXhhbmRlcgo+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29l
bmlnLCBDaHJpc3RpYW4KPiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgWmhvdSwgRGF2aWQo
Q2h1bk1pbmcpCj4gPERhdmlkMS5aaG91QGFtZC5jb20+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC0KPiBr
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyBjbGFuZy1idWlsdC1saW51eEBnb29nbGVncm91cHMuY29t
OyBOYXRoYW4KPiBDaGFuY2VsbG9yIDxuYXRlY2hhbmNlbGxvckBnbWFpbC5jb20+Cj4gU3ViamVj
dDogW1BBVENIXSBkcm0vYW1kL3Bvd2VycGxheTogWmVybyBpbml0aWFsaXplIHNvbWUgdmFyaWFi
bGVzCj4gCj4gQ2xhbmcgd2FybnMgKG9ubHkgTmF2aSB3YXJuaW5nIHNob3duIGJ1dCBBcmN0dXJ1
cyB3YXJucyBhcyB3ZWxsKToKPiAKPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dl
cnBsYXkvbmF2aTEwX3BwdC5jOjE1MzQ6NDogd2FybmluZzoKPiB2YXJpYWJsZSAnYXNpY19kZWZh
dWx0X3Bvd2VyX2xpbWl0JyBpcyB1c2VkIHVuaW5pdGlhbGl6ZWQgd2hlbmV2ZXIgJz86Jwo+IGNv
bmRpdGlvbiBpcyBmYWxzZSBbLVdzb21ldGltZXMtdW5pbml0aWFsaXplZF0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICBzbXVfcmVhZF9zbWNfYXJnKHNtdSwgJmFzaWNfZGVmYXVsdF9wb3dlcl9s
aW1pdCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
cG93ZXJwbGF5L2luYy9hbWRncHVfc211Lmg6NTg4OjM6Cj4gbm90ZToKPiBleHBhbmRlZCBmcm9t
IG1hY3JvICdzbXVfcmVhZF9zbWNfYXJnJwo+ICAgICAgICAgKChzbXUpLT5mdW5jcy0+cmVhZF9z
bWNfYXJnPyAoc211KS0+ZnVuY3MtPnJlYWRfc21jX2FyZygoc211KSwKPiAoYXJnKSkgOiAwKQo+
ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vcG93ZXJwbGF5L25hdmkxMF9wcHQuYzoxNTUwOjMwOiBub3RlOgo+IHVuaW5p
dGlhbGl6ZWQgdXNlIG9jY3VycyBoZXJlCj4gICAgICAgICAgICAgICAgIHNtdS0+ZGVmYXVsdF9w
b3dlcl9saW1pdCA9IGFzaWNfZGVmYXVsdF9wb3dlcl9saW1pdDsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L25hdmkxMF9wcHQuYzoxNTM0OjQ6
IG5vdGU6Cj4gcmVtb3ZlIHRoZSAnPzonIGlmIGl0cyBjb25kaXRpb24gaXMgYWx3YXlzIHRydWUK
PiAgICAgICAgICAgICAgICAgICAgICAgICBzbXVfcmVhZF9zbWNfYXJnKHNtdSwgJmFzaWNfZGVm
YXVsdF9wb3dlcl9saW1pdCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgXgo+IGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oOjU4ODozOgo+
IG5vdGU6Cj4gZXhwYW5kZWQgZnJvbSBtYWNybyAnc211X3JlYWRfc21jX2FyZycKPiAgICAgICAg
ICgoc211KS0+ZnVuY3MtPnJlYWRfc21jX2FyZz8gKHNtdSktPmZ1bmNzLT5yZWFkX3NtY19hcmco
KHNtdSksCj4gKGFyZykpIDogMCkKPiAgICAgICAgICBeCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvLi4vcG93ZXJwbGF5L25hdmkxMF9wcHQuYzoxNTE3OjM1OiBub3RlOgo+IGluaXRpYWxp
emUgdGhlIHZhcmlhYmxlICdhc2ljX2RlZmF1bHRfcG93ZXJfbGltaXQnIHRvIHNpbGVuY2UgdGhp
cyB3YXJuaW5nCj4gICAgICAgICB1aW50MzJfdCBhc2ljX2RlZmF1bHRfcG93ZXJfbGltaXQ7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAwCj4gMSB3YXJuaW5nIGdlbmVyYXRlZC4K
PiAKPiBBcyB0aGUgY29kZSBpcyBjdXJyZW50bHkgd3JpdHRlbiwgaWYgcmVhZF9zbWNfYXJnIHdl
cmUgZXZlciBOVUxMLCBhcmcgd291bGQKPiBmYWlsIHRvIGJlIGluaXRpYWxpemVkIGJ1dCB0aGUg
Y29kZSB3b3VsZCBjb250aW51ZSBleGVjdXRpbmcgYXMgbm9ybWFsCj4gYmVjYXVzZSB0aGUgcmV0
dXJuIHZhbHVlIHdvdWxkIGp1c3QgYmUgemVyby4KPiAKPiBUaGVyZSBhcmUgYSBmZXcgZGlmZmVy
ZW50IHBvc3NpYmxlIHNvbHV0aW9ucyB0byByZXNvbHZlIHRoaXMgY2xhc3Mgb2Ygd2FybmluZ3MK
PiB3aGljaCBoYXZlIGFwcGVhcmVkIGluIHRoZXNlIGRyaXZlcnMgYmVmb3JlOgo+IAo+IDEuIEFz
c3VtZSB0aGUgZnVuY3Rpb24gcG9pbnRlciB3aWxsIG5ldmVyIGJlIE5VTEwgYW5kIGVsaW1pbmF0
ZSB0aGUKPiAgICB3cmFwcGVyIG1hY3Jvcy4KPiAKPiAyLiBIYXZlIHRoZSB3cmFwcGVyIG1hY3Jv
cyBpbml0aWFsaXplIGFyZyB3aGVuIHRoZSBmdW5jdGlvbiBwb2ludGVyIGlzCj4gICAgTlVMTC4K
PiAKPiAzLiBIYXZlIHRoZSB3cmFwcGVyIG1hY3JvcyByZXR1cm4gYW4gZXJyb3IgY29kZSBpbnN0
ZWFkIG9mIDAgd2hlbiB0aGUKPiAgICBmdW5jdGlvbiBwb2ludGVyIGlzIE5VTEwgc28gdGhhdCB0
aGUgY2FsbHNpdGVzIGNhbiBwcm9wZXJseSBiYWlsIG91dAo+ICAgIGJlZm9yZSBhcmcgY2FuIGJl
IHVzZWQuCj4gCj4gNC4gSW5pdGlhbGl6ZSBhcmcgYXQgdGhlIHRvcCBvZiBpdHMgZnVuY3Rpb24u
Cj4gCj4gTnVtYmVyIGZvdXIgaXMgdGhlIHBhdGggb2YgbGVhc3QgcmVzaXN0YW5jZSByaWdodCBu
b3cgYXMgZXZlcnkgb3RoZXIgY2hhbmdlCj4gd2lsbCBiZSBkcml2ZXIgd2lkZSBzbyBkbyB0aGF0
IGhlcmUuIEkgb25seSBtYWtlIHRoZSBjb21tZW50IG5vdyBhcyBmb29kIGZvcgo+IHRob3VnaHQu
Cj4gCj4gRml4ZXM6IGI0YWY5NjRlNzVjNCAoImRybS9hbWQvcG93ZXJwbGF5OiBtYWtlIHBvd2Vy
IGxpbWl0IHJldHJpZXZhbCBhcwo+IGFzaWMgc3BlY2lmaWMiKQo+IExpbms6IGh0dHBzOi8vZ2l0
aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgvaXNzdWVzLzYyNwo+IFNpZ25lZC1vZmYtYnk6
IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRlY2hhbmNlbGxvckBnbWFpbC5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jIHwgMiArLQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgICB8IDIgKy0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCj4gYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYwo+IGluZGV4IDIxNWY3MTcz
ZmNhOC4uYjkyZWRlZDczNzRmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvYXJjdHVydXNfcHB0LmMKPiBAQCAtMTMyNiw3ICsxMzI2LDcgQEAgc3RhdGljIGludCBhcmN0
dXJ1c19nZXRfcG93ZXJfbGltaXQoc3RydWN0Cj4gc211X2NvbnRleHQgKnNtdSwKPiAgCQkJCSAg
ICAgYm9vbCBhc2ljX2RlZmF1bHQpCj4gIHsKPiAgCVBQVGFibGVfdCAqcHB0YWJsZSA9IHNtdS0+
c211X3RhYmxlLmRyaXZlcl9wcHRhYmxlOwo+IC0JdWludDMyX3QgYXNpY19kZWZhdWx0X3Bvd2Vy
X2xpbWl0Owo+ICsJdWludDMyX3QgYXNpY19kZWZhdWx0X3Bvd2VyX2xpbWl0ID0gMDsKPiAgCWlu
dCByZXQgPSAwOwo+ICAJaW50IHBvd2VyX3NyYzsKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKPiBpbmRleCAxMDYzNTJhNGZiODIuLmQ4NDRiYzg0MTFh
YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKPiBA
QCAtMTUxNCw3ICsxNTE0LDcgQEAgc3RhdGljIGludCBuYXZpMTBfZ2V0X3Bvd2VyX2xpbWl0KHN0
cnVjdAo+IHNtdV9jb250ZXh0ICpzbXUsCj4gIAkJCQkgICAgIGJvb2wgYXNpY19kZWZhdWx0KQo+
ICB7Cj4gIAlQUFRhYmxlX3QgKnBwdGFibGUgPSBzbXUtPnNtdV90YWJsZS5kcml2ZXJfcHB0YWJs
ZTsKPiAtCXVpbnQzMl90IGFzaWNfZGVmYXVsdF9wb3dlcl9saW1pdDsKPiArCXVpbnQzMl90IGFz
aWNfZGVmYXVsdF9wb3dlcl9saW1pdCA9IDA7Cj4gIAlpbnQgcmV0ID0gMDsKPiAgCWludCBwb3dl
cl9zcmM7Cj4gCj4gLS0KPiAyLjIzLjAucmMxCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
