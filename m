Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CA168C036
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 15:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1E010E3AA;
	Mon,  6 Feb 2023 14:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Mon, 06 Feb 2023 14:35:35 UTC
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F3010E3AA
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1675693231; x=1678285231;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q5FIAJjK7joiRJaf0JPpzOWdUDayNYkOXzSXsHkAAp0=;
 b=KgzbUKyQ629vS5AexuyD+Ay67GEgjXzFY+HVUXOfym45ISa/3w2FIVxCi8S8lli8
 SwWvgQnG4MV9pEgkyXKU6LPJb2krgdmBpPtLOsUaM4rEQCpm73X4m+PjqH4jzoA4
 R96OG137u13qiPCy+pqC4m8ZpE2qvGhHwG17tEgOUyU=;
X-AuditID: ac14000a-923ff70000007ecb-8f-63e10caf0ce8
Received: from Diagnostix.phytec.de (Diagnostix.phytec.de [172.25.0.14])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 30.CE.32459.FAC01E36;
 Mon,  6 Feb 2023 15:20:31 +0100 (CET)
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 6 Feb
 2023 15:20:31 +0100
Received: from Florix.phytec.de ([fe80::a802:84f9:c56c:4c6d]) by
 florix.phytec.de ([fe80::a802:84f9:c56c:4c6d%5]) with mapi id 15.01.2375.018; 
 Mon, 6 Feb 2023 15:20:31 +0100
From: Dominik Haller <D.Haller@phytec.de>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add EDT ETML1010G0DKA panel
Thread-Topic: [PATCH 2/2] drm/panel: simple: Add EDT ETML1010G0DKA panel
Thread-Index: AQHYt+xq34hFG5cNnESyWWcHUzxQe67C67mA
Date: Mon, 6 Feb 2023 14:20:31 +0000
Message-ID: <ba13246c-3838-4993-12ef-420d82730b28@phytec.de>
References: <20220818124518.42080-1-d.haller@phytec.de>
 <20220818124518.42080-2-d.haller@phytec.de>
