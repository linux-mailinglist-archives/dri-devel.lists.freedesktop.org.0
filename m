Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 527E059021
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 04:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEA76E87A;
	Fri, 28 Jun 2019 02:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id A9F4D6E87A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 02:02:58 +0000 (UTC)
X-UUID: c2ece93bab67479591380ff8da29426a-20190628
X-UUID: c2ece93bab67479591380ff8da29426a-20190628
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1235482751; Fri, 28 Jun 2019 10:02:55 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS33DR.mediatek.inc (172.27.6.106) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Jun 2019 10:02:52 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 28 Jun 2019 10:02:51 +0800
Message-ID: <1561687371.29330.11.camel@mtksdaap41>
Subject: Re: [v5 2/3] drm/mediatek: separate mipi_tx to different file
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Fri, 28 Jun 2019 10:02:51 +0800
In-Reply-To: <20190627025901.28418-3-jitao.shi@mediatek.com>
References: <20190627025901.28418-1-jitao.shi@mediatek.com>
 <20190627025901.28418-3-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24722.000
X-TM-AS-Result: No-10.247700-8.000000-10
X-TMASE-MatchedRID: L8tZF6zWW2rmLzc6AOD8DfHkpkyUphL9APiR4btCEeZJK2eJhY02w+Z5
 Gn23AeDZBCJmNbrkQwEB1c8PTXnqofI1YbpS1+avgmAd4Attpn/YuVu0X/rOkBpX1zEL4nq3zod
 Om+zp8Klvb8FTrUVVI7tTg4w4u0QPVdgv/fqHkl7obINHZkH5xqgmQ5FI9tvDDlLOAk1ICsupTt
 npKpQyOnuvCtBi52L250DWRAwkrYTtmWsUlPYSbZXIRfiL5JZTGEfoClqBl86bKItl61J/ycnjL
 TA/UDoAoTCA5Efyn8CNo+PRbWqfRDsAVzN+Ov/sHFf9y5qyR15CjO3g32i4QW3xAkDtY0KKM0RM
 yIBWAJybBCcU0pWFpQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.247700-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24722.000
X-TM-SNTS-SMTP: 5329DA286C4A6660442E20F3A9F915E02E66B2517D31A07EE8877C820797CA0F2000:8
X-MTK: N
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 dri-devel@lists.freedesktop.org, yingjoe.chen@mediatek.com,
 Ajay Kumar <ajaykumar.rs@samsung.com>, Vincent Palatin <vpalatin@chromium.org>,
 cawa.cheng@mediatek.com, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry
 Reding <treding@nvidia.com>, linux-pwm@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Andy
 Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org,
 Rahul Sharma <rahul.sharma@samsung.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKT24gVGh1LCAyMDE5LTA2LTI3IGF0IDEwOjU5ICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gRGlmZmVyZW50IElDIGhhcyBkaWZmZXJlbnQgbWlwaV90eCBzZXR0aW5nIG9mIGRz
