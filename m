Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A229117E
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8A56EA08;
	Sat, 17 Aug 2019 15:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410104.outbound.protection.outlook.com [40.107.141.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF41F6E9D5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 14:48:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFBVLTiC57i2cZ2mi1a/vVsK9+ttjxiX7s9Hfs2TOAS5wdg2V3P997a81rDO7AUAdSdewiboqZITpv6rGegJ7wvsGdv7xA7sQZNjC5KjycfiI2UAmgEWGmDkIEvXGLps4lsqAFbcbfQoZnKniUZPbYQJgf6C2QIURoyZDSe7w1AE+mkeCI1W7sp6EsTmHmrVuSAmIp/VtdA9MTCYbvt8/0qhmsn0u57SvksURRtBJr+tQvGXc9RZ03avS1FWxwXJOMDMaYPAWbBoO9jRVlmYF6Z1qZ61gYk+lWWQraMSOa2oMZ9YUdLzq63EfCrHxxByYNJ4RF/KzQ9P9u3wfW2MfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CKa283XFH7H0pkzPzqX0STiEG098bbKjFleO15yBW4=;
 b=WqBJTOJ4NGomScO0BgyyH07izO3SFAVHJpapCTzzVeTT8Wg/wsM5wYhlKlZuM7nzoxFviAnLcg9ddbETRRKC+MCHA/am91KOJS7bfNCBYc2JJ4bFX+CAzBeCPWi6dIRV3eJG0WtpAjyFuNAmv7f122pOLb/uu0MUG3FmqcKlBrMcyYtc1lfU+MaNx4kBdMpjC5rbBDzxbRJa0F+vr2JRXOApPyAKlGmjZxorgtvjwGj87BZjZsQFRv4ndzeDYMPBTGGZUBjJqIVHX4D+xDXXEAmb53pBNAhAS9Zd1nRo0teTwOwfydGfamNkUoKXcXlzKNWIDFfkA+B9MSdec/GNeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1882.jpnprd01.prod.outlook.com (52.133.162.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 15 Aug 2019 14:48:37 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 14:48:32 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH v2 5/9] drm/panel: Add timings field to drm_panel
Thread-Topic: [PATCH v2 5/9] drm/panel: Add timings field to drm_panel
Thread-Index: AQHVU1lR1gJ71LUS4EifTwZDwmXYxab8QI+AgAAFtUA=
Date: Thu, 15 Aug 2019 14:48:32 +0000
Message-ID: <TY1PR01MB1770D35FF55C2905191426D5C0AC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-6-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815141337.GA2437@ravnborg.org>
In-Reply-To: <20190815141337.GA2437@ravnborg.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71454eb6-ba8f-4d7d-4502-08d7218fa4bc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1882; 
x-ms-traffictypediagnostic: TY1PR01MB1882:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB18828AC9FE01A128138896EBC0AC0@TY1PR01MB1882.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(199004)(189003)(76116006)(76176011)(7696005)(66446008)(64756008)(66556008)(66476007)(66946007)(316002)(229853002)(6436002)(55016002)(9686003)(6506007)(53546011)(52536014)(71200400001)(71190400001)(102836004)(446003)(486006)(25786009)(11346002)(476003)(44832011)(256004)(5024004)(99286004)(54906003)(186003)(26005)(5660300002)(53936002)(14454004)(7416002)(6916009)(478600001)(4326008)(6246003)(33656002)(86362001)(74316002)(7736002)(305945005)(6116002)(66066001)(2906002)(3846002)(81166006)(81156014)(8676002)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1882;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BHW+ssW3UmCahKljyL1PExP5qMSv2bTk/fwqrchkcio6wIsbsldftwAjCbGV5Si9Ect3RrcsZ1P8Mk7GriOc/VzPy43mQgsg3SWFZZMn60oXxh1GSPLZw45yhJ+ZJqLLLnpt70LHZztjVmTSkQFDlhFJBEgu/clSLb1uAmSrfYc/5pa9ozXOxgCQXmAbRzDK9cXuJbiXn7tmqyj8S3FWxAkrcGiA0PvMhar13rAwjNzVmenNsCfXRn8odl2ZsP+UxWx2DEIQYZNAWlO+YXT1bQ25l3221qM1OaeX3vIJxPUnJs5kgQI0xxLM3LhBp8Mt+YsiAfU+ETAz/hTU5qqLnZqfGOo5ZAA1d/JHgGRbJPGM238kD834Nt02pCAknlDoICbE6qzkCG6EVmLIzcwhoG0U0U6XkHe5hQLGb+Rijdc=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71454eb6-ba8f-4d7d-4502-08d7218fa4bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 14:48:32.2547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sIm0YenKzU2zpDYLh8qCbY+kcmcYHgnWtQgQ5tiDU8LKSLtDuFbUSJM5+BP6/zMsd3wcqN9YFChdLpuWwUxdk3QDGB+/EuKw9rqgV2TBeHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1882
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CKa283XFH7H0pkzPzqX0STiEG098bbKjFleO15yBW4=;
 b=p1FY8eN2PsZCvLYG4hVDv17VnlCmCd8YydJ+k/VSGp0WqXl3fnWblle5jtQi2evJiO7UZpG78hBeqM7QFL39L88kFstq400JMbZQp6rTGduXDTMSxP2sS2SnZMQTTp0YbvsLZRf1uh3yRoHPcdSppmUeSUk/R39ncYUdxRCdna8=
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQoKPiBGcm9tOiBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gU2VudDogMTUgQXVndXN0IDIwMTkgMTU6MTQKPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYyIDUvOV0gZHJtL3BhbmVsOiBBZGQgdGltaW5ncyBmaWVsZCB0byBk
cm1fcGFuZWwKPiAKPiBIaSBGYWJyaXppbwo+IAo+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDEy
OjA0OjI5UE0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90ZToKPiA+IFdlIG5lZWQgdG8ga25v
dyBpZiB0aGUgcGFuZWwgc3VwcG9ydHMgZHVhbC1saW5rLCBzaW1pbGFybHkKPiA+IHRvIGJyaWRn
ZXMsIHRoZXJlZm9yZSBhZGQgYSByZWZlcmVuY2UgdG8gZHJtX3RpbWluZ3MgaW4KPiA+IGRybV9w
YW5lbC4KPiAKPiBXaHkgZG8gd2UgbmVlZCB0byBrbm93IHRoaXM/CgpUaGUgZW5jb2RlcnMgY29u
bmVjdGVkIHRvIGEgZHVhbC1MVkRTIHBhbmVscyBtYXkgbmVlZCB0byBkbyBzcGVjaWFsCmFycmFu
Z2VtZW50cyBmb3IgdGhlIGR1YWwtbGluayBzZXR1cCwgbGlrZSBpbml0aWFsaXppbmcgYSBjb21w
YW5pb24KZW5jb2RlciwgYW5kIHdvcmtpbmcgb3V0IHdoaWNoIHBpeGVscyAoZXZlbiBvciBvZGQp
IHRvIHNlbmQgdG8gd2hpY2gKcG9ydCAoZmlyc3QgTFZEUyBpbnB1dCBwb3J0IG9yIHNlY29uZCBM
VkRTIGlucHV0IHBvcnQpLiBBdCBsZWFzdCwgdGhpcyBpcwp3aXRoaW4gdGhlIHNjb3BlIG9mIHRo
ZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGlzIHNlcmllcywgd2hpY2ggaXMgY3VycmVudGx5CmJlaW5n
IGRpc2N1c3NlZC4KCj4gV2h5IGlzIGl0IG5lZWRlZCBpbiBkcm1fcGFuZWwgYW5kIG5vdCBpbiBz
b21lIGRyaXZlciBzcGVjaWZpYyBzdHJ1Y3Q/CgpUaGUgb3RoZXIgZmllbGRzIGFyZSBzdGlsbCBh
cHBsaWNhYmxlIHRvIHBhbmVscywgc28gSSB0aGluayBpdCBtYWtlcyBzZW5zZSAKZm9yIHRoaXMg
dG8gYmUgaW5jbHVkZWQgaW4gc3RydWN0IGRybV9wYW5lbHMuIAoKPiAKPiBJIGNhbm5vdCBzZWUg
dGhlIGZ1bGwgc2VyaWVzLCBhcyBJIHdhcyBjb3BpZWQgb25seSBvbiBzb21lIG1haWxzLgo+IEF3
YWl0aW5nIGRyaS1kZXZlbCBtb2RlcmF0b3IgYmVmb3JlIEkgY2FuIHNlZSB0aGUgcmVzdC4KCkkg
YW0gc29ycnkgYWJvdXQgdGhpcywgc29tZSBwZW9wbGUgZG9uJ3Qgd2FudCB0byBiZSBib3RoZXJl
ZCBieSB0aGUgd2hvbGUKdGhpbmcsIEknbGwgbWFrZSBzdXJlIEkgYWRkIHlvdSB0byB0aGUgcmVj
aXBpZW50cyBsaXN0IGZvciB0aGUgbmV4dCBpdGVyYXRpb25zCm9mIHRoaXMgc2VyaWVzLgoKVGhh
bmtzLApGYWIKCj4gCj4gCVNhbQo+IAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENh
c3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgo+ID4KPiA+IC0tLQo+ID4gdjEt
PnYyOgo+ID4gKiBuZXcgcGF0Y2gKPiA+Cj4gPiAgaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmggfCAz
ICsrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmggYi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaAo+
ID4gaW5kZXggOGM3MzhjMC4uY2Q2ZmYwNyAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9wYW5lbC5oCj4gPiArKysgYi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaAo+ID4gQEAgLTI2LDYg
KzI2LDcgQEAKPiA+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+Cj4gPiAgI2luY2x1ZGUg
PGxpbnV4L2xpc3QuaD4KPiA+ICsjaW5jbHVkZSA8ZHJtL2RybV90aW1pbmdzLmg+Cj4gPgo+ID4g
IHN0cnVjdCBkZXZpY2Vfbm9kZTsKPiA+ICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvcjsKPiA+IEBAIC04
MSw2ICs4Miw3IEBAIHN0cnVjdCBkcm1fcGFuZWxfZnVuY3Mgewo+ID4gICAqIHN0cnVjdCBkcm1f
cGFuZWwgLSBEUk0gcGFuZWwgb2JqZWN0Cj4gPiAgICogQGRybTogRFJNIGRldmljZSBvd25pbmcg
dGhlIHBhbmVsCj4gPiAgICogQGNvbm5lY3RvcjogRFJNIGNvbm5lY3RvciB0aGF0IHRoZSBwYW5l
bCBpcyBhdHRhY2hlZCB0bwo+ID4gKyAqIEB0aW1pbmdzOiB0aW1pbmcgaW5mb3JtYXRpb24KPiA+
ICAgKiBAZGV2OiBwYXJlbnQgZGV2aWNlIG9mIHRoZSBwYW5lbAo+ID4gICAqIEBsaW5rOiBsaW5r
IGZyb20gcGFuZWwgZGV2aWNlIChzdXBwbGllcikgdG8gRFJNIGRldmljZSAoY29uc3VtZXIpCj4g
PiAgICogQGZ1bmNzOiBvcGVyYXRpb25zIHRoYXQgY2FuIGJlIHBlcmZvcm1lZCBvbiB0aGUgcGFu
ZWwKPiA+IEBAIC04OSw2ICs5MSw3IEBAIHN0cnVjdCBkcm1fcGFuZWxfZnVuY3Mgewo+ID4gIHN0
cnVjdCBkcm1fcGFuZWwgewo+ID4gIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtOwo+ID4gIAlzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOwo+ID4gKwljb25zdCBzdHJ1Y3QgZHJtX3RpbWlu
Z3MgKnRpbWluZ3M7Cj4gPiAgCXN0cnVjdCBkZXZpY2UgKmRldjsKPiA+Cj4gPiAgCWNvbnN0IHN0
cnVjdCBkcm1fcGFuZWxfZnVuY3MgKmZ1bmNzOwo+ID4gLS0KPiA+IDIuNy40Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
