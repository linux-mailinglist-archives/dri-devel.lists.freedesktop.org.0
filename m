Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5A8E13B7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79086E99E;
	Wed, 23 Oct 2019 08:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400107.outbound.protection.outlook.com [40.107.140.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2776E889
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 16:30:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5iWWxOZhYXbLDXdQPRstLSFk6xGJ4Gd8ggGIaYUWSUZhKsgTm2IDYaB4ZgHKSUCNUQXV3pS+yAazJq/WDbX0pVhQSmxvEhmfCUCrCr2puPil3RQh3wM3hliTt0gMt8W7etDegAPL16APOy0ElbMeYKcQ6oaWbPgWZ4RbR7wfbb2/fvOL9kEebSeURuCqws9W7SUVaOZ885Y0/WZMU+xO6THYzF77wV50zpxapsJvx4YJn3xPBGj7kNWFG+wGXNK2Zq4Xxx3tE2F4qs35Yl0c1NEU7I107dMwWVQJT90JrTD6hCRzH93ck3SU5TaEd+A9UX1AiwAnvdLF/sLmQLpWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Waue0A9MGOm7F/zoIK/lL9zhB3dxD6Xl2alNYMmy9T8=;
 b=P5MGic66UrAGortAso8vS4M/6zu0pGv+wW8wu5gj6QhhrxgXdqX+ZM1BYrF9OJDES63WJL5W2gyTNaNn6Vo2kFk1QNoeZcI+hDN192X5mH5fMwuLl5+eBkSg6eHp2L7q1dgxCPDYoqV11pRdzsHV++xkn58h8fjp306DJGI8yC1Z0LXTQ5pww8SrC28+7CgLn/kOMaJjWKP1Kgzzw54RiEqs4tmUEoRW9ffxIYr/4jyHjzfx5YQeCueNB9DCz79Ux3mQP3ZGs55v15GSYm3y/LS7xPe4sqy5bO4jjqxU//MaOV0jBST9AsK5LWJU8pgxLR2jz/O/rZq7hA1V1VpAkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com (52.133.167.146) by
 TYXPR01MB1757.jpnprd01.prod.outlook.com (52.133.165.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 16:30:07 +0000
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::58ec:b6c:485e:19e0]) by TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::58ec:b6c:485e:19e0%7]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 16:30:07 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v3 0/8] Add dual-LVDS panel support to EK874
Thread-Topic: [PATCH v3 0/8] Add dual-LVDS panel support to EK874
Thread-Index: AQHVXc+RlrcIOAtYlU6wFCg32X69c6dnL44Q
Date: Tue, 22 Oct 2019 16:30:07 +0000
Message-ID: <TYXPR01MB17753318ECA1556FE53C262AC0680@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c9e063f8-f893-4ee1-4bb0-08d7570d19be
x-ms-traffictypediagnostic: TYXPR01MB1757:|TYXPR01MB1757:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYXPR01MB1757F605A685CE598F123F67C0680@TYXPR01MB1757.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(199004)(189003)(74316002)(2906002)(7736002)(7696005)(86362001)(6506007)(102836004)(25786009)(305945005)(6436002)(76116006)(66476007)(11346002)(6306002)(7416002)(9686003)(229853002)(53546011)(71190400001)(54906003)(66556008)(99286004)(64756008)(66446008)(76176011)(66946007)(6916009)(55016002)(966005)(6116002)(3846002)(14454004)(316002)(26005)(6246003)(256004)(71200400001)(5660300002)(14444005)(33656002)(44832011)(66066001)(186003)(4326008)(8676002)(52536014)(81166006)(81156014)(8936002)(446003)(486006)(476003)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TYXPR01MB1757;
 H:TYXPR01MB1775.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fCCyJDt/bkjqo+vBrSJXMRMWN26JsyuWa0BP0oVVrZEzUvBH4zrpdTzXftTnZl+5PFhrejsWPJP2NajkMefNBy67yXHuhytSsfW7fGcb6v2BHOCvQN5NDIHBZMz76D5I/kO0yYyiv6LVMap9HbPfjFpl9Vo5hlnr3gHEZfMTmQNtjrIMj3P90v6eSQY/Mq+2vtz/A3QtafxGmr2kJzvBbXOwrjLOLmYl0oAPtIQCzOd9/dagEpSf2qqNC9be8NLdf0FpUDxxBp0Y8VA5cqHzfHCK3v0mBZfp3RuULcjBNyKJtQ0+r+JtKflTHQK23cNLSTNq3rsTdu1vkFJpdbYY+pakY1dc4NOHIumVFUKUb/UTUZrj+2q4Zdumd7bwAJfbTpGOiKXHlU3zUxZploeydvwfdpSZTbDh6ygWtSWYjlELNV0IUVx8XoqauxO4S9iXSdFd03yL6NV4o5HlEpOgJB0m8gezdhm7aZ68fh0oM0s=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e063f8-f893-4ee1-4bb0-08d7570d19be
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 16:30:07.2208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XbwPj9MMuvp6h2vYg52urkCJKMb/Bih2eblLHRcGmFlXlz3l+PLEup7CGeFhV+Z9EHNiNAP6n+epqwBrLLay29rkDvByj9SdzEgWkVO7lSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1757
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Waue0A9MGOm7F/zoIK/lL9zhB3dxD6Xl2alNYMmy9T8=;
 b=p+n5bMtqXGZa1OdaPgmWI1/fnqWrWbPOv7kabZpP/MEdx2DUKMhw6r1AD/n5YNnyS+LmckEkUDypdxEiVj82Iar3XAA0re8eTNhX026UW6kHa4YHgocJRHB5NYvKYWtjEzAgkZOxudd5sux6jsfxQ7sgOdsTZtNZpkDsM/cb/vI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
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
Cc: Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, David Airlie <airlied@linux.ie>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwKCkRpZCB5b3UgaGF2ZSBhbnkgdGltZSB0byBsb29rIGludG8gdGhpcyBzZXJp
ZXM/CgpUaGFua3MsCkZhYgoKPiBGcm9tOiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ry
b0BicC5yZW5lc2FzLmNvbT4KPiBTZW50OiAyOCBBdWd1c3QgMjAxOSAxOTozNwo+IFN1YmplY3Q6
IFtQQVRDSCB2MyAwLzhdIEFkZCBkdWFsLUxWRFMgcGFuZWwgc3VwcG9ydCB0byBFSzg3NAo+IAo+
IERlYXIgQWxsLAo+IAo+IHRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgZHVhbC1MVkRTIHBh
bmVsIElESy0yMTIxV1IKPiBmcm9tIEFkdmFudGVjaDoKPiBodHRwczovL2J1eS5hZHZhbnRlY2gu
ZXUvRGlzcGxheXMvRW1iZWRkZWQtTENELUtpdHMtSGlnaC1CcmlnaHRuZXNzL21vZGVsLUlESy0y
MTIxV1ItSzJGSEEyRS5odG0KPiAKPiBWMyBhcHByb2FjaGVzIHRoZSBwcm9ibGVtIGluIGEgY29t
cGxldGVseSBkaWZmZXJlbnQgd2F5LCB3ZSBub3cKPiBoYXZlIHR3byBuZXcgcHJvcGVydGllcyB0
byBtYXJrIHRoZSBwb3J0cyBpbiB0aGUgRFQgYXMgcmVjZWl2aW5nCj4gZXZlbiBwaXhlbHMgYW5k
IG9kZCBwaXhlbHM6IGR1YWwtbHZkcy1ldmVuLXBpeGVscyBhbmQgZHVhbC1sdmRzLW9kZC1waXhl
bHMsCj4gd2hpY2ggbWVhbnMgZGV2aWNlIGRyaXZlcnMgc2hvdWxkIG5vdCB1c2UgYnJpZGdlIHNw
ZWNpZmljIG9yIHBhbmVsCj4gc3BlY2lmaWMgZHVhbF9saW5rIGZsYWdzLiBBbHNvLCBpbiB0aGlz
IGNhc2UgdGhlIERUIGRlc2NyaWJlcyB0aGUKPiBjb25uZWN0aW9uIGZ1bGx5Lgo+IAo+IEluIG9y
ZGVyIGZvciB0aGUgc29sdXRpb24gdG8gYmUgZ2VuZXJpYywgSSBoYXZlIGV4cG9ydGVkIGEgbmV3
IGhlbHBlcgo+IChkcm1fb2ZfbHZkc19nZXRfZHVhbF9saW5rX2NvbmZpZ3VyYXRpb24pIHRvIHdh
bGsgdGhlIGRldmljZSB0cmVlLAo+IGFuZCBmaWd1cmUgb3V0IGlmIHRoZSBjb25uZWN0aW9uIGlz
IGR1YWwtTFZEUy4gVGhlIHNhbWUgaGVscGVyIGdpdmVzCj4gaW5mb3JtYXRpb24gYWJvdXQgdGhl
IGNvbmZpZ3VyYXRpb24gb2YgdGhlIGNvbm5lY3Rpb24uIElmIFB4IGlzIGNvbm5lY3RlZAo+IHRv
IGEgcG9ydCBleHBlY3RpbmcgZXZlbiBwaXhlbHMgYW5kIFB5IGlzIGNvbm5lY3RlZCB0byBhIHBv
cnQgZXhwZWN0aW5nCj4gb2RkIHBpeGVscywgdGhlbiB0aGUgaGVscGVyIHJldHVybnMgRFJNX0xW
RFNfRFVBTF9MSU5LX0VWRU5fT0REX1BJWEVMUwo+IChsaWtlIGluIHRoZSBleGFtcGxlIGJlbG93
KSwgb3RoZXJ3aXNlIGl0IHJldHVybnMKPiBEUk1fTFZEU19EVUFMX0xJTktfT0REX0VWRU5fUElY
RUxTLgo+IAo+IAo+ICAtLS0tLS0tLSAgICAgICAgICAgIGR1YWwtbHZkcy1ldmVuLXBpeGVscyAg
LS0tLS0tLS0KPiB8ICAgICAgICB8LS0tLSAgICAgICAgICAgICAgICAgICAgICAgICAtLS0tfCAg
ICAgICAgfAo+IHwgICAgICAgIHwgUHggfC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0+fCBQbiB8ICAg
ICAgICB8Cj4gfCAgICAgICAgfC0tLS0gICAgICAgICAgICAgICAgICAgICAgICAgLS0tLXwgICAg
ICAgIHwKPiB8IFNPVVJDRSB8ICAgICAgICAgICBkdWFsLWx2ZHMtb2RkLXBpeGVscyAgfCAgU0lO
SyAgfAo+IHwgICAgICAgIHwtLS0tICAgICAgICAgICAgICAgICAgICAgICAgIC0tLS18ICAgICAg
ICB8Cj4gfCAgICAgICAgfCBQeSB8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLT58IFBtIHwgICAgICAg
IHwKPiB8ICAgICAgICB8LS0tLSAgICAgICAgICAgICAgICAgICAgICAgICAtLS0tfCAgICAgICAg
fAo+ICAtLS0tLS0tLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0tLS0tLS0K
PiAKPiBUaGUgZGV2aWNlIGRyaXZlciBmb3IgdGhlIGVuY29kZXIgdGhlbiB3aWxsIHdvcmsgb3V0
IGlmIHdpdGggdGhlIGN1cnJlbnQKPiB3aXJpbmcgdGhlIHBpeGVscyBuZWVkIHN3YXBwaW5nIG9y
IG5vdC4KPiAKPiBUaGUgc2FtZSBzb2x1dGlvbiB3b3JrcyBmb3IgYm90aCBwYW5lbHMgYW5kIGJy
aWRnZXMuCj4gCj4gU2luY2UgdGhlIERUIGRlc2NyaWJlcyB0aGUgY29ubmVjdGlvbiBmdWxseSwg
ZHJpdmVyCj4gZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYyB3b3JrcyBvdXQtb2Yt
dGhlLWJveCwgbm8gY2hhbmdlcwo+IHJlcXVpcmVkLCBob3dldmVyLCB0aGlzIGltcGxlbWVudGF0
aW9uIG9wZW5zIHVwIGEgcHJvYmxlbSB3aXRoIHRoZQo+IGR0LWJpbmRpbmdzLgo+IERyaXZlciBk
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbHZkcy5jIGNhbiBzdGlsbCBiZSBwbGVhc2VkIGJ5
Cj4gYSBwb3J0IG5vZGUsIGJ1dCBhbHNvIGJ5IGEgcG9ydHMgbm9kZS4KPiBJIGhhdmUgY3JlYXRl
ZCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9idXMtdGltaW5ncy9s
dmRzLnlhbWwKPiB3aXRoIHRoZSBpZGVhIG9mIGluY2x1ZGluZyBpdCBmcm9tIHBhbmVscyBhbmQg
YnJpZGdlcyBkdC1iaW5kaW5ncwo+IHN1cHBvcnRpbmcgZHVhbC1MVkRTIChhbmQgb2YgY291cnNl
IHRoZSBkdC1iaW5kaW5ncyBmb3IgdGhlIHNwZWNpZmljCj4gZGV2aWNlcyBzaG91bGQgc2F5IHdo
aWNoIHBvcnQgc2hvdWxkIGJlIG1hcmtlZCBhcyB3aGF0KSwgYnV0IGZpbGUKPiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9sdmRzLnlhbWwgZm9ybWFsbHkK
PiByZXF1aXJlcyBwcm9wZXJ0eSAicG9ydCIsIHdoaWxlIHdpdGggdGhpcyBpbXBsZW1lbnRhdGlv
biBpdCBzaG91bGQgcmVxdWlyZQo+IE9uZU9mICJwb3J0IiBhbmQgInBvcnRzIiwgYW5kIHVuZm9y
dHVuYXRlbHkgSSBjYW4ndCBzZWVtIHRvIGZpbmQgYSBuZWF0IHdheQo+IGFyb3VkIHRoYXQsIG90
aGVyIHRoYW4gY3JlYXRpbmcgYSBuZXcgY29tcGF0aWJsZSBzdHJpbmcKPiAoZS5nLiAicGFuZWwt
ZHVhbC1sdmRzIiksIGEgbmV3IGR0LWJpbmRpbmcgZG9jdW1lbnQgZm9yIGl0LCBhbmQgb2YgY291
cnNlIGFkZGluZwo+IHN1cHBvcnQgZm9yIHRoZSBuZXcgY29tcGF0aWJsZSBzdHJpbmcgdG8gZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYy4KPiBBcyBhIHJlc3VsdCwgdGhpcyBzZXJp
ZXMgaXMgbWlzc2luZyAoYXQgbGVhc3QpIGEgcGF0Y2ggbmVjZXNzYXJ5IHRvIGZ1bGx5Cj4gZG9j
dW1lbnQgdGhlIG5ldyBpbXBsZW1lbnRhdGlvbiB3aXRoaW4KPiBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9sdmRzLnlhbWwKPiAKPiBSb2IsIGRvIHlvdSBo
YXZlIGFueSBzdWdnZXN0aW9ucz8gRG8geW91IHRoaW5rIHRoaXMgaWRlYSB3b3JrcyBvayBmcm9t
IGEKPiBkb2N1bWVudGF0aW9uIHBvaW50IG9mIHZpZXc/IEJ5IHRoZSB3YXksIEkgZG9uJ3QgcmVh
bGx5IGtub3cgd2hhdCBJIGFtIGRvaW5nCj4gd2l0aCB0aGUgeWFtbCBkdC1iaW5kaW5ncywgSSBo
b3BlIHlvdSB3b24ndCBiZSBob3JyaWZpZWQgYnkgdGhpcyBzZXJpZXMgOi1QCj4gCj4gSSBob3Bl
IEkgd2FzIGFibGUgdG8gZGVsaXZlciB0aGUgY29uY2VwdCBjbGVhcmx5LCBpZiBub3QgcGxlYXNl
IGp1c3QgYXNrLgo+IAo+IENvbW1lbnRzIGFyZSB2ZXJ5IG11Y2ggYXBwcmVjaWF0ZWQuCj4gCj4g
VGhhbmtzLAo+IEZhYgo+IAo+IEZhYnJpemlvIENhc3RybyAoOCk6Cj4gICBkdC1iaW5kaW5nczog
ZGlzcGxheTogQWRkIGJpbmRpbmdzIGZvciBMVkRTIGJ1cy10aW1pbmdzCj4gICBkdC1iaW5kaW5n
czogZGlzcGxheTogQWRkIGlkay0yMTIxd3IgYmluZGluZwo+ICAgZHJtOiBBZGQgYnVzIHRpbWlu
Z3MgaGVscGVyCj4gICBkcm06IHJjYXItZHU6IGx2ZHM6IEFkZCBkdWFsLUxWRFMgcGFuZWxzIHN1
cHBvcnQKPiAgIGRybTogYnJpZGdlOiB0aGM2MzogRG8gbm90IHJlcG9ydCBpbnB1dCBidXMgbW9k
ZSB0aHJvdWdoIGJyaWRnZQo+ICAgICB0aW1pbmdzCj4gICBhcm02NDogZHRzOiByZW5lc2FzOiBB
ZGQgRUs4NzQgYm9hcmQgd2l0aCBpZGstMjEyMXdyIGRpc3BsYXkgc3VwcG9ydAo+ICAgW0hBQ0td
IGFybTY0OiBkdHM6IHJlbmVzYXM6IGRyYWFrOiBFbmFibGUgTFZEUwo+ICAgW0hBQ0tdIGFybTY0
OiBkdHM6IHJlbmVzYXM6IGRyYWFrOiBFbmFibGUgTFZEUyBkdWFsLWxpbmsgb3BlcmF0aW9uCj4g
Cj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2J1cy10aW1pbmdzL2x2ZHMueWFtbCAgICAgICAgIHwg
IDM4ICsrKysrKysKPiAgLi4uL2Rpc3BsYXkvcGFuZWwvYWR2YW50ZWNoLGlkay0yMTIxd3IueWFt
bCAgICAgICAgfCAgOTAgKysrKysrKysrKysrKysrKwo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvTWFrZWZpbGUgICAgICAgICAgICAgICB8ICAgMyArLQo+ICAuLi4vYm9vdC9kdHMvcmVu
ZXNhcy9yOGE3NzRjMC1lazg3NC1pZGstMjEyMXdyLmR0cyB8IDExNiArKysrKysrKysrKysrKysr
KysrKysKPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTkwLWViaXN1LmR0cyAg
ICAgfCAgMjEgKysrLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUtZHJh
YWsuZHRzICAgICB8ICAyNiArKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgMyArLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Ro
YzYzbHZkMTAyNC5jICAgICAgICAgICAgICB8ICAgOSArLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJt
X2J1c190aW1pbmdzLmMgICAgICAgICAgICAgICAgICB8ICA5NyArKysrKysrKysrKysrKysrKwo+
ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyAgICAgICAgICAgICAgICB8IDEx
MCArKysrKysrKysrKy0tLS0tLS0tCj4gIGluY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICA4IC0tCj4gIGluY2x1ZGUvZHJtL2RybV9idXNfdGltaW5n
cy5oICAgICAgICAgICAgICAgICAgICAgIHwgIDIxICsrKysKPiAgMTIgZmlsZXMgY2hhbmdlZCwg
NDczIGluc2VydGlvbnMoKyksIDY5IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnVzLXRpbWluZ3MvbHZk
cy55YW1sCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gsaWRrLTIxMjF3ci55YW1sCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YzAtZWs4NzQtaWRr
LTIxMjF3ci5kdHMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9kcm1fYnVz
X3RpbWluZ3MuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kcm0vZHJtX2J1c190aW1p
bmdzLmgKPiAKPiAtLQo+IDIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
