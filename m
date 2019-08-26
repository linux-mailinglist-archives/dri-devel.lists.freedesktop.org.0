Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8939D63C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 21:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94D26E2A2;
	Mon, 26 Aug 2019 19:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730051.outbound.protection.outlook.com [40.107.73.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973596E2A2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 19:05:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2v61yHeuCxM1hkEnGt4pHDKc3hWglDg5YlE4PON9b9gXuwNUZpqqwlbIjG67SNc5Eb7VirPNhUb8m1LfwTzCVSv4QXHu95WwAFSFrvfMAxJwr3DY3RNelP1JZPMoe7yE19eZ3LAkWelG/mb4xGcYufeVwqBaztn/44o56Z/Jj4mTq8R1BgvafJ/qvHoEddgBQnmDEvA+0lXszpBhFOFbzYzs3rhFZPjehwkUkaBjrtxt6UY1t4nNgZlwWH8Zih0cboDBOxxAjgOV4vgyJ1A14bfxw/ADwWAsBVH82GhXo/+YNeN4yyN8HwK08sQ0RsB/y6PAtZO8RegK+De/wBL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7JxV/Vvb4LquY+1RJNJdD1gsAIc1K3Hw1nl2/7qghs=;
 b=UhOb4Fb4gg4BzpsQBN2GkPo58KHymXmkMVg+VRu8jrezNTZiADFf3in+AspE/84NFjJ2I0ZRq/H8rf2Fslt6P/ZgcSdbLSDHj1D/C9EI8UzKnU/UJxN4B9qkOYjB5+Alz3ndMPo8r3qNSu4udk/brjC5ZuoJCfIOUCtw4llVo4CFvYx+eA+XjHs4tU/GLQvM7j1Pyz4DFri5yLGUUlmStgZDo+l1+6FhbFCKYcoEKSp/5As9+CeicPsYTNo2O3gzjXhtEvNCvfXGGEFn7ac9gl+6p5s1jykn+ESftu/6zBNgCWUaFxtm2/D3nys5zm9b/pBEk8st/hlWuKkkLzG5GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0150.namprd12.prod.outlook.com (10.174.53.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Mon, 26 Aug 2019 19:05:09 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2%5]) with mapi id 15.20.2178.023; Mon, 26 Aug 2019
 19:05:09 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Francis, David" <David.Francis@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v8 5/6] drm/dp_mst: Add new quirk for Synaptics MST hubs
Thread-Topic: [PATCH v8 5/6] drm/dp_mst: Add new quirk for Synaptics MST hubs
Thread-Index: AQHVXDjgnqsfprJEHECWkv7kxp6H1KcNyeYA
Date: Mon, 26 Aug 2019 19:05:09 +0000
Message-ID: <19bb6ec0-61c7-ad3b-608f-85974586fcfc@amd.com>
References: <20190826180507.17802-1-David.Francis@amd.com>
 <20190826180507.17802-6-David.Francis@amd.com>
In-Reply-To: <20190826180507.17802-6-David.Francis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::35) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cce4abc7-cb38-4da6-622d-08d72a585049
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0150; 
x-ms-traffictypediagnostic: CY4PR1201MB0150:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB01500B6C735C3FC77106E2388CA10@CY4PR1201MB0150.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(199004)(189003)(76176011)(478600001)(65806001)(65956001)(6486002)(58126008)(8936002)(2501003)(256004)(14444005)(186003)(446003)(2906002)(6246003)(476003)(31686004)(66066001)(305945005)(31696002)(6512007)(53936002)(3846002)(53546011)(6306002)(6506007)(102836004)(64756008)(66556008)(66476007)(966005)(66946007)(6116002)(6436002)(26005)(66446008)(8676002)(110136005)(316002)(25786009)(52116002)(7736002)(71200400001)(71190400001)(81166006)(36756003)(14454004)(386003)(486006)(81156014)(2616005)(11346002)(229853002)(5660300002)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0150;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CEHYRals0zjW8mWhmG/ppwXeeB9lxe6Nfn5B3AoAEQwIZe9paDln/0A+m07hCyCATvWxWu4J5DKRc8xCGP7RH2eYntOWXfw6LnxTbR/OoiCfKj/0QTBfIP/aHc/HI5UIXOJ23Cwz0FgHeQrL/WPPtaUzSSY+CAYvbWmcVo0f9dwsE/8fpicBpVEdGQubhqLLWQD7YODb6vMKNXaxXHIqwiGuwkfKnlLNPT03/plilrQDiQLf84ds1Z/nf7epSqVSlHnk3KDT2zzUOxqgTZFfcLZtIyOXxakFRDBPTKZ2F0oyinSBbIH0p1UuOTCJru3LLtLan9OG1BCLHK0NQwX2ZcYiL3APsnKwLgi7LReJd00PmdKdHvOhqIU6xILCgc0VySYwkbcQKw3y55Q0D6J6kRuS6CkukXAWS8EMoe/wzeY=
Content-ID: <B27B240D86D75C45AABA37CDC49951B8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce4abc7-cb38-4da6-622d-08d72a585049
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 19:05:09.2358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qrVtbAAvpPxKQBd8s5ZaIyDNkr0CjiTTi8wRbo2KP+w+nID0tqL9fVglRi+SAz7i/NEfxB0zJnNW7N6INYx4+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0150
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7JxV/Vvb4LquY+1RJNJdD1gsAIc1K3Hw1nl2/7qghs=;
 b=d7gIKJ+LtRVE1COM2PAy1SFsQCdYHHRpPmUtJToUe3A3wpISBAWYok1cG1FErmx+pNLmn7Ymyd9RB3zt8RirbbQ47tlTpNB4+v2UV//OjHEHLRmsKILUeta8jDM2DS+h4XF7TBNXCLTga9XxXw3GEPNWAMiazlkfS+0+WmhVsJE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yNiAyOjA1IHAubS4sIERhdmlkIEZyYW5jaXMgd3JvdGU6DQo+IFN5bmFwdGlj
