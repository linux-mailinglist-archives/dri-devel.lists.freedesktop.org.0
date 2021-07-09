Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CBA3C295C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 20:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4706EA5B;
	Fri,  9 Jul 2021 18:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4656EA5A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 18:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1625857016; x=1628449016;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0JXfPfysFGsq4Gq53PoBe0ygA8ID7GtZoxIxCOiYc+Q=;
 b=XcSy2sKQ3Ob/HR6ddpQNIXdrgfyhF2ZiTSF6zV53OvLEvPDa1UjMs06ZjHW+ccX3
 PTMOOndi1JwF7+/PIBnfVTOVsgIfQQ9HTTNtTqFkGcAOACVL7m6kHe2MoLT4uyfF
 u98vrkRh0UjXGohPOgRC3oIfg+WZgsX05UXwzXnn0ig=;
X-AuditID: c39127d2-1e4f970000001daf-66-60e89bf8ff2d
Received: from Diagnostix.phytec.de (Diagnostix.phytec.de [172.16.0.119])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id A8.E3.07599.8FB98E06;
 Fri,  9 Jul 2021 20:56:56 +0200 (CEST)
Received: from Berlix.phytec.de (172.16.0.117) by Diagnostix.phytec.de
 (172.16.0.119) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 9 Jul 2021
 20:56:55 +0200
Received: from Berlix.phytec.de ([fe80::c131:350d:c471:aafd]) by
 berlix.phytec.de ([fe80::c131:350d:c471:aafd%3]) with mapi id 15.01.2308.008; 
 Fri, 9 Jul 2021 20:56:55 +0200
From: Yunus Bas <Y.Bas@phytec.de>
To: "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: [PATCH v3 1/2] drm/panel: simple: Add support for EDT
 ETMV570G2DHU panel
Thread-Topic: [PATCH v3 1/2] drm/panel: simple: Add support for EDT
 ETMV570G2DHU panel
Thread-Index: AQHXdO1xpOZocCWCkkWX939PlmZPNas63PiA
Date: Fri, 9 Jul 2021 18:56:55 +0000
Message-ID: <2371e4fad8a61511e1213c07b41117079628c5f9.camel@phytec.de>
References: <20210706075908.907659-1-y.bas@phytec.de>
 <YOiQo3B9JtE0kuO7@ravnborg.org>
In-Reply-To: <YOiQo3B9JtE0kuO7@ravnborg.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.116]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8FA7EC2EB930B4A8F5BC2BCEF473FD5@phytec.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRmVeSWpSXmKPExsWyRoChXPfH7BcJBst+cFj0njvJZPF/20Rm
 iytf37NZdE5cwm5xedccNosVP7cyWvzcNY/Fgd1j77cFLB47Z91l95jdMZPVY/u3B6we97uP
 M3ksmXaVzePzJrkA9igum5TUnMyy1CJ9uwSujDVrXrIXfNCp2LEko4HxjnYXIyeHhICJxO5P
 Zxm7GLk4hATWM0lsWdjCAuE8YZR4cHMvG4SzkVHi0tYXQA4HB5uAosSVW/kg3SICmhIfX09i
 B6lhFrjFJLHg7H5mkBphgXCJjv8BEDUREsvWPmGGsI0k9mzdywJSwiKgInF4rQdImFfATeLr
 o/NMILYQUPnMwxPZQGxOAR2JLX8mgcUZBWQlNmw4DzaGWUBcYtOz76wQDwhILNkDEZcQEJV4
 +fgfVFxBoq2nkwlkFTPQmet36UO0WkgcuLoMaoyixJTuh+wQJwhKnJz5hGUCo/gsJBtmIXTP
 QtI9C0n3LCTdCxhZVzEK5WYmZ6cWZWbrFWRUlqQm66WkbmIERvHhieqXdjD2zfE4xMjEwXiI
 UYKDWUmE12jGswQh3pTEyqrUovz4otKc1OJDjNIcLErivBt4S8KEBNITS1KzU1MLUotgskwc
 nFINjCl3tye6+BWLz5zuKSh5yeNhodZZPqHV74853mCLXdnFxrDAZ1KZqxPf0apVX6uUq3b9
 27jheLSxg9FErtyN1r4NUk8t+0InVjzReP5sxnwrP43U1o/2C7PV3ffnb2d3n/xf0mbe8r3l
 DCt7ROL2XDRerrZf7GHGrTtbjNMVj4jE/fKaYRUjrMRSnJFoqMVcVJwIAK+VQiPQAgAA
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

