Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F39D0C58
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 12:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D286E955;
	Wed,  9 Oct 2019 10:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id D34696E955
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 10:13:31 +0000 (UTC)
X-UUID: c90e3ccb152042caa9be513527ccfcb0-20191009
X-UUID: c90e3ccb152042caa9be513527ccfcb0-20191009
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 477343159; Wed, 09 Oct 2019 17:18:26 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 9 Oct 2019 17:18:23 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 9 Oct 2019 17:18:23 +0800
Message-ID: <1570612706.7713.2.camel@mtksdaap41>
Subject: Re: [PATCH v5, 16/32] drm/mediatek: add component OVL_2L1
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 9 Oct 2019 17:18:26 +0800
In-Reply-To: <1567090254-15566-17-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-17-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 366CB8B7A69E315B8B0799225F3142C166BA891FDF40BC99C87ADF8E19ED78182000:8
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCk9uIFRodSwgMjAxOS0wOC0yOSBhdCAyMjo1MCArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgY29tcG9uZW50IE9WTF8y
TDEKPiAKCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQtNS41IFsxXSwgdGhhbmtzLgoKWzFd
Cmh0dHBzOi8vZ2l0aHViLmNvbS9ja2h1LW1lZGlhdGVrL2xpbnV4LmdpdC10YWdzL2NvbW1pdHMv
bWVkaWF0ZWstZHJtLW5leHQtNS41CgpSZWdhcmRzLApDSwoKPiBTaWduZWQtb2ZmLWJ5OiBZb25n
cWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiBSZXZpZXdlZC1ieTogQ0sg
SHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZGRwX2NvbXAuYyB8IDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHBfY29tcC5oIHwgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9j
b21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gaW5k
ZXggNDIwMGY4OS4uYWY4ZTg3MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZGRwX2NvbXAuYwo+IEBAIC0yNjAsNiArMjYwLDcgQEAgc3RydWN0IG10a19kZHBfY29t
cF9tYXRjaCB7Cj4gIAlbRERQX0NPTVBPTkVOVF9PVkwwXQk9IHsgTVRLX0RJU1BfT1ZMLAkwLCBO
VUxMIH0sCj4gIAlbRERQX0NPTVBPTkVOVF9PVkwxXQk9IHsgTVRLX0RJU1BfT1ZMLAkxLCBOVUxM
IH0sCj4gIAlbRERQX0NPTVBPTkVOVF9PVkxfMkwwXQk9IHsgTVRLX0RJU1BfT1ZMXzJMLAkwLCBO
VUxMIH0sCj4gKwlbRERQX0NPTVBPTkVOVF9PVkxfMkwxXQk9IHsgTVRLX0RJU1BfT1ZMXzJMLAkx
LCBOVUxMIH0sCj4gIAlbRERQX0NPTVBPTkVOVF9QV00wXQk9IHsgTVRLX0RJU1BfUFdNLAkwLCBO
VUxMIH0sCj4gIAlbRERQX0NPTVBPTkVOVF9QV00xXQk9IHsgTVRLX0RJU1BfUFdNLAkxLCBOVUxM
IH0sCj4gIAlbRERQX0NPTVBPTkVOVF9QV00yXQk9IHsgTVRLX0RJU1BfUFdNLAkyLCBOVUxMIH0s
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21w
LmggYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oCj4gaW5kZXgg
OWNhZWMyZC4uOTYyZDE0YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kZHBfY29tcC5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwX2NvbXAuaAo+IEBAIC01Miw2ICs1Miw3IEBAIGVudW0gbXRrX2RkcF9jb21wX2lkIHsK
PiAgCUREUF9DT01QT05FTlRfT0QxLAo+ICAJRERQX0NPTVBPTkVOVF9PVkwwLAo+ICAJRERQX0NP
TVBPTkVOVF9PVkxfMkwwLAo+ICsJRERQX0NPTVBPTkVOVF9PVkxfMkwxLAo+ICAJRERQX0NPTVBP
TkVOVF9PVkwxLAo+ICAJRERQX0NPTVBPTkVOVF9QV00wLAo+ICAJRERQX0NPTVBPTkVOVF9QV00x
LAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