aS4KPiBUaGlzIHBhdGNoIHNlcGFyYXRlcyB0aGUgbWlwaV90eCBoYXJkd2FyZSByZWxhdGUgcGFy
dCBmb3IgbXQ4MTczLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1l
ZGlhdGVrLmNvbT4KPiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgIHwgICAx
ICsKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmMgICAgICAgIHwgMzQz
ICsrLS0tLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21pcGlf
dHguaCAgICAgICAgfCAgNDkgKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4
MTczX21pcGlfdHguYyB8IDI4OSArKysrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAz
NjMgaW5zZXJ0aW9ucygrKSwgMzE5IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmgKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTczX21pcGlfdHguYwo+IAoKW3Nu
aXBdCgo+IEBAIC0zOTEsMTAgKzEwMSw4IEBAIHN0YXRpYyBpbnQgbXRrX21pcGlfdHhfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZw
ZGV2LT5kZXY7Cj4gIAlzdHJ1Y3QgbXRrX21pcGlfdHggKm1pcGlfdHg7Cj4gIAlzdHJ1Y3QgcmVz
b3VyY2UgKm1lbTsKPiAtCXN0cnVjdCBjbGsgKnJlZl9jbGs7Cj4gIAljb25zdCBjaGFyICpyZWZf
Y2xrX25hbWU7Cj4gIAlzdHJ1Y3QgY2xrX2luaXRfZGF0YSBjbGtfaW5pdCA9IHsKPiAtCQkub3Bz
ID0gJm10a19taXBpX3R4X3BsbF9vcHMsCj4gIAkJLm51bV9wYXJlbnRzID0gMSwKPiAgCQkucGFy
ZW50X25hbWVzID0gKGNvbnN0IGNoYXIgKiBjb25zdCAqKSZyZWZfY2xrX25hbWUsCj4gIAkJLmZs
YWdzID0gQ0xLX1NFVF9SQVRFX0dBVEUsCj4gQEAgLTQwOCw2ICsxMTYsNyBAQCBzdGF0aWMgaW50
IG10a19taXBpX3R4X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAkJcmV0
dXJuIC1FTk9NRU07Cj4gIAo+ICAJbWlwaV90eC0+ZHJpdmVyX2RhdGEgPSBvZl9kZXZpY2VfZ2V0
X21hdGNoX2RhdGEoZGV2KTsKPiArCj4gIAltZW0gPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRl
diwgSU9SRVNPVVJDRV9NRU0sIDApOwo+ICAJbWlwaV90eC0+cmVncyA9IGRldm1faW9yZW1hcF9y
ZXNvdXJjZShkZXYsIG1lbSk7Cj4gIAlpZiAoSVNfRVJSKG1pcGlfdHgtPnJlZ3MpKSB7Cj4gQEAg
LTQxNiwxMyArMTI1LDE0IEBAIHN0YXRpYyBpbnQgbXRrX21pcGlfdHhfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiAgCQlyZXR1cm4gcmV0Owo+ICAJfQo+ICAKPiAtCXJlZl9j
bGsgPSBkZXZtX2Nsa19nZXQoZGV2LCBOVUxMKTsKPiAtCWlmIChJU19FUlIocmVmX2NsaykpIHsK
PiAtCQlyZXQgPSBQVFJfRVJSKHJlZl9jbGspOwo+ICsJbWlwaV90eC0+cmVmX2NsayA9IGRldm1f
Y2xrX2dldChkZXYsIE5VTEwpOwoKSSB0aGluayB5b3UgbmVlZCBub3QgdG8ga2VlcCByZWZfY2xr
IGluIGRyaXZlciBwcml2YXRlIGRhdGEgYmVjYXVzZSB5b3UKd291bGQgbm90IHVzZSBpdCBhbnkg
bW9yZS4KClJlZ2FyZHMsCkNLCgo+ICsJaWYgKElTX0VSUihtaXBpX3R4LT5yZWZfY2xrKSkgewo+
ICsJCXJldCA9IFBUUl9FUlIobWlwaV90eC0+cmVmX2Nsayk7Cj4gIAkJZGV2X2VycihkZXYsICJG
YWlsZWQgdG8gZ2V0IHJlZmVyZW5jZSBjbG9jazogJWRcbiIsIHJldCk7Cj4gIAkJcmV0dXJuIHJl
dDsKPiAgCX0KPiAtCXJlZl9jbGtfbmFtZSA9IF9fY2xrX2dldF9uYW1lKHJlZl9jbGspOwo+ICsK
PiArCXJlZl9jbGtfbmFtZSA9IF9fY2xrX2dldF9uYW1lKG1pcGlfdHgtPnJlZl9jbGspOwo+ICAK
PiAgCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfc3RyaW5nKGRldi0+b2Zfbm9kZSwgImNsb2NrLW91
dHB1dC1uYW1lcyIsCj4gIAkJCQkgICAgICAmY2xrX2luaXQubmFtZSk7Cj4gQEAgLTQzMSw2ICsx
NDEsOCBAQCBzdGF0aWMgaW50IG10a19taXBpX3R4X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gIAkJcmV0dXJuIHJldDsKPiAgCX0KPiAgCj4gKwljbGtfaW5pdC5vcHMgPSBt
aXBpX3R4LT5kcml2ZXJfZGF0YS0+bWlwaV90eF9jbGtfb3BzOwo+ICsKPiAgCW1pcGlfdHgtPnBs
bF9ody5pbml0ID0gJmNsa19pbml0Owo+ICAJbWlwaV90eC0+cGxsID0gZGV2bV9jbGtfcmVnaXN0
ZXIoZGV2LCAmbWlwaV90eC0+cGxsX2h3KTsKPiAgCWlmIChJU19FUlIobWlwaV90eC0+cGxsKSkg
ewo+IEBAIC00NjUsMjAgKzE3NywxMiBAQCBzdGF0aWMgaW50IG10a19taXBpX3R4X3JlbW92ZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