cyBEUDEuNCBodWJzIChCUkFOQ0hfSUQgMHg5MENDMjQpIGRvIG5vdA0KPiBzdXBwb3J0IHZpcnR1
YWwgRFBDRCByZWdpc3RlcnMsIGJ1dCBkbyBzdXBwb3J0IERTQy4NCj4gVGhlIERTQyBjYXBzIGNh
biBiZSByZWFkIGZyb20gdGhlIHBoeXNpY2FsIGF1eCwNCj4gbGlrZSBpbiBTU1QgRFNDLiBUaGVz
ZSBodWJzIGhhdmUgbWFueSBkaWZmZXJlbnQNCj4gREVWSUNFX0lEcy4gIEFkZCBhIG5ldyBxdWly
ayB0byBkZXRlY3QgdGhpcyBjYXNlLg0KPiANCj4gQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhh
dC5jb20+DQo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+DQo+
IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyB8IDIgKysNCj4gIGluY2x1
ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCAgICAgfCA3ICsrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMNCj4gaW5kZXgg
MmNjMjFlZmY0Y2YzLi5mYzM5MzIzZTdkNTIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfaGVscGVyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIu
Yw0KPiBAQCAtMTI3MCw2ICsxMjcwLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcGNkX3F1aXJr
IGRwY2RfcXVpcmtfbGlzdFtdID0gew0KPiAgCXsgT1VJKDB4MDAsIDB4MTAsIDB4ZmEpLCBERVZJ
Q0VfSURfQU5ZLCBmYWxzZSwgQklUKERQX0RQQ0RfUVVJUktfTk9fUFNSKSB9LA0KPiAgCS8qIENI
NzUxMSBzZWVtcyB0byBsZWF2ZSBTSU5LX0NPVU5UIHplcm9lZCAqLw0KPiAgCXsgT1VJKDB4MDAs
IDB4MDAsIDB4MDApLCBERVZJQ0VfSUQoJ0MnLCAnSCcsICc3JywgJzUnLCAnMScsICcxJyksIGZh
bHNlLCBCSVQoRFBfRFBDRF9RVUlSS19OT19TSU5LX0NPVU5UKSB9LA0KPiArCS8qIFN5bmFwdGlj
cyBEUDEuNCBNU1QgaHVicyBjYW4gc3VwcG9ydCBEU0Mgd2l0aG91dCB2aXJ0dWFsIERQQ0QgKi8N
Cj4gKwl7IE9VSSgweDkwLCAweENDLCAweDI0KSwgREVWSUNFX0lEX0FOWSwgdHJ1ZSwgQklUKERQ
X0RQQ0RfUVVJUktfRFNDX1dJVEhPVVRfVklSVFVBTF9EUENEKSB9LA0KDQpUaGlzIHNlZW1zIHRv
IGJlIGdlbmVyaWMgT1VJIGZvciBTeW5hcHRpY3MgWzFdLiBDb3VsZCB0aGlzIGNhdXNlIHVzIHRv
DQpjYXN0IHRoZSBuZXQgdG9vIHdpZGU/DQoNCkV2ZW4gaWYgd2UgY2hlY2sgdGhhdCBpdCdzIERQ
X0RQQ0RfUkVWID49IDEuNCB0aGVyZSdzIGEgZ29vZCBjaGFuY2UNClN5bmFwdGljcyBpcyBmaXhp
bmcgdGhpcyBpbiB0aGUgZnV0dXJlIGFuZCB3b24ndCByZXF1aXJlIHRoZSBxdWlyay4NCg0KWzFd
IGh0dHBzOi8vYXJ1bGpvaG4uY29tL21hYy92ZW5kb3IvU3luYXB0aWNzDQoNCkhhcnJ5DQoNCj4g
IH07DQo+ICANCj4gICN1bmRlZiBPVUkNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9k
cF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaA0KPiBpbmRleCA4MzY0NTAy
ZjkyY2YuLmExMzMxYjA4NzA1ZiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hl
bHBlci5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaA0KPiBAQCAtMTQzNCw2
ICsxNDM0LDEzIEBAIGVudW0gZHJtX2RwX3F1aXJrIHsNCj4gIAkgKiBUaGUgZHJpdmVyIHNob3Vs
ZCBpZ25vcmUgU0lOS19DT1VOVCBkdXJpbmcgZGV0ZWN0aW9uLg0KPiAgCSAqLw0KPiAgCURQX0RQ
Q0RfUVVJUktfTk9fU0lOS19DT1VOVCwNCj4gKwkvKioNCj4gKwkgKiBARFBfRFBDRF9RVUlSS19E
U0NfV0lUSE9VVF9WSVJUVUFMX0RQQ0Q6DQo+ICsJICoNCj4gKwkgKiBUaGUgZGV2aWNlIHN1cHBv
cnRzIE1TVCBEU0MgZGVzcGl0ZSBub3Qgc3VwcG9ydGluZyBWaXJ0dWFsIERQQ0QuDQo+ICsJICog
VGhlIERTQyBjYXBzIGNhbiBiZSByZWFkIGZyb20gdGhlIHBoeXNpY2FsIGF1eCBpbnN0ZWFkLg0K
PiArCSAqLw0KPiArCURQX0RQQ0RfUVVJUktfRFNDX1dJVEhPVVRfVklSVFVBTF9EUENELA0KPiAg
fTsNCj4gIA0KPiAgLyoqDQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
