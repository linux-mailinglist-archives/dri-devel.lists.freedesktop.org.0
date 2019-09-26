Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D562BEDCE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 10:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105656EE79;
	Thu, 26 Sep 2019 08:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 558A46EE79
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 08:50:43 +0000 (UTC)
X-UUID: 4c6e94dbb28448d7b2bf2478c800969a-20190926
X-UUID: 4c6e94dbb28448d7b2bf2478c800969a-20190926
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 986856557; Thu, 26 Sep 2019 16:50:39 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 26 Sep 2019 16:50:37 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 26 Sep 2019 16:50:37 +0800
Message-ID: <1569487838.9612.1.camel@mtksdaap41>
Subject: Re: [PATCH v7 3/9] drm/mediatek: replace writeb() with mtk_dsi_mask()
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Thu, 26 Sep 2019 16:50:38 +0800
In-Reply-To: <20190919065806.111016-4-jitao.shi@mediatek.com>
References: <20190919065806.111016-1-jitao.shi@mediatek.com>
 <20190919065806.111016-4-jitao.shi@mediatek.com>
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
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 stonea168@163.com, cawa.cheng@mediatek.com, dri-devel@lists.freedesktop.org,
 sj.huang@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKT24gVGh1LCAyMDE5LTA5LTE5IGF0IDE0OjU4ICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gVGhlIHdyaXRlYigpIGlzIHVuYXZhaWxhYmxlIGluIG10ODE3My4gQmVjYXVzZSB0
aGUgbXQ4MTczIGRzaSBtb2R1bGUKPiBkb2Vzbid0IHN1cHBvcnQgOGJpdCBtb2RlIGFjY2Vzcy4K
ClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgoKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
c2kuYwo+IGluZGV4IDdlMjRkMDNjZGNjYy4uYWM4ZTgwZTM3OWY3IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTk2MCw3ICs5NjAsOSBAQCBzdGF0aWMgdm9pZCBtdGtf
ZHNpX2NtZHEoc3RydWN0IG10a19kc2kgKmRzaSwgY29uc3Qgc3RydWN0IG1pcGlfZHNpX21zZyAq
bXNnKQo+ICAJfQo+ICAKPiAgCWZvciAoaSA9IDA7IGkgPCBtc2ctPnR4X2xlbjsgaSsrKQo+IC0J
CXdyaXRlYih0eF9idWZbaV0sIGRzaS0+cmVncyArIHJlZ19jbWRxX29mZiArIGNtZHFfb2ZmICsg
aSk7Cj4gKwkJbXRrX2RzaV9tYXNrKGRzaSwgKHJlZ19jbWRxX29mZiArIGNtZHFfb2ZmICsgaSkg
JiAofjB4M1UpLAo+ICsJCQkgICAgICgweGZmVUwgPDwgKCgoaSArIGNtZHFfb2ZmKSAmIDNVKSAq
IDhVKSksCj4gKwkJCSAgICAgdHhfYnVmW2ldIDw8ICgoKGkgKyBjbWRxX29mZikgJiAzVSkgKiA4
VSkpOwo+ICAKPiAgCW10a19kc2lfbWFzayhkc2ksIHJlZ19jbWRxX29mZiwgY21kcV9tYXNrLCBy
ZWdfdmFsKTsKPiAgCW10a19kc2lfbWFzayhkc2ksIERTSV9DTURRX1NJWkUsIENNRFFfU0laRSwg
Y21kcV9zaXplKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
