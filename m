Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDA23C2968
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 21:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EDB06EA5C;
	Fri,  9 Jul 2021 19:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8876EA5C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 19:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1625857373; x=1628449373;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aFzZeYksNuindk7iMv7DPMNX/B7zEZMO1e6X4mHRRxk=;
 b=MGK/uViNXUQdfQn8b2tuvOtgOS7WWyM/VazuLAB7KMKdN8N55DsRev5ueuGiw0US
 2oxiyr+Rs/Yerj7trO/Tu4S/fExy1DSEfZujnc83guAi+J+md+i7XaFLV40q9h48
 KY46STIeMRcGH83e9gnD+N+8RCN/JbK39sUlYIeJjVQ=;
X-AuditID: c39127d2-1e4f970000001daf-8a-60e89d5d191a
Received: from florix.phytec.de (florix.phytec.de [172.16.0.118])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 3D.E3.07599.D5D98E06;
 Fri,  9 Jul 2021 21:02:53 +0200 (CEST)
Received: from Berlix.phytec.de (172.16.0.117) by Florix.phytec.de
 (172.16.0.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 9 Jul 2021
 21:02:52 +0200
Received: from Berlix.phytec.de ([fe80::c131:350d:c471:aafd]) by
 berlix.phytec.de ([fe80::c131:350d:c471:aafd%3]) with mapi id 15.01.2308.008; 
 Fri, 9 Jul 2021 21:02:52 +0200
From: Yunus Bas <Y.Bas@phytec.de>
To: "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: [PATCH v3 2/2] drm/panel: simple: Add support for EDT
 ETM0350G0DH6 panel
Thread-Topic: [PATCH v3 2/2] drm/panel: simple: Add support for EDT
 ETM0350G0DH6 panel
Thread-Index: AQHXdO3wHKzu9IgCokuSRxUvHzXQjas63p2A
Date: Fri, 9 Jul 2021 19:02:52 +0000
Message-ID: <0f25d847360c9f9925fea216c2d15200acb5ff42.camel@phytec.de>
References: <20210706075908.907659-1-y.bas@phytec.de>
 <20210706075908.907659-2-y.bas@phytec.de> <YOiReNdogi3POjUS@ravnborg.org>
In-Reply-To: <YOiReNdogi3POjUS@ravnborg.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.116]
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C027CCD760AF54489CFAC18E3AEF496@phytec.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRmVeSWpSXmKPExsWyRoChTDd27osEgynHuC16z51ksvi/bSKz
 xZWv79ksOicuYbe4vGsOm8WKn1sZLX7umsfiwO6x99sCFo+ds+6ye8zumMnqsf3bA1aP+93H
 mTyWTLvK5vF5k1wAexSXTUpqTmZZapG+XQJXxu1vjxgL5ulUPLlQ3MDYo93FyMkhIWAi8XFm
 I2sXIxeHkMByJomtu08xQTgPGCUenF/HClIlJLCRUeLPBM0uRg4ONgFFiSu38kHCIgKaEh9f
 T2IHqWcWuMUkseDsfmaQhLBAuETfzRvMIPUiAhESyxqCIeqNJG6e62UEsVkEVCS+3v3LBGLz
 CrhJ9LY8YofY28QocWHOfzaQBKeAjsTX92/ZQWxGAVmJDRvOg81nFhCX2PTsOyvEBwISS/ZA
 xCUERCVePv4HFVeQaOvpZAK5gRno0PW79CFMC4ltFxghpihKTOl+yA5xgqDEyZlPWCYwis9C
 smAWQvMshOZZSJpnIWlewMi6ilEoNzM5O7UoM1uvIKOyJDVZLyV1EyMwhg9PVL+0g7Fvjsch
 RiYOxkOMEhzMSiK8RjOeJQjxpiRWVqUW5ccXleakFh9ilOZgURLn3cBbEiYkkJ5YkpqdmlqQ
 WgSTZeLglGpgtJHcUFYnk/FrwzXJp+oypdlXF2x+unvd1A/Zn4IPh4g7SuuXJxi/lPY0+Ll0
 6hW+wq//Dmsq7/CtlDOV7OlQ2v1b0yZtrsI+Cbv1TmE/Q064np7C/fmWpvbRsLSH55cVa63f
 sVzH/VyDaVTG5Hs75CtNJzqWb1I219OOW7PYNmTCS2EFl+RUJZbijERDLeai4kQAp4YGqM8C
 AAA=
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLA0KDQpBbSBGcmVpdGFnLCBkZW0gMDkuMDcuMjAyMSB1bSAyMDoxMiArMDIwMCBzY2hy
aWViIFNhbSBSYXZuYm9yZzoNCj4gSGkgWXVudXMsDQo+IA0KPiBPbiBUdWUsIEp1bCAwNiwgMjAy
MSBhdCAwOTo1OTowOEFNICswMjAwLCBZdW51cyBCYXMgd3JvdGU6DQo+ID4gRnJvbTogU3RlZmFu
IFJpZWRtdWVsbGVyIDxzLnJpZWRtdWVsbGVyQHBoeXRlYy5kZT4NCj4gPiANCj4gPiBUaGlzIHBh
dGNoIGFkZHMgc3VwcG9ydCBmb3IgdGhlIEVEVCBFVE0wMzUwRzBESDYgMy41IiAoMzIweDI0MCkg
bGNkDQo+ID4gcGFuZWwgdG8gRFJNIHNpbXBsZSBwYW5lbCBkcml2ZXIuDQo+ID4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogU3RlZmFuIFJpZWRtdWVsbGVyIDxzLnJpZWRtdWVsbGVyQHBoeXRlYy5kZT4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW51cyBCYXMgPHkuYmFzQHBoeXRlYy5kZT4NCj4gPiAtLS0N
Cj4gPiBDaGFuZ2VzIGluIHYzOg0KPiA+IC0gTm8gY2hhbmdlcyBpbiBnZW5lcmFsLCBhZGRlZCBh
ZGRpdGlvbmFsIG1haW50YWluZXJzIGFuZCBhbHNvDQo+ID4gc2VuZGluZw0KPiA+IHRvIGdlbmVy
YWwga2VybmVsIG1haWxpbmcgbGlzdA0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXNpbXBsZS5jIHwgMjkNCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMNCj4gPiBiL2RyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYw0KPiA+IGluZGV4IDA3NDMzYmZmNmMyYi4u
OGFiYTQ3M2E3NTkyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1zaW1wbGUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUu
Yw0KPiA+IEBAIC0xOTI5LDYgKzE5MjksMzIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9k
ZXNjIGVkdF9ldDAzNTAxMmRtNg0KPiA+ID0gew0KPiA+IMKgwqDCoMKgwqDCoMKgwqAuYnVzX2Zs
YWdzID0gRFJNX0JVU19GTEFHX0RFX0xPVyB8DQo+ID4gRFJNX0JVU19GTEFHX1BJWERBVEFfU0FN
UExFX1BPU0VER0UsDQo+ID4gwqB9Ow0KPiA+IMKgDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHJtX2Rpc3BsYXlfbW9kZSBlZHRfZXRtMDM1MGcwZGg2X21vZGUgPSB7DQo+ID4gK8KgwqDCoMKg
wqDCoMKgLmNsb2NrID0gNjUyMCwNCj4gPiArwqDCoMKgwqDCoMKgwqAuaGRpc3BsYXkgPSAzMjAs
DQo+ID4gK8KgwqDCoMKgwqDCoMKgLmhzeW5jX3N0YXJ0ID0gMzIwICsgMjAsDQo+ID4gK8KgwqDC
oMKgwqDCoMKgLmhzeW5jX2VuZCA9IDMyMCArIDIwICsgNjgsDQo+ID4gK8KgwqDCoMKgwqDCoMKg
Lmh0b3RhbCA9IDMyMCArIDIwICsgNjgsDQo+ID4gK8KgwqDCoMKgwqDCoMKgLnZkaXNwbGF5ID0g
MjQwLA0KPiA+ICvCoMKgwqDCoMKgwqDCoC52c3luY19zdGFydCA9IDI0MCArIDQsDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgLnZzeW5jX2VuZCA9IDI0MCArIDQgKyAxOCwNCj4gPiArwqDCoMKgwqDCoMKg
wqAudnRvdGFsID0gMjQwICsgNCArIDE4LA0KPiA+ICvCoMKgwqDCoMKgwqDCoC5mbGFncyA9IERS
TV9NT0RFX0ZMQUdfTlZTWU5DIHwgRFJNX01PREVfRkxBR19OSFNZTkMsDQo+ID4gK307DQo+ID4g
Kw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgZWR0X2V0bTAzNTBnMGRoNiA9
IHsNCj4gPiArwqDCoMKgwqDCoMKgwqAubW9kZXMgPSAmZWR0X2V0bTAzNTBnMGRoNl9tb2RlLA0K
PiA+ICvCoMKgwqDCoMKgwqDCoC5udW1fbW9kZXMgPSAxLA0KPiA+ICvCoMKgwqDCoMKgwqDCoC5i
cGMgPSA2LA0KPiA+ICvCoMKgwqDCoMKgwqDCoC5zaXplID0gew0KPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAud2lkdGggPSA3MCwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgLmhlaWdodCA9IDUzLA0KPiA+ICvCoMKgwqDCoMKgwqDCoH0sDQo+ID4gK8KgwqDC
oMKgwqDCoMKgLmJ1c19mb3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDI0LA0KPiA+ICvC
oMKgwqDCoMKgwqDCoC5idXNfZmxhZ3MgPSBEUk1fQlVTX0ZMQUdfREVfSElHSCB8DQo+ID4gRFJN
X0JVU19GTEFHX1BJWERBVEFfRFJJVkVfTkVHRURHRSwNCj4gPiArwqDCoMKgwqDCoMKgwqAuY29u
bmVjdG9yX3R5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfRFBJLA0KPiA+ICt9Ow0KPiA+ICsNCj4g
PiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBlZHRfZXRtMDQzMDgwZGg2
Z3BfbW9kZSA9IHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLmNsb2NrID0gMTA4NzAsDQo+ID4gwqDC
oMKgwqDCoMKgwqDCoC5oZGlzcGxheSA9IDQ4MCwNCj4gPiBAQCAtNDM1NSw2ICs0MzgxLDkgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQNCj4gPiBwbGF0Zm9ybV9vZl9tYXRjaFtd
ID0gew0KPiA+IMKgwqDCoMKgwqDCoMKgwqB9LCB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAuY29tcGF0aWJsZSA9ICJlZHQsZXQwMzUwMTJkbTYiLA0KPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLmRhdGEgPSAmZWR0X2V0MDM1MDEyZG02LA0KPiA+ICvC
oMKgwqDCoMKgwqDCoH0sIHsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLmNv
bXBhdGlibGUgPSAiZWR0LGV0bTAzNTBnMGRoNiIsDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoC5kYXRhID0gJmVkdF9ldG0wMzUwZzBkaDYsDQo+IA0KPiBUaGUgY29tcGF0aWJs
ZSAiZWR0LGV0bTAzNTBnMGRoNiIgaXMgbm90IGRvY3VtZW50ZWQuDQo+IFlvdSBsaWtlbHkgbmVl
ZCB0byBhZGQgaXQgdG8gcGFuZWwtc2ltcGxlLnlhbWwgLSBhbmQgbGlrZXdpc2UgZm9yIHRoZQ0K
PiBmaXJzdCBwYXRjaC4NCj4gDQo+IGR0IHBlb3BsZSBsaWtlIGJpbmRpbmcgcGF0Y2hlcyBpbiBz
ZXBhcmF0ZSBwYXRjaGVzIHNvIGFkZCB0aGVtIGJvdGggaW4NCj4gb25lIGRlZGljYXRlZCBwYXRj
aC4NCg0KSSd2ZSBhbHJlYWR5IHNlbnQgZGV2aWNldHJlZSBwYXRjaGVzLiBIZXJlIGlzIHRoZSBs
aW5rOg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZGV2aWNldHJlZS8yMDIxMDMzMTE4
MTMxNy40NjQ5MjYtMS15LmJhc0BwaHl0ZWMuZGUvDQoNCkl0IHdhcyBqdXN0IHBlbmRpbmcgYW5k
IHdhaXRpbmcgZm9yIHRoZXNlIHBhdGNoZXMuIFNoYWxsIEkgc2VuZCBhZ2Fpbj8NCg0KUmVnYXJk
cywgWXVudXMNCj4gDQo+IMKgwqDCoMKgwqDCoMKgwqBTYW0NCg0KLS0gDQpNaXQgZnJldW5kbGlj
aGVuIEdyw7zDn2VuDQpZdW51cyBCYXMNCg0KLVNvZnR3YXJlIEVuZ2luZWVyLQ0KUEhZVEVDIE1l
c3N0ZWNobmlrIEdtYkgNClJvYmVydC1Lb2NoLVN0ci4gMzkNCjU1MTI5IE1haW56DQpHZXJtYW55
DQpUZWwuOiArNDkgKDApNjEzMSA5MjIxLSA0NjYNCldlYjogd3d3LnBoeXRlYy5kZQ0KDQpTaWUg
ZmluZGVuIHVucyBhdWNoIGF1ZjogRmFjZWJvb2ssIExpbmtlZEluLCBYaW5nLCBZb3VUdWJlDQoN
ClBIWVRFQyBNZXNzdGVjaG5payBHbWJIIHwgUm9iZXJ0LUtvY2gtU3RyLiAzOSB8IDU1MTI5IE1h
aW56LCBHZXJtYW55DQpHZXNjaMOkZnRzZsO8aHJlcjogRGlwbC4tSW5nLiBNaWNoYWVsIE1pdGV6
a2ksIERpcGwuLUluZy4gQm9kbyBIdWJlciB8DQpIYW5kZWxzcmVnaXN0ZXIgTWFpbnogSFJCIDQ2
NTYgfCBGaW5hbnphbXQgTWFpbnogfCBTdC5Oci4gMjY2NTAwNjA4LCBERQ0KMTQ5MDU5ODU1DQpU
aGlzIEUtTWFpbCBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgb3IgcHJpdmlsZWdlZCBpbmZvcm1h
dGlvbi4gSWYgeW91DQphcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQgKG9yIGhhdmUgcmVj
ZWl2ZWQgdGhpcyBFLU1haWwgaW4gZXJyb3IpDQpwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1t
ZWRpYXRlbHkgYW5kIGRlc3Ryb3kgdGhpcyBFLU1haWwuIEFueQ0KdW5hdXRob3JpemVkIGNvcHlp
bmcsIGRpc2Nsb3N1cmUgb3IgZGlzdHJpYnV0aW9uIG9mIHRoZSBtYXRlcmlhbCBpbg0KdGhpcyBF
LU1haWwgaXMgc3RyaWN0bHkgZm9yYmlkZGVuLg0KDQo=