SGkgU2FtLA0KDQpBbSBGcmVpdGFnLCBkZW0gMDkuMDcuMjAyMSB1bSAyMDowOCArMDIwMCBzY2hy
aWViIFNhbSBSYXZuYm9yZzoNCj4gSGkgWXVudXMsDQo+IA0KPiBPbiBUdWUsIEp1bCAwNiwgMjAy
MSBhdCAwOTo1OTowN0FNICswMjAwLCBZdW51cyBCYXMgd3JvdGU6DQo+ID4gRnJvbTogU3RlZmFu
IFJpZWRtdWVsbGVyIDxzLnJpZWRtdWVsbGVyQHBoeXRlYy5kZT4NCj4gPiANCj4gPiBUaGlzIHBh
dGNoIGFkZHMgc3VwcG9ydCBmb3IgdGhlIEVEVCBFVE1WNTcwRzJESFUgNS43IiAoNjQweDQ4MCkg
bGNkDQo+ID4gcGFuZWwNCj4gPiB0byBEUk0gc2ltcGxlIHBhbmVsIGRyaXZlci4NCj4gPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gUmllZG11ZWxsZXIgPHMucmllZG11ZWxsZXJAcGh5dGVj
LmRlPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1bnVzIEJhcyA8eS5iYXNAcGh5dGVjLmRlPg0KPiA+
IC0tLQ0KPiA+IENoYW5nZXMgaW4gdjM6DQo+ID4gLSBObyBjaGFuZ2VzIGluIGdlbmVyYWwsIGFk
ZGVkIGFkZGl0aW9uYWwgbWFpbnRhaW5lcnMgYW5kIGFsc28NCj4gPiBzZW5kaW5nDQo+ID4gdG8g
Z2VuZXJhbCBrZXJuZWwgbWFpbGluZyBsaXN0DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgfCAyOQ0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYw0KPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jDQo+ID4gaW5kZXggMjE5MzlkNDM1
MmNmLi4wNzQzM2JmZjZjMmIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXNpbXBsZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNp
bXBsZS5jDQo+ID4gQEAgLTIwMDgsNiArMjAwOCwzMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBh
bmVsX2Rlc2MNCj4gPiBlZHRfZXQwNTcwOTBkaHUgPSB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoC5j
b25uZWN0b3JfdHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9EUEksDQo+ID4gwqB9Ow0KPiA+IMKg
DQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBlZHRfZXRtdjU3MGcy
ZGh1X21vZGUgPSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgLmNsb2NrID0gMjUxNzUsDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgLmhkaXNwbGF5ID0gNjQwLA0KPiA+ICvCoMKgwqDCoMKgwqDCoC5oc3luY19z
dGFydCA9IDY0MCwNCj4gPiArwqDCoMKgwqDCoMKgwqAuaHN5bmNfZW5kID0gNjQwICsgMTYsDQo+
ID4gK8KgwqDCoMKgwqDCoMKgLmh0b3RhbCA9IDY0MCArIDE2ICsgMzAgKyAxMTQsDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgLnZkaXNwbGF5ID0gNDgwLA0KPiA+ICvCoMKgwqDCoMKgwqDCoC52c3luY19z
dGFydCA9IDQ4MCArIDEwLA0KPiA+ICvCoMKgwqDCoMKgwqDCoC52c3luY19lbmQgPSA0ODAgKyAx
MCArIDMsDQo+ID4gK8KgwqDCoMKgwqDCoMKgLnZ0b3RhbCA9IDQ4MCArIDEwICsgMyArIDM1LA0K
PiA+ICvCoMKgwqDCoMKgwqDCoC5mbGFncyA9IERSTV9NT0RFX0ZMQUdfUFZTWU5DIHwgRFJNX01P
REVfRkxBR19QSFNZTkMsDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IHBhbmVsX2Rlc2MgZWR0X2V0bXY1NzBnMmRodSA9IHsNCj4gPiArwqDCoMKgwqDCoMKgwqAubW9k
ZXMgPSAmZWR0X2V0bXY1NzBnMmRodV9tb2RlLA0KPiA+ICvCoMKgwqDCoMKgwqDCoC5udW1fbW9k
ZXMgPSAxLA0KPiA+ICvCoMKgwqDCoMKgwqDCoC5icGMgPSA2LA0KPiA+ICvCoMKgwqDCoMKgwqDC
oC5zaXplID0gew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAud2lkdGggPSAx
MTUsDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5oZWlnaHQgPSA4NiwNCj4g
PiArwqDCoMKgwqDCoMKgwqB9LA0KPiA+ICvCoMKgwqDCoMKgwqDCoC5idXNfZm9ybWF0ID0gTUVE
SUFfQlVTX0ZNVF9SR0I4ODhfMVgyNCwNCj4gPiArwqDCoMKgwqDCoMKgwqAuYnVzX2ZsYWdzID0g
RFJNX0JVU19GTEFHX0RFX0hJR0ggfA0KPiA+IERSTV9CVVNfRkxBR19QSVhEQVRBX0RSSVZFX05F
R0VER0UsDQo+ID4gK8KgwqDCoMKgwqDCoMKgLmNvbm5lY3Rvcl90eXBlID0gRFJNX01PREVfQ09O
TkVDVE9SX0RQSSwNCj4gPiArfTsNCj4gPiArDQo+ID4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgZWR0X2V0bTA3MDBnMGRoNl9tb2RlID0gew0KPiA+IMKgwqDCoMKgwqDC
oMKgwqAuY2xvY2sgPSAzMzI2MCwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLmhkaXNwbGF5ID0gODAw
LA0KPiA+IEBAIC00MzM4LDYgKzQzNjQsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZA0KPiA+IHBsYXRmb3JtX29mX21hdGNoW10gPSB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoH0s
IHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5jb21wYXRpYmxlID0gImVk
dCxldDA1NzA5MGRodSIsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAuZGF0
YSA9ICZlZHRfZXQwNTcwOTBkaHUsDQo+ID4gK8KgwqDCoMKgwqDCoMKgfSwgew0KPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAuY29tcGF0aWJsZSA9ICJlZHQsZXRtdjU3MGcyZGh1
IiwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLmRhdGEgPSAmZWR0X2V0bXY1
NzBnMmRodSwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgfSwgew0KPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgLmNvbXBhdGlibGUgPSAiZWR0LGV0MDcwMDgwZGg2IiwNCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5kYXRhID0gJmVkdF9ldG0wNzAwZzBkaDYsDQo+
IA0KPiBUaGlzIGxpc3QgbXVzdCBiZSBhbHBoYWJldGljYWxseSBzb3J0ZWQgYWZ0ZXIgY29tcGF0
aWJsZS4NCj4gDQo+ICJlZHQsZXRtdjU3MGcyZGh1IiBjb21lcyBhZnRlciAiZWR0LGV0MDcwMDgw
ZGg2Ig0KPiANCj4gVGhlIHNhbWUgb3JkZXIgbXVzdCBiZSB1c2VkIHdoZXJlIGVkdF9ldG12NTcw
ZzJkaHUgaXMgZGVmaW5lZC4NCj4gU29ycnkgZm9yIHRoaXMgbml0LCBidXQgaWYgd2UgZmFpbHMg
dG8gZm9sbHcgaXQgd2Ugd2lsbCBzb29uIGhhdmUNCj4gY2hhb3MuDQoNCk9mIGNvdXJzZSwgc29y
cnkgZm9yIG5vdCBub3RpY2luZyBlYXJsaWVyLiBJIHdpbGwgY2hhbmdlIHRoaXMuDQoNClJlZ2Fy
ZHMsIFl1bnVzDQo+IA0KPiBUaGUgcmVzdCBsb29rcyBnb29kLCBldmVyeXRoaW5nIG5lZWRlZCBp
cyBkZWZpbmVkLg0KPiANCj4gwqDCoMKgwqDCoMKgwqDCoFNhbQ0KDQotLSANCk1pdCBmcmV1bmRs
aWNoZW4gR3LDvMOfZW4NCll1bnVzIEJhcw0KDQotU29mdHdhcmUgRW5naW5lZXItDQpQSFlURUMg
TWVzc3RlY2huaWsgR21iSA0KUm9iZXJ0LUtvY2gtU3RyLiAzOQ0KNTUxMjkgTWFpbnoNCkdlcm1h
bnkNClRlbC46ICs0OSAoMCk2MTMxIDkyMjEtIDQ2Ng0KV2ViOiB3d3cucGh5dGVjLmRlDQoNClNp
ZSBmaW5kZW4gdW5zIGF1Y2ggYXVmOiBGYWNlYm9vaywgTGlua2VkSW4sIFhpbmcsIFlvdVR1YmUN
Cg0KUEhZVEVDIE1lc3N0ZWNobmlrIEdtYkggfCBSb2JlcnQtS29jaC1TdHIuIDM5IHwgNTUxMjkg
TWFpbnosIEdlcm1hbnkNCkdlc2Now6RmdHNmw7xocmVyOiBEaXBsLi1JbmcuIE1pY2hhZWwgTWl0
ZXpraSwgRGlwbC4tSW5nLiBCb2RvIEh1YmVyIHwNCkhhbmRlbHNyZWdpc3RlciBNYWlueiBIUkIg
NDY1NiB8IEZpbmFuemFtdCBNYWlueiB8IFN0Lk5yLiAyNjY1MDA2MDgsIERFDQoxNDkwNTk4NTUN
ClRoaXMgRS1NYWlsIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBvciBwcml2aWxlZ2VkIGluZm9y
bWF0aW9uLiBJZiB5b3UNCmFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCAob3IgaGF2ZSBy
ZWNlaXZlZCB0aGlzIEUtTWFpbCBpbiBlcnJvcikNCnBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBp
bW1lZGlhdGVseSBhbmQgZGVzdHJveSB0aGlzIEUtTWFpbC4gQW55DQp1bmF1dGhvcml6ZWQgY29w
eWluZywgZGlzY2xvc3VyZSBvciBkaXN0cmlidXRpb24gb2YgdGhlIG1hdGVyaWFsIGluDQp0aGlz
IEUtTWFpbCBpcyBzdHJpY3RseSBmb3JiaWRkZW4uDQoNCg==
