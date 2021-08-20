Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C793F2955
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 11:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFDB6EA4C;
	Fri, 20 Aug 2021 09:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78B66EA4C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 09:37:53 +0000 (UTC)
X-UUID: 22064bc69de84391a9a65e877e5303db-20210820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4Y/FH3iXL+/m9wsv5YTYuPEUK+mliUM7GZNw5VfSRxk=; 
 b=d+s+yAXsrCONxSDz4ItLNRLCVm3f87OVhVy4dcuCer9eRcTcNMqIQ4GvNvV2+06VV1KYVyi7Y+gO/Dlr3bZhxCZdrtIkR/ZTu4dfDH00JJcSrl0yQkAi6lo+WU1l77tU9b7ckaga1S9f69QsMO8mp4NokzowH7zUhPbh07WIKZU=;
X-UUID: 22064bc69de84391a9a65e877e5303db-20210820
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1912703706; Fri, 20 Aug 2021 17:37:48 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 17:37:46 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Aug 2021 17:37:46 +0800
Message-ID: <1629452267.23725.3.camel@mtksdaap41>
Subject: Re: [PATCH v8 12/13] drm/mediatek: add MERGE support for mediatek-drm
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 <fshao@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Enric Balletbo
 i Serra" <enric.balletbo@collabora.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Fabien Parent <fparent@baylibre.com>,
 <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Date: Fri, 20 Aug 2021 17:37:47 +0800
In-Reply-To: <20210819022327.13040-13-jason-jh.lin@mediatek.com>
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
 <20210819022327.13040-13-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEphc29uOg0KDQpPbiBUaHUsIDIwMjEtMDgtMTkgYXQgMTA6MjMgKzA4MDAsIGphc29uLWpo
LmxpbiB3cm90ZToNCj4gQWRkIE1FUkdFIGVuZ2luZSBmaWxlOg0KPiBNRVJHRSBtb2R1bGUgaXMg
dXNlZCB0byBtZXJnZSB0d28gc2xpY2UtcGVyLWxpbmUgaW5wdXRzDQo+IGludG8gb25lIHNpZGUt
Ynktc2lkZSBvdXRwdXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBqYXNvbi1qaC5saW4gPGphc29u
LWpoLmxpbkBtZWRpYXRlay5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArDQo+ICtpbnQgbXRr
X21lcmdlX2Nsa19lbmFibGUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiArew0KPiArCWludCByZXQg
PSAwOw0KPiArCXN0cnVjdCBtdGtfZGlzcF9tZXJnZSAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShk
ZXYpOw0KPiArDQo+ICsJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKHByaXYtPmNsayk7DQo+ICsJ
aWYgKHJldCkNCj4gKwkJcHJfZXJyKCJtZXJnZSBjbGsgcHJlcGFyZSBlbmFibGUgZmFpbGVkXG4i
KTsNCj4gKw0KPiArCWlmIChwcml2LT5hc3luY19jbGspIHsNCg0KVGhpcyBjaGVja2luZyBpcyBy
ZWR1bmRhbnQuDQoNCj4gKwkJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKHByaXYtPmFzeW5jX2Ns
ayk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlwcl9lcnIoImFzeW5jIGNsayBwcmVwYXJlIGVuYWJs
ZSBmYWlsZWRcbiIpOw0KPiArCX0NCj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4g
K3ZvaWQgbXRrX21lcmdlX2Nsa19kaXNhYmxlKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gK3sNCj4g
KwlzdHJ1Y3QgbXRrX2Rpc3BfbWVyZ2UgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4g
Kw0KPiArCWlmIChwcml2LT5hc3luY19jbGspDQoNCkRpdHRvLg0KDQpSZWdhcmRzLA0KQ0sNCg0K
PiArCQljbGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+YXN5bmNfY2xrKTsNCj4gKw0KPiArCWNs
a19kaXNhYmxlX3VucHJlcGFyZShwcml2LT5jbGspOw0KPiArfQ0KPiArDQoNCg0K