In-Reply-To: <20220818124518.42080-2-d.haller@phytec.de>
Accept-Language: en-DE, de-DE, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.0.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3392DDF7449474AA06C6F09FE10890A@phytec.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsWyRpKBT3c9z8Nkg4v7DCzmHznHanHl63s2
 i74XD5ktWvceYbdY8XMro8XPXfNYHNg8ds66y+6xaVUnm8eda3vYPO53H2fyWDLtKpvH501y
 AWxRXDYpqTmZZalF+nYJXBkTFvxiKTglXvF67Sr2BsY/Yl2MnBwSAiYSt25eZOxi5OIQEljL
 JHHqfSOU85hR4t31eSwQzkZGiZZvl5lAWtgENCVeTr3NCpIQEbjBKHF24XewFmaQquOd7Ywg
 VcIC7hJdv7pYQWwRAQ+JxQ+fMUHYRhIvD59lB7FZBFQkZj0/wAxi8wrYSLy6sxQsLiSQKrH9
 3RmwXk4BC4k931rAZjIC1d9++QvMZhYQkei9DhGXEBCQWLLnPDOELSrx8vE/VghbXuLErWlA
 ezmA6jUl1u/Sh2i1kFj99TQzhK0oMaX7ITvECYISJ2c+YZnAKD4LyYZZCN2zkHTPQtI9C0n3
 AkbWVYxCuZnJ2alFmdl6BRmVJanJeimpmxhBsSvCwLWDsW+OxyFGJg7GQ4wSHMxKIrymBx4k
 C/GmJFZWpRblxxeV5qQWH2KU5mBREue938OUKCSQnliSmp2aWpBaBJNl4uCUamCsEG6QYsyQ
 L9Y93t/Vt2jxzEhTljCfdS0ey92Yg4y9AvvX/WEWveBr8FegYdGEhwXnj5v9fatT29hhWLxq
 vt/VkoZtr25zcse9/Ws18d6fYKveWY1npzt7Td6n/ydW7qHyHDu71oZrX0Vl564WylykM/VM
 zOy0ZK+nK3K+Ref+15KdV7prqYsSS3FGoqEWc1FxIgCNOD4LywIAAA==
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "upstream@phytec.de" <upstream@phytec.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sDQoNCnBpbmcgaGVyZSwgdGhpcyBvbmUgZ290IGZvcmdvdHRlbi4NCkl0IHN0aWxsIGFw
cGxpZXMgb24gZHJtLW1pc2MtbmV4dCBhbmQgdjYuMi1yYzcNCg0KDQpPbiAxOC4wOC4yMiAxNDo0
NSwgRG9taW5payBIYWxsZXIgd3JvdGU6DQo+IEFkZCBzdXBwb3J0IGZvciB0aGUgRURUIEVUTUwx
MDEwRzBES0EgMTAuMSIgMTI4MHg4MDAgTFZEUyBwYW5lbC4NCj4NCj4gU2lnbmVkLW9mZi1ieTog
RG9taW5payBIYWxsZXIgPGQuaGFsbGVyQHBoeXRlYy5kZT4NCj4gLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMNCj4gaW5kZXggZjllMWY4NWRhZWY3Li45MzE0ZGIyNGFi
NTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMNCj4gQEAgLTE3Nzks
NiArMTc3OSwzMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgZWR0X2V0bWwwNzAw
eTVkaGEgPSB7DQo+ICAgCS5jb25uZWN0b3JfdHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9MVkRT
LA0KPiAgIH07DQo+ICAgDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUg
ZWR0X2V0bWwxMDEwZzBka2FfbW9kZSA9IHsNCj4gKwkuY2xvY2sgPSA3MDAwMCwNCj4gKwkuaGRp
c3BsYXkgPSAxMjgwLA0KPiArCS5oc3luY19zdGFydCA9IDEyODAgKyAxMDAsDQo+ICsJLmhzeW5j
X2VuZCA9IDEyODAgKyAxMDAgKyAxOSwNCj4gKwkuaHRvdGFsID0gMTI4MCArIDEwMCArIDE5ICsg
NDEsDQo+ICsJLnZkaXNwbGF5ID0gODAwLA0KPiArCS52c3luY19zdGFydCA9IDgwMCArIDQsDQo+
ICsJLnZzeW5jX2VuZCA9IDgwMCArIDQgKyA0LA0KPiArCS52dG90YWwgPSA4MDAgKyA0ICsgNCAr
IDE1LA0KPiArCS5mbGFncyA9IERSTV9NT0RFX0ZMQUdfUEhTWU5DIHwgRFJNX01PREVfRkxBR19Q
VlNZTkMsDQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgZWR0
X2V0bWwxMDEwZzBka2EgPSB7DQo+ICsJLm1vZGVzID0gJmVkdF9ldG1sMTAxMGcwZGthX21vZGUs
DQo+ICsJLm51bV9tb2RlcyA9IDEsDQo+ICsJLmJwYyA9IDgsDQo+ICsJLnNpemUgPSB7DQo+ICsJ
CS53aWR0aCA9IDIxNiwNCj4gKwkJLmhlaWdodCA9IDEzNSwNCj4gKwl9LA0KPiArCS5idXNfZm9y
bWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVg3WDRfU1BXRywNCj4gKwkuYnVzX2ZsYWdzID0g
RFJNX0JVU19GTEFHX0RFX0hJR0gsDQo+ICsJLmNvbm5lY3Rvcl90eXBlID0gRFJNX01PREVfQ09O
TkVDVE9SX0xWRFMsDQo+ICt9Ow0KPiArDQo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlIGVkdF9ldG12NTcwZzJkaHVfbW9kZSA9IHsNCj4gICAJLmNsb2NrID0gMjUxNzUs
DQo+ICAgCS5oZGlzcGxheSA9IDY0MCwNCj4gQEAgLTQwNTcsNiArNDA4Myw5IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHBsYXRmb3JtX29mX21hdGNoW10gPSB7DQo+ICAgCX0s
IHsNCj4gICAJCS5jb21wYXRpYmxlID0gImVkdCxldG1sMDcwMHk1ZGhhIiwNCj4gICAJCS5kYXRh
ID0gJmVkdF9ldG1sMDcwMHk1ZGhhLA0KPiArCX0sIHsNCj4gKwkJLmNvbXBhdGlibGUgPSAiZWR0
LGV0bWwxMDEwZzBka2EiLA0KPiArCQkuZGF0YSA9ICZlZHRfZXRtbDEwMTBnMGRrYSwNCj4gICAJ
fSwgew0KPiAgIAkJLmNvbXBhdGlibGUgPSAiZWR0LGV0bXY1NzBnMmRodSIsDQo+ICAgCQkuZGF0
YSA9ICZlZHRfZXRtdjU3MGcyZGh1LA0KDQoNCi0tIA0KUEhZVEVDIE1lc3N0ZWNobmlrIEdtYkgg
fCBCYXJjZWxvbmEtQWxsZWUgMSB8IDU1MTI5IE1haW56LCBHZXJtYW55DQoNCkdlc2Now6RmdHNm
w7xocmVyOiBEaXBsLi1JbmcuIE1pY2hhZWwgTWl0ZXpraSwgRGlwbC4tSW5nLiBCb2RvIEh1YmVy
IHwNCkhhbmRlbHNyZWdpc3RlciBNYWlueiBIUkIgNDY1NiB8IEZpbmFuemFtdCBNYWluei1NaXR0
ZSB8IFN0Lk5yLg0KMjY2NTAwNjA4LCBERSAxNDkwNTk4NTUNCg0K
