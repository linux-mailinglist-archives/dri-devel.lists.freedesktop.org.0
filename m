Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B26FA3263
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A266E2B4;
	Fri, 30 Aug 2019 08:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 300 seconds by postgrey-1.36 at gabe;
 Thu, 29 Aug 2019 12:49:45 UTC
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD90589C6A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 12:49:45 +0000 (UTC)
X-UUID: d364c0196eef4773b0fb14c861edcb58-20190829
X-UUID: d364c0196eef4773b0fb14c861edcb58-20190829
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 186969430; Thu, 29 Aug 2019 20:39:30 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs01n2.mediatek.inc
 (172.21.101.79) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 29 Aug 2019 20:39:34 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 29 Aug 2019 20:39:33 +0800
Message-ID: <1567082367.30648.2.camel@mhfsdcap03>
Subject: Re: [PATCH v4, 12/33] drm/mediatek: split DISP_REG_CONFIG_DSI_SEL
 setting into another use case
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Thu, 29 Aug 2019 20:39:27 +0800
In-Reply-To: <1563341736.29169.15.camel@mtksdaap41>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
 <1562625253-29254-13-git-send-email-yongqiang.niu@mediatek.com>
 <1563341736.29169.15.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1AB6CD6AEFA081CDD571265A6B6FA16D64076F9D817FB5E376E91E95D5153CED2000:8
X-MTK: N
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
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
Reply-To: yongqiang.niu@mediatek.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA3LTE3IGF0IDEzOjM1ICswODAwLCBDSyBIdSB3cm90ZToKPiBIaSwgWW9u
Z3FpYW5nOgo+IAo+IE9uIFR1ZSwgMjAxOS0wNy0wOSBhdCAwNjozMyArMDgwMCwgeW9uZ3FpYW5n
Lm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gPiBGcm9tOiBZb25ncWlhbmcgTml1IDx5b25ncWlh
bmcubml1QG1lZGlhdGVrLmNvbT4KPiA+IAo+ID4gSGVyZSBpcyB0d28gbW9kaWZpdGlvbiBpbiB0
aGlzIHBhdGNoOgo+ID4gMS5ibHMtPmRwaTAgYW5kIHJkbWExLT5kc2kgYXJlIGRpZmZlcmVuIHVz
ZWNhc2UsCj4gPiBTcGxpdCBESVNQX1JFR19DT05GSUdfRFNJX1NFTCBzZXR0aW5nIGludG8gYW50
aGVyIHVzZWNhc2UKPiA+IDIucmVtb3ZlIERJU1BfUkVHX0NPTkZJR19EUElfU0VMIHNldHRpbmcs
IERQSV9TRUxfSU5fQkxTIGlzIDAgYW5kCj4gPiB0aGlzIGlzIHNhbWUgd2l0aCBoYXJkd2FyZSBk
ZWZhdXRsIHNldHRpbmcsCj4gPiAKPiAKPiBZb3UgbW92ZSAyIHJlZ2lzdGVyIHNldHRpbmcgb3V0
IG9mIHRoZSBwYXRoIGZyb20gQkxTIHRvIERQSTAsIGRvZXMgdGhpcwo+IHBhdGggc3RpbGwgd29y
az8gUGxlYXNlIG1ha2Ugc3VyZSB0aGF0IGFsbCBtb2RpZmljYXRpb24gY291bGQgd29yayBvbgo+
IGFsbCBzdXBwb3J0ZWQgU29DLgo+IAo+IFJlZ2FyZHMsCj4gQ0sKPiAKCkRQSV9TRUxfSU5fQkxT
IGlzIDAgYW5kIHRoaXMgaXMgc2FtZSB3aXRoIGhhcmR3YXJlIGRlZmF1bHQgc2V0dGluZyBhcwpk
ZXNjcmlwdGlvbiBpbiBwYXRjaC4KdGhlIHJlbW92ZWQgc2VudGVuY2UgaXMgdXNlbGVzcy4KCgo+
ID4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5j
b20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyB8
IDMgKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygt
KQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+ID4gaW5kZXgg
ZDAxNWMxYS4uNDdiM2UzNSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2RkcC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHAuYwo+ID4gQEAgLTQwMCwxMCArNDAwLDkgQEAgc3RhdGljIHZvaWQgbXRrX2RkcF9zb3V0
X3NlbCh2b2lkIF9faW9tZW0gKmNvbmZpZ19yZWdzLAo+ID4gIAl9IGVsc2UgaWYgKGN1ciA9PSBE
RFBfQ09NUE9ORU5UX0JMUyAmJiBuZXh0ID09IEREUF9DT01QT05FTlRfRFBJMCkgewo+ID4gIAkJ
d3JpdGVsX3JlbGF4ZWQoQkxTX1RPX0RQSV9SRE1BMV9UT19EU0ksCj4gPiAgCQkJICAgICAgIGNv
bmZpZ19yZWdzICsgRElTUF9SRUdfQ09ORklHX09VVF9TRUwpOwo+ID4gKwl9IGVsc2UgaWYgKGN1
ciA9PSBERFBfQ09NUE9ORU5UX1JETUExICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9EU0kwKSB7
Cj4gPiAgCQl3cml0ZWxfcmVsYXhlZChEU0lfU0VMX0lOX1JETUEsCj4gPiAgCQkJICAgICAgIGNv
bmZpZ19yZWdzICsgRElTUF9SRUdfQ09ORklHX0RTSV9TRUwpOwo+ID4gLQkJd3JpdGVsX3JlbGF4
ZWQoRFBJX1NFTF9JTl9CTFMsCj4gPiAtCQkJICAgICAgIGNvbmZpZ19yZWdzICsgRElTUF9SRUdf
Q09ORklHX0RQSV9TRUwpOwo+ID4gIAl9Cj4gPiAgfQo+ID4gIAo+IAo+IAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
