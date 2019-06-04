Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5451233CBF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 03:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501408934F;
	Tue,  4 Jun 2019 01:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id C87708934F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 01:33:26 +0000 (UTC)
X-UUID: 6d75eacfb1d0483e842d953bff80b1a9-20190604
X-UUID: 6d75eacfb1d0483e842d953bff80b1a9-20190604
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1791249730; Tue, 04 Jun 2019 09:33:23 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 4 Jun 2019 09:33:22 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Jun 2019 09:33:22 +0800
Message-ID: <1559612002.2749.2.camel@mtksdaap41>
Subject: Re: [PATCH v2 0/4] fix mediatek drm, dis, and disp-* unbind/bind
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 4 Jun 2019 09:33:22 +0800
In-Reply-To: <20190529102555.251579-1-hsinyi@chromium.org>
References: <20190529102555.251579-1-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEhzaW4tWWk6CgpPbiBXZWQsIDIwMTktMDUtMjkgYXQgMTg6MjUgKzA4MDAsIEhzaW4tWWkg
V2FuZyB3cm90ZToKPiBUaGVyZSBhcmUgc29tZSBlcnJvcnMgd2hlbiB1bmJpbmRpbmcgYW5kIHJl
YmluZGluZyBtZWRpYXRlayBkcm0sIGRzaSwKPiBhbmQgZGlzcC0qIGRyaXZlcnMuIFRoaXMgc2Vy
aWVzIGlzIHRvIGZpeCB0aG9zZSBlcnJvcnMgYW5kIHdhcm5pbmdzLgo+IAo+IEhzaW4tWWkgV2Fu
ZyAoNCk6Cj4gICBkcm06IG1lZGlhdGVrOiBmaXggdW5iaW5kIGZ1bmN0aW9ucwo+ICAgZHJtOiBt
ZWRpYXRlazogdW5iaW5kIGNvbXBvbmVudHMgaW4gbXRrX2RybV91bmJpbmQoKQo+ICAgZHJtOiBt
ZWRpYXRlazogY2FsbCBkcm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bigpIHdoZW4gdW5iaW5kaW5n
IGRyaXZlcgo+ICAgZHJtOiBtZWRpYXRlazogY2xlYXIgbnVtX3BpcGVzIHdoZW4gdW5iaW5kIGRy
aXZlcgoKRm9yIHRoaXMgc2VyaWVzIHdpdGggc29tZSB0aXRsZSBtb2RpZmljYXRpb24sIGFwcGxp
ZWQgdG8KbWVkaWF0ZWstZHJtLWZpeGVzLTUuMiBbMV0sIHRoYW5rcy4KClsxXQpodHRwczovL2dp
dGh1Yi5jb20vY2todS1tZWRpYXRlay9saW51eC5naXQtdGFncy9jb21taXRzL21lZGlhdGVrLWRy
bS1maXhlcy01LjIKClJlZ2FyZHMsCkNLCgo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kcnYuYyB8IDggKysrLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kc2kuYyAgICAgfCAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
